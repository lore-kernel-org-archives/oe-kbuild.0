Content-Type: multipart/mixed; boundary="===============4569192330671562445=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/xilinx/ll_temac_main.c:1257:10: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support leng...
Date: Thu, 31 Mar 2022 21:41:05 +0800
Message-ID: <202203312148.3VraxWAr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4569192330671562445==
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
head:   787af64d05cd528aac9ad16752d11bb1c6061bb9
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   3 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220330 (https://download.01.org/0day-ci/archi=
ve/20220331/202203312148.3VraxWAr-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   lib/memcpy_kunit.c:270:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset_startat(&dest, 0x79, four);
           ^
   include/linux/string.h:290:2: note: expanded from macro 'memset_startat'
           memset(__ptr + offsetof(typeof(*(obj)), member), __val,         \
           ^~~~~~
   lib/memcpy_kunit.c:270:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset_startat(&dest, 0x79, four);
           ^
   include/linux/string.h:290:2: note: expanded from macro 'memset_startat'
           memset(__ptr + offsetof(typeof(*(obj)), member), __val,         \
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/char/xillybus/xillybus_class.c:66:3: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(unit->name, UNITNAMELEN, "%s", prefix);
                   ^~~~~~~~
   drivers/char/xillybus/xillybus_class.c:66:3: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(unit->name, UNITNAMELEN, "%s", prefix);
                   ^~~~~~~~
   drivers/char/xillybus/xillybus_class.c:69:3: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(unit->name, UNITNAMELEN, "%s_%02d",
                   ^~~~~~~~
   drivers/char/xillybus/xillybus_class.c:69:3: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(unit->name, UNITNAMELEN, "%s_%02d",
                   ^~~~~~~~
   drivers/char/xillybus/xillybus_class.c:118:3: warning: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(devname, sizeof(devname), "%s_%s",
                   ^~~~~~~~
   drivers/char/xillybus/xillybus_class.c:118:3: note: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(devname, sizeof(devname), "%s_%s",
                   ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   79 warnings generated.
   include/linux/etherdevice.h:128:2: warning: Assigned value is garbage or=
 undefined [clang-analyzer-core.uninitialized.Assign]
           u16 a =3D *(const u16 *)addr;
           ^
   net/llc/llc_sap.c:425:2: note: Calling 'llc_pdu_decode_da'
           llc_pdu_decode_da(skb, laddr.mac);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/llc_pdu.h:278:6: note: Assuming the condition is false
           if (skb->protocol =3D=3D htons(ETH_P_802_2))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/llc_pdu.h:278:2: note: Taking false branch
           if (skb->protocol =3D=3D htons(ETH_P_802_2))
           ^
   net/llc/llc_sap.c:425:2: note: Returning from 'llc_pdu_decode_da'
           llc_pdu_decode_da(skb, laddr.mac);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_sap.c:428:6: note: Calling 'is_multicast_ether_addr'
           if (is_multicast_ether_addr(laddr.mac)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/etherdevice.h:128:2: note: Assigned value is garbage or un=
defined
           u16 a =3D *(const u16 *)addr;
           ^       ~~~~~~~~~~~~~~~~~~
   net/llc/llc_sap.c:77:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(addr, 0, sizeof(*addr));
           ^~~~~~
   net/llc/llc_sap.c:77:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(addr, 0, sizeof(*addr));
           ^~~~~~
   net/llc/llc_sap.c:238:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ev->saddr.mac, skb->dev->dev_addr, IFHWADDRLEN);
           ^~~~~~
   net/llc/llc_sap.c:238:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(ev->saddr.mac, skb->dev->dev_addr, IFHWADDRLEN);
           ^~~~~~
   net/llc/llc_sap.c:239:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ev->daddr.mac, dmac, IFHWADDRLEN);
           ^~~~~~
   net/llc/llc_sap.c:239:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(ev->daddr.mac, dmac, IFHWADDRLEN);
           ^~~~~~
   net/llc/llc_sap.c:264:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ev->saddr.mac, skb->dev->dev_addr, IFHWADDRLEN);
           ^~~~~~
   net/llc/llc_sap.c:264:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(ev->saddr.mac, skb->dev->dev_addr, IFHWADDRLEN);
           ^~~~~~
   net/llc/llc_sap.c:265:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ev->daddr.mac, dmac, IFHWADDRLEN);
           ^~~~~~
   net/llc/llc_sap.c:265:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(ev->daddr.mac, dmac, IFHWADDRLEN);
           ^~~~~~
   Suppressed 73 warnings (73 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
>> drivers/net/ethernet/xilinx/ll_temac_main.c:1257:10: warning: Call to fu=
nction 'sprintf' is insecure as it does not provide bounding of the memory =
buffer or security checks introduced in the C11 standard. Replace with anal=
ogous functions that support length arguments or provides boundary checks s=
uch as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depr=
ecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(buf + len, "%.8x%s", lp->dma_in(lp, i),
                          ^~~~~~~
   drivers/net/ethernet/xilinx/ll_temac_main.c:1257:10: note: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11
                   len +=3D sprintf(buf + len, "%.8x%s", lp->dma_in(lp, i),
                          ^~~~~~~
   drivers/net/ethernet/xilinx/ll_temac_main.c:1259:9: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/net/ethernet/xilinx/ll_temac_main.c:1259:9: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           len +=3D sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/net/ethernet/xilinx/ll_temac_main.c:1595:3: warning: Call to fun=
ction 'snprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'snprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(lp->phy_name, sizeof(lp->phy_name),
                   ^~~~~~~~
   drivers/net/ethernet/xilinx/ll_temac_main.c:1595:3: note: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(lp->phy_name, sizeof(lp->phy_name),
                   ^~~~~~~~
   Suppressed 72 warnings (72 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   fs/hpfs/super.c:589:8: warning: Although the value stored to 'bootblock'=
 is used in the enclosing expression, the value is never actually read from=
 'bootblock' [clang-analyzer-deadcode.DeadStores]
           if (!(bootblock =3D hpfs_map_sector(s, 0, &bh0, 0))) goto bail1;
                 ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hpfs/super.c:589:8: note: Although the value stored to 'bootblock' is=
 used in the enclosing expression, the value is never actually read from 'b=
ootblock'
           if (!(bootblock =3D hpfs_map_sector(s, 0, &bh0, 0))) goto bail1;
                 ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   fs/ntfs/aops.c:83:4: warning: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
                           memset(kaddr + bh_offset(bh) + ofs, 0,
                           ^~~~~~
   fs/ntfs/aops.c:83:4: note: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11
                           memset(kaddr + bh_offset(bh) + ofs, 0,
                           ^~~~~~
   fs/ntfs/aops.c:488:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr, (u8*)ctx->attr +
           ^~~~~~
   fs/ntfs/aops.c:488:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(addr, (u8*)ctx->attr +
           ^~~~~~
   fs/ntfs/aops.c:492:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(addr + attr_len, 0, PAGE_SIZE - attr_len);
           ^~~~~~
   fs/ntfs/aops.c:492:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(addr + attr_len, 0, PAGE_SIZE - attr_len);
           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   lib/test_lockup.c:231:32: warning: The right operand of '-' is a garbage=
 value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   s64 cur_wait =3D local_clock() - wait_start;
                                                ^ ~~~~~~~~~~
   lib/test_lockup.c:171:2: note: 'wait_start' declared without an initial =
value
           u64 wait_start;
           ^~~~~~~~~~~~~~
   lib/test_lockup.c:173:6: note: Assuming 'measure_lock_wait' is false
           if (measure_lock_wait)
               ^~~~~~~~~~~~~~~~~
   lib/test_lockup.c:173:2: note: Taking false branch
           if (measure_lock_wait)
           ^
   lib/test_lockup.c:176:6: note: Assuming 'lock_mutex_ptr' is not equal to=
 0
           if (lock_mutex_ptr && master) {
               ^~~~~~~~~~~~~~
   lib/test_lockup.c:176:6: note: Left side of '&&' is true
   lib/test_lockup.c:176:24: note: Assuming 'master' is true
           if (lock_mutex_ptr && master) {
                                 ^~~~~~
   lib/test_lockup.c:176:2: note: Taking true branch
           if (lock_mutex_ptr && master) {
           ^
   lib/test_lockup.c:177:7: note: Assuming 'verbose' is false
                   if (verbose)
                       ^~~~~~~
   lib/test_lockup.c:177:3: note: Taking false branch
                   if (verbose)
                   ^
   lib/test_lockup.c:182:6: note: Assuming 'lock_rwsem_ptr' is 0
           if (lock_rwsem_ptr && master) {
               ^~~~~~~~~~~~~~
   lib/test_lockup.c:182:21: note: Left side of '&&' is false
           if (lock_rwsem_ptr && master) {
                              ^
   lib/test_lockup.c:192:6: note: Assuming 'lock_mmap_sem' is false
           if (lock_mmap_sem && master) {
               ^~~~~~~~~~~~~
   lib/test_lockup.c:192:20: note: Left side of '&&' is false
           if (lock_mmap_sem && master) {
                             ^
   lib/test_lockup.c:201:6: note: Assuming 'test_disable_irq' is false
           if (test_disable_irq)
               ^~~~~~~~~~~~~~~~
   lib/test_lockup.c:201:2: note: Taking false branch
           if (test_disable_irq)
           ^
   lib/test_lockup.c:204:6: note: Assuming 'disable_softirq' is false
           if (disable_softirq)
               ^~~~~~~~~~~~~~~
   lib/test_lockup.c:204:2: note: Taking false branch
--
                                               ^
   drivers/clk/clk-divider.c:378:14: note: Taking true branch
           req->rate =3D DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
                       ^
   include/linux/math.h:42:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^
   include/linux/math.h:39:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^
   include/asm-generic/div64.h:234:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   drivers/clk/clk-divider.c:378:14: note: Division by zero
           req->rate =3D DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
                       ^
   include/linux/math.h:42:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:39:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^~~~~~~~~~~~~~~
   include/asm-generic/div64.h:235:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                           ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/log2.h:67:13: warning: The result of the left shift is und=
efined due to shifting by '4294967295', which is greater or equal to the wi=
dth of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
           return 1UL << (fls_long(n) - 1);
                      ^
   drivers/clk/clk-divider.c:240:7: note: Left side of '&&' is false
           up =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
                ^
   include/linux/math.h:42:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^
   include/linux/math.h:39:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^
   include/asm-generic/div64.h:223:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/clk/clk-divider.c:240:7: note: Left side of '&&' is false
           up =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
                ^
   include/linux/math.h:42:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^
   include/linux/math.h:39:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^
   include/asm-generic/div64.h:227:42: note: expanded from macro 'do_div'
           } else if (__builtin_constant_p(__base) &&      \
                                                   ^
   drivers/clk/clk-divider.c:240:7: note: Assuming the condition is true
           up =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
                ^
   include/linux/math.h:42:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:39:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:20: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                      ~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   drivers/clk/clk-divider.c:240:7: note: Taking true branch
           up =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
                ^
   include/linux/math.h:42:2: note: expanded from macro 'DIV_ROUND_UP_ULL'
           DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
           ^
   include/linux/math.h:39:37: note: expanded from macro 'DIV_ROUND_DOWN_UL=
L'
           ({ unsigned long long _tmp =3D (ll); do_div(_tmp, d); _tmp; })
                                              ^
   include/asm-generic/div64.h:234:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   drivers/clk/clk-divider.c:243:6: note: Assuming the condition is true
           if (flags & CLK_DIVIDER_POWER_OF_TWO) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-divider.c:243:2: note: Taking true branch
           if (flags & CLK_DIVIDER_POWER_OF_TWO) {
           ^
   drivers/clk/clk-divider.c:245:10: note: Calling '__rounddown_pow_of_two'
                   down =3D __rounddown_pow_of_two(down);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: note: The result of the left shift is undefi=
ned due to shifting by '4294967295', which is greater or equal to the width=
 of type 'unsigned long'
           return 1UL << (fls_long(n) - 1);
                      ^  ~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   76 warnings generated.
   drivers/block/nbd.c:226:9: warning: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", nbd->pid);
                  ^~~~~~~
   drivers/block/nbd.c:226:9: note: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", nbd->pid);
                  ^~~~~~~
>> drivers/block/nbd.c:240:9: warning: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           return sprintf(buf, "%s\n", nbd->backend ?: "");
                  ^~~~~~~
   drivers/block/nbd.c:240:9: note: Call to function 'sprintf' is insecure =
as it does not provide bounding of the memory buffer or security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           return sprintf(buf, "%s\n", nbd->backend ?: "");
                  ^~~~~~~
   drivers/block/nbd.c:458:28: warning: Array access (via field 'socks') re=
sults in a null pointer dereference [clang-analyzer-core.NullDereference]
                   struct nbd_sock *nsock =3D config->socks[cmd->index];
                                            ^       ~~~~~
   drivers/block/nbd.c:404:6: note: Assuming the condition is false
           if (!mutex_trylock(&cmd->lock))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/nbd.c:404:2: note: Taking false branch
           if (!mutex_trylock(&cmd->lock))
           ^
   drivers/block/nbd.c:407:7: note: Calling 'arch___test_and_clear_bit'
           if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
                ^
   include/asm-generic/bitops/non-atomic.h:95:30: note: expanded from macro=
 '__test_and_clear_bit'
   #define __test_and_clear_bit arch___test_and_clear_bit
                                ^
   include/asm-generic/bitops/non-atomic.h:93:9: note: Assuming the conditi=
on is true
           return (old & mask) !=3D 0;
                  ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:93:2: note: Returning the value =
1, which participates in a condition later
           return (old & mask) !=3D 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/nbd.c:407:7: note: Returning from 'arch___test_and_clear_b=
it'
           if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
                ^
   include/asm-generic/bitops/non-atomic.h:95:30: note: expanded from macro=
 '__test_and_clear_bit'
   #define __test_and_clear_bit arch___test_and_clear_bit
                                ^
   drivers/block/nbd.c:407:2: note: Taking false branch
           if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
           ^
   drivers/block/nbd.c:412:7: note: Calling 'refcount_inc_not_zero'
           if (!refcount_inc_not_zero(&nbd->config_refs)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:245:9: note: Calling '__refcount_inc_not_zero'
           return __refcount_inc_not_zero(r, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:227:9: note: Value assigned to field 'timeout',=
 which participates in a condition later
           return __refcount_add_not_zero(1, r, oldp);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:227:2: note: Returning value, which participate=
s in a condition later
           return __refcount_add_not_zero(1, r, oldp);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:245:9: note: Returning from '__refcount_inc_not=
_zero'
           return __refcount_inc_not_zero(r, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:245:2: note: Returning value, which participate=
s in a condition later
           return __refcount_inc_not_zero(r, NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/nbd.c:412:7: note: Returning from 'refcount_inc_not_zero'
           if (!refcount_inc_not_zero(&nbd->config_refs)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/nbd.c:412:6: note: Assuming the condition is false
           if (!refcount_inc_not_zero(&nbd->config_refs)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/nbd.c:412:2: note: Taking false branch
           if (!refcount_inc_not_zero(&nbd->config_refs)) {
           ^
   drivers/block/nbd.c:419:6: note: Assuming field 'num_connections' is > 1
           if (config->num_connections > 1 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/nbd.c:419:34: note: Left side of '||' is true
           if (config->num_connections > 1 ||
                                           ^
   drivers/block/nbd.c:421:3: note: Assuming the condition is false
                   dev_err_ratelimited(nbd_to_dev(nbd),
                   ^
   include/linux/dev_printk.h:218:2: note: expanded from macro 'dev_err_rat=
elimited'
           dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:207:6: note: expanded from macro 'dev_level_r=
atelimited'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/nbd.c:421:3: note: Taking false branch
                   dev_err_ratelimited(nbd_to_dev(nbd),
                   ^
   include/linux/dev_printk.h:218:2: note: expanded from macro 'dev_err_rat=
elimited'
           dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:207:2: note: expanded from macro 'dev_level_r=
atelimited'
           if (__ratelimit(&_rs))                                          \
           ^
   drivers/block/nbd.c:421:3: note: Loop condition is false.  Exiting loop
                   dev_err_ratelimited(nbd_to_dev(nbd),
                   ^
   include/linux/dev_printk.h:218:2: note: expanded from macro 'dev_err_rat=
elimited'
           dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:202:59: note: expanded from macro 'dev_level_=
ratelimited'
   #define dev_level_ratelimited(dev_level, dev, fmt, ...)                 \
                                                                           ^
   drivers/block/nbd.c:431:7: note: Assuming field 'socks' is null
                   if (config->socks) {
--
               ^~~~~~~~
   drivers/scsi/libsas/sas_expander.c:1790:2: note: Taking false branch
           if (!rg_resp) {
           ^
   drivers/scsi/libsas/sas_expander.c:1797:8: note: Calling 'smp_execute_ta=
sk'
           res =3D smp_execute_task(dev, rg_req, RG_REQ_SIZE, rg_resp,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_expander.c:151:2: note: Returning without writin=
g to 'resp->result'
           return smp_execute_task_sg(dev, &req_sg, &resp_sg);
           ^
   drivers/scsi/libsas/sas_expander.c:151:2: note: Returning value, which p=
articipates in a condition later
           return smp_execute_task_sg(dev, &req_sg, &resp_sg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_expander.c:1797:8: note: Returning from 'smp_exe=
cute_task'
           res =3D smp_execute_task(dev, rg_req, RG_REQ_SIZE, rg_resp,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_expander.c:1799:6: note: Assuming 'res' is 0
           if (res)
               ^~~
   drivers/scsi/libsas/sas_expander.c:1799:2: note: Taking false branch
           if (res)
           ^
   drivers/scsi/libsas/sas_expander.c:1801:22: note: The left operand of '!=
=3D' is a garbage value
           if (rg_resp->result !=3D SMP_RESP_FUNC_ACC) {
               ~~~~~~~~~~~~~~~ ^
   drivers/scsi/libsas/sas_expander.c:1903:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(phy->attached_sas_addr, 0, SAS_ADDR_SIZE);
           ^~~~~~
   drivers/scsi/libsas/sas_expander.c:1903:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(phy->attached_sas_addr, 0, SAS_ADDR_SIZE);
           ^~~~~~
   drivers/scsi/libsas/sas_expander.c:2009:3: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(msg, ", part of a wide port with phy%02d", sibli=
ng);
                   ^~~~~~~
   drivers/scsi/libsas/sas_expander.c:2009:3: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(msg, ", part of a wide port with phy%02d", sibli=
ng);
                   ^~~~~~~
   drivers/scsi/libsas/sas_expander.c:2014:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sas_addr, 0, SAS_ADDR_SIZE);
           ^~~~~~
   drivers/scsi/libsas/sas_expander.c:2014:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(sas_addr, 0, SAS_ADDR_SIZE);
           ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   drivers/net/ethernet/samsung/sxgbe/sxgbe_mdio.c:166:2: warning: Call to =
function 'snprintf' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'snprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(mdio_bus->id, MII_BUS_ID_SIZE, "%s-%x",
           ^~~~~~~~
   drivers/net/ethernet/samsung/sxgbe/sxgbe_mdio.c:166:2: note: Call to fun=
ction 'snprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(mdio_bus->id, MII_BUS_ID_SIZE, "%s-%x",
           ^~~~~~~~
   drivers/net/ethernet/samsung/sxgbe/sxgbe_mdio.c:210:5: warning: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   sprintf(irq_num, "%d", phy->irq);
                                   ^~~~~~~
   drivers/net/ethernet/samsung/sxgbe/sxgbe_mdio.c:210:5: note: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11
                                   sprintf(irq_num, "%d", phy->irq);
                                   ^~~~~~~
   Suppressed 62 warnings (62 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   drivers/net/ethernet/samsung/sxgbe/sxgbe_ethtool.c:202:4: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(p, sxgbe_gstrings_stats[i].stat_string,
                           ^~~~~~
   drivers/net/ethernet/samsung/sxgbe/sxgbe_ethtool.c:202:4: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(p, sxgbe_gstrings_stats[i].stat_string,
                           ^~~~~~
   drivers/net/ethernet/samsung/sxgbe/sxgbe_ethtool.c:451:2: warning: Call =
to function 'memset' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memset_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(reg_space, 0x0, REG_SPACE_SIZE);
           ^~~~~~
   drivers/net/ethernet/samsung/sxgbe/sxgbe_ethtool.c:451:2: note: Call to =
function 'memset' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(reg_space, 0x0, REG_SPACE_SIZE);
           ^~~~~~
   Suppressed 62 warnings (62 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   107 warnings generated.
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:557:3: warning: Call t=
o function 'memset' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memset_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&shhwtstamp, 0, sizeof(struct skb_shared_hwtstamp=
s));
                   ^~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:557:3: note: Call to f=
unction 'memset' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(&shhwtstamp, 0, sizeof(struct skb_shared_hwtstamp=
s));
                   ^~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:596:3: warning: Call t=
o function 'memset' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memset_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(shhwtstamp, 0, sizeof(struct skb_shared_hwtstamps=
));
                   ^~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:596:3: note: Call to f=
unction 'memset' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(shhwtstamp, 0, sizeof(struct skb_shared_hwtstamps=
));
                   ^~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:794:2: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&priv->tstamp_config, &config, sizeof(config));
           ^~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:794:2: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&priv->tstamp_config, &config, sizeof(config));
           ^~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2826:3: warning: Call =
to function 'memset' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memset_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&priv->mmc, 0, sizeof(struct stmmac_counters));
                   ^~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2826:3: note: Call to =
function 'memset' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(&priv->mmc, 0, sizeof(struct stmmac_counters));
                   ^~~~~~
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3227:2: warning: Call =
to function 'sprintf' is insecure as it does not provide bounding of the me=
mory buffer or security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
           sprintf(name, "%s-fpe", priv->dev->name);
           ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3227:2: note: Call to =
function 'sprintf' is insecure as it does not provide bounding of the memor=
y buffer or security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'sprintf_s' in case of C11
           sprintf(name, "%s-fpe", priv->dev->name);
           ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3461:2: warning: Call =
to function 'sprintf' is insecure as it does not provide bounding of the me=
mory buffer or security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
           sprintf(int_name, "%s:%s", dev->name, "mac");
           ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3461:2: note: Call to =
function 'sprintf' is insecure as it does not provide bounding of the memor=
y buffer or security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'sprintf_s' in case of C11
           sprintf(int_name, "%s:%s", dev->name, "mac");
           ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3477:3: warning: Call =
to function 'sprintf' is insecure as it does not provide bounding of the me=
mory buffer or security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
                   sprintf(int_name, "%s:%s", dev->name, "wol");
                   ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3477:3: note: Call to =
function 'sprintf' is insecure as it does not provide bounding of the memor=
y buffer or security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'sprintf_s' in case of C11
                   sprintf(int_name, "%s:%s", dev->name, "wol");
                   ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3495:3: warning: Call =
to function 'sprintf' is insecure as it does not provide bounding of the me=
mory buffer or security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
                   sprintf(int_name, "%s:%s", dev->name, "lpi");
                   ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3495:3: note: Call to =
function 'sprintf' is insecure as it does not provide bounding of the memor=
y buffer or security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'sprintf_s' in case of C11
                   sprintf(int_name, "%s:%s", dev->name, "lpi");
                   ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3513:3: warning: Call =
to function 'sprintf' is insecure as it does not provide bounding of the me=
mory buffer or security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
                   sprintf(int_name, "%s:%s", dev->name, "safety-ce");
                   ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3513:3: note: Call to =
function 'sprintf' is insecure as it does not provide bounding of the memor=
y buffer or security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'sprintf_s' in case of C11
                   sprintf(int_name, "%s:%s", dev->name, "safety-ce");
                   ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3531:3: warning: Call =
to function 'sprintf' is insecure as it does not provide bounding of the me=
mory buffer or security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
                   sprintf(int_name, "%s:%s", dev->name, "safety-ue");
                   ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3531:3: note: Call to =
function 'sprintf' is insecure as it does not provide bounding of the memor=
y buffer or security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'sprintf_s' in case of C11
                   sprintf(int_name, "%s:%s", dev->name, "safety-ue");
                   ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3552:3: warning: Call =
to function 'sprintf' is insecure as it does not provide bounding of the me=
mory buffer or security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
                   sprintf(int_name, "%s:%s-%d", dev->name, "rx", i);
                   ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3552:3: note: Call to =
function 'sprintf' is insecure as it does not provide bounding of the memor=
y buffer or security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'sprintf_s' in case of C11
                   sprintf(int_name, "%s:%s-%d", dev->name, "rx", i);
                   ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3577:3: warning: Call =
to function 'sprintf' is insecure as it does not provide bounding of the me=
mory buffer or security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
                   sprintf(int_name, "%s:%s-%d", dev->name, "tx", i);
                   ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3577:3: note: Call to =
function 'sprintf' is insecure as it does not provide bounding of the memor=
y buffer or security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'sprintf_s' in case of C11
                   sprintf(int_name, "%s:%s-%d", dev->name, "tx", i);
                   ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3703:2: warning: Call =
to function 'memset' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memset_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&priv->xstats, 0, sizeof(struct stmmac_extra_stats));
           ^~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3703:2: note: Call to =
function 'memset' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&priv->xstats, 0, sizeof(struct stmmac_extra_stats));
           ^~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4466:3: warning: Call =
to function 'memmove' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'memmove_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
                   ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4466:3: note: Call to =
function 'memmove' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memmove_s' in case of C=
11
                   memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
                   ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4787:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(__skb_put(skb, datasize), xdp->data, datasize);
           ^~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4787:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(__skb_put(skb, datasize), xdp->data, datasize);
           ^~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4935:3: warning: Value=
 stored to 'buf1_len' is never read [clang-analyzer-deadcode.DeadStores]
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4935:3: note: Value st=
ored to 'buf1_len' is never read
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5133:3: warning: Value=
 stored to 'buf1_len' is never read [clang-analyzer-deadcode.DeadStores]
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5133:3: note: Value st=
ored to 'buf1_len' is never read
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5134:3: warning: Value=
 stored to 'buf2_len' is never read [clang-analyzer-deadcode.DeadStores]
                   buf2_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5134:3: note: Value st=
ored to 'buf2_len' is never read
                   buf2_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5648:4: warning: Value=
 stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
                           status =3D stmmac_host_mtl_irq_status(priv, priv=
->hw,
                           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5648:4: note: Value st=
ored to 'status' is never read
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5703:14: warning: Acce=
ss to field 'dev' results in a dereference of a null pointer (loaded from v=
ariable 'priv') [clang-analyzer-core.NullDereference]
                   netdev_err(priv->dev, "%s: invalid dev pointer\n", __fun=
c__);
                              ^~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5699:2: note: 'dev' in=
itialized here
           struct net_device *dev =3D (struct net_device *)dev_id;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5700:41: note: Passing=
 'dev' via 1st parameter 'dev'
           struct stmmac_priv *priv =3D netdev_priv(dev);
                                                  ^~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5700:2: note: 'priv' i=
nitialized here
           struct stmmac_priv *priv =3D netdev_priv(dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5702:15: note: Assumin=
g 'dev' is null

vim +1257 drivers/net/ethernet/xilinx/ll_temac_main.c

92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1245  =

92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1246  /=
* ---------------------------------------------------------------------
92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1247   =
* SYSFS device attributes
92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1248   =
*/
92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1249  s=
tatic ssize_t temac_show_llink_regs(struct device *dev,
92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1250  	=
			     struct device_attribute *attr, char *buf)
92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1251  {
92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1252  	=
struct net_device *ndev =3D dev_get_drvdata(dev);
92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1253  	=
struct temac_local *lp =3D netdev_priv(ndev);
92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1254  	=
int i, len =3D 0;
92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1255  =

92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1256  	=
for (i =3D 0; i < 0x11; i++)
e44171f115de3d drivers/net/ll_temac_main.c John Linn    2010-04-08 @1257  	=
	len +=3D sprintf(buf + len, "%.8x%s", lp->dma_in(lp, i),
92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1258  	=
		       (i % 8) =3D=3D 7 ? "\n" : " ");
92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1259  	=
len +=3D sprintf(buf + len, "\n");
92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1260  =

92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1261  	=
return len;
92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1262  }
92744989533cbe drivers/net/ll_temac_main.c Grant Likely 2009-04-25  1263  =


:::::: The code at line 1257 was first introduced by commit
:::::: e44171f115de3dedf34064646206deb91549865f Add non-Virtex5 support for=
 LL TEMAC driver

:::::: TO: John Linn <john.linn@xilinx.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4569192330671562445==--

