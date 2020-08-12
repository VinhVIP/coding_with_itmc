## Giới thiệu
Ví dụ thể hiện nét tương đồng giữa switch-case và if-else.

| if-else | switch-case |
|:-------:|:-----------:|
| ![](resources:assets/data/posts/cpp_beginner/switch_image1.png) | ![](resources:assets/data/posts/cpp_beginner/switch_image2.png) |

## Khái niệm chung
Nó là một cái gì đó có phần giống if-else. Cụ thể là gì bạn sẽ biết sau bài viết này.

## Cú pháp
```
switch(bieu_thuc) {
    case bieu_thuc_hang_1:
        cac_cau_lenh_cua_case_1;
        break;
    case bieu_thuc_hang_2:
        cac_cau_lenh_cua_case_2;
        break;
    ...
    default:
        cac_cau_lenh_cua_default;
}
```

- Biểu thức ở đây hiểu là phép tính giữa các biến có kiểu dữ liệu bool, char, short, long, int...(biến có kiểu dữ liệu có thể ép về kiểu dữ liệu số nguyên).
- Biểu thức hằng ở đây hiểu là phép tính giữa các **hằng số** có kiểu dữ liệu bool, char, short, long, int …(hằng số có kiểu dữ liệu có thể ép về kiểu dữ liệu số nguyên).

## Hướng dẫn sử dụng
**Thứ tự thực hiện các cú pháp trên**
- Nếu **biểu thức hằng 1** bằng với **biểu thức** trong **switch** thì các câu lệnh trong **case 1** được thực hiện. 
	- Lệnh **break** sau các câu lệnh trong **case** giúp thoát khỏi switch sau khi các câu lệnh của **case** được thực hiện.
	- Nếu không có lệnh **break**, thì thay vì thoát khỏi **switch**, chương trình sẽ chạy tới đầu **case 2** để xét tiếp tương tự như **case 1**.
- Nếu không thì xét **biểu thức hằng 2**, tiếp theo tương tự như xét **biểu thức hằng 1**.
- Sau cùng nếu tất cả các **biểu thức hằng** đều khác với **biểu thức** thì các câu lệnh trong **default** được thực hiện. 
	- Ở đây không cần lệnh **break** để thoát khỏi **switch** vì các câu lệnh trong **default** là các câu lệnh cuối cùng của **switch** rồi, khi chạy xong thì chương trình cũng sẽ tự thoát ra khỏi **switch**.
	- Phần **default** không bắt buộc phải có trong **switch**, nó tương tự như phần **else** trong câu lệnh **if-else**.

## Ví dụ
Viết chương trình nhập vào tháng, in ra tháng đó có bao nhiêu ngày. Năm được xét ở đây là năm không nhuận, và số nhập vào đảm bảo là 1 tháng trong năm.

Gợi ý: Nhập vào tháng
- Nếu là tháng 1, 3, 5, 7, 8, 10, 12 thì có 31 ngày.
- Nếu là tháng 4, 6, 9, 11 thì có 30 ngày.
- Nếu là tháng 2 thì có 28 ngày.

**Lưu ý**
- Cần chú ý điều kiện biểu thức và biểu thức hằng được đề cập ở phần cú pháp khi sử dụng switch case.
- Bạn hoàn toàn có thể sử dụng if-else thay thế cho switch-case, như ví dụ đề cập ở phần mở đầu.

```
#include<iostream>
using namespace std;
int main() {
    int thang;
    cin >> thang;
    switch(thang) {
        case 2: 
            cout << "Thang nay co 28 hoac 29 ngay";
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            cout << "Thang nay co 30 ngay";
            break;
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            cout << "Thang nay co 31 ngay";
            break;
        default:
            cout << "Khong co thang nay";
    }
    return 0;
}
```

## TÀI LIỆU THAM KHẢO
[https://www.cplusplus.com/doc/tutorial/control/](https://www.cplusplus.com/doc/tutorial/control/)

[howkteam.vn/course/khoa-hoc-lap-trinh-c-can-ban/cau-dieu-kien-switch-trong-c-switch-statements-1345](howkteam.vn/course/khoa-hoc-lap-trinh-c-can-ban/cau-dieu-kien-switch-trong-c-switch-statements-1345)

[https://cpp.daynhauhoc.com/2/3-switch-case-statements/](https://cpp.daynhauhoc.com/2/3-switch-case-statements/)

[https://www.stdio.vn/article/cau-truc-re-nhanh-switch-case-trong-ngon-ngu-c-E2BLZ](https://www.stdio.vn/article/cau-truc-re-nhanh-switch-case-trong-ngon-ngu-c-E2BLZ)

[https://nguyenvanhieu.vn/lenh-switch-case-trong-c/](https://nguyenvanhieu.vn/lenh-switch-case-trong-c/)

***Hết***