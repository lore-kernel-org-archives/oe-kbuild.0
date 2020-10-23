Content-Type: multipart/mixed; boundary="===============6855886261915429640=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 22/22] mpool: add Kconfig and Makefile
Date: Fri, 23 Oct 2020 08:30:14 +0800
Message-ID: <202010230846.G080o9SD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6855886261915429640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20201012162736.65241-23-nmeeramohide@micron.com>
References: <20201012162736.65241-23-nmeeramohide@micron.com>
TO: Nabeel M Mohamed <nmeeramohide@micron.com>
TO: linux-kernel(a)vger.kernel.org
TO: linux-block(a)vger.kernel.org
TO: linux-nvme(a)lists.infradead.org
TO: linux-mm(a)kvack.org
TO: linux-nvdimm(a)lists.01.org
CC: smoyer(a)micron.com
CC: gbecker(a)micron.com
CC: plabat(a)micron.com
CC: jgroves(a)micron.com
CC: Nabeel M Mohamed <nmeeramohide@micron.com>

Hi Nabeel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on linux/master v5.9 next-20201022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nabeel-M-Mohamed/add-Objec=
t-Storage-Media-Pool-mpool/20201013-002941
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
bbf5c979011a099af5dc76498918ed7df445635b
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-m001-20201022 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/mpool/pd.c:110 pd_bio_discard() warn: should '1 << (dparm->dpr_prop=
.pdp_sectorsz)' be a 64 bit type?
drivers/mpool/pd.c:239 pd_bio_rw() warn: should '1 << (dparm->dpr_prop.pdp_=
sectorsz)' be a 64 bit type?
drivers/mpool/pd.c:258 pd_bio_rw() warn: argument 6 to %lx specifier is cas=
t from pointer
drivers/mpool/smap.c:424 smap_alloc() error: double unlocked '*rmlock' (ori=
g line 413)
drivers/mpool/mlog.c:66 mlog_alloc_cmn() error: we previously assumed 'layo=
ut' could be null (see line 45)
drivers/mpool/pmd.c:1940 pmd_mdc_cap() warn: should '(layout->eld_ld.ol_zcn=
t * zonepg) << 12' be a 64 bit type?
drivers/mpool/mpctl.c:2596 mpc_ioctl() warn: possible memory leak of 'argp'

Old smatch warnings:
drivers/mpool/smap.c:446 smap_alloc() error: double unlocked '*rmlock' (ori=
g line 413)
drivers/mpool/smap.c:457 smap_alloc() error: double unlocked '*rmlock' (ori=
g line 413)

vim +110 drivers/mpool/pd.c

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12   88  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12   89  /**
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12   90   * pd_bio_discard() - iss=
ue discard command to erase a byte-aligned region
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12   91   * @dparm:
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12   92   * @off:
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12   93   * @len:
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12   94   */
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12   95  static int pd_bio_discard=
(struct pd_dev_parm *dparm, loff_t off, size_t len)
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12   96  {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12   97  	struct block_device *bde=
v;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12   98  	int rc;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12   99  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  100  	bdev =3D dparm->dpr_dev_=
private;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  101  	if (!bdev) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  102  		rc =3D -EINVAL;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  103  		mp_pr_err("bdev %s not =
registered", rc, dparm->dpr_name);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  104  		return rc;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  105  	}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  106  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  107  	/* Validate I/O offset i=
s sector-aligned */
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  108  	if (off & PD_SECTORMASK(=
&dparm->dpr_prop)) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  109  		rc =3D -EINVAL;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12 @110  		mp_pr_err("bdev %s, off=
set 0x%lx not multiple of sec size %u",
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  111  			  rc, dparm->dpr_name,=
 (ulong)off, (1 << PD_SECTORSZ(&dparm->dpr_prop)));
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  112  		return rc;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  113  	}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  114  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  115  	if (off > PD_LEN(&dparm-=
>dpr_prop)) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  116  		rc =3D -EINVAL;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  117  		mp_pr_err("bdev %s, off=
set 0x%lx past end 0x%lx",
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  118  			  rc, dparm->dpr_name,=
 (ulong)off, (ulong)PD_LEN(&dparm->dpr_prop));
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  119  		return rc;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  120  	}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  121  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  122  	rc =3D blkdev_issue_disc=
ard(bdev, off >> SECTOR_SHIFT, len >> SECTOR_SHIFT, GFP_NOIO, 0);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  123  	if (rc)
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  124  		mp_pr_err("bdev %s, off=
set 0x%lx len 0x%lx, discard faiure",
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  125  			  rc, dparm->dpr_name,=
 (ulong)off, (ulong)len);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  126  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  127  	return rc;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  128  }
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  129  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  130  /**
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  131   * pd_zone_erase() - issu=
e write-zeros or discard commands to erase PD
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  132   * @dparm:
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  133   * @zaddr:
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  134   * @zonecnt:
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  135   * @flag:
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  136   * @afp:
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  137   */
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  138  int pd_zone_erase(struct =
pd_dev_parm *dparm, u64 zaddr, u32 zonecnt, bool reads_erased)
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  139  {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  140  	int rc =3D 0;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  141  	u64 cmdopt;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  142  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  143  	/* Validate args against=
 zone param */
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  144  	if (zaddr >=3D dparm->dp=
r_zonetot)
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  145  		return -EINVAL;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  146  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  147  	if (zonecnt =3D=3D 0)
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  148  		zonecnt =3D dparm->dpr_=
zonetot - zaddr;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  149  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  150  	if (zonecnt > (dparm->dp=
r_zonetot - zaddr))
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  151  		return -EINVAL;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  152  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  153  	if (zonecnt =3D=3D 0)
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  154  		return 0;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  155  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  156  	/*
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  157  	 * When both DIF and SED=
 are enabled, read from a discared block
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  158  	 * would fail, so we can=
't discard blocks if both DIF and SED are
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  159  	 * enabled AND we need t=
o read blocks after erase.
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  160  	 */
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  161  	cmdopt =3D dparm->dpr_cm=
dopt;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  162  	if ((cmdopt & PD_CMD_DIS=
CARD) &&
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  163  	    !(reads_erased && (c=
mdopt & PD_CMD_DIF_ENABLED) && (cmdopt & PD_CMD_SED_ENABLED))) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  164  		size_t zlen;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  165  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  166  		zlen =3D dparm->dpr_zon=
epg << PAGE_SHIFT;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  167  		rc =3D pd_bio_discard(d=
parm, zaddr * zlen, zonecnt * zlen);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  168  	}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  169  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  170  	return rc;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  171  }
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  172  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  173  static void pd_bio_init(s=
truct bio *bio, struct block_device *bdev, int rw, loff_t off, int flags)
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  174  {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  175  	bio_set_op_attrs(bio, rw=
, flags);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  176  	bio->bi_iter.bi_sector =
=3D off >> SECTOR_SHIFT;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  177  	bio_set_dev(bio, bdev);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  178  }
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  179  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  180  static struct bio *pd_bio=
_chain(struct bio *target, unsigned int nr_pages, gfp_t gfp)
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  181  {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  182  	struct bio *new;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  183  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  184  	new =3D bio_alloc_bioset=
(gfp, nr_pages, &mpool_bioset);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  185  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  186  	if (!target)
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  187  		return new;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  188  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  189  	if (new) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  190  		bio_chain(target, new);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  191  		submit_bio(target);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  192  	} else {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  193  		submit_bio_wait(target);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  194  		bio_put(target);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  195  	}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  196  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  197  	return new;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  198  }
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  199  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  200  /**
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  201   * pd_bio_rw() -
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  202   * @dparm:
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  203   * @iov:
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  204   * @iovcnt:
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  205   * @off: offset in bytes =
on disk
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  206   * @rw:
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  207   * @opflags:
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  208   *
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  209   * pd_bio_rw() expects a =
list of kvecs wherein each base ptr is sector
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  210   * aligned and each lengt=
h is multiple of sectors.
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  211   *
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  212   * If the IO is bigger th=
an 1MiB (BIO_MAX_PAGES pages) or chunk_size_kb,
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  213   * it is split in several=
 IOs.
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  214   */
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  215  static int pd_bio_rw(stru=
ct pd_dev_parm *dparm, const struct kvec *iov,
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  216  		     int iovcnt, loff_t=
 off, int rw, int opflags)
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  217  {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  218  	struct block_device *bde=
v;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  219  	struct page *page;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  220  	struct bio *bio;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  221  	uintptr_t iov_base;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  222  	u64 sector_mask;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  223  	u32 tot_pages, tot_len, =
len, iov_len, left, iolimit;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  224  	int i, cc, rc =3D 0;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  225  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  226  	if (iovcnt < 1)
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  227  		return 0;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  228  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  229  	bdev =3D dparm->dpr_dev_=
private;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  230  	if (!bdev) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  231  		rc =3D -EINVAL;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  232  		mp_pr_err("bdev %s not =
registered", rc, dparm->dpr_name);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  233  		return rc;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  234  	}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  235  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  236  	sector_mask =3D PD_SECTO=
RMASK(&dparm->dpr_prop);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  237  	if (off & sector_mask) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  238  		rc =3D -EINVAL;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12 @239  		mp_pr_err("bdev %s, %s =
offset 0x%lx not multiple of sector size %u",
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  240  			  rc, dparm->dpr_name,=
 (rw =3D=3D REQ_OP_READ) ? "read" : "write",
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  241  			  (ulong)off, (1 << PD=
_SECTORSZ(&dparm->dpr_prop)));
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  242  		return rc;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  243  	}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  244  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  245  	if (off > PD_LEN(&dparm-=
>dpr_prop)) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  246  		rc =3D -EINVAL;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  247  		mp_pr_err("bdev %s, %s =
offset 0x%lx past device end 0x%lx",
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  248  			  rc, dparm->dpr_name,=
 (rw =3D=3D REQ_OP_READ) ? "read" : "write",
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  249  			  (ulong)off, (ulong)P=
D_LEN(&dparm->dpr_prop));
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  250  		return rc;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  251  	}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  252  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  253  	tot_pages =3D 0;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  254  	tot_len =3D 0;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  255  	for (i =3D 0; i < iovcnt=
; i++) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  256  		if (!PAGE_ALIGNED((uint=
ptr_t)iov[i].iov_base) || (iov[i].iov_len & sector_mask)) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  257  			rc =3D -EINVAL;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12 @258  			mp_pr_err("bdev %s, %s=
 off 0x%lx, misaligned kvec, base 0x%lx, len 0x%lx",
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  259  				  rc, dparm->dpr_name=
, (rw =3D=3D REQ_OP_READ) ? "read" : "write",
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  260  				  (ulong)off, (ulong)=
iov[i].iov_base, (ulong)iov[i].iov_len);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  261  			return rc;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  262  		}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  263  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  264  		iov_len =3D iov[i].iov_=
len;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  265  		tot_len +=3D iov_len;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  266  		while (iov_len > 0) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  267  			len =3D min_t(size_t, =
PAGE_SIZE, iov_len);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  268  			iov_len -=3D len;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  269  			tot_pages++;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  270  		}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  271  	}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  272  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  273  	if (off + tot_len > PD_L=
EN(&dparm->dpr_prop)) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  274  		rc =3D -EINVAL;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  275  		mp_pr_err("bdev %s, %s =
I/O end past device end 0x%lx, 0x%lx:0x%x",
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  276  			  rc, dparm->dpr_name,=
 (rw =3D=3D REQ_OP_READ) ? "read" : "write",
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  277  			  (ulong)PD_LEN(&dparm=
->dpr_prop), (ulong)off, tot_len);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  278  		return rc;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  279  	}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  280  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  281  	if (tot_len =3D=3D 0)
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  282  		return 0;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  283  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  284  	/* IO size for each bio =
is determined by the chunk size. */
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  285  	iolimit =3D chunk_size_k=
b >> (PAGE_SHIFT - 10);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  286  	iolimit =3D clamp_t(u32,=
 iolimit, 32, BIO_MAX_PAGES);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  287  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  288  	left =3D 0;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  289  	bio =3D NULL;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  290  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  291  	for (i =3D 0; i < iovcnt=
; i++) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  292  		iov_base =3D (uintptr_t=
)iov[i].iov_base;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  293  		iov_len =3D iov[i].iov_=
len;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  294  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  295  		while (iov_len > 0) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  296  			if (left =3D=3D 0) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  297  				left =3D min_t(size_t=
, tot_pages, iolimit);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  298  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  299  				bio =3D pd_bio_chain(=
bio, left, GFP_NOIO);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  300  				if (!bio)
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  301  					return -ENOMEM;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  302  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  303  				pd_bio_init(bio, bdev=
, rw, off, opflags);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  304  			}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  305  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  306  			len =3D min_t(size_t, =
PAGE_SIZE, iov_len);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  307  			page =3D virt_to_page(=
iov_base);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  308  			cc =3D -1;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  309  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  310  			if (page)
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  311  				cc =3D bio_add_page(b=
io, page, len, 0);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  312  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  313  			if (cc !=3D len) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  314  				if (cc =3D=3D 0 && bi=
o->bi_vcnt > 0) {
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  315  					left =3D 0;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  316  					continue;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  317  				}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  318  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  319  				bio_io_error(bio);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  320  				bio_put(bio);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  321  				return -ENOTRECOVERAB=
LE;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  322  			}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  323  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  324  			iov_len -=3D len;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  325  			iov_base +=3D len;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  326  			off +=3D len;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  327  			left--;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  328  			tot_pages--;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  329  		}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  330  	}
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  331  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  332  	ASSERT(bio);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  333  	ASSERT(tot_pages =3D=3D =
0);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  334  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  335  	rc =3D submit_bio_wait(b=
io);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  336  	bio_put(bio);
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  337  =

93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  338  	return rc;
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  339  }
93efb0dc85ec75d Nabeel M Mohamed 2020-10-12  340  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6855886261915429640==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICIgAkl8AAy5jb25maWcAlBzLctw28p6vmHIuycHekSyrnNrSASTBGWRIggbAeejCUuSRo1pL
8uqxa//9dgN8AGBTyfqQaNCNV6PfaPDnn35esJfnh7ur59vrq69ffyy+HO+Pj1fPx8+Lm9uvx38u
MrmopFnwTJh3gFzc3r98/8f3j+ft+dniw7vf3i0Xm+Pj/fHrIn24v7n98gJ9bx/uf/r5p1RWuVi1
adpuudJCVq3he3Px5sv19dvfFr9kxz9ur+4Xv717/2759uTDr+6vN143odtVml786JtW41AXvy3f
L5c9oMiG9tP3H5b23zBOwarVAF56w6esagtRbcYJvMZWG2ZEGsDWTLdMl+1KGkkCRAVduQeSlTaq
SY1UemwV6lO7k8qbN2lEkRlR8tawpOCtlsqMULNWnGUweC7hP4CisSsQ+OfFyp7V18XT8fnl20hy
UQnT8mrbMgXEEaUwF+9PAX1YVlkLmMZwbRa3T4v7h2ccYURoWC3aNUzK1QSpJ7lMWdFT9c0bqrll
jU8nu8lWs8J4+Gu25e2Gq4oX7epS1CO6D0kAckqDisuS0ZD95VwPOQc4owGX2mQAGcjjrZckn79q
gnThyuNe+8vXxoTFvw4+ew2MGyEWlPGcNYWxbOOdTd+8ltpUrOQXb365f7g//jog6B2r/R3og96K
OiVXUEst9m35qeENJxF2zKTrdgLvWVZJrduSl1IdWmYMS9fjWTWaFyLxV8Ia0FbEMPZUmYKJLAYs
GNi16KUJBHPx9PLH04+n5+PdKE0rXnElUiu3tZKJJ+A+SK/ljobwPOepETh1nrelk98Ir+ZVJiqr
HOhBSrFSoJFA2kiwqH7HOXzwmqkMQBrOqVVcwwR013Ttyx22ZLJkogrbtCgppHYtuEKKHmaWzYyC
gwcqg2YAPUhj4fLU1m6vLWXGw5lyqVKedXoQiDRCdc2U5vNEy3jSrHJtWeN4/3nxcBMd8mglZLrR
soGJHCdm0pvGcoyPYiXlB9V5ywqRMcPbgmnTpoe0INjFqvrtyH0R2I7Ht7wy+lVgmyjJshQmeh2t
hGNi2e8NiVdK3TY1LjlSfk5i07qxy1XaGp7ecFl5Mbd3x8cnSmTAcm5aWXGQCW/O9SWwuRIys3Z1
ENZKIkRkBa0YHDhvioLSC7JCp6I1iqUbxxqemQthjo/m56D0hVitkTk7Evh8NNl836dWnJe1gTGt
KzBqwK59K4umMkwdaD3psIi19P1TCd37I4Dj+Ye5evrX4hmWs7iCpT09Xz0/La6urx9e7p9v77+M
h7IVytjzZKkdIyKXPbMQTKyCGAR5KRRYy9/BLD5j6XQN0sy2vbIbVpDoDBVsykHVQ2/aN0EuRN9M
0+TTImzvTutv0MljHNie0LKw+sgfzpJcpc1CEywPx9MCbNws/Gj5HjjeEwEdYNg+URNuz3btJJQA
TZqajFPtyPjEmoB6RYFOYOlbC4RUHA5G81WaFMJXFgjLWSUbc3F+Nm1sC87yi9NgJJkmSMfZJbXW
py0TX6RCyoZ+YyKqU48WYuP+mLZYDvKbnR/radJC4qA5GGyRm4vTpd+OR1+yvQc/OR0FUFQGAgOW
82iMk/cBgzfg9Ts/3nK6VcW9wOrrP4+fX74eHxc3x6vnl8fj08hCDcQqZd07+GFj0oA6B13upP/D
SDRiwMBs6aauIZzQbdWUrE0YhENpIJMWa8cqA0BjF9xUJYNlFEmbF432HK0u1AEynJx+jEYY5omh
k3lHrRtABn+TV0g8ylFNV0o2tfbHAJcwpfRUUmw6dG/59rc7lbE1Z0K1IWTUBDkYWVZlO5GZNTEL
6MKZnt5ZOpTZ7bS1yPRkkSrz45quMQd9cck9HwrYVXMTEATZH4fsYKSW7IbL+FakpLft4DACquGA
IN2SucpfHxn8LtrSQiABXhvoeGreNU83tQQOQqML3mJgQDu7AUHlhKB+CAJHlnEwluBukkykeME8
ZxUZBQhhXTrlsYX9zUoYzXl2XmCksihWhYY+RB1WAm0Y4ZGrBNiecjdsHxmM64JSv+dMEJdIib5B
qBRBYGUN1lhccvR+7LlJVYLABZSN0TT8QUyBDqvx/FWn7ER2cu4ZOIsDdi/ltXXnrcaPXctU1xtY
DVhYXI53GHU+/ohtZzRTCbpCAIurgEdW3GCA1XbONb0LPNTY+c7XIOdF6LFZD9i5fqRDhvZgHKGz
D1Up/KRHoPGijVPHyCCeQWfXW1kDbmz0EyTcI1QtfXwtVhUrco+X7Rb8BhsY+A16DYo0iKAFnWgQ
sm1U5BqOnbKtgOV3tKVoNgbgeHJW3+dZuwvSCLCShCkFcSWVPMGBD6WnMPuWNjjOsTUBTw5Ihrwf
OCQDhiU5agUM0QN/tM5f4aPRbvaGC/F/9wNDb4+RtUQzOu4TZqkgFIv0HUS2n4h5oRfPMt+COZmC
qdo4aKzTk+VZ73p0adr6+Hjz8Hh3dX99XPD/HO/BC2bgSqToB0NEM7oj4YjDsqxud0DYX7stbWxP
et1/c8Zx7G3pJnRuDi12mL1kQGw/gaoLFuR/dNEktH0oZELpBOgP56FWvD/McGxredEnbhVoCVnO
QTHlAm57IFhNnoMrWDMY28+C+AY7FwUdbVnlaQ1iEHuGad8e+fws8Zlvb1P0wW/furnENGrojKcy
870KcOlr8OqtpTAXb45fb87P3n7/eP72/MxP9G7AzPZun7dhA9G2c/MnsLJsIjko0dNUFfr3LlFx
cfrxNQS2x0w2idDzRT/QzDgBGgx3cj5JHGnWBt5XD3DKfNo4KI/WHlUQbLjJ2aE3fG2epdNBQMWI
RGHaKAu9k0FZYGCC0+wpGAPPCG8tuLXcBAYwGCyrrVfAbCZSHOAkOo/OhfUQl3m+OwaEPcgqHhhK
YWJr3fgXJwGeZXUSza1HJFxVLtcHFlaLpIiXrBuN+dA5sFW6lnSsaNcNmPwiGVEuJdABzu+9d2Ng
s72281zU0mk1WLoVUt9MaFaBGLNM7lqZ50Cui+X3zzfw73o5/AuFrtVlPTdRY1PIHofk4GNwpopD
islP7umW7ADeMuaG1wctgEWi1HG9clFmASqz0BdDYN5FabBs7qQRD52nTu1YS1A/Plwfn54eHhfP
P765dIgXjQ6aqackpTD9DeKmc85Mo7jz7331hsD9KatFSgyDwLK2SVxPKGSR5cLGnaMt5AacHODw
mUGceIDrqYpwXXxvgJOQO0dnM1jbFrZCmgoE9kuZmRWFHU5FZOGcrrmotQ7bWTkuowu+PI0sdd6W
iZi2ON4MhxrYqbsSgSC2aKhwSZbA+DkEMoNyoryyA8guuG7g+q8a7md+4GgYpvwCg9W1vRLlDSi6
FpXNjs9QcL1F3VckwKXttufR8Qh4RbmA4CVEy3QJ+rrBJDIwf2E6j3hc0Hb9+kKjlCXl7veofT5n
GOR3IP5aojNkl0W7xqmqXgGXm490e63p+7QSvcVTGgQeBhVaDMbG94J7flUV+ACdJXFJrXMfpTiZ
hxmdhuOlZb1P16vI+cCrhm3YAmZalE1ppTcHVVccvPwiIlgOg3iy1J57IkC1W33TBtGoFeZyP9FE
o5uFiWWMbnnBo6wGzA8S5QSXcjk7OAgw1W19WEmKUXt4Ch4taxTV9XLN5F5Qndc1d1zp7dy2cQh8
0VNQxiM7q5MBefTUS0GxAQMeFtL5Yh7T7CNF2Jt2a9Q1Or5g1hO+Qh+NBuIN44eTCbD3qMej7SBe
i1NWujRTDVbOGQ5ba9CiZYnYWRKNiiuJUSCmNxIlN7xyGRO8II2Y0tfKXQOmewu+YulhAnJME1sV
BAC3zJk8gOJtpl6DfaG6utvcmd5mzcExL0Z96Wy6F2TdPdzfPj88Brc/XjTXGSjF6lBHehjWVMld
aC2G+GNmLn+RJ+eTYITrGnydWCv016AdX7sb7IAgQtYF/oeTCRPxcXNxNwQYIgUxDy6Qh6bhoCYA
J9aTZjgbpxpzNmEJ0Ed3foO1PfHCP1jPbOYUM6Hg/NpVgj7nxGNKa+YqkLQRKWU88YDA9oPMpepQ
B2ITgcD02NgkOfSSSEl5Exaj4BjYNrN4cHFZWou+mzcIHqPXAnTUsc1w/rB1+twyGREBDOBJPO7g
Vof33g+WDHgnKwqU1aJ3ePBOvuHotB+vPi+9fyHJa5zNCfmsP2gT1BA7SryIUaqp4xvCQONgTQNe
Fe08RVca5Sl0/IWOujAiyOuH7R2JBlIsZ9CQaJjJsgq2Rz6Jdslm/BOkqktuzOxHl2G1D7Y1paBs
hucbuwPqIhAM+Tb84Clcngt/TPgJbD+Xu+EpBu8kbH3ZniyXc6DTD0vKwl6275dLf3o3Co174dUb
OsO0Vnhl7kWKfM/T6CdG3lRA7oB1o1aYDjrEvbQI0sZD4yslDKliet1mDWnEhwgSdIrC+PUklgDF
bWoK+ey1/qwQqwr6nwZR71qaumhWoWeJ5hV95tIHL73o1kbcNKxL0mwz7d2GONmMDUYQ88Qoe1kV
tDTHmFitQdO1zGxmBbZDqXJQPSI/tEVmplcKNr1SgO6t8WLVT+C9FoBPeIVlWdsbCR/WaYVOxDpC
BsnnLuftFLN18EWciO4G0XUBcWKNVt/419X1w3+Pjwuw9FdfjnfH+2e7VFT9i4dvWOYb5Au6tA0t
hWPWhw7EKLWDActqot7DfAouxoNNfvUnbVlbgzaWmyZOzpRitTbd3QR2qf0cnW2BszVgHqxLZA0z
mrU4vWkxLVuvfGUeNLfdjVUweJ0qt7546bWIh1d828otV0pknMqPIQ7oirHwzQewFLwWLySFpoQZ
MJEHysOw4MYYv0rENm5hbjn6P7YtZ9Vk7AwYaW5gG/Ip/qkNsiSO+kOkllpKz4JFNtn6AIzaRV3G
fEEqrWgGtlqBOQ3rFi1K54NHREgbDaF3m2nQBlbxj3fGozTb7lbomnqlWBZv4TVYlAlyq00FXmvE
jAJ/GwaKK155v20hwyDJcWKioy0FpRL+Jktu1jKLsJNVmCrqWDZrsH4TL0d26KHMKmXnU+Zk6S7h
b7oF4h1FqHIdr9dczLWHd7QE+oi5WofO+QgBunNGptNGnEl2boLBIdSLiOjaMX3ujtsTq6w2ORWX
DUpU4E0+sCztlvaMAX/nOgxg6jJONmjrmvVVhov88fjvl+P99Y/F0/XV1yC07GXZs9+9dK/kFsu1
MeliZsBDIVqQHLFgFP+ZvIqF9xevOMxcaQOJixTUwBK0xae6oNq2dSt/v4usMg7roe0h2QNgXR30
/7M06402RsxlrgZKhyQiMXrC+EwXYPxNOsztn2aAcdcjUwYowxZ9jryJOXLx+fH2P+4K21+RI9hc
NsXFKXVvacJgKU37AWZ697asY/+gtw+D/9NBjY2scvEX09hzqeSu3XwMxRYcLp6Ba+KSjEpUnr9s
O565dHVpVbUlzNOfV4/Hz57/Rg6HDyrugvpZQgMMRyE+fz2G+iC0zX2LPcwCHNqoiG0ElrxqZkCG
y1iyB1if8ydLThyovx/w/fBx7YNn/pcOr9108vLUNyx+AUuwOD5fv/vVy7aBUXYZHi8DDW1l6X54
ob5twfT3yXIdIqdVcrqEDX5qhAouHPCGOmmotFB3d40JUM/aYDInCRkDq6CC4tuZHbnd3t5fPf5Y
8LuXr1cR19hkvJ+68+bY+1ewXUg3bZqgYIq2wQwTxprADyZY5mQpdoX57ePdf4GvF9mgAvoYIvPr
niCUknnu0zIXqrReCdjqktHZhXzXpnlXOUYirKRcFXwYa1IzznOx+IV/fz7eP93+8fU4LldgBczN
1fXx14V++fbt4fHZV16YDtkysgoGQVz70Qe2KLy9KmEvrA4BOdv0OwwBWOzcA8eSCX+snWJ1HdQ0
IDRltW7w8lmyQJgRhk8GfQNiR0vFaTuXXkCEDFgXHV8rOV0ysjvz/4d6Q/RrF1n7SxuawlIYS8nu
/r03L+b45fFqcdPP4+yKhfSvP2iEHjxhx8AP3WyDW2i8VGyA2S8n0XEvvxA1bPcfTvyCBsyqspO2
EnHb6YfzuNXUrLEX7MGb0avH6z9vn4/XmHV4+/n4DZaO+m5iF1xiqStO69pcQips6wMLd4nTC0Z3
54jGyctyWTJIV/nkDdG3oH8+vc7auMoJUgB/b0qwWSwh0+12Np7nAjz2yrRNZTUL1hKnGOdFyQDM
m+CbAyOqNumeOPoDCdg1FhMRpTSbuLbDtWLxAgWQNd3eDQMOVJtT5bN5U7lcKlcKw2Dq6d+Wh0HO
WHhpR1xLuYmAaDYwaBSrRjbEwzMNFLb21r3DI5KaoLgNJsO6gukpAgQBXUg0A+wuRcoJ0d3K3UNo
V7nW7tbC8PCdylAdpIfaGVuA73rEQ+oSM0vdY+X4DCCGAqmrMldB03FKaFYdnvbjnvB48PX1bMf1
rk1gO67cPYKVYg/cOYK1XU6EhJ441sU0qmorCYQXwVVxVBNKcAPG4+gb2np9VyBke1CDEPP3FaCq
IxGmnqlTG0Xzdahfgjv4Rk27Yphr6bIiWGhJgvFFEYXScZeTBvd0p6tOiBbTtbpL5RlYJpuZYrTO
cxF12roXqf3LeAIXrxVHfIom3UVHV7VHYiDFC2CPCDgp9+pj+bh9zNkGEJQUSVa/jHPvhFmDanSH
biuLYs5Ip48yffBfPiF0avYv3xGWErmwjAuheyVX2eswIDhWCGL+/O/itXVDjolwLHeOs8f2VC0Q
8+dgghU5lZa5VXAmtoOghPpLT56CGHs8AaAGs9Zok3iRWxEhVKcF2bu7oPxznDuooo0Q+F4YWqeH
vcbCXGJcr6p2bhAfhRiqA1t0rMiPl+n4rXtePTV2QBnhbjKG+uMRo4uXQi2McqjFqru0eD8JQzo4
i0zrEMckwtXnUPRGLnErGaFU22j8IHYHm9Z9p0Ht9r7szoLi7o5dyO4UaFxvDeSDOK67BAzN4eAU
geUOPJ/xLg2MiF+3T9YreK8evKIF55Gmcvv2j6un4+fFv9yLgW+PDze3XZJxDLIArSPDaxNYtN6R
ZF0ZYF84/8pMAVXwUzPozYqKLLz/C9+5Hwr0XImvdXxmtq9NND6a8O7xnZj7NO3Oy9732iCLvntE
nKZC+GxnB6YrBUf3Zw6O42iVDp90CVMsE0xB14N2YJQdBe7QazhYfr0DD0hrtAvDc8FWlPa+jyBD
UwF3gqweykQWeqo87Svr+N4v6W45h5/gJaYaLys+haWl40NSEB7MEoYgfDqY6BXZ6D5KErVjvnGl
hCGfIHag1pwsxzxfD8Zy7GzaC1S3NKaI3tZOoViIQhLe7rC75bbeC325gGi7hEqjeiQS+GoexPsQ
r2WAp5L8npBbL1YE+LeWfuuw/2BcPHlZM0ojINh9kalXOIEiJ8Ft3lUj97qpvnp8vkWpXpgf38Ly
eKCVEc7Rz7aYVKdkFIKQFRtRPe7UmdQUAPMRfvOYmoyWErDyJJmG2ys/YTpl0oYOmJD9DoUc35B7
YT/gCekKXTJwDboPW43SOoI3h2SGZXqMJP8UwvtvsQRT/zTQFSy87+bo6sTL4lTdoWFpuVVuE4M6
1gYYiTGgKr0P81iF7DrDycldcEMKEg7maQZoyTwDG4yk/YBRNta9jyjzkLiz2tFdJ+2DzatwRaCj
C1bXKOosy1DPtlZ1Uv5C/96wTXiO/8M4LvzwjofrKmS6POCIMb5GdznO78frl+crTNDhh+MWtkL0
2eOoRFR5adBZnXhTFAh+hAmmDkmnSoQFjx0AbAZdK4/DxIVRY3JxZtl2T+Xx7uHxx6IcrwMm6bFX
KxHHMsaSVQ2jIGOTfURlXzXXmALD0klqJIiswA3jFGjrMryTksoJRpyxwG8VrXzz2G1n+ApKIPpB
wRH1OMgVExmnl7DQ+ywaN0ErH136IiekMxlQG5YpjlIdxIHER7FSm8Jqo1dcWMBmpaI18TtJ9/xD
YoAQpha8pMqYg9RUnVJ/G2uJ7762lKmLs+VvUc3r7KOdkDrEY571rpZwGNX/OHuyJcdxHH8lYx42
eiKmYy1faT/UA01Rtip1JSnbynpRVFdlbGdMVWVHZfb27N8vQOogKVCe3Yc6DICXSAIgCICEZ/hA
Q51l5+KWQTM6VZMkbjwTIMsw1oO+CpHwfbEMdavr+hDDz5kQoQGbkEG+eIcFR1L14d5ZeNYpmqz1
U+W56Y2Yw5mSz59U3i+VkbSDDRF2uWGrM8VbVzMczN54r9BbjEc0rBchpRhMmXp5dznFRuEZ92HD
vR1l7tRT6dhR1zphwr4uni2olzbKZLeCIm2SsSMlVqrOWdcOEdCRK8H8S8BEQKQU/JQzSfp+2f3V
9g6bKXbf2cxvexJZ5SXdCvPjkYkOx8ri+f2v15//RMcAwlkRmM2DoDRRUDCsMzL+ApHjXNhoWJwy
emHXGf1pmkTmWs6SWOg3ukZTV7pmSOO6qIyQwLxvtNZVDQppq4NeKB8lIKoKO+2f/t3GJ155jSFY
+/KGGkMCySSNx3GlVSBRpkEeJS7d/NxQcQmaoq3PReEG2YAGA6y+fEgDF0Km4KVOg9ikPM/hxmbp
BnBaWkZHFWocnFvDyLTyXdlt7DBcG4gLzgPVvOrBbvXnuAovUE0h2fUGBWJhXtAiTPNabB3+e5w7
/gw0/HywDZu9xOzxH/725c/fXr78za09jzeeRWFYdZetu0wv226toy2Lzk2kiUyeG4yqaeOAVQRH
v52b2u3s3G6JyXX7kKfVNoz11qyNUp6E6GDtVlLfXqOLGLRirUzWT5WYlDYrbaarvTpq3KdnCPXX
D+OVOG7b7HqrPU0GwoNW5M00V9l8RXkFayeMaR/OmB4ZnRSCrAOzXOI1jC/FJjSgV2ojMEjE3FcR
bGJzlUPbVaoZJDChmAdGk2LasQBbljE9tjqUn5fVOQnPloEWDjKNSf3S3LYhA1GOOtiByMouGSva
3WIZPZLoWPAikMosyzgdBc1qltFz1yw3dFUs4KNXncpQ89usvFaMDmlIhRA4pg2dkxm/hzaP0EPm
VJ6auMCrYDiUwVnf9rA5wPQxbYciKysrUVzUNa05zdQuqtTZBUP91AnRg9IirwIiEkdYKLrJkwrr
QaanoM0GKbIV5sJAbh+iepR1uIGCK4rHyspSgmWik5DaYrhxUw92Jk2ssJKBdFkWDc+YUinFqLU8
xpyT6ql1U3kdHh2lp0swFagiQcO5yfbuasB3789v795liu71Q30U9NrVm1WWIIJLYJYlHQY8qd5D
2Jq3NfMslywOfa/AXjoEohYT+HAyxNKS9oFTx/VrKkVmHH/GhpMj7tVo4ro3IH48P399u3t/vfvt
GcaJBqOvaCy6A2GlCSzTaQfBcxIedk7ay06n5rEi7q4pQGnmnTykpCsrzsreUtrN79Ge60zffi4N
I2dpIIGjqE7o/EuviiSQ3F2B9Aulb0ZtN6FxlBjvOR1mD0IrhHWoliV0L8uceUNbCVo+iSpEfarL
MusZmH/tPWZr0/McP//3yxfCf9QQp8oySE9/gQA7IBPIHeuUxqA/Y1dg6LQpYtz+QG0t6cWtqfQF
WEjKOsZ9/0eXoN3JBpdqE5pj6erCWJxTvgHN2ZqQpBVcBtYDVqDIkD5dMK64315bBRQQjTzQN1em
F3EgGAbdrUk+jxjtU628XsxltOHTyGQLxdysexiDx3IXgtZQ5Dpjkk6n8rS8BOqGdeXWVDFlx3Hq
yjv/qpHLdt6Y6MntszSEfXn98f7z9RvmDf7qL3msMKnh72ixcJvBpyD6gJ3vE0Sfsfq7N0MNprdr
Jt2In99e/uvHFd1ksUf8Ff5jO0F3wmSOzBjpX3+DAbx8Q/RzsJoZKsPnP399xnwWGj1+Hczw3tdl
j4mzWDhxNDZUf44AChNAzaCmRduP98tIEKCedIxmuDmE4SqRXgHD6hA/vv7x+vLDcUbXq7qItUMi
qQ44BYeq3v56ef/y+831pq6d2lcL7lx6zlZh944zSavSklWpp2+MjtAvXzqWf1dObYRn49RiDJGk
3f9S55V9Yd1DQG86F24ym5oVMctCYeaVNG0N4Qg67fmkz4Nj+bdXmOyf4zdMrhNX/AGkrcgx5iu3
ZFNTSza0ZgWqjqW0b6cZO1WphbZvzSd0vdOHPav+MAbNzKRTvQxXdpZRWvuF0DgPap0b0XUglimt
IHRocZGu742Bo4GgKwtnLnQ2pPhz3j6WyjIpWFoGXlfYd1bjIRxrZvoOtqtfO3wT1Zt6eyLhtWAl
9NJpsQOP0yD6cs4wXeIBOHGd2veKUhydOwPzu03tZPsdLM/TckpoP73SwRSs/RiV7FFG9BjOLZcY
9DjX7pJ6bSb2MkNUopli78rn+mBNt+0QlvVVK3K2J8Mp7S73nGCnns7SfUtQRvnktNN/ziLkuEQ/
qmSn5yqdkKMywSuEOvCyFmCTDGNmbT9mAD6Uh48OoHNxd2Ddxb8Dc6YIfhd2KG6Z9AYFB2acCXw3
fStPgvF0dvMf9ABb/htQW1FJvHoka3a7+/3W0ig6RLTcrSfV471saztOO/cY+hJD71/Qm1WXNaNP
evn++uX1my14ispNGNF5TTln7s6RqjhnGf6gj6cdUUJLoB6N0l6pGFZMWq2WDX36+yQZrQn3tZyB
scwSZGUZsNl1BLE8zHe0uIFXDzfwDZ3OsMeHhshjWeZol+DxhW6BwZEaFyee7mhblj4M35ypW19A
qmaqsRaXXFi6ZX/CBaiJhfpOfEksQpzksYwxrrPayXSqMadrTvpBaGTCDsDWrfh9A3X0bg2qmTz6
dsveQmOPxGjRL29fprxTiUKVUrVZqlbZZbG0Ez7Em+WmgbOck3piBLoyBERz/qRZkdXL9JBjGA7F
Gk6gCZS5Q9wnW4WjInWqq9Mk90LSNOi+aaKx1/Dh9qulWi8slzKQM1mpMGckxqGn3PE9BxGXObYV
VsVqv1ssGZngPlXZcr9YrJyea9iSTk/Vf+EaiDabeZrDKbq/p9JT9QS6b/uF7eOd8+1qsxw/QKyi
7c55qeLSKZzGJ4fugLdhiSPBJOrTnPpaFSeCZP6XihXOA5vLTng4v2HhQNtMtstos+hD2IUAVSef
nswMHHjE0hIbHbBL3/jdA+es2e7uNxP4fsWb7aSSNK7b3f5UCdVMSggBx+W1rWV43RwGdriPFhOG
YaATA8QUCztGgZ7be+l38ar/+vx2l/54e//553edYL+L8n//+fnHG7Z+9+3lx/PdV9jkL3/gf+1j
To2mDZJN/D/qpTiHZgV2diC879IJDivK9tenjrNzIfeg1vZ8G6F1YymbI/gU82qEdwv9kvMhswlG
EH+7Ay3q7j/ufj5/08/evk0DsXvewwNh94qnietAdimrCcBOqDDXsKXAXx9dhR5+jymkTfinFBwF
4tMYTiD4yVLU0S0SvjjH6D4YuDUNGiNr1fhWIstWf2AFaxnFb/FtIEcxdySIY6dMY/fmOZ5GyKPz
fVd4uq+1Zz6msLAzgjOQBKgm0/OhrMWjizsZ/TVEv5SUDHtI96Br2qRl+wWW9T//cff++Y/nf9zx
+FfYzFaKh0HXsWQiP0kDqyldQFGH0KGI+3ZhD+VU7nHd/UFqecPi+Ogwc54B0fCsPB7dxzMRqvDB
Y30Wdb5D3e/vN28WFCYowq9uD1BjEj6dDpci1X/PzVmrMNZdV/8/E3iWHuAfAmG8xd22EK6NknRW
Y0MjK2ss/Xtq3vC9erPyGsrqapbZadKV+NTKmFEysEdrN8xxFfVgkfPJVwYwy86M5NbUHhoUM9uj
XqEWPVgPLc0a+MihxFhD5CxEh5FGRxX5BXWGFGKAiKu0UcawU8so+dfL++9A/+NXlSR3Pz6/w2n+
7qVP6GCtOl39SXMuG5SXBwzwyirMypel3OJ/QxHihSkN5uLCLEUWQY+lTB3dVFeSgoYSbZf0Qc00
g2ZHXUWYRqXZkvYB0NiEvonL6QOKUeq1+kB88OSsPG9tA8F9GyRvnW3VwfSV5VF8gDP4pDJeU+u/
Q458xkhYIcRdtNqv735JXn4+X+HP3ykRm6RSoM2IqrhDwclfPTlCdK7uQf4xDuK7xOSo2o7mhtkx
jtlrcszef6jJI5eozVMN1icquglw7ASlfsCZdubAww+JwWEdzyHLtXjUeUFmXEYDF7LaOVAEDtkw
ZvS3oX1WqiDq0oQwaGgMJCw7gMJ1jmlrxDHgWQT9UyI4LhRvZeiuuT5080VvnTPdf4C3Fz2n+pXx
QOWXGxaHkItQkeWBUxWTvluTuRd7AXX75bc/USVU5uqDWfGmTpaz/o7s3ywyaIiYNMGxA+LwL3CW
Ay1xxUvH3VlkK3rccDwTNGusn6pTSVswxnZYzKr+tqf/Igak0xQnNDOwKzgKdw+KOlpFITfivlDG
uEyhEVdQgwQpFaWWOEVr4TJXxgVICHpyzRmnVrcGkbNPdvyKg3I0Xvi5i6IoaPmqcDWtAt5wedw2
R/KOwW4Q+E1Rp24m+MdATI5dTnJ6ALjMSjd/Zp2F/PWyKIigdyRiQh//1io4g4LjjlND2uKw25EZ
wK3C5tl1d5Mc1rSEP/Ac2SPNGg5FQ38MHlpVdXosC3o7YmUBRUUnL0ZrSqhgyKVsHDBn7hnuUFBv
A1hlxgtym7FT/hNOoUt6dr5rfToXeItY4DtYtKJkk1xukxyOAZ5l0cgATZY+nv27ZGIUJ5Ep1yGr
A7U1vcYHND21A5peYyPaHT7Rs1TKs+v3pnb7f91Y7xwObs5ofKZHFNG3ns4GOwp87mcQPfRIGnSc
oXFxQYbrWI3GrjAxkRQZ+UKBXapzDhsbypb03YGCBYKBDvP1YTJE/V7ruFfE8mbfxSd+Sp3LawNp
iwrfKSxA1mEqxNbnJdOaTC5Ckh+fzuxqW9UsVLpbbpqGRvkP3IiI5JAIXvh0i0BMwJH2MAR4YAun
TaiIL9dGzDrYOs1dP9J3NeOnyJmEs7/zMfJLHnJmVQ9Hun318LS80RC0worSWUZ51qzbgL8u4DaT
M6GNVddZdHK90Z+US3cRPKjdbhNBWToI40F92u3WE8siXXPpr30Y+/16dUOG65JK5PSCzp+k87QI
/o4WgQlJBMuKG80VrO4aGzmMAdFqv9qtdssbnBX+K6R3YFfLwHK6NGS8hVudLIsyp3d/4fY9BYVQ
/N9Yy261X7gcdvlwe4aLC4hMRxRoE1Ls6bHTguWD+zhMfSpviB0T1AkjOaaF69NzAj0bVhn5YZ8E
+hYl5DNsduWiUJhkyzFllzdF4WNWHlNHMD1mbNUEbv8fs6DuB3U2omhD6EcyAM/uyBlvAXJHvXrk
7B6YdHtmAeXwkePVViggS+Y314yMnbHL7WJ9Y1NIgWcnRySzgKlgF632gegoRNUlvZPkLtrub3UC
FhBT5EaSGC0jSZRiOWgJjilfoXzyD21ESWEnkrQRZQaHYfjjvu4ZsPwAHL3x+K0jm0qBx7qm6v1y
sYpulXI2FfzcB15dAlS0vzHRKlfO2hBVykOvOCHtPooCBxxErm8xW1Vy2K6ioa0eqtbyxBlenWv7
4M2pOxcuq6mqp1wwWjDi8gj473AMECoC4iQ93+jEU1FWyg3Xj6+8bbJjTl4+WGVrcTrXDq81kBul
3BKYWxm0DIyIVIHIzNqzIE7rvLiCAn628pQGfGYRe8GUdWlNBc5b1V7TT14UvYG0101owQ0Eq1vm
AOPoYFfeuT6wJg2zzo4my+Bbh2iSOA7cy6ZVFY5sVwf/FbNRCwJdtXt6mLYhnZ5CwT9VFojiryoa
rrwC2mB5en17//Xt5evz3VkdhutWpHp+/tpFVCGmjy1jXz//8f78c3onfPX4Vx/U1V5jyoyH5KPh
MTfyhcK53ljwcyYoBLCbkALkVprbcYQ2yrIlEdj+5E2gvNcsfZRUqRcPgt4W9PzJVOVukCpR6Xj0
oZACNLzgN7VVfAItmRue5eAGXYBC2pf8NsJ2krbhdYD+01Nsi3obpS2iotCmDON7pEP/7q4vGL33
yzTS8e8YIvj2/Hz3/ntPRTxLcg1dsuQNGnFpbnD+mNbq3AbC8GHXrMOXEPpWRKW04NE3SUQg3ajm
qjjgjugcBy55W3mOl52XzR9/vge9O9KiOrt5DRDQZoLcyAaZJJgNKHNcnQ0GA2jRhfe7CzYpsB4c
X3eDyVkt06bD6O6e355/fsN3P4br6Devt62+MDSewiQcQyLPTRCr4DQNqnzzIVos1/M0Tx/utzuX
5GP5RDQtLsSwxcW8IGVNQyjQ0RR4EE+HkkkrvKyHANusNpvlIoTZ7YKY/ditEVM/HKhWHutosaEa
QcQ9jVhG24V9dz+g4i5yXW53G2ItDXTZA92ZY5WWRN8RrBeam49ywNecbdfRdq5FINmtI+qTmfVI
ILJ8t1quiO4gYkUhgPncrzbU18+5InueVzJaUoeAgaIQV+dFwAGBSQbQxERX3B2M5mo+llmcpOrU
Zawneq3q8squ7IloHSrHKaTK5G7ekwGTPirPtWMyJGAKa6KxOl+2dXnmJ4AQTdbXbL1YLQhMU9Od
5KyCsw016QeeU2ukftCPvfnbXTOPkV7/BFa0JEAty9x0BiPm8BRKF9xToEkD/g0ofiMdHEpY5b9g
PUcHRznaw3Kk5U+VG+IyonSitP5BBaIZkaEwDyTBsHojULcKmFms1vQKSGmBO5Il+KLAv9HqJdf/
D45dCWmSpXll4bSZCd2XmQZgGW3295SOZ/D8iVXM/6T4uXzXXReDf4J1DkR6Tv3KL6ppGma5YRmw
5rge6bg6yM6MaDw4kOpLLzYx7xOVls4Q6BxHztIxEKwXr/p5IGGUTZVWoK7eojqxAhTAQPq4kezh
AD9uEVXiyBS5ZTois25A44RTxtoNqNCDxpVjdI3gh0FH4amCtttV+W67aNqyCGWuQzIW30frxudU
BtpNqIvBwxJyRN2zabOHnEXke96dxrNqFv2ztT53BHF4v92v0EJT26EHHZpHq/vdqq2ucijvtZ3n
ILVnGodN5CVuQ6hWFw5CVDppzxQVC17GbgoGC3tJD5LOmtR/r4yp9lAHcrj3RKkOYq0F7XAwKH+g
Jxcd5RxhU3/cz+D1e4WgyMzV8ST0uW+GgufRgjLTGiw6zmX4NO84nf7SrtR2s4x244yGJ66plrCS
KzhqTneIEed0LQHayaQ5VGdz5PHWQsWyHDNjDstvMqCKJ7vNPe0E0FFc826lBRtHEt29af3yYbfY
YAe8/UwtS1nWTD6hFzqu3RnqmO0Xm+UNJoFE25UhmvbrCgpuhHxmboXHTbZaU+qcwYO2t9zumb83
ec5WCzvNhQOm+FMaC9jmMZq3YnFgcrpgVMk7DtQyKdnMqOVliQzULODJUVajt5sBPWnIENz3BOGt
oh9QqeY4m6pRn4yC0yTzdO1F12mQCfKzLoQABvI+cFsEyGRBWzcMMqL9YzokzbsMckUbPDskpfkY
1GbtjSjZbHpDwOnzz6/mocH/LO/8aAi8uB2LEvHRHoX+2aa7xXrpA+FvN5LagHm9W/J7+ykIA6+Y
dI4RHZSjSu5Ds/Tg6P8GKtnVB3X+igQxgDBS1bkZMUUkRyRt/DUU1cEjcNDmHG23ePY+2pHlwg0L
7CFtoTabHQHP1gRQ5Odo8RDZ637AJflu4S27zq2Wmv8xgIuwaRkT3++ff37+gkbrSThtXTvc7RLK
P7wHmVW7dzkmflGDiUKZTvOJSSC6t2BMKM/zz5fP36YJVzqV0Hr10kXslpuFP90dGJQVOH5xEO2x
zqXqPR1DFHDC821EtN1sFgwfOE29cCWLKEFj9gON48YVnEY66bBshGhcnm3jclGAGkg5KdpUhdT3
5VZaexvbv5s6QyKaWhSxazxyusEKzAQoAxkZbVKmn2xuL/4FPkGqU2242SDcicU34MJ4aSc9cwpe
nYduXFToS8t6udtR0tomyiqlXIY2fKE0niDKxI73MQH7rz9+RXpoQO8EfdlEBJ90NeBHzNKaOoN3
FK4EtIDWYvRr/UhGuHdIlSbOk4cOOLjC0Y6RTufJgIOlFOdFU02+m+LRNlX3TUPM1YDzT/o+YSc+
PtbsOL8UO0IkmvTEwuFhTe+AyQ6yiQ7sHEt8uD2KNsvFwqPsrlgrZVqbzoxL0H+3mb5LPu0zCEFg
CKav0aQJWYXlI6ATBbNWBb1vbKq0SDLRzH9cjv4NOodSekw5yAI56S+yuE/RajNdBpWMnUBIV3j4
1fBaZr21xu9vYUJQ41Bc02DprQPPOBTtkdw0Rfmp9FzwMC1LqBqdOwj2UkHZfE6XPv3SZKPo97vO
FuuBBvCatKgtSTTCWh0R+mF47END3QS9WTWzuqrKubnp4okmuzgFDR1NR3Fmd1lDdeY499UkA8cU
C8ae7pyqRhw+DxiwRGkq4ytgrpQTRvo+azrlRJYbkArkGNXYK8McvyWd3R27hyYE763207V75vJ/
GbuS5rhxJf1XfHszEdPT3JfDO7BAVhVbZBVNsBb5UqGWNa8VY1kOL2/sfz9ILCSWBNUHy1J+SexL
JpCZwG/jhwG8eLBx01+qs7E0w1MZDf6Uy/nOfJXnPOqRHHncfGvUgKskpzdn+s8ozbS0pFi/1GBA
7eVYr+7IviF386vXapAR9m/oLUJL7UAngmocXUpGOIDlR2rYCaHGw5aX9tDoh2Y6ejidj8a1D4AH
SkxuZedgFEIljM9QAg+Mew45CUjI4N87Hq+YTqoKSKc4/jBEiVt0hZh6/NR0RD4bppvjdPfW1cMS
WNGR6JfhAMORLTQnOvFXMuYgfOLGlW2a7n23qTKD6zRv4yMTrHe4rxXA/OaHNaZpfxoR+YaW5ysC
rzwbl8WM2POraRH258en789fPj39ZJWD0pK/nr+gETBgGI0bobKxRLuuOXiMqWUOnPUNBvzRD4V3
E0niIDMWFgkNpCrTBD8sMHl+rmQwtAfYxpzGgbNF7diHEfn7JDM/UqC+u5Khq9Hhs9rGei4ymiKo
cWaZxA2KUaKq2x2Nd6wUkVVbH36zDgsx75aOlfE537GUGf2v12/fV0N0isTbMNUFh5mYxXYxGPEa
W5x9naeZxchpN5oUZkgiiYG7o6f7wKGxH5yPWkeV10E8moaA+slOa2jbq+esFVZEbsSOnW1wlNu8
sxF+sjqypWlapnZWjJzF6LWCAMvsajamsJM0CWyZVJYePBwD2omU9O1sDwKr069v359e3v0JAREF
/7v/eGGj4dOvd08vfz59BJu83yXXb0ybemRj9z/thYHA48r2dDdmD213Bx58xw57ZMG0q9A4mxbb
rOe9eBg21T0T/lprauspmKFwAG365uzrT2kIYvDzpVA8YyMiZaMhM4DzrunZ2mAW9ihsJQwam7pI
yApAxrv4audP235CQ2sBOBulyrcZ2eb1mUnzDPpdTPkHaViJjpIlkqNGnKojZbLkrFwfv/8lFjSZ
ojaG7AGCro4avqUtunJ6FzBjSE+njdM29jiyBhzE0fL6Qy0ssJ6+weKTGfStfy5trMc7g8c8GEW+
ZKFFaLvoZF278tj80sHjg7S3m3VWOIwyi71gGt49fnp9/F97k5AGj9IyGMzivI/faJaPDx8/8rdq
2ZjjqX77bz1egZvZrAvZW7KKYiuBG39QQw+23h563dJO44d9eXs6EOtBc0iJ/YZnIQBNT4A+lnnj
bSnLVdE4j7DlY2aAK8ZST3xGPKFeFM4vx9aS7skQxTQoTDHXRl0EntjuGoR+DVM9iOBMn/otQhYX
ly6dXydiFT6SpvM8eqBY1AK+UmumMI3j/bltLm4NuvvDVRkC2c3BvoJ3PbvaxSyj6rkwTAEx7Anm
IlSHw/HQVXdII5Kmrka2kt+56dXNgSmQhj6loKbv24luTuMOazjhQw35rbQL09fxEv0Bh8Ujx5C0
u+bS8oxXkqanw9jSxtOyU7uTybv9cST7Q7WrRmR4gsJUuakRmuRdmHqAwgeUEdKo709sO9yMIraA
mvVs+zYOriWBv4YLUVnlWzppGCmO49ayT+IigBlCWKXSju9Nk3exlCDf03uqh5DnNPWUgknl9pzB
Vclv8jXMl4cvX5iUxuUvZzfn3+XJ9SrCd+v3X8N864f0uED7episMjgPHwgTlks1bJzU4arFl/Z2
gv+CMMBrjshBAh6RFtx3l9rJvEWFfQ5xj8yztlSK1t0UGc2vNrU5fAij3KLSqq/SOmIj7Lg52Zh1
pC+JRztleFhbX1SEtc+1SFPr21mWs/rmtiV7/cR2ZTyILZ5ttL9JFG40V0ZMGCQ3cBVKisZpWMAg
CMYtxF8x1JlYAt4BkIdFYbeJaHLDq0B05lTk/sxwvU5BcRjajXdpDxCvy8nmQsOMJAUq0K223qxP
cerTzy9MTnJb1bGT16nmzZtEDoNTxt3lZonS7hIR2IMYqJHdCpKKZMyPTkyNQ6fDF74CcJY8QD4F
2yXsuIfD09CSqAgDI7yb255i3dvWbjtb65rwVfAPmU2dB2mERylXDGGxzsDqGfYX7NkesSZywyer
Zf+oDh9u09RZHSQ1RJO3G+IyiR1ikcf2tAFimqVOr5s7qyBS01ROdA6X4FYmGBjR+2FuaBcUK8sB
5yhDTIgV+Pv+WmRW+Rc7ejOxE9mECeqVKSYxtxazZ3xflGVirJbuKJofrXlrdHmPpsTImIqr3UNz
9HKn7Rd51N98PZPqjt41jj8fJRZkZx63jYD0iNjCfq8mcRQ6e9Kxrs5t1xmBfZEWsRtktxubXYWf
gIgaHMndSbt7voRKigl/+79nqd33D9++G6vmJVTvPIJXjL6DLkhNo6SIcCS89Bhgn+YsCN3hBxFI
IfXC008P/34yy81PIG4Q7Ki3shIIxe+fZhyqFaRG6TWg8ALgMlmbb/EYHGGMFod/jE9ggyeK3yh0
4S20OZNNCJtLJkfsSzW+ET38nAkWviyZfvtGlnkR4FnmRYgDRRMkvvyKJszXRpYcQZpaBveft+qM
mVcJbGyo6a2gkVeOIzQmU5S2Efh1qowHXjSObiJRqW9vOthPGbiqecom08X1f41PCMhv1EEw6dfF
kmls4D4OwoZr+qjkNrHFmOAs3myaQW/e9DQM3b1deUEVmp5R+boSHPj8EtbNMGdPuEOV5PAnwV+U
cmAJbqqJLW33s7/G0hpwObiDUcakpSDTXsRQn1RkKsokrfRGUhi5REGIeVUqBpgqmTaHdHoRYEmK
yfVGkvpar+h0Q91aAdGIPgiRjjh5JYfN+yi/6p54FmDf3trwvsYkY5urnm4nNihYt0kfarueQnR0
m64qQ9M0UyFMlg9zPLSOxRJhLc+xyBNeRTWoGkBIHoqFpVOUQex2BkioTIv+ZdPNJWhJhveVC3RT
nKWGGa+Wc5ikeb5SOGHheJS8mX4ZaZS/LNzys55LwhSZOxwoAxyI0hwrK0B5jM0djSOF7JwCAlCU
gQvQfhMnaG7SDQZrGdX9u+q0a8SSnoTusFP2Wu5AHac0iJHuHie2bKRYaU6EhkGA7UxzFYVqhtS9
Lssy1cw8+DNJ1p+3c2ucBQmivPHZIxFJDiL0PHJzNb+qU+dJiHkQGAyGqLEgfRigDtUmR+r/GHMj
Nzk0B28DiEMcCPMcBUomAuLlmFj91p8mEjzrFWUcWYTlzIDcn3OerufMJJ3VN5EoybMIa4pre9tW
BzC0Y7pF5zLcFRA2FyvXXRgAtFqubdWH6d67K8+l6GuIvDfu7tEGAOde2qOPR8z1g3A/6MfcNnzt
0+k6IA1D2I+qHW9EWBRYKLd+kw1jQzSLAowcoh1QN13H1q0eQYTPWFUTF2vTO9ZoG6zCcKQYpFgM
XJ2jiLY7N9ltnsZ5SrFkd3St/ZXbqCisWyZK9p77vTn9Lg0Lj5H4zBEFtEcLx2Qs7ABfwyP0O2G9
4HnvSzLt230Wejyr5v7Y9JUnoJnGMjS4sb/q0zRABg7c0OMjDc6DXeofJEHWFzYDxzDCBmbXHhom
Z2DNM19YrZRa7Jcpki4HkAJKwPZjN2A0ap7GwcQQZC4BEIV4WZIoQocAhxJMDDE4MqzlOICUA0Sr
LMjQ/YxjIebRa3BkBZ5siTQoo8dhHqPLHzztlq3uvZwjRrZPDiRoo3EIdQE3OMrc8zEr7moP92SI
A2y17Lvr2OxgyrrYRDJdLpp7qc9itOP7HDvG0WC0/xgdv4TRGPAD84WhWB3dTM/FM0bD92gwNtf6
Ehu4TMpBqTFKTaM4wUvEoGRtbAkOZEIOpMhjbE4BkETouDlMRBwlttT3PPHMSiY2g9a6FzjyHCkZ
A5hijo76w0D6/Lq2hPP7nVIbt4Npszrz4WSQSyN82G2a7jZsPZG0lx3mRrbbAXdGlDwHOpzGWzvQ
Ad3m2zFOowg3H9V4iiBb0wXacaApPC/q7lm0ywomK2ADLUqDLEOX2ajMUc1CQksYhPVlPC6wzUGu
1ugQF2tx8Mb6GQX+1Zdh6XpzivVwdXIDS5IkyHwBXT0r0MYZrg3badaWGqYUJ0ESIWsBQ9I4y5Fd
4UTqMsDkFAAiDLjWQxNimXzoMo/QDuEZtmiYVMVB9xPWl4yMbRuMHP9EySTE8pcWyqvdVvcN23Sx
AwXF0TCpOAmQNZUBUegBMjhRRMvUU5Lk/fpYUkwl7m+uM21iTJag00RzTLZiKkqWIS3OJP4wKurC
p/rT3LpAdlQ/khVYn7WHCkwFUbp+s6jR4yhCm24iaNSnGd73JEUG7tQPIb4TcGRte+EMiAjH6Oiy
CHSsERg9DVFxAOL+kuFka+AuV1ZklZvweQqjEMnwPBURdmRyKeI8j3dYSQAqwjUVGzjKsMZTLSMf
gNabI2trJWPo2Go6odubADOPs5/GlUX5fk2HFizNfovmwq8qnEM2yyHBnSzgBPXmUcl0F4R6OAwu
Epkx0SQJQpra0YUsDjpVU0vNuCsKa/pm3DUHiLcg75XgsKK6v/V0eWZSMR+3bgKXseXht27T2Jph
9hRH3QjXgd0RnotthtulpbiMg32xhfMZ7tC/UkP9AwisAUFQzReZME558dgxDdgWK5zv/EVBWdF6
Inyb6rDjP9yGdeqC4FYN9AqzZUOxrpYWHvGpPA+fKR7boFKYaWPJa09Ng8/ECxaTg8kyt+EOrvL6
YR7Yi/8FNx+BwEL1xNb7I91aHqAmwzIxltnHOOIkuPpLIBnczPnkVLWGZ2BezE8y9xP+trLeULex
GjrdqGS1TGatBrI3prrxhLbz6dKXLW+Pte5ecUKmEFvvSGm7MSIp0I3xB1jY8GeGNdZlcVtwTwbC
k9i6BNuQvkKyBrJ2NQNMImd45xbJ3eBAa79w0CMe3IFzyELiYc51Dnho4Eb6g1MKrZor2dhh1hf/
1P/58fkRnElUuB1n6Pbb2poPQMFurzmdxjl6VaFAXWKHsFhu6GPOWU1RkQfOS7Ac40EMIWCDxyF9
5tl3xHwhBSAerjNA9W0OK9NDq0A8iB1Gk7fWGt22DVxoLu9iiW8UkpPRW8wZLfCP0AOwBTW8Onn7
w9KKPgc1o7olCqQkbxCs2/oZ8ZVarOFL78+02Ek+TK3xsKumBvyi+IWB1bIkjA2rAo2IlbEfoizC
AywCvG8zJjLzyiP1YJrdbahoSzQtC2gsH8PGFFISC+z7UzXeLX6OM0c3EDCjX5IBArWDcqqNh/fF
5jpd8LXEYiT7qWaLM7amWJz9uNWdJ5dim+GBTLrwyvCBA0ExaRvr0IeeV8yCePhok8ate0l/rI0g
tgyY7XuNfuQGFagh64KmZkKzEY81c4Xxg73SiYinHjvohQE9zl7gInPGp4ykuvZZkcROIYsyyJG0
ijLCDxxmvMQOGxa0cBKdsjjz1oqBpdtWzWEbhZveE/aZcYzNdPKCA9mmbJnAmkTaKyvfZz1F2wiX
E5VNhZk5SacUPdfl6F0RFGZzj4d0ykKnZWhDfI/Hc7hN8uyKbKa0T3XtfSbZEZuBfndfsOFoLOPV
5prKJvDlLAO1i8h1U//8+PX16dPT4/evr5+fH7+9EzborXqSwX3AgDPMq6mKYvT3EzIKI3xzjGox
ebLq4zhlEjIlVW2tFLaxvqAVeVE4qXT9yWxI24ESLHbCIDXeFBI29h4rDAGi3hU8T2mfb48FQffu
xspwyK2A5YOgkVPz6k9LBr8ZmhmKDDc+mxlK9DxXgy0JQFFdeYYhbNWNNXtHFbYXE+UUVp1873wy
DnjVbm1wX7owymNkBej6OHUn+0TitCi93SmcJYw6WX5jPOnZ59IWTsf2w/FQeUO68QL3Be5iIUHD
w2KhYcIMIGngCxUvGJRvhr5+Hfe98MLxysGKxTQXMz+2ERno1iYKx2az3KQu8YjCKp7uHMxCD/Ti
U1bmj9WFjW6qrEJZK9NhB9i2VwjzeOwmMFhAGCBq2EmEgKMnI4bUwgMHJ/zcZOHSGn3hY0LGzjcf
DS4QRbCdeWECHazIDDXABEFBW0+hTmPdIlNDhAKGQnKId/UxXMPZUACjbZRFKYJYwblWtVpsNSzR
7xHnMoRHKXloEkLBWU3BVmYsJMY7hWGRZ5uxmDAVWhux1SGN09TT9RwtUGuAhcn201mQlnZlHOBC
o8GVRXmIR89f2NganKHapcbi+q9rINv68xCvJ8c8cas1piJHX6IxWfQt10T0pd9CzP3YBAt8T9aY
xEb0N7iyHLNTXXgwDcVE0+LNFIosKbGKcsh8AsoEywA3XLG40rc6inOhtjMWj6mRGCBXqN5KgWtX
3vrkYKbxdhJFlHmSECaLb1WWcRXobarOM4RMhEQXmX5IkzDztMNQFClmCWayZOiI74f3eRn5upsp
d2+sTNI7yft5ur4wu+rjgrmOtC4Lqdieh+5aw/b0obHsAjT0zNZLVKm1eIoAmyQcKvF8dTfJhSyU
SrQsUrl8YwQJTfYNJqUtrtaLdjt4qRUt/SLRYamzxINsXcJgPEWUXL0JFFGOm8kuXGA0ErJRtZqP
ptahWARmYWghhKKG+l7aTDk6ZTQNEMfCOPJioAKiowDz6sbZuL61Xnr70TRNtLWDLi6Qe92MMzH9
Asud2E9aQNgtw+K/a0fP0+dEvduD+81zHGLnYqsBkYcwS22BcjhO4AiuR5aFd1U5Nppq1UwH6fWI
hoQWPBJ3P5YAUywgBMzK95t6PPOQlLTpGjKpE5r+6ePzg9Jxvv/6ors/y+JVPVwnLCUw0OpQdUem
O599DBDCemIKjZ9jrMCz3QPSevRBKrSMD+felHrDzfFVnCprTfH4+hV53PTc1g1/cdnp1CP3OjFi
OdfnzXIEYWRqJM4zPT9/fHpNuufPP36qp2ftXM9Jp03qhWaeiGh06OyGdfZghNgWDFV9dq/oDA6h
ovbtgb/pe9g11M5kOh306vI8+6aPwOvWaCKObLuK7uEZ2Bthv2kn/QK9HMB718xhc9pCACGEWvds
SOz0hsUa0OjOORqq07x2D0LHYX3mpMDTr5//9fz94dO76aylvFgRsDHQ9xVm2QSQeMZc562urG+q
AZ58/meYmQnV94eKX6FAp2ALEWfisW1pw+PkMU2HgvfDzszl1DWaW7OsJlIRfWmwz2enCa6qm2YY
9eeu5ZRkyDLj9G54+PL9hzGxrHFJj90xu6Jng3LQXZhmYZwuKXqGyy8LnLmGTEapfn/4/PDp9V/Q
AJ6J354nI7K7ounPqLRHMnXOXOFcVUcr+/PtBk1131zbUy8jxLm1lfBxxG1aBFN/3djFqKc45I6c
3tr//tevP78+fzQbwcqdXENMplZgFDNtwDj/E1uEeOkBtTuYP03BgtJZrSTAG3Clk8nVowILeDMV
djAoc+xVVR6ib0tpeJZYW+Yya8CkQj5wr80TmG/VOQ/D4NZam4MgY7TbkdYmfXOqd81kCTgLsIwf
ndkYORpQndFm0DgGMKXxrDCbiETSGGKwI+9iuHejAeahY7JIZCcBbq0BdqvPP5lCm3+Y0Ks0eECF
WqKZWGUBMGn742C86MiXZwhfZzZ3XW/Gtt5ZCdK+heA87shth1PM+uGIqhJc4JlX+18mfWqqNNdd
1KV81Ca5fl8sQgdzGsIZakYDi5xkASoJnbYkkTkJsz2q5b8ZQvxSaNShQibIplAeZHs7yanZsvU5
sttA3LNoVyxyp+7BCVy+V6Wm4+Prywsc0/N9yidDweKU6De0cnc42/uYkjQia8YtdEQc43Qm/RwH
e/3nCAgtIGW0OzS9nps4+j6k6Ecgqbz45qZdS75+JZm9J0jy7axJbLQH14HqwDq71jenha4H6WFN
sYwuYR1GkUW82jY3QlAjF8VhBaM0yDdC22i8rqGT07PCadqmQohhi2RHZdSpMmdDaNXhadh5kPOk
uTxDM83y8dxKZsFm8Zk/0dJZBr5iwTQbGrNFZMoS0h9i1+rJ7xSuPllaKmq4fusOHQxTj6mJhtjB
ys4VKSRXW6PSgygK0sPnx+dPnx6+/kJs/YRsME0VN0QStrUjDxYop/LDj++vv33jV/5PH9/9+evd
PypGEQQ35X84MtsoFSRhO/vj4/MrU/oeXyHw2X+9+/L19fHp27fXr994LOyX559G6dTywG+LHf2n
rvIkdnQyRi6LJHAnAAPCskSv9SVDU2VJmDraHKfr9opysNAhTvRDNDkhaBzrHhuKmsZJ6kweRu3i
qHJy7M5xFFQtiWLDNV+gJ1aROMG2NIFf+sLwSFyouneu1FSHKKf9cHVzocfDPZPZtjeGosPt7/Ul
7/axpjMjonRUVZbaoqPMxPhyUdX11GzFGsIW2A0qyDFGToqrO1YAyAL8vYqFo1jpBCbthk5rM2Ka
ubkxcoZdYgj0jgahHuxHjr6uyFgZMwfg+0notIAgOyssv5Ji0wjR6CQCB2Nrmt15SEP0Xl/DU2eW
MHIe6DcdSk+MiiBxqaURBkmjZkjBGd1z5arG/PX/KXuy5caRHH/FMQ8TM7Ex0TzEayPqIcVDYomX
mZRE1wvD0+Xudmxd4XLvTO3XL5AkpTyQcs2Dq2wAeSMBZBIJ+J5nP+OCgZV4In6mxHDI0o8Kx+us
J2Y4MjSbODxtlFCsGgtLrTx9uVG3HDdZAqtuwRK/k4FcZLwhjxDsb3y6Pp/0UFzxiR8nxnmXHeKY
4Lk9jz2HmJHL6KUZef4McuV/nz4/fXm9w3QpxtQcuyzcOL5rCNEZsbyBV9ox67wqp19mEjBnv72A
NEPXk7VZQmxFgbenlfHtyma3vKy/e/3zC+hYbWBoQOCLX3d5wr1632n0s4Z//v7rE6jgL09fMfXQ
06dvUn36ztjzyCefGy6MH3hRYkgO4n4TDBE4cZXZ8qhxtT/sXZn78vj56eURmv0CSsJM57uwDBwr
GrxVrvRG92UQGNZzWcM0EfdRAk59Er2ig5iqLNpQ0ISwJwDu327CD4wd1p68cGNIQ4QGiTkKhJNe
HRKa2P0Ajza3JGB7CkIyup2ENgwIATXUTXvCAB5U14PwhgASaGJ2gjAhBxR5lsfvFwLa5+OCJmc9
CiOy61F0c3Zi1OJGZUm4MfYOQgOCd9qT68fkl/FFRfEw9AxOrIekdmS/YQlsGsIIdl3iOg8QHf0B
8YIfHPXt+BXhWj5QXihODukwIOF9j6z6RAeBXiRO7/hOl/rGIjZt2zjujNInIKhb8yq4z1ham9Z8
/z7YNK4h6IJDyAzNIqCElgT4Jk93dj4EgmDLCqJkXbKOjoA2E+RDnB9oE5kWq0LiVgCjHgqvSjuI
b5hB7BD55jEiOyeRa1hoCA0NeQrQ2ImmU1rLHzqUToleFZ8ev/9hVQgZOsUYpju6+obGKqLz2SaU
lZJa96x3u9JUlKuO1XHqQXn95jZP5p/fX79+fv6/J7x9ForZOFgLeswt1smPD2UcnkpFhvjPFmzs
ySrZQEbjrXoj14pN4jiyIMUtoq2kQFpK1oPnjJYOIS60jETgfCvOC0MrzvUtHb0fXCUfiowbU89R
XJkVXICuMRbcxoqrxwoKqjHvTHxkdy5YyNLNhseObTLQKpSjZ5hLrj1SkfBF6tCy2SDybIMQWPKu
3+yHRw8h3yieR2rtYJRZcHUc9zyEoqaDwdzokSWKblQ3oOcGFp4th8RVk3PI2B4k5JtLNla+4/aF
rY772s1cmDjytsAg3MIYN7K8pMSMLH++P4nLxOLl65dXKPJ9TTUn/Oe/v8LB9fHl493fvj++gnH+
/Pr097vfJNKlG+IryrB14kS6tFiAS3AdBXhyEuff6qcZAdS/pwEwdF2CNJxNEwmIG0SOxyJgcZxx
3xXbgRrUryKb3n/dvT69wAHrFXOsW4eX9eNBbXGVkamXaZ/7kGFUX1/RmyaONxG1ilesv14bAOgf
/GemPR29jfEdUgA9X5uNwXeVd2AI/FDB8vh0soErnjqniIEGe3fjEcvrxbHJCA7FCF6SkGtOsYxj
LEDsyNdy66o4Thzqsy/UXUjJL8Secu6OiV7VssMz1+j5jJrnXpvmuaHRaP/IcCdY2p9rColVdCO1
+nlp9X0CDKcz/8BBS2l0sBuMoWCqLaY3Pc+i0P8Xdhzu/vYzG4V3MT4E+WHARp33YChedGtKAGsw
rGA50rlz2aXaXqzg1Bm71Og2xho144BMatuhgy+/bF93hx9obJOVW5zlekuDUwMcIZiEdupSATQx
WXEeTKxWwIrE0TkzT0lR7Mv22DzzmQeKq9cZD6AbV/eR64fKi31HX6YZbFsmISC1Hn/IXNCD6AHV
ZrIUTBc5bWU43LuxzunzrMixrCSob0gcEEPR5SvTwKHN5uvL6x93DA5Hz78+fvnl8PXl6fHL3XDd
AL+kQntkw8naM+Anz3G0fdn2gYh5pU0Ygl3rhG1TOLDoQrHaZYPvy/4EEjQgoSHTwbAQ+mbFHeZo
Upkd40AOxXGFTfM3ZmUwC+a0oXKGXtpwL+Kl5NnPy5dEX1XYFrGjKwch1jyHr6wkmlA16l//o3aH
FB95Gc4uQm9vfNM7bfXIk+q++/rl04/FCPulqyq1Aby0JJQMjA4ksWPqkwtSfTQ8H1LzdPV5XE+v
d7/B+V6YFbqLIwhNPxkf3lvWqmq2e09nJ4QlBqzzXAKmsQ2+BFPSKV2A+sLOQE2K4ZHW13dPtePx
rqLfoF3w5NtVUeWwBVPRNwVrGAaa7VmOcNoOThqv4enCMyQzymD1PfHsqtQfuU97wolSPG0Hj3q8
LErn1ezVNC/i7DZzfT//t7wJHM9z/y57vBqf7Vdx7iSJoV47j74mspwWRDeGr18/fceM08BqT5++
frv78vQvZRup7Has64dJDyKreCGYLgeikt3L47c/MGwA4dzIdpSb7hwzZDdILnanHZtYL39smgHC
e3fXHYXnroTi53LA9Mat5EKQyenu4Q/xPQOsq1IhmbIOJOEocmYoLtUCJ7Jg8Lwq0DNDre1Qc1zo
Tn0TfC0F9dZ8mIa2a6t29zD1eUE/fMAihfAjvxVEDamqlmUTHCazqSj7+swUR8V5KGmeqrBh0GYB
AMLdqWO7fOratlLpTz2rr+PSylHwXV5PIi7WjPuhz5ENh+X4Hl1xKKyc5Af/5rC6F4sDXVeWD4l3
IC9tX8SwHHrepXsw06iP7ysBLys33KjDQngzduIaLZHTrhrIwMjBaevbbLn0tXQPqnT20NZ5xsgt
J5eSe9KzLBcpXZSKZqh4vt4NdERCJGN1BnvJMjFNezzl7ChXvYCmKt+x9GFKh/HGc5qVePaCD0jw
GkfxnW82MhPUNdU/lQbEwV7llhWPKcKqcrcfVHSZyPGAV8hUtH2aYyS+bf7uL3/R+AgJUtYNxz6f
8r4nw0dfCJeJN1uddqeLv/7Hl8+/PAPsLnv655+///785XeDebHE2WjNpLG6/yoEcwBGs0/8DIIe
Hfxmqnb7Pk8Hxb3QJIXtmB6mjP1Eq7tjSjW6ClWqmao9A5OdQCsMPUvn9Ol24Sm1ddpWrDlM+YmR
ueg06v7YDGUNS658vCDWRV2v7uXrb89wqtj9+fzx6eNd++31GZTuI7rDSur7wlVivrCd9ji8w1sK
h+SXOaCoeDd25F3eZO/AiDEo9znrh23OBqE1+xOrkMyk6/o8r7vh0i4YcwYN6tI+vz+i0+H2yB/O
rBzexVT/OGgxeQgGAeJ4VSIPHXuhwt65xIzemjlF+oNyUDfoCVSJBqnPu2KkYKBNUzkWkdA2NQvU
d8ILNKSvEmakHzqOzqAgoo3ks7JM1e2Eesd2SqxzIaBTBueC87TP6pLAVKdMG+39WKmAbZvu9Rkp
+0GkBD+q8I41+SW0afb8/dunxx933eOXp0/fVX4VhGBmQVV5z2EZq5yoCYZ45NMHxwHuqoMumJrB
D4IkpEi3bT7tS3zh70VJZqMYTq7jno8gt6tQX6KZCifEMuEzwfL9jSycV2XGpkPmB4NLxhu7khZ5
OZYNpqtyp7L2tkz2X1PIHjDkbvEAhz5vk5VeyHwno5svq3LID/hfEscu7WgnUTdNW4E92jlR8iG1
nEAu1O+zcqoG6ESdO4HlVuxCfCibXVbyDuMyHzIniTI1/ao03TnLsM/VcIBq9767Cc83q5YKQDf2
mRt7CV11054YUgqmIV+hXWnbCsTKOFVphr82R1iallqOti85pircT+2A8QETRlLxDH9gaQcviKMp
8NW431dK+JfxtinT6XQaXadw/E3j0M4210I9490WdPUDxv5tj7A7U5DB9Dt4udRDhu/M+jqM3IT2
fyGp0b3u5uT1bbNtp34LzJH5huRbdg2r+RH4mIeZG2a367vS5v6ekdtCIgn9987o+G81m8cxc8AO
5ZvAywsydwZdjDHbkPLy0E4b/3wqXDpyu0QLZ75uqu6BJXqXj85b07/Qc8ePTlF2/nn6jT+4Vf7W
8MoB1qwEm3qIItU3x0Z0W5gJ926Wjhtvww4dtWBDf6weFvkdTef7ccfoZk8lB53ejsh5iZeQn5ou
xLBNwX7ZTWPXOUGQepHiQqgpIEWnze++fhBaYsUoOux6pbJ9ef74+5OmztKs4eK8r4w83cME4oUD
HgvlVJziBL2IRwA1IvWpPh2oiCaMYkC9sZnNAzgb7csO02Nk3YjxauGcvY0D5+RPxVltrjlX11sJ
FQOny25o/E3o6AuHh7up43Go3XOqSNK7TZykS+SiMlYyD86IMnG8Ua8TwZ5P+8nPeNS8ywpZqYZ9
2WB29zT0YQpdUJp20pbvyy1bvNPJp24EWaQORsPGGhZEdNFtXMcA8yYMYDHi0CzQZa7HHTfQJ2gO
zABbkjVj6JPp4XSyKB41y/WCzbSNilcN6JodyBk4NMS0Pp4xrj5WgtTKr1cjVL3DmsET22/NQI4E
XenxpReWiownBpo4MPey3Ew+NOxUntQZWIBSqHt5Qvu02x313tQjL7ZWzkvLvgfT9j6v6bC1wsje
tqNwRLPd0Ym7Ee0OLiuMbdW7ZDi75cSgU59KuyXI2YntbKfdfJyDlmDAGDjncUq4gvmUN4M4tU33
x7I/aFRVucX4FJl4vTl78708fn66++efv/329ALHZM2pr9hOaZ1hrshrPQAT0VoeZJD0+3KfKW43
lVKZHDcW/hap5k85J+KkYLvwU5RV1c+BV1RE2nYP0AYzEHBA2eVbMNMVDH/gdF2IIOtCBF0XzH9e
7poJjvUlU+L9iyEN+wVDrCISwH9kSWhmANl7q6wYhfJcFic1L8BSFaEU1AGcdgxWW51w8w4NoDWo
wOXiVq0aD404/KEU2UhMdvnj8eXjvx5fyATSuB5iD9Jj6WpPmwCAwBoVLSruRWeT+wQrfgDr3KPP
SIBmvcpnDPQkTKo66rLmw6B1AabMpS6XC/HRW2WQvCi10o2WA1rG7XdUGC5AtGBe4aNp5fiCy+dm
IkI+XaoBsVWq/ZlBegzaK8K4VyRoLvxBt9qXJ7VNBBAtCrDtHnPFy7woFy5pZ37cIXnsBGpCQOQF
1sPGxhwrDRmDARmcgaE9qjwvQGCwVVXewDGMRD7wobw/5hRup/V6AdNxfnHI692+DlLf61zBtulZ
0DdXkw0PmkbSsBbx4mttcR9FtoVYaCq9gABaYytfKVia5pSrAlKUxlYo+eTb9rpAqvk5cLeWlu3W
5C0I9TJVVuLw0Kuy09eU/AIyu21QWBng1LZZK8fjRdgAlruvgAYwvUGBKzDWH5TedbWv/A07oEYF
bewLhILWZzVeolPTrdCkRz606kZY494r+3NbT7tx2ASWWxQg2bVVVpTcshuXYM36BsrxMNzWlPFT
zN4lSvq/K0wETdlppsWKM4XTfMaxMBNHn6hIL1FH+iua9bUCZTsJJbh9/PV/Pj3//sfr3V/vqjRb
A6cZkZLwPkxE+FoC5l0HiJg1LMEVehELaqkfJv4SXN0sKUtMikAJiXkFL6lmJHa44lhHT+qV4j5t
6+lc5RnVWc72TM7Ic8Us4daJ7hh5iRRUHKsxcTVkRDPvlWrNNfIG2RKG+w0qEWSZzFSv0STkSnZx
IAfOVDCR7PgrLSHa+D2jZ4CKOkqQrfEv3yDTM1uZvTzBMkVVR41gm4WuE5Fr2Kdj2jTU4JYQ9BSq
yjP5guqNbbiWB7sPMyLqsVRow1gcsSUJAWf9lpQOhvfMWgNvj42c/FL7Q3yB61VQl9YGYMrljEYr
sMzTRH4ri/CsZnmzQ0lv1LM/Z3mngnh+b0gjhPfsXIOZqAJhV3dgvfKpLQr0aVGx72Fh1K4gZCqb
7jgsUQ8v84jYlnN0nCHYaR3ePDdasX0vwCSjivFbQwEqZGtYUFBfGAfS1gtM71dwdVinvN+2XHgc
pAXX+3fFls1A5eUUnVTTH1xAa2m9UpyNsT8StqC8PEM1ge4vs/lDrtrnGrhedtZZWGXiu+2xUMEc
vy03qeogdWEWdDCzdADxyDVggih2jYyjocKFSkXV3XHjuNOR9VpNbVf5eLdBQ7FKFXMaTWqWJtF8
HazCjeBDAohD1ueCVW1LvwoVbZY9DsuKr4fOEmluxvKQvmed56wvWTUd3TAg81ldJ0/vMzJ8zRpv
JDMlr9MyZxUF4z1Xp0FDXnyAHGVBt0sQMl2ClVplmRvHibYoFV8eoKkzzcu9dYMCq5ejJtNmmLjq
qI3KjnFM50tfkJ7Z/hHdV63Lwc5kHm7AbIc4GvXaBHBqgcvSqk1t8iFljuuEmvQVkfQ0rh8fdnlD
7AYB18rzjRe7BixUEm1fYHB6Ok8Z79RlS4ex0LqQsb5i8jcJBO5EZm997BV7QFK76BZV2Tlf1GpH
z9Xb8cCV9G2sQJKnSMTk6b71d+r4yiYrdy0FK0lo9p6mHWlig2vyhrs+GbPhitWWtqhjhwKt4RPx
RrZSV3efcW0rIcTYQ2AsuNGNeRZ+wfFoX+eVoLZSHNp+53qubWdVbcUM5hrDTbjJ7Rq/LkdGejwi
sqm9IDTkZTruyTzdaCCV3QB2o2Y11bnvGaDEqFgALTb5rD5Y7I30eUTCzyLO0kFx9G65xo6n0fO0
Hj7UxSxXxGF2n/1DxMeRQt4IPmA6YzAMQA2qKEU7nOuMxOZFNgvNNqhB3eczwLD2RE1oQW7znHJC
X4lEWFbhaa1bOYgVqh4awUi7B301rgTz1zzrtF8Jebmr4QxB3w+ppLZPQCoVHjRujG4mmu/YzTld
sG2Tj0y3uyQ8U5PKm1idd3WsqQ8kCvFa2lael74TbKwsRK3I/LpAfIPkZQX25MQHWEBNZizHrwvX
ms33udksjOMGq9QdzKT8BeHSpcQNTGg+DpZmOmQ40PIwgA/5O8/ZxKqwxwE2+0praYZnIu2a2BKq
xdymBuCyE9Wz3w+dbD2/mZj1tYOJUdPLXqA12oP6WXJBpB9Ak0eem9RjEvtBNNVMvnvSSPsBIxrd
oIF2/H8bR5EF2edNW9oPg3PqaVvWb2GPpXXoi8tDPp33JR8qMknEfEKDbd+Iz51ArVlBV9w89fNL
sa/pEosR34cVL09P3399/PR0l3bHSyyA5ZnRlXQJ0EsU+W/5m9s6CwVHz86euoqWSTgjlhER9T2n
JldUe4TdZ9dCl6q5/aBzoemysniTKodevjEOONoXZWUOpaxH0d/jKN8J3VwAZdPB8u/L0MNY5Pra
ztXvzL0BQFGwbKgZXLHt0WZ0rFTo/lNV+EX/qJ+aFwoxfXM7VuxcmOxGB3yN3k3t7H0OWg526C2O
WTJTz++ghEe/NnrAwGlE684MtIiMS5VmITa0Ncx+UXryLbg6EpoMD5a2YVhK3OzdAU4Qh9yOphhP
oFhnRR22VtSuOthQaWMtlRZ2VA0q8xayImS2MvapYHVZPbxFBeoNvYaWOxRzZyjE1I3AqlvWjORo
vtkarecIyCQOn2BMBXrCZNUDKPVmNzWszo1ruWuJ7cOQ9rPacUTVN8WSXiZwjTL0ZOOFNz+LMpFn
UW8mqVUTqqQYBxWTnKGD20Jv6flaohGXG5v/YMCiaDp6TuSNPzfmtZDQ/v7NgaykOY99N/wp0qad
bcnb44U9ChPpxeHPdRnJxdRUXgAio97Aat3sjVJALANYOOxmkdkYkogtVq80ZDApYRBJ/LPLBTJG
sE/oz80kXvRz48eCRv9uDUYvsLZkH8ylbz+x2+rhMG2H9MSzm2S8LS6KSSa8kVLd9+7QDJzjBMtP
nG/mTydL6ROzRLQn7YYFNwtL1D9sGPTvPRKd0OTUVI5D0e3Q/4a+3/gwTkNmuwkQS4FOpfh7dznp
z97QhDfXVTyvl+Q3F4OBKnAji1O9ShS6FqcJmWwJPk1WEbluPO3PbzYl6N5o6rABIrKhw2ZDBgCV
CAL9NLvAQ9e3VBmSMcauBMH/U/ZkzY3bTP4VV56Sqs1GIkWJesgDeEkc8zJB6vALa+LxTFwZ21O2
Zzf+99sN8ADAhvzty4zV3WgcxNFo9OH6a4ql53k+Ac9Cb+2QdQWRg6YmFyoL4C4dlnOmIXe9zCUH
X6LoFJc6zYWHi5GGsrXWKWYqM4laOdnFYRQU3pLqmkAIGxEL0tJvRFF2ghrFhvwSiFpf7uvK2Szo
Bpn63Alu78TpREyVHtGXohrpLl2banmgWNGtcVdbCo6pE6huSWFijpACgwVO1ADXUmIEpL36/FEP
cTHHBFYk3KH6JuUSGu4Qgyzh9JfZNfnaVMXL9rLQ8CQ1UGyOQT/Drr52Fy7RujF7N6zvOVYKjT7R
+kGctGBQKKCmjkB6llwMGtF6c2F+DXKErfYNMTMGjG1Wj3geUR6QOpm14+vZE5ZA8dzfgtB6DKMh
eeeFKqowX67Nd7cBsTHfQBWErWsCvZ2ZH5J0/vo/onMX68UHxyVSQT+IGTlgLrTXWzr/fsAfpjS5
sOoMzjJi9OoGNi0fPy+F89bU4kU4zUsPqq7Cqe0Z4b5jg9vatFmQrABsLbEkGwtgewmyGxuMBUCV
4Lsm8xZUw8YEZ3PhWzqOMfhXZPG98FF5Wiedqiig2JmaQRPPc8ddeGRRQK0Xzgczq7/VkQwa5pKx
6VUCjxoddDljpOK0YdzxyCzfGsWaFDcQtbG+8/YUnhGBU0VtLEmiNRoysrhCAaIqcVSKpE7Uadwk
bOtvKMSUK+kikj42RwJ3aZoo6GjnRLVWRX9UATnPe3QUnpakl8JIx13mOJuY5MGl9HWxOJBQtwmR
S8pdUWzh5Nm6Lh2RbaTJfdpPXyWgPoyA09UChsx5oRCQexbCHfKuJVJfXb46CpJL8gMSUDIcwqnF
K+B0xzcb4thAuE8uV8D4i9WHJyzmZSd9vjUCYgogfE33YLsmDiCEbyx8NsThinCf3FqPnGF+oAtt
vhVaje26Mu0JBulpo6dNGVHN2rUkDNFILl3AgWBNy2aomvMuLtdCmoDN2yw1pERnetWpDUGcuE3F
1iCeMM2BXte3aEXkiRqyOuraJs3m58pEYDVdw0N2V7NqL8hMDiefusMKDU/QjnE892k0d1vYq56d
8KMLhA7rLN7ji12zV1XtgK8ZJXG3MzaTFlSq7X7c32EYT2zDLKgi0rMVhgrRebCwbk8EqEsSA1pp
aR4EqMXneaNrcXatvrIhDOMT1medLtyn8EszChXgsoXLF9F7ROYsZFlmMKrqMkqv4zOfsRL2FOQy
EeizeMm3VAXfYFcWGF1F9QgeYLPBiXM+h2VxqHoICdgttNRs6C7Og5SclwKb1AaTXYa5uVtuzJoO
WIvwKxZG1+dY/yxHljVlpfM+pPFRBIAxqjz3sa00BinmRzVbkTaUZwtiPrFAeK1o5M0xLfaMDhYj
O1XwFNZIaSfJQmFTa6k1U1O0SkBRHkqzHRiDAFeHdert0jCHQTfGMIcxrM1xydk5yRg3Vlodywmk
Q/M0rEteJo0BLvGZOT4bjNusScU31uFFk+qAsjastMRKYQUGDIDZY5trVQw38XNx0plVsFKzMDJH
rAd3elgBgoB0zlQJ0PzN+nUHojC1feEqg45hbJiQGw2vMQCXWStnGJXKwquPtKN/DJHnN0uLawPc
xCyfgeIMzctjoynAtMrmS7bOacMPseYwiBLjpFWtYJmzuvlUngXf6QBVoLMtqUkPpd4u2AB4HEfm
VMGgJTvqNUQi65Y3ozvEWFCFQ9XWjrV4wHUVp3XhYmdK07xs6JgqiD+lRV5asbdxXWL3Lc2/PUdw
wpXFbF7ATlPW3b61zWeWVfIDDg9exHk7RmklBQF8Q5KnuBY1VaWVDJ7e7r9foU8ozUa8CgJ6ZDZD
jGElovJYSEM90uzPUtNoFai2bJBDeNCV+zDVYzBMEw3xU4SKsW0IhoWOPru0fSgStFmVojhlJYA/
C5sPHeJZHcKoMN7t9Q0LcJYS0rFCDDsSYVcV6WmEV3+/vz7cwdfOPr9rQavHKoqyEgxPYZzSnimI
xbZ3h1kX+/G+UJPBhkW7mI740Jwry3sjFqxL+GQyaDQxIHmuaZiqY43+RTGACeIeOw9ACORdYPpm
TMI0ytmtYUiulcV4LbNHaZlcXOYX3z+/vl2FUwjxaP41kI/N1QtxPNqrriAjqIPGoeM6h71A264n
CtpiasLr9lFKuaxJcgpRJjBvGWeFDWkkmteRzXZpQUXHMOf7kML2me0pVIL/q49PEypPsyBmqokd
4o4BNxrHslAPICa+aprkncUsAfEX/OARHQab5cLkeUgZsKSnJ+JbaHe6hjlvdCe8mX39Pb/RAUMg
LWnar1Wbk26J0zidQMSkP2bOKpNZP2nytUc5leVwtWhS4Rc6leph8wkuV8r94/PLO397uPuH2qfG
0m3BWRKDXMpbMpBAzuFuJRey0hfeQ97nldmXpVm1mAu5kU6ux30SInHRuT6tiB0Ja29LKYnR7Up3
qMBfMgIABesMWV3BCHkbxM9SsTcR6KBGebZAT979ESPoFzvhqi8TU8bE/VsUG9zkjcoYa5aO+oQm
oYW7cLwtM4m5u155zCQ+OphQR3W0Fu1E22wy3NaEVo0jBFTEQjBbI4DOrAIZN4H8TgOeNtsYsVvH
HA6ELpanWV2o1HIu1FWFbOuROWoEGk9es6bK3a40Re0IJt8feqznnU4zk8wR5ywJhgCm1JcjVtVF
9kDfU5+8ByBGMJh9BBG/wcZeDItnDnIPpUYFUWv3ZNQtQ0vge06j3jcEbh7rQjI6UlcIgarjHWZ8
mC+syPEXs7FoXG/rztj3IS3sEyIPl+7GvzBjmpCtvQWlGZfoLPS22tPJOOe9fw3gdRM5MJeNoUy5
u0wyd7mdz+YeZTxtGBuIMLr/6/vD0z+/Ln8T0mG9CwQeyvx8wlQLxC3k6tfpDvebuvXLIcabrPXD
8DOGEzO6kWcn+GCzD4CWwzY+cBvf+IE56xq4NeStZe3gZrAhgI6qkJdsKr5eLrz5oPJd7hpvTeOI
Ni8P377N92S8j+w0j3UVPEaXMCZOjy3hCNiXtCSrEUYpp0QGjWaMcG9pChGPTsOHVTsbkAHHQrj7
p2QsK42u3w4snZD+6p2uixMD/PDjDfONvV69yVGe5mdx//b14fsbpgJ5fvr68O3qV/wYb59fvt2/
/UZ/C8x9UPBUi4Cg95TBRzGPwAFZMam+pPtQxE0U09czgwuq6KnQgvq4mpE/5d0hDTD2+ZmsJoV/
CxAsC0oLF6PZEjpdpCAYhnWrRCQUKOJiHdOOKHUTdlpEQwTAjrha+0t/jjHEIwTtQxCBzzRwCHny
y8vb3ULJGIIkgG7Kva1NQ+AOrUhxyHU3XDGpAHP1MERH1WRYLJMWTYJ1JZSiZyTAECN6DwRYS3ik
Qrs2jWUsDQ0d1YeuT9oxqniweTM5byAeRb1HE8OCwLuNuTuvgAVxebul4Cef5MTdjfrcNsAj3sfl
IuFdCAurVd9jVLy61yrw9UY73gfM/pz73pqSbAaKUWQx4Dk7rbWUqQrC31KtF4itP28eIDabtb+e
F6mv/QVRoOZe6NIdSnm2dBaUwKxTOBdKO9RD4UByAgJv3qQqTIQtwfucqUAtLg6yIHHXroXvmphr
AuETiHy1bPwF1RCJ6Y4R5Y03EAXRBkRB4oMHN65zTSyqY7ZaqLeNsYEsyxknClTcXyzUxOjjZw29
Zr0k1g+HO8p2weZ1JDka7lJfsoYVR9p+KASeTzUCCjrEB45zuM1tiLl4cBcONUcPvkyUPmsaj2AR
+7PNklepfUdSnRfeJ/rPT1+InWxWY8Th3kXdh5TJ5CytvduGxB4lMXB7zoW0Kaqtvn9+A4H38fLO
GuYln/M7wB/UaMHe5ZAv9wqBFmFchXsuNTdwO/S93s2PPOIVyg15+50InFWfEN3EiCvVpaJAQK14
3lwvNw2j9smV31C7JMJdj4brFigjhudr52LHgpuVvyD3yLryQoury/gtYWrQ17qBQl5GL5Lcnoub
vJotk+en30FO/mjG9+rRCx1MGvhrsaQOsFCEIibHrVm7WzpC4Dg8G1cfndGshN8/vcJt8OLaGHSo
auVRzqSwxmdsARW0yeAvrwQsORchRgBX41cdBVR55pGF1bkrIV1eHuI+5jnZ1Z5syINmSW8mieBO
VNFPJUbbFQm8PfXJLEjGFUZ+p59HyFelQ4JO33BhbcXLirJTCMwhrW+SSAeqoy+IilIwsHHXglIN
EAyzOI32CM1RgzwHg/iq3YYnxI66Zgh0jkLw4ww0i2YIPeyCcyUUoqxgO9X7DmPkKDHfpvqD8rRr
jXccpYyqdOqzd+Vxod1fezD92tIjA4wOomoSergIeKN9hr6OPKXfjQ9RRb2zH/YluuSXTaaEB5PA
GsO8qzUIKHZirpBHv8jX569vV/v3H/cvvx+uvv28f32j8sTuYYrVB3LCf8RlaN6ujs+BbmrAG7aD
5hIdPPnrybG/3yamLyPcy496jgz42QV5ST/vswxu7eLd+WixbJBP1MiEB1mXHLu2ihhpMjRRNvu2
iDCsY6a+PJ3yvmnDwo7ZjdnYU8rgKm02ZuxdXO+jRO0u3OiPaR1nWogXCVarErZw3U6GyhhgmBsu
YxWaVOlAheO0vYVRwMjEbnGWdTwPUlXIUYCiIe8aog60ddMTlyA/kplwEI2jGsU8xBhcqg52RDI1
CtsIzXRLkaT9lDa87XtN1DUQNCzIYkVttaswlGJ4HTcgRemGGJU12jmgxpF81EpY51qQw8loCTEl
rD04uoiZB4w2/4QuhldO1ytdyUkqTPv0iJ29KUbRLBYLB/bySh3QPihDXGTl0YQegkaNPNrWCcy/
zu2Ctmm0EBAjRkaULKs63qUURVWXY3H1FZHbFkYVyhhIHCZ6q5rz9mnIxlk+jWaPuSHvTMNLagC7
ZnKdikTyk7lCj9wb38FA6+sP96UwrxRxJNvNFl81JrPrMeqOeOZNnG/WghVZbQWbZk10Fa9S4l0Q
vheQFE1Kb195dppisbwb06LSprAE1uRh2cdMQKuuUKb5+PNRNRLiP+7vv4BsiF73V8393d9Pz9+f
v71PejOb+ZCwKUAhDFjKoDY4Wf5UzK3/vxXo/FuRqKNL6vgGrXaaWo2V2C+AJIvmOYx6HNrviYlt
TvweX2Ph6ljjcpmNZYVv/FD9hYVdtUUqou3YBz1sRYie9xmYAPV2REYlAtFPgo/qEYbrE2fsAtNS
DAzCfVellWZ2mydRh1akncXuBxO/YbLfviHUMsthi2eY5k6ZshN/8fzT7cumyix5NHoSUoLeY6zb
MFOUP/ADBU0Q3a5b1QC5J8SwbxVTc7zLByODyQgbwt4rTUbonkfUm4tSbq451JHbla+ochScoVhU
MDz1pKv31BQdafHc0KmWtEewTrSi7EV0EtX3UsGEURhv1Oi4Bm7reOSQhBzTCHVhZenf6D19uWGj
ao/iQT8aKwSH0LMUDaLN0iddxRSiJD3BvtcnBNfmS7bLu3BHJ0DbH3mVFqZNm5Tcvz/f/XPFn3++
3N3Pb+bAOD7APuM7nqstgAC2LwMaHeHADeZB24VBDKZWhJXfrFdGGrfBOYZqhsKDpRncyahNSNxt
WaVvXwJI5LiXDzP3j89v9z9enu8IVUSMprvGs8sIg+nVx7Hvm02wklX8eHz9RnCvcq5duwQALXCo
OSeR/X1TOdl05qN4g4kGUMQcTlgYzKcvx4eXeyXT2yRBDNRyF6eFzJEG83nMVbZlePUrf399u3+8
Kp+uwr8ffvx29Yrv+V8f7hTrKUHMHuHYBTAG5FM1V32XKLQs9yoPcEuxOVZmZHl5/vzl7vnRVo7E
C4LiVP0xhQm8eX5Jb2xMPiKVL8v/nZ9sDGY4gbz5+fk7NM3adhKvfjS0VZx9rNPD94enfw2e4zVT
xB46hK06takSo+34f/TpFa2VuJ2jMEU9Gp9QNhy06PG/b3fPT/2UpUxjJXnHTpXj03mveoqEMzgB
KYm+J+hvNWa58e7jrrbrSxUoopy9EjiHlytvsyEqApTrerQX70Sy2fgr2giop5Hnkb0FVVN4S09R
9fbwuvG3G1d5V+rhPPc81YipBw/m3xOfHPZF8RA77bukBFU0ivoJfmDgVh2QRpq6S4DMbUnBSQPw
Ro3zgmA44nZVqeu1EN6UJb3BiUJwc7BUI+w4hL2CqigDUTQgvTMwk9K78kO+7usgI+8HgmSI2n0G
kouejAmRGPE0abRomAhOb/jaIXMMIVbYBbo6o6ziRlMQoutuJ+js4ocoYVjna9KL6GWTV/RNBbHN
kR76HmfqJeTVsL65uoMthbj71TcoSKhNYDBAKWlAjV4jDIuou9qMtzJ5K0xXY3PfqGMeN8NV0IgR
LJ//9ucr/vOvV7ErTk0eQjMDWrkLTcA+j7REj7UFYd5dlwXDVecgGfWpoXD/0gNTvK5lyOpphBV0
9DEHzjLdrRCROP3S/OTnN6YLikaWg1CaTR2x0lUn1jl+kcPdhvxkGg32XJv3WBGrqn1ZxF0e5es1
qSBEsjKMs7LBRCmRHggUkX1YzDIPaF36RGM6joyTSP/UY8143w/V941eM8KqzAgQPiEUWJShMPZJ
y1qbh8rWCT/0BYuArBo9qKv7F3x//vwEB+fj89PD2/MLFenwEtkoemq2C4xjGugZwNzN4Iut9F/d
tVBTqKZH7OnLy/PDl2mBsCKqS9U3vAd0QYpqc12HoePU3dUoNTwG/PLXA9rx/dff/9v/8T9PX+Rf
v9jrGx/31J1jaPg0U7I0KA5RmlM3vogpxqPCPsz4aZ4OfZ6zLsaLRj580v3x6u3l893D07f5Zggb
r6JpbXLUlDb4qMRV/+cJgXZvavBlQMjMRhotCP11iCF7C17qflEKdrT1vKChavbk2iF6NOrbK/XN
EFM11BhDH76IsXxmKHFiTXgRKjPf1QNheFAWpUDKrPczjiChxrfxhFVeYoSIXOHECsu2ooPEC9am
HrtMaLgARommTR5gXULnxhzQLGnJYvRrY8K1VyX4KZP7xIeuKCP67Eai3hfW4q+oUOxbZZdS4Kbn
F6J4WOYGJIgxFbQOLEPNla+JSSU1KrLhW5zEm658rPz5/e3hx/f7fzUvx5H+1LFot9k6Wjg7BFs6
iSihbFGu31QV46ZXpLjMDikv60BzbE5LTcOHv1HWsFXMszQ3n0EBJDNrhk1NS1VCER7O82n3aJi5
hZYEDkTL7qZlkYzhTWhsmhCTy1ZNa1FG5yWp9s8rzC2kDjECYD7AkdyQ24Jx35Ppxx/gXi0PWeUj
RiEL93F3LOuoN1fWnt1l/rsYJhGG1adN/AGXltISQb1MOR1pjAsYF3MA6hc4V9RQ8hQzBVMXlYGG
x2Fbp42yzQJm1emJAwWoxdAcZS2aQjNcaZXOOKp16axtvqQCOR3Synn0KYg0fyn8bc/zzbs8EN9F
1ZqlHI9oo6cjGIgtLrYjiVC5pUVCLRCFfXdiTVOTNVODpaKpAfskUJS1wawzCLlpy4aO03L6YIYg
XjeGR0hZZJjARZjPWwrNjNARKBdXlzA6HOUu4Y4xizF7pTnnpxtIU8/GYbo4p9m86DAXnNkwCRC6
Xtn49WXkh7TxFBOG4izdOqTonJaU08PAf0iAk+pvyQM6uyUPuhGrSLcD8JY3iuh6C3eTee/Rw4xS
XdvWMqoczO1BwqTzaleSb81o8YZvGNepGgEkB/EWPdXOJl5tH9wA63NlGzyOWUmNRTICL2WnH2mC
NoWTusC0WQXDw4RsP5dWd5o1yNwQbzzqBEZ4cWkNY9YiYqWqtAKAPjXoUza9IlO3Skzm2tMfWV1o
QyzBxmVIAhsQKCch4CbJm+6gmF1LgKJrE6XCJjP4YGZXnLuqcxVrmzLhKy07rYRpoEScKtq6DwFk
N0pLFKkF01Rm7GxM6AmKUYHSGp/gIzK+DUXJsiMDESkpMzQfodniTYy2j1WITjAFRI8/IsxjGMGy
0qaE1Ch/vvtbfxZJuDjF6CcqSS3Jo9/hlvZHdIiElDITUkD+22LCA33gPpVZGlPy0i3Qqx+tjZKh
6FA5XaG0gy35H7Dt/xGf8N+ioZuUiO1XUR5wKKdBDiYJ/h685jB6XcXgVrRyNxQ+LfEVi8fNn788
vD77vrf9ffmLuiwn0rZJKBcV0Xytfgkhavj59tUf7+9Fk+j9EABjOQpYfVSH9OKwSYXK6/3PL89X
X6nhnDJDT5ojBF2bhhsqEt1T1cUtgDiqGDErRVs2HQUyeBbVcWGWwHA+GCqmd2c2ClX/V9mTLbeR
6/orrnm6DzlTluw49q3KA9XdknjUm3ux5Lx0KbbGUSVeSpbPmczXXwDshQvY9n1IOQLQ3AkCIADW
aK1EJWHArKIiNd6xNq0PVZKbfSHAqPSiKDrRy/pQomLpecN4WS+A485Y4SGJlDdIZDzQ3qfFWcgF
uiypMdPv+PGPxfhAqbwRhbWNmBntq5al8hpXzlVaSVmBCRKs4kVorboWoBZZB5vbjaJz1lzkHQg6
X5bk6aqP59InjQJCZcky5m0W+aW2ma+oqOvKcEQUImFJS1AXy6X16nkLUxKGw0BZKnUYaOuxw6J9
JckbzJoXR2wtLQUp//y9NUeJFz0YOjHSMEuN6OHfVLipWz5IhGPlgTjJfrb5Nt5slCnHKc4xecrN
jLxkvo0OdpTMIlDvQ6Zb80IsEnxXUynU9EblmaZJb3zLJZEpcAV9WWeJI/Uuc/9CvE43577CAXdh
bZoW5IbettVy3LasssJYPgqCh0mM5oFOE+CvABQtzB9LZ1OdMw9rDsil8e6mXcfl+fQDdeCK8Fcy
UrzeuO4gHe2K1tr+gXe3WKM975frlPjHr3/Of9z94ZQbKKuzvyTyn3HbUwjOBt81FpQyZ8xmui/e
AMN/6OLzxx8MboXuOLRNLs4ZdCI2+MJwCbrllEHnzNdw1NxYnLf2Mukis06cDuLujB7jKNQuyTfJ
+b6DUrTOihV/IKbWBsXfN1PrtxH9qSAeSYKQRh4bhJRrkbMtV+SNJwgvyyqk8H6J6lAcLUQAmmvK
jXNHhBITPt6WWh0NZYnxACCj51w+AyDhvEEWBfmygzqcabwYtXH7Jw6FUWGbbkRzqk8L/U5M/W4W
ZmBBC/Vr50GUL/mVFkhLGJCt+abkzJKExUCmNbqUoz2tG2B9WIhqHQn0kERRjn8GjqjqHPMk+/E+
IxEhna0wQPnn1gc83oblmIaYXzyK8J32ZaHwHXrCfx5e5fxEpLG+9mKNf2oqlobudLQGdDTzwx7z
hTDDajVwX7i3qgySS92PyMJMvRjNC9nCfPFhLk69zby84Le+RcRPt0XEO1ZZRLwaYxG9P3QXFyNd
unq/jqszLhDcJPlspAOwPv/AiFydX73bjy/n5kTLMsO12Fx6uzeZfuYDom2qiadyUQZSmkulq3XC
g6d8G8948DlfyGce7Mxjh+BScen4K772iadVE89ATz7bk7zK5GXD8cQeWZtdSUSA4rOes7MDBxFm
DeTgaRXVRWbXTbgiE5X05EHviW4LGceSD/LoiBYiskhsgiKKVm7rJDRbpCGDSGtZeTovRcr1pqqL
FZ/JEynQemWYqGNO9qxTiQtbM+kpQJPiG6Cx/EYJ6QdHE+1+2bj2VJ7Wu7u3w/742w11p5cDtMbg
bxBCrzF22auJgxRSShDpQPUDeowE1i1BmAU7CruSO2lRXRAMcL3GJlw2GRRKXeJPuO6erQmTqCRn
uqqQAe8+0tFyam2LMtwqkXdQiCZukFgl+jeDcpaiCKMUGo+XBWgJJnklEIbBzSEytFmnhDkUgSnN
OMuMQ4xtLHMzVnQOgiNeYCiXGn4kQOaSARWTwNpZRnFuJ8JuKWUimlb2wkQpWdHP4yzLOM2sM6oO
EyP0cMQyAR3t+e7n/fN/nz793j5uP/163t6/7J8+vW7/2kE5+/tPGEL3gMvy0/eXv/5QK3W1Ozzt
fp382B7ud0/o4zOsWC3f6sn+aX/cb3/t/9kiVo/tkxX2OljBPkkN/Z1Q6PeNM+fJ5eYQoz+Pl7Zz
5+Cb1KH9Peqd4e3d2QukuGXQBKSuDA6/X47PJ3fPh93J8+Hkx+7Xy+6gRdoQMXRvoWJZOPDUhUci
ZIEuabkKZL7UvT8shPvJ0sgsqwFd0kK/EBtgLKFmWLAa7m2J8DV+lecuNQC14LC2BDRCuKRdSggP
3HCBaFGevJHmh72aaLlVtFSL+WR6aaRpaxFpHfNAt+k5/XXA9IdZFHW1BC7ujEt7+lhLQiZuCYu4
Rs8/5EGYeKFb1/nb91/7u3/93P0+uaMl/nDYvvz47azsohROkeHSqToKAmbMoyDkzuMeW4SlYD4D
3nYTTT9/nnBSrUOj90q8HX/sno77u+1xd38SPVHXYHef/Hd//HEiXl+f7/aECrfHrdPXIEjc4WNg
wRKOaDE9zbP4dnKmZ1brt/JCYgooLwL+U6ayKcuI2fHRtbxxoBHUCPzxpvOYm1Hk3ePz/e7V7ceM
m4yAfTOlQ5rXQT2UNTR0LZo5rYyLtdPnbD5zYDk20QZumB0Hcsq60J2zu7217Affj1Lj++h0S6MQ
NxvWOtJOFz4yUdXuCkBnlH4qltvXH76ZAMHU6ecyEdz8bGBM/E25USWpm+P9w+716FZWBGdTduYJ
4Y3N0al8X8OMxcD4/F9vNuyxM4vFKprOmGIVZmR9tQS0ve0hhDZVk9NQzvn2Kty7bV6wTdZ2tV10
v2wwg80FGwndHifhuXs2hS6jSCRsawrCcJdJkYST6SXTQURc8Jr5QDFlXz8f8GfTU5fzLMWEqQ/B
sJXKiDe7DFRQp0vnUH2eTBWVe35REVyz4BsOfMbMUZmMVY+ePbPMFXqqRTG5mjotWudYsw2lddPQ
4mpSqfZVLy/uX36Ysdgd53eZG8CaipEao1Iv1u6gSOuZ9Bg7W4oi8ITydzsrW3sevbAonKTZNl5t
BHd/CsztIF3RoUN0H3rx6oAE9vxxyqmfFNVqyx6v4dwzhKDjtZeVu1IJOvaZFdg0QM+aKIwYtmKT
zunvGMVqKb4J/iK62wQiLgX7mLAl33gFn6F7TtkRm7Goxxa5indj4XRe+4auo9FGl9n8A9H0A6NZ
JqPoKuI9hDv0OhvfRS2Bb+l1aE+HTXRztha3XhpjySk+9Pz4cti9vipF3V1xdJ8+1jvLq9ZGX7KZ
OPtv3e7QLbUDbR1xVfaF7dP98+NJ+vb4fXc4WeyedgfL0NBzwFI2Qc4pr2ExW3RJ/RiMR/RSOO/1
lkYU8HdYA4VT778l5nSPMADVNE5peikmwni3/p6w0/w/RFyknntEiw6tD/6e0YGHLv2WWeTX/vth
e/h9cnh+O+6fGAE4ljP26CM4HFOuhqScxm4iImllQIdKw2kP0jpLeKAakfGNChWHY5urUH11fpJ3
+jRornwZg2I7WtV4KaFnzHsJtiCfhslkjGasfq/uO4zDiIKMRL20Z0/bknuIWJS3SRKh+Zls15gV
dWiXhszrWdzSlPXMS1blCU+z+Xx61QQRGnllgC5HKhxJM1yvgvISPctvEItl2BRd2dyXX1p3Qa1c
tZ92hyNm4dged6/0/srr/uFpe3w77E7ufuzufu6fHvRMuejZodv8C8Oz3cWXmmtMi402FcZYDj11
vncolB/M+enVRU8ZwX9CUdy+2xjYh/iQSFl9gIK4Df4PWz34Un9giLoiZzLFRpH//7wb49jLrDB0
RxQNOYwadxRWVMZMgv6AWWe1weqSAoBqkQZ4w1BkSRfewJDEUerBplHVPiPuoOYyDfF1TRgbaIK2
H7Mi1DVHfHs2atI6mWFm3CEXN92u6Onu+kwG9Pagkd23Q1lg4mHoYBMk+SZYKq+XIppbFOjuO0dx
uw3ylHpP+zJgH8IhnmaVunvSGUzQBAGcmDrHCCYXJkWv+mswWdWNIVg6xgy0YnQXd+xxQATAPKLZ
7SXzqcL4BEYiEcXaL1UhBcweX7Up/wXmL/19IjnrzTwDgfbygW2HgTUdZonW9QGFDrJ4qMfG5kf3
SeWBa3ot8g6TjqekRs2V4nGJJDBHv/nWhHoOA/W7Nfn2g9tCKZVDzt9UtyRSsGabFivMFIQDtFrC
nvJ/VwIzdxs5C/7twMwZGHrcLL7JnEXMADFlMcpRmYOfu9uZuTqlyKkbEatwJ+2ULLNAws4EeUUU
ha514O4GvqBnRVAgdKdrDH6B8DDRJCn4gRFwAyClVKAKAVxxUS0tHCKgTLpPtcMKECfCsGgq0HkM
njiwoQxzHiBhnfYX4dqps1YZto0GBtmSZPWGIqFNFHVG2V93f23ffh3xbanj/uHt+e315FFdR24P
uy2cS//s/leThPGSFw7OJpndwvR/PXUQ6OMOlWJwxKnGMTp0iQZC+pbnLDrdUNT7tInk4gZNEj0f
BmJELBcpup9/vdR8KRCBWWQ8ccblIlbrT1t7lOpPXUtpNVCsaB9uqCEwOMZYX+G1fpzFmWFixt9j
vD6NzZiBIP6Gvgha84prlHC1KpJcGs9XwY95qC07TEWCuSLgjNc2TB2UUzz2DSmCNIFuX96EZebu
1kVUYULGbB4KJv8QfkMJGxv97JxnaEHpXVt16OXf+hFKIIzAU3l4tS2xsNZ9v5dyTH1i3HADoE2N
4VLXKsC/mcd1ubTiyx2iJMAHYS0CciZYC93bm0BhlGd6g2HnG6tCDTXrn+NIf6bnQydiE/TlsH86
/qSXau4fd68PrgcPSZYrmgR94bVg9DTlb5uVpzwIT4sYBMm4v1P/4qW4rmVUfT0fxl2pD04J50Mr
0Hmka0oY+d6kCG9TgS+++X2NDQontXEvvSezDFWuqCiAXJtJ9Rn8u8E0+qUaqHY2vCPcG6/2v3b/
Ou4fW+H+lUjvFPzgzoeqq7VQODAMY62DyHicXcN2J2fEm001yhIkWt76qhGFa1HMeTlxEc4alQCf
5+VRSt4HSY0GazvTQrd9CxhlCmf+ejm5mup+R1AwHN+YpIjNt1xEIqTygUZjRxGmXCtVZnGd5aku
lSo8HwPtElEF2iFtY6hNmAjh1h1ndRjP61R9QsdIczblZCrVvzyTZtIT5V/UJgox+I5eg/JV196l
7JTHj64oWn9ke9zfddwh3H1/e3hALyL59Ho8vD3uno56fhqxkBQkSjnrXGDvyqRm9+vp3xOOCpRC
qetoLg5dA2p6QX3Q5tvOl8yQd/79ltu7TYQuL0SXYJ6ZkXLQt4v1myNBEeZ/Bctb/x5/c6ac/giY
lSIFrSmVFQocavENITWIHa8vKFvnvHaWPzRv5gCoeBG31xhXqleu+8H15eqWdXJojDZVlJbS49+m
SkZCkob4IDYsJlunHvMuoWFv4BMD7NsqQx2NoZ0reJHB5hGWFtLPh6JZb9zRWHOJMHojQoUhGJrZ
hH6r5F82kIrT/UBV+dkMs4Awi7hFjAlzJuFc6TKeYijLteftJ4MQo6jerasIauKent60satu/iaT
quX53Tk+sZtUxoLbRbQN2jUMwlgMjM/td4fxdkVx1bpUgdnDUQKHT9giozT0nkXW0rlJmnxBTr12
Z28St3FAjV4tbuYGm6rg+q/VOI/Fglk7Q2s+0HJZVLVg+ECL8DZAZdMl11X34/YgQi2WjQUfOJlQ
nIxH4DCZ6lMQUNsV1jXTKyyuYZSG02xgsaAyG/YVq2K7wIGVEyKrMecKN5wKLykJkl0cLaOvExM4
dKmvA/e3wo55/A7M11rJS5UzttXQgegke355/XQSP9/9fHtRx/1y+/TwanJtfKoFJJKMz85j4FH6
qKNBgVdIUtTqSlfdy2xeoX20RoZXwS7POGUAHc5bKqX4YkkwWImR4Uyj4srSVhwimyW+iFMJ9uHv
9TWIaCCohdnCGXdVBTvw44OpQh1ApLp/QzlKPxsNZuKE+BGY4hPZWrkizRnH4VpFUa6Ua2XiR6fI
4dj/n9eX/RM6SkLLH9+Ou7938J/d8e7PP//UXwHH5ExU5IKUR1uFzgt8W5BJwaQQhVirIlIYR+m5
biUC7KyXkaABra6iTeQcjt0jEDbcQ75eKwwcHNk6F7pZra1pXRpxwQpKLbTYDEW2RrnL2FqEtzPd
Y+Jx5PsaR5ous7kHGfVBg/WOtiDL43noJJPz9f+zCroCK4r0xXcV28OEhTep/hAaMTYiGGCkA8Ew
NnWKvjCw8JUFnjmblQDgCJlqu/1UIuz99rg9Qdn1Di+6DNbVjqUsxxTS/B186dH8CUkpuaRPYCIZ
Jm1IoARZr6idTGQWB/F0ya41AGU9wheuYvftUJC4OA7TbkT9jaQepC4Sh/k0l1NfN1JiUvnGI2Ui
nl+KiAFRG/iZiDkcCgCkWfcnxXRi1ktLyFNndK1HR3dPiRjD4Ajr160yXJD0MTLBKi8dKC2Yl8Tj
VQatb99gUob4Lpk6z+aAIA1u+Yf5yNdk2DMuo02zXI1FYYlCvd1gHLsoRL7kaTpT1tzargyyWctq
ibbc8gNkbXY0NPjZ5C1ZQuI/lIeXtRYJJpaihYGUZPFwCkHHoVsLGLSlqaJtXhWYZwUZRGf1fK6P
Cb0bSPSGZRqnFleDeqnBGckcdKsEdnlxzbfYKa8FcAkX5s6iN45VGYIWvAzk5OzqnO4XUMDmo+1A
XorZzISaiE+pu2VryDDtgCqksaVxGM7flxccw7FOBWclu6eGSxOJIr7tzLR1qd0toCdfazMlW67+
XJn+laescLbwfECvgWzCmXbER3OJWlLTqvAWg8CEX2jEZ0ZX3eBY+dpoeWLmZXuHD3eq0De8q8Sc
7ZxSPwQDZsp23ZxuLnlnd42Cfyazw9f0R29Fj7JtWjaDJEu6KETiuXvLhffWS5XQ7V/7aE3kePfV
OJH9zcPC1VuCKGmNmPDrdK3y48OBwLHkDm0bXfujxtwA+p1JtXs9oniFqkDw/J/dYfuw00Kc61S/
lVXJih3rj/HQgAGLNrSvm162M7DEND1SYye14IVEVgwJZvVSsjmxUD89O5hpVKns6+980LE4M8Gt
dgEnZIxWHROijHaOVkyoRKyiLkCcrQloZNYLGPbncxSV2S5ZbexNvmPsdBVkenyaMjaA1g7glvHl
pu0AEJx0A2cX3mFWSm1ynuKOV2GVsI1WCit6ipWZnZhcJ0lkSm+5+ym8388GKQV2qSMUDuLbDJ0n
RvDk5JDFGb4E6Od1uieGn6y1J3okVKVzXZybKpHe22W0QTY/Mhzq+lRdy/Mcr6Mrg5y/VlRWHKCo
2If/CN375Zlfqdtcf6mAh30X87d0RFHXcgS7IXcWPx6Tz85BQPBTFOhc5ZgUrVH2+XETVobc+09q
Ra+MF6O6Lmeep6IJ35rRRkYEhW47ja5VR86/q66Q6JW5zMhAfcOzEHROhHY2MxD9l4ko+PTwVNpc
Fgm+1D6ytCjXKnvPjAj2xFBupSxC8+u0VDNocemcLmrI/Hfm7eqn/A7elFNqByTZyEoEUTMQsA9G
K0EjiUfo7QqxCYyxzrXsMUBrW0lGj3Enj4Lyj/g/Oc8vVI8zAgA=
--===============6855886261915429640==--

