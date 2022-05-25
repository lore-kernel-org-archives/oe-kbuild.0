Content-Type: multipart/mixed; boundary="===============4575238823705573200=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/hi847.c:2586:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 25 May 2022 15:34:40 +0800
Message-ID: <202205251504.9xRjsFim-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4575238823705573200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Shawn Tu <shawnx.tu@intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fdaf9a5840acaab18694a19e0eb0aa51162eeeed
commit: da15b409ef4c56e9741deddb91798370802d1d02 media: hi847: Add support =
for Hi-847 sensor
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220524 (https://download.01.org/0day-ci/archi=
ve/20220525/202205251504.9xRjsFim-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ec=
ce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dda15b409ef4c56e9741deddb91798370802d1d02
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout da15b409ef4c56e9741deddb91798370802d1d02
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/btrfs/extent-tree.c:1115:9: note: Left side of '&&' is true
           BUG_ON(refs_to_mod < 0 && refs < -refs_to_mod);
                  ^
   fs/btrfs/extent-tree.c:1115:2: note: Taking false branch
           BUG_ON(refs_to_mod < 0 && refs < -refs_to_mod);
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/btrfs/extent-tree.c:1115:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON(refs_to_mod < 0 && refs < -refs_to_mod);
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/btrfs/extent-tree.c:1118:6: note: 'refs' is <=3D 0
           if (refs > 0) {
               ^~~~
   fs/btrfs/extent-tree.c:1118:2: note: Taking false branch
           if (refs > 0) {
           ^
   fs/btrfs/extent-tree.c:1124:13: note: Dereference of null pointer (loade=
d from variable 'last_ref')
                   *last_ref =3D 1;
                    ~~~~~~~~ ^
   fs/btrfs/extent-tree.c:2042:5: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                                   ret =3D 0;
                                   ^     ~
   fs/btrfs/extent-tree.c:2042:5: note: Value stored to 'ret' is never read
                                   ret =3D 0;
                                   ^     ~
   fs/btrfs/extent-tree.c:2769:8: warning: Value stored to 'to_add' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
                           u64 to_add =3D len;
                               ^~~~~~   ~~~
   fs/btrfs/extent-tree.c:2769:8: note: Value stored to 'to_add' during its=
 initialization is never read
                           u64 to_add =3D len;
                               ^~~~~~   ~~~
   fs/btrfs/extent-tree.c:2819:4: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           ret =3D btrfs_discard_extent(fs_info, start,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent-tree.c:2819:4: note: Value stored to 'ret' is never read
                           ret =3D btrfs_discard_extent(fs_info, start,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent-tree.c:3048:5: warning: Value stored to 'skinny_metadata=
' is never read [clang-analyzer-deadcode.DeadStores]
                                   skinny_metadata =3D false;
                                   ^                 ~~~~~
   fs/btrfs/extent-tree.c:3048:5: note: Value stored to 'skinny_metadata' i=
s never read
                                   skinny_metadata =3D false;
                                   ^                 ~~~~~
   fs/btrfs/extent-tree.c:4382:5: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                                   ret =3D 0;
                                   ^     ~
   fs/btrfs/extent-tree.c:4382:5: note: Value stored to 'ret' is never read
                                   ret =3D 0;
                                   ^     ~
   fs/btrfs/extent-tree.c:4385:4: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/btrfs/extent-tree.c:4385:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   fs/btrfs/extent-tree.c:5366:4: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/btrfs/extent-tree.c:5366:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   fs/btrfs/extent-tree.c:6003:2: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   fs/btrfs/extent-tree.c:6003:2: note: Value stored to 'ret' is never read
           ret =3D 0;
           ^     ~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   4 warnings generated.
   drivers/media/i2c/hi846.c:1494:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(&hi846->sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1494:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(&hi846->sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1762:2: warning: Value stored to 'tgt_fps' is =
never read [clang-analyzer-deadcode.DeadStores]
           tgt_fps =3D hi846->cur_mode->fps;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1762:2: note: Value stored to 'tgt_fps' is nev=
er read
           tgt_fps =3D hi846->cur_mode->fps;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1803:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1803:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
>> drivers/media/i2c/hi847.c:2586:2: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           ret =3D hi847_write_reg(hi847, HI847_REG_MODE_TG,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi847.c:2586:2: note: Value stored to 'ret' is never r=
ead
           ret =3D hi847_write_reg(hi847, HI847_REG_MODE_TG,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/iio/proximity/vcnl3020.c:76:8: warning: Excessive padding in 'st=
ruct vcnl3020_data' (41 padding bytes, where 9 is optimal). =

   Optimal fields order: =

   buf, =

   rev, =

   regmap, =

   dev, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct vcnl3020_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/proximity/vcnl3020.c:76:8: note: Excessive padding in 'struc=
t vcnl3020_data' (41 padding bytes, where 9 is optimal). Optimal fields ord=
er: buf, rev, regmap, dev, lock, consider reordering the fields or adding e=
xplicit padding members
   struct vcnl3020_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   1 warning generated.
   drivers/iio/resolver/ad2s90.c:24:8: warning: Excessive padding in 'struc=
t ad2s90_state' (46 padding bytes, where 14 is optimal). =

   Optimal fields order: =

   rx, =

   sdev, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad2s90_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/resolver/ad2s90.c:24:8: note: Excessive padding in 'struct a=
d2s90_state' (46 padding bytes, where 14 is optimal). Optimal fields order:=
 rx, sdev, lock, consider reordering the fields or adding explicit padding =
members
   struct ad2s90_state {
   ~~~~~~~^~~~~~~~~~~~~~
   2 warnings generated.
   drivers/media/i2c/ov772x.c:583:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov772x.c:583:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   4 warnings generated.
   drivers/media/i2c/ov8856.c:1827:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_1,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1827:2: note: Value stored to 'ret' is never =
read
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_1,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1839:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_2,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1839:2: note: Value stored to 'ret' is never =
read
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_2,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1849:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_3,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1849:2: note: Value stored to 'ret' is never =
read
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_3,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   fs/fuse/dir.c:505:3: warning: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(ptr, name);
                   ^~~~~~
   fs/fuse/dir.c:505:3: note: Call to function 'strcpy' is insecure as it d=
oes not provide bounding of the memory buffer. Replace unbounded copy funct=
ions with analogous functions that support length arguments such as 'strlcp=
y'. CWE-119
                   strcpy(ptr, name);
                   ^~~~~~
   fs/fuse/dir.c:762:2: warning: Address of stack memory associated with lo=
cal variable 'outarg' is still referred to by the stack variable 'args' upo=
n returning to the caller.  This will be a dangling reference [clang-analyz=
er-core.StackAddressEscape]
           return err;
           ^
   fs/fuse/dir.c:829:9: note: Calling 'create_new_entry'
           return create_new_entry(fm, &args, dir, entry, S_IFLNK);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dir.c:700:2: note: Taking false branch
           if (fuse_is_bad(dir))
           ^
   fs/fuse/dir.c:704:6: note: Assuming 'forget' is non-null
           if (!forget)
               ^~~~~~~
   fs/fuse/dir.c:704:2: note: Taking false branch
           if (!forget)
           ^
   fs/fuse/dir.c:713:6: note: Assuming field 'init_security' is not equal t=
o 0
           if (fm->fc->init_security && args->opcode !=3D FUSE_LINK) {
               ^~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dir.c:713:6: note: Left side of '&&' is true
   fs/fuse/dir.c:713:37: note: Field 'opcode' is not equal to FUSE_LINK
           if (fm->fc->init_security && args->opcode !=3D FUSE_LINK) {
                                              ^
   fs/fuse/dir.c:713:2: note: Taking true branch
           if (fm->fc->init_security && args->opcode !=3D FUSE_LINK) {
           ^
   fs/fuse/dir.c:716:7: note: 'err' is not equal to 0
                   if (err)
                       ^~~
   fs/fuse/dir.c:716:3: note: Taking true branch

vim +/ret +2586 drivers/media/i2c/hi847.c

da15b409ef4c56 Shawn Tu 2022-01-11  2560  =

da15b409ef4c56 Shawn Tu 2022-01-11  2561  static int hi847_start_streaming(=
struct hi847 *hi847)
da15b409ef4c56 Shawn Tu 2022-01-11  2562  {
da15b409ef4c56 Shawn Tu 2022-01-11  2563  	struct i2c_client *client =3D v4=
l2_get_subdevdata(&hi847->sd);
da15b409ef4c56 Shawn Tu 2022-01-11  2564  	const struct hi847_reg_list *reg=
_list;
da15b409ef4c56 Shawn Tu 2022-01-11  2565  	int link_freq_index, ret;
da15b409ef4c56 Shawn Tu 2022-01-11  2566  =

da15b409ef4c56 Shawn Tu 2022-01-11  2567  	link_freq_index =3D hi847->cur_m=
ode->link_freq_index;
da15b409ef4c56 Shawn Tu 2022-01-11  2568  	reg_list =3D &link_freq_configs[=
link_freq_index].reg_list;
da15b409ef4c56 Shawn Tu 2022-01-11  2569  	ret =3D hi847_write_reg_list(hi8=
47, reg_list);
da15b409ef4c56 Shawn Tu 2022-01-11  2570  	if (ret) {
da15b409ef4c56 Shawn Tu 2022-01-11  2571  		dev_err(&client->dev, "failed t=
o set plls");
da15b409ef4c56 Shawn Tu 2022-01-11  2572  		return ret;
da15b409ef4c56 Shawn Tu 2022-01-11  2573  	}
da15b409ef4c56 Shawn Tu 2022-01-11  2574  =

da15b409ef4c56 Shawn Tu 2022-01-11  2575  	reg_list =3D &hi847->cur_mode->r=
eg_list;
da15b409ef4c56 Shawn Tu 2022-01-11  2576  	ret =3D hi847_write_reg_list(hi8=
47, reg_list);
da15b409ef4c56 Shawn Tu 2022-01-11  2577  	if (ret) {
da15b409ef4c56 Shawn Tu 2022-01-11  2578  		dev_err(&client->dev, "failed t=
o set mode");
da15b409ef4c56 Shawn Tu 2022-01-11  2579  		return ret;
da15b409ef4c56 Shawn Tu 2022-01-11  2580  	}
da15b409ef4c56 Shawn Tu 2022-01-11  2581  =

da15b409ef4c56 Shawn Tu 2022-01-11  2582  	ret =3D __v4l2_ctrl_handler_setu=
p(hi847->sd.ctrl_handler);
da15b409ef4c56 Shawn Tu 2022-01-11  2583  	if (ret)
da15b409ef4c56 Shawn Tu 2022-01-11  2584  		return ret;
da15b409ef4c56 Shawn Tu 2022-01-11  2585  =

da15b409ef4c56 Shawn Tu 2022-01-11 @2586  	ret =3D hi847_write_reg(hi847, H=
I847_REG_MODE_TG,
da15b409ef4c56 Shawn Tu 2022-01-11  2587  			      HI847_REG_VALUE_16BIT, H=
I847_REG_MODE_TG_ENABLE);
da15b409ef4c56 Shawn Tu 2022-01-11  2588  =

da15b409ef4c56 Shawn Tu 2022-01-11  2589  	ret =3D hi847_write_reg(hi847, H=
I847_REG_MODE_SELECT,
da15b409ef4c56 Shawn Tu 2022-01-11  2590  			      HI847_REG_VALUE_16BIT, H=
I847_MODE_STREAMING);
da15b409ef4c56 Shawn Tu 2022-01-11  2591  =

da15b409ef4c56 Shawn Tu 2022-01-11  2592  	if (ret) {
da15b409ef4c56 Shawn Tu 2022-01-11  2593  		dev_err(&client->dev, "failed t=
o set stream");
da15b409ef4c56 Shawn Tu 2022-01-11  2594  		return ret;
da15b409ef4c56 Shawn Tu 2022-01-11  2595  	}
da15b409ef4c56 Shawn Tu 2022-01-11  2596  =

da15b409ef4c56 Shawn Tu 2022-01-11  2597  	return 0;
da15b409ef4c56 Shawn Tu 2022-01-11  2598  }
da15b409ef4c56 Shawn Tu 2022-01-11  2599  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4575238823705573200==--

