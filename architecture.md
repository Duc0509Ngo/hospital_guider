# Cấu trúc dự án

```js
lib                                      
├─ src                                   
│  ├─ business_logic                    
│  │  └─ cubits                           
│  │     ├─ `available_hours_cubit.dart` (Cung cấp giờ có thể khám bệnh)                    
│  │     ├─ `selected_date_cubit.dart` (Thể hiện ngày được chọn trên màng hình)                 
│  │     ├─ `selected_time.cubit.dart` (Thể hiện giờ được chọn trên màng hình)      
│  │     └─ `stt_cubit.dart` (Tạo số thứ tự)
│  │     
│  ├─ data                           
│  │  ├─ data_providers                          
│  │  │  ├─ `hours_provider.dart` (Cung cấp thời gian có thể từ database) 
│  │  │  ├─ `profile_user_provider.dart` (Gửi thông tin người đăng ký khám trên database)      
│  │  │  └─ `stt_provider.dart` (Nhận số thứ tự đã được đăng ký mới nhất)
│  │  │
│  │  └─ models                     
│  │     └─ `user.dart` 
│  │
│  └─ repositories                         
│  │  └─ `repository.dart` 
│  │
│  └─ views                           
│     ├─ routes                                       
│     │  └─ `router.dart` (Di chuyển giữa các màn hình)
│     ├─ screens                                     
│     │  ├─ `avaliable_hours_screen.dart`
│     │  ├─ `home_screen.dart`
│     │  └─ `payment_screen.dart`               
│     └─ utils                              
│        ├─ styles 
│        │  └─ `constants.dart` (Chứ theme của ứng dụng)
│        └─ `container_image.dart` (Khung thể hiện số thứ tự)               
│                             
├─ `app.dart` (Điểm khởi đầu của ứng dụng)                                   
└─ `main.dart` (Hàm main) 
