const { default: mongoose, Schema } = require("mongoose");
const noticeSchema = require("./notice.schema");

const channelSchema = new mongoose.Schema({
    channel_id: {
        type: String,
        required: true,
        unique: true
    },
    channel_name: {
        type: String,
        required: true
    },
    admin_id: {
        type: Schema.Types.ObjectId,
        ref: "user",
        required: true
    },
    moderator_ids: [{
        type: Schema.Types.ObjectId,
        ref: "user"
    }],
    subscriber_ids: [{
        type: Schema.Types.ObjectId,
        ref: "user"
    }],
    notices: {
        type: [noticeSchema],
        default: []
    },

    category: {
        type: Schema.Types.Mixed
    },
    display_picture: {
        type: String,
        required: false
      },
});

const Channel = mongoose.model("channel", channelSchema);
module.exports = Channel