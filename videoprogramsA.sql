-- videoprograms.sql
drop table if exists domain;
drop table if exists offdomain;
drop table if exists allvideo;


create table domain (
VideoID varchar (100) not null primary key,
Program varchar (100),
Episode varchar (100),
VideoStart int
);

insert into domain
(VideoID, Program, Episode, VideoStart)
values
('UBC_ANV_2928783', 'Blindspark', 'Sent on Tour', 138270),
('UBC_ANV_2931827', 'Blindspark', 'Persecute Envoys', 128461),
('UBC_ANV_2936407', 'Blindspark', 'Authentic Flirt', 82786),
('UBC_ANV_2925087', 'Blindspark', 'Cede Your Soul', 64923),
('UBC_ANV_2922034', 'Blindspark', 'Split the Law', 31847),
('UBC_ANV_2918316', 'Blindspark', 'Bone May Rot', 21972),
('UBC_ANV_2915086', 'Blindspark', 'Eight Slim Grins', 15073);

create table offdomain (
`Content Partner` varchar (30),
Channel varchar (30),
`Series Title` varchar (100),
`Video Title` varchar (100),
Views int,
`Time Period` varchar (30),
`Programming Type` varchar (30),
Package varchar (30),
`Ad Model` varchar (30),
`Season Number` int,
`Episode Number` int,
`Video Length` time,
Sunrise date,
Sunset date,
ExternalID varchar (30),
`QC ID` varchar (30),
Region varchar (30),
ListID int not null primary key
);

insert into offdomain
(`Content Partner`, Channel, `Series Title`, `Video Title`, Views, `Time Period`, `Programming Type`, Package, `Ad Model`, `Season Number`, `Episode Number`, `Video Length`, Sunrise, Sunset, ExternalId, `QC Id`, Region, ListID)
values
('NS CP UBC.com', 'UBC', 'Blindspark', 'A Stray Howl',	3559,	'Nov-15', 'Full Episode', 'Classic', 'longform', 1, 2, '0:42:02', 9/29/2015, 11/3/2015, 'UBC_ANV_2910958', '60623972', 'US', 1),
('NS CP UBC.com', 'UBC', 'Blindspark', 'A Stray Howl', 39713, 'Nov-15', 'Full Episode', 'Plus', 'longform', 1, 2, '0:42:02', 9/29/2015, 11/3/2015, 'UBC_ANV_2910958', '60623972', 'US', 2),
('NS CP UBC.com', 'UBC', 'Blindspark', 'Authentic Flirt', 60823, 'Nov-15', 'Full Episode', 'Classic', 'longform', 1, 9, '0:43:09', 11/17/2015, 3/22/2016, 'UBC_ANV_2936407', '60649450', 'US', 3),
('NS CP UBC.com', 'UBC', 'Blindspark', 'Authentic Flirt', 666185, 'Nov-15', 'Full Episode', 'Plus', 'longform', 1, 9, '0:43:09', 11/17/2015, 3/22/2016, 'UBC_ANV_2936407', '60649450', 'US', 4),
('NS CP UBC.com', 'UBC', 'Blindspark', 'Bone May Rot', 20198, 'Nov-15', 'Full Episode', 'Classic', 'longform', 1, 4, '0:43:07', 10/13/2015, 11/17/2015, 'UBC_ANV_2918316', '60631767', 'US', 5),
('NS CP UBC.com', 'UBC', 'Blindspark', 'Bone May Rot', 188628, 'Nov-15', 'Full Episode', 'Plus', 'longform', 1, 4, '0:43:07', 10/13/2015, 11/17/2015, 'UBC_ANV_2918316', '60631767', 'US', 6),
('NS CP UBC.com', 'UBC', 'Blindspark', 'Cede Your Soul',	54931, 'Nov-15', 'Full Episode', 'Classic', 'longform', 1, 6, '0:42:55', 10/27/2015, 12/1/2015, 'UBC_ANV_2925087', '60639127', 'US', 7),
('NS CP UBC.com', 'UBC', 'Blindspark', 'Cede Your Soul', 524440, 'Nov-15', 'Full Episode', 'Plus', 'longform', 1, 6, '0:42:55', 10/27/2015, 12/1/2015, 'UBC_ANV_2925087', '60639127', 'US', 8),
('NS CP UBC.com', 'UBC', 'Blindspark', 'Eight Slim Grins', 12005, 'Nov-15', 'Full Episode', 'Classic', 'longform', 1, 3, '0:42:14', 10/6/2015, 11/10/2015, 'UBC_ANV_2915086', '60627365', 'US', 9),
('NS CP UBC.com', 'UBC', 'Blindspark', 'Eight Slim Grins', 118552, 'Nov-15', 'Full Episode', 'Plus', 'longform', 1, 3, '0:42:14', 10/6/2015, 11/10/2015, 'UBC_ANV_2915086', '60627365', 'US', 10),
('NS CP UBC.com', 'UBC', 'Blindspark', 'Persecute Envoys', 106807, 'Nov-15', 'Full Episode', 'Classic', 'longform', 1, 8,'0:42:20', 11/10/2015, 3/15/2016, 'UBC_ANV_2931827', '60645915', 'US', 11),
('NS CP UBC.com', 'UBC', 'Blindspark','Persecute Envoys', 1220074, 'Nov-15', 'Full Episode', 'Plus', 'longform', 1, 8, '0:42:20', 11/10/2015, 3/15/2016, 'UBC_ANV_2931827', '60645915', 'US', 12),
('NS CP UBC.com', 'UBC', 'Blindspark', 'Sent On Tour', 122596, 'Nov-15', 'Full Episode', 'Classic', 'longform', 1, 7, '0:42:16', 11/3/2015, 12/1/2015, 'UBC_ANV_2928783', '60642324', 'US', 13),
('NS CP UBC.com', 'UBC', 'Blindspark', 'Sent On Tour', 1315377, 'Nov-15', 'Full Episode', 'Plus', 'longform', 1, 7, '0:42:16',  11/3/2015, 12/1/2015, 'UBC_ANV_2928783', '60642324', 'US', 14),
('NS CP UBC.com', 'UBC', 'Blindspark', 'Series Premiere', 1,	'Nov-15', 'Full Episode', 'Classic', 'longform', 1, 1, '0:43:16', 9/22/2015, 10/27/2015, 'UBC_ANV_2904996', '60620192', 'US', 15),
('NS CP UBC.com', 'UBC', 'Blindspark', 'Split the Law', 28561, 'Nov-15', 'Full Episode', 'Classic', 'longform', 1,	5,  '0:43:07', 10/20/2015, 11/24/2015, 'UBC_ANV_2922034', '60635564', 'US', 16),
('NS CP UBC.com', 'UBC', 'Blindspark', 'Split the Law', 278625, 'Nov-15', 'Full Episode', 'Plus', 'longform', 1, 5, '0:43:07', 10/20/2015, 11/24/2015, 'UBC_ANV_2922034', '60635564', 'US', 17);


# Bridge Table
create table allvideo (
HuluVideoID int references offdomain (ExternalID),
PubVideoID int references domain (VideoID),
constraint primary key (HuluVideoID, PubVideoID)
);

#Select from internal "Domain" Table
select *
from domain;

# Select from external "Offdomain" Table
select *
from offdomain;

# JOIN using table aliases and the bridge table
select o.ListID, o.ExternalID, o.`Series Title`, o.`Video Title`, d.program, d.episode, o.package, o.Views, d.Videostart
from offdomain o
left join allvideo a on o.ListID = a.PubVideoID
left join domain d on o.ExternalID = d.VideoID
;

# Union of Two Tables
select
VideoID as `Video ID`,
Program as `Program Name`,
Episode as `Episode Title`,
'ondomain' as `Type`,
VideoStart as `Episode Start`
from domain

Union

select 
ExternalID as `Video ID`,
`Series Title` as `Program Name`,
`Video Title` as `Episode Title`,
Package as `Type`,
Views as `Episode Start`
from offdomain

order by `Episode Title`;











