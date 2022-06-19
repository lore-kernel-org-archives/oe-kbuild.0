Content-Type: multipart/mixed; boundary="===============6977709638775094893=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/affs/affs.h:21:58: warning: dereference of NULL 'ext_bh' [CWE-476]
Date: Sun, 19 Jun 2022 16:19:08 +0800
Message-ID: <202206191658.qe1P4E5N-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6977709638775094893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 fs/affs/affs.h:21:58: warning: dereference of NULL 'ext_bh' [CWE-476] [-Wa=
nalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: cf3ee3c8c29dc349b2cf52e5e72e8cb805ff5e57 locking/atomic: add generi=
c arch_*() bitops
date:   11 months ago
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220613 (https://download.01.org/0day-ci/archi=
ve/20220619/202206191658.qe1P4E5N-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcf3ee3c8c29dc349b2cf52e5e72e8cb805ff5e57
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cf3ee3c8c29dc349b2cf52e5e72e8cb805ff5e57
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/little_endian.h:13,
                    from include/linux/byteorder/little_endian.h:5,
                    from arch/arm/include/uapi/asm/byteorder.h:22,
                    from include/asm-generic/bitops/le.h:7,
                    from arch/arm/include/asm/bitops.h:268,
                    from include/linux/bitops.h:32,
                    from include/linux/kernel.h:12,
                    from include/linux/uio.h:8,
                    from fs/affs/file.c:16:
   fs/affs/file.c: In function 'affs_truncate':
>> fs/affs/affs.h:21:58: warning: dereference of NULL 'ext_bh' [CWE-476] [-=
Wanalyzer-null-dereference]
      21 | #define AFFS_HEAD(bh)           ((struct affs_head *)(bh)->b_dat=
a)
         |                                                      ~~~~^~~~~~~~
   include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:95:21: note: in expansion of macro '__=
be32_to_cpu'
      95 | #define be32_to_cpu __be32_to_cpu
         |                     ^~~~~~~~~~~~~
   fs/affs/affs.h:19:42: note: in expansion of macro 'AFFS_HEAD'
      19 | #define AFFS_BLOCK(sb, bh, blk)         (AFFS_HEAD(bh)->table[AF=
FS_SB(sb)->s_hashsize-1-(blk)])
         |                                          ^~~~~~~~~
   fs/affs/file.c:970:57: note: in expansion of macro 'AFFS_BLOCK'
     970 |                         affs_free_block(sb, be32_to_cpu(AFFS_BLO=
CK(sb, ext_bh, i)));
         |                                                         ^~~~~~~~=
~~
     'affs_file_release.part.0': events 1-4
       |
       |   32 | affs_file_release(struct inode *inode, struct file *filp)
       |      | ^~~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'affs_file_release.part.0'
       |......
       |   39 |                 if (inode->i_size !=3D AFFS_I(inode)->mmu_p=
rivate)
       |      |                    ~
       |      |                    |
       |      |                    (2) following 'true' branch...
       |   40 |                         affs_truncate(inode);
       |      |                         ~~~~~~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (3) ...to here
       |      |                         (4) calling 'affs_truncate' from 'a=
ffs_file_release.part.0'
       |
       +--> 'affs_truncate': events 5-14
              |
              |  860 | affs_truncate(struct inode *inode)
              |      | ^~~~~~~~~~~~~
              |      | |
              |      | (5) entry to 'affs_truncate'
              |......
              |  879 |         if (inode->i_size > AFFS_I(inode)->mmu_priva=
te) {
              |      |            ~
              |      |            |
              |      |            (6) following 'false' branch...
              |......
              |  893 |         } else if (inode->i_size =3D=3D AFFS_I(inode=
)->mmu_private)
              |      |                   ~
              |      |                   |
              |      |                   (7) ...to here
              |      |                   (8) following 'false' branch...
              |......
              |  897 |         ext_bh =3D affs_get_extblock(inode, ext);
              |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                  |
              |      |                  (9) ...to here
              |  898 |         if (IS_ERR(ext_bh)) {
              |      |            ~
              |      |            |
              |      |            (10) following 'false' branch...
              |......
              |  904 |         if (AFFS_I(inode)->i_lc) {
              |      |             ~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (11) ...to here
              |......
              |  964 |         while (ext_key) {
              |      |                ~~~~~~~
              |      |                |
              |      |                (12) following 'true' branch (when 'e=
xt_key !=3D 0')...
              |  965 |                 ext_bh =3D affs_bread(sb, ext_key);
              |      |                          ~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (13) ...to here
              |      |                          (14) calling 'affs_bread' f=
rom 'affs_truncate'
              |
              +--> 'affs_bread': events 15-16
                     |
                     |fs/affs/affs.h:235:1:
                     |  235 | affs_bread(struct super_block *sb, int block)
                     |      | ^~~~~~~~~~
                     |      | |
                     |      | (15) entry to 'affs_bread'
                     |......
                     |  238 |         if (affs_validblock(sb, block))
                     |      |            ~
                     |      |            |
                     |      |            (16) following 'false' branch...
                     |
                   'affs_bread': event 17
                     |
                     |cc1:
                     | (17): ...to here
                     |
              <------+
              |
            'affs_truncate': events 18-19
              |
              |fs/affs/file.c:965:26:
              |  965 |                 ext_bh =3D affs_bread(sb, ext_key);
              |      |                          ^~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (18) return of NULL to 'aff=
s_truncate' from 'affs_bread'

vim +/ext_bh +21 fs/affs/affs.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  20  =

^1da177e4c3f41 Linus Torvalds 2005-04-16 @21  #define AFFS_HEAD(bh)		((stru=
ct affs_head *)(bh)->b_data)
^1da177e4c3f41 Linus Torvalds 2005-04-16  22  #define AFFS_TAIL(sb, bh)	((s=
truct affs_tail *)((bh)->b_data+(sb)->s_blocksize-sizeof(struct affs_tail)))
^1da177e4c3f41 Linus Torvalds 2005-04-16  23  #define AFFS_ROOT_HEAD(bh)	((=
struct affs_root_head *)(bh)->b_data)
^1da177e4c3f41 Linus Torvalds 2005-04-16  24  #define AFFS_ROOT_TAIL(sb, bh=
)	((struct affs_root_tail *)((bh)->b_data+(sb)->s_blocksize-sizeof(struct a=
ffs_root_tail)))
^1da177e4c3f41 Linus Torvalds 2005-04-16  25  #define AFFS_DATA_HEAD(bh)	((=
struct affs_data_head *)(bh)->b_data)
^1da177e4c3f41 Linus Torvalds 2005-04-16  26  #define AFFS_DATA(bh)		(((str=
uct affs_data_head *)(bh)->b_data)->data)
^1da177e4c3f41 Linus Torvalds 2005-04-16  27  =


:::::: The code at line 21 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6977709638775094893==--

