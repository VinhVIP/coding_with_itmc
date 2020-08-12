## Giới thiệu

Khi bạn đang thực hiện chương trình đơn giản là tính tích 2 số nguyên 23 và 45, thì một vấn đề đặt ra là có cách nào để có thể thay đổi số 23 và 45 thành các giá trị khác như 100 và 15, 456 và 3536,… không? Đối với các vấn đề, chương trình lớn thì việc giá trị thay đổi thường xuyên là một điều khó tránh khỏi, vì vậy người viết chương trình phải đảm bảo chương trình sau khi viết phải có tính tổng quát, nghĩa là chương trình đó phải giải được một bài toán đó với nhiều giá trị đầu vào khác nhau mà không thay đổi bất kỳ đoạn code nào bên trong. Và từ đó, khái niệm biến (variable) trong lập trình ra đời.

## Khái niệm  
_**Một biến trong C++ là tên của một vùng nhớ trong bộ RAM, được dùng để lưu trữ dữ liệu.**_ Giá trị của nó có thể được thay đổi và có thể được sử dụng lại nhiều lần. Mỗi biến trong C++ có một loại dữ liệu cụ thể, kích thước của bộ nhớ của biến, phạm vi các giá trị có thể được lưu trữ trong bộ nhớ đó.

## Cú pháp khai báo
```
<kiểu dữ liệu> <tên biến>;
```
Hoặc
```
<kiểu dữ liệu> <tên biến> = [Giá trị khởi tạo của biến];
```  
Trong đó:
- <**kiểu dữ liệu**> : Là các kiểu dữ liệu được quy định trong C++, nó sẽ phân loại giá trị của biến (ký tự, số nguyên, số thực,…) 
- <**tên biến**> : Là tên do người dùng đặt, phù hợp với quy định đặt tên biến trong C++, nó giúp C++ xác định vùng nhớ mà ta cấp phát, mỗi lần sử dụng thì compiler sẽ tìm đến vùng nhớ mà chúng ta đặt tên và lấy giá trị ra để sử dụng.
- [**Giá trị khởi tạo của biến**] : Ta có thể gán giá trị ban đầu cho biến hoặc không, nhưng bản chất là một câu lệnh nên phải kết thúc bằng **dấu chấm phẩy**.  

## Hướng dẫn sử dụng
Để có thể khai báo và sử dụng đúng ta cần tuân thủ các quy tắc sau đây:  
- Một biến có thể có các chữ cái, chữ số và dấu gạch dưới.
- Tên biến chỉ có thể bắt đầu bằng các chữ cái hoặc dấu gạch dưới. Nó không thể bắt đầu bằng chữ số.
- Không có khoảng trắng trong tên biến.
- Trong C++, tên biến có sự phân biệt chữ hoa và chữ thường. Ví dụ: `chieudai` và `chieuDai` là 2 biến khác nhau.
- Tên biến không phải là bất kỳ từ hoặc từ khóa dành riêng như _**int**_, _**float**_,…

 **Dưới đây là bảng các từ khóa trong C++**
 
![image](resources:assets/data/posts/cpp_beginner/bien_image1.png)

**Những cách khai báo hợp lệ:**   
```
#include <iostream>
using namespace std;

int main()
{
    int n;
    int _ab;
    int Chieu_Dai;
    int a30;
    int a = 10;

    return 0;
}
```
**Những cách khai báo KHÔNG hợp lệ:**  
```
#include <iostream>
using namespace std;

int main()
{
    int 2;
    int a b;
    int long;

    return 0;
}
```

#### CÁC KIỂU BIẾN THƯỜNG DÙNG TRONG C++
**1. Biến cục bộ (local):**
Một biến được khai báo bên trong hàm hoặc khối lệnh được gọi là biến địa phương.  

Các biến địa phương chỉ có giá trị sử dụng trong bên trong các hàm và khối lệnh đó. Nếu ra khỏi khối lệnh hay hàm đó mà ta vẫn sử dụng để làm các công việc về sau thì compiler sẽ báo lỗi.  
```
#include <iostream>
using namespace std;

int main()
{
    int n;
    int _ab;
    int Chieu_Dai;
    int a30;
    int a = 10;

    return 0;
    }
```
Ở ví dụ này, các biến **n**, **_ab**, **Chieu_Dai**, **a30**, **a** đều là các biến địa phương.
```
#include <iostream>
using namespace std;

int main()
{
    for (int i = 0; i <= 10; i++)
    {
        cout << i + 10;
    }
    cout << i;
    return 0;
}
```
Ở ví dụ này, biến i là một biến địa phương, nó có giá trị sử dụng trong vòng for, còn khi ra khỏi khối lệnh đó đến dòng 10 nếu compile và run thì compiler sẽ báo lỗi là biến i này chưa được khai báo, nguyên nhân vì biến i chỉ tồn tại trong khối lệnh của vòng lặp for, nếu ra ngoài khối lệnh thì nó bị compiler xóa bỏ.  Còn việc vòng lặp for là gì thì mời các bạn cùng tìm hiểu trong bài Vòng lặp For của chúng mình các bạn nha!  

**2. Biến toàn cục (global):**
Một biến được khai báo bên ngoài hàm hoặc khối lệnh thì được gọi là biến toàn cục. Bất kỳ hàm nào cũng có thể thay đổi giá trị của biến cục bộ.
```
#include <iostream>
using namespace std;
    
int a = 20;

int Tinh()
{
    return a+100;
}

int main()
{
    int x = 10;
    cout << x + a << endl;
    cout << Tinh();
    return 0;
}
```
Ở ví dụ này, biến **a** được gọi là biến toàn cục, biến **x** là biến cục bộ. Phạm vi sử dụng của biến **a** là ở hàm **Tinh()** và hàm **main()**, còn biến **x** chỉ được sử dụng trong hàm **main()**.  

Ta xem xét lại ví dụ ở trên, nếu ta sửa như thế này:
```
int main()
{
    int i;
    for (i = 0; i <= 10; i++)
    {
        cout << i + 10;
    }
    cout << i;
    return 0;
}
```
Chương trình như thế này sẽ không lỗi và vẫn chạy bình thường vì biến **i** có giá trị sử dụng trong cả hàm **main()**.      
```
#include <iostream>
using namespace std;
    
int a = 10;

int main()
{
    int a = 20;
    cout << a;
     return 0;
}
```
Có thể thấy ở ví dụ này, biến a là một biến toàn cục, biến a ở hàm main đã được thay đổi thành 20 nên khi chạy chương trình sẽ đưa ra kết quả 20 chứ không phải là 10 như lúc ban đầu.  

Trường hợp biến cục bộ khi có biến toàn cục trùng tên ta sẽ sử dụng **operator ::** để truy cập đến biến toàn cục của cả chương trình (biến toàn cục cha) mà ta muốn.  

Xét đoạn chương trình sau:  
```
#include <iostream>
using namespace std;
    
int x = 5;

int main()
{
    int x = 10;
    cout << "Bien cua bo cua x la: " << x << endl;
    cout << "Bien toan cuc cua x la: " << ::x << endl;
    return 0;
}
```
Khi sử dụng **operator ::** trình biên dịch sẽ trích xuất biến toàn cục cha, khi không sử dụng thì trình biên dịch sẽ lấy giá trị của biến **x** trong hàm main và đây là kết quả khi chạy chương trình:  
```
Bien cua bo cua x la: 10
Bien toan cuc cua x la: 5
```
Các bạn nên lưu ý rằng, operator :: chỉ lấy biến toàn cục cha chứ không lấy các biến toàn cục ở bên trong các hàm. Nghĩa là ví dụ trên, biến x ở dòng 4 là biến toàn cục cha, và biến x ở dòng 8 là biến toàn cục (vừa là biến cục bộ) ở bên trong hàm main.  

Ngoài biến ra, ta còn sử dụng “hằng” khi không muốn giá trị bị thay đổi trong suốt thời gian chương trình chạy.  

**Cách khai báo hằng trong C++:**  
```
const <kiểu dữ liệu> <tên hằng> = <giá trị>
```
Ví dụ chương trình tính diện tích hình tròn với số pi được sử dụng làm hằng số:
```
#include <iostream>
using namespace std;
    
const float PI = 3.14;

int main()
{
    float banKinh = 5.2;
    float dienTich = banKinh * banKinh * PI;
    cout << "Dien tich hinh tron: " << dienTich;
    return 0;
}
```
Nếu như bạn cố tình thay đổi giá trị của PI như chương trình dưới đây, thì trình biên dịch sẽ báo lỗi:
```
#include <iostream>
using namespace std;
    
const float PI = 3.14;

int main()
{
    PI = 3.15; // Compile error
    return 0;
}
```
**Một số lưu ý khi sử dụng hằng:**
    - Việc khai báo hằng luôn luôn phải đi kèm với khởi tạo giá trị.
    - Người dùng có thể khởi tạo giá trị bất kì phù hợp với kiểu dữ liệu nhưng trong chương trình không được phép thay đổi giá trị của hằng.  
Ngoài cách sử dụng hằng như trên, ta cũng có thể dùng **define** thay thế.  

Cách sử dụng **define** trong C++:
```
#define <tên định nghĩa> <giá trị cần định nghĩa>
```
Ví dụ định nghĩa giá trị 3.14 cho PI:
```
#include <iostream>
#define PI 3.14

using namespace std;
    
const float PI = 3.14;

int main()
{
    cout << PI;
    return 0;
}
```
Ví dụ này tương tự với việc khai báo: const int PI = 3.14;  
Tuy nhiên, khuyến cáo các bạn hạn chế tối đa việc sử dụng **#define** để khai báo hằng số khi không cần thiết, thay vào đó bạn nên sử dụng cách khai báo **const**.  

Việc sử dụng **#define** để định nghĩa một đoạn code sẽ giúp cho code được ngắn gọn hơn nhưng vẫn giữ được tính chất vốn có của nó.  

Trong khi bình thường bạn phải viết như thế này:  
```
#include <iostream>
using namespace std;
int main()
{
    for(int i = 3; i <= 7; i++)
        cout << i << endl;
    for(int i = 3; i <= 7; i++)
        cout << 2*i << endl;
    return 0;
}
```
Bây giờ **#define** sẽ thể hiện sức mạnh của mình như sau:
```
#include <iostream>
#define FOR(i, a, b) for(int i = a; i <= b; i++)
#define out(x) cout << x << endl;
using namespace std;

int main()
{
    FOR(i, 3, 7)
        out(i);
    FOR(i, 4, 6)
        out(2*i);
    return 0;
}
```
Cả hai cách trên đều cho cùng một kết quả, điều này cho thấy việc sử dụng **#define** trong việc rút ngắn câu lệnh là khá tốt, tuy ngắn gọn là vậy nhưng việc định nghĩa này cần kinh nghiệm của người lập trình vì vậy code phổ thông là cách tốt nhất cho bạn.  
    

### Một số bài tập thực hành củng cố kiến thức:
1. Bạn hãy viết chương trình tạo ra 2 biến a và b kiểu số nguyên, gán giá trị cho a=125, b=25. Sau đó hiển thị ra màn hình tổng (a + b), hiệu (a  – b) , tích (a * b), chia lấy nguyên (a / b). _Gợi ý: Sử dụng kiểu int_.  
2. Cùng yêu cầu của bài trên nhưng bạn nhập dữ liệu cho 2 số nguyên a và b rồi in ra các kết quả.  
3. Bạn hãy viết chương trình nhập vào 2 kích thước của hình chữ nhật (không nhất thiết là số nguyên), sau đó hiển thị màn hình chu vi và diện tích của hình chữ nhật đó. _Gợi ý: Sử dụng kiểu float cho 2 biến kích thước_.  

## Lưu ý
1. Ta có thể khai báo nhiều biến cùng kiểu dữ liệu trên một dòng, cách nhau bởi một dấu phẩy và kết thúc bằng dấu chấm phẩy.

    `int a, a30 = 10, _cd = 0, d;`
    `float m, _bc, c50, y;`
    
    Cách khai báo này hoàn toàn hợp lệ để giúp cho code được “sạch”, và tránh việc khiến cho người đọc code bị loạn về kiểu dữ liệu của các biến.

2. Trong lúc lập trình, việc định nghĩa biến ở một nơi nào đó khá là quan trọng và bạn nên định nghĩa biến ở gần nơi sử dụng. Định nghĩa biến gần nơi sử dụng vì các lý do sau:
    - Định nghĩa tất cả biến ở đầu hàm sẽ khó xác định được ý nghĩa của biến đó cho đến khi tìm ra nơi sử dụng biến đó.
    - Định nghĩa biến ở nơi sử dụng chắc chắn rằng biến này không bị ảnh hưởng bởi những dòng lệnh phía trên, giúp thu hẹp phạm vi ảnh hưởng  tốt hơn.
    - Giảm thiểu khả năng biến định nghĩa mà không sử dụng, hoặc sử dụng biến chưa được khởi tạo, định nghĩa ngay khi sử dụng sẽ đảm bảo biến đó được dùng ngay.

3. Một thói quen nên làm mỗi khi lập trình là tập đặt tên biến bằng tiếng Anh để vừa code vừa cải thiện tiếng Anh cho bản thân. Bạn nên học các từ tiếng Anh chuyên ngành qua mỗi phần học mới để mở rộng vốn tiếng Anh đồng thời giúp tìm kiếm các tài liệu nước ngoài chuyên sâu về lĩnh vực đó trên Google dễ hơn.

4. Bên cạnh các nguyên tắc đặt tên biến, bạn nên đặt tên biến có ý nghĩa dễ hiểu, như vậy sẽ giúp bạn và các lập trình viên khác có thể dễ dàng làm việc cùng nhau, giữa những từ trong tên biến có thể phân cách bằng dấu gạch dưới(_) hoặc viết in hoa. Ví dụ để tính diện tích hình chữ nhật ta đặt tên biến như sau: chieuDai, chieuRong hoặc là chieu_dai, chieu_rong hoặc theo tên tiếng Anh là height, width (cách đặt bằng tên tiếng Anh này được dùng theo hệ trục tọa độ Oxy của Descartes, với height là trục Oy, và width là trục Ox tính từ điểm O(0, 0)).
   
***Hết***