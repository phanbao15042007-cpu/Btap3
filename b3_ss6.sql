CREATE DATABASE ss06_b3;
USE ss06_b3;

-- NOT EXISTS (Dừng sớm): Chỉ cần quét thấy 1 giao dịch trong năm 2024 là nó dừng kiểm tra học viên đó và bỏ qua ngay lập tức Xử lý cực nhanh.
-- NOT IN: Phải quét toàn bộ bảng để tạo ra một "danh sách khổng lồ" chứa tất cả giao dịch 2024 rồi mới đem đi dò từng người Tốn RAM, cực chậm.

SELECT s.email
FROM Students s
WHERE NOT EXISTS (
    SELECT 1 
    FROM Payments p
    WHERE p.student_id = s.id 
      AND YEAR(p.payment_date) = 2024
);