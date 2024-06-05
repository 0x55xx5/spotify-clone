-- Supabase AI is experimental and may produce incorrect answers
-- Always verify the output before executing

create table
  album (
    id bigint primary key generated always as identity,
    judul text not null,
    penyanyi text not null,
    total_duration int not null,
    image_path text not null,
    tanggal_terbit timestamp with time zone not null,
    genre text default null
  );

insert into
  album
OVERRIDING SYSTEM VALUE  
values(
    1,
    'LEGEND',
    'JANNABI',
    6589,
    './assets/cover/album/legend.jpg',
    '2022-10-24',
    'RnB'
  );

insert into
  album
OVERRIDING SYSTEM VALUE 
values(
    2,
    'Dunia Batas',
    'Payung Teduh',
    2097,
    './assets/cover/album/dunia batas.jpg',
    '2010-10-10',
    'Pop'
  );

insert into
  album
OVERRIDING SYSTEM VALUE 
values(
    4,
    'Anything You Want',
    'Reality Club',
    236,
    './assets/cover/album/anything u want.jpg',
    '2022-07-24',
    'Pop'
  );

insert into
  album
OVERRIDING SYSTEM VALUE  
values
  (
    5,
    'Being Funny in a Foreign Language',
    'The 1975',
    262,
    './assets/cover/album/1975.jpg',
    '2021-11-23',
    'Pop'
  );

insert into
  album
OVERRIDING SYSTEM VALUE  
values
  (
    6,
    'Palette',
    'IU',
    217,
    './assets/cover/album/palette iu.jpg',
    '2018-05-07',
    'Kpop'
  );

insert into
  album
OVERRIDING SYSTEM VALUE  
values
  (
    7,
    'Bandaids',
    'Keshi',
    212,
    './assets/cover/album/bandaids.jpg',
    '2019-06-15',
    'Pop'
  );

insert into
  album
OVERRIDING SYSTEM VALUE  
values
  (
    8,
    'Ballads 1',
    'Joji',
    233,
    './assets/cover/album/ballads 1.jpg',
    '2020-03-06',
    'Pop'
  );

insert into
  album
OVERRIDING SYSTEM VALUE  
values
  (
    9,
    'Between 1&2',
    'TWICE',
    177,
    './assets/cover/album/between 1&2.jpg',
    '2021-12-17',
    'Kpop'
  );

insert into
  album
OVERRIDING SYSTEM VALUE  
values
  (
    10,
    'NewJeans 1st EP ''NewJeans''',
    'NewJeans',
    179,
    './assets/cover/album/new jeans.jpg',
    '2022-02-02'
  );


create table
  users (
    id bigint primary key generated always as identity,
    email text not null,
    password text not null,
    username text not null,
    isAdmin boolean not null
  );

insert into
  users
OVERRIDING SYSTEM VALUE  
values
  (
    1,
    'admin@gmail.com',
    '$2y$10$NybHFwaq63zOLqFqXrBuwuxfjG/rjQWnew/6tJXh14CN6ZlIKbMme',
    'admin',
    true
  );

insert into
  users
OVERRIDING SYSTEM VALUE  
values
  (
    2,
    'user@gmail.com',
    '$2y$10$xMUqNdFyDk50Fvj0jr96NOxcm6/S6FmWw3I9ZZ9Bi3VnLFioI1Mlq',
    'user',
    false
  );

insert into
  users
OVERRIDING SYSTEM VALUE  
values
  (
    3,
    'anca@gmail.com',
    '$2y$10$BTzcH/q2eql2bXQS1L8UQuOtnMwWdNGl6L6U9O8FWqnqpv05yd8.y',
    'anca',
    false
  );

insert into
  users
OVERRIDING SYSTEM VALUE  
values
  (
    4,
    'azka_cwok@gmail.com',
    '$2y$10$9E8AFStYwhJlf4WRETlarOCR4GnYoOYWc1jWf3gUZMyxFccq0/H4G',
    'azka_cwok',
    false
  );

insert into
  users
OVERRIDING SYSTEM VALUE  
values
  (
    5,
    'azka_cwek@gmail.com',
    '$2y$10$no.HTv34kotj305viqn56.nT.TvD06qzUOdPtVlXjBF5OSz.yImWW',
    'azka_cwek',
    false
  );

create table
  sessions (
    id bigint primary key generated always as identity,
    session_id text not null,
    user_id int not null,
    exp text not null,
    foreign key (user_id) references users (id) on delete restrict on update restrict
  );

insert into
  sessions(session_id,user_id,exp)
OVERRIDING SYSTEM VALUE  
values
  (
    '01dc3016f7298c784bb5b3410f56b28ae60bdcde98dbede598135f3c56f77047',
    4,
    '2022-10-28 07:00:09'
  );

insert into
    sessions(session_id,user_id,exp)
OVERRIDING SYSTEM VALUE  
values
  (
    '0a4e661529e7be339c42356dbc223ce8889baf8440e4a1e16f9d26e60b8cc41f',
    1,
    '2022-10-26 16:15:38'
  );

create table
  song (
    id bigint primary key generated always as identity,
    judul text not null,
    penyanyi text default null,
    tanggal_terbit timestamp with time zone not null,
    duration int not null,
    audio_path text not null,
    image_path text default null,
    album_id int default null,
    genre text default null,
    foreign key (album_id) references album (id)
  );

insert into
  song
OVERRIDING SYSTEM VALUE  
values
  (
    1,
    'for lovers who hesistate',
    'JANNABI',
    '2022-10-24',
    15,
    './assets/music/jannabi.mp3',
    './assets/cover/song/legend.jpg',
    1,
    'RnB'
  );

create table
  subscription (
    creator_id int not null,
    subscriber_id int not null,
    creator_name text not null,
    subscriber_name text not null,
    status text not null default 'PENDING',
    primary key (creator_id, subscriber_id)
  );

insert into
  subscription
OVERRIDING SYSTEM VALUE  
values
  (0, 0, 'default', 'default', 'PENDING');

-- Supabase AI is experimental and may produce incorrect answers
-- Always verify the output before executing

insert into
  song
  OVERRIDING SYSTEM VALUE  
values(
    14,
    'Berdua Saja',
    'Payung Teduh',
    '2010-10-11',
    269,
    './assets/music/LAGUF1.MOBI -Berdua Saja.mp3',
    './assets/cover/song/dunia batas.jpg',
    2,
    'Pop'
  );

insert into
  song
  OVERRIDING SYSTEM VALUE  
values(
    15,
    'Menuju Senja',
    'Payung Teduh',
    '2010-10-12',
    308,
    './assets/music/Payung Teduh - Menuju Senja_O3_p9XYcLS0.mp3',
    './assets/cover/song/dunia batas.jpg',
    2,
    'Pop'
  );

insert into
  song
  OVERRIDING SYSTEM VALUE  
values(
    16,
    'Untuk Perempuan Yang Sedang Di Pelukan',
    'Payung Teduh',
    '2010-10-13',
    344,
    './assets/music/LAGUF1.MOBI -Untuk Perempuan Yang Sedang Di Pelukan.mp3',
    './assets/cover/song/dunia batas.jpg',
    2,
    'Pop'
  );

insert into
  song
  OVERRIDING SYSTEM VALUE  
values(
    17,
    'Rahasia',
    'Payung Teduh',
    '2010-11-14',
    379,
    './assets/music/Payung Teduh - Rahasia (Live Session)_zouhG8qcC40.mp3',
    './assets/cover/song/dunia batas.jpg',
    2,
    'Pop'
  );

insert into
  song
  OVERRIDING SYSTEM VALUE  
values(
    18,
    'Angin Pujaan Hujan',
    'Payung Teduh',
    '2010-10-15',
    212,
    './assets/music/LAGUF1.MOBI -Payung Teduh - Angin Pujaan Hujan.mp3',
    './assets/cover/song/dunia batas.jpg',
    2,
    'Pop'
  );

insert into
  song
   OVERRIDING SYSTEM VALUE 
values(
    19,
    'Resah',
    'Payung Teduh',
    '2010-10-17',
    243,
    './assets/music/LAGUF1.MOBI -Resah.mp3',
    './assets/cover/song/dunia batas.jpg',
    2,
    'Pop'
  );

insert into
  song
  OVERRIDING SYSTEM VALUE  
values(
    20,
    'Biarkan',
    'Payung Teduh',
    '2010-10-18',
    342,
    './assets/music/Payung Teduh - Biarkan.mp3',
    './assets/cover/song/dunia batas.jpg',
    2,
    'Pop'
  );

insert into
  song
  OVERRIDING SYSTEM VALUE  
values(
    21,
    'Anything You Want',
    'Reality Club',
    '2022-07-24',
    236,
    './assets/music/Reality Club - Anything You Want (Official Lyric Video).mp3',
    './assets/cover/song/anything u want.jpg',
    4,
    'Pop'
  );

insert into
  song
  OVERRIDING SYSTEM VALUE  
values(
    22,
    'Im In Love With You',
    'The 1975',
    '2021-12-16',
    262,
    './assets/music/The_1975_-_I_m_In_Love_With_You-CONNECTLOADED.COM.mp3',
    './assets/cover/song/1975.jpg',
    5,
    'Pop'
  );

insert into
  song
  OVERRIDING SYSTEM VALUE  
values(
    23,
    'Palette',
    'IU',
    '2015-05-10',
    217,
    './assets/music/IU - 팔레트 (Palette) (Feat. G-DRAGON) [129 kbps].mp3',
    './assets/cover/song/palette iu.jpg',
    6,
    'Kpop'
  );

insert into
  song
  OVERRIDING SYSTEM VALUE  
values(
    24,
    'Bandaids',
    'Keshi',
    '2019-06-17',
    212,
    './assets/music/(live) keshi - bandaids_dlhJIlfyA2A.mp3',
    './assets/cover/song/bandaids.jpg',
    7,
    'Pop'
  );

insert into
  song
  OVERRIDING SYSTEM VALUE  
values(
    25,
    'Glimpse of Us',
    'Joji',
    '2022-05-05',
    233,
    './assets/music/Joji - Glimpse of Us_FvOpPeKSf_4.mp3',
    './assets/cover/song/ballads 1.jpg',
    8,
    'Pop'
  );

insert into
  song
  OVERRIDING SYSTEM VALUE  
values(
    26,
    'Talk that Talk',
    'TWICE',
    '2022-01-01',
    177,
    './assets/music/TWICE - Talk that Talk [128 kbps].mp3',
    './assets/cover/song/between 1&2.jpg',
    9,
    'Kpop'
  );

insert into
  song
  OVERRIDING SYSTEM VALUE  
values(
    27,
    'Hype Boy',
    'NewJeans',
    '2022-02-03',
    179,
    './assets/music/NewJeans - Hype Boy [128 kbps].mp3',
    './assets/cover/song/new jeans.jpg',
    10,
    'Kpop'
  );