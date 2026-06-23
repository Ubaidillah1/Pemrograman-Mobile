import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/basic_widget/text_widget.dart';
import 'package:flutter_application_1/basic_widget/image_widget.dart';
import 'package:flutter_application_1/basic_widget/dialog_widget.dart';

void main() {
  // Menjalankan dashboard gabungan agar semua widget tampil bersamaan di satu layar
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Praktikum 5',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CombinedDashboard(),
    );
  }
}

class CombinedDashboard extends StatefulWidget {
  const CombinedDashboard({Key? key}) : super(key: key);

  @override
  State<CombinedDashboard> createState() => _CombinedDashboardState();
}

class _CombinedDashboardState extends State<CombinedDashboard> {
  // State untuk Date Picker (Langkah 6)
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Widget Praktikum 5'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Langkah 1: Text Widget
            _buildSectionCard(
              title: 'Langkah 1: Text Widget',
              child: const MyTextWidget(),
            ),
            const SizedBox(height: 16),

            // Langkah 2: Image Widget
            _buildSectionCard(
              title: 'Langkah 2: Image Widget',
              child: SizedBox(height: 150, child: const MyImageWidget()),
            ),
            const SizedBox(height: 16),

            // Langkah 3: Cupertino Button & Loading Bar
            _buildSectionCard(
              title: 'Langkah 3: Cupertino Button & Loading Bar',
              child: Column(
                children: <Widget>[
                  CupertinoButton(
                    child: const Text("Contoh button"),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Cupertino Button Ditekan!'),
                        ),
                      );
                    },
                  ),
                  const CupertinoActivityIndicator(),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Langkah 4: Dialog Widget
            _buildSectionCard(
              title: 'Langkah 4: Dialog Widget',
              child: ElevatedButton(
                child: const Text('Show alert'),
                onPressed: () {
                  showAlertDialog(context);
                },
              ),
            ),
            const SizedBox(height: 16),

            // Langkah 5: Input & Selection Widget
            _buildSectionCard(
              title: 'Langkah 5: Input Widget (TextField)',
              child: const TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nama',
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Langkah 6: Date and Time Pickers
            _buildSectionCard(
              title: 'Langkah 6: Date and Time Pickers',
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: const Text('Pilih Tanggal'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      // Langkah 3: Floating Action Button (FAB)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Floating Action Button Ditekan!')),
          );
        },
        backgroundColor: Colors.pink,
        child: const Icon(Icons.thumb_up),
      ),
    );
  }

  // Helper untuk membuat card container per Langkah
  Widget _buildSectionCard({required String title, required Widget child}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const Divider(height: 20, thickness: 0.5),
            const SizedBox(height: 8),
            Center(child: child),
          ],
        ),
      ),
    );
  }
}
