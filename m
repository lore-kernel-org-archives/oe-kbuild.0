Content-Type: multipart/mixed; boundary="===============1240570823771919146=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1380/14098] fs/cifsd/smb2pdu.c:3028 smb2_open() warn: Function too hairy. No more merges.
Date: Sat, 03 Jul 2021 22:31:29 +0800
Message-ID: <202107032226.tny0p8XU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1240570823771919146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Namjae Jeon <namjae.jeon@samsung.com>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   fb0ca446157a86b75502c1636b0d81e642fe6bf1
commit: 73f9dad511e8c5d53a6565192eb0b3a213863563 [1380/14098] cifsd: remove=
 the dead code of unimplemented durable handle
:::::: branch date: 2 days ago
:::::: commit date: 8 weeks ago
config: h8300-randconfig-m031-20210702 (attached as .config)
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/cifsd/smb2pdu.c:3028 smb2_open() warn: Function too hairy.  No more merg=
es.

Old smatch warnings:
fs/cifsd/smb2pdu.c:3027 smb2_open() error: 'name' dereferencing possible ER=
R_PTR()
fs/cifsd/smb2pdu.c:6546 smb2_lock() warn: inconsistent indenting
fs/cifsd/smb2pdu.c:6554 smb2_lock() warn: inconsistent indenting

vim +3028 fs/cifsd/smb2pdu.c

e2f34481b24db2 Namjae Jeon       2021-03-16  2234  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2235  /**
e2f34481b24db2 Namjae Jeon       2021-03-16  2236   * smb2_open() - handler=
 for smb file open request
e2f34481b24db2 Namjae Jeon       2021-03-16  2237   * @work:	smb work conta=
ining request buffer
e2f34481b24db2 Namjae Jeon       2021-03-16  2238   *
e2f34481b24db2 Namjae Jeon       2021-03-16  2239   * Return:      0 on suc=
cess, otherwise error
e2f34481b24db2 Namjae Jeon       2021-03-16  2240   */
e2f34481b24db2 Namjae Jeon       2021-03-16  2241  int smb2_open(struct ksm=
bd_work *work)
e2f34481b24db2 Namjae Jeon       2021-03-16  2242  {
e2f34481b24db2 Namjae Jeon       2021-03-16  2243  	struct ksmbd_conn *conn=
 =3D work->conn;
e2f34481b24db2 Namjae Jeon       2021-03-16  2244  	struct ksmbd_session *s=
ess =3D work->sess;
e2f34481b24db2 Namjae Jeon       2021-03-16  2245  	struct ksmbd_tree_conne=
ct *tcon =3D work->tcon;
e2f34481b24db2 Namjae Jeon       2021-03-16  2246  	struct smb2_create_req =
*req;
e2f34481b24db2 Namjae Jeon       2021-03-16  2247  	struct smb2_create_rsp =
*rsp, *rsp_org;
e2f34481b24db2 Namjae Jeon       2021-03-16  2248  	struct path path;
e2f34481b24db2 Namjae Jeon       2021-03-16  2249  	struct ksmbd_share_conf=
ig *share =3D tcon->share_conf;
e2f34481b24db2 Namjae Jeon       2021-03-16  2250  	struct ksmbd_file *fp =
=3D NULL;
e2f34481b24db2 Namjae Jeon       2021-03-16  2251  	struct file *filp =3D N=
ULL;
e2f34481b24db2 Namjae Jeon       2021-03-16  2252  	struct kstat stat;
e2f34481b24db2 Namjae Jeon       2021-03-16  2253  	struct create_context *=
context;
e2f34481b24db2 Namjae Jeon       2021-03-16  2254  	struct lease_ctx_info *=
lc =3D NULL;
e2f34481b24db2 Namjae Jeon       2021-03-16  2255  	struct create_ea_buf_re=
q *ea_buf =3D NULL;
e2f34481b24db2 Namjae Jeon       2021-03-16  2256  	struct oplock_info *opi=
nfo;
e2f34481b24db2 Namjae Jeon       2021-03-16  2257  	__le32 *next_ptr =3D NU=
LL;
e2f34481b24db2 Namjae Jeon       2021-03-16  2258  	int req_op_level =3D 0,=
 open_flags =3D 0, file_info =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2259  	int rc =3D 0, len =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2260  	int contxt_cnt =3D 0, q=
uery_disk_id =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2261  	int maximal_access_ctxt=
 =3D 0, posix_ctxt =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2262  	int s_type =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2263  	int next_off =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2264  	char *name =3D NULL;
e2f34481b24db2 Namjae Jeon       2021-03-16  2265  	char *stream_name =3D N=
ULL;
e2f34481b24db2 Namjae Jeon       2021-03-16  2266  	bool file_present =3D f=
alse, created =3D false, already_permitted =3D false;
e2f34481b24db2 Namjae Jeon       2021-03-16  2267  	int share_ret, need_tru=
ncate =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2268  	u64 time;
e2f34481b24db2 Namjae Jeon       2021-03-16  2269  	umode_t posix_mode =3D =
0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2270  	__le32 daccess, maximal=
_access =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2271  =

e5066499079de0 Namjae Jeon       2021-03-30  2272  	rsp_org =3D work->respo=
nse_buf;
e2f34481b24db2 Namjae Jeon       2021-03-16  2273  	WORK_BUFFERS(work, req,=
 rsp);
e2f34481b24db2 Namjae Jeon       2021-03-16  2274  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2275  	if (req->hdr.NextComman=
d && !work->next_smb2_rcv_hdr_off &&
e2f34481b24db2 Namjae Jeon       2021-03-16  2276  	    (req->hdr.Flags & S=
MB2_FLAGS_RELATED_OPERATIONS)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2277  		ksmbd_debug(SMB, "inva=
lid flag in chained command\n");
e2f34481b24db2 Namjae Jeon       2021-03-16  2278  		rsp->hdr.Status =3D ST=
ATUS_INVALID_PARAMETER;
e2f34481b24db2 Namjae Jeon       2021-03-16  2279  		smb2_set_err_rsp(work);
e2f34481b24db2 Namjae Jeon       2021-03-16  2280  		return -EINVAL;
e2f34481b24db2 Namjae Jeon       2021-03-16  2281  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2282  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2283  	if (test_share_config_f=
lag(share, KSMBD_SHARE_FLAG_PIPE)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2284  		ksmbd_debug(SMB, "IPC =
pipe create request\n");
e2f34481b24db2 Namjae Jeon       2021-03-16  2285  		return create_smb2_pip=
e(work);
e2f34481b24db2 Namjae Jeon       2021-03-16  2286  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2287  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2288  	if (req->NameLength) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2289  		if ((req->CreateOption=
s & FILE_DIRECTORY_FILE_LE) &&
e2f34481b24db2 Namjae Jeon       2021-03-16  2290  		    *(char *)req->Buff=
er =3D=3D '\\') {
1e853b937b2fcc Colin Ian King    2021-03-17  2291  			ksmbd_err("not allow =
directory name included leading slash\n");
e2f34481b24db2 Namjae Jeon       2021-03-16  2292  			rc =3D -EINVAL;
e2f34481b24db2 Namjae Jeon       2021-03-16  2293  			goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2294  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2295  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2296  		name =3D smb2_get_name=
(share,
e2f34481b24db2 Namjae Jeon       2021-03-16  2297  				     req->Buffer,
e2f34481b24db2 Namjae Jeon       2021-03-16  2298  				     le16_to_cpu(req=
->NameLength),
e2f34481b24db2 Namjae Jeon       2021-03-16  2299  				     work->conn->loc=
al_nls);
e2f34481b24db2 Namjae Jeon       2021-03-16  2300  		if (IS_ERR(name)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2301  			rc =3D PTR_ERR(name);
e2f34481b24db2 Namjae Jeon       2021-03-16  2302  			if (rc !=3D -ENOMEM)
e2f34481b24db2 Namjae Jeon       2021-03-16  2303  				rc =3D -ENOENT;
e2f34481b24db2 Namjae Jeon       2021-03-16  2304  			goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2305  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2306  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2307  		ksmbd_debug(SMB, "conv=
erted name =3D %s\n", name);
e2f34481b24db2 Namjae Jeon       2021-03-16  2308  		if (strchr(name, ':'))=
 {
e2f34481b24db2 Namjae Jeon       2021-03-16  2309  			if (!test_share_confi=
g_flag(work->tcon->share_conf,
e2f34481b24db2 Namjae Jeon       2021-03-16  2310  						    KSMBD_SHARE_FL=
AG_STREAMS)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2311  				rc =3D -EBADF;
e2f34481b24db2 Namjae Jeon       2021-03-16  2312  				goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2313  			}
e2f34481b24db2 Namjae Jeon       2021-03-16  2314  			rc =3D parse_stream_n=
ame(name, &stream_name, &s_type);
e2f34481b24db2 Namjae Jeon       2021-03-16  2315  			if (rc < 0)
e2f34481b24db2 Namjae Jeon       2021-03-16  2316  				goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2317  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2318  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2319  		rc =3D ksmbd_validate_=
filename(name);
e2f34481b24db2 Namjae Jeon       2021-03-16  2320  		if (rc < 0)
e2f34481b24db2 Namjae Jeon       2021-03-16  2321  			goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2322  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2323  		if (ksmbd_share_veto_f=
ilename(share, name)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2324  			rc =3D -ENOENT;
e2f34481b24db2 Namjae Jeon       2021-03-16  2325  			ksmbd_debug(SMB, "Rej=
ect open(), vetoed file: %s\n",
e2f34481b24db2 Namjae Jeon       2021-03-16  2326  				name);
e2f34481b24db2 Namjae Jeon       2021-03-16  2327  			goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2328  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2329  	} else {
e2f34481b24db2 Namjae Jeon       2021-03-16  2330  		len =3D strlen(share->=
path);
e2f34481b24db2 Namjae Jeon       2021-03-16  2331  		ksmbd_debug(SMB, "shar=
e path len %d\n", len);
e2f34481b24db2 Namjae Jeon       2021-03-16  2332  		name =3D kmalloc(len +=
 1, GFP_KERNEL);
e2f34481b24db2 Namjae Jeon       2021-03-16  2333  		if (!name) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2334  			rsp->hdr.Status =3D S=
TATUS_NO_MEMORY;
e2f34481b24db2 Namjae Jeon       2021-03-16  2335  			rc =3D -ENOMEM;
e2f34481b24db2 Namjae Jeon       2021-03-16  2336  			goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2337  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2338  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2339  		memcpy(name, share->pa=
th, len);
e2f34481b24db2 Namjae Jeon       2021-03-16  2340  		*(name + len) =3D '\0';
e2f34481b24db2 Namjae Jeon       2021-03-16  2341  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2342  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2343  	req_op_level =3D req->R=
equestedOplockLevel;
e2f34481b24db2 Namjae Jeon       2021-03-16  2344  	if (req_op_level =3D=3D=
 SMB2_OPLOCK_LEVEL_LEASE)
e2f34481b24db2 Namjae Jeon       2021-03-16  2345  		lc =3D parse_lease_sta=
te(req);
e2f34481b24db2 Namjae Jeon       2021-03-16  2346  =

64b39f4a2fd293 Namjae Jeon       2021-03-30  2347  	if (le32_to_cpu(req->Im=
personationLevel) > le32_to_cpu(IL_DELEGATE_LE)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2348  		ksmbd_err("Invalid imp=
ersonationlevel : 0x%x\n",
e2f34481b24db2 Namjae Jeon       2021-03-16  2349  			le32_to_cpu(req->Impe=
rsonationLevel));
e2f34481b24db2 Namjae Jeon       2021-03-16  2350  		rc =3D -EIO;
e2f34481b24db2 Namjae Jeon       2021-03-16  2351  		rsp->hdr.Status =3D ST=
ATUS_BAD_IMPERSONATION_LEVEL;
e2f34481b24db2 Namjae Jeon       2021-03-16  2352  		goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2353  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2354  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2355  	if (req->CreateOptions =
&& !(req->CreateOptions & CREATE_OPTIONS_MASK)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2356  		ksmbd_err("Invalid cre=
ate options : 0x%x\n",
e2f34481b24db2 Namjae Jeon       2021-03-16  2357  			le32_to_cpu(req->Crea=
teOptions));
e2f34481b24db2 Namjae Jeon       2021-03-16  2358  		rc =3D -EINVAL;
e2f34481b24db2 Namjae Jeon       2021-03-16  2359  		goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2360  	} else {
e2f34481b24db2 Namjae Jeon       2021-03-16  2361  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2362  		if (req->CreateOptions=
 & FILE_SEQUENTIAL_ONLY_LE &&
e2f34481b24db2 Namjae Jeon       2021-03-16  2363  		    req->CreateOptions=
 & FILE_RANDOM_ACCESS_LE)
e2f34481b24db2 Namjae Jeon       2021-03-16  2364  			req->CreateOptions =
=3D ~(FILE_SEQUENTIAL_ONLY_LE);
e2f34481b24db2 Namjae Jeon       2021-03-16  2365  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2366  		if (req->CreateOptions=
 & (FILE_OPEN_BY_FILE_ID_LE |
e2f34481b24db2 Namjae Jeon       2021-03-16  2367  			CREATE_TREE_CONNECTIO=
N | FILE_RESERVE_OPFILTER_LE)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2368  			rc =3D -EOPNOTSUPP;
e2f34481b24db2 Namjae Jeon       2021-03-16  2369  			goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2370  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2371  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2372  		if (req->CreateOptions=
 & FILE_DIRECTORY_FILE_LE) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2373  			if (req->CreateOption=
s & FILE_NON_DIRECTORY_FILE_LE) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2374  				rc =3D -EINVAL;
e2f34481b24db2 Namjae Jeon       2021-03-16  2375  				goto err_out1;
64b39f4a2fd293 Namjae Jeon       2021-03-30  2376  			} else if (req->Creat=
eOptions & FILE_NO_COMPRESSION_LE) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2377  				req->CreateOptions =
=3D ~(FILE_NO_COMPRESSION_LE);
e2f34481b24db2 Namjae Jeon       2021-03-16  2378  			}
e2f34481b24db2 Namjae Jeon       2021-03-16  2379  		}
64b39f4a2fd293 Namjae Jeon       2021-03-30  2380  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2381  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2382  	if (le32_to_cpu(req->Cr=
eateDisposition) >
e2f34481b24db2 Namjae Jeon       2021-03-16  2383  			le32_to_cpu(FILE_OVER=
WRITE_IF_LE)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2384  		ksmbd_err("Invalid cre=
ate disposition : 0x%x\n",
e2f34481b24db2 Namjae Jeon       2021-03-16  2385  			le32_to_cpu(req->Crea=
teDisposition));
e2f34481b24db2 Namjae Jeon       2021-03-16  2386  		rc =3D -EINVAL;
e2f34481b24db2 Namjae Jeon       2021-03-16  2387  		goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2388  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2389  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2390  	if (!(req->DesiredAcces=
s & DESIRED_ACCESS_MASK)) {
1e853b937b2fcc Colin Ian King    2021-03-17  2391  		ksmbd_err("Invalid des=
ired access : 0x%x\n",
e2f34481b24db2 Namjae Jeon       2021-03-16  2392  			le32_to_cpu(req->Desi=
redAccess));
e2f34481b24db2 Namjae Jeon       2021-03-16  2393  		rc =3D -EACCES;
e2f34481b24db2 Namjae Jeon       2021-03-16  2394  		goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2395  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2396  =

64b39f4a2fd293 Namjae Jeon       2021-03-30  2397  	if (req->FileAttributes=
 && !(req->FileAttributes & ATTR_MASK_LE)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2398  		ksmbd_err("Invalid fil=
e attribute : 0x%x\n",
e2f34481b24db2 Namjae Jeon       2021-03-16  2399  			le32_to_cpu(req->File=
Attributes));
e2f34481b24db2 Namjae Jeon       2021-03-16  2400  		rc =3D -EINVAL;
e2f34481b24db2 Namjae Jeon       2021-03-16  2401  		goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2402  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2403  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2404  	if (req->CreateContexts=
Offset) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2405  		/* Parse non-durable h=
andle create contexts */
e2f34481b24db2 Namjae Jeon       2021-03-16  2406  		context =3D smb2_find_=
context_vals(req, SMB2_CREATE_EA_BUFFER);
e2f34481b24db2 Namjae Jeon       2021-03-16  2407  		if (IS_ERR(context)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2408  			rc =3D check_context_=
err(context, SMB2_CREATE_EA_BUFFER);
e2f34481b24db2 Namjae Jeon       2021-03-16  2409  			if (rc < 0)
e2f34481b24db2 Namjae Jeon       2021-03-16  2410  				goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2411  		} else {
e2f34481b24db2 Namjae Jeon       2021-03-16  2412  			ea_buf =3D (struct cr=
eate_ea_buf_req *)context;
e2f34481b24db2 Namjae Jeon       2021-03-16  2413  			if (req->CreateOption=
s & FILE_NO_EA_KNOWLEDGE_LE) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2414  				rsp->hdr.Status =3D =
STATUS_ACCESS_DENIED;
e2f34481b24db2 Namjae Jeon       2021-03-16  2415  				rc =3D -EACCES;
e2f34481b24db2 Namjae Jeon       2021-03-16  2416  				goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2417  			}
e2f34481b24db2 Namjae Jeon       2021-03-16  2418  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2419  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2420  		context =3D smb2_find_=
context_vals(req,
e2f34481b24db2 Namjae Jeon       2021-03-16  2421  				SMB2_CREATE_QUERY_MA=
XIMAL_ACCESS_REQUEST);
e2f34481b24db2 Namjae Jeon       2021-03-16  2422  		if (IS_ERR(context)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2423  			rc =3D check_context_=
err(context,
e2f34481b24db2 Namjae Jeon       2021-03-16  2424  				SMB2_CREATE_QUERY_MA=
XIMAL_ACCESS_REQUEST);
e2f34481b24db2 Namjae Jeon       2021-03-16  2425  			if (rc < 0)
e2f34481b24db2 Namjae Jeon       2021-03-16  2426  				goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2427  		} else {
e2f34481b24db2 Namjae Jeon       2021-03-16  2428  			ksmbd_debug(SMB,
e2f34481b24db2 Namjae Jeon       2021-03-16  2429  				"get query maximal a=
ccess context\n");
e2f34481b24db2 Namjae Jeon       2021-03-16  2430  			maximal_access_ctxt =
=3D 1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2431  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2432  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2433  		context =3D smb2_find_=
context_vals(req,
e2f34481b24db2 Namjae Jeon       2021-03-16  2434  				SMB2_CREATE_TIMEWARP=
_REQUEST);
e2f34481b24db2 Namjae Jeon       2021-03-16  2435  		if (IS_ERR(context)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2436  			rc =3D check_context_=
err(context,
e2f34481b24db2 Namjae Jeon       2021-03-16  2437  				SMB2_CREATE_TIMEWARP=
_REQUEST);
e2f34481b24db2 Namjae Jeon       2021-03-16  2438  			if (rc < 0)
e2f34481b24db2 Namjae Jeon       2021-03-16  2439  				goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2440  		} else {
e2f34481b24db2 Namjae Jeon       2021-03-16  2441  			ksmbd_debug(SMB, "get=
 timewarp context\n");
e2f34481b24db2 Namjae Jeon       2021-03-16  2442  			rc =3D -EBADF;
e2f34481b24db2 Namjae Jeon       2021-03-16  2443  			goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2444  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2445  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2446  		if (tcon->posix_extens=
ions) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2447  			context =3D smb2_find=
_context_vals(req,
e2f34481b24db2 Namjae Jeon       2021-03-16  2448  				SMB2_CREATE_TAG_POSI=
X);
e2f34481b24db2 Namjae Jeon       2021-03-16  2449  			if (IS_ERR(context)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2450  				rc =3D check_context=
_err(context,
e2f34481b24db2 Namjae Jeon       2021-03-16  2451  						SMB2_CREATE_TAG_PO=
SIX);
e2f34481b24db2 Namjae Jeon       2021-03-16  2452  				if (rc < 0)
e2f34481b24db2 Namjae Jeon       2021-03-16  2453  					goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2454  			} else {
e2f34481b24db2 Namjae Jeon       2021-03-16  2455  				struct create_posix =
*posix =3D
e2f34481b24db2 Namjae Jeon       2021-03-16  2456  					(struct create_posi=
x *)context;
e2f34481b24db2 Namjae Jeon       2021-03-16  2457  				ksmbd_debug(SMB, "ge=
t posix context\n");
e2f34481b24db2 Namjae Jeon       2021-03-16  2458  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2459  				posix_mode =3D le32_=
to_cpu(posix->Mode);
e2f34481b24db2 Namjae Jeon       2021-03-16  2460  				posix_ctxt =3D 1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2461  			}
e2f34481b24db2 Namjae Jeon       2021-03-16  2462  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2463  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2464  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2465  	if (ksmbd_override_fsid=
s(work)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2466  		rc =3D -ENOMEM;
e2f34481b24db2 Namjae Jeon       2021-03-16  2467  		goto err_out1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2468  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2469  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2470  	if (req->CreateOptions =
& FILE_DELETE_ON_CLOSE_LE) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2471  		/*
e2f34481b24db2 Namjae Jeon       2021-03-16  2472  		 * On delete request, =
instead of following up, need to
e2f34481b24db2 Namjae Jeon       2021-03-16  2473  		 * look the current en=
tity
e2f34481b24db2 Namjae Jeon       2021-03-16  2474  		 */
e2f34481b24db2 Namjae Jeon       2021-03-16  2475  		rc =3D ksmbd_vfs_kern_=
path(name, 0, &path, 1);
e2f34481b24db2 Namjae Jeon       2021-03-16  2476  		if (!rc) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2477  			/*
e2f34481b24db2 Namjae Jeon       2021-03-16  2478  			 * If file exists wit=
h under flags, return access
e2f34481b24db2 Namjae Jeon       2021-03-16  2479  			 * denied error.
e2f34481b24db2 Namjae Jeon       2021-03-16  2480  			 */
e2f34481b24db2 Namjae Jeon       2021-03-16  2481  			if (req->CreateDispos=
ition =3D=3D FILE_OVERWRITE_IF_LE ||
e2f34481b24db2 Namjae Jeon       2021-03-16  2482  			    req->CreateDispos=
ition =3D=3D FILE_OPEN_IF_LE) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2483  				rc =3D -EACCES;
e2f34481b24db2 Namjae Jeon       2021-03-16  2484  				path_put(&path);
e2f34481b24db2 Namjae Jeon       2021-03-16  2485  				goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2486  			}
e2f34481b24db2 Namjae Jeon       2021-03-16  2487  =

64b39f4a2fd293 Namjae Jeon       2021-03-30  2488  			if (!test_tree_conn_f=
lag(tcon, KSMBD_TREE_CONN_FLAG_WRITABLE)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2489  				ksmbd_debug(SMB,
e2f34481b24db2 Namjae Jeon       2021-03-16  2490  					"User does not have=
 write permission\n");
e2f34481b24db2 Namjae Jeon       2021-03-16  2491  				rc =3D -EACCES;
e2f34481b24db2 Namjae Jeon       2021-03-16  2492  				path_put(&path);
e2f34481b24db2 Namjae Jeon       2021-03-16  2493  				goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2494  			}
e2f34481b24db2 Namjae Jeon       2021-03-16  2495  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2496  	} else {
e2f34481b24db2 Namjae Jeon       2021-03-16  2497  		if (test_share_config_=
flag(work->tcon->share_conf,
e2f34481b24db2 Namjae Jeon       2021-03-16  2498  					   KSMBD_SHARE_FLAG=
_FOLLOW_SYMLINKS)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2499  			/*
e2f34481b24db2 Namjae Jeon       2021-03-16  2500  			 * Use LOOKUP_FOLLOW =
to follow the path of
e2f34481b24db2 Namjae Jeon       2021-03-16  2501  			 * symlink in path bu=
ildup
e2f34481b24db2 Namjae Jeon       2021-03-16  2502  			 */
e2f34481b24db2 Namjae Jeon       2021-03-16  2503  			rc =3D ksmbd_vfs_kern=
_path(name, LOOKUP_FOLLOW, &path, 1);
e2f34481b24db2 Namjae Jeon       2021-03-16  2504  			if (rc) { /* Case for=
 broken link ?*/
e2f34481b24db2 Namjae Jeon       2021-03-16  2505  				rc =3D ksmbd_vfs_ker=
n_path(name, 0, &path, 1);
e2f34481b24db2 Namjae Jeon       2021-03-16  2506  			}
e2f34481b24db2 Namjae Jeon       2021-03-16  2507  		} else {
e2f34481b24db2 Namjae Jeon       2021-03-16  2508  			rc =3D ksmbd_vfs_kern=
_path(name, 0, &path, 1);
e2f34481b24db2 Namjae Jeon       2021-03-16  2509  			if (!rc && d_is_symli=
nk(path.dentry)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2510  				rc =3D -EACCES;
e2f34481b24db2 Namjae Jeon       2021-03-16  2511  				path_put(&path);
e2f34481b24db2 Namjae Jeon       2021-03-16  2512  				goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2513  			}
e2f34481b24db2 Namjae Jeon       2021-03-16  2514  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2515  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2516  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2517  	if (rc) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2518  		if (rc =3D=3D -EACCES)=
 {
e2f34481b24db2 Namjae Jeon       2021-03-16  2519  			ksmbd_debug(SMB,
e2f34481b24db2 Namjae Jeon       2021-03-16  2520  				"User does not have =
right permission\n");
e2f34481b24db2 Namjae Jeon       2021-03-16  2521  			goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2522  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2523  		ksmbd_debug(SMB, "can =
not get linux path for %s, rc =3D %d\n",
e2f34481b24db2 Namjae Jeon       2021-03-16  2524  				name, rc);
e2f34481b24db2 Namjae Jeon       2021-03-16  2525  		rc =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2526  	} else {
e2f34481b24db2 Namjae Jeon       2021-03-16  2527  		file_present =3D true;
e2f34481b24db2 Namjae Jeon       2021-03-16  2528  		generic_fillattr(&init=
_user_ns, d_inode(path.dentry), &stat);
e2f34481b24db2 Namjae Jeon       2021-03-16  2529  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2530  	if (stream_name) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2531  		if (req->CreateOptions=
 & FILE_DIRECTORY_FILE_LE) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2532  			if (s_type =3D=3D DAT=
A_STREAM) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2533  				rc =3D -EIO;
e2f34481b24db2 Namjae Jeon       2021-03-16  2534  				rsp->hdr.Status =3D =
STATUS_NOT_A_DIRECTORY;
e2f34481b24db2 Namjae Jeon       2021-03-16  2535  			}
e2f34481b24db2 Namjae Jeon       2021-03-16  2536  		} else {
e2f34481b24db2 Namjae Jeon       2021-03-16  2537  			if (S_ISDIR(stat.mode=
) && s_type =3D=3D DATA_STREAM) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2538  				rc =3D -EIO;
e2f34481b24db2 Namjae Jeon       2021-03-16  2539  				rsp->hdr.Status =3D =
STATUS_FILE_IS_A_DIRECTORY;
e2f34481b24db2 Namjae Jeon       2021-03-16  2540  			}
e2f34481b24db2 Namjae Jeon       2021-03-16  2541  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2542  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2543  		if (req->CreateOptions=
 & FILE_DIRECTORY_FILE_LE &&
e2f34481b24db2 Namjae Jeon       2021-03-16  2544  		    req->FileAttribute=
s & ATTR_NORMAL_LE) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2545  			rsp->hdr.Status =3D S=
TATUS_NOT_A_DIRECTORY;
e2f34481b24db2 Namjae Jeon       2021-03-16  2546  			rc =3D -EIO;
e2f34481b24db2 Namjae Jeon       2021-03-16  2547  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2548  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2549  		if (rc < 0)
e2f34481b24db2 Namjae Jeon       2021-03-16  2550  			goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2551  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2552  =

64b39f4a2fd293 Namjae Jeon       2021-03-30  2553  	if (file_present && req=
->CreateOptions & FILE_NON_DIRECTORY_FILE_LE &&
64b39f4a2fd293 Namjae Jeon       2021-03-30  2554  	    S_ISDIR(stat.mode) =
&& !(req->CreateOptions & FILE_DELETE_ON_CLOSE_LE)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2555  		ksmbd_debug(SMB, "open=
() argument is a directory: %s, %x\n",
e2f34481b24db2 Namjae Jeon       2021-03-16  2556  			      name, req->Crea=
teOptions);
e2f34481b24db2 Namjae Jeon       2021-03-16  2557  		rsp->hdr.Status =3D ST=
ATUS_FILE_IS_A_DIRECTORY;
e2f34481b24db2 Namjae Jeon       2021-03-16  2558  		rc =3D -EIO;
e2f34481b24db2 Namjae Jeon       2021-03-16  2559  		goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2560  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2561  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2562  	if (file_present && (re=
q->CreateOptions & FILE_DIRECTORY_FILE_LE) &&
e2f34481b24db2 Namjae Jeon       2021-03-16  2563  	    !(req->CreateDispos=
ition =3D=3D FILE_CREATE_LE) &&
e2f34481b24db2 Namjae Jeon       2021-03-16  2564  	    !S_ISDIR(stat.mode)=
) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2565  		rsp->hdr.Status =3D ST=
ATUS_NOT_A_DIRECTORY;
e2f34481b24db2 Namjae Jeon       2021-03-16  2566  		rc =3D -EIO;
e2f34481b24db2 Namjae Jeon       2021-03-16  2567  		goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2568  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2569  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2570  	if (!stream_name && fil=
e_present &&
64b39f4a2fd293 Namjae Jeon       2021-03-30  2571  	    req->CreateDisposit=
ion =3D=3D FILE_CREATE_LE) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2572  		rc =3D -EEXIST;
e2f34481b24db2 Namjae Jeon       2021-03-16  2573  		goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2574  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2575  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2576  	daccess =3D smb_map_gen=
eric_desired_access(req->DesiredAccess);
e2f34481b24db2 Namjae Jeon       2021-03-16  2577  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2578  	if (file_present && !(r=
eq->CreateOptions & FILE_DELETE_ON_CLOSE_LE)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2579  		rc =3D smb_check_perm_=
dacl(conn, path.dentry, &daccess,
e2f34481b24db2 Namjae Jeon       2021-03-16  2580  				sess->user->uid);
e2f34481b24db2 Namjae Jeon       2021-03-16  2581  		if (rc)
e2f34481b24db2 Namjae Jeon       2021-03-16  2582  			goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2583  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2584  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2585  	if (daccess & FILE_MAXI=
MAL_ACCESS_LE) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2586  		if (!file_present) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2587  			daccess =3D cpu_to_le=
32(GENERIC_ALL_FLAGS);
e2f34481b24db2 Namjae Jeon       2021-03-16  2588  		} else {
e2f34481b24db2 Namjae Jeon       2021-03-16  2589  			rc =3D ksmbd_vfs_quer=
y_maximal_access(path.dentry,
e2f34481b24db2 Namjae Jeon       2021-03-16  2590  							    &daccess);
e2f34481b24db2 Namjae Jeon       2021-03-16  2591  			if (rc)
e2f34481b24db2 Namjae Jeon       2021-03-16  2592  				goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2593  			already_permitted =3D=
 true;
e2f34481b24db2 Namjae Jeon       2021-03-16  2594  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2595  		maximal_access =3D dac=
cess;
e2f34481b24db2 Namjae Jeon       2021-03-16  2596  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2597  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2598  	open_flags =3D smb2_cre=
ate_open_flags(file_present,
e2f34481b24db2 Namjae Jeon       2021-03-16  2599  		daccess, req->CreateDi=
sposition);
e2f34481b24db2 Namjae Jeon       2021-03-16  2600  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2601  	if (!test_tree_conn_fla=
g(tcon, KSMBD_TREE_CONN_FLAG_WRITABLE)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2602  		if (open_flags & O_CRE=
AT) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2603  			ksmbd_debug(SMB,
e2f34481b24db2 Namjae Jeon       2021-03-16  2604  				"User does not have =
write permission\n");
e2f34481b24db2 Namjae Jeon       2021-03-16  2605  			rc =3D -EACCES;
e2f34481b24db2 Namjae Jeon       2021-03-16  2606  			goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2607  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2608  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2609  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2610  	/*create file if not pr=
esent */
e2f34481b24db2 Namjae Jeon       2021-03-16  2611  	if (!file_present) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2612  		rc =3D smb2_creat(work=
, &path, name, open_flags, posix_mode,
e2f34481b24db2 Namjae Jeon       2021-03-16  2613  			req->CreateOptions & =
FILE_DIRECTORY_FILE_LE);
e2f34481b24db2 Namjae Jeon       2021-03-16  2614  		if (rc)
e2f34481b24db2 Namjae Jeon       2021-03-16  2615  			goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2616  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2617  		created =3D true;
e2f34481b24db2 Namjae Jeon       2021-03-16  2618  		if (ea_buf) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2619  			rc =3D smb2_set_ea(&e=
a_buf->ea, &path);
e2f34481b24db2 Namjae Jeon       2021-03-16  2620  			if (rc =3D=3D -EOPNOT=
SUPP)
e2f34481b24db2 Namjae Jeon       2021-03-16  2621  				rc =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2622  			else if (rc)
e2f34481b24db2 Namjae Jeon       2021-03-16  2623  				goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2624  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2625  	} else if (!already_per=
mitted) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2626  		bool may_delete;
e2f34481b24db2 Namjae Jeon       2021-03-16  2627  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2628  		may_delete =3D daccess=
 & FILE_DELETE_LE ||
e2f34481b24db2 Namjae Jeon       2021-03-16  2629  			req->CreateOptions & =
FILE_DELETE_ON_CLOSE_LE;
e2f34481b24db2 Namjae Jeon       2021-03-16  2630  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2631  		/* FILE_READ_ATTRIBUTE=
 is allowed without inode_permission,
e2f34481b24db2 Namjae Jeon       2021-03-16  2632  		 * because execute(sea=
rch) permission on a parent directory,
e2f34481b24db2 Namjae Jeon       2021-03-16  2633  		 * is already granted.
e2f34481b24db2 Namjae Jeon       2021-03-16  2634  		 */
64b39f4a2fd293 Namjae Jeon       2021-03-30  2635  		if (daccess & ~(FILE_R=
EAD_ATTRIBUTES_LE | FILE_READ_CONTROL_LE)) {
ff1d57272552e4 Namjae Jeon       2021-04-13  2636  			rc =3D ksmbd_vfs_inod=
e_permission(path.dentry,
ff1d57272552e4 Namjae Jeon       2021-04-13  2637  					open_flags & O_ACCM=
ODE, may_delete);
ff1d57272552e4 Namjae Jeon       2021-04-13  2638  			if (rc)
e2f34481b24db2 Namjae Jeon       2021-03-16  2639  				goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2640  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2641  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2642  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2643  	rc =3D ksmbd_query_inod=
e_status(d_inode(path.dentry->d_parent));
e2f34481b24db2 Namjae Jeon       2021-03-16  2644  	if (rc =3D=3D KSMBD_INO=
DE_STATUS_PENDING_DELETE) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2645  		rc =3D -EBUSY;
e2f34481b24db2 Namjae Jeon       2021-03-16  2646  		goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2647  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2648  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2649  	rc =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2650  	filp =3D dentry_open(&p=
ath, open_flags, current_cred());
e2f34481b24db2 Namjae Jeon       2021-03-16  2651  	if (IS_ERR(filp)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2652  		rc =3D PTR_ERR(filp);
e2f34481b24db2 Namjae Jeon       2021-03-16  2653  		ksmbd_err("dentry open=
 for dir failed, rc %d\n", rc);
e2f34481b24db2 Namjae Jeon       2021-03-16  2654  		goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2655  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2656  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2657  	if (file_present) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2658  		if (!(open_flags & O_T=
RUNC))
e2f34481b24db2 Namjae Jeon       2021-03-16  2659  			file_info =3D FILE_OP=
ENED;
e2f34481b24db2 Namjae Jeon       2021-03-16  2660  		else
e2f34481b24db2 Namjae Jeon       2021-03-16  2661  			file_info =3D FILE_OV=
ERWRITTEN;
e2f34481b24db2 Namjae Jeon       2021-03-16  2662  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2663  		if ((req->CreateDispos=
ition & FILE_CREATE_MASK_LE)
e2f34481b24db2 Namjae Jeon       2021-03-16  2664  				=3D=3D FILE_SUPERSED=
E_LE)
e2f34481b24db2 Namjae Jeon       2021-03-16  2665  			file_info =3D FILE_SU=
PERSEDED;
64b39f4a2fd293 Namjae Jeon       2021-03-30  2666  	} else if (open_flags &=
 O_CREAT) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2667  		file_info =3D FILE_CRE=
ATED;
64b39f4a2fd293 Namjae Jeon       2021-03-30  2668  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2669  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2670  	ksmbd_vfs_set_fadvise(f=
ilp, req->CreateOptions);
e2f34481b24db2 Namjae Jeon       2021-03-16  2671  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2672  	/* Obtain Volatile-ID */
e2f34481b24db2 Namjae Jeon       2021-03-16  2673  	fp =3D ksmbd_open_fd(wo=
rk, filp);
e2f34481b24db2 Namjae Jeon       2021-03-16  2674  	if (IS_ERR(fp)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2675  		fput(filp);
e2f34481b24db2 Namjae Jeon       2021-03-16  2676  		rc =3D PTR_ERR(fp);
e2f34481b24db2 Namjae Jeon       2021-03-16  2677  		fp =3D NULL;
e2f34481b24db2 Namjae Jeon       2021-03-16  2678  		goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2679  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2680  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2681  	/* Get Persistent-ID */
e2f34481b24db2 Namjae Jeon       2021-03-16  2682  	ksmbd_open_durable_fd(f=
p);
e2f34481b24db2 Namjae Jeon       2021-03-16  2683  	if (!HAS_FILE_ID(fp->pe=
rsistent_id)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2684  		rc =3D -ENOMEM;
e2f34481b24db2 Namjae Jeon       2021-03-16  2685  		goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2686  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2687  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2688  	fp->filename =3D name;
e2f34481b24db2 Namjae Jeon       2021-03-16  2689  	fp->cdoption =3D req->C=
reateDisposition;
e2f34481b24db2 Namjae Jeon       2021-03-16  2690  	fp->daccess =3D daccess;
e2f34481b24db2 Namjae Jeon       2021-03-16  2691  	fp->saccess =3D req->Sh=
areAccess;
e2f34481b24db2 Namjae Jeon       2021-03-16  2692  	fp->coption =3D req->Cr=
eateOptions;
e2f34481b24db2 Namjae Jeon       2021-03-16  2693  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2694  	/* Set default windows =
and posix acls if creating new file */
e2f34481b24db2 Namjae Jeon       2021-03-16  2695  	if (created) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2696  		int posix_acl_rc;
fba08fa005e44b Namjae Jeon       2021-04-15  2697  		struct inode *inode =
=3D d_inode(path.dentry);
e2f34481b24db2 Namjae Jeon       2021-03-16  2698  =

fba08fa005e44b Namjae Jeon       2021-04-15  2699  		posix_acl_rc =3D ksmbd=
_vfs_inherit_posix_acl(inode, d_inode(path.dentry->d_parent));
e2f34481b24db2 Namjae Jeon       2021-03-16  2700  		if (posix_acl_rc)
e2f34481b24db2 Namjae Jeon       2021-03-16  2701  			ksmbd_debug(SMB, "inh=
erit posix acl failed : %d\n", posix_acl_rc);
e2f34481b24db2 Namjae Jeon       2021-03-16  2702  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2703  		if (test_share_config_=
flag(work->tcon->share_conf,
e2f34481b24db2 Namjae Jeon       2021-03-16  2704  					   KSMBD_SHARE_FLAG=
_ACL_XATTR)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2705  			rc =3D smb_inherit_da=
cl(conn, path.dentry, sess->user->uid,
e2f34481b24db2 Namjae Jeon       2021-03-16  2706  					sess->user->gid);
e2f34481b24db2 Namjae Jeon       2021-03-16  2707  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2708  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2709  		if (rc) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2710  			rc =3D smb2_create_sd=
_buffer(work, req, path.dentry);
e2f34481b24db2 Namjae Jeon       2021-03-16  2711  			if (rc) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2712  				if (posix_acl_rc)
e2f34481b24db2 Namjae Jeon       2021-03-16  2713  					ksmbd_vfs_set_init_=
posix_acl(inode);
e2f34481b24db2 Namjae Jeon       2021-03-16  2714  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2715  				if (test_share_confi=
g_flag(work->tcon->share_conf,
e2f34481b24db2 Namjae Jeon       2021-03-16  2716  							   KSMBD_SHARE_FL=
AG_ACL_XATTR)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2717  					struct smb_fattr fa=
ttr;
e2f34481b24db2 Namjae Jeon       2021-03-16  2718  					struct smb_ntsd *pn=
tsd;
e2f34481b24db2 Namjae Jeon       2021-03-16  2719  					int pntsd_size, ace=
_num;
e2f34481b24db2 Namjae Jeon       2021-03-16  2720  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2721  					fattr.cf_uid =3D in=
ode->i_uid;
e2f34481b24db2 Namjae Jeon       2021-03-16  2722  					fattr.cf_gid =3D in=
ode->i_gid;
e2f34481b24db2 Namjae Jeon       2021-03-16  2723  					fattr.cf_mode =3D i=
node->i_mode;
e2f34481b24db2 Namjae Jeon       2021-03-16  2724  					fattr.cf_dacls =3D =
NULL;
e6b1059ffaeac7 Marios Makassikis 2021-04-15  2725  					ace_num =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2726  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2727  					fattr.cf_acls =3D k=
smbd_vfs_get_acl(inode, ACL_TYPE_ACCESS);
e6b1059ffaeac7 Marios Makassikis 2021-04-15  2728  					if (fattr.cf_acls)
e2f34481b24db2 Namjae Jeon       2021-03-16  2729  						ace_num =3D fattr.=
cf_acls->a_count;
e2f34481b24db2 Namjae Jeon       2021-03-16  2730  					if (S_ISDIR(inode->=
i_mode)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2731  						fattr.cf_dacls =3D
e2f34481b24db2 Namjae Jeon       2021-03-16  2732  							ksmbd_vfs_get_acl=
(inode, ACL_TYPE_DEFAULT);
e6b1059ffaeac7 Marios Makassikis 2021-04-15  2733  						if (fattr.cf_dacls)
e2f34481b24db2 Namjae Jeon       2021-03-16  2734  							ace_num +=3D fatt=
r.cf_dacls->a_count;
e2f34481b24db2 Namjae Jeon       2021-03-16  2735  					}
e2f34481b24db2 Namjae Jeon       2021-03-16  2736  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2737  					pntsd =3D kmalloc(s=
izeof(struct smb_ntsd) +
e2f34481b24db2 Namjae Jeon       2021-03-16  2738  							sizeof(struct smb=
_sid) * 3 +
e2f34481b24db2 Namjae Jeon       2021-03-16  2739  							sizeof(struct smb=
_acl) +
e2f34481b24db2 Namjae Jeon       2021-03-16  2740  							sizeof(struct smb=
_ace) * ace_num * 2,
e2f34481b24db2 Namjae Jeon       2021-03-16  2741  							GFP_KERNEL);
e2f34481b24db2 Namjae Jeon       2021-03-16  2742  					if (!pntsd)
e2f34481b24db2 Namjae Jeon       2021-03-16  2743  						goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2744  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2745  					rc =3D build_sec_de=
sc(pntsd, NULL,
e2f34481b24db2 Namjae Jeon       2021-03-16  2746  						OWNER_SECINFO | GR=
OUP_SECINFO | DACL_SECINFO,
e2f34481b24db2 Namjae Jeon       2021-03-16  2747  						&pntsd_size, &fatt=
r);
e2f34481b24db2 Namjae Jeon       2021-03-16  2748  					posix_acl_release(f=
attr.cf_acls);
e2f34481b24db2 Namjae Jeon       2021-03-16  2749  					posix_acl_release(f=
attr.cf_dacls);
e2f34481b24db2 Namjae Jeon       2021-03-16  2750  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2751  					rc =3D ksmbd_vfs_se=
t_sd_xattr(conn,
e2f34481b24db2 Namjae Jeon       2021-03-16  2752  						path.dentry, pntsd=
, pntsd_size);
e2f34481b24db2 Namjae Jeon       2021-03-16  2753  					if (rc)
e2f34481b24db2 Namjae Jeon       2021-03-16  2754  						ksmbd_err("failed =
to store ntacl in xattr : %d\n",
e2f34481b24db2 Namjae Jeon       2021-03-16  2755  								rc);
e2f34481b24db2 Namjae Jeon       2021-03-16  2756  				}
e2f34481b24db2 Namjae Jeon       2021-03-16  2757  			}
e2f34481b24db2 Namjae Jeon       2021-03-16  2758  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2759  		rc =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2760  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2761  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2762  	if (stream_name) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2763  		rc =3D smb2_set_stream=
_name_xattr(&path,
e2f34481b24db2 Namjae Jeon       2021-03-16  2764  						fp,
e2f34481b24db2 Namjae Jeon       2021-03-16  2765  						stream_name,
e2f34481b24db2 Namjae Jeon       2021-03-16  2766  						s_type);
e2f34481b24db2 Namjae Jeon       2021-03-16  2767  		if (rc)
e2f34481b24db2 Namjae Jeon       2021-03-16  2768  			goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2769  		file_info =3D FILE_CRE=
ATED;
e2f34481b24db2 Namjae Jeon       2021-03-16  2770  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2771  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2772  	fp->attrib_only =3D !(r=
eq->DesiredAccess & ~(FILE_READ_ATTRIBUTES_LE |
e2f34481b24db2 Namjae Jeon       2021-03-16  2773  			FILE_WRITE_ATTRIBUTES=
_LE | FILE_SYNCHRONIZE_LE));
64b39f4a2fd293 Namjae Jeon       2021-03-30  2774  	if (!S_ISDIR(file_inode=
(filp)->i_mode) && open_flags & O_TRUNC &&
64b39f4a2fd293 Namjae Jeon       2021-03-30  2775  	    !fp->attrib_only &&=
 !stream_name) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2776  		smb_break_all_oplock(w=
ork, fp);
e2f34481b24db2 Namjae Jeon       2021-03-16  2777  		need_truncate =3D 1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2778  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2779  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2780  	/* fp should be searcha=
ble through ksmbd_inode.m_fp_list
e2f34481b24db2 Namjae Jeon       2021-03-16  2781  	 * after daccess, sacce=
ss, attrib_only, and stream are
e2f34481b24db2 Namjae Jeon       2021-03-16  2782  	 * initialized.
e2f34481b24db2 Namjae Jeon       2021-03-16  2783  	 */
e2f34481b24db2 Namjae Jeon       2021-03-16  2784  	write_lock(&fp->f_ci->m=
_lock);
e2f34481b24db2 Namjae Jeon       2021-03-16  2785  	list_add(&fp->node, &fp=
->f_ci->m_fp_list);
e2f34481b24db2 Namjae Jeon       2021-03-16  2786  	write_unlock(&fp->f_ci-=
>m_lock);
e2f34481b24db2 Namjae Jeon       2021-03-16  2787  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2788  	rc =3D ksmbd_vfs_getatt=
r(&path, &stat);
e2f34481b24db2 Namjae Jeon       2021-03-16  2789  	if (rc) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2790  		generic_fillattr(&init=
_user_ns, d_inode(path.dentry), &stat);
e2f34481b24db2 Namjae Jeon       2021-03-16  2791  		rc =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2792  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2793  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2794  	/* Check delete pending=
 among previous fp before oplock break */
e2f34481b24db2 Namjae Jeon       2021-03-16  2795  	if (ksmbd_inode_pending=
_delete(fp)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2796  		rc =3D -EBUSY;
e2f34481b24db2 Namjae Jeon       2021-03-16  2797  		goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2798  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2799  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2800  	share_ret =3D ksmbd_smb=
_check_shared_mode(fp->filp, fp);
64b39f4a2fd293 Namjae Jeon       2021-03-30  2801  	if (!test_share_config_=
flag(work->tcon->share_conf, KSMBD_SHARE_FLAG_OPLOCKS) ||
e2f34481b24db2 Namjae Jeon       2021-03-16  2802  	    (req_op_level =3D=
=3D SMB2_OPLOCK_LEVEL_LEASE &&
e2f34481b24db2 Namjae Jeon       2021-03-16  2803  	     !(conn->vals->capa=
bilities & SMB2_GLOBAL_CAP_LEASING))) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2804  		if (share_ret < 0 && !=
S_ISDIR(FP_INODE(fp)->i_mode)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2805  			rc =3D share_ret;
e2f34481b24db2 Namjae Jeon       2021-03-16  2806  			goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2807  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2808  	} else {
e2f34481b24db2 Namjae Jeon       2021-03-16  2809  		if (req_op_level =3D=
=3D SMB2_OPLOCK_LEVEL_LEASE) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2810  			req_op_level =3D smb2=
_map_lease_to_oplock(lc->req_state);
e2f34481b24db2 Namjae Jeon       2021-03-16  2811  			ksmbd_debug(SMB,
e2f34481b24db2 Namjae Jeon       2021-03-16  2812  				"lease req for(%s) r=
eq oplock state 0x%x, lease state 0x%x\n",
e2f34481b24db2 Namjae Jeon       2021-03-16  2813  					name, req_op_level,=
 lc->req_state);
e2f34481b24db2 Namjae Jeon       2021-03-16  2814  			rc =3D find_same_leas=
e_key(sess, fp->f_ci, lc);
e2f34481b24db2 Namjae Jeon       2021-03-16  2815  			if (rc)
e2f34481b24db2 Namjae Jeon       2021-03-16  2816  				goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2817  		} else if (open_flags =
=3D=3D O_RDONLY &&
e2f34481b24db2 Namjae Jeon       2021-03-16  2818  			   (req_op_level =3D=
=3D SMB2_OPLOCK_LEVEL_BATCH ||
e2f34481b24db2 Namjae Jeon       2021-03-16  2819  			    req_op_level =3D=
=3D SMB2_OPLOCK_LEVEL_EXCLUSIVE))
e2f34481b24db2 Namjae Jeon       2021-03-16  2820  			req_op_level =3D SMB2=
_OPLOCK_LEVEL_II;
e2f34481b24db2 Namjae Jeon       2021-03-16  2821  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2822  		rc =3D smb_grant_oploc=
k(work, req_op_level,
e2f34481b24db2 Namjae Jeon       2021-03-16  2823  				      fp->persistent=
_id, fp,
e2f34481b24db2 Namjae Jeon       2021-03-16  2824  				      le32_to_cpu(re=
q->hdr.Id.SyncId.TreeId),
e2f34481b24db2 Namjae Jeon       2021-03-16  2825  				      lc, share_ret);
e2f34481b24db2 Namjae Jeon       2021-03-16  2826  		if (rc < 0)
e2f34481b24db2 Namjae Jeon       2021-03-16  2827  			goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2828  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2829  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2830  	if (req->CreateOptions =
& FILE_DELETE_ON_CLOSE_LE)
e2f34481b24db2 Namjae Jeon       2021-03-16  2831  		ksmbd_fd_set_delete_on=
_close(fp, file_info);
e2f34481b24db2 Namjae Jeon       2021-03-16  2832  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2833  	if (need_truncate) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2834  		rc =3D smb2_create_tru=
ncate(&path);
e2f34481b24db2 Namjae Jeon       2021-03-16  2835  		if (rc)
e2f34481b24db2 Namjae Jeon       2021-03-16  2836  			goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2837  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2838  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2839  	if (req->CreateContexts=
Offset) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2840  		struct create_alloc_si=
ze_req *az_req;
e2f34481b24db2 Namjae Jeon       2021-03-16  2841  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2842  		az_req =3D (struct cre=
ate_alloc_size_req *)
e2f34481b24db2 Namjae Jeon       2021-03-16  2843  				smb2_find_context_va=
ls(req,
e2f34481b24db2 Namjae Jeon       2021-03-16  2844  				SMB2_CREATE_ALLOCATI=
ON_SIZE);
e2f34481b24db2 Namjae Jeon       2021-03-16  2845  		if (IS_ERR(az_req)) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2846  			rc =3D check_context_=
err(az_req,
e2f34481b24db2 Namjae Jeon       2021-03-16  2847  				SMB2_CREATE_ALLOCATI=
ON_SIZE);
e2f34481b24db2 Namjae Jeon       2021-03-16  2848  			if (rc < 0)
e2f34481b24db2 Namjae Jeon       2021-03-16  2849  				goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2850  		} else {
e2f34481b24db2 Namjae Jeon       2021-03-16  2851  			loff_t alloc_size =3D=
 le64_to_cpu(az_req->AllocationSize);
e2f34481b24db2 Namjae Jeon       2021-03-16  2852  			int err;
e2f34481b24db2 Namjae Jeon       2021-03-16  2853  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2854  			ksmbd_debug(SMB,
e2f34481b24db2 Namjae Jeon       2021-03-16  2855  				"request smb2 create=
 allocate size : %llu\n",
e2f34481b24db2 Namjae Jeon       2021-03-16  2856  				alloc_size);
e2f34481b24db2 Namjae Jeon       2021-03-16  2857  			err =3D ksmbd_vfs_all=
oc_size(work, fp, alloc_size);
e2f34481b24db2 Namjae Jeon       2021-03-16  2858  			if (err < 0)
e2f34481b24db2 Namjae Jeon       2021-03-16  2859  				ksmbd_debug(SMB,
e2f34481b24db2 Namjae Jeon       2021-03-16  2860  					"ksmbd_vfs_alloc_si=
ze is failed : %d\n",
e2f34481b24db2 Namjae Jeon       2021-03-16  2861  					err);
e2f34481b24db2 Namjae Jeon       2021-03-16  2862  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2863  =

64b39f4a2fd293 Namjae Jeon       2021-03-30  2864  		context =3D smb2_find_=
context_vals(req, SMB2_CREATE_QUERY_ON_DISK_ID);
e2f34481b24db2 Namjae Jeon       2021-03-16  2865  		if (IS_ERR(context)) {
64b39f4a2fd293 Namjae Jeon       2021-03-30  2866  			rc =3D check_context_=
err(context, SMB2_CREATE_QUERY_ON_DISK_ID);
e2f34481b24db2 Namjae Jeon       2021-03-16  2867  			if (rc < 0)
e2f34481b24db2 Namjae Jeon       2021-03-16  2868  				goto err_out;
e2f34481b24db2 Namjae Jeon       2021-03-16  2869  		} else {
e2f34481b24db2 Namjae Jeon       2021-03-16  2870  			ksmbd_debug(SMB, "get=
 query on disk id context\n");
e2f34481b24db2 Namjae Jeon       2021-03-16  2871  			query_disk_id =3D 1;
e2f34481b24db2 Namjae Jeon       2021-03-16  2872  		}
e2f34481b24db2 Namjae Jeon       2021-03-16  2873  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2874  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2875  	if (stat.result_mask & =
STATX_BTIME)
e2f34481b24db2 Namjae Jeon       2021-03-16  2876  		fp->create_time =3D ks=
mbd_UnixTimeToNT(stat.btime);
e2f34481b24db2 Namjae Jeon       2021-03-16  2877  	else
e2f34481b24db2 Namjae Jeon       2021-03-16  2878  		fp->create_time =3D ks=
mbd_UnixTimeToNT(stat.ctime);
e2f34481b24db2 Namjae Jeon       2021-03-16  2879  	if (req->FileAttributes=
 || fp->f_ci->m_fattr =3D=3D 0)
e2f34481b24db2 Namjae Jeon       2021-03-16  2880  		fp->f_ci->m_fattr =3D =
cpu_to_le32(smb2_get_dos_mode(&stat,
e2f34481b24db2 Namjae Jeon       2021-03-16  2881  			le32_to_cpu(req->File=
Attributes)));
e2f34481b24db2 Namjae Jeon       2021-03-16  2882  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2883  	if (!created)
e2f34481b24db2 Namjae Jeon       2021-03-16  2884  		smb2_update_xattrs(tco=
n, &path, fp);
e2f34481b24db2 Namjae Jeon       2021-03-16  2885  	else
e2f34481b24db2 Namjae Jeon       2021-03-16  2886  		smb2_new_xattrs(tcon, =
&path, fp);
e2f34481b24db2 Namjae Jeon       2021-03-16  2887  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2888  	memcpy(fp->client_guid,=
 conn->ClientGUID, SMB2_CLIENT_GUID_SIZE);
e2f34481b24db2 Namjae Jeon       2021-03-16  2889  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2890  	generic_fillattr(&init_=
user_ns, FP_INODE(fp), &stat);
e2f34481b24db2 Namjae Jeon       2021-03-16  2891  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2892  	rsp->StructureSize =3D =
cpu_to_le16(89);
e2f34481b24db2 Namjae Jeon       2021-03-16  2893  	rcu_read_lock();
e2f34481b24db2 Namjae Jeon       2021-03-16  2894  	opinfo =3D rcu_derefere=
nce(fp->f_opinfo);
e2f34481b24db2 Namjae Jeon       2021-03-16  2895  	rsp->OplockLevel =3D op=
info !=3D NULL ? opinfo->level : 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2896  	rcu_read_unlock();
e2f34481b24db2 Namjae Jeon       2021-03-16  2897  	rsp->Reserved =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2898  	rsp->CreateAction =3D c=
pu_to_le32(file_info);
e2f34481b24db2 Namjae Jeon       2021-03-16  2899  	rsp->CreationTime =3D c=
pu_to_le64(fp->create_time);
e2f34481b24db2 Namjae Jeon       2021-03-16  2900  	time =3D ksmbd_UnixTime=
ToNT(stat.atime);
e2f34481b24db2 Namjae Jeon       2021-03-16  2901  	rsp->LastAccessTime =3D=
 cpu_to_le64(time);
e2f34481b24db2 Namjae Jeon       2021-03-16  2902  	time =3D ksmbd_UnixTime=
ToNT(stat.mtime);
e2f34481b24db2 Namjae Jeon       2021-03-16  2903  	rsp->LastWriteTime =3D =
cpu_to_le64(time);
e2f34481b24db2 Namjae Jeon       2021-03-16  2904  	time =3D ksmbd_UnixTime=
ToNT(stat.ctime);
e2f34481b24db2 Namjae Jeon       2021-03-16  2905  	rsp->ChangeTime =3D cpu=
_to_le64(time);
e2f34481b24db2 Namjae Jeon       2021-03-16  2906  	rsp->AllocationSize =3D=
 S_ISDIR(stat.mode) ? 0 :
e2f34481b24db2 Namjae Jeon       2021-03-16  2907  		cpu_to_le64(stat.block=
s << 9);
e2f34481b24db2 Namjae Jeon       2021-03-16  2908  	rsp->EndofFile =3D S_IS=
DIR(stat.mode) ? 0 : cpu_to_le64(stat.size);
e2f34481b24db2 Namjae Jeon       2021-03-16  2909  	rsp->FileAttributes =3D=
 fp->f_ci->m_fattr;
e2f34481b24db2 Namjae Jeon       2021-03-16  2910  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2911  	rsp->Reserved2 =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2912  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2913  	rsp->PersistentFileId =
=3D cpu_to_le64(fp->persistent_id);
e2f34481b24db2 Namjae Jeon       2021-03-16  2914  	rsp->VolatileFileId =3D=
 cpu_to_le64(fp->volatile_id);
e2f34481b24db2 Namjae Jeon       2021-03-16  2915  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2916  	rsp->CreateContextsOffs=
et =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2917  	rsp->CreateContextsLeng=
th =3D 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  2918  	inc_rfc1001_len(rsp_org=
, 88); /* StructureSize - 1*/
e2f34481b24db2 Namjae Jeon       2021-03-16  2919  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2920  	/* If lease is request =
send lease context response */
e2f34481b24db2 Namjae Jeon       2021-03-16  2921  	if (opinfo && opinfo->i=
s_lease) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2922  		struct create_context =
*lease_ccontext;
e2f34481b24db2 Namjae Jeon       2021-03-16  2923  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2924  		ksmbd_debug(SMB, "leas=
e granted on(%s) lease state 0x%x\n",
e2f34481b24db2 Namjae Jeon       2021-03-16  2925  				name, opinfo->o_leas=
e->state);
e2f34481b24db2 Namjae Jeon       2021-03-16  2926  		rsp->OplockLevel =3D S=
MB2_OPLOCK_LEVEL_LEASE;
e2f34481b24db2 Namjae Jeon       2021-03-16  2927  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2928  		lease_ccontext =3D (st=
ruct create_context *)rsp->Buffer;
e2f34481b24db2 Namjae Jeon       2021-03-16  2929  		contxt_cnt++;
e2f34481b24db2 Namjae Jeon       2021-03-16  2930  		create_lease_buf(rsp->=
Buffer, opinfo->o_lease);
e2f34481b24db2 Namjae Jeon       2021-03-16  2931  		le32_add_cpu(&rsp->Cre=
ateContextsLength,
e2f34481b24db2 Namjae Jeon       2021-03-16  2932  			     conn->vals->crea=
te_lease_size);
e2f34481b24db2 Namjae Jeon       2021-03-16  2933  		inc_rfc1001_len(rsp_or=
g, conn->vals->create_lease_size);
e2f34481b24db2 Namjae Jeon       2021-03-16  2934  		next_ptr =3D &lease_cc=
ontext->Next;
e2f34481b24db2 Namjae Jeon       2021-03-16  2935  		next_off =3D conn->val=
s->create_lease_size;
e2f34481b24db2 Namjae Jeon       2021-03-16  2936  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2937  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2938  	if (maximal_access_ctxt=
) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2939  		struct create_context =
*mxac_ccontext;
e2f34481b24db2 Namjae Jeon       2021-03-16  2940  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2941  		if (maximal_access =3D=
=3D 0)
e2f34481b24db2 Namjae Jeon       2021-03-16  2942  			ksmbd_vfs_query_maxim=
al_access(path.dentry,
e2f34481b24db2 Namjae Jeon       2021-03-16  2943  						       &maximal_ac=
cess);
e2f34481b24db2 Namjae Jeon       2021-03-16  2944  		mxac_ccontext =3D (str=
uct create_context *)(rsp->Buffer +
e2f34481b24db2 Namjae Jeon       2021-03-16  2945  				le32_to_cpu(rsp->Cre=
ateContextsLength));
e2f34481b24db2 Namjae Jeon       2021-03-16  2946  		contxt_cnt++;
e2f34481b24db2 Namjae Jeon       2021-03-16  2947  		create_mxac_rsp_buf(rs=
p->Buffer +
e2f34481b24db2 Namjae Jeon       2021-03-16  2948  				le32_to_cpu(rsp->Cre=
ateContextsLength),
e2f34481b24db2 Namjae Jeon       2021-03-16  2949  				le32_to_cpu(maximal_=
access));
e2f34481b24db2 Namjae Jeon       2021-03-16  2950  		le32_add_cpu(&rsp->Cre=
ateContextsLength,
e2f34481b24db2 Namjae Jeon       2021-03-16  2951  			     conn->vals->crea=
te_mxac_size);
e2f34481b24db2 Namjae Jeon       2021-03-16  2952  		inc_rfc1001_len(rsp_or=
g, conn->vals->create_mxac_size);
e2f34481b24db2 Namjae Jeon       2021-03-16  2953  		if (next_ptr)
e2f34481b24db2 Namjae Jeon       2021-03-16  2954  			*next_ptr =3D cpu_to_=
le32(next_off);
e2f34481b24db2 Namjae Jeon       2021-03-16  2955  		next_ptr =3D &mxac_cco=
ntext->Next;
e2f34481b24db2 Namjae Jeon       2021-03-16  2956  		next_off =3D conn->val=
s->create_mxac_size;
e2f34481b24db2 Namjae Jeon       2021-03-16  2957  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2958  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2959  	if (query_disk_id) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2960  		struct create_context =
*disk_id_ccontext;
e2f34481b24db2 Namjae Jeon       2021-03-16  2961  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2962  		disk_id_ccontext =3D (=
struct create_context *)(rsp->Buffer +
e2f34481b24db2 Namjae Jeon       2021-03-16  2963  				le32_to_cpu(rsp->Cre=
ateContextsLength));
e2f34481b24db2 Namjae Jeon       2021-03-16  2964  		contxt_cnt++;
e2f34481b24db2 Namjae Jeon       2021-03-16  2965  		create_disk_id_rsp_buf=
(rsp->Buffer +
e2f34481b24db2 Namjae Jeon       2021-03-16  2966  				le32_to_cpu(rsp->Cre=
ateContextsLength),
e2f34481b24db2 Namjae Jeon       2021-03-16  2967  				stat.ino, tcon->id);
e2f34481b24db2 Namjae Jeon       2021-03-16  2968  		le32_add_cpu(&rsp->Cre=
ateContextsLength,
e2f34481b24db2 Namjae Jeon       2021-03-16  2969  			     conn->vals->crea=
te_disk_id_size);
e2f34481b24db2 Namjae Jeon       2021-03-16  2970  		inc_rfc1001_len(rsp_or=
g, conn->vals->create_disk_id_size);
e2f34481b24db2 Namjae Jeon       2021-03-16  2971  		if (next_ptr)
e2f34481b24db2 Namjae Jeon       2021-03-16  2972  			*next_ptr =3D cpu_to_=
le32(next_off);
e2f34481b24db2 Namjae Jeon       2021-03-16  2973  		next_ptr =3D &disk_id_=
ccontext->Next;
e2f34481b24db2 Namjae Jeon       2021-03-16  2974  		next_off =3D conn->val=
s->create_disk_id_size;
e2f34481b24db2 Namjae Jeon       2021-03-16  2975  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2976  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2977  	if (posix_ctxt) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2978  		contxt_cnt++;
e2f34481b24db2 Namjae Jeon       2021-03-16  2979  		create_posix_rsp_buf(r=
sp->Buffer +
e2f34481b24db2 Namjae Jeon       2021-03-16  2980  				le32_to_cpu(rsp->Cre=
ateContextsLength),
e2f34481b24db2 Namjae Jeon       2021-03-16  2981  				fp);
e2f34481b24db2 Namjae Jeon       2021-03-16  2982  		le32_add_cpu(&rsp->Cre=
ateContextsLength,
e2f34481b24db2 Namjae Jeon       2021-03-16  2983  			     conn->vals->crea=
te_posix_size);
e2f34481b24db2 Namjae Jeon       2021-03-16  2984  		inc_rfc1001_len(rsp_or=
g, conn->vals->create_posix_size);
e2f34481b24db2 Namjae Jeon       2021-03-16  2985  		if (next_ptr)
e2f34481b24db2 Namjae Jeon       2021-03-16  2986  			*next_ptr =3D cpu_to_=
le32(next_off);
e2f34481b24db2 Namjae Jeon       2021-03-16  2987  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2988  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2989  	if (contxt_cnt > 0) {
e2f34481b24db2 Namjae Jeon       2021-03-16  2990  		rsp->CreateContextsOff=
set =3D
e2f34481b24db2 Namjae Jeon       2021-03-16  2991  			cpu_to_le32(offsetof(=
struct smb2_create_rsp, Buffer)
e2f34481b24db2 Namjae Jeon       2021-03-16  2992  			- 4);
e2f34481b24db2 Namjae Jeon       2021-03-16  2993  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  2994  =

e2f34481b24db2 Namjae Jeon       2021-03-16  2995  err_out:
e2f34481b24db2 Namjae Jeon       2021-03-16  2996  	if (file_present || cre=
ated)
e2f34481b24db2 Namjae Jeon       2021-03-16  2997  		path_put(&path);
e2f34481b24db2 Namjae Jeon       2021-03-16  2998  	ksmbd_revert_fsids(work=
);
e2f34481b24db2 Namjae Jeon       2021-03-16  2999  err_out1:
e2f34481b24db2 Namjae Jeon       2021-03-16  3000  	if (rc) {
e2f34481b24db2 Namjae Jeon       2021-03-16  3001  		if (rc =3D=3D -EINVAL)
e2f34481b24db2 Namjae Jeon       2021-03-16  3002  			rsp->hdr.Status =3D S=
TATUS_INVALID_PARAMETER;
e2f34481b24db2 Namjae Jeon       2021-03-16  3003  		else if (rc =3D=3D -EO=
PNOTSUPP)
e2f34481b24db2 Namjae Jeon       2021-03-16  3004  			rsp->hdr.Status =3D S=
TATUS_NOT_SUPPORTED;
ff1d57272552e4 Namjae Jeon       2021-04-13  3005  		else if (rc =3D=3D -EA=
CCES || rc =3D=3D -ESTALE)
e2f34481b24db2 Namjae Jeon       2021-03-16  3006  			rsp->hdr.Status =3D S=
TATUS_ACCESS_DENIED;
e2f34481b24db2 Namjae Jeon       2021-03-16  3007  		else if (rc =3D=3D -EN=
OENT)
e2f34481b24db2 Namjae Jeon       2021-03-16  3008  			rsp->hdr.Status =3D S=
TATUS_OBJECT_NAME_INVALID;
e2f34481b24db2 Namjae Jeon       2021-03-16  3009  		else if (rc =3D=3D -EP=
ERM)
e2f34481b24db2 Namjae Jeon       2021-03-16  3010  			rsp->hdr.Status =3D S=
TATUS_SHARING_VIOLATION;
e2f34481b24db2 Namjae Jeon       2021-03-16  3011  		else if (rc =3D=3D -EB=
USY)
e2f34481b24db2 Namjae Jeon       2021-03-16  3012  			rsp->hdr.Status =3D S=
TATUS_DELETE_PENDING;
e2f34481b24db2 Namjae Jeon       2021-03-16  3013  		else if (rc =3D=3D -EB=
ADF)
e2f34481b24db2 Namjae Jeon       2021-03-16  3014  			rsp->hdr.Status =3D S=
TATUS_OBJECT_NAME_NOT_FOUND;
e2f34481b24db2 Namjae Jeon       2021-03-16  3015  		else if (rc =3D=3D -EN=
OEXEC)
e2f34481b24db2 Namjae Jeon       2021-03-16  3016  			rsp->hdr.Status =3D S=
TATUS_DUPLICATE_OBJECTID;
e2f34481b24db2 Namjae Jeon       2021-03-16  3017  		else if (rc =3D=3D -EN=
XIO)
e2f34481b24db2 Namjae Jeon       2021-03-16  3018  			rsp->hdr.Status =3D S=
TATUS_NO_SUCH_DEVICE;
e2f34481b24db2 Namjae Jeon       2021-03-16  3019  		else if (rc =3D=3D -EE=
XIST)
e2f34481b24db2 Namjae Jeon       2021-03-16  3020  			rsp->hdr.Status =3D S=
TATUS_OBJECT_NAME_COLLISION;
e2f34481b24db2 Namjae Jeon       2021-03-16  3021  		else if (rc =3D=3D -EM=
FILE)
e2f34481b24db2 Namjae Jeon       2021-03-16  3022  			rsp->hdr.Status =3D S=
TATUS_INSUFFICIENT_RESOURCES;
e2f34481b24db2 Namjae Jeon       2021-03-16  3023  		if (!rsp->hdr.Status)
e2f34481b24db2 Namjae Jeon       2021-03-16  3024  			rsp->hdr.Status =3D S=
TATUS_UNEXPECTED_IO_ERROR;
e2f34481b24db2 Namjae Jeon       2021-03-16  3025  =

e2f34481b24db2 Namjae Jeon       2021-03-16  3026  		if (!fp || !fp->filena=
me)
e2f34481b24db2 Namjae Jeon       2021-03-16  3027  			kfree(name);
e2f34481b24db2 Namjae Jeon       2021-03-16 @3028  		if (fp)
e2f34481b24db2 Namjae Jeon       2021-03-16  3029  			ksmbd_fd_put(work, fp=
);
e2f34481b24db2 Namjae Jeon       2021-03-16  3030  		smb2_set_err_rsp(work);
e2f34481b24db2 Namjae Jeon       2021-03-16  3031  		ksmbd_debug(SMB, "Erro=
r response: %x\n", rsp->hdr.Status);
e2f34481b24db2 Namjae Jeon       2021-03-16  3032  	}
e2f34481b24db2 Namjae Jeon       2021-03-16  3033  =

e2f34481b24db2 Namjae Jeon       2021-03-16  3034  	kfree(lc);
e2f34481b24db2 Namjae Jeon       2021-03-16  3035  =

e2f34481b24db2 Namjae Jeon       2021-03-16  3036  	return 0;
e2f34481b24db2 Namjae Jeon       2021-03-16  3037  }
e2f34481b24db2 Namjae Jeon       2021-03-16  3038  =


:::::: The code at line 3028 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side proc=
edures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1240570823771919146==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1240570823771919146==--

