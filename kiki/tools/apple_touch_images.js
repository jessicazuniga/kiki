
var imageMagick = require('imagemagick');

var image_file = process.argv[2]

console.log('Processing: ' + image_file)

imageMagick.convert([
    image_file,
    '-thumbnail', '72x72',
    '-background', 'white',
    '-gravity', 'center',
    '-extent', '72x72',
    'apple-touch-icon-72x72-precomposed.png'
]);
imageMagick.convert([
    image_file,
    '-thumbnail', '114x114',
    '-background', 'white',
    '-gravity', 'center',
    '-extent', '114x114',
    'apple-touch-icon-114x114-precomposed.png'
]);
imageMagick.convert([
    image_file,
    '-thumbnail', '57x57',
    '-background', 'white',
    '-gravity', 'center',
    '-extent', '57x57',
    'apple-touch-icon-precomposed.png'
]);
imageMagick.convert([
    image_file,
    '-thumbnail', '768x1004',
    '-background', 'black',
    '-gravity', 'center',
    '-extent', '768x1004',
    'apple-touch-startup-ipad-portrait.png'
]);
imageMagick.convert([
    image_file,
    '-rotate', '90',
    '-thumbnail', '748x1024',
    '-background', 'black',
    '-gravity', 'center',
    '-extent', '748x1024',
    'apple-touch-startup-ipad-landscape.png'
]);
imageMagick.convert([
    image_file,
    '-thumbnail', '320x460',
    '-background', 'black',
    '-gravity', 'center',
    '-extent', '320x460',
    'apple-touch-startup-iphone.png'
]);
