Content-Type: multipart/mixed; boundary="===============0369486241003694593=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/gemini/sl3516-ce-cipher.c:365:24: warning: Value stored to 'ce' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 17 Dec 2021 07:58:54 +0800
Message-ID: <202112170717.qY9nLOgc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0369486241003694593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Corentin Labbe <clabbe@baylibre.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2b14864acbaaf03d9c01982e243a84632524c3ac
commit: 46c5338db7bd45b2cf99570560f00389d60fd6b4 crypto: sl3516 - Add sl351=
6 crypto engine
date:   6 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20211209 (https://download.01.org/0day-ci/archi=
ve/20211217/202112170717.qY9nLOgc-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D46c5338db7bd45b2cf99570560f00389d60fd6b4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 46c5338db7bd45b2cf99570560f00389d60fd6b4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/rtc/rtc-s5m.c:491:2: warning: Value stored to 'ret' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           ret =3D s5m_check_peding_alarm_interrupt(info, alrm);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-s5m.c:491:2: note: Value stored to 'ret' is never read
           ret =3D s5m_check_peding_alarm_interrupt(info, alrm);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   fs/btrfs/extent_map.c:615:3: warning: Value stored to 'ret' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   fs/btrfs/extent_map.c:615:3: note: Value stored to 'ret' is never read
                   ret =3D 0;
                   ^     ~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   crypto/asymmetric_keys/public_key.c:91:3: warning: Call to function 'str=
cpy' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
                   strcpy(alg_name, pkey->pkey_algo);
                   ^~~~~~
   crypto/asymmetric_keys/public_key.c:91:3: note: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119
                   strcpy(alg_name, pkey->pkey_algo);
                   ^~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/gpu/drm/drm_self_refresh_helper.c:85:3: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   drivers/gpu/drm/drm_self_refresh_helper.c:85:3: note: Value stored to 'r=
et' is never read
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/gpu/drm/drm_fb_helper.c:156:24: warning: Value stored to 'helper=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct drm_fb_helper *helper =3D info->par;
                                 ^~~~~~   ~~~~~~~~~
   drivers/gpu/drm/drm_fb_helper.c:156:24: note: Value stored to 'helper' d=
uring its initialization is never read
           struct drm_fb_helper *helper =3D info->par;
                                 ^~~~~~   ~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/crypto/gemini/sl3516-ce-cipher.c:27:22: warning: Value stored to=
 'in_sg' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct scatterlist *in_sg =3D areq->src;
                               ^~~~~   ~~~~~~~~~
   drivers/crypto/gemini/sl3516-ce-cipher.c:27:22: note: Value stored to 'i=
n_sg' during its initialization is never read
           struct scatterlist *in_sg =3D areq->src;
                               ^~~~~   ~~~~~~~~~
   drivers/crypto/gemini/sl3516-ce-cipher.c:28:22: warning: Value stored to=
 'out_sg' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct scatterlist *out_sg =3D areq->dst;
                               ^~~~~~   ~~~~~~~~~
   drivers/crypto/gemini/sl3516-ce-cipher.c:28:22: note: Value stored to 'o=
ut_sg' during its initialization is never read
           struct scatterlist *out_sg =3D areq->dst;
                               ^~~~~~   ~~~~~~~~~
>> drivers/crypto/gemini/sl3516-ce-cipher.c:365:24: warning: Value stored t=
o 'ce' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct sl3516_ce_dev *ce =3D op->ce;
                                 ^~   ~~~~~~
   drivers/crypto/gemini/sl3516-ce-cipher.c:365:24: note: Value stored to '=
ce' during its initialization is never read
           struct sl3516_ce_dev *ce =3D op->ce;
                                 ^~   ~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/crypto/inside-secure/safexcel.c:139:36: warning: The result of t=
he left shift is undefined because the left operand is negative [clang-anal=
yzer-core.UndefinedBinaryOperatorResult]
                   val =3D EIP197_CS_RC_NEXT(i + 1) | EIP197_CS_RC_PREV(i -=
 1);
                                                    ^
   drivers/crypto/inside-secure/safexcel.h:492:37: note: expanded from macr=
o 'EIP197_CS_RC_PREV'
   #define EIP197_CS_RC_PREV(x)                    ((x) << 10)
                                                        ^
   drivers/crypto/inside-secure/safexcel.c:591:2: note: Taking false branch
           dev_dbg(priv->dev, "HW init: using %d pipe(s) and %d ring(s)\n",
           ^
   include/linux/dev_printk.h:130:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/crypto/inside-secure/safexcel.c:598:6: note: Assuming the condit=
ion is true
           if (priv->flags & SAFEXCEL_HW_EIP197) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/inside-secure/safexcel.c:598:2: note: Taking true branch
           if (priv->flags & SAFEXCEL_HW_EIP197) {
           ^
   drivers/crypto/inside-secure/safexcel.c:599:9: note: Loop condition is f=
alse.  Exiting loop
                   val =3D readl(EIP197_HIA_AIC(priv) + EIP197_HIA_MST_CTRL=
);
                         ^
   arch/arm/include/asm/io.h:303:50: note: expanded from macro 'readl'
   #define readl(c)                ({ u32 __v =3D readl_relaxed(c); __iormb=
(); __v; })
                                                                  ^
   arch/arm/include/asm/io.h:168:20: note: expanded from macro '__iormb'
   #define __iormb()               do { } while (0)
                                   ^
   drivers/crypto/inside-secure/safexcel.c:601:3: note: Loop condition is f=
alse.  Exiting loop
                   writel(val, EIP197_HIA_AIC(priv) + EIP197_HIA_MST_CTRL);
                   ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/crypto/inside-secure/safexcel.c:605:2: note: Loop condition is f=
alse.  Exiting loop
           writel(EIP197_MST_CTRL_RD_CACHE(RD_CACHE_4BITS) |
           ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/crypto/inside-secure/safexcel.c:612:2: note: Loop condition is f=
alse.  Exiting loop
           writel(0, EIP197_HIA_AIC_G(priv) + EIP197_HIA_AIC_G_ENABLE_CTRL);
           ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/crypto/inside-secure/safexcel.c:615:2: note: Loop condition is f=
alse.  Exiting loop
           writel(GENMASK(31, 0), EIP197_HIA_AIC_G(priv) + EIP197_HIA_AIC_G=
_ACK);
           ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/crypto/inside-secure/safexcel.c:618:15: note: Assuming 'pe' is >=
=3D field 'pes'
           for (pe =3D 0; pe < priv->config.pes; pe++) {
                        ^~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/inside-secure/safexcel.c:618:2: note: Loop condition is f=
alse. Execution continues on line 712
           for (pe =3D 0; pe < priv->config.pes; pe++) {
           ^
   drivers/crypto/inside-secure/safexcel.c:712:14: note: Assuming 'i' is < =
field 'rings'
           for (i =3D 0; i < priv->config.rings; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/inside-secure/safexcel.c:712:2: note: Loop condition is t=
rue.  Entering loop body
           for (i =3D 0; i < priv->config.rings; i++) {
           ^
   drivers/crypto/inside-secure/safexcel.c:714:3: note: Loop condition is f=
alse.  Exiting loop
                   writel(GENMASK(31, 0),
                   ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/crypto/inside-secure/safexcel.c:718:3: note: Loop condition is f=
alse.  Exiting loop
                   writel(0, EIP197_HIA_CDR(priv, i) + EIP197_HIA_xDR_CFG);
                   ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })

vim +/ce +365 drivers/crypto/gemini/sl3516-ce-cipher.c

46c5338db7bd45b Corentin Labbe 2021-06-01  360  =

46c5338db7bd45b Corentin Labbe 2021-06-01  361  int sl3516_ce_aes_setkey(st=
ruct crypto_skcipher *tfm, const u8 *key,
46c5338db7bd45b Corentin Labbe 2021-06-01  362  			 unsigned int keylen)
46c5338db7bd45b Corentin Labbe 2021-06-01  363  {
46c5338db7bd45b Corentin Labbe 2021-06-01  364  	struct sl3516_ce_cipher_tf=
m_ctx *op =3D crypto_skcipher_ctx(tfm);
46c5338db7bd45b Corentin Labbe 2021-06-01 @365  	struct sl3516_ce_dev *ce =
=3D op->ce;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0369486241003694593==--

