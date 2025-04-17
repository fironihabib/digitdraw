# 🎨 DigitDraw DSL - Özel Bir Çizim Dili

DigitDraw, özel bir **domain-specific language (DSL)** olarak tasarlanmıştır. Bu dil; çizim komutları, fonksiyon tanımı, koşullu ifadeler, döngüler ve daha fazlasıyla kendi grafiksel programlama dilinizi oluşturmanıza olanak tanır.

## 📜 Proje Hakkında

Bu proje, bir dilin tüm aşamalarını kapsar:
- **Lexer (lexer.l)**: Girdi dosyasındaki kelimeleri tanımlar (token'lar).
- **Parser (parser.y)**: Gramer kurallarına göre token'ları yorumlar.
- **Örnek Test Dosyaları**: 20 farklı `.txt` dosyası ile dil yapısı test edilmiştir.
- **Rapor**: Projenin özelliklerini ve dilin açıklamasını içeren bir `rapor.docx` dosyası vardır.

## 🧠 Dil Özellikleri

DigitDraw dili şu yapıları destekler:

- 🔢 **Atama ve artırmalı atama**: `<-`, `=<-`, `+<-`, `-<-`
- 📌 **Koşullu ifadeler**: `eger`, `ise`, `aksi`
- 🔁 **Döngü yapıları**: `dongu`, `iken`, `neki`, `for`, `to`
- 🔧 **Fonksiyon tanımlama ve çağırma**: `fonk`, `knof`, `ID(...)`
- 📦 **Liste tanımı ve indeksleme**: `list[1, 2]`, `liste[0]`
- 🖌️ **Çizim komutları**: `daire_ciz`, `cizgi_ciz`, `dikdortgen_ciz`, `ucgen_ciz`
- ⌨️ **Klavye kontrolü**: `tus_basildi`, `TUS_YUKARI`, vb.
- 🎯 **Akış kontrolü**: `break`, `continue`, `dondur`
- 🔄 **switch-case yapısı**
- 📥📤 **Giriş/Çıkış**: `input`, `print`

## 🔧 Derleme ve Çalıştırma

Aşağıdaki komutlar Linux terminalinde projenizi derleyip çalıştırmak için kullanılır:

```bash
# Derleme adımları:
bison -d parser.y
flex lexer.l
gcc -o digitdraw parser.tab.c lex.yy.c -lfl

# Test çalıştırması:
./digitdraw < test1.txt
```

Tüm testleri otomatik çalıştırmak için:

```bash
for i in {1..20}; do
  echo "----- test$i.txt -----"
  ./digitdraw < test$i.txt
done
```

## 📁 Proje Yapısı

```
digitdraw/
├── lexer.l               # Token tanımları
├── parser.y              # BNF gramer kuralları
├── rapor.docx            # Proje raporu
├── digitdraw             # Derlenmiş çalıştırılabilir dosya
├── test1.txt ~ test20.txt # Test girdileri
└── README.md             # Bu açıklama dosyası
```

## 🧪 Test Dosyaları

Projede 20 farklı test dosyası yer almakta ve tümü başarıyla gramer kontrolünden geçmektedir (test18-20 dahil).

## 🧑‍💻 Geliştirici

**Fironi Habibzade**  

## 🗃️ Lisans

Bu proje akademik bir ödev kapsamında geliştirilmiştir. Kişisel kullanım içindir.

