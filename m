Content-Type: multipart/mixed; boundary="===============2958307664225961065=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mtd/maps/ck804xrom.c:234:3: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or p...
Date: Wed, 27 Apr 2022 13:27:30 +0800
Message-ID: <202204271303.1vqsH7Pb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2958307664225961065==
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
head:   46cf2c613f4b10eb12f749207b0fd2c1bfae3088
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   6 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-c007-20220425 (https://download.01.org/0day-ci/ar=
chive/20220427/202204271303.1vqsH7Pb-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
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
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memstick/host/jmb38x_ms.c:308:17: note: Field 'long_data' is 0
           if (host->req->long_data) {
                          ^
   drivers/memstick/host/jmb38x_ms.c:308:2: note: Taking false branch
           if (host->req->long_data) {
           ^
   drivers/memstick/host/jmb38x_ms.c:316:2: note: Loop condition is true.  =
Entering loop body
           while (length) {
           ^
   drivers/memstick/host/jmb38x_ms.c:317:3: note: 'p_off' declared without =
an initial value
                   unsigned int p_off;
                   ^~~~~~~~~~~~~~~~~~
   drivers/memstick/host/jmb38x_ms.c:319:18: note: Field 'long_data' is 0
                   if (host->req->long_data) {
                                  ^
   drivers/memstick/host/jmb38x_ms.c:319:3: note: Taking false branch
                   if (host->req->long_data) {
                   ^
   drivers/memstick/host/jmb38x_ms.c:333:18: note: Field 'data_dir' is equa=
l to WRITE
                   if (host->req->data_dir =3D=3D WRITE)
                                  ^
   drivers/memstick/host/jmb38x_ms.c:333:3: note: Taking true branch
                   if (host->req->data_dir =3D=3D WRITE)
                   ^
   drivers/memstick/host/jmb38x_ms.c:334:13: note: '?' condition is false
                           t_size =3D !(host->cmd_flags & REG_DATA)
                                    ^
   drivers/memstick/host/jmb38x_ms.c:342:7: note: Assuming field 'long_data=
' is not equal to 0
                   if (host->req->long_data) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/memstick/host/jmb38x_ms.c:342:3: note: Taking true branch
                   if (host->req->long_data) {
                   ^
   drivers/memstick/host/jmb38x_ms.c:343:4: note: Taking false branch
                           kunmap_atomic(buf - p_off);
                           ^
   include/linux/highmem-internal.h:245:2: note: expanded from macro 'kunma=
p_atomic'
           BUILD_BUG_ON(__same_type((__addr), struct page *));     \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/memstick/host/jmb38x_ms.c:343:4: note: Loop condition is false. =
 Exiting loop
                           kunmap_atomic(buf - p_off);
                           ^
   include/linux/highmem-internal.h:245:2: note: expanded from macro 'kunma=
p_atomic'
           BUILD_BUG_ON(__same_type((__addr), struct page *));     \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/memstick/host/jmb38x_ms.c:343:22: note: The right operand of '-'=
 is a garbage value
                           kunmap_atomic(buf - p_off);
                                             ^
   include/linux/highmem-internal.h:246:18: note: expanded from macro 'kunm=
ap_atomic'
           __kunmap_atomic(__addr);                                \
                           ^~~~~~
   drivers/memstick/host/jmb38x_ms.c:866:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(host->host_id, sizeof(host->host_id), DRIVER_NAME ":slo=
t%d",
           ^~~~~~~~
   drivers/memstick/host/jmb38x_ms.c:866:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(host->host_id, sizeof(host->host_id), DRIVER_NAME ":slo=
t%d",
           ^~~~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/mtd/maps/ck804xrom.c:225:3: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(map, 0, sizeof(*map));
                   ^~~~~~
   drivers/mtd/maps/ck804xrom.c:225:3: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
                   memset(map, 0, sizeof(*map));
                   ^~~~~~
>> drivers/mtd/maps/ck804xrom.c:234:3: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                   sprintf(map->map_name, "%s @%08Lx",
                   ^~~~~~~
   drivers/mtd/maps/ck804xrom.c:234:3: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
                   sprintf(map->map_name, "%s @%08Lx",
                   ^~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/mtd/devices/docg3.c:1315:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, oobsrc, DOC_LAYOUT_OOB_PAGEINFO_SZ);
           ^~~~~~
   drivers/mtd/devices/docg3.c:1315:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(dst, oobsrc, DOC_LAYOUT_OOB_PAGEINFO_SZ);
           ^~~~~~
   drivers/mtd/devices/docg3.c:1353:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(docg3->oob_write_buf, ops->oobbuf, DOC_LAYOUT_OOB=
_SIZE);
                   ^~~~~~
   drivers/mtd/devices/docg3.c:1353:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(docg3->oob_write_buf, ops->oobbuf, DOC_LAYOUT_OOB=
_SIZE);
                   ^~~~~~
   drivers/mtd/devices/docg3.c:1430:3: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(oob, 0, sizeof(oob));
                   ^~~~~~
   drivers/mtd/devices/docg3.c:1430:3: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
                   memset(oob, 0, sizeof(oob));
                   ^~~~~~
   drivers/mtd/devices/docg3.c:1432:4: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(oob, docg3->oob_write_buf, DOC_LAYOUT_OOB=
_SIZE);
                           ^~~~~~
   drivers/mtd/devices/docg3.c:1432:4: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                           memcpy(oob, docg3->oob_write_buf, DOC_LAYOUT_OOB=
_SIZE);
                           ^~~~~~
   drivers/mtd/devices/docg3.c:1436:4: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(oob, oobbuf, DOC_LAYOUT_OOB_SIZE);
                           ^~~~~~
   drivers/mtd/devices/docg3.c:1436:4: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                           memcpy(oob, oobbuf, DOC_LAYOUT_OOB_SIZE);
                           ^~~~~~
   drivers/mtd/devices/docg3.c:1480:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !(dps0 & DOC_DPS_KEY_OK));
                  ^~~~~~~
   drivers/mtd/devices/docg3.c:1480:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !(dps0 & DOC_DPS_KEY_OK));
                  ^~~~~~~
   drivers/mtd/devices/docg3.c:1495:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !(dps1 & DOC_DPS_KEY_OK));
                  ^~~~~~~
   drivers/mtd/devices/docg3.c:1495:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !(dps1 & DOC_DPS_KEY_OK));
                  ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   89 warnings generated.
   net/sunrpc/addr.c:40:10: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, buflen, "::");
                          ^~~~~~~~
   net/sunrpc/addr.c:40:10: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, buflen, "::");
                          ^~~~~~~~
   net/sunrpc/addr.c:48:10: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, buflen, "::1");
                          ^~~~~~~~
   net/sunrpc/addr.c:48:10: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, buflen, "::1");
                          ^~~~~~~~
   net/sunrpc/addr.c:57:10: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, buflen, "::ffff:%pI4",
                          ^~~~~~~~
   net/sunrpc/addr.c:57:10: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, buflen, "::ffff:%pI4",
                          ^~~~~~~~
   net/sunrpc/addr.c:63:9: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, buflen, "%pI6c", addr);
                  ^~~~~~~~
   net/sunrpc/addr.c:63:9: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           return snprintf(buf, buflen, "%pI6c", addr);
                  ^~~~~~~~
   net/sunrpc/addr.c:83:7: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           rc =3D snprintf(scopebuf, sizeof(scopebuf), "%c%u",
                ^~~~~~~~
   net/sunrpc/addr.c:83:7: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           rc =3D snprintf(scopebuf, sizeof(scopebuf), "%c%u",
                ^~~~~~~~
   net/sunrpc/addr.c:92:2: warning: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, scopebuf);
           ^~~~~~
   net/sunrpc/addr.c:92:2: note: Call to function 'strcat' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcat'. CWE-119
           strcat(buf, scopebuf);
--
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/block-group.c:391:2: note: Taking true branch
           if (refcount_dec_and_test(&ctl->count))
           ^
   fs/btrfs/block-group.c:392:3: note: Memory is released
                   kfree(ctl);
                   ^~~~~~~~~~
   fs/btrfs/block-group.c:3921:3: note: Returning; memory was released via =
1st parameter
                   btrfs_put_caching_control(caching_ctl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/block-group.c:3917:2: note: Loop condition is true.  Entering l=
oop body
           while (!list_empty(&info->caching_block_groups)) {
           ^
   fs/btrfs/block-group.c:3920:3: note: Calling 'list_del'
                   list_del(&caching_ctl->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
                       ^
   fs/btrfs/block-group.c:3917:2: note: Loop condition is true.  Entering l=
oop body
           while (!list_empty(&info->caching_block_groups)) {
           ^
   fs/btrfs/block-group.c:3921:3: note: Calling 'btrfs_put_caching_control'
                   btrfs_put_caching_control(caching_ctl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/block-group.c:391:2: note: Taking true branch
           if (refcount_dec_and_test(&ctl->count))
           ^
   fs/btrfs/block-group.c:392:3: note: Memory is released
                   kfree(ctl);
                   ^~~~~~~~~~
   fs/btrfs/block-group.c:3921:3: note: Returning; memory was released via =
1st parameter
                   btrfs_put_caching_control(caching_ctl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/block-group.c:3917:2: note: Loop condition is true.  Entering l=
oop body
           while (!list_empty(&info->caching_block_groups)) {
           ^
   fs/btrfs/block-group.c:3920:3: note: Calling 'list_del'
                   list_del(&caching_ctl->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 44 warnings (42 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   fs/cifs/link.c:84:7: warning: Call to function 'sscanf' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           rc =3D sscanf(buf, CIFS_MF_SYMLINK_LEN_FORMAT, &link_len);
                ^~~~~~
   fs/cifs/link.c:84:7: note: Call to function 'sscanf' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'sscanf_s' in case of C11
           rc =3D sscanf(buf, CIFS_MF_SYMLINK_LEN_FORMAT, &link_len);
                ^~~~~~
   fs/cifs/link.c:139:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf + ofs, link_str, link_len);
           ^~~~~~
   fs/cifs/link.c:139:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(buf + ofs, link_str, link_len);
           ^~~~~~
   Suppressed 67 warnings (67 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/greybus/interface.c:472:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:472:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:491:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:491:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:510:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:510:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:589:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           return sprintf(buf, "%s\n", gb_interface_type_string(intf));
                  ^~~~~~~
   drivers/greybus/interface.c:589:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           return sprintf(buf, "%s\n", gb_interface_type_string(intf));
                  ^~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
>> sound/pci/vx222/vx222.c:185:2: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           sprintf(card->longname, "%s at 0x%lx & 0x%lx, irq %i",
           ^~~~~~~
   sound/pci/vx222/vx222.c:185:2: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           sprintf(card->longname, "%s at 0x%lx & 0x%lx, irq %i",
           ^~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   sound/firewire/fcp.c:369:5: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(t->response_buffer, data,
                                   ^~~~~~
   sound/firewire/fcp.c:369:5: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                                   memcpy(t->response_buffer, data,
                                   ^~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   sound/firewire/amdtp-stream.c:952:13: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
                   desc->syt =3D syt;
                             ^
   sound/firewire/amdtp-stream.c:1281:6: note: Assuming field 'packet_index=
' is >=3D 0
           if (s->packet_index < 0)
               ^~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1281:2: note: Taking false branch
           if (s->packet_index < 0)
           ^
   sound/firewire/amdtp-stream.c:1288:9: note: Assuming 'offset' is < 'pack=
ets'
           while (offset < packets) {
                  ^~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1288:2: note: Loop condition is true.  Ent=
ering loop body
           while (offset < packets) {
           ^
   sound/firewire/amdtp-stream.c:1291:3: note: Taking true branch
                   if (compare_ohci_cycle_count(cycle, d->processing_cycle.=
tx_start) >=3D 0)
                   ^
   sound/firewire/amdtp-stream.c:1292:4: note:  Execution continues on line=
 1298
                           break;
                           ^
   sound/firewire/amdtp-stream.c:1300:6: note: 'offset' is <=3D 0
           if (offset > 0) {
               ^~~~~~
   sound/firewire/amdtp-stream.c:1300:2: note: Taking false branch
           if (offset > 0) {
           ^
   sound/firewire/amdtp-stream.c:1311:6: note: 'offset' is < 'packets'
           if (offset < packets) {
               ^~~~~~
   sound/firewire/amdtp-stream.c:1311:2: note: Taking true branch
           if (offset < packets) {
           ^
   sound/firewire/amdtp-stream.c:1315:3: note: Calling 'process_tx_packets'
                   process_tx_packets(context, tstamp, header_length, ctx_h=
eader, s);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   sound/firewire/amdtp-stream.c:1212:6: note: Assuming field 'packet_index=
' is >=3D 0
           if (s->packet_index < 0)
               ^~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1212:2: note: Taking false branch
           if (s->packet_index < 0)
           ^
   sound/firewire/amdtp-stream.c:1219:8: note: Calling 'generate_device_pkt=
_descs'
           err =3D generate_device_pkt_descs(s, s->pkt_descs, ctx_header, p=
ackets, &desc_count);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:903:14: note: Assuming 'i' is < 'packets'
           for (i =3D 0; i < packets; ++i) {
                       ^~~~~~~~~~~
   sound/firewire/amdtp-stream.c:903:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < packets; ++i) {
           ^
   sound/firewire/amdtp-stream.c:908:3: note: 'syt' declared without an ini=
tial value
                   unsigned int syt;
                   ^~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:911:11: note: Assuming 'next_cycle' is equ=
al to 'cycle'
                   lost =3D (next_cycle !=3D cycle);
                           ^~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:912:7: note: 'lost' is false
                   if (lost) {
                       ^~~~
   sound/firewire/amdtp-stream.c:912:3: note: Taking false branch
                   if (lost) {
                   ^
   sound/firewire/amdtp-stream.c:946:9: note: Calling 'parse_ir_ctx_header'
                   err =3D parse_ir_ctx_header(s, cycle, ctx_header, &data_=
blocks, &dbc, &syt,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:809:6: note: Assuming the condition is true
           if (!(s->flags & CIP_NO_HEADER))
--
               ^~~~~~
   sound/pci/asihpi/asihpi.c:910:10: note: Assuming 'a' is non-null
           WARN_ON(!a || !a->snd_card || !a->snd_card->private_data);
                   ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   sound/pci/asihpi/asihpi.c:910:10: note: Left side of '||' is false
           WARN_ON(!a || !a->snd_card || !a->snd_card->private_data);
                   ^
   sound/pci/asihpi/asihpi.c:910:16: note: Assuming field 'snd_card' is non=
-null
           WARN_ON(!a || !a->snd_card || !a->snd_card->private_data);
                         ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   sound/pci/asihpi/asihpi.c:910:10: note: Left side of '||' is false
           WARN_ON(!a || !a->snd_card || !a->snd_card->private_data);
                   ^
   sound/pci/asihpi/asihpi.c:910:32: note: Assuming field 'private_data' is=
 null
           WARN_ON(!a || !a->snd_card || !a->snd_card->private_data);
                                         ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   sound/pci/asihpi/asihpi.c:910:2: note: Taking true branch
           WARN_ON(!a || !a->snd_card || !a->snd_card->private_data);
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   sound/pci/asihpi/asihpi.c:910:2: note: Loop condition is false.  Exiting=
 loop
           WARN_ON(!a || !a->snd_card || !a->snd_card->private_data);
           ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:82:2: note: expanded from macro '__WARN_FLAGS'
           _BUG_FLAGS(ASM_UD2, f, ASM_REACHABLE);                  \
           ^
   arch/x86/include/asm/bug.h:25:43: note: expanded from macro '_BUG_FLAGS'
   #define _BUG_FLAGS(ins, flags, extra)                                   \
                                                                           ^
   sound/pci/asihpi/asihpi.c:910:2: note: Loop condition is false.  Exiting=
 loop
           WARN_ON(!a || !a->snd_card || !a->snd_card->private_data);
           ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:78:33: note: expanded from macro '__WARN_FLAG=
S'
   #define __WARN_FLAGS(flags)                                     \
                                                                   ^
   sound/pci/asihpi/asihpi.c:911:2: note: Null pointer value stored to 'asi=
hpi'
           asihpi =3D (struct snd_card_asihpi *)a->snd_card->private_data;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/asihpi/asihpi.c:912:6: note: Access to field 'llmode_streampri=
v' results in a dereference of a null pointer (loaded from variable 'asihpi=
')
           if (asihpi->llmode_streampriv)
               ^~~~~~
   sound/pci/asihpi/asihpi.c:965:3: warning: Value stored to 'err' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   err =3D hpi_sample_clock_get_sample_rate(h_control,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/asihpi/asihpi.c:965:3: note: Value stored to 'err' is never re=
ad
                   err =3D hpi_sample_clock_get_sample_rate(h_control,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/asihpi/asihpi.c:1012:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&snd_card_asihpi_playback, 0, sizeof(snd_card_asihpi_play=
back));
           ^~~~~~
   sound/pci/asihpi/asihpi.c:1012:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(&snd_card_asihpi_playback, 0, sizeof(snd_card_asihpi_play=
back));
           ^~~~~~
   sound/pci/asihpi/asihpi.c:1139:3: warning: Value stored to 'err' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   err =3D hpi_sample_clock_get_sample_rate(h_control,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/asihpi/asihpi.c:1139:3: note: Value stored to 'err' is never r=
ead
                   err =3D hpi_sample_clock_get_sample_rate(h_control,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/asihpi/asihpi.c:1185:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&snd_card_asihpi_capture, 0, sizeof(snd_card_asihpi_captu=
re));
           ^~~~~~
   sound/pci/asihpi/asihpi.c:1185:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(&snd_card_asihpi_capture, 0, sizeof(snd_card_asihpi_captu=
re));
           ^~~~~~
   sound/pci/asihpi/asihpi.c:1257:2: warning: Value stored to 'err' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           err =3D hpi_adapter_get_info(asihpi->hpi->adapter->index,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/asihpi/asihpi.c:1257:2: note: Value stored to 'err' is never r=
ead
           err =3D hpi_adapter_get_info(asihpi->hpi->adapter->index,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/asihpi/asihpi.c:1380:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(snd_control, 0, sizeof(*snd_control));
           ^~~~~~
   sound/pci/asihpi/asihpi.c:1380:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(snd_control, 0, sizeof(*snd_control));
           ^~~~~~
>> sound/pci/asihpi/asihpi.c:1401:3: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
                   sprintf(hpi_ctl->name, "%s %d %s %d %s%s",
                   ^~~~~~~
   sound/pci/asihpi/asihpi.c:1401:3: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
                   sprintf(hpi_ctl->name, "%s %d %s %d %s%s",
                   ^~~~~~~
   sound/pci/asihpi/asihpi.c:1408:3: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
                   sprintf(hpi_ctl->name, "%s %d %s%s",
                   ^~~~~~~
   sound/pci/asihpi/asihpi.c:1408:3: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
                   sprintf(hpi_ctl->name, "%s %d %s%s",
                   ^~~~~~~
   sound/pci/asihpi/asihpi.c:1413:3: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
                   sprintf(hpi_ctl->name, "%s %d %s%s",
                   ^~~~~~~
   sound/pci/asihpi/asihpi.c:1413:3: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
                   sprintf(hpi_ctl->name, "%s %d %s%s",
                   ^~~~~~~
   sound/pci/asihpi/asihpi.c:2152:2: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           sprintf(uinfo->value.enumerated.name, "%s %d",
           ^~~~~~~
   sound/pci/asihpi/asihpi.c:2152:2: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           sprintf(uinfo->value.enumerated.name, "%s %d",
           ^~~~~~~
   sound/pci/asihpi/asihpi.c:2331:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/asihpi/asihpi.c:2331:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/asihpi/asihpi.c:2562:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&prev_ctl, 0, sizeof(prev_ctl));
           ^~~~~~
   sound/pci/asihpi/asihpi.c:2562:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(&prev_ctl, 0, sizeof(prev_ctl));
           ^~~~~~
   sound/pci/asihpi/asihpi.c:2903:3: warning: Value stored to 'err' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   err =3D hpi_sample_clock_set_local_rate(
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/asihpi/asihpi.c:2903:3: note: Value stored to 'err' is never r=
ead
                   err =3D hpi_sample_clock_set_local_rate(
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/asihpi/asihpi.c:2914:2: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(card->shortname, "AudioScience ASI%4X",
           ^~~~~~~
   sound/pci/asihpi/asihpi.c:2914:2: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           sprintf(card->shortname, "AudioScience ASI%4X",
           ^~~~~~~
   sound/pci/asihpi/asihpi.c:2916:2: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           sprintf(card->longname, "%s %i",
           ^~~~~~~
   sound/pci/asihpi/asihpi.c:2916:2: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           sprintf(card->longname, "%s %i",
           ^~~~~~~
   Suppressed 32 warnings (31 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   sound/firewire/dice/dice-tcelectronic.c:93:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dice->tx_pcm_chs, entry->spec->tx_pcm_chs,
           ^~~~~~
   sound/firewire/dice/dice-tcelectronic.c:93:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dice->tx_pcm_chs, entry->spec->tx_pcm_chs,
           ^~~~~~
   sound/firewire/dice/dice-tcelectronic.c:95:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dice->rx_pcm_chs, entry->spec->rx_pcm_chs,
           ^~~~~~
   sound/firewire/dice/dice-tcelectronic.c:95:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dice->rx_pcm_chs, entry->spec->rx_pcm_chs,
           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   sound/firewire/dice/dice-alesis.c:36:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dice->tx_pcm_chs, alesis_io14_tx_pcm_chs,
                   ^~~~~~
   sound/firewire/dice/dice-alesis.c:36:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dice->tx_pcm_chs, alesis_io14_tx_pcm_chs,
                   ^~~~~~
   sound/firewire/dice/dice-alesis.c:40:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dice->tx_pcm_chs, alesis_io26_tx_pcm_chs,
                   ^~~~~~
   sound/firewire/dice/dice-alesis.c:40:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dice->tx_pcm_chs, alesis_io26_tx_pcm_chs,
                   ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   fs/ext4/xattr.c:368:3: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy((char *)buf + blocksize * i, bhs[i]->b_data,
                   ^~~~~~
   fs/ext4/xattr.c:368:3: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                   memcpy((char *)buf + blocksize * i, bhs[i]->b_data,
--
           ^
   sound/pci/hda/patch_ca0132.c:2413:7: note: Dereference of null pointer (=
loaded from variable 'reply_len')
                   if (*reply_len < ret_size*sizeof(unsigned int)) {
                       ^~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2424:4: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(reply, scp_reply.data, *reply_len);
                           ^~~~~~
   sound/pci/hda/patch_ca0132.c:2424:4: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(reply, scp_reply.data, *reply_len);
                           ^~~~~~
   sound/pci/hda/patch_ca0132.c:2592:29: warning: The left operand of '&' i=
s a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return ((dma_chnlstart_reg & (1 <<
                                      ^
   sound/pci/hda/patch_ca0132.c:2608:2: note: Taking false branch
           codec_dbg(codec, "-- dsp_dma_setup_common() -- Begin ---------\n=
");
           ^
   sound/pci/hda/hda_local.h:735:2: note: expanded from macro 'codec_dbg'
           dev_dbg(hda_codec_dev(codec), fmt, ##args)
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   sound/pci/hda/patch_ca0132.c:2608:2: note: Loop condition is false.  Exi=
ting loop
           codec_dbg(codec, "-- dsp_dma_setup_common() -- Begin ---------\n=
");
           ^
   sound/pci/hda/hda_local.h:735:2: note: expanded from macro 'codec_dbg'
           dev_dbg(hda_codec_dev(codec), fmt, ##args)
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   sound/pci/hda/patch_ca0132.c:2610:6: note: Assuming 'dma_chan' is < DSPD=
MAC_DMA_CFG_CHANNEL_COUNT
           if (dma_chan >=3D DSPDMAC_DMA_CFG_CHANNEL_COUNT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2610:2: note: Taking false branch
           if (dma_chan >=3D DSPDMAC_DMA_CFG_CHANNEL_COUNT) {
           ^
   sound/pci/hda/patch_ca0132.c:2615:6: note: Calling 'dsp_is_dma_active'
           if (dsp_is_dma_active(codec, dma_chan)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2588:2: note: 'dma_chnlstart_reg' declared =
without an initial value
           unsigned int dma_chnlstart_reg;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2590:2: note: Calling 'chipio_read'
           chipio_read(codec, DSPDMAC_CHNLSTART_INST_OFFSET, &dma_chnlstart=
_reg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   sound/pci/hda/patch_ca0132.c:1750:6: note: 'err' is < 0
           if (err < 0)
               ^~~
   sound/pci/hda/patch_ca0132.c:1750:2: note: Taking true branch
           if (err < 0)
           ^
   sound/pci/hda/patch_ca0132.c:1751:3: note: Control jumps to line 1758
                   goto exit;
                   ^
   sound/pci/hda/patch_ca0132.c:1759:2: note: Returning without writing to =
'*data'
           return err;
           ^
   sound/pci/hda/patch_ca0132.c:2590:2: note: Returning from 'chipio_read'
           chipio_read(codec, DSPDMAC_CHNLSTART_INST_OFFSET, &dma_chnlstart=
_reg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   sound/pci/hda/patch_ca0132.c:2592:29: note: The left operand of '&' is a=
 garbage value
           return ((dma_chnlstart_reg & (1 <<
                    ~~~~~~~~~~~~~~~~~ ^
   sound/pci/hda/patch_ca0132.c:3090:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dma->dmab->area, data, count);
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:3090:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dma->dmab->area, data, count);
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:4879:3: warning: Value stored to 'err' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   err =3D ca0132_alt_surround_set_bass_redirection(codec,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:4879:3: note: Value stored to 'err' is neve=
r read
                   err =3D ca0132_alt_surround_set_bass_redirection(codec,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:4882:3: warning: Value stored to 'err' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   err =3D ca0132_alt_surround_set_bass_redirection(codec, =
0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:4882:3: note: Value stored to 'err' is neve=
r read
                   err =3D ca0132_alt_surround_set_bass_redirection(codec, =
0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/pci/hda/patch_ca0132.c:5786:2: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           sprintf(namestr, "%d %s", (uinfo->value.enumerated.item * 10), s=
fx);
           ^~~~~~~
   sound/pci/hda/patch_ca0132.c:5786:2: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           sprintf(namestr, "%d %s", (uinfo->value.enumerated.item * 10), s=
fx);
           ^~~~~~~
   sound/pci/hda/patch_ca0132.c:5787:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name, namestr);
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:5787:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name, namestr);
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:5838:2: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           sprintf(namestr, "%s %s",
           ^~~~~~~
   sound/pci/hda/patch_ca0132.c:5838:2: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           sprintf(namestr, "%s %s",
           ^~~~~~~
   sound/pci/hda/patch_ca0132.c:5841:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name, namestr);
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:5841:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name, namestr);
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:5892:2: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           sprintf(namestr, "%s",
           ^~~~~~~
   sound/pci/hda/patch_ca0132.c:5892:2: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           sprintf(namestr, "%s",
           ^~~~~~~
   sound/pci/hda/patch_ca0132.c:5894:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name, namestr);
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:5894:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name, namestr);
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:5943:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:5943:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:5995:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:5995:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:6046:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:6046:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:6099:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:6099:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:6163:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:6163:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:6220:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:6220:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/pci/hda/patch_ca0132.c:6649:2: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           sprintf(namestr, "FX: %s %s Volume", pfx, dirstr[dir]);
           ^~~~~~~
   sound/pci/hda/patch_ca0132.c:6649:2: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           sprintf(namestr, "FX: %s %s Volume", pfx, dirstr[dir]);
           ^~~~~~~
   sound/pci/hda/patch_ca0132.c:6688:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                   sprintf(namestr, "FX: %s %s Switch", pfx, dirstr[dir]);
                   ^~~~~~~
   sound/pci/hda/patch_ca0132.c:6688:3: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                   sprintf(namestr, "FX: %s %s Switch", pfx, dirstr[dir]);
                   ^~~~~~~
   sound/pci/hda/patch_ca0132.c:6690:3: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                   sprintf(namestr, "%s %s Switch", pfx, dirstr[dir]);
                   ^~~~~~~
   sound/pci/hda/patch_ca0132.c:6690:3: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                   sprintf(namestr, "%s %s Switch", pfx, dirstr[dir]);
                   ^~~~~~~
   sound/pci/hda/patch_ca0132.c:8622:22: warning: Value stored to 'spec' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ca0132_spec *spec =3D codec->spec;
                               ^~~~   ~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:8622:22: note: Value stored to 'spec' durin=
g its initialization is never read
           struct ca0132_spec *spec =3D codec->spec;
                               ^~~~   ~~~~~~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
                   ^~~~~~
   sound/pci/hda/patch_hdmi.c:383:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ucontrol->value.bytes.data, eld->eld_buffer,
                   ^~~~~~
   sound/pci/hda/patch_hdmi.c:509:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "eld#%d.%d", codec->addr, index);
           ^~~~~~~~
   sound/pci/hda/patch_hdmi.c:509:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "eld#%d.%d", codec->addr, index);
           ^~~~~~~~
   sound/pci/hda/patch_hdmi.c:676:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ai, 0, sizeof(ai));
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:676:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(&ai, 0, sizeof(ai));
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:1334:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(per_pin->mux_nids, spec->cvt_nids,
                   ^~~~~~
   sound/pci/hda/patch_hdmi.c:1334:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(per_pin->mux_nids, spec->cvt_nids,
                   ^~~~~~
   sound/pci/hda/patch_hdmi.c:1492:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(per_pin->chmap, 0, sizeof(per_pin->chmap));
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:1492:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(per_pin->chmap, 0, sizeof(per_pin->chmap));
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:1585:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(pin_eld->eld_buffer, eld->eld_buffer,
                           ^~~~~~
   sound/pci/hda/patch_hdmi.c:1585:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(pin_eld->eld_buffer, eld->eld_buffer,
                           ^~~~~~
   sound/pci/hda/patch_hdmi.c:1798:20: warning: Value stored to 'codec' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hda_codec *codec =3D per_pin->codec;
                             ^~~~~   ~~~~~~~~~~~~~~
   sound/pci/hda/patch_hdmi.c:1798:20: note: Value stored to 'codec' during=
 its initialization is never read
           struct hda_codec *codec =3D per_pin->codec;
                             ^~~~~   ~~~~~~~~~~~~~~
   sound/pci/hda/patch_hdmi.c:2041:26: warning: Value stored to 'runtime' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct snd_pcm_runtime *runtime =3D substream->runtime;
                                   ^~~~~~~   ~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_hdmi.c:2041:26: note: Value stored to 'runtime' duri=
ng its initialization is never read
           struct snd_pcm_runtime *runtime =3D substream->runtime;
                                   ^~~~~~~   ~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_hdmi.c:2175:3: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(per_pin->chmap, 0, sizeof(per_pin->chmap));
                   ^~~~~~
   sound/pci/hda/patch_hdmi.c:2175:3: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                   memset(per_pin->chmap, 0, sizeof(per_pin->chmap));
                   ^~~~~~
   sound/pci/hda/patch_hdmi.c:2218:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(chmap, per_pin->chmap, ARRAY_SIZE(per_pin->chmap));
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:2218:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(chmap, per_pin->chmap, ARRAY_SIZE(per_pin->chmap));
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:2232:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(per_pin->chmap, chmap, ARRAY_SIZE(per_pin->chmap));
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:2232:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(per_pin->chmap, chmap, ARRAY_SIZE(per_pin->chmap));
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:2309:3: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(hdmi_str + strlen(hdmi_str), ",pcm=3D%d", pcmdev=
);
                   ^~~~~~~
   sound/pci/hda/patch_hdmi.c:2309:3: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                   sprintf(hdmi_str + strlen(hdmi_str), ",pcm=3D%d", pcmdev=
);
                   ^~~~~~~
   sound/pci/hda/patch_hdmi.c:2312:3: warning: Call to function 'strncat' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncat_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncat(hdmi_str, " Phantom",
                   ^~~~~~~
   sound/pci/hda/patch_hdmi.c:2312:3: note: Call to function 'strncat' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncat_s' in case of C11
                   strncat(hdmi_str, " Phantom",
                   ^~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   Suppressed 77 warnings (77 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   88 warnings generated.
   net/ipv4/inet_fragment.c:547:5: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(&fp->rbnode, 0, sizeof(fp->rbnode=
));
                                   ^~~~~~
   net/ipv4/inet_fragment.c:547:5: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                                   memset(&fp->rbnode, 0, sizeof(fp->rbnode=
));
                                   ^~~~~~
   net/ipv4/inet_fragment.c:591:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&head->rbnode, 0, sizeof(head->rbnode));
           ^~~~~~
   net/ipv4/inet_fragment.c:591:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(&head->rbnode, 0, sizeof(head->rbnode));
           ^~~~~~
   Suppressed 86 warnings (86 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
>> sound/pci/aw2/aw2-alsa.c:288:2: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           sprintf(card->longname, "%s with SAA7146 irq %i",
           ^~~~~~~
   sound/pci/aw2/aw2-alsa.c:288:2: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           sprintf(card->longname, "%s with SAA7146 irq %i",
           ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   sound/pci/ctxfi/xfi.c:103:2: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(card->longname, sizeof(card->longname), "%s %s %s",
           ^~~~~~~~
   sound/pci/ctxfi/xfi.c:103:2: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
           snprintf(card->longname, sizeof(card->longname), "%s %s %s",
           ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   sound/pci/ctxfi/ctvmem.c:51:6: warning: Access to field 'size' results i=
n a dereference of an undefined pointer value (loaded from variable 'entry'=
) [clang-analyzer-core.NullDereference]
           if (entry->size =3D=3D size) {
               ^
   sound/pci/ctxfi/ctvmem.c:132:10: note: Calling 'get_vm_block'
           block =3D get_vm_block(vm, size, atc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctvmem.c:32:37: note: 'entry' declared without an initia=
l value
           struct ct_vm_block *block =3D NULL, *entry;
                                              ^~~~~
   sound/pci/ctxfi/ctvmem.c:36:6: note: Assuming 'size' is <=3D field 'size'
           if (size > vm->size) {
               ^~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctvmem.c:36:2: note: Taking false branch
           if (size > vm->size) {
           ^
   sound/pci/ctxfi/ctvmem.c:43:2: note: Loop condition is false. Execution =
continues on line 48
           list_for_each(pos, &vm->unused) {
           ^
   include/linux/list.h:580:2: note: expanded from macro 'list_for_each'
           for (pos =3D (head)->next; !list_is_head(pos, (head)); pos =3D p=
os->next)
           ^
   sound/pci/ctxfi/ctvmem.c:48:6: note: Assuming the condition is false
           if (pos =3D=3D &vm->unused)
               ^~~~~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctvmem.c:48:2: note: Taking false branch
           if (pos =3D=3D &vm->unused)
           ^
   sound/pci/ctxfi/ctvmem.c:51:6: note: Access to field 'size' results in a=
 dereference of an undefined pointer value (loaded from variable 'entry')
           if (entry->size =3D=3D size) {
               ^~~~~
   sound/pci/ctxfi/ctvmem.c:95:38: warning: Access to field 'addr' results =
in a dereference of an undefined pointer value (loaded from variable 'entry=
') [clang-analyzer-core.NullDereference]
                   if ((block->addr + block->size) =3D=3D entry->addr) {
                                                      ^
   sound/pci/ctxfi/ctvmem.c:155:2: note: Calling 'put_vm_block'
           put_vm_block(vm, block);
           ^~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctvmem.c:77:22: note: 'entry' declared without an initia=
l value
           struct ct_vm_block *entry, *pre_ent;
                               ^~~~~
   sound/pci/ctxfi/ctvmem.c:86:2: note: Loop condition is false. Execution =
continues on line 91
           list_for_each(pos, &vm->unused) {
           ^
   include/linux/list.h:580:2: note: expanded from macro 'list_for_each'
           for (pos =3D (head)->next; !list_is_head(pos, (head)); pos =3D p=
os->next)
           ^
   sound/pci/ctxfi/ctvmem.c:91:6: note: Assuming the condition is false
           if (pos =3D=3D &vm->unused) {
               ^~~~~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctvmem.c:91:2: note: Taking false branch
           if (pos =3D=3D &vm->unused) {
           ^
   sound/pci/ctxfi/ctvmem.c:95:38: note: Access to field 'addr' results in =
a dereference of an undefined pointer value (loaded from variable 'entry')
                   if ((block->addr + block->size) =3D=3D entry->addr) {
                                                      ^~~~~
   sound/pci/ctxfi/ctvmem.c:224:3: warning: Use of memory after it is freed=
 [clang-analyzer-unix.Malloc]
                   list_del(pos);
                   ^
   sound/pci/ctxfi/ctvmem.c:178:6: note: Assuming 'vm' is non-null
           if (!vm)
               ^~~
   sound/pci/ctxfi/ctvmem.c:178:2: note: Taking false branch
           if (!vm)
           ^
   sound/pci/ctxfi/ctvmem.c:181:2: note: Loop condition is false.  Exiting =
loop
           mutex_init(&vm->lock);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   sound/pci/ctxfi/ctvmem.c:184:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < CT_PTP_NUM; i++) {
           ^
   sound/pci/ctxfi/ctvmem.c:188:7: note: Assuming 'err' is < 0
                   if (err < 0)
                       ^~~~~~~
   sound/pci/ctxfi/ctvmem.c:188:3: note: Taking true branch
                   if (err < 0)
--
           ^~~~~~
   fs/cifs/smb2transport.c:310:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(key, 0x0, key_size);
           ^~~~~~
   fs/cifs/smb2transport.c:379:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(key, hashptr, key_size);
           ^~~~~~
   fs/cifs/smb2transport.c:379:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(key, hashptr, key_size);
           ^~~~~~
   fs/cifs/smb2transport.c:438:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ses->chans[0].signkey, ses->smb3signingkey,
                   ^~~~~~
   fs/cifs/smb2transport.c:438:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(ses->chans[0].signkey, ses->smb3signingkey,
                   ^~~~~~
   fs/cifs/smb2transport.c:442:3: warning: Value stored to 'rc' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   rc =3D generate_key(ses, ptriplet->encryption.label,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2transport.c:442:3: note: Value stored to 'rc' is never read
                   rc =3D generate_key(ses, ptriplet->encryption.label,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2transport.c:574:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(smb3_signature, 0x0, SMB2_CMACAES_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:574:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(smb3_signature, 0x0, SMB2_CMACAES_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:575:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(shdr->Signature, 0x0, SMB2_SIGNATURE_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:575:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(shdr->Signature, 0x0, SMB2_SIGNATURE_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:616:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(shdr->Signature, sigptr, SMB2_SIGNATURE_SIZE);
                   ^~~~~~
   fs/cifs/smb2transport.c:616:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(shdr->Signature, sigptr, SMB2_SIGNATURE_SIZE);
                   ^~~~~~
   fs/cifs/smb2transport.c:650:3: warning: Call to function 'strncpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(shdr->Signature, "BSRSPYL", 8);
                   ^~~~~~~
   fs/cifs/smb2transport.c:650:3: note: Call to function 'strncpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'strncpy_s' in case of C11
                   strncpy(shdr->Signature, "BSRSPYL", 8);
                   ^~~~~~~
   fs/cifs/smb2transport.c:688:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(server_response_sig, shdr->Signature, SMB2_SIGNATURE_SIZE=
);
           ^~~~~~
   fs/cifs/smb2transport.c:688:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(server_response_sig, shdr->Signature, SMB2_SIGNATURE_SIZE=
);
           ^~~~~~
   fs/cifs/smb2transport.c:690:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(shdr->Signature, 0, SMB2_SIGNATURE_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:690:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(shdr->Signature, 0, SMB2_SIGNATURE_SIZE);
           ^~~~~~
   fs/cifs/smb2transport.c:734:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(temp, 0, sizeof(struct mid_q_entry));
           ^~~~~~
   fs/cifs/smb2transport.c:734:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(temp, 0, sizeof(struct mid_q_entry));
           ^~~~~~
   Suppressed 67 warnings (67 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   sound/pci/hda/hda_intel.c:2009:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(card->longname, sizeof(card->longname),
           ^~~~~~~~
   sound/pci/hda/hda_intel.c:2009:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(card->longname, sizeof(card->longname),
           ^~~~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   sound/pci/korg1212/korg1212.c:1280:3: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset((void*) dst + offset, 0, size);
                   ^~~~~~
   sound/pci/korg1212/korg1212.c:1280:3: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                   memset((void*) dst + offset, 0, size);
                   ^~~~~~
   sound/pci/korg1212/korg1212.c:1314:4: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy((__force void *)dst, src, size);
                           ^~~~~~
   sound/pci/korg1212/korg1212.c:1314:4: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                           memcpy((__force void *)dst, src, size);
                           ^~~~~~
   sound/pci/korg1212/korg1212.c:1353:4: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(dst, (__force void *)src, size);
                           ^~~~~~
   sound/pci/korg1212/korg1212.c:1353:4: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(dst, (__force void *)src, size);
                           ^~~~~~
   sound/pci/korg1212/korg1212.c:2276:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(korg1212->dma_dsp->area, dsp_code->data, dsp_code->size);
           ^~~~~~
   sound/pci/korg1212/korg1212.c:2276:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(korg1212->dma_dsp->area, dsp_code->data, dsp_code->size);
           ^~~~~~
>> sound/pci/korg1212/korg1212.c:2362:2: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
           sprintf(card->longname, "%s at 0x%lx, irq %d", card->shortname,
           ^~~~~~~
   sound/pci/korg1212/korg1212.c:2362:2: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
           sprintf(card->longname, "%s at 0x%lx, irq %d", card->shortname,
           ^~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/md/dm.c:711:3: warning: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   format_dev_t(td->dm_dev.name, dev);
                   ^
   include/linux/kdev_t.h:19:3: note: expanded from macro 'format_dev_t'
                   sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev));       \
                   ^~~~~~~
   drivers/md/dm.c:711:3: note: Call to function 'sprintf' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'sprintf_s' in case of C11
                   format_dev_t(td->dm_dev.name, dev);
                   ^
   include/linux/kdev_t.h:19:3: note: expanded from macro 'format_dev_t'
                   sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev));       \
                   ^~~~~~~
   drivers/md/dm.c:1319:2: warning: Address of stack memory associated with=
 local variable 'flush_bio' is still referred to by the stack variable 'ci'=
 upon returning to the caller.  This will be a dangling reference [clang-an=
alyzer-core.StackAddressEscape]
           return 0;
           ^
   drivers/md/dm.c:1498:15: note: Assuming 'map' is non-null
           if (unlikely(!map)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/md/dm.c:1498:2: note: Taking false branch
           if (unlikely(!map)) {
           ^
   drivers/md/dm.c:1506:6: note: Assuming the condition is false
           if (unlikely(test_bit(DMF_BLOCK_IO_FOR_SUSPEND, &md->flags))) {
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm.c:1506:2: note: Taking false branch
           if (unlikely(test_bit(DMF_BLOCK_IO_FOR_SUSPEND, &md->flags))) {
           ^
   drivers/md/dm.c:1520:2: note: Taking false branch
           if (is_abnormal_io(bio))
           ^
   drivers/md/dm.c:1523:2: note: Calling '__split_and_process_bio'
           __split_and_process_bio(md, map, bio);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm.c:1456:6: note: Assuming the condition is true
           if (bio->bi_opf & REQ_PREFLUSH) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm.c:1456:2: note: Taking true branch
           if (bio->bi_opf & REQ_PREFLUSH) {
           ^
   drivers/md/dm.c:1457:11: note: Calling '__send_empty_flush'
                   error =3D __send_empty_flush(&ci);
                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm.c:1314:2: note: Taking false branch
           BUG_ON(bio_has_data(ci->bio));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/md/dm.c:1314:2: note: Loop condition is false.  Exiting loop
           BUG_ON(bio_has_data(ci->bio));
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/md/dm.c:1315:2: note: Loop condition is false. Execution continu=
es on line 1318
           while ((ti =3D dm_table_get_target(ci->map, target_nr++)))
           ^
   drivers/md/dm.c:1319:2: note: Address of stack memory associated with lo=
cal variable 'flush_bio' is still referred to by the stack variable 'ci' up=
on returning to the caller.  This will be a dangling reference
           return 0;
           ^
   drivers/md/dm.c:1704:2: warning: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(md->disk->disk_name, "dm-%d", minor);
           ^~~~~~~
   drivers/md/dm.c:1704:2: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
           sprintf(md->disk->disk_name, "dm-%d", minor);
           ^~~~~~~
   drivers/md/dm.c:1718:2: warning: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           format_dev_t(md->name, MKDEV(_major, minor));
           ^
   include/linux/kdev_t.h:19:3: note: expanded from macro 'format_dev_t'
                   sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev));       \
                   ^~~~~~~
   drivers/md/dm.c:1718:2: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
           format_dev_t(md->name, MKDEV(_major, minor));
           ^
   include/linux/kdev_t.h:19:3: note: expanded from macro 'format_dev_t'
                   sprintf(buffer, "%u:%u", MAJOR(dev), MINOR(dev));       \
                   ^~~~~~~
   drivers/md/dm.c:1846:3: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&md->geometry, 0, sizeof(md->geometry));
                   ^~~~~~
   drivers/md/dm.c:1846:3: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
                   memset(&md->geometry, 0, sizeof(md->geometry));

vim +234 drivers/mtd/maps/ck804xrom.c

90afffc8bd79d1 Dave Olsen             2006-11-06  114  =

90afffc8bd79d1 Dave Olsen             2006-11-06  115  =

e4106a7c8236eb Julia Lawall           2016-04-19  116  static int __init ck=
804xrom_init_one(struct pci_dev *pdev,
90afffc8bd79d1 Dave Olsen             2006-11-06  117  				     const struc=
t pci_device_id *ent)
90afffc8bd79d1 Dave Olsen             2006-11-06  118  {
90afffc8bd79d1 Dave Olsen             2006-11-06  119  	static char *rom_pr=
obe_types[] =3D { "cfi_probe", "jedec_probe", NULL };
90afffc8bd79d1 Dave Olsen             2006-11-06  120  	u8 byte;
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  121  	u16 word;
90afffc8bd79d1 Dave Olsen             2006-11-06  122  	struct ck804xrom_wi=
ndow *window =3D &ck804xrom_window;
90afffc8bd79d1 Dave Olsen             2006-11-06  123  	struct ck804xrom_ma=
p_info *map =3D NULL;
90afffc8bd79d1 Dave Olsen             2006-11-06  124  	unsigned long map_t=
op;
90afffc8bd79d1 Dave Olsen             2006-11-06  125  =

90afffc8bd79d1 Dave Olsen             2006-11-06  126  	/* Remember the pci=
 dev I find the window in */
90afffc8bd79d1 Dave Olsen             2006-11-06  127  	window->pdev =3D pc=
i_dev_get(pdev);
90afffc8bd79d1 Dave Olsen             2006-11-06  128  =

c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  129  	switch (ent->driver=
_data) {
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  130  	case DEV_CK804:
90afffc8bd79d1 Dave Olsen             2006-11-06  131  		/* Enable the sele=
cted rom window.  This is often incorrectly
90afffc8bd79d1 Dave Olsen             2006-11-06  132  		 * set up by the B=
IOS, and the 4MiB offset for the lock registers
90afffc8bd79d1 Dave Olsen             2006-11-06  133  		 * requires the fu=
ll 5MiB of window space.
90afffc8bd79d1 Dave Olsen             2006-11-06  134  		 *
90afffc8bd79d1 Dave Olsen             2006-11-06  135  		 * This 'write, th=
en read' approach leaves the bits for
90afffc8bd79d1 Dave Olsen             2006-11-06  136  		 * other uses of t=
he hardware info.
90afffc8bd79d1 Dave Olsen             2006-11-06  137  		 */
90afffc8bd79d1 Dave Olsen             2006-11-06  138  		pci_read_config_by=
te(pdev, 0x88, &byte);
90afffc8bd79d1 Dave Olsen             2006-11-06  139  		pci_write_config_b=
yte(pdev, 0x88, byte | win_size_bits );
90afffc8bd79d1 Dave Olsen             2006-11-06  140  =

90afffc8bd79d1 Dave Olsen             2006-11-06  141  		/* Assume the rom =
window is properly setup, and find it's size */
90afffc8bd79d1 Dave Olsen             2006-11-06  142  		pci_read_config_by=
te(pdev, 0x88, &byte);
90afffc8bd79d1 Dave Olsen             2006-11-06  143  =

90afffc8bd79d1 Dave Olsen             2006-11-06  144  		if ((byte & ((1<<7=
)|(1<<6))) =3D=3D ((1<<7)|(1<<6)))
90afffc8bd79d1 Dave Olsen             2006-11-06  145  			window->phys =3D =
0xffb00000; /* 5MiB */
90afffc8bd79d1 Dave Olsen             2006-11-06  146  		else if ((byte & (=
1<<7)) =3D=3D (1<<7))
90afffc8bd79d1 Dave Olsen             2006-11-06  147  			window->phys =3D =
0xffc00000; /* 4MiB */
90afffc8bd79d1 Dave Olsen             2006-11-06  148  		else
90afffc8bd79d1 Dave Olsen             2006-11-06  149  			window->phys =3D =
0xffff0000; /* 64KiB */
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  150  		break;
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  151  =

c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  152  	case DEV_MCP55:
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  153  		pci_read_config_by=
te(pdev, 0x88, &byte);
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  154  		pci_write_config_b=
yte(pdev, 0x88, byte | (win_size_bits & 0xff));
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  155  =

c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  156  		pci_read_config_by=
te(pdev, 0x8c, &byte);
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  157  		pci_write_config_b=
yte(pdev, 0x8c, byte | ((win_size_bits & 0xff00) >> 8));
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  158  =

c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  159  		pci_read_config_wo=
rd(pdev, 0x90, &word);
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  160  		pci_write_config_w=
ord(pdev, 0x90, word | ((win_size_bits & 0x7fff0000) >> 16));
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  161  =

c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  162  		window->phys =3D 0=
xff000000; /* 16MiB, hardcoded for now */
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  163  		break;
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  164  	}
90afffc8bd79d1 Dave Olsen             2006-11-06  165  =

90afffc8bd79d1 Dave Olsen             2006-11-06  166  	window->size =3D 0x=
ffffffffUL - window->phys + 1UL;
90afffc8bd79d1 Dave Olsen             2006-11-06  167  =

90afffc8bd79d1 Dave Olsen             2006-11-06  168  	/*
90afffc8bd79d1 Dave Olsen             2006-11-06  169  	 * Try to reserve t=
he window mem region.  If this fails then
90afffc8bd79d1 Dave Olsen             2006-11-06  170  	 * it is likely due=
 to a fragment of the window being
90afffc8bd79d1 Dave Olsen             2006-11-06  171  	 * "reserved" by th=
e BIOS.  In the case that the
90afffc8bd79d1 Dave Olsen             2006-11-06  172  	 * request_mem_regi=
on() fails then once the rom size is
90afffc8bd79d1 Dave Olsen             2006-11-06  173  	 * discovered we wi=
ll try to reserve the unreserved fragment.
90afffc8bd79d1 Dave Olsen             2006-11-06  174  	 */
90afffc8bd79d1 Dave Olsen             2006-11-06  175  	window->rsrc.name =
=3D MOD_NAME;
90afffc8bd79d1 Dave Olsen             2006-11-06  176  	window->rsrc.start =
=3D window->phys;
90afffc8bd79d1 Dave Olsen             2006-11-06  177  	window->rsrc.end   =
=3D window->phys + window->size - 1;
90afffc8bd79d1 Dave Olsen             2006-11-06  178  	window->rsrc.flags =
=3D IORESOURCE_MEM | IORESOURCE_BUSY;
90afffc8bd79d1 Dave Olsen             2006-11-06  179  	if (request_resourc=
e(&iomem_resource, &window->rsrc)) {
90afffc8bd79d1 Dave Olsen             2006-11-06  180  		window->rsrc.paren=
t =3D NULL;
90afffc8bd79d1 Dave Olsen             2006-11-06  181  		printk(KERN_ERR MO=
D_NAME
f9a5279c70af10 Joe Perches            2010-11-12  182  		       " %s(): Una=
ble to register resource %pR - kernel bug?\n",
f9a5279c70af10 Joe Perches            2010-11-12  183  			__func__, &window=
->rsrc);
90afffc8bd79d1 Dave Olsen             2006-11-06  184  	}
90afffc8bd79d1 Dave Olsen             2006-11-06  185  =

90afffc8bd79d1 Dave Olsen             2006-11-06  186  =

90afffc8bd79d1 Dave Olsen             2006-11-06  187  	/* Enable writes th=
rough the rom window */
90afffc8bd79d1 Dave Olsen             2006-11-06  188  	pci_read_config_byt=
e(pdev, 0x6d, &byte);
90afffc8bd79d1 Dave Olsen             2006-11-06  189  	pci_write_config_by=
te(pdev, 0x6d, byte | 1);
90afffc8bd79d1 Dave Olsen             2006-11-06  190  =

90afffc8bd79d1 Dave Olsen             2006-11-06  191  	/* FIXME handle reg=
isters 0x80 - 0x8C the bios region locks */
90afffc8bd79d1 Dave Olsen             2006-11-06  192  =

90afffc8bd79d1 Dave Olsen             2006-11-06  193  	/* For write access=
es caches are useless */
4bdc0d676a6431 Christoph Hellwig      2020-01-06  194  	window->virt =3D io=
remap(window->phys, window->size);
90afffc8bd79d1 Dave Olsen             2006-11-06  195  	if (!window->virt) {
90afffc8bd79d1 Dave Olsen             2006-11-06  196  		printk(KERN_ERR MO=
D_NAME ": ioremap(%08lx, %08lx) failed\n",
90afffc8bd79d1 Dave Olsen             2006-11-06  197  			window->phys, win=
dow->size);
90afffc8bd79d1 Dave Olsen             2006-11-06  198  		goto out;
90afffc8bd79d1 Dave Olsen             2006-11-06  199  	}
90afffc8bd79d1 Dave Olsen             2006-11-06  200  =

90afffc8bd79d1 Dave Olsen             2006-11-06  201  	/* Get the first ad=
dress to look for a rom chip at */
90afffc8bd79d1 Dave Olsen             2006-11-06  202  	map_top =3D window-=
>phys;
90afffc8bd79d1 Dave Olsen             2006-11-06  203  #if 1
90afffc8bd79d1 Dave Olsen             2006-11-06  204  	/* The probe sequen=
ce run over the firmware hub lock
90afffc8bd79d1 Dave Olsen             2006-11-06  205  	 * registers sets t=
hem to 0x7 (no access).
90afffc8bd79d1 Dave Olsen             2006-11-06  206  	 * Probe at most th=
e last 4MiB of the address space.
90afffc8bd79d1 Dave Olsen             2006-11-06  207  	 */
90afffc8bd79d1 Dave Olsen             2006-11-06  208  	if (map_top < 0xffc=
00000)
90afffc8bd79d1 Dave Olsen             2006-11-06  209  		map_top =3D 0xffc0=
0000;
90afffc8bd79d1 Dave Olsen             2006-11-06  210  #endif
90afffc8bd79d1 Dave Olsen             2006-11-06  211  	/* Loop  through an=
d look for rom chips.  Since we don't know the
90afffc8bd79d1 Dave Olsen             2006-11-06  212  	 * starting address=
 for each chip, probe every ROM_PROBE_STEP_SIZE
90afffc8bd79d1 Dave Olsen             2006-11-06  213  	 * bytes from the s=
tarting address of the window.
90afffc8bd79d1 Dave Olsen             2006-11-06  214  	 */
90afffc8bd79d1 Dave Olsen             2006-11-06  215  	while((map_top - 1)=
 < 0xffffffffUL) {
90afffc8bd79d1 Dave Olsen             2006-11-06  216  		struct cfi_private=
 *cfi;
90afffc8bd79d1 Dave Olsen             2006-11-06  217  		unsigned long offs=
et;
90afffc8bd79d1 Dave Olsen             2006-11-06  218  		int i;
90afffc8bd79d1 Dave Olsen             2006-11-06  219  =

90afffc8bd79d1 Dave Olsen             2006-11-06  220  		if (!map) {
042bf272d5fcb2 Zhen Lei               2021-06-10  221  			map =3D kmalloc(s=
izeof(*map), GFP_KERNEL);
042bf272d5fcb2 Zhen Lei               2021-06-10  222  			if (!map)
90afffc8bd79d1 Dave Olsen             2006-11-06  223  				goto out;
90afffc8bd79d1 Dave Olsen             2006-11-06  224  		}
90afffc8bd79d1 Dave Olsen             2006-11-06 @225  		memset(map, 0, siz=
eof(*map));
90afffc8bd79d1 Dave Olsen             2006-11-06  226  		INIT_LIST_HEAD(&ma=
p->list);
90afffc8bd79d1 Dave Olsen             2006-11-06  227  		map->map.name =3D =
map->map_name;
90afffc8bd79d1 Dave Olsen             2006-11-06  228  		map->map.phys =3D =
map_top;
90afffc8bd79d1 Dave Olsen             2006-11-06  229  		offset =3D map_top=
 - window->phys;
90afffc8bd79d1 Dave Olsen             2006-11-06  230  		map->map.virt =3D =
(void __iomem *)
90afffc8bd79d1 Dave Olsen             2006-11-06  231  			(((unsigned long)=
(window->virt)) + offset);
90afffc8bd79d1 Dave Olsen             2006-11-06  232  		map->map.size =3D =
0xffffffffUL - map_top + 1UL;
90afffc8bd79d1 Dave Olsen             2006-11-06  233  		/* Set the name of=
 the map to the address I am trying */
65af07141b8249 Andrew Morton          2007-02-17 @234  		sprintf(map->map_n=
ame, "%s @%08Lx",
65af07141b8249 Andrew Morton          2007-02-17  235  			MOD_NAME, (unsign=
ed long long)map->map.phys);
90afffc8bd79d1 Dave Olsen             2006-11-06  236  =

90afffc8bd79d1 Dave Olsen             2006-11-06  237  		/* There is no gen=
eric VPP support */
90afffc8bd79d1 Dave Olsen             2006-11-06  238  		for(map->map.bankw=
idth =3D 32; map->map.bankwidth;
90afffc8bd79d1 Dave Olsen             2006-11-06  239  			map->map.bankwidt=
h >>=3D 1)
90afffc8bd79d1 Dave Olsen             2006-11-06  240  		{
90afffc8bd79d1 Dave Olsen             2006-11-06  241  			char **probe_type;
90afffc8bd79d1 Dave Olsen             2006-11-06  242  			/* Skip bankwidth=
s that are not supported */
90afffc8bd79d1 Dave Olsen             2006-11-06  243  			if (!map_bankwidt=
h_supported(map->map.bankwidth))
90afffc8bd79d1 Dave Olsen             2006-11-06  244  				continue;
90afffc8bd79d1 Dave Olsen             2006-11-06  245  =

90afffc8bd79d1 Dave Olsen             2006-11-06  246  			/* Setup the map =
methods */
90afffc8bd79d1 Dave Olsen             2006-11-06  247  			simple_map_init(&=
map->map);
90afffc8bd79d1 Dave Olsen             2006-11-06  248  =

90afffc8bd79d1 Dave Olsen             2006-11-06  249  			/* Try all of the=
 probe methods */
90afffc8bd79d1 Dave Olsen             2006-11-06  250  			probe_type =3D ro=
m_probe_types;
90afffc8bd79d1 Dave Olsen             2006-11-06  251  			for(; *probe_type=
; probe_type++) {
90afffc8bd79d1 Dave Olsen             2006-11-06  252  				map->mtd =3D do_=
map_probe(*probe_type, &map->map);
90afffc8bd79d1 Dave Olsen             2006-11-06  253  				if (map->mtd)
90afffc8bd79d1 Dave Olsen             2006-11-06  254  					goto found;
90afffc8bd79d1 Dave Olsen             2006-11-06  255  			}
90afffc8bd79d1 Dave Olsen             2006-11-06  256  		}
90afffc8bd79d1 Dave Olsen             2006-11-06  257  		map_top +=3D ROM_P=
ROBE_STEP_SIZE;
90afffc8bd79d1 Dave Olsen             2006-11-06  258  		continue;
90afffc8bd79d1 Dave Olsen             2006-11-06  259  	found:
90afffc8bd79d1 Dave Olsen             2006-11-06  260  		/* Trim the size i=
f we are larger than the map */
90afffc8bd79d1 Dave Olsen             2006-11-06  261  		if (map->mtd->size=
 > map->map.size) {
90afffc8bd79d1 Dave Olsen             2006-11-06  262  			printk(KERN_WARNI=
NG MOD_NAME
69423d99fc182a Adrian Hunter          2008-12-10  263  				" rom(%llu) larg=
er than window(%lu). fixing...\n",
69423d99fc182a Adrian Hunter          2008-12-10  264  				(unsigned long l=
ong)map->mtd->size, map->map.size);
90afffc8bd79d1 Dave Olsen             2006-11-06  265  			map->mtd->size =
=3D map->map.size;
90afffc8bd79d1 Dave Olsen             2006-11-06  266  		}
90afffc8bd79d1 Dave Olsen             2006-11-06  267  		if (window->rsrc.p=
arent) {
90afffc8bd79d1 Dave Olsen             2006-11-06  268  			/*
90afffc8bd79d1 Dave Olsen             2006-11-06  269  			 * Registering th=
e MTD device in iomem may not be possible
90afffc8bd79d1 Dave Olsen             2006-11-06  270  			 * if there is a =
BIOS "reserved" and BUSY range.  If this
90afffc8bd79d1 Dave Olsen             2006-11-06  271  			 * fails then con=
tinue anyway.
90afffc8bd79d1 Dave Olsen             2006-11-06  272  			 */
90afffc8bd79d1 Dave Olsen             2006-11-06  273  			map->rsrc.name  =
=3D map->map_name;
90afffc8bd79d1 Dave Olsen             2006-11-06  274  			map->rsrc.start =
=3D map->map.phys;
90afffc8bd79d1 Dave Olsen             2006-11-06  275  			map->rsrc.end   =
=3D map->map.phys + map->mtd->size - 1;
90afffc8bd79d1 Dave Olsen             2006-11-06  276  			map->rsrc.flags =
=3D IORESOURCE_MEM | IORESOURCE_BUSY;
90afffc8bd79d1 Dave Olsen             2006-11-06  277  			if (request_resou=
rce(&window->rsrc, &map->rsrc)) {
90afffc8bd79d1 Dave Olsen             2006-11-06  278  				printk(KERN_ERR =
MOD_NAME
90afffc8bd79d1 Dave Olsen             2006-11-06  279  					": cannot reser=
ve MTD resource\n");
90afffc8bd79d1 Dave Olsen             2006-11-06  280  				map->rsrc.parent=
 =3D NULL;
90afffc8bd79d1 Dave Olsen             2006-11-06  281  			}
90afffc8bd79d1 Dave Olsen             2006-11-06  282  		}
90afffc8bd79d1 Dave Olsen             2006-11-06  283  =

90afffc8bd79d1 Dave Olsen             2006-11-06  284  		/* Make the whole =
region visible in the map */
90afffc8bd79d1 Dave Olsen             2006-11-06  285  		map->map.virt =3D =
window->virt;
90afffc8bd79d1 Dave Olsen             2006-11-06  286  		map->map.phys =3D =
window->phys;
90afffc8bd79d1 Dave Olsen             2006-11-06  287  		cfi =3D map->map.f=
ldrv_priv;
90afffc8bd79d1 Dave Olsen             2006-11-06  288  		for(i =3D 0; i < c=
fi->numchips; i++)
90afffc8bd79d1 Dave Olsen             2006-11-06  289  			cfi->chips[i].sta=
rt +=3D offset;
90afffc8bd79d1 Dave Olsen             2006-11-06  290  =

90afffc8bd79d1 Dave Olsen             2006-11-06  291  		/* Now that the mt=
d devices is complete claim and export it */
90afffc8bd79d1 Dave Olsen             2006-11-06  292  		map->mtd->owner =
=3D THIS_MODULE;
ee0e87b174bb41 Jamie Iles             2011-05-23  293  		if (mtd_device_reg=
ister(map->mtd, NULL, 0)) {
90afffc8bd79d1 Dave Olsen             2006-11-06  294  			map_destroy(map->=
mtd);
90afffc8bd79d1 Dave Olsen             2006-11-06  295  			map->mtd =3D NULL;
90afffc8bd79d1 Dave Olsen             2006-11-06  296  			goto out;
90afffc8bd79d1 Dave Olsen             2006-11-06  297  		}
90afffc8bd79d1 Dave Olsen             2006-11-06  298  =

90afffc8bd79d1 Dave Olsen             2006-11-06  299  =

90afffc8bd79d1 Dave Olsen             2006-11-06  300  		/* Calculate the n=
ew value of map_top */
90afffc8bd79d1 Dave Olsen             2006-11-06  301  		map_top +=3D map->=
mtd->size;
90afffc8bd79d1 Dave Olsen             2006-11-06  302  =

90afffc8bd79d1 Dave Olsen             2006-11-06  303  		/* File away the m=
ap structure */
90afffc8bd79d1 Dave Olsen             2006-11-06  304  		list_add(&map->lis=
t, &window->maps);
90afffc8bd79d1 Dave Olsen             2006-11-06  305  		map =3D NULL;
90afffc8bd79d1 Dave Olsen             2006-11-06  306  	}
90afffc8bd79d1 Dave Olsen             2006-11-06  307  =

90afffc8bd79d1 Dave Olsen             2006-11-06  308   out:
90afffc8bd79d1 Dave Olsen             2006-11-06  309  	/* Free any left ov=
er map structures */
90afffc8bd79d1 Dave Olsen             2006-11-06  310  	kfree(map);
90afffc8bd79d1 Dave Olsen             2006-11-06  311  =

90afffc8bd79d1 Dave Olsen             2006-11-06  312  	/* See if I have an=
y map structures */
90afffc8bd79d1 Dave Olsen             2006-11-06  313  	if (list_empty(&win=
dow->maps)) {
90afffc8bd79d1 Dave Olsen             2006-11-06  314  		ck804xrom_cleanup(=
window);
90afffc8bd79d1 Dave Olsen             2006-11-06  315  		return -ENODEV;
90afffc8bd79d1 Dave Olsen             2006-11-06  316  	}
90afffc8bd79d1 Dave Olsen             2006-11-06  317  	return 0;
90afffc8bd79d1 Dave Olsen             2006-11-06  318  }
90afffc8bd79d1 Dave Olsen             2006-11-06  319  =


:::::: The code at line 234 was first introduced by commit
:::::: 65af07141b8249c98888a470e01c449131b72ffe [MTD] [MAPS] ck804xrom warn=
ing fix

:::::: TO: Andrew Morton <akpm@linux-foundation.org>
:::::: CC: David Woodhouse <dwmw2@infradead.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2958307664225961065==--

