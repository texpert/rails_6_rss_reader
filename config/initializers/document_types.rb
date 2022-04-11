# frozen_string_literal: true

module DocumentTypes
  module Adobe
    LIST = { ai: 'application/postscript',
             eps: 'application/postscript',
             pdf: 'application/pdf',
             ps:  'application/postscript',
             psd: 'application/octet-stream' }.freeze

    KEYS = LIST.keys.uniq.freeze

    VALUES = LIST.values.flatten.uniq.freeze
  end

  module Apple
    LIST = { ice: 'x-conference/x-cooltalk',
             keynote: 'application/x-iwork-keynote-sffkey',
             pages: 'application/x-iwork-pages-sffpages',
             numbers: 'application/x-iwork-numbers-sffnumbers' }.freeze

    KEYS = LIST.keys.uniq.freeze

    VALUES = LIST.values.flatten.uniq.freeze
  end

  module Archives
    LIST = { arj:  'application/arj',
             gz:   %w[application/x-compressed application/x-gzip],
             gzip: %w[application/gzip multipart/x-gzip],
             rar:  'application/x-rar-compressed',
             zip:  'application/zip' }.freeze

    KEYS = LIST.keys.uniq.freeze

    VALUES = LIST.values.flatten.uniq.freeze
  end

  module Audio
    LIST = { '3gp': 'audio/3gpp',
             '3g2': 'audio/3gpp2',
             aac:  'audio/aac',
             aif:  %w[audio/aiff audio/x-aiff],
             aifc:  %w[audio/aiff audio/x-aiff],
             aiff:  %w[audio/aiff audio/x-aiff],
             aip:  'text/x-audiosoft-intra',
             au:   %w[audio/basic audio/x-au],
             funk: 'audio/make',
             gsd:  'audio/x-gsm',
             gsm:  'audio/x-gsm',
             it:   'audio/it',
             jam:  'audio/x-jam',
             kar:  %w[audio/midi music/x-karaoke],
             la:   %w[audio/nspaudio audio/x-nspaudio],
             lam:  'audio/x-liveaudio',
             lma:  %w[audio/nspaudio audio/x-nspaudio],
             m2a:  'audio/mpeg',
             m3u:  'audio/x-mpequrl',
             mid:  %w[audio/midi audio/x-mid audio/x-midi application/x-midi music/crescendo x-music/x-midi],
             midi: %w[audio/midi audio/x-mid audio/x-midi application/x-midi music/crescendo x-music/x-midi],
             mjf:  'audio/x-vnd.audioexplosion.mjuicemediafile',
             mod:  %w[audio/mod audio/x-mod],
             mp2:  %w[audio/mpeg audio/x-mpeg],
             mp3:  %w[audio/mpeg3 audio/x-mpeg-3],
             mpa:  'audio/mpeg',
             mpg:  'audio/mpeg',
             mpga: 'audio/mpeg',
             my:   'audio/make',
             mzz:  'application/x-vnd.audioexplosion.mzz',
             oga:  'audio/ogg audio/vorbis',
             ogg:  %w[audio/ogg audio/vorbis],
             pfunk: %w[audio/make audio/make.my.funk],
             qcp:  'audio/vnd.qcelp',
             ra:   %w[audio/x-pn-realaudio audio/vnd.rn-realaudio audio/x-realaudio],
             ram:  %w[audio/x-pn-realaudio audio/vnd.rn-realaudio audio/x-realaudio],
             rm:   'audio/x-pn-realaudio',
             rmi:  'audio/mid',
             rmm:  'audio/x-pn-realaudio',
             rmp:  %w[audio/x-pn-realaudio audio/x-pn-realaudio-plugin],
             s3m:  'audio/s3m',
             sid:  'audio/x-psid',
             snd:  %w[audio/basic audio/x-adpcm],
             tsi:  'audio/tsp-audio',
             tsp:  'audio/tsplayer',
             voc:  %w[audio/voc audio/x-voc],
             vox:  'audio/voxware',
             vqe:  'audio/x-twinvq-plugin',
             vqf:  'audio/x-twinvq',
             vql:  'audio/x-twinvq-plugin',
             wav:  %w[audio/wav audio/x-wav],
             weba: 'audio/webm',
             xm:   'audio/xm' }.freeze

    KEYS = LIST.keys.uniq.freeze

    VALUES = LIST.values.flatten.uniq.freeze
  end

  module Image
    LIST = { art:  'image/x-jg',
             bm:   'image/bmp',
             bmp:  %w[image/bmp image/x-windows-bmp],
             dwg:  %w[application/acad image/vnd.dwg image/x-dwg],
             dxf:  %w[application/dxf image/vnd.dwg image/x-dwg],
             fif:  'image/fif',
             flo:  'image/florian',
             fpx:  %w[image/vnd.fpx image/vnd.net-fpx],
             g3:   'image/g3fax',
             gif:  'image/gif',
             ico:  'image/x-icon',
             ief:  'image/ief',
             iefs: 'image/iefs',
             jfif: %w[image/jpeg image/pjpeg],
             'jfif-tbnl': 'image/jpeg',
             jpe:  %w[image/jpeg image/pjpeg],
             jpeg: %w[image/jpeg image/pjpeg],
             jpg:  %w[image/jpeg image/pjpeg],
             jps:  'image/x-jps',
             jut:  'image/jutvision',
             mcf:  'image/vasa',
             nap:  'image/naplps',
             naplps: 'image/naplps',
             nif:  'image/x-niff',
             niff: 'image/x-niff',
             pbm:  'image/x-portable-bitmap',
             pct:  %w[image/x-pict image/x-pcx],
             pgm:  %w[image/x-portable-graymap image/x-portable-greymap],
             pic:  'image/pict',
             pict:  'image/pict',
             png:  'image/png',
             pnm:  'image/x-portable-anymap',
             ppm:  'image/x-portable-pixmap',
             qif:  'image/x-quicktime',
             qti:  'image/x-quicktime',
             qtif: 'image/x-quicktime',
             ras:  %w[image/cmu-raster image/x-cmu-raster],
             rast: 'image/cmu-raster',
             rf:   'image/vnd.rn-realflash',
             rgb:  'image/x-rgb',
             rp:   'image/vnd.rn-realpix',
             svf:  %w[image/vnd.dwg image/x-dwg],
             svg:  'image/svg+xml',
             tif:  %w[image/tiff image/x-tiff],
             tiff: %w[image/tiff image/x-tiff],
             turbot: 'image/florian',
             wbmp: 'image/vnd.wap.wbmp',
             webp: 'image/webm',
             xbm:  %w[image/x-xbitmap image/x-xbm image/xbm],
             xif:  'image/vnd.xiff',
             xpm:  %w[image/x-xpixmap image/xpm],
             xwd:  %w[image/x-xwd image/x-xwindowdump] }.freeze

    KEYS = LIST.keys.uniq.freeze

    VALUES = LIST.values.flatten.uniq.freeze
  end

  module SharpImage
    LIST = { gif:  'image/gif',
             jpeg: %w[image/jpeg image/pjpeg],
             png:  'image/png',
             svg:  'image/svg+xml',
             tiff: %w[image/tiff image/x-tiff],
             webp: 'image/webm' }.freeze

    KEYS = LIST.keys.uniq.freeze

    VALUES = LIST.values.flatten.uniq.freeze
  end

  module Microsoft
    module Word
      LIST = { doc: 'application/msword',
               docx: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
               dotx: 'application/vnd.openxmlformats-officedocument.wordprocessingml.template',
               docm: 'application/vnd.ms-word.document.macroEnabled.12',
               dotm: 'application/vnd.ms-word.template.macroEnabled.12' }.freeze

      KEYS = LIST.keys.uniq.freeze

      VALUES = LIST.values.flatten.uniq.freeze
    end

    module Excel
      LIST = { xls:  'application/vnd.ms-excel',
               xlsx: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
               xltx: 'application/vnd.openxmlformats-officedocument.spreadsheetml.template',
               xlsm: 'application/vnd.ms-excel.sheet.macroEnabled.12',
               xltm: 'application/vnd.ms-excel.template.macroEnabled.12',
               xlam: 'application/vnd.ms-excel.addin.macroEnabled.12',
               xlsb: 'application/vnd.ms-excel.sheet.binary.macroEnabled.12' }.freeze

      KEYS = LIST.keys.uniq.freeze

      VALUES = LIST.values.flatten.uniq.freeze
    end

    module PowerPoint
      LIST = { pot:  %w[application/mspowerpoint application/vnd.ms-powerpoint],
               potm: 'application/vnd.ms-powerpoint.template.macroEnabled.12',
               potx: 'application/vnd.openxmlformats-officedocument.presentationml.template',
               ppa:  'application/vnd.ms-powerpoint',
               ppam: 'application/vnd.ms-powerpoint.addin.macroEnabled.12',
               pps:  %w[application/mspowerpoint application/vnd.ms-powerpoint],
               ppt:  %w[application/mspowerpoint application/powerpoint application/vnd.ms-powerpoint application/x-mspowerpoint],
               pptm: 'application/vnd.ms-powerpoint.presentation.macroEnabled.12',
               pptx: 'application/vnd.openxmlformats-officedocument.presentationml.presentation',
               ppsx: 'application/vnd.openxmlformats-officedocument.presentationml.slideshow',
               ppsm: 'application/vnd.ms-powerpoint.slideshow.macroEnabled.12',
               ppz:  'application/mspowerpoint',
               pwz:  'application/vnd.ms-powerpoint' }.freeze

      KEYS = LIST.keys.uniq.freeze

      VALUES = LIST.values.flatten.uniq.freeze
    end
  end

  module LibreOffice
    module Docs
      LIST = { odt:  'application/vnd.oasis.opendocument.text',
               fodt: 'application/vnd.oasis.opendocument.text-flat-xml',
               ott:  'application/vnd.oasis.opendocument.text-template',
               oth:  'application/vnd.oasis.opendocument.text-web',
               odm:  'application/vnd.oasis.opendocument.text-master' }.freeze

      KEYS = LIST.keys.uniq.freeze

      VALUES = LIST.values.flatten.uniq.freeze
    end

    module Spreadsheets
      LIST = { ods:  'application/vnd.oasis.opendocument.spreadsheet',
               fods: 'application/vnd.oasis.opendocument.spreadsheet-flat-xml',
               ots:  'application/vnd.oasis.opendocument.spreadsheet-template' }.freeze

      KEYS = LIST.keys.uniq.freeze

      VALUES = LIST.values.flatten.uniq.freeze
    end

    module Presentation
      LIST = { odp:  'application/vnd.oasis.opendocument.presentation',
               fodp: 'application/vnd.oasis.opendocument.presentation-flat-xml',
               otp:  'application/vnd.oasis.opendocument.presentation-template' }.freeze

      KEYS = LIST.keys.uniq.freeze

      VALUES = LIST.values.flatten.uniq.freeze
    end

    module Graphics
      LIST = { dwf:  %w[drawing/x-dwf model/vnd.dwf],
               dwg:  %w[application/acad image/vnd.dwg image/x-dwg],
               dxf:  %w[application/dxf image/vnd.dwg image/x-dwg],
               dxr:  'application/x-director',
               odg:  'application/vnd.oasis.opendocument.graphics',
               fodg: 'application/vnd.oasis.opendocument.graphics-flat-xml',
               otg:  'application/vnd.oasis.opendocument.graphics-template',
               odc:  'application/vnd.oasis.opendocument.chart',
               odf:  'application/vnd.oasis.opendocument.formula',
               odi:  'application/vnd.oasis.opendocument.image',
               xgz:  'xgl/drawing' }.freeze

      KEYS = LIST.keys.uniq.freeze

      VALUES = LIST.values.flatten.uniq.freeze
    end
  end

  module OpenDocs
    LIST = { md:  'text/markdown',
             rtf: 'application/rtf',
             txt: 'text/plain' }.freeze

    KEYS = LIST.keys.uniq.freeze

    VALUES = LIST.values.flatten.uniq.freeze
  end

  module PlainSpreadsheets
    LIST = { csv:  'text/csv',
             tsv:  'text/tsv' }.freeze

    KEYS = LIST.keys.uniq.freeze

    VALUES = LIST.values.flatten.uniq.freeze
  end

  module Video
    LIST = { '3gp':  'video/3gpp',
             '3g2':  'video/3gpp2',
             afl:  'video/animaflex',
             asf:  'video/x-ms-asf',
             asx:  %w[video/x-ms-asf video/x-ms-asf-plugin],
             avi:  %w[application/x-troff-msvideo video/msvideo video/avi video/x-msvideo],
             avs: 'video/avs-video',
             dif:  'video/x-dv',
             dl:   %w[video/dl video/x-dl],
             dv:   'video/x-dv',
             fli:  %w[video/fli video/x-fli],
             flv:  'video/x-flv',
             fmf:  'video/x-atomic3d-feature',
             gl:   %w[video/gl video/x-gl],
             isu:  'video/x-isvideo',
             ivr:  'i-world/i-vrml',
             ivy:  'application/x-livescreen',
             m1v:  'video/mpeg',
             m2v:  'video/mpeg',
             m3u8: 'application/x-mpegURL',
             mjpg: 'video/x-motion-jpeg',
             mkv:  'video/x-matroska',
             mp2:  %w[video/mpeg video/x-mpeg video/x-mpeq2a],
             mp3:  %w[video/mpeg3 video/x-mpeg],
             mp4:  'video/mp4',
             mov:  'video/quicktime',
             moov: 'video/quicktime',
             movie: 'video/x-sgi-movie',
             mpa:  'video/mpeg',
             mpe:  'video/mpeg',
             mpeg: 'video/mpeg',
             mpg:  'video/mpeg',
             mv:   'video/x-sgi-movie',
             ogv:  'video/ogg',
             qt:   'video/quicktime',
             qtc:  'video/x-qtc',
             rv:   'video/vnd.rn-realvideo',
             scm:  'video/x-scm',
             ts:   'video/MP2T',
             vdo:  'video/vdo',
             viv:  %w[video/vivo video/vnd.vivo],
             vivo:  %w[video/vivo video/vnd.vivo],
             vos:  'video/vosaic',
             webm: 'video/webm',
             wmv:  'video/x-ms-wmv',
             xdr:  'video/x-amt-demorun',
             xsr:  'video/x-amt-showrun' }.freeze

    KEYS = LIST.keys.uniq.freeze

    VALUES = LIST.values.flatten.uniq.freeze
  end

  TEXT_DOC_MIME_TYPES_KEYS = (Microsoft::Word::KEYS + LibreOffice::Docs::KEYS + OpenDocs::KEYS).freeze
  TEXT_DOC_MIME_TYPES_VALUES = (Microsoft::Word::VALUES + LibreOffice::Docs::VALUES + OpenDocs::VALUES).freeze

  SPREADSHEET_MIME_TYPES_KEYS = (Microsoft::Excel::KEYS + LibreOffice::Spreadsheets::KEYS + PlainSpreadsheets::KEYS).freeze
  SPREADSHEET_MIME_TYPES_VALUES = (Microsoft::Excel::VALUES + LibreOffice::Spreadsheets::VALUES + PlainSpreadsheets::VALUES).freeze

  PRESENTATION_MIME_TYPES_KEYS = (Microsoft::PowerPoint::KEYS + LibreOffice::Presentation::KEYS).freeze
  PRESENTATION_MIME_TYPES_VALUES = (Microsoft::PowerPoint::VALUES + LibreOffice::Presentation::VALUES).freeze

  ALL_DOCS_KEYS = (TEXT_DOC_MIME_TYPES_KEYS + SPREADSHEET_MIME_TYPES_KEYS + PRESENTATION_MIME_TYPES_KEYS + Apple::KEYS + Adobe::KEYS).freeze
  ALL_DOCS_VALUES = (TEXT_DOC_MIME_TYPES_VALUES + SPREADSHEET_MIME_TYPES_VALUES + PRESENTATION_MIME_TYPES_VALUES + Apple::VALUES + Adobe::VALUES).freeze

  ALL_IMAGES_KEYS = (Image::KEYS + LibreOffice::Graphics::KEYS).freeze
  ALL_IMAGES_VALUES = (Image::VALUES + LibreOffice::Graphics::VALUES).freeze

  ALL_ALLOWED_KEYS = (ALL_DOCS_KEYS + ALL_IMAGES_KEYS + Archives::KEYS + Audio::KEYS + Video::KEYS).freeze
  ALL_ALLOWED_VALUES = (ALL_DOCS_VALUES + ALL_IMAGES_VALUES + Archives::VALUES + Audio::VALUES + Video::VALUES).freeze

  MODEL_ATTRS = { 'avatar': 'ALL_IMAGES',
                  'doc': 'ALL_ALLOWED',
                  'logo': 'ALL_IMAGES' }.freeze

  MODEL_ATTR_NAMES = MODEL_ATTRS.keys.freeze
end
