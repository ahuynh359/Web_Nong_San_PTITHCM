Web Nông Sản
============================

## Sử dụng
Spring MVC, Bootstrap, SQL Server, Javascript, CSS, Tomcat, Eclipse, 

## Người thực hiện
| Họ tên                   | MSSV        |
| ------------------------ | ----------- |
| Nguyễn Đức Chí Danh      | N20DCCN009  |
| Huỳnh Ngọc Ánh           | N20DCCN003  |
| Phạm Thụy Dạ Thảo        | N20DCCN145  |

## Lưu ý
Các file .js trong bootstrap sẽ bị lỗi tuy nhiên chạy vẫn ok do thằng Eclipse không hiểu nên mình đã include trực tiếp nó

## Cấu trúc thư mục
    .
    ├── ...
    ├── src/main/java/tad           
    │   ├── admin                   # Admin 
    │   ├── bean                    # Bean   
    │   ├── DAO                     # Interface
    │   ├── DAOImpl                 # Phục vụ truy vấn CSDL
    │   ├── controller              # Controller
    |   ├── controller.admin             
    |   ├── controller.employee        
    │   ├── utils                   # Các lớp chức năng linh tinh
    │   ├── interceptor             # Cấu hình
    │   ├── entity                  # Thực thể
    │   └── utility                 # Thực thể
    │── i18-res                     # Các file ngôn ngữ
    │── src/main/webapp
    │   ├── assets
    │       ├── img                 # Chứa hình ảnh
    │       ├── css                 # Css
    │       ├── js                  # Javascript
    │   ├──META-INF
    │   ├──WEB-INF
    │       ├── configs                       
    │       ├── lib                 
    │       |── views               
    │       |   |── account                
    │       |   ├── admin           
    │       |   ├── cart            
    │       |   ├── category        
    │       |   ├── order           
    │       |   ├── page        
    │       |   ├── product          
    │       |   ├── search     
    │       |   ├── user
    │       |   ├── wishlist                      
    │       ├── web.xml 
    ├── ...

## Chức năng
    # Phía Client
    - Trang chủ
    - Tìm kiếm sản phẩm
    - Xem chi tiết sản phẩm
    - Xem loại sản phẩm
    - Wishlist
    - Giỏ hàng
    - Đánh giá sản phẩm
    - Mua sản phẩm
    - Hủy đơn hàng
    - Đánh giá sản phẩm
    - Lọc sản phẩm
    - Lọc comment
    - Thay đổi thông tin cá nhân
    - Thay đổi địa chỉ khi mua hàng
    - Thay đổi password
    - Thay dổi ngôn ngữ
    
    #Phía Employee
    - Có hết các tính năng của Client
    - Quản lí product
    - Quản lí voucher
    
     #Phía Admin
    - Có hết các tính năng của Client
    - Quản lí product
    - Quản lí voucher
    - Quản lí feedback
    - Quản lí loại sp
    - Quản lí order
## Hình Ảnh 

  ![24](https://github.com/ahuynh359/Web_Nong_San/assets/32415728/7b9afe8f-fcf2-4de8-af6c-2739968f328a)

   ![23](https://github.com/ahuynh359/Web_Nong_San/assets/32415728/b902bb44-2582-4346-b939-ab0facf8818c)
  


    
   ![20](https://github.com/ahuynh359/Web_Nong_San/assets/32415728/adf18391-a958-416f-ae85-e5c79bec8064)
    ![18](https://github.com/ahuynh359/Web_Nong_San/assets/32415728/576c4fb5-f35f-4a9d-90a5-33dbd8ccfb51)
    ![19](https://github.com/ahuynh359/Web_Nong_San/assets/32415728/6b1ab48d-3a13-48c2-9c13-a3285a78076f)

   ![12](https://github.com/ahuynh359/Web_Nong_San/assets/32415728/804a3646-6e2a-4bb5-8e9c-9166466d1138)




## Video Demo
https://www.youtube.com/watch?v=tTEv9z3x6Bk

## Điểm trừ
Database nên thiết kế thêm bảng Coupon Detail để lưu trữ sản phẩm nào đã từng áp dụng Coupon nào
Về phần admin và employee còn khá sơ sài (ko update được coupon) và một vài lỗi nhặt khác
Chưa tối ưu được code mạnh ai nấy code :)) 
    
## Báo cáo
[Báo cáo CNPM - Nhóm 08.docx](https://github.com/ahuynh359/Web_Nong_San/files/12907424/Bao.cao.CNPM.-.Nhom.08.docx)

