Content-Type: multipart/mixed; boundary="===============8894242460623373330=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/bio.h:563:35: warning: dereference of NULL '((struct bio_list *)rbio)[8].tail' [CWE-476]
Date: Tue, 14 Jun 2022 11:18:46 +0800
Message-ID: <202206141145.WJlIHlWJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8894242460623373330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/bio.h:563:35: warning: dereference of NULL '((struct bio_lis=
t *)rbio)[8].tail' [CWE-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: David Sterba <dsterba@suse.com>
CC: Qu Wenruo <wqu@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: 385de0ef387dc7f33fc5b828136cbc9516b3ec1a btrfs: use a normal workqu=
eue for rmw_workers
date:   4 weeks ago
:::::: branch date: 28 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-c001-20220613 (https://download.01.org/0day-ci/arch=
ive/20220614/202206141145.WJlIHlWJ-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D385de0ef387dc7f33fc5b828136cbc9516b3ec1a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 385de0ef387dc7f33fc5b828136cbc9516b3ec1a
        # save the config file
         ARCH=3Di386 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from fs/btrfs/raid56.c:8:
   In function 'raid56_alloc_missing_rbio':
>> include/linux/bio.h:563:35: warning: dereference of NULL '((struct bio_l=
ist *)rbio)[8].tail' [CWE-476] [-Wanalyzer-null-dereference]
     563 |                 bl->tail->bi_next =3D bio;
         |                 ~~~~~~~~~~~~~~~~~~^~~~~
     'raid56_alloc_missing_rbio': events 1-2
       |
       |fs/btrfs/raid56.c:2800:1:
       | 2800 | raid56_alloc_missing_rbio(struct bio *bio, struct btrfs_io_=
context *bioc,
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'raid56_alloc_missing_rbio'
       |......
       | 2806 |         rbio =3D alloc_rbio(fs_info, bioc, length);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (2) calling 'alloc_rbio' from 'raid56_alloc_=
missing_rbio'
       |
       +--> 'alloc_rbio': events 3-4
              |
              | 1025 | static struct btrfs_raid_bio *alloc_rbio(struct btrf=
s_fs_info *fs_info,
              |      |                               ^~~~~~~~~~
              |      |                               |
              |      |                               (3) entry to 'alloc_rb=
io'
              |......
              | 1050 |         if (!rbio)
              |      |            ~                   =

              |      |            |
              |      |            (4) following 'false' branch (when 'rbio'=
 is non-NULL)...
              |
            'alloc_rbio': event 5
              |
              |include/linux/bio.h:539:29:
              |  539 |         bl->head =3D bl->tail =3D NULL;
              |
            'alloc_rbio': event 6
              |
              |  539 |         bl->head =3D bl->tail =3D NULL;
              |
            'alloc_rbio': event 7
              |
              |  539 |         bl->head =3D bl->tail =3D NULL;
              |
            'alloc_rbio': event 8
              |
              |  539 |         bl->head =3D bl->tail =3D NULL;
              |
       <------+
       |
     'raid56_alloc_missing_rbio': events 9-11
       |
       |fs/btrfs/raid56.c:2806:16:
       | 2806 |         rbio =3D alloc_rbio(fs_info, bioc, length);
       |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (9) returning to 'raid56_alloc_missing_rbio'=
 from 'alloc_rbio'
       | 2807 |         if (IS_ERR(rbio))
       |      |            ~    =

       |      |            |
       |      |            (10) following 'false' branch...
       |......
       | 2810 |         rbio->operation =3D BTRFS_RBIO_REBUILD_MISSING;
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (11) ...to here
       |
     'raid56_alloc_missing_rbio': events 12-14
       |
       |include/linux/bio.h:562:12:
       |  562 |         if (bl->tail)
       |      |            ^
       |      |            |
       |      |            (12) following 'true' branch...
       |  563 |                 bl->tail->bi_next =3D bio;
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                   |
       |      |                                   (13) ...to here
       |      |                                   (14) dereference of NULL =
'((struct bio_list *)rbio)[8].tail'
       |

vim +563 include/linux/bio.h

8f3d8ba20e6799 Christoph Hellwig 2009-04-07  557  =

8f3d8ba20e6799 Christoph Hellwig 2009-04-07  558  static inline void bio_li=
st_add(struct bio_list *bl, struct bio *bio)
8f3d8ba20e6799 Christoph Hellwig 2009-04-07  559  {
8f3d8ba20e6799 Christoph Hellwig 2009-04-07  560  	bio->bi_next =3D NULL;
8f3d8ba20e6799 Christoph Hellwig 2009-04-07  561  =

8f3d8ba20e6799 Christoph Hellwig 2009-04-07  562  	if (bl->tail)
8f3d8ba20e6799 Christoph Hellwig 2009-04-07 @563  		bl->tail->bi_next =3D b=
io;
8f3d8ba20e6799 Christoph Hellwig 2009-04-07  564  	else
8f3d8ba20e6799 Christoph Hellwig 2009-04-07  565  		bl->head =3D bio;
8f3d8ba20e6799 Christoph Hellwig 2009-04-07  566  =

8f3d8ba20e6799 Christoph Hellwig 2009-04-07  567  	bl->tail =3D bio;
8f3d8ba20e6799 Christoph Hellwig 2009-04-07  568  }
8f3d8ba20e6799 Christoph Hellwig 2009-04-07  569  =


:::::: The code at line 563 was first introduced by commit
:::::: 8f3d8ba20e67991b531e9c0227dcd1f99271a32c block: move bio list helper=
s into bio.h

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <jens.axboe@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8894242460623373330==--

