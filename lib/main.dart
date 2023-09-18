import 'package:counterapp/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeData dark = ThemeData.dark();
  final ThemeData light = ThemeData.light();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: (state.themeChanged)?dark:light, 
            home: const MyHomePage(title: 'Flutter Bloc'),
          );
        },
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: BlocListener<CounterCubit, CounterState>(
//         listener: (context, state) {
//           if(state.wasIncremented == true){
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('incremented',),
//             duration: Duration(seconds: 1),
//             ));
//           }
//           else if(state.wasDecremented == true){
//            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('decremented',),
//             duration: Duration(seconds: 1), ));
//           }
//           // TODO: implement listener
//         },
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 'You have pushed the button this many times:',
//               ),
//               BlocBuilder<CounterCubit, CounterState>(
//                 builder: (context, state) {
//                   return Text(
//                     state.counterValue.toString(),
//                     style: Theme.of(context).textTheme.headlineMedium,
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: BlocProvider.of<CounterCubit>(context).increment,
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           FloatingActionButton(
//             onPressed: BlocProvider.of<CounterCubit>(context).decrement,
//             tooltip: 'Decrement',
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }

// blocconsumer

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>( 
              listener: (context, state) {
                // TODO: implement listener
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'incremented',
                    ),
                    duration: Duration(seconds: 1),
                  ));
                } else if (state.wasDecremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'decremented',
                    ),
                    duration: Duration(seconds: 1),
                  ));
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: BlocProvider.of<CounterCubit>(context).increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: BlocProvider.of<CounterCubit>(context).decrement,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
