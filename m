Content-Type: multipart/mixed; boundary="===============3216848878552196252=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 05/10] block: add emulation for copy
Date: Fri, 11 Feb 2022 05:28:14 +0800
Message-ID: <202202110554.gDIZXN5V-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3216848878552196252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220207141348.4235-6-nj.shetty@samsung.com>
References: <20220207141348.4235-6-nj.shetty@samsung.com>
TO: Nitesh Shetty <nj.shetty@samsung.com>
TO: mpatocka(a)redhat.com
CC: javier(a)javigon.com
CC: chaitanyak(a)nvidia.com
CC: linux-block(a)vger.kernel.org
CC: linux-scsi(a)vger.kernel.org
CC: dm-devel(a)redhat.com
CC: linux-nvme(a)lists.infradead.org
CC: linux-fsdevel(a)vger.kernel.org
CC: axboe(a)kernel.dk
CC: msnitzer(a)redhat.com
CC: bvanassche(a)acm.org
CC: martin.petersen(a)oracle.com
CC: roland(a)purestorage.com
CC: hare(a)suse.de
CC: kbusch(a)kernel.org
CC: hch(a)lst.de
CC: Frederick.Knight(a)netapp.com
CC: zach.brown(a)ni.com
CC: osandov(a)fb.com
CC: lsf-pc(a)lists.linux-foundation.org
CC: djwong(a)kernel.org
CC: josef(a)toxicpanda.com
CC: clm(a)fb.com
CC: dsterba(a)suse.com
CC: tytso(a)mit.edu
CC: jack(a)suse.com
CC: joshi.k(a)samsung.com
CC: arnav.dawn(a)samsung.com
CC: nj.shetty(a)samsung.com

Hi Nitesh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on next-20220210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nitesh-Shetty/block-make-b=
io_map_kern-non-static/20220207-231407
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-next
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20220207 (https://download.01.org/0day-ci/arch=
ive/20220211/202202110554.gDIZXN5V-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
block/blk-lib.c:310 blk_submit_rw_buf() error: uninitialized symbol 'bio'.
block/blk-lib.c:414 blk_copy_emulate() error: uninitialized symbol 'ret'.

Old smatch warnings:
block/blk-lib.c:272 blk_copy_offload() warn: possible memory leak of 'ctx'

vim +/bio +310 block/blk-lib.c

12a9801a7301f1 Nitesh Shetty 2022-02-07  274  =

a7bb30870db803 Nitesh Shetty 2022-02-07  275  int blk_submit_rw_buf(struct =
block_device *bdev, void *buf, sector_t buf_len,
a7bb30870db803 Nitesh Shetty 2022-02-07  276  				sector_t sector, unsigned=
 int op, gfp_t gfp_mask)
a7bb30870db803 Nitesh Shetty 2022-02-07  277  {
a7bb30870db803 Nitesh Shetty 2022-02-07  278  	struct request_queue *q =3D =
bdev_get_queue(bdev);
a7bb30870db803 Nitesh Shetty 2022-02-07  279  	struct bio *bio, *parent =3D=
 NULL;
a7bb30870db803 Nitesh Shetty 2022-02-07  280  	sector_t max_hw_len =3D min_=
t(unsigned int, queue_max_hw_sectors(q),
a7bb30870db803 Nitesh Shetty 2022-02-07  281  			queue_max_segments(q) << (=
PAGE_SHIFT - SECTOR_SHIFT)) << SECTOR_SHIFT;
a7bb30870db803 Nitesh Shetty 2022-02-07  282  	sector_t len, remaining;
a7bb30870db803 Nitesh Shetty 2022-02-07  283  	int ret;
a7bb30870db803 Nitesh Shetty 2022-02-07  284  =

a7bb30870db803 Nitesh Shetty 2022-02-07  285  	for (remaining =3D buf_len; =
remaining > 0; remaining -=3D len) {
a7bb30870db803 Nitesh Shetty 2022-02-07  286  		len =3D min_t(int, max_hw_l=
en, remaining);
a7bb30870db803 Nitesh Shetty 2022-02-07  287  retry:
a7bb30870db803 Nitesh Shetty 2022-02-07  288  		bio =3D bio_map_kern(q, buf=
, len, gfp_mask);
a7bb30870db803 Nitesh Shetty 2022-02-07  289  		if (IS_ERR(bio)) {
a7bb30870db803 Nitesh Shetty 2022-02-07  290  			len >>=3D 1;
a7bb30870db803 Nitesh Shetty 2022-02-07  291  			if (len)
a7bb30870db803 Nitesh Shetty 2022-02-07  292  				goto retry;
a7bb30870db803 Nitesh Shetty 2022-02-07  293  			return PTR_ERR(bio);
a7bb30870db803 Nitesh Shetty 2022-02-07  294  		}
a7bb30870db803 Nitesh Shetty 2022-02-07  295  =

a7bb30870db803 Nitesh Shetty 2022-02-07  296  		bio->bi_iter.bi_sector =3D =
sector >> SECTOR_SHIFT;
a7bb30870db803 Nitesh Shetty 2022-02-07  297  		bio->bi_opf =3D op;
a7bb30870db803 Nitesh Shetty 2022-02-07  298  		bio_set_dev(bio, bdev);
a7bb30870db803 Nitesh Shetty 2022-02-07  299  		bio->bi_end_io =3D NULL;
a7bb30870db803 Nitesh Shetty 2022-02-07  300  		bio->bi_private =3D NULL;
a7bb30870db803 Nitesh Shetty 2022-02-07  301  =

a7bb30870db803 Nitesh Shetty 2022-02-07  302  		if (parent) {
a7bb30870db803 Nitesh Shetty 2022-02-07  303  			bio_chain(parent, bio);
a7bb30870db803 Nitesh Shetty 2022-02-07  304  			submit_bio(parent);
a7bb30870db803 Nitesh Shetty 2022-02-07  305  		}
a7bb30870db803 Nitesh Shetty 2022-02-07  306  		parent =3D bio;
a7bb30870db803 Nitesh Shetty 2022-02-07  307  		sector +=3D len;
a7bb30870db803 Nitesh Shetty 2022-02-07  308  		buf =3D (char *) buf + len;
a7bb30870db803 Nitesh Shetty 2022-02-07  309  	}
a7bb30870db803 Nitesh Shetty 2022-02-07 @310  	ret =3D submit_bio_wait(bio);
a7bb30870db803 Nitesh Shetty 2022-02-07  311  	bio_put(bio);
a7bb30870db803 Nitesh Shetty 2022-02-07  312  =

a7bb30870db803 Nitesh Shetty 2022-02-07  313  	return ret;
a7bb30870db803 Nitesh Shetty 2022-02-07  314  }
a7bb30870db803 Nitesh Shetty 2022-02-07  315  =

a7bb30870db803 Nitesh Shetty 2022-02-07  316  static void *blk_alloc_buf(se=
ctor_t req_size, sector_t *alloc_size, gfp_t gfp_mask)
a7bb30870db803 Nitesh Shetty 2022-02-07  317  {
a7bb30870db803 Nitesh Shetty 2022-02-07  318  	int min_size =3D PAGE_SIZE;
a7bb30870db803 Nitesh Shetty 2022-02-07  319  	void *buf;
a7bb30870db803 Nitesh Shetty 2022-02-07  320  =

a7bb30870db803 Nitesh Shetty 2022-02-07  321  	while (req_size >=3D min_siz=
e) {
a7bb30870db803 Nitesh Shetty 2022-02-07  322  		buf =3D kvmalloc(req_size, =
gfp_mask);
a7bb30870db803 Nitesh Shetty 2022-02-07  323  		if (buf) {
a7bb30870db803 Nitesh Shetty 2022-02-07  324  			*alloc_size =3D req_size;
a7bb30870db803 Nitesh Shetty 2022-02-07  325  			return buf;
a7bb30870db803 Nitesh Shetty 2022-02-07  326  		}
a7bb30870db803 Nitesh Shetty 2022-02-07  327  		/* retry half the requested=
 size */
a7bb30870db803 Nitesh Shetty 2022-02-07  328  		req_size >>=3D 1;
a7bb30870db803 Nitesh Shetty 2022-02-07  329  	}
a7bb30870db803 Nitesh Shetty 2022-02-07  330  =

a7bb30870db803 Nitesh Shetty 2022-02-07  331  	return NULL;
a7bb30870db803 Nitesh Shetty 2022-02-07  332  }
a7bb30870db803 Nitesh Shetty 2022-02-07  333  =

12a9801a7301f1 Nitesh Shetty 2022-02-07  334  static inline int blk_copy_sa=
nity_check(struct block_device *src_bdev,
12a9801a7301f1 Nitesh Shetty 2022-02-07  335  		struct block_device *dst_bd=
ev, struct range_entry *rlist, int nr)
12a9801a7301f1 Nitesh Shetty 2022-02-07  336  {
12a9801a7301f1 Nitesh Shetty 2022-02-07  337  	unsigned int align_mask =3D =
max(
12a9801a7301f1 Nitesh Shetty 2022-02-07  338  			bdev_logical_block_size(ds=
t_bdev), bdev_logical_block_size(src_bdev)) - 1;
12a9801a7301f1 Nitesh Shetty 2022-02-07  339  	sector_t len =3D 0;
12a9801a7301f1 Nitesh Shetty 2022-02-07  340  	int i;
12a9801a7301f1 Nitesh Shetty 2022-02-07  341  =

12a9801a7301f1 Nitesh Shetty 2022-02-07  342  	for (i =3D 0; i < nr; i++) {
12a9801a7301f1 Nitesh Shetty 2022-02-07  343  		if (rlist[i].len)
12a9801a7301f1 Nitesh Shetty 2022-02-07  344  			len +=3D rlist[i].len;
12a9801a7301f1 Nitesh Shetty 2022-02-07  345  		else
12a9801a7301f1 Nitesh Shetty 2022-02-07  346  			return -EINVAL;
12a9801a7301f1 Nitesh Shetty 2022-02-07  347  		if ((rlist[i].dst & align_m=
ask) || (rlist[i].src & align_mask) ||
12a9801a7301f1 Nitesh Shetty 2022-02-07  348  				(rlist[i].len & align_mas=
k))
12a9801a7301f1 Nitesh Shetty 2022-02-07  349  			return -EINVAL;
12a9801a7301f1 Nitesh Shetty 2022-02-07  350  		rlist[i].comp_len =3D 0;
12a9801a7301f1 Nitesh Shetty 2022-02-07  351  	}
12a9801a7301f1 Nitesh Shetty 2022-02-07  352  =

12a9801a7301f1 Nitesh Shetty 2022-02-07  353  	if (!len && len >=3D MAX_COP=
Y_TOTAL_LENGTH)
12a9801a7301f1 Nitesh Shetty 2022-02-07  354  		return -EINVAL;
12a9801a7301f1 Nitesh Shetty 2022-02-07  355  =

12a9801a7301f1 Nitesh Shetty 2022-02-07  356  	return 0;
12a9801a7301f1 Nitesh Shetty 2022-02-07  357  }
12a9801a7301f1 Nitesh Shetty 2022-02-07  358  =

a7bb30870db803 Nitesh Shetty 2022-02-07  359  static inline sector_t blk_co=
py_max_range(struct range_entry *rlist, int nr, sector_t *max_len)
a7bb30870db803 Nitesh Shetty 2022-02-07  360  {
a7bb30870db803 Nitesh Shetty 2022-02-07  361  	int i;
a7bb30870db803 Nitesh Shetty 2022-02-07  362  	sector_t len =3D 0;
a7bb30870db803 Nitesh Shetty 2022-02-07  363  =

a7bb30870db803 Nitesh Shetty 2022-02-07  364  	*max_len =3D 0;
a7bb30870db803 Nitesh Shetty 2022-02-07  365  	for (i =3D 0; i < nr; i++) {
a7bb30870db803 Nitesh Shetty 2022-02-07  366  		*max_len =3D max(*max_len, =
rlist[i].len);
a7bb30870db803 Nitesh Shetty 2022-02-07  367  		len +=3D rlist[i].len;
a7bb30870db803 Nitesh Shetty 2022-02-07  368  	}
a7bb30870db803 Nitesh Shetty 2022-02-07  369  =

a7bb30870db803 Nitesh Shetty 2022-02-07  370  	return len;
a7bb30870db803 Nitesh Shetty 2022-02-07  371  }
a7bb30870db803 Nitesh Shetty 2022-02-07  372  =

a7bb30870db803 Nitesh Shetty 2022-02-07  373  /*
a7bb30870db803 Nitesh Shetty 2022-02-07  374   * If native copy offload fea=
ture is absent, this function tries to emulate,
a7bb30870db803 Nitesh Shetty 2022-02-07  375   * by copying data from sourc=
e to a temporary buffer and from buffer to
a7bb30870db803 Nitesh Shetty 2022-02-07  376   * destination device.
a7bb30870db803 Nitesh Shetty 2022-02-07  377   */
a7bb30870db803 Nitesh Shetty 2022-02-07  378  static int blk_copy_emulate(s=
truct block_device *src_bdev, int nr,
a7bb30870db803 Nitesh Shetty 2022-02-07  379  		struct range_entry *rlist, =
struct block_device *dest_bdev, gfp_t gfp_mask)
a7bb30870db803 Nitesh Shetty 2022-02-07  380  {
a7bb30870db803 Nitesh Shetty 2022-02-07  381  	void *buf =3D NULL;
a7bb30870db803 Nitesh Shetty 2022-02-07  382  	int ret, nr_i =3D 0;
a7bb30870db803 Nitesh Shetty 2022-02-07  383  	sector_t src, dst, copy_len,=
 buf_len, read_len, copied_len, max_len =3D 0, remaining =3D 0;
a7bb30870db803 Nitesh Shetty 2022-02-07  384  =

a7bb30870db803 Nitesh Shetty 2022-02-07  385  	copy_len =3D blk_copy_max_ra=
nge(rlist, nr, &max_len);
a7bb30870db803 Nitesh Shetty 2022-02-07  386  	buf =3D blk_alloc_buf(max_le=
n, &buf_len, gfp_mask);
a7bb30870db803 Nitesh Shetty 2022-02-07  387  	if (!buf)
a7bb30870db803 Nitesh Shetty 2022-02-07  388  		return -ENOMEM;
a7bb30870db803 Nitesh Shetty 2022-02-07  389  =

a7bb30870db803 Nitesh Shetty 2022-02-07  390  	for (copied_len =3D 0; copie=
d_len < copy_len; copied_len +=3D read_len) {
a7bb30870db803 Nitesh Shetty 2022-02-07  391  		if (!remaining) {
a7bb30870db803 Nitesh Shetty 2022-02-07  392  			rlist[nr_i].comp_len =3D 0;
a7bb30870db803 Nitesh Shetty 2022-02-07  393  			src =3D rlist[nr_i].src;
a7bb30870db803 Nitesh Shetty 2022-02-07  394  			dst =3D rlist[nr_i].dst;
a7bb30870db803 Nitesh Shetty 2022-02-07  395  			remaining =3D rlist[nr_i++=
].len;
a7bb30870db803 Nitesh Shetty 2022-02-07  396  		}
a7bb30870db803 Nitesh Shetty 2022-02-07  397  =

a7bb30870db803 Nitesh Shetty 2022-02-07  398  		read_len =3D min_t(sector_t=
, remaining, buf_len);
a7bb30870db803 Nitesh Shetty 2022-02-07  399  		ret =3D blk_submit_rw_buf(s=
rc_bdev, buf, read_len, src, REQ_OP_READ, gfp_mask);
a7bb30870db803 Nitesh Shetty 2022-02-07  400  		if (ret)
a7bb30870db803 Nitesh Shetty 2022-02-07  401  			goto out;
a7bb30870db803 Nitesh Shetty 2022-02-07  402  		src +=3D read_len;
a7bb30870db803 Nitesh Shetty 2022-02-07  403  		remaining -=3D read_len;
a7bb30870db803 Nitesh Shetty 2022-02-07  404  		ret =3D blk_submit_rw_buf(d=
est_bdev, buf, read_len, dst, REQ_OP_WRITE,
a7bb30870db803 Nitesh Shetty 2022-02-07  405  				gfp_mask);
a7bb30870db803 Nitesh Shetty 2022-02-07  406  		if (ret)
a7bb30870db803 Nitesh Shetty 2022-02-07  407  			goto out;
a7bb30870db803 Nitesh Shetty 2022-02-07  408  		else
a7bb30870db803 Nitesh Shetty 2022-02-07  409  			rlist[nr_i - 1].comp_len +=
=3D read_len;
a7bb30870db803 Nitesh Shetty 2022-02-07  410  		dst +=3D read_len;
a7bb30870db803 Nitesh Shetty 2022-02-07  411  	}
a7bb30870db803 Nitesh Shetty 2022-02-07  412  out:
a7bb30870db803 Nitesh Shetty 2022-02-07  413  	kvfree(buf);
a7bb30870db803 Nitesh Shetty 2022-02-07 @414  	return ret;
a7bb30870db803 Nitesh Shetty 2022-02-07  415  }
a7bb30870db803 Nitesh Shetty 2022-02-07  416  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3216848878552196252==--

