import 'package:flutter/material.dart';

const users = ["admin", "benji"];

class GlorifiedCounter extends StatefulWidget {
  const GlorifiedCounter({super.key});

  @override
  State<StatefulWidget> createState() => _MyState();
}

class _MyState extends State<GlorifiedCounter> {
  int count = 0;
  String currentUser = users[0];

  void showErrorPopup(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void updateUser(String userName) {
    String? newUser = users.where((element) => element == userName).firstOrNull;
    if (newUser != null) {
      setState(() {
        currentUser = newUser;
        count = 0;
      });
    } else {
      showErrorPopup("User $userName not found!");
    }
  }

  void incrementCount() {
    if (currentUser != "admin" && count >= 5) {
      showErrorPopup(
          "You are not allowed to increment the count more than 5, $currentUser!");
      return;
    }
    setState(() {
      count++;
    });
  }

  void decrementCount() {
    if (currentUser != "admin" && count <= 0) {
      showErrorPopup(
          "You are not allowed to decrement the count less than 0, $currentUser!");
      return;
    }
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Glorified Counter'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 300,
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: currentUser,
                items: users
                    .map(
                      (user) =>
                          DropdownMenuItem(value: user, child: Text(user)),
                    )
                    .toList(),
                onChanged: (value) {
                  updateUser(value!);
                },
              ),
              const SizedBox(height: 30,),
              Text(
                'Count: $count',
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: const Icon(Icons.add), onPressed: incrementCount),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: decrementCount,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
