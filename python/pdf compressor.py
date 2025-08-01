import fitz
from PIL import Image
import io

def compress_images_in_pdf(input_path, output_path, image_quality=30):
    doc = fitz.open(input_path)

    for page_index in range(len(doc)):
        images = doc.get_page_images(page_index)
        for img_index, img in enumerate(images):
            xref = img[0]
            base_image = doc.extract_image(xref)
            image_bytes = base_image["image"]
            image_ext = base_image["ext"]

            image = Image.open(io.BytesIO(image_bytes))
            img_byte_arr = io.BytesIO()

            # Compress and convert image
            image.save(img_byte_arr, format="JPEG", quality=image_quality)
            new_img_bytes = img_byte_arr.getvalue()

            # Replace the image in the PDF
            doc.update_image(xref, new_img_bytes)

    doc.save(output_path)
    doc.close()
    print(f"Image-compressed PDF saved to: {output_path}")

# Example usage
compress_images_in_pdf("D:\passbook hareesh.pdf","D:\passbook hareesh compressed.pdf")






