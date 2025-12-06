# 📘 Blog App — Clean Architecture

[![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue?logo=flutter&logoColor=white)]()
[![Dart](https://img.shields.io/badge/Dart-Language-blue?logo=dart&logoColor=white)]()
[![Supabase](https://img.shields.io/badge/Backend-Supabase-3ECF8E?logo=supabase&logoColor=white)]()
[![Architecture](https://img.shields.io/badge/Architecture-Clean_Architecture-orange)]()
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-green)]()

---

Aplikasi **Blog App** yang dibangun menggunakan **Flutter**, menerapkan **Clean Architecture**, serta menggunakan **Supabase** sebagai backend (auth, database, dan storage).

Project ini dibuat dengan mengikuti panduan dari channel YouTube [![Rivaan Ranawat](https://www.youtube.com/@RivaanRanawat)]():  
👉 [Link](https://www.youtube.com/watch?v=ELFORM9fmss)

---

## 🚀 Fitur Utama

### 🔐 Authentication
- **Sign Up (Registrasi)**
- **Sign In (Login)**

### 📝 Blog
- **Create New Blog** — membuat blog baru lengkap dengan judul, konten, dan gambar  
- **Detail Blog** — melihat detail konten blog
- **Upload Gambar** — setiap blog dapat menyertakan gambar yang diunggah ke **Supabase Storage**  
- **Cache Offline** — data blog dan gambar disimpan secara lokal agar tetap dapat dibaca saat perangkat offline

---

## 🛠️ Tech Stack

- **Flutter** — UI development  
- **Dart** — bahasa utama  
- **Clean Architecture** — scalable & maintainable structure  
- **Supabase** — backend services → https://supabase.com  

---

## 📦 Backend Setup (Supabase)

Aplikasi menggunakan **Supabase** dengan layanan:
- Supabase Auth  
- Supabase Database (PostgreSQL)  
- Supabase Storage  

Panduan lengkap Supabase → https://supabase.com/docs

---

## 🎯 Tujuan Project

Project ini dibuat untuk:
- Latihan membangun aplikasi Flutter dengan Clean Architecture  
- Menerapkan pemisahan layer (presentation, domain, data)  
- Memahami integrasi Flutter + Supabase  
- Membangun aplikasi blog full-stack sederhana  

---

## 📱 App Preview


<p align="center">
  <img src="app-preview/login-page.jpg" width="230">
  <img src="app-preview/signup-page.jpg" width="230">
  <img src="app-preview/create-blog-page.jpg" width="230">
</p>

<p align="center">
  <img src="app-preview/blogs-page.jpg" width="230">
  <img src="app-preview/upload-new-blog.jpg" width="230">
</p>
