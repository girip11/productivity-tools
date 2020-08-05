# Extracting text from images

## Softwares required

* **imagemagick**. Install instructions can be found [here](../image_manipulation.md)
* tesseract-ocr. `sudo apt install tesseract-ocr`. Extract text from image.
* [ocrmypdf](https://github.com/jbarlow83/OCRmyPDF). This is required only when we convert the image to pdf and then extract the letters from the converted pdf.
* **pdftotext** - Converting pdf document to text.

## Extract text from image

* Tesseract works with multiple image formats

```Bash
# this extracts the text from the image file
tesseract "$image_file" "$text_file_without_extension"
```

* We can use the [script](./gif_to_text.sh) to extract text from the **image files**.

* Tesseract works very well in extracting text from the image.

## Extract text from pdf converted from an image

This is an alternative approach to extract text from the images by converting the images to pdf and then using **ocrmypdf** and **pdftotext** to get the text.

```Bash
convert *.jpg pictures.pdf
ocrmypdf pictures.pdf scanned.pdf
pdftotext scanned.pdf scanned.txt
wc -w scanned.txt
```

---

## References

* [How to use OCR from the command line in Linux?](https://unix.stackexchange.com/questions/377359/how-to-use-ocr-from-the-command-line-in-linux)
* [GIF to PNG using imagemagick](https://superuser.com/questions/1253605/conversion-from-gif-to-png-not-working)
