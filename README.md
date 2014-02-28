UIImage-Trim
============

Category for trimming transparent pixels of an UIImage object.

How to use
----------
Add the `UIImage+Trim` files to your project. Include `UIImage+Trim.h` in the files where you want to trim your images. 

Trimming is pretty straightforward:

`[yourImage imageByTrimmingTransparentPixels];`

Optionally, you may want to consider any non-opaque pixels as being transparent (for instance, cropping out a light drop shadow). This can be achieved by using the alternate method:

`[yourImage imageByTrimmingTransparentPixelsRequiringFullOpacity:YES];`

Additionally, if you merely desire to know the `UIEdgeInsets` of the transparency around the image, you may want to use the following:

`[yourImage transparencyInsetsRequiringFullOpacity:YES];`

This call works based on the same principles as the "advanced" trim method, with the boolean dictating whether non-opaque pixels should be considered transparent.


This fork adds support for trimming white area around image with given tolerance

`[yourImage imageByTrimmingWhitePixelsWithOpacity:VALUE];`

where 0 - cut only white, 255 - remove everything