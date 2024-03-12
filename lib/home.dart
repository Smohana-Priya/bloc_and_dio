// ignore_for_file: prefer_const_constructors

import 'package:bloc_and_dio/bloc/user_bloc.dart';
import 'package:bloc_and_dio/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<UserBloc>().add(LoadUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return CircularProgressIndicator();
            } else if (state is UserSuccessState) {
              List<UserModel> data = state.users;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (ctx, i) {
                      final item = data[i];
                      return Card(
                        color: const Color.fromARGB(255, 218, 237, 196),
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(item.avatar!)),
                          title: Text(
                            item.firstName!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(item.email!),
                        ),
                      );
                    }),
              );
            } else if (state is UserFailureState) {
              return Center(
                child: Text(state.toString()),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
