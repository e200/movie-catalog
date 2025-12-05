import 'package:flutter/material.dart';

class AddMoviePage extends StatelessWidget {
  const AddMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: Text('Add Movie')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {}
        },
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'invalid';
                }
              },
            ),
            // Drop,
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
