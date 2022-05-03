Content-Type: multipart/mixed; boundary="===============7270015458610456487=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cifs:for-next 1/1] fs/cifs/smb2ops.c:796 open_cached_dir() warn: variable dereferenced before check 'tcon' (see line 780)
Date: Tue, 03 May 2022 21:53:02 +0800
Message-ID: <202205032156.Kq4cTmLw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7270015458610456487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-cifs(a)vger.kernel.org
CC: samba-technical(a)lists.samba.org
TO: Ronnie Sahlberg <lsahlber@redhat.com>
CC: Steve French <stfrench@microsoft.com>

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
head:   4cfa6d6563b6179714e4133fd98d301b5b10bf6a
commit: 4cfa6d6563b6179714e4133fd98d301b5b10bf6a [1/1] cifs: cache dirent n=
ames for cached directories
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20503/202205032156.Kq4cTmLw-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/cifs/smb2ops.c:796 open_cached_dir() warn: variable dereferenced before =
check 'tcon' (see line 780)

vim +/tcon +796 fs/cifs/smb2ops.c

9da6ec7775d2cd Ronnie Sahlberg      2018-07-31  770  =

3d4ef9a15343f0 Steve French         2018-04-25  771  /*
45c0f1aabea9e6 Ronnie Sahlberg      2021-03-09  772   * Open the and cache =
a directory handle.
45c0f1aabea9e6 Ronnie Sahlberg      2021-03-09  773   * Only supported for =
the root handle.
3d4ef9a15343f0 Steve French         2018-04-25  774   */
45c0f1aabea9e6 Ronnie Sahlberg      2021-03-09  775  int open_cached_dir(un=
signed int xid, struct cifs_tcon *tcon,
e6eb19504e2360 Ronnie Sahlberg      2021-03-09  776  		const char *path,
9e81e8ff74b90a Ronnie Sahlberg      2020-10-05  777  		struct cifs_sb_info =
*cifs_sb,
9e81e8ff74b90a Ronnie Sahlberg      2020-10-05  778  		struct cached_fid **=
cfid)
3d4ef9a15343f0 Steve French         2018-04-25  779  {
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12 @780  	struct cifs_ses *ses =
=3D tcon->ses;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  781  	struct TCP_Server_Inf=
o *server =3D ses->server;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  782  	struct cifs_open_parm=
s oparms;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  783  	struct smb2_create_rs=
p *o_rsp =3D NULL;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  784  	struct smb2_query_inf=
o_rsp *qi_rsp =3D NULL;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  785  	int resp_buftype[2];
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  786  	struct smb_rqst rqst[=
2];
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  787  	struct kvec rsp_iov[2=
];
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  788  	struct kvec open_iov[=
SMB2_CREATE_IOV_SIZE];
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  789  	struct kvec qi_iov[1];
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  790  	int rc, flags =3D 0;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  791  	__le16 utf16_path =3D=
 0; /* Null - since an open of top of share */
a93864d93977b9 Ronnie Sahlberg      2018-06-14  792  	u8 oplock =3D SMB2_OP=
LOCK_LEVEL_II;
9e81e8ff74b90a Ronnie Sahlberg      2020-10-05  793  	struct cifs_fid *pfid;
5e9c89d43fa6f5 Ronnie Sahlberg      2021-03-09  794  	struct dentry *dentry;
3d4ef9a15343f0 Steve French         2018-04-25  795  =

4cfa6d6563b617 Ronnie Sahlberg      2022-05-03 @796  	if (tcon =3D=3D NULL =
|| tcon->nohandlecache ||
4cfa6d6563b617 Ronnie Sahlberg      2022-05-03  797  	    is_smb1_server(tc=
on->ses->server))
4df3d976dda246 Ronnie Sahlberg      2021-03-09  798  		return -ENOTSUPP;
4df3d976dda246 Ronnie Sahlberg      2021-03-09  799  =

269f67e1ffead6 Ronnie Sahlberg      2021-03-09  800  	if (cifs_sb->root =3D=
=3D NULL)
269f67e1ffead6 Ronnie Sahlberg      2021-03-09  801  		return -ENOENT;
269f67e1ffead6 Ronnie Sahlberg      2021-03-09  802  =

e6eb19504e2360 Ronnie Sahlberg      2021-03-09  803  	if (strlen(path))
269f67e1ffead6 Ronnie Sahlberg      2021-03-09  804  		return -ENOENT;
e6eb19504e2360 Ronnie Sahlberg      2021-03-09  805  =

5e9c89d43fa6f5 Ronnie Sahlberg      2021-03-09  806  	dentry =3D cifs_sb->r=
oot;
5e9c89d43fa6f5 Ronnie Sahlberg      2021-03-09  807  =

a93864d93977b9 Ronnie Sahlberg      2018-06-14  808  	mutex_lock(&tcon->crf=
id.fid_mutex);
a93864d93977b9 Ronnie Sahlberg      2018-06-14  809  	if (tcon->crfid.is_va=
lid) {
3d4ef9a15343f0 Steve French         2018-04-25  810  		cifs_dbg(FYI, "found=
 a cached root file handle\n");
9e81e8ff74b90a Ronnie Sahlberg      2020-10-05  811  		*cfid =3D &tcon->crf=
id;
9da6ec7775d2cd Ronnie Sahlberg      2018-07-31  812  		kref_get(&tcon->crfi=
d.refcount);
a93864d93977b9 Ronnie Sahlberg      2018-06-14  813  		mutex_unlock(&tcon->=
crfid.fid_mutex);
3d4ef9a15343f0 Steve French         2018-04-25  814  		return 0;
3d4ef9a15343f0 Steve French         2018-04-25  815  	}
3d4ef9a15343f0 Steve French         2018-04-25  816  =

96d9f7ed00b861 Steve French         2019-09-12  817  	/*
96d9f7ed00b861 Steve French         2019-09-12  818  	 * We do not hold the=
 lock for the open because in case
96d9f7ed00b861 Steve French         2019-09-12  819  	 * SMB2_open needs to=
 reconnect, it will end up calling
96d9f7ed00b861 Steve French         2019-09-12  820  	 * cifs_mark_open_fil=
es_invalid() which takes the lock again
96d9f7ed00b861 Steve French         2019-09-12  821  	 * thus causing a dea=
dlock
96d9f7ed00b861 Steve French         2019-09-12  822  	 */
96d9f7ed00b861 Steve French         2019-09-12  823  =

96d9f7ed00b861 Steve French         2019-09-12  824  	mutex_unlock(&tcon->c=
rfid.fid_mutex);
96d9f7ed00b861 Steve French         2019-09-12  825  =

b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  826  	if (smb3_encryption_r=
equired(tcon))
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  827  		flags |=3D CIFS_TRAN=
SFORM_REQ;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  828  =

0fe0781f29dd8a Paulo Alcantara      2020-04-20  829  	if (!server->ops->new=
_lease_key)
0fe0781f29dd8a Paulo Alcantara      2020-04-20  830  		return -EIO;
0fe0781f29dd8a Paulo Alcantara      2020-04-20  831  =

9e81e8ff74b90a Ronnie Sahlberg      2020-10-05  832  	pfid =3D tcon->crfid.=
fid;
0fe0781f29dd8a Paulo Alcantara      2020-04-20  833  	server->ops->new_leas=
e_key(pfid);
0fe0781f29dd8a Paulo Alcantara      2020-04-20  834  =

b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  835  	memset(rqst, 0, sizeo=
f(rqst));
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  836  	resp_buftype[0] =3D r=
esp_buftype[1] =3D CIFS_NO_BUFFER;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  837  	memset(rsp_iov, 0, si=
zeof(rsp_iov));
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  838  =

b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  839  	/* Open */
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  840  	memset(&open_iov, 0, =
sizeof(open_iov));
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  841  	rqst[0].rq_iov =3D op=
en_iov;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  842  	rqst[0].rq_nvec =3D S=
MB2_CREATE_IOV_SIZE;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  843  =

b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  844  	oparms.tcon =3D tcon;
0f060936e490c6 Amir Goldstein       2020-02-03  845  	oparms.create_options=
 =3D cifs_create_options(cifs_sb, 0);
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  846  	oparms.desired_access=
 =3D FILE_READ_ATTRIBUTES;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  847  	oparms.disposition =
=3D FILE_OPEN;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  848  	oparms.fid =3D pfid;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  849  	oparms.reconnect =3D =
false;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  850  =

352d96f3acc6e0 Aurelien Aptel       2020-05-31  851  	rc =3D SMB2_open_init=
(tcon, server,
352d96f3acc6e0 Aurelien Aptel       2020-05-31  852  			    &rqst[0], &oplo=
ck, &oparms, &utf16_path);
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  853  	if (rc)
96d9f7ed00b861 Steve French         2019-09-12  854  		goto oshr_free;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  855  	smb2_set_next_command=
(tcon, &rqst[0]);
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  856  =

b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  857  	memset(&qi_iov, 0, si=
zeof(qi_iov));
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  858  	rqst[1].rq_iov =3D qi=
_iov;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  859  	rqst[1].rq_nvec =3D 1;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  860  =

352d96f3acc6e0 Aurelien Aptel       2020-05-31  861  	rc =3D SMB2_query_inf=
o_init(tcon, server,
352d96f3acc6e0 Aurelien Aptel       2020-05-31  862  				  &rqst[1], COMPOU=
ND_FID,
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  863  				  COMPOUND_FID, FI=
LE_ALL_INFORMATION,
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  864  				  SMB2_O_INFO_FILE=
, 0,
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  865  				  sizeof(struct sm=
b2_file_all_info) +
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  866  				  PATH_MAX * 2, 0,=
 NULL);
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  867  	if (rc)
96d9f7ed00b861 Steve French         2019-09-12  868  		goto oshr_free;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  869  =

b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  870  	smb2_set_related(&rqs=
t[1]);
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  871  =

352d96f3acc6e0 Aurelien Aptel       2020-05-31  872  	rc =3D compound_send_=
recv(xid, ses, server,
352d96f3acc6e0 Aurelien Aptel       2020-05-31  873  				flags, 2, rqst,
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  874  				resp_buftype, rsp_=
iov);
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  875  	mutex_lock(&tcon->crf=
id.fid_mutex);
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  876  =

7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  877  	/*
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  878  	 * Now we need to che=
ck again as the cached root might have
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  879  	 * been successfully =
re-opened from a concurrent process
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  880  	 */
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  881  =

7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  882  	if (tcon->crfid.is_va=
lid) {
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  883  		/* work was already =
done */
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  884  =

7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  885  		/* stash fids for cl=
ose() later */
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  886  		struct cifs_fid fid =
=3D {
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  887  			.persistent_fid =3D=
 pfid->persistent_fid,
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  888  			.volatile_fid =3D p=
fid->volatile_fid,
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  889  		};
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  890  =

7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  891  		/*
ad7567bc65afe0 Muhammad Usama Anjum 2021-04-15  892  		 * caller expects th=
is func to set the fid in crfid to valid
ad7567bc65afe0 Muhammad Usama Anjum 2021-04-15  893  		 * cached root, so i=
ncrement the refcount.
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  894  		 */
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  895  		kref_get(&tcon->crfi=
d.refcount);
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  896  =

7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  897  		mutex_unlock(&tcon->=
crfid.fid_mutex);
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  898  =

7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  899  		if (rc =3D=3D 0) {
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  900  			/* close extra hand=
le outside of crit sec */
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  901  			SMB2_close(xid, tco=
n, fid.persistent_fid, fid.volatile_fid);
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  902  		}
77577de64167aa Xiyu Yang            2020-06-13  903  		rc =3D 0;
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  904  		goto oshr_free;
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  905  	}
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  906  =

7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  907  	/* Cached root is sti=
ll invalid, continue normaly */
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  908  =

7dcc82c2dfd5f1 Steve French         2019-09-11  909  	if (rc) {
7dcc82c2dfd5f1 Steve French         2019-09-11  910  		if (rc =3D=3D -EREMC=
HG) {
7dcc82c2dfd5f1 Steve French         2019-09-11  911  			tcon->need_reconnec=
t =3D true;
a0a3036b81f1f6 Joe Perches          2020-04-14  912  			pr_warn_once("serve=
r share %s deleted\n",
7dcc82c2dfd5f1 Steve French         2019-09-11  913  				     tcon->treeNam=
e);
7dcc82c2dfd5f1 Steve French         2019-09-11  914  		}
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  915  		goto oshr_exit;
7dcc82c2dfd5f1 Steve French         2019-09-11  916  	}
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  917  =

d2f15428d6a0eb Steve French         2019-09-22  918  	atomic_inc(&tcon->num=
_remote_opens);
d2f15428d6a0eb Steve French         2019-09-22  919  =

b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  920  	o_rsp =3D (struct smb=
2_create_rsp *)rsp_iov[0].iov_base;
351a59dace0e0e Paulo Alcantara      2022-03-21  921  	oparms.fid->persisten=
t_fid =3D o_rsp->PersistentFileId;
351a59dace0e0e Paulo Alcantara      2022-03-21  922  	oparms.fid->volatile_=
fid =3D o_rsp->VolatileFileId;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  923  #ifdef CONFIG_CIFS_DEB=
UG2
0d35e382e4e96a Ronnie Sahlberg      2021-11-05  924  	oparms.fid->mid =3D l=
e64_to_cpu(o_rsp->hdr.MessageId);
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  925  #endif /* CIFS_DEBUG2 =
*/
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  926  =

a93864d93977b9 Ronnie Sahlberg      2018-06-14  927  	tcon->crfid.tcon =3D =
tcon;
a93864d93977b9 Ronnie Sahlberg      2018-06-14  928  	tcon->crfid.is_valid =
=3D true;
5e9c89d43fa6f5 Ronnie Sahlberg      2021-03-09  929  	tcon->crfid.dentry =
=3D dentry;
5e9c89d43fa6f5 Ronnie Sahlberg      2021-03-09  930  	dget(dentry);
9da6ec7775d2cd Ronnie Sahlberg      2018-07-31  931  	kref_init(&tcon->crfi=
d.refcount);
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  932  =

89a5bfa350faf8 Steve French         2019-07-18  933  	/* BB TBD check to se=
e if oplock level check can be removed below */
2f94a3125b8742 Ronnie Sahlberg      2019-03-28  934  	if (o_rsp->OplockLeve=
l =3D=3D SMB2_OPLOCK_LEVEL_LEASE) {
ad7567bc65afe0 Muhammad Usama Anjum 2021-04-15  935  		/*
ad7567bc65afe0 Muhammad Usama Anjum 2021-04-15  936  		 * See commit 2f94a3=
125b87. Increment the refcount when we
ad7567bc65afe0 Muhammad Usama Anjum 2021-04-15  937  		 * get a lease for r=
oot, release it if lease break occurs
ad7567bc65afe0 Muhammad Usama Anjum 2021-04-15  938  		 */
2f94a3125b8742 Ronnie Sahlberg      2019-03-28  939  		kref_get(&tcon->crfi=
d.refcount);
d9191319358da1 Pavel Shilovsky      2019-12-10  940  		tcon->crfid.has_leas=
e =3D true;
89a5bfa350faf8 Steve French         2019-07-18  941  		smb2_parse_contexts(=
server, o_rsp,
2f94a3125b8742 Ronnie Sahlberg      2019-03-28  942  				&oparms.fid->epoch,
69dda3059e7a4d Aurelien Aptel       2020-03-02  943  				    oparms.fid->le=
ase_key, &oplock,
69dda3059e7a4d Aurelien Aptel       2020-03-02  944  				    NULL, NULL);
2f94a3125b8742 Ronnie Sahlberg      2019-03-28  945  	} else
2f94a3125b8742 Ronnie Sahlberg      2019-03-28  946  		goto oshr_exit;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  947  =

b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  948  	qi_rsp =3D (struct sm=
b2_query_info_rsp *)rsp_iov[1].iov_base;
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  949  	if (le32_to_cpu(qi_rs=
p->OutputBufferLength) < sizeof(struct smb2_file_all_info))
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  950  		goto oshr_exit;
4811e3096daaa5 Ronnie Sahlberg      2019-04-01  951  	if (!smb2_validate_an=
d_copy_iov(
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  952  				le16_to_cpu(qi_rsp=
->OutputBufferOffset),
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  953  				sizeof(struct smb2=
_file_all_info),
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  954  				&rsp_iov[1], sizeo=
f(struct smb2_file_all_info),
4811e3096daaa5 Ronnie Sahlberg      2019-04-01  955  				(char *)&tcon->crf=
id.file_all_info))
720aec01262d49 zhengbin             2019-12-25  956  		tcon->crfid.file_all=
_info_is_valid =3D true;
ed20f54a3c63a9 Ronnie Sahlberg      2021-03-09  957  	tcon->crfid.time =3D =
jiffies;
ed20f54a3c63a9 Ronnie Sahlberg      2021-03-09  958  =

b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  959  =

b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  960  oshr_exit:
a93864d93977b9 Ronnie Sahlberg      2018-06-14  961  	mutex_unlock(&tcon->c=
rfid.fid_mutex);
7e5a70ad88b1e6 Aurelien Aptel       2019-07-17  962  oshr_free:
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  963  	SMB2_open_free(&rqst[=
0]);
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  964  	SMB2_query_info_free(=
&rqst[1]);
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  965  	free_rsp_buf(resp_buf=
type[0], rsp_iov[0].iov_base);
b0f6df737a1c5d Ronnie Sahlberg      2019-03-12  966  	free_rsp_buf(resp_buf=
type[1], rsp_iov[1].iov_base);
9e81e8ff74b90a Ronnie Sahlberg      2020-10-05  967  	if (rc =3D=3D 0)
9e81e8ff74b90a Ronnie Sahlberg      2020-10-05  968  		*cfid =3D &tcon->crf=
id;
3d4ef9a15343f0 Steve French         2018-04-25  969  	return rc;
3d4ef9a15343f0 Steve French         2018-04-25  970  }
3d4ef9a15343f0 Steve French         2018-04-25  971  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7270015458610456487==--

