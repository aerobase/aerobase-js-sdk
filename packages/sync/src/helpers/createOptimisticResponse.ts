
// Helper method for ID generation ()
const generateId = (length = 8) => {
  let result = "";
  const chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

  for (let i = length; i > 0; i -= 1) {
    result += chars[Math.floor(Math.random() * chars.length)];
  }
  return result;
};

/**
 * Create optimistic response.
 * For example:
 *
  optimisticResponse: {
      __typename: "Mutation",
      updateComment: {
        id: commentId,
        __typename: "Comment",
        content: commentContent
      }
    }
 *
 * For more info and examples see:
 * https://www.apollographql.com/docs/react/features/optimistic-ui.html
 *
 *
 *
 * @param operation operation that is being performed (update)
 * @param type type that is going to be returned
 * @param data actual data passed to function
 */
export const createNewOptimisticResponse = (operation: string, typeName: string, data: any, idField: string = "id") => {
  const optimisticResponse: any = {
    __typename: "Mutation"
  };

  optimisticResponse[operation] = {
    __typename: typeName,
    ...data,
    version: 1,
    optimisticResponse: true
  };
  optimisticResponse[operation][idField] = generateId();
  return optimisticResponse;
};