# Perl Hesap Makinesi

## Genel Bilgi

Bu proje, Perl dilinde geliştirilmiş bir yorumlayıcıdır. Kullanıcıdan alınan ifadeleri satır satır değerlendirir ve aritmetik işlemleri gerçekleştirir. Değişken ataması desteklenir, parantezli ifadeler çözümlenir ve çeşitli hata durumları kullanıcıya bildirilir.

## Özellikler

- ✔️ **Değişken atama desteği**: `x = 5`, `y = (x + 2) * 3`
- ✔️ **Temel aritmetik işlemler**: `+`, `-`, `*`, `/`
- ✔️ **Parantez desteği**
- ✔️ **Tanımsız değişken hatası**
- ✔️ **Sıfıra bölme kontrolü**
- ✔️ **Geçersiz karakter filtresi**
- ✔️ **Parantez dengesi kontrolü**
- ✔️ **Çıkış için Ctrl+D ya da Ctrl+C**

## Tasarım Kararları

- **Değişken yönetimi:** `%variables` adlı hash kullanılarak tanımlanan tüm değişkenler saklanır ve ifadelerde referans edilebilir.
- **Regex ile ifade ayrıştırma:** Atama ifadeleri (örneğin `x = 2 + 3`) ile doğrudan işlemler (`2 + 3`) ayrıştırılır.
- **Güvenli `eval` kullanımı:** `eval` sadece sayılar, parantezler ve operatörler içeren temizlenmiş ifadeler üzerinde kullanılır.
- **Özel hata mesajları:** Her hata tipi kullanıcıya farklı mesajlarla açıklanır (örneğin tanımsız değişken, geçersiz karakter, eksik parantez vs).

## Nasıl Kullanılır

### 1. Çalıştırmak için:

````bash
perl calculator.pl


Kullanıcıdan alınan ifadeler aşağıdaki gibi yorumlanır:

```plaintext
> x = 4
x = 4
> y = (x + 3) * 2
y = 14
> y / 2
Sonuç: 7
> z + 1
Hata: Tanımsız değişken: z
> 10 / 0
Hata: Sıfıra bölme hatası!
> (1 + 2
Hata: Parantez hatası: Eşleşmeyen '(' ve ')' sayısı!
> 3 + &
Hata: Geçersiz karakter tespit edildi!
````

Çıkmak için: **Ctrl+D (Unix)** veya **Ctrl+Z (Windows)** tuş kombinasyonlarını kullanabilirsiniz.

### Hata Yönetimi

| Durum                  | Mesaj                                      |
| ---------------------- | ------------------------------------------ |
| Tanımsız değişken      | Hata: Tanımsız değişken: `<isim>`          |
| Sıfıra bölme           | Hata: Sıfıra bölme hatası!                 |
| Parantez dengesi bozuk | Hata: Parantez hatası: Eşleşmeyen parantez |
| Geçersiz karakter      | Hata: Geçersiz karakter tespit edildi!     |
| Genel ifade hatası     | Hata: Geçersiz ifade!                      |
