#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.11"
# dependencies = ["pillow", "numpy"]
# ///

import os
from pathlib import Path
from PIL import Image, ImageDraw, ImageOps
import numpy as np

def main():
    img_path = Path("/home/mello/Pictures/profile.jpg")
    out_path = Path("/home/mello/Pictures/profile_boxed.png")
    
    if not img_path.exists():
        print(f"Error: {img_path} does not exist.")
        return
        
    print(f"Opening {img_path}...")
    with Image.open(img_path) as im:
        # Convert to RGBA
        im = im.convert("RGBA")
        arr = np.array(im)
        
        # Calculate brightness for each pixel (max of R, G, B)
        rgb = arr[:, :, :3]
        max_rgb = np.max(rgb, axis=2)
        
        # Threshold to identify non-black pixels (crown)
        threshold = 15
        mask = max_rgb > threshold
        
        # Make the black background transparent using soft alpha thresholding
        low_th = 5
        high_th = 25
        
        for i in range(arr.shape[0]):
            for j in range(arr.shape[1]):
                val = max_rgb[i, j]
                if val <= low_th:
                    arr[i, j, 3] = 0
                elif val < high_th:
                    arr[i, j, 3] = int((val - low_th) / (high_th - low_th) * 255)
        
        im_trans = Image.fromarray(arr)
        
        rows = np.any(mask, axis=1)
        cols = np.any(mask, axis=0)
        
        if not rows.any() or not cols.any():
            print("Could not find crown content. Skipping crop.")
            cropped = im_trans
        else:
            rmin, rmax = np.where(rows)[0][[0, -1]]
            cmin, cmax = np.where(cols)[0][[0, -1]]
            print(f"Detected bounding box: rows {rmin} to {rmax}, cols {cmin} to {cmax}")
            cropped = im_trans.crop((cmin, rmin, cmax + 1, rmax + 1))
            
        # Create a new 400x400 transparent canvas
        canvas_size = 400
        canvas = Image.new("RGBA", (canvas_size, canvas_size), (0, 0, 0, 0))
        
        # Resize cropped crown to fit nicely on the canvas (no border, so we can fill it more)
        target_size = 380
        cw, ch = cropped.size
        scale = min(target_size / cw, target_size / ch)
        new_w = round(cw * scale)
        new_h = round(ch * scale)
        resized_crown = cropped.resize((new_w, new_h), Image.Resampling.LANCZOS)
        
        # Paste the crown centered on the canvas
        cx = (canvas_size - new_w) // 2
        cy = (canvas_size - new_h) // 2
        canvas.paste(resized_crown, (cx, cy), resized_crown)
        
        canvas.save(out_path, "PNG")
        print(f"Successfully processed image (removed border) and saved to {out_path}")

if __name__ == "__main__":
    main()
