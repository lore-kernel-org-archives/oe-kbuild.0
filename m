Content-Type: multipart/mixed; boundary="===============3160729133728755000=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [bvanassche:block-bitwise-opf 15/15] block/bfq-cgroup.c:257:6: sparse: void extern [addressable] [toplevel] bfqg_stats_update_io_add( ... )
Date: Mon, 20 Jun 2022 04:42:59 +0800
Message-ID: <202206200448.VOH0zeEJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3160729133728755000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: block/bfq=
-cgroup.c:257:6: sparse:    void extern [addressable] [toplevel] bfqg_stats=
_update_io_add( ... )"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux block-bitwise-opf
head:   031ccdd616b11c4e774e56aa7eae906188ab24cc
commit: 031ccdd616b11c4e774e56aa7eae906188ab24cc [15/15] block: Introduce t=
he type blk_mq_opf_t
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-s031-20220619 (https://download.01.org/0day-ci/arc=
hive/20220620/202206200448.VOH0zeEJ-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        # https://github.com/bvanassche/linux/commit/031ccdd616b11c4e774e56=
aa7eae906188ab24cc
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche block-bitwise-opf
        git checkout 031ccdd616b11c4e774e56aa7eae906188ab24cc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dr=
iscv SHELL=3D/bin/bash block/ drivers/md/ drivers/ufs/core/ fs/ext4/ fs/jfs=
/ fs/nilfs2/ fs/zonefs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> fs/ext4/page-io.c:400:51: sparse: sparse: incorrect type in argument 3 (=
different base types) @@     expected restricted blk_mq_opf_t [usertype] op=
f @@     got int @@
   fs/ext4/page-io.c:400:51: sparse:     expected restricted blk_mq_opf_t [=
usertype] opf
   fs/ext4/page-io.c:400:51: sparse:     got int
--
>> fs/ext4/fast_commit.c:661:27: sparse: sparse: incorrect type in initiali=
zer (different base types) @@     expected int write_flags @@     got restr=
icted blk_mq_opf_t [usertype] @@
   fs/ext4/fast_commit.c:661:27: sparse:     expected int write_flags
   fs/ext4/fast_commit.c:661:27: sparse:     got restricted blk_mq_opf_t [u=
sertype]
>> fs/ext4/fast_commit.c:666:29: sparse: sparse: invalid assignment: |=3D
>> fs/ext4/fast_commit.c:666:29: sparse:    left side has type int
>> fs/ext4/fast_commit.c:666:29: sparse:    right side has type restricted =
blk_mq_opf_t
>> fs/ext4/fast_commit.c:671:33: sparse: sparse: incorrect type in argument=
 2 (different base types) @@     expected restricted blk_mq_opf_t [usertype=
] @@     got int write_flags @@
   fs/ext4/fast_commit.c:671:33: sparse:     expected restricted blk_mq_opf=
_t [usertype]
   fs/ext4/fast_commit.c:671:33: sparse:     got int write_flags
--
>> fs/jfs/jfs_metapage.c:420:57: sparse: sparse: incorrect type in argument=
 3 (different base types) @@     expected restricted blk_mq_opf_t [usertype=
] opf @@     got int @@
   fs/jfs/jfs_metapage.c:420:57: sparse:     expected restricted blk_mq_opf=
_t [usertype] opf
   fs/jfs/jfs_metapage.c:420:57: sparse:     got int
--
>> fs/jfs/jfs_logmgr.c:2116:54: sparse: sparse: restricted blk_mq_opf_t deg=
rades to integer
>> fs/jfs/jfs_logmgr.c:2116:52: sparse: sparse: incorrect type in argument =
3 (different base types) @@     expected restricted blk_mq_opf_t [usertype]=
 opf @@     got unsigned int @@
   fs/jfs/jfs_logmgr.c:2116:52: sparse:     expected restricted blk_mq_opf_=
t [usertype] opf
   fs/jfs/jfs_logmgr.c:2116:52: sparse:     got unsigned int
--
>> fs/nilfs2/btnode.c:106:26: sparse: sparse: restricted blk_mq_opf_t degra=
des to integer
>> fs/nilfs2/btnode.c:125:25: sparse: sparse: incorrect type in argument 2 =
(different base types) @@     expected restricted blk_mq_opf_t [usertype] @=
@     got int mode_flags @@
   fs/nilfs2/btnode.c:125:25: sparse:     expected restricted blk_mq_opf_t =
[usertype]
   fs/nilfs2/btnode.c:125:25: sparse:     got int mode_flags
--
>> fs/nilfs2/mdt.c:129:26: sparse: sparse: restricted blk_mq_opf_t degrades=
 to integer
>> fs/nilfs2/mdt.c:151:25: sparse: sparse: incorrect type in argument 2 (di=
fferent base types) @@     expected restricted blk_mq_opf_t [usertype] @@  =
   got int mode_flags @@
   fs/nilfs2/mdt.c:151:25: sparse:     expected restricted blk_mq_opf_t [us=
ertype]
   fs/nilfs2/mdt.c:151:25: sparse:     got int mode_flags
>> fs/nilfs2/mdt.c:186:54: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected int mode_flags @@     got restricted bl=
k_mq_opf_t [usertype] @@
   fs/nilfs2/mdt.c:186:54: sparse:     expected int mode_flags
   fs/nilfs2/mdt.c:186:54: sparse:     got restricted blk_mq_opf_t [usertyp=
e]
--
>> fs/nilfs2/btree.c:498:70: sparse: sparse: incorrect type in argument 5 (=
different base types) @@     expected int @@     got restricted blk_mq_opf_=
t [usertype] @@
   fs/nilfs2/btree.c:498:70: sparse:     expected int
   fs/nilfs2/btree.c:498:70: sparse:     got restricted blk_mq_opf_t [usert=
ype]
--
>> fs/nilfs2/segbuf.c:377:37: sparse: sparse: incorrect type in argument 3 =
(different base types) @@     expected restricted blk_mq_opf_t [usertype] o=
pf @@     got int @@
   fs/nilfs2/segbuf.c:377:37: sparse:     expected restricted blk_mq_opf_t =
[usertype] opf
   fs/nilfs2/segbuf.c:377:37: sparse:     got int
--
>> fs/zonefs/super.c:779:46: sparse: sparse: restricted blk_mq_opf_t degrad=
es to integer
   fs/zonefs/super.c:779:57: sparse: sparse: restricted blk_mq_opf_t degrad=
es to integer
>> fs/zonefs/super.c:779:55: sparse: sparse: incorrect type in argument 3 (=
different base types) @@     expected restricted blk_mq_opf_t [usertype] op=
f @@     got unsigned int @@
   fs/zonefs/super.c:779:55: sparse:     expected restricted blk_mq_opf_t [=
usertype] opf
   fs/zonefs/super.c:779:55: sparse:     got unsigned int
--
   block/bfq-cgroup.c:257:6: sparse: sparse: symbol 'bfqg_stats_update_io_a=
dd' redeclared with different type (incompatible argument 3 (different base=
 types)):
>> block/bfq-cgroup.c:257:6: sparse:    void extern [addressable] [toplevel=
] bfqg_stats_update_io_add( ... )
   block/bfq-cgroup.c: note: in included file:
   block/bfq-iosched.h:996:6: sparse: note: previously declared as:
>> block/bfq-iosched.h:996:6: sparse:    void extern [addressable] [topleve=
l] bfqg_stats_update_io_add( ... )
   block/bfq-cgroup.c:259:6: sparse: sparse: symbol 'bfqg_stats_update_io_r=
emove' redeclared with different type (incompatible argument 2 (different b=
ase types)):
>> block/bfq-cgroup.c:259:6: sparse:    void extern [addressable] [toplevel=
] bfqg_stats_update_io_remove( ... )
   block/bfq-iosched.h:998:6: sparse: note: previously declared as:
>> block/bfq-iosched.h:998:6: sparse:    void extern [addressable] [topleve=
l] bfqg_stats_update_io_remove( ... )
   block/bfq-cgroup.c:260:6: sparse: sparse: symbol 'bfqg_stats_update_io_m=
erged' redeclared with different type (incompatible argument 2 (different b=
ase types)):
>> block/bfq-cgroup.c:260:6: sparse:    void extern [addressable] [toplevel=
] bfqg_stats_update_io_merged( ... )
   block/bfq-iosched.h:999:6: sparse: note: previously declared as:
>> block/bfq-iosched.h:999:6: sparse:    void extern [addressable] [topleve=
l] bfqg_stats_update_io_merged( ... )
   block/bfq-cgroup.c:261:6: sparse: sparse: symbol 'bfqg_stats_update_comp=
letion' redeclared with different type (incompatible argument 4 (different =
base types)):
>> block/bfq-cgroup.c:261:6: sparse:    void extern [addressable] [toplevel=
] bfqg_stats_update_completion( ... )
   block/bfq-iosched.h:1000:6: sparse: note: previously declared as:
>> block/bfq-iosched.h:1000:6: sparse:    void extern [addressable] [toplev=
el] bfqg_stats_update_completion( ... )
--
>> block/blk-iocost.c:2772:30: sparse: sparse: restricted blk_mq_opf_t degr=
ades to integer
   block/blk-iocost.c:733:9: sparse: sparse: context imbalance in 'iocg_loc=
k' - wrong count at exit
   block/blk-iocost.c:744:28: sparse: sparse: context imbalance in 'iocg_un=
lock' - unexpected unlock
--
>> block/bfq-iosched.c:2600:59: sparse: sparse: incorrect type in argument =
2 (different base types) @@     expected unsigned int op @@     got restric=
ted blk_mq_opf_t [usertype] cmd_flags @@
   block/bfq-iosched.c:2600:59: sparse:     expected unsigned int op
   block/bfq-iosched.c:2600:59: sparse:     got restricted blk_mq_opf_t [us=
ertype] cmd_flags
   block/bfq-iosched.c:2607:57: sparse: sparse: incorrect type in argument =
2 (different base types) @@     expected unsigned int op @@     got restric=
ted blk_mq_opf_t [usertype] cmd_flags @@
   block/bfq-iosched.c:2607:57: sparse:     expected unsigned int op
   block/bfq-iosched.c:2607:57: sparse:     got restricted blk_mq_opf_t [us=
ertype] cmd_flags
   block/bfq-iosched.c:6564:48: sparse: sparse: incorrect type in argument =
4 (different base types) @@     expected unsigned int op @@     got restric=
ted blk_mq_opf_t [usertype] cmd_flags @@
   block/bfq-iosched.c:6564:48: sparse:     expected unsigned int op
   block/bfq-iosched.c:6564:48: sparse:     got restricted blk_mq_opf_t [us=
ertype] cmd_flags
--
   drivers/md/raid10.c:1946:37: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:1946:37: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:1946:37: sparse:    struct md_rdev *
   drivers/md/raid10.c:4919:33: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:4919:33: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:4919:33: sparse:    struct md_rdev *
   drivers/md/raid10.c:4922:33: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:4922:33: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:4922:33: sparse:    struct md_rdev *
   drivers/md/raid10.c:5011:32: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:5011:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:5011:32: sparse:    struct md_rdev *
   drivers/md/raid10.c:5014:32: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:5014:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:5014:32: sparse:    struct md_rdev *
   drivers/md/raid10.c:759:24: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid10.c:759:24: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:759:24: sparse:    struct md_rdev *
   drivers/md/raid10.c:762:32: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid10.c:762:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:762:32: sparse:    struct md_rdev *
   drivers/md/raid10.c:1165:28: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:1165:28: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:1165:28: sparse:    struct md_rdev *
   drivers/md/raid10.c:1303:40: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:1303:40: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:1303:40: sparse:    struct md_rdev *
   drivers/md/raid10.c:1304:41: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:1304:41: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:1304:41: sparse:    struct md_rdev *
   drivers/md/raid10.c:1434:40: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:1434:40: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:1434:40: sparse:    struct md_rdev *
   drivers/md/raid10.c:1435:41: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:1435:41: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:1435:41: sparse:    struct md_rdev *
   drivers/md/raid10.c:1744:40: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:1744:40: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:1744:40: sparse:    struct md_rdev *
   drivers/md/raid10.c:1745:41: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:1745:41: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:1745:41: sparse:    struct md_rdev *
   drivers/md/raid10.c:1913:40: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:1913:40: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:1913:40: sparse:    struct md_rdev *
   drivers/md/raid10.c:2142:25: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:2142:25: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:2142:25: sparse:    struct md_rdev *
   drivers/md/raid10.c:2156:17: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:2156:17: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:2156:17: sparse:    struct md_rdev *
>> drivers/md/raid10.c:2424:62: sparse: sparse: incorrect type in argument =
3 (different base types) @@     expected restricted blk_mq_opf_t [usertype]=
 opf @@     got int @@
   drivers/md/raid10.c:2716:32: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:2716:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:2716:32: sparse:    struct md_rdev *
   drivers/md/raid10.c:2769:32: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:2769:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:2769:32: sparse:    struct md_rdev *
   drivers/md/raid10.c:2803:32: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:2803:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:2803:32: sparse:    struct md_rdev *
   drivers/md/raid10.c:3313:49: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:3313:49: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:3313:49: sparse:    struct md_rdev *
   drivers/md/raid10.c:3388:33: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:3388:33: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:3388:33: sparse:    struct md_rdev *
   drivers/md/raid10.c:3389:36: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:3389:36: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:3389:36: sparse:    struct md_rdev *
   drivers/md/raid10.c:3459:56: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:3459:56: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:3459:56: sparse:    struct md_rdev *
   drivers/md/raid10.c:3476:41: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:3476:41: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:3476:41: sparse:    struct md_rdev *
   drivers/md/raid10.c:3679:32: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:3679:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:3679:32: sparse:    struct md_rdev *
   drivers/md/raid10.c:3709:32: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:3709:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:3709:32: sparse:    struct md_rdev *
   drivers/md/raid10.c:4452:40: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:4452:40: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:4452:40: sparse:    struct md_rdev *
   drivers/md/raid10.c:4468:40: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:4468:40: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:4468:40: sparse:    struct md_rdev *
   drivers/md/raid10.c:5096:48: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:5096:48: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:5096:48: sparse:    struct md_rdev *
   drivers/md/raid10.c:5192:48: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:5192:48: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:5192:48: sparse:    struct md_rdev *
   drivers/md/raid10.c:5195:32: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   drivers/md/raid10.c:5195:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid10.c:5195:32: sparse:    struct md_rdev *
--
>> drivers/ufs/core/ufshpb.c:82:30: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected restricted blk_mq_opf_t [usert=
ype] op @@     got unsigned int enum req_op @@
   drivers/ufs/core/ufshpb.c:82:30: sparse:     expected restricted blk_mq_=
opf_t [usertype] op
   drivers/ufs/core/ufshpb.c:82:30: sparse:     got unsigned int enum req_op

vim +257 block/bfq-cgroup.c

a33801e8b4735b Luca Miccio     2017-11-13  256  =

a33801e8b4735b Luca Miccio     2017-11-13 @257  void bfqg_stats_update_io_a=
dd(struct bfq_group *bfqg, struct bfq_queue *bfqq,
031ccdd616b11c Bart Van Assche 2022-06-16  258  			      blk_mq_opf_t op) {=
 }
031ccdd616b11c Bart Van Assche 2022-06-16 @259  void bfqg_stats_update_io_r=
emove(struct bfq_group *bfqg, blk_mq_opf_t op) { }
031ccdd616b11c Bart Van Assche 2022-06-16 @260  void bfqg_stats_update_io_m=
erged(struct bfq_group *bfqg, blk_mq_opf_t op) { }
84c7afcebed913 Omar Sandoval   2018-05-09 @261  void bfqg_stats_update_comp=
letion(struct bfq_group *bfqg, u64 start_time_ns,
031ccdd616b11c Bart Van Assche 2022-06-16  262  				  u64 io_start_time_ns,=
 blk_mq_opf_t op) { }
a33801e8b4735b Luca Miccio     2017-11-13  263  void bfqg_stats_update_dequ=
eue(struct bfq_group *bfqg) { }
a33801e8b4735b Luca Miccio     2017-11-13  264  void bfqg_stats_set_start_e=
mpty_time(struct bfq_group *bfqg) { }
a33801e8b4735b Luca Miccio     2017-11-13  265  void bfqg_stats_update_idle=
_time(struct bfq_group *bfqg) { }
a33801e8b4735b Luca Miccio     2017-11-13  266  void bfqg_stats_set_start_i=
dle_time(struct bfq_group *bfqg) { }
a33801e8b4735b Luca Miccio     2017-11-13  267  void bfqg_stats_update_avg_=
queue_size(struct bfq_group *bfqg) { }
a33801e8b4735b Luca Miccio     2017-11-13  268  =


:::::: The code at line 257 was first introduced by commit
:::::: a33801e8b4735b8d473f963e5854172f9cde3e8b block, bfq: move debug blki=
o stats behind CONFIG_DEBUG_BLK_CGROUP

:::::: TO: Luca Miccio <lucmiccio@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3160729133728755000==--

