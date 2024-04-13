import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Destination {
  final int? id;
  final String name;
  final String address;
  final String detail;

  Destination({this.id, required this.name, required this.address, required this.detail});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'detail': detail,
    };
  }

  @override
  String toString() {
    return 'Destination{id: $id, name: $name, address: $address, detail: $detail}';
  }
}

class CrudPage extends StatefulWidget {
  const CrudPage({Key? key}) : super(key: key);

  @override
  _CrudPageState createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _addressController;
  late final TextEditingController _detailController;
  late Future<Database> _database;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _detailController = TextEditingController();
    _database = _initDatabase();
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'destinations_database.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE destinations(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, address TEXT, detail TEXT)',
        );
      },
    );
  }

  Future<void> _insertDestination(Destination destination) async {
    final db = await _database;
    await db.insert(
      'destinations',
      destination.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Destination>> _getDestinations() async {
    final db = await _database;
    final List<Map<String, dynamic>> maps = await db.query('destinations');
    return List.generate(maps.length, (i) {
      return Destination(
        id: maps[i]['id'],
        name: maps[i]['name'],
        address: maps[i]['address'],
        detail: maps[i]['detail'],
      );
    });
  }

  Future<void> _deleteDestination(int id) async {
    final db = await _database;
    await db.delete(
      'destinations',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pengajuan Destinasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nama Destinasi'),
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Alamat Destinasi'),
            ),
            TextField(
              controller: _detailController,
              decoration: const InputDecoration(labelText: 'Detail Destinasi'),
            ),
            ElevatedButton(
              onPressed: () {
                final newDestination = Destination(
                  name: _nameController.text,
                  address: _addressController.text,
                  detail: _detailController.text,
                );
                _insertDestination(newDestination);
                setState(() {
                  _nameController.clear();
                  _addressController.clear();
                  _detailController.clear();
                });
              },
              child: const Text('Tambah Destinasi'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Destination>>(
                future: _getDestinations(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final destinations = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: destinations.length,
                    itemBuilder: (context, index) {
                      final destination = destinations[index];
                      return Card(
                        child: ListTile(
                          title: Text(destination.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Alamat : ${destination.address}'),
                              Text('Detail : ${destination.detail}'),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  _nameController.text = destination.name;
                                  _addressController.text = destination.address;
                                  _detailController.text = destination.detail;
                                  // Tampilkan form pengajuan destinasi
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Edit Destinasi'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              controller: _nameController,
                                              decoration: const InputDecoration(labelText: 'Nama Destinasi'),
                                            ),
                                            TextField(
                                              controller: _addressController,
                                              decoration: const InputDecoration(labelText: 'Alamat Destinasi'),
                                            ),
                                            TextField(
                                              controller: _detailController,
                                              decoration: const InputDecoration(labelText: 'Detail Destinasi'),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              final updatedDestination = Destination(
                                                id: destination.id,
                                                name: _nameController.text,
                                                address: _addressController.text,
                                                detail: _detailController.text,
                                              );
                                              _insertDestination(updatedDestination);
                                              setState(() {
                                                _nameController.clear();
                                                _addressController.clear();
                                                _detailController.clear();
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Simpan'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  _deleteDestination(destination.id!);
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'CRUD SQLite',
    home: CrudPage(),
  ));
}
