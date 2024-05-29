import 'dart:convert';

import 'package:athang_expense_tracker/plugins/http.dart';

class SummaryRepo {
  Future<void> loadSummaryData() async {
    final res = await GetRequest('summary');
    print(jsonDecode(res.body));
  }
}
