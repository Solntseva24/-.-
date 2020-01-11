/*INSERT INTO `friends` VALUES ('1','Kelley','Ullrich','(214)086-909','0','1'),
('2','Caleb','Cronin','827.283.1762','0','2'),
('3','Mack','Kunze','1-430-894-64','0','3'),
('4','Dominique','McClure','893-762-3728','0','4'),
('5','Myra','Koss','(931)694-946','0','5'),
('6','Isabel','Deckow','06404857287','0','6'),
('7','Heloise','Leannon','00704594251','0','7'),
('8','Andrew','Beahan','(950)937-920','0','8'),
('9','Gladys','Abbott','(710)945-381','0','9'),
('10','Brendon','Fay','03034476335','0','10'); 
;  В ФАЙЛ ВСТАВКУ ДОБАВИЛА ДЛЯ НАГЛЯДНОСТИ (СГЕНЕРИРОВАНО И ВСТАВЛЕНО В VK2) */


select distinct firstname
from vk2.friends order by firstname asc;
