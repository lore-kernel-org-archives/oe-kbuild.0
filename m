Content-Type: multipart/mixed; boundary="===============7278884400690489257=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 02/10] block: Add copy offload support infrastructure
Date: Fri, 29 Apr 2022 14:19:43 +0800
Message-ID: <202204291444.zrsLaPvc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7278884400690489257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220426101241.30100-3-nj.shetty@samsung.com>
References: <20220426101241.30100-3-nj.shetty@samsung.com>
TO: Nitesh Shetty <nj.shetty@samsung.com>
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
CC: hare(a)suse.de
CC: kbusch(a)kernel.org
CC: hch(a)lst.de
CC: Frederick.Knight(a)netapp.com
CC: osandov(a)fb.com
CC: lsf-pc(a)lists.linux-foundation.org
CC: djwong(a)kernel.org
CC: josef(a)toxicpanda.com
CC: clm(a)fb.com
CC: dsterba(a)suse.com
CC: tytso(a)mit.edu
CC: jack(a)suse.com
CC: nitheshshetty(a)gmail.com
CC: gost.dev(a)samsung.com
CC: Nitesh Shetty <nj.shetty@samsung.com>
CC: Arnav Dawn <arnav.dawn@samsung.com>
CC: Alasdair Kergon <agk@redhat.com>
CC: Mike Snitzer <snitzer@kernel.org>
CC: Sagi Grimberg <sagi@grimberg.me>
CC: James Smart <james.smart@broadcom.com>

Hi Nitesh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220422]
[cannot apply to axboe-block/for-next device-mapper-dm/for-next linus/maste=
r v5.18-rc4 v5.18-rc3 v5.18-rc2 v5.18-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Nitesh-Shetty/block-=
Introduce-queue-limits-for-copy-offload-support/20220426-201825
base:    e7d6987e09a328d4a949701db40ef63fbb970670
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 3e91cba65ef73ba116953031d5548da7fd33a150
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> block/blk-lib.c:341:6: warning: Redundant initialization for 'ret'. The =
initialized value is overwritten before it is read. [redundantInitializatio=
n]
    ret =3D blk_copy_sanity_check(src_bdev, dest_bdev, rlist, nr);
        ^
   block/blk-lib.c:327:10: note: ret is initialized
    int ret =3D -EINVAL;
            ^
   block/blk-lib.c:341:6: note: ret is overwritten
    ret =3D blk_copy_sanity_check(src_bdev, dest_bdev, rlist, nr);
        ^

vim +/ret +341 block/blk-lib.c

3e91cba65ef73b Nitesh Shetty 2022-04-26  309  =

3e91cba65ef73b Nitesh Shetty 2022-04-26  310  /*
3e91cba65ef73b Nitesh Shetty 2022-04-26  311   * blkdev_issue_copy - queue =
a copy
3e91cba65ef73b Nitesh Shetty 2022-04-26  312   * @src_bdev:	source block de=
vice
3e91cba65ef73b Nitesh Shetty 2022-04-26  313   * @nr_srcs:	number of source=
 ranges to copy
3e91cba65ef73b Nitesh Shetty 2022-04-26  314   * @rlist:	array of source/de=
st/len
3e91cba65ef73b Nitesh Shetty 2022-04-26  315   * @dest_bdev:	destination bl=
ock device
3e91cba65ef73b Nitesh Shetty 2022-04-26  316   * @gfp_mask:   memory alloca=
tion flags (for bio_alloc)
3e91cba65ef73b Nitesh Shetty 2022-04-26  317   *
3e91cba65ef73b Nitesh Shetty 2022-04-26  318   * Description:
3e91cba65ef73b Nitesh Shetty 2022-04-26  319   *	Copy source ranges from so=
urce block device to destination block device.
3e91cba65ef73b Nitesh Shetty 2022-04-26  320   *	length of a source range c=
annot be zero.
3e91cba65ef73b Nitesh Shetty 2022-04-26  321   */
3e91cba65ef73b Nitesh Shetty 2022-04-26  322  int blkdev_issue_copy(struct =
block_device *src_bdev, int nr,
3e91cba65ef73b Nitesh Shetty 2022-04-26  323  		struct range_entry *rlist, =
struct block_device *dest_bdev, gfp_t gfp_mask)
3e91cba65ef73b Nitesh Shetty 2022-04-26  324  {
3e91cba65ef73b Nitesh Shetty 2022-04-26  325  	struct request_queue *src_q =
=3D bdev_get_queue(src_bdev);
3e91cba65ef73b Nitesh Shetty 2022-04-26  326  	struct request_queue *dest_q=
 =3D bdev_get_queue(dest_bdev);
3e91cba65ef73b Nitesh Shetty 2022-04-26  327  	int ret =3D -EINVAL;
3e91cba65ef73b Nitesh Shetty 2022-04-26  328  =

3e91cba65ef73b Nitesh Shetty 2022-04-26  329  	if (!src_q || !dest_q)
3e91cba65ef73b Nitesh Shetty 2022-04-26  330  		return -ENXIO;
3e91cba65ef73b Nitesh Shetty 2022-04-26  331  =

3e91cba65ef73b Nitesh Shetty 2022-04-26  332  	if (!nr)
3e91cba65ef73b Nitesh Shetty 2022-04-26  333  		return -EINVAL;
3e91cba65ef73b Nitesh Shetty 2022-04-26  334  =

3e91cba65ef73b Nitesh Shetty 2022-04-26  335  	if (nr >=3D MAX_COPY_NR_RANG=
E)
3e91cba65ef73b Nitesh Shetty 2022-04-26  336  		return -EINVAL;
3e91cba65ef73b Nitesh Shetty 2022-04-26  337  =

3e91cba65ef73b Nitesh Shetty 2022-04-26  338  	if (bdev_read_only(dest_bdev=
))
3e91cba65ef73b Nitesh Shetty 2022-04-26  339  		return -EPERM;
3e91cba65ef73b Nitesh Shetty 2022-04-26  340  =

3e91cba65ef73b Nitesh Shetty 2022-04-26 @341  	ret =3D blk_copy_sanity_chec=
k(src_bdev, dest_bdev, rlist, nr);
3e91cba65ef73b Nitesh Shetty 2022-04-26  342  	if (ret)
3e91cba65ef73b Nitesh Shetty 2022-04-26  343  		return ret;
3e91cba65ef73b Nitesh Shetty 2022-04-26  344  =

3e91cba65ef73b Nitesh Shetty 2022-04-26  345  	if (blk_check_copy_offload(s=
rc_q, dest_q))
3e91cba65ef73b Nitesh Shetty 2022-04-26  346  		ret =3D blk_copy_offload(sr=
c_bdev, nr, rlist, dest_bdev, gfp_mask);
3e91cba65ef73b Nitesh Shetty 2022-04-26  347  =

3e91cba65ef73b Nitesh Shetty 2022-04-26  348  	return ret;
3e91cba65ef73b Nitesh Shetty 2022-04-26  349  }
3e91cba65ef73b Nitesh Shetty 2022-04-26  350  EXPORT_SYMBOL_GPL(blkdev_issu=
e_copy);
3e91cba65ef73b Nitesh Shetty 2022-04-26  351  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7278884400690489257==--

