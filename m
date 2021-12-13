Content-Type: multipart/mixed; boundary="===============4844146809988210897=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] Remove bdi_congested() and wb_congested() and related functions
Date: Mon, 13 Dec 2021 14:27:18 +0800
Message-ID: <202112131405.VsMiZ1bE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4844146809988210897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <163936886727.23860.5245364396572576756.stgit@noble.brown>
References: <163936886727.23860.5245364396572576756.stgit@noble.brown>
TO: NeilBrown <neilb@suse.de>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mel Gorman <mgorman@suse.de>
TO: Philipp Reisner <philipp.reisner@linbit.com>
TO: Lars Ellenberg <lars.ellenberg@linbit.com>
TO: Jan Kara <jack@suse.com>
TO: Ryusuke Konishi <konishi.ryusuke@gmail.com>
TO: "Darrick J. Wong" <djwong@kernel.org>
CC: linux-xfs(a)vger.kernel.org
CC: linux-ext4(a)vger.kernel.org

Hi NeilBrown,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on hnaz-mm/master]
[also build test WARNING on axboe-block/for-next konis-nilfs2/upstream xfs-=
linux/for-next linus/master v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/NeilBrown/Remove-some-cong=
ested-tests/20211213-121653
base:   https://github.com/hnaz/linux-mm master
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: i386-randconfig-s001-20211213 (https://download.01.org/0day-ci/arch=
ive/20211213/202112131405.VsMiZ1bE-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/41802b6debbde3d5553a8067b=
a2deb2035e6da6e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review NeilBrown/Remove-some-congested-te=
sts/20211213-121653
        git checkout 41802b6debbde3d5553a8067ba2deb2035e6da6e
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash fs/nilfs2/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> fs/nilfs2/segbuf.c:358:2: sparse: sparse: unused label 'failed'

vim +/failed +358 fs/nilfs2/segbuf.c

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

64b5a32e0b3680 Ryusuke Konishi    2009-04-06 @358   failed:
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  359  	wi->bio =3D NULL;
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  360  	return err;
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  361  }
64b5a32e0b3680 Ryusuke Konishi    2009-04-06  362  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4844146809988210897==--

