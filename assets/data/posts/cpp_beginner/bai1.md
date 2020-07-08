Khi chúng ta xem xét một chương trình C++, nó có thể được định nghĩa như là một tập hợp của các đối tượng, mà giao tiếp thông qua việc triệu hồi các phương thức của mỗi đối tượng đó. Dưới đây, chúng tôi miêu tả ngắn gọn ý nghĩa của class (lớp), object (đối tượng), method (phương thức) và các biến đối tượng:

**Đối tượng:** Đối tượng có các trạng thái và hành vi. Ví dụ: một đối tượng dog có các trạng thái là color, name, breed, và các hành vi là wagging, barking, eating. Một đối tượng là một minh họa của một lớp.

**Lớp** - Một lớp có thể được định nghĩa như là một template/blueprint, mà miêu tả hành vi/trạng thái mà đối tượng hỗ trợ.

**Phương thức** - Về cơ bản, một phương thức là một hành vi. Một lớp có thể chứa nhiều phương thức. Phương thức là nơi tính logic được viết, dữ liệu được thao tác và tất cả action được thực thi.

**Biến instance** - Mỗi đối tượng có tập hợp biến đối tượng duy nhất của nó. Trạng thái của một đối tượng được tạo ra bởi các giá trị được gán cho các biến đối tượng của nó.


#### Cấu trúc chương trình C++
Bạn theo dõi một đoạn code đơn giản sẽ in `Hello World`
```
#include <iostream>
using namespace std;

// Ham main() la noi su thuc thi chuong trinh bat dau

int main()
{
   cout << "Hello World"; // In dong chu Hello World
   return 0;
}
```
---
Chương trình trên có các phần sau:

- Ngôn ngữ C++ định nghĩa một số header, mà chứa thông tin cần thiết và hữu ích cho chương trình của bạn. Với chương trình này, header là `<iostream>` là cần thiết.

- Dòng `using namespace std;` nói cho compiler sử dụng std namespace. Namespace là phần bổ sung gần đây cho C++.

- Dòng tiếp theo `Ham main() la noi su thuc thi chuong trinh bat dau` là một comment đơn dòng trong C++. Các comment đơn dòng bắt đầu với `//` và kết thúc ở cuối dòng.

- Dòng _int main()_ là hàm main, tại đây việc thực thi chương trình bắt đầu.

- Dòng tiếp theo `cout << "Hello World";` để in dòng chữ "Hello World" trên màn hình.

- Dòng tiếp theo `return 0;` kết thúc hàm main() và làm nó trả về giá trị 0 tới tiến trình đang gọi.