Content-Type: multipart/mixed; boundary="===============3404901417296848465=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clocksource/drivers: remove unnecessary return in switch statement
Date: Mon, 02 May 2022 08:01:06 +0800
Message-ID: <202205020700.vsW8b2Yn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3404901417296848465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220425084644.3495153-1-chi.minghao@zte.com.cn>
References: <20220425084644.3495153-1-chi.minghao@zte.com.cn>
TO: cgel.zte(a)gmail.com
TO: daniel(a)thingy.jp
CC: romain.perier(a)gmail.com
CC: daniel.lezcano(a)linaro.org
CC: tglx(a)linutronix.de
CC: linux-arm-kernel(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org
CC: Minghao Chi <chi.minghao@zte.com.cn>
CC: Zeal Robot <zealci@zte.com.cn>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on v5.18-rc4 next-20220429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/cgel-zte-gmail-com/c=
locksource-drivers-remove-unnecessary-return-in-switch-statement/20220425-1=
70540
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git ce8abf3=
40e40e1126bfcb9e7679b3d6b524ae3e0
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: riscv-randconfig-c006-20220501 (https://download.01.org/0day-ci/arc=
hive/20220502/202205020700.vsW8b2Yn-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d=
36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/f185e49aea517bee5df=
b706df47fa5f70bfac370
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review cgel-zte-gmail-com/clocksource-dri=
vers-remove-unnecessary-return-in-switch-statement/20220425-170540
        git checkout f185e49aea517bee5dfb706df47fa5f70bfac370
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (!edmac->edma->m2m && dir !=3D ep93xx_dma_chan_direction(chan=
)) {
               ^~~~~~~~~~~~~~~~~
   drivers/dma/ep93xx_dma.c:1125:24: note: Left side of '&&' is false
           if (!edmac->edma->m2m && dir !=3D ep93xx_dma_chan_direction(chan=
)) {
                                 ^
   drivers/dma/ep93xx_dma.c:1131:6: note: Assuming the condition is false
           if (test_and_set_bit(EP93XX_DMA_IS_CYCLIC, &edmac->flags)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/ep93xx_dma.c:1131:2: note: Taking false branch
           if (test_and_set_bit(EP93XX_DMA_IS_CYCLIC, &edmac->flags)) {
           ^
   drivers/dma/ep93xx_dma.c:1137:6: note: Assuming 'period_len' is <=3D DMA=
_MAX_CHAN_BYTES
           if (period_len > DMA_MAX_CHAN_BYTES) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/ep93xx_dma.c:1137:2: note: Taking false branch
           if (period_len > DMA_MAX_CHAN_BYTES) {
           ^
   drivers/dma/ep93xx_dma.c:1146:2: note: Null pointer value stored to 'fir=
st'
           first =3D NULL;
           ^~~~~~~~~~~~
   drivers/dma/ep93xx_dma.c:1147:19: note: Assuming 'offset' is >=3D 'buf_l=
en'
           for (offset =3D 0; offset < buf_len; offset +=3D period_len) {
                            ^~~~~~~~~~~~~~~~
   drivers/dma/ep93xx_dma.c:1147:2: note: Loop condition is false. Executio=
n continues on line 1170
           for (offset =3D 0; offset < buf_len; offset +=3D period_len) {
           ^
   drivers/dma/ep93xx_dma.c:1170:20: note: Dereference of null pointer
           first->txd.cookie =3D -EBUSY;
           ~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/dma/ep93xx_dma.c:1237:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&edmac->slave_config, config, sizeof(*config));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/dma/ep93xx_dma.c:1237:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(&edmac->slave_config, config, sizeof(*config));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   fs/nilfs2/ioctl.c:802:3: warning: Value stored to 'msg' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   msg =3D "cannot delete checkpoints";
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/ioctl.c:802:3: note: Value stored to 'msg' is never read
                   msg =3D "cannot delete checkpoints";
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/ioctl.c:811:3: warning: Value stored to 'msg' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   msg =3D "cannot delete virtual blocks from DAT file";
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/ioctl.c:811:3: note: Value stored to 'msg' is never read
                   msg =3D "cannot delete virtual blocks from DAT file";
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/ioctl.c:819:3: warning: Value stored to 'msg' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   msg =3D "cannot mark copying blocks dirty";
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/ioctl.c:819:3: note: Value stored to 'msg' is never read
                   msg =3D "cannot mark copying blocks dirty";
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
>> drivers/clocksource/timer-msc313e.c:235:3: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D msc313e_clksrc_init(np);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-msc313e.c:235:3: note: Value stored to 'ret' i=
s never read
                   ret =3D msc313e_clksrc_init(np);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-msc313e.c:239:3: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D msc313e_clkevt_init(np);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-msc313e.c:239:3: note: Value stored to 'ret' i=
s never read
                   ret =3D msc313e_clkevt_init(np);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 40 warnings (39 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/of/base.c:1296:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(it, 0, sizeof(*it));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/of/base.c:1296:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(it, 0, sizeof(*it));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/of/base.c:1886:2: warning: Call to function 'strncpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(ap->stem, stem, stem_len);
           ^~~~~~~
   drivers/of/base.c:1886:2: note: Call to function 'strncpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'strncpy_s' in case of C11
           strncpy(ap->stem, stem, stem_len);
           ^~~~~~~
   drivers/of/base.c:1957:3: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ap, 0, sizeof(*ap) + len + 1);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/of/base.c:1957:3: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                   memset(ap, 0, sizeof(*ap) + len + 1);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   drivers/regulator/pfuze100-regulator.c:763:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pfuze_chip->regulator_descs, pfuze_chip->pfuze_regulators,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/regulator/pfuze100-regulator.c:763:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(pfuze_chip->regulator_descs, pfuze_chip->pfuze_regulators,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.

vim +/ret +235 drivers/clocksource/timer-msc313e.c

5fc1f93f69989e Romain Perier 2021-12-17  227  =

5fc1f93f69989e Romain Perier 2021-12-17  228  static int __init msc313e_tim=
er_init(struct device_node *np)
5fc1f93f69989e Romain Perier 2021-12-17  229  {
5fc1f93f69989e Romain Perier 2021-12-17  230  	int ret =3D 0;
5fc1f93f69989e Romain Perier 2021-12-17  231  	static int num_called;
5fc1f93f69989e Romain Perier 2021-12-17  232  =

5fc1f93f69989e Romain Perier 2021-12-17  233  	switch (num_called) {
5fc1f93f69989e Romain Perier 2021-12-17  234  	case 0:
5fc1f93f69989e Romain Perier 2021-12-17 @235  		ret =3D msc313e_clksrc_init=
(np);
5fc1f93f69989e Romain Perier 2021-12-17  236  		break;
5fc1f93f69989e Romain Perier 2021-12-17  237  =

5fc1f93f69989e Romain Perier 2021-12-17  238  	default:
5fc1f93f69989e Romain Perier 2021-12-17  239  		ret =3D msc313e_clkevt_init=
(np);
5fc1f93f69989e Romain Perier 2021-12-17  240  		break;
5fc1f93f69989e Romain Perier 2021-12-17  241  	}
5fc1f93f69989e Romain Perier 2021-12-17  242  =

5fc1f93f69989e Romain Perier 2021-12-17  243  	num_called++;
5fc1f93f69989e Romain Perier 2021-12-17  244  =

5fc1f93f69989e Romain Perier 2021-12-17  245  	return 0;
5fc1f93f69989e Romain Perier 2021-12-17  246  }
5fc1f93f69989e Romain Perier 2021-12-17  247  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3404901417296848465==--

