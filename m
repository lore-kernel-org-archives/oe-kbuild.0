Content-Type: multipart/mixed; boundary="===============7849710132466808508=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/gfs2/ops_fstype.c:1205:3: warning: %u in format string (no. 2) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
Date: Tue, 13 Jul 2021 06:22:18 +0800
Message-ID: <202107130610.1w3iEcjJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7849710132466808508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Julian Braha <julianbraha@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Julian,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7fef2edf7cc753b51f7ccc74993971b0a9c81eca
commit: 7d37cb2c912dc5c25ffac784a4f9b98c06c6bd08 lib: fix kconfig dependenc=
y on ARCH_WANT_FRAME_POINTERS
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
compiler: csky-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> fs/gfs2/ops_fstype.c:1205:3: warning: %u in format string (no. 2) requir=
es 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgT=
ype_uint]
     snprintf(sdp->sd_fsname, sizeof(sdp->sd_fsname), "%s.%u",
     ^

vim +1205 fs/gfs2/ops_fstype.c

8633ecfaba4ce5 Steven Whitehouse   2009-07-31  1092  =

b3b94faa5fe596 David Teigland      2006-01-16  1093  /**
1f52aa08d12f8d Andrew Price        2019-03-27  1094   * gfs2_fill_super - R=
ead in superblock
b3b94faa5fe596 David Teigland      2006-01-16  1095   * @sb: The VFS superb=
lock
1f52aa08d12f8d Andrew Price        2019-03-27  1096   * @args: Mount options
b3b94faa5fe596 David Teigland      2006-01-16  1097   * @silent: Don't comp=
lain if it's not a GFS2 filesystem
b3b94faa5fe596 David Teigland      2006-01-16  1098   *
1f52aa08d12f8d Andrew Price        2019-03-27  1099   * Returns: -errno
b3b94faa5fe596 David Teigland      2006-01-16  1100   */
1f52aa08d12f8d Andrew Price        2019-03-27  1101  static int gfs2_fill_s=
uper(struct super_block *sb, struct fs_context *fc)
b3b94faa5fe596 David Teigland      2006-01-16  1102  {
1f52aa08d12f8d Andrew Price        2019-03-27  1103  	struct gfs2_args *arg=
s =3D fc->fs_private;
1f52aa08d12f8d Andrew Price        2019-03-27  1104  	int silent =3D fc->sb=
_flags & SB_SILENT;
b3b94faa5fe596 David Teigland      2006-01-16  1105  	struct gfs2_sbd *sdp;
b3b94faa5fe596 David Teigland      2006-01-16  1106  	struct gfs2_holder mo=
unt_gh;
96b1454f2e8ede Bob Peterson        2020-12-22  1107  	struct gfs2_holder fr=
eeze_gh;
b3b94faa5fe596 David Teigland      2006-01-16  1108  	int error;
b3b94faa5fe596 David Teigland      2006-01-16  1109  =

b3b94faa5fe596 David Teigland      2006-01-16  1110  	sdp =3D init_sbd(sb);
b3b94faa5fe596 David Teigland      2006-01-16  1111  	if (!sdp) {
d77d1b58aaf445 Joe Perches         2014-03-06  1112  		pr_warn("can't alloc=
 struct gfs2_sbd\n");
b3b94faa5fe596 David Teigland      2006-01-16  1113  		return -ENOMEM;
b3b94faa5fe596 David Teigland      2006-01-16  1114  	}
f55073ff1eaf99 Steven Whitehouse   2009-09-28  1115  	sdp->sd_args =3D *arg=
s;
b3b94faa5fe596 David Teigland      2006-01-16  1116  =

fe64d517df0970 Steven Whitehouse   2009-05-19  1117  	if (sdp->sd_args.ar_s=
pectator) {
1751e8a6cb935e Linus Torvalds      2017-11-27  1118                  sb->s_=
flags |=3D SB_RDONLY;
e8ca5cc571a603 David Teigland      2012-01-09  1119  		set_bit(SDF_RORECOVE=
RY, &sdp->sd_flags);
fe64d517df0970 Steven Whitehouse   2009-05-19  1120  	}
6f04c1c7fe9566 Steven Whitehouse   2009-01-06  1121  	if (sdp->sd_args.ar_p=
osix_acl)
1751e8a6cb935e Linus Torvalds      2017-11-27  1122  		sb->s_flags |=3D SB_=
POSIXACL;
f25934c5f88655 Christoph Hellwig   2009-10-30  1123  	if (sdp->sd_args.ar_n=
obarrier)
f25934c5f88655 Christoph Hellwig   2009-10-30  1124  		set_bit(SDF_NOBARRIE=
RS, &sdp->sd_flags);
6f04c1c7fe9566 Steven Whitehouse   2009-01-06  1125  =

1751e8a6cb935e Linus Torvalds      2017-11-27  1126  	sb->s_flags |=3D SB_N=
OSEC;
719ee344675c2e Steven Whitehouse   2008-09-18  1127  	sb->s_magic =3D GFS2_=
MAGIC;
719ee344675c2e Steven Whitehouse   2008-09-18  1128  	sb->s_op =3D &gfs2_su=
per_ops;
41ced6dcf3dc6b Al Viro             2010-12-18  1129  	sb->s_d_op =3D &gfs2_=
dops;
719ee344675c2e Steven Whitehouse   2008-09-18  1130  	sb->s_export_op =3D &=
gfs2_export_ops;
cc632e7f934655 Steven Whitehouse   2009-09-15  1131  	sb->s_qcop =3D &gfs2_=
quotactl_ops;
de3b08d3ecf89d Jan Kara            2014-09-30  1132  	sb->s_quota_types =3D=
 QTYPE_MASK_USR | QTYPE_MASK_GRP;
cc632e7f934655 Steven Whitehouse   2009-09-15  1133  	sb_dqopt(sb)->flags |=
=3D DQUOT_QUOTA_SYS_FILE;
719ee344675c2e Steven Whitehouse   2008-09-18  1134  	sb->s_time_gran =3D 1;
719ee344675c2e Steven Whitehouse   2008-09-18  1135  	sb->s_maxbytes =3D MA=
X_LFS_FILESIZE;
419c93e0b6b9ee Steven Whitehouse   2006-03-02  1136  =

419c93e0b6b9ee Steven Whitehouse   2006-03-02  1137  	/* Set up the buffer =
cache and fill in some fake block size values
419c93e0b6b9ee Steven Whitehouse   2006-03-02  1138  	   to allow us to rea=
d-in the on-disk superblock. */
419c93e0b6b9ee Steven Whitehouse   2006-03-02  1139  	sdp->sd_sb.sb_bsize =
=3D sb_min_blocksize(sb, GFS2_BASIC_BLOCK);
419c93e0b6b9ee Steven Whitehouse   2006-03-02  1140  	sdp->sd_sb.sb_bsize_s=
hift =3D sb->s_blocksize_bits;
419c93e0b6b9ee Steven Whitehouse   2006-03-02  1141  	sdp->sd_fsb2bb_shift =
=3D sdp->sd_sb.sb_bsize_shift -
419c93e0b6b9ee Steven Whitehouse   2006-03-02  1142                        =
         GFS2_BASIC_BLOCK_SHIFT;
47a9a527946842 Fabian Frederick    2016-08-02  1143  	sdp->sd_fsb2bb =3D BI=
T(sdp->sd_fsb2bb_shift);
b3b94faa5fe596 David Teigland      2006-01-16  1144  =

5e687eac1bd31b Benjamin Marzinski  2010-05-04  1145  	sdp->sd_tune.gt_logd_=
secs =3D sdp->sd_args.ar_commit;
3d3c10f2ce80d2 Benjamin Marzinski  2009-10-20  1146  	sdp->sd_tune.gt_quota=
_quantum =3D sdp->sd_args.ar_quota_quantum;
3d3c10f2ce80d2 Benjamin Marzinski  2009-10-20  1147  	if (sdp->sd_args.ar_s=
tatfs_quantum) {
3d3c10f2ce80d2 Benjamin Marzinski  2009-10-20  1148  		sdp->sd_tune.gt_stat=
fs_slow =3D 0;
3d3c10f2ce80d2 Benjamin Marzinski  2009-10-20  1149  		sdp->sd_tune.gt_stat=
fs_quantum =3D sdp->sd_args.ar_statfs_quantum;
32e471ef1057e8 Steven Whitehouse   2011-05-10  1150  	} else {
3d3c10f2ce80d2 Benjamin Marzinski  2009-10-20  1151  		sdp->sd_tune.gt_stat=
fs_slow =3D 1;
3d3c10f2ce80d2 Benjamin Marzinski  2009-10-20  1152  		sdp->sd_tune.gt_stat=
fs_quantum =3D 30;
3d3c10f2ce80d2 Benjamin Marzinski  2009-10-20  1153  	}
48c2b613616235 Steven Whitehouse   2009-05-13  1154  =

b3b94faa5fe596 David Teigland      2006-01-16  1155  	error =3D init_names(=
sdp, silent);
c2a04b02c060c4 Jamie Iles          2020-10-12  1156  	if (error)
c2a04b02c060c4 Jamie Iles          2020-10-12  1157  		goto fail_free;
b3b94faa5fe596 David Teigland      2006-01-16  1158  =

561b796987af8b Andreas Gruenbacher 2017-08-22  1159  	snprintf(sdp->sd_fsna=
me, sizeof(sdp->sd_fsname), "%s", sdp->sd_table_name);
e0c2a9aa1e6845 David Teigland      2012-01-09  1160  =

b3b94faa5fe596 David Teigland      2006-01-16  1161  	error =3D gfs2_sys_fs=
_add(sdp);
b3b94faa5fe596 David Teigland      2006-01-16  1162  	if (error)
c2a04b02c060c4 Jamie Iles          2020-10-12  1163  		goto fail_free;
0d515210b6969e Bob Peterson        2012-06-13  1164  =

0d515210b6969e Bob Peterson        2012-06-13  1165  	gfs2_create_debugfs_f=
ile(sdp);
b3b94faa5fe596 David Teigland      2006-01-16  1166  =

b3b94faa5fe596 David Teigland      2006-01-16  1167  	error =3D gfs2_lm_mou=
nt(sdp, silent);
b3b94faa5fe596 David Teigland      2006-01-16  1168  	if (error)
0d515210b6969e Bob Peterson        2012-06-13  1169  		goto fail_debug;
b3b94faa5fe596 David Teigland      2006-01-16  1170  =

b3b94faa5fe596 David Teigland      2006-01-16  1171  	error =3D init_lockin=
g(sdp, &mount_gh, DO);
b3b94faa5fe596 David Teigland      2006-01-16  1172  	if (error)
b3b94faa5fe596 David Teigland      2006-01-16  1173  		goto fail_lm;
b3b94faa5fe596 David Teigland      2006-01-16  1174  =

9b8df98fc8973a Steven Whitehouse   2008-08-08  1175  	error =3D init_sb(sdp=
, silent);
b3b94faa5fe596 David Teigland      2006-01-16  1176  	if (error)
b3b94faa5fe596 David Teigland      2006-01-16  1177  		goto fail_locking;
b3b94faa5fe596 David Teigland      2006-01-16  1178  =

47b7ec1daa511c Andrew Price        2021-02-05  1179  	/* Turn rgrplvb on by=
 default if fs format is recent enough */
47b7ec1daa511c Andrew Price        2021-02-05  1180  	if (!sdp->sd_args.ar_=
got_rgrplvb && sdp->sd_sb.sb_fs_format > 1801)
47b7ec1daa511c Andrew Price        2021-02-05  1181  		sdp->sd_args.ar_rgrp=
lvb =3D 1;
47b7ec1daa511c Andrew Price        2021-02-05  1182  =

ba6e93645f039b Steven Whitehouse   2010-06-14  1183  	error =3D wait_on_jou=
rnal(sdp);
ba6e93645f039b Steven Whitehouse   2010-06-14  1184  	if (error)
ba6e93645f039b Steven Whitehouse   2010-06-14  1185  		goto fail_sb;
ba6e93645f039b Steven Whitehouse   2010-06-14  1186  =

feb47ca9314666 Steven Whitehouse   2010-09-29  1187  	/*
feb47ca9314666 Steven Whitehouse   2010-09-29  1188  	 * If user space has =
failed to join the cluster or some similar
feb47ca9314666 Steven Whitehouse   2010-09-29  1189  	 * failure has occurr=
ed, then the journal id will contain a
feb47ca9314666 Steven Whitehouse   2010-09-29  1190  	 * negative (error) n=
umber. This will then be returned to the
feb47ca9314666 Steven Whitehouse   2010-09-29  1191  	 * caller (of the mou=
nt syscall). We do this even for spectator
feb47ca9314666 Steven Whitehouse   2010-09-29  1192  	 * mounts (which just=
 write a jid of 0 to indicate "ok" even though
feb47ca9314666 Steven Whitehouse   2010-09-29  1193  	 * the jid is unused =
in the spectator case)
feb47ca9314666 Steven Whitehouse   2010-09-29  1194  	 */
feb47ca9314666 Steven Whitehouse   2010-09-29  1195  	if (sdp->sd_lockstruc=
t.ls_jid < 0) {
feb47ca9314666 Steven Whitehouse   2010-09-29  1196  		error =3D sdp->sd_lo=
ckstruct.ls_jid;
feb47ca9314666 Steven Whitehouse   2010-09-29  1197  		sdp->sd_lockstruct.l=
s_jid =3D 0;
feb47ca9314666 Steven Whitehouse   2010-09-29  1198  		goto fail_sb;
feb47ca9314666 Steven Whitehouse   2010-09-29  1199  	}
feb47ca9314666 Steven Whitehouse   2010-09-29  1200  =

e0c2a9aa1e6845 David Teigland      2012-01-09  1201  	if (sdp->sd_args.ar_s=
pectator)
561b796987af8b Andreas Gruenbacher 2017-08-22  1202  		snprintf(sdp->sd_fsn=
ame, sizeof(sdp->sd_fsname), "%s.s",
e0c2a9aa1e6845 David Teigland      2012-01-09  1203  			 sdp->sd_table_name=
);
e0c2a9aa1e6845 David Teigland      2012-01-09  1204  	else
561b796987af8b Andreas Gruenbacher 2017-08-22 @1205  		snprintf(sdp->sd_fsn=
ame, sizeof(sdp->sd_fsname), "%s.%u",
e0c2a9aa1e6845 David Teigland      2012-01-09  1206  			 sdp->sd_table_name=
, sdp->sd_lockstruct.ls_jid);
e0c2a9aa1e6845 David Teigland      2012-01-09  1207  =

b3b94faa5fe596 David Teigland      2006-01-16  1208  	error =3D init_inodes=
(sdp, DO);
b3b94faa5fe596 David Teigland      2006-01-16  1209  	if (error)
f42faf4fa4eaf7 Steven Whitehouse   2006-01-30  1210  		goto fail_sb;
b3b94faa5fe596 David Teigland      2006-01-16  1211  =

b3b94faa5fe596 David Teigland      2006-01-16  1212  	error =3D init_per_no=
de(sdp, DO);
b3b94faa5fe596 David Teigland      2006-01-16  1213  	if (error)
b3b94faa5fe596 David Teigland      2006-01-16  1214  		goto fail_inodes;
b3b94faa5fe596 David Teigland      2006-01-16  1215  =

b3b94faa5fe596 David Teigland      2006-01-16  1216  	error =3D gfs2_statfs=
_init(sdp);
b3b94faa5fe596 David Teigland      2006-01-16  1217  	if (error) {
b3b94faa5fe596 David Teigland      2006-01-16  1218  		fs_err(sdp, "can't i=
nitialize statfs subsystem: %d\n", error);
b3b94faa5fe596 David Teigland      2006-01-16  1219  		goto fail_per_node;
b3b94faa5fe596 David Teigland      2006-01-16  1220  	}
b3b94faa5fe596 David Teigland      2006-01-16  1221  =

c77b52c0a13799 Bob Peterson        2020-12-22  1222  	error =3D gfs2_freeze=
_lock(sdp, &freeze_gh, 0);
96b1454f2e8ede Bob Peterson        2020-12-22  1223  	if (error)
b780cc615ba479 Bob Peterson        2020-06-25  1224  		goto fail_per_node;
96b1454f2e8ede Bob Peterson        2020-12-22  1225  =

96b1454f2e8ede Bob Peterson        2020-12-22  1226  	if (!sb_rdonly(sb))
b3b94faa5fe596 David Teigland      2006-01-16  1227  		error =3D gfs2_make_=
fs_rw(sdp);
96b1454f2e8ede Bob Peterson        2020-12-22  1228  =

96b1454f2e8ede Bob Peterson        2020-12-22  1229  	gfs2_freeze_unlock(&f=
reeze_gh);
b3b94faa5fe596 David Teigland      2006-01-16  1230  	if (error) {
b3b94faa5fe596 David Teigland      2006-01-16  1231  		fs_err(sdp, "can't m=
ake FS RW: %d\n", error);
8ad151c2ac9aa1 Steven Whitehouse   2013-12-12  1232  		goto fail_per_node;
b3b94faa5fe596 David Teigland      2006-01-16  1233  	}
b3b94faa5fe596 David Teigland      2006-01-16  1234  	gfs2_glock_dq_uninit(=
&mount_gh);
8633ecfaba4ce5 Steven Whitehouse   2009-07-31  1235  	gfs2_online_uevent(sd=
p);
b3b94faa5fe596 David Teigland      2006-01-16  1236  	return 0;
b3b94faa5fe596 David Teigland      2006-01-16  1237  =

b3b94faa5fe596 David Teigland      2006-01-16  1238  fail_per_node:
b3b94faa5fe596 David Teigland      2006-01-16  1239  	init_per_node(sdp, UN=
DO);
b3b94faa5fe596 David Teigland      2006-01-16  1240  fail_inodes:
b3b94faa5fe596 David Teigland      2006-01-16  1241  	init_inodes(sdp, UNDO=
);
b3b94faa5fe596 David Teigland      2006-01-16  1242  fail_sb:
9b8df98fc8973a Steven Whitehouse   2008-08-08  1243  	if (sdp->sd_root_dir)
9b8df98fc8973a Steven Whitehouse   2008-08-08  1244  		dput(sdp->sd_root_di=
r);
9b8df98fc8973a Steven Whitehouse   2008-08-08  1245  	if (sdp->sd_master_di=
r)
9b8df98fc8973a Steven Whitehouse   2008-08-08  1246  		dput(sdp->sd_master_=
dir);
e7c8707ea2b910 Steven Whitehouse   2009-01-20  1247  	if (sb->s_root)
e7c8707ea2b910 Steven Whitehouse   2009-01-20  1248  		dput(sb->s_root);
9b8df98fc8973a Steven Whitehouse   2008-08-08  1249  	sb->s_root =3D NULL;
b3b94faa5fe596 David Teigland      2006-01-16  1250  fail_locking:
b3b94faa5fe596 David Teigland      2006-01-16  1251  	init_locking(sdp, &mo=
unt_gh, UNDO);
b3b94faa5fe596 David Teigland      2006-01-16  1252  fail_lm:
0e48e055a7dfc0 Bob Peterson        2014-06-02  1253  	complete_all(&sdp->sd=
_journal_ready);
fefc03bfedeff2 Steven Whitehouse   2008-12-19  1254  	gfs2_gl_hash_clear(sd=
p);
b3b94faa5fe596 David Teigland      2006-01-16  1255  	gfs2_lm_unmount(sdp);
0d515210b6969e Bob Peterson        2012-06-13  1256  fail_debug:
5f8820960cf4fb Robert Peterson     2007-04-18  1257  	gfs2_delete_debugfs_f=
ile(sdp);
0d515210b6969e Bob Peterson        2012-06-13  1258  	gfs2_sys_fs_del(sdp);
c2a04b02c060c4 Jamie Iles          2020-10-12  1259  fail_free:
c2a04b02c060c4 Jamie Iles          2020-10-12  1260  	free_sbd(sdp);
5c676f6d359b04 Steven Whitehouse   2006-02-27  1261  	sb->s_fs_info =3D NUL=
L;
b3b94faa5fe596 David Teigland      2006-01-16  1262  	return error;
b3b94faa5fe596 David Teigland      2006-01-16  1263  }
b3b94faa5fe596 David Teigland      2006-01-16  1264  =


:::::: The code at line 1205 was first introduced by commit
:::::: 561b796987af8b169c47375194527219ef5b0974 gfs2: Silence gcc format-tr=
uncation warning

:::::: TO: Andreas Gruenbacher <agruenba@redhat.com>
:::::: CC: Bob Peterson <rpeterso@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7849710132466808508==--

