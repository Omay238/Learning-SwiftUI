#!/usr/bin/env python

from PIL import Image
import argparse
import csv
import os
import colorsys

def set_lightness(color, target_lightness):
    h, l, s = colorsys.rgb_to_hls(*color)

    l = target_lightness

    r, g, b = colorsys.hls_to_rgb(h, l, s)

    r = int(r * 255)
    g = int(g * 255)
    b = int(b * 255)

    r = max(0, min(r, 255))
    g = max(0, min(g, 255))
    b = max(0, min(b, 255))

    return r, g, b

parser = argparse.ArgumentParser(description="Simple CLI tool to convert the NASA ADC csv files to images. May be "
                                             "useful.")

parser.add_argument('filename', help='filename')

args = parser.parse_args()

if not os.path.exists(f"./images/{args.filename}.tif"):
    with open(f"{args.filename}.csv") as data:
        csv_reader = csv.reader(data)

        width, height = 3200, 3200 

        y = 0

        image = Image.new('RGB', (width, height))

        for i in csv_reader:
            x = 0
            for j in i:
                if float(j) < 5:
                    col = (0, 0, 0.5)
                elif float(j) < 10:
                    col = (0, 0.5, 0)
                elif float(j) < 15:
                    col = (1, 0.5, 0)
                else:
                    col = (1, 0, 0)
                col = set_lightness(col, float(j) / 72 + 0.2)

                image.putpixel((x, y), col)
                x += 1
            y += 1

    image.save(f"./images/{args.filename}.tif")
