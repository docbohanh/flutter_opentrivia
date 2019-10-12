import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:opentrivia/models/category.dart';
import 'package:opentrivia/models/question.dart';

const String baseUrl = "https://opentdb.com/api.php";

Future<List<Question>> getQuestions(Category category, int total, String difficulty) async {
  String url = "$baseUrl?amount=$total&category=${category.id}";
  if(difficulty != null) {
    url = "$url&difficulty=$difficulty";
  }

  print("fetch url $url");
  http.Response res = await http.get(url);

  List<Map<String, dynamic>> questions = List<Map<String,dynamic>>.from(json.decode(res.body)["results"]);

  const mockData = "[{\"category\": \"Entertainment: Books\",\"type\": \"multiple\",\"difficulty\": \"easy\",\"question\": \"Theo quy chế QTRRDN của VNPT, Quản trị rủi ro là trách nhiệm của ai?\",\"correct_answer\": \"Của tất cả cán bộ nhân viên trong doanh nghiệp.\",\"incorrect_answers\": [  \"Hội đồng quản trị/Hội đồng thành viên.\",  \"Ban Tổng giám đốc.\",  \"Kiểm toán nội bộ.\",  \"Của Đối tác doanh nghiệp\"]},{\"category\": \"Entertainment: Books\",\"type\": \"multiple\",\"difficulty\": \"easy\",\"question\": \"Thước đo rủi ro được hình thành dựa trên cơ sở các yếu tố cần phân tích của một rủi ro. Vì vậy, để đánh gíá mức độ của một rủi ro, rủi ro đó cần được phân tích thông qua việc xem xét yếu tố nào?\",\"correct_answer\": \"Mức độ ảnh hưởng (cả về mặt Tài chính và Phi tài chính) và Khả năng xảy ra (Tần suất trong quá khứ và dự báo xác suất xảy ra trong tương lai).\",\"incorrect_answers\": [  \"Phạm vi ảnh hưởng của rủi ro trong Tập đoàn và Khả năng xảy ra (Tần suất trong quá khứ và dự báo xác suất xảy ra trong tương lai)\",  \"Mức độ ảnh hưởng (chỉ về mặt Tài chính) và Phạm vi ảnh hưởng của rủi ro đó trong Tập đoàn/đơn vị.\",  \"Mức độ ảnh hưởng (cả về mặt Tài chính và Phi tài chính) và Mức độ quan tâm của Ban Lãnh đạo quyết định.\"]},{\"category\": \"Entertainment: Books\",\"type\": \"boolean\",\"difficulty\": \"easy\",\"question\": \"Hệ thống đào tạo trực tuyến (eLearning) của Tập đoàn có thể được truy cập từ hệ thống quản trị nguồn nhân lực (HRM):\",\"correct_answer\": \"Đúng\",\"incorrect_answers\": [  \"Sai\"]},{\"category\": \"Entertainment: Books\",\"type\": \"multiple\",\"difficulty\": \"easy\",\"question\": \"\u{02BA}Chức năng quản trị rủi ro\u{02BA} là một nhóm chuyên trách được xây dựng ở các Đơn vị (Các tổng công ty và ở Tập đoàn) . \u{02BA}Chức năng Quản trị rủi ro\u{02BA} có vai trò nào sau đây:\",\"correct_answer\": \"Giám sát, tham vấn các hoạt động Quản trị rủi ro và Hồ sơ rủi ro của Đơn vị.\",\"incorrect_answers\": [  \"Thực hiện các hoạt động Quản trị rủi ro và xây dựng Hồ sơ rủi ro của Đơn vị.\",  \"Phê duyệt và chịu trách nhiệm cho các hoạt động Quản trị rủi ro và Hồ sơ rủi ro của đơn vị.\",  \"Được báo cáo về thông tin của các rủi ro để đưa ra các phương án kiểm soát/kế hoạch hành động.\"]},{\"category\": \"Entertainment: Books\",\"type\": \"multiple\",\"difficulty\": \"easy\",\"question\": \"Các yếu tố nào sau đây VNPT cần phải xây dựng chiến lược phù hợp\",\"correct_answer\": \"Tất cả các đáp án\",\"incorrect_answers\": [  \"Sự thay đổi mô hình tổ chức\",  \"Sự thay đổi nhanh chóng của môi trường vĩ mô, kinh doanh viễn thông và dịch vụ Số.\",  \"Cuộc cách mạng công nghiệp lần thứ 4\"]}]";
  questions = List<Map<String,dynamic>>.from(json.decode(mockData));

  print("questions: $questions");
  var q = Question.fromData(questions);
  q.shuffle();
  var debug = q.map((t) => t.description());
  print("response: $debug");
  return q;
}