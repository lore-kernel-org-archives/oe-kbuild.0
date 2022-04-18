Content-Type: multipart/mixed; boundary="===============2591214866326803878=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/platform/ts5500/ts5500.c:155:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments...
Date: Mon, 18 Apr 2022 22:28:30 +0800
Message-ID: <202204182230.yPCn2NvF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2591214866326803878==
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
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   5 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-c001-20220418 (https://download.01.org/0day-ci/arch=
ive/20220418/202204182230.yPCn2NvF-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ef9460=
9d6ebe981767788e6877b0b3b731d425af)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~
   crypto/ccm.c:500:6: warning: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/ccm.c:500:6: note: Call to function 'snprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/ccm.c:541:6: warning: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(ctr_name, CRYPTO_MAX_ALG_NAME, "ctr(%s)",
               ^~~~~~~~
   crypto/ccm.c:541:6: note: Call to function 'snprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'snprintf_s' in case of C11
           if (snprintf(ctr_name, CRYPTO_MAX_ALG_NAME, "ctr(%s)",
               ^~~~~~~~
   crypto/ccm.c:545:6: warning: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(mac_name, CRYPTO_MAX_ALG_NAME, "cbcmac(%s)",
               ^~~~~~~~
   crypto/ccm.c:545:6: note: Call to function 'snprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'snprintf_s' in case of C11
           if (snprintf(mac_name, CRYPTO_MAX_ALG_NAME, "cbcmac(%s)",
               ^~~~~~~~
   crypto/ccm.c:579:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->nonce, key + keylen, 3);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   crypto/ccm.c:579:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(ctx->nonce, key + keylen, 3);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   crypto/ccm.c:618:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iv + 1, ctx->nonce, 3);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   crypto/ccm.c:618:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(iv + 1, ctx->nonce, 3);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   crypto/ccm.c:619:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iv + 4, req->iv, 8);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   crypto/ccm.c:619:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(iv + 4, req->iv, 8);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   crypto/ccm.c:742:6: warning: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/ccm.c:742:6: note: Call to function 'snprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/ccm.c:745:6: warning: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
               snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/ccm.c:745:6: note: Call to function 'snprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'snprintf_s' in case of C11
               snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/ccm.c:793:2: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memset(dg, 0, bs);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   crypto/ccm.c:793:2: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
           memset(dg, 0, bs);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   crypto/ccm.c:837:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(out, dg, bs);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   crypto/ccm.c:837:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(out, dg, bs);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
>> arch/x86/platform/ts5500/ts5500.c:155:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           return sprintf(buf, "%s\n", sbc->name);
                  ^~~~~~~
   arch/x86/platform/ts5500/ts5500.c:155:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           return sprintf(buf, "%s\n", sbc->name);
                  ^~~~~~~
   arch/x86/platform/ts5500/ts5500.c:164:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%.2x\n", sbc->id);
                  ^~~~~~~
   arch/x86/platform/ts5500/ts5500.c:164:9: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%.2x\n", sbc->id);
                  ^~~~~~~
   arch/x86/platform/ts5500/ts5500.c:173:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%.2x\n", sbc->jumpers >> 1);
                  ^~~~~~~
   arch/x86/platform/ts5500/ts5500.c:173:9: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%.2x\n", sbc->jumpers >> 1);
                  ^~~~~~~
   arch/x86/platform/ts5500/ts5500.c:187:1: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   TS5500_ATTR_BOOL(sram);
   ^
   arch/x86/platform/ts5500/ts5500.c:183:10: note: expanded from macro 'TS5=
500_ATTR_BOOL'
                   return sprintf(buf, "%d\n", sbc->_field);               \
                          ^~~~~~~
   arch/x86/platform/ts5500/ts5500.c:187:1: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
   TS5500_ATTR_BOOL(sram);
   ^
   arch/x86/platform/ts5500/ts5500.c:183:10: note: expanded from macro 'TS5=
500_ATTR_BOOL'
                   return sprintf(buf, "%d\n", sbc->_field);               \
                          ^~~~~~~
   arch/x86/platform/ts5500/ts5500.c:188:1: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   TS5500_ATTR_BOOL(rs485);
   ^
   arch/x86/platform/ts5500/ts5500.c:183:10: note: expanded from macro 'TS5=
500_ATTR_BOOL'
                   return sprintf(buf, "%d\n", sbc->_field);               \
                          ^~~~~~~
   arch/x86/platform/ts5500/ts5500.c:188:1: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
   TS5500_ATTR_BOOL(rs485);
   ^
   arch/x86/platform/ts5500/ts5500.c:183:10: note: expanded from macro 'TS5=
500_ATTR_BOOL'
                   return sprintf(buf, "%d\n", sbc->_field);               \
                          ^~~~~~~
   arch/x86/platform/ts5500/ts5500.c:189:1: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   TS5500_ATTR_BOOL(adc);
   ^
   arch/x86/platform/ts5500/ts5500.c:183:10: note: expanded from macro 'TS5=
500_ATTR_BOOL'
                   return sprintf(buf, "%d\n", sbc->_field);               \
                          ^~~~~~~
   arch/x86/platform/ts5500/ts5500.c:189:1: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
   TS5500_ATTR_BOOL(adc);
   ^
   arch/x86/platform/ts5500/ts5500.c:183:10: note: expanded from macro 'TS5=
500_ATTR_BOOL'
                   return sprintf(buf, "%d\n", sbc->_field);               \
                          ^~~~~~~
   arch/x86/platform/ts5500/ts5500.c:190:1: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   TS5500_ATTR_BOOL(ereset);
   ^
   arch/x86/platform/ts5500/ts5500.c:183:10: note: expanded from macro 'TS5=
500_ATTR_BOOL'
                   return sprintf(buf, "%d\n", sbc->_field);               \
                          ^~~~~~~
   arch/x86/platform/ts5500/ts5500.c:190:1: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
   TS5500_ATTR_BOOL(ereset);
   ^
   arch/x86/platform/ts5500/ts5500.c:183:10: note: expanded from macro 'TS5=
500_ATTR_BOOL'
                   return sprintf(buf, "%d\n", sbc->_field);               \
                          ^~~~~~~
   arch/x86/platform/ts5500/ts5500.c:191:1: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   TS5500_ATTR_BOOL(itr);
   ^
   arch/x86/platform/ts5500/ts5500.c:183:10: note: expanded from macro 'TS5=
500_ATTR_BOOL'
                   return sprintf(buf, "%d\n", sbc->_field);               \
                          ^~~~~~~
   arch/x86/platform/ts5500/ts5500.c:191:1: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
   TS5500_ATTR_BOOL(itr);
   ^
   arch/x86/platform/ts5500/ts5500.c:183:10: note: expanded from macro 'TS5=
500_ATTR_BOOL'
                   return sprintf(buf, "%d\n", sbc->_field);               \
                          ^~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   78 warnings generated.
   fs/btrfs/struct-funcs.c:160:1: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   DEFINE_BTRFS_SETGET_BITS(8)
   ^
   fs/btrfs/struct-funcs.c:79:2: note: expanded from macro 'DEFINE_BTRFS_SE=
TGET_BITS'
           memcpy(lebytes, token->kaddr + oip, part);                      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/btrfs/struct-funcs.c:160:1: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
   DEFINE_BTRFS_SETGET_BITS(8)
   ^
   fs/btrfs/struct-funcs.c:79:2: note: expanded from macro 'DEFINE_BTRFS_SE=
TGET_BITS'
           memcpy(lebytes, token->kaddr + oip, part);                      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/btrfs/struct-funcs.c:161:1: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   DEFINE_BTRFS_SETGET_BITS(16)
--
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/video/backlight/lv5207lp.c:106:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(&props, 0, sizeof(props));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/video/backlight/max8925_bl.c:151:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&props, 0, sizeof(struct backlight_properties));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/video/backlight/max8925_bl.c:151:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(&props, 0, sizeof(struct backlight_properties));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   arch/x86/kernel/cpu/mce/genpool.c:113:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&node->mce, mce, sizeof(*mce));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/mce/genpool.c:113:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&node->mce, mce, sizeof(*mce));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   arch/x86/kernel/cpu/mce/inject.c:115:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(m, 0, sizeof(struct mce));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/mce/inject.c:115:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(m, 0, sizeof(struct mce));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/mce/inject.c:136:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(i, m, sizeof(struct mce));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/mce/inject.c:136:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(i, m, sizeof(struct mce));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/mce/inject.c:147:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&b, 0xff, sizeof(mce_banks_t));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/mce/inject.c:147:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&b, 0xff, sizeof(mce_banks_t));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/mce/inject.c:160:3: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&regs, 0, sizeof(struct pt_regs));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/mce/inject.c:160:3: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
                   memset(&regs, 0, sizeof(struct pt_regs));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
>> arch/x86/kernel/cpu/mce/inject.c:355:6: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
           n =3D sprintf(buf, "%s\n", flags_options[inj_type]);
               ^~~~~~~
   arch/x86/kernel/cpu/mce/inject.c:355:6: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
           n =3D sprintf(buf, "%s\n", flags_options[inj_type]);
               ^~~~~~~
   arch/x86/kernel/cpu/mce/inject.c:746:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&dfs_fls, 0, sizeof(dfs_fls));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/mce/inject.c:746:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&dfs_fls, 0, sizeof(dfs_fls));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   fs/ocfs2/dir.c:278:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, osb->osb_dx_seed, sizeof(buf));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/ocfs2/dir.c:278:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(buf, osb->osb_dx_seed, sizeof(buf));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/ocfs2/dir.c:809:7: warning: Access to field 'e_cpos' results in a der=
eference of a null pointer (loaded from variable 'rec') [clang-analyzer-cor=
e.NullDereference]
                                     le32_to_cpu(rec->e_cpos),
                                     ^
   fs/ocfs2/dir.c:4406:2: note: Taking false branch
           if (!ocfs2_dir_indexed(dir))
           ^
   fs/ocfs2/dir.c:4410:6: note: 'ret' is 0
           if (ret) {
               ^~~
   fs/ocfs2/dir.c:4410:2: note: Taking false branch
           if (ret) {
           ^
   fs/ocfs2/dir.c:4416:6: note: Calling 'ocfs2_dx_root_inline'
           if (ocfs2_dx_root_inline(dx_root))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/dir.c:199:2: note: Returning without writing to 'dx_root->.dr_l=
ist.l_tree_depth', which participates in a condition later
           return dx_root->dr_flags & OCFS2_DX_FLAG_INLINE;
           ^
   fs/ocfs2/dir.c:4416:6: note: Returning from 'ocfs2_dx_root_inline'
           if (ocfs2_dx_root_inline(dx_root))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/dir.c:4416:6: note: Assuming the condition is false
           if (ocfs2_dx_root_inline(dx_root))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/dir.c:4416:2: note: Taking false branch
           if (ocfs2_dx_root_inline(dx_root))
           ^
   fs/ocfs2/dir.c:4422:2: note: Loop condition is true.  Entering loop body
           while (le32_to_cpu(dx_root->dr_clusters)) {
           ^
   fs/ocfs2/dir.c:4423:9: note: Calling 'ocfs2_dx_dir_lookup_rec'
                   ret =3D ocfs2_dx_dir_lookup_rec(dir, &dx_root->dr_list,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/dir.c:773:2: note: 'rec' initialized to a null pointer value
           struct ocfs2_extent_rec *rec =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/dir.c:775:6: note: Assuming field 'l_tree_depth' is 0
           if (el->l_tree_depth) {
               ^~~~~~~~~~~~~~~~
   fs/ocfs2/dir.c:775:2: note: Taking false branch
           if (el->l_tree_depth) {
           ^
   fs/ocfs2/dir.c:796:49: note: Assuming 'i' is < 0
           for (i =3D le16_to_cpu(el->l_next_free_rec) - 1; i >=3D 0; i--) {
                                                          ^~~~~~
   fs/ocfs2/dir.c:796:2: note: Loop condition is false. Execution continues=
 on line 805
           for (i =3D le16_to_cpu(el->l_next_free_rec) - 1; i >=3D 0; i--) {
           ^
   fs/ocfs2/dir.c:805:7: note: 'found' is 0
           if (!found) {
                ^~~~~
   fs/ocfs2/dir.c:805:2: note: Taking true branch
           if (!found) {
           ^
   fs/ocfs2/dir.c:809:7: note: Access to field 'e_cpos' results in a derefe=
rence of a null pointer (loaded from variable 'rec')
                                     le32_to_cpu(rec->e_cpos),
                                     ^
   fs/ocfs2/super.h:18:48: note: expanded from macro 'ocfs2_error'
           __ocfs2_error(sb, __PRETTY_FUNCTION__, fmt, ##__VA_ARGS__)
                                                         ^~~~~~~~~~~
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:50: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                    ^~
   fs/ocfs2/dir.c:1219:2: warning: Call to function 'memmove' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(&entry_list->de_entries[index],
--
   drivers/usb/misc/ftdi-elan.c:2783:3: warning: Use of memory after it is =
freed [clang-analyzer-unix.Malloc]
                   ftdi_response_cancel_work(ftdi);
                   ^                         ~~~~
   drivers/usb/misc/ftdi-elan.c:2779:2: note: Loop condition is false.  Exi=
ting loop
           pr_info("ftdi_u132 driver deregistered\n");
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/usb/misc/ftdi-elan.c:2780:2: note: Loop condition is true.  Ente=
ring loop body
           list_for_each_entry_safe(ftdi, temp, &ftdi_static_list, ftdi_lis=
t) {
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/usb/misc/ftdi-elan.c:2782:3: note: Calling 'ftdi_command_cancel_=
work'
                   ftdi_command_cancel_work(ftdi);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/misc/ftdi-elan.c:255:6: note: Assuming the condition is true
           if (cancel_delayed_work_sync(&ftdi->command_work))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/misc/ftdi-elan.c:255:2: note: Taking true branch
           if (cancel_delayed_work_sync(&ftdi->command_work))
           ^
   drivers/usb/misc/ftdi-elan.c:256:3: note: Calling 'kref_put'
                   kref_put(&ftdi->kref, ftdi_elan_delete);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'ftdi_elan_delete'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/usb/misc/ftdi-elan.c:196:2: note: Loop condition is false.  Exit=
ing loop
           dev_warn(&ftdi->udev->dev, "FREEING ftdi=3D%p\n", ftdi);
           ^
   include/linux/dev_printk.h:146:2: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt)=
, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/usb/misc/ftdi-elan.c:205:2: note: Memory is released
           kfree(ftdi);
           ^~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/usb/misc/ftdi-elan.c:256:3: note: Returning; memory was released
                   kref_put(&ftdi->kref, ftdi_elan_delete);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/misc/ftdi-elan.c:2782:3: note: Returning; memory was release=
d via 1st parameter
                   ftdi_command_cancel_work(ftdi);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/misc/ftdi-elan.c:2783:3: note: Use of memory after it is fre=
ed
                   ftdi_response_cancel_work(ftdi);
                   ^                         ~~~~
   Suppressed 38 warnings (36 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   103 warnings generated.
   Suppressed 103 warnings (103 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   109 warnings generated.
   Suppressed 109 warnings (109 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   108 warnings generated.
   drivers/usb/host/xhci-dbgcap.c:377:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dbc->eps, 0, sizeof(struct dbc_ep) * ARRAY_SIZE(dbc->eps)=
);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-dbgcap.c:377:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(dbc->eps, 0, sizeof(struct dbc_ep) * ARRAY_SIZE(dbc->eps)=
);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-dbgcap.c:828:4: warning: Value stored to 'ctrl' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           ctrl =3D readl(&dbc->regs->control);
                           ^
   drivers/usb/host/xhci-dbgcap.c:828:4: note: Value stored to 'ctrl' is ne=
ver read
>> drivers/usb/host/xhci-dbgcap.c:1004:9: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           return sprintf(buf, "%s\n", p);
                  ^~~~~~~
   drivers/usb/host/xhci-dbgcap.c:1004:9: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           return sprintf(buf, "%s\n", p);
                  ^~~~~~~
   Suppressed 105 warnings (105 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   105 warnings generated.
   Suppressed 105 warnings (105 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/usb/gadget/function/f_ecm.c:840:1: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(ecm);
   ^
   drivers/usb/gadget/function/u_ether_configfs.h:108:10: note: expanded fr=
om macro 'USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT'
                   return sprintf(page, "%d\n", qmult);                    \
                          ^~~~~~~
   drivers/usb/gadget/function/f_ecm.c:840:1: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
   USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(ecm);
   ^
   drivers/usb/gadget/function/u_ether_configfs.h:108:10: note: expanded fr=
om macro 'USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT'
                   return sprintf(page, "%d\n", qmult);                    \
                          ^~~~~~~
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/usb/gadget/function/f_eem.c:573:1: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(eem);
   ^
   drivers/usb/gadget/function/u_ether_configfs.h:108:10: note: expanded fr=
om macro 'USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT'
                   return sprintf(page, "%d\n", qmult);                    \
                          ^~~~~~~
   drivers/usb/gadget/function/f_eem.c:573:1: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
   USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(eem);
   ^
   drivers/usb/gadget/function/u_ether_configfs.h:108:10: note: expanded fr=
om macro 'USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT'
                   return sprintf(page, "%d\n", qmult);                    \
                          ^~~~~~~
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/base/regmap/regcache.c:137:7: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
                   if (config->reg_defaults[i].reg % map->reg_stride)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regcache.c:121:6: note: Assuming field 'cache_type' =
is not equal to REGCACHE_NONE
           if (map->cache_type =3D=3D REGCACHE_NONE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regcache.c:121:2: note: Taking false branch
           if (map->cache_type =3D=3D REGCACHE_NONE) {
           ^
   drivers/base/regmap/regcache.c:130:6: note: Assuming field 'reg_defaults=
' is null
           if (config->reg_defaults && !config->num_reg_defaults) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regcache.c:130:27: note: Left side of '&&' is false
           if (config->reg_defaults && !config->num_reg_defaults) {
                                    ^
   drivers/base/regmap/regcache.c:136:14: note: Assuming 'i' is < field 'nu=
m_reg_defaults'
           for (i =3D 0; i < config->num_reg_defaults; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regcache.c:136:2: note: Loop condition is true.  Ent=
ering loop body
           for (i =3D 0; i < config->num_reg_defaults; i++)
           ^
   drivers/base/regmap/regcache.c:137:7: note: Dereference of null pointer
                   if (config->reg_defaults[i].reg % map->reg_stride)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   drivers/pps/clients/pps-gpio.c:189:2: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(data->info.name, PPS_MAX_NAME_LEN - 1, "%s.%d",
           ^~~~~~~~
   drivers/pps/clients/pps-gpio.c:189:2: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
           snprintf(data->info.name, PPS_MAX_NAME_LEN - 1, "%s.%d",
           ^~~~~~~~
   Suppressed 24 warnings (24 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   94 warnings generated.
   drivers/w1/w1.c:76:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(md, 0, sizeof(struct w1_master) + sizeof(struct w1_bus_ma=
ster));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:76:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(md, 0, sizeof(struct w1_master) + sizeof(struct w1_bus_ma=
ster));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:94:9: warning: Call to function 'sprintf' is insecure as=
 it does not provide bounding of the memory buffer or security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", sl->name);
                  ^~~~~~~
   drivers/w1/w1.c:94:9: note: Call to function 'sprintf' is insecure as it=
 does not provide bounding of the memory buffer or security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%s\n", sl->name);
                  ^~~~~~~
   drivers/w1/w1.c:104:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, (u8 *)&sl->reg_num, count);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
--
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:90:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
              CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK, 16, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:22: note: expanded from macro 'CHEC=
K_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
                               ^
   drivers/cpufreq/intel_pstate.c:766:6: note: Left side of '&&' is false
           if (boot_cpu_has(X86_FEATURE_HWP_EPP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:91:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
              CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK, 17, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:22: note: expanded from macro 'CHEC=
K_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
                               ^
   drivers/cpufreq/intel_pstate.c:766:6: note: Left side of '&&' is false
           if (boot_cpu_has(X86_FEATURE_HWP_EPP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:92:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
              CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK, 18, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:22: note: expanded from macro 'CHEC=
K_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
                               ^
   drivers/cpufreq/intel_pstate.c:766:6: note: Left side of '&&' is false
           if (boot_cpu_has(X86_FEATURE_HWP_EPP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:93:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
              CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK, 19, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:22: note: expanded from macro 'CHEC=
K_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
                               ^
   drivers/cpufreq/intel_pstate.c:766:6: note: Left side of '||' is false
           if (boot_cpu_has(X86_FEATURE_HWP_EPP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:74:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
            ( CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK,  0, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:2: note: expanded from macro 'CHECK=
_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
           ^
   drivers/cpufreq/intel_pstate.c:766:6: note: '?' condition is false
           if (boot_cpu_has(X86_FEATURE_HWP_EPP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:3: note: expanded from macro 'cpu_=
has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
            ^
   drivers/cpufreq/intel_pstate.c:766:6: note: Assuming the condition is fa=
lse
           if (boot_cpu_has(X86_FEATURE_HWP_EPP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cpufeature.h:122:3: note: expanded from macro 'cpu_=
has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
            ^~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/intel_pstate.c:766:2: note: Taking false branch
           if (boot_cpu_has(X86_FEATURE_HWP_EPP)) {
           ^
   drivers/cpufreq/intel_pstate.c:782:7: note: Assuming the condition is tr=
ue
                   if (epp =3D=3D -EINVAL)
                       ^~~~~~~~~~~~~~
   drivers/cpufreq/intel_pstate.c:782:3: note: Taking true branch
                   if (epp =3D=3D -EINVAL)
                   ^
   drivers/cpufreq/intel_pstate.c:783:27: note: The result of the left shif=
t is undefined because the left operand is negative
                           epp =3D (pref_index - 1) << 2;
                                 ~~~~~~~~~~~~~~~~ ^
>> drivers/cpufreq/intel_pstate.c:797:10: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
                   ret +=3D sprintf(&buf[ret], "%s ", energy_perf_strings[i=
++]);
                          ^~~~~~~
   drivers/cpufreq/intel_pstate.c:797:10: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
                   ret +=3D sprintf(&buf[ret], "%s ", energy_perf_strings[i=
++]);
                          ^~~~~~~
   drivers/cpufreq/intel_pstate.c:799:9: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret +=3D sprintf(&buf[ret], "\n");
                  ^~~~~~~
   drivers/cpufreq/intel_pstate.c:799:9: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           ret +=3D sprintf(&buf[ret], "\n");
                  ^~~~~~~
   drivers/cpufreq/intel_pstate.c:817:8: warning: Call to function 'sscanf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%20s", str_preference);
                 ^~~~~~
   drivers/cpufreq/intel_pstate.c:817:8: note: Call to function 'sscanf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%20s", str_preference);
                 ^~~~~~
   drivers/cpufreq/intel_pstate.c:885:11: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return  sprintf(buf, "%d\n", raw_epp);
                           ^~~~~~~
   drivers/cpufreq/intel_pstate.c:885:11: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
                   return  sprintf(buf, "%d\n", raw_epp);
                           ^~~~~~~
   drivers/cpufreq/intel_pstate.c:887:11: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
                   return  sprintf(buf, "%s\n", energy_perf_strings[prefere=
nce]);
                           ^~~~~~~
   drivers/cpufreq/intel_pstate.c:887:11: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
                   return  sprintf(buf, "%s\n", energy_perf_strings[prefere=
nce]);
                           ^~~~~~~
   drivers/cpufreq/intel_pstate.c:909:9: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", freq);
                  ^~~~~~~
   drivers/cpufreq/intel_pstate.c:909:9: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", freq);
                  ^~~~~~~
   drivers/cpufreq/intel_pstate.c:1237:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", turbo_pct);
                  ^~~~~~~
   drivers/cpufreq/intel_pstate.c:1237:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", turbo_pct);
                  ^~~~~~~
   drivers/cpufreq/intel_pstate.c:1258:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", total);
                  ^~~~~~~
   drivers/cpufreq/intel_pstate.c:1258:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", total);
                  ^~~~~~~
   drivers/cpufreq/intel_pstate.c:1275:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "%u\n", global.turbo_disabled);
                         ^~~~~~~
   drivers/cpufreq/intel_pstate.c:1275:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "%u\n", global.turbo_disabled);
                         ^~~~~~~
   drivers/cpufreq/intel_pstate.c:1277:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buf, "%u\n", global.no_turbo);
                         ^~~~~~~
   drivers/cpufreq/intel_pstate.c:1277:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buf, "%u\n", global.no_turbo);
                         ^~~~~~~
   drivers/cpufreq/intel_pstate.c:1290:8: warning: Call to function 'sscanf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%u", &input);
                 ^~~~~~
   drivers/cpufreq/intel_pstate.c:1290:8: note: Call to function 'sscanf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%u", &input);
                 ^~~~~~
   drivers/cpufreq/intel_pstate.c:1374:8: warning: Call to function 'sscanf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%u", &input);
                 ^~~~~~
   drivers/cpufreq/intel_pstate.c:1374:8: note: Call to function 'sscanf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%u", &input);
                 ^~~~~~
   drivers/cpufreq/intel_pstate.c:1407:8: warning: Call to function 'sscanf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%u", &input);
                 ^~~~~~
   drivers/cpufreq/intel_pstate.c:1407:8: note: Call to function 'sscanf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%u", &input);
                 ^~~~~~
   drivers/cpufreq/intel_pstate.c:1438:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", hwp_boost);
                  ^~~~~~~
   drivers/cpufreq/intel_pstate.c:1438:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", hwp_boost);
                  ^~~~~~~
   drivers/cpufreq/intel_pstate.c:1468:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !enable);
                  ^~~~~~~
   drivers/cpufreq/intel_pstate.c:1468:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !enable);
                  ^~~~~~~
   drivers/cpufreq/intel_pstate.c:1486:1: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   show_one(max_perf_pct, max_perf_pct);
   ^
   drivers/cpufreq/intel_pstate.c:1183:10: note: expanded from macro 'show_=
one'
                   return sprintf(buf, "%u\n", global.object);             \
                          ^~~~~~~
   drivers/cpufreq/intel_pstate.c:1486:1: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
   show_one(max_perf_pct, max_perf_pct);
   ^
   drivers/cpufreq/intel_pstate.c:1183:10: note: expanded from macro 'show_=
one'
                   return sprintf(buf, "%u\n", global.object);             \
--
                           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_edid.c:5316:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info->hdmi, 0, sizeof(info->hdmi));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_edid.c:5316:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&info->hdmi, 0, sizeof(info->hdmi));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_edid.c:5319:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info->monitor_range, 0, sizeof(info->monitor_range));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_edid.c:5319:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&info->monitor_range, 0, sizeof(info->monitor_range));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_edid.c:5711:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&frame->display_primaries,
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_edid.c:5711:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(&frame->display_primaries,
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_edid.c:5715:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&frame->white_point,
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_edid.c:5715:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(&frame->white_point,
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   fs/xfs/xfs_iops.c:681:11: warning: Value stored to 'uid' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           kuid_t                  uid =3D GLOBAL_ROOT_UID, iuid =3D GLOBAL=
_ROOT_UID;
                                   ^~~
   fs/xfs/xfs_iops.c:681:11: note: Value stored to 'uid' during its initial=
ization is never read
           kuid_t                  uid =3D GLOBAL_ROOT_UID, iuid =3D GLOBAL=
_ROOT_UID;
                                   ^~~
   fs/xfs/xfs_iops.c:681:34: warning: Value stored to 'iuid' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           kuid_t                  uid =3D GLOBAL_ROOT_UID, iuid =3D GLOBAL=
_ROOT_UID;
                                                          ^~~~
   fs/xfs/xfs_iops.c:681:34: note: Value stored to 'iuid' during its initia=
lization is never read
           kuid_t                  uid =3D GLOBAL_ROOT_UID, iuid =3D GLOBAL=
_ROOT_UID;
                                                          ^~~~
   fs/xfs/xfs_iops.c:682:11: warning: Value stored to 'gid' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           kgid_t                  gid =3D GLOBAL_ROOT_GID, igid =3D GLOBAL=
_ROOT_GID;
                                   ^~~
   fs/xfs/xfs_iops.c:682:11: note: Value stored to 'gid' during its initial=
ization is never read
           kgid_t                  gid =3D GLOBAL_ROOT_GID, igid =3D GLOBAL=
_ROOT_GID;
                                   ^~~
   fs/xfs/xfs_iops.c:682:34: warning: Value stored to 'igid' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           kgid_t                  gid =3D GLOBAL_ROOT_GID, igid =3D GLOBAL=
_ROOT_GID;
                                                          ^~~~
   fs/xfs/xfs_iops.c:682:34: note: Value stored to 'igid' during its initia=
lization is never read
           kgid_t                  gid =3D GLOBAL_ROOT_GID, igid =3D GLOBAL=
_ROOT_GID;
                                                          ^~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   fs/xfs/xfs_inode.c:2897:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(i_tab, 0, *num_inodes * sizeof(struct xfs_inode *));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/xfs/xfs_inode.c:2897:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(i_tab, 0, *num_inodes * sizeof(struct xfs_inode *));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
>> drivers/scsi/advansys.c:2638:3: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
                   sprintf(info,
                   ^~~~~~~
   drivers/scsi/advansys.c:2638:3: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
                   sprintf(info,
                   ^~~~~~~
   drivers/scsi/advansys.c:2659:3: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
                   sprintf(info,
                   ^~~~~~~
   drivers/scsi/advansys.c:2659:3: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
                   sprintf(info,
                   ^~~~~~~
   drivers/scsi/advansys.c:7420:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(asc_scsi_q, 0, sizeof(*asc_scsi_q));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/scsi/advansys.c:7420:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(asc_scsi_q, 0, sizeof(*asc_scsi_q));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/scsi/advansys.c:7685:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(scsiqp->cdb, scp->cmnd, scp->cmd_len < 12 ? scp->cmd_len =
: 12);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/scsi/advansys.c:7685:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(scsiqp->cdb, scp->cmnd, scp->cmd_len < 12 ? scp->cmd_len =
: 12);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/scsi/advansys.c:7690:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(scsiqp->cdb16, &scp->cmnd[12], cdb16_len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/scsi/advansys.c:7690:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(scsiqp->cdb16, &scp->cmnd[12], cdb16_len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/scsi/advansys.c:8087:2: warning: Value stored to 'n_q_required' =
is never read [clang-analyzer-deadcode.DeadStores]
           n_q_required =3D 1;
           ^              ~
   drivers/scsi/advansys.c:8087:2: note: Value stored to 'n_q_required' is =
never read
           n_q_required =3D 1;
           ^              ~
   drivers/scsi/advansys.c:9172:9: warning: Access to field 'device' result=
s in a dereference of a null pointer (loaded from variable 'pdev') [clang-a=
nalyzer-core.NullDereference]
                           if ((pdev->device =3D=3D PCI_DEVICE_ID_ASP_1200A=
) ||
                                ^
   drivers/scsi/advansys.c:10715:10: note: Assuming 'bus_type' is not equal=
 to ASC_IS_PCI
           pdev =3D (bus_type =3D=3D ASC_IS_PCI) ? to_pci_dev(boardp->dev) =
: NULL;
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/advansys.c:10715:9: note: '?' condition is false
           pdev =3D (bus_type =3D=3D ASC_IS_PCI) ? to_pci_dev(boardp->dev) =
: NULL;
                  ^
   drivers/scsi/advansys.c:10715:2: note: Null pointer value stored to 'pde=
v'
           pdev =3D (bus_type =3D=3D ASC_IS_PCI) ? to_pci_dev(boardp->dev) =
: NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/advansys.c:10717:6: note: Assuming the condition is true
           if (ASC_NARROW_BOARD(boardp)) {
               ^
   drivers/scsi/advansys.c:2062:35: note: expanded from macro 'ASC_NARROW_B=
OARD'
   #define ASC_NARROW_BOARD(boardp) (((boardp)->flags & ASC_IS_WIDE_BOARD) =
=3D=3D 0)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/scsi/advansys.c:10717:2: note: Taking true branch
           if (ASC_NARROW_BOARD(boardp)) {
           ^
   drivers/scsi/advansys.c:10765:2: note: Taking true branch
           if (ASC_NARROW_BOARD(boardp)) {
           ^
   drivers/scsi/advansys.c:10770:3: note: Control jumps to the 'default' ca=
se at line 10784
                   switch (asc_dvc_varp->bus_type) {
                   ^
   drivers/scsi/advansys.c:10785:4: note: Loop condition is false.  Exiting=
 loop
                           shost_printk(KERN_ERR, shost, "unknown adapter t=
ype: "
                           ^
   include/scsi/scsi_host.h:720:2: note: expanded from macro 'shost_printk'
           dev_printk(prefix, &(shost)->shost_gendev, fmt, ##a)
           ^
   include/linux/dev_printk.h:128:3: note: expanded from macro 'dev_printk'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/scsi/advansys.c:10788:4: note:  Execution continues on line 10798
                           break;
--
                                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:4060:5: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                                   memset(kaddr, 0, PAGE_SIZE);
                                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:4496:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(free_i->free_segmap, 0xff, bitmap_size);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:4496:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(free_i->free_segmap, 0xff, bitmap_size);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:4497:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(free_i->free_secmap, 0xff, sec_bitmap_size);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:4497:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(free_i->free_secmap, 0xff, sec_bitmap_size);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:4584:6: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                                           memset(se->discard_map, 0xff,
                                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:4584:6: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                                           memset(se->discard_map, 0xff,
                                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:4587:6: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                                           memcpy(se->discard_map,
                                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:4587:6: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                                           memcpy(se->discard_map,
                                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:4631:5: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(se->discard_map, 0xff, SIT_VBLOCK=
_MAP_SIZE);
                                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:4631:5: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                                   memset(se->discard_map, 0xff, SIT_VBLOCK=
_MAP_SIZE);
                                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:4633:5: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(se->discard_map, se->cur_valid_ma=
p,
                                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:4633:5: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                                   memcpy(se->discard_map, se->cur_valid_ma=
p,
                                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:4917:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, zone, sizeof(struct blk_zone));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:4917:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(data, zone, sizeof(struct blk_zone));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 57 warnings (57 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   111 warnings generated.
>> drivers/block/drbd/drbd_state.c:751:10: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
                   pbp +=3D sprintf(pbp, "role( %s -> %s ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:751:10: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
                   pbp +=3D sprintf(pbp, "role( %s -> %s ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:755:10: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
                   pbp +=3D sprintf(pbp, "peer( %s -> %s ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:755:10: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
                   pbp +=3D sprintf(pbp, "peer( %s -> %s ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:759:10: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
                   pbp +=3D sprintf(pbp, "conn( %s -> %s ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:759:10: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
                   pbp +=3D sprintf(pbp, "conn( %s -> %s ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:763:10: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
                   pbp +=3D sprintf(pbp, "disk( %s -> %s ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:763:10: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
                   pbp +=3D sprintf(pbp, "disk( %s -> %s ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:767:10: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
                   pbp +=3D sprintf(pbp, "pdsk( %s -> %s ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:767:10: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
                   pbp +=3D sprintf(pbp, "pdsk( %s -> %s ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:783:10: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pbp +=3D sprintf(pbp, "aftr_isp( %d -> %d ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:783:10: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
                   pbp +=3D sprintf(pbp, "aftr_isp( %d -> %d ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:787:10: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pbp +=3D sprintf(pbp, "peer_isp( %d -> %d ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:787:10: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
                   pbp +=3D sprintf(pbp, "peer_isp( %d -> %d ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:791:10: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pbp +=3D sprintf(pbp, "user_isp( %d -> %d ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:791:10: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
                   pbp +=3D sprintf(pbp, "user_isp( %d -> %d ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:808:10: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pbp +=3D sprintf(pbp, "susp( %d -> %d ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:808:10: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
                   pbp +=3D sprintf(pbp, "susp( %d -> %d ) ",
                          ^~~~~~~
   drivers/block/drbd/drbd_state.c:813:3: warning: Access to field 'resourc=
e' results in a dereference of a null pointer (loaded from variable 'connec=
tion') [clang-analyzer-core.NullDereference]
                   drbd_info(connection, "%s\n", pb);
                   ^
   drivers/block/drbd/drbd_int.h:119:2: note: expanded from macro 'drbd_inf=
o'
           drbd_printk(KERN_INFO, obj, fmt, ## args)
           ^
   drivers/block/drbd/drbd_int.h:104:6: note: expanded from macro 'drbd_pri=
ntk'
                                    __drbd_printk_connection, level, fmt, #=
# args), \
                                    ^
   drivers/block/drbd/drbd_state.c:1265:39: note: Assuming 'peer_device' is=
 null
           struct drbd_connection *connection =3D peer_device ? peer_device=
->connection : NULL;
                                                ^~~~~~~~~~~
   drivers/block/drbd/drbd_state.c:1265:39: note: '?' condition is false
   drivers/block/drbd/drbd_state.c:1265:2: note: 'connection' initialized t=
o a null pointer value
           struct drbd_connection *connection =3D peer_device ? peer_device=
->connection : NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_state.c:1275:6: note: Assuming 'ns.i' is not equ=
al to 'os.i'
           if (ns.i =3D=3D os.i)
               ^~~~~~~~~~~~
   drivers/block/drbd/drbd_state.c:1275:2: note: Taking false branch
           if (ns.i =3D=3D os.i)
           ^
   drivers/block/drbd/drbd_state.c:1279:6: note: Assuming 'rv' is >=3D SS_S=
UCCESS
           if (rv < SS_SUCCESS)
               ^~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_state.c:1279:2: note: Taking false branch
           if (rv < SS_SUCCESS)
           ^
   drivers/block/drbd/drbd_state.c:1282:6: note: Assuming the condition is =
false
           if (!(flags & CS_HARD)) {
               ^~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_state.c:1282:2: note: Taking false branch
           if (!(flags & CS_HARD)) {
           ^
   drivers/block/drbd/drbd_state.c:1297:6: note: 'rv' is >=3D SS_SUCCESS
           if (rv < SS_SUCCESS) {
               ^~
   drivers/block/drbd/drbd_state.c:1297:2: note: Taking false branch
           if (rv < SS_SUCCESS) {
           ^
   drivers/block/drbd/drbd_state.c:1310:6: note: Assuming the condition is =
true
           if (!(flags & CS_DC_SUSP))
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/block/drbd/drbd_state.c:1310:2: note: Taking true branch
           if (!(flags & CS_DC_SUSP))
           ^
   drivers/block/drbd/drbd_state.c:1311:24: note: Passing null pointer valu=
e via 1st parameter 'connection'
--
               ^~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5726:2: note: Taking false branch
           if (set->flags & NFT_SET_MAP) {
           ^
   net/netfilter/nf_tables_api.c:5731:7: note: Assuming the condition is fa=
lse
                   if (nla[NFTA_SET_ELEM_DATA] !=3D NULL)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5731:3: note: Taking false branch
                   if (nla[NFTA_SET_ELEM_DATA] !=3D NULL)
                   ^
   net/netfilter/nf_tables_api.c:5735:42: note: Left side of '&&' is false
           if ((flags & NFT_SET_ELEM_INTERVAL_END) &&
                                                   ^
   net/netfilter/nf_tables_api.c:5746:6: note: Assuming the condition is fa=
lse
           if (nla[NFTA_SET_ELEM_TIMEOUT] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5746:2: note: Taking false branch
           if (nla[NFTA_SET_ELEM_TIMEOUT] !=3D NULL) {
           ^
   net/netfilter/nf_tables_api.c:5753:13: note: Assuming the condition is f=
alse
           } else if (set->flags & NFT_SET_TIMEOUT) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5753:9: note: Taking false branch
           } else if (set->flags & NFT_SET_TIMEOUT) {
                  ^
   net/netfilter/nf_tables_api.c:5758:6: note: Assuming the condition is fa=
lse
           if (nla[NFTA_SET_ELEM_EXPIRATION] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5758:2: note: Taking false branch
           if (nla[NFTA_SET_ELEM_EXPIRATION] !=3D NULL) {
           ^
   net/netfilter/nf_tables_api.c:5767:6: note: Assuming the condition is tr=
ue
           if (nla[NFTA_SET_ELEM_EXPR]) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5767:2: note: Taking true branch
           if (nla[NFTA_SET_ELEM_EXPR]) {
           ^
   net/netfilter/nf_tables_api.c:5770:7: note: Assuming field 'num_exprs' i=
s 0
                   if (set->num_exprs && set->num_exprs !=3D 1)
                       ^~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5770:22: note: Left side of '&&' is false
                   if (set->num_exprs && set->num_exprs !=3D 1)
                                      ^
   net/netfilter/nf_tables_api.c:5773:10: note: Calling 'nft_set_elem_expr_=
alloc'
                   expr =3D nft_set_elem_expr_alloc(ctx, set,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5332:9: note: Calling 'nft_expr_init'
           expr =3D nft_expr_init(ctx, attr);
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2795:8: note: Calling 'nf_tables_expr_pars=
e'
           err =3D nf_tables_expr_parse(ctx, nla, &expr_info);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2714:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:2714:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:2718:2: note: Taking true branch
           if (IS_ERR(type))
           ^
   net/netfilter/nf_tables_api.c:2719:3: note: Returning without writing to=
 'info->ops'
                   return PTR_ERR(type);
                   ^
   net/netfilter/nf_tables_api.c:2795:8: note: Returning from 'nf_tables_ex=
pr_parse'
           err =3D nf_tables_expr_parse(ctx, nla, &expr_info);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2796:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   net/netfilter/nf_tables_api.c:2796:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:2800:17: note: Access to field 'size' resu=
lts in a dereference of an undefined pointer value (loaded from field 'ops')
           expr =3D kzalloc(expr_info.ops->size, GFP_KERNEL);
                          ^         ~~~
   net/netfilter/nf_tables_api.c:2831:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst, src, src->ops->size);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:2831:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst, src, src->ops->size);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:3012:4: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&cb->args[1], 0,
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:3012:4: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                           memset(&cb->args[1], 0,
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
>> net/netfilter/nf_tables_api.c:3804:9: warning: Call to function 'sscanf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sscanf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                           if (!sscanf(i->name, name, &tmp))
                                ^~~~~~
   net/netfilter/nf_tables_api.c:3804:9: note: Call to function 'sscanf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sscanf_s' i=
n case of C11
                           if (!sscanf(i->name, name, &tmp))
                                ^~~~~~
   net/netfilter/nf_tables_api.c:3815:4: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(inuse, 0, PAGE_SIZE);
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:3815:4: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                           memset(inuse, 0, PAGE_SIZE);
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:4249:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&desc, 0, sizeof(desc));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:4249:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&desc, 0, sizeof(desc));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5096:16: warning: The left operand of '!=
=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (desc.type !=3D NFT_DATA_VALUE || desc.len !=3D set->klen) {
                         ^
   net/netfilter/nf_tables_api.c:6302:2: note: Taking false branch
           if (IS_ERR(table)) {
           ^
   net/netfilter/nf_tables_api.c:6308:2: note: Taking false branch
           if (IS_ERR(set))
           ^
   net/netfilter/nf_tables_api.c:6310:6: note: Assuming the condition is fa=
lse
           if (!list_empty(&set->bindings) && set->flags & NFT_SET_CONSTANT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6310:34: note: Left side of '&&' is false
           if (!list_empty(&set->bindings) && set->flags & NFT_SET_CONSTANT)
                                           ^
   net/netfilter/nf_tables_api.c:6315:6: note: Assuming the condition is fa=
lse
           if (!nla[NFTA_SET_ELEM_LIST_ELEMENTS])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6315:2: note: Taking false branch
           if (!nla[NFTA_SET_ELEM_LIST_ELEMENTS])
           ^
   net/netfilter/nf_tables_api.c:6318:2: note: Loop condition is true.  Ent=
ering loop body
           nla_for_each_nested(attr, nla[NFTA_SET_ELEM_LIST_ELEMENTS], rem)=
 {
           ^
   include/net/netlink.h:1932:2: note: expanded from macro 'nla_for_each_ne=
sted'
           nla_for_each_attr(pos, nla_data(nla), nla_len(nla), rem)
           ^
   include/net/netlink.h:1921:2: note: expanded from macro 'nla_for_each_at=
tr'
           for (pos =3D head, rem =3D len; \
           ^
   net/netfilter/nf_tables_api.c:6319:9: note: Calling 'nft_del_setelem'
                   err =3D nft_del_setelem(&ctx, set, attr);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6132:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:6132:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:6136:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   net/netfilter/nf_tables_api.c:6136:2: note: Taking false branch
           if (err < 0)
           ^
   net/netfilter/nf_tables_api.c:6139:6: note: Assuming the condition is fa=
lse
           if (!nla[NFTA_SET_ELEM_KEY] && !(flags & NFT_SET_ELEM_CATCHALL))
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:6139:30: note: Left side of '&&' is false
           if (!nla[NFTA_SET_ELEM_KEY] && !(flags & NFT_SET_ELEM_CATCHALL))
                                       ^
   net/netfilter/nf_tables_api.c:6144:6: note: 'flags' is equal to 0
           if (flags !=3D 0)
               ^~~~~
   net/netfilter/nf_tables_api.c:6144:2: note: Taking false branch
           if (flags !=3D 0)
           ^
   net/netfilter/nf_tables_api.c:6147:2: note: Taking true branch
           if (nla[NFTA_SET_ELEM_KEY]) {
           ^
   net/netfilter/nf_tables_api.c:6148:9: note: Calling 'nft_setelem_parse_k=
ey'
                   err =3D nft_setelem_parse_key(ctx, set, &elem.key.val,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:5092:8: note: Calling 'nft_data_init'
           err =3D nft_data_init(ctx, key, NFT_DATA_VALUE_MAXLEN, &desc, at=
tr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_api.c:9555:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/netfilter/nf_tables_api.c:9555:2: note: Taking false branch
           if (err < 0)

vim +155 arch/x86/platform/ts5500/ts5500.c

7d0291256ca99c Vivien Didelot 2013-01-04  149  =

84e288d41871cf Vivien Didelot 2014-07-08  150  static ssize_t name_show(str=
uct device *dev, struct device_attribute *attr,
84e288d41871cf Vivien Didelot 2014-07-08  151  		char *buf)
84e288d41871cf Vivien Didelot 2014-07-08  152  {
84e288d41871cf Vivien Didelot 2014-07-08  153  	struct ts5500_sbc *sbc =3D =
dev_get_drvdata(dev);
84e288d41871cf Vivien Didelot 2014-07-08  154  =

84e288d41871cf Vivien Didelot 2014-07-08 @155  	return sprintf(buf, "%s\n",=
 sbc->name);
84e288d41871cf Vivien Didelot 2014-07-08  156  }
84e288d41871cf Vivien Didelot 2014-07-08  157  static DEVICE_ATTR_RO(name);
84e288d41871cf Vivien Didelot 2014-07-08  158  =


:::::: The code at line 155 was first introduced by commit
:::::: 84e288d41871cfb7a21cb7e6dee9e3884b59b25f x86/platform/ts5500: Add a =
'name' sysfs attribute

:::::: TO: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2591214866326803878==--

