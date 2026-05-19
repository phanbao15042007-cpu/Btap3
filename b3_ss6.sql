CREATE DATABASE ss07_b3;
USE ss07_b3;

CREATE TABLE Students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Support_Tickets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT NOT NULL,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(id)
);

INSERT INTO Students (id, full_name, email) VALUES 
(1, 'Nguyễn Minh Anh', 'minhanh.nguyen@email.com'),
(2, 'Trần Hoàng Bách', 'bach.tran@email.com'),
(3, 'Lê Ngọc Diệp', 'diep.le@email.com'),
(4, 'Phạm Quốc Bảo', 'bao.pham@email.com'),
(5, 'Vũ Hải Đăng', 'dang.vu@email.com');

INSERT INTO Support_Tickets (content, student_id) VALUES 
('Lỗi không đăng nhập được vào hệ thống', 1),
('Quên mật khẩu, nhờ hỗ trợ lấy lại', NULL),
('Hỏi về lộ trình học Fullstack chuyên nghiệp', NULL),
('Video bài giảng số 5 bị mất tiếng', 2),
('Thanh toán học phí nhưng chưa được kích hoạt', 4);

SELECT email, full_name
FROM Students
WHERE id NOT IN (
    SELECT student_id
    FROM Support_Tickets
    WHERE student_id IS NOT NULL
);
