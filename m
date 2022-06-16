Content-Type: multipart/mixed; boundary="===============2446043362275175703=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/stm32/reset-stm32.c:108:7: warning: Redundant initialization for 'data'. The initialized value is overwritten before it is read. [redundantInitialization]
Date: Thu, 16 Jun 2022 20:44:04 +0800
Message-ID: <202206162014.95KTovMX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2446043362275175703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/c=
lk/stm32/reset-stm32.c:108:7: warning: Redundant initialization for 'data'.=
 The initialized value is overwritten before it is read. [redundantInitiali=
zation]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   30306f6194cadcc29c77f6ddcd416a75bf5c0232
commit: 637cee5ffc71698eecf014a794e8d24a213b3c07 clk: stm32: Introduce STM3=
2MP13 RCC drivers (Reset Clock Controller)
date:   4 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 weeks ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 637cee5ffc71698eecf014a794e8d24a213b3c07
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/stm32/reset-stm32.c:108:7: warning: Redundant initialization=
 for 'data'. The initialized value is overwritten before it is read. [redun=
dantInitialization]
    data =3D match->data;
         ^
   drivers/clk/stm32/reset-stm32.c:105:42: note: data is initialized
    const struct stm32_rcc_match_data *data =3D match->data;
                                            ^
   drivers/clk/stm32/reset-stm32.c:108:7: note: data is overwritten
    data =3D match->data;
         ^
--
>> drivers/firmware/efi/efi.c:118:44: warning: Parameter 'kobj' can be decl=
ared with const [constParameter]
   static ssize_t systab_show(struct kobject *kobj,
                                              ^
--
>> drivers/gpu/drm/bridge/tc358767.c:846:18: warning: Shifting signed 32-bi=
t value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSig=
ned]
     dp0_syncval |=3D SYNCVAL_VS_POL_ACTIVE_LOW;
                    ^
>> drivers/gpu/drm/bridge/tc358767.c:846:18: warning: Signed integer overfl=
ow for expression '1<<31'. [integerOverflow]
     dp0_syncval |=3D SYNCVAL_VS_POL_ACTIVE_LOW;
                    ^
   drivers/gpu/drm/bridge/tc358767.c:1026:11: warning: Signed integer overf=
low for expression '15<<28'. [integerOverflow]
         (15 << 28) | /* Defer Iteration Count */
             ^

vim +/data +108 drivers/clk/stm32/reset-stm32.c

637cee5ffc7169 Gabriel Fernandez 2022-05-16  101  =

637cee5ffc7169 Gabriel Fernandez 2022-05-16  102  int stm32_rcc_reset_init(=
struct device *dev, const struct of_device_id *match,
637cee5ffc7169 Gabriel Fernandez 2022-05-16  103  			 void __iomem *base)
637cee5ffc7169 Gabriel Fernandez 2022-05-16  104  {
637cee5ffc7169 Gabriel Fernandez 2022-05-16  105  	const struct stm32_rcc_m=
atch_data *data =3D match->data;
637cee5ffc7169 Gabriel Fernandez 2022-05-16  106  	struct stm32_reset_data =
*reset_data =3D NULL;
637cee5ffc7169 Gabriel Fernandez 2022-05-16  107  =

637cee5ffc7169 Gabriel Fernandez 2022-05-16 @108  	data =3D match->data;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2446043362275175703==--

