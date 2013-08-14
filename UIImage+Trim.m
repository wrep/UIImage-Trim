//
//  UIImage+Trim.m
//
//  Created by Rick Pastoor on 26-09-12.
//  Based on gist:3549921 ( https://gist.github.com/3549921/8abea8ac9e2450f6a38540de9724d3bf850a62df )
//
//  Copyright (c) 2012 Wrep - http://www.wrep.nl/
//

#import "UIImage+Trim.h"

@implementation UIImage (Trim)

- (UIImage *) imageByTrimmingTransparentPixels
{
	int rows = self.size.height * self.scale;
	int cols = self.size.width * self.scale;
	int bytesPerRow = cols*sizeof(uint8_t);
	
	if ( rows < 2 || cols < 2 )
    {
		return self;
	}
	
	// Allocate array to hold alpha channel
	uint8_t *bitmapData = calloc(rows*cols, sizeof(uint8_t));
	
	// Create alpha-only bitmap context
	CGContextRef contextRef = CGBitmapContextCreate(bitmapData, cols, rows, 8, bytesPerRow, NULL, kCGImageAlphaOnly);
	
	// Draw our image on that context
	CGImageRef cgImage = self.CGImage;
	CGRect rect = CGRectMake(0, 0, cols, rows);
	CGContextDrawImage(contextRef, rect, cgImage);
    
	// Sum all non-transparent pixels in every row and every column
	uint16_t *rowSum = calloc(rows, sizeof(uint16_t));
	uint16_t *colSum = calloc(cols, sizeof(uint16_t));
	
	// Enumerate through all pixels
	for (int row = 0; row < rows; row++)
    {
		for (int col = 0; col < cols; col++)
		{
            // Found non-transparent pixel
			if (bitmapData[row*bytesPerRow + col])
            {
				rowSum[row]++;
				colSum[col]++;
			}
		}
	}
	
	// Initialize crop insets and enumerate cols/rows arrays until we find non-empty columns or row
	UIEdgeInsets crop = UIEdgeInsetsMake(0, 0, 0, 0);
	
    // Top
	for (int i = 0; i < rows; i++)
    {
		if ( rowSum[i] > 0 )
        {
			crop.top = i;
            break;
		}
	}
	
    // Bottom
	for (int i = rows - 1; i >= 0; i--)
    {
		if (rowSum[i] > 0)
        {
			crop.bottom = MAX(0, rows - i - 1);
            break;
		}
	}
	
    // Left
	for (int i = 0; i < cols; i++)
    {
		if (colSum[i] > 0)
        {
			crop.left = i;
            break;
		}
	}
	
    // Right
	for (int i = cols - 1; i >= 0; i--)
    {
		if (colSum[i] > 0)
        {
			crop.right = MAX(0, cols - i - 1);
            break;
		}
	}
	
	free(bitmapData);
	free(colSum);
	free(rowSum);
	
    UIImage *img = self;
    
	if (crop.top == 0 && crop.bottom == 0 && crop.left == 0 && crop.right == 0)
    {
		// No cropping needed
	}
	else
    {
		// Calculate new crop bounds
		rect.origin.x += crop.left;
		rect.origin.y += crop.top;
		rect.size.width -= crop.left + crop.right;
		rect.size.height -= crop.top + crop.bottom;
		
		// Crop it
		CGImageRef newImage = CGImageCreateWithImageInRect(cgImage, rect);
		
		// Convert back to UIImage
        img = [UIImage imageWithCGImage:newImage scale:self.scale orientation:self.imageOrientation];
        
        CGImageRelease(newImage);
	}
    
    CGContextRelease(contextRef);
    
    return img;
}

@end
