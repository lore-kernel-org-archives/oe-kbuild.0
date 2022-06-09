Content-Type: multipart/mixed; boundary="===============4648476233356459657=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/video/fbdev/omap/omapfb_main.c:1811:16: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Fri, 10 Jun 2022 05:29:28 +0800
Message-ID: <202206100557.51ypLGap-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4648476233356459657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/v=
ideo/fbdev/omap/omapfb_main.c:1811:16: warning: Use of memory after it is f=
reed [clang-analyzer-unix.Malloc]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3d9f55c57bc3659f986acc421eac431ff6edcc83
commit: 804f7f19c2e2928aeb8eafef8379fe8b8d13f98b fbdev: omap: avoid using m=
ach/*.h files
date:   7 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-c002-20220608 (https://download.01.org/0day-ci/archi=
ve/20220610/202206100557.51ypLGap-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436=
efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D804f7f19c2e2928aeb8eafef8379fe8b8d13f98b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 804f7f19c2e2928aeb8eafef8379fe8b8d13f98b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/zstd_decompress.c:768:5: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
       ZSTD_memset(dst, b, regenSize);
       ^
   lib/zstd/decompress/../common/zstd_deps.h:34:28: note: expanded from mac=
ro 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/zstd_decompress.c:1063:17: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ZSTD_memcpy(dctx->headerBuffer, src, srcSize);
                   ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/zstd_decompress.c:1063:17: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
                   ZSTD_memcpy(dctx->headerBuffer, src, srcSize);
                   ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/zstd_decompress.c:1070:9: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ZSTD_memcpy(dctx->headerBuffer, src, srcSize);
           ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/zstd_decompress.c:1070:9: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           ZSTD_memcpy(dctx->headerBuffer, src, srcSize);
           ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/zstd_decompress.c:1077:9: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ZSTD_memcpy(dctx->headerBuffer + (dctx->headerSize - srcSize), s=
rc, srcSize);
           ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/zstd_decompress.c:1077:9: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           ZSTD_memcpy(dctx->headerBuffer + (dctx->headerSize - srcSize), s=
rc, srcSize);
           ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/zstd_decompress.c:1188:9: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ZSTD_memcpy(dctx->headerBuffer + (ZSTD_SKIPPABLEHEADERSIZE - src=
Size), src, srcSize);   /* complete skippable header */
           ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/zstd_decompress.c:1188:9: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           ZSTD_memcpy(dctx->headerBuffer + (ZSTD_SKIPPABLEHEADERSIZE - src=
Size), src, srcSize);   /* complete skippable header */
           ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/zstd_decompress.c:1346:5: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       ZSTD_memcpy(dctx->entropy.rep, repStartValue, sizeof(repStartValue))=
;  /* initial repcodes */
       ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/zstd_decompress.c:1346:5: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
       ZSTD_memcpy(dctx->entropy.rep, repStartValue, sizeof(repStartValue))=
;  /* initial repcodes */
       ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/zstd_decompress.c:1866:29: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                               ZSTD_memcpy(zds->headerBuffer + zds->lhSize,=
 ip, remainingInput);
                               ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/zstd_decompress.c:1866:29: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
                               ZSTD_memcpy(zds->headerBuffer + zds->lhSize,=
 ip, remainingInput);
                               ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/zstd_decompress.c:1873:21: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                       ZSTD_memcpy(zds->headerBuffer + zds->lhSize, ip, toL=
oad); zds->lhSize =3D hSize; ip +=3D toLoad;
                       ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/zstd_decompress.c:1873:21: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
                       ZSTD_memcpy(zds->headerBuffer + zds->lhSize, ip, toL=
oad); zds->lhSize =3D hSize; ip +=3D toLoad;
                       ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/video/fbdev/omap/lcd_mipid.c:66:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(xfer, 0, sizeof(xfer));
           ^~~~~~
   drivers/video/fbdev/omap/lcd_mipid.c:66:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(xfer, 0, sizeof(xfer));
           ^~~~~~
>> drivers/video/fbdev/omap/lcd_mipid.c:264:3: warning: Value stored to 'pi=
xel' is never read [clang-analyzer-deadcode.DeadStores]
                   pixel =3D 0;
                   ^       ~
   drivers/video/fbdev/omap/lcd_mipid.c:264:3: note: Value stored to 'pixel=
' is never read
                   pixel =3D 0;
                   ^       ~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:670:49: warning: The result=
 of the left shift is undefined because the left operand is negative [clang=
-analyzer-core.UndefinedBinaryOperatorResult]
           dispc_write_reg(DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->gcb, ct-=
>gcr));
                                                          ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:666:21: note: expanded from=
 macro 'CVAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^
   drivers/video/fbdev/omap2/omapfb/dss/dss.h:60:42: note: expanded from ma=
cro 'FLD_VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                            ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:4049:6: note: Assuming the =
condition is true
           if (REG_GET(DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_ONLY) {
               ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:49:2: note: expanded from m=
acro 'REG_GET'
           FLD_GET(dispc_read_reg(idx), start, end)
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dss.h:61:34: note: expanded from ma=
cro 'FLD_GET'
   #define FLD_GET(val, start, end) (((val) & FLD_MASK(start, end)) >> (end=
))
                                    ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:4049:2: note: Taking true b=
ranch
           if (REG_GET(DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_ONLY) {
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:4050:3: note: Calling '_oma=
p_dispc_initial_config'
                   _omap_dispc_initial_config();
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3721:6: note: Assuming the =
condition is false
           if (dss_has_feature(FEAT_CORE_CLK_DIV)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3721:2: note: Taking false =
branch
           if (dss_has_feature(FEAT_CORE_CLK_DIV)) {
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3732:6: note: Assuming the =
condition is false
           if (dss_has_feature(FEAT_FUNCGATED))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3732:2: note: Taking false =
branch
           if (dss_has_feature(FEAT_FUNCGATED))
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3735:2: note: Calling 'disp=
c_setup_color_conv_coef'
           dispc_setup_color_conv_coef();
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:692:14: note: Assuming 'i' =
is >=3D 'num_ovl'
           for (i =3D 1; i < num_ovl; i++)
                       ^~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:692:2: note: Loop condition=
 is false. Execution continues on line 695
           for (i =3D 1; i < num_ovl; i++)
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:695:6: note: Assuming field=
 'has_writeback' is true
           if (dispc.feat->has_writeback)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:695:2: note: Taking true br=
anch
           if (dispc.feat->has_writeback)
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:696:3: note: Calling 'dispc=
_ovl_write_color_conv_coef'
                   dispc_ovl_write_color_conv_coef(OMAP_DSS_WB, &ctbl_bt601=
_5_wb);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:670:49: note: The result of=
 the left shift is undefined because the left operand is negative
           dispc_write_reg(DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->gcb, ct-=
>gcr));
                                                          ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:666:21: note: expanded from=
 macro 'CVAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dss.h:60:42: note: expanded from ma=
cro 'FLD_VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                      ~~~~~ ^
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/usb/misc/legousbtower.c:684:4: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(dev->read_buffer + dev->read_buffer_lengt=
h,
                           ^~~~~~
   drivers/usb/misc/legousbtower.c:684:4: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(dev->read_buffer + dev->read_buffer_lengt=
h,
                           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/usb/misc/trancevibrator.c:39:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", tv->speed);
--
                    ^~~~~~~
   drivers/usb/gadget/function/f_sourcesink.c:1026:11: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           result =3D sprintf(page, "%u\n", opts->isoc_mult);
                    ^~~~~~~
   drivers/usb/gadget/function/f_sourcesink.c:1069:11: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           result =3D sprintf(page, "%u\n", opts->isoc_maxburst);
                    ^~~~~~~
   drivers/usb/gadget/function/f_sourcesink.c:1069:11: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           result =3D sprintf(page, "%u\n", opts->isoc_maxburst);
                    ^~~~~~~
   drivers/usb/gadget/function/f_sourcesink.c:1112:11: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           result =3D sprintf(page, "%u\n", opts->bulk_buflen);
                    ^~~~~~~
   drivers/usb/gadget/function/f_sourcesink.c:1112:11: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           result =3D sprintf(page, "%u\n", opts->bulk_buflen);
                    ^~~~~~~
   drivers/usb/gadget/function/f_sourcesink.c:1150:11: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           result =3D sprintf(page, "%u\n", opts->bulk_qlen);
                    ^~~~~~~
   drivers/usb/gadget/function/f_sourcesink.c:1150:11: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           result =3D sprintf(page, "%u\n", opts->bulk_qlen);
                    ^~~~~~~
   drivers/usb/gadget/function/f_sourcesink.c:1188:11: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           result =3D sprintf(page, "%u\n", opts->iso_qlen);
                    ^~~~~~~
   drivers/usb/gadget/function/f_sourcesink.c:1188:11: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           result =3D sprintf(page, "%u\n", opts->iso_qlen);
                    ^~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/video/fbdev/omap/omapfb_main.c:599:3: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(new_var, &fbi->var, sizeof(*new_var));
                   ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:599:3: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(new_var, &fbi->var, sizeof(*new_var));
                   ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:605:4: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&fbi->var, new_var, sizeof(*new_var));
                           ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:605:4: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&fbi->var, new_var, sizeof(*new_var));
                           ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:843:5: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(new_var, &fbi->var, sizeof(*new_v=
ar));
                                   ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:843:5: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(new_var, &fbi->var, sizeof(*new_v=
ar));
                                   ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:863:5: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(&fbi->var, new_var, sizeof(fbi->v=
ar));
                                   ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:863:5: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(&fbi->var, new_var, sizeof(fbi->v=
ar));
                                   ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:891:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mi, 0, sizeof(*mi));
           ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:891:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(mi, 0, sizeof(*mi));
           ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1017:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(caps, 0, sizeof(*caps));
           ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1017:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(caps, 0, sizeof(*caps));
           ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1031:3: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&win, 0, sizeof(win));
                   ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1031:3: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
                   memset(&win, 0, sizeof(win));
                   ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1100:4: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(u->reserved, 0, sizeof(u->reserved));
                           ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1100:4: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
                           memset(u->reserved, 0, sizeof(u->reserved));
                           ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1334:7: warning: Call to function=
 'sscanf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sscanf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (sscanf(buf, "%10d", &level) =3D=3D 1) {
                       ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1334:7: note: Call to function 's=
scanf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sscanf_s' in case of C11
                   if (sscanf(buf, "%10d", &level) =3D=3D 1) {
                       ^~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1451:2: warning: Call to function=
 'strncpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'strncpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(fix->id, MODULE_NAME, sizeof(fix->id));
           ^~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1451:2: note: Call to function 's=
trncpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(fix->id, MODULE_NAME, sizeof(fix->id));
           ^~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1577:2: warning: Call to function=
 'strncpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'strncpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(name, conf->lcd.ctrl_name, sizeof(name) - 1);
           ^~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1577:2: note: Call to function 's=
trncpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(name, conf->lcd.ctrl_name, sizeof(name) - 1);
           ^~~~~~~
>> drivers/video/fbdev/omap/omapfb_main.c:1811:16: warning: Use of memory a=
fter it is freed [clang-analyzer-unix.Malloc]
           fbdev->dssdev =3D NULL;
           ~~~~~~~~~~~~~ ^
   drivers/video/fbdev/omap/omapfb_main.c:1808:2: note: Calling 'omapfb_fre=
e_resources'
           omapfb_free_resources(fbdev, saved_state);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1530:2: note: Control jumps to 'c=
ase 1:'  at line 1555
           switch (state) {
           ^
   drivers/video/fbdev/omap/omapfb_main.c:1557:3: note: Memory is released
                   kfree(fbdev);
                   ^~~~~~~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1558:3: note:  Execution continue=
s on line 1557
                   break;
                   ^
   drivers/video/fbdev/omap/omapfb_main.c:1808:2: note: Returning; memory w=
as released via 1st parameter
           omapfb_free_resources(fbdev, saved_state);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap/omapfb_main.c:1811:16: note: Use of memory afte=
r it is freed
           fbdev->dssdev =3D NULL;
           ~~~~~~~~~~~~~ ^
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/media/i2c/ov7670.c:1292:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D ov7670_read(sd, REG_CMATRIX_SIGN, &signbits);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1292:2: note: Value stored to 'ret' is never =
read
           ret =3D ov7670_read(sd, REG_CMATRIX_SIGN, &signbits);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1381:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(tmpmatrix, matrix, CMATRIX_LEN*sizeof(int));
                   ^~~~~~
   drivers/media/i2c/ov7670.c:1381:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(tmpmatrix, matrix, CMATRIX_LEN*sizeof(int));
                   ^~~~~~
   drivers/media/i2c/ov7670.c:1528:15: warning: The left operand of '&' is =
a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           com1 =3D (com1 & 0xfc) | (value & 0x03);
                        ^
   drivers/media/i2c/ov7670.c:1597:2: note: Control jumps to 'case 10094849=
:'  at line 1617
           switch (ctrl->id) {
           ^
   drivers/media/i2c/ov7670.c:1620:7: note: Assuming field 'val' is equal t=
o V4L2_EXPOSURE_MANUAL
                   if (ctrl->val =3D=3D V4L2_EXPOSURE_MANUAL) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1620:3: note: Taking true branch
                   if (ctrl->val =3D=3D V4L2_EXPOSURE_MANUAL) {
                   ^
   drivers/media/i2c/ov7670.c:1622:11: note: Calling 'ov7670_s_exp'
                           return ov7670_s_exp(sd, info->exposure->val);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1520:16: note: 'com1' declared without an ini=
tial value
           unsigned char com1, com8, aech, aechh;
                         ^~~~
   drivers/media/i2c/ov7670.c:1522:8: note: Calling 'ov7670_read'
           ret =3D ov7670_read(sd, REG_COM1, &com1) +
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:565:6: note: Assuming field 'use_smbus' is tr=
ue
           if (info->use_smbus)
               ^~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:565:2: note: Taking true branch
           if (info->use_smbus)
           ^
   drivers/media/i2c/ov7670.c:566:10: note: Calling 'ov7670_read_smbus'
                   return ov7670_read_smbus(sd, reg, value);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:485:6: note: Assuming 'ret' is < 0
           if (ret >=3D 0) {
               ^~~~~~~~
   drivers/media/i2c/ov7670.c:485:2: note: Taking false branch
           if (ret >=3D 0) {
           ^
   drivers/media/i2c/ov7670.c:489:2: note: Returning without writing to '*v=
alue'
           return ret;
           ^
   drivers/media/i2c/ov7670.c:566:10: note: Returning from 'ov7670_read_smb=
us'
                   return ov7670_read_smbus(sd, reg, value);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:566:3: note: Returning without writing to '*v=
alue'
                   return ov7670_read_smbus(sd, reg, value);
                   ^
   drivers/media/i2c/ov7670.c:1522:8: note: Returning from 'ov7670_read'
           ret =3D ov7670_read(sd, REG_COM1, &com1) +
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov7670.c:1525:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/ov7670.c:1525:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/i2c/ov7670.c:1528:15: note: The left operand of '&' is a g=
arbage value
           com1 =3D (com1 & 0xfc) | (value & 0x03);
                   ~~~~ ^
   drivers/media/i2c/ov7670.c:1530:17: warning: The left operand of '&' is =
a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           aechh =3D (aechh & 0xc0) | ((value >> 10) & 0x3f);
                          ^
   drivers/media/i2c/ov7670.c:1597:2: note: Control jumps to 'case 10094849=
:'  at line 1617
           switch (ctrl->id) {
           ^
   drivers/media/i2c/ov7670.c:1620:7: note: Assuming field 'val' is equal t=
o V4L2_EXPOSURE_MANUAL
                   if (ctrl->val =3D=3D V4L2_EXPOSURE_MANUAL) {

vim +1811 drivers/video/fbdev/omap/omapfb_main.c

8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1798  =

8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1799  /* Called when the device is being detached from the driver */
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1800  static int omapfb_remove(struct platform_device *pdev)
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1801  {
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1802  	struct omapfb_device *fbdev =3D platform_get_drvdata(pdev);
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1803  	enum omapfb_state saved_state =3D fbdev->state;
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1804  =

8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1805  	/* FIXME: wait till completion of pending events */
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1806  =

8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1807  	fbdev->state =3D OMAPFB_DISABLED;
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1808  	omapfb_free_resources(fbdev, saved_state);
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1809  =

f778a12dd33200 drivers/video/omap/omapfb_main.c Tomi Valkeinen 2009-12-16  =
1810  	platform_device_unregister(&omapdss_device);
f778a12dd33200 drivers/video/omap/omapfb_main.c Tomi Valkeinen 2009-12-16 @=
1811  	fbdev->dssdev =3D NULL;
f778a12dd33200 drivers/video/omap/omapfb_main.c Tomi Valkeinen 2009-12-16  =
1812  =

8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1813  	return 0;
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1814  }
8b08cf2b64f5a6 drivers/video/omap/omapfb_main.c Imre Deak      2007-07-17  =
1815  =


:::::: The code at line 1811 was first introduced by commit
:::::: f778a12dd33200513596a0d4d3ba4d5f09e79c09 OMAP: OMAPFB: fix clk_get f=
or RFBI

:::::: TO: Tomi Valkeinen <tomi.valkeinen@nokia.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@nokia.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4648476233356459657==--

