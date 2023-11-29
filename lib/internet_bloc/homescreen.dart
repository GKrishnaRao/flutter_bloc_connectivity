import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'internet_bloc.dart';
import 'internet_state.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState> (  //BlocConsumer will be used for both listner(background) and ui update
            listener: (context, state) {
              if(state is InternetGainedState){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Internet Connected!"),
                  backgroundColor: Colors.green,)
                );
              }else if(state is InternetLostState){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Internet Not Connected!"),
                      backgroundColor: Colors.red,)
                );
              }
            },
            builder: (context, state) {
              if(state is InternetGainedState) {
                return const Text('Connected!');
              }else if(state is InternetLostState) {
                return const Text('Not Connected!');
              }else{
                return const Text('Loading...');
              }
            },
          )
          //BlocBuilder will be used for screen ui update. BlocListner will be used for background check. BlocConsumer will be used for both
          /*child: BlocBuilder<InternetBloc, InternetState>( // Given bloc then if any change then it will tell you.
              builder: (context, state) {
                // == to check value
                // is to check data type
                // int a = 2;
                // if(a is Int)
                if(state is InternetGainedState) {
                  return Text('Connected!');
                }else if(state is InternetLostState) {
                  return Text('Not Connected!');
                }else{
                  return Text('Loading...');
                }
              },
          )*/
        ),
      ),
    );
  }
}
