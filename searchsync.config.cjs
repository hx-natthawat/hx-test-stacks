module.exports = {
  server: {
    type: "meilisearch",
    host: "http://search:7700",
    key: "d35677e8b7404a686e802d6965d1fd1f81f35f791aeb26c8052d80261a810176",
  },
  reindexOnStart: true,
  collections: {
    test: {
      fields: ["title", "description", "note"],
    },
  },
};
