Content-Type: multipart/mixed; boundary="===============8958981329373809420=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 26/29] fsdax: shift partition offset handling into the file systems
Date: Wed, 01 Dec 2021 13:54:15 +0800
Message-ID: <202112011357.NrO9GwGU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8958981329373809420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211129102203.2243509-27-hch@lst.de>
References: <20211129102203.2243509-27-hch@lst.de>
TO: Christoph Hellwig <hch@lst.de>

Hi Christoph,

I love your patch! Perhaps something to improve:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on device-mapper-dm/for-next linus/master v5.16-rc=
3 next-20211130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christoph-Hellwig/dm-fix-a=
lloc_dax-error-handling-in-alloc_dev/20211129-192158
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007-20211130 (https://download.01.org/0day-ci/ar=
chive/20211201/202112011357.NrO9GwGU-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7f=
a01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b8d137c742fccf6fd794b2a34=
719858b4114c715
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christoph-Hellwig/dm-fix-alloc_dax=
-error-handling-in-alloc_dev/20211129-192158
        git checkout b8d137c742fccf6fd794b2a34719858b4114c715
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_alloc.c:970:10: note: Returning from 'xfs_alloc_get_re=
c'
           error =3D xfs_alloc_get_rec(cur, &bno, &len, &i);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_alloc.c:971:6: note: 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/libxfs/xfs_alloc.c:971:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/libxfs/xfs_alloc.c:975:10: note: Calling 'xfs_alloc_cur_check'
           error =3D xfs_alloc_cur_check(args, acur, cur, &i);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_alloc.c:834:19: note: Assuming field 'bc_btnum' is equ=
al to XFS_BTNUM_BNOi
           bool                    isbnobt =3D cur->bc_btnum =3D=3D XFS_BTN=
UM_BNO;
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_alloc.c:839:6: note: 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/libxfs/xfs_alloc.c:839:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/libxfs/xfs_alloc.c:841:31: note: Assuming 'i' is equal to 1
           if (XFS_IS_CORRUPT(args->mp, i !=3D 1))
                                        ^
   fs/xfs/xfs_linux.h:224:12: note: expanded from macro 'XFS_IS_CORRUPT'
           (unlikely(expr) ? xfs_corruption_error(#expr, XFS_ERRLEVEL_LOW, =
(mp), \
                     ^~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/xfs/libxfs/xfs_alloc.c:841:6: note: '?' condition is false
           if (XFS_IS_CORRUPT(args->mp, i !=3D 1))
               ^
   fs/xfs/xfs_linux.h:224:3: note: expanded from macro 'XFS_IS_CORRUPT'
           (unlikely(expr) ? xfs_corruption_error(#expr, XFS_ERRLEVEL_LOW, =
(mp), \
            ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^
   fs/xfs/libxfs/xfs_alloc.c:841:2: note: Taking false branch
           if (XFS_IS_CORRUPT(args->mp, i !=3D 1))
           ^
   fs/xfs/libxfs/xfs_alloc.c:848:6: note: Assuming 'len' is < field 'minlen'
           if (len < args->minlen) {
               ^~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_alloc.c:848:2: note: Taking true branch
           if (len < args->minlen) {
           ^
   fs/xfs/libxfs/xfs_alloc.c:850:3: note: Control jumps to line 908
                   goto out;
                   ^
   fs/xfs/libxfs/xfs_alloc.c:908:6: note: 'deactivate' is false
           if (deactivate)
               ^~~~~~~~~~
   fs/xfs/libxfs/xfs_alloc.c:908:2: note: Taking false branch
           if (deactivate)
           ^
   fs/xfs/libxfs/xfs_alloc.c:912:2: note: Returning zero, which participate=
s in a condition later
           return 0;
           ^~~~~~~~
   fs/xfs/libxfs/xfs_alloc.c:975:10: note: Returning from 'xfs_alloc_cur_ch=
eck'
           error =3D xfs_alloc_cur_check(args, acur, cur, &i);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_alloc.c:976:6: note: 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/libxfs/xfs_alloc.c:976:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/libxfs/xfs_alloc.c:979:16: note: Assigned value is garbage or und=
efined
           acur->cur_len =3D len;
                         ^ ~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/ext2/dir.c:477:2: warning: Value stored to 'err' is never read [clang=
-analyzer-deadcode.DeadStores]
           err =3D ext2_commit_chunk(page, pos, len);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext2/dir.c:477:2: note: Value stored to 'err' is never read
           err =3D ext2_commit_chunk(page, pos, len);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/ext2/ialloc.c:303:4: warning: Value stored to 'desc' is never read [c=
lang-analyzer-deadcode.DeadStores]
                           desc =3D best_desc;
                           ^      ~~~~~~~~~
   fs/ext2/ialloc.c:303:4: note: Value stored to 'desc' is never read
                           desc =3D best_desc;
                           ^      ~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> fs/ext2/inode.c:809:23: warning: Value stored to 'sbi' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           struct ext2_sb_info *sbi =3D EXT2_SB(inode->i_sb);
                                ^~~   ~~~~~~~~~~~~~~~~~~~~
   fs/ext2/inode.c:809:23: note: Value stored to 'sbi' during its initializ=
ation is never read
           struct ext2_sb_info *sbi =3D EXT2_SB(inode->i_sb);
                                ^~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/ext2/xattr.c:556:3: warning: Value stored to 'end' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   end =3D (char *)header + sb->s_blocksize;
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext2/xattr.c:556:3: note: Value stored to 'end' is never read
                   end =3D (char *)header + sb->s_blocksize;
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   kernel/sched/core.c:5495:16: warning: Value stored to 'preempt_disable_i=
p' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           unsigned long preempt_disable_ip =3D get_preempt_disable_ip(curr=
ent);
                         ^~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/sched/core.c:5495:16: note: Value stored to 'preempt_disable_ip' =
during its initialization is never read
           unsigned long preempt_disable_ip =3D get_preempt_disable_ip(curr=
ent);
                         ^~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/sched/core.c:6253:3: warning: Value stored to 'rq' is never read =
[clang-analyzer-deadcode.DeadStores]
                   rq =3D context_switch(rq, prev, next, &rf);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6253:3: note: Value stored to 'rq' is never read
                   rq =3D context_switch(rq, prev, next, &rf);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:9295:3: warning: Value stored to 'ptr' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   ptr +=3D nr_cpu_ids * sizeof(void **);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:9295:3: note: Value stored to 'ptr' is never read
                   ptr +=3D nr_cpu_ids * sizeof(void **);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/video/backlight/adp8860_bl.c:230:2: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D adp8860_write(client, ADP8860_ISCFR, pdata->led_fade_law=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/adp8860_bl.c:230:2: note: Value stored to 'ret' =
is never read
           ret =3D adp8860_write(client, ADP8860_ISCFR, pdata->led_fade_law=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/sbi +809 fs/ext2/inode.c

a686cd898bd999 Martin J. Bligh     2007-10-16  802  =

25f4e70291a309 Christoph Hellwig   2016-09-19  803  static int ext2_iomap_b=
egin(struct inode *inode, loff_t offset, loff_t length,
c039b997927263 Goldwyn Rodrigues   2019-10-18  804  		unsigned flags, struc=
t iomap *iomap, struct iomap *srcmap)
25f4e70291a309 Christoph Hellwig   2016-09-19  805  {
25f4e70291a309 Christoph Hellwig   2016-09-19  806  	unsigned int blkbits =
=3D inode->i_blkbits;
25f4e70291a309 Christoph Hellwig   2016-09-19  807  	unsigned long first_bl=
ock =3D offset >> blkbits;
25f4e70291a309 Christoph Hellwig   2016-09-19  808  	unsigned long max_bloc=
ks =3D (length + (1 << blkbits) - 1) >> blkbits;
8cf037a8b22f71 Dan Williams        2017-08-30 @809  	struct ext2_sb_info *s=
bi =3D EXT2_SB(inode->i_sb);
25f4e70291a309 Christoph Hellwig   2016-09-19  810  	bool new =3D false, bo=
undary =3D false;
25f4e70291a309 Christoph Hellwig   2016-09-19  811  	u32 bno;
25f4e70291a309 Christoph Hellwig   2016-09-19  812  	int ret;
25f4e70291a309 Christoph Hellwig   2016-09-19  813  =

25f4e70291a309 Christoph Hellwig   2016-09-19  814  	ret =3D ext2_get_block=
s(inode, first_block, max_blocks,
25f4e70291a309 Christoph Hellwig   2016-09-19  815  			&bno, &new, &boundar=
y, flags & IOMAP_WRITE);
25f4e70291a309 Christoph Hellwig   2016-09-19  816  	if (ret < 0)
a686cd898bd999 Martin J. Bligh     2007-10-16  817  		return ret;
a686cd898bd999 Martin J. Bligh     2007-10-16  818  =

25f4e70291a309 Christoph Hellwig   2016-09-19  819  	iomap->flags =3D 0;
d5bfccdf38d094 Christoph Hellwig   2016-10-03  820  	iomap->offset =3D (u64=
)first_block << blkbits;
b8d137c742fccf Christoph Hellwig   2021-11-29  821  	if (flags & IOMAP_DAX)
8cf037a8b22f71 Dan Williams        2017-08-30  822  		iomap->dax_dev =3D sb=
i->s_daxdev;
b8d137c742fccf Christoph Hellwig   2021-11-29  823  	else
b8d137c742fccf Christoph Hellwig   2021-11-29  824  		iomap->bdev =3D inode=
->i_sb->s_bdev;
25f4e70291a309 Christoph Hellwig   2016-09-19  825  =

25f4e70291a309 Christoph Hellwig   2016-09-19  826  	if (ret =3D=3D 0) {
25f4e70291a309 Christoph Hellwig   2016-09-19  827  		iomap->type =3D IOMAP=
_HOLE;
19fe5f643f89f2 Andreas Gruenbacher 2017-10-01  828  		iomap->addr =3D IOMAP=
_NULL_ADDR;
25f4e70291a309 Christoph Hellwig   2016-09-19  829  		iomap->length =3D 1 <=
< blkbits;
25f4e70291a309 Christoph Hellwig   2016-09-19  830  	} else {
25f4e70291a309 Christoph Hellwig   2016-09-19  831  		iomap->type =3D IOMAP=
_MAPPED;
19fe5f643f89f2 Andreas Gruenbacher 2017-10-01  832  		iomap->addr =3D (u64)=
bno << blkbits;
b8d137c742fccf Christoph Hellwig   2021-11-29  833  		if (flags & IOMAP_DAX)
b8d137c742fccf Christoph Hellwig   2021-11-29  834  			iomap->addr +=3D sbi=
->s_dax_part_off;
25f4e70291a309 Christoph Hellwig   2016-09-19  835  		iomap->length =3D (u6=
4)ret << blkbits;
25f4e70291a309 Christoph Hellwig   2016-09-19  836  		iomap->flags |=3D IOM=
AP_F_MERGED;
25f4e70291a309 Christoph Hellwig   2016-09-19  837  	}
25f4e70291a309 Christoph Hellwig   2016-09-19  838  =

25f4e70291a309 Christoph Hellwig   2016-09-19  839  	if (new)
25f4e70291a309 Christoph Hellwig   2016-09-19  840  		iomap->flags |=3D IOM=
AP_F_NEW;
25f4e70291a309 Christoph Hellwig   2016-09-19  841  	return 0;
a686cd898bd999 Martin J. Bligh     2007-10-16  842  }
a686cd898bd999 Martin J. Bligh     2007-10-16  843  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8958981329373809420==--

