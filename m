Content-Type: multipart/mixed; boundary="===============7601347699875511875=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 81/1129] drivers/fpga/fpga-mgr.c:497:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-a...
Date: Sun, 08 May 2022 19:10:08 +0800
Message-ID: <202205081916.udfFJPRN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7601347699875511875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Michal Simek <monstr@monstr.eu>
CC: Nava kishore Manne <nava.manne@xilinx.com>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   3076249fc30bf463f8390f89009de928ad3e95ff
commit: a90192210c7a3851787ad7c595cffca6055455b7 [81/1129] fpga: Add firmwa=
re store function
:::::: branch date: 4 days ago
:::::: commit date: 3 months ago
config: mips-randconfig-c004-20220508 (https://download.01.org/0day-ci/arch=
ive/20220508/202205081916.udfFJPRN-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a38564=
5b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/a90192210c7a3851787ad=
7c595cffca6055455b7
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout a90192210c7a3851787ad7c595cffca6055455b7
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                             ^
   drivers/media/dvb-frontends/stb0899_algo.c:395:4: note: Taking false bra=
nch
                           if (abs(derot_freq) > derot_limit)
                           ^
   drivers/media/dvb-frontends/stb0899_algo.c:398:8: note: 'next_loop' is 3
                           if (next_loop) {
                               ^~~~~~~~~
   drivers/media/dvb-frontends/stb0899_algo.c:398:4: note: Taking true bran=
ch
                           if (next_loop) {
                           ^
   drivers/media/dvb-frontends/stb0899_algo.c:399:5: note: Taking true bran=
ch
                                   dprintk(state->verbose, FE_DEBUG, 1, "De=
rot freq=3D%d, mclk=3D%d", derot_freq, internal->mclk);
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:23:2: note: expanded from mac=
ro 'dprintk'
           if (z) {                                                        =
                \
           ^
   drivers/media/dvb-frontends/stb0899_algo.c:399:5: note: Assuming the con=
dition is false
                                   dprintk(state->verbose, FE_DEBUG, 1, "De=
rot freq=3D%d, mclk=3D%d", derot_freq, internal->mclk);
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:24:8: note: expanded from mac=
ro 'dprintk'
                   if      ((*x > FE_ERROR) && (*x > y))                   =
                \
                             ^~~~~~~~~~~~~
   drivers/media/dvb-frontends/stb0899_algo.c:399:5: note: Left side of '&&=
' is false
                                   dprintk(state->verbose, FE_DEBUG, 1, "De=
rot freq=3D%d, mclk=3D%d", derot_freq, internal->mclk);
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:24:23: note: expanded from ma=
cro 'dprintk'
                   if      ((*x > FE_ERROR) && (*x > y))                   =
                \
                                            ^
   drivers/media/dvb-frontends/stb0899_algo.c:399:5: note: Left side of '&&=
' is false
                                   dprintk(state->verbose, FE_DEBUG, 1, "De=
rot freq=3D%d, mclk=3D%d", derot_freq, internal->mclk);
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:26:29: note: expanded from ma=
cro 'dprintk'
                   else if ((*x > FE_NOTICE) && (*x > y))                  =
                \
                                             ^
   drivers/media/dvb-frontends/stb0899_algo.c:399:5: note: Left side of '&&=
' is false
                                   dprintk(state->verbose, FE_DEBUG, 1, "De=
rot freq=3D%d, mclk=3D%d", derot_freq, internal->mclk);
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:28:27: note: expanded from ma=
cro 'dprintk'
                   else if ((*x > FE_INFO) && (*x > y))                    =
                \
                                           ^
   drivers/media/dvb-frontends/stb0899_algo.c:399:5: note: Left side of '&&=
' is false
                                   dprintk(state->verbose, FE_DEBUG, 1, "De=
rot freq=3D%d, mclk=3D%d", derot_freq, internal->mclk);
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:30:28: note: expanded from ma=
cro 'dprintk'
                   else if ((*x > FE_DEBUG) && (*x > y))                   =
                \
                                            ^
   drivers/media/dvb-frontends/stb0899_algo.c:399:5: note: Loop condition i=
s false.  Exiting loop
                                   dprintk(state->verbose, FE_DEBUG, 1, "De=
rot freq=3D%d, mclk=3D%d", derot_freq, internal->mclk);
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:22:42: note: expanded from ma=
cro 'dprintk'
   #define dprintk(x, y, z, format, arg...) do {                           =
                \
                                            ^
   drivers/media/dvb-frontends/stb0899_algo.c:404:5: note: The left operand=
 of '&' is a garbage value
                                   STB0899_SETFIELD_VAL(CFRM, cfr[0], MSB(i=
nternal->inversion * derot_freq));
                                   ^
   drivers/media/dvb-frontends/stb0899_priv.h:61:61: note: expanded from ma=
cro 'STB0899_SETFIELD_VAL'
   #define STB0899_SETFIELD_VAL(bitf, mask, val)   (mask =3D (mask & (~(((1=
 << STB0899_WIDTH_##bitf) - 1) <<\
                                                            ~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/i2c/busses/i2c-davinci.c:258:36: warning: Value stored to 'pdata=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct davinci_i2c_platform_data *pdata =3D dev->pdata;
                                             ^~~~~   ~~~~~~~~~~
   drivers/i2c/busses/i2c-davinci.c:258:36: note: Value stored to 'pdata' d=
uring its initialization is never read
           struct davinci_i2c_platform_data *pdata =3D dev->pdata;
                                             ^~~~~   ~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/fpga/fpga-mgr.c:497:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(image_name, buf);
           ^~~~~~
   drivers/fpga/fpga-mgr.c:497:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(image_name, buf);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/mtd/mtdchar.c:549:6: warning: 2nd function call argument is an u=
ninitialized value [clang-analyzer-core.CallAndMessage]
           if (copy_from_user(&p, arg->data, sizeof(p)))
               ^
   drivers/mtd/mtdchar.c:633:2: note: Taking false branch
           pr_debug("MTD_ioctl\n");
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/mtd/mtdchar.c:639:2: note: Control jumps to 'case 536875625:'  a=
t line 655
           switch (cmd) {
           ^
   drivers/mtd/mtdchar.c:657:3: note:  Execution continues on line 678
                   break;
                   ^
   drivers/mtd/mtdchar.c:678:2: note: Control jumps to 'case 536875625:'  a=
t line 1002
           switch (cmd) {
           ^
   drivers/mtd/mtdchar.c:1007:7: note: Calling 'copy_from_user'
                   if (copy_from_user(&a, blk_arg, sizeof(a)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->data'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->d=
ata'
           return res;
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->d=
ata'
           return n;
           ^
   drivers/mtd/mtdchar.c:1007:7: note: Returning from 'copy_from_user'
                   if (copy_from_user(&a, blk_arg, sizeof(a)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/mtdchar.c:1007:3: note: Taking false branch
                   if (copy_from_user(&a, blk_arg, sizeof(a)))
                   ^
   drivers/mtd/mtdchar.c:1010:10: note: Calling 'mtdchar_blkpg_ioctl'
                           ret =3D mtdchar_blkpg_ioctl(mtd, &a);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/mtdchar.c:546:6: note: Assuming the condition is false
           if (!capable(CAP_SYS_ADMIN))
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/mtdchar.c:546:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   drivers/mtd/mtdchar.c:549:6: note: 2nd function call argument is an unin=
itialized value
           if (copy_from_user(&p, arg->data, sizeof(p)))
               ^                  ~~~~~~~~~
   drivers/mtd/mtdchar.c:588:11: warning: Assigned value is garbage or unde=
fined [clang-analyzer-core.uninitialized.Assign]
           usr_data =3D (const void __user *)(uintptr_t)req.usr_data;

vim +497 drivers/fpga/fpga-mgr.c

ecb5fbe299dfaad Wu Hao       2018-06-30  483  =

a90192210c7a385 Michal Simek 2019-12-31  484  static ssize_t firmware_store=
(struct device *dev,
a90192210c7a385 Michal Simek 2019-12-31  485  			      struct device_attrib=
ute *attr,
a90192210c7a385 Michal Simek 2019-12-31  486  			      const char *buf, siz=
e_t count)
a90192210c7a385 Michal Simek 2019-12-31  487  {
a90192210c7a385 Michal Simek 2019-12-31  488  	struct fpga_manager *mgr =3D=
 to_fpga_manager(dev);
a90192210c7a385 Michal Simek 2019-12-31  489  	unsigned int len;
a90192210c7a385 Michal Simek 2019-12-31  490  	char image_name[NAME_MAX];
a90192210c7a385 Michal Simek 2019-12-31  491  	int ret;
a90192210c7a385 Michal Simek 2019-12-31  492  =

a90192210c7a385 Michal Simek 2019-12-31  493  	/* struct with information a=
bout the FPGA image to program. */
a90192210c7a385 Michal Simek 2019-12-31  494  	struct fpga_image_info info =
=3D {0};
a90192210c7a385 Michal Simek 2019-12-31  495  =

a90192210c7a385 Michal Simek 2019-12-31  496  	/* lose terminating \n */
a90192210c7a385 Michal Simek 2019-12-31 @497  	strcpy(image_name, buf);
a90192210c7a385 Michal Simek 2019-12-31  498  	len =3D strlen(image_name);
a90192210c7a385 Michal Simek 2019-12-31  499  	if (image_name[len - 1] =3D=
=3D '\n')
a90192210c7a385 Michal Simek 2019-12-31  500  		image_name[len - 1] =3D 0;
a90192210c7a385 Michal Simek 2019-12-31  501  =

a90192210c7a385 Michal Simek 2019-12-31  502  	ret =3D fpga_mgr_firmware_lo=
ad(mgr, &info, image_name);
a90192210c7a385 Michal Simek 2019-12-31  503  	if (ret)
a90192210c7a385 Michal Simek 2019-12-31  504  		return ret;
a90192210c7a385 Michal Simek 2019-12-31  505  =

a90192210c7a385 Michal Simek 2019-12-31  506  	return count;
a90192210c7a385 Michal Simek 2019-12-31  507  }
a90192210c7a385 Michal Simek 2019-12-31  508  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7601347699875511875==--

