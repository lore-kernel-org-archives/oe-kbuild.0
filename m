Content-Type: multipart/mixed; boundary="===============3244596331472915927=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 03/10] block: Add copy offload support infrastructure
Date: Thu, 10 Feb 2022 12:55:16 +0800
Message-ID: <202202101218.emnsHbhh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3244596331472915927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220207141348.4235-4-nj.shetty@samsung.com>
References: <20220207141348.4235-4-nj.shetty@samsung.com>
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
CC: SelvaKumar S <selvakuma.s1@samsung.com>

Hi Nitesh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on next-20220209]
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
ive/20220210/202202101218.emnsHbhh-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
block/blk-lib.c:272 blk_copy_offload() warn: possible memory leak of 'ctx'

vim +/ctx +272 block/blk-lib.c

12a9801a7301f1 Nitesh Shetty 2022-02-07  180  =

12a9801a7301f1 Nitesh Shetty 2022-02-07  181  /*
12a9801a7301f1 Nitesh Shetty 2022-02-07  182   * blk_copy_offload	- Use dev=
ice's native copy offload feature
12a9801a7301f1 Nitesh Shetty 2022-02-07  183   * Go through user provide pa=
yload, prepare new payload based on device's copy offload limits.
12a9801a7301f1 Nitesh Shetty 2022-02-07  184   */
12a9801a7301f1 Nitesh Shetty 2022-02-07  185  int blk_copy_offload(struct b=
lock_device *src_bdev, int nr_srcs,
12a9801a7301f1 Nitesh Shetty 2022-02-07  186  		struct range_entry *rlist, =
struct block_device *dst_bdev, gfp_t gfp_mask)
12a9801a7301f1 Nitesh Shetty 2022-02-07  187  {
12a9801a7301f1 Nitesh Shetty 2022-02-07  188  	struct request_queue *sq =3D=
 bdev_get_queue(src_bdev);
12a9801a7301f1 Nitesh Shetty 2022-02-07  189  	struct request_queue *dq =3D=
 bdev_get_queue(dst_bdev);
12a9801a7301f1 Nitesh Shetty 2022-02-07  190  	struct bio *read_bio, *write=
_bio;
12a9801a7301f1 Nitesh Shetty 2022-02-07  191  	struct copy_ctx *ctx;
12a9801a7301f1 Nitesh Shetty 2022-02-07  192  	struct cio *cio;
12a9801a7301f1 Nitesh Shetty 2022-02-07  193  	struct page *token;
12a9801a7301f1 Nitesh Shetty 2022-02-07  194  	sector_t src_blk, copy_len, =
dst_blk;
12a9801a7301f1 Nitesh Shetty 2022-02-07  195  	sector_t remaining, max_copy=
_len =3D LONG_MAX;
12a9801a7301f1 Nitesh Shetty 2022-02-07  196  	int ri =3D 0, ret =3D 0;
12a9801a7301f1 Nitesh Shetty 2022-02-07  197  =

12a9801a7301f1 Nitesh Shetty 2022-02-07  198  	cio =3D kzalloc(sizeof(struc=
t cio), GFP_KERNEL);
12a9801a7301f1 Nitesh Shetty 2022-02-07  199  	if (!cio)
12a9801a7301f1 Nitesh Shetty 2022-02-07  200  		return -ENOMEM;
12a9801a7301f1 Nitesh Shetty 2022-02-07  201  	atomic_set(&cio->refcount, 0=
);
12a9801a7301f1 Nitesh Shetty 2022-02-07  202  	cio->rlist =3D rlist;
12a9801a7301f1 Nitesh Shetty 2022-02-07  203  =

12a9801a7301f1 Nitesh Shetty 2022-02-07  204  	max_copy_len =3D min3(max_co=
py_len, (sector_t)sq->limits.max_copy_sectors,
12a9801a7301f1 Nitesh Shetty 2022-02-07  205  			(sector_t)dq->limits.max_c=
opy_sectors);
12a9801a7301f1 Nitesh Shetty 2022-02-07  206  	max_copy_len =3D min3(max_co=
py_len, (sector_t)sq->limits.max_copy_range_sectors,
12a9801a7301f1 Nitesh Shetty 2022-02-07  207  			(sector_t)dq->limits.max_c=
opy_range_sectors) << SECTOR_SHIFT;
12a9801a7301f1 Nitesh Shetty 2022-02-07  208  =

12a9801a7301f1 Nitesh Shetty 2022-02-07  209  	for (ri =3D 0; ri < nr_srcs;=
 ri++) {
12a9801a7301f1 Nitesh Shetty 2022-02-07  210  		cio->rlist[ri].comp_len =3D=
 rlist[ri].len;
12a9801a7301f1 Nitesh Shetty 2022-02-07  211  		for (remaining =3D rlist[ri=
].len, src_blk =3D rlist[ri].src, dst_blk =3D rlist[ri].dst;
12a9801a7301f1 Nitesh Shetty 2022-02-07  212  			remaining > 0;
12a9801a7301f1 Nitesh Shetty 2022-02-07  213  			remaining -=3D copy_len, s=
rc_blk +=3D copy_len, dst_blk +=3D copy_len) {
12a9801a7301f1 Nitesh Shetty 2022-02-07  214  			copy_len =3D min(remaining=
, max_copy_len);
12a9801a7301f1 Nitesh Shetty 2022-02-07  215  =

12a9801a7301f1 Nitesh Shetty 2022-02-07  216  			token =3D alloc_page(gfp_m=
ask);
12a9801a7301f1 Nitesh Shetty 2022-02-07  217  			if (unlikely(!token)) {
12a9801a7301f1 Nitesh Shetty 2022-02-07  218  				ret =3D -ENOMEM;
12a9801a7301f1 Nitesh Shetty 2022-02-07  219  				goto err_token;
12a9801a7301f1 Nitesh Shetty 2022-02-07  220  			}
12a9801a7301f1 Nitesh Shetty 2022-02-07  221  =

12a9801a7301f1 Nitesh Shetty 2022-02-07  222  			read_bio =3D bio_alloc(src=
_bdev, 1, REQ_OP_READ | REQ_COPY | REQ_NOMERGE,
12a9801a7301f1 Nitesh Shetty 2022-02-07  223  					gfp_mask);
12a9801a7301f1 Nitesh Shetty 2022-02-07  224  			if (!read_bio) {
12a9801a7301f1 Nitesh Shetty 2022-02-07  225  				ret =3D -ENOMEM;
12a9801a7301f1 Nitesh Shetty 2022-02-07  226  				goto err_read_bio;
12a9801a7301f1 Nitesh Shetty 2022-02-07  227  			}
12a9801a7301f1 Nitesh Shetty 2022-02-07  228  			read_bio->bi_iter.bi_secto=
r =3D src_blk >> SECTOR_SHIFT;
12a9801a7301f1 Nitesh Shetty 2022-02-07  229  			read_bio->bi_iter.bi_size =
=3D copy_len;
12a9801a7301f1 Nitesh Shetty 2022-02-07  230  			__bio_add_page(read_bio, t=
oken, PAGE_SIZE, 0);
12a9801a7301f1 Nitesh Shetty 2022-02-07  231  			ret =3D submit_bio_wait(re=
ad_bio);
12a9801a7301f1 Nitesh Shetty 2022-02-07  232  			if (ret) {
12a9801a7301f1 Nitesh Shetty 2022-02-07  233  				bio_put(read_bio);
12a9801a7301f1 Nitesh Shetty 2022-02-07  234  				goto err_read_bio;
12a9801a7301f1 Nitesh Shetty 2022-02-07  235  			}
12a9801a7301f1 Nitesh Shetty 2022-02-07  236  			bio_put(read_bio);
12a9801a7301f1 Nitesh Shetty 2022-02-07  237  			ctx =3D kzalloc(sizeof(str=
uct copy_ctx), gfp_mask);
12a9801a7301f1 Nitesh Shetty 2022-02-07  238  			if (!ctx) {
12a9801a7301f1 Nitesh Shetty 2022-02-07  239  				ret =3D -ENOMEM;
12a9801a7301f1 Nitesh Shetty 2022-02-07  240  				goto err_read_bio;
12a9801a7301f1 Nitesh Shetty 2022-02-07  241  			}
12a9801a7301f1 Nitesh Shetty 2022-02-07  242  			ctx->cio =3D cio;
12a9801a7301f1 Nitesh Shetty 2022-02-07  243  			ctx->range_idx =3D ri;
12a9801a7301f1 Nitesh Shetty 2022-02-07  244  			ctx->start_sec =3D rlist[r=
i].src;
12a9801a7301f1 Nitesh Shetty 2022-02-07  245  =

12a9801a7301f1 Nitesh Shetty 2022-02-07  246  			write_bio =3D bio_alloc(ds=
t_bdev, 1, REQ_OP_WRITE | REQ_COPY | REQ_NOMERGE,
12a9801a7301f1 Nitesh Shetty 2022-02-07  247  					gfp_mask);
12a9801a7301f1 Nitesh Shetty 2022-02-07  248  			if (!write_bio) {
12a9801a7301f1 Nitesh Shetty 2022-02-07  249  				ret =3D -ENOMEM;
12a9801a7301f1 Nitesh Shetty 2022-02-07  250  				goto err_read_bio;
12a9801a7301f1 Nitesh Shetty 2022-02-07  251  			}
12a9801a7301f1 Nitesh Shetty 2022-02-07  252  =

12a9801a7301f1 Nitesh Shetty 2022-02-07  253  			write_bio->bi_iter.bi_sect=
or =3D dst_blk >> SECTOR_SHIFT;
12a9801a7301f1 Nitesh Shetty 2022-02-07  254  			write_bio->bi_iter.bi_size=
 =3D copy_len;
12a9801a7301f1 Nitesh Shetty 2022-02-07  255  			__bio_add_page(write_bio, =
token, PAGE_SIZE, 0);
12a9801a7301f1 Nitesh Shetty 2022-02-07  256  			write_bio->bi_end_io =3D b=
io_copy_end_io;
12a9801a7301f1 Nitesh Shetty 2022-02-07  257  			write_bio->bi_private =3D =
ctx;
12a9801a7301f1 Nitesh Shetty 2022-02-07  258  			atomic_inc(&cio->refcount);
12a9801a7301f1 Nitesh Shetty 2022-02-07  259  			submit_bio(write_bio);
12a9801a7301f1 Nitesh Shetty 2022-02-07  260  		}
12a9801a7301f1 Nitesh Shetty 2022-02-07  261  	}
12a9801a7301f1 Nitesh Shetty 2022-02-07  262  =

12a9801a7301f1 Nitesh Shetty 2022-02-07  263  	/* Wait for completion of al=
l IO's*/
12a9801a7301f1 Nitesh Shetty 2022-02-07  264  	return cio_await_completion(=
cio);
12a9801a7301f1 Nitesh Shetty 2022-02-07  265  =

12a9801a7301f1 Nitesh Shetty 2022-02-07  266  err_read_bio:
12a9801a7301f1 Nitesh Shetty 2022-02-07  267  	__free_page(token);
12a9801a7301f1 Nitesh Shetty 2022-02-07  268  err_token:
12a9801a7301f1 Nitesh Shetty 2022-02-07  269  	rlist[ri].comp_len =3D min_t=
(sector_t, rlist[ri].comp_len, (rlist[ri].len - remaining));
12a9801a7301f1 Nitesh Shetty 2022-02-07  270  =

12a9801a7301f1 Nitesh Shetty 2022-02-07  271  	cio->io_err =3D ret;
12a9801a7301f1 Nitesh Shetty 2022-02-07 @272  	return cio_await_completion(=
cio);
12a9801a7301f1 Nitesh Shetty 2022-02-07  273  }
12a9801a7301f1 Nitesh Shetty 2022-02-07  274  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3244596331472915927==--

