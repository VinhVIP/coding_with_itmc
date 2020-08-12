## Giới thiệu
Như các bạn đã biết một từ, một câu, một đoạn văn, … đều được cấu thành bởi các ký tự có một trật tự nhất định, hầu hết các ngôn ngữ đều có cách biểu diễn và xử lý dữ liệu như trên. C\C++ cho hai định nghĩa đó là **ký tự (character)** và **chuỗi (string)**.
### Khái niệm chung

 - Ký Tự trong C\C++ được lưu trữ dưới kiểu dữ liệu là char, char trong C\C++ sẽ được dùng để lưu ký tự, các chữ cái.
 - Chuỗi thực sự là một mảng các ký tự được kết thúc bởi một ký tự null '\0'. Do đó, một chuỗi hoàn chỉnh chứa các ký tự, trong đó những kí tự trống phía sau là những ‘\0’, do đây là cách quy ước trong C/C++.

Tiếp theo bài viết về Kiểu dữ liệu, trong khuôn khổ bài này sẽ hướng tới các bạn tìm hiểu về về **char** và **c string** trong C và C++.
###  Nội Dung Chính
####  1. Char
Cú pháp:
```c++
char <tên biến>;
```
hoặc:
```c++
char <tên biến> = <giá trị khởi tạo>;
```
với:

 - `<tên biến>` : cũng như các kiểu dữ liệu khác, do người dùng đặt tên.
 - Nhưng đối với **char**, `<giá trị khởi tạo>` có thể là ký tự nằm giữa cặp dấu nháy đơn hoặc số (vị trí của ký tự đó trong bảng mã Ascii).

Ví dụ:
```c++
int  main() {
    // khởi tạo biến rồi gán giá trị sau  
    char  char_a;  
    char_a = 'a';  
  
    /*  
     * khởi tạo biến với giá trị khởi tạo  
     * là ký tự trong cặp dấu nháy đơn  
     */  
    char  char_b = 'b';  

    /*  
     * khởi tạo biến với giá trị khởi tạo  
     * là vị trí của ký tự đó trong bản mã  
     * Ascii  
     */
    char  char_c = 99;  
}
```

Dưới đây là bảng Ascii thường dùng trong C\C++![Ascii table](https://cdn.glitch.com/c16f71ef-e58b-4291-89f3-62975c2ebc7f/image3.png?v=1596808252850)

A:	Khoan, có gì đó sai sai ở đây bản Ascii có 256 ký tự mà?
B:	Đúng Ascii có 256 ký tự nhưng từ 0 đến 127 thường được dùng trong C\C++. 

Dưới đây là câu trả lời mà mình cho là hay nhất nè

![answer from StackOverFlow](https://cdn.glitch.com/c16f71ef-e58b-4291-89f3-62975c2ebc7f/image4.png?v=1596808258161)

Thực chất kiểu dữ liệu **char** trong C/C++ cũng là kiểu dữ liệu số(bảng mã Ascii) ta vẫn có thể sử dụng để tính toán như số nguyên int, nhưng thông thường nó sẽ không được dùng như vậy, vì sau này sẽ khó khăn trong việc đọc code, bảo trì và mở rộng.
####  2. C String

##### 2.1 : Char Array
Trước khi có lớp chuỗi (C++ style String), ý tưởng trừu tượng về một chuỗi được thực hiện chỉ với một mảng 		ký tự. Ví dụ, đây là một chuỗi:
```c++
char name[] = "Shane";
```
Mảng ký tự trên được biểu diễn trong bộ nhớ như sao:
```
--------------------------
| S | h | a | n | e | \0 |
--------------------------
```
Trong đó phần đầu của mảng nằm ở vị trí nào đó trong bộ nhớ máy tính, ví dụ: vị trí 1000.

> 	Note: ta cần phải đưa vào cuối mảng là ký tự \0 (NULL), ký tự này cho biết phần cuối của chuỗi

Một mảng ký tự có thể có nhiều ký tự hơn chuỗi trừu tượng được lưu như sao như sau:
```c++
char name[10] = "Shane";
```
đưa ra một mảng trông giống như:
```
--------------------------------------  
| S | h | a | n | e | \0 |  |  |  |  |  
--------------------------------------
```

(trong đó 4 phần tử mảng được bỏ trống).

Vì những chuỗi này thực sự chỉ là mảng, chúng ta có thể truy cập từng ký tự trong mảng bằng cách sử dụng `[index]` chỉ số con:
```c++
cout << "Third char in my name is: " << name[2] << endl;
```
in ra ký tự thứ 3, ***a***.

Một nhược điểm của việc tạo chuỗi bằng cú pháp mảng ký tự là bạn phải chỉ định kích thước mà mảng có thể chứa. Ví dụ, trong các định nghĩa mảng sau đây, chúng tôi nêu số lượng ký tự (ẩn hoặc rõ ràng) sẽ được cấp phát cho mảng.
```c++
char name[] = "Shanenoi"; // 8 ký tự
```
Do đó, bạn phải chỉ định số ký tự tối đa mà bạn sẽ cần để lưu trữ trong một mảng. Kiểu cấp phát mảng này, trong đó kích thước của mảng được xác định tại thời điểm biên dịch, được gọi là cấp phát tĩnh.

##### 2.2 : Char pointer
Một cách khác để truy cập vào một đoạn bộ nhớ liền kề, thay vì bằng một mảng, là với một con trỏ.
	
Vì chúng ta đang nói về các chuỗi, được tạo thành từ các ký tự, chúng ta sẽ sử dụng con trỏ đến các ký tự, hay đúng hơn là ký tự của `char*`.

Tuy nhiên, con trỏ chỉ giữ một địa chỉ, chúng không thể chứa tất cả các ký tự trong một mảng ký tự. Điều này có nghĩa là khi chúng ta sử dụng `char*` để truy xuất một chuỗi, mảng ký tự chứa chuỗi đó phải tồn tại (đã được cấp phát tĩnh hoặc động).

Dưới đây là cách bạn có thể sử dụng con trỏ ký tự để truy cập một chuỗi.
```c++
char label[] = "Single";  
char label2[10] = "Married";  
char* labelPtr;  
labelPtr = label;
```

ví dụ: giả sử rằng label bắt đầu ở địa chỉ bộ nhớ `2000`
```
label @2000
------------------------------  
| S | i | n | g | l | e | \0 |  
------------------------------  
  
label2 @3000  
------------------------------------------  
| M | a | r | r | i | e | d | \0 |   |   |  
------------------------------------------  

labelPtr @4000
--------  
| 2000 |  
--------
```

> Lưu ý: Vì chúng ta đã gán cho con trỏ địa chỉ của một mảng ký tự con trỏ phải là một con trỏ ký tự - các kiểu phải khớp nhau.

Ngoài ra, để gán địa chỉ của một mảng cho một con trỏ, chúng ta không sử dụng toán tử `&` vì tên của một mảng hoạt động giống như địa chỉ của mảng đó.

Bây giờ, chúng ta có thể sử dụng `labelPtr` giống như `label`. Vì vậy, ta có thể truy cập ký tự thứ ba trong chuỗi với:
```c++
cout << "Third char is: " << labelPtr[2] << endl;
```

Điều quan trọng cần nhớ là lý do duy nhất mà con trỏ labelPtr cho phép chúng ta truy cập vào mảng label là vì chúng ta đã làm cho labelPtr trỏ tới nó. Giả sử:
```c++
labelPtr = label2;
```

Bây giờ, con trỏ `labelPtr` không còn tham chiếu đến `label` nữa mà bây giờ là `label2` như sau:
```
label2 @3000  
------------------------------------------  
| M | a | r | r | i | e | d | \0 | | |  
------------------------------------------  

labelPtr @4000  
--------  
| 3000 |  
--------
```
Và
```c++
cout << "Third char is: " << labelPtr[2] << endl;
```
in ra r, ký tự thứ 3 trong mảng `label2`.



###### *Nói gì nói chứ kiểu gì mà mấy bạn đụng tới char pointer thì auto stuck nhé 🤪*

## Hướng dẫn sử dụng

#### Xuất chuỗi

- **Yêu cầu: thư viện `<iostream>`**
```c++
#include <iostream>  
using namespace std;  
  
int main() {  
    char  string_a[] = "string_a";  
    cout << string_a << endl;  
 
    cout << "string_b" << endl;  
  
    /*  
     * để xuất chuỗi ra màn hình ta  
     * sử dụng đối tượng cout kết hợp  
     * 2 dấu << (toán tử dịch trái) với  
     * tên biến hoặc chuỗi trần  
     * endl được dùng để xuống dòng  
     */  
  
    cout << "I will show U both " << string_a << " and string_b";  	
}
```
Kết quả:
```
string_a
string_b
I will show U both string_a and string_b
```

#### Nhập chuỗi
```c++
#include <iostream>  
using namespace std;  
  
int main() {  
    char  input_str[21];  
    cout << "Which school do you attend? ";  
    cin >> input_str;  
  
    cout << input_str << "? WoW, that’s awesome!";  
  
    /*  
     * để nhập dữ chuỗi từ màn hình ta  
     * sử dụng đối tượng cin kết hợp  
     * 2 dấu >> (toán tử dịch phải) với  
     * tên biến  
     */  
}
```
Kết quả:
```
Which school do you attend? PTIT
PTIT? WoW, that’s awesome!
```

### Thao tác với chuỗi:

- *Việc thao tác với chuỗi cũng tương tự như việc các bạn thao tác với mảng!*

### Các hàm hỗ trợ giúp thao tác với chuỗi dễ dàng hơn:

Dưới đây là các hàm có sẵn (built-in function) thường dùng khi bạn thao tác với chuỗi cần phải khai báo thư viện `<string.h>` hoặc `<cstring>`

**1,** Hàm **strlen** – hàm lấy chiều dài chuỗi
```c++
int strlen ( const char* str );
```

Vai trò: Hàm `strlen` trong thư viện `string.h` cung cấp cho bạn độ dài của chuỗi mà nó đang lưu.
Ví dụ:
```c++
#include <iostream>  
#include <string.h>  
using namespace std;  
  
int main() {  
    char salary[100];
    int  salary_len;  
  
    cout << "I hear that you are a Google Expert. Can U tell me your salary? ";  
    cin >> salary;  
    salary_len = strlen(salary);  
    cout << "Wow, U have " << salary_len << " figure salary!";  
}
```
Kết quả:
```
I hear that you are a Google Expert. Can U tell me your salary? 100000000
Wow, U have 9 figure salary!
```

**2,** Hàm **strcmp** – hàm so sánh 2 chuỗi
```c++
int  strcmp ( const char* str1, const char* str2 );
```
Trong C/C++ bạn không thể dùng dấu `==` để so sánh 2 chuỗi. Lý do là bởi khi bạn truy xuất tên chuỗi thì thực tế là bạn đang truy xuất tới địa chỉ của nó chứ không phải giá trị. `strcmp` sẽ đáp ứng nhu cầu so sánh nội dung. 

Giá trị trả về của hàm:

- ***một số nguyên < 0*** : Khi ký tự đầu tiên của 2 chuỗi không giống nhau và ký tự này ở chuỗi str1 có giá trị nhỏ hơn ở chuỗi str2.
- ***giá trị 0*** : Hai chuỗi giống nhau.
- ***một số nguyên > 0*** : Khi ký tự đầu tiên của 2 chuỗi không giống nhau và ký tự này ở chuỗi str1 có giá trị lớn hơn ở chuỗi str2.

Ví dụ:
```c++
#include <iostream>  
#include <string.h>  
using namespace std;  
  
int main() {  
    char ans[21];
    cout << "Do you know PTITER? ";  
    cin >> ans;

    if (strcmp(ans, "yes") == 0) {  
        cout << "Wow we are schoolmate!";  
    } else {
        cout << "Okay, PTITER are students come from PTIT";  
    }

}
```
Kết quả:
```
Do you know PTITER? yes
Wow we are schoolmates!
```

**3,** Hàm **strcpy** & **strdup**
```c++
char* strcpy ( char* chuoi_dich, const char* chuoi_nguon);  
char* strdup ( const char* chuoi_mang );
```

- ``strcpy`` là sao chép từ mảng (ký tự) có sẵn và dán sang mảng có sẵn khác. Kích thước có thể không giống nhau.
- ``strdup`` là nhân bản từ mảng có sẵn thành một mảng mới khác vùng nhớ với mảng ban đầu. Cùng kích thước.

*Copy*: mình bắt chước bạn.
*Duplicate*: nhân bản vô tính của bạn. Clone!

Ví dụ:
```c++
#include <iostream>  
#include <string.h>  
using namespace std;
  
int main() { 
    char chuc_vu[21];  
    char* ten;  

    strcpy(chuc_vu, "Giang Vien");  
    ten = strdup("Luu Nguyen Ky Thu");  
    /*  
     * đối với chuỗi hằng nếu bạn gán thông thường như thế này  
     * ten = "Luu Nguyen Ky Thu"  
     * thì sẽ xuất hiện cảnh báo  
     * warning: ISO C++ forbids converting a string constant to 'char*' [-Wwrite-strings]  
     */  
    cout << chuc_vu << " " << ten;  
}
```
Kết quả:
```
Giang Vien Luu Nguyen Ky Thu
```

Mình sẽ không đề cập đến ``strrev`` vì
	
![strrev note](https://cdn.glitch.com/c16f71ef-e58b-4291-89f3-62975c2ebc7f%2Fimage2.png?v=1596808247724)

Trên là những hàm thông dụng và được sử dụng nhiều. Còn rất nhiều hãm hay ho do giới hạn bài viết mình dừng ở đây, các bạn có thể tìm hiểu thêm tại [Reference chính thức của C++](https://www.google.com/url?q=http://www.cplusplus.com/reference/cstring/&sa=D&ust=1596811019167000&usg=AOvVaw0Y3kkPV9WbJxQvgFtW3rws) .

## Áp Dụng:
**1,** *Nhập 1 dãy số từ bàn phím hãy đảo ngược dãy số đó.*

	* Ý tưởng 1: bạn sẽ nhập số vào một biến số, sau đó cho chạy vòng while vừa tách ký số bằng cách chia dư cho 10 vừa in ra màn hình.

	* Ý tưởng 2: bạn sẽ nhập số vào một biến chuỗi chạy vòng for ngược.

**2,** *Nhập 1 dãy số và thay đổi vị trí ký số đầu và ký số cuối của của 1 dãy số đó*

	* Ý tưởng 1: bạn vẫn sẽ sử dụng while để tách ký số đầu (d) ký số cuối \(c\) và số độ dài (l) của dãy số rồi thực hiện bài toán:

	![công thức copy right by Danh Nguyễn :)](https://cdn.glitch.com/c16f71ef-e58b-4291-89f3-62975c2ebc7f%2Fimage1.png?v=1596808238765)

	* Ý tưởng 2: bạn chỉ cần thao tác chỉnh sửa chuỗi như mảng.

⇒ Từ 2 ví dụ mình đưa ra như trên, nếu chúng ta sử dụng toán để giải quyết thì chương trình của ta có thể sẽ trở nên dài hơn, phức tạp hơn, nhưng nếu ta chuyển sang chuỗi thì chương trình sẽ ngắn hơn dễ đọc hơn.

> Lưu ý: Cũng như mảng khi thao tác với chuỗi thì ta nên chú ý hơn về index vì nó có thể dẫn đến một số lỗi thần thánh và tốn nhiều thời gian để debug. Ví dụ bạn quên và cố gắng chỉnh sửa chuỗi hằng chẳng hạn, khai báo chuỗi rồi thao tác với chuỗi trong khi bạn đặt length của chuỗi vừa khít và không có chỗ trống cho anh NULL nằm chẳng hạn, …


*Một vài gương mặt tiêu biểu trong làng error thần thánh khi chơi với chuỗi:*

```c++
**** stack smashing detected ***: ./a.out terminated*
```
```c++
55386 Segmentation fault (core dumped) ./a.out
```

Để tránh các lỗi không cần thiết bạn nên sử dụng và chuyển đổi một cách mềm dẻo giữ chuỗi hằng và chuỗi mảng.
Càng học về sau việc thao tác với chuỗi trở nên phức tạp hơn thì C++ đã cho ta một kiểu dữ liệu string mới đó là ***C++ Style String***, cân nhắc trong việc lựa chọn kiểu dữ liệu để sử dụng.

***Hết***