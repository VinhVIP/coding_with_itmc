## Giới thiệu

**Mảng** là kiểu dữ liệu có cấu trúc, dùng để chứa các phần tử có **cùng kiểu dữ liệu**. Để dễ hiểu hơn thì các bạn có thể tưởng tượng mảng như 1 cái khay với nhiều ngăn, mỗi ngăn chứa biến có cùng kiểu dữ liệu, và mỗi ngăn được đánh số thứ tự từ **0**. Trong lập trình, mảng thường được hay sử dụng không những vì tính đơn giản mà còn là do khả năng đáp ứng như cầu lưu trữ và quản lý dữ liệu.

Đặt ra vấn đề: Giáo viên cần lưu trữ điểm tổng kết của một lớp gồm 60 bạn, nếu chỉ khai báo biến theo cách thông thường thì chúng ta phải khai báo đến 60 biến, điều đó gây mất thời gian. Thay vào đó, chúng ta sử dụng **mảng**, với mỗi phần tử trong mảng chứa số điểm của mỗi sinh viên. Ở bài viết này, mình sẽ giới thiệu về **mảng 1 chiều tĩnh**.

## Khái niệm chung

**Mảng một chiều** là một dãy các phần tử có cùng **kiểu dữ liệu** và được đặt **liên tiếp nhau**. Mỗi phần tử có một **chỉ số riêng** và chỉ số của **phần tử đầu** mảng là 0. Ở mảng một chiều tĩnh, số lượng các phần tử là một số **cố định** và chỉ khai báo một lần duy nhất, vì thế chúng ta không thể thêm hoặc xóa đi một ô trong mảng.

### ***Khai báo mảng một chiều tĩnh:***

Để khai báo mảng một chiều tĩnh, có nhiều cách khác nhau nhưng trong đó phải đảm bảo những thông tin cần thiết sau đây:

– **Kiểu dữ liệu** của mảng (Cũng tức là kiểu dữ liệu của từng phần tử trong mảng) có thể là int, long, float,…

– **Tên mảng** (Quy tắc đặt tên mảng tương tự như quy tắc đặt tên cho biến).

– **Số lượng các phần tử** trong mảng (Có thể xem là kích thước của mảng) là một số nguyên dương.

## Cú pháp

-  Khai báo mảng 1 chiều rỗng:
```
kieuDuLieu  tenMang[kichThuoc];
```
VD: 
```
int  age[30];
```
Ở đây mình đã khai báo mảng một chiều có tên là **age**, gồm **30** phần tử là những **số nguyên**. Vì mình chưa đặt giá trị cho các biến trong mảng nên khi các phần tử trong mảng được khởi tạo thì có thể nó sẽ mang giá trị mặc định là **0** hoặc giá trị **rác** tùy vào Compiler (Trình biên dịch).

-  Khai báo và khởi tạo giá trị cho từng phần tử:
```
kieuDulieu tenMang[] = {giaTri1, giaTri2, giaTri3 … };
```
VD: 
```
int fibonacci[] = {1, 1, 2, 3, 5, 8};
```

Ở đây mình đã tạo mảng tên là **fibonacci** gồm có **6** phần tử mang những giá trị cụ thể, số lượng phần tử sẽ được tự động xác định thông qua số lượng các giá trị mình ghi trong cặp ngoặc nhọn **{ }**.

## Hướng dẫn sử dụng

![Ví dụ về mảng](resources:assets/data/posts/cpp_beginner/mang_image_1.jpg)

Để sử dụng một phần tử của một mảng nào đó, chúng ta cần quan tâm đến **chỉ số (index)** của phần tử cần sử dụng. **Giá trị của chỉ số** này luôn là một **số nguyên không âm**. Các phần tử trong mảng luôn được đánh chỉ số từ **0**, do đó phần tử đầu tiên của mảng sẽ có chỉ số là 0 và phần tử cuối cùng sẽ có giá trị là **(kichThuoc – 1)**. Ví dụ, mảng **fibonacci** phía trên có 6 phần tử thì phần tử đầu tiên(mang giá trị 1) sẽ có chỉ số là 0, và phần tử cuối cùng(mang giá trị 8) sẽ có chỉ số là 5.

Để truy xuất một phần tử thông qua chỉ số, ta có cú pháp sau:

```
<Tên mảng>[<chỉ số phần tử>]
```

Trong đó:

– **Tên mảng**: là tên của mảng chứa phần tử mà ta cần truy xuất.

– **chỉ số phần tử**: là chỉ số của phần tử mà ta cần truy cập.

Ví dụ, để in ra màn hình phần tử thứ 3 của mảng fibonacci thì ta sử dụng:
```
cout << fibonacci[2];
```

Khi ta truy xuất đến các phần tử thông qua chỉ số, những chỉ số này không nhất thiết phải là một giá trị hằng số (1, 2, 3…) mà còn có thể là một biểu thức số học, giá trị của biến,.. miễn là kết quả của các biểu thức này phải là một số nguyên không âm và nằm trong phạm vi kích thước của mảng.

##### Ví dụ:
```
int array[] = {1, 2, 3, 4, 5, 6};
int y = 2, x = 6;
float z = 2.5;
```
#### Các truy xuất hợp lệ:
```
cout << array[3];
cout << array[y];           // giá trị của y là 2 nên sẽ tương đương với cout << array[2];
cout << array[array[2]];    // giá trị của array[2] là 3 nên sẽ tương đương cout << array[3];
cout << array[x – y];       // giá trị của x-y là 4 nên tương đương với cout << array[4];
```
#### Các truy xuất không hợp lệ:
```
cout << array[-2];      //chỉ số là số âm.
cout << array[x];       //chỉ số lớn hơn chỉ số của phần tử cuối cùng của mảng.
cout << array[z];       //chỉ số không phải là số nguyên.
cout << array;          //thiếu chỉ số.
```
### *Nhập xuất mảng:*
Vì các phần tử của mảng được đánh các chỉ số theo thứ tự tăng dần nên ta có thể tận dụng vòng for để truy xuất lần lượt các phần tử của mảng.

##### Ví dụ:
```
#include <iostream>
using namespace std;
int main() {
    int arr[10];
    for (int i = 0; i < 10; i++){
        cin >> arr[i];  //nhập mảng.
    }
    for (int i = 0; i < 10; i++){
        cout << arr[i];  //xuất mảng.
    }
    return 0;
}
```

Mình tạo 1 mảng số nguyên tên là array với 10 phần tử.

Ở đây mình sử dụng 1 vòng lặp với i tăng dần từ 0 đến 9 để nhập giá trị cho các phần tử của mảng: i = 0 thì mình nhập vào giá trị cho array[0], i = 1 mình nhập array[1], … Cứ thế cho đến khi i = 9. Như vậy mình đã nhập lần lượt tất cả các phần tử của mảng array.

Tương tự với xuất mảng, mình cũng dùng vòng lặp để in ra lần lượt các phần tử của mảng, các phần tử in ra sát nhau.

## Lưu ý
- Ngôn ngữ C/C++ không kiểm tra giới hạn của mảng trong thời gian biên dịch cũng như thực thi chương trình. Có nghĩa là, việc sử dụng chỉ số mảng vượt quá kích thước của mảng sẽ không được hệ thống thông báo lỗi, do đó những lỗi liên quan đến dùng sai chỉ số mảng rất khó phát hiện dẫn đến chương trình chạy sai. Để đảm bảo an toàn, các bạn phải chú ý đến kích thước mảng để sử dụng chỉ số một cách hợp lý.

- Với biến, ta có thể sao chép giá trị của biến a cho biến b bằng cách gán b = a. Nhưng với mảng, **ta không thể** sao chép các giá trị của mảng A cho mảng B bằng cách gán B=A mà ta phải **gán lần lượt** các giá trị của các phần tử trong mảng B với các phần tử tương ứng ở mảng A **(2 mảng này phải có cùng số phần tử)**.

```
#include <iostream>
using namespace std;
int main() {
    int A[] = {1, 2, 3, 4};
    int B[] = {5, 6, 7, 8};
    for (int i = 0; i < 4; i++){
        B[i] = A[i];  //gán lần lượt phần tử mảng A cho mảng B.
    }
    // sau vòng for trên, mảng B = {1, 2, 3, 4}
    return 0;
}
```

***Hết***