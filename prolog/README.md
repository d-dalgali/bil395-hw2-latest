# Prolog Hesap Makinesi

## Genel Bilgi

Bu proje, **SWI-Prolog** kullanılarak geliştirilmiş basit bir hesap makinesi yorumlayıcısıdır. Aritmetik ifadeleri ve değişken atamalarını destekler. Kullanıcıdan alınan ifadeler `evaluate/2` veya `evaluate/3` yapısı kullanılarak değerlendirilir. Ayrıca, sıfıra bölme hataları ve tanımsız değişkenler gibi durumlar için özel hata mesajları içerir.

---

## Özellikler

- ✅ Temel dört işlem: `+`, `-`, `*`, `/`
- ✅ Değişken atama: `assertz(x(5)).` ile `x = 5` tanımı
- ✅ İfade değerlendirme: `evaluate(Expression, Result).`
- ✅ Sıfıra bölme kontrolü
- ✅ Hatalı yapıların yakalanması
- ✅ İfade iç içe olabilir (nested)
- ❗ Operatörler prefix olarak girilmelidir (örneğin `/(x, 2)` → `x / 2`)

---

## Kurulum

1. **SWI-Prolog yüklemesi:**

Ubuntu/Debian:

```bash
sudo apt install swi-prolog
```

---

## Kullanım

### 1. Prolog oturumunu başlat:

```bash
swipl
```

### 2. Dosyayı yükle:

```prolog
?- consult('calculator.pl').
true.
```

### 3. Değişken tanımla:

```prolog
?- assertz(x(5)).
true.

?- assertz(y(3)).
true.
```

### 4. İfade değerlendir:

```prolog
?- evaluate(+(x, y), R).
R = 8.

?- evaluate(*(+(x, 2), y), R).
R = 21.
```

### 5. Hatalı kullanım örneği:

```prolog
?- evaluate(/(x, 0), R).
Hata: Sıfıra bölme hatası!
false.
```

---

## Bilgilendirme

- **`assertz(x(5)).`** ⇒ `x` değişkenine 5 atanır.
- Prolog operatörleri **prefix** olarak tanımlandığı için `(x + y)` yerine `+(x, y)` yazılmalıdır.
- Nested işlemler yapılabilir: `*(+(x, 2), y)` → `(x + 2) * y`
- Bölme işlemi için: `/(x, y)` yazılmalıdır.

---

## Dosya Yapısı

```bash
prolog/
├── calculator.pl   # Prolog yorumlayıcı dosyası
├── README.md       # Bu açıklamaları içeren dosya
```

---

## Örnek Çalıştırmalar

```prolog
?- consult('calculator.pl').
true.

?- assertz(x(5)).
true.

?- assertz(y(3)).
true.

?- evaluate(*(+(x, 2), y), R).
R = 21.

?- evaluate(/(x, 0), R).
Hata: Sıfıra bölme hatası!
false.
```

---

## Sonuç

Bu proje, Prolog'da kurallar, hata yönetimi ve değişken atamaları ile birlikte bir çözüm sunar.
