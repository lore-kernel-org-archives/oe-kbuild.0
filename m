Content-Type: multipart/mixed; boundary="===============5501411537196029077=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/5] mtd: always initialize 'stats' in struct mtd_oob_ops
Date: Mon, 03 Jan 2022 17:13:06 +0800
Message-ID: <202201031718.RSuDGlkG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5501411537196029077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211216083418.13512-4-kernel@kempniu.pl>
References: <20211216083418.13512-4-kernel@kempniu.pl>
TO: "Micha=C5=82 K=C4=99pie=C5=84" <kernel@kempniu.pl>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
TO: Richard Weinberger <richard@nod.at>
TO: Vignesh Raghavendra <vigneshr@ti.com>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: linux-mtd(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org

Hi "Micha=C5=82,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mtd/mtd/next]
[also build test WARNING on mtd/mtd/fixes v5.16-rc8]
[cannot apply to mtd/nand/next next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Micha-K-pie/mtdchar-add-ME=
MREAD-ioctl/20211216-163537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/n=
ext
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-c007-20211227 (https://download.01.org/0day-ci/ar=
chive/20220103/202201031718.RSuDGlkG-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726=
c64d3b6cca66f7c54d457d586aa3129f67)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f409cccc4e5bfd85e27726787=
0c49d05ba50e4a5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Micha-K-pie/mtdchar-add-MEMREAD-io=
ctl/20211216-163537
        git checkout f409cccc4e5bfd85e277267870c49d05ba50e4a5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                         ^
   drivers/hwmon/adc128d818.c:217:11: note: '?' condition is false
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
                    ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                                  ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/adc128d818.c:217:11: note: '__UNIQUE_ID___x601' is < '__UN=
IQUE_ID___y602'
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
                    ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/hwmon/adc128d818.c:217:11: note: '?' condition is true
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
                    ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/adc128d818.c:217:2: note: The value -128 is assigned to 'r=
egval'
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/adc128d818.c:218:29: note: The result of the left shift is=
 undefined because the left operand is negative
           data->temp[index] =3D regval << 1;
                               ~~~~~~ ^
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
   drivers/mtd/devices/phram.c:231:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(str, val);
           ^~~~~~
   drivers/mtd/devices/phram.c:231:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(str, val);
           ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/mtd/devices/block2mtd.c:402:2: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcpy(str, val);
           ^~~~~~
   drivers/mtd/devices/block2mtd.c:402:2: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
           strcpy(str, val);
           ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/mtd/nand/onenand/onenand_base.c:3083:8: warning: Assigned value =
is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                           buf +=3D tmp_retlen;
                               ^
   drivers/mtd/nand/onenand/onenand_base.c:3156:9: note: Calling 'onenand_o=
tp_walk'
           return onenand_otp_walk(mtd, from, len, retlen, buf, do_otp_read=
, MTD_OTP_USER);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3038:6: note: Assuming 'density'=
 is >=3D ONENAND_DEVICE_DENSITY_512Mb
           if (density < ONENAND_DEVICE_DENSITY_512Mb)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3038:2: note: Taking false branch
           if (density < ONENAND_DEVICE_DENSITY_512Mb)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3043:6: note: 'mode' is not equa=
l to MTD_OTP_FACTORY
           if (mode =3D=3D MTD_OTP_FACTORY) {
               ^~~~
   drivers/mtd/nand/onenand/onenand_base.c:3043:2: note: Taking false branch
           if (mode =3D=3D MTD_OTP_FACTORY) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3049:6: note: 'mode' is equal to=
 MTD_OTP_USER
           if (mode =3D=3D MTD_OTP_USER) {
               ^~~~
   drivers/mtd/nand/onenand/onenand_base.c:3049:2: note: Taking true branch
           if (mode =3D=3D MTD_OTP_USER) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3050:7: note: Assuming the condi=
tion is false
                   if (mtd->writesize * otp_pages < from + len)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3050:3: note: Taking false branch
                   if (mtd->writesize * otp_pages < from + len)
                   ^
   drivers/mtd/nand/onenand/onenand_base.c:3058:9: note: Assuming 'len' is =
> 0
           while (len > 0 && otp_pages > 0) {
                  ^~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3058:9: note: Left side of '&&' =
is true
   drivers/mtd/nand/onenand/onenand_base.c:3058:2: note: Loop condition is =
true.  Entering loop body
           while (len > 0 && otp_pages > 0) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3059:8: note: 'action' is non-nu=
ll
                   if (!action) {  /* OTP Info functions */
                        ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3059:3: note: Taking false branch
                   if (!action) {  /* OTP Info functions */
                   ^
   drivers/mtd/nand/onenand/onenand_base.c:3077:4: note: 'tmp_retlen' decla=
red without an initial value
                           size_t tmp_retlen;
                           ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3079:10: note: Calling 'do_otp_r=
ead'
                           ret =3D action(mtd, from, len, &tmp_retlen, buf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2911:28: note: Assuming the cond=
ition is true
           ret =3D ONENAND_IS_4KB_PAGE(this) ?
                                     ^
   include/linux/mtd/onenand.h:206:3: note: expanded from macro 'ONENAND_IS=
_4KB_PAGE'
           (this->options & ONENAND_HAS_4KB_PAGE)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2911:8: note: '?' condition is t=
rue
           ret =3D ONENAND_IS_4KB_PAGE(this) ?
                 ^
   include/linux/mtd/onenand.h:206:2: note: expanded from macro 'ONENAND_IS=
_4KB_PAGE'
           (this->options & ONENAND_HAS_4KB_PAGE)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:2912:3: note: Calling 'onenand_m=
lc_read_ops_nolock'
                   onenand_mlc_read_ops_nolock(mtd, from, &ops) :
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1128:2: note: Taking false branch
           pr_debug("%s: from =3D 0x%08x, len =3D %i\n", __func__, (unsigne=
d int)from,
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/mtd/nand/onenand/onenand_base.c:1135:6: note: Assuming the condi=
tion is false
           if (from + len > mtd->size) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1135:2: note: Taking false branch
           if (from + len > mtd->size) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:1145:9: note: 'read' is < 'len'
           while (read < len) {
                  ^~~~
   drivers/mtd/nand/onenand/onenand_base.c:1145:2: note: Loop condition is =
true.  Entering loop body
           while (read < len) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:1148:13: note: Assuming '__UNIQU=
E_ID___x410' is >=3D '__UNIQUE_ID___y411'
                   thislen =3D min_t(int, writesize, len - read);
                             ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1148:13: note: '?' condition is =
false

vim +3083 drivers/mtd/nand/onenand/onenand_base.c

493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3013  =

493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3014  /**
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3015   * onenand_otp_walk - [DEFAULT] Handle OTP operation
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones        202=
0-11-09  3016   * @mtd:		MTD device structure
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones        202=
0-11-09  3017   * @from:		The offset to read/write
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones        202=
0-11-09  3018   * @len:		number of bytes to read/write
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones        202=
0-11-09  3019   * @retlen:	pointer to variable to store the number of read =
bytes
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones        202=
0-11-09  3020   * @buf:		the databuffer to put/get data
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones        202=
0-11-09  3021   * @action:	do given action
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones        202=
0-11-09  3022   * @mode:		specify user and factory
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3023   *
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3024   * Handle OTP operation.
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3025   */
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3026  static int onenand_otp_walk(struct mtd_info *mtd, loff_t fro=
m, size_t len,
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3027  			size_t *retlen, u_char *buf,
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3028  			otp_op_t action, int mode)
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3029  {
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3030  	struct onenand_chip *this =3D mtd->priv;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3031  	int otp_pages;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3032  	int density;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3033  	int ret =3D 0;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3034  =

493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3035  	*retlen =3D 0;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3036  =

e71f04fc9234b1 drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
7-12-11  3037  	density =3D onenand_get_density(this->device_id);
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3038  	if (density < ONENAND_DEVICE_DENSITY_512Mb)
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3039  		otp_pages =3D 20;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3040  	else
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha  200=
9-10-21  3041  		otp_pages =3D 50;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3042  =

493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3043  	if (mode =3D=3D MTD_OTP_FACTORY) {
28318776a80bc3 drivers/mtd/onenand/onenand_base.c      Joern Engel      200=
6-05-22  3044  		from +=3D mtd->writesize * otp_pages;
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha  200=
9-10-21  3045  		otp_pages =3D ONENAND_PAGES_PER_BLOCK - otp_pages;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3046  	}
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3047  =

493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3048  	/* Check User/Factory boundary */
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha  200=
9-10-21  3049  	if (mode =3D=3D MTD_OTP_USER) {
0a032a4df6dc4a drivers/mtd/onenand/onenand_base.c      Roel Kluin       200=
9-12-16  3050  		if (mtd->writesize * otp_pages < from + len)
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3051  			return 0;
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha  200=
9-10-21  3052  	} else {
0a032a4df6dc4a drivers/mtd/onenand/onenand_base.c      Roel Kluin       200=
9-12-16  3053  		if (mtd->writesize * otp_pages <  len)
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha  200=
9-10-21  3054  			return 0;
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha  200=
9-10-21  3055  	}
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3056  =

49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy 200=
7-09-21  3057  	onenand_get_device(mtd, FL_OTPING);
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3058  	while (len > 0 && otp_pages > 0) {
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3059  		if (!action) {	/* OTP Info functions */
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3060  			struct otp_info *otpinfo;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3061  =

493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3062  			len -=3D sizeof(struct otp_info);
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy 200=
7-09-21  3063  			if (len <=3D 0) {
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy 200=
7-09-21  3064  				ret =3D -ENOSPC;
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy 200=
7-09-21  3065  				break;
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy 200=
7-09-21  3066  			}
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3067  =

493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3068  			otpinfo =3D (struct otp_info *) buf;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3069  			otpinfo->start =3D from;
28318776a80bc3 drivers/mtd/onenand/onenand_base.c      Joern Engel      200=
6-05-22  3070  			otpinfo->length =3D mtd->writesize;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3071  			otpinfo->locked =3D 0;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3072  =

28318776a80bc3 drivers/mtd/onenand/onenand_base.c      Joern Engel      200=
6-05-22  3073  			from +=3D mtd->writesize;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3074  			buf +=3D sizeof(struct otp_info);
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3075  			*retlen +=3D sizeof(struct otp_info);
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3076  		} else {
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3077  			size_t tmp_retlen;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3078  =

493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3079  			ret =3D action(mtd, from, len, &tmp_retlen, buf);
c3cb77f8980db9 drivers/mtd/onenand/onenand_base.c      Dan Carpenter    201=
6-04-13  3080  			if (ret)
c3cb77f8980db9 drivers/mtd/onenand/onenand_base.c      Dan Carpenter    201=
6-04-13  3081  				break;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3082  =

3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha  200=
9-10-21 @3083  			buf +=3D tmp_retlen;
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha  200=
9-10-21  3084  			len -=3D tmp_retlen;
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha  200=
9-10-21  3085  			*retlen +=3D tmp_retlen;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3086  =

493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3087  		}
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3088  		otp_pages--;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3089  	}
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy 200=
7-09-21  3090  	onenand_release_device(mtd);
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3091  =

49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy 200=
7-09-21  3092  	return ret;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3093  }
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park    200=
6-05-12  3094  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5501411537196029077==--

