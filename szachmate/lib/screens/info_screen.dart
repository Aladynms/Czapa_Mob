import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Zasady gry i informacje")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("♟️ Podstawowe zasady szachów", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8),
            Text(
              "Szachy to gra strategiczna rozgrywana na planszy 8x8 pól. "
              "Każdy gracz ma 16 figur: króla, hetmana, 2 gońce, 2 skoczki, 2 wieże i 8 pionków. "
              "Celem gry jest danie mata królowi przeciwnika.",
            ),
            SizedBox(height: 24),

            Text("🧩 Systemy turniejowe", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8),
            Text("• System szwajcarski – gracze grają w każdej rundzie z przeciwnikiem o podobnym wyniku."),
            Text("• System kołowy – każdy gra z każdym (idealne przy małej liczbie uczestników)."),
            SizedBox(height: 24),

            Text("❓ Najczęstsze pytania (FAQ)", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8),
            Text("• Czy mogę dołączyć do turnieju bez konta FIDE? – Tak, jeśli organizator na to pozwala."),
            Text("• Jak sprawdzić swój ranking? – Można dodać go ręcznie w profilu."),
            SizedBox(height: 24),

            Text("🌐 Przydatne linki", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8),
            InkWell(
              onTap: () {
                // Docelowo może otwierać stronę
              },
              child: Text(
                "→ Oficjalne zasady FIDE (pdf)",
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
