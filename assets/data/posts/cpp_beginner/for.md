## Giới thiệu

Trong cấu trúc lặp, ngoài **while** và **do-while** chúng ta còn có một cấu trúc nữa là **for**. Bài này mình sẽ nói về **for**, đây là một cấu trúc khá thông dụng trong lập trình. Tuy có một vài điểm khác biệt so với **while** nhưng **for** hoàn toàn có thể thay thế cho **while** và thường thì lập trình viên sẽ sử dụng **for** khi đã biết trước được số lần lặp.

## Khái niệm chung

**Cấu Trúc Lặp** khiến chương trình thực hiện lặp đi lặp lại một hoặc một khối các câu lệnh cho đến khi điều kiện đặt ra **không còn thõa mãn**.

So với vòng lặp **while** hay **do-while**, thì vòng lặp **for** thường được dùng vào những thuật toán với số lần lặp biết trước.

## Cú pháp

Cấu trúc vòng lặp for như sau: 
```
for(khoiTaoBien; dieuKien; capNhatBien) {
    khoiLenh;
}
```

#### Trong đó:

- **khoiTaoBien**: Đây là biểu thức khởi tạo các giá trị ban đầu cho các biến, những biến này thường dùng để kiểm tra điều kiện trong biểu thức *dieuKien*. Khác với while, biến vòng lặp có thể được khai báo và khởi tạo giá trị ngay bên trong phần khởi tạo của vòng lặp for. Phần khởi tạo này chạy đầu tiên và chỉ chạy 1 lần duy nhất khi bước vào vòng for.

- **dieuKien**: Giống với while, vòng lặp chỉ chạy khi điều kiện ở biểu thức này có giá trị **true**. Vòng lặp sẽ ngừng khi biểu thức có giá trị là **false**.

- **capNhatBien**: Phần này sẽ được chạy cuối mỗi lần lặp, tức là sau khi khối lệnh trong vòng lặp for được chạy. Phần này thường có nhiệm vụ thay đổi các giá trị của các **biến vòng lặp** được sử dụng trong biểu thức **dieuKien** (nhằm tránh tình trạng lặp vô hạn).

## **Hướng dẫn sử dụng**

Sơ đồ hoạt động:

![Sơ đồ hoạt động](resources:assets/data/posts/cpp_beginner/for_image_1.png)

Đầu tiên, khi bước vào **for**, chương trình sẽ khởi tạo **biến vòng lặp**. Tiếp đến chương trình sẽ kiểm tra biểu thức **dieuKien** (thường thì những **biến vòng lặp** được tạo ở bước đầu tiên sẽ được dùng trong biểu thức này). Nếu biểu thức **dieuKien** trả về **true** thì chương trình sẽ thực hiện khối lệnh cần lặp, sau đó sẽ thực hiện các lệnh cập nhật (thay đổi) các giá trị của biến vòng lặp (Các biến vòng lặp cũng có thể được thay đổi giá trị ngay trong lúc thực hiện khối lệnh nếu như ta cài vào đó những lệnh làm thay đổi biến vòng lặp). Sau khi cập nhật giá trị, chương trình sẽ quay lại xét điều kiện, và cứ liên tục như thế.

Nếu biểu thức **dieuKien** có giá trị **false** thì chương trình sẽ không thực hiện lặp mà nhảy tới câu lệnh tiếp theo ngoài vòng lặp.

Khai báo biến vòng lặp và điều kiện cùng với câu lệnh cập nhật sao cho vòng lặp chạy đúng số lần lặp mong muốn. (VD `for(int i = 0; i < 10; i++)` với vòng for này, mỗi lần lặp sẽ tăng i lên 1 đơn vị cho đến i = 9, khi i = 10 điều kiện trả về **false** nên dừng. Như vậy for đã lặp 10 lần).

#### Ví dụ:

***Bài toán đặt ra:*** Nhập n, in ra màn hình các số từ 1 đến n. 

Đầu tiên ta phân tích bài toán:

-Yêu cầu: in ra từ 1 đến n. Vậy thì mình cần lặp lại các công việc sau đây: in ra 1 số và tăng số đó lên một đơn vị để lần tiếp theo in ra.
Như vậy ta có thể vạch ra sơ bộ như sau:

- *Bước 1:* Nhập vào n.
- *Bước 2:* Tạo 1 biến `i = 1` (để mỗi vòng lặp in ra các giá trị i tăng dần).
- *Bước 3:* Nếu `i > n` thì không lặp nữa, đi đến *Bước 6*. Nếu `i <= n` tiếp tục tới *Bước 4*.
- *Bước 4:* In biến `i` ra màn hình (có thể in thêm dấu cách để các số rời nhau, dễ nhìn).
- *Bước 5:* Tăng `i` lên 1 đơn vị, quay lại *Bước 3*.
- *Bước 6:* Kết thúc chương trình.

Chương trình ví dụ:
```
#include <iostream>
using namespace std;
int main(){
    int n; 
    cin >> n;
    for(int i = 1; i <= n; i++){
        cout << i << " ";
    }
    return 0;
}
```

Ở đây mình lợi dụng biến **i**, do biến **i** tăng dần theo mỗi vòng lặp nên mình lợi dụng biến vòng lặp này để in ra các giá trị tăng dần luôn.

## Lưu ý

- Chúng ta cũng có thể dùng **break** để dừng vòng lặp hoặc **continue** để nhảy tới lần lặp kế tiếp.

- Để tạo vòng lặp vô hạn các bạn có thể ghi là **for( ; ; )**. Như vậy, các phần **khoiTaoBien**, **dieuKien** hoặc **capNhatBien** có thể có hoặc không nhưng phải đảm bảo có đủ 2 dấu **;** trong **for**. Nhưng mà trong ngoài các trường hợp đặc biệt, các bạn nên ghi đủ các thành phần để tránh gây khó khăn khi đọc cũng như quản lí code.

- Có thể lồng nhiều vòng lặp vào nhau.

- Trong một số trường hợp, vòng for không có thân, người ta sẽ sử dụng dấu chấm phẩy(;) khi kết thúc vòng lặp for để ngăn cách nó với những câu lệnh bên dưới.

#### Bài toán ví dụ: 
Vẽ hình chữ nhật làm từ các dấu * có chiều dài và chiều rộng được nhập từ bàn phím.

VD: nhập 5 3, in ra:

\*****

\*****

\*****

Như vậy ta có thể phân tích bài toán như sau:

- Để in ra cạnh trên của hình chữ nhật, mà trong ví dụ trên nó có chiều dài là 5, tức là ta phải in ra màn hình 5 dấu * liên tiếp, vậy thì phải dùng 1 vòng for chạy 5 lần để in ra 5 dấu *. Gọi đây là công việc A đi cho ngắn gọn. (A: in dấu * 5 lần)

- Mà in ra 5 dấu * thôi chưa đủ, ta phải in ra 3 lần như vậy. Như vậy ta phải tiếp tục dùng thêm 1 vòng lặp khác để thực hiện lặp lại công việc A. Gọi B là công việc thực hiện 3 lần công việc A. Vậy có nghĩa là ta phải lồng A vào mỗi vòng lặp của B. Tức là trong B chứa vòng lặp A để cứ mỗi lần B chạy 1 vòng lặp thì A sẽ chạy 5 lần để in ra 5 dấu *. B chạy 3 lần thì ta có 3 hàng có 5 dấu *.

Chuyển tất cả hướng trên thành trường hợp tổng quát và đưa vào code:

- Đặt biến x = chiều dài, y = chiều rộng.
- Gọi A là vòng lặp chạy từ 1 đến x, mỗi lần lặp thì in ra 1 đấu *. Tổng cộng sau khi chạy xong A thì ta sẽ có 1 hàng gồm có x dấu *.
- Gọi B là vòng lặp nhằm in ra y hàng có x dấu *. 

Như vậy ta chạy B từ 1 đến y, mỗi lần lặp thì chạy A để in ra 1 hàng có x dấu *. Sau khi chạy A xong thì ta xuống hàng để lần sau in ra hàng A trên một hàng mới.

Code mẫu:

```
#include <iostream>
using namespace std;
int main() {
    int x; //chieu dai 
    int y; //chieu rong
    cin >> x >> y;
    for(int i = 1; i <= y; i++){
        //cong viec B: thuc hien y lan cong viec A
        for(int j = 1; j <= x; j++){
            //cong viec A: in ra x dau *
            cout << "*";
        }
        cout << endl; //xuong hang.
    }
    return 0;
}
```

***Hết***