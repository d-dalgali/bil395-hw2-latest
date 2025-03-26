# ADA Hesap Makinesi

## 📌 Genel Bilgi

Bu proje, **ADA programlama dili** kullanılarak geliştirilmiş basit bir hesap makinesi yorumlayıcısıdır. Kullanıcıdan aldığı aritmetik ifadeleri satır satır işleyerek sonucu hesaplar ve ekrana yazdırır. Kodun temel amacı, ifade çözümleme (parsing), aritmetik hesaplama ve hata kontrolü yapabilmektir.

---

## 🎯 Desteklenen Özellikler

- ✅ **Toplama** (`+`)
- ✅ **Çıkarma** (`-`)
- ✅ **Çarpma** (`*`)
- ✅ **Bölme** (`/`)
- ✅ **Doğrudan sayı girdisi**
- ✅ **Sıfıra bölme kontrolü**
- ✅ **Hatalı girişler için açıklayıcı hata mesajı**
- ✅ **float işlemleri**

---

## 🛠️ Tasarım Kararları

- Kullanıcıdan gelen girişler `String` olarak alınır ve `Float'Value` fonksiyonu ile sayıya çevrilir.
- Her aritmetik işlem için `Index` fonksiyonu ile operatörün yeri bulunur.
- Operatöre göre sol ve sağ taraf ayrıştırılır ve işleme göre hesaplanır.
- Hatalı girişlerde veya geçersiz aritmetik ifadelerde özel hata mesajları verilir.
- Bölme işleminde `0` kontrolü yapılır ve kullanıcı bilgilendirilir.

---

## 🔧 Derleme Talimatı

```bash
gnatmake calculator.adb
gnatmake, hem .adb dosyasını hem de varsa .ads dosyalarını derleyip yürütülebilir bir dosya (calculator) oluşturur.

▶️ Çalıştırma
./calculator
Kullanıcıdan alınan örnek girdiler:
> 3 + 2
Sonuç: 5.00

> 8 / 2
Sonuç: 4.00

> 4 / 0
Hata: Geçersiz ifade!

> 3.5 * 2
Sonuç: 7.00
Çıkmak için Ctrl+C kullanabilirsiniz.

⚠️ Hata Durumları ve Mesajlar
Hata Türü	Mesaj
Sıfıra bölme	Hata: Geçersiz ifade!
Geçersiz karakter	Hata: Geçersiz ifade!
Sayıya çevrilemeyen	Hata: Geçersiz ifade!
Tüm hata yakalamaları exception bloğu ile güvenli şekilde yapılmaktadır.

```
