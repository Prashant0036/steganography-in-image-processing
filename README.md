# Image-based Steganography with XOR Encryption

This project implements a technique of hiding secret messages within an image using steganography. The hidden message is encrypted with a secret key and embedded in the least significant bits (LSBs) of the image's pixel values. This allows for secure communication by ensuring that the message is not easily detectable in the image.

## How It Works

1. **Message Encoding:**
   - A secret message is converted into binary format and encrypted using XOR encryption with a secret key.
   - The encrypted bits are embedded into the LSBs of the image's RGB pixel values, making the message nearly invisible.

2. **Message Extraction:**
   - The image is read, and the LSBs of each pixel are extracted.
   - The embedded message is decrypted using the same secret key through the XOR operation.
   - The binary data is converted back to the original message.

3. **Security:**
   - The message is hidden within the image in such a way that it is difficult to detect or extract without the secret key.
   - Only the intended recipient with the correct key can decrypt and view the hidden message.

## Features

- **Image Steganography:** Securely hides text messages within image files.
- **XOR Encryption:** Uses a secret key for encryption, making the process secure and private.
- **Simple Extraction:** Messages can be easily extracted from the image using the same key.

## Requirements

- MATLAB or Octave for running the code.
- Basic understanding of steganography and encryption.

## Usage

1. **Encoding:**
   - Provide a secret message and a secret key.
   - The image will be generated with the hidden message encrypted inside the pixel data.

2. **Decoding:**
   - Use the same secret key to extract and decrypt the hidden message from the image.

## Benefits

- **Secure Communication:** Enables the secure transmission of secret messages without leaving obvious traces.
- **Invisible to the Naked Eye:** The image looks normal, but it carries hidden data that can only be extracted with the correct key.
- **Easy to Use:** Simple process for both hiding and extracting messages.




