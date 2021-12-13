Content-Type: multipart/mixed; boundary="===============8533454482096890617=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/gemini/sl3516-ce-cipher.c:365:24: warning: Value stored to 'ce' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 14 Dec 2021 04:51:15 +0800
Message-ID: <202112140420.9TgWLRUx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8533454482096890617==
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
head:   2585cf9dfaaddf00b069673f27bb3f8530e2039c
commit: 46c5338db7bd45b2cf99570560f00389d60fd6b4 crypto: sl3516 - Add sl351=
6 crypto engine
date:   6 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20211209 (https://download.01.org/0day-ci/archi=
ve/20211214/202112140420.9TgWLRUx-lkp(a)intel.com/config)
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
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/btrfs/ref-verify.c:254:3: note: Calling 'list_del'
                   list_del(&ra->list);
                   ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:146:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:132:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:135:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
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
   16 warnings generated.
   drivers/char/ipmi/ipmi_bt_sm.c:155:3: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "B_BUSY ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:155:3: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
                   strcat(buf, "B_BUSY ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:157:3: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "H_BUSY ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:157:3: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
                   strcat(buf, "H_BUSY ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:159:3: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "OEM0 ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:159:3: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
                   strcat(buf, "OEM0 ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:161:3: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "SMS ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:161:3: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
                   strcat(buf, "SMS ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:163:3: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "B2H ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:163:3: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
                   strcat(buf, "B2H ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:165:3: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "H2B ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:165:3: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
                   strcat(buf, "H2B ");
                   ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:166:2: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, "]");
           ^~~~~~
   drivers/char/ipmi/ipmi_bt_sm.c:166:2: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
           strcat(buf, "]");
           ^~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/crypto/gemini/sl3516-ce-core.c:139:28: warning: Dereference of n=
ull pointer [clang-analyzer-core.NullDereference]
           rdd->next_desc.bits.eofie =3D 1;
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/crypto/gemini/sl3516-ce-core.c:122:26: note: 'rdd' initialized t=
o a null pointer value
           struct descriptor *dd, *rdd =3D NULL;
                                   ^~~
   drivers/crypto/gemini/sl3516-ce-core.c:131:14: note: Assuming 'i' is >=
=3D field 'nr_sgd'
           for (i =3D 0; i < rctx->nr_sgd; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/crypto/gemini/sl3516-ce-core.c:131:2: note: Loop condition is fa=
lse. Execution continues on line 139
           for (i =3D 0; i < rctx->nr_sgd; i++) {
           ^
   drivers/crypto/gemini/sl3516-ce-core.c:139:28: note: Dereference of null=
 pointer
           rdd->next_desc.bits.eofie =3D 1;
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   Suppressed 11 warnings (11 in non-user code).
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

46c5338db7bd45 Corentin Labbe 2021-06-01  360  =

46c5338db7bd45 Corentin Labbe 2021-06-01  361  int sl3516_ce_aes_setkey(str=
uct crypto_skcipher *tfm, const u8 *key,
46c5338db7bd45 Corentin Labbe 2021-06-01  362  			 unsigned int keylen)
46c5338db7bd45 Corentin Labbe 2021-06-01  363  {
46c5338db7bd45 Corentin Labbe 2021-06-01  364  	struct sl3516_ce_cipher_tfm=
_ctx *op =3D crypto_skcipher_ctx(tfm);
46c5338db7bd45 Corentin Labbe 2021-06-01 @365  	struct sl3516_ce_dev *ce =
=3D op->ce;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8533454482096890617==--

