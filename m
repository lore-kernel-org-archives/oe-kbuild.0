Content-Type: multipart/mixed; boundary="===============8600409485132212319=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V8 3/3] rtc: zynqmp: Add calibration set and get support
Date: Fri, 01 Jul 2022 21:52:45 +0800
Message-ID: <202207012151.nYCjgJqj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8600409485132212319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/r=
tc/rtc-zynqmp.c:238:6: warning: Branch condition evaluates to a garbage val=
ue [clang-analyzer-core.uninitialized.Branch]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220613125836.523449-3-srinivas.neeli@xilinx.com>
References: <20220613125836.523449-3-srinivas.neeli@xilinx.com>
TO: Srinivas Neeli <srinivas.neeli@xilinx.com>

Hi Srinivas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on v5.19-rc4 next-20220701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Neeli/dt-bi=
ndings-rtc-zynqmp-Add-clock-information/20220614-013701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git =
rtc-next
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220629 (https://download.01.org/0day-ci/archi=
ve/20220701/202207012151.nYCjgJqj-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a774ba=
7f60d1fef403b5507b1b1a7475d3684d71)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/2781fd75583878d86f2=
56113b19bb005dc83fb70
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Srinivas-Neeli/dt-bindings-rtc-zyn=
qmp-Add-clock-information/20220614-013701
        git checkout 2781fd75583878d86f256113b19bb005dc83fb70
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/usb/gadget/function/f_fs.c:1884:2: note: Taking true branch
           if (!WARN_ON(!ffs->gadget)) {
           ^
   drivers/usb/gadget/function/f_fs.c:1888:3: note: '?' condition is true
                   clear_bit(FFS_FL_BOUND, &ffs->flags);
                   ^
   arch/arm/include/asm/bitops.h:190:27: note: expanded from macro 'clear_b=
it'
   #define clear_bit(nr,p)                 ATOMIC_BITOP(clear_bit,nr,p)
                                           ^
   arch/arm/include/asm/bitops.h:181:3: note: expanded from macro 'ATOMIC_B=
ITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
            ^
   drivers/usb/gadget/function/f_fs.c:1889:3: note: Calling 'ffs_data_put'
                   ffs_data_put(ffs);
                   ^~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1697:2: note: Loop condition is false=
.  Exiting loop
           ENTER();
           ^
   drivers/usb/gadget/function/u_fs.h:35:20: note: expanded from macro 'ENT=
ER'
   #define ENTER()    pr_vdebug("%s()\n", __func__)
                      ^
   drivers/usb/gadget/function/u_fs.h:30:42: note: expanded from macro 'pr_=
vdebug'
   #  define pr_vdebug(...)                 do { } while (0)
                                            ^
   drivers/usb/gadget/function/f_fs.c:1699:2: note: Taking true branch
           if (refcount_dec_and_test(&ffs->ref)) {
           ^
   drivers/usb/gadget/function/f_fs.c:1700:3: note: Loop condition is false=
.  Exiting loop
                   pr_info("%s(): freeing\n", __func__);
                   ^
   include/linux/printk.h:548:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:475:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:446:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:421:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/usb/gadget/function/f_fs.c:1703:10: note: Assuming the condition=
 is true
                   BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
                          ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/usb/gadget/function/f_fs.c:1703:43: note: Left side of '||' is t=
rue
                   BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
                                                           ^
   drivers/usb/gadget/function/f_fs.c:1703:3: note: Assuming the condition =
is false
                   BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
                   ^
   include/asm-generic/bug.h:71:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1703:3: note: Taking false branch
                   BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
                   ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/usb/gadget/function/f_fs.c:1703:3: note: Loop condition is false=
.  Exiting loop
                   BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
                   ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/usb/gadget/function/f_fs.c:1708:3: note: Memory is released
                   kfree(ffs);
                   ^~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:1889:3: note: Returning; memory was r=
eleased via 1st parameter
                   ffs_data_put(ffs);
                   ^~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:3605:3: note: Returning; memory was r=
eleased via 1st parameter
                   functionfs_unbind(ffs);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:3608:2: note: Calling 'spinlock_check'
           spin_lock_irqsave(&func->ffs->eps_lock, flags);
           ^
   include/linux/spinlock.h:379:24: note: expanded from macro 'spin_lock_ir=
qsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:242:34: note: expanded from macro 'raw_spin_loc=
k_irqsave'
                   flags =3D _raw_spin_lock_irqsave(lock);   \
                                                  ^~~~
   include/linux/spinlock.h:324:2: note: Use of memory after it is freed
           return &lock->rlock;
           ^      ~~~~~~~~~~~~
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
>> drivers/rtc/rtc-zynqmp.c:238:6: warning: Branch condition evaluates to a=
 garbage value [clang-analyzer-core.uninitialized.Branch]
           if (fract_tick)
               ^~~~~~~~~~
   drivers/rtc/rtc-zynqmp.c:205:27: note: Left side of '&&' is false
           unsigned int tick_mult =3D do_div(rtc_ppb, xrtcdev->freq);
                                    ^
   include/asm-generic/div64.h:223:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/rtc/rtc-zynqmp.c:205:27: note: Left side of '&&' is false
           unsigned int tick_mult =3D do_div(rtc_ppb, xrtcdev->freq);
                                    ^
   include/asm-generic/div64.h:227:42: note: expanded from macro 'do_div'
           } else if (__builtin_constant_p(__base) &&      \
                                                   ^
   drivers/rtc/rtc-zynqmp.c:205:27: note: Taking true branch
           unsigned int tick_mult =3D do_div(rtc_ppb, xrtcdev->freq);
                                    ^
   include/asm-generic/div64.h:234:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   drivers/rtc/rtc-zynqmp.c:206:2: note: 'fract_tick' declared without an i=
nitial value
           unsigned char fract_tick;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-zynqmp.c:211:6: note: Assuming the condition is false
           if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-zynqmp.c:211:6: note: Left side of '||' is false
   drivers/rtc/rtc-zynqmp.c:211:33: note: Assuming 'offset' is <=3D RTC_MAX=
_OFFSET
           if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
                                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-zynqmp.c:211:2: note: Taking false branch
           if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
           ^
   drivers/rtc/rtc-zynqmp.c:218:6: note: Assuming 'fract_offset' is 0
           if (fract_offset) {
               ^~~~~~~~~~~~
   drivers/rtc/rtc-zynqmp.c:218:2: note: Taking false branch
           if (fract_offset) {
           ^
   drivers/rtc/rtc-zynqmp.c:238:6: note: Branch condition evaluates to a ga=
rbage value
           if (fract_tick)
               ^~~~~~~~~~
   Suppressed 31 warnings (29 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/i2c/i2c-core-base.c:645:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           return sprintf(buf, "%s\n", dev->type =3D=3D &i2c_client_type ?
                  ^~~~~~~
   drivers/i2c/i2c-core-base.c:645:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           return sprintf(buf, "%s\n", dev->type =3D=3D &i2c_client_type ?
                  ^~~~~~~
   drivers/i2c/i2c-core-base.c:664:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           return sprintf(buf, "%s%s\n", I2C_MODULE_PREFIX, client->name);
                  ^~~~~~~
   drivers/i2c/i2c-core-base.c:664:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           return sprintf(buf, "%s%s\n", I2C_MODULE_PREFIX, client->name);
                  ^~~~~~~
   drivers/i2c/i2c-core-base.c:1185:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info, 0, sizeof(struct i2c_board_info));
           ^~~~~~
   drivers/i2c/i2c-core-base.c:1185:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(&info, 0, sizeof(struct i2c_board_info));
           ^~~~~~
   drivers/i2c/i2c-core-base.c:1196:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(info.type, buf, blank - buf);
           ^~~~~~
   drivers/i2c/i2c-core-base.c:1196:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(info.type, buf, blank - buf);
           ^~~~~~
   drivers/i2c/i2c-core-base.c:1199:8: warning: Call to function 'sscanf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           res =3D sscanf(++blank, "%hi%c", &info.addr, &end);
                 ^~~~~~
   drivers/i2c/i2c-core-base.c:1199:8: note: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11
           res =3D sscanf(++blank, "%hi%c", &info.addr, &end);
                 ^~~~~~
   drivers/i2c/i2c-core-base.c:1254:8: warning: Call to function 'sscanf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           res =3D sscanf(buf, "%hi%c", &addr, &end);
                 ^~~~~~
   drivers/i2c/i2c-core-base.c:1254:8: note: Call to function 'sscanf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sscanf_s' in case of C11
           res =3D sscanf(buf, "%hi%c", &addr, &end);
                 ^~~~~~
   drivers/i2c/i2c-core-base.c:1740:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&adap->dev, 0, sizeof(adap->dev));
           ^~~~~~
   drivers/i2c/i2c-core-base.c:1740:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(&adap->dev, 0, sizeof(adap->dev));
           ^~~~~~
   drivers/i2c/i2c-core-base.c:2316:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info, 0, sizeof(struct i2c_board_info));
           ^~~~~~
   drivers/i2c/i2c-core-base.c:2316:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(&info, 0, sizeof(struct i2c_board_info));
           ^~~~~~
   drivers/i2c/i2c-core-base.c:2521:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(msg->buf, buf, msg->len);
                   ^~~~~~
   drivers/i2c/i2c-core-base.c:2521:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11

vim +238 drivers/rtc/rtc-zynqmp.c

2781fd75583878 Srinivas Neeli  2022-06-13  200  =

2781fd75583878 Srinivas Neeli  2022-06-13  201  static int xlnx_rtc_set_off=
set(struct device *dev, long offset)
2781fd75583878 Srinivas Neeli  2022-06-13  202  {
2781fd75583878 Srinivas Neeli  2022-06-13  203  	struct xlnx_rtc_dev *xrtcd=
ev =3D dev_get_drvdata(dev);
2781fd75583878 Srinivas Neeli  2022-06-13  204  	unsigned long long rtc_ppb=
 =3D RTC_PPB;
2781fd75583878 Srinivas Neeli  2022-06-13  205  	unsigned int tick_mult =3D=
 do_div(rtc_ppb, xrtcdev->freq);
2781fd75583878 Srinivas Neeli  2022-06-13  206  	unsigned char fract_tick;
2781fd75583878 Srinivas Neeli  2022-06-13  207  	unsigned int calibval;
2781fd75583878 Srinivas Neeli  2022-06-13  208  	short int  max_tick;
2781fd75583878 Srinivas Neeli  2022-06-13  209  	int fract_offset;
2781fd75583878 Srinivas Neeli  2022-06-13  210  =

2781fd75583878 Srinivas Neeli  2022-06-13  211  	if (offset < RTC_MIN_OFFSE=
T || offset > RTC_MAX_OFFSET)
2781fd75583878 Srinivas Neeli  2022-06-13  212  		return -ERANGE;
2781fd75583878 Srinivas Neeli  2022-06-13  213  =

2781fd75583878 Srinivas Neeli  2022-06-13  214  	/* Number ticks for given =
offset */
2781fd75583878 Srinivas Neeli  2022-06-13  215  	max_tick =3D div_s64_rem(o=
ffset, tick_mult, &fract_offset);
2781fd75583878 Srinivas Neeli  2022-06-13  216  =

2781fd75583878 Srinivas Neeli  2022-06-13  217  	/* Number fractional ticks=
 for given offset */
2781fd75583878 Srinivas Neeli  2022-06-13  218  	if (fract_offset) {
2781fd75583878 Srinivas Neeli  2022-06-13  219  		if (fract_offset < 0) {
2781fd75583878 Srinivas Neeli  2022-06-13  220  			fract_offset =3D fract_o=
ffset + tick_mult;
2781fd75583878 Srinivas Neeli  2022-06-13  221  			max_tick--;
2781fd75583878 Srinivas Neeli  2022-06-13  222  		}
2781fd75583878 Srinivas Neeli  2022-06-13  223  		if (fract_offset > (tick_=
mult / RTC_FR_MAX_TICKS)) {
2781fd75583878 Srinivas Neeli  2022-06-13  224  			for (fract_tick =3D 1; f=
ract_tick < 16; fract_tick++) {
2781fd75583878 Srinivas Neeli  2022-06-13  225  				if (fract_offset <=3D
2781fd75583878 Srinivas Neeli  2022-06-13  226  				    (fract_tick *
2781fd75583878 Srinivas Neeli  2022-06-13  227  				     (tick_mult / RTC_F=
R_MAX_TICKS)))
2781fd75583878 Srinivas Neeli  2022-06-13  228  					break;
2781fd75583878 Srinivas Neeli  2022-06-13  229  			}
2781fd75583878 Srinivas Neeli  2022-06-13  230  		}
2781fd75583878 Srinivas Neeli  2022-06-13  231  	}
2781fd75583878 Srinivas Neeli  2022-06-13  232  =

2781fd75583878 Srinivas Neeli  2022-06-13  233  	/* Zynqmp RTC uses second =
and fractional tick
2781fd75583878 Srinivas Neeli  2022-06-13  234  	 * counters for compensati=
on
11143c19eb57a8 Suneel Garapati 2015-08-19  235  	 */
2781fd75583878 Srinivas Neeli  2022-06-13  236  	calibval =3D max_tick + RT=
C_CALIB_DEF;
2781fd75583878 Srinivas Neeli  2022-06-13  237  =

2781fd75583878 Srinivas Neeli  2022-06-13 @238  	if (fract_tick)
2781fd75583878 Srinivas Neeli  2022-06-13  239  		calibval |=3D RTC_FR_EN;
2781fd75583878 Srinivas Neeli  2022-06-13  240  =

2781fd75583878 Srinivas Neeli  2022-06-13  241  	calibval |=3D (fract_tick =
<< RTC_FR_DATSHIFT);
2781fd75583878 Srinivas Neeli  2022-06-13  242  =

2781fd75583878 Srinivas Neeli  2022-06-13  243  	writel(calibval, (xrtcdev-=
>reg_base + RTC_CALIB_WR));
2781fd75583878 Srinivas Neeli  2022-06-13  244  =

2781fd75583878 Srinivas Neeli  2022-06-13  245  	return 0;
11143c19eb57a8 Suneel Garapati 2015-08-19  246  }
11143c19eb57a8 Suneel Garapati 2015-08-19  247  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8600409485132212319==--

