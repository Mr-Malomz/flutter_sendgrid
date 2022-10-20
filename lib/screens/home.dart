import 'package:flutter/material.dart';
import 'package:flutter_sendgrid/user_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  bool _isLoading = false;

  _updateUser() {
    _isLoading = true;
    UserService().updateUser(_name.text).then((value) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User Updated successfully!')),
      );
    }).catchError((_) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error updating User!')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Sengrid"),
        backgroundColor: const Color(0xff1C4ED8),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      TextFormField(
                        controller: _name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please input your name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          hintText: "input name",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: TextButton(
                  onPressed: _isLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            _updateUser();
                          }
                        },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff1C4ED8)),
                  ),
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
