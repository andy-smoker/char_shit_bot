CREATE TABLE weapons(
    title   TEXT NOT NULL  PRIMARY KEY,
    one_hand    TEXT NOT NULL DEFAULT "-",
    two_hand    TEXT NOT NULL DEFAULT "-",
    shoot   TEXT NOT NULL DEFAULT "-",
    range   TEXT NOT NULL DEFAULT "-"
 );


INSERT INTO weapons(title, two_hand) VALUES('Боевой тапор','1d10');
INSERT INTO weapons(title, one_hand) VALUES('Дубинка','1d4');
INSERT INTO weapons(title,shoot, range) VALUES('Арбалет','1d6','80/160/240');
INSERT INTO weapons(title,one_hand, shoot, range) VALUES('Кинжал','1d4','1d10','10/20/30');
INSERT INTO weapons(title,shoot,range) VALUES ('Дротик','1d4','20/40/60');
INSERT INTO weapons(title,one_hand) VALUES ('Цеп','1d6');
INSERT INTO weapons(title,two_hand) VALUES ('Удавка','1d4/3d4');
INSERT INTO weapons(title,one_hand, shoot, range) VALUES ('Ручной тапор','1d6','1d6','10/20/30');
INSERT INTO weapons(title,two_hand, shoot, range) VALUES ('Метательное копьё','1d4','1d6','30/60/90');
INSERT INTO weapons(title,two_hand) VALUES ('Трезубец','1d12');
INSERT INTO weapons(title,shoot, range) VALUES ('Длинный лук','1d6','70/140/210' );
INSERT INTO weapons(title, two_hand) VALUES ('Длинный меч','1d8');
INSERT INTO weapons(title,one_hand) VALUES ('Булава','1d6');
INSERT INTO weapons(title,two_hand) VALUES ('Алебарда','1d10');
INSERT INTO weapons(title,shoot, range) VALUES ('Короткий лук','1d6','50/100/150');
INSERT INTO weapons(title,one_hand) VALUES ('Короткий меч','1d6');
INSERT INTO weapons(title,shoot, range) VALUES ('Праща','1d4','40/80/160');
INSERT INTO weapons(title,two_hand) VALUES ('Копьё','1d8');
INSERT INTO weapons(title,two_hand) VALUES ('Посох','1d4');
INSERT INTO weapons(title,two_hand) VALUES ('Двуручный меч','1d10');
INSERT INTO weapons(title,two_hand) VALUES ('Боевой молот','1d8');

CREATE TABLE occupations(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    weapon_title TEXT NOT NULL,
    weapon_id TEXT NOT NULL,
    things TEXT NOT NULL
);

INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Алхимик','Посох','Посох','Масло, 1 флакон');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Дрессировщик','Дубинка','Дубинка','Пони');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Оружейник','Молоток','Дубинка','Железный молоток');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Астролог','Кинжал','Кинжал','Подзорная труба');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Парикмахер','Бритва','Кинжал','Ножницы');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Церковный сторож','Посох','Посох','Священный символ');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Пчеловод','Посох','Посох','Кувшин мёда');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Кузнец','Молоток','Дубинка','Стальные клещи');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Мясник','Тесак','Топор','Кусок говядины');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Охрана каравана','Короткий меч','Короткий меч','Льняная ткань, 1 ярд(10 метров)');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Сыродел','Дубина','Посох','Вонючий сыр');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Сапожник','Шило','Кинжал','Ложка для обуви');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Мошенник','Кинжал','Кинжал','Хороший плащ');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Бочар(делает бочки)','Лом','Дубинка','Бочка');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Лавочник','Нож','Кинжал','Фрукт');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Корманник','Кинжал','Кинжал','Маленький сундук');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Канавокопатель','Лопата','Посох','Комок грязи, 1 фунт(~0.5 кг)');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Дварфийский аптекарь','Дубина','Посох','Стальной зановес');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Дварфийский кузнец','Молоток','Дубинка','Мифрил, 1 унция (30г)');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Дварфийский кузнец','Молоток','Дубинка','Мифрил, 1 унция (30г)');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Дварфийский сундук','Зубило','Кинжал','Дерево 10 фунтов');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Дварфийский пастух','Посох','Посох','Pet');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Дварфийский шахтер','Кирка','Дубинка','Фонарь');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Дварфийский шахтер','Кирка','Дубинка','Фонарь');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Дварфийский грибовод','Лопата','Лопата','Мешок');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Дварфийский крысолов','Дубинка','Дубинка','Сеть');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Дварфийский каменщик','Молоток','Дубинка','Немного камней 10 фунтов');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Дварфийский каменщик','Молоток','Дубинка','Немного камней 10 фунтов');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Эльфийский ремесленник','Посох','Посох','Глина, 1 фунт');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Эльфийский барристер','Перо','Дротик','Книга');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Эльфийский лавочник','Ножницы','Кинжал','Свечи, 20 шт');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Эльфийский сокольничий','Кинжал','Кинжал','Сокол');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Эльфийский лесник','Посох','Посох','Травы, 1 фунт.');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Эльфийский лесник','Посох','Посох','Травы, 1 фунт.');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Эльфийский стеклодув','Молоток','Дубинка','Стеклянные бусы');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Эльфийский навигатор','Посох','Посох','Подзорная труба');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Эльфийский мудрец','Кинжал','Кинжал','Пергамент и гусиное перо');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Эльфийский мудрец','Кинжал','Кинжал','Пергамент и гусиное перо');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Фермер','Вилы','Трезубец','Pet');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Фермер(пшеница)','Вилы','Трезубец','Pet');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Фермер(репа)','Вилы','Трезубец','Pet');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Фермер(кукуруза)','Вилы','Трезубец','Pet');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Фермер(рис)','Вилы','Трезубец','Pet');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Фермер(пастернак)','Вилы','Трезубец','Pet');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Фермер(редис)','Вилы','Трезубец','Pet');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Фермер(брюква)','Вилы','Трезубец','Pet');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Фермер(картофель)','Вилы','Трезубец','Pet');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Гадалка','Кинжал','Кинжал','Карты таро');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Азартный игрок','Дубинка','Дубинка','Кубик');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Дерьмогрёб','Мастерок','Кинжал','Мешок с дерьмом');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Копатель могил','Лопата','Посох','Мастерок');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Копатель могил','Лопата','Посох','Мастерок');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Нищий из гильдии','Строп','Удавка','Костыли');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Нищий из гильдии','Строп','Удавка','Костыли');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Халфлинг курощуп','Ручной топор','Ручной топор','Куриное мясо, 5 фунтов');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Халфлинг моляр','Посох','Посох','Ткань, 3 ярда');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Халфлинг моляр','Посох','Посох','Ткань, 3 ярда');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Халфлинг перчаточник','Шило','Кинжал','Перчатки, 4 пары');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Халфлинг циган','Строп','Удавка','Марионетка');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Халфлинг галантерейщик','Ножницы','Кинжал','Изысканный костюм, 3 шт');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Халфлинг моряк','Нож','Кинжал','Парусина, 2 ярд(10 метров)');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Халфлинг растовщик','Короткий меч','Короткий меч','5 золотых, 10 серебрянных, 200 медных');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Халфлинг торговец','Короткий меч','Короткий меч','20 серебрянных');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Халфлинг бродяга','Дубинка','Дубинка','Чаша для подаяний');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Целитель','Дубинка','Дубинка','Святая вода');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Травник','Дубинка','Дубинка','Травы, 1 фунт.');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Пастух','Посох','Посох','Pet');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Охотник','Короткий лук','Короткий лук','Шкура оленя');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Охотник','Короткий лук','Короткий лук','Шкура оленя');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Наёмный работник','Посох','Посох','Медальон');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Шут','Дротик','Дротик','Шелковая одежда');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Ювелир','Кинжал','Кинжал','Самоцыеты стоимостью 20 золотых');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Слесарь','Кинжал','Кинжал','Инструменты');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Нищий','Дубинка','Дубинка','Сырный соус');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Наемник','Длинный меч','Длинный меч','Скрытая броня');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Торговец','Кинжал','Кинжал','4 золотых, 14 серебрянных, 27 медных');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Мельник / пекарь','Дубинка','Дубинка','Мука, 1 фунт');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Менестрель','Кинжал','Кинжал','Укулеле');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Благородный','Длинный меч','Длинный меч','Золотое кольцо стоимотстью 10 зл');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Сирота','Дубинка','Дубинка','Тряпичная кукла');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Конюх','Посох','Посох','Уздечка');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Изгой','Короткий меч','Короткий меч','Кожаная броня');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Канатный мастер','Нож','Кинжал','Канат, 100 футов');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Писарь','Дротик','Дротик','Пергамент, 10 листов');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Шаман','Булава','Булава','Травы, 1 фунт.');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Раб','Дубинка','Дубинка','Страный камень');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Контрабандист','Праща','Праща','Водонепроницаемый мешок');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Солдат','Копье','Копье','Шит');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Оруженосец','Длинный меч','Длинный меч','Стальной шлем');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Оруженосец','Длинный меч','Длинный меч','Стальной шлем');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Сборщик налогов','Длинный меч','Длинный меч','100 медных');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Траппер','Праща','Праща','Шкура барсука');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Траппер','Праща','Праща','Шкура барсука');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Беспризорник','Палка','Дубинка','Чаша для подаяний');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Тележный мастер','Дубинка','Дубинка','Cart');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Ткач','Кинжал','Кинжал','Изысканный костюм');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Ученик волшебника','Кинжал','Кинжал','Чёрный гримуар');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Дровосек','Топор','Топор','Связка дерева');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Дровосек','Топор','Топор','Связка дерева');
INSERT INTO occupations(name,weapon_title, weapon_id,things) VALUES('Дровосек','Топор','Топор','Связка дерева');


CREATE TABLE pets(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    value TEXT
);

INSERT INTO pets(value) VALUES('Собака');
INSERT INTO pets(value) VALUES('Овца');
INSERT INTO pets(value) VALUES('Коза');
INSERT INTO pets(value) VALUES('Корова');
INSERT INTO pets(value) VALUES('Утка');
INSERT INTO pets(value) VALUES('Гусь');
INSERT INTO pets(value) VALUES('Мул');
INSERT INTO pets(value) VALUES('Курица');


CREATE TABLE cart(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    value TEXT
);

INSERT INTO cart(value) VALUES('Помидоры');
INSERT INTO cart(value) VALUES('Ничего');
INSERT INTO cart(value) VALUES('Солома');
INSERT INTO cart(value) VALUES('Вы мертвы(в тележке ваш труп)');
INSERT INTO cart(value) VALUES('Грязь');
INSERT INTO cart(value) VALUES('Камни');