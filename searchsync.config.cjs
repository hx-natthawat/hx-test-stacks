module.exports = {
  server: {
    type: "meilisearch",
    host: "http://host.docker.internal:7700",
    key: "a5ab9786f9310d07bf1b2cc16080bc53c0f893b98372b383ee347c266a199157",
  },
  reindexOnStart: true,
  collections: {
    test: {
      fields: ["title", "description", "note"],
    },
  },
};
