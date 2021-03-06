/**
 * @module @aerobaseservices/core
 *
 * Module used to aggregate common functionalities for AeroBase Services SDK's
 */
import console from "loglevel";
console.setDefaultLevel(console.levels.WARN);

// Configuration parsers
export * from "./config";

export * from "./Core";

export * from "./PlatformUtils";
