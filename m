Content-Type: multipart/mixed; boundary="===============1712038917384304068=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] cifs: improve symlink handling for smb2+
Date: Wed, 05 Oct 2022 01:15:06 +0800
Message-ID: <202210050123.JbcnJcrB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1712038917384304068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20221003220402.30569-1-pc@cjr.nz>
References: <20221003220402.30569-1-pc@cjr.nz>
TO: Paulo Alcantara <pc@cjr.nz>
TO: smfrench(a)gmail.com
CC: linux-cifs(a)vger.kernel.org
CC: Paulo Alcantara <pc@cjr.nz>

Hi Paulo,

I love your patch! Perhaps something to improve:

[auto build test WARNING on cifs/for-next]
[also build test WARNING on linus/master v6.0 next-20221004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paulo-Alcantara/cifs=
-improve-symlink-handling-for-smb2/20221004-060511
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-m001
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/cifs/smb2inode.c:419 smb2_compound_op() error: potentially dereferencing=
 uninitialized 'idata'.
fs/cifs/smb2inode.c:430 smb2_compound_op() error: uninitialized symbol 'ida=
ta'.

vim +/idata +419 fs/cifs/smb2inode.c

a7d5c294628088 Ronnie Sahlberg 2020-05-20   50  =

b6f2a0f89d7ed8 Shyam Prasad N  2021-07-30   51  /*
b6f2a0f89d7ed8 Shyam Prasad N  2021-07-30   52   * note: If cfile is passed=
, the reference to it is dropped here.
b6f2a0f89d7ed8 Shyam Prasad N  2021-07-30   53   * So make sure that you do=
 not reuse cfile after return from this func.
42c84f33d883ce Paulo Alcantara 2022-10-03   54   *
42c84f33d883ce Paulo Alcantara 2022-10-03   55   * If passing @err_iov and =
@err_buftype, ensure to make them both large enough (>=3D 3) to hold all
42c84f33d883ce Paulo Alcantara 2022-10-03   56   * error responses.  Caller=
 is also responsible for freeing them up.
b6f2a0f89d7ed8 Shyam Prasad N  2021-07-30   57   */
42c84f33d883ce Paulo Alcantara 2022-10-03   58  static int smb2_compound_op=
(const unsigned int xid, struct cifs_tcon *tcon,
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   59  			    struct cifs_sb_info =
*cifs_sb, const char *full_path,
42c84f33d883ce Paulo Alcantara 2022-10-03   60  			    __u32 desired_access=
, __u32 create_disposition, __u32 create_options,
42c84f33d883ce Paulo Alcantara 2022-10-03   61  			    umode_t mode, void *=
ptr, int command, struct cifsFileInfo *cfile,
42c84f33d883ce Paulo Alcantara 2022-10-03   62  			    struct kvec *err_iov=
, int *err_buftype)
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   63  {
a7d5c294628088 Ronnie Sahlberg 2020-05-20   64  	struct cop_vars *vars =3D =
NULL;
a7d5c294628088 Ronnie Sahlberg 2020-05-20   65  	struct kvec *rsp_iov;
a7d5c294628088 Ronnie Sahlberg 2020-05-20   66  	struct smb_rqst *rqst;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   67  	int rc;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   68  	__le16 *utf16_path =3D NUL=
L;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   69  	__u8 oplock =3D SMB2_OPLOC=
K_LEVEL_NONE;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   70  	struct cifs_fid fid;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   71  	struct cifs_ses *ses =3D t=
con->ses;
352d96f3acc6e0 Aurelien Aptel  2020-05-31   72  	struct TCP_Server_Info *se=
rver;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   73  	int num_rqst =3D 0;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   74  	int resp_buftype[3];
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03   75  	struct smb2_query_info_rsp=
 *qi_rsp =3D NULL;
42c84f33d883ce Paulo Alcantara 2022-10-03   76  	struct cifs_open_info_data=
 *idata;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   77  	int flags =3D 0;
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03   78  	__u8 delete_pending[8] =3D=
 {1, 0, 0, 0, 0, 0, 0, 0};
bb435512cec806 Ronnie Sahlberg 2018-09-03   79  	unsigned int size[2];
bb435512cec806 Ronnie Sahlberg 2018-09-03   80  	void *data[2];
bb435512cec806 Ronnie Sahlberg 2018-09-03   81  	int len;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   82  =

a7d5c294628088 Ronnie Sahlberg 2020-05-20   83  	vars =3D kzalloc(sizeof(*v=
ars), GFP_ATOMIC);
a7d5c294628088 Ronnie Sahlberg 2020-05-20   84  	if (vars =3D=3D NULL)
a7d5c294628088 Ronnie Sahlberg 2020-05-20   85  		return -ENOMEM;
a7d5c294628088 Ronnie Sahlberg 2020-05-20   86  	rqst =3D &vars->rqst[0];
a7d5c294628088 Ronnie Sahlberg 2020-05-20   87  	rsp_iov =3D &vars->rsp_iov=
[0];
a7d5c294628088 Ronnie Sahlberg 2020-05-20   88  =

352d96f3acc6e0 Aurelien Aptel  2020-05-31   89  	server =3D cifs_pick_chann=
el(ses);
352d96f3acc6e0 Aurelien Aptel  2020-05-31   90  =

c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   91  	if (smb3_encryption_requir=
ed(tcon))
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   92  		flags |=3D CIFS_TRANSFORM=
_REQ;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   93  =

c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   94  	resp_buftype[0] =3D resp_b=
uftype[1] =3D resp_buftype[2] =3D CIFS_NO_BUFFER;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03   95  =

8de9e86c67baa7 Ronnie Sahlberg 2019-08-30   96  	/* We already have a handl=
e so we can skip the open */
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30   97  	if (cfile)
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30   98  		goto after_open;
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30   99  =

c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  100  	/* Open */
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  101  	utf16_path =3D cifs_conver=
t_path_to_utf16(full_path, cifs_sb);
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  102  	if (!utf16_path) {
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  103  		rc =3D -ENOMEM;
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  104  		goto finished;
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  105  	}
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  106  =

a7d5c294628088 Ronnie Sahlberg 2020-05-20  107  	vars->oparms.tcon =3D tcon;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  108  	vars->oparms.desired_acces=
s =3D desired_access;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  109  	vars->oparms.disposition =
=3D create_disposition;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  110  	vars->oparms.create_option=
s =3D cifs_create_options(cifs_sb, create_options);
a7d5c294628088 Ronnie Sahlberg 2020-05-20  111  	vars->oparms.fid =3D &fid;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  112  	vars->oparms.reconnect =3D=
 false;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  113  	vars->oparms.mode =3D mode;
c8c412f976124d Steve French    2020-08-13  114  	vars->oparms.cifs_sb =3D c=
ifs_sb;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  115  =

a7d5c294628088 Ronnie Sahlberg 2020-05-20  116  	rqst[num_rqst].rq_iov =3D =
&vars->open_iov[0];
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  117  	rqst[num_rqst].rq_nvec =3D=
 SMB2_CREATE_IOV_SIZE;
352d96f3acc6e0 Aurelien Aptel  2020-05-31  118  	rc =3D SMB2_open_init(tcon=
, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  119  			    &rqst[num_rqst], &op=
lock, &vars->oparms,
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  120  			    utf16_path);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  121  	kfree(utf16_path);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  122  	if (rc)
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  123  		goto finished;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  124  =

8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  125  	smb2_set_next_command(tcon=
, &rqst[num_rqst]);
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  126   after_open:
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  127  	num_rqst++;
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  128  	rc =3D 0;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  129  =

c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  130  	/* Operation */
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  131  	switch (command) {
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  132  	case SMB2_OP_QUERY_INFO:
a7d5c294628088 Ronnie Sahlberg 2020-05-20  133  		rqst[num_rqst].rq_iov =3D=
 &vars->qi_iov[0];
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  134  		rqst[num_rqst].rq_nvec =
=3D 1;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  135  =

496902dc173dea Ronnie Sahlberg 2019-09-09  136  		if (cfile)
352d96f3acc6e0 Aurelien Aptel  2020-05-31  137  			rc =3D SMB2_query_info_i=
nit(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  138  				&rqst[num_rqst],
496902dc173dea Ronnie Sahlberg 2019-09-09  139  				cfile->fid.persistent_f=
id,
496902dc173dea Ronnie Sahlberg 2019-09-09  140  				cfile->fid.volatile_fid,
496902dc173dea Ronnie Sahlberg 2019-09-09  141  				FILE_ALL_INFORMATION,
496902dc173dea Ronnie Sahlberg 2019-09-09  142  				SMB2_O_INFO_FILE, 0,
496902dc173dea Ronnie Sahlberg 2019-09-09  143  				sizeof(struct smb2_file=
_all_info) +
496902dc173dea Ronnie Sahlberg 2019-09-09  144  					  PATH_MAX * 2, 0, NUL=
L);
496902dc173dea Ronnie Sahlberg 2019-09-09  145  		else {
352d96f3acc6e0 Aurelien Aptel  2020-05-31  146  			rc =3D SMB2_query_info_i=
nit(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  147  				&rqst[num_rqst],
496902dc173dea Ronnie Sahlberg 2019-09-09  148  				COMPOUND_FID,
496902dc173dea Ronnie Sahlberg 2019-09-09  149  				COMPOUND_FID,
496902dc173dea Ronnie Sahlberg 2019-09-09  150  				FILE_ALL_INFORMATION,
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  151  				SMB2_O_INFO_FILE, 0,
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  152  				sizeof(struct smb2_file=
_all_info) +
f5b05d622a3e99 Ronnie Sahlberg 2018-10-07  153  					  PATH_MAX * 2, 0, NUL=
L);
496902dc173dea Ronnie Sahlberg 2019-09-09  154  			if (!rc) {
496902dc173dea Ronnie Sahlberg 2019-09-09  155  				smb2_set_next_command(t=
con, &rqst[num_rqst]);
496902dc173dea Ronnie Sahlberg 2019-09-09  156  				smb2_set_related(&rqst[=
num_rqst]);
496902dc173dea Ronnie Sahlberg 2019-09-09  157  			}
496902dc173dea Ronnie Sahlberg 2019-09-09  158  		}
496902dc173dea Ronnie Sahlberg 2019-09-09  159  =

6a5f6592a0b606 Steve French    2020-06-11  160  		if (rc)
6a5f6592a0b606 Steve French    2020-06-11  161  			goto finished;
6a5f6592a0b606 Steve French    2020-06-11  162  		num_rqst++;
6a5f6592a0b606 Steve French    2020-06-11  163  		trace_smb3_query_info_com=
pound_enter(xid, ses->Suid, tcon->tid,
6a5f6592a0b606 Steve French    2020-06-11  164  						     full_path);
6a5f6592a0b606 Steve French    2020-06-11  165  		break;
6a5f6592a0b606 Steve French    2020-06-11  166  	case SMB2_OP_POSIX_QUERY_I=
NFO:
6a5f6592a0b606 Steve French    2020-06-11  167  		rqst[num_rqst].rq_iov =3D=
 &vars->qi_iov[0];
6a5f6592a0b606 Steve French    2020-06-11  168  		rqst[num_rqst].rq_nvec =
=3D 1;
6a5f6592a0b606 Steve French    2020-06-11  169  =

6a5f6592a0b606 Steve French    2020-06-11  170  		if (cfile)
6a5f6592a0b606 Steve French    2020-06-11  171  			rc =3D SMB2_query_info_i=
nit(tcon, server,
6a5f6592a0b606 Steve French    2020-06-11  172  				&rqst[num_rqst],
6a5f6592a0b606 Steve French    2020-06-11  173  				cfile->fid.persistent_f=
id,
6a5f6592a0b606 Steve French    2020-06-11  174  				cfile->fid.volatile_fid,
6a5f6592a0b606 Steve French    2020-06-11  175  				SMB_FIND_FILE_POSIX_INF=
O,
6a5f6592a0b606 Steve French    2020-06-11  176  				SMB2_O_INFO_FILE, 0,
6a5f6592a0b606 Steve French    2020-06-11  177  				/* TBD: fix following t=
o allow for longer SIDs */
6a5f6592a0b606 Steve French    2020-06-11  178  				sizeof(struct smb311_po=
six_qinfo *) + (PATH_MAX * 2) +
6a5f6592a0b606 Steve French    2020-06-11  179  				(sizeof(struct cifs_sid=
) * 2), 0, NULL);
6a5f6592a0b606 Steve French    2020-06-11  180  		else {
6a5f6592a0b606 Steve French    2020-06-11  181  			rc =3D SMB2_query_info_i=
nit(tcon, server,
6a5f6592a0b606 Steve French    2020-06-11  182  				&rqst[num_rqst],
6a5f6592a0b606 Steve French    2020-06-11  183  				COMPOUND_FID,
6a5f6592a0b606 Steve French    2020-06-11  184  				COMPOUND_FID,
6a5f6592a0b606 Steve French    2020-06-11  185  				SMB_FIND_FILE_POSIX_INF=
O,
6a5f6592a0b606 Steve French    2020-06-11  186  				SMB2_O_INFO_FILE, 0,
6a5f6592a0b606 Steve French    2020-06-11  187  				sizeof(struct smb311_po=
six_qinfo *) + (PATH_MAX * 2) +
6a5f6592a0b606 Steve French    2020-06-11  188  				(sizeof(struct cifs_sid=
) * 2), 0, NULL);
6a5f6592a0b606 Steve French    2020-06-11  189  			if (!rc) {
6a5f6592a0b606 Steve French    2020-06-11  190  				smb2_set_next_command(t=
con, &rqst[num_rqst]);
6a5f6592a0b606 Steve French    2020-06-11  191  				smb2_set_related(&rqst[=
num_rqst]);
6a5f6592a0b606 Steve French    2020-06-11  192  			}
6a5f6592a0b606 Steve French    2020-06-11  193  		}
6a5f6592a0b606 Steve French    2020-06-11  194  =

88a92c913cef09 Ronnie Sahlberg 2019-07-16  195  		if (rc)
88a92c913cef09 Ronnie Sahlberg 2019-07-16  196  			goto finished;
496902dc173dea Ronnie Sahlberg 2019-09-09  197  		num_rqst++;
e4bd7c4a8d2a84 Steve French    2020-06-11  198  		trace_smb3_posix_query_in=
fo_compound_enter(xid, ses->Suid, tcon->tid, full_path);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  199  		break;
47dd9597df41f0 Ronnie Sahlberg 2018-09-03  200  	case SMB2_OP_DELETE:
8191576a124976 Steve French    2019-03-13  201  		trace_smb3_delete_enter(x=
id, ses->Suid, tcon->tid, full_path);
47dd9597df41f0 Ronnie Sahlberg 2018-09-03  202  		break;
f733e3936da462 Ronnie Sahlberg 2018-09-03  203  	case SMB2_OP_MKDIR:
f733e3936da462 Ronnie Sahlberg 2018-09-03  204  		/*
f733e3936da462 Ronnie Sahlberg 2018-09-03  205  		 * Directories are create=
d through parameters in the
f733e3936da462 Ronnie Sahlberg 2018-09-03  206  		 * SMB2_open() call.
f733e3936da462 Ronnie Sahlberg 2018-09-03  207  		 */
8191576a124976 Steve French    2019-03-13  208  		trace_smb3_mkdir_enter(xi=
d, ses->Suid, tcon->tid, full_path);
f733e3936da462 Ronnie Sahlberg 2018-09-03  209  		break;
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  210  	case SMB2_OP_RMDIR:
a7d5c294628088 Ronnie Sahlberg 2020-05-20  211  		rqst[num_rqst].rq_iov =3D=
 &vars->si_iov[0];
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  212  		rqst[num_rqst].rq_nvec =
=3D 1;
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  213  =

271b9c0c80076b Ronnie Sahlberg 2018-12-18  214  		size[0] =3D 1; /* sizeof =
__u8 See MS-FSCC section 2.4.11 */
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  215  		data[0] =3D &delete_pendi=
ng[0];
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  216  =

352d96f3acc6e0 Aurelien Aptel  2020-05-31  217  		rc =3D SMB2_set_info_init=
(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  218  					&rqst[num_rqst], COMPO=
UND_FID,
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  219  					COMPOUND_FID, current-=
>tgid,
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  220  					FILE_DISPOSITION_INFOR=
MATION,
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  221  					SMB2_O_INFO_FILE, 0, d=
ata, size);
88a92c913cef09 Ronnie Sahlberg 2019-07-16  222  		if (rc)
88a92c913cef09 Ronnie Sahlberg 2019-07-16  223  			goto finished;
e77fe73c7e38c3 Ronnie Sahlberg 2018-12-31  224  		smb2_set_next_command(tco=
n, &rqst[num_rqst]);
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  225  		smb2_set_related(&rqst[nu=
m_rqst++]);
8191576a124976 Steve French    2019-03-13  226  		trace_smb3_rmdir_enter(xi=
d, ses->Suid, tcon->tid, full_path);
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  227  		break;
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  228  	case SMB2_OP_SET_EOF:
a7d5c294628088 Ronnie Sahlberg 2020-05-20  229  		rqst[num_rqst].rq_iov =3D=
 &vars->si_iov[0];
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  230  		rqst[num_rqst].rq_nvec =
=3D 1;
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  231  =

f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  232  		size[0] =3D 8; /* sizeof =
__le64 */
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  233  		data[0] =3D ptr;
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  234  =

352d96f3acc6e0 Aurelien Aptel  2020-05-31  235  		rc =3D SMB2_set_info_init=
(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  236  					&rqst[num_rqst], COMPO=
UND_FID,
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  237  					COMPOUND_FID, current-=
>tgid,
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  238  					FILE_END_OF_FILE_INFOR=
MATION,
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  239  					SMB2_O_INFO_FILE, 0, d=
ata, size);
88a92c913cef09 Ronnie Sahlberg 2019-07-16  240  		if (rc)
88a92c913cef09 Ronnie Sahlberg 2019-07-16  241  			goto finished;
e77fe73c7e38c3 Ronnie Sahlberg 2018-12-31  242  		smb2_set_next_command(tco=
n, &rqst[num_rqst]);
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  243  		smb2_set_related(&rqst[nu=
m_rqst++]);
8191576a124976 Steve French    2019-03-13  244  		trace_smb3_set_eof_enter(=
xid, ses->Suid, tcon->tid, full_path);
f7bfe04bf0dbc4 Ronnie Sahlberg 2018-09-03  245  		break;
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  246  	case SMB2_OP_SET_INFO:
a7d5c294628088 Ronnie Sahlberg 2020-05-20  247  		rqst[num_rqst].rq_iov =3D=
 &vars->si_iov[0];
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  248  		rqst[num_rqst].rq_nvec =
=3D 1;
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  249  =

bb435512cec806 Ronnie Sahlberg 2018-09-03  250  =

dcbf91035709e9 Ronnie Sahlberg 2018-09-03  251  		size[0] =3D sizeof(FILE_B=
ASIC_INFO);
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  252  		data[0] =3D ptr;
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  253  =

dc9300a670aebb Ronnie Sahlberg 2019-08-30  254  		if (cfile)
352d96f3acc6e0 Aurelien Aptel  2020-05-31  255  			rc =3D SMB2_set_info_ini=
t(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  256  				&rqst[num_rqst],
dc9300a670aebb Ronnie Sahlberg 2019-08-30  257  				cfile->fid.persistent_f=
id,
dc9300a670aebb Ronnie Sahlberg 2019-08-30  258  				cfile->fid.volatile_fid=
, current->tgid,
dc9300a670aebb Ronnie Sahlberg 2019-08-30  259  				FILE_BASIC_INFORMATION,
dc9300a670aebb Ronnie Sahlberg 2019-08-30  260  				SMB2_O_INFO_FILE, 0, da=
ta, size);
dc9300a670aebb Ronnie Sahlberg 2019-08-30  261  		else {
352d96f3acc6e0 Aurelien Aptel  2020-05-31  262  			rc =3D SMB2_set_info_ini=
t(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  263  				&rqst[num_rqst],
dc9300a670aebb Ronnie Sahlberg 2019-08-30  264  				COMPOUND_FID,
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  265  				COMPOUND_FID, current->=
tgid,
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  266  				FILE_BASIC_INFORMATION,
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  267  				SMB2_O_INFO_FILE, 0, da=
ta, size);
dc9300a670aebb Ronnie Sahlberg 2019-08-30  268  			if (!rc) {
dc9300a670aebb Ronnie Sahlberg 2019-08-30  269  				smb2_set_next_command(t=
con, &rqst[num_rqst]);
dc9300a670aebb Ronnie Sahlberg 2019-08-30  270  				smb2_set_related(&rqst[=
num_rqst]);
dc9300a670aebb Ronnie Sahlberg 2019-08-30  271  			}
dc9300a670aebb Ronnie Sahlberg 2019-08-30  272  		}
dc9300a670aebb Ronnie Sahlberg 2019-08-30  273  =

88a92c913cef09 Ronnie Sahlberg 2019-07-16  274  		if (rc)
88a92c913cef09 Ronnie Sahlberg 2019-07-16  275  			goto finished;
dc9300a670aebb Ronnie Sahlberg 2019-08-30  276  		num_rqst++;
8191576a124976 Steve French    2019-03-13  277  		trace_smb3_set_info_compo=
und_enter(xid, ses->Suid, tcon->tid,
8191576a124976 Steve French    2019-03-13  278  						   full_path);
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  279  		break;
bb435512cec806 Ronnie Sahlberg 2018-09-03  280  	case SMB2_OP_RENAME:
a7d5c294628088 Ronnie Sahlberg 2020-05-20  281  		rqst[num_rqst].rq_iov =3D=
 &vars->si_iov[0];
bb435512cec806 Ronnie Sahlberg 2018-09-03  282  		rqst[num_rqst].rq_nvec =
=3D 2;
bb435512cec806 Ronnie Sahlberg 2018-09-03  283  =

bb435512cec806 Ronnie Sahlberg 2018-09-03  284  		len =3D (2 * UniStrnlen((=
wchar_t *)ptr, PATH_MAX));
bb435512cec806 Ronnie Sahlberg 2018-09-03  285  =

a7d5c294628088 Ronnie Sahlberg 2020-05-20  286  		vars->rename_info.Replace=
IfExists =3D 1;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  287  		vars->rename_info.RootDir=
ectory =3D 0;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  288  		vars->rename_info.FileNam=
eLength =3D cpu_to_le32(len);
bb435512cec806 Ronnie Sahlberg 2018-09-03  289  =

bb435512cec806 Ronnie Sahlberg 2018-09-03  290  		size[0] =3D sizeof(struct=
 smb2_file_rename_info);
a7d5c294628088 Ronnie Sahlberg 2020-05-20  291  		data[0] =3D &vars->rename=
_info;
bb435512cec806 Ronnie Sahlberg 2018-09-03  292  =

bb435512cec806 Ronnie Sahlberg 2018-09-03  293  		size[1] =3D len + 2 /* nu=
ll */;
bb435512cec806 Ronnie Sahlberg 2018-09-03  294  		data[1] =3D (__le16 *)ptr;
bb435512cec806 Ronnie Sahlberg 2018-09-03  295  =

8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  296  		if (cfile)
352d96f3acc6e0 Aurelien Aptel  2020-05-31  297  			rc =3D SMB2_set_info_ini=
t(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  298  						&rqst[num_rqst],
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  299  						cfile->fid.persistent=
_fid,
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  300  						cfile->fid.volatile_f=
id,
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  301  					current->tgid, FILE_RE=
NAME_INFORMATION,
bb435512cec806 Ronnie Sahlberg 2018-09-03  302  					SMB2_O_INFO_FILE, 0, d=
ata, size);
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  303  		else {
352d96f3acc6e0 Aurelien Aptel  2020-05-31  304  			rc =3D SMB2_set_info_ini=
t(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  305  					&rqst[num_rqst],
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  306  					COMPOUND_FID, COMPOUND=
_FID,
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  307  					current->tgid, FILE_RE=
NAME_INFORMATION,
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  308  					SMB2_O_INFO_FILE, 0, d=
ata, size);
dc9300a670aebb Ronnie Sahlberg 2019-08-30  309  			if (!rc) {
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  310  				smb2_set_next_command(t=
con, &rqst[num_rqst]);
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  311  				smb2_set_related(&rqst[=
num_rqst]);
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  312  			}
dc9300a670aebb Ronnie Sahlberg 2019-08-30  313  		}
88a92c913cef09 Ronnie Sahlberg 2019-07-16  314  		if (rc)
88a92c913cef09 Ronnie Sahlberg 2019-07-16  315  			goto finished;
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  316  		num_rqst++;
8191576a124976 Steve French    2019-03-13  317  		trace_smb3_rename_enter(x=
id, ses->Suid, tcon->tid, full_path);
bb435512cec806 Ronnie Sahlberg 2018-09-03  318  		break;
bb435512cec806 Ronnie Sahlberg 2018-09-03  319  	case SMB2_OP_HARDLINK:
a7d5c294628088 Ronnie Sahlberg 2020-05-20  320  		rqst[num_rqst].rq_iov =3D=
 &vars->si_iov[0];
bb435512cec806 Ronnie Sahlberg 2018-09-03  321  		rqst[num_rqst].rq_nvec =
=3D 2;
bb435512cec806 Ronnie Sahlberg 2018-09-03  322  =

bb435512cec806 Ronnie Sahlberg 2018-09-03  323  		len =3D (2 * UniStrnlen((=
wchar_t *)ptr, PATH_MAX));
bb435512cec806 Ronnie Sahlberg 2018-09-03  324  =

a7d5c294628088 Ronnie Sahlberg 2020-05-20  325  		vars->link_info.ReplaceIf=
Exists =3D 0;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  326  		vars->link_info.RootDirec=
tory =3D 0;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  327  		vars->link_info.FileNameL=
ength =3D cpu_to_le32(len);
bb435512cec806 Ronnie Sahlberg 2018-09-03  328  =

bb435512cec806 Ronnie Sahlberg 2018-09-03  329  		size[0] =3D sizeof(struct=
 smb2_file_link_info);
a7d5c294628088 Ronnie Sahlberg 2020-05-20  330  		data[0] =3D &vars->link_i=
nfo;
bb435512cec806 Ronnie Sahlberg 2018-09-03  331  =

bb435512cec806 Ronnie Sahlberg 2018-09-03  332  		size[1] =3D len + 2 /* nu=
ll */;
bb435512cec806 Ronnie Sahlberg 2018-09-03  333  		data[1] =3D (__le16 *)ptr;
bb435512cec806 Ronnie Sahlberg 2018-09-03  334  =

352d96f3acc6e0 Aurelien Aptel  2020-05-31  335  		rc =3D SMB2_set_info_init=
(tcon, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  336  					&rqst[num_rqst], COMPO=
UND_FID,
bb435512cec806 Ronnie Sahlberg 2018-09-03  337  					COMPOUND_FID, current-=
>tgid,
bb435512cec806 Ronnie Sahlberg 2018-09-03  338  					FILE_LINK_INFORMATION,
bb435512cec806 Ronnie Sahlberg 2018-09-03  339  					SMB2_O_INFO_FILE, 0, d=
ata, size);
88a92c913cef09 Ronnie Sahlberg 2019-07-16  340  		if (rc)
88a92c913cef09 Ronnie Sahlberg 2019-07-16  341  			goto finished;
e77fe73c7e38c3 Ronnie Sahlberg 2018-12-31  342  		smb2_set_next_command(tco=
n, &rqst[num_rqst]);
bb435512cec806 Ronnie Sahlberg 2018-09-03  343  		smb2_set_related(&rqst[nu=
m_rqst++]);
8191576a124976 Steve French    2019-03-13  344  		trace_smb3_hardlink_enter=
(xid, ses->Suid, tcon->tid, full_path);
bb435512cec806 Ronnie Sahlberg 2018-09-03  345  		break;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  346  	default:
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  347  		cifs_dbg(VFS, "Invalid co=
mmand\n");
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  348  		rc =3D -EINVAL;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  349  	}
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  350  	if (rc)
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  351  		goto finished;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  352  =

8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  353  	/* We already have a handl=
e so we can skip the close */
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  354  	if (cfile)
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  355  		goto after_close;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  356  	/* Close */
04ad69c342fc4d Paulo Alcantara 2021-03-08  357  	flags |=3D CIFS_CP_CREATE_=
CLOSE_OP;
a7d5c294628088 Ronnie Sahlberg 2020-05-20  358  	rqst[num_rqst].rq_iov =3D =
&vars->close_iov[0];
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  359  	rqst[num_rqst].rq_nvec =3D=
 1;
352d96f3acc6e0 Aurelien Aptel  2020-05-31  360  	rc =3D SMB2_close_init(tco=
n, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  361  			     &rqst[num_rqst], CO=
MPOUND_FID,
43f8a6a74ee244 Steve French    2019-12-02  362  			     COMPOUND_FID, false=
);
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  363  	smb2_set_related(&rqst[num=
_rqst]);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  364  	if (rc)
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  365  		goto finished;
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  366   after_close:
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  367  	num_rqst++;
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  368  =

8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  369  	if (cfile) {
352d96f3acc6e0 Aurelien Aptel  2020-05-31  370  		rc =3D compound_send_recv=
(xid, ses, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  371  					flags, num_rqst - 2,
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  372  					&rqst[1], &resp_buftyp=
e[1],
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  373  					&rsp_iov[1]);
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  374  	} else
352d96f3acc6e0 Aurelien Aptel  2020-05-31  375  		rc =3D compound_send_recv=
(xid, ses, server,
352d96f3acc6e0 Aurelien Aptel  2020-05-31  376  					flags, num_rqst,
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  377  					rqst, resp_buftype,
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  378  					rsp_iov);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  379  =

c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  380   finished:
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  381  	if (cfile)
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  382  		cifsFileInfo_put(cfile);
8de9e86c67baa7 Ronnie Sahlberg 2019-08-30  383  =

c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  384  	SMB2_open_free(&rqst[0]);
7dcc82c2dfd5f1 Steve French    2019-09-11  385  	if (rc =3D=3D -EREMCHG) {
a22ed0befbc034 Steve French    2022-09-21  386  		pr_warn_once("server shar=
e %s deleted\n", tcon->tree_name);
7dcc82c2dfd5f1 Steve French    2019-09-11  387  		tcon->need_reconnect =3D =
true;
7dcc82c2dfd5f1 Steve French    2019-09-11  388  	}
7dcc82c2dfd5f1 Steve French    2019-09-11  389  =

c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  390  	switch (command) {
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  391  	case SMB2_OP_QUERY_INFO:
42c84f33d883ce Paulo Alcantara 2022-10-03  392  		idata =3D ptr;
42c84f33d883ce Paulo Alcantara 2022-10-03  393  		if (rc =3D=3D 0 && cfile =
&& cfile->symlink_target) {
42c84f33d883ce Paulo Alcantara 2022-10-03  394  			idata->symlink_target =
=3D kstrdup(cfile->symlink_target, GFP_KERNEL);
42c84f33d883ce Paulo Alcantara 2022-10-03  395  			if (!idata->symlink_targ=
et)
42c84f33d883ce Paulo Alcantara 2022-10-03  396  				rc =3D -ENOMEM;
42c84f33d883ce Paulo Alcantara 2022-10-03  397  		}
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  398  		if (rc =3D=3D 0) {
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  399  			qi_rsp =3D (struct smb2_=
query_info_rsp *)
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  400  				rsp_iov[1].iov_base;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  401  			rc =3D smb2_validate_and=
_copy_iov(
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  402  				le16_to_cpu(qi_rsp->Out=
putBufferOffset),
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  403  				le32_to_cpu(qi_rsp->Out=
putBufferLength),
42c84f33d883ce Paulo Alcantara 2022-10-03  404  				&rsp_iov[1], sizeof(ida=
ta->fi), (char *)&idata->fi);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  405  		}
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  406  		if (rqst[1].rq_iov)
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  407  			SMB2_query_info_free(&rq=
st[1]);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  408  		if (rqst[2].rq_iov)
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  409  			SMB2_close_free(&rqst[2]=
);
8191576a124976 Steve French    2019-03-13  410  		if (rc)
8191576a124976 Steve French    2019-03-13  411  			trace_smb3_query_info_co=
mpound_err(xid,  ses->Suid,
8191576a124976 Steve French    2019-03-13  412  						tcon->tid, rc);
8191576a124976 Steve French    2019-03-13  413  		else
8191576a124976 Steve French    2019-03-13  414  			trace_smb3_query_info_co=
mpound_done(xid, ses->Suid,
8191576a124976 Steve French    2019-03-13  415  						tcon->tid);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  416  		break;
6a5f6592a0b606 Steve French    2020-06-11  417  	case SMB2_OP_POSIX_QUERY_I=
NFO:
42c84f33d883ce Paulo Alcantara 2022-10-03  418  		if (rc =3D=3D 0 && cfile =
&& cfile->symlink_target) {
42c84f33d883ce Paulo Alcantara 2022-10-03 @419  			idata->symlink_target =
=3D kstrdup(cfile->symlink_target, GFP_KERNEL);
42c84f33d883ce Paulo Alcantara 2022-10-03  420  			if (!idata->symlink_targ=
et)
42c84f33d883ce Paulo Alcantara 2022-10-03  421  				rc =3D -ENOMEM;
42c84f33d883ce Paulo Alcantara 2022-10-03  422  		}
6a5f6592a0b606 Steve French    2020-06-11  423  		if (rc =3D=3D 0) {
6a5f6592a0b606 Steve French    2020-06-11  424  			qi_rsp =3D (struct smb2_=
query_info_rsp *)
6a5f6592a0b606 Steve French    2020-06-11  425  				rsp_iov[1].iov_base;
6a5f6592a0b606 Steve French    2020-06-11  426  			rc =3D smb2_validate_and=
_copy_iov(
6a5f6592a0b606 Steve French    2020-06-11  427  				le16_to_cpu(qi_rsp->Out=
putBufferOffset),
6a5f6592a0b606 Steve French    2020-06-11  428  				le32_to_cpu(qi_rsp->Out=
putBufferLength),
42c84f33d883ce Paulo Alcantara 2022-10-03  429  				&rsp_iov[1], sizeof(ida=
ta->posix_fi) /* add SIDs */,
42c84f33d883ce Paulo Alcantara 2022-10-03 @430  				(char *)&idata->posix_f=
i);
6a5f6592a0b606 Steve French    2020-06-11  431  		}
6a5f6592a0b606 Steve French    2020-06-11  432  		if (rqst[1].rq_iov)
6a5f6592a0b606 Steve French    2020-06-11  433  			SMB2_query_info_free(&rq=
st[1]);
6a5f6592a0b606 Steve French    2020-06-11  434  		if (rqst[2].rq_iov)
6a5f6592a0b606 Steve French    2020-06-11  435  			SMB2_close_free(&rqst[2]=
);
6a5f6592a0b606 Steve French    2020-06-11  436  		if (rc)
e4bd7c4a8d2a84 Steve French    2020-06-11  437  			trace_smb3_posix_query_i=
nfo_compound_err(xid,  ses->Suid, tcon->tid, rc);
6a5f6592a0b606 Steve French    2020-06-11  438  		else
e4bd7c4a8d2a84 Steve French    2020-06-11  439  			trace_smb3_posix_query_i=
nfo_compound_done(xid, ses->Suid, tcon->tid);
6a5f6592a0b606 Steve French    2020-06-11  440  		break;
47dd9597df41f0 Ronnie Sahlberg 2018-09-03  441  	case SMB2_OP_DELETE:
8191576a124976 Steve French    2019-03-13  442  		if (rc)
8191576a124976 Steve French    2019-03-13  443  			trace_smb3_delete_err(xi=
d,  ses->Suid, tcon->tid, rc);
8191576a124976 Steve French    2019-03-13  444  		else
8191576a124976 Steve French    2019-03-13  445  			trace_smb3_delete_done(x=
id, ses->Suid, tcon->tid);
8191576a124976 Steve French    2019-03-13  446  		if (rqst[1].rq_iov)
8191576a124976 Steve French    2019-03-13  447  			SMB2_close_free(&rqst[1]=
);
8191576a124976 Steve French    2019-03-13  448  		break;
f733e3936da462 Ronnie Sahlberg 2018-09-03  449  	case SMB2_OP_MKDIR:
8191576a124976 Steve French    2019-03-13  450  		if (rc)
8191576a124976 Steve French    2019-03-13  451  			trace_smb3_mkdir_err(xid=
,  ses->Suid, tcon->tid, rc);
8191576a124976 Steve French    2019-03-13  452  		else
8191576a124976 Steve French    2019-03-13  453  			trace_smb3_mkdir_done(xi=
d, ses->Suid, tcon->tid);
f733e3936da462 Ronnie Sahlberg 2018-09-03  454  		if (rqst[1].rq_iov)
f733e3936da462 Ronnie Sahlberg 2018-09-03  455  			SMB2_close_free(&rqst[1]=
);
f733e3936da462 Ronnie Sahlberg 2018-09-03  456  		break;
bb435512cec806 Ronnie Sahlberg 2018-09-03  457  	case SMB2_OP_HARDLINK:
8191576a124976 Steve French    2019-03-13  458  		if (rc)
8191576a124976 Steve French    2019-03-13  459  			trace_smb3_hardlink_err(=
xid,  ses->Suid, tcon->tid, rc);
8191576a124976 Steve French    2019-03-13  460  		else
8191576a124976 Steve French    2019-03-13  461  			trace_smb3_hardlink_done=
(xid, ses->Suid, tcon->tid);
8191576a124976 Steve French    2019-03-13  462  		free_set_inf_compound(rqs=
t);
8191576a124976 Steve French    2019-03-13  463  		break;
bb435512cec806 Ronnie Sahlberg 2018-09-03  464  	case SMB2_OP_RENAME:
8191576a124976 Steve French    2019-03-13  465  		if (rc)
8191576a124976 Steve French    2019-03-13  466  			trace_smb3_rename_err(xi=
d,  ses->Suid, tcon->tid, rc);
8191576a124976 Steve French    2019-03-13  467  		else
8191576a124976 Steve French    2019-03-13  468  			trace_smb3_rename_done(x=
id, ses->Suid, tcon->tid);
8191576a124976 Steve French    2019-03-13  469  		free_set_inf_compound(rqs=
t);
8191576a124976 Steve French    2019-03-13  470  		break;
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  471  	case SMB2_OP_RMDIR:
8191576a124976 Steve French    2019-03-13  472  		if (rc)
8191576a124976 Steve French    2019-03-13  473  			trace_smb3_rmdir_err(xid=
,  ses->Suid, tcon->tid, rc);
8191576a124976 Steve French    2019-03-13  474  		else
8191576a124976 Steve French    2019-03-13  475  			trace_smb3_rmdir_done(xi=
d, ses->Suid, tcon->tid);
8191576a124976 Steve French    2019-03-13  476  		free_set_inf_compound(rqs=
t);
8191576a124976 Steve French    2019-03-13  477  		break;
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  478  	case SMB2_OP_SET_EOF:
8191576a124976 Steve French    2019-03-13  479  		if (rc)
8191576a124976 Steve French    2019-03-13  480  			trace_smb3_set_eof_err(x=
id,  ses->Suid, tcon->tid, rc);
8191576a124976 Steve French    2019-03-13  481  		else
8191576a124976 Steve French    2019-03-13  482  			trace_smb3_set_eof_done(=
xid, ses->Suid, tcon->tid);
8191576a124976 Steve French    2019-03-13  483  		free_set_inf_compound(rqs=
t);
8191576a124976 Steve French    2019-03-13  484  		break;
dcbf91035709e9 Ronnie Sahlberg 2018-09-03  485  	case SMB2_OP_SET_INFO:
8191576a124976 Steve French    2019-03-13  486  		if (rc)
8191576a124976 Steve French    2019-03-13  487  			trace_smb3_set_info_comp=
ound_err(xid,  ses->Suid,
8191576a124976 Steve French    2019-03-13  488  						tcon->tid, rc);
8191576a124976 Steve French    2019-03-13  489  		else
8191576a124976 Steve French    2019-03-13  490  			trace_smb3_set_info_comp=
ound_done(xid, ses->Suid,
8191576a124976 Steve French    2019-03-13  491  						tcon->tid);
8191576a124976 Steve French    2019-03-13  492  		free_set_inf_compound(rqs=
t);
c2e0fe3f5aae1f Ronnie Sahlberg 2018-09-03  493  		break;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  494  	}
42c84f33d883ce Paulo Alcantara 2022-10-03  495  =

42c84f33d883ce Paulo Alcantara 2022-10-03  496  	if (rc && err_iov && err_b=
uftype) {
42c84f33d883ce Paulo Alcantara 2022-10-03  497  		memcpy(err_iov, rsp_iov, =
3 * sizeof(*err_iov));
42c84f33d883ce Paulo Alcantara 2022-10-03  498  		memcpy(err_buftype, resp_=
buftype, 3 * sizeof(*err_buftype));
42c84f33d883ce Paulo Alcantara 2022-10-03  499  	} else {
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  500  		free_rsp_buf(resp_buftype=
[0], rsp_iov[0].iov_base);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  501  		free_rsp_buf(resp_buftype=
[1], rsp_iov[1].iov_base);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  502  		free_rsp_buf(resp_buftype=
[2], rsp_iov[2].iov_base);
42c84f33d883ce Paulo Alcantara 2022-10-03  503  	}
a7d5c294628088 Ronnie Sahlberg 2020-05-20  504  	kfree(vars);
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  505  	return rc;
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  506  }
c5a5f38f075cf7 Ronnie Sahlberg 2018-09-03  507  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp

--===============1712038917384304068==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.ksh"

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L3g4
Nl82NCA2LjAuMC1yYzcgS2VybmVsIENvbmZpZ3VyYXRpb24KIwpDT05GSUdfQ0NfVkVSU0lPTl9U
RVhUPSJnY2MtMTEgKERlYmlhbiAxMS4zLjAtNSkgMTEuMy4wIgpDT05GSUdfQ0NfSVNfR0NDPXkK
Q09ORklHX0dDQ19WRVJTSU9OPTExMDMwMApDT05GSUdfQ0xBTkdfVkVSU0lPTj0wCkNPTkZJR19B
U19JU19HTlU9eQpDT05GSUdfQVNfVkVSU0lPTj0yMzg5MApDT05GSUdfTERfSVNfQkZEPXkKQ09O
RklHX0xEX1ZFUlNJT049MjM4OTAKQ09ORklHX0xMRF9WRVJTSU9OPTAKQ09ORklHX0NDX0NBTl9M
SU5LPXkKQ09ORklHX0NDX0NBTl9MSU5LX1NUQVRJQz15CkNPTkZJR19DQ19IQVNfQVNNX0dPVE9f
T1VUUFVUPXkKQ09ORklHX0NDX0hBU19BU01fSU5MSU5FPXkKQ09ORklHX0NDX0hBU19OT19QUk9G
SUxFX0ZOX0FUVFI9eQpDT05GSUdfUEFIT0xFX1ZFUlNJT049MTIzCkNPTkZJR19DT05TVFJVQ1RP
UlM9eQpDT05GSUdfSVJRX1dPUks9eQpDT05GSUdfQlVJTERUSU1FX1RBQkxFX1NPUlQ9eQpDT05G
SUdfVEhSRUFEX0lORk9fSU5fVEFTSz15CgojCiMgR2VuZXJhbCBzZXR1cAojCkNPTkZJR19CUk9L
RU5fT05fU01QPXkKQ09ORklHX0lOSVRfRU5WX0FSR19MSU1JVD0zMgojIENPTkZJR19DT01QSUxF
X1RFU1QgaXMgbm90IHNldAojIENPTkZJR19XRVJST1IgaXMgbm90IHNldApDT05GSUdfTE9DQUxW
RVJTSU9OPSIiCkNPTkZJR19MT0NBTFZFUlNJT05fQVVUTz15CkNPTkZJR19CVUlMRF9TQUxUPSIi
CkNPTkZJR19IQVZFX0tFUk5FTF9HWklQPXkKQ09ORklHX0hBVkVfS0VSTkVMX0JaSVAyPXkKQ09O
RklHX0hBVkVfS0VSTkVMX0xaTUE9eQpDT05GSUdfSEFWRV9LRVJORUxfWFo9eQpDT05GSUdfSEFW
RV9LRVJORUxfTFpPPXkKQ09ORklHX0hBVkVfS0VSTkVMX0xaND15CkNPTkZJR19IQVZFX0tFUk5F
TF9aU1REPXkKIyBDT05GSUdfS0VSTkVMX0daSVAgaXMgbm90IHNldAojIENPTkZJR19LRVJORUxf
QlpJUDIgaXMgbm90IHNldAojIENPTkZJR19LRVJORUxfTFpNQSBpcyBub3Qgc2V0CiMgQ09ORklH
X0tFUk5FTF9YWiBpcyBub3Qgc2V0CiMgQ09ORklHX0tFUk5FTF9MWk8gaXMgbm90IHNldAojIENP
TkZJR19LRVJORUxfTFo0IGlzIG5vdCBzZXQKQ09ORklHX0tFUk5FTF9aU1REPXkKQ09ORklHX0RF
RkFVTFRfSU5JVD0iIgpDT05GSUdfREVGQVVMVF9IT1NUTkFNRT0iKG5vbmUpIgojIENPTkZJR19T
WVNWSVBDIGlzIG5vdCBzZXQKIyBDT05GSUdfUE9TSVhfTVFVRVVFIGlzIG5vdCBzZXQKIyBDT05G
SUdfV0FUQ0hfUVVFVUUgaXMgbm90IHNldAojIENPTkZJR19DUk9TU19NRU1PUllfQVRUQUNIIGlz
IG5vdCBzZXQKQ09ORklHX1VTRUxJQj15CiMgQ09ORklHX0FVRElUIGlzIG5vdCBzZXQKQ09ORklH
X0hBVkVfQVJDSF9BVURJVFNZU0NBTEw9eQoKIwojIElSUSBzdWJzeXN0ZW0KIwpDT05GSUdfR0VO
RVJJQ19JUlFfUFJPQkU9eQpDT05GSUdfR0VORVJJQ19JUlFfU0hPVz15CkNPTkZJR19HRU5FUklD
X0lSUV9JTkpFQ1RJT049eQpDT05GSUdfSEFSRElSUVNfU1dfUkVTRU5EPXkKQ09ORklHX0lSUV9E
T01BSU49eQpDT05GSUdfSVJRX1NJTT15CkNPTkZJR19JUlFfRE9NQUlOX0hJRVJBUkNIWT15CkNP
TkZJR19JUlFfTVNJX0lPTU1VPXkKQ09ORklHX0dFTkVSSUNfSVJRX01BVFJJWF9BTExPQ0FUT1I9
eQpDT05GSUdfR0VORVJJQ19JUlFfUkVTRVJWQVRJT05fTU9ERT15CkNPTkZJR19JUlFfRk9SQ0VE
X1RIUkVBRElORz15CkNPTkZJR19TUEFSU0VfSVJRPXkKQ09ORklHX0dFTkVSSUNfSVJRX0RFQlVH
RlM9eQojIGVuZCBvZiBJUlEgc3Vic3lzdGVtCgpDT05GSUdfQ0xPQ0tTT1VSQ0VfV0FUQ0hET0c9
eQpDT05GSUdfQVJDSF9DTE9DS1NPVVJDRV9JTklUPXkKQ09ORklHX0NMT0NLU09VUkNFX1ZBTElE
QVRFX0xBU1RfQ1lDTEU9eQpDT05GSUdfR0VORVJJQ19USU1FX1ZTWVNDQUxMPXkKQ09ORklHX0dF
TkVSSUNfQ0xPQ0tFVkVOVFM9eQpDT05GSUdfR0VORVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1Q9
eQpDT05GSUdfR0VORVJJQ19DTE9DS0VWRU5UU19NSU5fQURKVVNUPXkKQ09ORklHX0dFTkVSSUNf
Q01PU19VUERBVEU9eQpDT05GSUdfSEFWRV9QT1NJWF9DUFVfVElNRVJTX1RBU0tfV09SSz15Cgoj
CiMgVGltZXJzIHN1YnN5c3RlbQojCkNPTkZJR19IWl9QRVJJT0RJQz15CiMgQ09ORklHX05PX0ha
X0lETEUgaXMgbm90IHNldAojIENPTkZJR19OT19IWiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJR0hf
UkVTX1RJTUVSUyBpcyBub3Qgc2V0CkNPTkZJR19DTE9DS1NPVVJDRV9XQVRDSERPR19NQVhfU0tF
V19VUz0xMDAKIyBlbmQgb2YgVGltZXJzIHN1YnN5c3RlbQoKQ09ORklHX0JQRj15CkNPTkZJR19I
QVZFX0VCUEZfSklUPXkKQ09ORklHX0FSQ0hfV0FOVF9ERUZBVUxUX0JQRl9KSVQ9eQoKIwojIEJQ
RiBzdWJzeXN0ZW0KIwojIENPTkZJR19CUEZfU1lTQ0FMTCBpcyBub3Qgc2V0CiMgQ09ORklHX0JQ
Rl9KSVQgaXMgbm90IHNldAojIGVuZCBvZiBCUEYgc3Vic3lzdGVtCgpDT05GSUdfUFJFRU1QVF9W
T0xVTlRBUllfQlVJTEQ9eQojIENPTkZJR19QUkVFTVBUX05PTkUgaXMgbm90IHNldApDT05GSUdf
UFJFRU1QVF9WT0xVTlRBUlk9eQojIENPTkZJR19QUkVFTVBUIGlzIG5vdCBzZXQKQ09ORklHX1BS
RUVNUFRfQ09VTlQ9eQojIENPTkZJR19QUkVFTVBUX0RZTkFNSUMgaXMgbm90IHNldAoKIwojIENQ
VS9UYXNrIHRpbWUgYW5kIHN0YXRzIGFjY291bnRpbmcKIwpDT05GSUdfVElDS19DUFVfQUNDT1VO
VElORz15CiMgQ09ORklHX1ZJUlRfQ1BVX0FDQ09VTlRJTkdfR0VOIGlzIG5vdCBzZXQKQ09ORklH
X0lSUV9USU1FX0FDQ09VTlRJTkc9eQojIENPTkZJR19CU0RfUFJPQ0VTU19BQ0NUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVEFTS1NUQVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfUFNJIGlzIG5vdCBzZXQK
IyBlbmQgb2YgQ1BVL1Rhc2sgdGltZSBhbmQgc3RhdHMgYWNjb3VudGluZwoKIwojIFJDVSBTdWJz
eXN0ZW0KIwpDT05GSUdfVElOWV9SQ1U9eQpDT05GSUdfUkNVX0VYUEVSVD15CkNPTkZJR19TUkNV
PXkKQ09ORklHX1RJTllfU1JDVT15CkNPTkZJR19UQVNLU19SQ1VfR0VORVJJQz15CkNPTkZJR19G
T1JDRV9UQVNLU19SQ1U9eQpDT05GSUdfVEFTS1NfUkNVPXkKQ09ORklHX0ZPUkNFX1RBU0tTX1JV
REVfUkNVPXkKQ09ORklHX1RBU0tTX1JVREVfUkNVPXkKQ09ORklHX0ZPUkNFX1RBU0tTX1RSQUNF
X1JDVT15CkNPTkZJR19UQVNLU19UUkFDRV9SQ1U9eQpDT05GSUdfUkNVX05FRURfU0VHQ0JMSVNU
PXkKQ09ORklHX1RBU0tTX1RSQUNFX1JDVV9SRUFEX01CPXkKIyBlbmQgb2YgUkNVIFN1YnN5c3Rl
bQoKQ09ORklHX0lLQ09ORklHPXkKQ09ORklHX0lLQ09ORklHX1BST0M9eQpDT05GSUdfSUtIRUFE
RVJTPXkKQ09ORklHX0xPR19CVUZfU0hJRlQ9MjAKQ09ORklHX1BSSU5US19TQUZFX0xPR19CVUZf
U0hJRlQ9MTMKIyBDT05GSUdfUFJJTlRLX0lOREVYIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfVU5T
VEFCTEVfU0NIRURfQ0xPQ0s9eQoKIwojIFNjaGVkdWxlciBmZWF0dXJlcwojCiMgZW5kIG9mIFNj
aGVkdWxlciBmZWF0dXJlcwoKQ09ORklHX0FSQ0hfU1VQUE9SVFNfTlVNQV9CQUxBTkNJTkc9eQpD
T05GSUdfQVJDSF9XQU5UX0JBVENIRURfVU5NQVBfVExCX0ZMVVNIPXkKQ09ORklHX0NDX0hBU19J
TlQxMjg9eQpDT05GSUdfQ0NfSU1QTElDSVRfRkFMTFRIUk9VR0g9Ii1XaW1wbGljaXQtZmFsbHRo
cm91Z2g9NSIKQ09ORklHX0dDQzEyX05PX0FSUkFZX0JPVU5EUz15CkNPTkZJR19BUkNIX1NVUFBP
UlRTX0lOVDEyOD15CkNPTkZJR19DR1JPVVBTPXkKQ09ORklHX1BBR0VfQ09VTlRFUj15CiMgQ09O
RklHX0NHUk9VUF9GQVZPUl9EWU5NT0RTIGlzIG5vdCBzZXQKQ09ORklHX01FTUNHPXkKIyBDT05G
SUdfQ0dST1VQX1NDSEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0dST1VQX1BJRFMgaXMgbm90IHNl
dApDT05GSUdfQ0dST1VQX1JETUE9eQpDT05GSUdfQ0dST1VQX0ZSRUVaRVI9eQojIENPTkZJR19D
R1JPVVBfSFVHRVRMQiBpcyBub3Qgc2V0CiMgQ09ORklHX0NHUk9VUF9ERVZJQ0UgaXMgbm90IHNl
dApDT05GSUdfQ0dST1VQX0NQVUFDQ1Q9eQojIENPTkZJR19DR1JPVVBfUEVSRiBpcyBub3Qgc2V0
CiMgQ09ORklHX0NHUk9VUF9NSVNDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0dST1VQX0RFQlVHIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkFNRVNQQUNFUyBpcyBub3Qgc2V0CkNPTkZJR19DSEVDS1BPSU5U
X1JFU1RPUkU9eQojIENPTkZJR19TQ0hFRF9BVVRPR1JPVVAgaXMgbm90IHNldAojIENPTkZJR19T
WVNGU19ERVBSRUNBVEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVMQVkgaXMgbm90IHNldApDT05G
SUdfQkxLX0RFVl9JTklUUkQ9eQpDT05GSUdfSU5JVFJBTUZTX1NPVVJDRT0iIgpDT05GSUdfUkRf
R1pJUD15CkNPTkZJR19SRF9CWklQMj15CiMgQ09ORklHX1JEX0xaTUEgaXMgbm90IHNldApDT05G
SUdfUkRfWFo9eQojIENPTkZJR19SRF9MWk8gaXMgbm90IHNldAojIENPTkZJR19SRF9MWjQgaXMg
bm90IHNldApDT05GSUdfUkRfWlNURD15CiMgQ09ORklHX0JPT1RfQ09ORklHIGlzIG5vdCBzZXQK
Q09ORklHX0lOSVRSQU1GU19QUkVTRVJWRV9NVElNRT15CkNPTkZJR19DQ19PUFRJTUlaRV9GT1Jf
UEVSRk9STUFOQ0U9eQojIENPTkZJR19DQ19PUFRJTUlaRV9GT1JfU0laRSBpcyBub3Qgc2V0CkNP
TkZJR19MRF9PUlBIQU5fV0FSTj15CkNPTkZJR19TWVNDVEw9eQpDT05GSUdfSEFWRV9VSUQxNj15
CkNPTkZJR19TWVNDVExfRVhDRVBUSU9OX1RSQUNFPXkKQ09ORklHX0hBVkVfUENTUEtSX1BMQVRG
T1JNPXkKQ09ORklHX0VYUEVSVD15CkNPTkZJR19VSUQxNj15CkNPTkZJR19NVUxUSVVTRVI9eQoj
IENPTkZJR19TR0VUTUFTS19TWVNDQUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfU1lTRlNfU1lTQ0FM
TCBpcyBub3Qgc2V0CkNPTkZJR19GSEFORExFPXkKIyBDT05GSUdfUE9TSVhfVElNRVJTIGlzIG5v
dCBzZXQKQ09ORklHX1BSSU5USz15CkNPTkZJR19CVUc9eQpDT05GSUdfRUxGX0NPUkU9eQojIENP
TkZJR19QQ1NQS1JfUExBVEZPUk0gaXMgbm90IHNldApDT05GSUdfQkFTRV9GVUxMPXkKQ09ORklH
X0ZVVEVYPXkKQ09ORklHX0ZVVEVYX1BJPXkKQ09ORklHX0VQT0xMPXkKQ09ORklHX1NJR05BTEZE
PXkKQ09ORklHX1RJTUVSRkQ9eQpDT05GSUdfRVZFTlRGRD15CkNPTkZJR19TSE1FTT15CiMgQ09O
RklHX0FJTyBpcyBub3Qgc2V0CkNPTkZJR19JT19VUklORz15CkNPTkZJR19BRFZJU0VfU1lTQ0FM
TFM9eQojIENPTkZJR19NRU1CQVJSSUVSIGlzIG5vdCBzZXQKQ09ORklHX0tBTExTWU1TPXkKQ09O
RklHX0tBTExTWU1TX0FMTD15CkNPTkZJR19LQUxMU1lNU19CQVNFX1JFTEFUSVZFPXkKQ09ORklH
X0FSQ0hfSEFTX01FTUJBUlJJRVJfU1lOQ19DT1JFPXkKQ09ORklHX0tDTVA9eQojIENPTkZJR19S
U0VRIGlzIG5vdCBzZXQKQ09ORklHX0VNQkVEREVEPXkKQ09ORklHX0hBVkVfUEVSRl9FVkVOVFM9
eQpDT05GSUdfUEVSRl9VU0VfVk1BTExPQz15CiMgQ09ORklHX1BDMTA0IGlzIG5vdCBzZXQKCiMK
IyBLZXJuZWwgUGVyZm9ybWFuY2UgRXZlbnRzIEFuZCBDb3VudGVycwojCkNPTkZJR19QRVJGX0VW
RU5UUz15CkNPTkZJR19ERUJVR19QRVJGX1VTRV9WTUFMTE9DPXkKIyBlbmQgb2YgS2VybmVsIFBl
cmZvcm1hbmNlIEV2ZW50cyBBbmQgQ291bnRlcnMKCkNPTkZJR19TWVNURU1fREFUQV9WRVJJRklD
QVRJT049eQojIENPTkZJR19QUk9GSUxJTkcgaXMgbm90IHNldApDT05GSUdfVFJBQ0VQT0lOVFM9
eQojIGVuZCBvZiBHZW5lcmFsIHNldHVwCgpDT05GSUdfNjRCSVQ9eQpDT05GSUdfWDg2XzY0PXkK
Q09ORklHX1g4Nj15CkNPTkZJR19JTlNUUlVDVElPTl9ERUNPREVSPXkKQ09ORklHX09VVFBVVF9G
T1JNQVQ9ImVsZjY0LXg4Ni02NCIKQ09ORklHX0xPQ0tERVBfU1VQUE9SVD15CkNPTkZJR19TVEFD
S1RSQUNFX1NVUFBPUlQ9eQpDT05GSUdfTU1VPXkKQ09ORklHX0FSQ0hfTU1BUF9STkRfQklUU19N
SU49MjgKQ09ORklHX0FSQ0hfTU1BUF9STkRfQklUU19NQVg9MzIKQ09ORklHX0FSQ0hfTU1BUF9S
TkRfQ09NUEFUX0JJVFNfTUlOPTgKQ09ORklHX0FSQ0hfTU1BUF9STkRfQ09NUEFUX0JJVFNfTUFY
PTE2CkNPTkZJR19HRU5FUklDX0JVRz15CkNPTkZJR19HRU5FUklDX0JVR19SRUxBVElWRV9QT0lO
VEVSUz15CkNPTkZJR19HRU5FUklDX0NBTElCUkFURV9ERUxBWT15CkNPTkZJR19BUkNIX0hBU19D
UFVfUkVMQVg9eQpDT05GSUdfQVJDSF9ISUJFUk5BVElPTl9QT1NTSUJMRT15CkNPTkZJR19BUkNI
X05SX0dQSU89MTAyNApDT05GSUdfQVJDSF9TVVNQRU5EX1BPU1NJQkxFPXkKQ09ORklHX0FVRElU
X0FSQ0g9eQpDT05GSUdfQVJDSF9TVVBQT1JUU19VUFJPQkVTPXkKQ09ORklHX0ZJWF9FQVJMWUNP
Tl9NRU09eQpDT05GSUdfUEdUQUJMRV9MRVZFTFM9NApDT05GSUdfQ0NfSEFTX1NBTkVfU1RBQ0tQ
Uk9URUNUT1I9eQoKIwojIFByb2Nlc3NvciB0eXBlIGFuZCBmZWF0dXJlcwojCiMgQ09ORklHX1NN
UCBpcyBub3Qgc2V0CkNPTkZJR19YODZfRkVBVFVSRV9OQU1FUz15CiMgQ09ORklHX1g4Nl9YMkFQ
SUMgaXMgbm90IHNldApDT05GSUdfWDg2X01QUEFSU0U9eQojIENPTkZJR19HT0xERklTSCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1g4Nl9DUFVfUkVTQ1RSTCBpcyBub3Qgc2V0CkNPTkZJR19YODZfRVhU
RU5ERURfUExBVEZPUk09eQojIENPTkZJR19YODZfR09MREZJU0ggaXMgbm90IHNldAojIENPTkZJ
R19YODZfSU5URUxfTUlEIGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X0lOVEVMX0xQU1MgaXMgbm90
IHNldAojIENPTkZJR19YODZfQU1EX1BMQVRGT1JNX0RFVklDRSBpcyBub3Qgc2V0CiMgQ09ORklH
X0lPU0ZfTUJJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NIRURfT01JVF9GUkFNRV9QT0lOVEVSIGlz
IG5vdCBzZXQKQ09ORklHX0hZUEVSVklTT1JfR1VFU1Q9eQpDT05GSUdfUEFSQVZJUlQ9eQojIENP
TkZJR19QQVJBVklSVF9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19YODZfSFZfQ0FMTEJBQ0tfVkVD
VE9SPXkKIyBDT05GSUdfWEVOIGlzIG5vdCBzZXQKQ09ORklHX0tWTV9HVUVTVD15CkNPTkZJR19B
UkNIX0NQVUlETEVfSEFMVFBPTEw9eQojIENPTkZJR19QVkggaXMgbm90IHNldAojIENPTkZJR19Q
QVJBVklSVF9USU1FX0FDQ09VTlRJTkcgaXMgbm90IHNldApDT05GSUdfUEFSQVZJUlRfQ0xPQ0s9
eQojIENPTkZJR19KQUlMSE9VU0VfR1VFU1QgaXMgbm90IHNldAojIENPTkZJR19BQ1JOX0dVRVNU
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUs4IGlzIG5vdCBzZXQKIyBDT05GSUdfTVBTQyBpcyBub3Qg
c2V0CiMgQ09ORklHX01DT1JFMiBpcyBub3Qgc2V0CiMgQ09ORklHX01BVE9NIGlzIG5vdCBzZXQK
Q09ORklHX0dFTkVSSUNfQ1BVPXkKQ09ORklHX1g4Nl9JTlRFUk5PREVfQ0FDSEVfU0hJRlQ9NgpD
T05GSUdfWDg2X0wxX0NBQ0hFX1NISUZUPTYKQ09ORklHX1g4Nl9UU0M9eQpDT05GSUdfWDg2X0NN
UFhDSEc2ND15CkNPTkZJR19YODZfQ01PVj15CkNPTkZJR19YODZfTUlOSU1VTV9DUFVfRkFNSUxZ
PTY0CkNPTkZJR19YODZfREVCVUdDVExNU1I9eQpDT05GSUdfSUEzMl9GRUFUX0NUTD15CkNPTkZJ
R19YODZfVk1YX0ZFQVRVUkVfTkFNRVM9eQpDT05GSUdfUFJPQ0VTU09SX1NFTEVDVD15CkNPTkZJ
R19DUFVfU1VQX0lOVEVMPXkKIyBDT05GSUdfQ1BVX1NVUF9BTUQgaXMgbm90IHNldAojIENPTkZJ
R19DUFVfU1VQX0hZR09OIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX1NVUF9DRU5UQVVSIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ1BVX1NVUF9aSEFPWElOIGlzIG5vdCBzZXQKQ09ORklHX0hQRVRfVElN
RVI9eQpDT05GSUdfSFBFVF9FTVVMQVRFX1JUQz15CkNPTkZJR19ETUk9eQpDT05GSUdfTlJfQ1BV
U19SQU5HRV9CRUdJTj0xCkNPTkZJR19OUl9DUFVTX1JBTkdFX0VORD0xCkNPTkZJR19OUl9DUFVT
X0RFRkFVTFQ9MQpDT05GSUdfTlJfQ1BVUz0xCkNPTkZJR19VUF9MQVRFX0lOSVQ9eQpDT05GSUdf
WDg2X0xPQ0FMX0FQSUM9eQpDT05GSUdfWDg2X0lPX0FQSUM9eQpDT05GSUdfWDg2X1JFUk9VVEVf
Rk9SX0JST0tFTl9CT09UX0lSUVM9eQojIENPTkZJR19YODZfTUNFIGlzIG5vdCBzZXQKCiMKIyBQ
ZXJmb3JtYW5jZSBtb25pdG9yaW5nCiMKQ09ORklHX1BFUkZfRVZFTlRTX0lOVEVMX1VOQ09SRT15
CkNPTkZJR19QRVJGX0VWRU5UU19JTlRFTF9SQVBMPXkKQ09ORklHX1BFUkZfRVZFTlRTX0lOVEVM
X0NTVEFURT15CiMgZW5kIG9mIFBlcmZvcm1hbmNlIG1vbml0b3JpbmcKCkNPTkZJR19YODZfVlNZ
U0NBTExfRU1VTEFUSU9OPXkKIyBDT05GSUdfWDg2X0lPUExfSU9QRVJNIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUlDUk9DT0RFIGlzIG5vdCBzZXQKQ09ORklHX1g4Nl9NU1I9eQpDT05GSUdfWDg2X0NQ
VUlEPXkKIyBDT05GSUdfWDg2XzVMRVZFTCBpcyBub3Qgc2V0CkNPTkZJR19YODZfRElSRUNUX0dC
UEFHRVM9eQojIENPTkZJR19YODZfQ1BBX1NUQVRJU1RJQ1MgaXMgbm90IHNldApDT05GSUdfQVJD
SF9TUEFSU0VNRU1fRU5BQkxFPXkKQ09ORklHX0FSQ0hfU1BBUlNFTUVNX0RFRkFVTFQ9eQpDT05G
SUdfSUxMRUdBTF9QT0lOVEVSX1ZBTFVFPTB4ZGVhZDAwMDAwMDAwMDAwMApDT05GSUdfWDg2X0NI
RUNLX0JJT1NfQ09SUlVQVElPTj15CiMgQ09ORklHX1g4Nl9CT09UUEFSQU1fTUVNT1JZX0NPUlJV
UFRJT05fQ0hFQ0sgaXMgbm90IHNldApDT05GSUdfTVRSUj15CkNPTkZJR19NVFJSX1NBTklUSVpF
Uj15CkNPTkZJR19NVFJSX1NBTklUSVpFUl9FTkFCTEVfREVGQVVMVD0wCkNPTkZJR19NVFJSX1NB
TklUSVpFUl9TUEFSRV9SRUdfTlJfREVGQVVMVD0xCiMgQ09ORklHX1g4Nl9QQVQgaXMgbm90IHNl
dAojIENPTkZJR19YODZfVU1JUCBpcyBub3Qgc2V0CkNPTkZJR19DQ19IQVNfSUJUPXkKIyBDT05G
SUdfWDg2X0tFUk5FTF9JQlQgaXMgbm90IHNldAojIENPTkZJR19YODZfSU5URUxfTUVNT1JZX1BS
T1RFQ1RJT05fS0VZUyBpcyBub3Qgc2V0CkNPTkZJR19YODZfSU5URUxfVFNYX01PREVfT0ZGPXkK
IyBDT05GSUdfWDg2X0lOVEVMX1RTWF9NT0RFX09OIGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X0lO
VEVMX1RTWF9NT0RFX0FVVE8gaXMgbm90IHNldAojIENPTkZJR19YODZfU0dYIGlzIG5vdCBzZXQK
Q09ORklHX0VGST15CkNPTkZJR19FRklfU1RVQj15CiMgQ09ORklHX0VGSV9NSVhFRCBpcyBub3Qg
c2V0CiMgQ09ORklHX0haXzEwMCBpcyBub3Qgc2V0CkNPTkZJR19IWl8yNTA9eQojIENPTkZJR19I
Wl8zMDAgaXMgbm90IHNldAojIENPTkZJR19IWl8xMDAwIGlzIG5vdCBzZXQKQ09ORklHX0haPTI1
MApDT05GSUdfS0VYRUM9eQpDT05GSUdfS0VYRUNfRklMRT15CkNPTkZJR19BUkNIX0hBU19LRVhF
Q19QVVJHQVRPUlk9eQpDT05GSUdfS0VYRUNfU0lHPXkKQ09ORklHX0tFWEVDX1NJR19GT1JDRT15
CiMgQ09ORklHX0NSQVNIX0RVTVAgaXMgbm90IHNldApDT05GSUdfUEhZU0lDQUxfU1RBUlQ9MHgx
MDAwMDAwCkNPTkZJR19SRUxPQ0FUQUJMRT15CiMgQ09ORklHX1JBTkRPTUlaRV9CQVNFIGlzIG5v
dCBzZXQKQ09ORklHX1BIWVNJQ0FMX0FMSUdOPTB4MjAwMDAwCkNPTkZJR19DT01QQVRfVkRTTz15
CkNPTkZJR19MRUdBQ1lfVlNZU0NBTExfWE9OTFk9eQojIENPTkZJR19MRUdBQ1lfVlNZU0NBTExf
Tk9ORSBpcyBub3Qgc2V0CiMgQ09ORklHX0NNRExJTkVfQk9PTCBpcyBub3Qgc2V0CiMgQ09ORklH
X01PRElGWV9MRFRfU1lTQ0FMTCBpcyBub3Qgc2V0CkNPTkZJR19TVFJJQ1RfU0lHQUxUU1RBQ0tf
U0laRT15CkNPTkZJR19IQVZFX0xJVkVQQVRDSD15CiMgZW5kIG9mIFByb2Nlc3NvciB0eXBlIGFu
ZCBmZWF0dXJlcwoKQ09ORklHX0NDX0hBU19TTFM9eQpDT05GSUdfQ0NfSEFTX1JFVFVSTl9USFVO
Sz15CkNPTkZJR19TUEVDVUxBVElPTl9NSVRJR0FUSU9OUz15CiMgQ09ORklHX1BBR0VfVEFCTEVf
SVNPTEFUSU9OIGlzIG5vdCBzZXQKQ09ORklHX1JFVFBPTElORT15CkNPTkZJR19SRVRIVU5LPXkK
Q09ORklHX0NQVV9JQlJTX0VOVFJZPXkKIyBDT05GSUdfU0xTIGlzIG5vdCBzZXQKQ09ORklHX0FS
Q0hfSEFTX0FERF9QQUdFUz15CkNPTkZJR19BUkNIX01IUF9NRU1NQVBfT05fTUVNT1JZX0VOQUJM
RT15CgojCiMgUG93ZXIgbWFuYWdlbWVudCBhbmQgQUNQSSBvcHRpb25zCiMKQ09ORklHX1NVU1BF
TkQ9eQpDT05GSUdfU1VTUEVORF9GUkVFWkVSPXkKIyBDT05GSUdfU1VTUEVORF9TS0lQX1NZTkMg
aXMgbm90IHNldApDT05GSUdfUE1fU0xFRVA9eQojIENPTkZJR19QTV9BVVRPU0xFRVAgaXMgbm90
IHNldAojIENPTkZJR19QTV9VU0VSU1BBQ0VfQVVUT1NMRUVQIGlzIG5vdCBzZXQKIyBDT05GSUdf
UE1fV0FLRUxPQ0tTIGlzIG5vdCBzZXQKQ09ORklHX1BNPXkKIyBDT05GSUdfUE1fREVCVUcgaXMg
bm90IHNldApDT05GSUdfUE1fQ0xLPXkKQ09ORklHX1dRX1BPV0VSX0VGRklDSUVOVF9ERUZBVUxU
PXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfQUNQST15CkNPTkZJR19BQ1BJPXkKQ09ORklHX0FDUElf
TEVHQUNZX1RBQkxFU19MT09LVVA9eQpDT05GSUdfQVJDSF9NSUdIVF9IQVZFX0FDUElfUERDPXkK
Q09ORklHX0FDUElfU1lTVEVNX1BPV0VSX1NUQVRFU19TVVBQT1JUPXkKIyBDT05GSUdfQUNQSV9E
RUJVR0dFUiBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX1NQQ1JfVEFCTEU9eQpDT05GSUdfQUNQSV9G
UERUPXkKQ09ORklHX0FDUElfTFBJVD15CkNPTkZJR19BQ1BJX1NMRUVQPXkKQ09ORklHX0FDUElf
UkVWX09WRVJSSURFX1BPU1NJQkxFPXkKQ09ORklHX0FDUElfRUNfREVCVUdGUz15CkNPTkZJR19B
Q1BJX0FDPXkKQ09ORklHX0FDUElfQkFUVEVSWT15CkNPTkZJR19BQ1BJX0JVVFRPTj15CiMgQ09O
RklHX0FDUElfVklERU8gaXMgbm90IHNldApDT05GSUdfQUNQSV9UQUQ9eQojIENPTkZJR19BQ1BJ
X0RPQ0sgaXMgbm90IHNldAojIENPTkZJR19BQ1BJX1BST0NFU1NPUiBpcyBub3Qgc2V0CkNPTkZJ
R19BQ1BJX0NVU1RPTV9EU0RUX0ZJTEU9IiIKQ09ORklHX0FSQ0hfSEFTX0FDUElfVEFCTEVfVVBH
UkFERT15CkNPTkZJR19BQ1BJX1RBQkxFX1VQR1JBREU9eQojIENPTkZJR19BQ1BJX0RFQlVHIGlz
IG5vdCBzZXQKIyBDT05GSUdfQUNQSV9QQ0lfU0xPVCBpcyBub3Qgc2V0CiMgQ09ORklHX0FDUElf
Q09OVEFJTkVSIGlzIG5vdCBzZXQKQ09ORklHX0FDUElfSE9UUExVR19JT0FQSUM9eQpDT05GSUdf
QUNQSV9TQlM9eQpDT05GSUdfQUNQSV9IRUQ9eQojIENPTkZJR19BQ1BJX0NVU1RPTV9NRVRIT0Qg
aXMgbm90IHNldApDT05GSUdfQUNQSV9CR1JUPXkKIyBDT05GSUdfQUNQSV9SRURVQ0VEX0hBUkRX
QVJFX09OTFkgaXMgbm90IHNldApDT05GSUdfSEFWRV9BQ1BJX0FQRUk9eQpDT05GSUdfSEFWRV9B
Q1BJX0FQRUlfTk1JPXkKQ09ORklHX0FDUElfQVBFST15CkNPTkZJR19BQ1BJX0FQRUlfR0hFUz15
CkNPTkZJR19BQ1BJX0FQRUlfRUlOSj15CkNPTkZJR19BQ1BJX0FQRUlfRVJTVF9ERUJVRz15CiMg
Q09ORklHX0FDUElfRFBURiBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX0NPTkZJR0ZTPXkKIyBDT05G
SUdfQUNQSV9QRlJVVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BNSUNfT1BSRUdJT04gaXMgbm90IHNl
dAojIENPTkZJR19UUFM2ODQ3MF9QTUlDX09QUkVHSU9OIGlzIG5vdCBzZXQKQ09ORklHX0FDUElf
VklPVD15CkNPTkZJR19BQ1BJX1BSTVQ9eQpDT05GSUdfWDg2X1BNX1RJTUVSPXkKCiMKIyBDUFUg
RnJlcXVlbmN5IHNjYWxpbmcKIwojIENPTkZJR19DUFVfRlJFUSBpcyBub3Qgc2V0CiMgZW5kIG9m
IENQVSBGcmVxdWVuY3kgc2NhbGluZwoKIwojIENQVSBJZGxlCiMKIyBDT05GSUdfQ1BVX0lETEUg
aXMgbm90IHNldAojIGVuZCBvZiBDUFUgSWRsZQojIGVuZCBvZiBQb3dlciBtYW5hZ2VtZW50IGFu
ZCBBQ1BJIG9wdGlvbnMKCiMKIyBCdXMgb3B0aW9ucyAoUENJIGV0Yy4pCiMKQ09ORklHX1BDSV9E
SVJFQ1Q9eQpDT05GSUdfUENJX01NQ09ORklHPXkKQ09ORklHX01NQ09ORl9GQU0xMEg9eQojIENP
TkZJR19QQ0lfQ05CMjBMRV9RVUlSSyBpcyBub3Qgc2V0CiMgQ09ORklHX0lTQV9CVVMgaXMgbm90
IHNldAojIENPTkZJR19JU0FfRE1BX0FQSSBpcyBub3Qgc2V0CiMgZW5kIG9mIEJ1cyBvcHRpb25z
IChQQ0kgZXRjLikKCiMKIyBCaW5hcnkgRW11bGF0aW9ucwojCkNPTkZJR19JQTMyX0VNVUxBVElP
Tj15CiMgQ09ORklHX1g4Nl9YMzJfQUJJIGlzIG5vdCBzZXQKQ09ORklHX0NPTVBBVF8zMj15CkNP
TkZJR19DT01QQVQ9eQpDT05GSUdfQ09NUEFUX0ZPUl9VNjRfQUxJR05NRU5UPXkKIyBlbmQgb2Yg
QmluYXJ5IEVtdWxhdGlvbnMKCkNPTkZJR19IQVZFX0tWTT15CkNPTkZJR19WSVJUVUFMSVpBVElP
Tj15CkNPTkZJR19BU19BVlg1MTI9eQpDT05GSUdfQVNfU0hBMV9OST15CkNPTkZJR19BU19TSEEy
NTZfTkk9eQpDT05GSUdfQVNfVFBBVVNFPXkKCiMKIyBHZW5lcmFsIGFyY2hpdGVjdHVyZS1kZXBl
bmRlbnQgb3B0aW9ucwojCkNPTkZJR19DUkFTSF9DT1JFPXkKQ09ORklHX0tFWEVDX0NPUkU9eQpD
T05GSUdfR0VORVJJQ19FTlRSWT15CiMgQ09ORklHX0tQUk9CRVMgaXMgbm90IHNldAojIENPTkZJ
R19KVU1QX0xBQkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfU1RBVElDX0NBTExfU0VMRlRFU1QgaXMg
bm90IHNldApDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUz15CkNPTkZJR19B
UkNIX1VTRV9CVUlMVElOX0JTV0FQPXkKQ09ORklHX0hBVkVfSU9SRU1BUF9QUk9UPXkKQ09ORklH
X0hBVkVfS1BST0JFUz15CkNPTkZJR19IQVZFX0tSRVRQUk9CRVM9eQpDT05GSUdfSEFWRV9PUFRQ
Uk9CRVM9eQpDT05GSUdfSEFWRV9LUFJPQkVTX09OX0ZUUkFDRT15CkNPTkZJR19BUkNIX0NPUlJF
Q1RfU1RBQ0tUUkFDRV9PTl9LUkVUUFJPQkU9eQpDT05GSUdfSEFWRV9GVU5DVElPTl9FUlJPUl9J
TkpFQ1RJT049eQpDT05GSUdfSEFWRV9OTUk9eQpDT05GSUdfVFJBQ0VfSVJRRkxBR1NfU1VQUE9S
VD15CkNPTkZJR19UUkFDRV9JUlFGTEFHU19OTUlfU1VQUE9SVD15CkNPTkZJR19IQVZFX0FSQ0hf
VFJBQ0VIT09LPXkKQ09ORklHX0hBVkVfRE1BX0NPTlRJR1VPVVM9eQpDT05GSUdfR0VORVJJQ19T
TVBfSURMRV9USFJFQUQ9eQpDT05GSUdfQVJDSF9IQVNfRk9SVElGWV9TT1VSQ0U9eQpDT05GSUdf
QVJDSF9IQVNfU0VUX01FTU9SWT15CkNPTkZJR19BUkNIX0hBU19TRVRfRElSRUNUX01BUD15CkNP
TkZJR19IQVZFX0FSQ0hfVEhSRUFEX1NUUlVDVF9XSElURUxJU1Q9eQpDT05GSUdfQVJDSF9XQU5U
U19EWU5BTUlDX1RBU0tfU1RSVUNUPXkKQ09ORklHX0FSQ0hfV0FOVFNfTk9fSU5TVFI9eQpDT05G
SUdfSEFWRV9BU01fTU9EVkVSU0lPTlM9eQpDT05GSUdfSEFWRV9SRUdTX0FORF9TVEFDS19BQ0NF
U1NfQVBJPXkKQ09ORklHX0hBVkVfUlNFUT15CkNPTkZJR19IQVZFX0ZVTkNUSU9OX0FSR19BQ0NF
U1NfQVBJPXkKQ09ORklHX0hBVkVfSFdfQlJFQUtQT0lOVD15CkNPTkZJR19IQVZFX01JWEVEX0JS
RUFLUE9JTlRTX1JFR1M9eQpDT05GSUdfSEFWRV9VU0VSX1JFVFVSTl9OT1RJRklFUj15CkNPTkZJ
R19IQVZFX1BFUkZfRVZFTlRTX05NST15CkNPTkZJR19IQVZFX0hBUkRMT0NLVVBfREVURUNUT1Jf
UEVSRj15CkNPTkZJR19IQVZFX1BFUkZfUkVHUz15CkNPTkZJR19IQVZFX1BFUkZfVVNFUl9TVEFD
S19EVU1QPXkKQ09ORklHX0hBVkVfQVJDSF9KVU1QX0xBQkVMPXkKQ09ORklHX0hBVkVfQVJDSF9K
VU1QX0xBQkVMX1JFTEFUSVZFPXkKQ09ORklHX01NVV9HQVRIRVJfVEFCTEVfRlJFRT15CkNPTkZJ
R19NTVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFPXkKQ09ORklHX01NVV9HQVRIRVJfTUVSR0VfVk1B
Uz15CkNPTkZJR19BUkNIX0hBVkVfTk1JX1NBRkVfQ01QWENIRz15CkNPTkZJR19IQVZFX0NNUFhD
SEdfTE9DQUw9eQpDT05GSUdfSEFWRV9DTVBYQ0hHX0RPVUJMRT15CkNPTkZJR19BUkNIX1dBTlRf
Q09NUEFUX0lQQ19QQVJTRV9WRVJTSU9OPXkKQ09ORklHX0FSQ0hfV0FOVF9PTERfQ09NUEFUX0lQ
Qz15CkNPTkZJR19IQVZFX0FSQ0hfU0VDQ09NUD15CkNPTkZJR19IQVZFX0FSQ0hfU0VDQ09NUF9G
SUxURVI9eQpDT05GSUdfU0VDQ09NUD15CkNPTkZJR19TRUNDT01QX0ZJTFRFUj15CiMgQ09ORklH
X1NFQ0NPTVBfQ0FDSEVfREVCVUcgaXMgbm90IHNldApDT05GSUdfSEFWRV9BUkNIX1NUQUNLTEVB
Sz15CkNPTkZJR19IQVZFX1NUQUNLUFJPVEVDVE9SPXkKQ09ORklHX1NUQUNLUFJPVEVDVE9SPXkK
IyBDT05GSUdfU1RBQ0tQUk9URUNUT1JfU1RST05HIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfU1VQ
UE9SVFNfTFRPX0NMQU5HPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfTFRPX0NMQU5HX1RISU49eQpD
T05GSUdfTFRPX05PTkU9eQpDT05GSUdfSEFWRV9BUkNIX1dJVEhJTl9TVEFDS19GUkFNRVM9eQpD
T05GSUdfSEFWRV9DT05URVhUX1RSQUNLSU5HX1VTRVI9eQpDT05GSUdfSEFWRV9DT05URVhUX1RS
QUNLSU5HX1VTRVJfT0ZGU1RBQ0s9eQpDT05GSUdfSEFWRV9WSVJUX0NQVV9BQ0NPVU5USU5HX0dF
Tj15CkNPTkZJR19IQVZFX0lSUV9USU1FX0FDQ09VTlRJTkc9eQpDT05GSUdfSEFWRV9NT1ZFX1BV
RD15CkNPTkZJR19IQVZFX01PVkVfUE1EPXkKQ09ORklHX0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9I
VUdFUEFHRT15CkNPTkZJR19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0VfUFVEPXkKQ09O
RklHX0hBVkVfQVJDSF9IVUdFX1ZNQVA9eQpDT05GSUdfSEFWRV9BUkNIX0hVR0VfVk1BTExPQz15
CkNPTkZJR19BUkNIX1dBTlRfSFVHRV9QTURfU0hBUkU9eQpDT05GSUdfSEFWRV9BUkNIX1NPRlRf
RElSVFk9eQpDT05GSUdfSEFWRV9NT0RfQVJDSF9TUEVDSUZJQz15CkNPTkZJR19NT0RVTEVTX1VT
RV9FTEZfUkVMQT15CkNPTkZJR19IQVZFX0lSUV9FWElUX09OX0lSUV9TVEFDSz15CkNPTkZJR19I
QVZFX1NPRlRJUlFfT05fT1dOX1NUQUNLPXkKQ09ORklHX1NPRlRJUlFfT05fT1dOX1NUQUNLPXkK
Q09ORklHX0FSQ0hfSEFTX0VMRl9SQU5ET01JWkU9eQpDT05GSUdfSEFWRV9BUkNIX01NQVBfUk5E
X0JJVFM9eQpDT05GSUdfSEFWRV9FWElUX1RIUkVBRD15CkNPTkZJR19BUkNIX01NQVBfUk5EX0JJ
VFM9MjgKQ09ORklHX0hBVkVfQVJDSF9NTUFQX1JORF9DT01QQVRfQklUUz15CkNPTkZJR19BUkNI
X01NQVBfUk5EX0NPTVBBVF9CSVRTPTgKQ09ORklHX0hBVkVfQVJDSF9DT01QQVRfTU1BUF9CQVNF
Uz15CkNPTkZJR19QQUdFX1NJWkVfTEVTU19USEFOXzY0S0I9eQpDT05GSUdfUEFHRV9TSVpFX0xF
U1NfVEhBTl8yNTZLQj15CkNPTkZJR19IQVZFX09CSlRPT0w9eQpDT05GSUdfSEFWRV9KVU1QX0xB
QkVMX0hBQ0s9eQpDT05GSUdfSEFWRV9OT0lOU1RSX0hBQ0s9eQpDT05GSUdfSEFWRV9OT0lOU1RS
X1ZBTElEQVRJT049eQpDT05GSUdfSEFWRV9VQUNDRVNTX1ZBTElEQVRJT049eQpDT05GSUdfSEFW
RV9TVEFDS19WQUxJREFUSU9OPXkKQ09ORklHX0hBVkVfUkVMSUFCTEVfU1RBQ0tUUkFDRT15CkNP
TkZJR19JU0FfQlVTX0FQST15CkNPTkZJR19PTERfU0lHU1VTUEVORDM9eQpDT05GSUdfQ09NUEFU
X09MRF9TSUdBQ1RJT049eQpDT05GSUdfQ09NUEFUXzMyQklUX1RJTUU9eQpDT05GSUdfSEFWRV9B
UkNIX1ZNQVBfU1RBQ0s9eQojIENPTkZJR19WTUFQX1NUQUNLIGlzIG5vdCBzZXQKQ09ORklHX0hB
VkVfQVJDSF9SQU5ET01JWkVfS1NUQUNLX09GRlNFVD15CkNPTkZJR19SQU5ET01JWkVfS1NUQUNL
X09GRlNFVD15CkNPTkZJR19SQU5ET01JWkVfS1NUQUNLX09GRlNFVF9ERUZBVUxUPXkKQ09ORklH
X0FSQ0hfSEFTX1NUUklDVF9LRVJORUxfUldYPXkKQ09ORklHX1NUUklDVF9LRVJORUxfUldYPXkK
Q09ORklHX0FSQ0hfSEFTX1NUUklDVF9NT0RVTEVfUldYPXkKQ09ORklHX1NUUklDVF9NT0RVTEVf
UldYPXkKQ09ORklHX0hBVkVfQVJDSF9QUkVMMzJfUkVMT0NBVElPTlM9eQpDT05GSUdfQVJDSF9V
U0VfTUVNUkVNQVBfUFJPVD15CkNPTkZJR19MT0NLX0VWRU5UX0NPVU5UUz15CkNPTkZJR19BUkNI
X0hBU19NRU1fRU5DUllQVD15CkNPTkZJR19IQVZFX1NUQVRJQ19DQUxMPXkKQ09ORklHX0hBVkVf
U1RBVElDX0NBTExfSU5MSU5FPXkKQ09ORklHX0hBVkVfUFJFRU1QVF9EWU5BTUlDPXkKQ09ORklH
X0hBVkVfUFJFRU1QVF9EWU5BTUlDX0NBTEw9eQpDT05GSUdfQVJDSF9XQU5UX0xEX09SUEhBTl9X
QVJOPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfREVCVUdfUEFHRUFMTE9DPXkKQ09ORklHX0FSQ0hf
U1VQUE9SVFNfUEFHRV9UQUJMRV9DSEVDSz15CkNPTkZJR19BUkNIX0hBU19FTEZDT1JFX0NPTVBB
VD15CkNPTkZJR19BUkNIX0hBU19QQVJBTk9JRF9MMURfRkxVU0g9eQpDT05GSUdfRFlOQU1JQ19T
SUdGUkFNRT15CgojCiMgR0NPVi1iYXNlZCBrZXJuZWwgcHJvZmlsaW5nCiMKQ09ORklHX0dDT1Zf
S0VSTkVMPXkKQ09ORklHX0FSQ0hfSEFTX0dDT1ZfUFJPRklMRV9BTEw9eQojIENPTkZJR19HQ09W
X1BST0ZJTEVfQUxMIGlzIG5vdCBzZXQKIyBlbmQgb2YgR0NPVi1iYXNlZCBrZXJuZWwgcHJvZmls
aW5nCgpDT05GSUdfSEFWRV9HQ0NfUExVR0lOUz15CkNPTkZJR19HQ0NfUExVR0lOUz15CiMgQ09O
RklHX0dDQ19QTFVHSU5fTEFURU5UX0VOVFJPUFkgaXMgbm90IHNldAojIGVuZCBvZiBHZW5lcmFs
IGFyY2hpdGVjdHVyZS1kZXBlbmRlbnQgb3B0aW9ucwoKQ09ORklHX1JUX01VVEVYRVM9eQpDT05G
SUdfQkFTRV9TTUFMTD0wCkNPTkZJR19NT0RVTEVTPXkKIyBDT05GSUdfTU9EVUxFX0ZPUkNFX0xP
QUQgaXMgbm90IHNldApDT05GSUdfTU9EVUxFX1VOTE9BRD15CiMgQ09ORklHX01PRFVMRV9GT1JD
RV9VTkxPQUQgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfVU5MT0FEX1RBSU5UX1RSQUNLSU5H
IGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVkVSU0lPTlMgaXMgbm90IHNldAojIENPTkZJR19NT0RV
TEVfU1JDVkVSU0lPTl9BTEwgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfU0lHIGlzIG5vdCBz
ZXQKQ09ORklHX01PRFVMRV9DT01QUkVTU19OT05FPXkKIyBDT05GSUdfTU9EVUxFX0NPTVBSRVNT
X0daSVAgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfQ09NUFJFU1NfWFogaXMgbm90IHNldAoj
IENPTkZJR19NT0RVTEVfQ09NUFJFU1NfWlNURCBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9B
TExPV19NSVNTSU5HX05BTUVTUEFDRV9JTVBPUlRTIGlzIG5vdCBzZXQKQ09ORklHX01PRFBST0JF
X1BBVEg9Ii9zYmluL21vZHByb2JlIgojIENPTkZJR19UUklNX1VOVVNFRF9LU1lNUyBpcyBub3Qg
c2V0CkNPTkZJR19NT0RVTEVTX1RSRUVfTE9PS1VQPXkKIyBDT05GSUdfQkxPQ0sgaXMgbm90IHNl
dApDT05GSUdfQVNOMT15CkNPTkZJR19VTklOTElORV9TUElOX1VOTE9DSz15CkNPTkZJR19BUkNI
X1NVUFBPUlRTX0FUT01JQ19STVc9eQpDT05GSUdfQVJDSF9VU0VfUVVFVUVEX1NQSU5MT0NLUz15
CkNPTkZJR19BUkNIX1VTRV9RVUVVRURfUldMT0NLUz15CkNPTkZJR19BUkNIX0hBU19OT05fT1ZF
UkxBUFBJTkdfQUREUkVTU19TUEFDRT15CkNPTkZJR19BUkNIX0hBU19TWU5DX0NPUkVfQkVGT1JF
X1VTRVJNT0RFPXkKQ09ORklHX0FSQ0hfSEFTX1NZU0NBTExfV1JBUFBFUj15CkNPTkZJR19GUkVF
WkVSPXkKCiMKIyBFeGVjdXRhYmxlIGZpbGUgZm9ybWF0cwojCkNPTkZJR19CSU5GTVRfRUxGPXkK
Q09ORklHX0NPTVBBVF9CSU5GTVRfRUxGPXkKQ09ORklHX0VMRkNPUkU9eQojIENPTkZJR19DT1JF
X0RVTVBfREVGQVVMVF9FTEZfSEVBREVSUyBpcyBub3Qgc2V0CkNPTkZJR19CSU5GTVRfU0NSSVBU
PXkKQ09ORklHX0JJTkZNVF9NSVNDPXkKQ09ORklHX0NPUkVEVU1QPXkKIyBlbmQgb2YgRXhlY3V0
YWJsZSBmaWxlIGZvcm1hdHMKCiMKIyBNZW1vcnkgTWFuYWdlbWVudCBvcHRpb25zCiMKCiMKIyBT
TEFCIGFsbG9jYXRvciBvcHRpb25zCiMKIyBDT05GSUdfU0xBQiBpcyBub3Qgc2V0CiMgQ09ORklH
X1NMVUIgaXMgbm90IHNldApDT05GSUdfU0xPQj15CiMgZW5kIG9mIFNMQUIgYWxsb2NhdG9yIG9w
dGlvbnMKCkNPTkZJR19TSFVGRkxFX1BBR0VfQUxMT0NBVE9SPXkKQ09ORklHX0NPTVBBVF9CUks9
eQpDT05GSUdfU1BBUlNFTUVNPXkKQ09ORklHX1NQQVJTRU1FTV9FWFRSRU1FPXkKQ09ORklHX1NQ
QVJTRU1FTV9WTUVNTUFQX0VOQUJMRT15CkNPTkZJR19TUEFSU0VNRU1fVk1FTU1BUD15CkNPTkZJ
R19IQVZFX0ZBU1RfR1VQPXkKQ09ORklHX01FTU9SWV9JU09MQVRJT049eQpDT05GSUdfRVhDTFVT
SVZFX1NZU1RFTV9SQU09eQpDT05GSUdfQVJDSF9FTkFCTEVfTUVNT1JZX0hPVFBMVUc9eQojIENP
TkZJR19NRU1PUllfSE9UUExVRyBpcyBub3Qgc2V0CkNPTkZJR19TUExJVF9QVExPQ0tfQ1BVUz00
CkNPTkZJR19BUkNIX0VOQUJMRV9TUExJVF9QTURfUFRMT0NLPXkKQ09ORklHX0NPTVBBQ1RJT049
eQpDT05GSUdfUEFHRV9SRVBPUlRJTkc9eQpDT05GSUdfTUlHUkFUSU9OPXkKQ09ORklHX0FSQ0hf
RU5BQkxFX0hVR0VQQUdFX01JR1JBVElPTj15CkNPTkZJR19DT05USUdfQUxMT0M9eQpDT05GSUdf
UEhZU19BRERSX1RfNjRCSVQ9eQpDT05GSUdfS1NNPXkKQ09ORklHX0RFRkFVTFRfTU1BUF9NSU5f
QUREUj00MDk2CkNPTkZJR19BUkNIX1dBTlRfR0VORVJBTF9IVUdFVExCPXkKQ09ORklHX0FSQ0hf
V0FOVFNfVEhQX1NXQVA9eQojIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRSBpcyBub3Qgc2V0
CkNPTkZJR19ORUVEX1BFUl9DUFVfS009eQpDT05GSUdfTkVFRF9QRVJfQ1BVX0VNQkVEX0ZJUlNU
X0NIVU5LPXkKQ09ORklHX05FRURfUEVSX0NQVV9QQUdFX0ZJUlNUX0NIVU5LPXkKQ09ORklHX0hB
VkVfU0VUVVBfUEVSX0NQVV9BUkVBPXkKQ09ORklHX0NNQT15CiMgQ09ORklHX0NNQV9ERUJVRyBp
cyBub3Qgc2V0CkNPTkZJR19DTUFfREVCVUdGUz15CiMgQ09ORklHX0NNQV9TWVNGUyBpcyBub3Qg
c2V0CkNPTkZJR19DTUFfQVJFQVM9NwojIENPTkZJR19NRU1fU09GVF9ESVJUWSBpcyBub3Qgc2V0
CkNPTkZJR19HRU5FUklDX0VBUkxZX0lPUkVNQVA9eQojIENPTkZJR19JRExFX1BBR0VfVFJBQ0tJ
TkcgaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfQ0FDSEVfTElORV9TSVpFPXkKQ09ORklHX0FS
Q0hfSEFTX0NVUlJFTlRfU1RBQ0tfUE9JTlRFUj15CkNPTkZJR19BUkNIX0hBU19QVEVfREVWTUFQ
PXkKQ09ORklHX0FSQ0hfSEFTX1pPTkVfRE1BX1NFVD15CiMgQ09ORklHX1pPTkVfRE1BIGlzIG5v
dCBzZXQKQ09ORklHX1pPTkVfRE1BMzI9eQojIENPTkZJR19WTV9FVkVOVF9DT1VOVEVSUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BFUkNQVV9TVEFUUyBpcyBub3Qgc2V0CiMgQ09ORklHX0dVUF9URVNU
IGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX1BURV9TUEVDSUFMPXkKIyBDT05GSUdfQU5PTl9W
TUFfTkFNRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTRVJGQVVMVEZEIGlzIG5vdCBzZXQKCiMKIyBE
YXRhIEFjY2VzcyBNb25pdG9yaW5nCiMKIyBDT05GSUdfREFNT04gaXMgbm90IHNldAojIGVuZCBv
ZiBEYXRhIEFjY2VzcyBNb25pdG9yaW5nCiMgZW5kIG9mIE1lbW9yeSBNYW5hZ2VtZW50IG9wdGlv
bnMKCkNPTkZJR19ORVQ9eQpDT05GSUdfU0tCX0VYVEVOU0lPTlM9eQoKIwojIE5ldHdvcmtpbmcg
b3B0aW9ucwojCkNPTkZJR19QQUNLRVQ9eQojIENPTkZJR19QQUNLRVRfRElBRyBpcyBub3Qgc2V0
CkNPTkZJR19VTklYPXkKQ09ORklHX1VOSVhfU0NNPXkKQ09ORklHX0FGX1VOSVhfT09CPXkKIyBD
T05GSUdfVU5JWF9ESUFHIGlzIG5vdCBzZXQKIyBDT05GSUdfVExTIGlzIG5vdCBzZXQKIyBDT05G
SUdfWEZSTV9VU0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0tFWSBpcyBub3Qgc2V0CkNPTkZJ
R19JTkVUPXkKIyBDT05GSUdfSVBfTVVMVElDQVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfQURW
QU5DRURfUk9VVEVSIGlzIG5vdCBzZXQKQ09ORklHX0lQX1BOUD15CkNPTkZJR19JUF9QTlBfREhD
UD15CiMgQ09ORklHX0lQX1BOUF9CT09UUCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX1BOUF9SQVJQ
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0lQSVAgaXMgbm90IHNldAojIENPTkZJR19ORVRfSVBH
UkVfREVNVVggaXMgbm90IHNldApDT05GSUdfTkVUX0lQX1RVTk5FTD15CiMgQ09ORklHX1NZTl9D
T09LSUVTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0lQVlRJIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUX0ZPVSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9GT1VfSVBfVFVOTkVMUyBpcyBub3Qgc2V0
CiMgQ09ORklHX0lORVRfQUggaXMgbm90IHNldAojIENPTkZJR19JTkVUX0VTUCBpcyBub3Qgc2V0
CiMgQ09ORklHX0lORVRfSVBDT01QIGlzIG5vdCBzZXQKQ09ORklHX0lORVRfVFVOTkVMPXkKQ09O
RklHX0lORVRfRElBRz15CkNPTkZJR19JTkVUX1RDUF9ESUFHPXkKIyBDT05GSUdfSU5FVF9VRFBf
RElBRyBpcyBub3Qgc2V0CiMgQ09ORklHX0lORVRfUkFXX0RJQUcgaXMgbm90IHNldAojIENPTkZJ
R19JTkVUX0RJQUdfREVTVFJPWSBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX0FEVkFOQ0VE
IGlzIG5vdCBzZXQKQ09ORklHX1RDUF9DT05HX0NVQklDPXkKQ09ORklHX0RFRkFVTFRfVENQX0NP
Tkc9ImN1YmljIgojIENPTkZJR19UQ1BfTUQ1U0lHIGlzIG5vdCBzZXQKQ09ORklHX0lQVjY9eQoj
IENPTkZJR19JUFY2X1JPVVRFUl9QUkVGIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9PUFRJTUlT
VElDX0RBRCBpcyBub3Qgc2V0CiMgQ09ORklHX0lORVQ2X0FIIGlzIG5vdCBzZXQKIyBDT05GSUdf
SU5FVDZfRVNQIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5FVDZfSVBDT01QIGlzIG5vdCBzZXQKIyBD
T05GSUdfSVBWNl9NSVA2IGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9WVEkgaXMgbm90IHNldApD
T05GSUdfSVBWNl9TSVQ9eQojIENPTkZJR19JUFY2X1NJVF82UkQgaXMgbm90IHNldApDT05GSUdf
SVBWNl9ORElTQ19OT0RFVFlQRT15CiMgQ09ORklHX0lQVjZfVFVOTkVMIGlzIG5vdCBzZXQKIyBD
T05GSUdfSVBWNl9NVUxUSVBMRV9UQUJMRVMgaXMgbm90IHNldAojIENPTkZJR19JUFY2X01ST1VU
RSBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfU0VHNl9MV1RVTk5FTCBpcyBub3Qgc2V0CiMgQ09O
RklHX0lQVjZfU0VHNl9ITUFDIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9SUExfTFdUVU5ORUwg
aXMgbm90IHNldAojIENPTkZJR19JUFY2X0lPQU02X0xXVFVOTkVMIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVUTEFCRUwgaXMgbm90IHNldApDT05GSUdfTVBUQ1A9eQpDT05GSUdfSU5FVF9NUFRDUF9E
SUFHPXkKQ09ORklHX01QVENQX0lQVjY9eQojIENPTkZJR19ORVRXT1JLX1NFQ01BUksgaXMgbm90
IHNldAojIENPTkZJR19ORVRXT1JLX1BIWV9USU1FU1RBTVBJTkcgaXMgbm90IHNldAojIENPTkZJ
R19ORVRGSUxURVIgaXMgbm90IHNldAojIENPTkZJR19CUEZJTFRFUiBpcyBub3Qgc2V0CiMgQ09O
RklHX0lQX0RDQ1AgaXMgbm90IHNldAojIENPTkZJR19JUF9TQ1RQIGlzIG5vdCBzZXQKIyBDT05G
SUdfUkRTIGlzIG5vdCBzZXQKIyBDT05GSUdfVElQQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FUTSBp
cyBub3Qgc2V0CiMgQ09ORklHX0wyVFAgaXMgbm90IHNldAojIENPTkZJR19CUklER0UgaXMgbm90
IHNldAojIENPTkZJR19ORVRfRFNBIGlzIG5vdCBzZXQKIyBDT05GSUdfVkxBTl84MDIxUSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RFQ05FVCBpcyBub3Qgc2V0CiMgQ09ORklHX0xMQzIgaXMgbm90IHNl
dAojIENPTkZJR19BVEFMSyBpcyBub3Qgc2V0CiMgQ09ORklHX1gyNSBpcyBub3Qgc2V0CiMgQ09O
RklHX0xBUEIgaXMgbm90IHNldAojIENPTkZJR19QSE9ORVQgaXMgbm90IHNldAojIENPTkZJR182
TE9XUEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfSUVFRTgwMjE1NCBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVF9TQ0hFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0RDQiBpcyBub3Qgc2V0CkNPTkZJR19ETlNf
UkVTT0xWRVI9bQojIENPTkZJR19CQVRNQU5fQURWIGlzIG5vdCBzZXQKIyBDT05GSUdfT1BFTlZT
V0lUQ0ggaXMgbm90IHNldAojIENPTkZJR19WU09DS0VUUyBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VExJTktfRElBRyBpcyBub3Qgc2V0CiMgQ09ORklHX01QTFMgaXMgbm90IHNldAojIENPTkZJR19O
RVRfTlNIIGlzIG5vdCBzZXQKIyBDT05GSUdfSFNSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NX
SVRDSERFViBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9MM19NQVNURVJfREVWIGlzIG5vdCBzZXQK
IyBDT05GSUdfUVJUUiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9OQ1NJIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ0dST1VQX05FVF9QUklPIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0dST1VQX05FVF9DTEFT
U0lEIGlzIG5vdCBzZXQKQ09ORklHX05FVF9SWF9CVVNZX1BPTEw9eQpDT05GSUdfQlFMPXkKCiMK
IyBOZXR3b3JrIHRlc3RpbmcKIwojIENPTkZJR19ORVRfUEtUR0VOIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVUX0RST1BfTU9OSVRPUiBpcyBub3Qgc2V0CiMgZW5kIG9mIE5ldHdvcmsgdGVzdGluZwoj
IGVuZCBvZiBOZXR3b3JraW5nIG9wdGlvbnMKCiMgQ09ORklHX0hBTVJBRElPIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ0FOIGlzIG5vdCBzZXQKIyBDT05GSUdfQlQgaXMgbm90IHNldAojIENPTkZJR19B
Rl9SWFJQQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FGX0tDTSBpcyBub3Qgc2V0CiMgQ09ORklHX01D
VFAgaXMgbm90IHNldApDT05GSUdfV0lSRUxFU1M9eQojIENPTkZJR19DRkc4MDIxMSBpcyBub3Qg
c2V0CgojCiMgQ0ZHODAyMTEgbmVlZHMgdG8gYmUgZW5hYmxlZCBmb3IgTUFDODAyMTEKIwpDT05G
SUdfTUFDODAyMTFfU1RBX0hBU0hfTUFYX1NJWkU9MAojIENPTkZJR19SRktJTEwgaXMgbm90IHNl
dApDT05GSUdfTkVUXzlQPXkKQ09ORklHX05FVF85UF9GRD15CkNPTkZJR19ORVRfOVBfVklSVElP
PXkKIyBDT05GSUdfTkVUXzlQX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FJRiBpcyBub3Qg
c2V0CiMgQ09ORklHX0NFUEhfTElCIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZDIGlzIG5vdCBzZXQK
IyBDT05GSUdfUFNBTVBMRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9JRkUgaXMgbm90IHNldAoj
IENPTkZJR19MV1RVTk5FTCBpcyBub3Qgc2V0CkNPTkZJR19EU1RfQ0FDSEU9eQpDT05GSUdfR1JP
X0NFTExTPXkKQ09ORklHX0ZBSUxPVkVSPW0KQ09ORklHX0VUSFRPT0xfTkVUTElOSz15CgojCiMg
RGV2aWNlIERyaXZlcnMKIwpDT05GSUdfSEFWRV9FSVNBPXkKIyBDT05GSUdfRUlTQSBpcyBub3Qg
c2V0CkNPTkZJR19IQVZFX1BDST15CkNPTkZJR19QQ0k9eQpDT05GSUdfUENJX0RPTUFJTlM9eQoj
IENPTkZJR19QQ0lFUE9SVEJVUyBpcyBub3Qgc2V0CkNPTkZJR19QQ0lFQVNQTT15CkNPTkZJR19Q
Q0lFQVNQTV9ERUZBVUxUPXkKIyBDT05GSUdfUENJRUFTUE1fUE9XRVJTQVZFIGlzIG5vdCBzZXQK
IyBDT05GSUdfUENJRUFTUE1fUE9XRVJfU1VQRVJTQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJ
RUFTUE1fUEVSRk9STUFOQ0UgaXMgbm90IHNldAojIENPTkZJR19QQ0lFX1BUTSBpcyBub3Qgc2V0
CiMgQ09ORklHX1BDSV9NU0kgaXMgbm90IHNldApDT05GSUdfUENJX1FVSVJLUz15CiMgQ09ORklH
X1BDSV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9TVFVCIGlzIG5vdCBzZXQKQ09ORklH
X1BDSV9MT0NLTEVTU19DT05GSUc9eQojIENPTkZJR19QQ0lfSU9WIGlzIG5vdCBzZXQKIyBDT05G
SUdfUENJX1BSSSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9QQVNJRCBpcyBub3Qgc2V0CkNPTkZJ
R19QQ0lfTEFCRUw9eQojIENPTkZJR19QQ0lFX0JVU19UVU5FX09GRiBpcyBub3Qgc2V0CkNPTkZJ
R19QQ0lFX0JVU19ERUZBVUxUPXkKIyBDT05GSUdfUENJRV9CVVNfU0FGRSBpcyBub3Qgc2V0CiMg
Q09ORklHX1BDSUVfQlVTX1BFUkZPUk1BTkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRV9CVVNf
UEVFUjJQRUVSIGlzIG5vdCBzZXQKQ09ORklHX1ZHQV9BUkI9eQpDT05GSUdfVkdBX0FSQl9NQVhf
R1BVUz0xNgojIENPTkZJR19IT1RQTFVHX1BDSSBpcyBub3Qgc2V0CgojCiMgUENJIGNvbnRyb2xs
ZXIgZHJpdmVycwojCgojCiMgRGVzaWduV2FyZSBQQ0kgQ29yZSBTdXBwb3J0CiMKIyBlbmQgb2Yg
RGVzaWduV2FyZSBQQ0kgQ29yZSBTdXBwb3J0CgojCiMgTW9iaXZlaWwgUENJZSBDb3JlIFN1cHBv
cnQKIwojIGVuZCBvZiBNb2JpdmVpbCBQQ0llIENvcmUgU3VwcG9ydAoKIwojIENhZGVuY2UgUENJ
ZSBjb250cm9sbGVycyBzdXBwb3J0CiMKIyBlbmQgb2YgQ2FkZW5jZSBQQ0llIGNvbnRyb2xsZXJz
IHN1cHBvcnQKIyBlbmQgb2YgUENJIGNvbnRyb2xsZXIgZHJpdmVycwoKIwojIFBDSSBFbmRwb2lu
dAojCiMgQ09ORklHX1BDSV9FTkRQT0lOVCBpcyBub3Qgc2V0CiMgZW5kIG9mIFBDSSBFbmRwb2lu
dAoKIwojIFBDSSBzd2l0Y2ggY29udHJvbGxlciBkcml2ZXJzCiMKIyBDT05GSUdfUENJX1NXX1NX
SVRDSFRFQyBpcyBub3Qgc2V0CiMgZW5kIG9mIFBDSSBzd2l0Y2ggY29udHJvbGxlciBkcml2ZXJz
CgojIENPTkZJR19DWExfQlVTIGlzIG5vdCBzZXQKQ09ORklHX1BDQ0FSRD15CiMgQ09ORklHX1BD
TUNJQSBpcyBub3Qgc2V0CkNPTkZJR19DQVJEQlVTPXkKCiMKIyBQQy1jYXJkIGJyaWRnZXMKIwoj
IENPTkZJR19ZRU5UQSBpcyBub3Qgc2V0CiMgQ09ORklHX1JBUElESU8gaXMgbm90IHNldAoKIwoj
IEdlbmVyaWMgRHJpdmVyIE9wdGlvbnMKIwojIENPTkZJR19VRVZFTlRfSEVMUEVSIGlzIG5vdCBz
ZXQKQ09ORklHX0RFVlRNUEZTPXkKIyBDT05GSUdfREVWVE1QRlNfTU9VTlQgaXMgbm90IHNldAoj
IENPTkZJR19ERVZUTVBGU19TQUZFIGlzIG5vdCBzZXQKIyBDT05GSUdfU1RBTkRBTE9ORSBpcyBu
b3Qgc2V0CkNPTkZJR19QUkVWRU5UX0ZJUk1XQVJFX0JVSUxEPXkKCiMKIyBGaXJtd2FyZSBsb2Fk
ZXIKIwpDT05GSUdfRldfTE9BREVSPXkKQ09ORklHX0ZXX0xPQURFUl9QQUdFRF9CVUY9eQpDT05G
SUdfRldfTE9BREVSX1NZU0ZTPXkKQ09ORklHX0VYVFJBX0ZJUk1XQVJFPSIiCkNPTkZJR19GV19M
T0FERVJfVVNFUl9IRUxQRVI9eQojIENPTkZJR19GV19MT0FERVJfVVNFUl9IRUxQRVJfRkFMTEJB
Q0sgaXMgbm90IHNldApDT05GSUdfRldfTE9BREVSX0NPTVBSRVNTPXkKQ09ORklHX0ZXX0xPQURF
Ul9DT01QUkVTU19YWj15CiMgQ09ORklHX0ZXX0xPQURFUl9DT01QUkVTU19aU1REIGlzIG5vdCBz
ZXQKQ09ORklHX0ZXX0NBQ0hFPXkKIyBDT05GSUdfRldfVVBMT0FEIGlzIG5vdCBzZXQKIyBlbmQg
b2YgRmlybXdhcmUgbG9hZGVyCgpDT05GSUdfV0FOVF9ERVZfQ09SRURVTVA9eQojIENPTkZJR19B
TExPV19ERVZfQ09SRURVTVAgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19EUklWRVIgaXMgbm90
IHNldApDT05GSUdfREVCVUdfREVWUkVTPXkKIyBDT05GSUdfREVCVUdfVEVTVF9EUklWRVJfUkVN
T1ZFIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9BU1lOQ19EUklWRVJfUFJPQkUgaXMgbm90IHNl
dApDT05GSUdfR0VORVJJQ19DUFVfQVVUT1BST0JFPXkKQ09ORklHX0dFTkVSSUNfQ1BVX1ZVTE5F
UkFCSUxJVElFUz15CkNPTkZJR19SRUdNQVA9eQpDT05GSUdfUkVHTUFQX0kyQz15CkNPTkZJR19S
RUdNQVBfU1BNST15CkNPTkZJR19SRUdNQVBfVzE9eQpDT05GSUdfUkVHTUFQX01NSU89eQpDT05G
SUdfUkVHTUFQX0lSUT15CkNPTkZJR19SRUdNQVBfSTNDPXkKQ09ORklHX0RNQV9TSEFSRURfQlVG
RkVSPXkKIyBDT05GSUdfRE1BX0ZFTkNFX1RSQUNFIGlzIG5vdCBzZXQKIyBlbmQgb2YgR2VuZXJp
YyBEcml2ZXIgT3B0aW9ucwoKIwojIEJ1cyBkZXZpY2VzCiMKIyBDT05GSUdfTUhJX0JVUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX01ISV9CVVNfRVAgaXMgbm90IHNldAojIGVuZCBvZiBCdXMgZGV2aWNl
cwoKIyBDT05GSUdfQ09OTkVDVE9SIGlzIG5vdCBzZXQKCiMKIyBGaXJtd2FyZSBEcml2ZXJzCiMK
CiMKIyBBUk0gU3lzdGVtIENvbnRyb2wgYW5kIE1hbmFnZW1lbnQgSW50ZXJmYWNlIFByb3RvY29s
CiMKIyBlbmQgb2YgQVJNIFN5c3RlbSBDb250cm9sIGFuZCBNYW5hZ2VtZW50IEludGVyZmFjZSBQ
cm90b2NvbAoKIyBDT05GSUdfRUREIGlzIG5vdCBzZXQKIyBDT05GSUdfRklSTVdBUkVfTUVNTUFQ
IGlzIG5vdCBzZXQKIyBDT05GSUdfRE1JSUQgaXMgbm90IHNldApDT05GSUdfRE1JX1NZU0ZTPXkK
Q09ORklHX0RNSV9TQ0FOX01BQ0hJTkVfTk9OX0VGSV9GQUxMQkFDSz15CiMgQ09ORklHX0ZXX0NG
R19TWVNGUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NZU0ZCX1NJTVBMRUZCIGlzIG5vdCBzZXQKQ09O
RklHX0dPT0dMRV9GSVJNV0FSRT15CkNPTkZJR19HT09HTEVfU01JPXkKQ09ORklHX0dPT0dMRV9D
T1JFQk9PVF9UQUJMRT15CiMgQ09ORklHX0dPT0dMRV9NRU1DT05TT0xFX1g4Nl9MRUdBQ1kgaXMg
bm90IHNldAojIENPTkZJR19HT09HTEVfTUVNQ09OU09MRV9DT1JFQk9PVCBpcyBub3Qgc2V0CkNP
TkZJR19HT09HTEVfVlBEPXkKCiMKIyBFRkkgKEV4dGVuc2libGUgRmlybXdhcmUgSW50ZXJmYWNl
KSBTdXBwb3J0CiMKQ09ORklHX0VGSV9FU1JUPXkKQ09ORklHX0VGSV9WQVJTX1BTVE9SRT15CkNP
TkZJR19FRklfVkFSU19QU1RPUkVfREVGQVVMVF9ESVNBQkxFPXkKQ09ORklHX0VGSV9SVU5USU1F
X01BUD15CkNPTkZJR19FRklfRkFLRV9NRU1NQVA9eQpDT05GSUdfRUZJX01BWF9GQUtFX01FTT04
CkNPTkZJR19FRklfRFhFX01FTV9BVFRSSUJVVEVTPXkKQ09ORklHX0VGSV9SVU5USU1FX1dSQVBQ
RVJTPXkKQ09ORklHX0VGSV9HRU5FUklDX1NUVUJfSU5JVFJEX0NNRExJTkVfTE9BREVSPXkKQ09O
RklHX0VGSV9CT09UTE9BREVSX0NPTlRST0w9eQojIENPTkZJR19FRklfQ0FQU1VMRV9MT0FERVIg
aXMgbm90IHNldAojIENPTkZJR19FRklfVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19FRklfREVWX1BB
VEhfUEFSU0VSPXkKQ09ORklHX0FQUExFX1BST1BFUlRJRVM9eQpDT05GSUdfUkVTRVRfQVRUQUNL
X01JVElHQVRJT049eQpDT05GSUdfRUZJX1JDSTJfVEFCTEU9eQpDT05GSUdfRUZJX0RJU0FCTEVf
UENJX0RNQT15CkNPTkZJR19FRklfRUFSTFlDT049eQojIENPTkZJR19FRklfQ1VTVE9NX1NTRFRf
T1ZFUkxBWVMgaXMgbm90IHNldAojIENPTkZJR19FRklfRElTQUJMRV9SVU5USU1FIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRUZJX0NPQ09fU0VDUkVUIGlzIG5vdCBzZXQKIyBlbmQgb2YgRUZJIChFeHRl
bnNpYmxlIEZpcm13YXJlIEludGVyZmFjZSkgU3VwcG9ydAoKQ09ORklHX1VFRklfQ1BFUj15CkNP
TkZJR19VRUZJX0NQRVJfWDg2PXkKCiMKIyBUZWdyYSBmaXJtd2FyZSBkcml2ZXIKIwojIGVuZCBv
ZiBUZWdyYSBmaXJtd2FyZSBkcml2ZXIKIyBlbmQgb2YgRmlybXdhcmUgRHJpdmVycwoKQ09ORklH
X0dOU1M9eQpDT05GSUdfR05TU19TRVJJQUw9eQpDT05GSUdfR05TU19NVEtfU0VSSUFMPXkKIyBD
T05GSUdfR05TU19TSVJGX1NFUklBTCBpcyBub3Qgc2V0CkNPTkZJR19HTlNTX1VCWF9TRVJJQUw9
eQpDT05GSUdfTVREPXkKIyBDT05GSUdfTVREX1RFU1RTIGlzIG5vdCBzZXQKCiMKIyBQYXJ0aXRp
b24gcGFyc2VycwojCiMgQ09ORklHX01URF9BUjdfUEFSVFMgaXMgbm90IHNldApDT05GSUdfTVRE
X0NNRExJTkVfUEFSVFM9eQpDT05GSUdfTVREX1JFREJPT1RfUEFSVFM9eQpDT05GSUdfTVREX1JF
REJPT1RfRElSRUNUT1JZX0JMT0NLPS0xCkNPTkZJR19NVERfUkVEQk9PVF9QQVJUU19VTkFMTE9D
QVRFRD15CiMgQ09ORklHX01URF9SRURCT09UX1BBUlRTX1JFQURPTkxZIGlzIG5vdCBzZXQKIyBl
bmQgb2YgUGFydGl0aW9uIHBhcnNlcnMKCiMKIyBVc2VyIE1vZHVsZXMgQW5kIFRyYW5zbGF0aW9u
IExheWVycwojCkNPTkZJR19NVERfT09QUz15CiMgQ09ORklHX01URF9QQVJUSVRJT05FRF9NQVNU
RVIgaXMgbm90IHNldAoKIwojIFJBTS9ST00vRmxhc2ggY2hpcCBkcml2ZXJzCiMKQ09ORklHX01U
RF9DRkk9eQpDT05GSUdfTVREX0pFREVDUFJPQkU9eQpDT05GSUdfTVREX0dFTl9QUk9CRT15CkNP
TkZJR19NVERfQ0ZJX0FEVl9PUFRJT05TPXkKIyBDT05GSUdfTVREX0NGSV9OT1NXQVAgaXMgbm90
IHNldApDT05GSUdfTVREX0NGSV9CRV9CWVRFX1NXQVA9eQojIENPTkZJR19NVERfQ0ZJX0xFX0JZ
VEVfU1dBUCBpcyBub3Qgc2V0CkNPTkZJR19NVERfQ0ZJX0dFT01FVFJZPXkKIyBDT05GSUdfTVRE
X01BUF9CQU5LX1dJRFRIXzEgaXMgbm90IHNldApDT05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzI9
eQojIENPTkZJR19NVERfTUFQX0JBTktfV0lEVEhfNCBpcyBub3Qgc2V0CkNPTkZJR19NVERfTUFQ
X0JBTktfV0lEVEhfOD15CiMgQ09ORklHX01URF9NQVBfQkFOS19XSURUSF8xNiBpcyBub3Qgc2V0
CkNPTkZJR19NVERfTUFQX0JBTktfV0lEVEhfMzI9eQpDT05GSUdfTVREX0NGSV9JMT15CiMgQ09O
RklHX01URF9DRklfSTIgaXMgbm90IHNldApDT05GSUdfTVREX0NGSV9JND15CiMgQ09ORklHX01U
RF9DRklfSTggaXMgbm90IHNldApDT05GSUdfTVREX09UUD15CiMgQ09ORklHX01URF9DRklfSU5U
RUxFWFQgaXMgbm90IHNldApDT05GSUdfTVREX0NGSV9BTURTVEQ9eQpDT05GSUdfTVREX0NGSV9T
VEFBPXkKQ09ORklHX01URF9DRklfVVRJTD15CkNPTkZJR19NVERfUkFNPXkKIyBDT05GSUdfTVRE
X1JPTSBpcyBub3Qgc2V0CkNPTkZJR19NVERfQUJTRU5UPXkKIyBlbmQgb2YgUkFNL1JPTS9GbGFz
aCBjaGlwIGRyaXZlcnMKCiMKIyBNYXBwaW5nIGRyaXZlcnMgZm9yIGNoaXAgYWNjZXNzCiMKQ09O
RklHX01URF9DT01QTEVYX01BUFBJTkdTPXkKIyBDT05GSUdfTVREX1BIWVNNQVAgaXMgbm90IHNl
dAojIENPTkZJR19NVERfQU1ENzZYUk9NIGlzIG5vdCBzZXQKQ09ORklHX01URF9JQ0hYUk9NPXkK
IyBDT05GSUdfTVREX0VTQjJST00gaXMgbm90IHNldAojIENPTkZJR19NVERfQ0s4MDRYUk9NIGlz
IG5vdCBzZXQKIyBDT05GSUdfTVREX1NDQjJfRkxBU0ggaXMgbm90IHNldAojIENPTkZJR19NVERf
TkVUdGVsIGlzIG5vdCBzZXQKQ09ORklHX01URF9MNDQwR1g9eQojIENPTkZJR19NVERfUENJIGlz
IG5vdCBzZXQKIyBDT05GSUdfTVREX0lOVEVMX1ZSX05PUiBpcyBub3Qgc2V0CkNPTkZJR19NVERf
UExBVFJBTT15CiMgZW5kIG9mIE1hcHBpbmcgZHJpdmVycyBmb3IgY2hpcCBhY2Nlc3MKCiMKIyBT
ZWxmLWNvbnRhaW5lZCBNVEQgZGV2aWNlIGRyaXZlcnMKIwojIENPTkZJR19NVERfUE1DNTUxIGlz
IG5vdCBzZXQKQ09ORklHX01URF9TTFJBTT15CkNPTkZJR19NVERfUEhSQU09eQpDT05GSUdfTVRE
X01URFJBTT15CkNPTkZJR19NVERSQU1fVE9UQUxfU0laRT00MDk2CkNPTkZJR19NVERSQU1fRVJB
U0VfU0laRT0xMjgKCiMKIyBEaXNrLU9uLUNoaXAgRGV2aWNlIERyaXZlcnMKIwojIENPTkZJR19N
VERfRE9DRzMgaXMgbm90IHNldAojIGVuZCBvZiBTZWxmLWNvbnRhaW5lZCBNVEQgZGV2aWNlIGRy
aXZlcnMKCiMKIyBOQU5ECiMKQ09ORklHX01URF9OQU5EX0NPUkU9eQojIENPTkZJR19NVERfT05F
TkFORCBpcyBub3Qgc2V0CkNPTkZJR19NVERfUkFXX05BTkQ9eQoKIwojIFJhdy9wYXJhbGxlbCBO
QU5EIGZsYXNoIGNvbnRyb2xsZXJzCiMKIyBDT05GSUdfTVREX05BTkRfREVOQUxJX1BDSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX01URF9OQU5EX0NBRkUgaXMgbm90IHNldApDT05GSUdfTVREX05BTkRf
TVhJQz15CkNPTkZJR19NVERfTkFORF9HUElPPXkKQ09ORklHX01URF9OQU5EX1BMQVRGT1JNPXkK
Q09ORklHX01URF9OQU5EX0FSQVNBTj15CgojCiMgTWlzYwojCkNPTkZJR19NVERfTkFORF9OQU5E
U0lNPXkKIyBDT05GSUdfTVREX05BTkRfUklDT0ggaXMgbm90IHNldApDT05GSUdfTVREX05BTkRf
RElTS09OQ0hJUD15CkNPTkZJR19NVERfTkFORF9ESVNLT05DSElQX1BST0JFX0FEVkFOQ0VEPXkK
Q09ORklHX01URF9OQU5EX0RJU0tPTkNISVBfUFJPQkVfQUREUkVTUz0wCiMgQ09ORklHX01URF9O
QU5EX0RJU0tPTkNISVBfUFJPQkVfSElHSCBpcyBub3Qgc2V0CkNPTkZJR19NVERfTkFORF9ESVNL
T05DSElQX0JCVFdSSVRFPXkKCiMKIyBFQ0MgZW5naW5lIHN1cHBvcnQKIwpDT05GSUdfTVREX05B
TkRfRUNDPXkKIyBDT05GSUdfTVREX05BTkRfRUNDX1NXX0hBTU1JTkcgaXMgbm90IHNldAojIENP
TkZJR19NVERfTkFORF9FQ0NfU1dfQkNIIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX05BTkRfRUND
X01YSUMgaXMgbm90IHNldAojIGVuZCBvZiBFQ0MgZW5naW5lIHN1cHBvcnQKIyBlbmQgb2YgTkFO
RAoKIwojIExQRERSICYgTFBERFIyIFBDTSBtZW1vcnkgZHJpdmVycwojCkNPTkZJR19NVERfTFBE
RFI9eQpDT05GSUdfTVREX1FJTkZPX1BST0JFPXkKIyBlbmQgb2YgTFBERFIgJiBMUEREUjIgUENN
IG1lbW9yeSBkcml2ZXJzCgpDT05GSUdfTVREX1VCST15CkNPTkZJR19NVERfVUJJX1dMX1RIUkVT
SE9MRD00MDk2CkNPTkZJR19NVERfVUJJX0JFQl9MSU1JVD0yMApDT05GSUdfTVREX1VCSV9GQVNU
TUFQPXkKQ09ORklHX01URF9VQklfR0xVRUJJPXkKQ09ORklHX01URF9IWVBFUkJVUz15CiMgQ09O
RklHX09GIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfTUlHSFRfSEFWRV9QQ19QQVJQT1JUPXkKQ09O
RklHX1BBUlBPUlQ9eQojIENPTkZJR19QQVJQT1JUX1BDIGlzIG5vdCBzZXQKQ09ORklHX1BBUlBP
UlRfQVg4ODc5Nj15CkNPTkZJR19QQVJQT1JUXzEyODQ9eQpDT05GSUdfUEFSUE9SVF9OT1RfUEM9
eQpDT05GSUdfUE5QPXkKQ09ORklHX1BOUF9ERUJVR19NRVNTQUdFUz15CgojCiMgUHJvdG9jb2xz
CiMKQ09ORklHX1BOUEFDUEk9eQoKIwojIE5WTUUgU3VwcG9ydAojCiMgZW5kIG9mIE5WTUUgU3Vw
cG9ydAoKIwojIE1pc2MgZGV2aWNlcwojCiMgQ09ORklHX0FENTI1WF9EUE9UIGlzIG5vdCBzZXQK
Q09ORklHX0RVTU1ZX0lSUT15CiMgQ09ORklHX0lCTV9BU00gaXMgbm90IHNldAojIENPTkZJR19Q
SEFOVE9NIGlzIG5vdCBzZXQKIyBDT05GSUdfVElGTV9DT1JFIGlzIG5vdCBzZXQKQ09ORklHX0lD
UzkzMlM0MDE9eQpDT05GSUdfRU5DTE9TVVJFX1NFUlZJQ0VTPXkKIyBDT05GSUdfSFBfSUxPIGlz
IG5vdCBzZXQKIyBDT05GSUdfQVBEUzk4MDJBTFMgaXMgbm90IHNldApDT05GSUdfSVNMMjkwMDM9
eQpDT05GSUdfSVNMMjkwMjA9eQpDT05GSUdfU0VOU09SU19UU0wyNTUwPXkKQ09ORklHX1NFTlNP
UlNfQkgxNzcwPXkKQ09ORklHX1NFTlNPUlNfQVBEUzk5MFg9eQpDT05GSUdfSE1DNjM1Mj15CkNP
TkZJR19EUzE2ODI9eQojIENPTkZJR19TUkFNIGlzIG5vdCBzZXQKIyBDT05GSUdfRFdfWERBVEFf
UENJRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9FTkRQT0lOVF9URVNUIGlzIG5vdCBzZXQKIyBD
T05GSUdfWElMSU5YX1NERkVDIGlzIG5vdCBzZXQKQ09ORklHX0MyUE9SVD15CiMgQ09ORklHX0My
UE9SVF9EVVJBTUFSXzIxNTAgaXMgbm90IHNldAoKIwojIEVFUFJPTSBzdXBwb3J0CiMKQ09ORklH
X0VFUFJPTV9BVDI0PXkKIyBDT05GSUdfRUVQUk9NX0xFR0FDWSBpcyBub3Qgc2V0CkNPTkZJR19F
RVBST01fTUFYNjg3NT15CiMgQ09ORklHX0VFUFJPTV85M0NYNiBpcyBub3Qgc2V0CkNPTkZJR19F
RVBST01fSURUXzg5SFBFU1g9eQpDT05GSUdfRUVQUk9NX0VFMTAwND15CiMgZW5kIG9mIEVFUFJP
TSBzdXBwb3J0CgojIENPTkZJR19DQjcxMF9DT1JFIGlzIG5vdCBzZXQKCiMKIyBUZXhhcyBJbnN0
cnVtZW50cyBzaGFyZWQgdHJhbnNwb3J0IGxpbmUgZGlzY2lwbGluZQojCiMgQ09ORklHX1RJX1NU
IGlzIG5vdCBzZXQKIyBlbmQgb2YgVGV4YXMgSW5zdHJ1bWVudHMgc2hhcmVkIHRyYW5zcG9ydCBs
aW5lIGRpc2NpcGxpbmUKCiMgQ09ORklHX1NFTlNPUlNfTElTM19JMkMgaXMgbm90IHNldApDT05G
SUdfQUxURVJBX1NUQVBMPXkKIyBDT05GSUdfSU5URUxfTUVJIGlzIG5vdCBzZXQKIyBDT05GSUdf
SU5URUxfTUVJX01FIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfTUVJX1RYRSBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZNV0FSRV9WTUNJIGlzIG5vdCBzZXQKIyBDT05GSUdfR0VOV1FFIGlzIG5vdCBz
ZXQKQ09ORklHX0VDSE89eQojIENPTkZJR19NSVNDX0FMQ09SX1BDSSBpcyBub3Qgc2V0CiMgQ09O
RklHX01JU0NfUlRTWF9QQ0kgaXMgbm90IHNldAojIENPTkZJR19IQUJBTkFfQUkgaXMgbm90IHNl
dAojIENPTkZJR19VQUNDRSBpcyBub3Qgc2V0CkNPTkZJR19QVlBBTklDPXkKQ09ORklHX1BWUEFO
SUNfTU1JTz15CiMgQ09ORklHX1BWUEFOSUNfUENJIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWlzYyBk
ZXZpY2VzCgojCiMgU0NTSSBkZXZpY2Ugc3VwcG9ydAojCkNPTkZJR19TQ1NJX01PRD15CiMgZW5k
IG9mIFNDU0kgZGV2aWNlIHN1cHBvcnQKCiMgQ09ORklHX0ZVU0lPTiBpcyBub3Qgc2V0CgojCiMg
SUVFRSAxMzk0IChGaXJlV2lyZSkgc3VwcG9ydAojCiMgQ09ORklHX0ZJUkVXSVJFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRklSRVdJUkVfTk9TWSBpcyBub3Qgc2V0CiMgZW5kIG9mIElFRUUgMTM5NCAo
RmlyZVdpcmUpIHN1cHBvcnQKCiMgQ09ORklHX01BQ0lOVE9TSF9EUklWRVJTIGlzIG5vdCBzZXQK
Q09ORklHX05FVERFVklDRVM9eQpDT05GSUdfTkVUX0NPUkU9eQojIENPTkZJR19CT05ESU5HIGlz
IG5vdCBzZXQKIyBDT05GSUdfRFVNTVkgaXMgbm90IHNldAojIENPTkZJR19XSVJFR1VBUkQgaXMg
bm90IHNldAojIENPTkZJR19FUVVBTElaRVIgaXMgbm90IHNldAojIENPTkZJR19ORVRfVEVBTSBp
cyBub3Qgc2V0CiMgQ09ORklHX01BQ1ZMQU4gaXMgbm90IHNldAojIENPTkZJR19JUFZMQU4gaXMg
bm90IHNldAojIENPTkZJR19WWExBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0dFTkVWRSBpcyBub3Qg
c2V0CiMgQ09ORklHX0JBUkVVRFAgaXMgbm90IHNldAojIENPTkZJR19HVFAgaXMgbm90IHNldAoj
IENPTkZJR19NQUNTRUMgaXMgbm90IHNldAojIENPTkZJR19ORVRDT05TT0xFIGlzIG5vdCBzZXQK
IyBDT05GSUdfVFVOIGlzIG5vdCBzZXQKIyBDT05GSUdfVFVOX1ZORVRfQ1JPU1NfTEUgaXMgbm90
IHNldAojIENPTkZJR19WRVRIIGlzIG5vdCBzZXQKQ09ORklHX1ZJUlRJT19ORVQ9bQojIENPTkZJ
R19OTE1PTiBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ05FVCBpcyBub3Qgc2V0CkNPTkZJR19FVEhF
Uk5FVD15CkNPTkZJR19ORVRfVkVORE9SXzNDT009eQojIENPTkZJR19WT1JURVggaXMgbm90IHNl
dAojIENPTkZJR19UWVBIT09OIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQURBUFRFQz15
CiMgQ09ORklHX0FEQVBURUNfU1RBUkZJUkUgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9B
R0VSRT15CiMgQ09ORklHX0VUMTMxWCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0FMQUNS
SVRFQ0g9eQojIENPTkZJR19TTElDT1NTIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQUxU
RU9OPXkKIyBDT05GSUdfQUNFTklDIGlzIG5vdCBzZXQKIyBDT05GSUdfQUxURVJBX1RTRSBpcyBu
b3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0FNQVpPTj15CiMgQ09ORklHX05FVF9WRU5ET1JfQU1E
IGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQVFVQU5USUE9eQojIENPTkZJR19BUVRJT04g
aXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9BUkM9eQpDT05GSUdfTkVUX1ZFTkRPUl9BU0lY
PXkKQ09ORklHX05FVF9WRU5ET1JfQVRIRVJPUz15CiMgQ09ORklHX0FUTDIgaXMgbm90IHNldAoj
IENPTkZJR19BVEwxIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRMMUUgaXMgbm90IHNldAojIENPTkZJ
R19BVEwxQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FMWCBpcyBub3Qgc2V0CiMgQ09ORklHX0NYX0VD
QVQgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9CUk9BRENPTT15CiMgQ09ORklHX0I0NCBp
cyBub3Qgc2V0CiMgQ09ORklHX0JDTUdFTkVUIGlzIG5vdCBzZXQKIyBDT05GSUdfQk5YMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NOSUMgaXMgbm90IHNldAojIENPTkZJR19USUdPTjMgaXMgbm90IHNl
dAojIENPTkZJR19CTlgyWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NZU1RFTVBPUlQgaXMgbm90IHNl
dAojIENPTkZJR19CTlhUIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQ0FERU5DRT15CiMg
Q09ORklHX01BQ0IgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9DQVZJVU09eQojIENPTkZJ
R19USFVOREVSX05JQ19QRiBpcyBub3Qgc2V0CiMgQ09ORklHX1RIVU5ERVJfTklDX1ZGIGlzIG5v
dCBzZXQKIyBDT05GSUdfVEhVTkRFUl9OSUNfQkdYIGlzIG5vdCBzZXQKIyBDT05GSUdfVEhVTkRF
Ul9OSUNfUkdYIGlzIG5vdCBzZXQKIyBDT05GSUdfTElRVUlESU8gaXMgbm90IHNldApDT05GSUdf
TkVUX1ZFTkRPUl9DSEVMU0lPPXkKIyBDT05GSUdfQ0hFTFNJT19UMSBpcyBub3Qgc2V0CiMgQ09O
RklHX0NIRUxTSU9fVDMgaXMgbm90IHNldAojIENPTkZJR19DSEVMU0lPX1Q0IGlzIG5vdCBzZXQK
IyBDT05GSUdfQ0hFTFNJT19UNFZGIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQ0lTQ089
eQojIENPTkZJR19FTklDIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQ09SVElOQT15CkNP
TkZJR19ORVRfVkVORE9SX0RBVklDT009eQojIENPTkZJR19ETkVUIGlzIG5vdCBzZXQKQ09ORklH
X05FVF9WRU5ET1JfREVDPXkKIyBDT05GSUdfTkVUX1RVTElQIGlzIG5vdCBzZXQKQ09ORklHX05F
VF9WRU5ET1JfRExJTks9eQojIENPTkZJR19ETDJLIGlzIG5vdCBzZXQKIyBDT05GSUdfU1VOREFO
Q0UgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9FTVVMRVg9eQojIENPTkZJR19CRTJORVQg
aXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9FTkdMRURFUj15CiMgQ09ORklHX1RTTkVQIGlz
IG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfRVpDSElQPXkKQ09ORklHX05FVF9WRU5ET1JfRlVO
R0lCTEU9eQpDT05GSUdfTkVUX1ZFTkRPUl9HT09HTEU9eQpDT05GSUdfTkVUX1ZFTkRPUl9IVUFX
RUk9eQpDT05GSUdfTkVUX1ZFTkRPUl9JODI1WFg9eQpDT05GSUdfTkVUX1ZFTkRPUl9JTlRFTD15
CiMgQ09ORklHX0UxMDAgaXMgbm90IHNldApDT05GSUdfRTEwMDA9eQojIENPTkZJR19FMTAwMEUg
aXMgbm90IHNldAojIENPTkZJR19JR0IgaXMgbm90IHNldAojIENPTkZJR19JR0JWRiBpcyBub3Qg
c2V0CiMgQ09ORklHX0lYR0IgaXMgbm90IHNldAojIENPTkZJR19JWEdCRSBpcyBub3Qgc2V0CiMg
Q09ORklHX0k0MEUgaXMgbm90IHNldAojIENPTkZJR19JR0MgaXMgbm90IHNldApDT05GSUdfTkVU
X1ZFTkRPUl9XQU5HWFVOPXkKIyBDT05GSUdfVFhHQkUgaXMgbm90IHNldAojIENPTkZJR19KTUUg
aXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9MSVRFWD15CkNPTkZJR19ORVRfVkVORE9SX01B
UlZFTEw9eQojIENPTkZJR19NVk1ESU8gaXMgbm90IHNldAojIENPTkZJR19TS0dFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0tZMiBpcyBub3Qgc2V0CiMgQ09ORklHX09DVEVPTl9FUCBpcyBub3Qgc2V0
CkNPTkZJR19ORVRfVkVORE9SX01FTExBTk9YPXkKIyBDT05GSUdfTUxYNF9FTiBpcyBub3Qgc2V0
CiMgQ09ORklHX01MWDVfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX01MWFNXX0NPUkUgaXMgbm90
IHNldAojIENPTkZJR19NTFhGVyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX01JQ1JFTD15
CiMgQ09ORklHX0tTODg0MiBpcyBub3Qgc2V0CiMgQ09ORklHX0tTODg1MV9NTEwgaXMgbm90IHNl
dAojIENPTkZJR19LU1o4ODRYX1BDSSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX01JQ1JP
Q0hJUD15CiMgQ09ORklHX0xBTjc0M1ggaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9NSUNS
T1NFTUk9eQpDT05GSUdfTkVUX1ZFTkRPUl9NSUNST1NPRlQ9eQpDT05GSUdfTkVUX1ZFTkRPUl9N
WVJJPXkKIyBDT05GSUdfTVlSSTEwR0UgaXMgbm90IHNldAojIENPTkZJR19GRUFMTlggaXMgbm90
IHNldApDT05GSUdfTkVUX1ZFTkRPUl9OST15CiMgQ09ORklHX05JX1hHRV9NQU5BR0VNRU5UX0VO
RVQgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9OQVRTRU1JPXkKIyBDT05GSUdfTkFUU0VN
SSBpcyBub3Qgc2V0CiMgQ09ORklHX05TODM4MjAgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRP
Ul9ORVRFUklPTj15CiMgQ09ORklHX1MySU8gaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9O
RVRST05PTUU9eQpDT05GSUdfTkVUX1ZFTkRPUl84MzkwPXkKIyBDT05GSUdfTkUyS19QQ0kgaXMg
bm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9OVklESUE9eQojIENPTkZJR19GT1JDRURFVEggaXMg
bm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9PS0k9eQojIENPTkZJR19FVEhPQyBpcyBub3Qgc2V0
CkNPTkZJR19ORVRfVkVORE9SX1BBQ0tFVF9FTkdJTkVTPXkKIyBDT05GSUdfSEFNQUNISSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1lFTExPV0ZJTiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1BF
TlNBTkRPPXkKIyBDT05GSUdfSU9OSUMgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9RTE9H
SUM9eQojIENPTkZJR19RTEEzWFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfUUxDTklDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUWEVOX05JQyBpcyBub3Qgc2V0CiMgQ09ORklHX1FFRCBpcyBub3Qgc2V0
CkNPTkZJR19ORVRfVkVORE9SX0JST0NBREU9eQojIENPTkZJR19CTkEgaXMgbm90IHNldApDT05G
SUdfTkVUX1ZFTkRPUl9RVUFMQ09NTT15CiMgQ09ORklHX1FDT01fRU1BQyBpcyBub3Qgc2V0CiMg
Q09ORklHX1JNTkVUIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfUkRDPXkKIyBDT05GSUdf
UjYwNDAgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9SRUFMVEVLPXkKIyBDT05GSUdfQVRQ
IGlzIG5vdCBzZXQKIyBDT05GSUdfODEzOUNQIGlzIG5vdCBzZXQKIyBDT05GSUdfODEzOVRPTyBp
cyBub3Qgc2V0CiMgQ09ORklHX1I4MTY5IGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfUkVO
RVNBUz15CkNPTkZJR19ORVRfVkVORE9SX1JPQ0tFUj15CkNPTkZJR19ORVRfVkVORE9SX1NBTVNV
Tkc9eQojIENPTkZJR19TWEdCRV9FVEggaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9TRUVR
PXkKQ09ORklHX05FVF9WRU5ET1JfU0lMQU49eQojIENPTkZJR19TQzkyMDMxIGlzIG5vdCBzZXQK
Q09ORklHX05FVF9WRU5ET1JfU0lTPXkKIyBDT05GSUdfU0lTOTAwIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0lTMTkwIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfU09MQVJGTEFSRT15CiMgQ09O
RklHX1NGQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NGQ19GQUxDT04gaXMgbm90IHNldApDT05GSUdf
TkVUX1ZFTkRPUl9TTVNDPXkKIyBDT05GSUdfRVBJQzEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NN
U0M5MTFYIGlzIG5vdCBzZXQKIyBDT05GSUdfU01TQzk0MjAgaXMgbm90IHNldApDT05GSUdfTkVU
X1ZFTkRPUl9TT0NJT05FWFQ9eQpDT05GSUdfTkVUX1ZFTkRPUl9TVE1JQ1JPPXkKIyBDT05GSUdf
U1RNTUFDX0VUSCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1NVTj15CiMgQ09ORklHX0hB
UFBZTUVBTCBpcyBub3Qgc2V0CiMgQ09ORklHX1NVTkdFTSBpcyBub3Qgc2V0CiMgQ09ORklHX0NB
U1NJTkkgaXMgbm90IHNldAojIENPTkZJR19OSVUgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRP
Ul9TWU5PUFNZUz15CiMgQ09ORklHX0RXQ19YTEdNQUMgaXMgbm90IHNldApDT05GSUdfTkVUX1ZF
TkRPUl9URUhVVEk9eQojIENPTkZJR19URUhVVEkgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRP
Ul9UST15CiMgQ09ORklHX1RJX0NQU1dfUEhZX1NFTCBpcyBub3Qgc2V0CiMgQ09ORklHX1RMQU4g
aXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9WRVJURVhDT009eQpDT05GSUdfTkVUX1ZFTkRP
Ul9WSUE9eQojIENPTkZJR19WSUFfUkhJTkUgaXMgbm90IHNldAojIENPTkZJR19WSUFfVkVMT0NJ
VFkgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9XSVpORVQ9eQojIENPTkZJR19XSVpORVRf
VzUxMDAgaXMgbm90IHNldAojIENPTkZJR19XSVpORVRfVzUzMDAgaXMgbm90IHNldApDT05GSUdf
TkVUX1ZFTkRPUl9YSUxJTlg9eQojIENPTkZJR19YSUxJTlhfRU1BQ0xJVEUgaXMgbm90IHNldAoj
IENPTkZJR19YSUxJTlhfQVhJX0VNQUMgaXMgbm90IHNldAojIENPTkZJR19YSUxJTlhfTExfVEVN
QUMgaXMgbm90IHNldAojIENPTkZJR19GRERJIGlzIG5vdCBzZXQKIyBDT05GSUdfSElQUEkgaXMg
bm90IHNldAojIENPTkZJR19ORVRfU0IxMDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZTElCIGlz
IG5vdCBzZXQKIyBDT05GSUdfTURJT19ERVZJQ0UgaXMgbm90IHNldAoKIwojIFBDUyBkZXZpY2Ug
ZHJpdmVycwojCiMgZW5kIG9mIFBDUyBkZXZpY2UgZHJpdmVycwoKIyBDT05GSUdfUExJUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BQUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NMSVAgaXMgbm90IHNldAoK
IwojIEhvc3Qtc2lkZSBVU0Igc3VwcG9ydCBpcyBuZWVkZWQgZm9yIFVTQiBOZXR3b3JrIEFkYXB0
ZXIgc3VwcG9ydAojCkNPTkZJR19XTEFOPXkKQ09ORklHX1dMQU5fVkVORE9SX0FETVRFSz15CkNP
TkZJR19XTEFOX1ZFTkRPUl9BVEg9eQojIENPTkZJR19BVEhfREVCVUcgaXMgbm90IHNldAojIENP
TkZJR19BVEg1S19QQ0kgaXMgbm90IHNldApDT05GSUdfV0xBTl9WRU5ET1JfQVRNRUw9eQpDT05G
SUdfV0xBTl9WRU5ET1JfQlJPQURDT009eQpDT05GSUdfV0xBTl9WRU5ET1JfQ0lTQ089eQpDT05G
SUdfV0xBTl9WRU5ET1JfSU5URUw9eQpDT05GSUdfV0xBTl9WRU5ET1JfSU5URVJTSUw9eQojIENP
TkZJR19IT1NUQVAgaXMgbm90IHNldApDT05GSUdfV0xBTl9WRU5ET1JfTUFSVkVMTD15CkNPTkZJ
R19XTEFOX1ZFTkRPUl9NRURJQVRFSz15CkNPTkZJR19XTEFOX1ZFTkRPUl9NSUNST0NISVA9eQpD
T05GSUdfV0xBTl9WRU5ET1JfUFVSRUxJRkk9eQpDT05GSUdfV0xBTl9WRU5ET1JfUkFMSU5LPXkK
Q09ORklHX1dMQU5fVkVORE9SX1JFQUxURUs9eQpDT05GSUdfV0xBTl9WRU5ET1JfUlNJPXkKQ09O
RklHX1dMQU5fVkVORE9SX1NJTEFCUz15CkNPTkZJR19XTEFOX1ZFTkRPUl9TVD15CkNPTkZJR19X
TEFOX1ZFTkRPUl9UST15CkNPTkZJR19XTEFOX1ZFTkRPUl9aWURBUz15CkNPTkZJR19XTEFOX1ZF
TkRPUl9RVUFOVEVOTkE9eQojIENPTkZJR19XQU4gaXMgbm90IHNldAoKIwojIFdpcmVsZXNzIFdB
TgojCiMgQ09ORklHX1dXQU4gaXMgbm90IHNldAojIGVuZCBvZiBXaXJlbGVzcyBXQU4KCiMgQ09O
RklHX1ZNWE5FVDMgaXMgbm90IHNldAojIENPTkZJR19GVUpJVFNVX0VTIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUREVWU0lNIGlzIG5vdCBzZXQKQ09ORklHX05FVF9GQUlMT1ZFUj1tCiMgQ09ORklH
X0lTRE4gaXMgbm90IHNldAoKIwojIElucHV0IGRldmljZSBzdXBwb3J0CiMKQ09ORklHX0lOUFVU
PXkKQ09ORklHX0lOUFVUX0xFRFM9eQojIENPTkZJR19JTlBVVF9GRl9NRU1MRVNTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSU5QVVRfU1BBUlNFS01BUCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX01B
VFJJWEtNQVAgaXMgbm90IHNldApDT05GSUdfSU5QVVRfVklWQUxESUZNQVA9eQoKIwojIFVzZXJs
YW5kIGludGVyZmFjZXMKIwojIENPTkZJR19JTlBVVF9NT1VTRURFViBpcyBub3Qgc2V0CiMgQ09O
RklHX0lOUFVUX0pPWURFViBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0VWREVWIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSU5QVVRfRVZCVUcgaXMgbm90IHNldAoKIwojIElucHV0IERldmljZSBEcml2
ZXJzCiMKQ09ORklHX0lOUFVUX0tFWUJPQVJEPXkKIyBDT05GSUdfS0VZQk9BUkRfQURDIGlzIG5v
dCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfQURQNTU4OCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJP
QVJEX0FEUDU1ODkgaXMgbm90IHNldApDT05GSUdfS0VZQk9BUkRfQVRLQkQ9eQojIENPTkZJR19L
RVlCT0FSRF9RVDEwNTAgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9RVDEwNzAgaXMgbm90
IHNldAojIENPTkZJR19LRVlCT0FSRF9RVDIxNjAgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FS
RF9ETElOS19ESVI2ODUgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9MS0tCRCBpcyBub3Qg
c2V0CiMgQ09ORklHX0tFWUJPQVJEX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9H
UElPX1BPTExFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1RDQTY0MTYgaXMgbm90IHNl
dAojIENPTkZJR19LRVlCT0FSRF9UQ0E4NDE4IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRf
TUFUUklYIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTE04MzIzIGlzIG5vdCBzZXQKIyBD
T05GSUdfS0VZQk9BUkRfTE04MzMzIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTUFYNzM1
OSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX01DUyBpcyBub3Qgc2V0CiMgQ09ORklHX0tF
WUJPQVJEX01QUjEyMSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX05FV1RPTiBpcyBub3Qg
c2V0CiMgQ09ORklHX0tFWUJPQVJEX09QRU5DT1JFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJP
QVJEX1NBTVNVTkcgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9TVE9XQVdBWSBpcyBub3Qg
c2V0CiMgQ09ORklHX0tFWUJPQVJEX1NVTktCRCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJE
X1RNMl9UT1VDSEtFWSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1hUS0JEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfS0VZQk9BUkRfQ1JPU19FQyBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJE
X01US19QTUlDIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfQ1lQUkVTU19TRiBpcyBub3Qg
c2V0CkNPTkZJR19JTlBVVF9NT1VTRT15CkNPTkZJR19NT1VTRV9QUzI9eQpDT05GSUdfTU9VU0Vf
UFMyX0FMUFM9eQpDT05GSUdfTU9VU0VfUFMyX0JZRD15CkNPTkZJR19NT1VTRV9QUzJfTE9HSVBT
MlBQPXkKQ09ORklHX01PVVNFX1BTMl9TWU5BUFRJQ1M9eQpDT05GSUdfTU9VU0VfUFMyX1NZTkFQ
VElDU19TTUJVUz15CkNPTkZJR19NT1VTRV9QUzJfQ1lQUkVTUz15CkNPTkZJR19NT1VTRV9QUzJf
TElGRUJPT0s9eQpDT05GSUdfTU9VU0VfUFMyX1RSQUNLUE9JTlQ9eQojIENPTkZJR19NT1VTRV9Q
UzJfRUxBTlRFQ0ggaXMgbm90IHNldAojIENPTkZJR19NT1VTRV9QUzJfU0VOVEVMSUMgaXMgbm90
IHNldAojIENPTkZJR19NT1VTRV9QUzJfVE9VQ0hLSVQgaXMgbm90IHNldApDT05GSUdfTU9VU0Vf
UFMyX0ZPQ0FMVEVDSD15CiMgQ09ORklHX01PVVNFX1BTMl9WTU1PVVNFIGlzIG5vdCBzZXQKQ09O
RklHX01PVVNFX1BTMl9TTUJVUz15CiMgQ09ORklHX01PVVNFX1NFUklBTCBpcyBub3Qgc2V0CiMg
Q09ORklHX01PVVNFX0FQUExFVE9VQ0ggaXMgbm90IHNldAojIENPTkZJR19NT1VTRV9CQ001OTc0
IGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0VfQ1lBUEEgaXMgbm90IHNldAojIENPTkZJR19NT1VT
RV9FTEFOX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1ZTWFhYQUEgaXMgbm90IHNldAoj
IENPTkZJR19NT1VTRV9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0VfU1lOQVBUSUNTX0ky
QyBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1NZTkFQVElDU19VU0IgaXMgbm90IHNldAojIENP
TkZJR19JTlBVVF9KT1lTVElDSyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1RBQkxFVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lOUFVUX1RPVUNIU0NSRUVOIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5Q
VVRfTUlTQyBpcyBub3Qgc2V0CiMgQ09ORklHX1JNSTRfQ09SRSBpcyBub3Qgc2V0CgojCiMgSGFy
ZHdhcmUgSS9PIHBvcnRzCiMKQ09ORklHX1NFUklPPXkKQ09ORklHX0FSQ0hfTUlHSFRfSEFWRV9Q
Q19TRVJJTz15CkNPTkZJR19TRVJJT19JODA0Mj15CkNPTkZJR19TRVJJT19TRVJQT1JUPXkKIyBD
T05GSUdfU0VSSU9fQ1Q4MkM3MTAgaXMgbm90IHNldAojIENPTkZJR19TRVJJT19QQVJLQkQgaXMg
bm90IHNldAojIENPTkZJR19TRVJJT19QQ0lQUzIgaXMgbm90IHNldApDT05GSUdfU0VSSU9fTElC
UFMyPXkKIyBDT05GSUdfU0VSSU9fUkFXIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSU9fQUxURVJB
X1BTMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklPX1BTMk1VTFQgaXMgbm90IHNldAojIENPTkZJ
R19TRVJJT19BUkNfUFMyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSU9fR1BJT19QUzIgaXMgbm90
IHNldAojIENPTkZJR19VU0VSSU8gaXMgbm90IHNldApDT05GSUdfR0FNRVBPUlQ9eQpDT05GSUdf
R0FNRVBPUlRfTlM1NTg9eQpDT05GSUdfR0FNRVBPUlRfTDQ9eQojIENPTkZJR19HQU1FUE9SVF9F
TVUxMEsxIGlzIG5vdCBzZXQKIyBDT05GSUdfR0FNRVBPUlRfRk04MDEgaXMgbm90IHNldAojIGVu
ZCBvZiBIYXJkd2FyZSBJL08gcG9ydHMKIyBlbmQgb2YgSW5wdXQgZGV2aWNlIHN1cHBvcnQKCiMK
IyBDaGFyYWN0ZXIgZGV2aWNlcwojCkNPTkZJR19UVFk9eQojIENPTkZJR19WVCBpcyBub3Qgc2V0
CkNPTkZJR19VTklYOThfUFRZUz15CkNPTkZJR19MRUdBQ1lfUFRZUz15CkNPTkZJR19MRUdBQ1lf
UFRZX0NPVU5UPTI1NgpDT05GSUdfTERJU0NfQVVUT0xPQUQ9eQoKIwojIFNlcmlhbCBkcml2ZXJz
CiMKQ09ORklHX1NFUklBTF9FQVJMWUNPTj15CkNPTkZJR19TRVJJQUxfODI1MD15CkNPTkZJR19T
RVJJQUxfODI1MF9ERVBSRUNBVEVEX09QVElPTlM9eQpDT05GSUdfU0VSSUFMXzgyNTBfUE5QPXkK
IyBDT05GSUdfU0VSSUFMXzgyNTBfMTY1NTBBX1ZBUklBTlRTIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VSSUFMXzgyNTBfRklOVEVLIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUwX0NPTlNPTEU9
eQpDT05GSUdfU0VSSUFMXzgyNTBfRE1BPXkKQ09ORklHX1NFUklBTF84MjUwX1BDST15CkNPTkZJ
R19TRVJJQUxfODI1MF9FWEFSPXkKIyBDT05GSUdfU0VSSUFMXzgyNTBfTUVOX01DQiBpcyBub3Qg
c2V0CkNPTkZJR19TRVJJQUxfODI1MF9OUl9VQVJUUz00CkNPTkZJR19TRVJJQUxfODI1MF9SVU5U
SU1FX1VBUlRTPTQKIyBDT05GSUdfU0VSSUFMXzgyNTBfRVhURU5ERUQgaXMgbm90IHNldApDT05G
SUdfU0VSSUFMXzgyNTBfRFdMSUI9eQojIENPTkZJR19TRVJJQUxfODI1MF9EVyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFUklBTF84MjUwX1JUMjg4WCBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfODI1
MF9MUFNTPXkKQ09ORklHX1NFUklBTF84MjUwX01JRD15CkNPTkZJR19TRVJJQUxfODI1MF9QRVJJ
Q09NPXkKCiMKIyBOb24tODI1MCBzZXJpYWwgcG9ydCBzdXBwb3J0CiMKIyBDT05GSUdfU0VSSUFM
X1VBUlRMSVRFIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9DT1JFPXkKQ09ORklHX1NFUklBTF9D
T1JFX0NPTlNPTEU9eQojIENPTkZJR19TRVJJQUxfSlNNIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VS
SUFMX0xBTlRJUSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9TQ0NOWFAgaXMgbm90IHNldAoj
IENPTkZJR19TRVJJQUxfU0MxNklTN1hYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0FMVEVS
QV9KVEFHVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9BTFRFUkFfVUFSVCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFUklBTF9BUkMgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfUlAyIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0ZTTF9MUFVBUlQgaXMgbm90IHNldAojIENPTkZJR19T
RVJJQUxfRlNMX0xJTkZMRVhVQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX01FTl9aMTM1
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1NQUkQgaXMgbm90IHNldAojIGVuZCBvZiBTZXJp
YWwgZHJpdmVycwoKQ09ORklHX1NFUklBTF9NQ1RSTF9HUElPPXkKIyBDT05GSUdfU0VSSUFMX05P
TlNUQU5EQVJEIGlzIG5vdCBzZXQKIyBDT05GSUdfTl9HU00gaXMgbm90IHNldAojIENPTkZJR19O
T1pPTUkgaXMgbm90IHNldAojIENPTkZJR19OVUxMX1RUWSBpcyBub3Qgc2V0CkNPTkZJR19TRVJJ
QUxfREVWX0JVUz15CkNPTkZJR19TRVJJQUxfREVWX0NUUkxfVFRZUE9SVD15CiMgQ09ORklHX1RU
WV9QUklOVEsgaXMgbm90IHNldApDT05GSUdfUFJJTlRFUj15CkNPTkZJR19MUF9DT05TT0xFPXkK
Q09ORklHX1BQREVWPXkKIyBDT05GSUdfVklSVElPX0NPTlNPTEUgaXMgbm90IHNldAojIENPTkZJ
R19JUE1JX0hBTkRMRVIgaXMgbm90IHNldAojIENPTkZJR19JUE1CX0RFVklDRV9JTlRFUkZBQ0Ug
aXMgbm90IHNldAojIENPTkZJR19IV19SQU5ET00gaXMgbm90IHNldAojIENPTkZJR19BUFBMSUNP
TSBpcyBub3Qgc2V0CiMgQ09ORklHX01XQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfREVWTUVNIGlz
IG5vdCBzZXQKIyBDT05GSUdfTlZSQU0gaXMgbm90IHNldApDT05GSUdfREVWUE9SVD15CiMgQ09O
RklHX0hQRVQgaXMgbm90IHNldApDT05GSUdfSEFOR0NIRUNLX1RJTUVSPXkKQ09ORklHX1RDR19U
UE09eQpDT05GSUdfVENHX1RJU19DT1JFPXkKQ09ORklHX1RDR19USVM9eQojIENPTkZJR19UQ0df
VElTX0kyQyBpcyBub3Qgc2V0CkNPTkZJR19UQ0dfVElTX0kyQ19DUjUwPXkKQ09ORklHX1RDR19U
SVNfSTJDX0FUTUVMPXkKQ09ORklHX1RDR19USVNfSTJDX0lORklORU9OPXkKQ09ORklHX1RDR19U
SVNfSTJDX05VVk9UT049eQpDT05GSUdfVENHX05TQz15CkNPTkZJR19UQ0dfQVRNRUw9eQpDT05G
SUdfVENHX0lORklORU9OPXkKQ09ORklHX1RDR19DUkI9eQpDT05GSUdfVENHX1ZUUE1fUFJPWFk9
eQpDT05GSUdfVENHX1RJU19TVDMzWlAyND15CkNPTkZJR19UQ0dfVElTX1NUMzNaUDI0X0kyQz15
CkNPTkZJR19URUxDTE9DSz15CiMgQ09ORklHX1hJTExZQlVTIGlzIG5vdCBzZXQKQ09ORklHX1JB
TkRPTV9UUlVTVF9DUFU9eQpDT05GSUdfUkFORE9NX1RSVVNUX0JPT1RMT0FERVI9eQojIGVuZCBv
ZiBDaGFyYWN0ZXIgZGV2aWNlcwoKIwojIEkyQyBzdXBwb3J0CiMKQ09ORklHX0kyQz15CiMgQ09O
RklHX0FDUElfSTJDX09QUkVHSU9OIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19CT0FSRElORk89eQpD
T05GSUdfSTJDX0NPTVBBVD15CkNPTkZJR19JMkNfQ0hBUkRFVj15CkNPTkZJR19JMkNfTVVYPXkK
CiMKIyBNdWx0aXBsZXhlciBJMkMgQ2hpcCBzdXBwb3J0CiMKQ09ORklHX0kyQ19NVVhfR1BJTz15
CkNPTkZJR19JMkNfTVVYX0xUQzQzMDY9eQpDT05GSUdfSTJDX01VWF9QQ0E5NTQxPXkKQ09ORklH
X0kyQ19NVVhfUENBOTU0eD15CkNPTkZJR19JMkNfTVVYX1JFRz15CkNPTkZJR19JMkNfTVVYX01M
WENQTEQ9eQojIGVuZCBvZiBNdWx0aXBsZXhlciBJMkMgQ2hpcCBzdXBwb3J0CgpDT05GSUdfSTJD
X0hFTFBFUl9BVVRPPXkKQ09ORklHX0kyQ19TTUJVUz15CkNPTkZJR19JMkNfQUxHT0JJVD15Cgoj
CiMgSTJDIEhhcmR3YXJlIEJ1cyBzdXBwb3J0CiMKCiMKIyBQQyBTTUJ1cyBob3N0IGNvbnRyb2xs
ZXIgZHJpdmVycwojCiMgQ09ORklHX0kyQ19BTEkxNTM1IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJD
X0FMSTE1NjMgaXMgbm90IHNldAojIENPTkZJR19JMkNfQUxJMTVYMyBpcyBub3Qgc2V0CiMgQ09O
RklHX0kyQ19BTUQ3NTYgaXMgbm90IHNldAojIENPTkZJR19JMkNfQU1EODExMSBpcyBub3Qgc2V0
CiMgQ09ORklHX0kyQ19BTURfTVAyIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0k4MDEgaXMgbm90
IHNldAojIENPTkZJR19JMkNfSVNDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19JU01UIGlzIG5v
dCBzZXQKIyBDT05GSUdfSTJDX1BJSVg0IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX05GT1JDRTIg
aXMgbm90IHNldAojIENPTkZJR19JMkNfTlZJRElBX0dQVSBpcyBub3Qgc2V0CiMgQ09ORklHX0ky
Q19TSVM1NTk1IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1NJUzYzMCBpcyBub3Qgc2V0CiMgQ09O
RklHX0kyQ19TSVM5NlggaXMgbm90IHNldAojIENPTkZJR19JMkNfVklBIGlzIG5vdCBzZXQKIyBD
T05GSUdfSTJDX1ZJQVBSTyBpcyBub3Qgc2V0CgojCiMgQUNQSSBkcml2ZXJzCiMKQ09ORklHX0ky
Q19TQ01JPXkKCiMKIyBJMkMgc3lzdGVtIGJ1cyBkcml2ZXJzIChtb3N0bHkgZW1iZWRkZWQgLyBz
eXN0ZW0tb24tY2hpcCkKIwpDT05GSUdfSTJDX0NCVVNfR1BJTz15CiMgQ09ORklHX0kyQ19ERVNJ
R05XQVJFX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RFU0lHTldBUkVfUENJIGlz
IG5vdCBzZXQKIyBDT05GSUdfSTJDX0VNRVYyIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19HUElPPXkK
IyBDT05GSUdfSTJDX0dQSU9fRkFVTFRfSU5KRUNUT1IgaXMgbm90IHNldApDT05GSUdfSTJDX09D
T1JFUz15CiMgQ09ORklHX0kyQ19QQ0FfUExBVEZPUk0gaXMgbm90IHNldApDT05GSUdfSTJDX1NJ
TVRFQz15CiMgQ09ORklHX0kyQ19YSUxJTlggaXMgbm90IHNldAoKIwojIEV4dGVybmFsIEkyQy9T
TUJ1cyBhZGFwdGVyIGRyaXZlcnMKIwojIENPTkZJR19JMkNfUEFSUE9SVCBpcyBub3Qgc2V0CiMg
Q09ORklHX0kyQ19UQU9TX0VWTSBpcyBub3Qgc2V0CgojCiMgT3RoZXIgSTJDL1NNQnVzIGJ1cyBk
cml2ZXJzCiMKIyBDT05GSUdfSTJDX01MWENQTEQgaXMgbm90IHNldAojIENPTkZJR19JMkNfQ1JP
U19FQ19UVU5ORUwgaXMgbm90IHNldApDT05GSUdfSTJDX1ZJUlRJTz15CiMgZW5kIG9mIEkyQyBI
YXJkd2FyZSBCdXMgc3VwcG9ydAoKIyBDT05GSUdfSTJDX1NUVUIgaXMgbm90IHNldApDT05GSUdf
STJDX1NMQVZFPXkKQ09ORklHX0kyQ19TTEFWRV9FRVBST009eQpDT05GSUdfSTJDX1NMQVZFX1RF
U1RVTklUPXkKIyBDT05GSUdfSTJDX0RFQlVHX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19JMkNf
REVCVUdfQUxHTyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19ERUJVR19CVVMgaXMgbm90IHNldAoj
IGVuZCBvZiBJMkMgc3VwcG9ydAoKQ09ORklHX0kzQz15CiMgQ09ORklHX0NETlNfSTNDX01BU1RF
UiBpcyBub3Qgc2V0CkNPTkZJR19EV19JM0NfTUFTVEVSPXkKQ09ORklHX1NWQ19JM0NfTUFTVEVS
PXkKIyBDT05GSUdfTUlQSV9JM0NfSENJIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJIGlzIG5vdCBz
ZXQKQ09ORklHX1NQTUk9eQojIENPTkZJR19TUE1JX0hJU0kzNjcwIGlzIG5vdCBzZXQKQ09ORklH
X0hTST15CkNPTkZJR19IU0lfQk9BUkRJTkZPPXkKCiMKIyBIU0kgY29udHJvbGxlcnMKIwoKIwoj
IEhTSSBjbGllbnRzCiMKQ09ORklHX0hTSV9DSEFSPXkKQ09ORklHX1BQUz15CiMgQ09ORklHX1BQ
U19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19OVFBfUFBTPXkKCiMKIyBQUFMgY2xpZW50cyBzdXBw
b3J0CiMKIyBDT05GSUdfUFBTX0NMSUVOVF9LVElNRVIgaXMgbm90IHNldAojIENPTkZJR19QUFNf
Q0xJRU5UX0xESVNDIGlzIG5vdCBzZXQKQ09ORklHX1BQU19DTElFTlRfUEFSUE9SVD15CkNPTkZJ
R19QUFNfQ0xJRU5UX0dQSU89eQoKIwojIFBQUyBnZW5lcmF0b3JzIHN1cHBvcnQKIwoKIwojIFBU
UCBjbG9jayBzdXBwb3J0CiMKQ09ORklHX1BUUF8xNTg4X0NMT0NLX09QVElPTkFMPXkKCiMKIyBF
bmFibGUgUEhZTElCIGFuZCBORVRXT1JLX1BIWV9USU1FU1RBTVBJTkcgdG8gc2VlIHRoZSBhZGRp
dGlvbmFsIGNsb2Nrcy4KIwojIGVuZCBvZiBQVFAgY2xvY2sgc3VwcG9ydAoKQ09ORklHX1BJTkNU
Ukw9eQpDT05GSUdfUElOTVVYPXkKQ09ORklHX1BJTkNPTkY9eQpDT05GSUdfR0VORVJJQ19QSU5D
T05GPXkKQ09ORklHX0RFQlVHX1BJTkNUUkw9eQojIENPTkZJR19QSU5DVFJMX0FNRCBpcyBub3Qg
c2V0CkNPTkZJR19QSU5DVFJMX0RBOTA2Mj15CiMgQ09ORklHX1BJTkNUUkxfTUNQMjNTMDggaXMg
bm90IHNldAojIENPTkZJR19QSU5DVFJMX1NYMTUwWCBpcyBub3Qgc2V0CkNPTkZJR19QSU5DVFJM
X01BREVSQT15CkNPTkZJR19QSU5DVFJMX0NTNDdMMzU9eQpDT05GSUdfUElOQ1RSTF9DUzQ3TDg1
PXkKQ09ORklHX1BJTkNUUkxfQ1M0N0w5MD15CgojCiMgSW50ZWwgcGluY3RybCBkcml2ZXJzCiMK
IyBDT05GSUdfUElOQ1RSTF9CQVlUUkFJTCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfQ0hF
UlJZVklFVyBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfTFlOWFBPSU5UIGlzIG5vdCBzZXQK
Q09ORklHX1BJTkNUUkxfSU5URUw9eQpDT05GSUdfUElOQ1RSTF9BTERFUkxBS0U9eQojIENPTkZJ
R19QSU5DVFJMX0JST1hUT04gaXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9DQU5OT05MQUtFPXkK
Q09ORklHX1BJTkNUUkxfQ0VEQVJGT1JLPXkKQ09ORklHX1BJTkNUUkxfREVOVkVSVE9OPXkKIyBD
T05GSUdfUElOQ1RSTF9FTEtIQVJUTEFLRSBpcyBub3Qgc2V0CkNPTkZJR19QSU5DVFJMX0VNTUlU
U0JVUkc9eQojIENPTkZJR19QSU5DVFJMX0dFTUlOSUxBS0UgaXMgbm90IHNldAojIENPTkZJR19Q
SU5DVFJMX0lDRUxBS0UgaXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9KQVNQRVJMQUtFPXkKIyBD
T05GSUdfUElOQ1RSTF9MQUtFRklFTEQgaXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9MRVdJU0JV
Ukc9eQojIENPTkZJR19QSU5DVFJMX01FVEVPUkxBS0UgaXMgbm90IHNldApDT05GSUdfUElOQ1RS
TF9TVU5SSVNFUE9JTlQ9eQpDT05GSUdfUElOQ1RSTF9USUdFUkxBS0U9eQojIGVuZCBvZiBJbnRl
bCBwaW5jdHJsIGRyaXZlcnMKCiMKIyBSZW5lc2FzIHBpbmN0cmwgZHJpdmVycwojCiMgZW5kIG9m
IFJlbmVzYXMgcGluY3RybCBkcml2ZXJzCgpDT05GSUdfR1BJT0xJQj15CkNPTkZJR19HUElPTElC
X0ZBU1RQQVRIX0xJTUlUPTUxMgpDT05GSUdfR1BJT19BQ1BJPXkKQ09ORklHX0dQSU9MSUJfSVJR
Q0hJUD15CkNPTkZJR19ERUJVR19HUElPPXkKIyBDT05GSUdfR1BJT19TWVNGUyBpcyBub3Qgc2V0
CkNPTkZJR19HUElPX0NERVY9eQojIENPTkZJR19HUElPX0NERVZfVjEgaXMgbm90IHNldApDT05G
SUdfR1BJT19HRU5FUklDPXkKCiMKIyBNZW1vcnkgbWFwcGVkIEdQSU8gZHJpdmVycwojCiMgQ09O
RklHX0dQSU9fQU1EUFQgaXMgbm90IHNldApDT05GSUdfR1BJT19EV0FQQj15CiMgQ09ORklHX0dQ
SU9fRVhBUiBpcyBub3Qgc2V0CkNPTkZJR19HUElPX0dFTkVSSUNfUExBVEZPUk09eQojIENPTkZJ
R19HUElPX01CODZTN1ggaXMgbm90IHNldAojIENPTkZJR19HUElPX01FTloxMjcgaXMgbm90IHNl
dAojIENPTkZJR19HUElPX1ZYODU1IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19BTURfRkNIIGlz
IG5vdCBzZXQKIyBlbmQgb2YgTWVtb3J5IG1hcHBlZCBHUElPIGRyaXZlcnMKCiMKIyBQb3J0LW1h
cHBlZCBJL08gR1BJTyBkcml2ZXJzCiMKQ09ORklHX0dQSU9fRjcxODhYPXkKQ09ORklHX0dQSU9f
SVQ4Nz15CkNPTkZJR19HUElPX1NDSDMxMVg9eQojIENPTkZJR19HUElPX1dJTkJPTkQgaXMgbm90
IHNldApDT05GSUdfR1BJT19XUzE2QzQ4PXkKIyBlbmQgb2YgUG9ydC1tYXBwZWQgSS9PIEdQSU8g
ZHJpdmVycwoKIwojIEkyQyBHUElPIGV4cGFuZGVycwojCkNPTkZJR19HUElPX0FEUDU1ODg9eQoj
IENPTkZJR19HUElPX0FEUDU1ODhfSVJRIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19NQVg3MzAw
IGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fTUFYNzMyWD15CiMgQ09ORklHX0dQSU9fTUFYNzMyWF9J
UlEgaXMgbm90IHNldApDT05GSUdfR1BJT19QQ0E5NTNYPXkKIyBDT05GSUdfR1BJT19QQ0E5NTNY
X0lSUSBpcyBub3Qgc2V0CkNPTkZJR19HUElPX1BDQTk1NzA9eQojIENPTkZJR19HUElPX1BDRjg1
N1ggaXMgbm90IHNldApDT05GSUdfR1BJT19UUElDMjgxMD15CiMgZW5kIG9mIEkyQyBHUElPIGV4
cGFuZGVycwoKIwojIE1GRCBHUElPIGV4cGFuZGVycwojCkNPTkZJR19HUElPX0FSSVpPTkE9eQoj
IENPTkZJR19HUElPX0JEOTU3MU1XViBpcyBub3Qgc2V0CkNPTkZJR19HUElPX0RBOTA1NT15CkNP
TkZJR19HUElPX0xQMzk0Mz15CiMgQ09ORklHX0dQSU9fTFA4NzNYIGlzIG5vdCBzZXQKQ09ORklH
X0dQSU9fTUFERVJBPXkKIyBDT05GSUdfR1BJT19QQUxNQVMgaXMgbm90IHNldAojIENPTkZJR19H
UElPX1RQUzY1MDg2IGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fVFBTNjU4Nlg9eQpDT05GSUdfR1BJ
T19UUFM2NTkxMD15CkNPTkZJR19HUElPX1RQUzY4NDcwPXkKQ09ORklHX0dQSU9fVFFNWDg2PXkK
Q09ORklHX0dQSU9fV004MzFYPXkKIyBDT05GSUdfR1BJT19XTTgzNTAgaXMgbm90IHNldApDT05G
SUdfR1BJT19XTTg5OTQ9eQojIGVuZCBvZiBNRkQgR1BJTyBleHBhbmRlcnMKCiMKIyBQQ0kgR1BJ
TyBleHBhbmRlcnMKIwojIENPTkZJR19HUElPX0FNRDgxMTEgaXMgbm90IHNldAojIENPTkZJR19H
UElPX0JUOFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19NTF9JT0ggaXMgbm90IHNldAojIENP
TkZJR19HUElPX1BDSV9JRElPXzE2IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19QQ0lFX0lESU9f
MjQgaXMgbm90IHNldAojIENPTkZJR19HUElPX1JEQzMyMVggaXMgbm90IHNldAojIGVuZCBvZiBQ
Q0kgR1BJTyBleHBhbmRlcnMKCiMKIyBWaXJ0dWFsIEdQSU8gZHJpdmVycwojCiMgQ09ORklHX0dQ
SU9fQUdHUkVHQVRPUiBpcyBub3Qgc2V0CkNPTkZJR19HUElPX01PQ0tVUD15CkNPTkZJR19HUElP
X1ZJUlRJTz15CiMgQ09ORklHX0dQSU9fU0lNIGlzIG5vdCBzZXQKIyBlbmQgb2YgVmlydHVhbCBH
UElPIGRyaXZlcnMKCkNPTkZJR19XMT15CgojCiMgMS13aXJlIEJ1cyBNYXN0ZXJzCiMKIyBDT05G
SUdfVzFfTUFTVEVSX01BVFJPWCBpcyBub3Qgc2V0CkNPTkZJR19XMV9NQVNURVJfRFMyNDgyPXkK
Q09ORklHX1cxX01BU1RFUl9EUzFXTT15CkNPTkZJR19XMV9NQVNURVJfR1BJTz15CkNPTkZJR19X
MV9NQVNURVJfU0dJPXkKIyBlbmQgb2YgMS13aXJlIEJ1cyBNYXN0ZXJzCgojCiMgMS13aXJlIFNs
YXZlcwojCkNPTkZJR19XMV9TTEFWRV9USEVSTT15CiMgQ09ORklHX1cxX1NMQVZFX1NNRU0gaXMg
bm90IHNldApDT05GSUdfVzFfU0xBVkVfRFMyNDA1PXkKQ09ORklHX1cxX1NMQVZFX0RTMjQwOD15
CiMgQ09ORklHX1cxX1NMQVZFX0RTMjQwOF9SRUFEQkFDSyBpcyBub3Qgc2V0CiMgQ09ORklHX1cx
X1NMQVZFX0RTMjQxMyBpcyBub3Qgc2V0CkNPTkZJR19XMV9TTEFWRV9EUzI0MDY9eQojIENPTkZJ
R19XMV9TTEFWRV9EUzI0MjMgaXMgbm90IHNldAojIENPTkZJR19XMV9TTEFWRV9EUzI4MDUgaXMg
bm90IHNldApDT05GSUdfVzFfU0xBVkVfRFMyNDMwPXkKQ09ORklHX1cxX1NMQVZFX0RTMjQzMT15
CkNPTkZJR19XMV9TTEFWRV9EUzI0MzM9eQojIENPTkZJR19XMV9TTEFWRV9EUzI0MzNfQ1JDIGlz
IG5vdCBzZXQKQ09ORklHX1cxX1NMQVZFX0RTMjQzOD15CiMgQ09ORklHX1cxX1NMQVZFX0RTMjUw
WCBpcyBub3Qgc2V0CiMgQ09ORklHX1cxX1NMQVZFX0RTMjc4MCBpcyBub3Qgc2V0CkNPTkZJR19X
MV9TTEFWRV9EUzI3ODE9eQpDT05GSUdfVzFfU0xBVkVfRFMyOEUwND15CkNPTkZJR19XMV9TTEFW
RV9EUzI4RTE3PXkKIyBlbmQgb2YgMS13aXJlIFNsYXZlcwoKQ09ORklHX1BPV0VSX1JFU0VUPXkK
Q09ORklHX1BPV0VSX1JFU0VUX0FUQzI2MFg9eQpDT05GSUdfUE9XRVJfUkVTRVRfTVQ2MzIzPXkK
Q09ORklHX1BPV0VSX1JFU0VUX1JFU1RBUlQ9eQojIENPTkZJR19QT1dFUl9SRVNFVF9UUFM2NTA4
NiBpcyBub3Qgc2V0CkNPTkZJR19QT1dFUl9TVVBQTFk9eQojIENPTkZJR19QT1dFUl9TVVBQTFlf
REVCVUcgaXMgbm90IHNldApDT05GSUdfUE9XRVJfU1VQUExZX0hXTU9OPXkKQ09ORklHX1BEQV9Q
T1dFUj15CkNPTkZJR19HRU5FUklDX0FEQ19CQVRURVJZPXkKIyBDT05GSUdfSVA1WFhYX1BPV0VS
IGlzIG5vdCBzZXQKIyBDT05GSUdfV004MzFYX0JBQ0tVUCBpcyBub3Qgc2V0CiMgQ09ORklHX1dN
ODMxWF9QT1dFUiBpcyBub3Qgc2V0CkNPTkZJR19XTTgzNTBfUE9XRVI9eQojIENPTkZJR19URVNU
X1BPV0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV84OFBNODYwWCBpcyBub3Qgc2V0CkNP
TkZJR19DSEFSR0VSX0FEUDUwNjE9eQpDT05GSUdfQkFUVEVSWV9DVzIwMTU9eQpDT05GSUdfQkFU
VEVSWV9EUzI3NjA9eQojIENPTkZJR19CQVRURVJZX0RTMjc4MCBpcyBub3Qgc2V0CkNPTkZJR19C
QVRURVJZX0RTMjc4MT15CkNPTkZJR19CQVRURVJZX0RTMjc4Mj15CiMgQ09ORklHX0JBVFRFUllf
U0FNU1VOR19TREkgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX1NCUyBpcyBub3Qgc2V0CiMg
Q09ORklHX0NIQVJHRVJfU0JTIGlzIG5vdCBzZXQKQ09ORklHX01BTkFHRVJfU0JTPXkKQ09ORklH
X0JBVFRFUllfQlEyN1hYWD15CiMgQ09ORklHX0JBVFRFUllfQlEyN1hYWF9JMkMgaXMgbm90IHNl
dApDT05GSUdfQkFUVEVSWV9CUTI3WFhYX0hEUT15CkNPTkZJR19CQVRURVJZX0RBOTAzMD15CkNP
TkZJR19CQVRURVJZX0RBOTE1MD15CkNPTkZJR19DSEFSR0VSX0FYUDIwWD15CkNPTkZJR19CQVRU
RVJZX0FYUDIwWD15CkNPTkZJR19BWFAyMFhfUE9XRVI9eQojIENPTkZJR19CQVRURVJZX01BWDE3
MDQwIGlzIG5vdCBzZXQKQ09ORklHX0JBVFRFUllfTUFYMTcwNDI9eQpDT05GSUdfQkFUVEVSWV9N
QVgxNzIxWD15CkNPTkZJR19DSEFSR0VSX0lTUDE3MDQ9eQojIENPTkZJR19DSEFSR0VSX01BWDg5
MDMgaXMgbm90IHNldApDT05GSUdfQ0hBUkdFUl9MUDg3Mjc9eQpDT05GSUdfQ0hBUkdFUl9MUDg3
ODg9eQpDT05GSUdfQ0hBUkdFUl9HUElPPXkKIyBDT05GSUdfQ0hBUkdFUl9NQU5BR0VSIGlzIG5v
dCBzZXQKQ09ORklHX0NIQVJHRVJfTFQzNjUxPXkKQ09ORklHX0NIQVJHRVJfTFRDNDE2Mkw9eQpD
T05GSUdfQ0hBUkdFUl9NQVgxNDU3Nz15CiMgQ09ORklHX0NIQVJHRVJfTUFYNzc5NzYgaXMgbm90
IHNldAojIENPTkZJR19DSEFSR0VSX01UNjM2MCBpcyBub3Qgc2V0CkNPTkZJR19DSEFSR0VSX0JR
MjQxNVg9eQpDT05GSUdfQ0hBUkdFUl9CUTI0MTkwPXkKIyBDT05GSUdfQ0hBUkdFUl9CUTI0MjU3
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9CUTI0NzM1IGlzIG5vdCBzZXQKQ09ORklHX0NI
QVJHRVJfQlEyNTE1WD15CiMgQ09ORklHX0NIQVJHRVJfQlEyNTg5MCBpcyBub3Qgc2V0CiMgQ09O
RklHX0NIQVJHRVJfQlEyNTk4MCBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNTZYWCBp
cyBub3Qgc2V0CkNPTkZJR19DSEFSR0VSX1NNQjM0Nz15CkNPTkZJR19DSEFSR0VSX1RQUzY1MDkw
PXkKIyBDT05GSUdfQkFUVEVSWV9HQVVHRV9MVEMyOTQxIGlzIG5vdCBzZXQKQ09ORklHX0JBVFRF
UllfR09MREZJU0g9eQojIENPTkZJR19CQVRURVJZX1JUNTAzMyBpcyBub3Qgc2V0CkNPTkZJR19D
SEFSR0VSX1JUOTQ1NT15CiMgQ09ORklHX0NIQVJHRVJfQkQ5OTk1NCBpcyBub3Qgc2V0CiMgQ09O
RklHX0JBVFRFUllfVUczMTA1IGlzIG5vdCBzZXQKQ09ORklHX0hXTU9OPXkKQ09ORklHX0hXTU9O
X1ZJRD15CkNPTkZJR19IV01PTl9ERUJVR19DSElQPXkKCiMKIyBOYXRpdmUgZHJpdmVycwojCiMg
Q09ORklHX1NFTlNPUlNfQUJJVFVHVVJVIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BQklU
VUdVUlUzIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfQUQ3NDE0PXkKIyBDT05GSUdfU0VOU09S
U19BRDc0MTggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FETTEwMjEgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0FETTEwMjUgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19BRE0xMDI2
PXkKQ09ORklHX1NFTlNPUlNfQURNMTAyOT15CkNPTkZJR19TRU5TT1JTX0FETTEwMzE9eQpDT05G
SUdfU0VOU09SU19BRE0xMTc3PXkKIyBDT05GSUdfU0VOU09SU19BRE05MjQwIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19BRFQ3NDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRFQ3
NDExIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfQURUNzQ2Mj15CkNPTkZJR19TRU5TT1JTX0FE
VDc0NzA9eQpDT05GSUdfU0VOU09SU19BRFQ3NDc1PXkKIyBDT05GSUdfU0VOU09SU19BSFQxMCBp
cyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0FTMzcwPXkKIyBDT05GSUdfU0VOU09SU19BU0M3NjIx
IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfQVhJX0ZBTl9DT05UUk9MPXkKIyBDT05GSUdfU0VO
U09SU19LOFRFTVAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FQUExFU01DIGlzIG5vdCBz
ZXQKQ09ORklHX1NFTlNPUlNfQVNCMTAwPXkKIyBDT05GSUdfU0VOU09SU19BU1BFRUQgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX0FUWFAxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19D
T1JTQUlSX0NQUk8gaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0NPUlNBSVJfUFNVIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VOU09SU19EUzYyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
RFMxNjIxIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfREVMTF9TTU09eQojIENPTkZJR19JOEsg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0RBOTA1NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfSTVLX0FNQiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRjcxODA1RiBpcyBub3Qg
c2V0CkNPTkZJR19TRU5TT1JTX0Y3MTg4MkZHPXkKIyBDT05GSUdfU0VOU09SU19GNzUzNzVTIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQzEzNzgzX0FEQyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfRlNDSE1EIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19HTDUxOFNNIGlzIG5v
dCBzZXQKQ09ORklHX1NFTlNPUlNfR0w1MjBTTT15CkNPTkZJR19TRU5TT1JTX0c3NjBBPXkKQ09O
RklHX1NFTlNPUlNfRzc2Mj15CkNPTkZJR19TRU5TT1JTX0hJSDYxMzA9eQpDT05GSUdfU0VOU09S
U19JSU9fSFdNT049eQojIENPTkZJR19TRU5TT1JTX0k1NTAwIGlzIG5vdCBzZXQKQ09ORklHX1NF
TlNPUlNfQ09SRVRFTVA9eQpDT05GSUdfU0VOU09SU19JVDg3PXkKIyBDT05GSUdfU0VOU09SU19K
QzQyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19QT1dSMTIyMCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfTElORUFHRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDMjk0NSBp
cyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0xUQzI5NDc9eQpDT05GSUdfU0VOU09SU19MVEMyOTQ3
X0kyQz15CkNPTkZJR19TRU5TT1JTX0xUQzI5OTA9eQojIENPTkZJR19TRU5TT1JTX0xUQzI5OTIg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xUQzQxNTEgaXMgbm90IHNldApDT05GSUdfU0VO
U09SU19MVEM0MjE1PXkKQ09ORklHX1NFTlNPUlNfTFRDNDIyMj15CiMgQ09ORklHX1NFTlNPUlNf
TFRDNDI0NSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0xUQzQyNjA9eQojIENPTkZJR19TRU5T
T1JTX0xUQzQyNjEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDEyNyBpcyBub3Qgc2V0
CkNPTkZJR19TRU5TT1JTX01BWDE2MDY1PXkKIyBDT05GSUdfU0VOU09SU19NQVgxNjE5IGlzIG5v
dCBzZXQKQ09ORklHX1NFTlNPUlNfTUFYMTY2OD15CkNPTkZJR19TRU5TT1JTX01BWDE5Nz15CkNP
TkZJR19TRU5TT1JTX01BWDMxNzMwPXkKQ09ORklHX1NFTlNPUlNfTUFYNjYyMD15CkNPTkZJR19T
RU5TT1JTX01BWDY2MjE9eQpDT05GSUdfU0VOU09SU19NQVg2NjM5PXkKQ09ORklHX1NFTlNPUlNf
TUFYNjY0Mj15CkNPTkZJR19TRU5TT1JTX01BWDY2NTA9eQojIENPTkZJR19TRU5TT1JTX01BWDY2
OTcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDMxNzkwIGlzIG5vdCBzZXQKQ09ORklH
X1NFTlNPUlNfTUNQMzAyMT15CkNPTkZJR19TRU5TT1JTX01MWFJFR19GQU49eQojIENPTkZJR19T
RU5TT1JTX1RDNjU0IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfVFBTMjM4NjE9eQpDT05GSUdf
U0VOU09SU19NUjc1MjAzPXkKQ09ORklHX1NFTlNPUlNfTE02Mz15CkNPTkZJR19TRU5TT1JTX0xN
NzM9eQpDT05GSUdfU0VOU09SU19MTTc1PXkKQ09ORklHX1NFTlNPUlNfTE03Nz15CiMgQ09ORklH
X1NFTlNPUlNfTE03OCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0xNODA9eQpDT05GSUdfU0VO
U09SU19MTTgzPXkKQ09ORklHX1NFTlNPUlNfTE04NT15CkNPTkZJR19TRU5TT1JTX0xNODc9eQoj
IENPTkZJR19TRU5TT1JTX0xNOTAgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19MTTkyPXkKIyBD
T05GSUdfU0VOU09SU19MTTkzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTk1MjM0IGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTk1MjQxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19MTTk1MjQ1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19QQzg3MzYwIGlzIG5vdCBz
ZXQKQ09ORklHX1NFTlNPUlNfUEM4NzQyNz15CiMgQ09ORklHX1NFTlNPUlNfTlRDX1RIRVJNSVNU
T1IgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19OQ1Q2NjgzPXkKQ09ORklHX1NFTlNPUlNfTkNU
Njc3NV9DT1JFPXkKQ09ORklHX1NFTlNPUlNfTkNUNjc3NT15CiMgQ09ORklHX1NFTlNPUlNfTkNU
Njc3NV9JMkMgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19OQ1Q3ODAyPXkKIyBDT05GSUdfU0VO
U09SU19OUENNN1hYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19QQ0Y4NTkxIGlzIG5vdCBz
ZXQKQ09ORklHX1BNQlVTPXkKQ09ORklHX1NFTlNPUlNfUE1CVVM9eQpDT05GSUdfU0VOU09SU19B
RE0xMjY2PXkKQ09ORklHX1NFTlNPUlNfQURNMTI3NT15CkNPTkZJR19TRU5TT1JTX0JFTF9QRkU9
eQpDT05GSUdfU0VOU09SU19CUEFfUlM2MDA9eQpDT05GSUdfU0VOU09SU19ERUxUQV9BSEU1MERD
X0ZBTj15CiMgQ09ORklHX1NFTlNPUlNfRlNQXzNZIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19JQk1fQ0ZGUFMgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19EUFM5MjBBQj15CkNPTkZJR19T
RU5TT1JTX0lOU1BVUl9JUFNQUz15CkNPTkZJR19TRU5TT1JTX0lSMzUyMjE9eQpDT05GSUdfU0VO
U09SU19JUjM2MDIxPXkKQ09ORklHX1NFTlNPUlNfSVIzODA2ND15CkNPTkZJR19TRU5TT1JTX0lS
MzgwNjRfUkVHVUxBVE9SPXkKIyBDT05GSUdfU0VOU09SU19JUlBTNTQwMSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfSVNMNjgxMzcgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19MTTI1MDY2
PXkKIyBDT05GSUdfU0VOU09SU19MTTI1MDY2X1JFR1VMQVRPUiBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfTFQ3MTgyUyBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0xUQzI5Nzg9eQpDT05G
SUdfU0VOU09SU19MVEMyOTc4X1JFR1VMQVRPUj15CiMgQ09ORklHX1NFTlNPUlNfTFRDMzgxNSBp
cyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX01BWDE1MzAxPXkKQ09ORklHX1NFTlNPUlNfTUFYMTYw
NjQ9eQpDT05GSUdfU0VOU09SU19NQVgxNjYwMT15CkNPTkZJR19TRU5TT1JTX01BWDIwNzMwPXkK
Q09ORklHX1NFTlNPUlNfTUFYMjA3NTE9eQojIENPTkZJR19TRU5TT1JTX01BWDMxNzg1IGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVgzNDQ0MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfTUFYODY4OCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX01QMjg4OD15CkNPTkZJR19TRU5T
T1JTX01QMjk3NT15CkNPTkZJR19TRU5TT1JTX01QNTAyMz15CkNPTkZJR19TRU5TT1JTX1BJTTQz
Mjg9eQojIENPTkZJR19TRU5TT1JTX1BMSTEyMDlCQyBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JT
X1BNNjc2NFRSPXkKIyBDT05GSUdfU0VOU09SU19QWEUxNjEwIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19RNTRTSjEwOEEyIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfU1RQRERDNjA9eQpD
T05GSUdfU0VOU09SU19UUFM0MDQyMj15CkNPTkZJR19TRU5TT1JTX1RQUzUzNjc5PXkKIyBDT05G
SUdfU0VOU09SU19VQ0Q5MDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19VQ0Q5MjAwIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19YRFBFMTUyIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNP
UlNfWERQRTEyMj15CiMgQ09ORklHX1NFTlNPUlNfWERQRTEyMl9SRUdVTEFUT1IgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX1pMNjEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0JU
U0kgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19TQlJNST15CkNPTkZJR19TRU5TT1JTX1NIVDE1
PXkKIyBDT05GSUdfU0VOU09SU19TSFQyMSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX1NIVDN4
PXkKQ09ORklHX1NFTlNPUlNfU0hUNHg9eQpDT05GSUdfU0VOU09SU19TSFRDMT15CiMgQ09ORklH
X1NFTlNPUlNfU0lTNTU5NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU1k3NjM2QSBpcyBu
b3Qgc2V0CkNPTkZJR19TRU5TT1JTX0RNRTE3Mzc9eQpDT05GSUdfU0VOU09SU19FTUMxNDAzPXkK
Q09ORklHX1NFTlNPUlNfRU1DMjEwMz15CkNPTkZJR19TRU5TT1JTX0VNQzZXMjAxPXkKIyBDT05G
SUdfU0VOU09SU19TTVNDNDdNMSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX1NNU0M0N00xOTI9
eQojIENPTkZJR19TRU5TT1JTX1NNU0M0N0IzOTcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X1NUVFM3NTEgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19TTU02NjU9eQpDT05GSUdfU0VOU09S
U19BREMxMjhEODE4PXkKQ09ORklHX1NFTlNPUlNfQURTNzgyOD15CkNPTkZJR19TRU5TT1JTX0FN
QzY4MjE9eQpDT05GSUdfU0VOU09SU19JTkEyMDk9eQpDT05GSUdfU0VOU09SU19JTkEyWFg9eQpD
T05GSUdfU0VOU09SU19JTkEyMzg9eQojIENPTkZJR19TRU5TT1JTX0lOQTMyMjEgaXMgbm90IHNl
dApDT05GSUdfU0VOU09SU19UQzc0PXkKQ09ORklHX1NFTlNPUlNfVEhNQzUwPXkKIyBDT05GSUdf
U0VOU09SU19UTVAxMDIgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19UTVAxMDM9eQpDT05GSUdf
U0VOU09SU19UTVAxMDg9eQpDT05GSUdfU0VOU09SU19UTVA0MDE9eQojIENPTkZJR19TRU5TT1JT
X1RNUDQyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVE1QNDY0IGlzIG5vdCBzZXQKQ09O
RklHX1NFTlNPUlNfVE1QNTEzPXkKIyBDT05GSUdfU0VOU09SU19WSUFfQ1BVVEVNUCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfVklBNjg2QSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
VlQxMjExIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19WVDgyMzEgaXMgbm90IHNldApDT05G
SUdfU0VOU09SU19XODM3NzNHPXkKIyBDT05GSUdfU0VOU09SU19XODM3ODFEIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19XODM3OTFEIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfVzgzNzky
RD15CiMgQ09ORklHX1NFTlNPUlNfVzgzNzkzIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfVzgz
Nzk1PXkKQ09ORklHX1NFTlNPUlNfVzgzNzk1X0ZBTkNUUkw9eQojIENPTkZJR19TRU5TT1JTX1c4
M0w3ODVUUyBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX1c4M0w3ODZORz15CiMgQ09ORklHX1NF
TlNPUlNfVzgzNjI3SEYgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1c4MzYyN0VIRiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfV004MzFYIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNf
V004MzUwPXkKCiMKIyBBQ1BJIGRyaXZlcnMKIwpDT05GSUdfU0VOU09SU19BQ1BJX1BPV0VSPXkK
Q09ORklHX1NFTlNPUlNfQVRLMDExMD15CiMgQ09ORklHX1NFTlNPUlNfQVNVU19FQyBpcyBub3Qg
c2V0CiMgQ09ORklHX1RIRVJNQUwgaXMgbm90IHNldAojIENPTkZJR19XQVRDSERPRyBpcyBub3Qg
c2V0CkNPTkZJR19TU0JfUE9TU0lCTEU9eQpDT05GSUdfU1NCPXkKQ09ORklHX1NTQl9TUFJPTT15
CkNPTkZJR19TU0JfUENJSE9TVF9QT1NTSUJMRT15CkNPTkZJR19TU0JfUENJSE9TVD15CkNPTkZJ
R19TU0JfU0RJT0hPU1RfUE9TU0lCTEU9eQojIENPTkZJR19TU0JfU0RJT0hPU1QgaXMgbm90IHNl
dApDT05GSUdfU1NCX0RSSVZFUl9QQ0lDT1JFX1BPU1NJQkxFPXkKIyBDT05GSUdfU1NCX0RSSVZF
Ul9QQ0lDT1JFIGlzIG5vdCBzZXQKQ09ORklHX1NTQl9EUklWRVJfR1BJTz15CkNPTkZJR19CQ01B
X1BPU1NJQkxFPXkKQ09ORklHX0JDTUE9eQpDT05GSUdfQkNNQV9IT1NUX1BDSV9QT1NTSUJMRT15
CkNPTkZJR19CQ01BX0hPU1RfUENJPXkKQ09ORklHX0JDTUFfSE9TVF9TT0M9eQpDT05GSUdfQkNN
QV9EUklWRVJfUENJPXkKIyBDT05GSUdfQkNNQV9TRkxBU0ggaXMgbm90IHNldAojIENPTkZJR19C
Q01BX0RSSVZFUl9HTUFDX0NNTiBpcyBub3Qgc2V0CkNPTkZJR19CQ01BX0RSSVZFUl9HUElPPXkK
IyBDT05GSUdfQkNNQV9ERUJVRyBpcyBub3Qgc2V0CgojCiMgTXVsdGlmdW5jdGlvbiBkZXZpY2Ug
ZHJpdmVycwojCkNPTkZJR19NRkRfQ09SRT15CkNPTkZJR19NRkRfQVMzNzExPXkKIyBDT05GSUdf
UE1JQ19BRFA1NTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0FBVDI4NzBfQ09SRSBpcyBub3Qg
c2V0CiMgQ09ORklHX01GRF9CQ001OTBYWCBpcyBub3Qgc2V0CkNPTkZJR19NRkRfQkQ5NTcxTVdW
PXkKQ09ORklHX01GRF9BWFAyMFg9eQpDT05GSUdfTUZEX0FYUDIwWF9JMkM9eQojIENPTkZJR19N
RkRfQ1JPU19FQ19ERVYgaXMgbm90IHNldApDT05GSUdfTUZEX01BREVSQT15CiMgQ09ORklHX01G
RF9NQURFUkFfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0NTNDdMMTUgaXMgbm90IHNldApD
T05GSUdfTUZEX0NTNDdMMzU9eQpDT05GSUdfTUZEX0NTNDdMODU9eQpDT05GSUdfTUZEX0NTNDdM
OTA9eQojIENPTkZJR19NRkRfQ1M0N0w5MiBpcyBub3Qgc2V0CkNPTkZJR19QTUlDX0RBOTAzWD15
CiMgQ09ORklHX01GRF9EQTkwNTJfSTJDIGlzIG5vdCBzZXQKQ09ORklHX01GRF9EQTkwNTU9eQpD
T05GSUdfTUZEX0RBOTA2Mj15CkNPTkZJR19NRkRfREE5MDYzPXkKQ09ORklHX01GRF9EQTkxNTA9
eQpDT05GSUdfTUZEX01DMTNYWFg9eQpDT05GSUdfTUZEX01DMTNYWFhfSTJDPXkKIyBDT05GSUdf
TUZEX01QMjYyOSBpcyBub3Qgc2V0CkNPTkZJR19IVENfUEFTSUMzPXkKQ09ORklHX0hUQ19JMkNQ
TEQ9eQojIENPTkZJR19NRkRfSU5URUxfUVVBUktfSTJDX0dQSU8gaXMgbm90IHNldAojIENPTkZJ
R19MUENfSUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfTFBDX1NDSCBpcyBub3Qgc2V0CiMgQ09ORklH
X0lOVEVMX1NPQ19QTUlDX01SRkxEIGlzIG5vdCBzZXQKQ09ORklHX01GRF9JTlRFTF9MUFNTPXkK
Q09ORklHX01GRF9JTlRFTF9MUFNTX0FDUEk9eQojIENPTkZJR19NRkRfSU5URUxfTFBTU19QQ0kg
aXMgbm90IHNldAojIENPTkZJR19NRkRfSU5URUxfUE1DX0JYVCBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9JUVM2MlggaXMgbm90IHNldAojIENPTkZJR19NRkRfSkFOWl9DTU9ESU8gaXMgbm90IHNl
dAojIENPTkZJR19NRkRfS0VNUExEIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEXzg4UE04MDAgaXMg
bm90IHNldApDT05GSUdfTUZEXzg4UE04MDU9eQpDT05GSUdfTUZEXzg4UE04NjBYPXkKQ09ORklH
X01GRF9NQVgxNDU3Nz15CiMgQ09ORklHX01GRF9NQVg3NzY5MyBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9NQVg3Nzg0MyBpcyBub3Qgc2V0CkNPTkZJR19NRkRfTUFYODkwNz15CiMgQ09ORklHX01G
RF9NQVg4OTI1IGlzIG5vdCBzZXQKQ09ORklHX01GRF9NQVg4OTk3PXkKIyBDT05GSUdfTUZEX01B
WDg5OTggaXMgbm90IHNldApDT05GSUdfTUZEX01UNjM2MD15CkNPTkZJR19NRkRfTVQ2Mzk3PXkK
IyBDT05GSUdfTUZEX01FTkYyMUJNQyBpcyBub3Qgc2V0CkNPTkZJR19NRkRfUkVUVT15CiMgQ09O
RklHX01GRF9QQ0Y1MDYzMyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SREMzMjFYIGlzIG5vdCBz
ZXQKQ09ORklHX01GRF9SVDQ4MzE9eQpDT05GSUdfTUZEX1JUNTAzMz15CiMgQ09ORklHX01GRF9S
QzVUNTgzIGlzIG5vdCBzZXQKQ09ORklHX01GRF9TSTQ3NlhfQ09SRT15CiMgQ09ORklHX01GRF9T
SU1QTEVfTUZEX0kyQyBpcyBub3Qgc2V0CkNPTkZJR19NRkRfU001MDE9eQojIENPTkZJR19NRkRf
U001MDFfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9TS1k4MTQ1MiBpcyBub3Qgc2V0CkNP
TkZJR19NRkRfU1lTQ09OPXkKQ09ORklHX01GRF9USV9BTTMzNVhfVFNDQURDPXkKQ09ORklHX01G
RF9MUDM5NDM9eQpDT05GSUdfTUZEX0xQODc4OD15CkNPTkZJR19NRkRfVElfTE1VPXkKQ09ORklH
X01GRF9QQUxNQVM9eQpDT05GSUdfVFBTNjEwNVg9eQojIENPTkZJR19UUFM2NTAxMCBpcyBub3Qg
c2V0CiMgQ09ORklHX1RQUzY1MDdYIGlzIG5vdCBzZXQKQ09ORklHX01GRF9UUFM2NTA4Nj15CkNP
TkZJR19NRkRfVFBTNjUwOTA9eQpDT05GSUdfTUZEX1RJX0xQODczWD15CkNPTkZJR19NRkRfVFBT
NjU4Nlg9eQpDT05GSUdfTUZEX1RQUzY1OTEwPXkKIyBDT05GSUdfTUZEX1RQUzY1OTEyX0kyQyBp
cyBub3Qgc2V0CiMgQ09ORklHX1RXTDQwMzBfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RXTDYw
NDBfQ09SRSBpcyBub3Qgc2V0CkNPTkZJR19NRkRfV0wxMjczX0NPUkU9eQpDT05GSUdfTUZEX0xN
MzUzMz15CkNPTkZJR19NRkRfVFFNWDg2PXkKIyBDT05GSUdfTUZEX1ZYODU1IGlzIG5vdCBzZXQK
Q09ORklHX01GRF9BUklaT05BPXkKQ09ORklHX01GRF9BUklaT05BX0kyQz15CiMgQ09ORklHX01G
RF9DUzQ3TDI0IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1dNNTEwMiBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9XTTUxMTAgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004OTk3IGlzIG5vdCBzZXQK
Q09ORklHX01GRF9XTTg5OTg9eQpDT05GSUdfTUZEX1dNODQwMD15CkNPTkZJR19NRkRfV004MzFY
PXkKQ09ORklHX01GRF9XTTgzMVhfSTJDPXkKQ09ORklHX01GRF9XTTgzNTA9eQpDT05GSUdfTUZE
X1dNODM1MF9JMkM9eQpDT05GSUdfTUZEX1dNODk5ND15CiMgQ09ORklHX01GRF9XQ0Q5MzRYIGlz
IG5vdCBzZXQKQ09ORklHX01GRF9BVEMyNjBYPXkKQ09ORklHX01GRF9BVEMyNjBYX0kyQz15CkNP
TkZJR19SQVZFX1NQX0NPUkU9eQojIGVuZCBvZiBNdWx0aWZ1bmN0aW9uIGRldmljZSBkcml2ZXJz
CgpDT05GSUdfUkVHVUxBVE9SPXkKQ09ORklHX1JFR1VMQVRPUl9ERUJVRz15CkNPTkZJR19SRUdV
TEFUT1JfRklYRURfVk9MVEFHRT15CkNPTkZJR19SRUdVTEFUT1JfVklSVFVBTF9DT05TVU1FUj15
CiMgQ09ORklHX1JFR1VMQVRPUl9VU0VSU1BBQ0VfQ09OU1VNRVIgaXMgbm90IHNldApDT05GSUdf
UkVHVUxBVE9SXzg4UEc4Nlg9eQpDT05GSUdfUkVHVUxBVE9SXzg4UE04NjA3PXkKQ09ORklHX1JF
R1VMQVRPUl9BQ1Q4ODY1PXkKIyBDT05GSUdfUkVHVUxBVE9SX0FENTM5OCBpcyBub3Qgc2V0CkNP
TkZJR19SRUdVTEFUT1JfQVMzNzExPXkKQ09ORklHX1JFR1VMQVRPUl9BVEMyNjBYPXkKQ09ORklH
X1JFR1VMQVRPUl9BWFAyMFg9eQojIENPTkZJR19SRUdVTEFUT1JfQkQ5NTcxTVdWIGlzIG5vdCBz
ZXQKQ09ORklHX1JFR1VMQVRPUl9EQTkwM1g9eQpDT05GSUdfUkVHVUxBVE9SX0RBOTA1NT15CkNP
TkZJR19SRUdVTEFUT1JfREE5MDYyPXkKIyBDT05GSUdfUkVHVUxBVE9SX0RBOTIxMCBpcyBub3Qg
c2V0CiMgQ09ORklHX1JFR1VMQVRPUl9EQTkyMTEgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9S
X0ZBTjUzNTU1PXkKQ09ORklHX1JFR1VMQVRPUl9HUElPPXkKQ09ORklHX1JFR1VMQVRPUl9JU0w5
MzA1PXkKIyBDT05GSUdfUkVHVUxBVE9SX0lTTDYyNzFBIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VM
QVRPUl9MTTM2M1g9eQpDT05GSUdfUkVHVUxBVE9SX0xQMzk3MT15CiMgQ09ORklHX1JFR1VMQVRP
Ul9MUDM5NzIgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX0xQODcyWD15CkNPTkZJR19SRUdV
TEFUT1JfTFA4NzU1PXkKQ09ORklHX1JFR1VMQVRPUl9MUDg3ODg9eQojIENPTkZJR19SRUdVTEFU
T1JfTFRDMzU4OSBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfTFRDMzY3Nj15CkNPTkZJR19S
RUdVTEFUT1JfTUFYMTQ1Nzc9eQpDT05GSUdfUkVHVUxBVE9SX01BWDE1ODY9eQojIENPTkZJR19S
RUdVTEFUT1JfTUFYODY0OSBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfTUFYODY2MD15CiMg
Q09ORklHX1JFR1VMQVRPUl9NQVg4ODkzIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9NQVg4
OTA3PXkKQ09ORklHX1JFR1VMQVRPUl9NQVg4OTUyPXkKIyBDT05GSUdfUkVHVUxBVE9SX01BWDg5
OTcgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTUFYMjAwODYgaXMgbm90IHNldAojIENP
TkZJR19SRUdVTEFUT1JfTUFYNzc4MjYgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTUMx
Mzc4MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9NQzEzODkyIGlzIG5vdCBzZXQKQ09O
RklHX1JFR1VMQVRPUl9NUDg4NTk9eQpDT05GSUdfUkVHVUxBVE9SX01UNjMxMT15CiMgQ09ORklH
X1JFR1VMQVRPUl9NVDYzMTUgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX01UNjMyMz15CkNP
TkZJR19SRUdVTEFUT1JfTVQ2MzU4PXkKQ09ORklHX1JFR1VMQVRPUl9NVDYzNTk9eQojIENPTkZJ
R19SRUdVTEFUT1JfTVQ2MzYwIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX01UNjM5NyBp
cyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfUEFMTUFTPXkKQ09ORklHX1JFR1VMQVRPUl9QQ0E5
NDUwPXkKQ09ORklHX1JFR1VMQVRPUl9QVjg4MDYwPXkKQ09ORklHX1JFR1VMQVRPUl9QVjg4MDgw
PXkKIyBDT05GSUdfUkVHVUxBVE9SX1BWODgwOTAgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9S
X1FDT01fU1BNST15CkNPTkZJR19SRUdVTEFUT1JfUUNPTV9VU0JfVkJVUz15CkNPTkZJR19SRUdV
TEFUT1JfUlQ0ODAxPXkKQ09ORklHX1JFR1VMQVRPUl9SVDQ4MzE9eQpDT05GSUdfUkVHVUxBVE9S
X1JUNTAzMz15CiMgQ09ORklHX1JFR1VMQVRPUl9SVDUxOTBBIGlzIG5vdCBzZXQKIyBDT05GSUdf
UkVHVUxBVE9SX1JUNTc1OSBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfUlQ2MTYwPXkKQ09O
RklHX1JFR1VMQVRPUl9SVDYyNDU9eQpDT05GSUdfUkVHVUxBVE9SX1JUUTIxMzQ9eQojIENPTkZJ
R19SRUdVTEFUT1JfUlRNVjIwIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9SVFE2NzUyPXkK
Q09ORklHX1JFR1VMQVRPUl9TTEc1MTAwMD15CiMgQ09ORklHX1JFR1VMQVRPUl9TWTc2MzZBIGlz
IG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1RQUzUxNjMyIGlzIG5vdCBzZXQKQ09ORklHX1JF
R1VMQVRPUl9UUFM2MTA1WD15CkNPTkZJR19SRUdVTEFUT1JfVFBTNjIzNjA9eQpDT05GSUdfUkVH
VUxBVE9SX1RQUzY1MDIzPXkKIyBDT05GSUdfUkVHVUxBVE9SX1RQUzY1MDdYIGlzIG5vdCBzZXQK
Q09ORklHX1JFR1VMQVRPUl9UUFM2NTA4Nj15CkNPTkZJR19SRUdVTEFUT1JfVFBTNjUwOTA9eQpD
T05GSUdfUkVHVUxBVE9SX1RQUzY1MTMyPXkKQ09ORklHX1JFR1VMQVRPUl9UUFM2NTg2WD15CkNP
TkZJR19SRUdVTEFUT1JfVFBTNjU5MTA9eQojIENPTkZJR19SRUdVTEFUT1JfVFBTNjg0NzAgaXMg
bm90IHNldApDT05GSUdfUkVHVUxBVE9SX1dNODMxWD15CiMgQ09ORklHX1JFR1VMQVRPUl9XTTgz
NTAgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfV004NDAwIGlzIG5vdCBzZXQKQ09ORklH
X1JFR1VMQVRPUl9XTTg5OTQ9eQpDT05GSUdfUkVHVUxBVE9SX1FDT01fTEFCSUJCPXkKIyBDT05G
SUdfUkNfQ09SRSBpcyBub3Qgc2V0CkNPTkZJR19DRUNfQ09SRT15CkNPTkZJR19DRUNfTk9USUZJ
RVI9eQoKIwojIENFQyBzdXBwb3J0CiMKQ09ORklHX01FRElBX0NFQ19TVVBQT1JUPXkKIyBDT05G
SUdfQ0VDX0NINzMyMiBpcyBub3Qgc2V0CkNPTkZJR19DRUNfQ1JPU19FQz15CiMgQ09ORklHX0NF
Q19TRUNPIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1BVTFNFOF9DRUMgaXMgbm90IHNldAojIENP
TkZJR19VU0JfUkFJTlNIQURPV19DRUMgaXMgbm90IHNldAojIGVuZCBvZiBDRUMgc3VwcG9ydAoK
IyBDT05GSUdfTUVESUFfU1VQUE9SVCBpcyBub3Qgc2V0CgojCiMgR3JhcGhpY3Mgc3VwcG9ydAoj
CkNPTkZJR19BUEVSVFVSRV9IRUxQRVJTPXkKIyBDT05GSUdfQUdQIGlzIG5vdCBzZXQKIyBDT05G
SUdfVkdBX1NXSVRDSEVST08gaXMgbm90IHNldApDT05GSUdfRFJNPXkKQ09ORklHX0RSTV9ERUJV
R19NTT15CiMgQ09ORklHX0RSTV9ERUJVR19TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19EUk1f
S01TX0hFTFBFUj15CkNPTkZJR19EUk1fREVCVUdfRFBfTVNUX1RPUE9MT0dZX1JFRlM9eQojIENP
TkZJR19EUk1fREVCVUdfTU9ERVNFVF9MT0NLIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9MT0FEX0VE
SURfRklSTVdBUkU9eQpDT05GSUdfRFJNX0RJU1BMQVlfSEVMUEVSPXkKQ09ORklHX0RSTV9ESVNQ
TEFZX0RQX0hFTFBFUj15CiMgQ09ORklHX0RSTV9EUF9BVVhfQ0hBUkRFViBpcyBub3Qgc2V0CkNP
TkZJR19EUk1fRFBfQ0VDPXkKQ09ORklHX0RSTV9HRU1fU0hNRU1fSEVMUEVSPXkKQ09ORklHX0RS
TV9TQ0hFRD15CgojCiMgSTJDIGVuY29kZXIgb3IgaGVscGVyIGNoaXBzCiMKQ09ORklHX0RSTV9J
MkNfQ0g3MDA2PXkKQ09ORklHX0RSTV9JMkNfU0lMMTY0PXkKIyBDT05GSUdfRFJNX0kyQ19OWFBf
VERBOTk4WCBpcyBub3Qgc2V0CkNPTkZJR19EUk1fSTJDX05YUF9UREE5OTUwPXkKIyBlbmQgb2Yg
STJDIGVuY29kZXIgb3IgaGVscGVyIGNoaXBzCgojCiMgQVJNIGRldmljZXMKIwojIGVuZCBvZiBB
Uk0gZGV2aWNlcwoKIyBDT05GSUdfRFJNX1JBREVPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9B
TURHUFUgaXMgbm90IHNldAojIENPTkZJR19EUk1fTk9VVkVBVSBpcyBub3Qgc2V0CiMgQ09ORklH
X0RSTV9JOTE1IGlzIG5vdCBzZXQKQ09ORklHX0RSTV9WR0VNPXkKQ09ORklHX0RSTV9WS01TPXkK
IyBDT05GSUdfRFJNX1ZNV0dGWCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9HTUE1MDAgaXMgbm90
IHNldAojIENPTkZJR19EUk1fQVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX01HQUcyMDAgaXMg
bm90IHNldAojIENPTkZJR19EUk1fUVhMIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9QQU5FTD15Cgoj
CiMgRGlzcGxheSBQYW5lbHMKIwojIGVuZCBvZiBEaXNwbGF5IFBhbmVscwoKQ09ORklHX0RSTV9C
UklER0U9eQpDT05GSUdfRFJNX1BBTkVMX0JSSURHRT15CgojCiMgRGlzcGxheSBJbnRlcmZhY2Ug
QnJpZGdlcwojCkNPTkZJR19EUk1fQU5BTE9HSVhfQU5YNzhYWD15CkNPTkZJR19EUk1fQU5BTE9H
SVhfRFA9eQojIGVuZCBvZiBEaXNwbGF5IEludGVyZmFjZSBCcmlkZ2VzCgpDT05GSUdfRFJNX0VU
TkFWSVY9eQojIENPTkZJR19EUk1fRVROQVZJVl9USEVSTUFMIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFJNX0JPQ0hTIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0NJUlJVU19RRU1VIGlzIG5vdCBzZXQK
Q09ORklHX0RSTV9TSU1QTEVEUk09eQojIENPTkZJR19EUk1fVkJPWFZJREVPIGlzIG5vdCBzZXQK
IyBDT05GSUdfRFJNX1NTRDEzMFggaXMgbm90IHNldApDT05GSUdfRFJNX0xFR0FDWT15CiMgQ09O
RklHX0RSTV9UREZYIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1IxMjggaXMgbm90IHNldAojIENP
TkZJR19EUk1fTUdBIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1ZJQSBpcyBub3Qgc2V0CiMgQ09O
RklHX0RSTV9TQVZBR0UgaXMgbm90IHNldApDT05GSUdfRFJNX1BBTkVMX09SSUVOVEFUSU9OX1FV
SVJLUz15CkNPTkZJR19EUk1fTk9NT0RFU0VUPXkKCiMKIyBGcmFtZSBidWZmZXIgRGV2aWNlcwoj
CkNPTkZJR19GQl9DTURMSU5FPXkKIyBDT05GSUdfRkIgaXMgbm90IHNldAojIGVuZCBvZiBGcmFt
ZSBidWZmZXIgRGV2aWNlcwoKIwojIEJhY2tsaWdodCAmIExDRCBkZXZpY2Ugc3VwcG9ydAojCkNP
TkZJR19MQ0RfQ0xBU1NfREVWSUNFPXkKQ09ORklHX0xDRF9QTEFURk9STT15CkNPTkZJR19CQUNL
TElHSFRfQ0xBU1NfREVWSUNFPXkKQ09ORklHX0JBQ0tMSUdIVF9LVEQyNTM9eQojIENPTkZJR19C
QUNLTElHSFRfTE0zNTMzIGlzIG5vdCBzZXQKQ09ORklHX0JBQ0tMSUdIVF9EQTkwM1g9eQojIENP
TkZJR19CQUNLTElHSFRfQVBQTEUgaXMgbm90IHNldApDT05GSUdfQkFDS0xJR0hUX1FDT01fV0xF
RD15CkNPTkZJR19CQUNLTElHSFRfUlQ0ODMxPXkKIyBDT05GSUdfQkFDS0xJR0hUX1NBSEFSQSBp
cyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9XTTgzMVggaXMgbm90IHNldApDT05GSUdfQkFD
S0xJR0hUX0FEUDg4NjA9eQojIENPTkZJR19CQUNLTElHSFRfQURQODg3MCBpcyBub3Qgc2V0CkNP
TkZJR19CQUNLTElHSFRfODhQTTg2MFg9eQpDT05GSUdfQkFDS0xJR0hUX0xNMzYzOT15CkNPTkZJ
R19CQUNLTElHSFRfQVMzNzExPXkKQ09ORklHX0JBQ0tMSUdIVF9HUElPPXkKIyBDT05GSUdfQkFD
S0xJR0hUX0xWNTIwN0xQIGlzIG5vdCBzZXQKQ09ORklHX0JBQ0tMSUdIVF9CRDYxMDc9eQojIENP
TkZJR19CQUNLTElHSFRfQVJDWENOTiBpcyBub3Qgc2V0CkNPTkZJR19CQUNLTElHSFRfUkFWRV9T
UD15CiMgZW5kIG9mIEJhY2tsaWdodCAmIExDRCBkZXZpY2Ugc3VwcG9ydAoKQ09ORklHX0hETUk9
eQojIGVuZCBvZiBHcmFwaGljcyBzdXBwb3J0CgojIENPTkZJR19TT1VORCBpcyBub3Qgc2V0Cgoj
CiMgSElEIHN1cHBvcnQKIwpDT05GSUdfSElEPXkKIyBDT05GSUdfSElEX0JBVFRFUllfU1RSRU5H
VEggaXMgbm90IHNldAojIENPTkZJR19ISURSQVcgaXMgbm90IHNldAojIENPTkZJR19VSElEIGlz
IG5vdCBzZXQKQ09ORklHX0hJRF9HRU5FUklDPXkKCiMKIyBTcGVjaWFsIEhJRCBkcml2ZXJzCiMK
IyBDT05GSUdfSElEX0E0VEVDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9BQ1JVWCBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJRF9BUFBMRSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9BVVJFQUwgaXMg
bm90IHNldAojIENPTkZJR19ISURfQkVMS0lOIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0NIRVJS
WSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9DT1VHQVIgaXMgbm90IHNldAojIENPTkZJR19ISURf
TUFDQUxMWSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9DTUVESUEgaXMgbm90IHNldAojIENPTkZJ
R19ISURfQ1lQUkVTUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9EUkFHT05SSVNFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX0VNU19GRiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9FTEVDT00gaXMg
bm90IHNldAojIENPTkZJR19ISURfRVpLRVkgaXMgbm90IHNldAojIENPTkZJR19ISURfR0VNQklS
RCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9HRlJNIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0dM
T1JJT1VTIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1ZJVkFMREkgaXMgbm90IHNldAojIENPTkZJ
R19ISURfS0VZVE9VQ0ggaXMgbm90IHNldAojIENPTkZJR19ISURfS1lFIGlzIG5vdCBzZXQKIyBD
T05GSUdfSElEX1dBTFRPUCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9WSUVXU09OSUMgaXMgbm90
IHNldAojIENPTkZJR19ISURfWElBT01JIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0dZUkFUSU9O
IGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0lDQURFIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0lU
RSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9KQUJSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9U
V0lOSEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0tFTlNJTkdUT04gaXMgbm90IHNldAojIENP
TkZJR19ISURfTENQT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9MRUQgaXMgbm90IHNldAoj
IENPTkZJR19ISURfTEVOT1ZPIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX01BR0lDTU9VU0UgaXMg
bm90IHNldAojIENPTkZJR19ISURfTUFMVFJPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NQVlG
TEFTSCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9SRURSQUdPTiBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9NSUNST1NPRlQgaXMgbm90IHNldAojIENPTkZJR19ISURfTU9OVEVSRVkgaXMgbm90IHNl
dAojIENPTkZJR19ISURfTVVMVElUT1VDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9OSU5URU5E
TyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9OVEkgaXMgbm90IHNldAojIENPTkZJR19ISURfT1JU
RUsgaXMgbm90IHNldAojIENPTkZJR19ISURfUEFOVEhFUkxPUkQgaXMgbm90IHNldAojIENPTkZJ
R19ISURfUEVUQUxZTlggaXMgbm90IHNldAojIENPTkZJR19ISURfUElDT0xDRCBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9QTEFOVFJPTklDUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QTEFZU1RB
VElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9SQVpFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJ
RF9QUklNQVggaXMgbm90IHNldAojIENPTkZJR19ISURfU0FJVEVLIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX1NFTUlURUsgaXMgbm90IHNldAojIENPTkZJR19ISURfU1BFRURMSU5LIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX1NURUFNIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NURUVMU0VSSUVT
IGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NVTlBMVVMgaXMgbm90IHNldAojIENPTkZJR19ISURf
Uk1JIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0dSRUVOQVNJQSBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9TTUFSVEpPWVBMVVMgaXMgbm90IHNldAojIENPTkZJR19ISURfVElWTyBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9UT1BTRUVEIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1RISU5HTSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hJRF9VRFJBV19QUzMgaXMgbm90IHNldAojIENPTkZJR19ISURfV0lJ
TU9URSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9YSU5NTyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJ
RF9aRVJPUExVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9aWURBQ1JPTiBpcyBub3Qgc2V0CiMg
Q09ORklHX0hJRF9TRU5TT1JfSFVCIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0FMUFMgaXMgbm90
IHNldAojIGVuZCBvZiBTcGVjaWFsIEhJRCBkcml2ZXJzCgojCiMgSTJDIEhJRCBzdXBwb3J0CiMK
IyBDT05GSUdfSTJDX0hJRF9BQ1BJIGlzIG5vdCBzZXQKIyBlbmQgb2YgSTJDIEhJRCBzdXBwb3J0
CgojCiMgSW50ZWwgSVNIIEhJRCBzdXBwb3J0CiMKIyBDT05GSUdfSU5URUxfSVNIX0hJRCBpcyBu
b3Qgc2V0CiMgZW5kIG9mIEludGVsIElTSCBISUQgc3VwcG9ydAoKIwojIEFNRCBTRkggSElEIFN1
cHBvcnQKIwojIENPTkZJR19BTURfU0ZIX0hJRCBpcyBub3Qgc2V0CiMgZW5kIG9mIEFNRCBTRkgg
SElEIFN1cHBvcnQKCiMKIyBTdXJmYWNlIFN5c3RlbSBBZ2dyZWdhdG9yIE1vZHVsZSBISUQgc3Vw
cG9ydAojCiMgQ09ORklHX1NVUkZBQ0VfS0JEIGlzIG5vdCBzZXQKIyBlbmQgb2YgU3VyZmFjZSBT
eXN0ZW0gQWdncmVnYXRvciBNb2R1bGUgSElEIHN1cHBvcnQKIyBlbmQgb2YgSElEIHN1cHBvcnQK
CkNPTkZJR19VU0JfT0hDSV9MSVRUTEVfRU5ESUFOPXkKQ09ORklHX1VTQl9TVVBQT1JUPXkKQ09O
RklHX1VTQl9DT01NT049eQojIENPTkZJR19VU0JfTEVEX1RSSUcgaXMgbm90IHNldApDT05GSUdf
VVNCX1VMUElfQlVTPXkKQ09ORklHX1VTQl9DT05OX0dQSU89eQpDT05GSUdfVVNCX0FSQ0hfSEFT
X0hDRD15CiMgQ09ORklHX1VTQiBpcyBub3Qgc2V0CkNPTkZJR19VU0JfUENJPXkKQ09ORklHX1VT
Ql9DRE5TX1NVUFBPUlQ9eQojIENPTkZJR19VU0JfQ0ROUzMgaXMgbm90IHNldAojIENPTkZJR19V
U0JfQ0ROU1BfUENJIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9NVVNCX0hEUkM9eQpDT05GSUdfVVNC
X01VU0JfR0FER0VUPXkKCiMKIyBQbGF0Zm9ybSBHbHVlIExheWVyCiMKCiMKIyBNVVNCIERNQSBt
b2RlCiMKIyBDT05GSUdfTVVTQl9QSU9fT05MWSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfRFdDMz15
CkNPTkZJR19VU0JfRFdDM19VTFBJPXkKQ09ORklHX1VTQl9EV0MzX0dBREdFVD15CgojCiMgUGxh
dGZvcm0gR2x1ZSBEcml2ZXIgU3VwcG9ydAojCkNPTkZJR19VU0JfRFdDM19QQ0k9eQpDT05GSUdf
VVNCX0RXQzNfSEFQUz15CkNPTkZJR19VU0JfRFdDMj15CgojCiMgR2FkZ2V0L0R1YWwtcm9sZSBt
b2RlIHJlcXVpcmVzIFVTQiBHYWRnZXQgc3VwcG9ydCB0byBiZSBlbmFibGVkCiMKQ09ORklHX1VT
Ql9EV0MyX1BFUklQSEVSQUw9eQojIENPTkZJR19VU0JfRFdDMl9QQ0kgaXMgbm90IHNldApDT05G
SUdfVVNCX0RXQzJfREVCVUc9eQojIENPTkZJR19VU0JfRFdDMl9WRVJCT1NFIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX0RXQzJfVFJBQ0tfTUlTU0VEX1NPRlMgaXMgbm90IHNldAojIENPTkZJR19V
U0JfRFdDMl9ERUJVR19QRVJJT0RJQyBpcyBub3Qgc2V0CkNPTkZJR19VU0JfQ0hJUElERUE9eQpD
T05GSUdfVVNCX0NISVBJREVBX1VEQz15CkNPTkZJR19VU0JfQ0hJUElERUFfUENJPXkKQ09ORklH
X1VTQl9DSElQSURFQV9NU009eQpDT05GSUdfVVNCX0NISVBJREVBX0dFTkVSSUM9eQpDT05GSUdf
VVNCX0lTUDE3NjA9eQpDT05GSUdfVVNCX0lTUDE3NjFfVURDPXkKQ09ORklHX1VTQl9JU1AxNzYw
X0dBREdFVF9ST0xFPXkKCiMKIyBVU0IgcG9ydCBkcml2ZXJzCiMKCiMKIyBVU0IgUGh5c2ljYWwg
TGF5ZXIgZHJpdmVycwojCkNPTkZJR19VU0JfUEhZPXkKQ09ORklHX05PUF9VU0JfWENFSVY9eQpD
T05GSUdfVVNCX0dQSU9fVkJVUz15CkNPTkZJR19UQUhWT19VU0I9eQojIENPTkZJR19UQUhWT19V
U0JfSE9TVF9CWV9ERUZBVUxUIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9JU1AxMzAxPXkKIyBlbmQg
b2YgVVNCIFBoeXNpY2FsIExheWVyIGRyaXZlcnMKCkNPTkZJR19VU0JfR0FER0VUPXkKIyBDT05G
SUdfVVNCX0dBREdFVF9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9HQURHRVRfREVCVUdf
RklMRVMgaXMgbm90IHNldApDT05GSUdfVVNCX0dBREdFVF9ERUJVR19GUz15CkNPTkZJR19VU0Jf
R0FER0VUX1ZCVVNfRFJBVz0yCkNPTkZJR19VU0JfR0FER0VUX1NUT1JBR0VfTlVNX0JVRkZFUlM9
MgoKIwojIFVTQiBQZXJpcGhlcmFsIENvbnRyb2xsZXIKIwojIENPTkZJR19VU0JfRk9URzIxMF9V
REMgaXMgbm90IHNldApDT05GSUdfVVNCX0dSX1VEQz15CiMgQ09ORklHX1VTQl9SOEE2NjU5NyBp
cyBub3Qgc2V0CkNPTkZJR19VU0JfUFhBMjdYPXkKQ09ORklHX1VTQl9NVl9VREM9eQpDT05GSUdf
VVNCX01WX1UzRD15CkNPTkZJR19VU0JfTTY2NTkyPXkKQ09ORklHX1VTQl9CRENfVURDPXkKIyBD
T05GSUdfVVNCX0FNRDU1MzZVREMgaXMgbm90IHNldApDT05GSUdfVVNCX05FVDIyNzI9eQojIENP
TkZJR19VU0JfTkVUMjI3Ml9ETUEgaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVUMjI4MCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9HT0tVIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0VHMjBUIGlz
IG5vdCBzZXQKIyBlbmQgb2YgVVNCIFBlcmlwaGVyYWwgQ29udHJvbGxlcgoKQ09ORklHX1VTQl9M
SUJDT01QT1NJVEU9eQpDT05GSUdfVVNCX0ZfRlM9eQpDT05GSUdfVVNCX0ZfSElEPXkKQ09ORklH
X1VTQl9GX1BSSU5URVI9eQojIENPTkZJR19VU0JfQ09ORklHRlMgaXMgbm90IHNldAoKIwojIFVT
QiBHYWRnZXQgcHJlY29tcG9zZWQgY29uZmlndXJhdGlvbnMKIwojIENPTkZJR19VU0JfWkVSTyBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9FVEggaXMgbm90IHNldAojIENPTkZJR19VU0JfR19OQ00g
aXMgbm90IHNldAojIENPTkZJR19VU0JfR0FER0VURlMgaXMgbm90IHNldApDT05GSUdfVVNCX0ZV
TkNUSU9ORlM9eQojIENPTkZJR19VU0JfRlVOQ1RJT05GU19FVEggaXMgbm90IHNldAojIENPTkZJ
R19VU0JfRlVOQ1RJT05GU19STkRJUyBpcyBub3Qgc2V0CkNPTkZJR19VU0JfRlVOQ1RJT05GU19H
RU5FUklDPXkKIyBDT05GSUdfVVNCX0dfU0VSSUFMIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9HX1BS
SU5URVI9eQojIENPTkZJR19VU0JfQ0RDX0NPTVBPU0lURSBpcyBub3Qgc2V0CkNPTkZJR19VU0Jf
R19ISUQ9eQojIENPTkZJR19VU0JfR19EQkdQIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9SQVdfR0FE
R0VUPXkKIyBlbmQgb2YgVVNCIEdhZGdldCBwcmVjb21wb3NlZCBjb25maWd1cmF0aW9ucwoKIyBD
T05GSUdfVFlQRUMgaXMgbm90IHNldApDT05GSUdfVVNCX1JPTEVfU1dJVENIPXkKQ09ORklHX1VT
Ql9ST0xFU19JTlRFTF9YSENJPXkKQ09ORklHX01NQz15CiMgQ09ORklHX1NESU9fVUFSVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX01NQ19URVNUIGlzIG5vdCBzZXQKCiMKIyBNTUMvU0QvU0RJTyBIb3N0
IENvbnRyb2xsZXIgRHJpdmVycwojCiMgQ09ORklHX01NQ19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJ
R19NTUNfU0RIQ0k9eQojIENPTkZJR19NTUNfU0RIQ0lfUENJIGlzIG5vdCBzZXQKIyBDT05GSUdf
TU1DX1NESENJX0FDUEkgaXMgbm90IHNldApDT05GSUdfTU1DX1NESENJX1BMVEZNPXkKQ09ORklH
X01NQ19TREhDSV9GX1NESDMwPXkKIyBDT05GSUdfTU1DX1RJRk1fU0QgaXMgbm90IHNldAojIENP
TkZJR19NTUNfQ0I3MTAgaXMgbm90IHNldAojIENPTkZJR19NTUNfVklBX1NETU1DIGlzIG5vdCBz
ZXQKQ09ORklHX01NQ19VU0RISTZST0wwPXkKQ09ORklHX01NQ19DUUhDST15CiMgQ09ORklHX01N
Q19IU1EgaXMgbm90IHNldAojIENPTkZJR19NTUNfVE9TSElCQV9QQ0kgaXMgbm90IHNldAojIENP
TkZJR19NTUNfTVRLIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX1NESENJX1hFTk9OIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUVNU1RJQ0sgaXMgbm90IHNldApDT05GSUdfTkVXX0xFRFM9eQpDT05GSUdf
TEVEU19DTEFTUz15CkNPTkZJR19MRURTX0NMQVNTX0ZMQVNIPXkKQ09ORklHX0xFRFNfQ0xBU1Nf
TVVMVElDT0xPUj15CkNPTkZJR19MRURTX0JSSUdIVE5FU1NfSFdfQ0hBTkdFRD15CgojCiMgTEVE
IGRyaXZlcnMKIwpDT05GSUdfTEVEU184OFBNODYwWD15CiMgQ09ORklHX0xFRFNfQVBVIGlzIG5v
dCBzZXQKQ09ORklHX0xFRFNfTE0zNTMwPXkKQ09ORklHX0xFRFNfTE0zNTMyPXkKQ09ORklHX0xF
RFNfTE0zNTMzPXkKIyBDT05GSUdfTEVEU19MTTM2NDIgaXMgbm90IHNldApDT05GSUdfTEVEU19N
VDYzMjM9eQojIENPTkZJR19MRURTX1BDQTk1MzIgaXMgbm90IHNldApDT05GSUdfTEVEU19HUElP
PXkKQ09ORklHX0xFRFNfTFAzOTQ0PXkKIyBDT05GSUdfTEVEU19MUDM5NTIgaXMgbm90IHNldApD
T05GSUdfTEVEU19MUDUwWFg9eQojIENPTkZJR19MRURTX0xQODc4OCBpcyBub3Qgc2V0CkNPTkZJ
R19MRURTX1BDQTk1NVg9eQpDT05GSUdfTEVEU19QQ0E5NTVYX0dQSU89eQojIENPTkZJR19MRURT
X1BDQTk2M1ggaXMgbm90IHNldApDT05GSUdfTEVEU19XTTgzMVhfU1RBVFVTPXkKQ09ORklHX0xF
RFNfV004MzUwPXkKIyBDT05GSUdfTEVEU19EQTkwM1ggaXMgbm90IHNldApDT05GSUdfTEVEU19S
RUdVTEFUT1I9eQpDT05GSUdfTEVEU19CRDI4MDI9eQojIENPTkZJR19MRURTX0lOVEVMX1NTNDIw
MCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0xUMzU5Mz15CiMgQ09ORklHX0xFRFNfTUMxMzc4MyBp
cyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVENBNjUwNyBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RM
QzU5MVhYPXkKQ09ORklHX0xFRFNfTUFYODk5Nz15CkNPTkZJR19MRURTX0xNMzU1eD15CiMgQ09O
RklHX0xFRFNfSVMzMUZMMzE5WCBpcyBub3Qgc2V0CgojCiMgTEVEIGRyaXZlciBmb3IgYmxpbmso
MSkgVVNCIFJHQiBMRUQgaXMgdW5kZXIgU3BlY2lhbCBISUQgZHJpdmVycyAoSElEX1RISU5HTSkK
IwpDT05GSUdfTEVEU19CTElOS009eQojIENPTkZJR19MRURTX01MWENQTEQgaXMgbm90IHNldApD
T05GSUdfTEVEU19NTFhSRUc9eQpDT05GSUdfTEVEU19VU0VSPXkKQ09ORklHX0xFRFNfTklDNzhC
WD15CkNPTkZJR19MRURTX1RJX0xNVV9DT01NT049eQojIENPTkZJR19MRURTX0xNMzYyNzQgaXMg
bm90IHNldAojIENPTkZJR19MRURTX1RQUzYxMDVYIGlzIG5vdCBzZXQKCiMKIyBGbGFzaCBhbmQg
VG9yY2ggTEVEIGRyaXZlcnMKIwpDT05GSUdfTEVEU19BUzM2NDVBPXkKQ09ORklHX0xFRFNfTE0z
NjAxWD15CkNPTkZJR19MRURTX1JUODUxNT15CkNPTkZJR19MRURTX1NHTTMxNDA9eQoKIwojIFJH
QiBMRUQgZHJpdmVycwojCgojCiMgTEVEIFRyaWdnZXJzCiMKQ09ORklHX0xFRFNfVFJJR0dFUlM9
eQpDT05GSUdfTEVEU19UUklHR0VSX1RJTUVSPXkKQ09ORklHX0xFRFNfVFJJR0dFUl9PTkVTSE9U
PXkKIyBDT05GSUdfTEVEU19UUklHR0VSX01URCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RSSUdH
RVJfSEVBUlRCRUFUPXkKQ09ORklHX0xFRFNfVFJJR0dFUl9CQUNLTElHSFQ9eQojIENPTkZJR19M
RURTX1RSSUdHRVJfQ1BVIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfVFJJR0dFUl9BQ1RJVklUWT15
CkNPTkZJR19MRURTX1RSSUdHRVJfR1BJTz15CkNPTkZJR19MRURTX1RSSUdHRVJfREVGQVVMVF9P
Tj15CgojCiMgaXB0YWJsZXMgdHJpZ2dlciBpcyB1bmRlciBOZXRmaWx0ZXIgY29uZmlnIChMRUQg
dGFyZ2V0KQojCkNPTkZJR19MRURTX1RSSUdHRVJfVFJBTlNJRU5UPXkKQ09ORklHX0xFRFNfVFJJ
R0dFUl9DQU1FUkE9eQojIENPTkZJR19MRURTX1RSSUdHRVJfUEFOSUMgaXMgbm90IHNldAojIENP
TkZJR19MRURTX1RSSUdHRVJfTkVUREVWIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VS
X1BBVFRFUk4gaXMgbm90IHNldApDT05GSUdfTEVEU19UUklHR0VSX0FVRElPPXkKIyBDT05GSUdf
TEVEU19UUklHR0VSX1RUWSBpcyBub3Qgc2V0CgojCiMgU2ltcGxlIExFRCBkcml2ZXJzCiMKIyBD
T05GSUdfQUNDRVNTSUJJTElUWSBpcyBub3Qgc2V0CiMgQ09ORklHX0lORklOSUJBTkQgaXMgbm90
IHNldApDT05GSUdfRURBQ19BVE9NSUNfU0NSVUI9eQpDT05GSUdfRURBQ19TVVBQT1JUPXkKQ09O
RklHX0VEQUM9eQojIENPTkZJR19FREFDX0xFR0FDWV9TWVNGUyBpcyBub3Qgc2V0CkNPTkZJR19F
REFDX0RFQlVHPXkKQ09ORklHX0VEQUNfR0hFUz15CiMgQ09ORklHX0VEQUNfRTc1MlggaXMgbm90
IHNldAojIENPTkZJR19FREFDX0k4Mjk3NVggaXMgbm90IHNldAojIENPTkZJR19FREFDX0kzMDAw
IGlzIG5vdCBzZXQKIyBDT05GSUdfRURBQ19JMzIwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0VEQUNf
SUUzMTIwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0VEQUNfWDM4IGlzIG5vdCBzZXQKIyBDT05GSUdf
RURBQ19JNTQwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0VEQUNfSTUwMDAgaXMgbm90IHNldAojIENP
TkZJR19FREFDX0k1MTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfRURBQ19JNzMwMCBpcyBub3Qgc2V0
CkNPTkZJR19SVENfTElCPXkKQ09ORklHX1JUQ19NQzE0NjgxOF9MSUI9eQpDT05GSUdfUlRDX0NM
QVNTPXkKQ09ORklHX1JUQ19IQ1RPU1lTPXkKQ09ORklHX1JUQ19IQ1RPU1lTX0RFVklDRT0icnRj
MCIKQ09ORklHX1JUQ19TWVNUT0hDPXkKQ09ORklHX1JUQ19TWVNUT0hDX0RFVklDRT0icnRjMCIK
Q09ORklHX1JUQ19ERUJVRz15CiMgQ09ORklHX1JUQ19OVk1FTSBpcyBub3Qgc2V0CgojCiMgUlRD
IGludGVyZmFjZXMKIwpDT05GSUdfUlRDX0lOVEZfU1lTRlM9eQpDT05GSUdfUlRDX0lOVEZfUFJP
Qz15CiMgQ09ORklHX1JUQ19JTlRGX0RFViBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfVEVT
VCBpcyBub3Qgc2V0CgojCiMgSTJDIFJUQyBkcml2ZXJzCiMKQ09ORklHX1JUQ19EUlZfODhQTTg2
MFg9eQpDT05GSUdfUlRDX0RSVl9BQkI1WkVTMz15CkNPTkZJR19SVENfRFJWX0FCRU9aOT15CkNP
TkZJR19SVENfRFJWX0FCWDgwWD15CkNPTkZJR19SVENfRFJWX0RTMTMwNz15CiMgQ09ORklHX1JU
Q19EUlZfRFMxMzA3X0NFTlRVUlkgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9EUzEzNzQ9eQpD
T05GSUdfUlRDX0RSVl9EUzE2NzI9eQojIENPTkZJR19SVENfRFJWX0xQODc4OCBpcyBub3Qgc2V0
CiMgQ09ORklHX1JUQ19EUlZfTUFYNjkwMCBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX01BWDg5
MDc9eQpDT05GSUdfUlRDX0RSVl9NQVg4OTk3PXkKQ09ORklHX1JUQ19EUlZfUlM1QzM3Mj15CkNP
TkZJR19SVENfRFJWX0lTTDEyMDg9eQojIENPTkZJR19SVENfRFJWX0lTTDEyMDIyIGlzIG5vdCBz
ZXQKQ09ORklHX1JUQ19EUlZfWDEyMDU9eQpDT05GSUdfUlRDX0RSVl9QQ0Y4NTIzPXkKIyBDT05G
SUdfUlRDX0RSVl9QQ0Y4NTA2MyBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX1BDRjg1MzYzPXkK
Q09ORklHX1JUQ19EUlZfUENGODU2Mz15CkNPTkZJR19SVENfRFJWX1BDRjg1ODM9eQpDT05GSUdf
UlRDX0RSVl9NNDFUODA9eQpDT05GSUdfUlRDX0RSVl9NNDFUODBfV0RUPXkKQ09ORklHX1JUQ19E
UlZfQlEzMks9eQojIENPTkZJR19SVENfRFJWX1BBTE1BUyBpcyBub3Qgc2V0CkNPTkZJR19SVENf
RFJWX1RQUzY1ODZYPXkKIyBDT05GSUdfUlRDX0RSVl9UUFM2NTkxMCBpcyBub3Qgc2V0CkNPTkZJ
R19SVENfRFJWX1MzNTM5MEE9eQojIENPTkZJR19SVENfRFJWX0ZNMzEzMCBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUQ19EUlZfUlg4MDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SWDg1ODEg
aXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JYODAyNSBpcyBub3Qgc2V0CkNPTkZJR19SVENf
RFJWX0VNMzAyNz15CkNPTkZJR19SVENfRFJWX1JWMzAyOD15CiMgQ09ORklHX1JUQ19EUlZfUlYz
MDMyIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SVjg4MDMgaXMgbm90IHNldAojIENPTkZJ
R19SVENfRFJWX1NEMzA3OCBpcyBub3Qgc2V0CgojCiMgU1BJIFJUQyBkcml2ZXJzCiMKQ09ORklH
X1JUQ19JMkNfQU5EX1NQST15CgojCiMgU1BJIGFuZCBJMkMgUlRDIGRyaXZlcnMKIwpDT05GSUdf
UlRDX0RSVl9EUzMyMzI9eQpDT05GSUdfUlRDX0RSVl9EUzMyMzJfSFdNT049eQojIENPTkZJR19S
VENfRFJWX1BDRjIxMjcgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9SVjMwMjlDMj15CkNPTkZJ
R19SVENfRFJWX1JWMzAyOV9IV01PTj15CiMgQ09ORklHX1JUQ19EUlZfUlg2MTEwIGlzIG5vdCBz
ZXQKCiMKIyBQbGF0Zm9ybSBSVEMgZHJpdmVycwojCkNPTkZJR19SVENfRFJWX0NNT1M9eQpDT05G
SUdfUlRDX0RSVl9EUzEyODY9eQpDT05GSUdfUlRDX0RSVl9EUzE1MTE9eQpDT05GSUdfUlRDX0RS
Vl9EUzE1NTM9eQpDT05GSUdfUlRDX0RSVl9EUzE2ODVfRkFNSUxZPXkKIyBDT05GSUdfUlRDX0RS
Vl9EUzE2ODUgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTY4OSBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUQ19EUlZfRFMxNzI4NSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxNzQ4
NSBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX0RTMTc4ODU9eQpDT05GSUdfUlRDX0RSVl9EUzE3
NDI9eQpDT05GSUdfUlRDX0RSVl9EUzI0MDQ9eQojIENPTkZJR19SVENfRFJWX0RBOTA1NSBpcyBu
b3Qgc2V0CkNPTkZJR19SVENfRFJWX0RBOTA2Mz15CkNPTkZJR19SVENfRFJWX1NUSzE3VEE4PXkK
IyBDT05GSUdfUlRDX0RSVl9NNDhUODYgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9NNDhUMzU9
eQpDT05GSUdfUlRDX0RSVl9NNDhUNTk9eQojIENPTkZJR19SVENfRFJWX01TTTYyNDIgaXMgbm90
IHNldApDT05GSUdfUlRDX0RSVl9CUTQ4MDI9eQojIENPTkZJR19SVENfRFJWX1JQNUMwMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfVjMwMjAgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJW
X1dNODMxWCBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX1dNODM1MD15CiMgQ09ORklHX1JUQ19E
UlZfQ1JPU19FQyBpcyBub3Qgc2V0CgojCiMgb24tQ1BVIFJUQyBkcml2ZXJzCiMKQ09ORklHX1JU
Q19EUlZfRlRSVEMwMTA9eQpDT05GSUdfUlRDX0RSVl9NQzEzWFhYPXkKIyBDT05GSUdfUlRDX0RS
Vl9NVDYzOTcgaXMgbm90IHNldAoKIwojIEhJRCBTZW5zb3IgUlRDIGRyaXZlcnMKIwpDT05GSUdf
UlRDX0RSVl9HT0xERklTSD15CkNPTkZJR19ETUFERVZJQ0VTPXkKIyBDT05GSUdfRE1BREVWSUNF
U19ERUJVRyBpcyBub3Qgc2V0CgojCiMgRE1BIERldmljZXMKIwpDT05GSUdfRE1BX0VOR0lORT15
CkNPTkZJR19ETUFfVklSVFVBTF9DSEFOTkVMUz15CkNPTkZJR19ETUFfQUNQST15CiMgQ09ORklH
X0FMVEVSQV9NU0dETUEgaXMgbm90IHNldApDT05GSUdfSU5URUxfSURNQTY0PXkKIyBDT05GSUdf
SU5URUxfSURYRF9DT01QQVQgaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9JT0FURE1BIGlzIG5v
dCBzZXQKIyBDT05GSUdfUExYX0RNQSBpcyBub3Qgc2V0CiMgQ09ORklHX0FNRF9QVERNQSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1FDT01fSElETUFfTUdNVCBpcyBub3Qgc2V0CiMgQ09ORklHX1FDT01f
SElETUEgaXMgbm90IHNldApDT05GSUdfRFdfRE1BQ19DT1JFPXkKQ09ORklHX0RXX0RNQUM9eQoj
IENPTkZJR19EV19ETUFDX1BDSSBpcyBub3Qgc2V0CkNPTkZJR19IU1VfRE1BPXkKIyBDT05GSUdf
U0ZfUERNQSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX0xETUEgaXMgbm90IHNldAoKIwojIERN
QSBDbGllbnRzCiMKQ09ORklHX0FTWU5DX1RYX0RNQT15CkNPTkZJR19ETUFURVNUPXkKQ09ORklH
X0RNQV9FTkdJTkVfUkFJRD15CgojCiMgRE1BQlVGIG9wdGlvbnMKIwpDT05GSUdfU1lOQ19GSUxF
PXkKIyBDT05GSUdfU1dfU1lOQyBpcyBub3Qgc2V0CkNPTkZJR19VRE1BQlVGPXkKIyBDT05GSUdf
RE1BQlVGX01PVkVfTk9USUZZIGlzIG5vdCBzZXQKQ09ORklHX0RNQUJVRl9ERUJVRz15CiMgQ09O
RklHX0RNQUJVRl9TRUxGVEVTVFMgaXMgbm90IHNldApDT05GSUdfRE1BQlVGX0hFQVBTPXkKQ09O
RklHX0RNQUJVRl9TWVNGU19TVEFUUz15CkNPTkZJR19ETUFCVUZfSEVBUFNfU1lTVEVNPXkKQ09O
RklHX0RNQUJVRl9IRUFQU19DTUE9eQojIGVuZCBvZiBETUFCVUYgb3B0aW9ucwoKQ09ORklHX0FV
WERJU1BMQVk9eQpDT05GSUdfQ0hBUkxDRD15CkNPTkZJR19MSU5FRElTUD15CkNPTkZJR19IRDQ0
NzgwX0NPTU1PTj15CkNPTkZJR19IRDQ0NzgwPXkKQ09ORklHX0lNR19BU0NJSV9MQ0Q9eQpDT05G
SUdfTENEMlM9eQpDT05GSUdfUEFSUE9SVF9QQU5FTD15CkNPTkZJR19QQU5FTF9QQVJQT1JUPTAK
Q09ORklHX1BBTkVMX1BST0ZJTEU9NQpDT05GSUdfUEFORUxfQ0hBTkdFX01FU1NBR0U9eQpDT05G
SUdfUEFORUxfQk9PVF9NRVNTQUdFPSIiCkNPTkZJR19DSEFSTENEX0JMX09GRj15CiMgQ09ORklH
X0NIQVJMQ0RfQkxfT04gaXMgbm90IHNldAojIENPTkZJR19DSEFSTENEX0JMX0ZMQVNIIGlzIG5v
dCBzZXQKQ09ORklHX1BBTkVMPXkKIyBDT05GSUdfVUlPIGlzIG5vdCBzZXQKIyBDT05GSUdfVkZJ
TyBpcyBub3Qgc2V0CkNPTkZJR19WSVJUX0RSSVZFUlM9eQpDT05GSUdfVk1HRU5JRD15CiMgQ09O
RklHX1ZCT1hHVUVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0VGSV9TRUNSRVQgaXMgbm90IHNldApD
T05GSUdfVklSVElPX0FOQ0hPUj15CkNPTkZJR19WSVJUSU89eQojIENPTkZJR19WSVJUSU9fTUVO
VSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZEUEEgaXMgbm90IHNldApDT05GSUdfVkhPU1RfTUVOVT15
CiMgQ09ORklHX1ZIT1NUX05FVCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZIT1NUX0NST1NTX0VORElB
Tl9MRUdBQ1kgaXMgbm90IHNldAoKIwojIE1pY3Jvc29mdCBIeXBlci1WIGd1ZXN0IHN1cHBvcnQK
IwojIENPTkZJR19IWVBFUlYgaXMgbm90IHNldAojIGVuZCBvZiBNaWNyb3NvZnQgSHlwZXItViBn
dWVzdCBzdXBwb3J0CgojIENPTkZJR19HUkVZQlVTIGlzIG5vdCBzZXQKQ09ORklHX0NPTUVEST15
CkNPTkZJR19DT01FRElfREVCVUc9eQpDT05GSUdfQ09NRURJX0RFRkFVTFRfQlVGX1NJWkVfS0I9
MjA0OApDT05GSUdfQ09NRURJX0RFRkFVTFRfQlVGX01BWFNJWkVfS0I9MjA0ODAKIyBDT05GSUdf
Q09NRURJX01JU0NfRFJJVkVSUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTUVESV9JU0FfRFJJVkVS
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTUVESV9QQ0lfRFJJVkVSUyBpcyBub3Qgc2V0CkNPTkZJ
R19DT01FRElfODI1NT15CkNPTkZJR19DT01FRElfODI1NV9TQT15CiMgQ09ORklHX0NPTUVESV9L
Q09NRURJTElCIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NRURJX1RFU1RTIGlzIG5vdCBzZXQKQ09O
RklHX1NUQUdJTkc9eQojIENPTkZJR19SVExMSUIgaXMgbm90IHNldAoKIwojIElJTyBzdGFnaW5n
IGRyaXZlcnMKIwoKIwojIEFjY2VsZXJvbWV0ZXJzCiMKIyBlbmQgb2YgQWNjZWxlcm9tZXRlcnMK
CiMKIyBBbmFsb2cgdG8gZGlnaXRhbCBjb252ZXJ0ZXJzCiMKIyBlbmQgb2YgQW5hbG9nIHRvIGRp
Z2l0YWwgY29udmVydGVycwoKIwojIEFuYWxvZyBkaWdpdGFsIGJpLWRpcmVjdGlvbiBjb252ZXJ0
ZXJzCiMKIyBDT05GSUdfQURUNzMxNiBpcyBub3Qgc2V0CiMgZW5kIG9mIEFuYWxvZyBkaWdpdGFs
IGJpLWRpcmVjdGlvbiBjb252ZXJ0ZXJzCgojCiMgQ2FwYWNpdGFuY2UgdG8gZGlnaXRhbCBjb252
ZXJ0ZXJzCiMKQ09ORklHX0FENzc0Nj15CiMgZW5kIG9mIENhcGFjaXRhbmNlIHRvIGRpZ2l0YWwg
Y29udmVydGVycwoKIwojIERpcmVjdCBEaWdpdGFsIFN5bnRoZXNpcwojCiMgZW5kIG9mIERpcmVj
dCBEaWdpdGFsIFN5bnRoZXNpcwoKIwojIE5ldHdvcmsgQW5hbHl6ZXIsIEltcGVkYW5jZSBDb252
ZXJ0ZXJzCiMKIyBDT05GSUdfQUQ1OTMzIGlzIG5vdCBzZXQKIyBlbmQgb2YgTmV0d29yayBBbmFs
eXplciwgSW1wZWRhbmNlIENvbnZlcnRlcnMKCiMKIyBBY3RpdmUgZW5lcmd5IG1ldGVyaW5nIElD
CiMKQ09ORklHX0FERTc4NTQ9eQpDT05GSUdfQURFNzg1NF9JMkM9eQojIGVuZCBvZiBBY3RpdmUg
ZW5lcmd5IG1ldGVyaW5nIElDCgojCiMgUmVzb2x2ZXIgdG8gZGlnaXRhbCBjb252ZXJ0ZXJzCiMK
IyBlbmQgb2YgUmVzb2x2ZXIgdG8gZGlnaXRhbCBjb252ZXJ0ZXJzCiMgZW5kIG9mIElJTyBzdGFn
aW5nIGRyaXZlcnMKCiMgQ09ORklHX1NUQUdJTkdfTUVESUEgaXMgbm90IHNldAojIENPTkZJR19N
T1NUX0NPTVBPTkVOVFMgaXMgbm90IHNldAojIENPTkZJR19LUzcwMTAgaXMgbm90IHNldApDT05G
SUdfRklFTERCVVNfREVWPXkKIyBDT05GSUdfUUxHRSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZNRV9C
VVMgaXMgbm90IHNldApDT05GSUdfQ0hST01FX1BMQVRGT1JNUz15CiMgQ09ORklHX0NIUk9NRU9T
X0FDUEkgaXMgbm90IHNldAojIENPTkZJR19DSFJPTUVPU19MQVBUT1AgaXMgbm90IHNldApDT05G
SUdfQ0hST01FT1NfUFNUT1JFPXkKIyBDT05GSUdfQ0hST01FT1NfVEJNQyBpcyBub3Qgc2V0CkNP
TkZJR19DUk9TX0VDPXkKIyBDT05GSUdfQ1JPU19FQ19JMkMgaXMgbm90IHNldAojIENPTkZJR19D
Uk9TX0VDX0xQQyBpcyBub3Qgc2V0CkNPTkZJR19DUk9TX0VDX1BST1RPPXkKQ09ORklHX0NST1Nf
S0JEX0xFRF9CQUNLTElHSFQ9eQojIENPTkZJR19DSFJPTUVPU19QUklWQUNZX1NDUkVFTiBpcyBu
b3Qgc2V0CkNPTkZJR19NRUxMQU5PWF9QTEFURk9STT15CkNPTkZJR19NTFhSRUdfSE9UUExVRz15
CkNPTkZJR19NTFhSRUdfSU89eQpDT05GSUdfTUxYUkVHX0xDPXkKIyBDT05GSUdfTlZTV19TTjIy
MDEgaXMgbm90IHNldApDT05GSUdfU1VSRkFDRV9QTEFURk9STVM9eQpDT05GSUdfU1VSRkFDRV8z
X1BPV0VSX09QUkVHSU9OPXkKQ09ORklHX1NVUkZBQ0VfQUNQSV9OT1RJRlk9eQpDT05GSUdfU1VS
RkFDRV9BR0dSRUdBVE9SX0NERVY9eQojIENPTkZJR19TVVJGQUNFX0RUWCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NVUkZBQ0VfR1BFIGlzIG5vdCBzZXQKQ09ORklHX1NVUkZBQ0VfSE9UUExVRz15CiMg
Q09ORklHX1NVUkZBQ0VfUFJPM19CVVRUT04gaXMgbm90IHNldApDT05GSUdfU1VSRkFDRV9BR0dS
RUdBVE9SPXkKIyBDT05GSUdfU1VSRkFDRV9BR0dSRUdBVE9SX0JVUyBpcyBub3Qgc2V0CkNPTkZJ
R19YODZfUExBVEZPUk1fREVWSUNFUz15CiMgQ09ORklHX0FDUElfV01JIGlzIG5vdCBzZXQKIyBD
T05GSUdfQUNFUl9XSVJFTEVTUyBpcyBub3Qgc2V0CiMgQ09ORklHX0FNRF9QTUMgaXMgbm90IHNl
dAojIENPTkZJR19BRFZfU1dCVVRUT04gaXMgbm90IHNldAojIENPTkZJR19BUFBMRV9HTVVYIGlz
IG5vdCBzZXQKIyBDT05GSUdfQVNVU19MQVBUT1AgaXMgbm90IHNldAojIENPTkZJR19BU1VTX1dJ
UkVMRVNTIGlzIG5vdCBzZXQKIyBDT05GSUdfQVNVU19URjEwM0NfRE9DSyBpcyBub3Qgc2V0CkNP
TkZJR19YODZfUExBVEZPUk1fRFJJVkVSU19ERUxMPXkKQ09ORklHX0RDREJBUz15CkNPTkZJR19E
RUxMX0xBUFRPUD1tCkNPTkZJR19ERUxMX1JCVT15CkNPTkZJR19ERUxMX1NNQklPUz15CiMgQ09O
RklHX0RFTExfU01CSU9TX1NNTSBpcyBub3Qgc2V0CkNPTkZJR19ERUxMX1NNTzg4MDA9eQojIENP
TkZJR19GVUpJVFNVX0xBUFRPUCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZVSklUU1VfVEFCTEVUIGlz
IG5vdCBzZXQKIyBDT05GSUdfSFBfQUNDRUwgaXMgbm90IHNldAojIENPTkZJR19XSVJFTEVTU19I
T1RLRVkgaXMgbm90IHNldAojIENPTkZJR19JQk1fUlRMIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19IREFQUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RISU5LUEFEX0FDUEkgaXMgbm90IHNldApD
T05GSUdfSU5URUxfQVRPTUlTUDJfUERYODY9eQpDT05GSUdfSU5URUxfQVRPTUlTUDJfTEVEPXkK
Q09ORklHX0lOVEVMX1NBUl9JTlQxMDkyPXkKQ09ORklHX0lOVEVMX1NLTF9JTlQzNDcyPXkKIyBD
T05GSUdfSU5URUxfUE1DX0NPUkUgaXMgbm90IHNldAoKIwojIEludGVsIFNwZWVkIFNlbGVjdCBU
ZWNobm9sb2d5IGludGVyZmFjZSBzdXBwb3J0CiMKIyBDT05GSUdfSU5URUxfU1BFRURfU0VMRUNU
X0lOVEVSRkFDRSBpcyBub3Qgc2V0CiMgZW5kIG9mIEludGVsIFNwZWVkIFNlbGVjdCBUZWNobm9s
b2d5IGludGVyZmFjZSBzdXBwb3J0CgojCiMgSW50ZWwgVW5jb3JlIEZyZXF1ZW5jeSBDb250cm9s
CiMKQ09ORklHX0lOVEVMX1VOQ09SRV9GUkVRX0NPTlRST0w9eQojIGVuZCBvZiBJbnRlbCBVbmNv
cmUgRnJlcXVlbmN5IENvbnRyb2wKCiMgQ09ORklHX0lOVEVMX0hJRF9FVkVOVCBpcyBub3Qgc2V0
CiMgQ09ORklHX0lOVEVMX1ZCVE4gaXMgbm90IHNldApDT05GSUdfSU5URUxfSU5UMDAwMl9WR1BJ
Tz15CiMgQ09ORklHX0lOVEVMX1BVTklUX0lQQyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1JT
VCBpcyBub3Qgc2V0CkNPTkZJR19JTlRFTF9TTUFSVENPTk5FQ1Q9eQojIENPTkZJR19JTlRFTF9W
U0VDIGlzIG5vdCBzZXQKIyBDT05GSUdfUENFTkdJTkVTX0FQVTIgaXMgbm90IHNldApDT05GSUdf
QkFSQ09fUDUwX0dQSU89eQojIENPTkZJR19TQU1TVU5HX0xBUFRPUCBpcyBub3Qgc2V0CkNPTkZJ
R19TQU1TVU5HX1ExMD15CkNPTkZJR19UT1NISUJBX0JUX1JGS0lMTD15CkNPTkZJR19UT1NISUJB
X0hBUFM9eQojIENPTkZJR19BQ1BJX0NNUEMgaXMgbm90IHNldAojIENPTkZJR19QQU5BU09OSUNf
TEFQVE9QIGlzIG5vdCBzZXQKIyBDT05GSUdfU1lTVEVNNzZfQUNQSSBpcyBub3Qgc2V0CiMgQ09O
RklHX1RPUFNUQVJfTEFQVE9QIGlzIG5vdCBzZXQKIyBDT05GSUdfTUxYX1BMQVRGT1JNIGlzIG5v
dCBzZXQKIyBDT05GSUdfSU5URUxfSVBTIGlzIG5vdCBzZXQKQ09ORklHX0lOVEVMX1NDVV9JUEM9
eQpDT05GSUdfSU5URUxfU0NVPXkKIyBDT05GSUdfSU5URUxfU0NVX1BDSSBpcyBub3Qgc2V0CkNP
TkZJR19JTlRFTF9TQ1VfUExBVEZPUk09eQojIENPTkZJR19JTlRFTF9TQ1VfSVBDX1VUSUwgaXMg
bm90IHNldAojIENPTkZJR19TSUVNRU5TX1NJTUFUSUNfSVBDIGlzIG5vdCBzZXQKIyBDT05GSUdf
V0lOTUFURV9GTTA3X0tFWVMgaXMgbm90IHNldAojIENPTkZJR19QMlNCIGlzIG5vdCBzZXQKQ09O
RklHX0hBVkVfQ0xLPXkKQ09ORklHX0hBVkVfQ0xLX1BSRVBBUkU9eQpDT05GSUdfQ09NTU9OX0NM
Sz15CkNPTkZJR19DT01NT05fQ0xLX1dNODMxWD15CkNPTkZJR19DT01NT05fQ0xLX01BWDk0ODU9
eQpDT05GSUdfQ09NTU9OX0NMS19TSTUzNDE9eQpDT05GSUdfQ09NTU9OX0NMS19TSTUzNTE9eQpD
T05GSUdfQ09NTU9OX0NMS19TSTU0ND15CkNPTkZJR19DT01NT05fQ0xLX0NEQ0U3MDY9eQojIENP
TkZJR19DT01NT05fQ0xLX1RQUzY4NDcwIGlzIG5vdCBzZXQKQ09ORklHX0NPTU1PTl9DTEtfQ1My
MDAwX0NQPXkKQ09ORklHX0NPTU1PTl9DTEtfUEFMTUFTPXkKIyBDT05GSUdfWElMSU5YX1ZDVSBp
cyBub3Qgc2V0CiMgQ09ORklHX0hXU1BJTkxPQ0sgaXMgbm90IHNldAoKIwojIENsb2NrIFNvdXJj
ZSBkcml2ZXJzCiMKQ09ORklHX0NMS0VWVF9JODI1Mz15CkNPTkZJR19DTEtCTERfSTgyNTM9eQoj
IGVuZCBvZiBDbG9jayBTb3VyY2UgZHJpdmVycwoKIyBDT05GSUdfTUFJTEJPWCBpcyBub3Qgc2V0
CkNPTkZJR19JT01NVV9JT1ZBPXkKQ09ORklHX0lPTU1VX0FQST15CkNPTkZJR19JT01NVV9TVVBQ
T1JUPXkKCiMKIyBHZW5lcmljIElPTU1VIFBhZ2V0YWJsZSBTdXBwb3J0CiMKIyBlbmQgb2YgR2Vu
ZXJpYyBJT01NVSBQYWdldGFibGUgU3VwcG9ydAoKIyBDT05GSUdfSU9NTVVfREVCVUdGUyBpcyBu
b3Qgc2V0CkNPTkZJR19JT01NVV9ERUZBVUxUX0RNQV9TVFJJQ1Q9eQojIENPTkZJR19JT01NVV9E
RUZBVUxUX0RNQV9MQVpZIGlzIG5vdCBzZXQKIyBDT05GSUdfSU9NTVVfREVGQVVMVF9QQVNTVEhS
T1VHSCBpcyBub3Qgc2V0CkNPTkZJR19JT01NVV9ETUE9eQojIENPTkZJR19BTURfSU9NTVUgaXMg
bm90IHNldApDT05GSUdfVklSVElPX0lPTU1VPXkKCiMKIyBSZW1vdGVwcm9jIGRyaXZlcnMKIwpD
T05GSUdfUkVNT1RFUFJPQz15CiMgQ09ORklHX1JFTU9URVBST0NfQ0RFViBpcyBub3Qgc2V0CiMg
ZW5kIG9mIFJlbW90ZXByb2MgZHJpdmVycwoKIwojIFJwbXNnIGRyaXZlcnMKIwojIENPTkZJR19S
UE1TR19WSVJUSU8gaXMgbm90IHNldAojIGVuZCBvZiBScG1zZyBkcml2ZXJzCgojIENPTkZJR19T
T1VORFdJUkUgaXMgbm90IHNldAoKIwojIFNPQyAoU3lzdGVtIE9uIENoaXApIHNwZWNpZmljIERy
aXZlcnMKIwoKIwojIEFtbG9naWMgU29DIGRyaXZlcnMKIwojIGVuZCBvZiBBbWxvZ2ljIFNvQyBk
cml2ZXJzCgojCiMgQnJvYWRjb20gU29DIGRyaXZlcnMKIwojIGVuZCBvZiBCcm9hZGNvbSBTb0Mg
ZHJpdmVycwoKIwojIE5YUC9GcmVlc2NhbGUgUW9ySVEgU29DIGRyaXZlcnMKIwojIGVuZCBvZiBO
WFAvRnJlZXNjYWxlIFFvcklRIFNvQyBkcml2ZXJzCgojCiMgZnVqaXRzdSBTb0MgZHJpdmVycwoj
CiMgZW5kIG9mIGZ1aml0c3UgU29DIGRyaXZlcnMKCiMKIyBpLk1YIFNvQyBkcml2ZXJzCiMKIyBl
bmQgb2YgaS5NWCBTb0MgZHJpdmVycwoKIwojIEVuYWJsZSBMaXRlWCBTb0MgQnVpbGRlciBzcGVj
aWZpYyBkcml2ZXJzCiMKIyBlbmQgb2YgRW5hYmxlIExpdGVYIFNvQyBCdWlsZGVyIHNwZWNpZmlj
IGRyaXZlcnMKCiMKIyBRdWFsY29tbSBTb0MgZHJpdmVycwojCiMgZW5kIG9mIFF1YWxjb21tIFNv
QyBkcml2ZXJzCgojIENPTkZJR19TT0NfVEkgaXMgbm90IHNldAoKIwojIFhpbGlueCBTb0MgZHJp
dmVycwojCiMgZW5kIG9mIFhpbGlueCBTb0MgZHJpdmVycwojIGVuZCBvZiBTT0MgKFN5c3RlbSBP
biBDaGlwKSBzcGVjaWZpYyBEcml2ZXJzCgpDT05GSUdfUE1fREVWRlJFUT15CgojCiMgREVWRlJF
USBHb3Zlcm5vcnMKIwojIENPTkZJR19ERVZGUkVRX0dPVl9TSU1QTEVfT05ERU1BTkQgaXMgbm90
IHNldApDT05GSUdfREVWRlJFUV9HT1ZfUEVSRk9STUFOQ0U9eQojIENPTkZJR19ERVZGUkVRX0dP
Vl9QT1dFUlNBVkUgaXMgbm90IHNldAojIENPTkZJR19ERVZGUkVRX0dPVl9VU0VSU1BBQ0UgaXMg
bm90IHNldAojIENPTkZJR19ERVZGUkVRX0dPVl9QQVNTSVZFIGlzIG5vdCBzZXQKCiMKIyBERVZG
UkVRIERyaXZlcnMKIwojIENPTkZJR19QTV9ERVZGUkVRX0VWRU5UIGlzIG5vdCBzZXQKQ09ORklH
X0VYVENPTj15CgojCiMgRXh0Y29uIERldmljZSBEcml2ZXJzCiMKQ09ORklHX0VYVENPTl9BRENf
SkFDSz15CiMgQ09ORklHX0VYVENPTl9GU0E5NDgwIGlzIG5vdCBzZXQKQ09ORklHX0VYVENPTl9H
UElPPXkKQ09ORklHX0VYVENPTl9JTlRFTF9JTlQzNDk2PXkKQ09ORklHX0VYVENPTl9NQVgxNDU3
Nz15CkNPTkZJR19FWFRDT05fTUFYMzM1NT15CkNPTkZJR19FWFRDT05fTUFYODk5Nz15CkNPTkZJ
R19FWFRDT05fUEFMTUFTPXkKQ09ORklHX0VYVENPTl9QVE41MTUwPXkKIyBDT05GSUdfRVhUQ09O
X1JUODk3M0EgaXMgbm90IHNldAojIENPTkZJR19FWFRDT05fU001NTAyIGlzIG5vdCBzZXQKQ09O
RklHX0VYVENPTl9VU0JfR1BJTz15CkNPTkZJR19FWFRDT05fVVNCQ19DUk9TX0VDPXkKIyBDT05G
SUdfRVhUQ09OX1VTQkNfVFVTQjMyMCBpcyBub3Qgc2V0CkNPTkZJR19NRU1PUlk9eQpDT05GSUdf
RlBHQV9ERkxfRU1JRj15CkNPTkZJR19JSU89eQpDT05GSUdfSUlPX0JVRkZFUj15CkNPTkZJR19J
SU9fQlVGRkVSX0NCPXkKQ09ORklHX0lJT19CVUZGRVJfRE1BPXkKQ09ORklHX0lJT19CVUZGRVJf
RE1BRU5HSU5FPXkKQ09ORklHX0lJT19CVUZGRVJfSFdfQ09OU1VNRVI9eQpDT05GSUdfSUlPX0tG
SUZPX0JVRj15CkNPTkZJR19JSU9fVFJJR0dFUkVEX0JVRkZFUj15CkNPTkZJR19JSU9fQ09ORklH
RlM9eQpDT05GSUdfSUlPX1RSSUdHRVI9eQpDT05GSUdfSUlPX0NPTlNVTUVSU19QRVJfVFJJR0dF
Uj0yCkNPTkZJR19JSU9fU1dfREVWSUNFPXkKQ09ORklHX0lJT19TV19UUklHR0VSPXkKIyBDT05G
SUdfSUlPX1RSSUdHRVJFRF9FVkVOVCBpcyBub3Qgc2V0CgojCiMgQWNjZWxlcm9tZXRlcnMKIwoj
IENPTkZJR19BRFhMMzEzX0kyQyBpcyBub3Qgc2V0CkNPTkZJR19BRFhMMzQ1PXkKQ09ORklHX0FE
WEwzNDVfSTJDPXkKIyBDT05GSUdfQURYTDM1NV9JMkMgaXMgbm90IHNldAojIENPTkZJR19BRFhM
MzY3X0kyQyBpcyBub3Qgc2V0CkNPTkZJR19BRFhMMzcyPXkKQ09ORklHX0FEWEwzNzJfSTJDPXkK
Q09ORklHX0JNQTE4MD15CiMgQ09ORklHX0JNQTQwMCBpcyBub3Qgc2V0CkNPTkZJR19CTUMxNTBf
QUNDRUw9eQpDT05GSUdfQk1DMTUwX0FDQ0VMX0kyQz15CkNPTkZJR19EQTI4MD15CiMgQ09ORklH
X0RBMzExIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BUkQwNiBpcyBub3Qgc2V0CkNPTkZJR19ETUFS
RDA5PXkKQ09ORklHX0RNQVJEMTA9eQpDT05GSUdfRlhMUzg5NjJBRj15CkNPTkZJR19GWExTODk2
MkFGX0kyQz15CkNPTkZJR19JSU9fU1RfQUNDRUxfM0FYSVM9eQojIENPTkZJR19JSU9fU1RfQUND
RUxfSTJDXzNBWElTIGlzIG5vdCBzZXQKIyBDT05GSUdfS1hTRDkgaXMgbm90IHNldAojIENPTkZJ
R19LWENKSzEwMTMgaXMgbm90IHNldApDT05GSUdfTUMzMjMwPXkKQ09ORklHX01NQTc0NTU9eQpD
T05GSUdfTU1BNzQ1NV9JMkM9eQojIENPTkZJR19NTUE3NjYwIGlzIG5vdCBzZXQKQ09ORklHX01N
QTg0NTI9eQpDT05GSUdfTU1BOTU1MV9DT1JFPXkKQ09ORklHX01NQTk1NTE9eQpDT05GSUdfTU1B
OTU1Mz15CkNPTkZJR19NWEM0MDA1PXkKQ09ORklHX01YQzYyNTU9eQpDT05GSUdfU1RLODMxMj15
CkNPTkZJR19TVEs4QkE1MD15CiMgZW5kIG9mIEFjY2VsZXJvbWV0ZXJzCgojCiMgQW5hbG9nIHRv
IGRpZ2l0YWwgY29udmVydGVycwojCkNPTkZJR19BRDcwOTFSNT15CkNPTkZJR19BRDcyOTE9eQoj
IENPTkZJR19BRDc2MDZfSUZBQ0VfUEFSQUxMRUwgaXMgbm90IHNldApDT05GSUdfQUQ3OTlYPXkK
Q09ORklHX0FYUDIwWF9BREM9eQojIENPTkZJR19BWFAyODhfQURDIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ0MxMDAwMV9BREMgaXMgbm90IHNldAojIENPTkZJR19EQTkxNTBfR1BBREMgaXMgbm90IHNl
dAojIENPTkZJR19FTlZFTE9QRV9ERVRFQ1RPUiBpcyBub3Qgc2V0CiMgQ09ORklHX0hYNzExIGlz
IG5vdCBzZXQKQ09ORklHX0xQODc4OF9BREM9eQpDT05GSUdfTFRDMjQ3MT15CiMgQ09ORklHX0xU
QzI0ODUgaXMgbm90IHNldApDT05GSUdfTFRDMjQ5Nz15CkNPTkZJR19NQVgxMzYzPXkKQ09ORklH
X01BWDk2MTE9eQpDT05GSUdfTUNQMzQyMj15CkNPTkZJR19NRURJQVRFS19NVDYzNjBfQURDPXkK
IyBDT05GSUdfTUVOX1oxODhfQURDIGlzIG5vdCBzZXQKQ09ORklHX05BVTc4MDI9eQojIENPTkZJ
R19QQUxNQVNfR1BBREMgaXMgbm90IHNldApDT05GSUdfUUNPTV9WQURDX0NPTU1PTj15CkNPTkZJ
R19RQ09NX1NQTUlfSUFEQz15CkNPTkZJR19RQ09NX1NQTUlfVkFEQz15CkNPTkZJR19RQ09NX1NQ
TUlfQURDNT15CiMgQ09ORklHX1NEX0FEQ19NT0RVTEFUT1IgaXMgbm90IHNldAojIENPTkZJR19U
SV9BREMwODFDIGlzIG5vdCBzZXQKIyBDT05GSUdfVElfQURTMTAxNSBpcyBub3Qgc2V0CkNPTkZJ
R19USV9BTTMzNVhfQURDPXkKIyBDT05GSUdfVkY2MTBfQURDIGlzIG5vdCBzZXQKQ09ORklHX1hJ
TElOWF9YQURDPXkKIyBlbmQgb2YgQW5hbG9nIHRvIGRpZ2l0YWwgY29udmVydGVycwoKIwojIEFu
YWxvZyB0byBkaWdpdGFsIGFuZCBkaWdpdGFsIHRvIGFuYWxvZyBjb252ZXJ0ZXJzCiMKIyBlbmQg
b2YgQW5hbG9nIHRvIGRpZ2l0YWwgYW5kIGRpZ2l0YWwgdG8gYW5hbG9nIGNvbnZlcnRlcnMKCiMK
IyBBbmFsb2cgRnJvbnQgRW5kcwojCiMgQ09ORklHX0lJT19SRVNDQUxFIGlzIG5vdCBzZXQKIyBl
bmQgb2YgQW5hbG9nIEZyb250IEVuZHMKCiMKIyBBbXBsaWZpZXJzCiMKIyBDT05GSUdfSE1DNDI1
IGlzIG5vdCBzZXQKIyBlbmQgb2YgQW1wbGlmaWVycwoKIwojIENhcGFjaXRhbmNlIHRvIGRpZ2l0
YWwgY29udmVydGVycwojCiMgQ09ORklHX0FENzE1MCBpcyBub3Qgc2V0CiMgZW5kIG9mIENhcGFj
aXRhbmNlIHRvIGRpZ2l0YWwgY29udmVydGVycwoKIwojIENoZW1pY2FsIFNlbnNvcnMKIwpDT05G
SUdfQVRMQVNfUEhfU0VOU09SPXkKQ09ORklHX0FUTEFTX0VaT19TRU5TT1I9eQojIENPTkZJR19C
TUU2ODAgaXMgbm90IHNldApDT05GSUdfQ0NTODExPXkKQ09ORklHX0lBUUNPUkU9eQojIENPTkZJ
R19QTVM3MDAzIGlzIG5vdCBzZXQKQ09ORklHX1NDRDMwX0NPUkU9eQojIENPTkZJR19TQ0QzMF9J
MkMgaXMgbm90IHNldApDT05GSUdfU0NEMzBfU0VSSUFMPXkKQ09ORklHX1NDRDRYPXkKIyBDT05G
SUdfU0VOU0lSSU9OX1NHUDMwIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNJUklPTl9TR1A0MD15CkNP
TkZJR19TUFMzMD15CiMgQ09ORklHX1NQUzMwX0kyQyBpcyBub3Qgc2V0CkNPTkZJR19TUFMzMF9T
RVJJQUw9eQpDT05GSUdfU0VOU0VBSVJfU1VOUklTRV9DTzI9eQojIENPTkZJR19WWjg5WCBpcyBu
b3Qgc2V0CiMgZW5kIG9mIENoZW1pY2FsIFNlbnNvcnMKCiMKIyBIaWQgU2Vuc29yIElJTyBDb21t
b24KIwojIGVuZCBvZiBIaWQgU2Vuc29yIElJTyBDb21tb24KCkNPTkZJR19JSU9fTVNfU0VOU09S
U19JMkM9eQoKIwojIElJTyBTQ01JIFNlbnNvcnMKIwojIGVuZCBvZiBJSU8gU0NNSSBTZW5zb3Jz
CgojCiMgU1NQIFNlbnNvciBDb21tb24KIwojIGVuZCBvZiBTU1AgU2Vuc29yIENvbW1vbgoKQ09O
RklHX0lJT19TVF9TRU5TT1JTX0kyQz15CkNPTkZJR19JSU9fU1RfU0VOU09SU19DT1JFPXkKCiMK
IyBEaWdpdGFsIHRvIGFuYWxvZyBjb252ZXJ0ZXJzCiMKQ09ORklHX0FENTA2ND15CiMgQ09ORklH
X0FENTM4MCBpcyBub3Qgc2V0CkNPTkZJR19BRDU0NDY9eQpDT05GSUdfQUQ1NTkyUl9CQVNFPXkK
Q09ORklHX0FENTU5M1I9eQojIENPTkZJR19BRDU2OTZfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFBPVF9EQUMgaXMgbm90IHNldApDT05GSUdfRFM0NDI0PXkKIyBDT05GSUdfTTYyMzMyIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUFYNTE3IGlzIG5vdCBzZXQKQ09ORklHX01BWDU4MjE9eQpDT05GSUdf
TUNQNDcyNT15CkNPTkZJR19USV9EQUM1NTcxPXkKIyBDT05GSUdfVkY2MTBfREFDIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgRGlnaXRhbCB0byBhbmFsb2cgY29udmVydGVycwoKIwojIElJTyBkdW1teSBk
cml2ZXIKIwojIENPTkZJR19JSU9fU0lNUExFX0RVTU1ZIGlzIG5vdCBzZXQKIyBlbmQgb2YgSUlP
IGR1bW15IGRyaXZlcgoKIwojIEZpbHRlcnMKIwojIGVuZCBvZiBGaWx0ZXJzCgojCiMgRnJlcXVl
bmN5IFN5bnRoZXNpemVycyBERFMvUExMCiMKCiMKIyBDbG9jayBHZW5lcmF0b3IvRGlzdHJpYnV0
aW9uCiMKIyBlbmQgb2YgQ2xvY2sgR2VuZXJhdG9yL0Rpc3RyaWJ1dGlvbgoKIwojIFBoYXNlLUxv
Y2tlZCBMb29wIChQTEwpIGZyZXF1ZW5jeSBzeW50aGVzaXplcnMKIwojIGVuZCBvZiBQaGFzZS1M
b2NrZWQgTG9vcCAoUExMKSBmcmVxdWVuY3kgc3ludGhlc2l6ZXJzCiMgZW5kIG9mIEZyZXF1ZW5j
eSBTeW50aGVzaXplcnMgRERTL1BMTAoKIwojIERpZ2l0YWwgZ3lyb3Njb3BlIHNlbnNvcnMKIwpD
T05GSUdfQk1HMTYwPXkKQ09ORklHX0JNRzE2MF9JMkM9eQpDT05GSUdfRlhBUzIxMDAyQz15CkNP
TkZJR19GWEFTMjEwMDJDX0kyQz15CiMgQ09ORklHX01QVTMwNTBfSTJDIGlzIG5vdCBzZXQKQ09O
RklHX0lJT19TVF9HWVJPXzNBWElTPXkKQ09ORklHX0lJT19TVF9HWVJPX0kyQ18zQVhJUz15CkNP
TkZJR19JVEczMjAwPXkKIyBlbmQgb2YgRGlnaXRhbCBneXJvc2NvcGUgc2Vuc29ycwoKIwojIEhl
YWx0aCBTZW5zb3JzCiMKCiMKIyBIZWFydCBSYXRlIE1vbml0b3JzCiMKIyBDT05GSUdfQUZFNDQw
NCBpcyBub3Qgc2V0CkNPTkZJR19NQVgzMDEwMD15CkNPTkZJR19NQVgzMDEwMj15CiMgZW5kIG9m
IEhlYXJ0IFJhdGUgTW9uaXRvcnMKIyBlbmQgb2YgSGVhbHRoIFNlbnNvcnMKCiMKIyBIdW1pZGl0
eSBzZW5zb3JzCiMKQ09ORklHX0FNMjMxNT15CiMgQ09ORklHX0RIVDExIGlzIG5vdCBzZXQKQ09O
RklHX0hEQzEwMFg9eQojIENPTkZJR19IREMyMDEwIGlzIG5vdCBzZXQKQ09ORklHX0hUUzIyMT15
CkNPTkZJR19IVFMyMjFfSTJDPXkKQ09ORklHX0hUVTIxPXkKIyBDT05GSUdfU0k3MDA1IGlzIG5v
dCBzZXQKQ09ORklHX1NJNzAyMD15CiMgZW5kIG9mIEh1bWlkaXR5IHNlbnNvcnMKCiMKIyBJbmVy
dGlhbCBtZWFzdXJlbWVudCB1bml0cwojCkNPTkZJR19CTUkxNjA9eQpDT05GSUdfQk1JMTYwX0ky
Qz15CkNPTkZJR19GWE9TODcwMD15CkNPTkZJR19GWE9TODcwMF9JMkM9eQpDT05GSUdfS01YNjE9
eQpDT05GSUdfSU5WX0lDTTQyNjAwPXkKQ09ORklHX0lOVl9JQ000MjYwMF9JMkM9eQojIENPTkZJ
R19JTlZfTVBVNjA1MF9JMkMgaXMgbm90IHNldApDT05GSUdfSUlPX1NUX0xTTTZEU1g9eQpDT05G
SUdfSUlPX1NUX0xTTTZEU1hfSTJDPXkKQ09ORklHX0lJT19TVF9MU002RFNYX0kzQz15CiMgQ09O
RklHX0lJT19TVF9MU005RFMwIGlzIG5vdCBzZXQKIyBlbmQgb2YgSW5lcnRpYWwgbWVhc3VyZW1l
bnQgdW5pdHMKCiMKIyBMaWdodCBzZW5zb3JzCiMKQ09ORklHX0FDUElfQUxTPXkKQ09ORklHX0FE
SkRfUzMxMT15CkNPTkZJR19BRFVYMTAyMD15CkNPTkZJR19BTDMwMTA9eQpDT05GSUdfQUwzMzIw
QT15CiMgQ09ORklHX0FQRFM5MzAwIGlzIG5vdCBzZXQKQ09ORklHX0FQRFM5OTYwPXkKIyBDT05G
SUdfQVM3MzIxMSBpcyBub3Qgc2V0CkNPTkZJR19CSDE3NTA9eQpDT05GSUdfQkgxNzgwPXkKQ09O
RklHX0NNMzIxODE9eQojIENPTkZJR19DTTMyMzIgaXMgbm90IHNldApDT05GSUdfQ00zMzIzPXkK
IyBDT05GSUdfQ00zNjA1IGlzIG5vdCBzZXQKIyBDT05GSUdfQ00zNjY1MSBpcyBub3Qgc2V0CkNP
TkZJR19HUDJBUDAwMj15CkNPTkZJR19HUDJBUDAyMEEwMEY9eQpDT05GSUdfU0VOU09SU19JU0wy
OTAxOD15CiMgQ09ORklHX1NFTlNPUlNfSVNMMjkwMjggaXMgbm90IHNldApDT05GSUdfSVNMMjkx
MjU9eQpDT05GSUdfSlNBMTIxMj15CkNPTkZJR19SUFIwNTIxPXkKQ09ORklHX1NFTlNPUlNfTE0z
NTMzPXkKQ09ORklHX0xUUjUwMT15CiMgQ09ORklHX0xWMDEwNENTIGlzIG5vdCBzZXQKQ09ORklH
X01BWDQ0MDAwPXkKIyBDT05GSUdfTUFYNDQwMDkgaXMgbm90IHNldApDT05GSUdfTk9BMTMwNT15
CkNPTkZJR19PUFQzMDAxPXkKQ09ORklHX1BBMTIyMDMwMDE9eQojIENPTkZJR19TSTExMzMgaXMg
bm90IHNldAojIENPTkZJR19TSTExNDUgaXMgbm90IHNldAojIENPTkZJR19TVEszMzEwIGlzIG5v
dCBzZXQKIyBDT05GSUdfU1RfVVZJUzI1IGlzIG5vdCBzZXQKIyBDT05GSUdfVENTMzQxNCBpcyBu
b3Qgc2V0CkNPTkZJR19UQ1MzNDcyPXkKQ09ORklHX1NFTlNPUlNfVFNMMjU2Mz15CiMgQ09ORklH
X1RTTDI1ODMgaXMgbm90IHNldAojIENPTkZJR19UU0wyNTkxIGlzIG5vdCBzZXQKIyBDT05GSUdf
VFNMMjc3MiBpcyBub3Qgc2V0CkNPTkZJR19UU0w0NTMxPXkKQ09ORklHX1VTNTE4MkQ9eQpDT05G
SUdfVkNOTDQwMDA9eQojIENPTkZJR19WQ05MNDAzNSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZFTUw2
MDMwIGlzIG5vdCBzZXQKIyBDT05GSUdfVkVNTDYwNzAgaXMgbm90IHNldAojIENPTkZJR19WTDYx
ODAgaXMgbm90IHNldAojIENPTkZJR19aT1BUMjIwMSBpcyBub3Qgc2V0CiMgZW5kIG9mIExpZ2h0
IHNlbnNvcnMKCiMKIyBNYWduZXRvbWV0ZXIgc2Vuc29ycwojCiMgQ09ORklHX0FLODk3NCBpcyBu
b3Qgc2V0CkNPTkZJR19BSzg5NzU9eQojIENPTkZJR19BSzA5OTExIGlzIG5vdCBzZXQKQ09ORklH
X0JNQzE1MF9NQUdOPXkKQ09ORklHX0JNQzE1MF9NQUdOX0kyQz15CkNPTkZJR19NQUczMTEwPXkK
IyBDT05GSUdfTU1DMzUyNDAgaXMgbm90IHNldApDT05GSUdfSUlPX1NUX01BR05fM0FYSVM9eQoj
IENPTkZJR19JSU9fU1RfTUFHTl9JMkNfM0FYSVMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0hNQzU4NDNfSTJDIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfUk0zMTAwPXkKQ09ORklHX1NF
TlNPUlNfUk0zMTAwX0kyQz15CkNPTkZJR19ZQU1BSEFfWUFTNTMwPXkKIyBlbmQgb2YgTWFnbmV0
b21ldGVyIHNlbnNvcnMKCiMKIyBNdWx0aXBsZXhlcnMKIwojIENPTkZJR19JSU9fTVVYIGlzIG5v
dCBzZXQKIyBlbmQgb2YgTXVsdGlwbGV4ZXJzCgojCiMgSW5jbGlub21ldGVyIHNlbnNvcnMKIwoj
IGVuZCBvZiBJbmNsaW5vbWV0ZXIgc2Vuc29ycwoKIwojIFRyaWdnZXJzIC0gc3RhbmRhbG9uZQoj
CkNPTkZJR19JSU9fSFJUSU1FUl9UUklHR0VSPXkKQ09ORklHX0lJT19JTlRFUlJVUFRfVFJJR0dF
Uj15CkNPTkZJR19JSU9fVElHSFRMT09QX1RSSUdHRVI9eQpDT05GSUdfSUlPX1NZU0ZTX1RSSUdH
RVI9eQojIGVuZCBvZiBUcmlnZ2VycyAtIHN0YW5kYWxvbmUKCiMKIyBMaW5lYXIgYW5kIGFuZ3Vs
YXIgcG9zaXRpb24gc2Vuc29ycwojCiMgZW5kIG9mIExpbmVhciBhbmQgYW5ndWxhciBwb3NpdGlv
biBzZW5zb3JzCgojCiMgRGlnaXRhbCBwb3RlbnRpb21ldGVycwojCkNPTkZJR19BRDUxMTA9eQpD
T05GSUdfQUQ1MjcyPXkKIyBDT05GSUdfRFMxODAzIGlzIG5vdCBzZXQKQ09ORklHX01BWDU0MzI9
eQojIENPTkZJR19NQ1A0MDE4IGlzIG5vdCBzZXQKQ09ORklHX01DUDQ1MzE9eQpDT05GSUdfVFBM
MDEwMj15CiMgZW5kIG9mIERpZ2l0YWwgcG90ZW50aW9tZXRlcnMKCiMKIyBEaWdpdGFsIHBvdGVu
dGlvc3RhdHMKIwpDT05GSUdfTE1QOTEwMDA9eQojIGVuZCBvZiBEaWdpdGFsIHBvdGVudGlvc3Rh
dHMKCiMKIyBQcmVzc3VyZSBzZW5zb3JzCiMKIyBDT05GSUdfQUJQMDYwTUcgaXMgbm90IHNldApD
T05GSUdfQk1QMjgwPXkKQ09ORklHX0JNUDI4MF9JMkM9eQpDT05GSUdfRExITDYwRD15CiMgQ09O
RklHX0RQUzMxMCBpcyBub3Qgc2V0CiMgQ09ORklHX0hQMDMgaXMgbm90IHNldApDT05GSUdfSUNQ
MTAxMDA9eQpDT05GSUdfTVBMMTE1PXkKQ09ORklHX01QTDExNV9JMkM9eQpDT05GSUdfTVBMMzEx
NT15CkNPTkZJR19NUzU2MTE9eQpDT05GSUdfTVM1NjExX0kyQz15CkNPTkZJR19NUzU2Mzc9eQpD
T05GSUdfSUlPX1NUX1BSRVNTPXkKIyBDT05GSUdfSUlPX1NUX1BSRVNTX0kyQyBpcyBub3Qgc2V0
CiMgQ09ORklHX1Q1NDAzIGlzIG5vdCBzZXQKQ09ORklHX0hQMjA2Qz15CiMgQ09ORklHX1pQQTIz
MjYgaXMgbm90IHNldAojIGVuZCBvZiBQcmVzc3VyZSBzZW5zb3JzCgojCiMgTGlnaHRuaW5nIHNl
bnNvcnMKIwojIGVuZCBvZiBMaWdodG5pbmcgc2Vuc29ycwoKIwojIFByb3hpbWl0eSBhbmQgZGlz
dGFuY2Ugc2Vuc29ycwojCkNPTkZJR19DUk9TX0VDX01LQlBfUFJPWElNSVRZPXkKQ09ORklHX0lT
TDI5NTAxPXkKQ09ORklHX0xJREFSX0xJVEVfVjI9eQojIENPTkZJR19NQjEyMzIgaXMgbm90IHNl
dApDT05GSUdfUElORz15CkNPTkZJR19SRkQ3NzQwMj15CiMgQ09ORklHX1NSRjA0IGlzIG5vdCBz
ZXQKQ09ORklHX1NYX0NPTU1PTj15CiMgQ09ORklHX1NYOTMxMCBpcyBub3Qgc2V0CkNPTkZJR19T
WDkzMjQ9eQojIENPTkZJR19TWDkzNjAgaXMgbm90IHNldApDT05GSUdfU1g5NTAwPXkKIyBDT05G
SUdfU1JGMDggaXMgbm90IHNldApDT05GSUdfVkNOTDMwMjA9eQpDT05GSUdfVkw1M0wwWF9JMkM9
eQojIGVuZCBvZiBQcm94aW1pdHkgYW5kIGRpc3RhbmNlIHNlbnNvcnMKCiMKIyBSZXNvbHZlciB0
byBkaWdpdGFsIGNvbnZlcnRlcnMKIwojIGVuZCBvZiBSZXNvbHZlciB0byBkaWdpdGFsIGNvbnZl
cnRlcnMKCiMKIyBUZW1wZXJhdHVyZSBzZW5zb3JzCiMKIyBDT05GSUdfTUxYOTA2MTQgaXMgbm90
IHNldApDT05GSUdfTUxYOTA2MzI9eQpDT05GSUdfVE1QMDA2PXkKIyBDT05GSUdfVE1QMDA3IGlz
IG5vdCBzZXQKQ09ORklHX1RNUDExNz15CkNPTkZJR19UU1lTMDE9eQpDT05GSUdfVFNZUzAyRD15
CiMgZW5kIG9mIFRlbXBlcmF0dXJlIHNlbnNvcnMKCiMgQ09ORklHX05UQiBpcyBub3Qgc2V0CiMg
Q09ORklHX1BXTSBpcyBub3Qgc2V0CgojCiMgSVJRIGNoaXAgc3VwcG9ydAojCkNPTkZJR19NQURF
UkFfSVJRPXkKIyBlbmQgb2YgSVJRIGNoaXAgc3VwcG9ydAoKQ09ORklHX0lQQUNLX0JVUz15CiMg
Q09ORklHX0JPQVJEX1RQQ0kyMDAgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfSVBPQ1RBTCBp
cyBub3Qgc2V0CkNPTkZJR19SRVNFVF9DT05UUk9MTEVSPXkKIyBDT05GSUdfUkVTRVRfU0lNUExF
IGlzIG5vdCBzZXQKQ09ORklHX1JFU0VUX1RJX1NZU0NPTj15CiMgQ09ORklHX1JFU0VUX1RJX1RQ
UzM4MFggaXMgbm90IHNldAoKIwojIFBIWSBTdWJzeXN0ZW0KIwpDT05GSUdfR0VORVJJQ19QSFk9
eQpDT05GSUdfVVNCX0xHTV9QSFk9eQojIENPTkZJR19QSFlfQ0FOX1RSQU5TQ0VJVkVSIGlzIG5v
dCBzZXQKCiMKIyBQSFkgZHJpdmVycyBmb3IgQnJvYWRjb20gcGxhdGZvcm1zCiMKQ09ORklHX0JD
TV9LT05BX1VTQjJfUEhZPXkKIyBlbmQgb2YgUEhZIGRyaXZlcnMgZm9yIEJyb2FkY29tIHBsYXRm
b3JtcwoKQ09ORklHX1BIWV9QWEFfMjhOTV9IU0lDPXkKQ09ORklHX1BIWV9QWEFfMjhOTV9VU0Iy
PXkKQ09ORklHX1BIWV9DUENBUF9VU0I9eQojIENPTkZJR19QSFlfUUNPTV9VU0JfSFMgaXMgbm90
IHNldAojIENPTkZJR19QSFlfUUNPTV9VU0JfSFNJQyBpcyBub3Qgc2V0CkNPTkZJR19QSFlfU0FN
U1VOR19VU0IyPXkKQ09ORklHX1BIWV9UVVNCMTIxMD15CkNPTkZJR19QSFlfSU5URUxfTEdNX0VN
TUM9eQojIGVuZCBvZiBQSFkgU3Vic3lzdGVtCgpDT05GSUdfUE9XRVJDQVA9eQpDT05GSUdfTUNC
PXkKIyBDT05GSUdfTUNCX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX01DQl9MUEMgaXMgbm90IHNl
dAoKIwojIFBlcmZvcm1hbmNlIG1vbml0b3Igc3VwcG9ydAojCiMgZW5kIG9mIFBlcmZvcm1hbmNl
IG1vbml0b3Igc3VwcG9ydAoKQ09ORklHX1JBUz15CiMgQ09ORklHX1VTQjQgaXMgbm90IHNldAoK
IwojIEFuZHJvaWQKIwpDT05GSUdfQU5EUk9JRF9CSU5ERVJfSVBDPXkKQ09ORklHX0FORFJPSURf
QklOREVSRlM9eQpDT05GSUdfQU5EUk9JRF9CSU5ERVJfREVWSUNFUz0iYmluZGVyLGh3YmluZGVy
LHZuZGJpbmRlciIKIyBDT05GSUdfQU5EUk9JRF9CSU5ERVJfSVBDX1NFTEZURVNUIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgQW5kcm9pZAoKIyBDT05GSUdfREFYIGlzIG5vdCBzZXQKQ09ORklHX05WTUVN
PXkKQ09ORklHX05WTUVNX1NZU0ZTPXkKQ09ORklHX05WTUVNX1NQTUlfU0RBTT15CiMgQ09ORklH
X1JBVkVfU1BfRUVQUk9NIGlzIG5vdCBzZXQKQ09ORklHX05WTUVNX1JNRU09eQoKIwojIEhXIHRy
YWNpbmcgc3VwcG9ydAojCkNPTkZJR19TVE09eQojIENPTkZJR19TVE1fUFJPVE9fQkFTSUMgaXMg
bm90IHNldApDT05GSUdfU1RNX1BST1RPX1NZU19UPXkKQ09ORklHX1NUTV9EVU1NWT15CkNPTkZJ
R19TVE1fU09VUkNFX0NPTlNPTEU9eQojIENPTkZJR19TVE1fU09VUkNFX0hFQVJUQkVBVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NUTV9TT1VSQ0VfRlRSQUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5U
RUxfVEggaXMgbm90IHNldAojIGVuZCBvZiBIVyB0cmFjaW5nIHN1cHBvcnQKCkNPTkZJR19GUEdB
PXkKQ09ORklHX0FMVEVSQV9QUl9JUF9DT1JFPXkKIyBDT05GSUdfRlBHQV9NR1JfQUxURVJBX0NW
UCBpcyBub3Qgc2V0CkNPTkZJR19GUEdBX0JSSURHRT15CkNPTkZJR19BTFRFUkFfRlJFRVpFX0JS
SURHRT15CiMgQ09ORklHX1hJTElOWF9QUl9ERUNPVVBMRVIgaXMgbm90IHNldApDT05GSUdfRlBH
QV9SRUdJT049eQpDT05GSUdfRlBHQV9ERkw9eQojIENPTkZJR19GUEdBX0RGTF9GTUUgaXMgbm90
IHNldApDT05GSUdfRlBHQV9ERkxfQUZVPXkKQ09ORklHX0ZQR0FfREZMX05JT1NfSU5URUxfUEFD
X04zMDAwPXkKIyBDT05GSUdfRlBHQV9ERkxfUENJIGlzIG5vdCBzZXQKQ09ORklHX1BNX09QUD15
CiMgQ09ORklHX1NJT1ggaXMgbm90IHNldApDT05GSUdfU0xJTUJVUz15CkNPTkZJR19TTElNX1FD
T01fQ1RSTD15CkNPTkZJR19JTlRFUkNPTk5FQ1Q9eQojIENPTkZJR19DT1VOVEVSIGlzIG5vdCBz
ZXQKQ09ORklHX01PU1Q9eQpDT05GSUdfTU9TVF9DREVWPXkKIyBDT05GSUdfUEVDSSBpcyBub3Qg
c2V0CiMgQ09ORklHX0hURSBpcyBub3Qgc2V0CiMgZW5kIG9mIERldmljZSBEcml2ZXJzCgojCiMg
RmlsZSBzeXN0ZW1zCiMKQ09ORklHX0RDQUNIRV9XT1JEX0FDQ0VTUz15CiMgQ09ORklHX1ZBTElE
QVRFX0ZTX1BBUlNFUiBpcyBub3Qgc2V0CkNPTkZJR19GU19QT1NJWF9BQ0w9eQpDT05GSUdfRVhQ
T1JURlM9eQpDT05GSUdfRVhQT1JURlNfQkxPQ0tfT1BTPXkKQ09ORklHX0ZJTEVfTE9DS0lORz15
CiMgQ09ORklHX0ZTX0VOQ1JZUFRJT04gaXMgbm90IHNldApDT05GSUdfRlNfVkVSSVRZPXkKQ09O
RklHX0ZTX1ZFUklUWV9ERUJVRz15CiMgQ09ORklHX0ZTX1ZFUklUWV9CVUlMVElOX1NJR05BVFVS
RVMgaXMgbm90IHNldApDT05GSUdfRlNOT1RJRlk9eQojIENPTkZJR19ETk9USUZZIGlzIG5vdCBz
ZXQKQ09ORklHX0lOT1RJRllfVVNFUj15CiMgQ09ORklHX0ZBTk9USUZZIGlzIG5vdCBzZXQKIyBD
T05GSUdfUVVPVEEgaXMgbm90IHNldApDT05GSUdfQVVUT0ZTNF9GUz15CkNPTkZJR19BVVRPRlNf
RlM9eQpDT05GSUdfRlVTRV9GUz15CkNPTkZJR19DVVNFPXkKQ09ORklHX1ZJUlRJT19GUz15CkNP
TkZJR19PVkVSTEFZX0ZTPXkKQ09ORklHX09WRVJMQVlfRlNfUkVESVJFQ1RfRElSPXkKIyBDT05G
SUdfT1ZFUkxBWV9GU19SRURJUkVDVF9BTFdBWVNfRk9MTE9XIGlzIG5vdCBzZXQKIyBDT05GSUdf
T1ZFUkxBWV9GU19JTkRFWCBpcyBub3Qgc2V0CkNPTkZJR19PVkVSTEFZX0ZTX1hJTk9fQVVUTz15
CkNPTkZJR19PVkVSTEFZX0ZTX01FVEFDT1BZPXkKCiMKIyBDYWNoZXMKIwpDT05GSUdfTkVURlNf
U1VQUE9SVD15CiMgQ09ORklHX05FVEZTX1NUQVRTIGlzIG5vdCBzZXQKQ09ORklHX0ZTQ0FDSEU9
eQojIENPTkZJR19GU0NBQ0hFX1NUQVRTIGlzIG5vdCBzZXQKQ09ORklHX0ZTQ0FDSEVfREVCVUc9
eQojIGVuZCBvZiBDYWNoZXMKCiMKIyBQc2V1ZG8gZmlsZXN5c3RlbXMKIwpDT05GSUdfUFJPQ19G
Uz15CiMgQ09ORklHX1BST0NfS0NPUkUgaXMgbm90IHNldApDT05GSUdfUFJPQ19TWVNDVEw9eQpD
T05GSUdfUFJPQ19QQUdFX01PTklUT1I9eQpDT05GSUdfUFJPQ19DSElMRFJFTj15CkNPTkZJR19Q
Uk9DX1BJRF9BUkNIX1NUQVRVUz15CkNPTkZJR19LRVJORlM9eQpDT05GSUdfU1lTRlM9eQpDT05G
SUdfVE1QRlM9eQpDT05GSUdfVE1QRlNfUE9TSVhfQUNMPXkKQ09ORklHX1RNUEZTX1hBVFRSPXkK
Q09ORklHX1RNUEZTX0lOT0RFNjQ9eQpDT05GSUdfSFVHRVRMQkZTPXkKQ09ORklHX0hVR0VUTEJf
UEFHRT15CkNPTkZJR19BUkNIX1dBTlRfSFVHRVRMQl9QQUdFX09QVElNSVpFX1ZNRU1NQVA9eQpD
T05GSUdfSFVHRVRMQl9QQUdFX09QVElNSVpFX1ZNRU1NQVA9eQojIENPTkZJR19IVUdFVExCX1BB
R0VfT1BUSU1JWkVfVk1FTU1BUF9ERUZBVUxUX09OIGlzIG5vdCBzZXQKQ09ORklHX01FTUZEX0NS
RUFURT15CkNPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19QQUdFPXkKQ09ORklHX0NPTkZJR0ZTX0ZT
PXkKIyBDT05GSUdfRUZJVkFSX0ZTIGlzIG5vdCBzZXQKIyBlbmQgb2YgUHNldWRvIGZpbGVzeXN0
ZW1zCgpDT05GSUdfTUlTQ19GSUxFU1lTVEVNUz15CiMgQ09ORklHX09SQU5HRUZTX0ZTIGlzIG5v
dCBzZXQKIyBDT05GSUdfRUNSWVBUX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0pGRlMyX0ZTPXkKQ09O
RklHX0pGRlMyX0ZTX0RFQlVHPTAKIyBDT05GSUdfSkZGUzJfRlNfV1JJVEVCVUZGRVIgaXMgbm90
IHNldAojIENPTkZJR19KRkZTMl9TVU1NQVJZIGlzIG5vdCBzZXQKIyBDT05GSUdfSkZGUzJfRlNf
WEFUVFIgaXMgbm90IHNldApDT05GSUdfSkZGUzJfQ09NUFJFU1NJT05fT1BUSU9OUz15CkNPTkZJ
R19KRkZTMl9aTElCPXkKQ09ORklHX0pGRlMyX0xaTz15CiMgQ09ORklHX0pGRlMyX1JUSU1FIGlz
IG5vdCBzZXQKIyBDT05GSUdfSkZGUzJfUlVCSU4gaXMgbm90IHNldAojIENPTkZJR19KRkZTMl9D
TU9ERV9OT05FIGlzIG5vdCBzZXQKIyBDT05GSUdfSkZGUzJfQ01PREVfUFJJT1JJVFkgaXMgbm90
IHNldApDT05GSUdfSkZGUzJfQ01PREVfU0laRT15CiMgQ09ORklHX0pGRlMyX0NNT0RFX0ZBVk9V
UkxaTyBpcyBub3Qgc2V0CkNPTkZJR19VQklGU19GUz15CiMgQ09ORklHX1VCSUZTX0ZTX0FEVkFO
Q0VEX0NPTVBSIGlzIG5vdCBzZXQKQ09ORklHX1VCSUZTX0ZTX0xaTz15CkNPTkZJR19VQklGU19G
U19aTElCPXkKQ09ORklHX1VCSUZTX0ZTX1pTVEQ9eQojIENPTkZJR19VQklGU19BVElNRV9TVVBQ
T1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfVUJJRlNfRlNfWEFUVFIgaXMgbm90IHNldApDT05GSUdf
VUJJRlNfRlNfQVVUSEVOVElDQVRJT049eQpDT05GSUdfQ1JBTUZTPXkKIyBDT05GSUdfQ1JBTUZT
X01URCBpcyBub3Qgc2V0CkNPTkZJR19ST01GU19GUz15CkNPTkZJR19ST01GU19CQUNLRURfQllf
TVREPXkKQ09ORklHX1JPTUZTX09OX01URD15CkNPTkZJR19QU1RPUkU9eQpDT05GSUdfUFNUT1JF
X0RFRkFVTFRfS01TR19CWVRFUz0xMDI0MApDT05GSUdfUFNUT1JFX0RFRkxBVEVfQ09NUFJFU1M9
eQojIENPTkZJR19QU1RPUkVfTFpPX0NPTVBSRVNTIGlzIG5vdCBzZXQKIyBDT05GSUdfUFNUT1JF
X0xaNF9DT01QUkVTUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BTVE9SRV9MWjRIQ19DT01QUkVTUyBp
cyBub3Qgc2V0CkNPTkZJR19QU1RPUkVfODQyX0NPTVBSRVNTPXkKIyBDT05GSUdfUFNUT1JFX1pT
VERfQ09NUFJFU1MgaXMgbm90IHNldApDT05GSUdfUFNUT1JFX0NPTVBSRVNTPXkKIyBDT05GSUdf
UFNUT1JFX0RFRkxBVEVfQ09NUFJFU1NfREVGQVVMVCBpcyBub3Qgc2V0CkNPTkZJR19QU1RPUkVf
ODQyX0NPTVBSRVNTX0RFRkFVTFQ9eQpDT05GSUdfUFNUT1JFX0NPTVBSRVNTX0RFRkFVTFQ9Ijg0
MiIKIyBDT05GSUdfUFNUT1JFX0NPTlNPTEUgaXMgbm90IHNldApDT05GSUdfUFNUT1JFX1BNU0c9
eQpDT05GSUdfUFNUT1JFX1JBTT15CkNPTkZJR19ORVRXT1JLX0ZJTEVTWVNURU1TPXkKQ09ORklH
X05GU19GUz15CkNPTkZJR19ORlNfVjI9eQpDT05GSUdfTkZTX1YzPXkKIyBDT05GSUdfTkZTX1Yz
X0FDTCBpcyBub3Qgc2V0CkNPTkZJR19ORlNfVjQ9bQojIENPTkZJR19ORlNfVjRfMSBpcyBub3Qg
c2V0CiMgQ09ORklHX1JPT1RfTkZTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZTX0ZTQ0FDSEUgaXMg
bm90IHNldAojIENPTkZJR19ORlNfVVNFX0xFR0FDWV9ETlMgaXMgbm90IHNldApDT05GSUdfTkZT
X1VTRV9LRVJORUxfRE5TPXkKQ09ORklHX05GU19ESVNBQkxFX1VEUF9TVVBQT1JUPXkKIyBDT05G
SUdfTkZTRCBpcyBub3Qgc2V0CkNPTkZJR19HUkFDRV9QRVJJT0Q9eQpDT05GSUdfTE9DS0Q9eQpD
T05GSUdfTE9DS0RfVjQ9eQpDT05GSUdfTkZTX0NPTU1PTj15CkNPTkZJR19TVU5SUEM9eQpDT05G
SUdfU1VOUlBDX0dTUz1tCiMgQ09ORklHX1NVTlJQQ19ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklH
X0NFUEhfRlMgaXMgbm90IHNldApDT05GSUdfQ0lGUz1tCkNPTkZJR19DSUZTX1NUQVRTMj15CkNP
TkZJR19DSUZTX0FMTE9XX0lOU0VDVVJFX0xFR0FDWT15CiMgQ09ORklHX0NJRlNfVVBDQUxMIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ0lGU19YQVRUUiBpcyBub3Qgc2V0CkNPTkZJR19DSUZTX0RFQlVH
PXkKIyBDT05GSUdfQ0lGU19ERUJVRzIgaXMgbm90IHNldAojIENPTkZJR19DSUZTX0RFQlVHX0RV
TVBfS0VZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NJRlNfREZTX1VQQ0FMTCBpcyBub3Qgc2V0CiMg
Q09ORklHX0NJRlNfU1dOX1VQQ0FMTCBpcyBub3Qgc2V0CiMgQ09ORklHX0NJRlNfRlNDQUNIRSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NNQl9TRVJWRVIgaXMgbm90IHNldApDT05GSUdfU01CRlNfQ09N
TU9OPW0KIyBDT05GSUdfQ09EQV9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0FGU19GUyBpcyBub3Qg
c2V0CiMgQ09ORklHXzlQX0ZTIGlzIG5vdCBzZXQKQ09ORklHX05MUz15CkNPTkZJR19OTFNfREVG
QVVMVD0iaXNvODg1OS0xIgpDT05GSUdfTkxTX0NPREVQQUdFXzQzNz15CkNPTkZJR19OTFNfQ09E
RVBBR0VfNzM3PXkKQ09ORklHX05MU19DT0RFUEFHRV83NzU9eQpDT05GSUdfTkxTX0NPREVQQUdF
Xzg1MD15CkNPTkZJR19OTFNfQ09ERVBBR0VfODUyPXkKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg1
NSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NTcgaXMgbm90IHNldAojIENPTkZJ
R19OTFNfQ09ERVBBR0VfODYwIGlzIG5vdCBzZXQKQ09ORklHX05MU19DT0RFUEFHRV84NjE9eQoj
IENPTkZJR19OTFNfQ09ERVBBR0VfODYyIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdF
Xzg2MyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NjQgaXMgbm90IHNldApDT05G
SUdfTkxTX0NPREVQQUdFXzg2NT15CiMgQ09ORklHX05MU19DT0RFUEFHRV84NjYgaXMgbm90IHNl
dApDT05GSUdfTkxTX0NPREVQQUdFXzg2OT15CiMgQ09ORklHX05MU19DT0RFUEFHRV85MzYgaXMg
bm90IHNldApDT05GSUdfTkxTX0NPREVQQUdFXzk1MD15CiMgQ09ORklHX05MU19DT0RFUEFHRV85
MzIgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfOTQ5IGlzIG5vdCBzZXQKIyBDT05G
SUdfTkxTX0NPREVQQUdFXzg3NCBpcyBub3Qgc2V0CkNPTkZJR19OTFNfSVNPODg1OV84PXkKQ09O
RklHX05MU19DT0RFUEFHRV8xMjUwPXkKQ09ORklHX05MU19DT0RFUEFHRV8xMjUxPXkKQ09ORklH
X05MU19BU0NJST15CiMgQ09ORklHX05MU19JU084ODU5XzEgaXMgbm90IHNldApDT05GSUdfTkxT
X0lTTzg4NTlfMj15CkNPTkZJR19OTFNfSVNPODg1OV8zPXkKQ09ORklHX05MU19JU084ODU5XzQ9
eQpDT05GSUdfTkxTX0lTTzg4NTlfNT15CiMgQ09ORklHX05MU19JU084ODU5XzYgaXMgbm90IHNl
dApDT05GSUdfTkxTX0lTTzg4NTlfNz15CiMgQ09ORklHX05MU19JU084ODU5XzkgaXMgbm90IHNl
dApDT05GSUdfTkxTX0lTTzg4NTlfMTM9eQpDT05GSUdfTkxTX0lTTzg4NTlfMTQ9eQpDT05GSUdf
TkxTX0lTTzg4NTlfMTU9eQpDT05GSUdfTkxTX0tPSThfUj15CkNPTkZJR19OTFNfS09JOF9VPXkK
Q09ORklHX05MU19NQUNfUk9NQU49eQojIENPTkZJR19OTFNfTUFDX0NFTFRJQyBpcyBub3Qgc2V0
CkNPTkZJR19OTFNfTUFDX0NFTlRFVVJPPXkKIyBDT05GSUdfTkxTX01BQ19DUk9BVElBTiBpcyBu
b3Qgc2V0CkNPTkZJR19OTFNfTUFDX0NZUklMTElDPXkKIyBDT05GSUdfTkxTX01BQ19HQUVMSUMg
aXMgbm90IHNldApDT05GSUdfTkxTX01BQ19HUkVFSz15CkNPTkZJR19OTFNfTUFDX0lDRUxBTkQ9
eQpDT05GSUdfTkxTX01BQ19JTlVJVD15CiMgQ09ORklHX05MU19NQUNfUk9NQU5JQU4gaXMgbm90
IHNldApDT05GSUdfTkxTX01BQ19UVVJLSVNIPXkKQ09ORklHX05MU19VVEY4PXkKIyBDT05GSUdf
RExNIGlzIG5vdCBzZXQKIyBDT05GSUdfVU5JQ09ERSBpcyBub3Qgc2V0CkNPTkZJR19JT19XUT15
CiMgZW5kIG9mIEZpbGUgc3lzdGVtcwoKIwojIFNlY3VyaXR5IG9wdGlvbnMKIwpDT05GSUdfS0VZ
Uz15CkNPTkZJR19LRVlTX1JFUVVFU1RfQ0FDSEU9eQpDT05GSUdfUEVSU0lTVEVOVF9LRVlSSU5H
Uz15CiMgQ09ORklHX1RSVVNURURfS0VZUyBpcyBub3Qgc2V0CkNPTkZJR19FTkNSWVBURURfS0VZ
Uz15CiMgQ09ORklHX1VTRVJfREVDUllQVEVEX0RBVEEgaXMgbm90IHNldApDT05GSUdfS0VZX0RI
X09QRVJBVElPTlM9eQojIENPTkZJR19TRUNVUklUWV9ETUVTR19SRVNUUklDVCBpcyBub3Qgc2V0
CkNPTkZJR19TRUNVUklUWT15CiMgQ09ORklHX1NFQ1VSSVRZRlMgaXMgbm90IHNldAojIENPTkZJ
R19TRUNVUklUWV9ORVRXT1JLIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfUEFUSCBpcyBu
b3Qgc2V0CkNPTkZJR19GT1JUSUZZX1NPVVJDRT15CkNPTkZJR19TVEFUSUNfVVNFUk1PREVIRUxQ
RVI9eQpDT05GSUdfU1RBVElDX1VTRVJNT0RFSEVMUEVSX1BBVEg9Ii9zYmluL3VzZXJtb2RlLWhl
bHBlciIKIyBDT05GSUdfU0VDVVJJVFlfU01BQ0sgaXMgbm90IHNldAojIENPTkZJR19TRUNVUklU
WV9UT01PWU8gaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9BUFBBUk1PUiBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFQ1VSSVRZX1lBTUEgaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9TQUZF
U0VUSUQgaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9MT0NLRE9XTl9MU00gaXMgbm90IHNl
dAojIENPTkZJR19TRUNVUklUWV9MQU5ETE9DSyBpcyBub3Qgc2V0CkNPTkZJR19JTlRFR1JJVFk9
eQojIENPTkZJR19JTlRFR1JJVFlfU0lHTkFUVVJFIGlzIG5vdCBzZXQKIyBDT05GSUdfSU1BIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU1BX1NFQ1VSRV9BTkRfT1JfVFJVU1RFRF9CT09UIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRVZNIGlzIG5vdCBzZXQKQ09ORklHX0RFRkFVTFRfU0VDVVJJVFlfREFDPXkK
Q09ORklHX0xTTT0ibGFuZGxvY2ssbG9ja2Rvd24seWFtYSxsb2FkcGluLHNhZmVzZXRpZCxpbnRl
Z3JpdHksYnBmIgoKIwojIEtlcm5lbCBoYXJkZW5pbmcgb3B0aW9ucwojCgojCiMgTWVtb3J5IGlu
aXRpYWxpemF0aW9uCiMKQ09ORklHX0lOSVRfU1RBQ0tfTk9ORT15CiMgQ09ORklHX0dDQ19QTFVH
SU5fU1RSVUNUTEVBS19VU0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfR0NDX1BMVUdJTl9TVFJVQ1RM
RUFLX0JZUkVGIGlzIG5vdCBzZXQKIyBDT05GSUdfR0NDX1BMVUdJTl9TVFJVQ1RMRUFLX0JZUkVG
X0FMTCBpcyBub3Qgc2V0CiMgQ09ORklHX0dDQ19QTFVHSU5fU1RBQ0tMRUFLIGlzIG5vdCBzZXQK
Q09ORklHX0lOSVRfT05fQUxMT0NfREVGQVVMVF9PTj15CkNPTkZJR19JTklUX09OX0ZSRUVfREVG
QVVMVF9PTj15CkNPTkZJR19DQ19IQVNfWkVST19DQUxMX1VTRURfUkVHUz15CiMgQ09ORklHX1pF
Uk9fQ0FMTF9VU0VEX1JFR1MgaXMgbm90IHNldAojIGVuZCBvZiBNZW1vcnkgaW5pdGlhbGl6YXRp
b24KCkNPTkZJR19SQU5EU1RSVUNUX05PTkU9eQojIENPTkZJR19SQU5EU1RSVUNUX0ZVTEwgaXMg
bm90IHNldAojIENPTkZJR19SQU5EU1RSVUNUX1BFUkZPUk1BTkNFIGlzIG5vdCBzZXQKIyBlbmQg
b2YgS2VybmVsIGhhcmRlbmluZyBvcHRpb25zCiMgZW5kIG9mIFNlY3VyaXR5IG9wdGlvbnMKCkNP
TkZJR19DUllQVE89eQoKIwojIENyeXB0byBjb3JlIG9yIGhlbHBlcgojCkNPTkZJR19DUllQVE9f
QUxHQVBJPXkKQ09ORklHX0NSWVBUT19BTEdBUEkyPXkKQ09ORklHX0NSWVBUT19BRUFEPXkKQ09O
RklHX0NSWVBUT19BRUFEMj15CkNPTkZJR19DUllQVE9fU0tDSVBIRVI9eQpDT05GSUdfQ1JZUFRP
X1NLQ0lQSEVSMj15CkNPTkZJR19DUllQVE9fSEFTSD15CkNPTkZJR19DUllQVE9fSEFTSDI9eQpD
T05GSUdfQ1JZUFRPX1JORz15CkNPTkZJR19DUllQVE9fUk5HMj15CkNPTkZJR19DUllQVE9fUk5H
X0RFRkFVTFQ9eQpDT05GSUdfQ1JZUFRPX0FLQ0lQSEVSMj15CkNPTkZJR19DUllQVE9fQUtDSVBI
RVI9eQpDT05GSUdfQ1JZUFRPX0tQUDI9eQpDT05GSUdfQ1JZUFRPX0tQUD15CkNPTkZJR19DUllQ
VE9fQUNPTVAyPXkKQ09ORklHX0NSWVBUT19NQU5BR0VSPXkKQ09ORklHX0NSWVBUT19NQU5BR0VS
Mj15CiMgQ09ORklHX0NSWVBUT19VU0VSIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19NQU5BR0VS
X0RJU0FCTEVfVEVTVFM9eQpDT05GSUdfQ1JZUFRPX0dGMTI4TVVMPXkKQ09ORklHX0NSWVBUT19O
VUxMPXkKQ09ORklHX0NSWVBUT19OVUxMMj15CkNPTkZJR19DUllQVE9fQ1JZUFREPXkKQ09ORklH
X0NSWVBUT19BVVRIRU5DPXkKIyBDT05GSUdfQ1JZUFRPX1RFU1QgaXMgbm90IHNldApDT05GSUdf
Q1JZUFRPX1NJTUQ9eQoKIwojIFB1YmxpYy1rZXkgY3J5cHRvZ3JhcGh5CiMKQ09ORklHX0NSWVBU
T19SU0E9eQpDT05GSUdfQ1JZUFRPX0RIPXkKIyBDT05GSUdfQ1JZUFRPX0RIX1JGQzc5MTlfR1JP
VVBTIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19FQ0M9eQojIENPTkZJR19DUllQVE9fRUNESCBp
cyBub3Qgc2V0CkNPTkZJR19DUllQVE9fRUNEU0E9eQpDT05GSUdfQ1JZUFRPX0VDUkRTQT15CkNP
TkZJR19DUllQVE9fU00yPXkKIyBDT05GSUdfQ1JZUFRPX0NVUlZFMjU1MTkgaXMgbm90IHNldAoj
IENPTkZJR19DUllQVE9fQ1VSVkUyNTUxOV9YODYgaXMgbm90IHNldAoKIwojIEF1dGhlbnRpY2F0
ZWQgRW5jcnlwdGlvbiB3aXRoIEFzc29jaWF0ZWQgRGF0YQojCkNPTkZJR19DUllQVE9fQ0NNPXkK
Q09ORklHX0NSWVBUT19HQ009eQpDT05GSUdfQ1JZUFRPX0NIQUNIQTIwUE9MWTEzMDU9eQpDT05G
SUdfQ1JZUFRPX0FFR0lTMTI4PXkKQ09ORklHX0NSWVBUT19BRUdJUzEyOF9BRVNOSV9TU0UyPXkK
IyBDT05GSUdfQ1JZUFRPX1NFUUlWIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0VDSEFJTklW
IGlzIG5vdCBzZXQKCiMKIyBCbG9jayBtb2RlcwojCkNPTkZJR19DUllQVE9fQ0JDPXkKQ09ORklH
X0NSWVBUT19DRkI9eQpDT05GSUdfQ1JZUFRPX0NUUj15CiMgQ09ORklHX0NSWVBUT19DVFMgaXMg
bm90IHNldApDT05GSUdfQ1JZUFRPX0VDQj15CiMgQ09ORklHX0NSWVBUT19MUlcgaXMgbm90IHNl
dApDT05GSUdfQ1JZUFRPX09GQj15CiMgQ09ORklHX0NSWVBUT19QQ0JDIGlzIG5vdCBzZXQKQ09O
RklHX0NSWVBUT19YVFM9eQojIENPTkZJR19DUllQVE9fS0VZV1JBUCBpcyBub3Qgc2V0CkNPTkZJ
R19DUllQVE9fTkhQT0xZMTMwNT15CkNPTkZJR19DUllQVE9fTkhQT0xZMTMwNV9TU0UyPXkKIyBD
T05GSUdfQ1JZUFRPX05IUE9MWTEzMDVfQVZYMiBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fQURJ
QU5UVU09eQojIENPTkZJR19DUllQVE9fSENUUjIgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0VT
U0lWPXkKCiMKIyBIYXNoIG1vZGVzCiMKQ09ORklHX0NSWVBUT19DTUFDPW0KQ09ORklHX0NSWVBU
T19ITUFDPXkKQ09ORklHX0NSWVBUT19YQ0JDPXkKQ09ORklHX0NSWVBUT19WTUFDPXkKCiMKIyBE
aWdlc3QKIwpDT05GSUdfQ1JZUFRPX0NSQzMyQz15CkNPTkZJR19DUllQVE9fQ1JDMzJDX0lOVEVM
PXkKIyBDT05GSUdfQ1JZUFRPX0NSQzMyIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19DUkMzMl9Q
Q0xNVUw9eQpDT05GSUdfQ1JZUFRPX1hYSEFTSD15CkNPTkZJR19DUllQVE9fQkxBS0UyQj15CiMg
Q09ORklHX0NSWVBUT19CTEFLRTJTX1g4NiBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fQ1JDVDEw
RElGPXkKIyBDT05GSUdfQ1JZUFRPX0NSQ1QxMERJRl9QQ0xNVUwgaXMgbm90IHNldApDT05GSUdf
Q1JZUFRPX0dIQVNIPXkKIyBDT05GSUdfQ1JZUFRPX1BPTFlWQUxfQ0xNVUxfTkkgaXMgbm90IHNl
dApDT05GSUdfQ1JZUFRPX1BPTFkxMzA1PXkKQ09ORklHX0NSWVBUT19QT0xZMTMwNV9YODZfNjQ9
eQpDT05GSUdfQ1JZUFRPX01END15CkNPTkZJR19DUllQVE9fTUQ1PW0KQ09ORklHX0NSWVBUT19N
SUNIQUVMX01JQz15CkNPTkZJR19DUllQVE9fUk1EMTYwPXkKQ09ORklHX0NSWVBUT19TSEExPXkK
Q09ORklHX0NSWVBUT19TSEExX1NTU0UzPXkKQ09ORklHX0NSWVBUT19TSEEyNTZfU1NTRTM9eQoj
IENPTkZJR19DUllQVE9fU0hBNTEyX1NTU0UzIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19TSEEy
NTY9eQpDT05GSUdfQ1JZUFRPX1NIQTUxMj15CkNPTkZJR19DUllQVE9fU0hBMz15CkNPTkZJR19D
UllQVE9fU00zPXkKIyBDT05GSUdfQ1JZUFRPX1NNM19HRU5FUklDIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ1JZUFRPX1NNM19BVlhfWDg2XzY0IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19TVFJFRUJP
Rz15CkNPTkZJR19DUllQVE9fV1A1MTI9eQpDT05GSUdfQ1JZUFRPX0dIQVNIX0NMTVVMX05JX0lO
VEVMPXkKCiMKIyBDaXBoZXJzCiMKQ09ORklHX0NSWVBUT19BRVM9eQpDT05GSUdfQ1JZUFRPX0FF
U19UST15CkNPTkZJR19DUllQVE9fQUVTX05JX0lOVEVMPXkKQ09ORklHX0NSWVBUT19CTE9XRklT
SD15CkNPTkZJR19DUllQVE9fQkxPV0ZJU0hfQ09NTU9OPXkKQ09ORklHX0NSWVBUT19CTE9XRklT
SF9YODZfNjQ9eQojIENPTkZJR19DUllQVE9fQ0FNRUxMSUEgaXMgbm90IHNldApDT05GSUdfQ1JZ
UFRPX0NBTUVMTElBX1g4Nl82ND15CkNPTkZJR19DUllQVE9fQ0FNRUxMSUFfQUVTTklfQVZYX1g4
Nl82ND15CkNPTkZJR19DUllQVE9fQ0FNRUxMSUFfQUVTTklfQVZYMl9YODZfNjQ9eQpDT05GSUdf
Q1JZUFRPX0NBU1RfQ09NTU9OPXkKIyBDT05GSUdfQ1JZUFRPX0NBU1Q1IGlzIG5vdCBzZXQKIyBD
T05GSUdfQ1JZUFRPX0NBU1Q1X0FWWF9YODZfNjQgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0NB
U1Q2PXkKQ09ORklHX0NSWVBUT19DQVNUNl9BVlhfWDg2XzY0PXkKQ09ORklHX0NSWVBUT19ERVM9
eQpDT05GSUdfQ1JZUFRPX0RFUzNfRURFX1g4Nl82ND15CkNPTkZJR19DUllQVE9fRkNSWVBUPXkK
Q09ORklHX0NSWVBUT19DSEFDSEEyMD15CkNPTkZJR19DUllQVE9fQ0hBQ0hBMjBfWDg2XzY0PXkK
IyBDT05GSUdfQ1JZUFRPX0FSSUEgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1NFUlBFTlQ9eQoj
IENPTkZJR19DUllQVE9fU0VSUEVOVF9TU0UyX1g4Nl82NCBpcyBub3Qgc2V0CkNPTkZJR19DUllQ
VE9fU0VSUEVOVF9BVlhfWDg2XzY0PXkKQ09ORklHX0NSWVBUT19TRVJQRU5UX0FWWDJfWDg2XzY0
PXkKQ09ORklHX0NSWVBUT19TTTQ9eQojIENPTkZJR19DUllQVE9fU000X0dFTkVSSUMgaXMgbm90
IHNldApDT05GSUdfQ1JZUFRPX1NNNF9BRVNOSV9BVlhfWDg2XzY0PXkKQ09ORklHX0NSWVBUT19T
TTRfQUVTTklfQVZYMl9YODZfNjQ9eQojIENPTkZJR19DUllQVE9fVFdPRklTSCBpcyBub3Qgc2V0
CkNPTkZJR19DUllQVE9fVFdPRklTSF9DT01NT049eQpDT05GSUdfQ1JZUFRPX1RXT0ZJU0hfWDg2
XzY0PXkKQ09ORklHX0NSWVBUT19UV09GSVNIX1g4Nl82NF8zV0FZPXkKQ09ORklHX0NSWVBUT19U
V09GSVNIX0FWWF9YODZfNjQ9eQoKIwojIENvbXByZXNzaW9uCiMKQ09ORklHX0NSWVBUT19ERUZM
QVRFPXkKQ09ORklHX0NSWVBUT19MWk89eQpDT05GSUdfQ1JZUFRPXzg0Mj15CkNPTkZJR19DUllQ
VE9fTFo0PXkKIyBDT05GSUdfQ1JZUFRPX0xaNEhDIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19a
U1REPXkKCiMKIyBSYW5kb20gTnVtYmVyIEdlbmVyYXRpb24KIwpDT05GSUdfQ1JZUFRPX0FOU0lf
Q1BSTkc9eQpDT05GSUdfQ1JZUFRPX0RSQkdfTUVOVT15CkNPTkZJR19DUllQVE9fRFJCR19ITUFD
PXkKIyBDT05GSUdfQ1JZUFRPX0RSQkdfSEFTSCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fRFJC
R19DVFI9eQpDT05GSUdfQ1JZUFRPX0RSQkc9eQpDT05GSUdfQ1JZUFRPX0pJVFRFUkVOVFJPUFk9
eQpDT05GSUdfQ1JZUFRPX0tERjgwMDEwOF9DVFI9eQojIENPTkZJR19DUllQVE9fVVNFUl9BUElf
SEFTSCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19VU0VSX0FQSV9TS0NJUEhFUiBpcyBub3Qg
c2V0CiMgQ09ORklHX0NSWVBUT19VU0VSX0FQSV9STkcgaXMgbm90IHNldAojIENPTkZJR19DUllQ
VE9fVVNFUl9BUElfQUVBRCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fSEFTSF9JTkZPPXkKIyBD
T05GSUdfQ1JZUFRPX0hXIGlzIG5vdCBzZXQKQ09ORklHX0FTWU1NRVRSSUNfS0VZX1RZUEU9eQpD
T05GSUdfQVNZTU1FVFJJQ19QVUJMSUNfS0VZX1NVQlRZUEU9eQpDT05GSUdfWDUwOV9DRVJUSUZJ
Q0FURV9QQVJTRVI9eQojIENPTkZJR19QS0NTOF9QUklWQVRFX0tFWV9QQVJTRVIgaXMgbm90IHNl
dApDT05GSUdfUEtDUzdfTUVTU0FHRV9QQVJTRVI9eQojIENPTkZJR19QS0NTN19URVNUX0tFWSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NJR05FRF9QRV9GSUxFX1ZFUklGSUNBVElPTiBpcyBub3Qgc2V0
CiMgQ09ORklHX0ZJUFNfU0lHTkFUVVJFX1NFTEZURVNUIGlzIG5vdCBzZXQKCiMKIyBDZXJ0aWZp
Y2F0ZXMgZm9yIHNpZ25hdHVyZSBjaGVja2luZwojCkNPTkZJR19TWVNURU1fVFJVU1RFRF9LRVlS
SU5HPXkKQ09ORklHX1NZU1RFTV9UUlVTVEVEX0tFWVM9IiIKQ09ORklHX1NZU1RFTV9FWFRSQV9D
RVJUSUZJQ0FURT15CkNPTkZJR19TWVNURU1fRVhUUkFfQ0VSVElGSUNBVEVfU0laRT00MDk2CiMg
Q09ORklHX1NFQ09OREFSWV9UUlVTVEVEX0tFWVJJTkcgaXMgbm90IHNldApDT05GSUdfU1lTVEVN
X0JMQUNLTElTVF9LRVlSSU5HPXkKQ09ORklHX1NZU1RFTV9CTEFDS0xJU1RfSEFTSF9MSVNUPSIi
CiMgQ09ORklHX1NZU1RFTV9SRVZPQ0FUSU9OX0xJU1QgaXMgbm90IHNldAojIENPTkZJR19TWVNU
RU1fQkxBQ0tMSVNUX0FVVEhfVVBEQVRFIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ2VydGlmaWNhdGVz
IGZvciBzaWduYXR1cmUgY2hlY2tpbmcKCkNPTkZJR19CSU5BUllfUFJJTlRGPXkKCiMKIyBMaWJy
YXJ5IHJvdXRpbmVzCiMKQ09ORklHX0xJTkVBUl9SQU5HRVM9eQpDT05GSUdfUEFDS0lORz15CkNP
TkZJR19CSVRSRVZFUlNFPXkKQ09ORklHX0dFTkVSSUNfU1RSTkNQWV9GUk9NX1VTRVI9eQpDT05G
SUdfR0VORVJJQ19TVFJOTEVOX1VTRVI9eQpDT05GSUdfR0VORVJJQ19ORVRfVVRJTFM9eQpDT05G
SUdfQ09SRElDPXkKQ09ORklHX1BSSU1FX05VTUJFUlM9eQpDT05GSUdfUkFUSU9OQUw9eQpDT05G
SUdfR0VORVJJQ19QQ0lfSU9NQVA9eQpDT05GSUdfR0VORVJJQ19JT01BUD15CkNPTkZJR19BUkNI
X1VTRV9DTVBYQ0hHX0xPQ0tSRUY9eQpDT05GSUdfQVJDSF9IQVNfRkFTVF9NVUxUSVBMSUVSPXkK
Q09ORklHX0FSQ0hfVVNFX1NZTV9BTk5PVEFUSU9OUz15CgojCiMgQ3J5cHRvIGxpYnJhcnkgcm91
dGluZXMKIwpDT05GSUdfQ1JZUFRPX0xJQl9BRVM9eQpDT05GSUdfQ1JZUFRPX0xJQl9CTEFLRTJT
X0dFTkVSSUM9eQpDT05GSUdfQ1JZUFRPX0FSQ0hfSEFWRV9MSUJfQ0hBQ0hBPXkKQ09ORklHX0NS
WVBUT19MSUJfQ0hBQ0hBX0dFTkVSSUM9eQojIENPTkZJR19DUllQVE9fTElCX0NIQUNIQSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19MSUJfQ1VSVkUyNTUxOSBpcyBub3Qgc2V0CkNPTkZJR19D
UllQVE9fTElCX0RFUz15CkNPTkZJR19DUllQVE9fTElCX1BPTFkxMzA1X1JTSVpFPTExCkNPTkZJ
R19DUllQVE9fQVJDSF9IQVZFX0xJQl9QT0xZMTMwNT15CkNPTkZJR19DUllQVE9fTElCX1BPTFkx
MzA1X0dFTkVSSUM9eQojIENPTkZJR19DUllQVE9fTElCX1BPTFkxMzA1IGlzIG5vdCBzZXQKIyBD
T05GSUdfQ1JZUFRPX0xJQl9DSEFDSEEyMFBPTFkxMzA1IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBU
T19MSUJfU0hBMT15CkNPTkZJR19DUllQVE9fTElCX1NIQTI1Nj15CiMgZW5kIG9mIENyeXB0byBs
aWJyYXJ5IHJvdXRpbmVzCgpDT05GSUdfTElCX01FTU5FUT15CkNPTkZJR19DUkNfQ0NJVFQ9eQpD
T05GSUdfQ1JDMTY9eQpDT05GSUdfQ1JDX1QxMERJRj15CiMgQ09ORklHX0NSQzY0X1JPQ0tTT0ZU
IGlzIG5vdCBzZXQKQ09ORklHX0NSQ19JVFVfVD15CkNPTkZJR19DUkMzMj15CiMgQ09ORklHX0NS
QzMyX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JDMzJfU0xJQ0VCWTggaXMgbm90IHNl
dAojIENPTkZJR19DUkMzMl9TTElDRUJZNCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSQzMyX1NBUldB
VEUgaXMgbm90IHNldApDT05GSUdfQ1JDMzJfQklUPXkKIyBDT05GSUdfQ1JDNjQgaXMgbm90IHNl
dApDT05GSUdfQ1JDND15CiMgQ09ORklHX0NSQzcgaXMgbm90IHNldApDT05GSUdfTElCQ1JDMzJD
PXkKQ09ORklHX0NSQzg9eQpDT05GSUdfWFhIQVNIPXkKIyBDT05GSUdfUkFORE9NMzJfU0VMRlRF
U1QgaXMgbm90IHNldApDT05GSUdfODQyX0NPTVBSRVNTPXkKQ09ORklHXzg0Ml9ERUNPTVBSRVNT
PXkKQ09ORklHX1pMSUJfSU5GTEFURT15CkNPTkZJR19aTElCX0RFRkxBVEU9eQpDT05GSUdfTFpP
X0NPTVBSRVNTPXkKQ09ORklHX0xaT19ERUNPTVBSRVNTPXkKQ09ORklHX0xaNF9DT01QUkVTUz15
CkNPTkZJR19MWjRfREVDT01QUkVTUz15CkNPTkZJR19aU1REX0NPTVBSRVNTPXkKQ09ORklHX1pT
VERfREVDT01QUkVTUz15CkNPTkZJR19YWl9ERUM9eQojIENPTkZJR19YWl9ERUNfWDg2IGlzIG5v
dCBzZXQKIyBDT05GSUdfWFpfREVDX1BPV0VSUEMgaXMgbm90IHNldAojIENPTkZJR19YWl9ERUNf
SUE2NCBpcyBub3Qgc2V0CkNPTkZJR19YWl9ERUNfQVJNPXkKIyBDT05GSUdfWFpfREVDX0FSTVRI
VU1CIGlzIG5vdCBzZXQKQ09ORklHX1haX0RFQ19TUEFSQz15CiMgQ09ORklHX1haX0RFQ19NSUNS
T0xaTUEgaXMgbm90IHNldApDT05GSUdfWFpfREVDX0JDSj15CiMgQ09ORklHX1haX0RFQ19URVNU
IGlzIG5vdCBzZXQKQ09ORklHX0RFQ09NUFJFU1NfR1pJUD15CkNPTkZJR19ERUNPTVBSRVNTX0Ja
SVAyPXkKQ09ORklHX0RFQ09NUFJFU1NfWFo9eQpDT05GSUdfREVDT01QUkVTU19aU1REPXkKQ09O
RklHX0dFTkVSSUNfQUxMT0NBVE9SPXkKQ09ORklHX1JFRURfU09MT01PTj15CkNPTkZJR19SRUVE
X1NPTE9NT05fRU5DOD15CkNPTkZJR19SRUVEX1NPTE9NT05fREVDOD15CkNPTkZJR19SRUVEX1NP
TE9NT05fREVDMTY9eQpDT05GSUdfQkNIPXkKQ09ORklHX0lOVEVSVkFMX1RSRUU9eQpDT05GSUdf
QVNTT0NJQVRJVkVfQVJSQVk9eQpDT05GSUdfSEFTX0lPTUVNPXkKQ09ORklHX0hBU19JT1BPUlRf
TUFQPXkKQ09ORklHX0hBU19ETUE9eQpDT05GSUdfRE1BX09QUz15CkNPTkZJR19ORUVEX1NHX0RN
QV9MRU5HVEg9eQpDT05GSUdfTkVFRF9ETUFfTUFQX1NUQVRFPXkKQ09ORklHX0FSQ0hfRE1BX0FE
RFJfVF82NEJJVD15CkNPTkZJR19TV0lPVExCPXkKQ09ORklHX0RNQV9DTUE9eQpDT05GSUdfRE1B
X1BFUk5VTUFfQ01BPXkKCiMKIyBEZWZhdWx0IGNvbnRpZ3VvdXMgbWVtb3J5IGFyZWEgc2l6ZToK
IwpDT05GSUdfQ01BX1NJWkVfTUJZVEVTPTAKQ09ORklHX0NNQV9TSVpFX1BFUkNFTlRBR0U9MAoj
IENPTkZJR19DTUFfU0laRV9TRUxfTUJZVEVTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ01BX1NJWkVf
U0VMX1BFUkNFTlRBR0UgaXMgbm90IHNldAojIENPTkZJR19DTUFfU0laRV9TRUxfTUlOIGlzIG5v
dCBzZXQKQ09ORklHX0NNQV9TSVpFX1NFTF9NQVg9eQpDT05GSUdfQ01BX0FMSUdOTUVOVD04CiMg
Q09ORklHX0RNQV9BUElfREVCVUcgaXMgbm90IHNldApDT05GSUdfRE1BX01BUF9CRU5DSE1BUks9
eQpDT05GSUdfU0dMX0FMTE9DPXkKQ09ORklHX0RRTD15CkNPTkZJR19HTE9CPXkKIyBDT05GSUdf
R0xPQl9TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19OTEFUVFI9eQpDT05GSUdfQ0xaX1RBQj15
CiMgQ09ORklHX0lSUV9QT0xMIGlzIG5vdCBzZXQKQ09ORklHX01QSUxJQj15CkNPTkZJR19PSURf
UkVHSVNUUlk9eQpDT05GSUdfVUNTMl9TVFJJTkc9eQpDT05GSUdfSEFWRV9HRU5FUklDX1ZEU089
eQpDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVk9eQpDT05GSUdfR0VORVJJQ19WRFNPX1RJTUVf
TlM9eQpDT05GSUdfRk9OVF9TVVBQT1JUPXkKQ09ORklHX0ZPTlRfOHgxNj15CkNPTkZJR19GT05U
X0FVVE9TRUxFQ1Q9eQpDT05GSUdfQVJDSF9IQVNfUE1FTV9BUEk9eQpDT05GSUdfQVJDSF9IQVNf
VUFDQ0VTU19GTFVTSENBQ0hFPXkKQ09ORklHX0FSQ0hfSEFTX0NPUFlfTUM9eQpDT05GSUdfQVJD
SF9TVEFDS1dBTEs9eQpDT05GSUdfU1RBQ0tERVBPVD15CkNPTkZJR19SRUZfVFJBQ0tFUj15CiMg
ZW5kIG9mIExpYnJhcnkgcm91dGluZXMKCiMKIyBLZXJuZWwgaGFja2luZwojCgojCiMgcHJpbnRr
IGFuZCBkbWVzZyBvcHRpb25zCiMKQ09ORklHX1BSSU5US19USU1FPXkKQ09ORklHX1BSSU5US19D
QUxMRVI9eQojIENPTkZJR19TVEFDS1RSQUNFX0JVSUxEX0lEIGlzIG5vdCBzZXQKQ09ORklHX0NP
TlNPTEVfTE9HTEVWRUxfREVGQVVMVD03CkNPTkZJR19DT05TT0xFX0xPR0xFVkVMX1FVSUVUPTQK
Q09ORklHX01FU1NBR0VfTE9HTEVWRUxfREVGQVVMVD00CiMgQ09ORklHX0JPT1RfUFJJTlRLX0RF
TEFZIGlzIG5vdCBzZXQKIyBDT05GSUdfRFlOQU1JQ19ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklH
X0RZTkFNSUNfREVCVUdfQ09SRSBpcyBub3Qgc2V0CkNPTkZJR19TWU1CT0xJQ19FUlJOQU1FPXkK
Q09ORklHX0RFQlVHX0JVR1ZFUkJPU0U9eQojIGVuZCBvZiBwcmludGsgYW5kIGRtZXNnIG9wdGlv
bnMKCkNPTkZJR19ERUJVR19LRVJORUw9eQpDT05GSUdfREVCVUdfTUlTQz15CgojCiMgQ29tcGls
ZS10aW1lIGNoZWNrcyBhbmQgY29tcGlsZXIgb3B0aW9ucwojCkNPTkZJR19ERUJVR19JTkZPPXkK
IyBDT05GSUdfREVCVUdfSU5GT19OT05FIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfSU5GT19E
V0FSRl9UT09MQ0hBSU5fREVGQVVMVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0lORk9fRFdB
UkY0IGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX0lORk9fRFdBUkY1PXkKQ09ORklHX0RFQlVHX0lO
Rk9fUkVEVUNFRD15CiMgQ09ORklHX0RFQlVHX0lORk9fQ09NUFJFU1NFRCBpcyBub3Qgc2V0CiMg
Q09ORklHX0RFQlVHX0lORk9fU1BMSVQgaXMgbm90IHNldApDT05GSUdfUEFIT0xFX0hBU19TUExJ
VF9CVEY9eQojIENPTkZJR19HREJfU0NSSVBUUyBpcyBub3Qgc2V0CkNPTkZJR19GUkFNRV9XQVJO
PTgxOTIKIyBDT05GSUdfU1RSSVBfQVNNX1NZTVMgaXMgbm90IHNldApDT05GSUdfUkVBREFCTEVf
QVNNPXkKIyBDT05GSUdfSEVBREVSU19JTlNUQUxMIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX1NF
Q1RJT05fTUlTTUFUQ0g9eQpDT05GSUdfU0VDVElPTl9NSVNNQVRDSF9XQVJOX09OTFk9eQpDT05G
SUdfREVCVUdfRk9SQ0VfRlVOQ1RJT05fQUxJR05fNjRCPXkKQ09ORklHX09CSlRPT0w9eQpDT05G
SUdfTk9JTlNUUl9WQUxJREFUSU9OPXkKQ09ORklHX1ZNTElOVVhfTUFQPXkKIyBDT05GSUdfREVC
VUdfRk9SQ0VfV0VBS19QRVJfQ1BVIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ29tcGlsZS10aW1lIGNo
ZWNrcyBhbmQgY29tcGlsZXIgb3B0aW9ucwoKIwojIEdlbmVyaWMgS2VybmVsIERlYnVnZ2luZyBJ
bnN0cnVtZW50cwojCkNPTkZJR19NQUdJQ19TWVNSUT15CkNPTkZJR19NQUdJQ19TWVNSUV9ERUZB
VUxUX0VOQUJMRT0weDEKQ09ORklHX01BR0lDX1NZU1JRX1NFUklBTD15CkNPTkZJR19NQUdJQ19T
WVNSUV9TRVJJQUxfU0VRVUVOQ0U9IiIKQ09ORklHX0RFQlVHX0ZTPXkKIyBDT05GSUdfREVCVUdf
RlNfQUxMT1dfQUxMIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX0ZTX0RJU0FMTE9XX01PVU5UPXkK
IyBDT05GSUdfREVCVUdfRlNfQUxMT1dfTk9ORSBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hf
S0dEQj15CiMgQ09ORklHX0tHREIgaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfVUJTQU5fU0FO
SVRJWkVfQUxMPXkKQ09ORklHX1VCU0FOPXkKIyBDT05GSUdfVUJTQU5fVFJBUCBpcyBub3Qgc2V0
CkNPTkZJR19DQ19IQVNfVUJTQU5fQk9VTkRTPXkKQ09ORklHX1VCU0FOX0JPVU5EUz15CkNPTkZJ
R19VQlNBTl9PTkxZX0JPVU5EUz15CkNPTkZJR19VQlNBTl9TSElGVD15CiMgQ09ORklHX1VCU0FO
X0RJVl9aRVJPIGlzIG5vdCBzZXQKIyBDT05GSUdfVUJTQU5fQk9PTCBpcyBub3Qgc2V0CiMgQ09O
RklHX1VCU0FOX0VOVU0gaXMgbm90IHNldAojIENPTkZJR19VQlNBTl9BTElHTk1FTlQgaXMgbm90
IHNldApDT05GSUdfVUJTQU5fU0FOSVRJWkVfQUxMPXkKIyBDT05GSUdfVEVTVF9VQlNBTiBpcyBu
b3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfS0NTQU49eQpDT05GSUdfSEFWRV9LQ1NBTl9DT01QSUxF
Uj15CiMgQ09ORklHX0tDU0FOIGlzIG5vdCBzZXQKIyBlbmQgb2YgR2VuZXJpYyBLZXJuZWwgRGVi
dWdnaW5nIEluc3RydW1lbnRzCgojCiMgTmV0d29ya2luZyBEZWJ1Z2dpbmcKIwpDT05GSUdfTkVU
X0RFVl9SRUZDTlRfVFJBQ0tFUj15CkNPTkZJR19ORVRfTlNfUkVGQ05UX1RSQUNLRVI9eQojIENP
TkZJR19ERUJVR19ORVQgaXMgbm90IHNldAojIGVuZCBvZiBOZXR3b3JraW5nIERlYnVnZ2luZwoK
IwojIE1lbW9yeSBEZWJ1Z2dpbmcKIwpDT05GSUdfUEFHRV9FWFRFTlNJT049eQojIENPTkZJR19E
RUJVR19QQUdFQUxMT0MgaXMgbm90IHNldApDT05GSUdfUEFHRV9PV05FUj15CiMgQ09ORklHX1BB
R0VfVEFCTEVfQ0hFQ0sgaXMgbm90IHNldAojIENPTkZJR19QQUdFX1BPSVNPTklORyBpcyBub3Qg
c2V0CkNPTkZJR19ERUJVR19QQUdFX1JFRj15CiMgQ09ORklHX0RFQlVHX1JPREFUQV9URVNUIGlz
IG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX0RFQlVHX1dYPXkKQ09ORklHX0RFQlVHX1dYPXkKQ09O
RklHX0dFTkVSSUNfUFREVU1QPXkKQ09ORklHX1BURFVNUF9DT1JFPXkKQ09ORklHX1BURFVNUF9E
RUJVR0ZTPXkKQ09ORklHX0RFQlVHX09CSkVDVFM9eQojIENPTkZJR19ERUJVR19PQkpFQ1RTX1NF
TEZURVNUIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX09CSkVDVFNfRlJFRT15CiMgQ09ORklHX0RF
QlVHX09CSkVDVFNfVElNRVJTIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfT0JKRUNUU19XT1JL
IGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfT0JKRUNUU19SQ1VfSEVBRCBpcyBub3Qgc2V0CiMg
Q09ORklHX0RFQlVHX09CSkVDVFNfUEVSQ1BVX0NPVU5URVIgaXMgbm90IHNldApDT05GSUdfREVC
VUdfT0JKRUNUU19FTkFCTEVfREVGQVVMVD0xCiMgQ09ORklHX1NIUklOS0VSX0RFQlVHIGlzIG5v
dCBzZXQKQ09ORklHX0hBVkVfREVCVUdfS01FTUxFQUs9eQojIENPTkZJR19ERUJVR19LTUVNTEVB
SyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1NUQUNLX1VTQUdFIGlzIG5vdCBzZXQKQ09ORklH
X1NDSEVEX1NUQUNLX0VORF9DSEVDSz15CkNPTkZJR19BUkNIX0hBU19ERUJVR19WTV9QR1RBQkxF
PXkKIyBDT05GSUdfREVCVUdfVk0gaXMgbm90IHNldApDT05GSUdfREVCVUdfVk1fUEdUQUJMRT15
CkNPTkZJR19BUkNIX0hBU19ERUJVR19WSVJUVUFMPXkKIyBDT05GSUdfREVCVUdfVklSVFVBTCBp
cyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX01FTU9SWV9JTklUIGlzIG5vdCBzZXQKQ09ORklHX0FS
Q0hfU1VQUE9SVFNfS01BUF9MT0NBTF9GT1JDRV9NQVA9eQojIENPTkZJR19ERUJVR19LTUFQX0xP
Q0FMX0ZPUkNFX01BUCBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfS0FTQU49eQpDT05GSUdf
SEFWRV9BUkNIX0tBU0FOX1ZNQUxMT0M9eQpDT05GSUdfQ0NfSEFTX0tBU0FOX0dFTkVSSUM9eQpD
T05GSUdfQ0NfSEFTX1dPUktJTkdfTk9TQU5JVElaRV9BRERSRVNTPXkKQ09ORklHX0hBVkVfQVJD
SF9LRkVOQ0U9eQojIGVuZCBvZiBNZW1vcnkgRGVidWdnaW5nCgpDT05GSUdfREVCVUdfU0hJUlE9
eQoKIwojIERlYnVnIE9vcHMsIExvY2t1cHMgYW5kIEhhbmdzCiMKQ09ORklHX1BBTklDX09OX09P
UFM9eQpDT05GSUdfUEFOSUNfT05fT09QU19WQUxVRT0xCkNPTkZJR19QQU5JQ19USU1FT1VUPTAK
Q09ORklHX0xPQ0tVUF9ERVRFQ1RPUj15CkNPTkZJR19TT0ZUTE9DS1VQX0RFVEVDVE9SPXkKIyBD
T05GSUdfQk9PVFBBUkFNX1NPRlRMT0NLVVBfUEFOSUMgaXMgbm90IHNldApDT05GSUdfSEFSRExP
Q0tVUF9ERVRFQ1RPUl9QRVJGPXkKQ09ORklHX0hBUkRMT0NLVVBfQ0hFQ0tfVElNRVNUQU1QPXkK
Q09ORklHX0hBUkRMT0NLVVBfREVURUNUT1I9eQojIENPTkZJR19CT09UUEFSQU1fSEFSRExPQ0tV
UF9QQU5JQyBpcyBub3Qgc2V0CkNPTkZJR19ERVRFQ1RfSFVOR19UQVNLPXkKQ09ORklHX0RFRkFV
TFRfSFVOR19UQVNLX1RJTUVPVVQ9NDgwCkNPTkZJR19CT09UUEFSQU1fSFVOR19UQVNLX1BBTklD
PXkKQ09ORklHX1dRX1dBVENIRE9HPXkKIyBDT05GSUdfVEVTVF9MT0NLVVAgaXMgbm90IHNldAoj
IGVuZCBvZiBEZWJ1ZyBPb3BzLCBMb2NrdXBzIGFuZCBIYW5ncwoKIwojIFNjaGVkdWxlciBEZWJ1
Z2dpbmcKIwpDT05GSUdfU0NIRURfREVCVUc9eQpDT05GSUdfU0NIRURfSU5GTz15CkNPTkZJR19T
Q0hFRFNUQVRTPXkKIyBlbmQgb2YgU2NoZWR1bGVyIERlYnVnZ2luZwoKQ09ORklHX0RFQlVHX1RJ
TUVLRUVQSU5HPXkKCiMKIyBMb2NrIERlYnVnZ2luZyAoc3BpbmxvY2tzLCBtdXRleGVzLCBldGMu
Li4pCiMKQ09ORklHX0xPQ0tfREVCVUdHSU5HX1NVUFBPUlQ9eQpDT05GSUdfUFJPVkVfTE9DS0lO
Rz15CiMgQ09ORklHX1BST1ZFX1JBV19MT0NLX05FU1RJTkcgaXMgbm90IHNldAojIENPTkZJR19M
T0NLX1NUQVQgaXMgbm90IHNldApDT05GSUdfREVCVUdfUlRfTVVURVhFUz15CkNPTkZJR19ERUJV
R19TUElOTE9DSz15CkNPTkZJR19ERUJVR19NVVRFWEVTPXkKQ09ORklHX0RFQlVHX1dXX01VVEVY
X1NMT1dQQVRIPXkKQ09ORklHX0RFQlVHX1JXU0VNUz15CkNPTkZJR19ERUJVR19MT0NLX0FMTE9D
PXkKQ09ORklHX0xPQ0tERVA9eQpDT05GSUdfTE9DS0RFUF9CSVRTPTE1CkNPTkZJR19MT0NLREVQ
X0NIQUlOU19CSVRTPTE2CkNPTkZJR19MT0NLREVQX1NUQUNLX1RSQUNFX0JJVFM9MTkKQ09ORklH
X0xPQ0tERVBfU1RBQ0tfVFJBQ0VfSEFTSF9CSVRTPTE0CkNPTkZJR19MT0NLREVQX0NJUkNVTEFS
X1FVRVVFX0JJVFM9MTIKIyBDT05GSUdfREVCVUdfTE9DS0RFUCBpcyBub3Qgc2V0CkNPTkZJR19E
RUJVR19BVE9NSUNfU0xFRVA9eQojIENPTkZJR19ERUJVR19MT0NLSU5HX0FQSV9TRUxGVEVTVFMg
aXMgbm90IHNldApDT05GSUdfTE9DS19UT1JUVVJFX1RFU1Q9bQojIENPTkZJR19XV19NVVRFWF9T
RUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDRl9UT1JUVVJFX1RFU1QgaXMgbm90IHNldAoj
IENPTkZJR19DU0RfTE9DS19XQUlUX0RFQlVHIGlzIG5vdCBzZXQKIyBlbmQgb2YgTG9jayBEZWJ1
Z2dpbmcgKHNwaW5sb2NrcywgbXV0ZXhlcywgZXRjLi4uKQoKQ09ORklHX1RSQUNFX0lSUUZMQUdT
PXkKQ09ORklHX1RSQUNFX0lSUUZMQUdTX05NST15CkNPTkZJR19ERUJVR19JUlFGTEFHUz15CkNP
TkZJR19TVEFDS1RSQUNFPXkKIyBDT05GSUdfV0FSTl9BTExfVU5TRUVERURfUkFORE9NIGlzIG5v
dCBzZXQKIyBDT05GSUdfREVCVUdfS09CSkVDVCBpcyBub3Qgc2V0CgojCiMgRGVidWcga2VybmVs
IGRhdGEgc3RydWN0dXJlcwojCkNPTkZJR19ERUJVR19MSVNUPXkKIyBDT05GSUdfREVCVUdfUExJ
U1QgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19TRyBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19O
T1RJRklFUlM9eQojIENPTkZJR19CVUdfT05fREFUQV9DT1JSVVBUSU9OIGlzIG5vdCBzZXQKIyBl
bmQgb2YgRGVidWcga2VybmVsIGRhdGEgc3RydWN0dXJlcwoKQ09ORklHX0RFQlVHX0NSRURFTlRJ
QUxTPXkKCiMKIyBSQ1UgRGVidWdnaW5nCiMKQ09ORklHX1BST1ZFX1JDVT15CiMgQ09ORklHX1BS
T1ZFX1JDVV9MSVNUIGlzIG5vdCBzZXQKQ09ORklHX1RPUlRVUkVfVEVTVD1tCkNPTkZJR19SQ1Vf
U0NBTEVfVEVTVD1tCkNPTkZJR19SQ1VfVE9SVFVSRV9URVNUPW0KIyBDT05GSUdfUkNVX1JFRl9T
Q0FMRV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfUkNVX1RSQUNFIGlzIG5vdCBzZXQKQ09ORklH
X1JDVV9FUVNfREVCVUc9eQojIGVuZCBvZiBSQ1UgRGVidWdnaW5nCgpDT05GSUdfREVCVUdfV1Ff
Rk9SQ0VfUlJfQ1BVPXkKQ09ORklHX0xBVEVOQ1lUT1A9eQpDT05GSUdfVVNFUl9TVEFDS1RSQUNF
X1NVUFBPUlQ9eQpDT05GSUdfTk9QX1RSQUNFUj15CkNPTkZJR19IQVZFX1JFVEhPT0s9eQpDT05G
SUdfSEFWRV9GVU5DVElPTl9UUkFDRVI9eQpDT05GSUdfSEFWRV9EWU5BTUlDX0ZUUkFDRT15CkNP
TkZJR19IQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUz15CkNPTkZJR19IQVZFX0RZTkFNSUNf
RlRSQUNFX1dJVEhfRElSRUNUX0NBTExTPXkKQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJBQ0VfV0lU
SF9BUkdTPXkKQ09ORklHX0hBVkVfRlRSQUNFX01DT1VOVF9SRUNPUkQ9eQpDT05GSUdfSEFWRV9T
WVNDQUxMX1RSQUNFUE9JTlRTPXkKQ09ORklHX0hBVkVfRkVOVFJZPXkKQ09ORklHX0hBVkVfT0JK
VE9PTF9NQ09VTlQ9eQpDT05GSUdfSEFWRV9DX1JFQ09SRE1DT1VOVD15CkNPTkZJR19IQVZFX0JV
SUxEVElNRV9NQ09VTlRfU09SVD15CkNPTkZJR19UUkFDRV9DTE9DSz15CkNPTkZJR19SSU5HX0JV
RkZFUj15CkNPTkZJR19FVkVOVF9UUkFDSU5HPXkKQ09ORklHX0NPTlRFWFRfU1dJVENIX1RSQUNF
Uj15CkNPTkZJR19QUkVFTVBUSVJRX1RSQUNFUE9JTlRTPXkKQ09ORklHX1RSQUNJTkc9eQpDT05G
SUdfVFJBQ0lOR19TVVBQT1JUPXkKIyBDT05GSUdfRlRSQUNFIGlzIG5vdCBzZXQKIyBDT05GSUdf
UFJPVklERV9PSENJMTM5NF9ETUFfSU5JVCBpcyBub3Qgc2V0CkNPTkZJR19TQU1QTEVTPXkKQ09O
RklHX1NBTVBMRV9BVVhESVNQTEFZPXkKIyBDT05GSUdfU0FNUExFX1RSQUNFX0VWRU5UUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NBTVBMRV9UUkFDRV9DVVNUT01fRVZFTlRTIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0FNUExFX1RSQUNFX1BSSU5USyBpcyBub3Qgc2V0CiMgQ09ORklHX1NBTVBMRV9UUkFD
RV9BUlJBWSBpcyBub3Qgc2V0CkNPTkZJR19TQU1QTEVfS09CSkVDVD15CiMgQ09ORklHX1NBTVBM
RV9IV19CUkVBS1BPSU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FNUExFX0tGSUZPIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0FNUExFX0NPTkZJR0ZTIGlzIG5vdCBzZXQKQ09ORklHX1NBTVBMRV9XQVRD
SERPRz15CkNPTkZJR19IQVZFX1NBTVBMRV9GVFJBQ0VfRElSRUNUPXkKQ09ORklHX0hBVkVfU0FN
UExFX0ZUUkFDRV9ESVJFQ1RfTVVMVEk9eQpDT05GSUdfQVJDSF9IQVNfREVWTUVNX0lTX0FMTE9X
RUQ9eQoKIwojIHg4NiBEZWJ1Z2dpbmcKIwpDT05GSUdfRUFSTFlfUFJJTlRLX1VTQj15CkNPTkZJ
R19YODZfVkVSQk9TRV9CT09UVVA9eQpDT05GSUdfRUFSTFlfUFJJTlRLPXkKQ09ORklHX0VBUkxZ
X1BSSU5US19EQkdQPXkKQ09ORklHX0VBUkxZX1BSSU5US19VU0JfWERCQz15CkNPTkZJR19FRklf
UEdUX0RVTVA9eQpDT05GSUdfREVCVUdfVExCRkxVU0g9eQpDT05GSUdfSEFWRV9NTUlPVFJBQ0Vf
U1VQUE9SVD15CiMgQ09ORklHX1g4Nl9ERUNPREVSX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU9fREVMQVlfMFg4MCBpcyBub3Qgc2V0CiMgQ09ORklHX0lPX0RFTEFZXzBYRUQgaXMgbm90
IHNldAojIENPTkZJR19JT19ERUxBWV9VREVMQVkgaXMgbm90IHNldApDT05GSUdfSU9fREVMQVlf
Tk9ORT15CiMgQ09ORklHX0RFQlVHX0JPT1RfUEFSQU1TIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BB
X0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX0VOVFJZPXkKIyBDT05GSUdfREVCVUdfTk1J
X1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X0RFQlVHX0ZQVSBpcyBub3Qgc2V0CiMg
Q09ORklHX1BVTklUX0FUT01fREVCVUcgaXMgbm90IHNldApDT05GSUdfVU5XSU5ERVJfT1JDPXkK
IyBDT05GSUdfVU5XSU5ERVJfRlJBTUVfUE9JTlRFUiBpcyBub3Qgc2V0CiMgZW5kIG9mIHg4NiBE
ZWJ1Z2dpbmcKCiMKIyBLZXJuZWwgVGVzdGluZyBhbmQgQ292ZXJhZ2UKIwojIENPTkZJR19LVU5J
VCBpcyBub3Qgc2V0CiMgQ09ORklHX05PVElGSUVSX0VSUk9SX0lOSkVDVElPTiBpcyBub3Qgc2V0
CiMgQ09ORklHX0ZBVUxUX0lOSkVDVElPTiBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19LQ09W
PXkKQ09ORklHX0NDX0hBU19TQU5DT1ZfVFJBQ0VfUEM9eQpDT05GSUdfS0NPVj15CkNPTkZJR19L
Q09WX0VOQUJMRV9DT01QQVJJU09OUz15CkNPTkZJR19LQ09WX0lOU1RSVU1FTlRfQUxMPXkKQ09O
RklHX0tDT1ZfSVJRX0FSRUFfU0laRT0weDQwMDAwCiMgQ09ORklHX1JVTlRJTUVfVEVTVElOR19N
RU5VIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfVVNFX01FTVRFU1Q9eQpDT05GSUdfTUVNVEVTVD15
CiMgZW5kIG9mIEtlcm5lbCBUZXN0aW5nIGFuZCBDb3ZlcmFnZQojIGVuZCBvZiBLZXJuZWwgaGFj
a2luZwo=

--===============1712038917384304068==--

