## Giới thiệu
  Kiểu dữ liệu là một nội dung quan trọng trong mọi ngôn ngữ lập trình nói chung và C++ nói riêng, nhờ vào kiểu dữ liệu mà ngôn ngữ lập trình định nghĩa sẵn, sẽ ảnh hưởng đến những phạm vi, lĩnh vực của ngôn ngữ lập trình được áp dụng.
  
  Trong bài học này, chúng ta sẽ cùng nhau tìm hiểu về những kiểu dữ liệu có sẵn trong C++, cũng như sẽ giới thiệu sơ bộ về cách khai báo biến.
  
## Khái niệm chung
  Trong khoa học máy tính và lập trình máy tính, một kiểu dữ liệu là một cách phân loại dữ liệu cho trình biên dịch và thông dịch hiểu lập trình viên muốn sử dụng dữ liệu gì.  

  Trong C++, kiểu dữ liệu là một thành phần bắt buộc phải có khi khai báo biến, nó giúp chương trình xác định kích cỡ vùng nhớ mà bạn muốn xin hệ điều hành cấp phát trên RAM, đồng thời giúp chương trình xác định giới hạn mà biến đó sẽ lưu trữ.  

  Đến với C++, có rất nhiều kiểu dữ liệu khác nhau, chúng ta cùng tham khảo bảng bên dưới:  

![Sơ đồ hoạt động](resources:assets/data/posts/cpp_beginner/kdl_image1.png)

Mình xin phép được giải thích đơn giản thế này, trong C++ người ta chia kiểu dữ liệu thành 4 loại cơ bản:  
- Kiểu logic(boolean): **bool**, đây là kiểu mà biến được khai báo chỉ chứa giá trị true hoặc false.  
- Kiểu kí tự(character): **char, unsigned char, signed char**. Đây là kiểu dữ liệu mà chúng ta dùng để định nghĩa các chữ cái, kí tự. Hiện tại các bạn chỉ cần quan tâm đến kiểu char, còn những kiểu dữ liệu như unsigned char, signed char trong chương trình học chúng ta thường rất ít dùng đến. Ví dụ: ‘s’, ‘a’, ‘g’, ‘n’,…
- Kiểu số nguyên(integer): **int, unsigned int, signed int, short int, long int**. Đây là những kiểu dữ liệu chúng ta dùng để định nghĩa số nguyên,  trong đó kiểu int là kiểu mà chúng ta thường dùng nhất. Ví dụ: 1,2,3,-2,-100,..
- Kiểu số thực(floating point): **float, double, long double.** Đây là kiểu dữ liệu dùng để định nghĩa số thực, tức những số có phần thập phân theo sau, trong đó kiểu float và double sẽ được dùng thường xuyên. Ví dụ: 1.23, 4.5, 9.0,…

Tùy vào từng phiên bản hệ điều hành và compiler thì dung lượng mà kiểu dữ liệu chiếm dụng sẽ khác nhau, tuy nhiên việc kiểu dữ liệu chiếm bao nhiêu byte trong chương trình thì các bạn vừa bắt đầu học lập trình không cần quá để tâm, chỉ những chương trình lớn thì vấn đề này mới trở nên quan trọng.   

Để hiểu rõ hơn về bản chất, chúng ta sẽ cùng trả lời những câu hỏi thú vị bên dưới nhé:   

_**Vậy vấn đề đặt ra là tại sao phải định nghĩa cho nhiều loại dữ liệu, rồi trong những loại đó lại phải chia nhỏ thêm những kiểu khác nhau nữa, điều này chẳng phải chỉ tạo nên rắc rối cho người lập trình viên thôi sao?**_

Câu trả lời là đúng như thế, việc có nhiều kiểu dữ liệu sẽ tạo sự băn khoăn nhất định cho mỗi lập trình viên khi lập trình.   

---

_**Vậy tại sao ta không loại bỏ nó đi?**_
  
Câu trả lời là không nên, ở đây chúng ta không nói đến những ngôn ngữ lập trình bậc cao hơn C++ như **Python, Javascript,**.. Bên cạnh khó khăn khi lựa chọn kiểu dữ liệu, thì cái lợi mà mỗi kiểu dữ liệu mang lại là rất lớn. Các bạn có thể để ý một tí, kiểu dữ liệu chiếm dụng càng nhiều bộ nhớ thì phạm vi mà nó chứa giá trị sẽ càng lớn, và điều đó sẽ giảm thiểu tối đa những lỗi về tràn bộ nhớ.  

---

_**Vậy khi mình lập trình, mình sẽ sử dụng kiểu dữ liệu có kích thước lớn nhất là ổn đúng không?**_
  
Câu trả lời là không hẳn như thế, trong chương trình học lập trình ở mức cơ bản, thì việc lựa chọn đúng loại dữ liệu như số nguyên hay số thực để chạy được chương trình là đạt yêu cầu chứ không quá khắt khe về bộ nhớ, tuy nhiên, khi chúng ta bắt đầu lập trình những phần mềm thực sự, như cho di động chẳng hạn, thì vấn đề bộ nhớ luôn được đề cao vì những thiết bị này không có bộ nhớ quá lớn để chứa.  

Ví dụ thế này, bạn cần lưu một giá trị mà giá trị đó chỉ cần 2 byte bộ nhớ là lưu trữ thỏa mái, nhưng bạn dùng đến tận 4 byte để lưu trữ , như vậy một chương trình của ta có 2Gb, thì sẽ thành 4Gb, tốn kém gấp đôi, mà chi phi tốn kém đó hoàn toàn không có tác dụng gì.  

---

→ Việc hiểu đúng bản chất của loại dữ liệu cần thao tác và sử dụng đúng kiểu dữ liệu sẽ không chỉ giúp chương trình của bạn chạy đúng mà còn tiết kiệm được tài nguyên trong việc tạo ra các sản phẩm phần mềm.  

## Cú pháp
Trước khi đi vào nội dung chính, chúng ta sẽ đến một khái niệm mới đó là biến, vậy biến là gì? Nói đơn giản, biến là một vùng nhớ được hệ điều hành cấp phát khi có yêu cầu từ trình biên dịch hoặc thông dịch, dùng để lưu trữ tạm thời các giá trị trong chương trình mà chúng ta cần, nhờ vào biến mà chúng ta có thể tái sử dụng các giá trị đó nhiều lần.   

Chúng ta sẽ tìm hiểu sâu hơn về biến thông qua bài “Biến trong C++” các bạn nha!   

Về cú pháp khai báo biến trong C++:  
```
<kiểu dữ liệu> <tên biến> = <giá trị khởi tạo ban đầu>;
```
Trong đó <**giá trị khởi tạo ban đầu**> có thể không cần khi khai báo biến.   

## Hướng dẫn sử dụng:
 
_**VD1:**_ Bạn cần khởi tạo một biến ‘x’, có kiểu int và không có giá trị ban đầu:   
```
int x;
```
_**VD2:**_ Bạn cần khai báo biến tên là ‘tuoi’, có gì trị ban đầu là 18 với kiểu int:   
```
int tuoi = 18;
```
_**VD3:**_ Bạn cần khai báo biến ‘can_nang’, có giá trị 45.5 với kiểu float:  
```
float can_nang = 45.5;
```
_**VD4:**_ Bạn cần khai báo biến ‘ki_tu’, có giá trị là ‘s’ kiểu char : 
```
char ki_tu = ‘s’;  
```

Tuy nhiên, các bạn sẽ được tìm hiểu sâu hơn về loại dữ liệu Kí tự trong bài sau, vì loại kí tự đòi hỏi nhiều kĩ thuật xử lí cũng như kiến thức nền chắc thì mới hạn chế được lỗi kĩ thuật trong quá trình sử dụng, nên hẹn các bạn trong bài Kiểu kí tự để chúng ta tìm hiểu kĩ hơn nhé!

## Bài tập ví dụ:
Để cho các bạn có cái nhìn cụ thể hơn, chúng ta sẽ cùng làm các bài tập nhỏ sau đây.  

_**Bài 1:**_ Chủ nhiệm CLB ITMC năm nay 21 tuổi, người yêu của chủ nhiệm CLB ITMC năm nay 30 tuổi, viết chương trình tính và in ra tổng tuổi của hai người.  

Khi vừa nhìn vào yêu cầu bài toán là tính theo tuổi, do đó giá trị nhận được của chúng ta luôn là số nguyên, chứ không thể là số thực hay logic, chúng ta hoàn toàn có thể chọn kiểu short int, int hoặc long int, tuy nhiên trong chương trình học, kiểu int là kiểu mà chúng ta hay dùng nhất, nên trong trường hợp này mình vẫn sẽ dùng kiểu int.
```
#include <iostream>
using namespace std;

int main
{
    int tuoiChuNhiem = 21;
    int tuoiNguoiYeu = 30;
    int tongTuoi = tuoiChuNhiem + tuoiNguoiYeu; // 21+30=51
    cout << "Tong tuoi 2 nguoi la: " << tongTuoi << endl;
    return 0;
}
```
_**Bài 2:**_ Cân nặng của chủ nhiệm CLB ITMC là 55,5kg, cân nặng người yêu của chủ nhiệm CLB ITMC là 80kg, viết chương trình tính và in ra tổng cân nặng của hai người.  

Khi nhắc đến cân nặng, thì bên cạnh phần số nguyên, chúng ta vẫn còn phần thập phân, do đó loại dữ liệu mà ta chọn ở đây chỉ có thể là số thực, không thể là số nguyên hay kiểu khác được, và kiểu số thực mình chọn là float, vì phạm vi kiểu float là khá lớn và hoàn toàn dư khả năng để chứa giá trị của cân nặng con người.
```
#include <iostream>
using namespace std;

int main
{
    int canNangChuNhiem = 21;
    int canNangNguoiYeu = 30;
    int tongCan = canNangChuNhiem + canNangNguoiYeu; // 21+30=51
    cout << "Tong can nang 2 nguoi la: " << tongCan << endl;
    return 0;
}
```
Từ hai ví dụ trên các bạn hãy cùng nhau thiết kế lại chương trình, có thể cho người dùng nhập tuổi hoặc cân nặng từ bàn phím rồi in ra tổng tuổi (tổng cân nặng) từ giá trị nhập vào xem nào!  

## Lưu ý
Các bạn cần lưu ý trong vấn đề chọn đúng kiểu dữ liệu, nhầm tránh những lỗi khiến chương trình chúng ta chạy sai. Do chúng ta không có bất kì công thức nào cả, nên việc chọn kiểu dữ liệu phụ thuộc vào kinh nghiệm và sự cẩn thận của các bạn, nhưng có một vài mẹo nhỏ sau khi chọn kiểu dữ liệu:  
- Khi chương trình yêu cầu chúng ta tính tuổi, số lượng, tính theo cái,… thì chúng ta nên dùng kiểu số nguyên. Kiểu số nguyên mà chúng ta thường dùng nhất là **int**.
- Khi chương trình yêu cầu chúng ta tính nhiệt độ, cân nặng, chiều cao, tính điểm, tính giá trị trung bình,.. thì khi đó chúng ta sẽ dùng kiểu số thực. Kiểu số thực chúng ta thường dùng nhất là **float** và **double**.
- Khi chương trình yêu cầu chúng ta lưu trữ họ tên, lớp, nơi ở,… thì chắc chắn chúng ta sẽ sử dụng kiểu mảng kí tự hoặc chuỗi(sẽ được đề cập ở những bài học sau).
- Khi chương trình hỏi đến tính đúng sai, chúng ta hãy cân nhắc đến việc sử dụng kiểu dữ liệu logic.

***Hết***


