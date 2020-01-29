import mongodb from 'mongodb';

export default {
  // "port": 3005,
  // "mongoUrl": "mongodb://localhost:27017/chat-api",
  // mlab user - vladimir44
  // mlab password - PsC3LXXTqGm4ttae
  port: process.env.PORT || 3005,
  mongoUrl:
    process.env.MONGODB_URI ||
    'mongodb://vladimir44:PsC3LXXTqGm4ttae@ios-slack-shard-00-00-ncr0m.mongodb.net:27017,ios-slack-shard-00-01-ncr0m.mongodb.net:27017,ios-slack-shard-00-02-ncr0m.mongodb.net:27017/test?ssl=true&replicaSet=iOS-Slack-shard-0&authSource=admin&retryWrites=true&w=majority',
  bodyLimit: '100kb'
}
