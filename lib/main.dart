import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const RestoApp());
}

class RestoApp extends StatelessWidget {
  const RestoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Resto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const RestoProfilePage(),
    );
  }
}

class RestoProfilePage extends StatelessWidget {
  const RestoProfilePage({super.key});

  static const String restoName = 'Rm. Sedap Rasa';
  static const String description =
      'Rm. Sedap Rasa menyajikan aneka mie ayam dan masakan nusantara dengan cita rasa autentik. '
      'Bahan segar, porsi melimpah, dan harga bersahabat cocok untuk keluarga maupun komunitas.';

  static const List<String> menuItems = <String>[
    'Mie Ayam Spesial',
    'Mie Ayam Bakso',
    'Mie Ayam Ceker',
    'Bakso Urat',
    'Es Teh Manis',
  ];

  static const String address = 'Jl. Contoh No.123, Semarang';

  static const List<String> openingHours = <String>[
    'Senin - Jumat: 08.00 - 22.00',
    'Sabtu - Minggu: 09.00 - 23.00',
  ];

  Future<void> _launch(Uri uri) async {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Gagal membuka: $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Resto'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama resto
              Text(
                restoName,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),

              // Gambar profil
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/profile.png',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      alignment: Alignment.center,
                      child: const Text('Gambar tidak ditemukan'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),

              // Ikon kontak
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    tooltip: 'Email',
                    icon: const Icon(Icons.email),
                    onPressed: () {
                      final uri = Uri(
                        scheme: 'mailto',
                        path: 'info@sedaprasa.id',
                        query: 'subject=Reservasi%20Meja&body=Halo%20Rm.%20Sedap%20Rasa',
                      );
                      _launch(uri);
                    },
                  ),
                  IconButton(
                    tooltip: 'Lokasi',
                    icon: const Icon(Icons.map),
                    onPressed: () {
                      final uri = Uri.parse(
                        'https://www.google.com/maps/search/?api=1&query=Jl.+Contoh+No.123,+Semarang',
                      );
                      _launch(uri);
                    },
                  ),
                  IconButton(
                    tooltip: 'Telepon',
                    icon: const Icon(Icons.phone),
                    onPressed: () {
                      final uri = Uri(scheme: 'tel', path: '+622112345678');
                      _launch(uri);
                    },
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Deskripsi
              Text(
                'Deskripsi:',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                textAlign: TextAlign.justify,
              ),

              const SizedBox(height: 16),

              // List Menu
              Text(
                'List Menu:',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final item in menuItems)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• '),
                          Expanded(child: Text(item)),
                        ],
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 16),

              // Alamat
              Text(
                'Alamat:',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 4),
              Text(address),

              const SizedBox(height: 16),

              // Jam Buka
              Text(
                'Jam Buka:',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final oh in openingHours)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(oh),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
