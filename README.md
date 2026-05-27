# 🖼️ GIF Compressor

![Batch Script](https://img.shields.io/badge/script-batch-blue.svg)
![Requires](https://img.shields.io/badge/requires-gifsicle-orange.svg)
![Compression](https://img.shields.io/badge/compression-lossy%2040%25-red.svg)

A simple Windows batch script that automatically compresses GIF files using [gifsicle](https://www.lcdf.org/gifsicle/). Perfect for reducing file sizes for web uploads, Discord, Twitter, or any platform with file size limits.

## ✨ Features

- 🗜️ **Lossy compression** - reduces file size by up to 40% (adjustable)
- 🎨 **Color optimization** - reduces to 128 colors while preserving quality
- ⚡ **Drag-and-drop ready** - just place GIFs in the `input` folder (same as script)
- 📁 **Automatic folder creation** - creates input/output folders if missing
- 📊 **Progress tracking** - shows real-time compression status

## 🚀 Quick Start

### 1. Install gifsicle

Download from: [https://www.lcdf.org/gifsicle/](https://www.lcdf.org/gifsicle/) (make sure it is added to path!)

Or using package managers:
```bash
# Chocolatey
choco install gifsicle

# Scoop
scoop install gifsicle
