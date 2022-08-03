import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

void navigateToCalculate(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (BuildContext context) {
      return MyApp();
    }),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BlocProvider(
          create: (context) => CounterCubit(),
          child: MyHomePage(
            title: "test",
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  get mycontroller => null;

  void _incrementCounter() {
    setState(() {
      count++;
    });
  }

  late CounterCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<CounterCubit>(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter by Lash"),
      ),
      body: BlocConsumer<CounterCubit, int>(
        // Consumerrrrrrrrr
        bloc: cubit,
        listener: (context, state) {
          const snackbar = SnackBar(content: Text("State is reached"));

          if (state == 5) {
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: mycontroller,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    labelText: 'Enter Number',
                    hintText: 'Enter Your Number',
                  ),
                ),
                Text(
                  "$state",
                  style: TextStyle(fontSize: 100),
                ),
                ElevatedButton(
                  onPressed: () {
                    cubit.increment();
                  },
                  child: const Text("Increment"),
                ),
                ElevatedButton(
                  onPressed: () {
                    cubit.decrement();
                  },
                  child: const Text("Decrement"),
                ),
                ElevatedButton(
                    onPressed: () {
                      cubit.reset();
                    },
                    child: const Text("Reset")),
                ElevatedButton(
                  onPressed: () {
                    cubit.divide();
                  },
                  child: const Text("divide"),
                ),
                ElevatedButton(
                  onPressed: () {
                    cubit.multiply();
                  },
                  child: const Text("multiply"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
