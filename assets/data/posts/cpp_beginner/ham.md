## Giới thiệu
Khi lập trình, để viết một chương trình giải các bài toán lớn người ta thường chia thành nhiều bài toán nhỏ để giải quyết. Những bài toán nhỏ sẽ được viết thành một dãy lệnh thực hiện các thao tác nhất định gọi là chương trình con hay hàm. Việc sử dụng hàm giúp tiết kiệm được công sức với những thao tác lặp lại nhiều lần cũng như  tiện cho việc kiểm tra và sửa lỗi. 

## Khái niệm chung
- Hàm là một nhóm lệnh, yêu cầu chương trình phải hoàn thành một công việc nào gì đó.
- Hàm có thể trả về một kiểu giá trị nào đó hoặc không.  

**Cú Pháp:**
```
Kiểu_Dữ_Liệu Tên_Hàm (Các_Tham_Số ){  
    // Tập lệnh mô tả thao tác của hàm;  
}
```

## Hướng dẫn sử dụng
**1, Kiểu dữ liệu trả về:**  
Dựa vào mục đích của Hàm sắp viết, mình sẽ xác định được kiểu dữ liệu trả về. Nếu Hàm dùng để giải quyết các biến đưa vào và thu lại một giá trị nào đó (có kiểu int, bool, char, string…), mình sẽ sử dụng kiểu dữ liệu được trả về đó. Nếu chỉ xử lý mà không cần trả về, có thể dùng kiểu void để khai báo hàm.  

**Ví dụ:** 
Một hàm trả về kiểu **int**:  
```
int Tong(int a, int b)
{
    return a+b;
}
```
Một hàm không trả về:
```
void Chao()
{
    cout << "Xin Chao cac ban!";
}
```

**2, Truyền biến - Tham trị và tham biến:**  
Trong Hàm con, những lệnh mà chúng ta viết thường sẽ sử dụng đến những giá trị bên ngoài mà ta truyền vào, thao tác lên những biến đó là cố định còn giá trị tham số vào thì không biết trước và phụ thuộc vào một số lệnh bên ngoài trước khi Hàm được gọi. Hàm con có thể có hoặc không truyền tham số.

Chúng ta có các kiểu truyền tham số:  
- **Tham trị** hay **tham số truyền giá trị**: là kiểu tham số mặc định của hàm. Khi ta gọi hàm, chương trình sẽ tạo ra các biến mới, copy giá trị được truyền vào, và tất cả các thay đổi sẽ chỉ diễn ra trên các biến mới này.
- **Tham biến** hay **tham số truyền biến**: là kiểu tham số mà sử dụng trực tiếp biến ta truyền vào mà không qua copy và tạo thêm biến, mọi tác động của chúng ta lên biến này đều sẽ thay đổi nó. Và cú pháp để truyền tham biến là thêm dấu ‘&’ liền trước tên biến:  
``` 
Kiểu_Dữ_liệu &tên_biến 
```
- **Tham số truyền con trỏ**: kiểu truyền này tuyền địa chỉ của ô nhớ của biến vào Hàm bằng cách thêm kí tự '*' liền trước tên biến:  
```
Kiểu_Dữ_Liệu *tên_biến;
 ```
- **Ví dụ:** Viết Hàm thực hiện hoán đổi hai số nguyên a và b. Cho input a = 11, b = 22 và in ra giá trị a, b sau khi hoán đổi.  
Nếu mình truyền tham trị Hàm sẽ như thế này:
```
void HoanDoi(int a, int b)
{
    int tmp = a;
    a = b;
    b = tmp;
}
```
Kết quả thu được:  
```
a = 11
b = 22
```  
***
Nếu mình truyền tham trị Hàm sẽ như thế này:
```
void HoanDoi(int &a, int &b)
{
    int tmp = a;
    a = b;
    b = tmp;
}
```  
Kết quả:
```
a = 22
b = 11
```
Sau khi đã khai báo tên hàm và truyền biến (hoặc không). Các bạn tiến hành viết khối lệnh mô tả chức năng của hàm đó trong  cặp dấu “{}”. Trong hàm, các biến được khai báo là **biến cục bộ**, các biến cục bộ này chỉ tồn tại và chỉ có thể sử dụng khi hàm được gọi và lệnh trong hàm đang được thực thi.

**3, Kết thúc chương trình con:**  
Như mình đã làm ở 2 ví dụ đầu. Hàm của chúng ta sẽ kết thúc khi gặp lệnh return ở bất cứ đâu. Và nếu chương trình con của bạn là chương trình có kiểu trả về thì chúng ta sẽ trả về giá trị đó bằng lệnh:  
```
    return gia_tri_tra_ve;
```
Nếu bạn không return thì sau khi thực hiện xong tất cả các lệnh, chương trình kết thúc.

---
## Bài tập ví dụ
**1,** Viết chương trình tính tổng giai thừa của n số nhập vào từ bàn phím. 
Code mẫu:  
```
#include <iostream>
using namespace std;

int GiaiThua(int n)
{
    int q = 1;
    for(int i = 2; i <= n; i++)
    {
        q *= i;
    }
    return q;
}
    
int main()
{
    int t, n, tong = 0;
    cin >> t;
    while (t--)
    {
        cin >> n;
        tong += GiaiThua(n);
    }
    cout << tong << endl;
    }
```

**2,** Viết chương trình có 2 hàm UCLN và BCNN. Sử dụng 2 hàm đó in ra tổng ước chung lớn nhất và bội chung nhỏ nhất của 2 số a và b nhập vào từ bàn phím.  
Code mẫu:
```
#include <iostream>
using namespace std;
    
int UCLN(int a, int b){
    if (a == 0 || b == 0)
    {
        return a+b; // uoc chung lon nhat se la a hoac b
    }
    while (a != b)
    {
        if (a > b)
        {
            a -= b;
        }
        else
        {
            b -= a;
        }
    }
    return a; // luc nay a = b;
}

int BCNN(int &a, int &b){
    return a*b/UCLN(a,b);
}

int main()
{
    int a, b;
    cin >> a >> b;
    cout << UCLN(a, b) + BCNN(a,b);
    }
```

### Lưu ý:  
Nhìn vào code bài tập ví dụ số 2. Chúng ta thấy hàm tìm ước chung lớn nhất được gọi bên trong của hàm tìm bội chung nhỏ nhất. Điều này chỉ được phép khi mình viết đã hàm UCLN() bên trên của hàm BCNN(). Còn nếu mình gọi một hàm trong quá trình code bên trên hàm đó (tức là gọi khi hàm đó chưa được viết) thì chương trình sẽ báo lỗi. Điều này đôi lúc khá bất tiện.  
Vậy nên để gọi được một hàm trước khi hàm đó được định nghĩa thì các bạn cần thêm **prototype** ở phần đầu chương trình.
## **Function Prototype - Nguyên mẫu hàm**  
**Function prototype** cung cấp cho trình biên dịch (complier) tên hàm, kiểu dữ liệu mà hàm trả về, các tham số và kiểu dữ liệu của tham số theo thứ tự giúp cho chương trình xác nhận các lời gọi hàm mà chưa cần định nghĩa.  
**Cách Khai báo:**
```
Kiểu_Dữ_Liệu Tên_Hàm(kiểu_dữ_liệu  tham_số_1, kiểu_dữ_liệu tham_số_2, ... kiểu_dữ_liệu  tham_số_n);
```

Với các **tham_số** thì các bạn có thể chỉ cần khai báo kiểu dữ liệu mà không cần khai báo tên biến cũng được.
- Ví dụ:
```
#include <iostream>
using namespace std;

int Tong(int a, int b);
int GiaiThua(int);
void Chao();
void HoanDoi(int &, int &);
int UCLN(int a, int b);
...
```
**Lưu ý:** khai báo **prototype** kết thúc phải có dấu ';'

***Hết***














    
