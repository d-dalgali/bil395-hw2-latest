# Scheme Hesap Makinesi

## Genel Bilgi

Bu proje, Scheme dilinde geliştirilmiş bir hesap makinesi yorumlayıcısıdır. Parantezli ifadeleri destekler, öncelik sırasına göre işlem yapar ve hata denetimi sağlar.

## Özellikler

- ✔️ Çok seviyeli iç içe parantez desteği
- ✔️ Toplama (+), Çıkarma (-), Çarpma (\*), Bölme (/) işlemleri
- ✔️ İfade doğrulama (geçerli işlem sırası var mı diye kontrol eder)
- ✔️ Fonksiyonel ayrım: 2 operatörlü işlemler, 4 operatörlü işlemler, nested hesaplama ve hata kontrolü

---

## Nasıl Çalıştırılır?

### 1. MIT Scheme Kullanarak (Linux/macOS/WSL):

#### Kurulum

```bash
sudo apt update
sudo apt install mit-scheme
```

#### Scheme Ortamını Başlat

```bash
mit-scheme
```

#### Kod Dosyasını Yükle

Kodunu bir dosyaya kaydet (or: `calculator.scm`) ve şu komutu gir:

```scheme
(load "calculator.scm")
```

#### Kullanım

```scheme
(calc '(2 + 3))                    ; → 5
(calc '((2 + 3) * (4 - 1)))        ; → 15
(calc '(1 + 2 * 3))                ; → 7
(calc '(1 + (2 * 3)))              ; → 7
(calc '((10 / 2) + (4 * 2)))       ; → 14
```

### 2. DrRacket ile (GUI kullananlar için)

- [https://racket-lang.org](https://racket-lang.org) adresinden indir.
- `#lang scheme` olarak dili belirle.
- Kodu yapıştır ve "Run" tuşuna bas.
- Alt kısımda `(calc '(...))` şeklinde test et.

---

## Hata Durumları

| Hata Durumu         | Mesaj İçeriği        |
| ------------------- | -------------------- |
| Eksik operator      | `#f` sonucu döner    |
| Yanlış yapılı ifade | `#f` sonucu döner    |
| İşlem başarılıysa   | Doğrudan sayı sonucu |

---

## Dosya Çıktısı Örnekleri

```scheme
(calc '(2 + 3))               ; => 5
(calc '((1 + 2) * (3 + 1)))   ; => 12
(calc '((4 * 5) / 2))         ; => 10
```
