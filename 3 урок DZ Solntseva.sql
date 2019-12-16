drop database if exists vk;
create database vk;
use vk;

drop table if exists users;   #проверили, что нет таблицы
create table users(
	id serial primary key,
	firstname varchar(100),
	lastname varchar(100),
	email varchar(100) unique,
	passsword_hash varchar(100),
	phone varchar(12),
	
	index users_phone_idx(phone),
	index (firstname, lastname)
	
);

drop table if exists `profiles`;
create table `profiles`(
	user_id serial primary key,
	gender char(1),
	birthday date,
	photo_id BIGINT unsigned null,
	hometown varchar(100),
	created_at datetime default now()
);

alter table `profiles` add constraint fk_user_id
	foreign key (user_id) references users(id)
	on update cascade
	on delete restrict
;

drop table if exists messages;
create table messages(
	id serial primary key,
	from_user_id BIGINT unsigned not null,  #кто написал
	to_user_id BIGINT unsigned not null,  #кому написали
	body text,
	created_at datetime default now(),

	index (from_user_id),
	index (to_user_id),
	foreign key (from_user_id) references users(id),
	foreign key (to_user_id) references users(id)
		
);

drop table if exists friend_reqests;
create table friend_requests(
	initiator_user_id BIGINT unsigned not null,
	target_user_id BIGINT unsigned not null,
	`status` enum('requested','approved','unfriended','declined'),
	created_at datetime default now(),
	updated_at datetime,
	
	primary key (initiator_user_id, target_user_id),
	index (initiator_user_id),
	index (target_user_id),
	foreign key (initiator_user_id) references users(id),
	foreign key (target_user_id) references users(id)
);

#связь многое ко многим
drop table if exists communities;
create table communities(
	id serial primary key,
	name varchar(200),
	
	index (name)
);

#связь многое ко многим
drop table if exists users_communities;
create table users_communities(
	user_id BIGINT unsigned not null,
	community_id BIGINT unsigned not null,
	
	primary key (user_id, community_id),
	foreign key (user_id) references users(id),
	foreign key (community_id) references communities(id)
);

drop table if exists media_types;
create table media_types(
	id serial primary key,
	name varchar(200)
);

drop table if exists media;
create table media(
	id serial primary key,
	media_type_id BIGINT unsigned not null,
	user_id BIGINT unsigned not null,
	body text,
	filename varchar(255),
	`size` int,
	meadata JSON,
	created_at datetime default now(),
	update_at datetime default current_timestamp on update current_timestamp,
	
	index (user_id),
	foreign key (user_id) references users(id),
	foreign key (media_type_id) references media_types(id)
);

drop table if exists likes;
create table likes(
	id serial primary key,
	user_id BIGINT unsigned not null,
	media_id BIGINT unsigned not null,
	created_at datetime default now()
);

drop table if exists photo_albums;
create table photo_albums(
	id serial,
	user_id BIGINT unsigned not null,
	name varchar(200),
	
	primary key(id),
	foreign key (user_id) references users(id)
	);

drop table if exists photos;
create table photos(
	id serial primary key,
	media_id BIGINT unsigned not null,
	album_id BIGINT unsigned not null,
	
	foreign key (media_id) references media(id),
	foreign key (album_id) references photo_albums(id)
);

drop table if exists videos;
create table videos(
	id serial primary key,
	videos_id BIGINT unsigned not null,
	name varchar(200),
	created_at datetime default now(),
    
	index (name),
	foreign key (videos_id) references users(id)
);

drop table if exists friends;
create table friends(
	id serial primary key,
	firstname varchar(100),
	lastname varchar(100),
	phone varchar(12),
	friends_media BIGINT unsigned not null,
	friend_id BIGINT unsigned not null,
	
	index friends_phone_idx(phone),
	index (firstname, lastname),
	
	foreign key (friend_id) references users(id)

);

drop table if exists friends_news;
create table friends_news(
	id serial primary key,
	name_friend varchar(200),
	media_id_friend BIGINT unsigned not null,
	created_at datetime default now(),
	
	index (name_friend),
	foreign key (media_id_friend) references friends(id)

);
