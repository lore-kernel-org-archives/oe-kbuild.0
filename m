Content-Type: multipart/mixed; boundary="===============4716827189075304203=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kdave-btrfs-devel:misc-next 125/154] fs/btrfs/disk-io.c:3326:3: warning: Value stored to 'features' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 28 Aug 2021 06:44:10 +0800
Message-ID: <202108280656.K9obhdMM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4716827189075304203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Anand Jain <anand.jain@oracle.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   18f0c5bda0dd67dedb8df3d7faf856dffa8f78d3
commit: 6ed27ecf7912ba7da71e997d894a941f11d51001 [125/154] btrfs: fix upper=
 limit for max_inline for page size 64K
:::::: branch date: 6 hours ago
:::::: commit date: 29 hours ago
config: riscv-randconfig-c006-20210827 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 107608=
2a0d97bd5c16a25ee7cf3dbb6ee4b5a9fe)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/kdave/btrfs-devel/commit/6ed27ecf7912ba7da71e9=
97d894a941f11d51001
        git remote add kdave-btrfs-devel https://github.com/kdave/btrfs-dev=
el.git
        git fetch --no-tags kdave-btrfs-devel misc-next
        git checkout 6ed27ecf7912ba7da71e997d894a941f11d51001
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/power/supply/twl4030_charger.c:364:2: warning: Value stored to '=
cur_reg' is never read [clang-analyzer-deadcode.DeadStores]
           cur_reg |=3D oldreg << 8;
           ^          ~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:364:2: note: Value stored to 'cur=
_reg' is never read
           cur_reg |=3D oldreg << 8;
           ^          ~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:383:3: warning: Value stored to '=
status' is never read [clang-analyzer-deadcode.DeadStores]
                   status =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:383:3: note: Value stored to 'sta=
tus' is never read
                   status =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:467:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl4030_clear_set_boot_bci(0, TWL4030_BC=
IAUTOUSB);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/power/supply/twl4030_charger.c:467:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl4030_clear_set_boot_bci(0, TWL4030_BC=
IAUTOUSB);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/power/supply/twl4030_charger.c:487:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x33,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:487:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x33,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:490:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x2a,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:490:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x2a,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:493:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x26,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:493:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x26,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:496:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0xf3,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:496:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0xf3,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:499:4: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x9c,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/power/supply/twl4030_charger.c:499:4: note: Value stored to 'ret=
' is never read
                           ret =3D twl_i2c_write_u8(TWL_MODULE_MAIN_CHARGE,=
 0x9c,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> fs/btrfs/disk-io.c:3326:3: warning: Value stored to 'features' is never =
read [clang-analyzer-deadcode.DeadStores]
                   features |=3D BTRFS_FEATURE_INCOMPAT_BIG_METADATA;
                   ^
   fs/btrfs/disk-io.c:3326:3: note: Value stored to 'features' is never read
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   fs/btrfs/inode.c:5058:3: warning: Value stored to 'ret' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   ret =3D btrfs_readpage(NULL, page);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:5058:3: note: Value stored to 'ret' is never read
                   ret =3D btrfs_readpage(NULL, page);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:5976:20: warning: The left operand of '=3D=3D' is a gar=
bage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (location.type =3D=3D BTRFS_INODE_ITEM_KEY) {
                             ^
   fs/btrfs/inode.c:6042:24: note: Calling 'btrfs_lookup_dentry'
           struct inode *inode =3D btrfs_lookup_dentry(dir, dentry);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:5969:6: note: Assuming field 'len' is <=3D BTRFS_NAME_L=
EN
           if (dentry->d_name.len > BTRFS_NAME_LEN)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:5969:2: note: Taking false branch
           if (dentry->d_name.len > BTRFS_NAME_LEN)
           ^
   fs/btrfs/inode.c:5972:8: note: Calling 'btrfs_inode_by_name'
           ret =3D btrfs_inode_by_name(dir, dentry, &location, &di_type);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:5679:6: note: Assuming 'path' is non-null
           if (!path)
               ^~~~~
   fs/btrfs/inode.c:5679:2: note: Taking false branch
           if (!path)
           ^
   fs/btrfs/inode.c:5684:2: note: Taking true branch
           if (IS_ERR_OR_NULL(di)) {
           ^
   fs/btrfs/inode.c:5685:9: note: 'di' is non-null
                   ret =3D di ? PTR_ERR(di) : -ENOENT;
                         ^~
   fs/btrfs/inode.c:5685:9: note: '?' condition is true
   fs/btrfs/inode.c:5686:3: note: Control jumps to line 5701
                   goto out;
                   ^
   fs/btrfs/inode.c:5702:2: note: Returning without writing to 'location->t=
ype'
           return ret;
           ^
   fs/btrfs/inode.c:5972:8: note: Returning from 'btrfs_inode_by_name'
           ret =3D btrfs_inode_by_name(dir, dentry, &location, &di_type);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:5973:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   fs/btrfs/inode.c:5973:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/btrfs/inode.c:5976:20: note: The left operand of '=3D=3D' is a garbag=
e value
           if (location.type =3D=3D BTRFS_INODE_ITEM_KEY) {
               ~~~~~~~~~~~~~ ^
   fs/btrfs/inode.c:7221:2: warning: Value stored to 'ret' is never read [c=
lang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   fs/btrfs/inode.c:7221:2: note: Value stored to 'ret' is never read
           ret =3D 0;
           ^     ~
   fs/btrfs/inode.c:7796:12: warning: Although the value stored to 'em' is =
used in the enclosing expression, the value is never actually read from 'em=
' [clang-analyzer-deadcode.DeadStores]
                                   *map =3D em =3D em2;
                                          ^    ~~~
   fs/btrfs/inode.c:7796:12: note: Although the value stored to 'em' is use=
d in the enclosing expression, the value is never actually read from 'em'
                                   *map =3D em =3D em2;
                                          ^    ~~~
   fs/btrfs/inode.c:9534:4: warning: Value stored to 'root_log_pinned' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           root_log_pinned =3D false;
                           ^                 ~~~~~
   fs/btrfs/inode.c:9534:4: note: Value stored to 'root_log_pinned' is neve=
r read
                           root_log_pinned =3D false;
                           ^                 ~~~~~
   fs/btrfs/inode.c:9538:4: warning: Value stored to 'dest_log_pinned' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           dest_log_pinned =3D false;
                           ^                 ~~~~~
   fs/btrfs/inode.c:9538:4: note: Value stored to 'dest_log_pinned' is neve=
r read
                           dest_log_pinned =3D false;
                           ^                 ~~~~~
   fs/btrfs/inode.c:9588:8: warning: 6th function call argument is an unini=
tialized value [clang-analyzer-core.CallAndMessage]
           ret =3D btrfs_add_nondir(trans, BTRFS_I(dir), dentry,
                 ^
   fs/btrfs/inode.c:9621:6: note: Assuming the condition is false
           if (btrfs_ino(BTRFS_I(new_dir)) =3D=3D BTRFS_EMPTY_SUBVOL_DIR_OB=
JECTID)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/inode.c:9621:2: note: Taking false branch
           if (btrfs_ino(BTRFS_I(new_dir)) =3D=3D BTRFS_EMPTY_SUBVOL_DIR_OB=
JECTID)
           ^
   fs/btrfs/inode.c:9625:6: note: Assuming 'old_ino' is equal to BTRFS_FIRS=
T_FREE_OBJECTID
           if (old_ino !=3D BTRFS_FIRST_FREE_OBJECTID && root !=3D dest)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:9625:43: note: Left side of '&&' is false
           if (old_ino !=3D BTRFS_FIRST_FREE_OBJECTID && root !=3D dest)
                                                    ^

vim +/features +3326 fs/btrfs/disk-io.c

44c0ca211a4da9 Boris Burkov        2020-11-18  3188  =

ae18c37ad5a12a Josef Bacik         2020-01-24  3189  int __cold open_ctree(=
struct super_block *sb, struct btrfs_fs_devices *fs_devices,
ae18c37ad5a12a Josef Bacik         2020-01-24  3190  		      char *options)
ae18c37ad5a12a Josef Bacik         2020-01-24  3191  {
ae18c37ad5a12a Josef Bacik         2020-01-24  3192  	u32 sectorsize;
ae18c37ad5a12a Josef Bacik         2020-01-24  3193  	u32 nodesize;
ae18c37ad5a12a Josef Bacik         2020-01-24  3194  	u32 stripesize;
ae18c37ad5a12a Josef Bacik         2020-01-24  3195  	u64 generation;
ae18c37ad5a12a Josef Bacik         2020-01-24  3196  	u64 features;
ae18c37ad5a12a Josef Bacik         2020-01-24  3197  	u16 csum_type;
ae18c37ad5a12a Josef Bacik         2020-01-24  3198  	struct btrfs_super_bl=
ock *disk_super;
ae18c37ad5a12a Josef Bacik         2020-01-24  3199  	struct btrfs_fs_info =
*fs_info =3D btrfs_sb(sb);
ae18c37ad5a12a Josef Bacik         2020-01-24  3200  	struct btrfs_root *tr=
ee_root;
ae18c37ad5a12a Josef Bacik         2020-01-24  3201  	struct btrfs_root *ch=
unk_root;
ae18c37ad5a12a Josef Bacik         2020-01-24  3202  	int ret;
ae18c37ad5a12a Josef Bacik         2020-01-24  3203  	int err =3D -EINVAL;
ae18c37ad5a12a Josef Bacik         2020-01-24  3204  	int level;
ae18c37ad5a12a Josef Bacik         2020-01-24  3205  =

8260edba67a2e6 Josef Bacik         2020-01-24  3206  	ret =3D init_mount_fs=
_info(fs_info, sb);
53b381b3abeb86 David Woodhouse     2013-01-29  3207  	if (ret) {
83c8266acc1d19 David Sterba        2013-03-01  3208  		err =3D ret;
ae18c37ad5a12a Josef Bacik         2020-01-24  3209  		goto fail;
53b381b3abeb86 David Woodhouse     2013-01-29  3210  	}
53b381b3abeb86 David Woodhouse     2013-01-29  3211  =

ae18c37ad5a12a Josef Bacik         2020-01-24  3212  	/* These need to be i=
nit'ed before we start creating inodes and such. */
ae18c37ad5a12a Josef Bacik         2020-01-24  3213  	tree_root =3D btrfs_a=
lloc_root(fs_info, BTRFS_ROOT_TREE_OBJECTID,
ae18c37ad5a12a Josef Bacik         2020-01-24  3214  				     GFP_KERNEL);
ae18c37ad5a12a Josef Bacik         2020-01-24  3215  	fs_info->tree_root =
=3D tree_root;
ae18c37ad5a12a Josef Bacik         2020-01-24  3216  	chunk_root =3D btrfs_=
alloc_root(fs_info, BTRFS_CHUNK_TREE_OBJECTID,
ae18c37ad5a12a Josef Bacik         2020-01-24  3217  				      GFP_KERNEL);
ae18c37ad5a12a Josef Bacik         2020-01-24  3218  	fs_info->chunk_root =
=3D chunk_root;
ae18c37ad5a12a Josef Bacik         2020-01-24  3219  	if (!tree_root || !ch=
unk_root) {
ae18c37ad5a12a Josef Bacik         2020-01-24  3220  		err =3D -ENOMEM;
c75e839414d361 Josef Bacik         2020-02-14  3221  		goto fail;
ae18c37ad5a12a Josef Bacik         2020-01-24  3222  	}
ae18c37ad5a12a Josef Bacik         2020-01-24  3223  =

ae18c37ad5a12a Josef Bacik         2020-01-24  3224  	fs_info->btree_inode =
=3D new_inode(sb);
ae18c37ad5a12a Josef Bacik         2020-01-24  3225  	if (!fs_info->btree_i=
node) {
ae18c37ad5a12a Josef Bacik         2020-01-24  3226  		err =3D -ENOMEM;
c75e839414d361 Josef Bacik         2020-02-14  3227  		goto fail;
ae18c37ad5a12a Josef Bacik         2020-01-24  3228  	}
ae18c37ad5a12a Josef Bacik         2020-01-24  3229  	mapping_set_gfp_mask(=
fs_info->btree_inode->i_mapping, GFP_NOFS);
ae18c37ad5a12a Josef Bacik         2020-01-24  3230  	btrfs_init_btree_inod=
e(fs_info);
ae18c37ad5a12a Josef Bacik         2020-01-24  3231  =

3c4bb26b213e61 Chris Mason         2012-03-27  3232  	invalidate_bdev(fs_de=
vices->latest_bdev);
1104a8855109a4 David Sterba        2013-03-06  3233  =

1104a8855109a4 David Sterba        2013-03-06  3234  	/*
1104a8855109a4 David Sterba        2013-03-06  3235  	 * Read super block a=
nd check the signature bytes only
1104a8855109a4 David Sterba        2013-03-06  3236  	 */
8f32380d3f2904 Johannes Thumshirn  2020-02-14  3237  	disk_super =3D btrfs_=
read_dev_super(fs_devices->latest_bdev);
8f32380d3f2904 Johannes Thumshirn  2020-02-14  3238  	if (IS_ERR(disk_super=
)) {
8f32380d3f2904 Johannes Thumshirn  2020-02-14  3239  		err =3D PTR_ERR(disk=
_super);
16cdcec736cd21 Miao Xie            2011-04-22  3240  		goto fail_alloc;
20b450773d17e3 Dave Young          2011-01-08  3241  	}
39279cc3d2704c Chris Mason         2007-06-12  3242  =

8dc3f22c8ba02c Johannes Thumshirn  2019-06-03  3243  	/*
260db43cd2f556 Randy Dunlap        2020-08-04  3244  	 * Verify the type fi=
rst, if that or the checksum value are
8dc3f22c8ba02c Johannes Thumshirn  2019-06-03  3245  	 * corrupted, we'll f=
ind out
8dc3f22c8ba02c Johannes Thumshirn  2019-06-03  3246  	 */
8f32380d3f2904 Johannes Thumshirn  2020-02-14  3247  	csum_type =3D btrfs_s=
uper_csum_type(disk_super);
51bce6c9b97729 Johannes Thumshirn  2019-06-03  3248  	if (!btrfs_supported_=
super_csum(csum_type)) {
8dc3f22c8ba02c Johannes Thumshirn  2019-06-03  3249  		btrfs_err(fs_info, "=
unsupported checksum algorithm: %u",
51bce6c9b97729 Johannes Thumshirn  2019-06-03  3250  			  csum_type);
8dc3f22c8ba02c Johannes Thumshirn  2019-06-03  3251  		err =3D -EINVAL;
8f32380d3f2904 Johannes Thumshirn  2020-02-14  3252  		btrfs_release_disk_s=
uper(disk_super);
8dc3f22c8ba02c Johannes Thumshirn  2019-06-03  3253  		goto fail_alloc;
8dc3f22c8ba02c Johannes Thumshirn  2019-06-03  3254  	}
8dc3f22c8ba02c Johannes Thumshirn  2019-06-03  3255  =

83c68bbcb6ac2d Su Yue              2021-02-11  3256  	fs_info->csum_size =
=3D btrfs_super_csum_size(disk_super);
83c68bbcb6ac2d Su Yue              2021-02-11  3257  =

6d97c6e31b553b Johannes Thumshirn  2019-06-03  3258  	ret =3D btrfs_init_cs=
um_hash(fs_info, csum_type);
6d97c6e31b553b Johannes Thumshirn  2019-06-03  3259  	if (ret) {
6d97c6e31b553b Johannes Thumshirn  2019-06-03  3260  		err =3D ret;
8f32380d3f2904 Johannes Thumshirn  2020-02-14  3261  		btrfs_release_disk_s=
uper(disk_super);
6d97c6e31b553b Johannes Thumshirn  2019-06-03  3262  		goto fail_alloc;
6d97c6e31b553b Johannes Thumshirn  2019-06-03  3263  	}
6d97c6e31b553b Johannes Thumshirn  2019-06-03  3264  =

1104a8855109a4 David Sterba        2013-03-06  3265  	/*
1104a8855109a4 David Sterba        2013-03-06  3266  	 * We want to check s=
uperblock checksum, the type is stored inside.
1104a8855109a4 David Sterba        2013-03-06  3267  	 * Pass the whole dis=
k block of size BTRFS_SUPER_INFO_SIZE (4k).
1104a8855109a4 David Sterba        2013-03-06  3268  	 */
8f32380d3f2904 Johannes Thumshirn  2020-02-14  3269  	if (btrfs_check_super=
_csum(fs_info, (u8 *)disk_super)) {
05135f597adcb9 David Sterba        2016-05-09  3270  		btrfs_err(fs_info, "=
superblock checksum mismatch");
1104a8855109a4 David Sterba        2013-03-06  3271  		err =3D -EINVAL;
8f32380d3f2904 Johannes Thumshirn  2020-02-14  3272  		btrfs_release_disk_s=
uper(disk_super);
141386e1a5d641 Josef Bacik         2020-01-24  3273  		goto fail_alloc;
1104a8855109a4 David Sterba        2013-03-06  3274  	}
1104a8855109a4 David Sterba        2013-03-06  3275  =

1104a8855109a4 David Sterba        2013-03-06  3276  	/*
1104a8855109a4 David Sterba        2013-03-06  3277  	 * super_copy is zero=
ed at allocation time and we never touch the
1104a8855109a4 David Sterba        2013-03-06  3278  	 * following bytes up=
 to INFO_SIZE, the checksum is calculated from
1104a8855109a4 David Sterba        2013-03-06  3279  	 * the whole block of=
 INFO_SIZE
1104a8855109a4 David Sterba        2013-03-06  3280  	 */
8f32380d3f2904 Johannes Thumshirn  2020-02-14  3281  	memcpy(fs_info->super=
_copy, disk_super, sizeof(*fs_info->super_copy));
8f32380d3f2904 Johannes Thumshirn  2020-02-14  3282  	btrfs_release_disk_su=
per(disk_super);
5f39d397dfbe14 Chris Mason         2007-10-15  3283  =

fbc6feaec98ac0 Nikolay Borisov     2018-10-30  3284  	disk_super =3D fs_inf=
o->super_copy;
fbc6feaec98ac0 Nikolay Borisov     2018-10-30  3285  =

0b86a832a1f38a Chris Mason         2008-03-24  3286  =

fbc6feaec98ac0 Nikolay Borisov     2018-10-30  3287  	features =3D btrfs_su=
per_flags(disk_super);
fbc6feaec98ac0 Nikolay Borisov     2018-10-30  3288  	if (features & BTRFS_=
SUPER_FLAG_CHANGING_FSID_V2) {
fbc6feaec98ac0 Nikolay Borisov     2018-10-30  3289  		features &=3D ~BTRFS=
_SUPER_FLAG_CHANGING_FSID_V2;
fbc6feaec98ac0 Nikolay Borisov     2018-10-30  3290  		btrfs_set_super_flag=
s(disk_super, features);
fbc6feaec98ac0 Nikolay Borisov     2018-10-30  3291  		btrfs_info(fs_info,
fbc6feaec98ac0 Nikolay Borisov     2018-10-30  3292  			"found metadata UUI=
D change in progress flag, clearing");
fbc6feaec98ac0 Nikolay Borisov     2018-10-30  3293  	}
fbc6feaec98ac0 Nikolay Borisov     2018-10-30  3294  =

fbc6feaec98ac0 Nikolay Borisov     2018-10-30  3295  	memcpy(fs_info->super=
_for_commit, fs_info->super_copy,
fbc6feaec98ac0 Nikolay Borisov     2018-10-30  3296  	       sizeof(*fs_inf=
o->super_for_commit));
de37aa513105f8 Nikolay Borisov     2018-10-30  3297  =

069ec957c35e03 Qu Wenruo           2018-05-11  3298  	ret =3D btrfs_validat=
e_mount_super(fs_info);
1104a8855109a4 David Sterba        2013-03-06  3299  	if (ret) {
05135f597adcb9 David Sterba        2016-05-09  3300  		btrfs_err(fs_info, "=
superblock contains fatal errors");
1104a8855109a4 David Sterba        2013-03-06  3301  		err =3D -EINVAL;
141386e1a5d641 Josef Bacik         2020-01-24  3302  		goto fail_alloc;
1104a8855109a4 David Sterba        2013-03-06  3303  	}
1104a8855109a4 David Sterba        2013-03-06  3304  =

0f7d52f4431c53 Chris Mason         2007-04-09  3305  	if (!btrfs_super_root=
(disk_super))
141386e1a5d641 Josef Bacik         2020-01-24  3306  		goto fail_alloc;
0f7d52f4431c53 Chris Mason         2007-04-09  3307  =

acce952b026382 liubo               2011-01-06  3308  	/* check FS state, wh=
ether FS is broken. */
87533c475187c1 Miao Xie            2013-01-29  3309  	if (btrfs_super_flags=
(disk_super) & BTRFS_SUPER_FLAG_ERROR)
87533c475187c1 Miao Xie            2013-01-29  3310  		set_bit(BTRFS_FS_STA=
TE_ERROR, &fs_info->fs_state);
acce952b026382 liubo               2011-01-06  3311  =

75e7cb7fe0c391 Liu Bo              2011-03-22  3312  	/*
75e7cb7fe0c391 Liu Bo              2011-03-22  3313  	 * In the long term, =
we'll store the compression type in the super
75e7cb7fe0c391 Liu Bo              2011-03-22  3314  	 * block, and it'll b=
e used for per file compression control.
75e7cb7fe0c391 Liu Bo              2011-03-22  3315  	 */
75e7cb7fe0c391 Liu Bo              2011-03-22  3316  	fs_info->compress_typ=
e =3D BTRFS_COMPRESS_ZLIB;
75e7cb7fe0c391 Liu Bo              2011-03-22  3317  =

6ed27ecf7912ba Anand Jain          2021-08-10  3318  	/*
6ed27ecf7912ba Anand Jain          2021-08-10  3319  	 * Flag our filesyste=
m as having big metadata blocks if they are bigger
6ed27ecf7912ba Anand Jain          2021-08-10  3320  	 * than the page size.
6ed27ecf7912ba Anand Jain          2021-08-10  3321  	 */
6ed27ecf7912ba Anand Jain          2021-08-10  3322  	if (btrfs_super_nodes=
ize(disk_super) > PAGE_SIZE) {
6ed27ecf7912ba Anand Jain          2021-08-10  3323  		if (!(features & BTR=
FS_FEATURE_INCOMPAT_BIG_METADATA))
6ed27ecf7912ba Anand Jain          2021-08-10  3324  			btrfs_info(fs_info,
6ed27ecf7912ba Anand Jain          2021-08-10  3325  				"flagging fs with =
big metadata feature");
6ed27ecf7912ba Anand Jain          2021-08-10 @3326  		features |=3D BTRFS_=
FEATURE_INCOMPAT_BIG_METADATA;
6ed27ecf7912ba Anand Jain          2021-08-10  3327  	}
6ed27ecf7912ba Anand Jain          2021-08-10  3328  =

6ed27ecf7912ba Anand Jain          2021-08-10  3329  	/* Set up fs_info bef=
ore parsing mount options */
6ed27ecf7912ba Anand Jain          2021-08-10  3330  	nodesize =3D btrfs_su=
per_nodesize(disk_super);
6ed27ecf7912ba Anand Jain          2021-08-10  3331  	sectorsize =3D btrfs_=
super_sectorsize(disk_super);
6ed27ecf7912ba Anand Jain          2021-08-10  3332  	stripesize =3D sector=
size;
6ed27ecf7912ba Anand Jain          2021-08-10  3333  	fs_info->dirty_metada=
ta_batch =3D nodesize * (1 + ilog2(nr_cpu_ids));
6ed27ecf7912ba Anand Jain          2021-08-10  3334  	fs_info->delalloc_bat=
ch =3D sectorsize * 512 * (1 + ilog2(nr_cpu_ids));
6ed27ecf7912ba Anand Jain          2021-08-10  3335  =

6ed27ecf7912ba Anand Jain          2021-08-10  3336  	fs_info->nodesize =3D=
 nodesize;
6ed27ecf7912ba Anand Jain          2021-08-10  3337  	fs_info->sectorsize =
=3D sectorsize;
6ed27ecf7912ba Anand Jain          2021-08-10  3338  	fs_info->sectorsize_b=
its =3D ilog2(sectorsize);
6ed27ecf7912ba Anand Jain          2021-08-10  3339  	fs_info->csums_per_le=
af =3D BTRFS_MAX_ITEM_SIZE(fs_info) / fs_info->csum_size;
6ed27ecf7912ba Anand Jain          2021-08-10  3340  	fs_info->stripesize =
=3D stripesize;
6ed27ecf7912ba Anand Jain          2021-08-10  3341  =

2ff7e61e0d30ff Jeff Mahoney        2016-06-22  3342  	ret =3D btrfs_parse_o=
ptions(fs_info, options, sb->s_flags);
2b82032c34ec40 Yan Zheng           2008-11-17  3343  	if (ret) {
2b82032c34ec40 Yan Zheng           2008-11-17  3344  		err =3D ret;
141386e1a5d641 Josef Bacik         2020-01-24  3345  		goto fail_alloc;
2b82032c34ec40 Yan Zheng           2008-11-17  3346  	}
dfe25020689bb2 Chris Mason         2008-05-13  3347  =

f2b636e80d8206 Josef Bacik         2008-12-02  3348  	features =3D btrfs_su=
per_incompat_flags(disk_super) &
f2b636e80d8206 Josef Bacik         2008-12-02  3349  		~BTRFS_FEATURE_INCOM=
PAT_SUPP;
f2b636e80d8206 Josef Bacik         2008-12-02  3350  	if (features) {
05135f597adcb9 David Sterba        2016-05-09  3351  		btrfs_err(fs_info,
05135f597adcb9 David Sterba        2016-05-09  3352  		    "cannot mount be=
cause of unsupported optional features (%llx)",
c1c9ff7c94e83f Geert Uytterhoeven  2013-08-20  3353  		    features);
f2b636e80d8206 Josef Bacik         2008-12-02  3354  		err =3D -EINVAL;
141386e1a5d641 Josef Bacik         2020-01-24  3355  		goto fail_alloc;
f2b636e80d8206 Josef Bacik         2008-12-02  3356  	}
f2b636e80d8206 Josef Bacik         2008-12-02  3357  =

5d4f98a28c7d33 Yan Zheng           2009-06-10  3358  	features =3D btrfs_su=
per_incompat_flags(disk_super);
5d4f98a28c7d33 Yan Zheng           2009-06-10  3359  	features |=3D BTRFS_F=
EATURE_INCOMPAT_MIXED_BACKREF;
0b246afa62b0cf Jeff Mahoney        2016-06-22  3360  	if (fs_info->compress=
_type =3D=3D BTRFS_COMPRESS_LZO)
a6fa6fae40ec33 Li Zefan            2010-10-25  3361  		features |=3D BTRFS_=
FEATURE_INCOMPAT_COMPRESS_LZO;
5c1aab1dd5445e Nick Terrell        2017-08-09  3362  	else if (fs_info->com=
press_type =3D=3D BTRFS_COMPRESS_ZSTD)
5c1aab1dd5445e Nick Terrell        2017-08-09  3363  		features |=3D BTRFS_=
FEATURE_INCOMPAT_COMPRESS_ZSTD;
727011e07cbdf8 Chris Mason         2010-08-06  3364  =

3173a18f70554f Josef Bacik         2013-03-07  3365  	if (features & BTRFS_=
FEATURE_INCOMPAT_SKINNY_METADATA)
05135f597adcb9 David Sterba        2016-05-09  3366  		btrfs_info(fs_info, =
"has skinny extents");
3173a18f70554f Josef Bacik         2013-03-07  3367  =

bc3f116fec194f Chris Mason         2012-03-29  3368  	/*
bc3f116fec194f Chris Mason         2012-03-29  3369  	 * mixed block groups=
 end up with duplicate but slightly offset
bc3f116fec194f Chris Mason         2012-03-29  3370  	 * extent buffers for=
 the same range.  It leads to corruptions
bc3f116fec194f Chris Mason         2012-03-29  3371  	 */
bc3f116fec194f Chris Mason         2012-03-29  3372  	if ((features & BTRFS=
_FEATURE_INCOMPAT_MIXED_GROUPS) &&
707e8a07152838 David Sterba        2014-06-04  3373  	    (sectorsize !=3D =
nodesize)) {
05135f597adcb9 David Sterba        2016-05-09  3374  		btrfs_err(fs_info,
05135f597adcb9 David Sterba        2016-05-09  3375  "unequal nodesize/sect=
orsize (%u !=3D %u) are not allowed for mixed block groups",
05135f597adcb9 David Sterba        2016-05-09  3376  			nodesize, sectorsiz=
e);
141386e1a5d641 Josef Bacik         2020-01-24  3377  		goto fail_alloc;
bc3f116fec194f Chris Mason         2012-03-29  3378  	}
bc3f116fec194f Chris Mason         2012-03-29  3379  =

ceda08642459e3 Miao Xie            2013-04-11  3380  	/*
ceda08642459e3 Miao Xie            2013-04-11  3381  	 * Needn't use the lo=
ck because there is no other task which will
ceda08642459e3 Miao Xie            2013-04-11  3382  	 * update the flag.
ceda08642459e3 Miao Xie            2013-04-11  3383  	 */
5d4f98a28c7d33 Yan Zheng           2009-06-10  3384  	btrfs_set_super_incom=
pat_flags(disk_super, features);
5d4f98a28c7d33 Yan Zheng           2009-06-10  3385  =

f2b636e80d8206 Josef Bacik         2008-12-02  3386  	features =3D btrfs_su=
per_compat_ro_flags(disk_super) &
f2b636e80d8206 Josef Bacik         2008-12-02  3387  		~BTRFS_FEATURE_COMPA=
T_RO_SUPP;
bc98a42c1f7d0f David Howells       2017-07-17  3388  	if (!sb_rdonly(sb) &&=
 features) {
05135f597adcb9 David Sterba        2016-05-09  3389  		btrfs_err(fs_info,
05135f597adcb9 David Sterba        2016-05-09  3390  	"cannot mount read-wr=
ite because of unsupported optional features (%llx)",
c1c9ff7c94e83f Geert Uytterhoeven  2013-08-20  3391  		       features);
f2b636e80d8206 Josef Bacik         2008-12-02  3392  		err =3D -EINVAL;
141386e1a5d641 Josef Bacik         2020-01-24  3393  		goto fail_alloc;
f2b636e80d8206 Josef Bacik         2008-12-02  3394  	}
61d92c328c1641 Chris Mason         2009-10-02  3395  =

fc57cc671e02f1 Qu Wenruo           2021-08-17  3396  	if (sectorsize < PAGE=
_SIZE) {
fc57cc671e02f1 Qu Wenruo           2021-08-17  3397  		struct btrfs_subpage=
_info *subpage_info;
fc57cc671e02f1 Qu Wenruo           2021-08-17  3398  =

95ea0486b20e4d Qu Wenruo           2021-07-26  3399  		btrfs_warn(fs_info,
95ea0486b20e4d Qu Wenruo           2021-07-26  3400  		"read-write for sect=
or size %u with page size %lu is experimental",
0bb3eb3ee8674d Qu Wenruo           2021-01-26  3401  			   sectorsize, PAGE=
_SIZE);
c8050b3b7f7658 Qu Wenruo           2021-07-26  3402  		if (btrfs_super_inco=
mpat_flags(fs_info->super_copy) &
c8050b3b7f7658 Qu Wenruo           2021-07-26  3403  			BTRFS_FEATURE_INCOM=
PAT_RAID56) {
c8050b3b7f7658 Qu Wenruo           2021-07-26  3404  			btrfs_err(fs_info,
c8050b3b7f7658 Qu Wenruo           2021-07-26  3405  		"RAID56 is not yet s=
upported for sector size %u with page size %lu",
c8050b3b7f7658 Qu Wenruo           2021-07-26  3406  				sectorsize, PAGE_S=
IZE);
c8050b3b7f7658 Qu Wenruo           2021-07-26  3407  			err =3D -EINVAL;
c8050b3b7f7658 Qu Wenruo           2021-07-26  3408  			goto fail_alloc;
c8050b3b7f7658 Qu Wenruo           2021-07-26  3409  		}
fc57cc671e02f1 Qu Wenruo           2021-08-17  3410  		subpage_info =3D kza=
lloc(sizeof(*subpage_info), GFP_KERNEL);
fc57cc671e02f1 Qu Wenruo           2021-08-17  3411  		if (!subpage_info)
fc57cc671e02f1 Qu Wenruo           2021-08-17  3412  			goto fail_alloc;
fc57cc671e02f1 Qu Wenruo           2021-08-17  3413  		btrfs_init_subpage_i=
nfo(subpage_info, sectorsize);
fc57cc671e02f1 Qu Wenruo           2021-08-17  3414  		fs_info->subpage_inf=
o =3D subpage_info;
c8050b3b7f7658 Qu Wenruo           2021-07-26  3415  	}
0bb3eb3ee8674d Qu Wenruo           2021-01-26  3416  =

2a4581983f90d8 Eric Sandeen        2015-02-16  3417  	ret =3D btrfs_init_wo=
rkqueues(fs_info, fs_devices);
2a4581983f90d8 Eric Sandeen        2015-02-16  3418  	if (ret) {
2a4581983f90d8 Eric Sandeen        2015-02-16  3419  		err =3D ret;
0dc3b84a73267f Josef Bacik         2011-11-18  3420  		goto fail_sb_buffer;
0dc3b84a73267f Josef Bacik         2011-11-18  3421  	}
4543df7ecc8ae4 Chris Mason         2008-06-11  3422  =

9e11ceee23f25b Jan Kara            2017-04-12  3423  	sb->s_bdi->ra_pages *=
=3D btrfs_super_num_devices(disk_super);
9e11ceee23f25b Jan Kara            2017-04-12  3424  	sb->s_bdi->ra_pages =
=3D max(sb->s_bdi->ra_pages, SZ_4M / PAGE_SIZE);
4575c9cceeca2f Chris Mason         2008-04-18  3425  =

a061fc8da7b990 Chris Mason         2008-05-07  3426  	sb->s_blocksize =3D s=
ectorsize;
a061fc8da7b990 Chris Mason         2008-05-07  3427  	sb->s_blocksize_bits =
=3D blksize_bits(sectorsize);
de37aa513105f8 Nikolay Borisov     2018-10-30  3428  	memcpy(&sb->s_uuid, f=
s_info->fs_devices->fsid, BTRFS_FSID_SIZE);
db94535db75e67 Chris Mason         2007-10-15  3429  =

925baeddc5b076 Chris Mason         2008-06-25  3430  	mutex_lock(&fs_info->=
chunk_mutex);
6bccf3ab1e1f09 Jeff Mahoney        2016-06-21  3431  	ret =3D btrfs_read_sy=
s_array(fs_info);
925baeddc5b076 Chris Mason         2008-06-25  3432  	mutex_unlock(&fs_info=
->chunk_mutex);
84eed90fac1b92 Chris Mason         2008-04-25  3433  	if (ret) {
05135f597adcb9 David Sterba        2016-05-09  3434  		btrfs_err(fs_info, "=
failed to read the system array: %d", ret);
5d4f98a28c7d33 Yan Zheng           2009-06-10  3435  		goto fail_sb_buffer;
84eed90fac1b92 Chris Mason         2008-04-25  3436  	}
0b86a832a1f38a Chris Mason         2008-03-24  3437  =

84234f3a1f7c53 Yan Zheng           2008-10-29  3438  	generation =3D btrfs_=
super_chunk_root_generation(disk_super);
581c1760415c48 Qu Wenruo           2018-03-29  3439  	level =3D btrfs_super=
_chunk_root_level(disk_super);
0b86a832a1f38a Chris Mason         2008-03-24  3440  =

2ff7e61e0d30ff Jeff Mahoney        2016-06-22  3441  	chunk_root->node =3D =
read_tree_block(fs_info,
0b86a832a1f38a Chris Mason         2008-03-24  3442  					   btrfs_super_ch=
unk_root(disk_super),
1b7ec85ef49057 Josef Bacik         2020-11-05  3443  					   BTRFS_CHUNK_TR=
EE_OBJECTID,
581c1760415c48 Qu Wenruo           2018-03-29  3444  					   generation, le=
vel, NULL);
64c043de466d57 Liu Bo              2015-05-25  3445  	if (IS_ERR(chunk_root=
->node) ||
64c043de466d57 Liu Bo              2015-05-25  3446  	    !extent_buffer_up=
todate(chunk_root->node)) {
05135f597adcb9 David Sterba        2016-05-09  3447  		btrfs_err(fs_info, "=
failed to read chunk root");
e5fffbac4a4927 chandan             2015-10-05  3448  		if (!IS_ERR(chunk_ro=
ot->node))
e5fffbac4a4927 chandan             2015-10-05  3449  			free_extent_buffer(=
chunk_root->node);
95ab1f64908795 Zhao Lei            2015-07-15  3450  		chunk_root->node =3D=
 NULL;
af31f5e5b84b5b Chris Mason         2011-11-03  3451  		goto fail_tree_roots;
83121942b28daf David Woodhouse     2009-07-22  3452  	}
5d4f98a28c7d33 Yan Zheng           2009-06-10  3453  	btrfs_set_root_node(&=
chunk_root->root_item, chunk_root->node);
5d4f98a28c7d33 Yan Zheng           2009-06-10  3454  	chunk_root->commit_ro=
ot =3D btrfs_root_node(chunk_root);
0b86a832a1f38a Chris Mason         2008-03-24  3455  =

e17cade25ff807 Chris Mason         2008-04-15  3456  	read_extent_buffer(ch=
unk_root->node, fs_info->chunk_tree_uuid,
c4ac75419826c7 David Sterba        2019-03-20  3457  			   offsetof(struct =
btrfs_header, chunk_tree_uuid),
c4ac75419826c7 David Sterba        2019-03-20  3458  			   BTRFS_UUID_SIZE);
e17cade25ff807 Chris Mason         2008-04-15  3459  =

5b4aacefb8fbfc Jeff Mahoney        2016-06-21  3460  	ret =3D btrfs_read_ch=
unk_tree(fs_info);
2b82032c34ec40 Yan Zheng           2008-11-17  3461  	if (ret) {
05135f597adcb9 David Sterba        2016-05-09  3462  		btrfs_err(fs_info, "=
failed to read chunk tree: %d", ret);
af31f5e5b84b5b Chris Mason         2011-11-03  3463  		goto fail_tree_roots;
2b82032c34ec40 Yan Zheng           2008-11-17  3464  	}
0b86a832a1f38a Chris Mason         2008-03-24  3465  =

8dabb7420f014a Stefan Behrens      2012-11-06  3466  	/*
bacce86ae8a7b8 Anand Jain          2020-11-06  3467  	 * At this point we k=
now all the devices that make this filesystem,
bacce86ae8a7b8 Anand Jain          2020-11-06  3468  	 * including the seed=
 devices but we don't know yet if the replace
bacce86ae8a7b8 Anand Jain          2020-11-06  3469  	 * target is required=
. So free devices that are not part of this
1a9fd4172d5c8b David Sterba        2021-05-21  3470  	 * filesystem but ski=
p the replace target device which is checked
bacce86ae8a7b8 Anand Jain          2020-11-06  3471  	 * below in btrfs_ini=
t_dev_replace().
8dabb7420f014a Stefan Behrens      2012-11-06  3472  	 */
bacce86ae8a7b8 Anand Jain          2020-11-06  3473  	btrfs_free_extra_devi=
ds(fs_devices);
a6b0d5c8dbfd42 Chris Mason         2012-02-20  3474  	if (!fs_devices->late=
st_bdev) {
05135f597adcb9 David Sterba        2016-05-09  3475  		btrfs_err(fs_info, "=
failed to read devices");
a6b0d5c8dbfd42 Chris Mason         2012-02-20  3476  		goto fail_tree_roots;
a6b0d5c8dbfd42 Chris Mason         2012-02-20  3477  	}
a6b0d5c8dbfd42 Chris Mason         2012-02-20  3478  =

b8522a1e5f421e Nikolay Borisov     2019-10-15  3479  	ret =3D init_tree_roo=
ts(fs_info);
4bbcaa648d2347 Eric Sandeen        2014-08-01  3480  	if (ret)
b8522a1e5f421e Nikolay Borisov     2019-10-15  3481  		goto fail_tree_roots;
8929ecfa50f266 Yan, Zheng          2010-05-16  3482  =

7365104236ade0 Naohiro Aota        2021-02-04  3483  	/*
7365104236ade0 Naohiro Aota        2021-02-04  3484  	 * Get zone type info=
rmation of zoned block devices. This will also
7365104236ade0 Naohiro Aota        2021-02-04  3485  	 * handle emulation o=
f a zoned filesystem if a regular device has the
7365104236ade0 Naohiro Aota        2021-02-04  3486  	 * zoned incompat fea=
ture flag set.
7365104236ade0 Naohiro Aota        2021-02-04  3487  	 */
7365104236ade0 Naohiro Aota        2021-02-04  3488  	ret =3D btrfs_get_dev=
_zone_info_all_devices(fs_info);
7365104236ade0 Naohiro Aota        2021-02-04  3489  	if (ret) {
7365104236ade0 Naohiro Aota        2021-02-04  3490  		btrfs_err(fs_info,
7365104236ade0 Naohiro Aota        2021-02-04  3491  			  "zoned: failed to=
 read device zone info: %d",
7365104236ade0 Naohiro Aota        2021-02-04  3492  			  ret);
7365104236ade0 Naohiro Aota        2021-02-04  3493  		goto fail_block_grou=
ps;
7365104236ade0 Naohiro Aota        2021-02-04  3494  	}
7365104236ade0 Naohiro Aota        2021-02-04  3495  =

75ec1db8717a8f Josef Bacik         2020-02-14  3496  	/*
75ec1db8717a8f Josef Bacik         2020-02-14  3497  	 * If we have a uuid =
root and we're not being told to rescan we need to
75ec1db8717a8f Josef Bacik         2020-02-14  3498  	 * check the generati=
on here so we can set the
75ec1db8717a8f Josef Bacik         2020-02-14  3499  	 * BTRFS_FS_UPDATE_UU=
ID_TREE_GEN bit.  Otherwise we could commit the
75ec1db8717a8f Josef Bacik         2020-02-14  3500  	 * transaction during=
 a balance or the log replay without updating the
75ec1db8717a8f Josef Bacik         2020-02-14  3501  	 * uuid generation, a=
nd then if we crash we would rescan the uuid tree,
75ec1db8717a8f Josef Bacik         2020-02-14  3502  	 * even though it was=
 perfectly fine.
75ec1db8717a8f Josef Bacik         2020-02-14  3503  	 */
75ec1db8717a8f Josef Bacik         2020-02-14  3504  	if (fs_info->uuid_roo=
t && !btrfs_test_opt(fs_info, RESCAN_UUID_TREE) &&
75ec1db8717a8f Josef Bacik         2020-02-14  3505  	    fs_info->generati=
on =3D=3D btrfs_super_uuid_tree_generation(disk_super))
75ec1db8717a8f Josef Bacik         2020-02-14  3506  		set_bit(BTRFS_FS_UPD=
ATE_UUID_TREE_GEN, &fs_info->flags);
75ec1db8717a8f Josef Bacik         2020-02-14  3507  =

cf90d884b347c5 Qu Wenruo           2018-08-01  3508  	ret =3D btrfs_verify_=
dev_extents(fs_info);
cf90d884b347c5 Qu Wenruo           2018-08-01  3509  	if (ret) {
cf90d884b347c5 Qu Wenruo           2018-08-01  3510  		btrfs_err(fs_info,
cf90d884b347c5 Qu Wenruo           2018-08-01  3511  			  "failed to verify=
 dev extents against chunks: %d",
cf90d884b347c5 Qu Wenruo           2018-08-01  3512  			  ret);
cf90d884b347c5 Qu Wenruo           2018-08-01  3513  		goto fail_block_grou=
ps;
cf90d884b347c5 Qu Wenruo           2018-08-01  3514  	}
68310a5e42f93c Ilya Dryomov        2012-06-22  3515  	ret =3D btrfs_recover=
_balance(fs_info);
68310a5e42f93c Ilya Dryomov        2012-06-22  3516  	if (ret) {
05135f597adcb9 David Sterba        2016-05-09  3517  		btrfs_err(fs_info, "=
failed to recover balance: %d", ret);
68310a5e42f93c Ilya Dryomov        2012-06-22  3518  		goto fail_block_grou=
ps;
68310a5e42f93c Ilya Dryomov        2012-06-22  3519  	}
68310a5e42f93c Ilya Dryomov        2012-06-22  3520  =

733f4fbbc1083a Stefan Behrens      2012-05-25  3521  	ret =3D btrfs_init_de=
v_stats(fs_info);
733f4fbbc1083a Stefan Behrens      2012-05-25  3522  	if (ret) {
05135f597adcb9 David Sterba        2016-05-09  3523  		btrfs_err(fs_info, "=
failed to init dev_stats: %d", ret);
733f4fbbc1083a Stefan Behrens      2012-05-25  3524  		goto fail_block_grou=
ps;
733f4fbbc1083a Stefan Behrens      2012-05-25  3525  	}
733f4fbbc1083a Stefan Behrens      2012-05-25  3526  =

8dabb7420f014a Stefan Behrens      2012-11-06  3527  	ret =3D btrfs_init_de=
v_replace(fs_info);
8dabb7420f014a Stefan Behrens      2012-11-06  3528  	if (ret) {
05135f597adcb9 David Sterba        2016-05-09  3529  		btrfs_err(fs_info, "=
failed to init dev_replace: %d", ret);
8dabb7420f014a Stefan Behrens      2012-11-06  3530  		goto fail_block_grou=
ps;
8dabb7420f014a Stefan Behrens      2012-11-06  3531  	}
8dabb7420f014a Stefan Behrens      2012-11-06  3532  =

b70f509774ad4b Naohiro Aota        2020-11-10  3533  	ret =3D btrfs_check_z=
oned_mode(fs_info);
b70f509774ad4b Naohiro Aota        2020-11-10  3534  	if (ret) {
b70f509774ad4b Naohiro Aota        2020-11-10  3535  		btrfs_err(fs_info, "=
failed to initialize zoned mode: %d",
b70f509774ad4b Naohiro Aota        2020-11-10  3536  			  ret);
b70f509774ad4b Naohiro Aota        2020-11-10  3537  		goto fail_block_grou=
ps;
b70f509774ad4b Naohiro Aota        2020-11-10  3538  	}
b70f509774ad4b Naohiro Aota        2020-11-10  3539  =

c6761a9ed329dd Anand Jain          2019-11-21  3540  	ret =3D btrfs_sysfs_a=
dd_fsid(fs_devices);
b7c35e81adcd59 Anand Jain          2015-03-10  3541  	if (ret) {
05135f597adcb9 David Sterba        2016-05-09  3542  		btrfs_err(fs_info, "=
failed to init sysfs fsid interface: %d",
05135f597adcb9 David Sterba        2016-05-09  3543  				ret);
b7c35e81adcd59 Anand Jain          2015-03-10  3544  		goto fail_block_grou=
ps;
b7c35e81adcd59 Anand Jain          2015-03-10  3545  	}
b7c35e81adcd59 Anand Jain          2015-03-10  3546  =

96f3136e51580e Anand Jain          2015-08-14  3547  	ret =3D btrfs_sysfs_a=
dd_mounted(fs_info);
c59021f846881a liubo               2011-03-07  3548  	if (ret) {
05135f597adcb9 David Sterba        2016-05-09  3549  		btrfs_err(fs_info, "=
failed to init sysfs interface: %d", ret);
b7c35e81adcd59 Anand Jain          2015-03-10  3550  		goto fail_fsdev_sysf=
s;
c59021f846881a liubo               2011-03-07  3551  	}
c59021f846881a liubo               2011-03-07  3552  =

c59021f846881a liubo               2011-03-07  3553  	ret =3D btrfs_init_sp=
ace_info(fs_info);
c59021f846881a liubo               2011-03-07  3554  	if (ret) {
05135f597adcb9 David Sterba        2016-05-09  3555  		btrfs_err(fs_info, "=
failed to initialize space info: %d", ret);
2365dd3ca02bbb Anand Jain          2014-01-22  3556  		goto fail_sysfs;
c59021f846881a liubo               2011-03-07  3557  	}
c59021f846881a liubo               2011-03-07  3558  =

5b4aacefb8fbfc Jeff Mahoney        2016-06-21  3559  	ret =3D btrfs_read_bl=
ock_groups(fs_info);
1b1d1f6625e517 Josef Bacik         2010-03-19  3560  	if (ret) {
05135f597adcb9 David Sterba        2016-05-09  3561  		btrfs_err(fs_info, "=
failed to read block groups: %d", ret);
2365dd3ca02bbb Anand Jain          2014-01-22  3562  		goto fail_sysfs;
1b1d1f6625e517 Josef Bacik         2010-03-19  3563  	}
4330e183c9537d Qu Wenruo           2017-03-09  3564  =

6528b99d3d2079 Anand Jain          2017-12-18  3565  	if (!sb_rdonly(sb) &&=
 !btrfs_check_rw_degradable(fs_info, NULL)) {
05135f597adcb9 David Sterba        2016-05-09  3566  		btrfs_warn(fs_info,
52042d8e82ff50 Andrea Gelmini      2018-11-28  3567  		"writable mount is n=
ot allowed due to too many missing devices");
2365dd3ca02bbb Anand Jain          2014-01-22  3568  		goto fail_sysfs;
292fd7fc39aa06 Stefan Behrens      2012-10-30  3569  	}
9078a3e1e4e489 Chris Mason         2007-04-26  3570  =

a74a4b97b61bee Chris Mason         2008-06-25  3571  	fs_info->cleaner_kthr=
ead =3D kthread_run(cleaner_kthread, tree_root,
a74a4b97b61bee Chris Mason         2008-06-25  3572  					       "btrfs-cle=
aner");
57506d50ed6db7 Qinghuang Feng      2009-01-21  3573  	if (IS_ERR(fs_info->c=
leaner_kthread))
2365dd3ca02bbb Anand Jain          2014-01-22  3574  		goto fail_sysfs;
a74a4b97b61bee Chris Mason         2008-06-25  3575  =

a74a4b97b61bee Chris Mason         2008-06-25  3576  	fs_info->transaction_=
kthread =3D kthread_run(transaction_kthread,
a74a4b97b61bee Chris Mason         2008-06-25  3577  						   tree_root,
a74a4b97b61bee Chris Mason         2008-06-25  3578  						   "btrfs-transa=
ction");
57506d50ed6db7 Qinghuang Feng      2009-01-21  3579  	if (IS_ERR(fs_info->t=
ransaction_kthread))
3f157a2fd2ad73 Chris Mason         2008-06-25  3580  		goto fail_cleaner;
a74a4b97b61bee Chris Mason         2008-06-25  3581  =

583b723151794e Hans van Kranenburg 2017-07-28  3582  	if (!btrfs_test_opt(f=
s_info, NOSSD) &&
c289811cc096c5 Chris Mason         2009-06-10  3583  	    !fs_info->fs_devi=
ces->rotating) {
583b723151794e Hans van Kranenburg 2017-07-28  3584  		btrfs_set_and_info(f=
s_info, SSD, "enabling ssd optimizations");
c289811cc096c5 Chris Mason         2009-06-10  3585  	}
c289811cc096c5 Chris Mason         2009-06-10  3586  =

572d9ab7845ea0 David Sterba        2014-02-05  3587  	/*
0132761017e012 Nicholas D Steeves  2016-05-19  3588  	 * Mount does not set=
 all options immediately, we can do it now and do
572d9ab7845ea0 David Sterba        2014-02-05  3589  	 * not have to wait f=
or transaction commit
572d9ab7845ea0 David Sterba        2014-02-05  3590  	 */
572d9ab7845ea0 David Sterba        2014-02-05  3591  	btrfs_apply_pending_c=
hanges(fs_info);
3818aea2754232 Qu Wenruo           2014-01-13  3592  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4716827189075304203==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4716827189075304203==--

