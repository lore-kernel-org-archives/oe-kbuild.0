Content-Type: multipart/mixed; boundary="===============0715920699357424155=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] Remove bdi_congested() and wb_congested() and related functions
Date: Mon, 13 Dec 2021 22:04:17 +0800
Message-ID: <202112132125.TxGmjdjv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0715920699357424155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
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
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-c007-20211213 (https://download.01.org/0day-ci/ar=
chive/20211213/202112132125.TxGmjdjv-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/41802b6debbde3d5553a8067b=
a2deb2035e6da6e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review NeilBrown/Remove-some-congested-te=
sts/20211213-121653
        git checkout 41802b6debbde3d5553a8067ba2deb2035e6da6e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/lockd/mon.c:280:2: note: Taking false branch
           if (unlikely(new =3D=3D NULL))
           ^
   fs/lockd/mon.c:289:6: note: Assuming the condition is false
           if (rpc_ntop(nsm_addr(new), new->sm_addrbuf,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/lockd/mon.c:289:2: note: Taking false branch
           if (rpc_ntop(nsm_addr(new), new->sm_addrbuf,
           ^
   fs/lockd/mon.c:293:2: note: Null pointer passed as 2nd argument to memor=
y copy function
           memcpy(new->sm_name, hostname, hostname_len);
           ^                    ~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   6 warnings generated.
   drivers/gpio/gpio-pcf857x.c:237:23: warning: Value stored to 'np' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node              *np =3D client->dev.of_node;
                                            ^~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-pcf857x.c:237:23: note: Value stored to 'np' during it=
s initialization is never read
           struct device_node              *np =3D client->dev.of_node;
                                            ^~   ~~~~~~~~~~~~~~~~~~~
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
   8 warnings generated.
   drivers/mfd/sm501.c:513:16: warning: Value stored to 'mode' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long mode =3D smc501_readl(sm->regs + SM501_POWER_MODE_=
CONTROL);
                         ^~~~
   drivers/mfd/sm501.c:513:16: note: Value stored to 'mode' during its init=
ialization is never read
           unsigned long mode =3D smc501_readl(sm->regs + SM501_POWER_MODE_=
CONTROL);
                         ^~~~
   drivers/mfd/sm501.c:514:16: warning: Value stored to 'gate' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long gate =3D smc501_readl(sm->regs + SM501_CURRENT_GAT=
E);
                         ^~~~
   drivers/mfd/sm501.c:514:16: note: Value stored to 'gate' during its init=
ialization is never read
           unsigned long gate =3D smc501_readl(sm->regs + SM501_CURRENT_GAT=
E);
                         ^~~~
   drivers/mfd/sm501.c:515:16: warning: Value stored to 'clock' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long clock =3D smc501_readl(sm->regs + SM501_CURRENT_CL=
OCK);
                         ^~~~~
   drivers/mfd/sm501.c:515:16: note: Value stored to 'clock' during its ini=
tialization is never read
           unsigned long clock =3D smc501_readl(sm->regs + SM501_CURRENT_CL=
OCK);
                         ^~~~~
   Suppressed 5 warnings (5 in non-user code).
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
   7 warnings generated.
>> fs/ext2/ialloc.c:175:2: warning: Value stored to 'bdi' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           bdi =3D inode_to_bdi(inode);
           ^     ~~~~~~~~~~~~~~~~~~~
   fs/ext2/ialloc.c:175:2: note: Value stored to 'bdi' is never read
           bdi =3D inode_to_bdi(inode);
           ^     ~~~~~~~~~~~~~~~~~~~
   fs/ext2/ialloc.c:301:4: warning: Value stored to 'desc' is never read [c=
lang-analyzer-deadcode.DeadStores]
                           desc =3D best_desc;
                           ^      ~~~~~~~~~
   fs/ext2/ialloc.c:301:4: note: Value stored to 'desc' is never read
                           desc =3D best_desc;
                           ^      ~~~~~~~~~
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/regulator/core.c:1109:2: warning: Value stored to 'count' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           count +=3D scnprintf(buf + count, len - count, ", %s",
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/core.c:1109:2: note: Value stored to 'count' is never =
read
           count +=3D scnprintf(buf + count, len - count, ", %s",
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/core.c:3792:3: warning: Value stored to 'possible_uV' =
is never read [clang-analyzer-deadcode.DeadStores]
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
   drivers/regulator/core.c:3792:3: note: Value stored to 'possible_uV' is =
never read
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
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
   7 warnings generated.
   fs/xfs/libxfs/xfs_rmap.c:244:2: warning: 4th function call argument is a=
n uninitialized value [clang-analyzer-core.CallAndMessage]
           xfs_warn(mp,

vim +/bdi +175 fs/ext2/ialloc.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  154  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  155  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  156   * We perform asynchronou=
s prereading of the new inode's inode block when
^1da177e4c3f41 Linus Torvalds    2005-04-16  157   * we create the inode, i=
n the expectation that the inode will be written
^1da177e4c3f41 Linus Torvalds    2005-04-16  158   * back soon.  There are =
two reasons:
^1da177e4c3f41 Linus Torvalds    2005-04-16  159   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  160   * - When creating a larg=
e number of files, the async prereads will be
^1da177e4c3f41 Linus Torvalds    2005-04-16  161   *   nicely merged into l=
arge reads
^1da177e4c3f41 Linus Torvalds    2005-04-16  162   * - When writing out a l=
arge number of inodes, we don't need to keep on
^1da177e4c3f41 Linus Torvalds    2005-04-16  163   *   stalling the writes =
while we read the inode block.
^1da177e4c3f41 Linus Torvalds    2005-04-16  164   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  165   * FIXME: ext2_get_group_=
desc() needs to be simplified.
^1da177e4c3f41 Linus Torvalds    2005-04-16  166   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  167  static void ext2_preread_=
inode(struct inode *inode)
^1da177e4c3f41 Linus Torvalds    2005-04-16  168  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  169  	unsigned long block_grou=
p;
^1da177e4c3f41 Linus Torvalds    2005-04-16  170  	unsigned long offset;
^1da177e4c3f41 Linus Torvalds    2005-04-16  171  	unsigned long block;
^1da177e4c3f41 Linus Torvalds    2005-04-16  172  	struct ext2_group_desc *=
 gdp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  173  	struct backing_dev_info =
*bdi;
^1da177e4c3f41 Linus Torvalds    2005-04-16  174  =

de1414a654e66b Christoph Hellwig 2015-01-14 @175  	bdi =3D inode_to_bdi(ino=
de);
^1da177e4c3f41 Linus Torvalds    2005-04-16  176  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  177  	block_group =3D (inode->=
i_ino - 1) / EXT2_INODES_PER_GROUP(inode->i_sb);
ef2fb67989d30f Eric Sandeen      2007-10-16  178  	gdp =3D ext2_get_group_d=
esc(inode->i_sb, block_group, NULL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  179  	if (gdp =3D=3D NULL)
^1da177e4c3f41 Linus Torvalds    2005-04-16  180  		return;
^1da177e4c3f41 Linus Torvalds    2005-04-16  181  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  182  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  183  	 * Figure out the offset=
 within the block group inode table
^1da177e4c3f41 Linus Torvalds    2005-04-16  184  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  185  	offset =3D ((inode->i_in=
o - 1) % EXT2_INODES_PER_GROUP(inode->i_sb)) *
^1da177e4c3f41 Linus Torvalds    2005-04-16  186  				EXT2_INODE_SIZE(inode=
->i_sb);
^1da177e4c3f41 Linus Torvalds    2005-04-16  187  	block =3D le32_to_cpu(gd=
p->bg_inode_table) +
^1da177e4c3f41 Linus Torvalds    2005-04-16  188  				(offset >> EXT2_BLOCK=
_SIZE_BITS(inode->i_sb));
^1da177e4c3f41 Linus Torvalds    2005-04-16  189  	sb_breadahead(inode->i_s=
b, block);
^1da177e4c3f41 Linus Torvalds    2005-04-16  190  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  191  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0715920699357424155==--

