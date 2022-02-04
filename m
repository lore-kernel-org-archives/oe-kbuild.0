Content-Type: multipart/mixed; boundary="===============8681197152542417221=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3382/3941] fs/nilfs2/segbuf.c:358 nilfs_segbuf_submit_bio() warn: ignoring unreachable code.
Date: Fri, 04 Feb 2022 09:30:10 +0800
Message-ID: <202202040524.emaVEveV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8681197152542417221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   2d3d8c7643a56bfe2e808f97d5a4360d49f3b45b
commit: 457432443d41104c22b07af9b1db0175e7ab04b7 [3382/3941] remove-bdi_con=
gested-and-wb_congested-and-related-functions-fix
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: nios2-randconfig-m031-20220130 (https://download.01.org/0day-ci/arc=
hive/20220204/202202040524.emaVEveV-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/nilfs2/segbuf.c:358 nilfs_segbuf_submit_bio() warn: ignoring unreachable=
 code.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:71 current_thread_info() error: uninit=
ialized symbol 'sp'.

vim +358 fs/nilfs2/segbuf.c

64b5a32e0b3680 Ryusuke Konishi    2009-04-06  338  =

9284ad2a9016ad Ryusuke Konishi    2009-11-25  339  static int nilfs_segbuf_=
submit_bio(struct nilfs_segment_buffer *segbuf,
b2d4586627ad26 Mike Christie      2016-06-05  340  				   struct nilfs_writ=
e_info *wi, int mode,
b2d4586627ad26 Mike Christie      2016-06-05  341  				   int mode_flags)
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  342  {
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  343  	struct bio *bio =3D wi-=
>bio;
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  344  	int err;
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  345  =

64b5a32e0b3680 Ryusuke Konishi    2009-04-06  346  	bio->bi_end_io =3D nilf=
s_end_bio_write;
9284ad2a9016ad Ryusuke Konishi    2009-11-25  347  	bio->bi_private =3D seg=
buf;
b2d4586627ad26 Mike Christie      2016-06-05  348  	bio_set_op_attrs(bio, m=
ode, mode_flags);
4e49ea4a3d2763 Mike Christie      2016-06-05  349  	submit_bio(bio);
4bf93b50fd0411 Vyacheslav Dubeyko 2013-08-22  350  	segbuf->sb_nbio++;
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  351  =

64b5a32e0b3680 Ryusuke Konishi    2009-04-06  352  	wi->bio =3D NULL;
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  353  	wi->rest_blocks -=3D wi=
->end - wi->start;
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  354  	wi->nr_vecs =3D min(wi-=
>max_pages, wi->rest_blocks);
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  355  	wi->start =3D wi->end;
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  356  	return 0;
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  357  =

64b5a32e0b3680 Ryusuke Konishi    2009-04-06 @358  	wi->bio =3D NULL;
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  359  	return err;
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  360  }
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  361  =


:::::: The code at line 358 was first introduced by commit
:::::: 64b5a32e0b3680a9655b3f2e668a646068e71d33 nilfs2: segment buffer

:::::: TO: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8681197152542417221==--

