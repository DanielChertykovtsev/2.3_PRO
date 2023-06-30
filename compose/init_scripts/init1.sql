CREATE TABLE IF NOT EXISTS public.Clients (
    ID SERIAL PRIMARY KEY,
    Билет VARCHAR,
    ФИО VARCHAR,
    Адрес VARCHAR,
    Телефон VARCHAR,
    Дата_записи date 
); 

CREATE TABLE IF NOT EXISTS public.BookSerie (
    ID SERIAL PRIMARY KEY,
    Шифр varchar,
    Название varchar,
    Автор varchar,
    Год int,
    Объем int,
    Цена decimal,
    Количество int
); 

CREATE TABLE IF NOT EXISTS public.PrintCompany (
    ID SERIAL PRIMARY KEY,
    book_id INTEGER,
    title varchar,
    city varchar,
    FOREIGN KEY (book_id) REFERENCES BookSerie (Id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS public.Rent (
    ID SERIAL PRIMARY KEY,
    client_id INTEGER,
    book_id INTEGER,
    Выдана date,
    FOREIGN KEY (client_id) REFERENCES Clients (Id) ON DELETE SET NULL,
    FOREIGN KEY (book_id) REFERENCES BookSerie (Id) ON DELETE SET NULL
); 
CREATE TABLE IF NOT EXISTS public.Return (
    ID SERIAL PRIMARY KEY,
    Rent_ID INTEGER,
    Возврат date,
    FOREIGN KEY (Rent_ID) REFERENCES Rent (Id) ON DELETE SET NULL
); 
CREATE TABLE IF NOT EXISTS public.Lost (
    ID SERIAL PRIMARY KEY,
    client_id INTEGER,
    book_id INTEGER,
    Утеряна date,
    FOREIGN KEY (client_id) REFERENCES Clients (Id) ON DELETE SET NULL,
    FOREIGN KEY (book_id) REFERENCES BookSerie (Id) ON DELETE SET NULL
);