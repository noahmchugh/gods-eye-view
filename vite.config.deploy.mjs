import base from "./server/standalone/vite.config.js";

const baseFn = typeof base === "function" ? base : () => base;

// Hosted deployment config: same app config, plus preview-server settings
// the base factory does not set (bind address and the public host name).
export default async (env) => {
  const cfg = await baseFn(env);
  cfg.preview = {
    ...(cfg.preview || {}),
    host: "0.0.0.0",
    port: 4173,
    allowedHosts: [
      "localhost",
      "127.0.0.1",
      "http--gev--q8cp7py7bwmv.code.run",
    ],
  };
  return cfg;
};
