import ApolloClient from "apollo-client";
import { NormalizedCacheObject } from "apollo-cache-inmemory";
import { PersistentStore, PersistedData } from "../PersistentStore";
import { OperationQueueEntry } from "../links/OfflineQueueLink";
import { MUTATION_QUEUE_LOGGER } from "../config/Constants";
import * as debug from "debug";

export const logger = debug.default(MUTATION_QUEUE_LOGGER);
/**
 * Class used to restore offline queue after page/application restarts.
 * It will trigger saved offline mutations using client to
 * restore all elements in the link.
 */
export class OfflineRestoreHandler {

  private apolloClient: ApolloClient<NormalizedCacheObject>;
  private storage: PersistentStore<PersistedData>;
  private readonly storageKey: string;
  private offlineData: OperationQueueEntry[] = [];

  constructor(apolloClient: ApolloClient<NormalizedCacheObject>,
              storage: PersistentStore<PersistedData>,
              storageKey: string) {
    this.apolloClient = apolloClient;
    this.storage = storage;
    this.storageKey = storageKey;
  }

  /**
   * Replay mutations to client.
   * This operation will help to rebuild Apollo Link observer chain
   * after page refresh/app restart
   */
  public replayOfflineMutations = async () => {
    const stored = await this.getOfflineData();
    if (stored) {
      this.offlineData = JSON.parse(stored.toString());
    } else {
      this.offlineData = [];
    }
    // if there is no offline data  then just exit
    if (!this.hasOfflineData()) { return; }

    logger("Replying offline mutations after application restart");
    // return as promise, but in the end clear the storage
    const uncommittedOfflineMutation: OperationQueueEntry[] = [];

    await Promise.all(this.offlineData.map(async (item) => {
      try {
        await this.apolloClient.mutate({
          variables: item.operation.variables,
          mutation: item.operation.query,
          context: item.operation.getContext
        });
      } catch (e) {
        // set the errored mutation to the stash
        uncommittedOfflineMutation.push(item);
      }
    }));

    // wait before it was cleared
    await this.clearOfflineData();

    // then add again the uncommited storage
    this.addOfflineData(uncommittedOfflineMutation);
  }

  private getOfflineData = async () => {
    return this.storage.getItem(this.storageKey);
  }

  private hasOfflineData() {
    return (this.offlineData && this.offlineData.length > 0);
  }

  private clearOfflineData = async () => {
    this.offlineData = [];
    return this.storage.removeItem(this.storageKey);
  }

  private addOfflineData = (queue: OperationQueueEntry[] = []) => {
    // add only if there is a value
    if (queue && queue.length > 0) {
      this.storage.setItem(this.storageKey, JSON.stringify(queue));
    }
  }
}
