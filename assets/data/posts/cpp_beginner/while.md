## Giới thiệu
Trong quá trình giải quyết một vấn đề, các bạn sẽ gặp trường hợp bắt buộc thực hiện lặp đi lặp lại một công việc nhiều lần. Chẳng hạn như: Tính tổng các số dương được nhập vào từ bàn phím, chương trình sẽ dừng lại khi số nhập vào là 0 hoặc 1 số âm, sau đó in ra màn hình tổng vừa tính được. Như vậy với bài toán này, những công việc buộc phải lặp lại là (nhập số từ bàn phím và sau đó tính tổng). Để giải quyết bài toán này, chúng ta phải sử dụng **Cấu Trúc Lặp**. Ở bài viết này, mình sẽ nói về **while** và **do…while**.

## Khái niệm chung
***Cấu Trúc Lặp*** khiến chương trình thực hiện lặp đi lặp lại một hoặc một khối các câu lệnh cho đến khi điều kiện đặt ra không còn thõa mãn.

#### Cấu trúc while
```
while (dieuKien) {
    khoiLenh;
}
```
Trong đó:

– **dieuKien**: Biểu thức điều kiện của vòng lặp **while**. Vòng lặp sẽ thực hiện lặp đi lặp lại các câu lệnh trong **khoiLenh** trong khi biểu thức **dieuKien** có giá trị **true**. Đến một lúc nào đó thì việc thực hiện các lệnh trong **khoiLenh** sẽ làm cho biểu thức **dieuKien** có giá trị **false**, khi đó vòng lặp sẽ dừng lại.

– **khoiLenh**: Các lệnh mà chúng ta cần vòng lặp thực hiện nhiều lần. Nhờ vào những câu lệnh này, chúng ta có thể kiểm soát được số lần lặp (VD: tăng biến đếm cho đến khi giá trị vượt quá điều kiện của **while**,..) hoặc xây dựng những cấu trúc lặp lồng nhau để giải quyết các bài toán phức tạp.

#### Hướng dẫn sử dụng
Sơ đồ hoạt động:
![](resources:assets/data/posts/cpp_beginner/while_image1.png)

Khi bắt đầu vòng lặp, chương trình sẽ kiểm tra xem điều kiện trong while có thỏa (**true**) hay không. Nếu **true** thì chương trình sẽ thực hiện khối lệnh sau nó. Sau khi thực hiện khối lệnh, chương trình sẽ quay lại kiểm tra điều kiện lần nữa, nếu điều kiện vẫn còn thỏa thì chương trình sẽ tiếp tục lặp lại thao tác chạy khối lệnh -> kiểm tra,… cho đến khi điều kiện trả về **false** thì vòng lặp sẽ dừng và chạy câu lệnh tiếp theo ngoài vòng lặp.

***Lưu ý***: Biểu thức điều kiện sẽ xét trước khi vòng lặp chạy, do đó vòng lặp có thể sẽ không được thực hiện lần nào nếu không chú ý thiết lập các biến hoặc điều kiện để đưa vào xét cho phù hợp. (VD: đặt điều kiện **while(x>0)** nhưng trước đó khai báo **x=0** thì khi chạy chương trình sẽ không chạy vòng lặp).

*Ví dụ:*
Quay lại bài toán ở đầu bài viết: Tính tổng các số dương được nhập vào từ bàn phím, chương trình sẽ dừng lại khi số nhập vào là 0 hoặc một số âm, sau đó in ra màn hình tổng vừa tính được.
Chúng ta có thể vạch ra sơ bộ quá trình thực hiện:
- *Bước 1:* Tạo biến **sum=0** (biến dùng để cộng các số nhập vào), **x=1** (giá trị nhập vào từ bàn phím, khai báo bằng 1 để tránh trường hợp điều kiện của vòng lặp trả về false)
- *Bước 2:* Nếu **x < 1** thì đi đến bước 5.
- *Bước 3:* Nhập vào số **x**, nếu **x** lớn hơn 0 thì cộng **x** vào **sum**.
- *Bước 4:* Lặp lại từ Bước 2.
- *Bước 5:* In ra **sum** và kết thúc chương trình.

Chương trình ví dụ:
```c++
#include<iostream>
using namespace std;
int main() {
    int sum = 0, x = 1;
    while(x > 0) {
        cin >> x;
        if (x > 0) sum += x;
    }
    return 0;
}
```
#### **CẤU TRÚC do...while**
Cú pháp:
```
do {
    khoiLenh;
} while(dieuKien);
```


Trong đó:
Tương tự với **vòng lặp while**:

– **dieuKien**: Biểu thức điều kiện của vòng lặp.

– **khoiLenh**: Các lệnh mà chúng ta cần vòng lặp thực hiện nhiều lần.

– **do**: chương trình sẽ thực hiện các khối lệnh phía sau **do** thay vì kiểm tra điều kiện trước như **while**, với **do…while** chương trình sẽ thực hiện khối lệnh trước khi xét điều kiện ở **while**.

#### Hướng dẫn sử dụng
Sơ đồ hoạt động:
![](resources:assets/data/posts/cpp_beginner/while_image2.png)

Đầu tiên, khi bước vào vòng lặp, các câu lệnh trong khối lệnh sẽ được thực hiện. Sau đó chương trình sẽ kiểm tra điều kiện của vòng lặp có thỏa hay không. Nếu thỏa, chương trình sẽ quay lên thực hiện các câu lệnh của khối lệnh một lần nữa. Nếu không khỏa, chương trình sẽ không thực hiện lặp lại nữa mà sẽ thực hiện câu lệnh tiếp theo bên ngoài vòng lặp (thoát vòng lặp).

***Lưu ý:***
- Do vòng lặp **do…while** sẽ thực hiện khối lệnh trước sau đó mới xét điều kiện, nên khối lệnh sẽ được lặp ít nhất là 1 lần.
- Sau vòng lặp **do…while** phải có dấu chấm phẩy ( **;** ).
- Có một điều đáng chú ý trong vòng lặp **do…while** là biến dùng cho biểu thức điều kiện  ở **while()** cần được khai báo trước khi vào vòng lặp **do…while**, tức là không được khai báo biến đó ở trong khối lệnh **do**. Vì **while()** nằm ngoài khối lệnh **do** nên những biến khai báo trong khối lệnh **do** sẽ bị hủy trước khi xét điều kiện **while()**.

*Ví dụ:*
Cũng quay lại bài toán ở đầu bài viết: Tính tổng các số dương được nhập vào từ bàn phím, chương trình sẽ dừng lại khi số nhập vào là 0 hoặc một số âm, sau đó in ra màn hình tổng vừa tính được.
Chúng ta có thể vạch ra sơ bộ quá trình thực hiện:
- *Bước 1:* Tạo biến **sum = 0** (biến dùng để cộng các số nhập vào), **x**  (khác với **while**, ở đây chúng ta không cần gán giá trị cho biến **x**, vì bước sau sẽ nhập giá trị cho **x** nên dù có gán thì **x** cũng sẽ bị thay đổi giá trị ở bước 2. Hơn nữa, vì **do…while** thực hiện khối lệnh trước khi xét điều kiện nên chúng ta không cần lo về vòng lặp không chạy lần nào)
- *Bước 2:* Nhập vào số **x**, nếu **x** lớn hơn 0 thì cộng **x** vào **sum**.
- *Bước 3:* Nếu **x > 0** thì lặp lại từ bước 2, còn không thì đến bước 4.
- *Bước 4:* In ra **sum** và kết thúc chương trình.

Chương trình ví dụ:
```cpp
#include <iostream>
using namespace std;
int main() {
    int sum = 0, x;
    do {
        cin >> x;
        if (x > 0) sum += x;
    } while(x > 0);
    cout << sum;
    return 0;
}
```
## Lưu ý
- Để dừng vòng lặp, ngoài trường hợp đợi đến khi điều kiện của **while** bị **false** thì chúng ta có thể sử dụng chỉ thị **break;** Chỉ thị **break** sẽ thoát khỏi vòng lặp chứa nó. Tức là khi có nhiều vòng lặp lồng vào nhau thì khi chạy tới **break** thì chương trình sẽ thoát ra khỏi vòng lặp nào đang chứa **break** đó.
- Song song với **break**, chúng ta còn có chỉ thị **continue;** Chỉ thị này giúp chúng ta bỏ qua các câu lệnh phía sau nó để nhảy tới bước xét điều kiện luôn.
- Sau **while()** thì không có chấm phẩy(**;**) nhưng sau **while()** của **do…while** thì có chấm phẩy( **;** ).
- Một trong những điểm rất quan trọng khi sử dụng cấu trúc lặp là cần phải kiểm soát được khả năng dừng của vòng lặp để tránh xảy ra trường hợp chương trình chạy mãi không dừng.

***Hết***