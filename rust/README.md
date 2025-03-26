# Rust Hesap Makinesi

Bu proje, Rust programlama dili kullanılarak geliştirilmiş, kullanıcıdan alınan matematiksel ifadeleri değerlendirebilen bir hesap makinesi yorumlayıcısıdır. Program, değişken atamalarını ve temel aritmetik işlemleri (toplama, çıkarma, çarpma, bölme, üstel alma) destekler.

## Özellikler

- Değişken tanımlama ve kullanma (örn. `x = 5`, `y = (x + 2) * 3`)
- Float ve integer destekli işlemler
- Aritmetik işlemler: `+`, `-`, `*`, `/`, `^`, `**`
- Hatalı ifadeler için kullanıcıya açık hata mesajları
- Parantezli işlemler

## Kurulum

Rust geliştirme ortamını yüklemek için:

```bash
sudo apt install cargo
```

Eğer `cargo` zaten kuruluysa bu adımı atlayabilirsiniz. `cargo` Rust'ın derleyicisi ve paket yöneticisidir.

## Çalıştırma

Proje klasöründe terminal açtıktan sonra aşağıdaki komutu girin:

```bash
cargo run
```

Ardından terminalde bir giriş istemi (`>`) göreceksiniz. Buraya matematiksel ifadeleri girerek hesaplama yapabilirsiniz.

Örnek:

```
> x = 4
x = 4
> y = (x + 1) * 2
y = 10
> y / 2
Sonuç: 5.00
```

## Desteklenen İfadeler

- Üstel alma işlemi hem `^` hem de `**` ile desteklenmektedir.

| Örnek Girdi   | Açıklama                                              |
| ------------- | ----------------------------------------------------- |
| `3 + 5`       | Toplama                                               |
| `(2 + 3) * 4` | Parantezli işlem                                      |
| `2 ** 3`      | Üstel alma (alternatif olarak `2 ^ 3` de desteklenir) |
| `x = 7`       | Değişken atama                                        |
| `x + 1`       | Değişken kullanımı                                    |

## Hata Yönetimi

Program aşağıdaki hataları yakalar ve kullanıcıyı bilgilendirir:

- Tanımsız değişken kullanımı
- Parantez eksikliği
- Geçersiz karakter veya token
- Sıfıra bölme
- Geçersiz ifadeler

Örnekler:

```
> z + 1
Hata: Evaluation failed. Details: Evaluation error: variable not found

> (2 + 3
Hata: Evaluation failed. Details: Parse error: Missing 1 right parenthesis

> 4 / 0
Hata: Evaluation failed. Details: division by zero
```

## Kullanılan Kütüphaneler

- [`regex`](https://crates.io/crates/regex): Değişken isimlerini ifadeler içinde bulup değerleriyle değiştirmek için.
- [`meval`](https://crates.io/crates/meval): Matematiksel ifadeleri derleyip çalıştırmak için.
