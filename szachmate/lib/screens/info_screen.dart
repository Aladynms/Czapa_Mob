import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  Widget sectionCard({required String title, required List<Widget> content}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF262522),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black45.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 4), // cień tylko od dołu
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          ...content,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF302E2B),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            sectionCard(
              title: "♟️ Podstawowe zasady szachów",
              content: [
                Text(
                  "Szachy to gra strategiczna rozgrywana na planszy 8x8 pól. "
                  "Każdy gracz ma 16 figur: króla, hetmana, 2 gońce, 2 skoczki, 2 wieże i 8 pionków. "
                  "Celem gry jest danie mata królowi przeciwnika.",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            sectionCard(
              title: "🧩 Systemy turniejowe",
              content: [
                Text("• System szwajcarski – gracze grają w każdej rundzie z przeciwnikiem o podobnym wyniku.",
                    style: TextStyle(color: Colors.white)),
                Text("• System kołowy – każdy gra z każdym (idealne przy małej liczbie uczestników).",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
            sectionCard(
              title: "❓ Najczęstsze pytania (FAQ)",
              content: [
                Text("• Czy mogę dołączyć do turnieju bez konta FIDE? – Tak, jeśli organizator na to pozwala.",
                    style: TextStyle(color: Colors.white)),
                Text("• Jak sprawdzić swój ranking? – Można dodać go ręcznie w profilu.",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
            sectionCard(
              title: "🌐 Przydatne linki",
              content: [
                InkWell(
                  onTap: () {
                    // TODO: otwórz link do zasad FIDE
                  },
                  child: Text(
                    "→ Oficjalne zasady FIDE (pdf)",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
