Content-Type: multipart/mixed; boundary="===============3156865154926985197=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/atm/he.c:2721:10: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides bo...
Date: Sat, 14 May 2022 07:31:55 +0800
Message-ID: <202205140728.1iOPyQ2b-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3156865154926985197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   364a453ab9123f493edfa246798ce9eeda452bdb
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   9 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 weeks ago
config: riscv-randconfig-c006-20220512 (https://download.01.org/0day-ci/arc=
hive/20220514/202205140728.1iOPyQ2b-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9519da=
cab7b8afd537811fc2abaceb4d14f4e16a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   err =3D PTR_ERR(kingdisplay->enable_gpio);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c:366:3: note: Value st=
ored to 'err' is never read
                   err =3D PTR_ERR(kingdisplay->enable_gpio);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/gpu/drm/bridge/sii902x.c:450:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &sii902x->i2c->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/sii902x.c:450:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D &sii902x->i2c->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/sii902x.c:698:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, sii902x->connector.eld,
           ^~~~~~
   drivers/gpu/drm/bridge/sii902x.c:698:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, sii902x->connector.eld,
           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/gpu/drm/bridge/sii9234.c:764:2: warning: Value stored to 'intr1_=
en' is never read [clang-analyzer-deadcode.DeadStores]
           intr1_en =3D mhl_tx_readb(ctx, MHL_TX_INTR1_ENABLE_REG);
           ^
   drivers/gpu/drm/bridge/sii9234.c:764:2: note: Value stored to 'intr1_en'=
 is never read
   drivers/gpu/drm/bridge/sii9234.c:765:2: warning: Value stored to 'intr4_=
en' is never read [clang-analyzer-deadcode.DeadStores]
           intr4_en =3D mhl_tx_readb(ctx, MHL_TX_INTR4_ENABLE_REG);
           ^
   drivers/gpu/drm/bridge/sii9234.c:765:2: note: Value stored to 'intr4_en'=
 is never read
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/gpu/drm/nouveau/nouveau_usif.c:99:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ntfy->p->e.data[0], header, length);
           ^~~~~~
   drivers/gpu/drm/nouveau/nouveau_usif.c:99:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&ntfy->p->e.data[0], header, length);
           ^~~~~~
   drivers/gpu/drm/nouveau/nouveau_usif.c:100:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ntfy->p->e.data[length], data, size);
           ^~~~~~
   drivers/gpu/drm/nouveau/nouveau_usif.c:100:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&ntfy->p->e.data[length], data, size);
           ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:55:6: warning: Value stored to =
'page_count' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           u32 page_count =3D new_reg->num_pages;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:55:6: note: Value stored to 'pa=
ge_count' during its initialization is never read
           u32 page_count =3D new_reg->num_pages;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   81 warnings generated.
   drivers/atm/he.c:2718:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page, "ATM he driver\n");
                          ^~~~~~~
   drivers/atm/he.c:2718:10: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   return sprintf(page, "ATM he driver\n");
                          ^~~~~~~
>> drivers/atm/he.c:2721:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
                   return sprintf(page, "%s%s\n\n",
                          ^~~~~~~
   drivers/atm/he.c:2721:10: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
                   return sprintf(page, "%s%s\n\n",
                          ^~~~~~~
   drivers/atm/he.c:2725:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page, "Mismatched Cells  VPI/VCI Not Open=
  Dropped Cells  RCM Dropped Cells\n");
                          ^~~~~~~
   drivers/atm/he.c:2725:10: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   return sprintf(page, "Mismatched Cells  VPI/VCI Not Open=
  Dropped Cells  RCM Dropped Cells\n");
                          ^~~~~~~
   drivers/atm/he.c:2735:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page, "%16ld  %16ld  %13ld  %17ld\n\n", =

                          ^~~~~~~
   drivers/atm/he.c:2735:10: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   return sprintf(page, "%16ld  %16ld  %13ld  %17ld\n\n", =

                          ^~~~~~~
   drivers/atm/he.c:2739:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page, "irq_size =3D %d  inuse =3D ?  peak=
 =3D %d\n",
                          ^~~~~~~
   drivers/atm/he.c:2739:10: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   return sprintf(page, "irq_size =3D %d  inuse =3D ?  peak=
 =3D %d\n",
                          ^~~~~~~
   drivers/atm/he.c:2743:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page, "tpdrq_size =3D %d  inuse =3D ?\n",
                          ^~~~~~~
   drivers/atm/he.c:2743:10: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   return sprintf(page, "tpdrq_size =3D %d  inuse =3D ?\n",
                          ^~~~~~~
   drivers/atm/he.c:2747:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page, "rbrq_size =3D %d  inuse =3D ?  pea=
k =3D %d\n",
                          ^~~~~~~
   drivers/atm/he.c:2747:10: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   return sprintf(page, "rbrq_size =3D %d  inuse =3D ?  pea=
k =3D %d\n",
                          ^~~~~~~
   drivers/atm/he.c:2751:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page, "tbrq_size =3D %d  peak =3D %d\n",
                          ^~~~~~~
   drivers/atm/he.c:2751:10: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   return sprintf(page, "tbrq_size =3D %d  peak =3D %d\n",
                          ^~~~~~~
   drivers/atm/he.c:2770:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page, "rate controller periods (cbr)\n   =
              pcr  #vc\n");
                          ^~~~~~~
   drivers/atm/he.c:2770:10: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   return sprintf(page, "rate controller periods (cbr)\n   =
              pcr  #vc\n");
                          ^~~~~~~
   drivers/atm/he.c:2774:11: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           return sprintf(page, "cs_stper%-2d  %8ld  %3d\n"=
, i,
                                  ^~~~~~~
   drivers/atm/he.c:2774:11: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                           return sprintf(page, "cs_stper%-2d  %8ld  %3d\n"=
, i,
                                  ^~~~~~~
   drivers/atm/he.c:2779:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(page, "total bw (cbr): %d  (limit %d)\n",
                          ^~~~~~~
   drivers/atm/he.c:2779:10: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   return sprintf(page, "total bw (cbr): %d  (limit %d)\n",
                          ^~~~~~~
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/net/fddi/skfp/ess.c:204:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(((char *)(db->sm_data+db->sm_off)),(char =
*)sm,
                           ^~~~~~
   drivers/net/fddi/skfp/ess.c:204:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(((char *)(db->sm_data+db->sm_off)),(char =
*)sm,
                           ^~~~~~
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
   drivers/net/hamradio/mkiss.c:396:4: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(ax->xbuff, ax->xhead, ax->xleft);
                           ^~~~~~
   drivers/net/hamradio/mkiss.c:396:4: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                           memcpy(ax->xbuff, ax->xhead, ax->xleft);
                           ^~~~~~
   drivers/net/hamradio/mkiss.c:407:4: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(ax->rbuff, orbuff, ax->rcount);
                           ^~~~~~
   drivers/net/hamradio/mkiss.c:407:4: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                           memcpy(ax->rbuff, orbuff, ax->rcount);
                           ^~~~~~
   drivers/net/hamradio/mkiss.c:651:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dev->broadcast, &ax25_bcast, AX25_ADDR_LEN);
           ^~~~~~
   drivers/net/hamradio/mkiss.c:651:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(dev->broadcast, &ax25_bcast, AX25_ADDR_LEN);
           ^~~~~~
   Suppressed 72 warnings (72 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/i2c/i2c-slave-testunit.c:124:3: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(tu->regs, 0, TU_NUM_REGS);
                   ^~~~~~
   drivers/i2c/i2c-slave-testunit.c:124:3: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                   memset(tu->regs, 0, TU_NUM_REGS);
                   ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
                   ^~~~~~
   drivers/media/tuners/tda18271-fe.c:1326:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &tda18271_tuner_ops,
           ^~~~~~
   drivers/media/tuners/tda18271-fe.c:1326:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &tda18271_tuner_ops,
           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   108 warnings generated.
   drivers/atm/iphase.c:419:8: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
          memset ((caddr_t)f_abr_vc, 0, sizeof(*f_abr_vc));
          ^~~~~~
   drivers/atm/iphase.c:419:8: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
          memset ((caddr_t)f_abr_vc, 0, sizeof(*f_abr_vc));
          ^~~~~~
   drivers/atm/iphase.c:502:33: warning: Division by zero [clang-analyzer-c=
ore.DivideZero]
      spacing =3D dev->CbrTotEntries / entries;
                ~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   drivers/atm/iphase.c:474:8: note: Assuming field 'max_pcr' is > 0
      if (vcc->qos.txtp.max_pcr <=3D 0) {
          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/atm/iphase.c:474:4: note: Taking false branch
      if (vcc->qos.txtp.max_pcr <=3D 0) {
      ^
   drivers/atm/iphase.c:479:4: note: Value assigned to 'entries'
      entries =3D rate / dev->Granularity;
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/atm/iphase.c:480:4: note: Assuming the condition is false
      IF_CBR(printk("CBR: CBR entries=3D0x%x for rate=3D0x%x & Gran=3D0x%x\=
n",
      ^
   drivers/atm/iphase.h:94:19: note: expanded from macro 'IF_CBR'
   #define IF_CBR(A) IF_IADBG( IF_IADBG_CBR ) { A }
                     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/atm/iphase.h:70:25: note: expanded from macro 'IF_IADBG'
   #define IF_IADBG(f) if (IADebugFlag & (f))
                           ^~~~~~~~~~~~~~~~~
   drivers/atm/iphase.c:480:4: note: Taking false branch
      IF_CBR(printk("CBR: CBR entries=3D0x%x for rate=3D0x%x & Gran=3D0x%x\=
n",
      ^
   drivers/atm/iphase.h:94:19: note: expanded from macro 'IF_CBR'
   #define IF_CBR(A) IF_IADBG( IF_IADBG_CBR ) { A }
                     ^
   drivers/atm/iphase.h:70:21: note: expanded from macro 'IF_IADBG'
   #define IF_IADBG(f) if (IADebugFlag & (f))
                       ^
   drivers/atm/iphase.c:482:8: note: Assuming 'entries' is < 1
      if (entries < 1)
          ^~~~~~~~~~~
   drivers/atm/iphase.c:482:4: note: Taking true branch
      if (entries < 1)
      ^
   drivers/atm/iphase.c:483:7: note: Taking false branch
         IF_CBR(printk("CBR: Bandwidth smaller than granularity of CBR tabl=
e\n");) =

         ^
   drivers/atm/iphase.h:94:19: note: expanded from macro 'IF_CBR'
   #define IF_CBR(A) IF_IADBG( IF_IADBG_CBR ) { A }
                     ^
   drivers/atm/iphase.h:70:21: note: expanded from macro 'IF_IADBG'
   #define IF_IADBG(f) if (IADebugFlag & (f))
                       ^
   drivers/atm/iphase.c:486:8: note: Assuming the condition is false
      if (3*(rate - rateLow) > (rateHigh - rate))
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/atm/iphase.c:486:4: note: Taking false branch
      if (3*(rate - rateLow) > (rateHigh - rate))
      ^
   drivers/atm/iphase.c:488:8: note: Assuming 'entries' is <=3D field 'CbrR=
emEntries'
      if (entries > dev->CbrRemEntries) {
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/atm/iphase.c:488:4: note: Taking false branch
      if (entries > dev->CbrRemEntries) {
      ^
   drivers/atm/iphase.c:502:33: note: Division by zero
      spacing =3D dev->CbrTotEntries / entries;
                ~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   drivers/atm/iphase.c:534:7: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
         memcpy((caddr_t)&cbrVC,(caddr_t)TstSchedTbl,sizeof(cbrVC));
         ^~~~~~
   drivers/atm/iphase.c:534:7: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
         memcpy((caddr_t)&cbrVC,(caddr_t)TstSchedTbl,sizeof(cbrVC));
         ^~~~~~
   drivers/atm/iphase.c:545:11: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
             memcpy((caddr_t)&cbrVC,(caddr_t)TstSchedTbl,sizeof(cbrVC)); =

             ^~~~~~
   drivers/atm/iphase.c:545:11: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
             memcpy((caddr_t)&cbrVC,(caddr_t)TstSchedTbl,sizeof(cbrVC)); =

             ^~~~~~
   drivers/atm/iphase.c:559:11: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
             memcpy((caddr_t)&cbrVC,(caddr_t)TstSchedTbl,sizeof(cbrVC));
             ^~~~~~
   drivers/atm/iphase.c:559:11: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
             memcpy((caddr_t)&cbrVC,(caddr_t)TstSchedTbl,sizeof(cbrVC));
             ^~~~~~
   drivers/atm/iphase.c:562:8: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
          memcpy((caddr_t)TstSchedTbl, (caddr_t)&vcIndex, sizeof(*TstSchedT=
bl));
          ^~~~~~
   drivers/atm/iphase.c:562:8: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
          memcpy((caddr_t)TstSchedTbl, (caddr_t)&vcIndex, sizeof(*TstSchedT=
bl));
          ^~~~~~
>> drivers/atm/iphase.c:985:17: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           pBuf +=3D sprintf( pBuf, "%s", prefix );
                   ^~~~~~~
   drivers/atm/iphase.c:985:17: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           pBuf +=3D sprintf( pBuf, "%s", prefix );
                   ^~~~~~~
   drivers/atm/iphase.c:988:25: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pBuf +=3D sprintf( pBuf, " " );
                           ^~~~~~~
   drivers/atm/iphase.c:988:25: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
                   pBuf +=3D sprintf( pBuf, " " );
                           ^~~~~~~
   drivers/atm/iphase.c:989:21: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
               pBuf +=3D sprintf( pBuf, "%02X ", cp[count + col] );
                       ^~~~~~~
   drivers/atm/iphase.c:989:21: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
               pBuf +=3D sprintf( pBuf, "%02X ", cp[count + col] );
                       ^~~~~~~
   drivers/atm/iphase.c:993:17: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf( pBuf, " " );
                   ^~~~~~~
   drivers/atm/iphase.c:993:17: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
                   sprintf( pBuf, " " );
                   ^~~~~~~
   drivers/atm/iphase.c:994:21: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
               pBuf +=3D sprintf( pBuf, "   " );
                       ^~~~~~~
   drivers/atm/iphase.c:994:21: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
               pBuf +=3D sprintf( pBuf, "   " );
                       ^~~~~~~
   drivers/atm/iphase.c:996:17: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           pBuf +=3D sprintf( pBuf, "  " );
                   ^~~~~~~
   drivers/atm/iphase.c:996:17: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           pBuf +=3D sprintf( pBuf, "  " );
                   ^~~~~~~
   drivers/atm/iphase.c:1001:12: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           pBuf +=3D sprintf(pBuf, "%c", c);
                                   ^~~~~~~
   drivers/atm/iphase.c:1001:12: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                           pBuf +=3D sprintf(pBuf, "%c", c);
                                   ^~~~~~~
   drivers/atm/iphase.c:1003:12: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           pBuf +=3D sprintf(pBuf, ".");
                                   ^~~~~~~
   drivers/atm/iphase.c:1003:12: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
                           pBuf +=3D sprintf(pBuf, ".");
                                   ^~~~~~~
   drivers/atm/iphase.c:1396:30: warning: The result of the left shift is u=
ndefined because the left operand is negative [clang-analyzer-core.Undefine=
dBinaryOperatorResult]
           *vc_table =3D vcc->vci << 6;
                                ^
   drivers/atm/iphase.c:2696:6: note: Assuming the condition is false
           if (!test_bit(ATM_VF_PARTIAL,&vcc->flags))  =

               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/atm/iphase.c:2696:2: note: Taking false branch
           if (!test_bit(ATM_VF_PARTIAL,&vcc->flags))  =

           ^
   drivers/atm/iphase.c:2701:6: note: Assuming the condition is false
           if (vcc->vci !=3D ATM_VPI_UNSPEC && vcc->vpi !=3D ATM_VCI_UNSPEC=
)  =

               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/atm/iphase.c:2701:33: note: Left side of '&&' is false
           if (vcc->vci !=3D ATM_VPI_UNSPEC && vcc->vpi !=3D ATM_VCI_UNSPEC=
)  =

                                          ^
   drivers/atm/iphase.c:2706:6: note: Assuming field 'aal' is equal to ATM_=
AAL5
           if (vcc->qos.aal !=3D ATM_AAL5)  =

               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/atm/iphase.c:2706:2: note: Taking false branch
           if (vcc->qos.aal !=3D ATM_AAL5)  =

           ^
   drivers/atm/iphase.c:2708:2: note: Assuming the condition is false
           IF_EVENT(printk(DEV_LABEL "(itf %d): open %d.%d\n", =

           ^
   drivers/atm/iphase.h:97:21: note: expanded from macro 'IF_EVENT'
   #define IF_EVENT(A) IF_IADBG( IF_IADBG_EVENT) { A }
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/atm/iphase.h:70:25: note: expanded from macro 'IF_IADBG'
   #define IF_IADBG(f) if (IADebugFlag & (f))
                           ^~~~~~~~~~~~~~~~~
   drivers/atm/iphase.c:2708:2: note: Taking false branch
           IF_EVENT(printk(DEV_LABEL "(itf %d): open %d.%d\n", =

           ^
   drivers/atm/iphase.h:97:21: note: expanded from macro 'IF_EVENT'
   #define IF_EVENT(A) IF_IADBG( IF_IADBG_EVENT) { A }
                       ^
   drivers/atm/iphase.h:70:21: note: expanded from macro 'IF_IADBG'
   #define IF_IADBG(f) if (IADebugFlag & (f))
                       ^
   drivers/atm/iphase.c:2713:6: note: Assuming 'ia_vcc' is non-null
           if (!ia_vcc) return -ENOMEM;  =

               ^~~~~~~
   drivers/atm/iphase.c:2713:2: note: Taking false branch
           if (!ia_vcc) return -ENOMEM;  =

           ^
   drivers/atm/iphase.c:2716:15: note: Calling 'open_rx'
           if ((error =3D open_rx(vcc)))  =

                        ^~~~~~~~~~~~
   drivers/atm/iphase.c:1380:2: note: Assuming the condition is false
           IF_EVENT(printk("iadev: open_rx %d.%d\n", vcc->vpi, vcc->vci);)
           ^
   drivers/atm/iphase.h:97:21: note: expanded from macro 'IF_EVENT'
   #define IF_EVENT(A) IF_IADBG( IF_IADBG_EVENT) { A }

vim +2721 drivers/atm/he.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  2701  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2702  static int
^1da177e4c3f41 Linus Torvalds 2005-04-16  2703  he_proc_read(struct atm_dev=
 *dev, loff_t *pos, char *page)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2704  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2705  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2706  	struct he_dev *he_dev =3D =
HE_DEV(dev);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2707  	int left, i;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2708  #ifdef notdef
^1da177e4c3f41 Linus Torvalds 2005-04-16  2709  	struct he_rbrq *rbrq_tail;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2710  	struct he_tpdrq *tpdrq_hea=
d;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2711  	int rbpl_head, rbpl_tail;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2712  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  2713  	static long mcc =3D 0, oec=
 =3D 0, dcc =3D 0, cec =3D 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2714  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2715  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2716  	left =3D *pos;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2717  	if (!left--)
900092a45e73fc Adrian Bunk    2007-12-30  2718  		return sprintf(page, "ATM=
 he driver\n");
^1da177e4c3f41 Linus Torvalds 2005-04-16  2719  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2720  	if (!left--)
^1da177e4c3f41 Linus Torvalds 2005-04-16 @2721  		return sprintf(page, "%s%=
s\n\n",
^1da177e4c3f41 Linus Torvalds 2005-04-16  2722  			he_dev->prod_id, he_dev-=
>media & 0x40 ? "SM" : "MM");
^1da177e4c3f41 Linus Torvalds 2005-04-16  2723  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2724  	if (!left--)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2725  		return sprintf(page, "Mis=
matched Cells  VPI/VCI Not Open  Dropped Cells  RCM Dropped Cells\n");
^1da177e4c3f41 Linus Torvalds 2005-04-16  2726  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2727  	spin_lock_irqsave(&he_dev-=
>global_lock, flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2728  	mcc +=3D he_readl(he_dev, =
MCC);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2729  	oec +=3D he_readl(he_dev, =
OEC);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2730  	dcc +=3D he_readl(he_dev, =
DCC);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2731  	cec +=3D he_readl(he_dev, =
CEC);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2732  	spin_unlock_irqrestore(&he=
_dev->global_lock, flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2733  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2734  	if (!left--)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2735  		return sprintf(page, "%16=
ld  %16ld  %13ld  %17ld\n\n", =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2736  							mcc, oec, dcc, cec);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2737  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2738  	if (!left--)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2739  		return sprintf(page, "irq=
_size =3D %d  inuse =3D ?  peak =3D %d\n",
^1da177e4c3f41 Linus Torvalds 2005-04-16  2740  				CONFIG_IRQ_SIZE, he_dev=
->irq_peak);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2741  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2742  	if (!left--)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2743  		return sprintf(page, "tpd=
rq_size =3D %d  inuse =3D ?\n",
^1da177e4c3f41 Linus Torvalds 2005-04-16  2744  						CONFIG_TPDRQ_SIZE);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2745  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2746  	if (!left--)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2747  		return sprintf(page, "rbr=
q_size =3D %d  inuse =3D ?  peak =3D %d\n",
^1da177e4c3f41 Linus Torvalds 2005-04-16  2748  				CONFIG_RBRQ_SIZE, he_de=
v->rbrq_peak);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2749  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2750  	if (!left--)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2751  		return sprintf(page, "tbr=
q_size =3D %d  peak =3D %d\n",
^1da177e4c3f41 Linus Torvalds 2005-04-16  2752  					CONFIG_TBRQ_SIZE, he_d=
ev->tbrq_peak);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2753  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2754  =


:::::: The code at line 2721 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3156865154926985197==--

