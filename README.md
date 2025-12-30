# Lossless Image Compression with 3 Methods (Huffman - LZW - RLE)
With the rapid evolution of sensor technology, modern smartphones now capture images with breathtaking clarity and dynamic range. However, this visual fidelity comes with a significant data footprint. As resolution and color depth increase, even a standard photograph can occupy substantial storage space.

To understand the scale of raw image data, consider the fundamental approximation for uncompressed file size:

$$File\ Size \approx (Width \times Height) \times Bit\ Depth \times Channels$$

This equation implies that higher quality linearly escalates storage requirements. To solve this, our project implements advanced **lossless compression algorithms** that intelligently reduce data redundancy without compromising visual quality:

* **Run-Length Encoding (RLE):** We utilize RLE to collapse long sequences of identical pixels (such as a clear blue sky) into a single data point and a count value, eliminating repetitive data.
* **Huffman Coding:** This entropy-based algorithm assigns shorter binary codes to frequently occurring data patterns and longer codes to rare ones, optimizing the overall bit allocation.
* **LZW (Lempel-Ziv-Welch):** By building a dynamic dictionary of data patterns during the scan, LZW allows us to replace repeating complex structures with short references.

By combining these methods, we effectively counteract the file size equation, delivering high-resolution imagery in a compact format.
