# Cmath | Các Phép Toán Cơ Bản

_Trong lập trình, không tránh khỏi những phép toán đại số từ phức tạp như lượng giác, logarit, ... cho đến đơn giản như căng bật 2, lũy thừa, ... chúng ta đều sử dụng ít nhất vài lần trong đời!_
_Tránh lằng nhằng, thay vì giải quyết vấn đề mà lại nghiên cứu các phép toán trên thực hiện như thế nào rồi code lại để phục vụ cho nhu cầu, ngay từ ngôn ngữ lập trình **C**, các nhà phát triển đã ưu ái cho chúng ta một thư viện mang tên là_ ``math.h`` _(là tiền thân của_ ``cmath`` _trong ngôn ngữ_ **C++** _sao này)._
_Phụ hợp với phần đông các coder sử dụng **C++** nhiều hơn, mình sẻ hướng dẫn cho các bạn thư viện_ ``cmath`` _(theo lý thì cách sử dụng_ ``cmath`` _và_ ``math.h`` _không khác nhau, nhưng đi vào sâu hơn thì sẽ thuộc phần chuyên môn)._

---
## 1. Lượng giác
Cú pháp:
- ``double sin (double x);``
- ``double cos (double x);``
- ``double tan (double x);``

Đối với các hàm lượng giác thì chúng ta phải tính toán trên đơn vị là **Radian** nha!
Ví dụ:
```c++
#include <iostream>
#include <cmath>

/*
 * 180° = π radian
 * 1°   = ? radian
 * áp dụng quy tắc nhân chéo chia ngang, ta được:
 */
#define DEGREE (M_PI/180)
/*              ^
            Đây là số PI trong cmath!
*/

using namespace std;

int main() {

        cout << "sin(π/6) = "    <<  sin(MPI/6)
             << "; sin(180°) = " <<  sin(180*DEGREE) << endl;
		/*    ^
		 * Để ý hong, tui vừa xuống dòng nè :D chạy nó hỏng có lỗi đâu.Đối
		 * với C/C++ và một số ngôn ngữ khác thì việc xuống dòng giữa chừng
		 * này không gọi là lỗi cú pháp, mà còn mang tính thẩm mỹ dễ nhìn :3
		 */

        double arcsin = asin(1);
        cout << "arcsin(1) = " << arcsin; 
        /* 
         * Nó sẽ ra π/2, hi vọng là bạn không quên vì nó nằng
         * trong bảng giá trị lượng giác các cung góc đặc biệt  
         */

		return 0;
		
}
```
Sao đây là kết quả:
```
sin(π/6) = 0.5; sin(180°) = 1.22465e-16
arcsin(1) = 1.5708
```

> A: Khoang khoang, bấm casio thì ``sin(180°) = 0`` cơ mà ??!!
> B: ;Đúng là _bằng không_ nếu bạn thay e đó thành *10^ thì sao?
> 1.22465 * 10^ -16 gần bằng 0 phải không nào

_``e`` ở đây là cách viết của **Scientific Notation**_ để chỉ một con số, ``e`` được thay thế bằng ``x10^`` 


![abcccc](https://cdn.glitch.com/c16f71ef-e58b-4291-89f3-62975c2ebc7f/Screenshot%20from%202020-08-23%2017-06-10.png?v=1598181537694)

Thế còn cô-xin, tang thì sao
```c++
#include <iostream>
#include <cmath>

#define DEGREE (M_PI/180)

using namespace std;

int main() {

        cout << "cos(0) = "    <<  cos(0)
             << "; arccos(-1) = " <<  acos(-1) << endl;

        cout << "tan(π/3) = "    <<  tan(M_PI/3)
             << "; arctan(1) = " <<  atan(1)/DEGREE << "°" << endl;

        return 0;

}
```
Kết quả:
```
cos(0) = 1; arccos(-1) = 3.14159
tan(π/3) = 1.73205; arctan(1) = 45°
```
> A: Thế còn cô-tang thì sao bạn?
> B: ...

## 2. Mũ và Logarit
_Có vài hàm trong đây có chức năng khác với kí hiệu trong toán học!_

- ``double exp (double x);``  lũy thừa của số e tự nhiên với một số mũ x.
- ``double log (double x);`` logarit cơ số e tự nhiên.
- ``double log10 (double x);`` logarit  cơ số 10.

Ví dụ:
```c++
#include <iostream>
#include <cmath>

#define DEGREE (M_PI/180)

using namespace std;

int main() {

        cout << "Số tự nhiên e  = " << exp(1) << endl;
        cout << "log e của 1 = " << log(1) << endl;
        cout << "log 10 của 3 = " << log10(3) << endl;
        cout << "số 12345 có " << (int)log10(12345)+1 << " chữ số " << endl;
        return 0;

}
```

Console output:
```
Số tự nhiên e  = 2.71828
log e của 1 = 0
log 10 của 3 = 0.477121
số 12345 có 5 chữ số 
```

### Các hàm thường sử dụng khác như:
| Syntax | Exp |
|--|--|
``double pow (double base, double exponent);``|``pow (7.0, 3.0); //7^3``
``double sqrt (double x);``|``sqrt(64); // √64``
``double round  (double x);``|``round( 2.3); //  -> 2.0``
``double abs (double x);``|``abs(-10.6); // -> 10.6 ``

___
👉👉 [Tham khảo thêm các hàm thuộc cmath](http://www.cplusplus.com/reference/cmath/)
___

***Hết***