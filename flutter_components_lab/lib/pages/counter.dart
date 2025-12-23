import 'package:flutter_components_lab/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

/*

🧱 StatelessWidget Nedir?
- Durumu (state) olmayan, yani zamanla değişmeyen widget’tır.
- UI sabittir, dışarıdan veri gelmedikçe değişmez.
🧱 Özellikleri
- İçinde değişen değişken olamaz
- setState() yok
- Daha hafif ve hızlı
- const kullanılabilir

📌 Kullanım:
- Sabit başlıklar
- Icon + Text
- Card tasarımları
- Liste elemanları (statik)

______________________________________________________________________________

🔄 StatefulWidget Nedir?
- Durumu (state) olan, yani değişebilen widget’tır.
- Sayaç, form, switch, checkbox gibi şeyler burada olur.
🔄 Özellikleri
- Değişkenler State sınıfında
- setState() ile UI yenilenir
- initState, dispose gibi lifecycle metotları vardır
- const constructor genelde kullanılmaz

📌 Kullanım:
- Sayaç
- Form inputları
- Toggle / Switch
- API’den gelen veri
- Animasyon


🧠 Değişen bir şey varsa → StatefulWidget
🎯 Özet
- StatelessWidget sabit UI’lar içindir,
- StatefulWidget ise zamanla değişen veriler içindir.


*/


class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  var _counter = 0;

  void _counterAdd() {
    _counter++;
    debugPrint("The current counter: $_counter");
  }

  void _counterRemove() {
    _counter--;
    debugPrint("The current counter: $_counter");
  }

  void _resettheCounter() {
    _counter = 0;
    debugPrint("Reset the counter: $_counter");
  }

  /*
    🎯 Theme.of(context).textTheme.headlineLarge kullanırken color eklemenin DOĞRU yolu
    "copyWith" kullanmaktır.
    📌 Neden copyWith?
    - Theme’daki fontSize, fontWeight korunur
    - Sadece color override edilir
    - Clean & scalable
 
  */
  Color getTextColor(int counter) {
    //return counter > 0 ? Colors.green : Colors.red;
    if (counter == 0) {
      return Colors.grey;
    } else if (counter > 0) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Counter", showBack: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: getTextColor(_counter),
              ),
            ),
            Text(
              _counter.toString(),
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: getTextColor(_counter),
              ),
            ),
            SizedBox(height: 20,),
            /*
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Butons(),
                  ),
                );
              },
              icon: Icon(Icons.arrow_right_alt_rounded),
              label: const Text('Buttons Page'),
            ) 
            */
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "add_fab",
            onPressed: () {
              setState(() {
                _counterAdd();
              });
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            heroTag: "remove_fab",
            onPressed: () {
              setState(() {
                _counterRemove();
              });
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            heroTag: "reset_fab",
            onPressed: () {
              setState(() {
                _resettheCounter();
              });
            },
            child: Icon(Icons.exposure_zero_rounded),
          ),
        ],
      ),
    );
  }
}

/*

🎯 Ekstra Notlar:

🧠 1️⃣ BuildContext Nedir?
- BuildContext, widget’ın ağaçtaki (widget tree) konumunu temsil eden bir referanstır.
- “Ben widget ağacının neresindeyim?” bilgisidir.
 📌 Ne işe yarar?
- Theme’a erişmek
- Navigator ile sayfa açmak
- MediaQuery (ekran boyutu)
- Scaffold / SnackBar çağırmak


🔄 2️⃣ Hot Reload Nedir?
- Hot Reload, kodu değiştirdiğinde:
- State’i korur
- Sadece UI’ı yeniler
- Çok hızlıdır 
- UI değişir
- Counter aynı kalır
 📌 Ne zaman kullanılır?
- UI düzenleme
- Text, color, padding
- Widget ekleme / çıkarma


🔁 3️⃣ Hot Restart Nedir?
- Uygulamayı baştan başlatır
- Tüm state sıfırlanır
- main() tekrar çalışır
- Counter → 0
- initState() tekrar
 📌 Ne zaman kullanılır?
- initState değiştiyse
- Global değişken değiştiyse
- Provider / Bloc / Riverpod state bozulduysa
- Hot Reload işe yaramıyorsa


🎯 Özet
- BuildContext → widget’ın ağaçtaki adresi
- Hot Reload → state korunur, UI yenilenir
- Hot Restart → her şey sıfırlanır

*/
