import AwsS3, { type AwsBody } from '@uppy/aws-s3'
import Uppy from '@uppy/core'
import FileInput from '@uppy/file-input'
import Informer from '@uppy/informer'
import ProgressBar from '@uppy/progress-bar'
import ThumbnailGenerator from '@uppy/thumbnail-generator'

// Your own metadata on files
// type Meta = { name: string };
type Meta = {
  name: string
  type?: string
  key: string
}

// The response from your server
// type Body = { someThingMyBackendReturns: string };

function fileUpload(fileInput) {
  const hiddenInput = document.querySelector('.upload-data'),
    imagePreview = document.querySelector('.upload-preview img'),
    formGroup = fileInput.parentNode

  // remove our file input in favour of Uppy's
  formGroup.removeChild(fileInput)

  const uppy = new Uppy<Meta, AwsBody>({ autoProceed: true })
    .use(FileInput, { target: formGroup })
    .use(Informer, { target: formGroup })
    .use(ProgressBar, { target: imagePreview.parentNode })
    .use(ThumbnailGenerator, { thumbnailWidth: 600 })
    .use(AwsS3, { endpoint: '/' }) // will call the presign endpoint on `/s3/params`

  uppy.on('thumbnail:generated', (file, preview) => {
    // show preview of the image using URL from thumbnail generator
    imagePreview.src = preview
  })

  uppy.on('upload-success', (file, response) => {
    // construct uploaded file data in the format that Shrine expects
    const uploadedFileData = {
      id: file.meta['name'], // object key without prefix
      storage: 'cache',
      metadata: {
        size: file.size,
        filename: file.name,
        mime_type: file.type,
      }
    }

    // set hidden field value to the uploaded file data so that it's submitted with the form as the attachment
    hiddenInput.value = JSON.stringify(uploadedFileData)
  })
}

export default fileUpload
