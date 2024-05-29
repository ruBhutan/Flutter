import 'package:athang_expense_tracker/domain/landing/summary_repo.dart';
import 'package:flutter/material.dart';

class SummaryHome extends StatefulWidget {
  const SummaryHome({super.key});

  @override
  State<SummaryHome> createState() => _SummaryHomeState();
}

class _SummaryHomeState extends State<SummaryHome> {
  @override
  void initState(){
    loadData();
  }

  Future<void> loadData() async{
    SummaryRepo().loadSummaryData();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      // color:Colors.blueAccent,
      height:260,
      child: Stack(
        children: [
          Container(
            height:165,
            color: Colors.redAccent,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(16),
              // color: Colors.blue,
              margin: EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  Container(
                    // width: 200,
                    padding: EdgeInsets.all(8),
                    // height: 120,
                    // color: Colors.white,
                    margin: EdgeInsets.only(bottom: 16),
                    child: Column(
                      children: [
                        Text(
                          'Current Balance',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Nu. 34000',
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        // Container(color: Colors.red, height: 50),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(4),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_downward,
                                      size: 36,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Total Balance', style: TextStyle(
                                          fontSize: 16,
                                        ),),
                                        Text('Nu. 16,000', style: TextStyle(
                                          fontSize: 24,
                                        ),),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(4),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_downward,
                                      size: 36,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Total Balance', style: TextStyle(
                                          fontSize: 16,
                                        ),),
                                        Text('Nu. 16,000', style: TextStyle(
                                          fontSize: 24,
                                        ),),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
