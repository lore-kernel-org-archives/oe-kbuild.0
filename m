Content-Type: multipart/mixed; boundary="===============0429303211629526429=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/cifs/cached_dir.c:25:32: warning: use of uninitialized value '*(short int *)((char *)&oparms + offsetof(struct cifs_open_parms, reconnect))' [CWE-457]
Date: Tue, 20 Sep 2022 17:54:46 +0800
Message-ID: <202209201745.rqbZGKNA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0429303211629526429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/cifs/c=
ached_dir.c:25:32: warning: use of uninitialized value '*(short int *)((cha=
r *)&oparms + offsetof(struct cifs_open_parms, reconnect))' [CWE-457] [-Wan=
alyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ronnie Sahlberg <lsahlber@redhat.com>
CC: Steve French <stfrench@microsoft.com>
CC: "Paulo Alcantara (SUSE)" <pc@cjr.nz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   521a547ced6477c54b4b0cc206000406c221b4d6
commit: 05b98fd2da6bdf241d3b9ba40582d60a84a89d70 cifs: Move cached-dir func=
tions into a separate file
date:   6 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20220917 (https://download.01.org/0day-ci/archi=
ve/20220920/202209201745.rqbZGKNA-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D05b98fd2da6bdf241d3b9ba40582d60a84a89d70
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 05b98fd2da6bdf241d3b9ba40582d60a84a89d70
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   fs/cifs/cached_dir.c: In function 'open_cached_dir':
>> fs/cifs/cached_dir.c:25:32: warning: use of uninitialized value '*(short=
 int *)((char *)&oparms + offsetof(struct cifs_open_parms, reconnect))' [CW=
E-457] [-Wanalyzer-use-of-uninitialized-value]
      25 |         struct cifs_open_parms oparms;
         |                                ^~~~~~
     'open_cached_dir': events 1-2
       |
       |   25 |         struct cifs_open_parms oparms;
       |      |                                ^~~~~~
       |      |                                |
       |      |                                (1) region created on stack =
here
       |      |                                (2) use of uninitialized val=
ue '*(short int *)((char *)&oparms + offsetof(struct cifs_open_parms, recon=
nect))' here
       |

vim +25 fs/cifs/cached_dir.c

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   13  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   14  /*
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   15   * Open the and cache a dir=
ectory handle.
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   16   * If error then *cfid is n=
ot initialized.
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   17   */
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   18  int open_cached_dir(unsigne=
d int xid, struct cifs_tcon *tcon,
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   19  		const char *path,
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   20  		struct cifs_sb_info *cifs=
_sb,
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   21  		struct cached_fid **cfid)
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   22  {
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   23  	struct cifs_ses *ses;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   24  	struct TCP_Server_Info *se=
rver;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  @25  	struct cifs_open_parms opa=
rms;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   26  	struct smb2_create_rsp *o_=
rsp =3D NULL;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   27  	struct smb2_query_info_rsp=
 *qi_rsp =3D NULL;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   28  	int resp_buftype[2];
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   29  	struct smb_rqst rqst[2];
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   30  	struct kvec rsp_iov[2];
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   31  	struct kvec open_iov[SMB2_=
CREATE_IOV_SIZE];
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   32  	struct kvec qi_iov[1];
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   33  	int rc, flags =3D 0;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   34  	__le16 utf16_path =3D 0; /=
* Null - since an open of top of share */
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   35  	u8 oplock =3D SMB2_OPLOCK_=
LEVEL_II;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   36  	struct cifs_fid *pfid;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   37  	struct dentry *dentry;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   38  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   39  	if (tcon =3D=3D NULL || tc=
on->nohandlecache ||
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   40  	    is_smb1_server(tcon->s=
es->server))
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   41  		return -EOPNOTSUPP;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   42  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   43  	ses =3D tcon->ses;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   44  	server =3D ses->server;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   45  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   46  	if (cifs_sb->root =3D=3D N=
ULL)
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   47  		return -ENOENT;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   48  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   49  	if (strlen(path))
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   50  		return -ENOENT;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   51  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   52  	dentry =3D cifs_sb->root;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   53  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   54  	mutex_lock(&tcon->cfid.fid=
_mutex);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   55  	if (tcon->cfid.is_valid) {
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   56  		cifs_dbg(FYI, "found a ca=
ched root file handle\n");
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   57  		*cfid =3D &tcon->cfid;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   58  		kref_get(&tcon->cfid.refc=
ount);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   59  		mutex_unlock(&tcon->cfid.=
fid_mutex);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   60  		return 0;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   61  	}
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   62  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   63  	/*
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   64  	 * We do not hold the lock=
 for the open because in case
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   65  	 * SMB2_open needs to reco=
nnect, it will end up calling
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   66  	 * cifs_mark_open_files_in=
valid() which takes the lock again
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   67  	 * thus causing a deadlock
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   68  	 */
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   69  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   70  	mutex_unlock(&tcon->cfid.f=
id_mutex);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   71  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   72  	if (smb3_encryption_requir=
ed(tcon))
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   73  		flags |=3D CIFS_TRANSFORM=
_REQ;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   74  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   75  	if (!server->ops->new_leas=
e_key)
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   76  		return -EIO;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   77  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   78  	pfid =3D tcon->cfid.fid;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   79  	server->ops->new_lease_key=
(pfid);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   80  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   81  	memset(rqst, 0, sizeof(rqs=
t));
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   82  	resp_buftype[0] =3D resp_b=
uftype[1] =3D CIFS_NO_BUFFER;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   83  	memset(rsp_iov, 0, sizeof(=
rsp_iov));
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   84  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   85  	/* Open */
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   86  	memset(&open_iov, 0, sizeo=
f(open_iov));
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   87  	rqst[0].rq_iov =3D open_io=
v;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   88  	rqst[0].rq_nvec =3D SMB2_C=
REATE_IOV_SIZE;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   89  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   90  	oparms.tcon =3D tcon;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   91  	oparms.create_options =3D =
cifs_create_options(cifs_sb, CREATE_NOT_FILE);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   92  	oparms.desired_access =3D =
FILE_READ_ATTRIBUTES;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   93  	oparms.disposition =3D FIL=
E_OPEN;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   94  	oparms.fid =3D pfid;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   95  	oparms.reconnect =3D false;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   96  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   97  	rc =3D SMB2_open_init(tcon=
, server,
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   98  			    &rqst[0], &oplock, &=
oparms, &utf16_path);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10   99  	if (rc)
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  100  		goto oshr_free;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  101  	smb2_set_next_command(tcon=
, &rqst[0]);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  102  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  103  	memset(&qi_iov, 0, sizeof(=
qi_iov));
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  104  	rqst[1].rq_iov =3D qi_iov;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  105  	rqst[1].rq_nvec =3D 1;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  106  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  107  	rc =3D SMB2_query_info_ini=
t(tcon, server,
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  108  				  &rqst[1], COMPOUND_FI=
D,
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  109  				  COMPOUND_FID, FILE_AL=
L_INFORMATION,
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  110  				  SMB2_O_INFO_FILE, 0,
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  111  				  sizeof(struct smb2_fi=
le_all_info) +
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  112  				  PATH_MAX * 2, 0, NULL=
);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  113  	if (rc)
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  114  		goto oshr_free;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  115  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  116  	smb2_set_related(&rqst[1]);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  117  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  118  	rc =3D compound_send_recv(=
xid, ses, server,
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  119  				flags, 2, rqst,
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  120  				resp_buftype, rsp_iov);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  121  	mutex_lock(&tcon->cfid.fid=
_mutex);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  122  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  123  	/*
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  124  	 * Now we need to check ag=
ain as the cached root might have
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  125  	 * been successfully re-op=
ened from a concurrent process
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  126  	 */
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  127  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  128  	if (tcon->cfid.is_valid) {
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  129  		/* work was already done =
*/
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  130  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  131  		/* stash fids for close()=
 later */
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  132  		struct cifs_fid fid =3D {
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  133  			.persistent_fid =3D pfid=
->persistent_fid,
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  134  			.volatile_fid =3D pfid->=
volatile_fid,
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  135  		};
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  136  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  137  		/*
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  138  		 * caller expects this fu=
nc to set the fid in cfid to valid
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  139  		 * cached root, so increm=
ent the refcount.
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  140  		 */
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  141  		kref_get(&tcon->cfid.refc=
ount);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  142  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  143  		mutex_unlock(&tcon->cfid.=
fid_mutex);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  144  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  145  		if (rc =3D=3D 0) {
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  146  			/* close extra handle ou=
tside of crit sec */
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  147  			SMB2_close(xid, tcon, fi=
d.persistent_fid, fid.volatile_fid);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  148  		}
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  149  		rc =3D 0;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  150  		goto oshr_free;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  151  	}
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  152  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  153  	/* Cached root is still in=
valid, continue normaly */
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  154  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  155  	if (rc) {
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  156  		if (rc =3D=3D -EREMCHG) {
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  157  			tcon->need_reconnect =3D=
 true;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  158  			pr_warn_once("server sha=
re %s deleted\n",
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  159  				     tcon->treeName);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  160  		}
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  161  		goto oshr_exit;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  162  	}
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  163  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  164  	atomic_inc(&tcon->num_remo=
te_opens);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  165  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  166  	o_rsp =3D (struct smb2_cre=
ate_rsp *)rsp_iov[0].iov_base;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  167  	oparms.fid->persistent_fid=
 =3D o_rsp->PersistentFileId;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  168  	oparms.fid->volatile_fid =
=3D o_rsp->VolatileFileId;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  169  #ifdef CONFIG_CIFS_DEBUG2
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  170  	oparms.fid->mid =3D le64_t=
o_cpu(o_rsp->hdr.MessageId);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  171  #endif /* CIFS_DEBUG2 */
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  172  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  173  	tcon->cfid.tcon =3D tcon;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  174  	tcon->cfid.is_valid =3D tr=
ue;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  175  	tcon->cfid.dentry =3D dent=
ry;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  176  	dget(dentry);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  177  	kref_init(&tcon->cfid.refc=
ount);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  178  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  179  	/* BB TBD check to see if =
oplock level check can be removed below */
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  180  	if (o_rsp->OplockLevel =3D=
=3D SMB2_OPLOCK_LEVEL_LEASE) {
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  181  		/*
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  182  		 * See commit 2f94a3125b8=
7. Increment the refcount when we
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  183  		 * get a lease for root, =
release it if lease break occurs
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  184  		 */
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  185  		kref_get(&tcon->cfid.refc=
ount);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  186  		tcon->cfid.has_lease =3D =
true;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  187  		smb2_parse_contexts(serve=
r, o_rsp,
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  188  				&oparms.fid->epoch,
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  189  				    oparms.fid->lease_k=
ey, &oplock,
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  190  				    NULL, NULL);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  191  	} else
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  192  		goto oshr_exit;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  193  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  194  	qi_rsp =3D (struct smb2_qu=
ery_info_rsp *)rsp_iov[1].iov_base;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  195  	if (le32_to_cpu(qi_rsp->Ou=
tputBufferLength) < sizeof(struct smb2_file_all_info))
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  196  		goto oshr_exit;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  197  	if (!smb2_validate_and_cop=
y_iov(
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  198  				le16_to_cpu(qi_rsp->Out=
putBufferOffset),
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  199  				sizeof(struct smb2_file=
_all_info),
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  200  				&rsp_iov[1], sizeof(str=
uct smb2_file_all_info),
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  201  				(char *)&tcon->cfid.fil=
e_all_info))
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  202  		tcon->cfid.file_all_info_=
is_valid =3D true;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  203  	tcon->cfid.time =3D jiffie=
s;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  204  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  205  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  206  oshr_exit:
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  207  	mutex_unlock(&tcon->cfid.f=
id_mutex);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  208  oshr_free:
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  209  	SMB2_open_free(&rqst[0]);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  210  	SMB2_query_info_free(&rqst=
[1]);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  211  	free_rsp_buf(resp_buftype[=
0], rsp_iov[0].iov_base);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  212  	free_rsp_buf(resp_buftype[=
1], rsp_iov[1].iov_base);
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  213  	if (rc =3D=3D 0)
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  214  		*cfid =3D &tcon->cfid;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  215  =

05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  216  	return rc;
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  217  }
05b98fd2da6bdf Ronnie Sahlberg 2022-08-10  218  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0429303211629526429==--

