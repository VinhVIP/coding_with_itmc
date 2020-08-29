# CPP STYLE STRING TRONG C++

## **Giới thiệu chung** 

**Cpp Style String** trong C++ cũng có cách sử dụng tương tự với **string** mà bài học trước chúng mình đã giới thiệu với các bạn, nhưng bên cạnh đó **Cpp Style String** có một lợi thế lớn hơn **String** rất nhiều đó chính là vùng nhớ lưu trữ của nó có thể tự động mở rộng theo kích thước mà chúng ta sử dụng, do đó tránh được những lỗi về tràn vùng nhớ, nên **Cpp Style String** được sử dụng rất nhiều trong C++.


## **Khái niệm**

**Cpp Style String** là một lớp chuẩn mô tả về về chuỗi kí tự, nó cung cấp khả năng lưu trữ chuỗi kí tự gọi là **standard container**, và thêm vào đó một số chi tiết được thiết kế để xử lý chuỗi kí tự mà nó đang lưu trữ.

Một ưu điểm mà lớp **Cpp Style String** đem lại cho chúng ta là **standard container** có thể tự ***thay đổi kích thước vùng nhớ*** cho phù hợp với yêu cầu về mặt lưu trữ chuỗi kí tự. Do đó, các bạn có thể tùy ý nối hoặc chèn thêm dữ liệu vào **standard container** cho đến khi dung lượng bộ nhớ không đủ để cung cấp nữa.

## **Cú pháp** 

Trước tiên sử dụng được kiểu dữ liệu này, ta cần thêm thư viện **string** vào chương trình thông qua cú pháp:

```
#include <string>
```

### ***Khai báo kiểu dữ liệu string***

```
string <tên biến> = “<giá trị chuỗi khởi tạo>”

hoặc

string <tên biến> ("<giá trị chuỗi khởi tạo>")
```
**Ví dụ:**
``` 
string my_name = “CLB ITMC”;
string my_name_2  (“CLB ITMC”);
```

### ***Gán giá trị string cho nhau***

```
string address = “Thanh pho Ho Chi Minh”;
string temp_address =  address; 
```

Khi đó giá trị của **temp_address** sẽ được gắn giống với giá trị của chuỗi **address**.

### ***In chuỗi ra màn hình***

Để in chuỗi ra màn hình chúng ta cứ sử dụng câu lệnh **cout<<** như bình thường:

```
string my_name = “CLB ITMC”;
cout << my_name << endl;
```

### ***Nhập giá trị vào cho string*** 

```
string name;
cout << “Nhap vao ten cua ban ”;
cin >> name; 
cout << “Ten cua ban la: ”<<name<<endl;
```

Nhưng trong trường hợp nếu như bạn muốn nhập cả khoảng trắng, ví dụ như tên người thì chúng ta cần sẽ dùng thêm hàm **getline()**.
```
#include <iostream>
#include <string>
using namespace std;
int main(){
    string name; 
    cout << "Nhap vao ho va ten cua ban: " << endl;
    getline(cin, name); 
    cout << "Ho & ten cua ban la: " << name < <endl;
    return 0;
}


```

Như vậy cơ bản là chúng ta vừa đi qua về cách nhập xuất và sử dụng **Cpp Style String** cơ bản trong C++, tuy nhiên phần hấp dẫn vẫn còn phía sau, cùng chúng mình tìm hiểu bạn nhé!

## ***PHƯƠNG THỨC-HÀM HỖ TRỢ TRONG C_PP STYLE STRING***
## ***Tính độ dài chuỗi***
Để kiểm tra được độ dài của chuỗi string- tức số kí tự của chuỗi, chúng ta dùng hai phương thức **size()** và **length()** như sau: 
 
```
#include <iostream>
#include <string>
using namespace std;
int main() {
    string name = "CLB ITMC";
    cout << "Do dai cua chuoi la: " << name.length() << endl; //do dai cua chuoi bang 8 ki tu
    cout << "Do dai cua chuoi la: " << name.size() << endl; //do dai cua chuoi bang 8 ki tu
    return 0;
}
 ```

Khi bạn chạy đoạn code trên, giá trị mà chúng ta nhận được từ phương thức **length()** và **size()** là như nhau.

## ***Kiếm tra chuỗi rỗng*** 

Để kiểm tra chuỗi có rỗng hay không( chuỗi rỗng là chuỗi không có phần tử nào), chúng ta dùng phương thức **empty()**: 

```
#include <iostream>
#include <string>
using namespace std;
int main() {
    string name = "";
    if(name.empty() == true) {
        cout << "Day la chuoi rong!" << endl;
    } else {
        cout << "Chuoi co chua ki tu" << endl;
    }
    return 0;
}
```
Các bạn chúng ta chạy đoạn code trên và kiểm tra kết quả nhé!

## **Truy cập phần tử trong Cpp Style String** 
**Cpp Style String** bản chất cũng là một mảng chứa các kí tự, do đó chúng ta hoàn toàn có thể truy cập từng phần tử trong **Cpp Style String** một cách rất bình thường. 
```
#include <iostream>
#include <string>
using namespace std;
int main() {
    string state = "I am learning C++";
    for(int i=0; i < state.length(); i++){
        cout << state[i] << " ";
    }
    cout << endl;
    for(int i=0; i < state.length(); i++){
        cout << state.at(i) << " "; //dung phuong thuc at()
    }
    return 0;
}

```

Bên cạnh việc xem mỗi phần tử trong chuỗi như mảng, chúng ta hoàn toàn có thể dùng phương thức **at()** để truy cập từng phần tử.

## **Nối chuỗi vào string** 
Để nối thêm chuỗi vào string chúng ta có thể dùng phương thức **append()** các bạn nhé!

```
#include <iostream>
#include <string>
using namespace std;
int main() {
    string state;
    state.append("I ");
    state.append("am ");
    state.append("learning ");
    state.append("C++");
    cout << "Gia tri cua chuoi la: " << state << endl;
    return 0;
}
```

Khi đó giá trị của chuỗi **state** sẽ là "I am learning C++".
## **Chèn một chuỗi bất kì vào một chuỗi có sẵn** 

```
<chuỗi gốc>.insert(<vị trí chèn>, <giá trị chuỗi string cần chèn>)
```

### **Ví dụ:** 
```
#include <iostream>
#include <string>
using namespace std;
int main() {
    string name = " CLB ";
    string name_2 = " ITMC "; 
    name.insert(name.length()-1, name_2); //chen vao cuoi
	// ta co the chen vao vi tri bat ki tu 0 -> (do dai -1).
    cout << "Chuoi 'name': " << name << endl;
    return 0;
}
```
## **Thay thế một chuỗi trong Cpp style string** 
Để thay thế một đoạn chuỗi có trong string bằng một đoạn chuỗi mới ta dùng phương thức **replace()**: 

```
<string>.replace(<vị trí bắt đầu chuỗi bị thay thế >, <số kí tự bị thay thế>,<giá trị chuỗi mới>)
```

Ví dụ: 
Ta cần thay chữ **learning** thành **studying** trong câu sau “**I am learning C++**”: 

```
#include <iostream>
#include <string>
using namespace std;
int main() {
    string action = "I am learning C++";
    string word = "studying";
    action.replace(5, 8, word);
    // thay the tu vi tri '5', so ki tu thay doi la '8' bang chuoi ki tu 'studying'
    cout << "Chuoi 'action': " << action << endl;
    return 0;
}
```
## **Tìm kiếm chuỗi trong string**

Giả sử, ta có một chuỗi kí tự, ta cần tìm kiếm một chuỗi kí tự nào đó liệu có xuất hiện trong chuỗi này không, ta sử dụng phương thức **find()**, khi đó ta sẽ nhận được giá trị là vị trí đầu tiên mà ta tìm thấy, nếu không tìm thấy ta sẽ nhận được giá trị **-1**.

```
<chuỗi gốc>.find(<chuỗi cần xác minh>)
```

### **Ví dụ:** ta cần tìm kiếm chuỗi **“ITMC”** liệu có tồn tại trong chuỗi "**CLB ITMC**" hay không, ta làm như sau: 

```
#include <iostream>
#include <string>
using namespace std;
int main() {
    string name = "CLB ITMC";  
    string str = "ITMC";
    int index = name.find(str);
    if(index == -1){
        cout << "Khong tim thay!" << endl;
    } else {
        cout << "Tim thay chuoi tai vi tri " << (index+1) << endl;
        // tang 'index' len 1 don vi do string bat dau tu vi tri '0'.
    }
    return 0;
}
```


## **So sánh hai string**

Để so sánh hai chuỗi string, chúng ta sẽ dùng phương thức **compare()**.

```
<chuỗi gốc>.compare(<chuỗi cần so sánh>)
```

Giá trị trả về là một số nguyên, và thuộc 1 trong 3 trường hợp sau: 
+ **Bằng 0**: nếu như hai chuỗi giống nhau hoàn toàn.
+ **Bé hơn 0** : nếu như tại vị trí khác nhau đầu tiên của hai chuỗi, kí tự của chuỗi gốc có giá trị Ascii nhỏ hơn giá trị của kí tự trong chuỗi thứ cần so sánh.
+ **Lớn hơn 0**:  nếu như tại vị trí khác nhau đầu tiên của hai chuỗi, kí tự của chuỗi gốc có giá trị Ascii lớn hơn giá trị của kí tự trong chuỗi cần so sánh.


### **Ví dụ 1:**
```
#include<iostream>
#include<string>
using namespace std;
int main(){
    string name_1 = "CLB ITMC";  
    string name_2 = "CLB ITMC";
    if(name_1.compare(name_2) == 0){
        cout << "Hai chuoi giong nhau hoan toan!" << endl;
    } else {
        cout << "Hai chuoi khac nhau!" << endl;
    }
    return 0;
} 
```
Như trong ví dụ trên, chúng ta sẽ nhận được giá trị trả về là **0**, do hai chuỗi giống nhau hoàn toàn.

### **Ví dụ 2:**
```
#include <iostream>
#include <string>
using namespace std;
int main() {
    string name_1 = "CLB iTMC";  
    string name_2 = "CLB ITMC";
    cout << name_1.compare(name_2) << endl;
    return 0;
}
```
Khi chạy đoạn chương trình trên, chúng ta sẽ có giá trị nhận được là ***một số dương***, do vị trí kí tự đầu tiên hai chuỗi khác nhau là tại kí tự ‘**i**’ và ‘**I**’, và kí tự ‘**i**’ của **name_1** có giá trị Ascii lớn hơn kí tự ‘**I**’ của **name_2**.

### **Ví dụ 3:**
```
#include <iostream>
#include <string>
using namespace std;
int main() {
    string name_1 = "CLB ITMC";  
    string name_2 = "CLb ITMC";
    cout << name_1.compare(name_2) << endl;
    return 0;
}
```

Và như trong ví dụ trên, chương trình của chúng ta sẽ in ra **một số âm**, do hai chuỗi khác nhau tại kí tự ‘**B**’ và ‘**b**’, nhưng do kí tự ‘**B**’ của chuỗi **name_1** có giá trị Ascii nhỏ hơn giá trị ‘**b**’ của **name_2**.


## **Lưu ý chung**
+ Việc sử dụng **Cpp Style String** mang lại cho chúng sự linh hoạt nhất định khi cần mở rộng vùng nhớ của chuỗi, rất thuận tiện cho thao tác chèn, nối chuỗi,…

+ Trong nhiều trường hợp, việc nhập chuỗi kí tự vào chương trình thông qua **string** hay **Cpp Style String** sẽ gây ra lỗi **nhảy lệnh**(tức bỏ qua câu lệnh nhập chuỗi vào, do bộ nhớ đệm gây nên), các bạn chỉ cần thêm câu lệnh **cin.ignore()** vào chương trình trước câu lệnh bị nhảy là vấn đề sẽ được giải quyết.

***Hết***