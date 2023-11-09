THIẾT KẾ CSDL QUẢN LÝ TRANG THƯƠNG MẠI ĐIỆN TỬ SQL SERVER
------------------
 Bài toán:
Một trang thương mại điện tử muốn thiết kế cơ sở dữ liệu để quản lý các hoạt 
động buôn bán. Người dùng sau khi đăng ký tài khoản sẽ trở thành 
thành viên của trang thương mại điện tử.  
+ Thông tin thành viên gồm : mã thành viên, tên, sđt, địa chỉ, ngày tham 
gia, ngày sinh, gmail. Một thành viên có thể lập 1 hoặc nhiều shop để 
bán hàng. Thông tin shop gồm có : mã shop, tên shop, ngày lập , sdt, 
địa chỉ,chủ shop. Shop có thể kinh doanh 1 hoặc nhiều sản phẩm.  
+ Thông tin sản phẩm gồm có : mã sản phẩm, tên, nhà sản xuất, giá, 
danh mục. Thông tin nhà sản xuất bao gồm mã nsx, tên , nước sản 
xuất. Một thành viên có thể sở hữu 0 hoặc nhiều đơn hàng, 1 shop có 
nhiều đơn nhưng 1 đơn chỉ thuộc về 1 shop và 1 thành viên.  
+ Thông tin đơn hàng gồm : mã đơn, ngày lập, giá ban đầu, đơn vị vận 
chuyển, địa chỉ, số điện thoại khách, ngày giao thành công, tên khách 
hàng, hình thức thanh toán , voucher shop, voucher  vanchuyen, giá 
cuối cùng, giá vận chuyển cuối cùng, tổng tiền,shop.  
+ Thông tin đơn vị vận chuyển gồm : mã đơn vị, tên, địa chỉ. Đơn vị vận 
chuyển có nhiều nhân viên.  
+ Thông tin nhân viên: mã nhân viên, tên, giới tính , sdt. 1 nhân viên có 
thể vận chuyển nhiều đơn, 1 đơn được vận chuyển bởi 1 hoặc nhiều 
nhân viên .Thành viên có thể khiếu nại,trả tiền đơn hàng. 
+ Thông tin đơn khiếu nại gồm: mã đơn khiếu nại, ngày lập, người lập, 
shop, đơn hàng, lý do. 
