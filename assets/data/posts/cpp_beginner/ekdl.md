## **Giới thiệu**

Ép kiểu dữ liệu là một kĩ thuật nâng cao trong lập trình C++, kĩ thuật ép kiểu dữ liệu sẽ giúp ích rất nhiều trong quá trình lập trình, cũng như có thể là biện pháp duy nhất để giúp chương trình chúng ta chạy đúng.

Như vậy thì :
Trường hợp nào ta phải ép kiểu dữ liệu?

Vấn đề nào sẽ phát sinh nếu chúng ta gán sai giá trị cho kiểu dữ liệu (ví dụ gán giá trị số thực cho biến số nguyên hay gán giá trị kí tự cho biến số nguyên).

### **Khái niệm chung**

*Ép kiểu dữ liệu là việc chuyển đổi qua lại giữa các kiểu dữ liệu, sao cho chương trình vẫn đáp ứng được yêu cầu bài toán đặt ra.*
	
_**Vậy trường hợp nào ta phải ép kiểu dữ liệu?**_

Trong một số bài toán, chúng ta muốn có sự chuyển biến qua lại giữa các kiểu dữ liệu với nhau, thuận tiện cho việc tính toán, đỡ phải tạo thêm biến phụ, cũng như phù hợp với yêu cầu của bài toán đặt ra,… dẫn đến việc ép kiểu dữ liệu là biện pháp bắt buộc phải tiến hành.

Chúng ta cùng xem xét đoạn code sau đây:

```
#include <iostream>
using namespace std;
int main()
{
    int x = 6;
    int y = 5;
    float thuong = x / y;
    cout << "Gia tri cua thuong" << thuong << endl;
    return 0;
}
```

Và kết quả in ra trong giao diện Console là:

![console](https://cdn.glitch.com/c16f71ef-e58b-4291-89f3-62975c2ebc7f%2Fz0.png?v=1596877815024)

Các bạn có thấy điểm gì lạ trên bài toán này không, rõ ràng mình thực hiện ``6/5`` và gán giá trị nhận được cho biến thuộc kiểu ``float``, do đó giá trị mà ta nhận được phải là ``1.2``, nhưng tại sao kết quả in ra là ``1``?

Điều này xuất phát từ nguyên nhân sau: ban đầu do chúng ta khởi tạo hai biến ``x,y`` thuộc kiểu ``int``, khi thực hiện ``x/y``, ta được kết quả là ``1.2``, lúc này chương trình sẽ chưa gán giá trị đó cho biến ``thuong`` ngay lập tức mà thực hiện quá trình đưa ``1.2`` về kiểu ``int`` (do lúc đầu 2 biến ``x,y`` ta khởi tạo là kiểu ``int``) bằng cách lấy phần nguyên (chứ không làm tròn) được 1 và sau đó gán giá trị cho biến ``thuong``.

Vậy làm cách nào để chương trình nhận được giá trị ``1.2``? Đó chính là nguyên nhân của _kĩ thuật ép kiểu dữ liệu_ được ra đời.

**Hướng dẫn sử dụng**

Có 2 dạng ép kiểu dữ liệu là *Ép kiểu ngầm định* và *Ép kiểu tường minh*.

**Ép kiểu ngầm định**:

_Ví dụ 1_: chúng ta cùng xem đoạn code bên dưới:

```
#include <iostream>
using namespace std;
int main()
{
    double x = 9.6;
    float y = x;
    cout << "gia tri cua bien y la: " << y << endl;
    return 0;
}
```

Chúng ta có giá trị của ``x`` có kiểu ``double`` là ``9.6``, bây giờ ta gán giá trị của của ``x`` cho biến ``y`` kiểu ``float``, sau đó ta in ra màn hình:

![console](https://cdn.glitch.com/c16f71ef-e58b-4291-89f3-62975c2ebc7f%2Fz1.png?v=1596877817268)

Giá trị của biến ``y`` vẫn là ``9.6``, hoàn toàn không có sự thay đổi gì, đó là do chương trình của chúng ta đã tự động _ép kiểu ngầm định_, chuyển từ kiểu ``double`` về kiểu ``float`` và do là cùng kiểu dữ liệu số thực.

Tuy nhiên, chúng ta cùng nhớ lại, kiểu float có kích thước ``4 byte``, kiểu ``double`` có kích thước ``8 byte``, việc gán giá trị từ biến có kích thước vùng nhớ lớn hơn cho biến cho kích thước vùng nhớ nhỏ hơn hoàn toàn có khả năng gây mất dữ liệu nếu không kiểm soát được giá trị của nó.

_Ví dụ 2_: chúng ta có đoạn code bên dưới
```
#include <iostream>
using namespace std;
int main()
{
    int x = 5;
    float y = x;
    cout << "gia tri cua bien y la: " << y << endl;
    return 0;
}
```

Và kết quả in ra màn hình Console như sau:

![console](https://cdn.glitch.com/c16f71ef-e58b-4291-89f3-62975c2ebc7f%2Fz3.png?v=1596877821591)

Trong quá trình compile đoạn code trên, chương trình cũng đã _ép kiểu ngầm định_ từ kiểu ``int`` sang kiểu ``float``(vì giá trị nguyên ``5`` có thể hiểu là ``5.0`` trong số thực), vì trong phạm vi kiểu ``float`` hoàn toàn chứa được giá trị ``5`` của biến ``x``.

Tuy nhiên nếu chúng ta gán giá trị có kiểu ``char`` cho kiểu số nguyên thì thế nào, liệu chương trình của chúng ta có bị lỗi không?
```
#include <iostream>
using namespace std;
int main()
{
    char ch = 'A';
    int gia_tri = ch;
    cout << "Gia tri cua 'A' la: " << gia_tri << endl; 
    return 0;
}
```
Và kết quả:

![console](https://cdn.glitch.com/c16f71ef-e58b-4291-89f3-62975c2ebc7f%2Fz5.png?v=1596877824029)

Chương trình chúng ta hoàn toàn không bị lỗi, và sẽ có nhiều bạn thắc mắc tại sao giá trị ở đây là ``65``, thực chất kết quả ``65`` mà ta nhận được cũng xuất phát từ việc _ép kiểu ngầm định_ trong C++, ``65`` chính là giá trị của **A** trong bảng mã _Ascii_ được ép kiểu ngầm định từ kiểu ``char`` sang kiểu ``int``, còn bảng mã _Ascii_ là gì thì các bạn sẽ được tìm hiểu rõ hơn trong bài Kiểu kí tự các bạn nha!

  
  

**Ép kiểu tường minh:**

Ép kiểu tường minh là phương pháp ép kiểu chỉ rõ ra kiểu dữ liệu mà lập trình viên muốn trả về cho biến, nhưng vẫn cần phải cần thận trong việc đảm giá trị trả về nằm trong phạm vi chứa của biến.

Quay lại với ví dụ đầu tiên, liệu có cách nào cho chương trình chúng ta chạy ra đúng kết quả mà không phải sửa lại kiểu dữ liệu của biến ``x`` và ``y`` không?

**Dùng phương pháp C-style casts:**

Chúng ta cùng xem đoạn chương trình sau:
```
#include <iostream>
using namespace std;
int main()
{
    int x = 6;
    int y = 5;
    float thuong = float(x) / y;
    cout << "gia tri cua bien thuong la:" << thuong << endl;
    return 0;
}
```
Và ta cùng xem kết quả:

![console](https://cdn.glitch.com/c16f71ef-e58b-4291-89f3-62975c2ebc7f%2Fz7.png?v=1596877827161)

Nhờ vào dòng 
```
float thuong = float(x) / y;
```
mình đã đưa giá trị của ``x`` về kiểu ``float``, sau đó biến y cũng sẽ bị ép về kiểu float để thực hiện phép chia hai số thực.

Tuy nhiên phương pháp ``C-style casts`` không được khuyến khích sử dụng, vì chương trình không kiểm tra được tính đúng sai trong thời gian compile nên có thể gây ra những phát sinh ngoài ý muốn.

**Phương pháp Static casts:**
```
#include <iostream>
using namespace std;
int main()
{
    int x=6;
    int y=5;
    float thuong = static_cast <float> (x)/y;
    cout<<"gia tri cua bien thuong la: "<<thuong<<endl;
    return 0;
}
```
Giá trị nhận được trong chương trình vẫn là _1.2_ như ta mong muốn, nhưng phương pháp ép kiểu dùng ``Static casts`` được khuyến khích sử dụng do được kiểm tra tại thời điểm compile nên sẽ tránh những lỗi ngoài ý muốn của chúng ta.

Ngoài ra chúng ta còn có thể ép từ kiểu char về kiểu int, ví dụ như bên dưới:

```
#include <iostream>
using namespace std;
int main()
{
    char ch = 'A';
    int gia tri ascii = static_cast <int> (ch);
    cout<<"gia tri Ascii: "<<gia_tri ascii<<endl;
    return 0;
}
```

Và giá trị nhận được:

![console](https://cdn.glitch.com/c16f71ef-e58b-4291-89f3-62975c2ebc7f%2Fz10.png?v=1596877829205)

Chúng ta đã nhận được giá trị _Ascii_ của **A** là ``65``.

  
  

**Kết luận:**

⇨ _Ép kiểu ngầm định là việc ép kiểu do trình biên dịch tự thực hiện, không có sự can thiệp của lập trình viên, nên do đó trong không ít trường hợp dẫn đến lỗi trong chương trình._

⇨ _Ép kiểu tường minh là ép kiểu theo chủ đích của lập trình viên, do đó sẽ hạn chế được những lỗi phát sinh trong chương trình, trong đó ép kiểu theo phương pháp _**Static casts**_ được khuyên dùng._

  
**Lưu ý:**

> 1.  Ép kiểu dữ liệu là một kĩ thuật thuộc phần kiến thức nâng cao, và trong lập trình có rất nhiều kĩ thuật ép kiểu dữ liệu, chúng mình chỉ giới thiệu với các bạn những kĩ thuật ép kiểu đơn giản, phù hợp với các bạn bắt đầu học lập trình. Các bạn nên tham khảo thêm trong nhiều nguồn tài liệu, vì còn rất nhiều kĩ thuật ép kiểu khác, sẽ giúp ích các bạn trong quá trình học tập.
    
> 2.  Khi tiến hành ép kiểu tường minh, nên đảm bảo giá trị ép kiểu nằm trong phạm vi chứa của biến để tránh những lỗi đáng tiếc xảy ra.

***Hết***