Content-Type: multipart/mixed; boundary="===============8169598688593822960=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 55/78] drivers/cxl/region.c:104:24: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Fri, 06 May 2022 01:41:44 +0800
Message-ID: <202205060129.LYyjyw0D-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8169598688593822960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-kernel(a)vger.kernel.org
TO: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   9b688fc651b9d2b633e8d959454670aba1c39162
commit: 786e9e583773745bcd55c225d3a2643454dcca84 [55/78] cxl/region: Introd=
uce a cxl_region driver
:::::: branch date: 10 weeks ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20220504 (https://download.01.org/0day-ci/arc=
hive/20220506/202205060129.LYyjyw0D-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commi=
t/?id=3D786e9e583773745bcd55c225d3a2643454dcca84
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/=
cxl/cxl.git
        git fetch --no-tags cxl preview
        git checkout 786e9e583773745bcd55c225d3a2643454dcca84
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^      ~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:1572:3: warning: Value stored to 'ents' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   ents =3D hdr2.ents;
                   ^      ~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_node.c:1572:3: note: Value stored to 'ents' is ne=
ver read
                   ents =3D hdr2.ents;
                   ^      ~~~~~~~~~
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/clk/clk-max9485.c:199:9: warning: Access to field 'out' results =
in a dereference of a null pointer (loaded from variable 'prev') [clang-ana=
lyzer-core.NullDereference]
           return prev->out;
                  ^~~~
   drivers/clk/clk-max9485.c:165:36: note: 'prev' initialized to a null poi=
nter value
           const struct max9485_rate *curr, *prev =3D NULL;
                                             ^~~~
   drivers/clk/clk-max9485.c:167:29: note: Assuming field 'out' is equal to=
 0
           for (curr =3D max9485_rates; curr->out !=3D 0; curr++) {
                                      ^~~~~~~~~~~~~~
   drivers/clk/clk-max9485.c:167:2: note: Loop condition is false. Executio=
n continues on line 199
           for (curr =3D max9485_rates; curr->out !=3D 0; curr++) {
           ^
   drivers/clk/clk-max9485.c:199:9: note: Access to field 'out' results in =
a dereference of a null pointer (loaded from variable 'prev')
           return prev->out;
                  ^~~~
   drivers/clk/clk-max9485.c:202:8: warning: Excessive padding in 'struct m=
ax9485_clk' (11 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   name, =

   ops, =

   parent_index, =

   enable_bit, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct max9485_clk {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/clk/clk-max9485.c:202:8: note: Excessive padding in 'struct max9=
485_clk' (11 padding bytes, where 3 is optimal). Optimal fields order: name=
, ops, parent_index, enable_bit, consider reordering the fields or adding e=
xplicit padding members
   struct max9485_clk {
   ~~~~~~~^~~~~~~~~~~~~
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   fs/btrfs/free-space-tree.c:1476:3: warning: Value stored to 'total_found=
' is never read [clang-analyzer-deadcode.DeadStores]
                   total_found +=3D add_new_free_space(block_group, extent_=
start,
                   ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/btrfs/free-space-tree.c:1476:3: note: Value stored to 'total_found' i=
s never read
                   total_found +=3D add_new_free_space(block_group, extent_=
start,
                   ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   fs/btrfs/space-info.c:1565:3: warning: Value stored to 'used' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   used +=3D orig_bytes;
                   ^       ~~~~~~~~~~
   fs/btrfs/space-info.c:1565:3: note: Value stored to 'used' is never read
                   used +=3D orig_bytes;
                   ^       ~~~~~~~~~~
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   fs/btrfs/block-rsv.c:115:3: warning: Value stored to 'qgroup_to_release'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   qgroup_to_release =3D block_rsv->qgroup_rsv_size;
                   ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/block-rsv.c:115:3: note: Value stored to 'qgroup_to_release' is=
 never read
                   qgroup_to_release =3D block_rsv->qgroup_rsv_size;
                   ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/cxl/region.c:104:24: warning: Division by zero [clang-analyzer-c=
ore.DivideZero]
           if (cxlr->config.size % (SZ_256M * iw)) {
                                 ^
   drivers/cxl/region.c:289:6: note: Assuming field 'active' is false
           if (cxlr->active)
               ^~~~~~~~~~~~
   drivers/cxl/region.c:289:2: note: Taking false branch
           if (cxlr->active)
           ^
   drivers/cxl/region.c:292:2: note: Taking false branch
           if (uuid_is_null(&cxlr->config.uuid))
           ^
   drivers/cxl/region.c:297:8: note: Calling 'sanitize_region'
           ret =3D sanitize_region(cxlr);
                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:85:32: note: Assuming the condition is false
           if (dev_WARN_ONCE(&cxlr->dev, !is_cxl_region_configured(cxlr),
                                         ^
   include/linux/dev_printk.h:274:12: note: expanded from macro 'dev_WARN_O=
NCE'
           WARN_ONCE(condition, "%s %s: " format, \
                     ^~~~~~~~~
   include/asm-generic/bug.h:150:18: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   drivers/cxl/region.c:85:6: note: '__ret_do_once' is false
           if (dev_WARN_ONCE(&cxlr->dev, !is_cxl_region_configured(cxlr),
               ^
   include/linux/dev_printk.h:274:2: note: expanded from macro 'dev_WARN_ON=
CE'
           WARN_ONCE(condition, "%s %s: " format, \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/cxl/region.c:85:6: note: Left side of '&&' is false
           if (dev_WARN_ONCE(&cxlr->dev, !is_cxl_region_configured(cxlr),
               ^
   include/linux/dev_printk.h:274:2: note: expanded from macro 'dev_WARN_ON=
CE'
           WARN_ONCE(condition, "%s %s: " format, \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   drivers/cxl/region.c:85:6: note: Taking false branch
           if (dev_WARN_ONCE(&cxlr->dev, !is_cxl_region_configured(cxlr),
               ^
   include/linux/dev_printk.h:274:2: note: expanded from macro 'dev_WARN_ON=
CE'
           WARN_ONCE(condition, "%s %s: " format, \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   drivers/cxl/region.c:85:2: note: Taking false branch
           if (dev_WARN_ONCE(&cxlr->dev, !is_cxl_region_configured(cxlr),
           ^
   drivers/cxl/region.c:94:2: note: Taking false branch
           if (!cxl_is_interleave_ways_valid(iw)) {
           ^
   drivers/cxl/region.c:99:2: note: Taking false branch
           if (!cxl_is_interleave_granularity_valid(ig)) {
           ^
   drivers/cxl/region.c:104:24: note: Division by zero
           if (cxlr->config.size % (SZ_256M * iw)) {
               ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/base/regmap/regmap-debugfs.c:657:6: note: Assuming field 'debugf=
s' is non-null
           if (map->debugfs) {
               ^~~~~~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:657:2: note: Taking true branch
           if (map->debugfs) {
           ^
   drivers/base/regmap/regmap-debugfs.c:660:3: note: Calling 'regmap_debugf=
s_free_dump_cache'
                   regmap_debugfs_free_dump_cache(map);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:71:2: note: Loop condition is true.=
  Entering loop body
           while (!list_empty(&map->debugfs_off_cache)) {
           ^
   drivers/base/regmap/regmap-debugfs.c:76:3: note: Memory is released
                   kfree(c);
                   ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:71:2: note: Loop condition is true.=
  Entering loop body
           while (!list_empty(&map->debugfs_off_cache)) {

vim +104 drivers/cxl/region.c

786e9e58377374 Ben Widawsky 2022-02-11   66  =

786e9e58377374 Ben Widawsky 2022-02-11   67  /**
786e9e58377374 Ben Widawsky 2022-02-11   68   * sanitize_region() - Check i=
s region is reasonably configured
786e9e58377374 Ben Widawsky 2022-02-11   69   * @cxlr: The region to check
786e9e58377374 Ben Widawsky 2022-02-11   70   *
786e9e58377374 Ben Widawsky 2022-02-11   71   * Determination as to whether=
 or not a region can possibly be configured is
786e9e58377374 Ben Widawsky 2022-02-11   72   * described in CXL Memory Dev=
ice SW Guide. In order to implement the algorithms
786e9e58377374 Ben Widawsky 2022-02-11   73   * described there, certain mo=
re basic configuration parameters must first need
786e9e58377374 Ben Widawsky 2022-02-11   74   * to be validated. That is ac=
complished by this function.
786e9e58377374 Ben Widawsky 2022-02-11   75   *
786e9e58377374 Ben Widawsky 2022-02-11   76   * Returns 0 if the region is =
reasonably configured, else returns a negative
786e9e58377374 Ben Widawsky 2022-02-11   77   * error code.
786e9e58377374 Ben Widawsky 2022-02-11   78   */
786e9e58377374 Ben Widawsky 2022-02-11   79  static int sanitize_region(con=
st struct cxl_region *cxlr)
786e9e58377374 Ben Widawsky 2022-02-11   80  {
786e9e58377374 Ben Widawsky 2022-02-11   81  	const int ig =3D region_granu=
larity(cxlr);
786e9e58377374 Ben Widawsky 2022-02-11   82  	const int iw =3D region_ways(=
cxlr);
786e9e58377374 Ben Widawsky 2022-02-11   83  	int i;
786e9e58377374 Ben Widawsky 2022-02-11   84  =

786e9e58377374 Ben Widawsky 2022-02-11   85  	if (dev_WARN_ONCE(&cxlr->dev,=
 !is_cxl_region_configured(cxlr),
786e9e58377374 Ben Widawsky 2022-02-11   86  			  "unconfigured regions can=
't be probed (race?)\n")) {
786e9e58377374 Ben Widawsky 2022-02-11   87  		return -ENXIO;
786e9e58377374 Ben Widawsky 2022-02-11   88  	}
786e9e58377374 Ben Widawsky 2022-02-11   89  =

786e9e58377374 Ben Widawsky 2022-02-11   90  	/*
786e9e58377374 Ben Widawsky 2022-02-11   91  	 * Interleave attributes shou=
ld be caught by later math, but it's
786e9e58377374 Ben Widawsky 2022-02-11   92  	 * easiest to find those issu=
es here, now.
786e9e58377374 Ben Widawsky 2022-02-11   93  	 */
786e9e58377374 Ben Widawsky 2022-02-11   94  	if (!cxl_is_interleave_ways_v=
alid(iw)) {
786e9e58377374 Ben Widawsky 2022-02-11   95  		dev_dbg(&cxlr->dev, "Invalid=
 number of ways\n");
786e9e58377374 Ben Widawsky 2022-02-11   96  		return -ENXIO;
786e9e58377374 Ben Widawsky 2022-02-11   97  	}
786e9e58377374 Ben Widawsky 2022-02-11   98  =

786e9e58377374 Ben Widawsky 2022-02-11   99  	if (!cxl_is_interleave_granul=
arity_valid(ig)) {
786e9e58377374 Ben Widawsky 2022-02-11  100  		dev_dbg(&cxlr->dev, "Invalid=
 interleave granularity\n");
786e9e58377374 Ben Widawsky 2022-02-11  101  		return -ENXIO;
786e9e58377374 Ben Widawsky 2022-02-11  102  	}
786e9e58377374 Ben Widawsky 2022-02-11  103  =

786e9e58377374 Ben Widawsky 2022-02-11 @104  	if (cxlr->config.size % (SZ_2=
56M * iw)) {
786e9e58377374 Ben Widawsky 2022-02-11  105  		dev_dbg(&cxlr->dev, "Invalid=
 size. Must be multiple of %uM\n",
786e9e58377374 Ben Widawsky 2022-02-11  106  			256 * iw);
786e9e58377374 Ben Widawsky 2022-02-11  107  		return -ENXIO;
786e9e58377374 Ben Widawsky 2022-02-11  108  	}
786e9e58377374 Ben Widawsky 2022-02-11  109  =

786e9e58377374 Ben Widawsky 2022-02-11  110  	for (i =3D 0; i < iw; i++) {
786e9e58377374 Ben Widawsky 2022-02-11  111  		if (!cxlr->config.targets[i]=
) {
786e9e58377374 Ben Widawsky 2022-02-11  112  			dev_dbg(&cxlr->dev, "Missin=
g memory device target%u",
786e9e58377374 Ben Widawsky 2022-02-11  113  				i);
786e9e58377374 Ben Widawsky 2022-02-11  114  			return -ENXIO;
786e9e58377374 Ben Widawsky 2022-02-11  115  		}
786e9e58377374 Ben Widawsky 2022-02-11  116  		if (!cxlr->config.targets[i]=
->dev.driver) {
786e9e58377374 Ben Widawsky 2022-02-11  117  			dev_dbg(&cxlr->dev, "%s isn=
't CXL.mem capable\n",
786e9e58377374 Ben Widawsky 2022-02-11  118  				dev_name(&cxlr->config.tar=
gets[i]->dev));
786e9e58377374 Ben Widawsky 2022-02-11  119  			return -ENODEV;
786e9e58377374 Ben Widawsky 2022-02-11  120  		}
786e9e58377374 Ben Widawsky 2022-02-11  121  	}
786e9e58377374 Ben Widawsky 2022-02-11  122  =

786e9e58377374 Ben Widawsky 2022-02-11  123  	return 0;
786e9e58377374 Ben Widawsky 2022-02-11  124  }
786e9e58377374 Ben Widawsky 2022-02-11  125  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8169598688593822960==--

