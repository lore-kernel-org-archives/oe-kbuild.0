Content-Type: multipart/mixed; boundary="===============3222938278952856898=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 12/12] fs/ksmbd/smbacl.c:1213 smb_check_perm_dacl() warn: variable dereferenced before check 'pntsd' (see line 1212)
Date: Mon, 01 Aug 2022 07:09:59 +0800
Message-ID: <202208010716.Io52CJih-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3222938278952856898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Hyunchul Lee <hyc.lee@gmail.com>

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   d0b73d20ca9100c7b969b65d8a1ff49cdd1fa9c9
commit: d0b73d20ca9100c7b969b65d8a1ff49cdd1fa9c9 [12/12] ksmbd: fix heap-ba=
sed overflow in set_ntacl_dacl()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arc-randconfig-m041-20220731 (https://download.01.org/0day-ci/archi=
ve/20220801/202208010716.Io52CJih-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/ksmbd/smbacl.c:1213 smb_check_perm_dacl() warn: variable dereferenced be=
fore check 'pntsd' (see line 1212)
fs/ksmbd/smb2pdu.c:5182 smb2_get_info_sec() error: uninitialized symbol 'se=
cdesclen'.

Old smatch warnings:
fs/ksmbd/smb2pdu.c:549 smb2_allocate_rsp_buf() warn: Please consider using =
kvzalloc instead of kvmalloc
fs/ksmbd/smb2pdu.c:3293 smb2_open() warn: Function too hairy.  No more merg=
es.
fs/ksmbd/smb2pdu.c:6123 smb2_read_pipe() warn: Please consider using kvzall=
oc instead of kvmalloc
fs/ksmbd/smb2pdu.c:6275 smb2_read() warn: Please consider using kvzalloc in=
stead of kvmalloc
fs/ksmbd/smb2pdu.c:6424 smb2_write_rdma_channel() warn: Please consider usi=
ng kvzalloc instead of kvmalloc

vim +/pntsd +1213 fs/ksmbd/smbacl.c

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1187  =

ef24c962d0f290 fs/ksmbd/smbacl.c Hyunchul Lee      2021-06-30  1188  int sm=
b_check_perm_dacl(struct ksmbd_conn *conn, struct path *path,
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1189  			__l=
e32 *pdaccess, int uid)
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1190  {
465d720485eff1 fs/ksmbd/smbacl.c Hyunchul Lee      2021-07-03  1191  	struc=
t user_namespace *user_ns =3D mnt_user_ns(path->mnt);
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1192  	struc=
t smb_ntsd *pntsd =3D NULL;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1193  	struc=
t smb_acl *pdacl;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1194  	struc=
t posix_acl *posix_acls;
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1195  	int r=
c =3D 0, pntsd_size, acl_size, aces_size, pdacl_size, dacl_offset;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1196  	struc=
t smb_sid sid;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1197  	int g=
ranted =3D le32_to_cpu(*pdaccess & ~FILE_MAXIMAL_ACCESS_LE);
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1198  	struc=
t smb_ace *ace;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1199  	int i=
, found =3D 0;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1200  	unsig=
ned int access_bits =3D 0;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1201  	struc=
t smb_ace *others_ace =3D NULL;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1202  	struc=
t posix_acl_entry *pa_entry;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1203  	unsig=
ned int sid_type =3D SIDOWNER;
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1204  	unsig=
ned short ace_size;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1205  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1206  	ksmbd=
_debug(SMB, "check permission using windows acl\n");
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1207  	pntsd=
_size =3D ksmbd_vfs_get_sd_xattr(conn, user_ns,
af34983e831587 fs/ksmbd/smbacl.c Hyunchul Lee      2021-06-30  1208  					 =
   path->dentry, &pntsd);
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1209  	if (p=
ntsd_size <=3D 0)
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1210  		goto=
 err_out;
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1211  =

d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28 @1212  	dacl_=
offset =3D le32_to_cpu(pntsd->dacloffset);
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28 @1213  	if (!=
pntsd || !pntsd->dacloffset ||
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1214  	    (=
dacl_offset + sizeof(struct smb_acl) > pntsd_size))
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1215  		goto=
 err_out;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1216  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1217  	pdacl=
 =3D (struct smb_acl *)((char *)pntsd + le32_to_cpu(pntsd->dacloffset));
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1218  	acl_s=
ize =3D pntsd_size - dacl_offset;
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1219  	pdacl=
_size =3D le16_to_cpu(pdacl->size);
50355b0b20103a fs/cifsd/smbacl.c Namjae Jeon       2021-03-19  1220  =

d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1221  	if (p=
dacl_size > acl_size || pdacl_size < sizeof(struct smb_acl))
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1222  		goto=
 err_out;
50355b0b20103a fs/cifsd/smbacl.c Namjae Jeon       2021-03-19  1223  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1224  	if (!=
pdacl->num_aces) {
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1225  		if (=
!(pdacl_size - sizeof(struct smb_acl)) &&
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1226  		    =
*pdaccess & ~(FILE_READ_CONTROL_LE | FILE_WRITE_DAC_LE)) {
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1227  			rc =
=3D -EACCES;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1228  			got=
o err_out;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1229  		}
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1230  		goto=
 err_out;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1231  	}
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1232  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1233  	if (*=
pdaccess & FILE_MAXIMAL_ACCESS_LE) {
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1234  		gran=
ted =3D READ_CONTROL | WRITE_DAC | FILE_READ_ATTRIBUTES |
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1235  			DEL=
ETE;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1236  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1237  		ace =
=3D (struct smb_ace *)((char *)pdacl + sizeof(struct smb_acl));
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1238  		aces=
_size =3D acl_size - sizeof(struct smb_acl);
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1239  		for =
(i =3D 0; i < le32_to_cpu(pdacl->num_aces); i++) {
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1240  			if =
(offsetof(struct smb_ace, access_req) > aces_size)
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1241  				br=
eak;
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1242  			ace=
_size =3D le16_to_cpu(ace->size);
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1243  			if =
(ace_size > aces_size)
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1244  				br=
eak;
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1245  			ace=
s_size -=3D ace_size;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1246  			gra=
nted |=3D le32_to_cpu(ace->access_req);
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1247  			ace=
 =3D (struct smb_ace *)((char *)ace + le16_to_cpu(ace->size));
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1248  		}
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1249  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1250  		if (=
!pdacl->num_aces)
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1251  			gra=
nted =3D GENERIC_ALL_FLAGS;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1252  	}
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1253  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1254  	if (!=
uid)
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1255  		sid_=
type =3D SIDUNIX_USER;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1256  	id_to=
_sid(uid, sid_type, &sid);
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1257  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1258  	ace =
=3D (struct smb_ace *)((char *)pdacl + sizeof(struct smb_acl));
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1259  	aces_=
size =3D acl_size - sizeof(struct smb_acl);
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1260  	for (=
i =3D 0; i < le32_to_cpu(pdacl->num_aces); i++) {
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1261  		if (=
offsetof(struct smb_ace, access_req) > aces_size)
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1262  			bre=
ak;
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1263  		ace_=
size =3D le16_to_cpu(ace->size);
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1264  		if (=
ace_size > aces_size)
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1265  			bre=
ak;
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1266  		aces=
_size -=3D ace_size;
d0b73d20ca9100 fs/ksmbd/smbacl.c Namjae Jeon       2022-07-28  1267  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1268  		if (=
!compare_sids(&sid, &ace->sid) ||
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1269  		    =
!compare_sids(&sid_unix_NFS_mode, &ace->sid)) {
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1270  			fou=
nd =3D 1;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1271  			bre=
ak;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1272  		}
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1273  		if (=
!compare_sids(&sid_everyone, &ace->sid))
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1274  			oth=
ers_ace =3D ace;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1275  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1276  		ace =
=3D (struct smb_ace *)((char *)ace + le16_to_cpu(ace->size));
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1277  	}
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1278  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1279  	if (*=
pdaccess & FILE_MAXIMAL_ACCESS_LE && found) {
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1280  		gran=
ted =3D READ_CONTROL | WRITE_DAC | FILE_READ_ATTRIBUTES |
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1281  			DEL=
ETE;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1282  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1283  		gran=
ted |=3D le32_to_cpu(ace->access_req);
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1284  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1285  		if (=
!pdacl->num_aces)
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1286  			gra=
nted =3D GENERIC_ALL_FLAGS;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1287  	}
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1288  =

777cad1604d68e fs/ksmbd/smbacl.c Namjae Jeon       2021-08-13  1289  	if (I=
S_ENABLED(CONFIG_FS_POSIX_ACL)) {
ef24c962d0f290 fs/ksmbd/smbacl.c Hyunchul Lee      2021-06-30  1290  		posi=
x_acls =3D get_acl(d_inode(path->dentry), ACL_TYPE_ACCESS);
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1291  		if (=
posix_acls && !found) {
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1292  			uns=
igned int id =3D -1;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1293  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1294  			pa_=
entry =3D posix_acls->a_entries;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1295  			for=
 (i =3D 0; i < posix_acls->a_count; i++, pa_entry++) {
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1296  				if=
 (pa_entry->e_tag =3D=3D ACL_USER)
0e844efebdf9c0 fs/ksmbd/smbacl.c Christian Brauner 2021-08-23  1297  					i=
d =3D posix_acl_uid_translate(user_ns, pa_entry);
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1298  				el=
se if (pa_entry->e_tag =3D=3D ACL_GROUP)
0e844efebdf9c0 fs/ksmbd/smbacl.c Christian Brauner 2021-08-23  1299  					i=
d =3D posix_acl_gid_translate(user_ns, pa_entry);
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1300  				el=
se
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1301  					c=
ontinue;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1302  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1303  				if=
 (id =3D=3D uid) {
777cad1604d68e fs/ksmbd/smbacl.c Namjae Jeon       2021-08-13  1304  					m=
ode_to_access_flags(pa_entry->e_perm,
777cad1604d68e fs/ksmbd/smbacl.c Namjae Jeon       2021-08-13  1305  						=
	     0777,
777cad1604d68e fs/ksmbd/smbacl.c Namjae Jeon       2021-08-13  1306  						=
	     &access_bits);
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1307  					i=
f (!access_bits)
777cad1604d68e fs/ksmbd/smbacl.c Namjae Jeon       2021-08-13  1308  						=
access_bits =3D
777cad1604d68e fs/ksmbd/smbacl.c Namjae Jeon       2021-08-13  1309  						=
	SET_MINIMUM_RIGHTS;
d21a580dafc69a fs/ksmbd/smbacl.c Xin Xiong         2022-04-29  1310  					p=
osix_acl_release(posix_acls);
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1311  					g=
oto check_access_bits;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1312  				}
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1313  			}
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1314  		}
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1315  		if (=
posix_acls)
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1316  			pos=
ix_acl_release(posix_acls);
777cad1604d68e fs/ksmbd/smbacl.c Namjae Jeon       2021-08-13  1317  	}
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1318  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1319  	if (!=
found) {
64b39f4a2fd293 fs/cifsd/smbacl.c Namjae Jeon       2021-03-30  1320  		if (=
others_ace) {
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1321  			ace=
 =3D others_ace;
64b39f4a2fd293 fs/cifsd/smbacl.c Namjae Jeon       2021-03-30  1322  		} el=
se {
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1323  			ksm=
bd_debug(SMB, "Can't find corresponding sid\n");
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1324  			rc =
=3D -EACCES;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1325  			got=
o err_out;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1326  		}
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1327  	}
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1328  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1329  	switc=
h (ace->type) {
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1330  	case =
ACCESS_ALLOWED_ACE_TYPE:
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1331  		acce=
ss_bits =3D le32_to_cpu(ace->access_req);
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1332  		brea=
k;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1333  	case =
ACCESS_DENIED_ACE_TYPE:
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1334  	case =
ACCESS_DENIED_CALLBACK_ACE_TYPE:
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1335  		acce=
ss_bits =3D le32_to_cpu(~ace->access_req);
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1336  		brea=
k;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1337  	}
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1338  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1339  check_=
access_bits:
070fb21e5912b6 fs/cifsd/smbacl.c Namjae Jeon       2021-05-26  1340  	if (g=
ranted &
070fb21e5912b6 fs/cifsd/smbacl.c Namjae Jeon       2021-05-26  1341  	    ~=
(access_bits | FILE_READ_ATTRIBUTES | READ_CONTROL | WRITE_DAC | DELETE)) {
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1342  		ksmb=
d_debug(SMB, "Access denied with winACL, granted : %x, access_req : %x\n",
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1343  			   =
 granted, le32_to_cpu(ace->access_req));
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1344  		rc =
=3D -EACCES;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1345  		goto=
 err_out;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1346  	}
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1347  =

e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1348  	*pdac=
cess =3D cpu_to_le32(granted);
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1349  err_ou=
t:
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1350  	kfree=
(pntsd);
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1351  	retur=
n rc;
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1352  }
e2f34481b24db2 fs/cifsd/smbacl.c Namjae Jeon       2021-03-16  1353  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3222938278952856898==--

