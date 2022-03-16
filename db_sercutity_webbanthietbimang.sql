--create database db_sercutity_webbanthietbimang
use db_sercutity_WebDienTu
create table authorities(
	[username] varchar(50) null,
	[authority] varchar(50) null
)
create table users
(
[username] varchar(50) NOT NULL primary key,
[password] varchar(68) null,
[enabled] tinyint
)


INSERT [dbo].[authorities] ([username], [authority]) VALUES (N'huy', N'ROLE_ADMIN')
INSERT [dbo].[authorities] ([username], [authority]) VALUES (N'len', N'ROLE_ADMIN')
INSERT [dbo].[authorities] ([username], [authority]) VALUES (N'loc', N'ROLE_ADMIN')

INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'huy', N'{bcrypt}$2a$10$12tNGY/2mOywEOYufGcLnuICjFl/Z3F/FWl4UAq2zcqUwZbFm/mdW', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'len', N'{bcrypt}$2a$10$9bWMlwdxwB.y6cUMSNjXTe4sFqkhWqXZSQpsKs6Pz6BbXklMggEl6', 1)
INSERT [dbo].[users] ([username], [password], [enabled]) VALUES (N'loc', N'{bcrypt}$2a$10$12tNGY/2mOywEOYufGcLnuICjFl/Z3F/FWl4UAq2zcqUwZbFm/mdW', 1)

