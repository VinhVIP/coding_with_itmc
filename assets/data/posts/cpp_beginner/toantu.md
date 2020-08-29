# **TOÁN TỬ TRONG C++**
## **GIỚI THIỆU**
Trong lúc lập trình chắc hẳn các bạn sẽ gặp các trường hợp như tìm các số từ 0 đến 100 chỉ chia hết cho 2 mà không chia hết cho 3, hay đơn giản chỉ là tính tổng của 12 với 35 rồi gán giá trị cho một biến a nào đó lúc đó bạn phải sử dụng một **toán tử** để thực hiện yêu cầu của bạn. Vậy **toán tử** là gì? Có bao nhiêu loại **toán tử** và vai trò của **toán tử** trong lập trình?  

## **KHÁI NIỆM CHUNG**

Trong toán học, một **toán tử** (tiếng Anh *operator*, phân biệt với *operation* - phép toán) là một hàm, thông thường có một vai trò quan trọng trong một lĩnh vực nào đấy. Chẳng hạn trong đại số tuyến tính có “toán tử tuyến tính” (*linear operator*). Trong giải tích có “toán tử vi phân” (*differential operator*)… Thông thường, một **toán tử** là một hàm tác động lên các hàm khác; hoặc nó có thể là tổng quát hóa của một hàm, như trong đại số tuyến tính.

Các kiểu toán tử trong C++:
- Toán tử số học
- Toán tử quan hệ
- Toán tử logic
- Toán tử so sánh bit
- Toán tử gán
- Toán tử hỗn hợp
## **HƯỚNG DẪN SỬ DỤNG**
Ta sẽ lần lượt tìm hiểu từng loại toán tử trong C++.

### **Toán tử số học trong C++**
Bảng dưới đây liệt kê các toán tử số học được hỗ trợ bởi ngôn ngữ C++:

![](resources:assets/data/posts/cpp_beginner/toantu_image0.png)

***Ví dụ:***

```cpp
#include<iostream>
using namespace std;

int main() {
    int A = 256; 
    int B = 45;
    cout << A + B << endl;
    cout << A - B << endl;
    cout << A * B << endl;
    cout << A / B << endl;
    cout << A % B << endl;
    cout << A++ << endl;
    cout << B-- << endl;
    return 0;
}
```

Kết quả phép toán sẽ như sau:

![](resources:assets/data/posts/cpp_beginner/toantu_image1.png)

Bạn có nhận thấy điều gì khác biệt không? Rõ ràng ta đã gọi lệnh **A++** và **B--** và tác dụng của các toán tử ++ và -- đã nói ở trên nhưng tại sao không hiện ra màn hình kết quả là 257 và 44.

Đó chính là do chúng ta sử dụng dạng hậu tố. Toán tử tăng hay giảm đều sử dụng một trong hai dạng là tiền tố và hậu tố. Tuy đều cùng chung tác dụng là tăng hoặc giảm một đơn vị của hạng tử nhưng giữa tiền tố và hậu tố có một sự khác biệt nhau rõ rệt. Nếu bạn sử dụng dạng tiền tố thì toán tử tăng hoặc giảm được thực hiện trước biểu thức, và nếu bạn sử dụng hậu tố thì toán tử tăng hoặc giảm được thực hiện sau khi biểu thức được ước lượng. Hãy xét ví dụ giải thích sự khác nhau này

***Ví dụ:***
```cpp
#include<iostream>
using namespace std;
 
int main() {
    int a = 21;
    int c ;
 
    // Gia tri cua a se khong duoc tang truoc khi duoc gan.
    c = a++; 
    cout << "1, Gia tri cua a++ la: " << c << endl ;
 
    // Sau khi gia tri cua a duoc tang thi:
    cout << "2, Gia tri cua a la: " << a << endl ;
 
    // Gia tri cua a se duoc tang truoc khi duoc gan.
    c = ++a; 
    cout << "3, Gia tri cua ++a la: " << c << endl ;
    return 0;
}
```

Đây là kết quả khi chạy chương trình:

![](resources:assets/data/posts/cpp_beginner/toantu_image2.png)

Điều này đúng với cả trường hợp giảm. Vậy trở lại vấn đề ở trên bạn chỉ cần thay **A++** thành **++A** và **B--** thành **--B** là kết quả sẽ chạy đúng yêu cầu của bạn.

### **Toán tử quan hệ trong C++**
Bảng dưới đây liệt kê các toán tử quan hệ được hỗ trợ bởi ngôn ngữ C++:

![](resources:assets/data/posts/cpp_beginner/toantu_image21.png)

***Ví dụ:***
```cpp
#include<iostream>
using namespace std;
int main() {
    int A = 10, B = 20;
    cout << (A == B) << endl;
    cout << (A != B) << endl;
    cout << (A > B) << endl;
    cout << (A < B) << endl;
    cout << (A >= B) << endl;
    cout << (A <= B) << endl;
    return 0;
}
```

Đây chính là kết quả chạy chương trình:

![](resources:assets/data/posts/cpp_beginner/toantu_image3.png)

Kết quả 0 đại diện cho false còn 1 đại diện cho true 

### **Toán tử logic trong C++**

Bảng dưới đây chỉ rõ tất cả các toán tử logic được hỗ trợ bởi ngôn ngữ C++:

![](resources:assets/data/posts/cpp_beginner/toantu_image32.png)

***Ví dụ:***
```cpp
#include<iostream>
using namespace std;
int main() {
    cout << ((5 > 1) && (12 < 45)) << endl;
    cout << ((5 > 1) || (12 > 45)) << endl;
    cout << !((5 > 1) && (12 < 45)) << endl;
    return 0;
}
```

Đây là kết quả khi chạy chương trình:

![](resources:assets/data/posts/cpp_beginner/toantu_image4.png)

### **Toán tử so sánh bit trong C++**
Toán tử so sánh bit làm việc trên đơn vị bit, tính toán biểu thức so sánh từng bit. Bảng dưới đây về **&**, **|**, **^** và **~** như sau:

![](resources:assets/data/posts/cpp_beginner/toantu_image41.png)

Trong C++:

![](resources:assets/data/posts/cpp_beginner/toantu_image42.png)

Vì các toán hạng này khá đặc biệt và khó nên các bạn có thể tìm đọc các tài liệu về các loại toán tử này. Sau đây chúng ta xét ví dụ để hiểu hơn về cách hoạt động của các toán tử này. 

***Ví dụ:***
Với a = 5 có dạng nhị phân là 00000101, b = 9 có dạng nhị phân là 00001001
Khi đó giá trị a & b sẽ là 1 vì ta có phép tính sau:

00000101 & 00001001 = 00000001

Mà 00000001 có kết quả thập phân là 1. Tương tự đối với các phép còn lại ta có:

a | b = 00001101 = 13  (hệ thập phân)

a ^ b = 00001100 = 12 (hệ thập phân)

~a = 11111010 = 250 (hệ thập phân)

b << 1 = 00010010 = 18 (hệ thập phân)

b >> 1 = 00000100 = 4 (hệ thập phân)


### **Toán tử gán trong C++**

Dưới đây là danh sách các toán tử gán được hỗ trợ bởi ngôn ngữ C++:

![](resources:assets/data/posts/cpp_beginner/toantu_image43.png)

Bạn hãy xem ví dụ một số toán hạng: 
```cpp
#include<iostream>
using namespace std;
int main() {
    int a;
    a = 4 + 5;
    cout << a << endl;
    int b = 4;
    b += 5;  
    cout << b << endl;
    int c = 18;
    c -= 12;
    cout << c << endl;
    int d = 4;
    d *= 5;  
    cout << d << endl;
    int e = 12;
    e /= 4; 
    cout << e << endl;
    int f = 224;
    f %= 4; 
    cout << f << endl;
    return 0;
}
```
Đây là kết quả sau khi chạy chương trình:
![](resources:assets/data/posts/cpp_beginner/toantu_image5.png)

### **Toán tử hỗn hợp trong C++**
Toán tử hỗn hợp trong C++ có khá nhiều, trong bài này ta chỉ tìm hiểu các toán tử sizeof và toán tử điều kiện.

**Toán tử sizeof**

sizeof là một từ khóa trong C++, nhưng nó là một toán tử compile-time mà quyết định kích cỡ, bằng giá trị byte, của một biến hoặc kiểu dữ liệu.

Toán tử sizeof có thể được sử dụng để lấy kích cỡ của lớp, cấu trúc, union và bất kỳ kiểu dữ liệu tự định nghĩa khác (user-defined) trong C++.

Cú pháp để sử dụng toán tử sizeof trong C++ như sau:
```cpp
sizeof(kieu_du_lieu)
```

Trong đó, **kieu_du_lieu** là kiểu dữ liệu trong C++ cần biết kích cỡ.

*Ví dụ:*

Đoạn chương trình sau đây sẽ cho biết kích cỡ của các kiểu dữ liệu cơ bản trong C++, tính bằng byte:
```cpp
#include <iostream>
using namespace std;
 
int main()
{
    cout << "Kich co cua char : " << sizeof(char) << endl;
    cout << "Kich co cua int : " << sizeof(int) << endl;
    cout << "Kich co cua short int : " << sizeof(short int) << endl;
    cout << "Kich co cua long int : " << sizeof(long int) << endl;
    cout << "Kich co cua float : " << sizeof(float) << endl;
    cout << "Kich co cua double : " << sizeof(double) << endl;
    return 0;
}
```
Đây là kết quả:

![](resources:assets/data/posts/cpp_beginner/toantu_image6.png)

**Toán tử điều kiện trong C++**

Cú pháp của toán tử điều kiện trong C++ là:
```cpp
bieu_thuc_1 ? bieu_thuc_2 : bieu_thuc_3;
```
Ở đây, **bieu_thuc_1**, **bieu_thuc_2** và **bieu_thuc_3** là các biểu thức. Bạn chú ý sự sử dụng và vị trí của dấu hai chấm. Giá trị của một biểu thức ? được quyết định như sau: **bieu_thuc_1** được ước lượng. Nếu nó là true, thì **bieu_thuc_2** được ước lượng và trở thành giá trị của toàn bộ biểu thức ?. Nếu **bieu_thuc_1** là **false**, thì **bieu_thuc_3** được ước lượng và giá trị của nó trở thành giá trị của biểu thức ?.

Bạn xét 2 đoạn code sau:
```cpp
#include<iostream>
using namespace std;
int main() {
    int x, y = 10;
    x = (y < 10) ? 30 : 40;
    cout << "Gia tri cua x la: "  << x;
    return 0;
}
```
```cpp
#include<iostream>
using namespace std;
int main() {
    int x, y = 10;
    if (y < 10) {
        x = 30;
    }
    else {
        x = 40;
    }
    cout << "Gia tri cua x la: "  << x;
    return 0;
}
```
Ở đây, x được gán giá trị 30 nếu y nhỏ hơn 10 và sẽ được gán 40 nếu y không nhỏ hơn 10. Như bạn thấy, cả hai cách đều cho ra một kết quả như nhau là x = 40 nhưng cách viết đầu tiên lại chỉ có một dòng là đã ra được kết quả cho biến x còn cách 2 phải viết hơn 2 dòng mới cho ra kết quả. 

Vì vậy trong một số trường hợp nếu có thể được thì khuyến khích các bạn viết theo cách 1, như thế code sẽ được "sạch" và ngắn gọn hơn.

## **MỘT SỐ BÀI TẬP CỦNG CỐ**
**Bài tập 1:** Bạn hãy dự đoán kết quả b của phép tính sau đây:
```cpp
int a = 10, b = 12;
b += (a++) + (++a);
```
**Bài tập 2:** Bạn hãy cho biết kết quả của các phép tính bit dưới đây:

(1) 10 & 1

(2) 13 & 1

Từ phép tính (1) và (2) bạn có nhận xét gì về số chẵn và số lẻ.

**Bài tập 3:** Viết chương trình chỉ sử dụng toán tử điều kiện: Nhập vào ba số a, b, c hãy tìm và in ra số lớn nhất trong 3 số đó. 
## **MỘT SỐ LƯU Ý**

- Sau này các bạn học tới vòng lặp, các bạn sẽ được dịp gặp lại toán tử tăng và giảm. Nếu bạn là một người có dự tính hoặc đang tham gia lập trình thi đấu, trong một bài toán sử dụng vòng lặp, hãy sử dụng dạng tiền tố thay cho dạng hậu tố. Đây là link bài viết giải thích: [https://medium.com/better-programming/stop-using-i-in-your-loops-1f906520d548](https://medium.com/better-programming/stop-using-i-in-your-loops-1f906520d548)

- Các toán tử bit khá là khó khăn trong việc sử dụng, tuy nhiên khi bạn hiểu rõ được tinh túy của bit, thì nó sẽ là một công cụ cực mạnh khi giải quyết các vấn đề. Ví dụ như bài tập 2 ở trên, bạn hoàn toàn có thể sử dụng bit để kiểm tra sự chẵn lẻ của một số tự nhiên, ngoài ra bạn còn có thể tính được lũy thừa n của cơ số 2 bằng việc sử dụng 1 dòng lệnh duy nhất 1 << n, và còn rất nhiều ứng dụng khác của bit.

- Việc các bạn biết được kích cỡ của các kiểu dữ liệu thường dùng trong C++ sẽ giúp bạn tính toán được trong tình huống xấu nhất chương trình bạn đã sử dụng bao nhiêu byte, điều này thực sự cần thiết khi bạn tham gia lập trình thi đấu hoặc một vấn đề thực tế hơn là máy tính của các bạn sắp hết bộ nhớ để bạn có thể sử dụng kiểu dữ liệu cho hợp lý. 

***Hết***