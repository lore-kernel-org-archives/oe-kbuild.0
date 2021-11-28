Content-Type: multipart/mixed; boundary="===============0467092882904518602=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: security/keys/dh.c:400:2: warning: Potential leak of memory pointed to by 'outbuf' [clang-analyzer-unix.Malloc]
Date: Sun, 28 Nov 2021 19:37:47 +0800
Message-ID: <202111281950.T3EXItuJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0467092882904518602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3498e7f2bb415e447354a3debef6738d9655768c
commit: a52f8a59aef46b59753e583bf4b28fccb069ce64 fortify: Explicitly disabl=
e Clang support
date:   9 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-c007-20211118 (https://download.01.org/0day-ci/ar=
chive/20211128/202111281950.T3EXItuJ-lkp(a)intel.com/config)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da52f8a59aef46b59753e583bf4b28fccb069ce64
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a52f8a59aef46b59753e583bf4b28fccb069ce64
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                      ^~~~
   security/keys/dh.c:375:2: note: '?' condition is false
           if (kdfcopy) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/dh.c:375:6: note: 'kdfcopy' is non-null
           if (kdfcopy) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   security/keys/dh.c:375:2: note: '?' condition is true
           if (kdfcopy) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   security/keys/dh.c:375:2: note: Taking true branch
           if (kdfcopy) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/dh.c:380:7: note: Assuming the condition is false
                   if (copy_from_user(outbuf + req->dst_len, kdfcopy->other=
info,
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/dh.c:380:3: note: '?' condition is false
                   if (copy_from_user(outbuf + req->dst_len, kdfcopy->other=
info,
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/dh.c:380:7: note: Assuming the condition is false
                   if (copy_from_user(outbuf + req->dst_len, kdfcopy->other=
info,
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   security/keys/dh.c:380:3: note: '?' condition is false
                   if (copy_from_user(outbuf + req->dst_len, kdfcopy->other=
info,
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   security/keys/dh.c:380:3: note: Taking false branch
                   if (copy_from_user(outbuf + req->dst_len, kdfcopy->other=
info,
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/dh.c:386:31: note: Passing null pointer value via 1st para=
meter 'sdesc'
                   ret =3D keyctl_dh_compute_kdf(sdesc, buffer, buflen, out=
buf,
                                               ^~~~~
   security/keys/dh.c:386:9: note: Calling 'keyctl_dh_compute_kdf'
                   ret =3D keyctl_dh_compute_kdf(sdesc, buffer, buflen, out=
buf,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   security/keys/dh.c:206:33: note: Dereference of null pointer
                                       crypto_shash_digestsize(sdesc->shash=
.tfm));
                                                               ^
   include/linux/math.h:60:18: note: expanded from macro 'roundup'
           typeof(y) __y =3D y;                              \
                           ^
>> security/keys/dh.c:400:2: warning: Potential leak of memory pointed to b=
y 'outbuf' [clang-analyzer-unix.Malloc]
           crypto_free_kpp(tfm);
           ^
   security/keys/dh.c:245:6: note: Assuming 'params' is non-null
           if (!params || (!buffer && buflen)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/dh.c:245:6: note: Left side of '||' is false
           if (!params || (!buffer && buflen)) {
               ^
   security/keys/dh.c:245:18: note: Assuming 'buffer' is non-null
           if (!params || (!buffer && buflen)) {
                           ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   security/keys/dh.c:245:26: note: Left side of '&&' is false
           if (!params || (!buffer && buflen)) {
                                   ^
   security/keys/dh.c:245:2: note: '?' condition is false
           if (!params || (!buffer && buflen)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/dh.c:245:7: note: 'params' is non-null
           if (!params || (!buffer && buflen)) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   security/keys/dh.c:245:6: note: Left side of '||' is false
           if (!params || (!buffer && buflen)) {
               ^
   security/keys/dh.c:245:19: note: 'buffer' is non-null
           if (!params || (!buffer && buflen)) {
                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   security/keys/dh.c:245:26: note: Left side of '&&' is false
           if (!params || (!buffer && buflen)) {
                                   ^
   security/keys/dh.c:245:2: note: '?' condition is false
           if (!params || (!buffer && buflen)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   security/keys/dh.c:245:2: note: Taking false branch
           if (!params || (!buffer && buflen)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   security/keys/dh.c:249:2: note: '?' condition is false
           if (copy_from_user(&pcopy, params, sizeof(pcopy)) !=3D 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   security/keys/dh.c:249:6: note: Assuming the condition is false
           if (copy_from_user(&pcopy, params, sizeof(pcopy)) !=3D 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
           (*(target_ptr) |=3D (((value) & (mask)) << (position)))
                                          ^~~~
   drivers/acpi/acpica/hwregs.c:260:10: note: '?' condition is true
                                 ACPI_MASK_BITS_ABOVE_64(access_width), val=
ue64);
                                 ^
   drivers/acpi/acpica/acmacros.h:310:46: note: expanded from macro 'ACPI_M=
ASK_BITS_ABOVE_64'
   #define ACPI_MASK_BITS_ABOVE_64(width)      ((width) =3D=3D ACPI_INTEGER=
_BIT_SIZE ? \
                                                ^
   drivers/acpi/acpica/hwregs.c:263:7: note: Assuming 'bit_width' is > 'acc=
ess_width'
                       bit_width > access_width ? access_width : bit_width;
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/hwregs.c:263:7: note: '?' condition is true
   drivers/acpi/acpica/hwregs.c:229:2: note: Loop condition is true.  Enter=
ing loop body
           while (bit_width) {
           ^
   drivers/acpi/acpica/hwregs.c:230:7: note: Assuming 'bit_offset' is >=3D =
'access_width'
                   if (bit_offset >=3D access_width) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/acpi/acpica/hwregs.c:230:3: note: '?' condition is false
                   if (bit_offset >=3D access_width) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/acpi/acpica/hwregs.c:230:7: note: 'bit_offset' is >=3D 'access_w=
idth'
                   if (bit_offset >=3D access_width) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/acpi/acpica/hwregs.c:230:3: note: '?' condition is true
                   if (bit_offset >=3D access_width) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/acpi/acpica/hwregs.c:230:3: note: Taking true branch
                   if (bit_offset >=3D access_width) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/acpi/acpica/hwregs.c:260:10: note: 'access_width' is equal to 64
                                 ACPI_MASK_BITS_ABOVE_64(access_width), val=
ue64);
                                 ^
   drivers/acpi/acpica/acmacros.h:310:46: note: expanded from macro 'ACPI_M=
ASK_BITS_ABOVE_64'
   #define ACPI_MASK_BITS_ABOVE_64(width)      ((width) =3D=3D ACPI_INTEGER=
_BIT_SIZE ? \
                                                ^
   drivers/acpi/acpica/acmacros.h:334:33: note: expanded from macro 'ACPI_S=
ET_BITS'
           (*(target_ptr) |=3D (((value) & (mask)) << (position)))
                                          ^~~~
   drivers/acpi/acpica/hwregs.c:260:10: note: '?' condition is true
                                 ACPI_MASK_BITS_ABOVE_64(access_width), val=
ue64);
                                 ^
   drivers/acpi/acpica/acmacros.h:310:46: note: expanded from macro 'ACPI_M=
ASK_BITS_ABOVE_64'
   #define ACPI_MASK_BITS_ABOVE_64(width)      ((width) =3D=3D ACPI_INTEGER=
_BIT_SIZE ? \
                                                ^
   drivers/acpi/acpica/hwregs.c:259:3: note: The result of the left shift i=
s undefined due to shifting by '64', which is greater or equal to the width=
 of type 'unsigned long long'
                   ACPI_SET_BITS(value, index * access_width,
                   ^
   drivers/acpi/acpica/acmacros.h:334:40: note: expanded from macro 'ACPI_S=
ET_BITS'
           (*(target_ptr) |=3D (((value) & (mask)) << (position)))
                                                 ^  ~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   arch/x86/kernel/unwind_orc.c:38:7: warning: Value stored to 'mid' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int *mid =3D first, *found =3D first;
                ^~~   ~~~~~
   arch/x86/kernel/unwind_orc.c:38:7: note: Value stored to 'mid' during it=
s initialization is never read
           int *mid =3D first, *found =3D first;
                ^~~   ~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> arch/x86/kernel/amd_gart_64.c:743:12: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
           aper_base       =3D info.aper_base;
                           ^ ~~~~~~~~~~~~~~
   arch/x86/kernel/amd_gart_64.c:717:6: note: Assuming the condition is fal=
se
           if (!amd_nb_has_feature(AMD_NB_GART))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/x86/kernel/amd_gart_64.c:717:2: note: '?' condition is false
           if (!amd_nb_has_feature(AMD_NB_GART))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   arch/x86/kernel/amd_gart_64.c:717:6: note: Assuming the condition is fal=
se
           if (!amd_nb_has_feature(AMD_NB_GART))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   arch/x86/kernel/amd_gart_64.c:717:2: note: '?' condition is false
           if (!amd_nb_has_feature(AMD_NB_GART))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   arch/x86/kernel/amd_gart_64.c:717:2: note: Taking false branch
           if (!amd_nb_has_feature(AMD_NB_GART))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   arch/x86/kernel/amd_gart_64.c:730:6: note: Assuming 'no_iommu' is 0
           if (no_iommu ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/x86/kernel/amd_gart_64.c:730:6: note: Left side of '||' is false
           if (no_iommu ||
               ^
   arch/x86/kernel/amd_gart_64.c:731:7: note: Assuming 'force_iommu' is not=
 equal to 0
               (!force_iommu && max_pfn <=3D MAX_DMA32_PFN) ||
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/x86/kernel/amd_gart_64.c:731:20: note: Left side of '&&' is false
               (!force_iommu && max_pfn <=3D MAX_DMA32_PFN) ||
                             ^
   arch/x86/kernel/amd_gart_64.c:732:6: note: Assuming 'gart_iommu_aperture=
' is not equal to 0
               !gart_iommu_aperture ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/x86/kernel/amd_gart_64.c:730:6: note: Left side of '||' is false
           if (no_iommu ||
               ^
   arch/x86/kernel/amd_gart_64.c:733:7: note: 'no_agp' is 1
               (no_agp && init_amd_gatt(&info) < 0)) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/x86/kernel/amd_gart_64.c:733:7: note: Left side of '&&' is true
               (no_agp && init_amd_gatt(&info) < 0)) {
                ^
   arch/x86/kernel/amd_gart_64.c:733:17: note: Calling 'init_amd_gatt'
               (no_agp && init_amd_gatt(&info) < 0)) {
--
   drivers/misc/habanalabs/common/context.c:126:8: note: Left side of '&&' =
is false
           ctx =3D container_of(ref, struct hl_ctx, refcount);
                 ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/misc/habanalabs/common/context.c:126:8: note: '?' condition is t=
rue
           ctx =3D container_of(ref, struct hl_ctx, refcount);
                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/misc/habanalabs/common/context.c:126:8: note: Left side of '&&' =
is false
           ctx =3D container_of(ref, struct hl_ctx, refcount);
                 ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/misc/habanalabs/common/context.c:126:8: note: Taking false branch
           ctx =3D container_of(ref, struct hl_ctx, refcount);
                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/misc/habanalabs/common/context.c:126:8: note: Loop condition is =
false.  Exiting loop
           ctx =3D container_of(ref, struct hl_ctx, refcount);
                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/misc/habanalabs/common/context.c:130:2: note: Use of memory afte=
r it is freed
           if (ctx->hpriv)
           ^
   include/linux/compiler.h:56:46: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   4 warnings generated.
>> drivers/dax/bus.c:585:6: warning: Use of memory after it is freed [clang=
-analyzer-unix.Malloc]
           if (devm_add_action_or_reset(parent, dax_region_unregister, dax_=
region))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/dax/bus.c:553:2: note: Assuming the condition is true
           if (dev_get_drvdata(parent)) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/dax/bus.c:553:2: note: '?' condition is false
           if (dev_get_drvdata(parent)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/dax/bus.c:553:2: note: '?' condition is false
           if (dev_get_drvdata(parent)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/dax/bus.c:553:2: note: Taking false branch
           if (dev_get_drvdata(parent)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/dax/bus.c:558:7: note: Assuming the condition is true
           if (!IS_ALIGNED(range->start, align)
                ^
   include/linux/align.h:13:28: note: expanded from macro 'IS_ALIGNED'
   #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) =
=3D=3D 0)
                                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/dax/bus.c:558:6: note: Left side of '||' is false
           if (!IS_ALIGNED(range->start, align)
               ^
   drivers/dax/bus.c:559:8: note: Assuming the condition is true
                           || !IS_ALIGNED(range_len(range), align))
                               ^
   include/linux/align.h:13:28: note: expanded from macro 'IS_ALIGNED'
   #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) =
=3D=3D 0)
                                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/dax/bus.c:558:2: note: '?' condition is false
           if (!IS_ALIGNED(range->start, align)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/dax/bus.c:558:6: note: Left side of '||' is false
           if (!IS_ALIGNED(range->start, align)
               ^
   drivers/dax/bus.c:558:2: note: '?' condition is false
           if (!IS_ALIGNED(range->start, align)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/dax/bus.c:558:2: note: Taking false branch
           if (!IS_ALIGNED(range->start, align)
--
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/dax/bus.c:523:15: note: Left side of '&&' is false
           dax_region =3D container_of(kref, struct dax_region, kref);
                        ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/dax/bus.c:523:15: note: Taking false branch
           dax_region =3D container_of(kref, struct dax_region, kref);
                        ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/dax/bus.c:523:15: note: Loop condition is false.  Exiting loop
           dax_region =3D container_of(kref, struct dax_region, kref);
                        ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/dax/bus.c:524:2: note: Memory is released
           kfree(dax_region);
           ^~~~~~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/dax/bus.c:529:2: note: Returning; memory was released
           kref_put(&dax_region->kref, dax_region_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dax/bus.c:539:2: note: Returning; memory was released via 1st pa=
rameter
           dax_region_put(dax_region);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:255:3: note: Returning; memory was released via 1=
st parameter
                   action(data);
                   ^~~~~~~~~~~~
   drivers/dax/bus.c:585:6: note: Returning; memory was released via 3rd pa=
rameter
           if (devm_add_action_or_reset(parent, dax_region_unregister, dax_=
region))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/dax/bus.c:585:2: note: '?' condition is false
           if (devm_add_action_or_reset(parent, dax_region_unregister, dax_=
region))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/dax/bus.c:585:6: note: Use of memory after it is freed
           if (devm_add_action_or_reset(parent, dax_region_unregister, dax_=
region))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/dax/bus.c:818:7: warning: Value stored to 'is_shrink' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           bool is_shrink =3D resource_size(res) > size;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dax/bus.c:818:7: note: Value stored to 'is_shrink' during its in=
itialization is never read
           bool is_shrink =3D resource_size(res) > size;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/dax/bus.c:875:33: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
                   struct dax_mapping *mapping =3D dev_dax->ranges[i].mappi=
ng;
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dax/bus.c:873:34: note: Assuming 'i' is >=3D 0
           for (i =3D dev_dax->nr_range - 1; i >=3D 0; i--) {
                                           ^~~~~~
   drivers/dax/bus.c:873:2: note: Loop condition is true.  Entering loop bo=
dy
           for (i =3D dev_dax->nr_range - 1; i >=3D 0; i--) {
           ^
   drivers/dax/bus.c:879:12: note: Assuming '__UNIQUE_ID___x311' is >=3D '_=
_UNIQUE_ID___y312'
                   shrink =3D min_t(u64, to_shrink, range_len(range));
                            ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/dax/bus.c:879:12: note: '?' condition is false
                   shrink =3D min_t(u64, to_shrink, range_len(range));
                            ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/dax/bus.c:880:3: note: '?' condition is false
                   if (shrink >=3D range_len(range)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/dax/bus.c:880:3: note: '?' condition is true
                   if (shrink >=3D range_len(range)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/dax/bus.c:880:3: note: Taking true branch
                   if (shrink >=3D range_len(range)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/dax/bus.c:883:4: note: Calling 'trim_dev_dax_range'
                           trim_dev_dax_range(dev_dax);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dax/bus.c:376:2: note: '?' condition is true
           dev_dbg(&dev_dax->dev, "delete range[%d]: %#llx:%#llx\n", i,
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/dax/bus.c:376:2: note: Taking false branch
           dev_dbg(&dev_dax->dev, "delete range[%d]: %#llx:%#llx\n", i,
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/dax/bus.c:381:6: note: Assuming the condition is false
           if (--dev_dax->nr_range =3D=3D 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/dax/bus.c:381:2: note: '?' condition is false
           if (--dev_dax->nr_range =3D=3D 0) {
--
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/base/cacheinfo.c:248:8: note: Left side of '||' is false
                           if (i =3D=3D cpu || !sib_cpu_ci->info_list)
                               ^
   drivers/base/cacheinfo.c:248:20: note: Assuming field 'info_list' is null
                           if (i =3D=3D cpu || !sib_cpu_ci->info_list)
                                           ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/base/cacheinfo.c:248:4: note: '?' condition is false
                           if (i =3D=3D cpu || !sib_cpu_ci->info_list)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/base/cacheinfo.c:248:8: note: 'i' is not equal to 'cpu'
                           if (i =3D=3D cpu || !sib_cpu_ci->info_list)
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/base/cacheinfo.c:248:8: note: Left side of '||' is false
                           if (i =3D=3D cpu || !sib_cpu_ci->info_list)
                               ^
   drivers/base/cacheinfo.c:248:4: note: '?' condition is true
                           if (i =3D=3D cpu || !sib_cpu_ci->info_list)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/base/cacheinfo.c:248:4: note: Taking true branch
                           if (i =3D=3D cpu || !sib_cpu_ci->info_list)
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/base/cacheinfo.c:249:5: note:  Execution continues on line 245
                                   continue;/* skip if itself or no cachein=
fo */
                                   ^
   drivers/base/cacheinfo.c:245:3: note: Loop condition is false. Execution=
 continues on line 257
                   for_each_online_cpu(i) {
                   ^
   include/linux/cpumask.h:789:36: note: expanded from macro 'for_each_onli=
ne_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^
   include/linux/cpumask.h:179:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/base/cacheinfo.c:257:7: note: Access to field 'coherency_line_si=
ze' results in a dereference of a null pointer (loaded from variable 'this_=
leaf')
                   if (this_leaf->coherency_line_size > coherency_max_size)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   kernel/gcov/fs.c:532:3: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(node->name, name);
                   ^~~~~~
   kernel/gcov/fs.c:532:3: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
                   strcpy(node->name, name);
                   ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (1 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 with check filters).
   3 warnings generated.
>> kernel/kprobes.c:237:8: warning: Use of memory after it is freed [clang-=
analyzer-unix.Malloc]
                           if (kip->slot_used[i] =3D=3D SLOT_DIRTY && colle=
ct_one_slot(kip, i))
                               ^
   kernel/kprobes.c:253:2: note: Left side of '||' is false
           list_for_each_entry_rcu(kip, &c->pages, list) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/kprobes.c:253:2: note: Left side of '||' is false
           list_for_each_entry_rcu(kip, &c->pages, list) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/kprobes.c:253:2: note: Left side of '||' is false
           list_for_each_entry_rcu(kip, &c->pages, list) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/kprobes.c:253:2: note: Left side of '||' is true
           list_for_each_entry_rcu(kip, &c->pages, list) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   kernel/kprobes.c:253:2: note: '?' condition is true
           list_for_each_entry_rcu(kip, &c->pages, list) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/kprobes.c:253:2: note: Left side of '||' is false
           list_for_each_entry_rcu(kip, &c->pages, list) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
--
                                                      ^~~~
   kernel/kprobes.c:199:6: note: Assuming field 'nused' is equal to 0
           if (kip->nused =3D=3D 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/kprobes.c:199:2: note: '?' condition is false
           if (kip->nused =3D=3D 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/kprobes.c:199:11: note: Field 'nused' is equal to 0
           if (kip->nused =3D=3D 0) {
                    ^
   kernel/kprobes.c:199:2: note: '?' condition is true
           if (kip->nused =3D=3D 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   kernel/kprobes.c:199:2: note: Taking true branch
           if (kip->nused =3D=3D 0) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/kprobes.c:206:3: note: '?' condition is false
                   if (!list_is_singular(&kip->list)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/kprobes.c:206:3: note: '?' condition is true
                   if (!list_is_singular(&kip->list)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   kernel/kprobes.c:206:3: note: Taking true branch
                   if (!list_is_singular(&kip->list)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/kprobes.c:217:4: note: Memory is released
                           kfree(kip);
                           ^~~~~~~~~~
   kernel/kprobes.c:237:43: note: Returning; memory was released via 1st pa=
rameter
                           if (kip->slot_used[i] =3D=3D SLOT_DIRTY && colle=
ct_one_slot(kip, i))
                                                                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/kprobes.c:237:4: note: '?' condition is false
                           if (kip->slot_used[i] =3D=3D SLOT_DIRTY && colle=
ct_one_slot(kip, i))
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/kprobes.c:237:8: note: Use of memory after it is freed
                           if (kip->slot_used[i] =3D=3D SLOT_DIRTY && colle=
ct_one_slot(kip, i))
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
>> kernel/kprobes.c:2037:2: warning: Potential leak of memory pointed to by=
 'inst' [clang-analyzer-unix.Malloc]
           refcount_set(&rp->rph->ref, i);
           ^
   kernel/kprobes.c:1991:2: note: Assuming 'ret' is 0
           if (ret)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/kprobes.c:1991:2: note: '?' condition is false
           if (ret)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/kprobes.c:1991:6: note: 'ret' is 0
           if (ret)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   kernel/kprobes.c:1991:2: note: '?' condition is false
           if (ret)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   kernel/kprobes.c:1991:2: note: Taking false branch
           if (ret)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/kprobes.c:1995:13: note: Field 'addr' is non-null
           if (rp->kp.addr && warn_kprobe_rereg(&rp->kp))
                      ^
   kernel/kprobes.c:1995:6: note: Left side of '&&' is true
           if (rp->kp.addr && warn_kprobe_rereg(&rp->kp))
               ^
   kernel/kprobes.c:1995:2: note: '?' condition is false
           if (rp->kp.addr && warn_kprobe_rereg(&rp->kp))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/kprobes.c:1995:6: note: Assuming field 'addr' is null
           if (rp->kp.addr && warn_kprobe_rereg(&rp->kp))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   kernel/kprobes.c:1995:18: note: Left side of '&&' is false
           if (rp->kp.addr && warn_kprobe_rereg(&rp->kp))
                           ^
   kernel/kprobes.c:1995:2: note: '?' condition is false
           if (rp->kp.addr && warn_kprobe_rereg(&rp->kp))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   kernel/kprobes.c:1995:2: note: Taking false branch
           if (rp->kp.addr && warn_kprobe_rereg(&rp->kp))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/kprobes.c:1998:2: note: Assuming 'kretprobe_blacklist_size' is 0
           if (kretprobe_blacklist_size) {
--
   fs/fat/dir.c:1333:6: note: 'free_slots' is 0
           if (free_slots) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/fat/dir.c:1333:2: note: '?' condition is false
           if (free_slots) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/fat/dir.c:1333:2: note: Taking false branch
           if (free_slots) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/fat/dir.c:1368:2: note: Assuming 'nr_slots' is 0
           if (nr_slots) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/fat/dir.c:1368:2: note: '?' condition is false
           if (nr_slots) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/fat/dir.c:1368:6: note: 'nr_slots' is 0
           if (nr_slots) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/fat/dir.c:1368:2: note: '?' condition is false
           if (nr_slots) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/fat/dir.c:1368:2: note: Taking false branch
           if (nr_slots) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/fat/dir.c:1396:12: note: Assigned value is garbage or undefined
           sinfo->de =3D de;
                     ^ ~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
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
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> crypto/tcrypt.c:696:2: warning: Potential leak of memory pointed to by '=
req' [clang-analyzer-unix.Malloc]
           crypto_free_aead(tfm);
           ^
   crypto/tcrypt.c:549:6: note: Assuming 'iv' is non-null
           if (!iv)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   crypto/tcrypt.c:549:2: note: '?' condition is false
           if (!iv)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   crypto/tcrypt.c:549:7: note: 'iv' is non-null
           if (!iv)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   crypto/tcrypt.c:549:2: note: '?' condition is false
           if (!iv)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   crypto/tcrypt.c:549:2: note: Taking false branch
           if (!iv)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   crypto/tcrypt.c:552:6: note: Assuming the condition is false
           if (aad_size >=3D PAGE_SIZE) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   crypto/tcrypt.c:552:2: note: '?' condition is false
           if (aad_size >=3D PAGE_SIZE) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   crypto/tcrypt.c:552:2: note: '?' condition is false
           if (aad_size >=3D PAGE_SIZE) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   crypto/tcrypt.c:552:2: note: Taking false branch
           if (aad_size >=3D PAGE_SIZE) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   crypto/tcrypt.c:557:6: note: Assuming 'enc' is equal to 1
           if (enc =3D=3D ENCRYPT)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   crypto/tcrypt.c:557:2: note: '?' condition is false
           if (enc =3D=3D ENCRYPT)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/radio/si4713/si4713.c:1359:3: note: '?' condition is false
                   if (rval < 0)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/radio/si4713/si4713.c:1359:7: note: 'rval' is >=3D 0
                   if (rval < 0)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/media/radio/si4713/si4713.c:1359:7: note: 'rval' is >=3D 0
                   if (rval < 0)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/media/radio/si4713/si4713.c:1359:3: note: '?' condition is false
                   if (rval < 0)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/radio/si4713/si4713.c:1359:3: note: Taking false branch
                   if (rval < 0)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/radio/si4713/si4713.c:1362:19: note: Assigned value is gar=
bage or undefined
                   sdev->frequency =3D freq;
                                   ^ ~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   3 warnings generated.
   drivers/media/dvb-frontends/tc90522.c:51:2: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   drivers/media/dvb-frontends/tc90522.c:51:2: note: Value stored to 'ret' =
is never read
           ret =3D 0;
           ^     ~
   drivers/media/dvb-frontends/tc90522.c:343:2: warning: Value stored to 'm=
ode' is never read [clang-analyzer-deadcode.DeadStores]
           mode =3D 1;
           ^      ~
   drivers/media/dvb-frontends/tc90522.c:343:2: note: Value stored to 'mode=
' is never read
           mode =3D 1;
           ^      ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/media/dvb-frontends/helene.c:432:22: warning: Value stored to 'p=
riv' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct helene_priv *priv =3D fe->tuner_priv;
                               ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/helene.c:432:22: note: Value stored to 'priv=
' during its initialization is never read
           struct helene_priv *priv =3D fe->tuner_priv;
                               ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/helene.c:452:22: warning: Value stored to 'p=
riv' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct helene_priv *priv =3D fe->tuner_priv;
                               ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/helene.c:452:22: note: Value stored to 'priv=
' during its initialization is never read
           struct helene_priv *priv =3D fe->tuner_priv;
                               ^~~~   ~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/usb/gadget/function/f_fs.c:1050:8: warning: Potential leak of me=
mory pointed to by 'data' [clang-analyzer-unix.Malloc]
                   WARN(1, "%s: data_len =3D=3D -EINVAL\n", __func__);
                        ^
   drivers/usb/gadget/function/f_fs.c:951:14: note: Assuming field 'state' =
is equal to FFS_ACTIVE
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/usb/gadget/function/f_fs.c:951:6: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/usb/gadget/function/f_fs.c:951:6: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/usb/gadget/function/f_fs.c:951:6: note: Taking false branch
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/usb/gadget/function/f_fs.c:951:2: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/usb/gadget/function/f_fs.c:951:6: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/usb/gadget/function/f_fs.c:951:6: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/usb/gadget/function/f_fs.c:951:6: note: Taking false branch
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/usb/gadget/function/f_fs.c:951:2: note: '?' condition is false
           if (WARN_ON(epfile->ffs->state !=3D FFS_ACTIVE))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:564:5: note: Value stored to 'std' is neve=
r read
                                   std =3D "secamGH";
                                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:568:4: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           std =3D "palB";
                           ^     ~~~~~~
   drivers/media/tuners/si2157.c:568:4: note: Value stored to 'std' is neve=
r read
                           std =3D "palB";
                           ^     ~~~~~~
   drivers/media/tuners/si2157.c:573:5: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   std =3D "secamB";
                                   ^     ~~~~~~~~
   drivers/media/tuners/si2157.c:573:5: note: Value stored to 'std' is neve=
r read
                                   std =3D "secamB";
                                   ^     ~~~~~~~~
   drivers/media/tuners/si2157.c:578:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "MN";
                   ^     ~~~~
   drivers/media/tuners/si2157.c:578:3: note: Value stored to 'std' is neve=
r read
                   std =3D "MN";
                   ^     ~~~~
   drivers/media/tuners/si2157.c:583:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "palI";
                   ^     ~~~~~~
   drivers/media/tuners/si2157.c:583:3: note: Value stored to 'std' is neve=
r read
                   std =3D "palI";
                   ^     ~~~~~~
   drivers/media/tuners/si2157.c:588:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "palDK";
                   ^     ~~~~~~~
   drivers/media/tuners/si2157.c:588:3: note: Value stored to 'std' is neve=
r read
                   std =3D "palDK";
                   ^     ~~~~~~~
   drivers/media/tuners/si2157.c:593:4: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           std =3D "secamDK";
                           ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:593:4: note: Value stored to 'std' is neve=
r read
                           std =3D "secamDK";
                           ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:597:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "secamL";
                   ^     ~~~~~~~~
   drivers/media/tuners/si2157.c:597:3: note: Value stored to 'std' is neve=
r read
                   std =3D "secamL";
                   ^     ~~~~~~~~
   drivers/media/tuners/si2157.c:603:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "secamL'";
                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:603:3: note: Value stored to 'std' is neve=
r read
                   std =3D "secamL'";
                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:609:3: warning: Value stored to 'std' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   std =3D "unknown";
                   ^     ~~~~~~~~~
   drivers/media/tuners/si2157.c:609:3: note: Value stored to 'std' is neve=
r read
                   std =3D "unknown";
                   ^     ~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   3 warnings generated.
>> drivers/media/dvb-frontends/au8522_common.c:111:56: warning: The express=
ion is an uninitialized value. The computed value will also be garbage [cla=
ng-analyzer-core.uninitialized.Assign]
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                                                                 ^
   drivers/media/tuners/tuner-i2c.h:146:3: note: expanded from macro 'hybri=
d_tuner_request_state'
                   state->i2c_props.count++;                               \
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/au8522_common.c:111:8: note: Left side of '&=
&' is false
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/dvb-frontends/au8522_common.c:111:8: note: '?' condition i=
s true
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/dvb-frontends/au8522_common.c:111:8: note: Left side of '&=
&' is false
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/dvb-frontends/au8522_common.c:111:8: note: Taking false br=
anch
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/dvb-frontends/au8522_common.c:111:8: note: Loop condition =
is false.  Exiting loop
           ret =3D hybrid_tuner_request_state(struct au8522_state, (*state),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
--
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   lib/mpi/mpih-div.c:202:12: warning: Division by zero [clang-analyzer-cor=
e.DivideZero]
                   return 1 / dsize;
                          ~~^~~~~~~
   lib/mpi/mpih-div.c:194:2: note: Control jumps to 'case 0:'  at line 195
           switch (dsize) {
           ^
   lib/mpi/mpih-div.c:202:12: note: Division by zero
                   return 1 / dsize;
                          ~~^~~~~~~
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
   lib/strnlen_user.c:34:2: warning: Value stored to 'src' is never read [c=
lang-analyzer-deadcode.DeadStores]
           src -=3D align;
           ^      ~~~~~
   lib/strnlen_user.c:34:2: note: Value stored to 'src' is never read
           src -=3D align;
           ^      ~~~~~
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   3 warnings generated.
   drivers/misc/dw-xdata-pcie.c:96:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &dw->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~
   drivers/misc/dw-xdata-pcie.c:96:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D &dw->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~
   drivers/misc/dw-xdata-pcie.c:164:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &dw->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~
   drivers/misc/dw-xdata-pcie.c:164:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D &dw->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/misc/habanalabs/common/mmu/mmu_v1.c:389:2: warning: Value stored=
 to 'hop2_pte_addr' is never read [clang-analyzer-deadcode.DeadStores]
           hop2_pte_addr =3D hop2_addr;
           ^               ~~~~~~~~~
   drivers/misc/habanalabs/common/mmu/mmu_v1.c:389:2: note: Value stored to=
 'hop2_pte_addr' is never read
           hop2_pte_addr =3D hop2_addr;
           ^               ~~~~~~~~~
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
>> drivers/misc/habanalabs/common/device.c:134:7: warning: Use of memory af=
ter it is freed [clang-analyzer-unix.Malloc]
           if (!hl_hpriv_put(hpriv))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/misc/habanalabs/common/device.c:120:6: note: Assuming 'hdev' is =
non-null
           if (!hdev) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/misc/habanalabs/common/device.c:120:2: note: '?' condition is fa=
lse
           if (!hdev) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/misc/habanalabs/common/device.c:120:7: note: 'hdev' is non-null
           if (!hdev) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/misc/habanalabs/common/device.c:120:2: note: '?' condition is fa=
lse
           if (!hdev) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/misc/habanalabs/common/device.c:120:2: note: Taking false branch
           if (!hdev) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/misc/habanalabs/common/device.c:134:7: note: Calling 'hl_hpriv_p=
ut'
           if (!hl_hpriv_put(hpriv))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/misc/habanalabs/common/device.c:102:9: note: Calling 'kref_put'
           return kref_put(&hpriv->refcount, hpriv_release);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: '?' condition is false
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/linux/kref.h:64:2: note: '?' condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/kref.h:65:3: note: Calling 'hpriv_release'
                   release(kref);
--
   include/linux/list.h:132:2: note: '?' condition is false
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   include/linux/list.h:132:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/list.h:135:2: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
           ^                       ~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   arch/x86/platform/efi/efi.c:381:4: warning: Value stored to 'over4g' is =
never read [clang-analyzer-deadcode.DeadStores]
                           over4g |=3D data->fw_vendor       > U32_MAX ||
                           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/platform/efi/efi.c:381:4: note: Value stored to 'over4g' is nev=
er read
                           over4g |=3D data->fw_vendor       > U32_MAX ||
                           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/platform/efi/efi.c:389:4: warning: Value stored to 'over4g' is =
never read [clang-analyzer-deadcode.DeadStores]
                           over4g |=3D systab64->fw_vendor   > U32_MAX ||
                           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/platform/efi/efi.c:389:4: note: Value stored to 'over4g' is nev=
er read
                           over4g |=3D systab64->fw_vendor   > U32_MAX ||
                           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   arch/x86/platform/intel-mid/pwr.c:265:3: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D mid_pwr_set_power_state(pwr, pdev, state);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/platform/intel-mid/pwr.c:265:3: note: Value stored to 'ret' is =
never read
                   ret =3D mid_pwr_set_power_state(pwr, pdev, state);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
>> drivers/media/tuners/mxl5007t.c:853:63: warning: The expression is an un=
initialized value. The computed value will also be garbage [clang-analyzer-=
core.uninitialized.Assign]
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                                                                        ^
   drivers/media/tuners/tuner-i2c.h:146:3: note: expanded from macro 'hybri=
d_tuner_request_state'
                   state->i2c_props.count++;                               \
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mxl5007t.c:853:13: note: Left side of '&&' is false
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/tuners/mxl5007t.c:853:13: note: '?' condition is true
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/tuners/mxl5007t.c:853:13: note: Left side of '&&' is false
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/tuners/mxl5007t.c:853:13: note: Taking false branch
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/tuners/mxl5007t.c:853:13: note: Loop condition is false.  =
Exiting loop
           instance =3D hybrid_tuner_request_state(struct mxl5007t_state, s=
tate,
                      ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
--
                           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/fuse/dev.c:993:4: note: '?' condition is false
                           if (err)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/fuse/dev.c:993:8: note: 'err' is 0
                           if (err)
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/fuse/dev.c:993:4: note: '?' condition is false
                           if (err)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/fuse/dev.c:993:4: note: Taking false branch
                           if (err)
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/fuse/dev.c:990:2: note: Loop condition is false. Execution continues =
on line 998
           while (size) {
           ^
   fs/fuse/dev.c:1520:8: note: Returning from 'fuse_copy_one'
           err =3D fuse_copy_one(cs, &outarg, sizeof(outarg));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c:1521:2: note: '?' condition is false
           if (err)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/fuse/dev.c:1521:6: note: 'err' is 0
           if (err)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/fuse/dev.c:1521:2: note: '?' condition is false
           if (err)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/fuse/dev.c:1521:2: note: Taking false branch
           if (err)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/fuse/dev.c:1525:21: note: The left operand of '>' is a garbage value
           if (outarg.namelen > FUSE_NAME_MAX)
                              ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
>> fs/fuse/dev.c:1751:9: warning: Assigned value is garbage or undefined [c=
lang-analyzer-core.uninitialized.Assign]
           nodeid =3D outarg.nodeid;
                  ^
   fs/fuse/dev.c:1849:6: note: Assuming the condition is false
           if (nbytes < sizeof(struct fuse_out_header))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/fuse/dev.c:1849:2: note: '?' condition is false
           if (nbytes < sizeof(struct fuse_out_header))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/fuse/dev.c:1849:2: note: '?' condition is false
           if (nbytes < sizeof(struct fuse_out_header))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/fuse/dev.c:1849:2: note: Taking false branch
           if (nbytes < sizeof(struct fuse_out_header))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/fuse/dev.c:1853:2: note: '?' condition is false
           if (err)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/fuse/dev.c:1853:6: note: 'err' is 0
           if (err)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/fuse/dev.c:1853:2: note: '?' condition is false
           if (err)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/fuse/dev.c:1853:2: note: Taking false branch
           if (err)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/fuse/dev.c:1857:6: note: Assuming 'nbytes' is equal to field 'len'
           if (oh.len !=3D nbytes)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/fuse/dev.c:1857:2: note: '?' condition is false
           if (oh.len !=3D nbytes)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/fuse/dev.c:1857:16: note: 'nbytes' is equal to field 'len'
           if (oh.len !=3D nbytes)
                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/lockd/svcproc.c:62:2: note: '?' condition is false
           if (!nlmsvc_ops)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/lockd/svcproc.c:62:7: note: 'nlmsvc_ops' is null
           if (!nlmsvc_ops)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/lockd/svcproc.c:62:2: note: '?' condition is true
           if (!nlmsvc_ops)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/lockd/svcproc.c:62:2: note: Taking true branch
           if (!nlmsvc_ops)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/lockd/svcproc.c:63:3: note: Returning without writing to '*hostp'
                   return nlm_lck_denied_nolocks;
                   ^
   fs/lockd/svcproc.c:488:6: note: Returning from 'nlmsvc_retrieve_args'
           if (nlmsvc_retrieve_args(rqstp, argp, &host, NULL))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/lockd/svcproc.c:488:2: note: Assuming the condition is true
           if (nlmsvc_retrieve_args(rqstp, argp, &host, NULL))
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/lockd/svcproc.c:488:2: note: '?' condition is false
           if (nlmsvc_retrieve_args(rqstp, argp, &host, NULL))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/lockd/svcproc.c:488:2: note: Taking false branch
           if (nlmsvc_retrieve_args(rqstp, argp, &host, NULL))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/lockd/svcproc.c:491:2: note: 1st function call argument is an uniniti=
alized value
           nlmsvc_free_host_resources(host);
           ^                          ~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/media/dvb-frontends/cx24117.c:1133:56: warning: The expression i=
s an uninitialized value. The computed value will also be garbage [clang-an=
alyzer-core.uninitialized.Assign]
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                                                                 ^
   drivers/media/tuners/tuner-i2c.h:146:3: note: expanded from macro 'hybri=
d_tuner_request_state'
                   state->i2c_props.count++;                               \
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24117.c:1133:8: note: Left side of '&&' is=
 false
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/dvb-frontends/cx24117.c:1133:8: note: '?' condition is true
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/dvb-frontends/cx24117.c:1133:8: note: Left side of '&&' is=
 false
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/dvb-frontends/cx24117.c:1133:8: note: Taking false branch
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/dvb-frontends/cx24117.c:1133:8: note: Loop condition is fa=
lse.  Exiting loop
           ret =3D hybrid_tuner_request_state(struct cx24117_priv, (*priv),
                 ^
   drivers/media/tuners/tuner-i2c.h:122:2: note: expanded from macro 'hybri=
d_tuner_request_state'
           list_for_each_entry(state, &list, hybrid_tuner_instance_list) { \
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
--
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/edac/edac_mc.c:1154:3: note: '?' condition is false
                   if (pos[i] < 0)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/edac/edac_mc.c:1154:3: note: '?' condition is true
                   if (pos[i] < 0)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/edac/edac_mc.c:1154:3: note: Taking true branch
                   if (pos[i] < 0)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/edac/edac_mc.c:1155:4: note:  Execution continues on line 1153
                           continue;
                           ^
   drivers/edac/edac_mc.c:1153:14: note: Assuming 'i' is < field 'n_layers'
           for (i =3D 0; i < mci->n_layers; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/edac/edac_mc.c:1153:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < mci->n_layers; i++) {
           ^
   drivers/edac/edac_mc.c:1154:7: note: Assuming the condition is true
                   if (pos[i] < 0)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/edac/edac_mc.c:1154:3: note: '?' condition is false
                   if (pos[i] < 0)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/edac/edac_mc.c:1154:3: note: '?' condition is true
                   if (pos[i] < 0)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/edac/edac_mc.c:1154:3: note: Taking true branch
                   if (pos[i] < 0)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/edac/edac_mc.c:1155:4: note:  Execution continues on line 1153
                           continue;
                           ^
   drivers/edac/edac_mc.c:1153:33: note: The value 3 is assigned to 'i'
           for (i =3D 0; i < mci->n_layers; i++) {
                                          ^~~
   drivers/edac/edac_mc.c:1153:14: note: Assuming 'i' is < field 'n_layers'
           for (i =3D 0; i < mci->n_layers; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/edac/edac_mc.c:1153:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < mci->n_layers; i++) {
           ^
   drivers/edac/edac_mc.c:1154:14: note: The left operand of '<' is a garba=
ge value due to array index out of bounds
                   if (pos[i] < 0)
                              ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> fs/hpfs/name.c:67:2: warning: Potential leak of memory pointed to by 'to=
' [clang-analyzer-unix.Malloc]
           if (!(to =3D kmalloc(len, GFP_KERNEL))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/name.c:59:6: note: Assuming field 'sb_chk' is >=3D 2
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/name.c:59:2: note: '?' condition is false
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/name.c:59:18: note: Field 'sb_chk' is >=3D 2
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
                           ^
   fs/hpfs/name.c:59:2: note: '?' condition is true
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/hpfs/name.c:59:2: note: Taking true branch
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/name.c:59:35: note: Assuming the condition is true
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
                                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/name.c:59:31: note: '?' condition is false
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
                                        ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/name.c:59:35: note: Assuming the condition is false
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
                                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/hpfs/name.c:59:31: note: '?' condition is false
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
                                        ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/hpfs/name.c:59:31: note: Taking false branch
           if (hpfs_sb(s)->sb_chk >=3D 2) if (hpfs_is_name_long(from, len) =
!=3D lng) {
                                        ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/name.c:66:6: note: Assuming 'lc' is not equal to 0
           if (!lc) return from;
--
   mm/hugetlb.c:3141:28: note: Left side of '&&' is false
           if (hstate_is_gigantic(h) && !IS_ENABLED(CONFIG_CONTIG_ALLOC)) {
                                     ^
   mm/hugetlb.c:3141:2: note: '?' condition is false
           if (hstate_is_gigantic(h) && !IS_ENABLED(CONFIG_CONTIG_ALLOC)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   mm/hugetlb.c:3141:2: note: Taking false branch
           if (hstate_is_gigantic(h) && !IS_ENABLED(CONFIG_CONTIG_ALLOC)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   mm/hugetlb.c:3162:9: note: Assuming field 'surplus_huge_pages' is 0
           while (h->surplus_huge_pages && count > persistent_huge_pages(h)=
) {
                  ^~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c:3162:31: note: Left side of '&&' is false
           while (h->surplus_huge_pages && count > persistent_huge_pages(h)=
) {
                                        ^
   mm/hugetlb.c:3167:9: note: Assuming the condition is true
           while (count > persistent_huge_pages(h)) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c:3167:2: note: Loop condition is true.  Entering loop body
           while (count > persistent_huge_pages(h)) {
           ^
   mm/hugetlb.c:3178:9: note: Calling 'alloc_pool_huge_page'
                   ret =3D alloc_pool_huge_page(h, nodes_allowed,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c:1887:2: note: 'page' declared without an initial value
           struct page *page;
           ^~~~~~~~~~~~~~~~~
   mm/hugetlb.c:1891:33: note: Assuming 'nr_nodes' is <=3D 0
           for_each_node_mask_to_alloc(h, nr_nodes, node, nodes_allowed) {
                                          ^
   mm/hugetlb.c:1253:3: note: expanded from macro 'for_each_node_mask_to_al=
loc'
                   nr_nodes > 0 &&                                         \
                   ^~~~~~~~~~~~
   mm/hugetlb.c:1891:2: note: Left side of '&&' is false
           for_each_node_mask_to_alloc(h, nr_nodes, node, nodes_allowed) {
           ^
   mm/hugetlb.c:1253:16: note: expanded from macro 'for_each_node_mask_to_a=
lloc'
                   nr_nodes > 0 &&                                         \
                                ^
   mm/hugetlb.c:1898:2: note: 1st function call argument is an uninitialize=
d value
           if (!page)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^                    ~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/dvb-frontends/cxd2841er.c:3600:25: warning: Value stored t=
o 'priv' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct cxd2841er_priv *priv =3D fe->demodulator_priv;
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2841er.c:3600:25: note: Value stored to '=
priv' during its initialization is never read
           struct cxd2841er_priv *priv =3D fe->demodulator_priv;
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2841er.c:3759:25: warning: Value stored t=
o 'priv' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct cxd2841er_priv *priv =3D fe->demodulator_priv;
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2841er.c:3759:25: note: Value stored to '=
priv' during its initialization is never read
           struct cxd2841er_priv *priv =3D fe->demodulator_priv;
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2841er.c:3812:34: warning: Value stored t=
o 'p' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2841er.c:3812:34: note: Value stored to '=
p' during its initialization is never read
           struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/media/dvb-frontends/drxk_hard.c:1378:2: warning: Value stored to=
 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status =3D write16(state, SIO_OFDM_SH_OFDM_RING_ENABLE__A, desir=
ed_ctrl);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:1378:2: note: Value stored to 's=
tatus' is never read
           status =3D write16(state, SIO_OFDM_SH_OFDM_RING_ENABLE__A, desir=
ed_ctrl);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:3861:3: warning: Value stored to=
 'operation_mode' is never read [clang-analyzer-deadcode.DeadStores]
                   operation_mode |=3D OFDM_SC_RA_RAM_OP_AUTO_RATE__M;
                   ^
   drivers/media/dvb-frontends/drxk_hard.c:3861:3: note: Value stored to 'o=
peration_mode' is never read
   drivers/media/dvb-frontends/drxk_hard.c:4185:2: warning: Value stored to=
 'fec_rs_prescale' is never read [clang-analyzer-deadcode.DeadStores]
           fec_rs_prescale =3D 1;
           ^                 ~
   drivers/media/dvb-frontends/drxk_hard.c:4185:2: note: Value stored to 'f=
ec_rs_prescale' is never read
           fec_rs_prescale =3D 1;
           ^                 ~
>> drivers/media/dvb-frontends/drxk_hard.c:6686:12: warning: Assigned value=
 is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           *ucblocks =3D (u32) err;
                     ^ ~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:6676:2: note: 'err' declared wit=
hout an initial value
           u16 err;
           ^~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: Assuming 'debug' i=
s < 1
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:154:5: note: expanded from macro=
 'dprintk'
   if (debug >=3D level)                                                   =
  \
   ~~~~^~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro '\if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: '?' condition is f=
alse
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:45: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                                                           ^
   include/linux/compiler.h:56:28: note: expanded from macro '\if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: 'debug' is < 1
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:154:5: note: expanded from macro=
 'dprintk'
   if (debug >=3D level)                                                   =
  \
       ^~~~~
   include/linux/compiler.h:56:47: note: expanded from macro '\if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: '?' condition is f=
alse
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:45: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                                                           ^
   include/linux/compiler.h:56:28: note: expanded from macro '\if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: Taking false branch
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:45: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                                                           ^
   include/linux/compiler.h:56:23: note: expanded from macro '\if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: Loop condition is =
false.  Exiting loop
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:37: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                       ^
   drivers/media/dvb-frontends/drxk_hard.c:6680:6: note: Assuming field 'm_=
drxk_state' is not equal to DRXK_NO_DEV
           if (state->m_drxk_state =3D=3D DRXK_NO_DEV)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/dvb-frontends/drxk_hard.c:6680:2: note: '?' condition is f=
alse
           if (state->m_drxk_state =3D=3D DRXK_NO_DEV)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/dvb-frontends/drxk_hard.c:6680:13: note: Field 'm_drxk_sta=
te' is not equal to DRXK_NO_DEV
           if (state->m_drxk_state =3D=3D DRXK_NO_DEV)
                      ^
   drivers/media/dvb-frontends/drxk_hard.c:6680:2: note: '?' condition is f=
alse
           if (state->m_drxk_state =3D=3D DRXK_NO_DEV)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   kernel/events/core.c:10204:2: note: Loop condition is true.  Entering lo=
op body
           list_for_each_entry(filter, &ifh->list, entry) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   kernel/events/core.c:10205:3: note: Assuming field 'dentry' is non-null
                   if (filter->path.dentry) {
                   ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/events/core.c:10205:3: note: '?' condition is false
                   if (filter->path.dentry) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/events/core.c:10205:20: note: Field 'dentry' is non-null
                   if (filter->path.dentry) {
                                    ^
   kernel/events/core.c:10205:3: note: '?' condition is true
                   if (filter->path.dentry) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   kernel/events/core.c:10205:3: note: Taking true branch
                   if (filter->path.dentry) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/events/core.c:10213:35: note: Passing null pointer value via 2nd =
parameter 'mm'
                           perf_addr_filter_apply(filter, mm, &event->addr_=
filter_ranges[count]);
                                                          ^~
   kernel/events/core.c:10213:4: note: Calling 'perf_addr_filter_apply'
                           perf_addr_filter_apply(filter, mm, &event->addr_=
filter_ranges[count]);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10166:13: note: Dereference of null pointer
           for (vma =3D mm->mmap; vma; vma =3D vma->vm_next) {
                      ^~~~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/ecryptfs/inode.c:933:4: warning: Value stored to 'rc' is never read [=
clang-analyzer-deadcode.DeadStores]
                           rc =3D 0;
                           ^    ~
   fs/ecryptfs/inode.c:933:4: note: Value stored to 'rc' is never read
                           rc =3D 0;
                           ^    ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/ecryptfs/main.c:401:3: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(mount_crypt_stat->global_default_fn_cipher_name,
                   ^~~~~~
   fs/ecryptfs/main.c:401:3: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
                   strcpy(mount_crypt_stat->global_default_fn_cipher_name,
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> fs/ecryptfs/crypto.c:346:2: warning: Potential leak of memory pointed to=
 by 'req' [clang-analyzer-unix.Malloc]
           return rc;
           ^
   fs/ecryptfs/crypto.c:514:9: note: Assuming the condition is false
           BUG_ON(!(crypt_stat->flags & ECRYPTFS_ENCRYPTED));
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ecryptfs/crypto.c:514:2: note: '?' condition is false
           BUG_ON(!(crypt_stat->flags & ECRYPTFS_ENCRYPTED));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ecryptfs/crypto.c:514:2: note: '?' condition is false
           BUG_ON(!(crypt_stat->flags & ECRYPTFS_ENCRYPTED));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/ecryptfs/crypto.c:514:2: note: Taking false branch
           BUG_ON(!(crypt_stat->flags & ECRYPTFS_ENCRYPTED));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ecryptfs/crypto.c:514:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!(crypt_stat->flags & ECRYPTFS_ENCRYPTED));
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/ecryptfs/crypto.c:521:6: note: Assuming 'rc' is >=3D 0
           if (rc < 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ecryptfs/crypto.c:521:2: note: '?' condition is false
           if (rc < 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ecryptfs/crypto.c:521:6: note: 'rc' is >=3D 0
           if (rc < 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/ecryptfs/crypto.c:521:2: note: '?' condition is false
           if (rc < 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/ntfs/mft.c:1817:2: note: Taking true branch
           if (IS_ERR(mrec)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ntfs/mft.c:1820:3: note: Control jumps to line 1953
                   goto undo_alloc;
                   ^
   fs/ntfs/mft.c:1953:6: note: Assuming the condition is false
           if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ntfs/mft.c:1953:2: note: '?' condition is false
           if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ntfs/mft.c:1953:6: note: Assuming the condition is false
           if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/ntfs/mft.c:1953:2: note: '?' condition is false
           if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/ntfs/mft.c:1953:2: note: Taking false branch
           if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ntfs/mft.c:1958:6: note: Access to field 'attr' results in a derefere=
nce of a null pointer (loaded from variable 'ctx')
           a =3D ctx->attr;
               ^~~
   Suppressed 2 warnings (2 in non-user code).
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
   3 warnings generated.
>> fs/xfs/scrub/bmap.c:625:2: warning: Undefined or garbage value returned =
to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return error;
           ^      ~~~~~
   fs/xfs/scrub/bmap.c:582:26: note: Assuming 'whichfork' is not equal to 0
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(sc->ip, whichfork=
);
                                          ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/bmap.c:582:26: note: '?' condition is false
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(sc->ip, whichfork=
);
                                          ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^
   fs/xfs/scrub/bmap.c:582:26: note: Assuming 'whichfork' is equal to 1
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(sc->ip, whichfork=
);
                                          ^
   fs/xfs/libxfs/xfs_inode_fork.h:100:4: note: expanded from macro 'XFS_IFO=
RK_PTR'
                   ((w) =3D=3D XFS_ATTR_FORK ? \
                    ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/bmap.c:582:26: note: '?' condition is true
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(sc->ip, whichfork=
);
                                          ^
   fs/xfs/libxfs/xfs_inode_fork.h:100:4: note: expanded from macro 'XFS_IFO=
RK_PTR'
                   ((w) =3D=3D XFS_ATTR_FORK ? \
                    ^
   fs/xfs/scrub/bmap.c:586:2: note: 'error' declared without an initial val=
ue
           int                     error;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/bmap.c:588:6: note: Assuming the condition is false
           if (!xfs_has_rmapbt(sc->mp) ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/xfs/scrub/bmap.c:588:6: note: Left side of '||' is false
           if (!xfs_has_rmapbt(sc->mp) ||
               ^
   fs/xfs/scrub/bmap.c:589:6: note: 'whichfork' is not equal to 2
               whichfork =3D=3D XFS_COW_FORK ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/xfs/scrub/bmap.c:588:6: note: Left side of '||' is false
           if (!xfs_has_rmapbt(sc->mp) ||
               ^
   fs/xfs/scrub/bmap.c:588:2: note: Assuming the condition is true
           if (!xfs_has_rmapbt(sc->mp) ||
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/xfs/scrub/bmap.c:588:2: note: '?' condition is false
           if (!xfs_has_rmapbt(sc->mp) ||
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/xfs/scrub/bmap.c:588:6: note: Left side of '||' is false
           if (!xfs_has_rmapbt(sc->mp) ||
               ^
   fs/xfs/scrub/bmap.c:589:6: note: 'whichfork' is not equal to 2
               whichfork =3D=3D XFS_COW_FORK ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/xfs/scrub/bmap.c:588:6: note: Left side of '||' is false
           if (!xfs_has_rmapbt(sc->mp) ||
               ^
   fs/xfs/scrub/bmap.c:588:2: note: '?' condition is false
           if (!xfs_has_rmapbt(sc->mp) ||
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
--
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/cifs/misc.c:109:7: note: 'ret_buf' is non-null
           if (!ret_buf)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/cifs/misc.c:109:7: note: 'ret_buf' is non-null
           if (!ret_buf)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/cifs/misc.c:109:2: note: '?' condition is false
           if (!ret_buf)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/cifs/misc.c:109:2: note: Taking false branch
           if (!ret_buf)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/cifs/misc.c:112:6: note: Assuming field 'fid' is non-null
           if (!ret_buf->crfid.fid) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/cifs/misc.c:112:2: note: '?' condition is false
           if (!ret_buf->crfid.fid) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/cifs/misc.c:112:22: note: Field 'fid' is non-null
           if (!ret_buf->crfid.fid) {
                               ^
   fs/cifs/misc.c:112:22: note: Field 'fid' is non-null
   fs/cifs/misc.c:112:2: note: '?' condition is false
           if (!ret_buf->crfid.fid) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/cifs/misc.c:112:2: note: Taking false branch
           if (!ret_buf->crfid.fid) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/cifs/misc.c:119:2: note: The expression is an uninitialized value. Th=
e computed value will also be garbage
           ++ret_buf->tc_count;
           ^ ~~~~~~~~~~~~~~~~~
   fs/cifs/misc.c:420:4: warning: Value stored to 'pnotify' is never read [=
clang-analyzer-deadcode.DeadStores]
                           pnotify =3D (struct file_notify_information *)
                           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/misc.c:420:4: note: Value stored to 'pnotify' is never read
                           pnotify =3D (struct file_notify_information *)
                           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> arch/x86/kernel/cpu/sgx/main.c:80:2: warning: Address of stack memory as=
sociated with local variable 'dirty' is still referred to by the global var=
iable 'sgx_dirty_page_list' upon returning to the caller.  This will be a d=
angling reference [clang-analyzer-core.StackAddressEscape]
           list_splice(&dirty, dirty_page_list);
           ^
   arch/x86/kernel/cpu/sgx/main.c:424:2: note: Calling '__sgx_sanitize_page=
s'
           __sgx_sanitize_pages(&sgx_dirty_page_list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/sgx/main.c:58:9: note: Assuming the condition is fal=
se
           while (!list_empty(dirty_page_list)) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/sgx/main.c:58:2: note: Loop condition is false. Exec=
ution continues on line 80
           while (!list_empty(dirty_page_list)) {
           ^
   arch/x86/kernel/cpu/sgx/main.c:80:2: note: Address of stack memory assoc=
iated with local variable 'dirty' is still referred to by the global variab=
le 'sgx_dirty_page_list' upon returning to the caller.  This will be a dang=
ling reference
           list_splice(&dirty, dirty_page_list);
           ^
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
   4 warnings generated.
   fs/overlayfs/super.c:1807:2: warning: Value stored to 'err' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           err =3D -EINVAL;
           ^     ~~~~~~~
   fs/overlayfs/super.c:1807:2: note: Value stored to 'err' is never read
           err =3D -EINVAL;
           ^     ~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/overlayfs/namei.c:55:2: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, post);
           ^~~~~~
   fs/overlayfs/namei.c:55:2: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
           strcat(buf, post);
           ^~~~~~
   fs/overlayfs/namei.c:707:10: warning: 1st function call argument is an u=
ninitialized value [clang-analyzer-core.CallAndMessage]
           index =3D lookup_positive_unlocked(name.name, ofs->indexdir, nam=
e.len);
                   ^                        ~~~~~~~~~
   fs/overlayfs/namei.c:703:8: note: Calling 'ovl_get_index_name'
           err =3D ovl_get_index_name(ofs, origin, &name);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/namei.c:655:2: note: '?' condition is false
           if (IS_ERR(fh))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/overlayfs/namei.c:655:2: note: '?' condition is true
           if (IS_ERR(fh))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/overlayfs/namei.c:655:2: note: Taking true branch
           if (IS_ERR(fh))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/overlayfs/namei.c:656:3: note: Returning without writing to 'name->na=
me'
                   return PTR_ERR(fh);
                   ^
   fs/overlayfs/namei.c:703:8: note: Returning from 'ovl_get_index_name'
           err =3D ovl_get_index_name(ofs, origin, &name);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/namei.c:704:2: note: Assuming 'err' is 0
           if (err)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/char/agp/isoch.c:441:2: note: '?' condition is true
           if (isoch) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/char/agp/isoch.c:441:2: note: Taking true branch
           if (isoch) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/char/agp/isoch.c:443:3: note: Assuming 'ret' is not equal to 0
                   if (ret) {
                   ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/char/agp/isoch.c:443:3: note: '?' condition is false
                   if (ret) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/char/agp/isoch.c:443:7: note: 'ret' is not equal to 0
                   if (ret) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/char/agp/isoch.c:443:3: note: '?' condition is true
                   if (ret) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/char/agp/isoch.c:443:3: note: Taking true branch
                   if (ret) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/char/agp/isoch.c:444:4: note: Loop condition is false.  Exiting =
loop
                           dev_info(&td->dev, "something bad happened setti=
ng "
                           ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
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
   drivers/char/agp/isoch.c:451:55: note: Passing the value 0 via 3rd param=
eter 'ndevs'
           agp_3_5_nonisochronous_node_enable(bridge, dev_list, ndevs);
                                                                ^~~~~
   drivers/char/agp/isoch.c:451:2: note: Calling 'agp_3_5_nonisochronous_no=
de_enable'
           agp_3_5_nonisochronous_node_enable(bridge, dev_list, ndevs);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/agp/isoch.c:295:12: note: Division by zero
           mrq =3D trq / ndevs;
                 ~~~~^~~~~~~
>> drivers/char/agp/isoch.c:365:5: warning: Potential leak of memory pointe=
d to by 'cur' [clang-analyzer-unix.Malloc]
                                   if ((cur =3D kmalloc(sizeof(*cur), GFP_K=
ERNEL)) =3D=3D NULL) {
                                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   drivers/char/agp/isoch.c:329:6: note: Assuming 'isoch' is not equal to 0
           if (isoch =3D=3D 0) /* isoch xfers not available, bail out. */
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/char/agp/isoch.c:329:2: note: '?' condition is false
           if (isoch =3D=3D 0) /* isoch xfers not available, bail out. */
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/char/agp/isoch.c:329:6: note: 'isoch' is not equal to 0
           if (isoch =3D=3D 0) /* isoch xfers not available, bail out. */
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/char/agp/isoch.c:329:2: note: '?' condition is false
           if (isoch =3D=3D 0) /* isoch xfers not available, bail out. */
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/char/agp/isoch.c:329:2: note: Taking false branch
           if (isoch =3D=3D 0) /* isoch xfers not available, bail out. */
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/char/agp/isoch.c:336:6: note: Assuming the condition is false
           if ((dev_list =3D kmalloc(sizeof(*dev_list), GFP_KERNEL)) =3D=3D=
 NULL) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/char/agp/isoch.c:336:2: note: '?' condition is false
           if ((dev_list =3D kmalloc(sizeof(*dev_list), GFP_KERNEL)) =3D=3D=
 NULL) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/char/agp/isoch.c:336:6: note: Assuming the condition is false
           if ((dev_list =3D kmalloc(sizeof(*dev_list), GFP_KERNEL)) =3D=3D=
 NULL) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/char/agp/isoch.c:336:2: note: '?' condition is false
           if ((dev_list =3D kmalloc(sizeof(*dev_list), GFP_KERNEL)) =3D=3D=
 NULL) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
--
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/media/usb/dvb-usb-v2/af9015.c:144:24: warning: Value stored to '=
intf' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:144:24: note: Value stored to 'int=
f' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:270:24: warning: Value stored to '=
intf' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:270:24: note: Value stored to 'int=
f' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:342:24: warning: Value stored to '=
intf' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:342:24: note: Value stored to 'int=
f' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:542:24: warning: Value stored to '=
intf' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:542:24: note: Value stored to 'int=
f' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:556:24: warning: Value stored to '=
intf' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:556:24: note: Value stored to 'int=
f' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:923:24: warning: Value stored to '=
intf' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:923:24: note: Value stored to 'int=
f' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:1105:24: warning: Value stored to =
'intf' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:1105:24: note: Value stored to 'in=
tf' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:1298:24: warning: Value stored to =
'intf' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:1298:24: note: Value stored to 'in=
tf' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:1319:24: warning: Value stored to =
'intf' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:1319:24: note: Value stored to 'in=
tf' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:1398:24: warning: Value stored to =
'intf' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   drivers/media/usb/dvb-usb-v2/af9015.c:1398:24: note: Value stored to 'in=
tf' during its initialization is never read
           struct usb_interface *intf =3D d->intf;
                                 ^~~~   ~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> fs/hpfs/dnode.c:252:2: warning: Potential leak of memory pointed to by '=
nname' [clang-analyzer-unix.Malloc]
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/dnode.c:252:16: note: Memory is allocated
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:252:8: note: Assuming 'nname' is non-null
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:252:2: note: '?' condition is false
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:252:8: note: Assuming 'nname' is non-null
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/hpfs/dnode.c:252:2: note: '?' condition is false
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/hpfs/dnode.c:252:2: note: Potential leak of memory pointed to by 'nna=
me'
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
>> fs/hpfs/dnode.c:289:11: warning: Potential leak of memory pointed to by =
'nd' [clang-analyzer-unix.Malloc]
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                    ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/dnode.c:252:8: note: Assuming 'nname' is null
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:252:2: note: '?' condition is false
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:252:8: note: Assuming 'nname' is non-null
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/hpfs/dnode.c:252:2: note: '?' condition is false
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/hpfs/dnode.c:252:2: note: Taking false branch
           if (!(nname =3D kmalloc(256, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/dnode.c:257:6: note: Assuming 'namelen' is < 256
           if (namelen >=3D 256) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:257:2: note: '?' condition is false
           if (namelen >=3D 256) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:257:6: note: 'namelen' is < 256
           if (namelen >=3D 256) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/hpfs/dnode.c:257:2: note: '?' condition is false
           if (namelen >=3D 256) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
--
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:289:7: note: 'nd' is null
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/hpfs/dnode.c:289:2: note: '?' condition is true
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/hpfs/dnode.c:289:2: note: Taking true branch
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/dnode.c:289:22: note: Memory is allocated
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:289:17: note: Assuming 'nd' is non-null
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                          ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:289:11: note: '?' condition is false
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                    ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:289:17: note: Assuming 'nd' is non-null
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                          ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/hpfs/dnode.c:289:11: note: '?' condition is false
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                    ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/hpfs/dnode.c:289:11: note: Potential leak of memory pointed to by 'nd'
           if (!nd) if (!(nd =3D kmalloc(0x924, GFP_NOFS))) {
                    ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
>> fs/hpfs/dnode.c:496:2: warning: Potential leak of memory pointed to by '=
nde' [clang-analyzer-unix.Malloc]
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/dnode.c:444:2: note: Loop condition is true.  Entering loop body
           while (1) {
           ^
   fs/hpfs/dnode.c:445:3: note: Assuming field 'sb_chk' is 0
                   if (hpfs_sb(i->i_sb)->sb_chk)
                   ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:445:3: note: '?' condition is false
                   if (hpfs_sb(i->i_sb)->sb_chk)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:445:25: note: Field 'sb_chk' is 0
                   if (hpfs_sb(i->i_sb)->sb_chk)
                                         ^
   fs/hpfs/dnode.c:445:3: note: '?' condition is false
                   if (hpfs_sb(i->i_sb)->sb_chk)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/hpfs/dnode.c:445:3: note: Taking false branch
                   if (hpfs_sb(i->i_sb)->sb_chk)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/dnode.c:448:9: note: Assuming 'dnode' is non-null
                   if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) ret=
urn 0;
                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:448:3: note: '?' condition is false
                   if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) ret=
urn 0;
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:448:9: note: Assuming 'dnode' is non-null
                   if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) ret=
urn 0;
                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/hpfs/dnode.c:448:3: note: '?' condition is false
                   if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) ret=
urn 0;
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/hpfs/dnode.c:448:3: note: Taking false branch
                   if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) ret=
urn 0;
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:463:12: note: Field 'down' is 0
                   if (!de->down) break;
                            ^
   fs/hpfs/dnode.c:463:3: note: '?' condition is true
                   if (!de->down) break;
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/hpfs/dnode.c:463:3: note: Taking true branch
                   if (!de->down) break;
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/dnode.c:463:18: note:  Execution continues on line 467
                   if (!de->down) break;
                                  ^
   fs/hpfs/dnode.c:467:11: note: Assuming 'de' is non-null
           while (!(de =3D dnode_pre_last_de(dnode))) {
                    ^~
   fs/hpfs/dnode.c:467:2: note: Loop condition is false. Execution continue=
s on line 493
           while (!(de =3D dnode_pre_last_de(dnode))) {
           ^
   fs/hpfs/dnode.c:496:14: note: Memory is allocated
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:496:8: note: Assuming 'nde' is non-null
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:496:2: note: '?' condition is false
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:496:8: note: Assuming 'nde' is non-null
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/hpfs/dnode.c:496:2: note: '?' condition is false
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/hpfs/dnode.c:496:2: note: Potential leak of memory pointed to by 'nde'
           if (!(nde =3D kmalloc(le16_to_cpu(de->length), GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
>> fs/hpfs/dnode.c:610:3: warning: Potential leak of memory pointed to by '=
de_cp' [clang-analyzer-unix.Malloc]
                   if (!(de_cp =3D kmalloc(le16_to_cpu(de->length), GFP_NOF=
S))) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/dnode.c:528:2: note: Assuming the condition is false
           if (hpfs_stop_cycles(i->i_sb, dno, &c1, &c2, "delete_empty_dnode=
")) return;
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:528:2: note: '?' condition is false
           if (hpfs_stop_cycles(i->i_sb, dno, &c1, &c2, "delete_empty_dnode=
")) return;
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:528:2: note: Assuming the condition is true
           if (hpfs_stop_cycles(i->i_sb, dno, &c1, &c2, "delete_empty_dnode=
")) return;
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/hpfs/dnode.c:528:2: note: '?' condition is false
           if (hpfs_stop_cycles(i->i_sb, dno, &c1, &c2, "delete_empty_dnode=
")) return;
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/hpfs/dnode.c:528:2: note: Taking false branch
           if (hpfs_stop_cycles(i->i_sb, dno, &c1, &c2, "delete_empty_dnode=
")) return;
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/dnode.c:529:8: note: Assuming 'dnode' is non-null
           if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) return;
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/hpfs/dnode.c:529:2: note: '?' condition is false
           if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) return;
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/dnode.c:529:8: note: Assuming 'dnode' is non-null
           if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) return;
                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/hpfs/dnode.c:529:2: note: '?' condition is false
           if (!(dnode =3D hpfs_map_dnode(i->i_sb, dno, &qbh))) return;
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
--
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/leds/leds-blinkm.c:538:7: note: 'ret' is 0
                   if (ret)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/leds/leds-blinkm.c:538:3: note: '?' condition is false
                   if (ret)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/leds/leds-blinkm.c:538:3: note: Taking false branch
                   if (ret)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/leds/leds-blinkm.c:541:9: note: Calling 'blinkm_read'
                   ret =3D blinkm_read(client, BLM_GET_ADDR, tmpargs);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:320:14: note: Assuming 'i' is >=3D 'retlen'
           for (i =3D 0; i < retlen; i++) {
                       ^~~~~~~~~~
   drivers/leds/leds-blinkm.c:320:2: note: Loop condition is false. Executi=
on continues on line 328
           for (i =3D 0; i < retlen; i++) {
           ^
   drivers/leds/leds-blinkm.c:328:2: note: Returning without writing to '*a=
rg'
           return 0;
           ^
   drivers/leds/leds-blinkm.c:541:9: note: Returning from 'blinkm_read'
                   ret =3D blinkm_read(client, BLM_GET_ADDR, tmpargs);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:542:3: note: '?' condition is false
                   if (ret)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/leds/leds-blinkm.c:542:7: note: 'ret' is 0
                   if (ret)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/leds/leds-blinkm.c:542:3: note: '?' condition is false
                   if (ret)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/leds/leds-blinkm.c:542:3: note: Taking false branch
                   if (ret)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/leds/leds-blinkm.c:545:18: note: The left operand of '=3D=3D' is=
 a garbage value
                   if (tmpargs[0] =3D=3D 0x09)
                                  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> fs/hpfs/ea.c:54:2: warning: Potential leak of memory pointed to by 'ret'=
 [clang-analyzer-unix.Malloc]
           if (!(ret =3D kmalloc(size + 1, GFP_NOFS))) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:71:4: note: expanded from macro '__trace_if_val=
ue'
                   (__if_trace.miss_hit[0]++,0);           \
                    ^
   fs/hpfs/ea.c:138:29: note: Assuming 'ea' is < 'ea_end'
           for (ea =3D fnode_ea(fnode); ea < ea_end; ea =3D next_ea(ea))
                                      ^~~~~~~~~~~
   fs/hpfs/ea.c:138:2: note: Loop condition is true.  Entering loop body
           for (ea =3D fnode_ea(fnode); ea < ea_end; ea =3D next_ea(ea))
           ^
   fs/hpfs/ea.c:139:3: note: '?' condition is false
                   if (!strcmp(ea->name, key)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/ea.c:139:7: note: Assuming the condition is false
                   if (!strcmp(ea->name, key)) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/hpfs/ea.c:139:3: note: '?' condition is false
                   if (!strcmp(ea->name, key)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/hpfs/ea.c:139:3: note: Taking false branch
                   if (!strcmp(ea->name, key)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/hpfs/ea.c:138:29: note: Assuming 'ea' is < 'ea_end'
           for (ea =3D fnode_ea(fnode); ea < ea_end; ea =3D next_ea(ea))
                                      ^~~~~~~~~~~
   fs/hpfs/ea.c:138:2: note: Loop condition is true.  Entering loop body
           for (ea =3D fnode_ea(fnode); ea < ea_end; ea =3D next_ea(ea))
           ^
   fs/hpfs/ea.c:139:3: note: '?' condition is false
                   if (!strcmp(ea->name, key)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/hpfs/ea.c:139:7: note: Assuming the condition is false
                   if (!strcmp(ea->name, key)) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/hpfs/ea.c:139:3: note: '?' condition is false
                   if (!strcmp(ea->name, key)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/hpfs/ea.c:139:3: note: Taking false branch
                   if (!strcmp(ea->name, key)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/memstick/host/rtsx_pci_ms.c:373:2: note: Taking true branch
           if (req->need_card_int) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/memstick/host/rtsx_pci_ms.c:374:3: note: '?' condition is true
                   dev_dbg(ms_dev(host), "int_reg: 0x%02x\n", int_reg);
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/memstick/host/rtsx_pci_ms.c:374:3: note: Taking false branch
                   dev_dbg(ms_dev(host), "int_reg: 0x%02x\n", int_reg);
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/memstick/host/rtsx_pci_ms.c:376:15: note: The left operand of '&=
' is a garbage value
                   if (int_reg & MS_INT_CMDNK)
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/memstick/host/rtsx_pci_ms.c:451:4: warning: Value stored to 'err=
' is never read [clang-analyzer-deadcode.DeadStores]
                           err =3D ms_power_on(host);
                           ^     ~~~~~~~~~~~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:451:4: note: Value stored to 'err' i=
s never read
                           err =3D ms_power_on(host);
                           ^     ~~~~~~~~~~~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:453:4: warning: Value stored to 'err=
' is never read [clang-analyzer-deadcode.DeadStores]
                           err =3D ms_power_off(host);
                           ^     ~~~~~~~~~~~~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:453:4: note: Value stored to 'err' i=
s never read
                           err =3D ms_power_off(host);
                           ^     ~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:597:3: warning: Value stored=
 to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D mxl111sf_i2c_send_data(state, 0, buf);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:597:3: note: Value stored to=
 'ret' is never read
                   ret =3D mxl111sf_i2c_send_data(state, 0, buf);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:617:3: warning: Value stored=
 to 'index' is never read [clang-analyzer-deadcode.DeadStores]
                   index =3D 0;
                   ^       ~
   drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:617:3: note: Value stored to=
 'index' is never read
                   index =3D 0;
                   ^       ~
   drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:634:4: warning: Value stored=
 to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D mxl111sf_i2c_get_data(state, 0, buf, i2c=
_r_data);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:634:4: note: Value stored to=
 'ret' is never read
                           ret =3D mxl111sf_i2c_get_data(state, 0, buf, i2c=
_r_data);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:709:4: warning: Value stored=
 to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D mxl111sf_i2c_get_data(state, 0, buf,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:709:4: note: Value stored to=
 'ret' is never read
                           ret =3D mxl111sf_i2c_get_data(state, 0, buf,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   7 warnings generated.
   drivers/media/usb/siano/smsusb.c:309:3: warning: Value stored to 'produc=
t_string' is never read [clang-analyzer-deadcode.DeadStores]
                   product_string =3D "none";
                   ^                ~~~~~~
   drivers/media/usb/siano/smsusb.c:309:3: note: Value stored to 'product_s=
tring' is never read
                   product_string =3D "none";
                   ^                ~~~~~~
>> drivers/media/usb/siano/smsusb.c:417:6: warning: Branch condition evalua=
tes to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (!dev->in_ep || !dev->out_ep || align < 0) {  /* Missing endp=
oints? */
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/usb/siano/smsusb.c:395:8: note: Calling 'kzalloc'
           dev =3D kzalloc(sizeof(struct smsusb_device_t), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Uninitialized value stored to field 'i=
n_ep'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/siano/smsusb.c:395:8: note: Returning from 'kzalloc'
           dev =3D kzalloc(sizeof(struct smsusb_device_t), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/siano/smsusb.c:396:6: note: Assuming 'dev' is non-null
           if (!dev)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/usb/siano/smsusb.c:396:2: note: '?' condition is false
           if (!dev)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/usb/siano/smsusb.c:396:7: note: 'dev' is non-null
           if (!dev)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/media/usb/siano/smsusb.c:396:2: note: '?' condition is false
           if (!dev)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/media/usb/siano/smsusb.c:396:2: note: Taking false branch
           if (!dev)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/usb/siano/smsusb.c:400:2: note: Calling 'usb_set_intfdata'
           usb_set_intfdata(intf, dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb.h:270:2: note: Calling 'dev_set_drvdata'
           dev_set_drvdata(&intf->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:692:1: note: Returning without writing to 'data->=
in_ep'
   }
   ^
   include/linux/usb.h:270:2: note: Returning from 'dev_set_drvdata'
           dev_set_drvdata(&intf->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb.h:271:1: note: Returning without writing to 'data->in_=
ep'
   }
   ^
   drivers/media/usb/siano/smsusb.c:400:2: note: Returning from 'usb_set_in=
tfdata'
           usb_set_intfdata(intf, dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/siano/smsusb.c:404:14: note: Assuming 'i' is >=3D fiel=
d 'bNumEndpoints'
           for (i =3D 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++)=
 {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/siano/smsusb.c:404:2: note: Loop condition is false. E=
xecution continues on line 416
           for (i =3D 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++)=
 {
           ^
   drivers/media/usb/siano/smsusb.c:416:2: note: '?' condition is true
           pr_debug("in_ep =3D %02x, out_ep =3D %02x\n", dev->in_ep, dev->o=
ut_ep);
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
   3 warnings generated.
   drivers/iio/adc/ti-tsc2046.c:334:9: warning: Division by zero [clang-ana=
lyzer-core.DivideZero]
           return DIV_ROUND_UP(val_normalized, valid_count);
                  ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                        ^
   drivers/iio/adc/ti-tsc2046.c:373:2: note: Calling 'tsc2046_adc_scan'
           tsc2046_adc_scan(indio_dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-tsc2046.c:345:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/iio/adc/ti-tsc2046.c:345:2: note: '?' condition is false
           if (ret < 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/iio/adc/ti-tsc2046.c:345:6: note: 'ret' is >=3D 0
           if (ret < 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/iio/adc/ti-tsc2046.c:345:2: note: '?' condition is false
           if (ret < 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/iio/adc/ti-tsc2046.c:345:2: note: Taking false branch
           if (ret < 0) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/iio/adc/ti-tsc2046.c:350:18: note: Assuming 'group' is < field '=
groups'
           for (group =3D 0; group < priv->groups; group++)
                           ^~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-tsc2046.c:350:2: note: Loop condition is true.  Enter=
ing loop body
           for (group =3D 0; group < priv->groups; group++)
           ^
   drivers/iio/adc/ti-tsc2046.c:351:32: note: Calling 'tsc2046_adc_get_val'
                   priv->scan_buf.data[group] =3D tsc2046_adc_get_val(priv,=
 group);
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/iio/adc/ti-tsc2046.c:327:2: note: Value assigned to 'valid_count'
           valid_count =3D l->count - l->skip;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-tsc2046.c:329:14: note: Assuming 'i' is >=3D 'valid_c=
ount'
           for (i =3D 0; i < valid_count; i++) {
                       ^~~~~~~~~~~~~~~
   drivers/iio/adc/ti-tsc2046.c:329:2: note: Loop condition is false. Execu=
tion continues on line 334
           for (i =3D 0; i < valid_count; i++) {
           ^
   drivers/iio/adc/ti-tsc2046.c:334:9: note: Division by zero
           return DIV_ROUND_UP(val_normalized, valid_count);
                  ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   Suppressed 2 warnings (2 in non-user code).
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
>> kernel/events/uprobes.c:1773:3: warning: The expression is an uninitiali=
zed value. The computed value will also be garbage [clang-analyzer-core.uni=
nitialized.Assign]
                   n_utask->depth++;
                   ^
   kernel/events/uprobes.c:1806:6: note: Assuming 'utask' is non-null
           if (!utask || !utask->return_instances)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/events/uprobes.c:1806:6: note: Left side of '||' is false
           if (!utask || !utask->return_instances)
               ^
   kernel/events/uprobes.c:1806:16: note: Assuming field 'return_instances'=
 is non-null
           if (!utask || !utask->return_instances)
                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/events/uprobes.c:1806:2: note: '?' condition is false
           if (!utask || !utask->return_instances)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/events/uprobes.c:1806:7: note: 'utask' is non-null
           if (!utask || !utask->return_instances)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   kernel/events/uprobes.c:1806:6: note: Left side of '||' is false
           if (!utask || !utask->return_instances)
               ^
   kernel/events/uprobes.c:1806:24: note: Field 'return_instances' is non-n=
ull
           if (!utask || !utask->return_instances)
                                 ^
   kernel/events/uprobes.c:1806:2: note: '?' condition is false
           if (!utask || !utask->return_instances)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   kernel/events/uprobes.c:1806:2: note: Taking false branch
           if (!utask || !utask->return_instances)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/events/uprobes.c:1809:6: note: Assuming 'mm' is not equal to fiel=
d 'mm'
           if (mm =3D=3D t->mm && !(flags & CLONE_VFORK))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/events/uprobes.c:1809:18: note: Left side of '&&' is false
           if (mm =3D=3D t->mm && !(flags & CLONE_VFORK))
                           ^
   kernel/events/uprobes.c:1809:2: note: '?' condition is false
           if (mm =3D=3D t->mm && !(flags & CLONE_VFORK))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/events/uprobes.c:1809:6: note: 'mm' is not equal to field 'mm'
           if (mm =3D=3D t->mm && !(flags & CLONE_VFORK))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
--
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/ext4/inode.c:6098:2: note: Taking true branch
           if (ext4_should_journal_data(inode))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inode.c:6099:3: note: Control jumps to line 6149
                   goto retry_alloc;
                   ^
   fs/ext4/inode.c:6151:2: note: '?' condition is false
           if (IS_ERR(handle)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/inode.c:6151:2: note: '?' condition is false
           if (IS_ERR(handle)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/ext4/inode.c:6151:2: note: Taking false branch
           if (IS_ERR(handle)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inode.c:6160:6: note: Assuming the condition is false
           if (!ext4_should_journal_data(inode)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ext4/inode.c:6160:2: note: '?' condition is false
           if (!ext4_should_journal_data(inode)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/inode.c:6160:6: note: Assuming the condition is true
           if (!ext4_should_journal_data(inode)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/ext4/inode.c:6160:2: note: '?' condition is true
           if (!ext4_should_journal_data(inode)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/ext4/inode.c:6160:2: note: Taking true branch
           if (!ext4_should_journal_data(inode)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inode.c:6161:9: note: 3rd function call argument is an uninitial=
ized value
                   err =3D block_page_mkwrite(vma, vmf, get_block);
                         ^                            ~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/media/usb/tm6000/tm6000-video.c:207:18: warning: Dereference of =
null pointer [clang-analyzer-core.NullDereference]
                                           linewidth =3D vbuf->vb.width << =
1;
                                                       ^~~~~~~~~~~~~~
   drivers/media/usb/tm6000/tm6000-video.c:119:28: note: Left side of '&&' =
is false
           struct tm6000_core *dev =3D container_of(dma_q, struct tm6000_co=
re, vidq);
                                     ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/usb/tm6000/tm6000-video.c:119:28: note: '?' condition is t=
rue
           struct tm6000_core *dev =3D container_of(dma_q, struct tm6000_co=
re, vidq);
                                     ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/usb/tm6000/tm6000-video.c:119:28: note: Left side of '&&' =
is false
           struct tm6000_core *dev =3D container_of(dma_q, struct tm6000_co=
re, vidq);
                                     ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/usb/tm6000/tm6000-video.c:119:28: note: Taking false branch
           struct tm6000_core *dev =3D container_of(dma_q, struct tm6000_co=
re, vidq);
                                     ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/media/usb/tm6000/tm6000-video.c:119:28: note: Loop condition is =
false.  Exiting loop
           struct tm6000_core *dev =3D container_of(dma_q, struct tm6000_co=
re, vidq);
                                     ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/media/usb/tm6000/tm6000-video.c:124:2: note: 'vbuf' initialized =
to a null pointer value
           struct tm6000_buffer *vbuf =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/tm6000/tm6000-video.c:128:6: note: Assuming field 'rad=
io' is not equal to 0
           if (!dev->radio) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/media/usb/tm6000/tm6000-video.c:128:2: note: '?' condition is fa=
lse
           if (!dev->radio) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/media/usb/tm6000/tm6000-video.c:128:12: note: Field 'radio' is n=
ot equal to 0
           if (!dev->radio) {
                     ^
   drivers/media/usb/tm6000/tm6000-video.c:128:2: note: '?' condition is fa=
lse
--
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/fc.c:2375:17: note: Field 'tagset' is null
           if (ctrl->ctrl.tagset) {
                          ^
   drivers/nvme/host/fc.c:2375:2: note: '?' condition is false
           if (ctrl->ctrl.tagset) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/nvme/host/fc.c:2375:2: note: Taking false branch
           if (ctrl->ctrl.tagset) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/fc.c:2381:2: note: Loop condition is false.  Exiting l=
oop
           spin_lock_irqsave(&ctrl->rport->lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/nvme/host/fc.c:2381:2: note: Loop condition is false.  Exiting l=
oop
           spin_lock_irqsave(&ctrl->rport->lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/nvme/host/fc.c:2396:2: note: Assuming field 'opts' is null
           if (ctrl->ctrl.opts)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/nvme/host/fc.c:2396:2: note: '?' condition is false
           if (ctrl->ctrl.opts)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/fc.c:2396:17: note: Field 'opts' is null
           if (ctrl->ctrl.opts)
                          ^
   drivers/nvme/host/fc.c:2396:2: note: '?' condition is false
           if (ctrl->ctrl.opts)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/nvme/host/fc.c:2396:2: note: Taking false branch
           if (ctrl->ctrl.opts)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/fc.c:2398:2: note: Memory is released
           kfree(ctrl);
           ^~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/nvme/host/fc.c:2404:2: note: Returning; memory was released
           kref_put(&ctrl->ref, nvme_fc_ctrl_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/fc.c:2754:3: note: Returning; memory was released via =
1st parameter
                   nvme_fc_ctrl_put(ctrl);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/fc.c:2756:7: note: Use of memory after it is freed
                   if (ctrl->rport->remoteport.port_state =3D=3D FC_OBJSTAT=
E_ONLINE &&
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
>> drivers/nvme/host/fc.c:3799:9: warning: Assigned value is garbage or und=
efined [clang-analyzer-core.uninitialized.Assign]
                   lport =3D rport->lport;
                         ^ ~~~~~~~~~~~~
   drivers/nvme/host/fc.c:3761:2: note: Loop condition is false.  Exiting l=
oop
           spin_lock_irqsave(&nvme_fc_lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/nvme/host/fc.c:3761:2: note: Loop condition is false.  Exiting l=
oop
           spin_lock_irqsave(&nvme_fc_lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/nvme/host/fc.c:3763:2: note: Left side of '&&' is false
           list_for_each_entry(lport, &nvme_fc_lport_list, port_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/nvme/host/fc.c:3763:2: note: '?' condition is true
           list_for_each_entry(lport, &nvme_fc_lport_list, port_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/nvme/host/fc.c:3763:2: note: Left side of '&&' is false
           list_for_each_entry(lport, &nvme_fc_lport_list, port_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/nvme/host/fc.c:3763:2: note: Taking false branch
           list_for_each_entry(lport, &nvme_fc_lport_list, port_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/nvme/host/fc.c:3763:2: note: Loop condition is false.  Exiting l=
oop
           list_for_each_entry(lport, &nvme_fc_lport_list, port_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
--
                                                                           ^
   include/linux/list.h:113:2: note: Loop condition is false.  Exiting loop
           WRITE_ONCE(prev->next, next);
           ^
   include/asm-generic/rwonce.h:58:33: note: expanded from macro 'WRITE_ONC=
E'
   #define WRITE_ONCE(x, val)                                              \
                                                                           ^
   include/linux/list.h:135:2: note: Returning from '__list_del'
           __list_del(entry->prev, entry->next);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:146:2: note: Returning from '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3050:4: note: Returning from 'list_del'
                           list_del(&r10_bio->retry_list);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:3051:4: note: Assuming field 'degraded' is 0
                           if (mddev->degraded)
                           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/raid10.c:3051:4: note: '?' condition is false
                           if (mddev->degraded)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/raid10.c:3051:15: note: Field 'degraded' is 0
                           if (mddev->degraded)
                                      ^
   drivers/md/raid10.c:3051:4: note: '?' condition is false
                           if (mddev->degraded)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/md/raid10.c:3051:4: note: Taking false branch
                           if (mddev->degraded)
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/raid10.c:3054:4: note: '?' condition is false
                           if (test_bit(R10BIO_WriteError,
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/raid10.c:3054:4: note: Assuming the condition is false
                           if (test_bit(R10BIO_WriteError,
                           ^
   include/linux/compiler.h:56:44: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/md/raid10.c:3054:4: note: '?' condition is false
                           if (test_bit(R10BIO_WriteError,
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/md/raid10.c:3054:4: note: Taking false branch
                           if (test_bit(R10BIO_WriteError,
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/raid10.c:3057:4: note: Calling 'raid_end_bio_io'
                           raid_end_bio_io(r10_bio);
                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/raid10.c:294:2: note: Assigned value is garbage or undefined
           struct bio *bio =3D r10_bio->master_bio;
           ^                 ~~~~~~~~~~~~~~~~~~~
>> drivers/md/raid10.c:406:21: warning: Access to field 'bitmap' results in=
 a dereference of an undefined pointer value (loaded from field 'mddev') [c=
lang-analyzer-core.NullDereference]
           md_bitmap_endwrite(r10_bio->mddev->bitmap, r10_bio->sector,
                              ^
   drivers/md/raid10.c:3036:50: note: Left side of '&&' is false
           if (!list_empty_careful(&conf->bio_end_io_list) &&
                                                           ^
   drivers/md/raid10.c:3036:2: note: '?' condition is false
           if (!list_empty_careful(&conf->bio_end_io_list) &&
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/raid10.c:3036:6: note: Left side of '&&' is true
           if (!list_empty_careful(&conf->bio_end_io_list) &&
               ^
   drivers/md/raid10.c:3036:2: note: Assuming the condition is true
           if (!list_empty_careful(&conf->bio_end_io_list) &&
           ^
   include/linux/compiler.h:56:44: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/md/raid10.c:3036:2: note: '?' condition is true
           if (!list_empty_careful(&conf->bio_end_io_list) &&
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/md/raid10.c:3036:2: note: Taking true branch
           if (!list_empty_careful(&conf->bio_end_io_list) &&
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/raid10.c:3039:3: note: Loop condition is false.  Exiting loop
                   spin_lock_irqsave(&conf->device_lock, flags);
                   ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/md/raid10.c:3039:3: note: Loop condition is false.  Exiting loop
                   spin_lock_irqsave(&conf->device_lock, flags);
                   ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/md/raid10.c:3040:3: note: '?' condition is false
                   if (!test_bit(MD_SB_CHANGE_PENDING, &mddev->sb_flags)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/raid10.c:3040:3: note: Assuming the condition is false
                   if (!test_bit(MD_SB_CHANGE_PENDING, &mddev->sb_flags)) {
                   ^
   include/linux/compiler.h:56:44: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/md/raid10.c:3040:3: note: '?' condition is false
                   if (!test_bit(MD_SB_CHANGE_PENDING, &mddev->sb_flags)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/md/raid10.c:3040:3: note: Taking false branch
                   if (!test_bit(MD_SB_CHANGE_PENDING, &mddev->sb_flags)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +/outbuf +400 security/keys/dh.c

f1c316a3ab9d24 Stephan Mueller 2016-08-19  226  =

f1c316a3ab9d24 Stephan Mueller 2016-08-19  227  long __keyctl_dh_compute(st=
ruct keyctl_dh_params __user *params,
f1c316a3ab9d24 Stephan Mueller 2016-08-19  228  			 char __user *buffer, si=
ze_t buflen,
f1c316a3ab9d24 Stephan Mueller 2016-08-19  229  			 struct keyctl_kdf_param=
s *kdfcopy)
ddbb4114872436 Mat Martineau   2016-04-12  230  {
ddbb4114872436 Mat Martineau   2016-04-12  231  	long ret;
7cbe0932c2f201 Mat Martineau   2017-06-08  232  	ssize_t dlen;
7cbe0932c2f201 Mat Martineau   2017-06-08  233  	int secretlen;
7cbe0932c2f201 Mat Martineau   2017-06-08  234  	int outlen;
ddbb4114872436 Mat Martineau   2016-04-12  235  	struct keyctl_dh_params pc=
opy;
7cbe0932c2f201 Mat Martineau   2017-06-08  236  	struct dh dh_inputs;
7cbe0932c2f201 Mat Martineau   2017-06-08  237  	struct scatterlist outsg;
7cbe0932c2f201 Mat Martineau   2017-06-08  238  	struct dh_completion compl;
7cbe0932c2f201 Mat Martineau   2017-06-08  239  	struct crypto_kpp *tfm;
7cbe0932c2f201 Mat Martineau   2017-06-08  240  	struct kpp_request *req;
7cbe0932c2f201 Mat Martineau   2017-06-08  241  	uint8_t *secret;
7cbe0932c2f201 Mat Martineau   2017-06-08  242  	uint8_t *outbuf;
f1c316a3ab9d24 Stephan Mueller 2016-08-19  243  	struct kdf_sdesc *sdesc =
=3D NULL;
ddbb4114872436 Mat Martineau   2016-04-12  244  =

ddbb4114872436 Mat Martineau   2016-04-12  245  	if (!params || (!buffer &&=
 buflen)) {
ddbb4114872436 Mat Martineau   2016-04-12  246  		ret =3D -EINVAL;
7cbe0932c2f201 Mat Martineau   2017-06-08  247  		goto out1;
ddbb4114872436 Mat Martineau   2016-04-12  248  	}
ddbb4114872436 Mat Martineau   2016-04-12  249  	if (copy_from_user(&pcopy,=
 params, sizeof(pcopy)) !=3D 0) {
ddbb4114872436 Mat Martineau   2016-04-12  250  		ret =3D -EFAULT;
7cbe0932c2f201 Mat Martineau   2017-06-08  251  		goto out1;
ddbb4114872436 Mat Martineau   2016-04-12  252  	}
ddbb4114872436 Mat Martineau   2016-04-12  253  =

f1c316a3ab9d24 Stephan Mueller 2016-08-19  254  	if (kdfcopy) {
f1c316a3ab9d24 Stephan Mueller 2016-08-19  255  		char *hashname;
f1c316a3ab9d24 Stephan Mueller 2016-08-19  256  =

4f9dabfaf8df97 Eric Biggers    2017-07-13  257  		if (memchr_inv(kdfcopy->_=
_spare, 0, sizeof(kdfcopy->__spare))) {
4f9dabfaf8df97 Eric Biggers    2017-07-13  258  			ret =3D -EINVAL;
4f9dabfaf8df97 Eric Biggers    2017-07-13  259  			goto out1;
4f9dabfaf8df97 Eric Biggers    2017-07-13  260  		}
4f9dabfaf8df97 Eric Biggers    2017-07-13  261  =

f1c316a3ab9d24 Stephan Mueller 2016-08-19  262  		if (buflen > KEYCTL_KDF_M=
AX_OUTPUT_LEN ||
f1c316a3ab9d24 Stephan Mueller 2016-08-19  263  		    kdfcopy->otherinfolen=
 > KEYCTL_KDF_MAX_OI_LEN) {
f1c316a3ab9d24 Stephan Mueller 2016-08-19  264  			ret =3D -EMSGSIZE;
7cbe0932c2f201 Mat Martineau   2017-06-08  265  			goto out1;
f1c316a3ab9d24 Stephan Mueller 2016-08-19  266  		}
f1c316a3ab9d24 Stephan Mueller 2016-08-19  267  =

f1c316a3ab9d24 Stephan Mueller 2016-08-19  268  		/* get KDF name string */
f1c316a3ab9d24 Stephan Mueller 2016-08-19  269  		hashname =3D strndup_user=
(kdfcopy->hashname, CRYPTO_MAX_ALG_NAME);
f1c316a3ab9d24 Stephan Mueller 2016-08-19  270  		if (IS_ERR(hashname)) {
f1c316a3ab9d24 Stephan Mueller 2016-08-19  271  			ret =3D PTR_ERR(hashname=
);
7cbe0932c2f201 Mat Martineau   2017-06-08  272  			goto out1;
f1c316a3ab9d24 Stephan Mueller 2016-08-19  273  		}
f1c316a3ab9d24 Stephan Mueller 2016-08-19  274  =

f1c316a3ab9d24 Stephan Mueller 2016-08-19  275  		/* allocate KDF from the =
kernel crypto API */
f1c316a3ab9d24 Stephan Mueller 2016-08-19  276  		ret =3D kdf_alloc(&sdesc,=
 hashname);
f1c316a3ab9d24 Stephan Mueller 2016-08-19  277  		kfree(hashname);
f1c316a3ab9d24 Stephan Mueller 2016-08-19  278  		if (ret)
7cbe0932c2f201 Mat Martineau   2017-06-08  279  			goto out1;
4693fc734d675c Stephan Mueller 2016-05-26  280  	}
4693fc734d675c Stephan Mueller 2016-05-26  281  =

7cbe0932c2f201 Mat Martineau   2017-06-08  282  	memset(&dh_inputs, 0, size=
of(dh_inputs));
ddbb4114872436 Mat Martineau   2016-04-12  283  =

7cbe0932c2f201 Mat Martineau   2017-06-08  284  	dlen =3D dh_data_from_key(=
pcopy.prime, &dh_inputs.p);
7cbe0932c2f201 Mat Martineau   2017-06-08  285  	if (dlen < 0) {
7cbe0932c2f201 Mat Martineau   2017-06-08  286  		ret =3D dlen;
7cbe0932c2f201 Mat Martineau   2017-06-08  287  		goto out1;
7cbe0932c2f201 Mat Martineau   2017-06-08  288  	}
7cbe0932c2f201 Mat Martineau   2017-06-08  289  	dh_inputs.p_size =3D dlen;
ddbb4114872436 Mat Martineau   2016-04-12  290  =

7cbe0932c2f201 Mat Martineau   2017-06-08  291  	dlen =3D dh_data_from_key(=
pcopy.base, &dh_inputs.g);
7cbe0932c2f201 Mat Martineau   2017-06-08  292  	if (dlen < 0) {
7cbe0932c2f201 Mat Martineau   2017-06-08  293  		ret =3D dlen;
7cbe0932c2f201 Mat Martineau   2017-06-08  294  		goto out2;
ddbb4114872436 Mat Martineau   2016-04-12  295  	}
7cbe0932c2f201 Mat Martineau   2017-06-08  296  	dh_inputs.g_size =3D dlen;
ddbb4114872436 Mat Martineau   2016-04-12  297  =

8c0f9f5b309d62 Lubomir Rintel  2018-09-24  298  	dlen =3D dh_data_from_key(=
pcopy.private, &dh_inputs.key);
7cbe0932c2f201 Mat Martineau   2017-06-08  299  	if (dlen < 0) {
7cbe0932c2f201 Mat Martineau   2017-06-08  300  		ret =3D dlen;
7cbe0932c2f201 Mat Martineau   2017-06-08  301  		goto out2;
ddbb4114872436 Mat Martineau   2016-04-12  302  	}
7cbe0932c2f201 Mat Martineau   2017-06-08  303  	dh_inputs.key_size =3D dle=
n;
ddbb4114872436 Mat Martineau   2016-04-12  304  =

7cbe0932c2f201 Mat Martineau   2017-06-08  305  	secretlen =3D crypto_dh_ke=
y_len(&dh_inputs);
7cbe0932c2f201 Mat Martineau   2017-06-08  306  	secret =3D kmalloc(secretl=
en, GFP_KERNEL);
7cbe0932c2f201 Mat Martineau   2017-06-08  307  	if (!secret) {
ddbb4114872436 Mat Martineau   2016-04-12  308  		ret =3D -ENOMEM;
7cbe0932c2f201 Mat Martineau   2017-06-08  309  		goto out2;
7cbe0932c2f201 Mat Martineau   2017-06-08  310  	}
7cbe0932c2f201 Mat Martineau   2017-06-08  311  	ret =3D crypto_dh_encode_k=
ey(secret, secretlen, &dh_inputs);
7cbe0932c2f201 Mat Martineau   2017-06-08  312  	if (ret)
7cbe0932c2f201 Mat Martineau   2017-06-08  313  		goto out3;
7cbe0932c2f201 Mat Martineau   2017-06-08  314  =

85d7311f1908b9 Eric Biggers    2018-06-30  315  	tfm =3D crypto_alloc_kpp("=
dh", 0, 0);
7cbe0932c2f201 Mat Martineau   2017-06-08  316  	if (IS_ERR(tfm)) {
7cbe0932c2f201 Mat Martineau   2017-06-08  317  		ret =3D PTR_ERR(tfm);
7cbe0932c2f201 Mat Martineau   2017-06-08  318  		goto out3;
7cbe0932c2f201 Mat Martineau   2017-06-08  319  	}
7cbe0932c2f201 Mat Martineau   2017-06-08  320  =

7cbe0932c2f201 Mat Martineau   2017-06-08  321  	ret =3D crypto_kpp_set_sec=
ret(tfm, secret, secretlen);
7cbe0932c2f201 Mat Martineau   2017-06-08  322  	if (ret)
7cbe0932c2f201 Mat Martineau   2017-06-08  323  		goto out4;
7cbe0932c2f201 Mat Martineau   2017-06-08  324  =

7cbe0932c2f201 Mat Martineau   2017-06-08  325  	outlen =3D crypto_kpp_maxs=
ize(tfm);
7cbe0932c2f201 Mat Martineau   2017-06-08  326  =

7cbe0932c2f201 Mat Martineau   2017-06-08  327  	if (!kdfcopy) {
7cbe0932c2f201 Mat Martineau   2017-06-08  328  		/*
7cbe0932c2f201 Mat Martineau   2017-06-08  329  		 * When not using a KDF, =
buflen 0 is used to read the
7cbe0932c2f201 Mat Martineau   2017-06-08  330  		 * required buffer length
7cbe0932c2f201 Mat Martineau   2017-06-08  331  		 */
7cbe0932c2f201 Mat Martineau   2017-06-08  332  		if (buflen =3D=3D 0) {
7cbe0932c2f201 Mat Martineau   2017-06-08  333  			ret =3D outlen;
7cbe0932c2f201 Mat Martineau   2017-06-08  334  			goto out4;
7cbe0932c2f201 Mat Martineau   2017-06-08  335  		} else if (outlen > bufle=
n) {
7cbe0932c2f201 Mat Martineau   2017-06-08  336  			ret =3D -EOVERFLOW;
7cbe0932c2f201 Mat Martineau   2017-06-08  337  			goto out4;
7cbe0932c2f201 Mat Martineau   2017-06-08  338  		}
ddbb4114872436 Mat Martineau   2016-04-12  339  	}
ddbb4114872436 Mat Martineau   2016-04-12  340  =

7cbe0932c2f201 Mat Martineau   2017-06-08  341  	outbuf =3D kzalloc(kdfcopy=
 ? (outlen + kdfcopy->otherinfolen) : outlen,
f1c316a3ab9d24 Stephan Mueller 2016-08-19  342  			 GFP_KERNEL);
7cbe0932c2f201 Mat Martineau   2017-06-08  343  	if (!outbuf) {
ddbb4114872436 Mat Martineau   2016-04-12  344  		ret =3D -ENOMEM;
7cbe0932c2f201 Mat Martineau   2017-06-08  345  		goto out4;
ddbb4114872436 Mat Martineau   2016-04-12  346  	}
ddbb4114872436 Mat Martineau   2016-04-12  347  =

7cbe0932c2f201 Mat Martineau   2017-06-08  348  	sg_init_one(&outsg, outbuf=
, outlen);
7cbe0932c2f201 Mat Martineau   2017-06-08  349  =

7cbe0932c2f201 Mat Martineau   2017-06-08  350  	req =3D kpp_request_alloc(=
tfm, GFP_KERNEL);
7cbe0932c2f201 Mat Martineau   2017-06-08  351  	if (!req) {
7cbe0932c2f201 Mat Martineau   2017-06-08  352  		ret =3D -ENOMEM;
7cbe0932c2f201 Mat Martineau   2017-06-08  353  		goto out5;
7cbe0932c2f201 Mat Martineau   2017-06-08  354  	}
7cbe0932c2f201 Mat Martineau   2017-06-08  355  =

7cbe0932c2f201 Mat Martineau   2017-06-08  356  	kpp_request_set_input(req,=
 NULL, 0);
7cbe0932c2f201 Mat Martineau   2017-06-08  357  	kpp_request_set_output(req=
, &outsg, outlen);
7cbe0932c2f201 Mat Martineau   2017-06-08  358  	init_completion(&compl.com=
pletion);
7cbe0932c2f201 Mat Martineau   2017-06-08  359  	kpp_request_set_callback(r=
eq, CRYPTO_TFM_REQ_MAY_BACKLOG |
7cbe0932c2f201 Mat Martineau   2017-06-08  360  				 CRYPTO_TFM_REQ_MAY_SLE=
EP,
7cbe0932c2f201 Mat Martineau   2017-06-08  361  				 dh_crypto_done, &compl=
);
7cbe0932c2f201 Mat Martineau   2017-06-08  362  =

7cbe0932c2f201 Mat Martineau   2017-06-08  363  	/*
7cbe0932c2f201 Mat Martineau   2017-06-08  364  	 * For DH, generate_public=
_key and generate_shared_secret are
7cbe0932c2f201 Mat Martineau   2017-06-08  365  	 * the same calculation
7cbe0932c2f201 Mat Martineau   2017-06-08  366  	 */
7cbe0932c2f201 Mat Martineau   2017-06-08  367  	ret =3D crypto_kpp_generat=
e_public_key(req);
7cbe0932c2f201 Mat Martineau   2017-06-08  368  	if (ret =3D=3D -EINPROGRES=
S) {
7cbe0932c2f201 Mat Martineau   2017-06-08  369  		wait_for_completion(&comp=
l.completion);
7cbe0932c2f201 Mat Martineau   2017-06-08  370  		ret =3D compl.err;
7cbe0932c2f201 Mat Martineau   2017-06-08  371  		if (ret)
7cbe0932c2f201 Mat Martineau   2017-06-08  372  			goto out6;
7cbe0932c2f201 Mat Martineau   2017-06-08  373  	}
7cbe0932c2f201 Mat Martineau   2017-06-08  374  =

7cbe0932c2f201 Mat Martineau   2017-06-08  375  	if (kdfcopy) {
f1c316a3ab9d24 Stephan Mueller 2016-08-19  376  		/*
f1c316a3ab9d24 Stephan Mueller 2016-08-19  377  		 * Concatenate SP800-56A =
otherinfo past DH shared secret -- the
f1c316a3ab9d24 Stephan Mueller 2016-08-19  378  		 * input to the KDF is (D=
H shared secret || otherinfo)
f1c316a3ab9d24 Stephan Mueller 2016-08-19  379  		 */
7cbe0932c2f201 Mat Martineau   2017-06-08  380  		if (copy_from_user(outbuf=
 + req->dst_len, kdfcopy->otherinfo,
f1c316a3ab9d24 Stephan Mueller 2016-08-19  381  				   kdfcopy->otherinfole=
n) !=3D 0) {
f1c316a3ab9d24 Stephan Mueller 2016-08-19  382  			ret =3D -EFAULT;
7cbe0932c2f201 Mat Martineau   2017-06-08  383  			goto out6;
f1c316a3ab9d24 Stephan Mueller 2016-08-19  384  		}
f1c316a3ab9d24 Stephan Mueller 2016-08-19  385  =

7cbe0932c2f201 Mat Martineau   2017-06-08  386  		ret =3D keyctl_dh_compute=
_kdf(sdesc, buffer, buflen, outbuf,
7cbe0932c2f201 Mat Martineau   2017-06-08  387  					    req->dst_len + kdf=
copy->otherinfolen,
7cbe0932c2f201 Mat Martineau   2017-06-08  388  					    outlen - req->dst_=
len);
7cbe0932c2f201 Mat Martineau   2017-06-08  389  	} else if (copy_to_user(bu=
ffer, outbuf, req->dst_len) =3D=3D 0) {
7cbe0932c2f201 Mat Martineau   2017-06-08  390  		ret =3D req->dst_len;
f1c316a3ab9d24 Stephan Mueller 2016-08-19  391  	} else {
ddbb4114872436 Mat Martineau   2016-04-12  392  		ret =3D -EFAULT;
f1c316a3ab9d24 Stephan Mueller 2016-08-19  393  	}
ddbb4114872436 Mat Martineau   2016-04-12  394  =

7cbe0932c2f201 Mat Martineau   2017-06-08  395  out6:
7cbe0932c2f201 Mat Martineau   2017-06-08  396  	kpp_request_free(req);
7cbe0932c2f201 Mat Martineau   2017-06-08  397  out5:
453431a54934d9 Waiman Long     2020-08-06  398  	kfree_sensitive(outbuf);
7cbe0932c2f201 Mat Martineau   2017-06-08  399  out4:
7cbe0932c2f201 Mat Martineau   2017-06-08 @400  	crypto_free_kpp(tfm);
7cbe0932c2f201 Mat Martineau   2017-06-08  401  out3:
453431a54934d9 Waiman Long     2020-08-06  402  	kfree_sensitive(secret);
7cbe0932c2f201 Mat Martineau   2017-06-08  403  out2:
7cbe0932c2f201 Mat Martineau   2017-06-08  404  	dh_free_data(&dh_inputs);
7cbe0932c2f201 Mat Martineau   2017-06-08  405  out1:
f1c316a3ab9d24 Stephan Mueller 2016-08-19  406  	kdf_dealloc(sdesc);
ddbb4114872436 Mat Martineau   2016-04-12  407  	return ret;
ddbb4114872436 Mat Martineau   2016-04-12  408  }
f1c316a3ab9d24 Stephan Mueller 2016-08-19  409  =


:::::: The code at line 400 was first introduced by commit
:::::: 7cbe0932c2f2014d6e24e716e79ea3910b468950 KEYS: Convert KEYCTL_DH_COM=
PUTE to use the crypto KPP API

:::::: TO: Mat Martineau <mathew.j.martineau@linux.intel.com>
:::::: CC: James Morris <james.l.morris@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0467092882904518602==--

