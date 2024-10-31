const { default: mongoose, Schema } = require("mongoose");
const {fileSchema} =require('./file.schema')
const noticeSchema = new mongoose.Schema({
    notice_id: {
        type: String,
        required: true,
        //unique: true
    },
    files: {
        type:[fileSchema],
        default:[]
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
       
    }
});

module.exports = {Notice: mongoose.model("notice", noticeSchema),noticeSchema:noticeSchema}