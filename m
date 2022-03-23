Content-Type: multipart/mixed; boundary="===============5925683309789204392=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:brauner/linux/fs.idmapped.overlayfs 9/18] fs/overlayfs/inode.c:1184 ovl_get_inode() warn: variable dereferenced before check 'lowerdentry' (see line 1115)
Date: Wed, 23 Mar 2022 10:16:35 +0800
Message-ID: <202203231031.8n97zs3f-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5925683309789204392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block brauner/linux/fs.idmappe=
d.overlayfs
head:   c3ec1253a179e5f2141b49da212f86ee64b8d49d
commit: 4d7eb3ec1e8ac09753cd97f2231f0dd2f23d5d7d [9/18] ovl: use ovl_path_g=
etxattr()() wrapper
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-m021-20220321 (https://download.01.org/0day-ci/arch=
ive/20220323/202203231031.8n97zs3f-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/overlayfs/inode.c:1184 ovl_get_inode() warn: variable dereferenced befor=
e check 'lowerdentry' (see line 1115)

Old smatch warnings:
fs/overlayfs/inode.c:1109 ovl_get_inode() error: we previously assumed 'low=
erpath' could be null (see line 1106)

vim +/lowerdentry +1184 fs/overlayfs/inode.c

01b39dcc95680b Amir Goldstein    2018-05-11  1097  =

ac6a52eb65b532 Vivek Goyal       2018-05-08  1098  struct inode *ovl_get_in=
ode(struct super_block *sb,
ac6a52eb65b532 Vivek Goyal       2018-05-08  1099  			    struct ovl_inode_=
params *oip)
51f7e52dc94346 Miklos Szeredi    2016-07-29  1100  {
610afc0bd40882 Miklos Szeredi    2020-09-02  1101  	struct ovl_fs *ofs =3D =
OVL_FS(sb);
ac6a52eb65b532 Vivek Goyal       2018-05-08  1102  	struct dentry *upperden=
try =3D oip->upperdentry;
ac6a52eb65b532 Vivek Goyal       2018-05-08  1103  	struct ovl_path *lowerp=
ath =3D oip->lowerpath;
09d8b586731bf5 Miklos Szeredi    2017-07-04  1104  	struct inode *realinode=
 =3D upperdentry ? d_inode(upperdentry) : NULL;
51f7e52dc94346 Miklos Szeredi    2016-07-29  1105  	struct inode *inode;
12574a9f4c9cc9 Amir Goldstein    2018-03-16  1106  	struct dentry *lowerden=
try =3D lowerpath ? lowerpath->dentry : NULL;
ac6a52eb65b532 Vivek Goyal       2018-05-08  1107  	bool bylower =3D ovl_ha=
sh_bylower(sb, upperdentry, lowerdentry,
ac6a52eb65b532 Vivek Goyal       2018-05-08  1108  					oip->index);
300b124fcf6ad2 Amir Goldstein    2019-11-19  1109  	int fsid =3D bylower ? =
lowerpath->layer->fsid : 0;
28166ab3c875b8 Vivek Goyal       2020-06-01  1110  	bool is_dir;
695b46e76b6244 Amir Goldstein    2018-03-15  1111  	unsigned long ino =3D 0;
acf3062a7e1ccf Amir Goldstein    2019-03-28  1112  	int err =3D oip->newino=
de ? -EEXIST : -ENOMEM;
6eaf011144af10 Amir Goldstein    2017-10-12  1113  =

09d8b586731bf5 Miklos Szeredi    2017-07-04  1114  	if (!realinode)
09d8b586731bf5 Miklos Szeredi    2017-07-04 @1115  		realinode =3D d_inode(=
lowerdentry);
09d8b586731bf5 Miklos Szeredi    2017-07-04  1116  =

6eaf011144af10 Amir Goldstein    2017-10-12  1117  	/*
764baba80168ad Amir Goldstein    2018-02-04  1118  	 * Copy up origin (lowe=
r) may exist for non-indexed upper, but we must
764baba80168ad Amir Goldstein    2018-02-04  1119  	 * not use lower as has=
h key if this is a broken hardlink.
6eaf011144af10 Amir Goldstein    2017-10-12  1120  	 */
31747eda41ef3c Amir Goldstein    2018-01-14  1121  	is_dir =3D S_ISDIR(real=
inode->i_mode);
764baba80168ad Amir Goldstein    2018-02-04  1122  	if (upperdentry || bylo=
wer) {
764baba80168ad Amir Goldstein    2018-02-04  1123  		struct inode *key =3D =
d_inode(bylower ? lowerdentry :
764baba80168ad Amir Goldstein    2018-02-04  1124  						      upperdentry);
31747eda41ef3c Amir Goldstein    2018-01-14  1125  		unsigned int nlink =3D=
 is_dir ? 1 : realinode->i_nlink;
b9ac5c274b8c9d Miklos Szeredi    2017-07-04  1126  =

01b39dcc95680b Amir Goldstein    2018-05-11  1127  		inode =3D ovl_iget5(sb=
, oip->newinode, key);
09d8b586731bf5 Miklos Szeredi    2017-07-04  1128  		if (!inode)
027065b726434d Vivek Goyal       2018-05-11  1129  			goto out_err;
09d8b586731bf5 Miklos Szeredi    2017-07-04  1130  		if (!(inode->i_state &=
 I_NEW)) {
b9ac5c274b8c9d Miklos Szeredi    2017-07-04  1131  			/*
b9ac5c274b8c9d Miklos Szeredi    2017-07-04  1132  			 * Verify that the un=
derlying files stored in the inode
b9ac5c274b8c9d Miklos Szeredi    2017-07-04  1133  			 * match those in the=
 dentry.
b9ac5c274b8c9d Miklos Szeredi    2017-07-04  1134  			 */
4b91c30a5a1933 Amir Goldstein    2018-01-18  1135  			if (!ovl_verify_inode=
(inode, lowerdentry, upperdentry,
4b91c30a5a1933 Amir Goldstein    2018-01-18  1136  					      true)) {
b9ac5c274b8c9d Miklos Szeredi    2017-07-04  1137  				iput(inode);
027065b726434d Vivek Goyal       2018-05-11  1138  				err =3D -ESTALE;
027065b726434d Vivek Goyal       2018-05-11  1139  				goto out_err;
b9ac5c274b8c9d Miklos Szeredi    2017-07-04  1140  			}
b9ac5c274b8c9d Miklos Szeredi    2017-07-04  1141  =

09d8b586731bf5 Miklos Szeredi    2017-07-04  1142  			dput(upperdentry);
9cec54c83a8bab Vivek Goyal       2018-05-11  1143  			kfree(oip->redirect);
09d8b586731bf5 Miklos Szeredi    2017-07-04  1144  			goto out;
09d8b586731bf5 Miklos Szeredi    2017-07-04  1145  		}
e6d2ebddbc5205 Miklos Szeredi    2017-07-04  1146  =

31747eda41ef3c Amir Goldstein    2018-01-14  1147  		/* Recalculate nlink f=
or non-dir due to indexing */
31747eda41ef3c Amir Goldstein    2018-01-14  1148  		if (!is_dir)
610afc0bd40882 Miklos Szeredi    2020-09-02  1149  			nlink =3D ovl_get_nli=
nk(ofs, lowerdentry, upperdentry,
610afc0bd40882 Miklos Szeredi    2020-09-02  1150  					      nlink);
5f8415d6b87ecb Amir Goldstein    2017-06-20  1151  		set_nlink(inode, nlink=
);
695b46e76b6244 Amir Goldstein    2018-03-15  1152  		ino =3D key->i_ino;
e6d2ebddbc5205 Miklos Szeredi    2017-07-04  1153  	} else {
764baba80168ad Amir Goldstein    2018-02-04  1154  		/* Lower hardlink that=
 will be broken on copy up */
0aceb53e73befe Amir Goldstein    2017-12-12  1155  		inode =3D new_inode(sb=
);
027065b726434d Vivek Goyal       2018-05-11  1156  		if (!inode) {
027065b726434d Vivek Goyal       2018-05-11  1157  			err =3D -ENOMEM;
027065b726434d Vivek Goyal       2018-05-11  1158  			goto out_err;
027065b726434d Vivek Goyal       2018-05-11  1159  		}
300b124fcf6ad2 Amir Goldstein    2019-11-19  1160  		ino =3D realinode->i_i=
no;
300b124fcf6ad2 Amir Goldstein    2019-11-19  1161  		fsid =3D lowerpath->la=
yer->fsid;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  1162  	}
62c832ed4e1b67 Amir Goldstein    2019-11-19  1163  	ovl_fill_inode(inode, r=
ealinode->i_mode, realinode->i_rdev);
62c832ed4e1b67 Amir Goldstein    2019-11-19  1164  	ovl_inode_init(inode, o=
ip, ino, fsid);
13c72075ac9f5a Miklos Szeredi    2017-07-04  1165  =

610afc0bd40882 Miklos Szeredi    2020-09-02  1166  	if (upperdentry && ovl_=
is_impuredir(sb, upperdentry))
13c72075ac9f5a Miklos Szeredi    2017-07-04  1167  		ovl_set_flag(OVL_IMPUR=
E, inode);
13c72075ac9f5a Miklos Szeredi    2017-07-04  1168  =

ac6a52eb65b532 Vivek Goyal       2018-05-08  1169  	if (oip->index)
0471a9cdb00ff4 Vivek Goyal       2018-03-20  1170  		ovl_set_flag(OVL_INDEX=
, inode);
0471a9cdb00ff4 Vivek Goyal       2018-03-20  1171  =

9cec54c83a8bab Vivek Goyal       2018-05-11  1172  	OVL_I(inode)->redirect =
=3D oip->redirect;
9cec54c83a8bab Vivek Goyal       2018-05-11  1173  =

a00c2d59e914b8 Vivek Goyal       2018-05-11  1174  	if (bylower)
a00c2d59e914b8 Vivek Goyal       2018-05-11  1175  		ovl_set_flag(OVL_CONST=
_INO, inode);
a00c2d59e914b8 Vivek Goyal       2018-05-11  1176  =

b79e05aaa16675 Amir Goldstein    2017-06-25  1177  	/* Check for non-merge =
dir that may have whiteouts */
31747eda41ef3c Amir Goldstein    2018-01-14  1178  	if (is_dir) {
4d7eb3ec1e8ac0 Christian Brauner 2022-03-22  1179  		struct path realpath =
=3D {
4d7eb3ec1e8ac0 Christian Brauner 2022-03-22  1180  			.dentry =3D upperdent=
ry ?: lowerdentry,
4d7eb3ec1e8ac0 Christian Brauner 2022-03-22  1181  			.mnt =3D upperdentry =
? ovl_upper_mnt(ofs) : lowerpath->layer->mnt,
4d7eb3ec1e8ac0 Christian Brauner 2022-03-22  1182  		};
4d7eb3ec1e8ac0 Christian Brauner 2022-03-22  1183  =

ac6a52eb65b532 Vivek Goyal       2018-05-08 @1184  		if (((upperdentry && l=
owerdentry) || oip->numlower > 1) ||

:::::: The code at line 1184 was first introduced by commit
:::::: ac6a52eb65b5327859135269c9374bf2ff731c9f ovl: Pass argument to ovl_g=
et_inode() in a structure

:::::: TO: Vivek Goyal <vgoyal@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5925683309789204392==--

