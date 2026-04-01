import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  final String token;

  const DashboardScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ICEBANK', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: () => Navigator.pop(context)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carte du Solde
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Colors.blueAccent, Colors.lightBlueAccent]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Solde Total', style: TextStyle(color: Colors.white70, fontSize: 16)),
                  const SizedBox(height: 10),
                  const Text('12 450,00 €', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text('Mes Cryptos', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            // Liste fictive de cryptos (on les rendra dynamiques après)
            _cryptoTile('Bitcoin', 'BTC', '0.45', '28 400 €', Icons.currency_bitcoin),
            _cryptoTile('Ethereum', 'ETH', '1.2', '2 150 €', Icons.euro),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Ouvrir le chat avec l'IA
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.chat_bubble, color: Colors.black),
      ),
    );
  }

  Widget _cryptoTile(String name, String symbol, String amount, String price, IconData icon) {
    return Card(
      color: Colors.white10,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Colors.blueGrey, child: Icon(icon, color: Colors.white)),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$amount $symbol'),
        trailing: Text(price, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.lightBlueAccent)),
      ),
    );
  }
}