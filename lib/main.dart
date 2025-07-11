import 'package:flutter/material.dart';

void main() { // app entry point
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {     //main app widget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //this is to remove the debug banner
      title: 'Guest Residents Tracker',
      home: HomeScreen(), // application home screen
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EntryPage()),
                );
              },
              child: const Text('Entry'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExitPage()),
                );
              },
              child: const Text('Exit'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ManagePage()),
                );
              },
              child: const Text('Manage'),
            ),
          ],
        ),
      ),
    );
  }
}

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _flatController = TextEditingController();
  late String _timeIn;

  @override
  void initState() {
    super.initState();
    _timeIn = TimeOfDay.now().format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Entry')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
                controller: _contactController,
                decoration: const InputDecoration(labelText: 'Contact'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter contact' : null,
              ),
              TextFormField(
                controller: _flatController,
                decoration: const InputDecoration(labelText: 'Flat Number'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter flat number' : null,
              ),
              const SizedBox(height: 16),
              Row(children: [const Text('Time In: '), Text(_timeIn)]),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Entry Saved')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExitPage extends StatelessWidget {
  const ExitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exit')),
      body: const Center(child: Text('Exit Page')),
    );
  }
}

class ManagePage extends StatelessWidget {
  const ManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage')),
      body: const Center(child: Text('Manage Page')),
    );
  }
}
