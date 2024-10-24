const { default: mongoose, Schema } = require("mongoose");

const noticeSchema = new mongoose.Schema({
    notice_id: {
        type: String,
        required: true,
        unique: true
    },
    file_path: {
        type: String
    },
    text: {
        type: String
    },
    tags: {
        type: [String],
    },
    publisher_id: {
        type: Schema.Types.ObjectId,
        ref: "user",
        required: true
    },
    time_stamp: {
        type: Number,
        required: true
    }
});

module.exports = {Notice: mongoose.model("notice", noticeSchema),noticeSchema:noticeSchema}