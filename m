Content-Type: multipart/mixed; boundary="===============7661316276300621890=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 55/78] drivers/cxl/region.c:104:24: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Sat, 07 May 2022 04:59:00 +0800
Message-ID: <202205070400.fUPaxENt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7661316276300621890==
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
:::::: branch date: 2 months ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20220504 (https://download.01.org/0day-ci/arc=
hive/20220507/202205070400.fUPaxENt-lkp(a)intel.com/config)
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
           ^
   include/asm-generic/bitops/__ffs.h:35:6: note: Assuming the condition is=
 true
           if ((word & 0x3) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:35:2: note: Taking true branch
           if ((word & 0x3) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:36:3: note: The value 62 is assigned =
to 'num'
                   num +=3D 2;
                   ^~~~~~~~
   include/asm-generic/bitops/__ffs.h:39:6: note: Assuming the condition is=
 false
           if ((word & 0x1) =3D=3D 0)
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:39:2: note: Taking false branch
           if ((word & 0x1) =3D=3D 0)
           ^
   include/asm-generic/bitops/__ffs.h:41:2: note: Returning the value 62 (l=
oaded from 'num')
           return num;
           ^~~~~~~~~~
   drivers/mfd/tc3589x.c:189:13: note: Returning from '__ffs'
                   int bit =3D __ffs(status);
                             ^~~~~~~~~~~~~
   drivers/mfd/tc3589x.c:189:3: note: 'bit' initialized to 62
                   int bit =3D __ffs(status);
                   ^~~~~~~
   drivers/mfd/tc3589x.c:193:17: note: The result of the left shift is unde=
fined due to shifting by '62', which is greater or equal to the width of ty=
pe 'int'
                   status &=3D ~(1 << bit);
                                 ^  ~~~
   drivers/mfd/tc3589x.c:193:17: warning: The result of the left shift is u=
ndefined due to shifting by '63', which is greater or equal to the width of=
 type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   status &=3D ~(1 << bit);
                                 ^  ~~~
   drivers/mfd/tc3589x.c:185:6: note: Assuming 'status' is >=3D 0
           if (status < 0)
               ^~~~~~~~~~
   drivers/mfd/tc3589x.c:185:2: note: Taking false branch
           if (status < 0)
           ^
   drivers/mfd/tc3589x.c:188:2: note: Loop condition is true.  Entering loo=
p body
           while (status) {
           ^
   drivers/mfd/tc3589x.c:189:13: note: Calling '__ffs'
                   int bit =3D __ffs(status);
                             ^~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:18:6: note: Assuming the condition is=
 true
           if ((word & 0xffffffff) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:18:2: note: Taking true branch
           if ((word & 0xffffffff) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:23:6: note: Assuming the condition is=
 true
           if ((word & 0xffff) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:23:2: note: Taking true branch
           if ((word & 0xffff) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:27:6: note: Assuming the condition is=
 true
           if ((word & 0xff) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:27:2: note: Taking true branch
           if ((word & 0xff) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:31:6: note: Assuming the condition is=
 true
           if ((word & 0xf) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:31:2: note: Taking true branch
           if ((word & 0xf) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:35:6: note: Assuming the condition is=
 true
           if ((word & 0x3) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:35:2: note: Taking true branch
           if ((word & 0x3) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:39:6: note: Assuming the condition is=
 true
           if ((word & 0x1) =3D=3D 0)
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:39:2: note: Taking true branch
           if ((word & 0x1) =3D=3D 0)
           ^
   include/asm-generic/bitops/__ffs.h:40:3: note: The value 63 is assigned =
to 'num'
                   num +=3D 1;
                   ^~~~~~~~
   include/asm-generic/bitops/__ffs.h:41:2: note: Returning the value 63 (l=
oaded from 'num')
           return num;
           ^~~~~~~~~~
   drivers/mfd/tc3589x.c:189:13: note: Returning from '__ffs'
                   int bit =3D __ffs(status);
                             ^~~~~~~~~~~~~
   drivers/mfd/tc3589x.c:189:3: note: 'bit' initialized to 63
                   int bit =3D __ffs(status);
                   ^~~~~~~
   drivers/mfd/tc3589x.c:193:17: note: The result of the left shift is unde=
fined due to shifting by '63', which is greater or equal to the width of ty=
pe 'int'
                   status &=3D ~(1 << bit);
                                 ^  ~~~
   Suppressed 14 warnings (6 in non-user code, 8 with check filters).
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
   13 warnings generated.
   drivers/char/hw_random/ixp4xx-rng.c:44:17: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct device *dev =3D &pdev->dev;
                          ^~~   ~~~~~~~~~~
   drivers/char/hw_random/ixp4xx-rng.c:44:17: note: Value stored to 'dev' d=
uring its initialization is never read
           struct device *dev =3D &pdev->dev;
                          ^~~   ~~~~~~~~~~
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

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
--===============7661316276300621890==--

