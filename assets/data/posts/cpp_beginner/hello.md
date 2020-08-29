# **Cấu trúc cơ bản của 1 chương trình C++**
## Giới thiệu
Chắc hẳn các bạn ai cũng từng viết cho mình một chương trình Hello World huyền thoại rồi đúng không? Vậy có khi nào bạn thắc mắc về chính chương trình đó chưa? Tại sao lại là `int main()`? Sao phải có `#include` …
Các bạn xem chương trình ví dụ dưới đây nhé!
```
#include <iostream>
using namespace std;
int main()
{
    cout <<  “ hello world “ << endl;
    return 0;
}
```
**Một chương trình C++ cơ bản sẽ gồm 3 thành phần sau:**
* Các câu lệnh và biểu thức (Statements and expressions).
* Hàm (Functions).
* Thư viện chuẩn C++.

## **Câu lệnh và biểu thức (Statements and expessions)**
* Các câu lệnh và biểu thức là thành phần nhỏ nhất để cấu thành lên một chương trình.
* Một chương trình có thể gồm rất nhiều câu lệnh nhưng cũng có thể không có câu lệnh nào (phần này mình sẽ nói sau).
* Mỗi một câu lệnh sẽ yêu cầu chương trình thực hiện một nhiệm vụ nhất định.
* Câu lệnh phải kết thúc bằng **dấu chấm phẩy**.

Ví dụ trên, ta thấy `cout <<  “Hello World” << endl;` là 1 câu lệnh dùng để in “Hello World” ra màn hình. 
C++ có 1 cách nhập xuất khá là hay so với C đó là dung câu lệnh *cin/cout* với toán tử << / >>. Tại sao mình lại nói các dung *cin/cout* lại tốt hơn so với dùng *print/scan* trong C? Khi dung *cin/cout* thì chúng ta không cần khai báo **format string** cho biến chúng ta nhập/xuất. Đối với việc nhập 1 vài biến thì việc khai báo **format string** cho biến chúng ta dùng mất không quá nhiều thời gian. Nhưng nếu chương trình yêu cầu dùng nhiều biến 1 lúc thì việc khai báo **format string** tỏ ra là mất khá nhiều thời gian. Việc dùng toán tử >> và << có thể gây nhiều nhầm lẫn cho một số bạn khi mới bắt đầu. Mình thường dùng cách này sau đây để phân biệt 2 toán tử này và cảm thấy nó khá tường minh so với cách nhập xuất truyền thống trong C:
* `>> a` Nếu dùng toán tử >> thì hướng mũi tên sẽ trỏ về biến a. Có nghĩa là dữ liệu sẽ đi vào biến a.Mà nếu dữ liệu đi vào biến a thì tương đương với việc nhập dữ liệu cho biến a. Đó chính là câu lệnh *cin* >> a dành cho việc nhập dữ liệu
* `<< a` Nếu dùng toán << thì hướng mũi tên sẽ từ biến a đi ra. Nó tương tự với việc dữ liệu từ a sẽ chạy ra ngoài, khá giống với ý nghĩa của lệnh in giá trị a ra màn hình. Và toán tử << dùng trong câu lệnh *cout* << a để in giá trị biến a ra màn hình.

Trong C++ có 2 cách để xuống dòng đó là dùng đối tượng *endl* và kí tự xuống dòng *\n*. Chúng ta cần phân biệt được *endl* là một đối tượng và nó cần được khái báo phạm vi sử dụng(mình sẽ nói sau về cái này) và *\n* là 1 kí tự tương tự như ‘a’ hay ‘&’. Cả 2 đều xuống dòng và đặt con trỏ ở dòng tiếp theo. Vậy sự khác biệt là gì? Theo mình tìm hiểu thì sự khác biệt chưa rõ ràng và có thể biết như sau:

Sử dụng đối tượng *endl* sẽ làm sạch luôn stream, trong khi đó, sử dụng kí tự * \n* chỉ đơn giản là đưa kí tự xuống dòng lên màn hình.

Sử dụng *endl* khi bạn cần đảm bảo cho ra kết quả ngay lập tức, cụ thể khi làm việc trên các thiết bị đầu ra chậm.

Sử dụng  *\n* cho các trường hợp còn lại.

Tuy nhiên, có một vấn đề đó là chúng ta không thể tuỳ tiện sử dụng các hàm, câu lệnh hay đối tượng trên 1 cách tuỳ tiện không có khai báo. Chúng được nằm trong các thư viện và cần khai báo khi sử dụng.

Câu lệnh *return 0;* sẽ trả về kết quả 0 cho hàm *main*. Vậy, tại sao lại *return 0*, *return 1* được không, không return được không? Mình xin trả lời luôn. Các quy định chung của nhiều lập trình viên là 0 và 1 sẽ hiển thị cho có hoặc không. Ở đây, một số quy chuẩn quy định return 0 có nghĩa là chương trình không có lỗi. Các này bạn tự định nghĩa cho bản thân được nhưng khi làm việc trong 1 team thì phải theo quy chuẩn chung của team. Hay nói cách khác, kết của hàm *main* chính là trạng thái của chương trình. Tuỳ vào mỗi người mỗi nhóm mà trạng thái này được định nghĩa khác nhau. Vậy thì, return 100 cũng được chứ. Thường thì là return 0 cho trạng thái chương trình đúng. Còn về vấn đề không return thì có được không? Có, nếu như hàm *main* là một hàm *void*. Cách dùng *void* cho hàm *main* khá tiềm ẩn nhiều rủi ro nên mình không khuyên các bạn dùng cách này.
Và, luôn nhớ rằng, kết thúc một câu lệnh luôn là *dấu chấm phẩy ( ; )*. 

## Hàm (Functions)
Hàm là một nhóm các câu lệnh đi cùng nhau, để thực hiện một nhiệm vụ. Mỗi chương trình C++ có ít nhất một hàm là hàm *main()*.
Bạn có thể chia mã của bạn thành các hàm riêng biệt. Cách bạn phân chia mã của bạn giữa các hàm khác nhau tùy thuộc vào bạn, nhưng về mặt logic mỗi hàm thực hiện một tác vụ cụ thể.
Dạng chung của định nghĩa hàm trong C++ như sau:
```
return_type function_name(parameter list) { 
    // code 
}
```

Định nghĩa hàm trong lập trình C++ bao gồm tên hàm và phần thân hàm . Dưới đây là tất cả các phần của hàm:
* **Kiểu trả về:** Một hàm có thể trả về một giá trị. Các **return_type** là kiểu dữ liệu của giá trị hàm trả về. Một số hàm thực hiện các hoạt động mong muốn mà không trả về một giá trị. Trong trường hợp này, return_type là từ khóa **void**.
**Tên hàm:** Đây là tên thực của hàm.
* **Tham số:** Một tham số giống như một trình giữ chỗ. Khi một hàm được gọi, bạn chuyển một giá trị cho tham số. Giá trị này được gọi là tham số hoặc đối số thực tế. Danh sách tham số tham chiếu đến loại, thứ tự và số tham số của hàm. Các tham số là tùy chọn; có nghĩa là, một hàm có thể không chứa tham số.
* **Thân hàm:** Phần thân hàm chứa một tập hợp các câu lệnh xác định chức năng của hàm.

Vậy ta thấy, hàm main thường có kiểu trả về là int, không có tham số và thân hàm chính là phần chính của chương trình.

Vậy, khi dùng hàm thì chúng ta nên lưu ý những gì? Hàm đó dùng để làm gì? Kiểu trả về là gì? Hàm có tham số hay không? Và, hàm đó có sẵn hay không?

Nếu bạn cần kiểm tra số nguyên tố thì với 1 số, bạn có thể không cần viết hàm con, nhưng với việc kiểm tra từ 2 số trở lên, việc dùng hàm con trở nên ưu việt hơn hẳn. Đó là do lợi thế tái sử dụng mã và tối ưu mã hoá mà hàm mang lại.

Khi hàm đã hoàn thành công việc của nó, thì nó cần trả về kết quả làm việc của nó. Nếu muốn kiểm tra số đó có phải nguyên tố hay không, kết quả trả về là có hoặc không, như vậy ta dùng kiểu bool. Nếu hàm tính tổng các số nguyên, kết quả trả về là một số nguyên. Vậy, ở đây chúng ta cần lưu ý 1 chút, có rất nhiều kiểu dữ liệu biểu diễn kiểu nguyên như int hay long long… Vậy, tổng n số kiểu int có thể là kiểu int nhưng cũng có thể là kiểu long. Vậy nên, khi sử dụng hàm, bạn nên để ý kĩ vấn đề dữ liệu và kiểu trả về của hàm. Có thể lần test 1 là đúng nhưng lần test 2 sẽ sai. Như vậy, mục tiêu của hàm chính là kết quả trả về. Vậy thì, có cách nào mà hàm không trả về kiểu dữ liệu nào không? Câu trả lời là có. Đó chính là hàm void. Có những yêu cầu không cần trả về kết quả nhưng vẫn yêu cầu tái sử dụng và tối ưu mã. Khi đó, chúng ta sử dụng hàm void và mục tiêu của hàm chúng ta thực hiện trong lúc hàm void thực thi.

Hàm có cần có tham số truyền vào hay không? Đại đa số là có. Nhưng nhiều hàm thì không cần tham số truyền vào. Ví dụ như hàm tính tổng n số nguyên đầu tiên thì tham số truyền vào là số nguyên n. Nhưng khi chúng ta dùng hàm in ra dòng chữ *“Hello World”* thì không cần thiết. Việc chúng ta truyền tham số vào đó là xác định được tham số nào là cần thiết, tham số nào có thể bỏ qua. Cái này tuỳ vào mục đích sử dụng hàm ban đầu của chúng ta. 

Và, hàm chúng ta cần dùng có sẵn hay không? Nếu chưa có sẵn, chúng ta cần phải tự viết hàm đó cho mình. Nhưng đã có sẵn rồi thì việc gì chúng ta không sử dụng lại các hàm đó. Việc sử dụng lại các hàm có sẵn thực sự tiết kiệm cho chúng ta rất nhiều thời gian và công sức. Đa số các hàm có sẵn đều đã được tối ưu một cách tốt nhất rồi. Vậy thì, các hàm có sẵn đó nằm ở đâu? Đó chính là các thư viện.

## Thư viện chuẩn C++ (C++ Standard Library)
Thư viện là một tập hợp các mã được biên dịch sẵn, được đóng gói lại để lập trình viên sử dụng, mà không cần phải viết lại. Ví dụ: bạn viết một chương trình tính toán, bạn có thể *include* thư viện toán học…
Như vậy, *#include <iostream>* là để chúng ta sử dụng được các hàm và đối tượng trong thư viện *iostream*. 

Thư viện hàm chuẩn trong C++ được phân chia thành:
* I/O
* Xử lý chuỗi và ký tự
* Toán học
* Date, Time và vị trí
* Cấp phát động
* Hỗn hợp
* Các hàm cho wide-character

Có khá là nhiều thư viện chuẩn hữu ích khi sử dụng trong C++. Có thể kể để như *iostream*, *math*,* string*, *stack*, *queue*, *vector*… Tuỳ mỗi mục đích mà mỗi thư viện cung cấp cho chúng ta các hàm và đối tượng khác nhau.

Khi sử dụng các thư viện chuẩn thì chúng ta khá yên tâm là thư viện này đã được tối ưu về cả tốc độ và bộ nhớ. 

Như đã nói ở phía trên, các câu lệnh như *cin* *cout* hay đối tượng *endl* không thể sử dụng nếu nhưng không khai báo sử dụng thư viện *iostream*. Tuy vậy, nếu khai báo mỗi thư viện *iostream* thôi chưa đủ. Giả sử có các lệnh *cin* *cout* khác nằm ở thư viện khác thì sao? Vậy nên chúng ta cần 1 *namespace* để phân biệt các hàm, lớp, đối tượng… cùng tên ở các thư viện khác nhau. Chúng ta thường sử dụng chỉ thị *using namespace directive* để nói cho compiler rằng dãy code ở sau đang sử dụng các tên trong *namespace* đã xác định đó.

***Hết***

