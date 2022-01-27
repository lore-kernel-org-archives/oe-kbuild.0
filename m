Content-Type: multipart/mixed; boundary="===============7605521359817895201=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/9] Remove bdi_congested() and wb_congested() and related functions
Date: Thu, 27 Jan 2022 22:00:33 +0800
Message-ID: <202201272132.s3GTQRtU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7605521359817895201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <164325158955.29787.4769373293473421057.stgit@noble.brown>
References: <164325158955.29787.4769373293473421057.stgit@noble.brown>
TO: NeilBrown <neilb@suse.de>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jaegeuk Kim <jaegeuk@kernel.org>
TO: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
TO: Jeff Layton <jlayton@kernel.org>
TO: Ilya Dryomov <idryomov@gmail.com>
TO: Miklos Szeredi <miklos@szeredi.hu>
TO: Trond Myklebust <trond.myklebust@hammerspace.com>
TO: Anna Schumaker <anna.schumaker@netapp.com>
TO: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Hi NeilBrown,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on trondmy-nfs/linux-next linus/master hnaz-mm/mas=
ter v5.17-rc1 next-20220127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/NeilBrown/Remove-remaining=
-parts-of-congestions-tracking-code/20220127-105051
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git de=
v-test
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: alpha-randconfig-s031-20220125 (https://download.01.org/0day-ci/arc=
hive/20220127/202201272132.s3GTQRtU-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/4e63f49027815bc4037227b6d=
091210c86009e7a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review NeilBrown/Remove-remaining-parts-o=
f-congestions-tracking-code/20220127-105051
        git checkout 4e63f49027815bc4037227b6d091210c86009e7a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
lpha SHELL=3D/bin/bash fs/nilfs2/

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
--===============7605521359817895201==--

