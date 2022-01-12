Content-Type: multipart/mixed; boundary="===============4194664129067747884=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11022/12034] fs/nfs/nfs4xdr.c:1199 encode_attrs() error: we previously assumed 'statx' could be null (see line 1182)
Date: Wed, 12 Jan 2022 23:58:26 +0800
Message-ID: <202201122353.4TAq2co0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4194664129067747884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Richard Sharpe <richard.sharpe@primarydata.com>
CC: Anna Schumaker <Anna.Schumaker@Netapp.com>
CC: Lance Shelton <lance.shelton@hammerspace.com>
CC: Trond Myklebust <trond.myklebust@hammerspace.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   32ce2abb03cfae17a9eb42bd6b1b619b72f23f20
commit: bc66f68057662bbe9d3057f6896a646f3e0d1e9a [11022/12034] NFS: Support=
 statx_get and statx_set ioctls
:::::: branch date: 10 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20112/202201122353.4TAq2co0-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/nfs/nfs4xdr.c:1199 encode_attrs() error: we previously assumed 'statx' c=
ould be null (see line 1182)
fs/nfs/nfs4proc.c:8035 _nfs4_set_nfs4_statx() error: we previously assumed =
'statx' could be null (see line 8026)

Old smatch warnings:
fs/nfs/nfs4xdr.c:1239 encode_attrs() error: we previously assumed 'umask' c=
ould be null (see line 1107)
fs/nfs/nfs4proc.c:1401 nfs4_opendata_alloc() error: we previously assumed '=
c' could be null (see line 1369)

vim +/statx +1199 fs/nfs/nfs4xdr.c

36b3743fef8861 Trond Myklebust     2018-03-20  1083  =

aa9c2669626ca7 David Quigley       2013-05-22  1084  static void encode_att=
rs(struct xdr_stream *xdr, const struct iattr *iap,
aa9c2669626ca7 David Quigley       2013-05-22  1085  				const struct nfs4_=
label *label,
28cf22d0ba283d Trond Myklebust     2017-05-06  1086  				const umode_t *uma=
sk,
bc66f68057662b Richard Sharpe      2021-12-27  1087  				const struct nfs4_=
statx *statx,
5334c5bdac926c Kinglong Mee        2015-08-26  1088  				const struct nfs_s=
erver *server,
28cf22d0ba283d Trond Myklebust     2017-05-06  1089  				const uint32_t att=
rmask[])
^1da177e4c3f41 Linus Torvalds      2005-04-16  1090  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  1091  	char owner_name[IDMAP=
_NAMESZ];
^1da177e4c3f41 Linus Torvalds      2005-04-16  1092  	char owner_group[IDMA=
P_NAMESZ];
^1da177e4c3f41 Linus Torvalds      2005-04-16  1093  	int owner_namelen =3D=
 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1094  	int owner_grouplen =
=3D 0;
8687b63afbe421 Al Viro             2006-10-19  1095  	__be32 *p;
d7067b2db78aab Trond Myklebust     2013-07-17  1096  	uint32_t len =3D 0;
d7067b2db78aab Trond Myklebust     2013-07-17  1097  	uint32_t bmval[3] =3D=
 { 0 };
^1da177e4c3f41 Linus Torvalds      2005-04-16  1098  =

^1da177e4c3f41 Linus Torvalds      2005-04-16  1099  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  1100  	 * We reserve enough =
space to write the entire attribute buffer at once.
^1da177e4c3f41 Linus Torvalds      2005-04-16  1101  	 */
28cf22d0ba283d Trond Myklebust     2017-05-06  1102  	if ((iap->ia_valid & =
ATTR_SIZE) && (attrmask[0] & FATTR4_WORD0_SIZE)) {
d7067b2db78aab Trond Myklebust     2013-07-17  1103  		bmval[0] |=3D FATTR4=
_WORD0_SIZE;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1104  		len +=3D 8;
d7067b2db78aab Trond Myklebust     2013-07-17  1105  	}
d7067b2db78aab Trond Myklebust     2013-07-17  1106  	if (iap->ia_valid & A=
TTR_MODE) {
28cf22d0ba283d Trond Myklebust     2017-05-06  1107  		if (umask && (attrma=
sk[2] & FATTR4_WORD2_MODE_UMASK)) {
dff25ddb48086a Andreas Gruenbacher 2016-12-02  1108  			bmval[2] |=3D FATTR=
4_WORD2_MODE_UMASK;
dff25ddb48086a Andreas Gruenbacher 2016-12-02  1109  			len +=3D 8;
28cf22d0ba283d Trond Myklebust     2017-05-06  1110  		} else if (attrmask[=
1] & FATTR4_WORD1_MODE) {
d7067b2db78aab Trond Myklebust     2013-07-17  1111  			bmval[1] |=3D FATTR=
4_WORD1_MODE;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1112  			len +=3D 4;
d7067b2db78aab Trond Myklebust     2013-07-17  1113  		}
dff25ddb48086a Andreas Gruenbacher 2016-12-02  1114  	}
28cf22d0ba283d Trond Myklebust     2017-05-06  1115  	if ((iap->ia_valid & =
ATTR_UID) && (attrmask[1] & FATTR4_WORD1_OWNER)) {
e4fd72a17d2703 Trond Myklebust     2011-02-22  1116  		owner_namelen =3D nf=
s_map_uid_to_name(server, iap->ia_uid, owner_name, IDMAP_NAMESZ);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1117  		if (owner_namelen < =
0) {
fe82a183ca3c91 Chuck Lever         2007-09-11  1118  			dprintk("nfs: could=
n't resolve uid %d to string\n",
e5782076e72be2 Eric W. Biederman   2013-02-01  1119  					from_kuid(&init_u=
ser_ns, iap->ia_uid));
^1da177e4c3f41 Linus Torvalds      2005-04-16  1120  			/* XXX */
^1da177e4c3f41 Linus Torvalds      2005-04-16  1121  			strcpy(owner_name, =
"nobody");
^1da177e4c3f41 Linus Torvalds      2005-04-16  1122  			owner_namelen =3D s=
izeof("nobody") - 1;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1123  			/* goto out; */
^1da177e4c3f41 Linus Torvalds      2005-04-16  1124  		}
d7067b2db78aab Trond Myklebust     2013-07-17  1125  		bmval[1] |=3D FATTR4=
_WORD1_OWNER;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1126  		len +=3D 4 + (XDR_QU=
ADLEN(owner_namelen) << 2);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1127  	}
28cf22d0ba283d Trond Myklebust     2017-05-06  1128  	if ((iap->ia_valid & =
ATTR_GID) &&
28cf22d0ba283d Trond Myklebust     2017-05-06  1129  	   (attrmask[1] & FAT=
TR4_WORD1_OWNER_GROUP)) {
e4fd72a17d2703 Trond Myklebust     2011-02-22  1130  		owner_grouplen =3D n=
fs_map_gid_to_group(server, iap->ia_gid, owner_group, IDMAP_NAMESZ);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1131  		if (owner_grouplen <=
 0) {
fe82a183ca3c91 Chuck Lever         2007-09-11  1132  			dprintk("nfs: could=
n't resolve gid %d to string\n",
e5782076e72be2 Eric W. Biederman   2013-02-01  1133  					from_kgid(&init_u=
ser_ns, iap->ia_gid));
^1da177e4c3f41 Linus Torvalds      2005-04-16  1134  			strcpy(owner_group,=
 "nobody");
^1da177e4c3f41 Linus Torvalds      2005-04-16  1135  			owner_grouplen =3D =
sizeof("nobody") - 1;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1136  			/* goto out; */
^1da177e4c3f41 Linus Torvalds      2005-04-16  1137  		}
d7067b2db78aab Trond Myklebust     2013-07-17  1138  		bmval[1] |=3D FATTR4=
_WORD1_OWNER_GROUP;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1139  		len +=3D 4 + (XDR_QU=
ADLEN(owner_grouplen) << 2);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1140  	}
28cf22d0ba283d Trond Myklebust     2017-05-06  1141  	if (attrmask[1] & FAT=
TR4_WORD1_TIME_ACCESS_SET) {
d7067b2db78aab Trond Myklebust     2013-07-17  1142  		if (iap->ia_valid & =
ATTR_ATIME_SET) {
d7067b2db78aab Trond Myklebust     2013-07-17  1143  			bmval[1] |=3D FATTR=
4_WORD1_TIME_ACCESS_SET;
36b3743fef8861 Trond Myklebust     2018-03-20  1144  			len +=3D 4 + (nfsti=
me4_maxsz << 2);
d7067b2db78aab Trond Myklebust     2013-07-17  1145  		} else if (iap->ia_v=
alid & ATTR_ATIME) {
d7067b2db78aab Trond Myklebust     2013-07-17  1146  			bmval[1] |=3D FATTR=
4_WORD1_TIME_ACCESS_SET;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1147  			len +=3D 4;
d7067b2db78aab Trond Myklebust     2013-07-17  1148  		}
28cf22d0ba283d Trond Myklebust     2017-05-06  1149  	}
28cf22d0ba283d Trond Myklebust     2017-05-06  1150  	if (attrmask[1] & FAT=
TR4_WORD1_TIME_MODIFY_SET) {
d7067b2db78aab Trond Myklebust     2013-07-17  1151  		if (iap->ia_valid & =
ATTR_MTIME_SET) {
d7067b2db78aab Trond Myklebust     2013-07-17  1152  			bmval[1] |=3D FATTR=
4_WORD1_TIME_MODIFY_SET;
36b3743fef8861 Trond Myklebust     2018-03-20  1153  			len +=3D 4 + (nfsti=
me4_maxsz << 2);
d7067b2db78aab Trond Myklebust     2013-07-17  1154  		} else if (iap->ia_v=
alid & ATTR_MTIME) {
d7067b2db78aab Trond Myklebust     2013-07-17  1155  			bmval[1] |=3D FATTR=
4_WORD1_TIME_MODIFY_SET;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1156  			len +=3D 4;
d7067b2db78aab Trond Myklebust     2013-07-17  1157  		}
5334c5bdac926c Kinglong Mee        2015-08-26  1158  	}
5334c5bdac926c Kinglong Mee        2015-08-26  1159  =

bc66f68057662b Richard Sharpe      2021-12-27  1160  	if (statx && (statx->=
fa_valid[0] & NFS_FA_VALID_TIME_BACKUP) &&
bc66f68057662b Richard Sharpe      2021-12-27  1161  	    (attrmask[1] & FA=
TTR4_WORD1_TIME_BACKUP)) {
bc66f68057662b Richard Sharpe      2021-12-27  1162  		bmval[1] |=3D FATTR4=
_WORD1_TIME_BACKUP;
bc66f68057662b Richard Sharpe      2021-12-27  1163  		len +=3D (nfstime4_m=
axsz << 2);
bc66f68057662b Richard Sharpe      2021-12-27  1164  	}
bc66f68057662b Richard Sharpe      2021-12-27  1165  	if (statx && (statx->=
fa_valid[0] & NFS_FA_VALID_TIME_CREATE) &&
bc66f68057662b Richard Sharpe      2021-12-27  1166  	    (attrmask[1] & FA=
TTR4_WORD1_TIME_CREATE)) {
bc66f68057662b Richard Sharpe      2021-12-27  1167  		bmval[1] |=3D FATTR4=
_WORD1_TIME_CREATE;
bc66f68057662b Richard Sharpe      2021-12-27  1168  		len +=3D (nfstime4_m=
axsz << 2);
bc66f68057662b Richard Sharpe      2021-12-27  1169  	}
bc66f68057662b Richard Sharpe      2021-12-27  1170  =

bc66f68057662b Richard Sharpe      2021-12-27  1171  	if (statx && (statx->=
fa_valid[0] & NFS_FA_VALID_ARCHIVE) &&
bc66f68057662b Richard Sharpe      2021-12-27  1172  	   (attrmask[0] & FAT=
TR4_WORD0_ARCHIVE)) {
bc66f68057662b Richard Sharpe      2021-12-27  1173  		bmval[0] |=3D FATTR4=
_WORD0_ARCHIVE;
bc66f68057662b Richard Sharpe      2021-12-27  1174  		len +=3D 4;
bc66f68057662b Richard Sharpe      2021-12-27  1175  	}
bc66f68057662b Richard Sharpe      2021-12-27  1176  	if (statx && (statx->=
fa_valid[0] & NFS_FA_VALID_HIDDEN) &&
bc66f68057662b Richard Sharpe      2021-12-27  1177  	   (attrmask[0] & FAT=
TR4_WORD0_HIDDEN)) {
bc66f68057662b Richard Sharpe      2021-12-27  1178  		bmval[0] |=3D FATTR4=
_WORD0_HIDDEN;
bc66f68057662b Richard Sharpe      2021-12-27  1179  		len +=3D 4;
bc66f68057662b Richard Sharpe      2021-12-27  1180  	}
bc66f68057662b Richard Sharpe      2021-12-27  1181  =

bc66f68057662b Richard Sharpe      2021-12-27 @1182  	if (statx && (statx->=
fa_valid[0] & NFS_FA_VALID_SYSTEM) &&
bc66f68057662b Richard Sharpe      2021-12-27  1183  	   (attrmask[1] & FAT=
TR4_WORD1_SYSTEM)) {
bc66f68057662b Richard Sharpe      2021-12-27  1184  		bmval[1] |=3D FATTR4=
_WORD1_SYSTEM;
bc66f68057662b Richard Sharpe      2021-12-27  1185  		len +=3D 4;
bc66f68057662b Richard Sharpe      2021-12-27  1186  	}
bc66f68057662b Richard Sharpe      2021-12-27  1187  =

28cf22d0ba283d Trond Myklebust     2017-05-06  1188  	if (label && (attrmas=
k[2] & FATTR4_WORD2_SECURITY_LABEL)) {
b4a2cf76ab7c08 Trond Myklebust     2013-07-17  1189  		len +=3D 4 + 4 + 4 +=
 (XDR_QUADLEN(label->len) << 2);
d7067b2db78aab Trond Myklebust     2013-07-17  1190  		bmval[2] |=3D FATTR4=
_WORD2_SECURITY_LABEL;
b4a2cf76ab7c08 Trond Myklebust     2013-07-17  1191  	}
b4a2cf76ab7c08 Trond Myklebust     2013-07-17  1192  =

40a3426c75e162 Trond Myklebust     2018-03-20  1193  	xdr_encode_bitmap4(xd=
r, bmval, ARRAY_SIZE(bmval));
40a3426c75e162 Trond Myklebust     2018-03-20  1194  	xdr_stream_encode_opa=
que_inline(xdr, (void **)&p, len);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1195  =

d7067b2db78aab Trond Myklebust     2013-07-17  1196  	if (bmval[0] & FATTR4=
_WORD0_SIZE)
b95be5a976848f Benny Halevy        2009-08-14  1197  		p =3D xdr_encode_hyp=
er(p, iap->ia_size);
bc66f68057662b Richard Sharpe      2021-12-27  1198  	if (bmval[0] & FATTR4=
_WORD0_ARCHIVE)
bc66f68057662b Richard Sharpe      2021-12-27 @1199  		*p++ =3D (statx->fa_=
flags & NFS_FA_FLAG_ARCHIVE) ?
bc66f68057662b Richard Sharpe      2021-12-27  1200  			cpu_to_be32(1) : cp=
u_to_be32(0);
bc66f68057662b Richard Sharpe      2021-12-27  1201  	if (bmval[0] & FATTR4=
_WORD0_HIDDEN)
bc66f68057662b Richard Sharpe      2021-12-27  1202  		*p++ =3D (statx->fa_=
flags & NFS_FA_FLAG_HIDDEN) ?
bc66f68057662b Richard Sharpe      2021-12-27  1203  			cpu_to_be32(1) : cp=
u_to_be32(0);
d7067b2db78aab Trond Myklebust     2013-07-17  1204  	if (bmval[1] & FATTR4=
_WORD1_MODE)
e75bc1c89e0c7d Benny Halevy        2009-08-14  1205  		*p++ =3D cpu_to_be32=
(iap->ia_mode & S_IALLUGO);
d7067b2db78aab Trond Myklebust     2013-07-17  1206  	if (bmval[1] & FATTR4=
_WORD1_OWNER)
811652bd6edd66 Benny Halevy        2009-08-14  1207  		p =3D xdr_encode_opa=
que(p, owner_name, owner_namelen);
d7067b2db78aab Trond Myklebust     2013-07-17  1208  	if (bmval[1] & FATTR4=
_WORD1_OWNER_GROUP)
811652bd6edd66 Benny Halevy        2009-08-14  1209  		p =3D xdr_encode_opa=
que(p, owner_group, owner_grouplen);
bc66f68057662b Richard Sharpe      2021-12-27  1210  	if (bmval[1] & FATTR4=
_WORD1_SYSTEM)
bc66f68057662b Richard Sharpe      2021-12-27  1211  		*p++ =3D (statx->fa_=
flags & NFS_FA_FLAG_SYSTEM) ?
bc66f68057662b Richard Sharpe      2021-12-27  1212  			cpu_to_be32(1) : cp=
u_to_be32(0);
d7067b2db78aab Trond Myklebust     2013-07-17  1213  	if (bmval[1] & FATTR4=
_WORD1_TIME_ACCESS_SET) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  1214  		if (iap->ia_valid & =
ATTR_ATIME_SET) {
e75bc1c89e0c7d Benny Halevy        2009-08-14  1215  			*p++ =3D cpu_to_be3=
2(NFS4_SET_TO_CLIENT_TIME);
e7d4b05c5ee312 Trond Myklebust     2019-10-04  1216  			p =3D xdr_encode_nf=
stime4(p, &iap->ia_atime);
d7067b2db78aab Trond Myklebust     2013-07-17  1217  		} else
e75bc1c89e0c7d Benny Halevy        2009-08-14  1218  			*p++ =3D cpu_to_be3=
2(NFS4_SET_TO_SERVER_TIME);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1219  	}
bc66f68057662b Richard Sharpe      2021-12-27  1220  	if (bmval[1] & FATTR4=
_WORD1_TIME_BACKUP)
bc66f68057662b Richard Sharpe      2021-12-27  1221  		p =3D xdr_encode_nfs=
time4(p, &statx->fa_time_backup);
bc66f68057662b Richard Sharpe      2021-12-27  1222  	if (bmval[1] & FATTR4=
_WORD1_TIME_CREATE)
bc66f68057662b Richard Sharpe      2021-12-27  1223  		p =3D xdr_encode_nfs=
time4(p, &statx->fa_btime);
d7067b2db78aab Trond Myklebust     2013-07-17  1224  	if (bmval[1] & FATTR4=
_WORD1_TIME_MODIFY_SET) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  1225  		if (iap->ia_valid & =
ATTR_MTIME_SET) {
e75bc1c89e0c7d Benny Halevy        2009-08-14  1226  			*p++ =3D cpu_to_be3=
2(NFS4_SET_TO_CLIENT_TIME);
e7d4b05c5ee312 Trond Myklebust     2019-10-04  1227  			p =3D xdr_encode_nf=
stime4(p, &iap->ia_mtime);
d7067b2db78aab Trond Myklebust     2013-07-17  1228  		} else
e75bc1c89e0c7d Benny Halevy        2009-08-14  1229  			*p++ =3D cpu_to_be3=
2(NFS4_SET_TO_SERVER_TIME);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1230  	}
e2751463eaa6f9 Jia-Ju Bai          2019-07-26  1231  	if (label && (bmval[2=
] & FATTR4_WORD2_SECURITY_LABEL)) {
aa9c2669626ca7 David Quigley       2013-05-22  1232  		*p++ =3D cpu_to_be32=
(label->lfs);
aa9c2669626ca7 David Quigley       2013-05-22  1233  		*p++ =3D cpu_to_be32=
(label->pi);
aa9c2669626ca7 David Quigley       2013-05-22  1234  		*p++ =3D cpu_to_be32=
(label->len);
aa9c2669626ca7 David Quigley       2013-05-22  1235  		p =3D xdr_encode_opa=
que_fixed(p, label->label, label->len);
aa9c2669626ca7 David Quigley       2013-05-22  1236  	}
dff25ddb48086a Andreas Gruenbacher 2016-12-02  1237  	if (bmval[2] & FATTR4=
_WORD2_MODE_UMASK) {
dff25ddb48086a Andreas Gruenbacher 2016-12-02  1238  		*p++ =3D cpu_to_be32=
(iap->ia_mode & S_IALLUGO);
dff25ddb48086a Andreas Gruenbacher 2016-12-02  1239  		*p++ =3D cpu_to_be32=
(*umask);
dff25ddb48086a Andreas Gruenbacher 2016-12-02  1240  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  1241  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4194664129067747884==--

