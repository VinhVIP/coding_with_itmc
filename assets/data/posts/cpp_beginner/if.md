## Khái niệm chung
Cấu trúc này được dùng khi một lệnh hay một khối lệnh chỉ được thực hiện khi một điều kiện nào đó thoả mãn.
## Cú pháp
***Dạng thiếu***
```
if (<Điều kiện>)
{
    [Câu lệnh];
}
```
***Dạng đủ***
```
if (<Điều kiện>)
{
    [câu lệnh 1];
}
else
{
    [câu lệnh 2];
}
```

***Trong đó:***
- **Điều kiện**: Biểu thức quan hệ hoặc logic.
- **Câu lệnh**, **câu lệnh 1**, **câu lệnh 2**: là một câu lệnh của CodeBlocks.
- *Ở dạng thiếu*: **điều kiện** sẽ được tính và kiểm tra. Nếu **điều kiện** đúng (có giá trị true) thì **câu lệnh** sẽ được thực hiện, ngược lại thì **câu lệnh** sẽ bị bỏ qua.
- *Ở dạng đủ*: **điều kiện** cũng được tính và kiểm tra. Nếu **điều kiện** đúng thì **câu lệnh 1** sẽ được thực hiện, ngược lại thì **câu lệnh 2** sẽ được thực hiện.

## Toán tử điều kiện ?  trong C++
Cú pháp của toán tử điều kiện ? : trong C++ là:
```
<bieu_thuc_1> ? <bieu_thuc_2> : <bieu_thuc_3>;
```
Ở đây, **bieu_thuc_1**,b**bieu_thuc_2** và **bieu_thuc_3** là các biểu thức. Bạn chú ý sự sử dụng và vị trí của dấu hai chấm. 
Giá trị của một biểu thức ? được quyết định như sau: **bieu_thuc_1** được ước lượng. Nếu nó là true, thì **bieu_thuc_2** được ước lượng và trở thành giá trị của toàn bộ biểu thức **?**. 
Nếu **bieu_thuc_1** là *false*, thì **bieu_thuc_3** được ước lượng và giá trị của nó trở thành giá trị của biểu thức **?**.
Biểu thức **?** được xem như là một toán tử tam phân bởi vì nó yêu cầu ba toán hạng và có thể được sử dụng để thay thế lệnh ***if-else***, có form sau:
```
if (dieu_kien) {
    var = X;
} else {
    var = Y;
}
```
Bạn xét code sau:
```
if (y < 10) {
    var = 30;
} else {
    var = 40;
} 
```
Code trên có thể được viết lại như thế này:
```
var = (y < 10) ? 30 : 40;
```
Ở đây, **var** được gán giá trị 30 nếu **y** nhỏ hơn 10 và được gán 40 nếu không nhỏ hơn 10.
## Ví dụ
Tìm nghiệm thực của phương trình bậc hai:
    ax2 + bx + c = 0 , với a khác 0.

*Input*: Các hệ số a, b, c nhập từ bàn phím.

*Output*: Đưa ra màn hình các nghiệm thực hoặc thông báo "Phuong trinh vo nghiem".

Code:
```
#include <iostream>
#include <conio.h>
#include <math.h>
using namespace std;

int main()
{
    float a, b, c, delta, x1, x2;
    cout << "Nhap a = ";
    cin >> a;
    cout << "Nhap b = ";
    cin >> b;
    cout << "Nhap c = ";
    cin >> c;

    if(a == 0) {
        // a == 0 phuong trinh tro thanh phuong trinh bac mot bx + c = 0
        if(b == 0) {
            if (c == 0) {
                cout << "Phuong trinh vo so nghiem" << endl;
            } else {
                cout << "Phuong trinh vo nghiem" << endl;
            }
        } else {
            cout << "Phuong trinh co nghiem duy nhat: " << -c/b << endl;
        }
    } else {
        delta = b*b - 4*a*c;
        if(delta > 0) {
            x1 = (-b+sqrt(delta)) / (2*a);
            x2 = (-b-sqrt(delta)) / (2*a);
            cout << "Nghiem thu nhat x1 = " << x1 << endl;
            cout << "Nghiem thu hai x2 = " << x2 << endl;
        } else if ( delta == 0) {
            cout << "Phuong trinh co nghiem kep: x1 = x2 = " << -b/2*a << endl;
        } else {
            cout << "Phuong trinh vo nghiem" << endl;
        }
    }
    return 0;
}
```

***Hết***