-- drop database swp;
create database if not exists swp;
use swp;

-- create account table
create table if not exists accounts (
	accountID serial primary key,
    username char(20) unique not null,
    password char(50) not null,
    email char(100),
    avatar varchar(200) default 'default.png',
    name varchar(50) charset utf8mb4 default "Gây mê bỏ trốn",
    phone char(15),
    gender int default 0,
    address varchar(333) charset utf8mb4,
    dob date,
    role tinyint not null, -- 3 role: 0-admin, 1-doctor, 2-patient
    status tinyint not null
);
insert into accounts(username, password, email, name, role, status) 
			values("admin", "21232F297A57A5A743894A0E4A801FC3", "thanhlongvu156@gmail.com", "TLong", 0, 1);

insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('eashleigh0', 'A11EE40424B0878350BD10CAC3A617C7', 'eashleigh0@vistaprint.com', 'Emmalynn Ashleigh', '0089788550', 2, '1994-11-19', 1, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('tiglesias1', 'EC0311A1FA7EA17FE9D9F26CB0E624D8', 'tiglesias1@weather.com', 'Tracee Iglesias', '05773040125', 0, '1996-05-10', 2, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('mhellewell2', '49E497A316D38646F393E2F16B211468', 'mhellewell2@ehow.com', 'Moreen Hellewell', '01479399040', 0, '1991-07-29', 2, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('dcrombleholme3', '3C3776C534C6DFABE98290EADE641527', 'dcrombleholme3@t.co', 'Daisi Crombleholme', '05097749652', 0, '1993-12-29', 2, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('kreidshaw4', '9FBCE62ADFE382660C5FD3A44DE950B3', 'kreidshaw4@rediff.com', 'Karel Reidshaw', '05624151906', 0, '1994-07-30', 1, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('rbostock5', '975724A90BEED28B5ACB159DF218D75B', 'rbostock5@kickstarter.com', 'Richard Bostock', '0576821354', 1, '1998-01-07', 2, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('ayerrall6', '0FC13095421E1C5FA6280185FF705E52', 'ayerrall6@phpbb.com', 'Addison Yerrall', '01973848337', 0, '1999-07-04', 2, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('jloveless7', '6060FF5AC66248CE9CCB083FC07F3ED9', 'jloveless7@digg.com', 'Joletta Loveless', '0034310314', 2, '1991-12-15', 1, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('jissakov8', '799FF0A0FEAE6FBFCE9CF4CE2FEDF0D4', 'jissakov8@gnu.org', 'Jesse Issakov', '0884773366', 0, '1996-01-08', 1, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('amullineux9', 'BA828F841DCEACD52EE5CE22DA19F1D7', 'amullineux9@biblegateway.com', 'Abba Mullineux', '06854944187', 1, '1993-09-12', 1, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('mthorrolda', 'D1CDF84C5F07C032F7D4E1AF6BDA4183', 'mthorrolda@tripod.com', 'Margaretha Thorrold', '0604866744', 1, '1990-08-19', 2, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('aaberkirderb', '1B3AF563DA4498BE7C86B951760B0585', 'aaberkirderb@vk.com', 'Aurilia Aberkirder', '0001270364', 1, '1994-12-25', 1, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('mdarcyc', 'A52F2B6138C874A4F9DB51A561094719', 'mdarcyc@biblegateway.com', 'Mac d''Arcy', '07298596001', 0, '1992-11-29', 1, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('baismand', 'BE4CD4C98507891DF5E0A818C60E7D9B', 'baismand@csmonitor.com', 'Bobby Aisman', '0660810615', 2, '1998-06-05', 2, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('glimpennye', '33274D273943B3DFA91B1C6AE2C3BE3F', 'glimpennye@tinypic.com', 'Gracia Limpenny', '0527214234', 1, '1994-05-17', 2, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('jvaderf', '4AB0AB5E5976F627DE654D536BC0AB7E', 'jvaderf@lycos.com', 'Janot Vader', '08563870202', 1, '1995-01-30', 2, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('pbrieretong', '2BC97022B4A0B433977A219BA1C93A1E', 'pbrieretong@mozilla.com', 'Patience Briereton', '05736672099', 2, '1992-08-27', 2, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('gmackilpatrickh', '1DE419571D207E312A55C0B7098D0181', 'gmackilpatrickh@freewebs.com', 'Gweneth Mackilpatrick', '0975543138', 1, '1991-09-19', 2, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('hupexi', '4B614838D09C53D305BBEE81BD2E4D63', 'hupexi@smugmug.com', 'Haroun Upex', '0967140886', 1, '1993-10-08', 1, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('gjuanj', 'C33803B14E174CAF7B06B3DE5C91D468', 'gjuanj@cdc.gov', 'Guglielmo Juan', '0668886507', 1, '1997-11-16', 2, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('omeaghk', '3F3277783BA5EC669057E8E8D6AF4D5F', 'omeaghk@e-recht24.de', 'Olin Meagh', '0425070850', 0, '1996-06-12', 2, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('atorresl', 'A96CB60723D96FA0AC315D104D8A4A44', 'atorresl@weebly.com', 'Alfie Torres', '0838430907', 1, '1992-04-14', 1, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('dlocarnom', '046AAD93E28BBF4D0F89250025013543', 'dlocarnom@macromedia.com', 'Dehlia Locarno', '0408664366', 0, '1992-06-23', 2, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('mmcdermottrown', 'ECCC7FE76DE37CF27FE1A352B3034330', 'mmcdermottrown@cnn.com', 'Mavis McDermott-Row', '00112800592', 2, '1992-08-05', 1, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('coddyo', '5198B0C9BAFAF997B5E2B9B2EA7A722A', 'coddyo@newyorker.com', 'Corabel Oddy', '0641199156', 0, '1992-12-21', 2, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('bbelchampp', '63E872638E68A4ECC15A6A3B2E89947F', 'bbelchampp@independent.co.uk', 'Brendin Belchamp', '08689834442', 0, '1995-04-02', 1, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('bspentonq', '23B96D3098C6828D879AF6E3CE55D6BC', 'bspentonq@bbc.co.uk', 'Brigg Spenton', '07248412750', 0, '1991-06-18', 1, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('cdurwardr', 'BCA49E9DD731FC09EFF0EEED6F420D8F', 'cdurwardr@shinystat.com', 'Coletta Durward', '0653716460', 0, '1993-11-07', 1, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('cles', '66966E89625A5D9DDD02B84BABE1A741', 'cles@nih.gov', 'Clevie Le Pruvost', '09296423075', 0, '1994-07-04', 2, 1);
insert into accounts (username, password, email, name, phone, gender, dob, role, status) values ('aextert', 'B1D4FB7A0BDF5440329313FF99FAE7C8', 'aextert@samsung.com', 'Antonetta Exter', '05702226291', 1, '1994-08-03', 2, 1);       

-- create table slots
create table if not exists slots (
	slotID serial primary key,
    slot varchar(12) unique not null
);
insert into slots(slot) values ("Slot 1"), ("Slot 2"), ("Slot 3"), ("Slot 4"), ("Slot 5"), ("Slot 6");

-- create appointment table
create table if not exists appointments (
	appointmentID serial primary key,
    patientID bigint unsigned references accounts(accountID),
    bookedDate datetime,
    slotID bigint unsigned references slots(slotID),
    doctorID bigint unsigned references accounts(accountID),
    sympton varchar(1000) charset utf8mb4 not null,
    message varchar(1000) charset utf8mb4
);

-- create oncall table
create table if not exists oncall (
	doctorID bigint unsigned references accounts(accountID),
    bookedDate datetime,
    slotID bigint unsigned references slots(slotID)
);

delimiter $$
create trigger insert_appointment
after insert on appointments
for each row
begin
	insert into oncall values (new.doctorID, new.bookedDate, new.slotID);
end$$
delimiter ;

insert into appointments (patientID, bookedDate, slotID, doctorID, sympton) values(32, '2023-03-03', 2, 10, 'Headache');
insert into appointments (patientID, bookedDate, slotID, doctorID, sympton) values(32, '2023-03-03', 3, 10, 'Headache');

-- create services table
create table if not exists services (
	serviceID serial primary key,
    name varchar(100) charset utf8mb4 unique not null,
    price double not null,
    status tinyint not null -- 0: Disable, 1: Available
);

insert into services (name, price, status) values ('XQuang', 1000000, 1);

-- create medicines table
create table if not exists medicines (
	medicineID serial primary key,
    name varchar(100) charset utf8mb4 unique not null,
    brand varchar(100) charset utf8mb4,
    description varchar(100) charset utf8mb4
);

insert into medicines (name, brand, description) values ("Thuốc lắc", "VI", "Uống vào là lắc");

-- create categories table for blog
create table if not exists categories (
	categoryID serial primary key,
    categoryName varchar(20) charset utf8mb4
);

insert into categories (categoryName) values ('Casework');
insert into categories (categoryName) values ('Retaining Wall');
insert into categories (categoryName) values ('HVAC');
insert into categories (categoryName) values ('Framing');
insert into categories (categoryName) values ('Masonry');

-- create blogs table
create table if not exists blogs (
	blogID serial primary key,
    title varchar(500) charset utf8mb4 unique not null,
    thumbnails varchar(200) default "default_thumbnails.jpg",
    content text,
    categoryID bigint unsigned references categories(categoryID),
    createdDate datetime default now(),
    authorID bigint unsigned references accounts(accountID),
    status tinyint not null default 0, -- 2 status: 0-pending, 1-approved
    publishedDate datetime
);

insert into blogs (title, content, categoryID, authorID, status) values ('Tarzan Escapes', 'aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec', 3, 3, 1);
insert into blogs (title, content, categoryID, authorID, status) values ('Privilege', 'nec condimentum neque sapien placerat ante nulla justo aliquam', 5, 11, 1);
insert into blogs (title, content, categoryID, authorID, status) values ('In a Year', 'felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl', 5, 11, 1);
insert into blogs (title, content, categoryID, authorID, status) values ('Tyler Perry''s Temptation', 'nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis', 1, 11, 0);
insert into blogs (title, content, categoryID, authorID, status) values ('Last Chance Harvey', 'quisque id justo sit amet sapien', 5, 8, 1);
insert into blogs (title, content, categoryID, authorID, status) values ('Mark of the Cop', 'consequat varius integer ac leo', 3, 29, 0);
insert into blogs (title, content, categoryID, authorID, status) values ('La montana rusa', 'luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus', 1, 13, 1);
insert into blogs (title, content, categoryID, authorID, status) values ('Tom Jones', 'elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu', 3, 30, 1);
insert into blogs (title, content, categoryID, authorID, status) values ('Motorcycle Diaries, The (Diarios de motocicleta)', 'cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi', 2, 10, 0);
insert into blogs (title, content, categoryID, authorID, status) values ('Hard Man, The', 'ut ultrices vel augue vestibulum ante', 1, 25, 0);
insert into blogs (title, content, categoryID, authorID, status) values ('History Is Made at Night', 'nulla tempus vivamus in felis', 2, 11, 0);
insert into blogs (title, content, categoryID, authorID, status) values ('Snow on Tha Bluff', 'libero non mattis pulvinar nulla', 5, 14, 1);
insert into blogs (title, content, categoryID, authorID, status) values ('Room for Romeo Brass, A', 'ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero', 5, 23, 1);
insert into blogs (title, content, categoryID, authorID, status) values ('Billy Elliot', 'ipsum ac tellus semper interdum', 3, 15, 0);
insert into blogs (title, content, categoryID, authorID, status) values ('Doors, The', 'quam pharetra magna ac consequat', 5, 6, 1);

-- create examination table
create table if not exists examinations (
	examinationID serial primary key,
	patientID bigint unsigned references accounts(accountID),
    serviceID bigint unsigned references services(serviceID),
    doctorID bigint unsigned references accounts(accountID),
    createdDate datetime default now(),
    status tinyint not null, -- 0: Not paid, 1: Paid
    result text
);

-- create prescription table
create table if not exists prescriptions (
	prescriptionID serial primary key,
	patientID bigint unsigned references accounts(accountID),
    medicineID bigint unsigned references medicines(medicineID),
    instruction text,
    doctorID bigint unsigned references accounts(accountID)
);
