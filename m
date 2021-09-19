Content-Type: multipart/mixed; boundary="===============1460158324533003083=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/net/bpf_jit_32.c:1707:6: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 19 Sep 2021 09:18:11 +0800
Message-ID: <202109190906.WpvSf2hO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1460158324533003083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Borkmann <daniel@iogearbox.net>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d4d016caa4b85b9aa98d7ec8c84e928621a614bc
commit: b24abcff918a5cbf44b0c982bd3477a93e8e4911 bpf, kconfig: Add consolid=
ated menu entry for bpf with core options
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20210917 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c8b3d7=
d6d6de37af68b2f379d0e37304f78e115f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db24abcff918a5cbf44b0c982bd3477a93e8e4911
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b24abcff918a5cbf44b0c982bd3477a93e8e4911
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   arch/arm/net/bpf_jit_32.c:1169:2: note: Loop condition is false.  Exitin=
g loop
           BUILD_BUG_ON(offsetof(struct bpf_array, map.max_entries) >
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   arch/arm/net/bpf_jit_32.c:1172:12: note: 2nd function call argument is a=
n uninitialized value
           r_array =3D arm_bpf_get_reg32(r2[1], tmp2[0], ctx);
                     ^                        ~~~~~~~
   arch/arm/net/bpf_jit_32.c:1447:11: warning: 2nd function call argument i=
s an uninitialized value [clang-analyzer-core.CallAndMessage]
                   rd_lo =3D arm_bpf_get_reg32(dst_lo, tmp2[1], ctx);
                           ^                         ~~~~~~~
   arch/arm/net/bpf_jit_32.c:1354:20: note: Assuming the condition is false
           const bool is64 =3D BPF_CLASS(code) =3D=3D BPF_ALU64;
                             ^
   include/uapi/linux/bpf_common.h:6:25: note: expanded from macro 'BPF_CLA=
SS'
   #define BPF_CLASS(code) ((code) & 0x07)
                           ^
   arch/arm/net/bpf_jit_32.c:1369:2: note: Control jumps to 'case 156:'  at=
 line 1446
           switch (code) {
           ^
   arch/arm/net/bpf_jit_32.c:1447:11: note: 2nd function call argument is a=
n uninitialized value
                   rd_lo =3D arm_bpf_get_reg32(dst_lo, tmp2[1], ctx);
                           ^                         ~~~~~~~
   arch/arm/net/bpf_jit_32.c:1602:8: warning: 2nd function call argument is=
 an uninitialized value [clang-analyzer-core.CallAndMessage]
                   rn =3D arm_bpf_get_reg32(src_lo, tmp2[1], ctx);
                        ^                         ~~~~~~~
   arch/arm/net/bpf_jit_32.c:1354:20: note: Assuming the condition is false
           const bool is64 =3D BPF_CLASS(code) =3D=3D BPF_ALU64;
                             ^
   include/uapi/linux/bpf_common.h:6:25: note: expanded from macro 'BPF_CLA=
SS'
   #define BPF_CLASS(code) ((code) & 0x07)
                           ^
   arch/arm/net/bpf_jit_32.c:1369:2: note: Control jumps to 'case 121:'  at=
 line 1601
           switch (code) {
           ^
   arch/arm/net/bpf_jit_32.c:1602:8: note: 2nd function call argument is an=
 uninitialized value
                   rn =3D arm_bpf_get_reg32(src_lo, tmp2[1], ctx);
                        ^                         ~~~~~~~
   arch/arm/net/bpf_jit_32.c:1618:4: warning: 1st function call argument is=
 an uninitialized value [clang-analyzer-core.CallAndMessage]
                           emit_a32_mov_i(tmp2[1], imm, ctx);
                           ^              ~~~~~~~
   arch/arm/net/bpf_jit_32.c:1354:20: note: Assuming the condition is false
           const bool is64 =3D BPF_CLASS(code) =3D=3D BPF_ALU64;
                             ^
   include/uapi/linux/bpf_common.h:6:25: note: expanded from macro 'BPF_CLA=
SS'
   #define BPF_CLASS(code) ((code) & 0x07)
                           ^
   arch/arm/net/bpf_jit_32.c:1369:2: note: Control jumps to 'case 114:'  at=
 line 1608
           switch (code) {
           ^
   arch/arm/net/bpf_jit_32.c:1610:3: note: Control jumps to 'case 16:'  at =
line 1617
                   switch (BPF_SIZE(code)) {
                   ^
   arch/arm/net/bpf_jit_32.c:1618:4: note: 1st function call argument is an=
 uninitialized value
                           emit_a32_mov_i(tmp2[1], imm, ctx);
                           ^              ~~~~~~~
   arch/arm/net/bpf_jit_32.c:1669:8: warning: 2nd function call argument is=
 an uninitialized value [clang-analyzer-core.CallAndMessage]
                   rm =3D arm_bpf_get_reg32(src_hi, tmp2[0], ctx);
                        ^                         ~~~~~~~
   arch/arm/net/bpf_jit_32.c:1354:20: note: Assuming the condition is false
           const bool is64 =3D BPF_CLASS(code) =3D=3D BPF_ALU64;
                             ^
   include/uapi/linux/bpf_common.h:6:25: note: expanded from macro 'BPF_CLA=
SS'
   #define BPF_CLASS(code) ((code) & 0x07)
                           ^
   arch/arm/net/bpf_jit_32.c:1369:2: note: Control jumps to 'case 222:'  at=
 line 1667
           switch (code) {
           ^
   arch/arm/net/bpf_jit_32.c:1669:8: note: 2nd function call argument is an=
 uninitialized value
                   rm =3D arm_bpf_get_reg32(src_hi, tmp2[0], ctx);
                        ^                         ~~~~~~~
>> arch/arm/net/bpf_jit_32.c:1707:6: warning: Assigned value is garbage or =
undefined [clang-analyzer-core.uninitialized.Assign]
                   rm =3D tmp2[0];
                      ^ ~~~~~~~
   arch/arm/net/bpf_jit_32.c:1354:20: note: Assuming the condition is false
           const bool is64 =3D BPF_CLASS(code) =3D=3D BPF_ALU64;
                             ^
   include/uapi/linux/bpf_common.h:6:25: note: expanded from macro 'BPF_CLA=
SS'
   #define BPF_CLASS(code) ((code) & 0x07)
                           ^
   arch/arm/net/bpf_jit_32.c:1369:2: note: Control jumps to 'case 214:'  at=
 line 1704
           switch (code) {
           ^
   arch/arm/net/bpf_jit_32.c:1705:7: note: Assuming 'off' is not equal to 0
                   if (off =3D=3D 0)
                       ^~~~~~~~
   arch/arm/net/bpf_jit_32.c:1705:3: note: Taking false branch
                   if (off =3D=3D 0)
                   ^
   arch/arm/net/bpf_jit_32.c:1707:6: note: Assigned value is garbage or und=
efined
                   rm =3D tmp2[0];
                      ^ ~~~~~~~
   arch/arm/net/bpf_jit_32.c:1787:3: warning: 1st function call argument is=
 an uninitialized value [clang-analyzer-core.CallAndMessage]
                   emit_a32_mov_i(tmp[1], func, ctx);
                   ^              ~~~~~~
   arch/arm/net/bpf_jit_32.c:1354:20: note: Assuming the condition is false
           const bool is64 =3D BPF_CLASS(code) =3D=3D BPF_ALU64;
                             ^
   include/uapi/linux/bpf_common.h:6:25: note: expanded from macro 'BPF_CLA=
SS'
   #define BPF_CLASS(code) ((code) & 0x07)
                           ^
   arch/arm/net/bpf_jit_32.c:1369:2: note: Control jumps to 'case 133:'  at=
 line 1771
           switch (code) {
           ^
   arch/arm/net/bpf_jit_32.c:1787:3: note: 1st function call argument is an=
 uninitialized value
                   emit_a32_mov_i(tmp[1], func, ctx);
                   ^              ~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   crypto/drbg.c:245:17: warning: Value stored to 'entropylen' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned short entropylen =3D drbg_sec_strength(drbg->core->flag=
s);
                          ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/drbg.c:245:17: note: Value stored to 'entropylen' during its init=
ialization is never read
           unsigned short entropylen =3D drbg_sec_strength(drbg->core->flag=
s);
                          ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/drbg.c:442:40: warning: Division by zero [clang-analyzer-core.Div=
ideZero]
           padlen =3D (inputlen + sizeof(L_N) + 1) % (drbg_blocklen(drbg));
                                                 ^
   crypto/drbg.c:599:12: note: Assuming '__UNIQUE_ID___x254' is >=3D '__UNI=
QUE_ID___y255'
           int len =3D min_t(int, buflen, INT_MAX);
                     ^
   include/linux/minmax.h:110:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   crypto/drbg.c:599:12: note: '?' condition is false
           int len =3D min_t(int, buflen, INT_MAX);
                     ^
   include/linux/minmax.h:110:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })

vim +1707 arch/arm/net/bpf_jit_32.c

39c13c204bb115 Shubham Bansal   2017-08-22  1368  =

39c13c204bb115 Shubham Bansal   2017-08-22  1369  	switch (code) {
39c13c204bb115 Shubham Bansal   2017-08-22  1370  	/* ALU operations */
39c13c204bb115 Shubham Bansal   2017-08-22  1371  =

39c13c204bb115 Shubham Bansal   2017-08-22  1372  	/* dst =3D src */
39c13c204bb115 Shubham Bansal   2017-08-22  1373  	case BPF_ALU | BPF_MOV |=
 BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1374  	case BPF_ALU | BPF_MOV |=
 BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1375  	case BPF_ALU64 | BPF_MOV=
 | BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1376  	case BPF_ALU64 | BPF_MOV=
 | BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1377  		switch (BPF_SRC(code)) {
39c13c204bb115 Shubham Bansal   2017-08-22  1378  		case BPF_X:
163541e6ba3426 Jiong Wang       2019-05-24  1379  			if (imm =3D=3D 1) {
163541e6ba3426 Jiong Wang       2019-05-24  1380  				/* Special mov32 for =
zext */
163541e6ba3426 Jiong Wang       2019-05-24  1381  				emit_a32_mov_i(dst_hi=
, 0, ctx);
163541e6ba3426 Jiong Wang       2019-05-24  1382  				break;
163541e6ba3426 Jiong Wang       2019-05-24  1383  			}
47b9c3bf416d80 Russell King     2018-07-11  1384  			emit_a32_mov_r64(is64,=
 dst, src, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1385  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1386  		case BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1387  			/* Sign-extend immedia=
te value to destination reg */
f9ff5018c13b49 Russell King     2018-07-12  1388  			emit_a32_mov_se_i64(is=
64, dst, imm, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1389  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1390  		}
39c13c204bb115 Shubham Bansal   2017-08-22  1391  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1392  	/* dst =3D dst + src/imm=
 */
39c13c204bb115 Shubham Bansal   2017-08-22  1393  	/* dst =3D dst - src/imm=
 */
39c13c204bb115 Shubham Bansal   2017-08-22  1394  	/* dst =3D dst | src/imm=
 */
39c13c204bb115 Shubham Bansal   2017-08-22  1395  	/* dst =3D dst & src/imm=
 */
39c13c204bb115 Shubham Bansal   2017-08-22  1396  	/* dst =3D dst ^ src/imm=
 */
39c13c204bb115 Shubham Bansal   2017-08-22  1397  	/* dst =3D dst * src/imm=
 */
39c13c204bb115 Shubham Bansal   2017-08-22  1398  	/* dst =3D dst << src */
39c13c204bb115 Shubham Bansal   2017-08-22  1399  	/* dst =3D dst >> src */
39c13c204bb115 Shubham Bansal   2017-08-22  1400  	case BPF_ALU | BPF_ADD |=
 BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1401  	case BPF_ALU | BPF_ADD |=
 BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1402  	case BPF_ALU | BPF_SUB |=
 BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1403  	case BPF_ALU | BPF_SUB |=
 BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1404  	case BPF_ALU | BPF_OR | =
BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1405  	case BPF_ALU | BPF_OR | =
BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1406  	case BPF_ALU | BPF_AND |=
 BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1407  	case BPF_ALU | BPF_AND |=
 BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1408  	case BPF_ALU | BPF_XOR |=
 BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1409  	case BPF_ALU | BPF_XOR |=
 BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1410  	case BPF_ALU | BPF_MUL |=
 BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1411  	case BPF_ALU | BPF_MUL |=
 BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1412  	case BPF_ALU | BPF_LSH |=
 BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1413  	case BPF_ALU | BPF_RSH |=
 BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1414  	case BPF_ALU | BPF_ARSH =
| BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1415  	case BPF_ALU64 | BPF_ADD=
 | BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1416  	case BPF_ALU64 | BPF_ADD=
 | BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1417  	case BPF_ALU64 | BPF_SUB=
 | BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1418  	case BPF_ALU64 | BPF_SUB=
 | BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1419  	case BPF_ALU64 | BPF_OR =
| BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1420  	case BPF_ALU64 | BPF_OR =
| BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1421  	case BPF_ALU64 | BPF_AND=
 | BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1422  	case BPF_ALU64 | BPF_AND=
 | BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1423  	case BPF_ALU64 | BPF_XOR=
 | BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1424  	case BPF_ALU64 | BPF_XOR=
 | BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1425  		switch (BPF_SRC(code)) {
39c13c204bb115 Shubham Bansal   2017-08-22  1426  		case BPF_X:
47b9c3bf416d80 Russell King     2018-07-11  1427  			emit_a32_alu_r64(is64,=
 dst, src, ctx, BPF_OP(code));
39c13c204bb115 Shubham Bansal   2017-08-22  1428  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1429  		case BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1430  			/* Move immediate valu=
e to the temporary register
39c13c204bb115 Shubham Bansal   2017-08-22  1431  			 * and then do the ALU=
 operation on the temporary
39c13c204bb115 Shubham Bansal   2017-08-22  1432  			 * register as this wi=
ll sign-extend the immediate
39c13c204bb115 Shubham Bansal   2017-08-22  1433  			 * value into temporar=
y reg and then it would be
39c13c204bb115 Shubham Bansal   2017-08-22  1434  			 * safe to do the oper=
ation on it.
24e737c1ebacf0 Nicolas Schichan 2015-05-07  1435  			 */
f9ff5018c13b49 Russell King     2018-07-12  1436  			emit_a32_mov_se_i64(is=
64, tmp2, imm, ctx);
47b9c3bf416d80 Russell King     2018-07-11  1437  			emit_a32_alu_r64(is64,=
 dst, tmp2, ctx, BPF_OP(code));
39c13c204bb115 Shubham Bansal   2017-08-22  1438  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1439  		}
39c13c204bb115 Shubham Bansal   2017-08-22  1440  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1441  	/* dst =3D dst / src(imm=
) */
39c13c204bb115 Shubham Bansal   2017-08-22  1442  	/* dst =3D dst % src(imm=
) */
39c13c204bb115 Shubham Bansal   2017-08-22  1443  	case BPF_ALU | BPF_DIV |=
 BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1444  	case BPF_ALU | BPF_DIV |=
 BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1445  	case BPF_ALU | BPF_MOD |=
 BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1446  	case BPF_ALU | BPF_MOD |=
 BPF_X:
a6eccac507e5e4 Russell King     2018-07-11  1447  		rd_lo =3D arm_bpf_get_r=
eg32(dst_lo, tmp2[1], ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1448  		switch (BPF_SRC(code)) {
39c13c204bb115 Shubham Bansal   2017-08-22  1449  		case BPF_X:
7a9870256361d4 Russell King     2018-07-11  1450  			rt =3D arm_bpf_get_reg=
32(src_lo, tmp2[0], ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1451  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1452  		case BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1453  			rt =3D tmp2[0];
47b9c3bf416d80 Russell King     2018-07-11  1454  			emit_a32_mov_i(rt, imm=
, ctx);
47b9c3bf416d80 Russell King     2018-07-11  1455  			break;
47b9c3bf416d80 Russell King     2018-07-11  1456  		default:
47b9c3bf416d80 Russell King     2018-07-11  1457  			rt =3D src_lo;
39c13c204bb115 Shubham Bansal   2017-08-22  1458  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1459  		}
a6eccac507e5e4 Russell King     2018-07-11  1460  		emit_udivmod(rd_lo, rd_=
lo, rt, ctx, BPF_OP(code));
a6eccac507e5e4 Russell King     2018-07-11  1461  		arm_bpf_put_reg32(dst_l=
o, rd_lo, ctx);
163541e6ba3426 Jiong Wang       2019-05-24  1462  		if (!ctx->prog->aux->ve=
rifier_zext)
47b9c3bf416d80 Russell King     2018-07-11  1463  			emit_a32_mov_i(dst_hi,=
 0, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1464  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1465  	case BPF_ALU64 | BPF_DIV=
 | BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1466  	case BPF_ALU64 | BPF_DIV=
 | BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1467  	case BPF_ALU64 | BPF_MOD=
 | BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1468  	case BPF_ALU64 | BPF_MOD=
 | BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1469  		goto notyet;
39c13c204bb115 Shubham Bansal   2017-08-22  1470  	/* dst =3D dst << imm */
c648c9c7429e97 Luke Nelson      2020-04-30  1471  	/* dst =3D dst >> imm */
c648c9c7429e97 Luke Nelson      2020-04-30  1472  	/* dst =3D dst >> imm (s=
igned) */
39c13c204bb115 Shubham Bansal   2017-08-22  1473  	case BPF_ALU | BPF_LSH |=
 BPF_K:
c648c9c7429e97 Luke Nelson      2020-04-30  1474  	case BPF_ALU | BPF_RSH |=
 BPF_K:
c648c9c7429e97 Luke Nelson      2020-04-30  1475  	case BPF_ALU | BPF_ARSH =
| BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1476  		if (unlikely(imm > 31))
39c13c204bb115 Shubham Bansal   2017-08-22  1477  			return -EINVAL;
39c13c204bb115 Shubham Bansal   2017-08-22  1478  		if (imm)
47b9c3bf416d80 Russell King     2018-07-11  1479  			emit_a32_alu_i(dst_lo,=
 imm, ctx, BPF_OP(code));
163541e6ba3426 Jiong Wang       2019-05-24  1480  		if (!ctx->prog->aux->ve=
rifier_zext)
47b9c3bf416d80 Russell King     2018-07-11  1481  			emit_a32_mov_i(dst_hi,=
 0, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1482  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1483  	/* dst =3D dst << imm */
39c13c204bb115 Shubham Bansal   2017-08-22  1484  	case BPF_ALU64 | BPF_LSH=
 | BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1485  		if (unlikely(imm > 63))
39c13c204bb115 Shubham Bansal   2017-08-22  1486  			return -EINVAL;
47b9c3bf416d80 Russell King     2018-07-11  1487  		emit_a32_lsh_i64(dst, i=
mm, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1488  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1489  	/* dst =3D dst >> imm */
39c13c204bb115 Shubham Bansal   2017-08-22  1490  	case BPF_ALU64 | BPF_RSH=
 | BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1491  		if (unlikely(imm > 63))
39c13c204bb115 Shubham Bansal   2017-08-22  1492  			return -EINVAL;
47b9c3bf416d80 Russell King     2018-07-11  1493  		emit_a32_rsh_i64(dst, i=
mm, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1494  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1495  	/* dst =3D dst << src */
39c13c204bb115 Shubham Bansal   2017-08-22  1496  	case BPF_ALU64 | BPF_LSH=
 | BPF_X:
47b9c3bf416d80 Russell King     2018-07-11  1497  		emit_a32_lsh_r64(dst, s=
rc, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1498  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1499  	/* dst =3D dst >> src */
39c13c204bb115 Shubham Bansal   2017-08-22  1500  	case BPF_ALU64 | BPF_RSH=
 | BPF_X:
47b9c3bf416d80 Russell King     2018-07-11  1501  		emit_a32_rsh_r64(dst, s=
rc, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1502  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1503  	/* dst =3D dst >> src (s=
igned) */
39c13c204bb115 Shubham Bansal   2017-08-22  1504  	case BPF_ALU64 | BPF_ARS=
H | BPF_X:
47b9c3bf416d80 Russell King     2018-07-11  1505  		emit_a32_arsh_r64(dst, =
src, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1506  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1507  	/* dst =3D dst >> imm (s=
igned) */
39c13c204bb115 Shubham Bansal   2017-08-22  1508  	case BPF_ALU64 | BPF_ARS=
H | BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1509  		if (unlikely(imm > 63))
39c13c204bb115 Shubham Bansal   2017-08-22  1510  			return -EINVAL;
47b9c3bf416d80 Russell King     2018-07-11  1511  		emit_a32_arsh_i64(dst, =
imm, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1512  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1513  	/* dst =3D ~dst */
39c13c204bb115 Shubham Bansal   2017-08-22  1514  	case BPF_ALU | BPF_NEG:
47b9c3bf416d80 Russell King     2018-07-11  1515  		emit_a32_alu_i(dst_lo, =
0, ctx, BPF_OP(code));
163541e6ba3426 Jiong Wang       2019-05-24  1516  		if (!ctx->prog->aux->ve=
rifier_zext)
47b9c3bf416d80 Russell King     2018-07-11  1517  			emit_a32_mov_i(dst_hi,=
 0, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1518  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1519  	/* dst =3D ~dst (64 bit)=
 */
39c13c204bb115 Shubham Bansal   2017-08-22  1520  	case BPF_ALU64 | BPF_NEG:
47b9c3bf416d80 Russell King     2018-07-11  1521  		emit_a32_neg64(dst, ctx=
);
39c13c204bb115 Shubham Bansal   2017-08-22  1522  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1523  	/* dst =3D dst * src/imm=
 */
39c13c204bb115 Shubham Bansal   2017-08-22  1524  	case BPF_ALU64 | BPF_MUL=
 | BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1525  	case BPF_ALU64 | BPF_MUL=
 | BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1526  		switch (BPF_SRC(code)) {
39c13c204bb115 Shubham Bansal   2017-08-22  1527  		case BPF_X:
47b9c3bf416d80 Russell King     2018-07-11  1528  			emit_a32_mul_r64(dst, =
src, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1529  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1530  		case BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1531  			/* Move immediate valu=
e to the temporary register
39c13c204bb115 Shubham Bansal   2017-08-22  1532  			 * and then do the mul=
tiplication on it as this
39c13c204bb115 Shubham Bansal   2017-08-22  1533  			 * will sign-extend th=
e immediate value into temp
39c13c204bb115 Shubham Bansal   2017-08-22  1534  			 * reg then it would b=
e safe to do the operation
39c13c204bb115 Shubham Bansal   2017-08-22  1535  			 * on it.
39c13c204bb115 Shubham Bansal   2017-08-22  1536  			 */
f9ff5018c13b49 Russell King     2018-07-12  1537  			emit_a32_mov_se_i64(is=
64, tmp2, imm, ctx);
47b9c3bf416d80 Russell King     2018-07-11  1538  			emit_a32_mul_r64(dst, =
tmp2, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1539  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1540  		}
39c13c204bb115 Shubham Bansal   2017-08-22  1541  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1542  	/* dst =3D htole(dst) */
39c13c204bb115 Shubham Bansal   2017-08-22  1543  	/* dst =3D htobe(dst) */
39c13c204bb115 Shubham Bansal   2017-08-22  1544  	case BPF_ALU | BPF_END |=
 BPF_FROM_LE:
39c13c204bb115 Shubham Bansal   2017-08-22  1545  	case BPF_ALU | BPF_END |=
 BPF_FROM_BE:
a6eccac507e5e4 Russell King     2018-07-11  1546  		rd =3D arm_bpf_get_reg6=
4(dst, tmp, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1547  		if (BPF_SRC(code) =3D=
=3D BPF_FROM_LE)
39c13c204bb115 Shubham Bansal   2017-08-22  1548  			goto emit_bswap_uxt;
39c13c204bb115 Shubham Bansal   2017-08-22  1549  		switch (imm) {
39c13c204bb115 Shubham Bansal   2017-08-22  1550  		case 16:
a6eccac507e5e4 Russell King     2018-07-11  1551  			emit_rev16(rd[1], rd[1=
], ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1552  			goto emit_bswap_uxt;
39c13c204bb115 Shubham Bansal   2017-08-22  1553  		case 32:
a6eccac507e5e4 Russell King     2018-07-11  1554  			emit_rev32(rd[1], rd[1=
], ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1555  			goto emit_bswap_uxt;
39c13c204bb115 Shubham Bansal   2017-08-22  1556  		case 64:
a6eccac507e5e4 Russell King     2018-07-11  1557  			emit_rev32(ARM_LR, rd[=
1], ctx);
a6eccac507e5e4 Russell King     2018-07-11  1558  			emit_rev32(rd[1], rd[0=
], ctx);
a6eccac507e5e4 Russell King     2018-07-11  1559  			emit(ARM_MOV_R(rd[0], =
ARM_LR), ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1560  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1561  		}
39c13c204bb115 Shubham Bansal   2017-08-22  1562  		goto exit;
39c13c204bb115 Shubham Bansal   2017-08-22  1563  emit_bswap_uxt:
39c13c204bb115 Shubham Bansal   2017-08-22  1564  		switch (imm) {
39c13c204bb115 Shubham Bansal   2017-08-22  1565  		case 16:
39c13c204bb115 Shubham Bansal   2017-08-22  1566  			/* zero-extend 16 bits=
 into 64 bits */
39c13c204bb115 Shubham Bansal   2017-08-22  1567  #if __LINUX_ARM_ARCH__ < 6
47b9c3bf416d80 Russell King     2018-07-11  1568  			emit_a32_mov_i(tmp2[1]=
, 0xffff, ctx);
a6eccac507e5e4 Russell King     2018-07-11  1569  			emit(ARM_AND_R(rd[1], =
rd[1], tmp2[1]), ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1570  #else /* ARMv6+ */
a6eccac507e5e4 Russell King     2018-07-11  1571  			emit(ARM_UXTH(rd[1], r=
d[1]), ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1572  #endif
163541e6ba3426 Jiong Wang       2019-05-24  1573  			if (!ctx->prog->aux->v=
erifier_zext)
a6eccac507e5e4 Russell King     2018-07-11  1574  				emit(ARM_EOR_R(rd[0],=
 rd[0], rd[0]), ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1575  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1576  		case 32:
39c13c204bb115 Shubham Bansal   2017-08-22  1577  			/* zero-extend 32 bits=
 into 64 bits */
163541e6ba3426 Jiong Wang       2019-05-24  1578  			if (!ctx->prog->aux->v=
erifier_zext)
a6eccac507e5e4 Russell King     2018-07-11  1579  				emit(ARM_EOR_R(rd[0],=
 rd[0], rd[0]), ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1580  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1581  		case 64:
39c13c204bb115 Shubham Bansal   2017-08-22  1582  			/* nop */
39c13c204bb115 Shubham Bansal   2017-08-22  1583  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1584  		}
39c13c204bb115 Shubham Bansal   2017-08-22  1585  exit:
a6eccac507e5e4 Russell King     2018-07-11  1586  		arm_bpf_put_reg64(dst, =
rd, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1587  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1588  	/* dst =3D imm64 */
39c13c204bb115 Shubham Bansal   2017-08-22  1589  	case BPF_LD | BPF_IMM | =
BPF_DW:
39c13c204bb115 Shubham Bansal   2017-08-22  1590  	{
f9ff5018c13b49 Russell King     2018-07-12  1591  		u64 val =3D (u32)imm | =
(u64)insn[1].imm << 32;
39c13c204bb115 Shubham Bansal   2017-08-22  1592  =

f9ff5018c13b49 Russell King     2018-07-12  1593  		emit_a32_mov_i64(dst, v=
al, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1594  =

39c13c204bb115 Shubham Bansal   2017-08-22  1595  		return 1;
39c13c204bb115 Shubham Bansal   2017-08-22  1596  	}
39c13c204bb115 Shubham Bansal   2017-08-22  1597  	/* LDX: dst =3D *(size *=
)(src + off) */
39c13c204bb115 Shubham Bansal   2017-08-22  1598  	case BPF_LDX | BPF_MEM |=
 BPF_W:
39c13c204bb115 Shubham Bansal   2017-08-22  1599  	case BPF_LDX | BPF_MEM |=
 BPF_H:
39c13c204bb115 Shubham Bansal   2017-08-22  1600  	case BPF_LDX | BPF_MEM |=
 BPF_B:
39c13c204bb115 Shubham Bansal   2017-08-22  1601  	case BPF_LDX | BPF_MEM |=
 BPF_DW:
7a9870256361d4 Russell King     2018-07-11  1602  		rn =3D arm_bpf_get_reg3=
2(src_lo, tmp2[1], ctx);
47b9c3bf416d80 Russell King     2018-07-11  1603  		emit_ldx_r(dst, rn, off=
, ctx, BPF_SIZE(code));
39c13c204bb115 Shubham Bansal   2017-08-22  1604  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1605  	/* ST: *(size *)(dst + o=
ff) =3D imm */
39c13c204bb115 Shubham Bansal   2017-08-22  1606  	case BPF_ST | BPF_MEM | =
BPF_W:
39c13c204bb115 Shubham Bansal   2017-08-22  1607  	case BPF_ST | BPF_MEM | =
BPF_H:
39c13c204bb115 Shubham Bansal   2017-08-22  1608  	case BPF_ST | BPF_MEM | =
BPF_B:
39c13c204bb115 Shubham Bansal   2017-08-22  1609  	case BPF_ST | BPF_MEM | =
BPF_DW:
39c13c204bb115 Shubham Bansal   2017-08-22  1610  		switch (BPF_SIZE(code))=
 {
39c13c204bb115 Shubham Bansal   2017-08-22  1611  		case BPF_DW:
39c13c204bb115 Shubham Bansal   2017-08-22  1612  			/* Sign-extend immedia=
te value into temp reg */
f9ff5018c13b49 Russell King     2018-07-12  1613  			emit_a32_mov_se_i64(tr=
ue, tmp2, imm, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1614  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1615  		case BPF_W:
39c13c204bb115 Shubham Bansal   2017-08-22  1616  		case BPF_H:
39c13c204bb115 Shubham Bansal   2017-08-22  1617  		case BPF_B:
47b9c3bf416d80 Russell King     2018-07-11  1618  			emit_a32_mov_i(tmp2[1]=
, imm, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1619  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1620  		}
c5eae692571d6c Russell King     2018-07-12  1621  		emit_str_r(dst_lo, tmp2=
, off, ctx, BPF_SIZE(code));
39c13c204bb115 Shubham Bansal   2017-08-22  1622  		break;
91c960b0056672 Brendan Jackman  2021-01-14  1623  	/* Atomic ops */
91c960b0056672 Brendan Jackman  2021-01-14  1624  	case BPF_STX | BPF_ATOMI=
C | BPF_W:
91c960b0056672 Brendan Jackman  2021-01-14  1625  	case BPF_STX | BPF_ATOMI=
C | BPF_DW:
39c13c204bb115 Shubham Bansal   2017-08-22  1626  		goto notyet;
39c13c204bb115 Shubham Bansal   2017-08-22  1627  	/* STX: *(size *)(dst + =
off) =3D src */
39c13c204bb115 Shubham Bansal   2017-08-22  1628  	case BPF_STX | BPF_MEM |=
 BPF_W:
39c13c204bb115 Shubham Bansal   2017-08-22  1629  	case BPF_STX | BPF_MEM |=
 BPF_H:
39c13c204bb115 Shubham Bansal   2017-08-22  1630  	case BPF_STX | BPF_MEM |=
 BPF_B:
39c13c204bb115 Shubham Bansal   2017-08-22  1631  	case BPF_STX | BPF_MEM |=
 BPF_DW:
a6eccac507e5e4 Russell King     2018-07-11  1632  		rs =3D arm_bpf_get_reg6=
4(src, tmp2, ctx);
c5eae692571d6c Russell King     2018-07-12  1633  		emit_str_r(dst_lo, rs, =
off, ctx, BPF_SIZE(code));
39c13c204bb115 Shubham Bansal   2017-08-22  1634  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1635  	/* PC +=3D off if dst =
=3D=3D src */
39c13c204bb115 Shubham Bansal   2017-08-22  1636  	/* PC +=3D off if dst > =
src */
39c13c204bb115 Shubham Bansal   2017-08-22  1637  	/* PC +=3D off if dst >=
=3D src */
39c13c204bb115 Shubham Bansal   2017-08-22  1638  	/* PC +=3D off if dst < =
src */
39c13c204bb115 Shubham Bansal   2017-08-22  1639  	/* PC +=3D off if dst <=
=3D src */
39c13c204bb115 Shubham Bansal   2017-08-22  1640  	/* PC +=3D off if dst !=
=3D src */
39c13c204bb115 Shubham Bansal   2017-08-22  1641  	/* PC +=3D off if dst > =
src (signed) */
39c13c204bb115 Shubham Bansal   2017-08-22  1642  	/* PC +=3D off if dst >=
=3D src (signed) */
39c13c204bb115 Shubham Bansal   2017-08-22  1643  	/* PC +=3D off if dst < =
src (signed) */
39c13c204bb115 Shubham Bansal   2017-08-22  1644  	/* PC +=3D off if dst <=
=3D src (signed) */
39c13c204bb115 Shubham Bansal   2017-08-22  1645  	/* PC +=3D off if dst & =
src */
39c13c204bb115 Shubham Bansal   2017-08-22  1646  	case BPF_JMP | BPF_JEQ |=
 BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1647  	case BPF_JMP | BPF_JGT |=
 BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1648  	case BPF_JMP | BPF_JGE |=
 BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1649  	case BPF_JMP | BPF_JNE |=
 BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1650  	case BPF_JMP | BPF_JSGT =
| BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1651  	case BPF_JMP | BPF_JSGE =
| BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1652  	case BPF_JMP | BPF_JSET =
| BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1653  	case BPF_JMP | BPF_JLE |=
 BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1654  	case BPF_JMP | BPF_JLT |=
 BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1655  	case BPF_JMP | BPF_JSLT =
| BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1656  	case BPF_JMP | BPF_JSLE =
| BPF_X:
b85062ac0df33a Jiong Wang       2019-01-26  1657  	case BPF_JMP32 | BPF_JEQ=
 | BPF_X:
b85062ac0df33a Jiong Wang       2019-01-26  1658  	case BPF_JMP32 | BPF_JGT=
 | BPF_X:
b85062ac0df33a Jiong Wang       2019-01-26  1659  	case BPF_JMP32 | BPF_JGE=
 | BPF_X:
b85062ac0df33a Jiong Wang       2019-01-26  1660  	case BPF_JMP32 | BPF_JNE=
 | BPF_X:
b85062ac0df33a Jiong Wang       2019-01-26  1661  	case BPF_JMP32 | BPF_JSG=
T | BPF_X:
b85062ac0df33a Jiong Wang       2019-01-26  1662  	case BPF_JMP32 | BPF_JSG=
E | BPF_X:
b85062ac0df33a Jiong Wang       2019-01-26  1663  	case BPF_JMP32 | BPF_JSE=
T | BPF_X:
b85062ac0df33a Jiong Wang       2019-01-26  1664  	case BPF_JMP32 | BPF_JLE=
 | BPF_X:
b85062ac0df33a Jiong Wang       2019-01-26  1665  	case BPF_JMP32 | BPF_JLT=
 | BPF_X:
b85062ac0df33a Jiong Wang       2019-01-26  1666  	case BPF_JMP32 | BPF_JSL=
T | BPF_X:
b85062ac0df33a Jiong Wang       2019-01-26  1667  	case BPF_JMP32 | BPF_JSL=
E | BPF_X:
39c13c204bb115 Shubham Bansal   2017-08-22  1668  		/* Setup source registe=
rs */
7a9870256361d4 Russell King     2018-07-11  1669  		rm =3D arm_bpf_get_reg3=
2(src_hi, tmp2[0], ctx);
7a9870256361d4 Russell King     2018-07-11  1670  		rn =3D arm_bpf_get_reg3=
2(src_lo, tmp2[1], ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1671  		goto go_jmp;
39c13c204bb115 Shubham Bansal   2017-08-22  1672  	/* PC +=3D off if dst =
=3D=3D imm */
39c13c204bb115 Shubham Bansal   2017-08-22  1673  	/* PC +=3D off if dst > =
imm */
39c13c204bb115 Shubham Bansal   2017-08-22  1674  	/* PC +=3D off if dst >=
=3D imm */
39c13c204bb115 Shubham Bansal   2017-08-22  1675  	/* PC +=3D off if dst < =
imm */
39c13c204bb115 Shubham Bansal   2017-08-22  1676  	/* PC +=3D off if dst <=
=3D imm */
39c13c204bb115 Shubham Bansal   2017-08-22  1677  	/* PC +=3D off if dst !=
=3D imm */
39c13c204bb115 Shubham Bansal   2017-08-22  1678  	/* PC +=3D off if dst > =
imm (signed) */
39c13c204bb115 Shubham Bansal   2017-08-22  1679  	/* PC +=3D off if dst >=
=3D imm (signed) */
39c13c204bb115 Shubham Bansal   2017-08-22  1680  	/* PC +=3D off if dst < =
imm (signed) */
39c13c204bb115 Shubham Bansal   2017-08-22  1681  	/* PC +=3D off if dst <=
=3D imm (signed) */
39c13c204bb115 Shubham Bansal   2017-08-22  1682  	/* PC +=3D off if dst & =
imm */
39c13c204bb115 Shubham Bansal   2017-08-22  1683  	case BPF_JMP | BPF_JEQ |=
 BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1684  	case BPF_JMP | BPF_JGT |=
 BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1685  	case BPF_JMP | BPF_JGE |=
 BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1686  	case BPF_JMP | BPF_JNE |=
 BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1687  	case BPF_JMP | BPF_JSGT =
| BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1688  	case BPF_JMP | BPF_JSGE =
| BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1689  	case BPF_JMP | BPF_JSET =
| BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1690  	case BPF_JMP | BPF_JLT |=
 BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1691  	case BPF_JMP | BPF_JLE |=
 BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1692  	case BPF_JMP | BPF_JSLT =
| BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1693  	case BPF_JMP | BPF_JSLE =
| BPF_K:
b85062ac0df33a Jiong Wang       2019-01-26  1694  	case BPF_JMP32 | BPF_JEQ=
 | BPF_K:
b85062ac0df33a Jiong Wang       2019-01-26  1695  	case BPF_JMP32 | BPF_JGT=
 | BPF_K:
b85062ac0df33a Jiong Wang       2019-01-26  1696  	case BPF_JMP32 | BPF_JGE=
 | BPF_K:
b85062ac0df33a Jiong Wang       2019-01-26  1697  	case BPF_JMP32 | BPF_JNE=
 | BPF_K:
b85062ac0df33a Jiong Wang       2019-01-26  1698  	case BPF_JMP32 | BPF_JSG=
T | BPF_K:
b85062ac0df33a Jiong Wang       2019-01-26  1699  	case BPF_JMP32 | BPF_JSG=
E | BPF_K:
b85062ac0df33a Jiong Wang       2019-01-26  1700  	case BPF_JMP32 | BPF_JSE=
T | BPF_K:
b85062ac0df33a Jiong Wang       2019-01-26  1701  	case BPF_JMP32 | BPF_JLT=
 | BPF_K:
b85062ac0df33a Jiong Wang       2019-01-26  1702  	case BPF_JMP32 | BPF_JLE=
 | BPF_K:
b85062ac0df33a Jiong Wang       2019-01-26  1703  	case BPF_JMP32 | BPF_JSL=
T | BPF_K:
b85062ac0df33a Jiong Wang       2019-01-26  1704  	case BPF_JMP32 | BPF_JSL=
E | BPF_K:
39c13c204bb115 Shubham Bansal   2017-08-22  1705  		if (off =3D=3D 0)
39c13c204bb115 Shubham Bansal   2017-08-22  1706  			break;
39c13c204bb115 Shubham Bansal   2017-08-22 @1707  		rm =3D tmp2[0];
39c13c204bb115 Shubham Bansal   2017-08-22  1708  		rn =3D tmp2[1];
39c13c204bb115 Shubham Bansal   2017-08-22  1709  		/* Sign-extend immediat=
e value */
f9ff5018c13b49 Russell King     2018-07-12  1710  		emit_a32_mov_se_i64(tru=
e, tmp2, imm, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1711  go_jmp:
39c13c204bb115 Shubham Bansal   2017-08-22  1712  		/* Setup destination re=
gister */
a6eccac507e5e4 Russell King     2018-07-11  1713  		rd =3D arm_bpf_get_reg6=
4(dst, tmp, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1714  =

39c13c204bb115 Shubham Bansal   2017-08-22  1715  		/* Check for the condit=
ion */
b85062ac0df33a Jiong Wang       2019-01-26  1716  		emit_ar_r(rd[0], rd[1],=
 rm, rn, ctx, BPF_OP(code),
b85062ac0df33a Jiong Wang       2019-01-26  1717  			  BPF_CLASS(code) =3D=
=3D BPF_JMP);
39c13c204bb115 Shubham Bansal   2017-08-22  1718  =

39c13c204bb115 Shubham Bansal   2017-08-22  1719  		/* Setup JUMP instructi=
on */
39c13c204bb115 Shubham Bansal   2017-08-22  1720  		jmp_offset =3D bpf2a32_=
offset(i+off, i, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1721  		switch (BPF_OP(code)) {
39c13c204bb115 Shubham Bansal   2017-08-22  1722  		case BPF_JNE:
39c13c204bb115 Shubham Bansal   2017-08-22  1723  		case BPF_JSET:
39c13c204bb115 Shubham Bansal   2017-08-22  1724  			_emit(ARM_COND_NE, ARM=
_B(jmp_offset), ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1725  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1726  		case BPF_JEQ:
39c13c204bb115 Shubham Bansal   2017-08-22  1727  			_emit(ARM_COND_EQ, ARM=
_B(jmp_offset), ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1728  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1729  		case BPF_JGT:
39c13c204bb115 Shubham Bansal   2017-08-22  1730  			_emit(ARM_COND_HI, ARM=
_B(jmp_offset), ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1731  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1732  		case BPF_JGE:
39c13c204bb115 Shubham Bansal   2017-08-22  1733  			_emit(ARM_COND_CS, ARM=
_B(jmp_offset), ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1734  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1735  		case BPF_JSGT:
39c13c204bb115 Shubham Bansal   2017-08-22  1736  			_emit(ARM_COND_LT, ARM=
_B(jmp_offset), ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1737  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1738  		case BPF_JSGE:
39c13c204bb115 Shubham Bansal   2017-08-22  1739  			_emit(ARM_COND_GE, ARM=
_B(jmp_offset), ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1740  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1741  		case BPF_JLE:
39c13c204bb115 Shubham Bansal   2017-08-22  1742  			_emit(ARM_COND_LS, ARM=
_B(jmp_offset), ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1743  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1744  		case BPF_JLT:
39c13c204bb115 Shubham Bansal   2017-08-22  1745  			_emit(ARM_COND_CC, ARM=
_B(jmp_offset), ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1746  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1747  		case BPF_JSLT:
39c13c204bb115 Shubham Bansal   2017-08-22  1748  			_emit(ARM_COND_LT, ARM=
_B(jmp_offset), ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1749  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1750  		case BPF_JSLE:
39c13c204bb115 Shubham Bansal   2017-08-22  1751  			_emit(ARM_COND_GE, ARM=
_B(jmp_offset), ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1752  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1753  		}
39c13c204bb115 Shubham Bansal   2017-08-22  1754  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1755  	/* JMP OFF */
39c13c204bb115 Shubham Bansal   2017-08-22  1756  	case BPF_JMP | BPF_JA:
39c13c204bb115 Shubham Bansal   2017-08-22  1757  	{
39c13c204bb115 Shubham Bansal   2017-08-22  1758  		if (off =3D=3D 0)
39c13c204bb115 Shubham Bansal   2017-08-22  1759  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1760  		jmp_offset =3D bpf2a32_=
offset(i+off, i, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1761  		check_imm24(jmp_offset);
39c13c204bb115 Shubham Bansal   2017-08-22  1762  		emit(ARM_B(jmp_offset),=
 ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1763  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1764  	}
39c13c204bb115 Shubham Bansal   2017-08-22  1765  	/* tail call */
39c13c204bb115 Shubham Bansal   2017-08-22  1766  	case BPF_JMP | BPF_TAIL_=
CALL:
39c13c204bb115 Shubham Bansal   2017-08-22  1767  		if (emit_bpf_tail_call(=
ctx))
39c13c204bb115 Shubham Bansal   2017-08-22  1768  			return -EFAULT;
39c13c204bb115 Shubham Bansal   2017-08-22  1769  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1770  	/* function call */
39c13c204bb115 Shubham Bansal   2017-08-22  1771  	case BPF_JMP | BPF_CALL:
39c13c204bb115 Shubham Bansal   2017-08-22  1772  	{
1c35ba122d4a4e Russell King     2018-07-11  1773  		const s8 *r0 =3D bpf2a3=
2[BPF_REG_0];
1c35ba122d4a4e Russell King     2018-07-11  1774  		const s8 *r1 =3D bpf2a3=
2[BPF_REG_1];
1c35ba122d4a4e Russell King     2018-07-11  1775  		const s8 *r2 =3D bpf2a3=
2[BPF_REG_2];
1c35ba122d4a4e Russell King     2018-07-11  1776  		const s8 *r3 =3D bpf2a3=
2[BPF_REG_3];
1c35ba122d4a4e Russell King     2018-07-11  1777  		const s8 *r4 =3D bpf2a3=
2[BPF_REG_4];
1c35ba122d4a4e Russell King     2018-07-11  1778  		const s8 *r5 =3D bpf2a3=
2[BPF_REG_5];
39c13c204bb115 Shubham Bansal   2017-08-22  1779  		const u32 func =3D (u32=
)__bpf_call_base + (u32)imm;
39c13c204bb115 Shubham Bansal   2017-08-22  1780  =

47b9c3bf416d80 Russell King     2018-07-11  1781  		emit_a32_mov_r64(true, =
r0, r1, ctx);
47b9c3bf416d80 Russell King     2018-07-11  1782  		emit_a32_mov_r64(true, =
r1, r2, ctx);
96cced4e774a27 Russell King     2018-07-11  1783  		emit_push_r64(r5, ctx);
96cced4e774a27 Russell King     2018-07-11  1784  		emit_push_r64(r4, ctx);
96cced4e774a27 Russell King     2018-07-11  1785  		emit_push_r64(r3, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1786  =

47b9c3bf416d80 Russell King     2018-07-11  1787  		emit_a32_mov_i(tmp[1], =
func, ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1788  		emit_blx_r(tmp[1], ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1789  =

39c13c204bb115 Shubham Bansal   2017-08-22  1790  		emit(ARM_ADD_I(ARM_SP, =
ARM_SP, imm8m(24)), ctx); // callee clean
39c13c204bb115 Shubham Bansal   2017-08-22  1791  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1792  	}
39c13c204bb115 Shubham Bansal   2017-08-22  1793  	/* function return */
39c13c204bb115 Shubham Bansal   2017-08-22  1794  	case BPF_JMP | BPF_EXIT:
39c13c204bb115 Shubham Bansal   2017-08-22  1795  		/* Optimization: when l=
ast instruction is EXIT
39c13c204bb115 Shubham Bansal   2017-08-22  1796  		 * simply fallthrough t=
o epilogue.
39c13c204bb115 Shubham Bansal   2017-08-22  1797  		 */
39c13c204bb115 Shubham Bansal   2017-08-22  1798  		if (i =3D=3D ctx->prog-=
>len - 1)
39c13c204bb115 Shubham Bansal   2017-08-22  1799  			break;
39c13c204bb115 Shubham Bansal   2017-08-22  1800  		jmp_offset =3D epilogue=
_offset(ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1801  		check_imm24(jmp_offset);
39c13c204bb115 Shubham Bansal   2017-08-22  1802  		emit(ARM_B(jmp_offset),=
 ctx);
39c13c204bb115 Shubham Bansal   2017-08-22  1803  		break;
39c13c204bb115 Shubham Bansal   2017-08-22  1804  notyet:
39c13c204bb115 Shubham Bansal   2017-08-22  1805  		pr_info_once("*** NOT Y=
ET: opcode %02x ***\n", code);
39c13c204bb115 Shubham Bansal   2017-08-22  1806  		return -EFAULT;
39c13c204bb115 Shubham Bansal   2017-08-22  1807  	default:
39c13c204bb115 Shubham Bansal   2017-08-22  1808  		pr_err_once("unknown op=
code %02x\n", code);
39c13c204bb115 Shubham Bansal   2017-08-22  1809  		return -EINVAL;
ddecdfcea0ae89 Mircea Gherzan   2012-03-16  1810  	}
0b59d8806a31bb Nicolas Schichan 2015-05-07  1811  =

0b59d8806a31bb Nicolas Schichan 2015-05-07  1812  	if (ctx->flags & FLAG_IM=
M_OVERFLOW)
0b59d8806a31bb Nicolas Schichan 2015-05-07  1813  		/*
0b59d8806a31bb Nicolas Schichan 2015-05-07  1814  		 * this instruction gen=
erated an overflow when
0b59d8806a31bb Nicolas Schichan 2015-05-07  1815  		 * trying to access the=
 literal pool, so
0b59d8806a31bb Nicolas Schichan 2015-05-07  1816  		 * delegate this filter=
 to the kernel interpreter.
0b59d8806a31bb Nicolas Schichan 2015-05-07  1817  		 */
0b59d8806a31bb Nicolas Schichan 2015-05-07  1818  		return -1;
39c13c204bb115 Shubham Bansal   2017-08-22  1819  	return 0;
39c13c204bb115 Shubham Bansal   2017-08-22  1820  }
39c13c204bb115 Shubham Bansal   2017-08-22  1821  =


:::::: The code at line 1707 was first introduced by commit
:::::: 39c13c204bb1150d401e27d41a9d8b332be47c49 arm: eBPF JIT compiler

:::::: TO: Shubham Bansal <illusionist.neo@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1460158324533003083==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1460158324533003083==--

