"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var aws_s3_1 = require("@uppy/aws-s3");
var core_1 = require("@uppy/core");
var file_input_1 = require("@uppy/file-input");
var informer_1 = require("@uppy/informer");
var progress_bar_1 = require("@uppy/progress-bar");
var thumbnail_generator_1 = require("@uppy/thumbnail-generator");
// The response from your server
// type Body = { someThingMyBackendReturns: string };
function fileUpload(fileInput) {
    var hiddenInput = document.querySelector('.upload-data'), imagePreview = document.querySelector('.upload-preview img'), formGroup = fileInput.parentNode;
    // remove our file input in favour of Uppy's
    formGroup.removeChild(fileInput);
    var uppy = new core_1.default({ autoProceed: true })
        .use(file_input_1.default, { target: formGroup })
        .use(informer_1.default, { target: formGroup })
        .use(progress_bar_1.default, { target: imagePreview.parentNode })
        .use(thumbnail_generator_1.default, { thumbnailWidth: 600 })
        .use(aws_s3_1.default, { endpoint: '/' }); // will call the presign endpoint on `/s3/params`
    uppy.on('thumbnail:generated', function (file, preview) {
        // show preview of the image using URL from thumbnail generator
        imagePreview.src = preview;
    });
    uppy.on('upload-success', function (file, response) {
        // construct uploaded file data in the format that Shrine expects
        var uploadedFileData = {
            id: file.meta['name'], // object key without prefix
            storage: 'cache',
            metadata: {
                size: file.size,
                filename: file.name,
                mime_type: file.type,
            }
        };
        // set hidden field value to the uploaded file data so that it's submitted with the form as the attachment
        hiddenInput.value = JSON.stringify(uploadedFileData);
    });
}
exports.default = fileUpload;
