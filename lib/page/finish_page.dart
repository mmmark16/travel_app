import 'package:flutter/material.dart';

class FinishPage extends StatefulWidget {
  final List<bool> answer;
  final List<String> titles;

  const FinishPage({super.key, required this.answer, required this.titles});

  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Итоги"),
      ),
      body: Column(
        children: [
          Text("Ваши ответы:"),
          Container(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.titles.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Text(widget.titles[index]),
                                width: MediaQuery.of(context).size.width / 2,
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: Text(widget.answer[index] == true
                                      ? "Понравилось"
                                      : "Не понравилось"),
                                ),
                                width: MediaQuery.of(context).size.width / 2,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
