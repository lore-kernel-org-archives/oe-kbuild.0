Content-Type: multipart/mixed; boundary="===============4018571918459299277=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/soc/versatile/soc-integrator.c:70:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length argum...
Date: Mon, 30 May 2022 06:01:22 +0800
Message-ID: <202205300551.QfAtvZPT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4018571918459299277==
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
head:   b00ed48bb0a7c295facf9036135a573a5cdbe7de
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220528 (https://download.01.org/0day-ci/archi=
ve/20220530/202205300551.QfAtvZPT-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f=
3f486e01448121f7931a4ca29fac1504ab)
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
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/ext4/namei.c:1578:2: note: Taking false branch
           if (!nblocks) {
           ^
   fs/ext4/namei.c:1583:6: note: Assuming 'start' is < 'nblocks'
           if (start >=3D nblocks)
               ^~~~~~~~~~~~~~~~
   fs/ext4/namei.c:1583:2: note: Taking false branch
           if (start >=3D nblocks)
           ^
   fs/ext4/namei.c:1592:7: note: 'ra_ptr' is >=3D 'ra_max'
                   if (ra_ptr >=3D ra_max) {
                       ^~~~~~
   fs/ext4/namei.c:1592:3: note: Taking true branch
                   if (ra_ptr >=3D ra_max) {
                   ^
   fs/ext4/namei.c:1595:8: note: 'block' is >=3D 'start'
                           if (block < start)
                               ^~~~~
   fs/ext4/namei.c:1595:4: note: Taking false branch
                           if (block < start)
                           ^
   fs/ext4/namei.c:1599:13: note: Assuming '__UNIQUE_ID___x522' is >=3D '__=
UNIQUE_ID___y523'
                           ra_max =3D min(ra_max, ARRAY_SIZE(bh_use));
                                    ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   fs/ext4/namei.c:1599:13: note: '?' condition is false
                           ra_max =3D min(ra_max, ARRAY_SIZE(bh_use));
                                    ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
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
   fs/ext4/namei.c:1602:8: note: Assuming 'retval' is not equal to 0
                           if (retval) {
                               ^~~~~~
   fs/ext4/namei.c:1602:4: note: Taking true branch
                           if (retval) {
                           ^
   fs/ext4/namei.c:1605:5: note: Control jumps to line 1660
                                   goto cleanup_and_exit;
                                   ^
   fs/ext4/namei.c:1660:2: note: Loop condition is false. Execution continu=
es on line 1662
           for (; ra_ptr < ra_max; ra_ptr++)
           ^
   fs/ext4/namei.c:1662:2: note: Returning pointer (loaded from 'ret'), whi=
ch participates in a condition later
           return ret;
           ^~~~~~~~~~
   fs/ext4/namei.c:1680:7: note: Returning from '__ext4_find_entry'
           bh =3D __ext4_find_entry(dir, &fname, res_dir, inlined);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/namei.c:1683:2: note: Returning pointer (loaded from 'bh'), whic=
h participates in a condition later
           return bh;
           ^~~~~~~~~
   fs/ext4/namei.c:3979:11: note: Returning from 'ext4_find_entry'
           new.bh =3D ext4_find_entry(new.dir, &new.dentry->d_name,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/namei.c:3981:2: note: Taking false branch
           if (IS_ERR(new.bh)) {
           ^
   fs/ext4/namei.c:3988:6: note: Assuming field 'bh' is non-null
           if (!new.bh || le32_to_cpu(new.de->inode) !=3D new.inode->i_ino)
               ^~~~~~~
   fs/ext4/namei.c:3988:6: note: Left side of '||' is false
   fs/ext4/namei.c:3988:17: note: Access to field 'inode' results in a dere=
ference of a null pointer (loaded from field 'de')
           if (!new.bh || le32_to_cpu(new.de->inode) !=3D new.inode->i_ino)
                          ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:50: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                    ^~
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/soc/versatile/soc-integrator.c:62:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%02x\n", integrator_coreid >> 24);
                  ^~~~~~~
   drivers/soc/versatile/soc-integrator.c:62:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%02x\n", integrator_coreid >> 24);
                  ^~~~~~~
>> drivers/soc/versatile/soc-integrator.c:70:9: warning: Call to function '=
sprintf' is insecure as it does not provide bounding of the memory buffer o=
r security checks introduced in the C11 standard. Replace with analogous fu=
nctions that support length arguments or provides boundary checks such as '=
sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOr=
UnsafeBufferHandling]
           return sprintf(buf, "%s\n", integrator_arch_str(integrator_corei=
d));
                  ^~~~~~~
   drivers/soc/versatile/soc-integrator.c:70:9: note: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11
           return sprintf(buf, "%s\n", integrator_arch_str(integrator_corei=
d));
                  ^~~~~~~
   drivers/soc/versatile/soc-integrator.c:78:9: warning: Call to function '=
sprintf' is insecure as it does not provide bounding of the memory buffer o=
r security checks introduced in the C11 standard. Replace with analogous fu=
nctions that support length arguments or provides boundary checks such as '=
sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOr=
UnsafeBufferHandling]
           return sprintf(buf, "%s\n", integrator_fpga_str(integrator_corei=
d));
                  ^~~~~~~
   drivers/soc/versatile/soc-integrator.c:78:9: note: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11
           return sprintf(buf, "%s\n", integrator_fpga_str(integrator_corei=
d));
                  ^~~~~~~
   drivers/soc/versatile/soc-integrator.c:86:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%02x\n", (integrator_coreid >> 4) & 0xFF);
                  ^~~~~~~
   drivers/soc/versatile/soc-integrator.c:86:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%02x\n", (integrator_coreid >> 4) & 0xFF);
                  ^~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   fs/fat/cache.c:138:20: warning: The left operand of '=3D=3D' is a garbag=
e value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (new->fcluster =3D=3D -1) /* dummy cache */
                             ^
   fs/fat/cache.c:366:6: note: Left side of '&&' is true
           if (!is_fat32(sbi) && (inode->i_ino =3D=3D MSDOS_ROOT_INO)) {
               ^
   fs/fat/cache.c:366:25: note: Assuming field 'i_ino' is not equal to MSDO=
S_ROOT_INO
           if (!is_fat32(sbi) && (inode->i_ino =3D=3D MSDOS_ROOT_INO)) {
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:366:2: note: Taking false branch
           if (!is_fat32(sbi) && (inode->i_ino =3D=3D MSDOS_ROOT_INO)) {
           ^
   fs/fat/cache.c:374:6: note: Assuming 'from_bmap' is true
           if (!from_bmap) {
               ^~~~~~~~~~
   fs/fat/cache.c:374:2: note: Taking false branch
           if (!from_bmap) {
           ^
   fs/fat/cache.c:380:7: note: Assuming 'sector' is < 'last_block'
                   if (sector >=3D last_block)
                       ^~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:380:3: note: Taking false branch
                   if (sector >=3D last_block)
                   ^
   fs/fat/cache.c:384:9: note: Calling 'fat_get_mapped_cluster'
           return fat_get_mapped_cluster(inode, sector, last_block, mapped_=
blocks,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/fat/cache.c:320:12: note: Calling 'fat_bmap_cluster'
           cluster =3D fat_bmap_cluster(inode, cluster);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:296:6: note: Assuming field 'i_start' is not equal to 0
           if (MSDOS_I(inode)->i_start =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:296:2: note: Taking false branch
           if (MSDOS_I(inode)->i_start =3D=3D 0)
           ^
   fs/fat/cache.c:299:8: note: Calling 'fat_get_cluster'
           ret =3D fat_get_cluster(inode, cluster, &fclus, &dclus);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:234:25: note: Field 'i_start' is not equal to 0
           BUG_ON(MSDOS_I(inode)->i_start =3D=3D 0);
                                  ^
   fs/fat/cache.c:234:2: note: Taking false branch
           BUG_ON(MSDOS_I(inode)->i_start =3D=3D 0);
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/fat/cache.c:234:2: note: Loop condition is false.  Exiting loop
           BUG_ON(MSDOS_I(inode)->i_start =3D=3D 0);
           ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/fat/cache.c:238:2: note: Taking false branch
           if (!fat_valid_entry(sbi, *dclus)) {
           ^
   fs/fat/cache.c:244:6: note: Assuming 'cluster' is not equal to 0
           if (cluster =3D=3D 0)
               ^~~~~~~~~~~~
   fs/fat/cache.c:244:2: note: Taking false branch
           if (cluster =3D=3D 0)
           ^
   fs/fat/cache.c:247:6: note: Calling 'fat_cache_lookup'
           if (fat_cache_lookup(inode, cluster, &cid, fclus, dclus) < 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:90:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry(p, &MSDOS_I(inode)->cache_lru, cache_list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   fs/fat/cache.c:92:7: note: Assuming 'fclus' is >=3D field 'fcluster'
                   if (p->fcluster <=3D fclus && hit->fcluster < p->fcluste=
r) {
                       ^~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:92:7: note: Left side of '&&' is true
   fs/fat/cache.c:92:31: note: Assuming 'hit->fcluster' is < 'p->fcluster'
                   if (p->fcluster <=3D fclus && hit->fcluster < p->fcluste=
r) {
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:92:3: note: Taking true branch
--
           ^~~~~~
   kernel/time/timekeeping.c:637:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(&tkr_dummy, tkr, sizeof(tkr_dummy));
           ^~~~~~
   kernel/time/timekeeping.c:644:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&tkr_dummy, tkr, sizeof(tkr_dummy));
           ^~~~~~
   kernel/time/timekeeping.c:644:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(&tkr_dummy, tkr, sizeof(tkr_dummy));
           ^~~~~~
   kernel/time/timekeeping.c:763:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&shadow_timekeeper, &tk_core.timekeeper,
                   ^~~~~~
   kernel/time/timekeeping.c:763:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&shadow_timekeeper, &tk_core.timekeeper,
                   ^~~~~~
   kernel/time/timekeeping.c:2195:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(real_tk, tk, sizeof(*tk));
           ^~~~~~
   kernel/time/timekeeping.c:2195:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(real_tk, tk, sizeof(*tk));
           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   fs/proc/generic.c:440:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ent->name, fn, qstr.len + 1);
           ^~~~~~
   fs/proc/generic.c:440:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(ent->name, fn, qstr.len + 1);
           ^~~~~~
   fs/proc/generic.c:467:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy((char*)ent->data,dest);
                           ^~~~~~
   fs/proc/generic.c:467:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy((char*)ent->data,dest);
                           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   fs/proc/fd.c:258:9: warning: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D snprintf(name, sizeof(name), "%u", fd);
                         ^~~~~~~~
   fs/proc/fd.c:258:9: note: Call to function 'snprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'snprintf_s' in case of C11
                   len =3D snprintf(name, sizeof(name), "%u", fd);
                         ^~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/pci/pcie/ptm.c:18:3: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(clock_desc, sizeof(clock_desc), "unknown");
                   ^~~~~~~~
   drivers/pci/pcie/ptm.c:18:3: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
                   snprintf(clock_desc, sizeof(clock_desc), "unknown");
                   ^~~~~~~~
   drivers/pci/pcie/ptm.c:21:3: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(clock_desc, sizeof(clock_desc), ">254ns");
                   ^~~~~~~~
   drivers/pci/pcie/ptm.c:21:3: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
                   snprintf(clock_desc, sizeof(clock_desc), ">254ns");
                   ^~~~~~~~
   drivers/pci/pcie/ptm.c:24:3: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(clock_desc, sizeof(clock_desc), "%uns",
                   ^~~~~~~~
   drivers/pci/pcie/ptm.c:24:3: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
                   snprintf(clock_desc, sizeof(clock_desc), "%uns",
                   ^~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/soc/versatile/soc-realview.c:45:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%02x\n", realview_coreid >> 24);
                  ^~~~~~~
   drivers/soc/versatile/soc-realview.c:45:9: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%02x\n", realview_coreid >> 24);
                  ^~~~~~~
   drivers/soc/versatile/soc-realview.c:53:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "HBI-%03x\n", ((realview_coreid >> 16) & 0xf=
ff));
                  ^~~~~~~
   drivers/soc/versatile/soc-realview.c:53:9: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "HBI-%03x\n", ((realview_coreid >> 16) & 0xf=
ff));
                  ^~~~~~~
>> drivers/soc/versatile/soc-realview.c:61:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
           return sprintf(buf, "%s\n", realview_arch_str(realview_coreid));
                  ^~~~~~~
   drivers/soc/versatile/soc-realview.c:61:9: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
           return sprintf(buf, "%s\n", realview_arch_str(realview_coreid));
                  ^~~~~~~
   drivers/soc/versatile/soc-realview.c:69:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%02x\n", (realview_coreid & 0xFF));
                  ^~~~~~~
   drivers/soc/versatile/soc-realview.c:69:9: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%02x\n", (realview_coreid & 0xFF));
                  ^~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/virtio/virtio.c:17:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%04x\n", dev->id.device);
                  ^~~~~~~
   drivers/virtio/virtio.c:17:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%04x\n", dev->id.device);
                  ^~~~~~~
   drivers/virtio/virtio.c:25:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%04x\n", dev->id.vendor);
                  ^~~~~~~
   drivers/virtio/virtio.c:25:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%04x\n", dev->id.vendor);
                  ^~~~~~~
   drivers/virtio/virtio.c:33:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%08x\n", dev->config->get_status(dev));
                  ^~~~~~~
   drivers/virtio/virtio.c:33:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%08x\n", dev->config->get_status(dev));
                  ^~~~~~~
   drivers/virtio/virtio.c:41:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "virtio:d%08Xv%08X\n",
                  ^~~~~~~
   drivers/virtio/virtio.c:41:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "virtio:d%08Xv%08X\n",
                  ^~~~~~~
   drivers/virtio/virtio.c:56:10: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(buf+len, "%c",
                          ^~~~~~~
   drivers/virtio/virtio.c:56:10: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                   len +=3D sprintf(buf+len, "%c",
                          ^~~~~~~
   drivers/virtio/virtio.c:58:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D sprintf(buf+len, "\n");
                  ^~~~~~~
   drivers/virtio/virtio.c:58:9: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
           len +=3D sprintf(buf+len, "\n");
                  ^~~~~~~
   drivers/virtio/virtio.c:362:8: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D snprintf(compat, sizeof(compat), "virtio,device%x", dev-=
>id.device);
                 ^~~~~~~~
   drivers/virtio/virtio.c:362:8: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           ret =3D snprintf(compat, sizeof(compat), "virtio,device%x", dev-=
>id.device);
                 ^~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   fs/efivarfs/file.c:100:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, &attributes, sizeof(attributes));
           ^~~~~~
   fs/efivarfs/file.c:100:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(data, &attributes, sizeof(attributes));
           ^~~~~~
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   fs/efivarfs/super.c:123:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(entry->var.VariableName, name16, name_size);
           ^~~~~~
   fs/efivarfs/super.c:123:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(entry->var.VariableName, name16, name_size);
           ^~~~~~
   fs/efivarfs/super.c:124:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&(entry->var.VendorGuid), &vendor, sizeof(efi_guid_t));
           ^~~~~~
   fs/efivarfs/super.c:124:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&(entry->var.VendorGuid), &vendor, sizeof(efi_guid_t));
           ^~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   fs/hfs/inode.c:231:3: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(HFS_I(inode)->first_extents, 0, sizeof(hfs_extent=
_rec));
                   ^~~~~~
   fs/hfs/inode.c:231:3: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
                   memset(HFS_I(inode)->first_extents, 0, sizeof(hfs_extent=
_rec));
                   ^~~~~~
   fs/hfs/inode.c:232:3: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(HFS_I(inode)->cached_extents, 0, sizeof(hfs_exten=
t_rec));
                   ^~~~~~
   fs/hfs/inode.c:232:3: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
                   memset(HFS_I(inode)->cached_extents, 0, sizeof(hfs_exten=
t_rec));
--
   63 warnings generated.
   drivers/md/dm-ioctl.c:538:20: warning: Access to field 'data_start' resu=
lts in a dereference of a null pointer (loaded from variable 'param') [clan=
g-analyzer-core.NullDereference]
           param->data_start =3D align_ptr(param + 1) - (void *) param;
                             ^
   drivers/md/dm-ioctl.c:746:25: note: Passing value via 1st parameter 'par=
am'
           return __list_versions(param, param_size, param->name);
                                  ^~~~~
   drivers/md/dm-ioctl.c:746:9: note: Calling '__list_versions'
           return __list_versions(param, param_size, param->name);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-ioctl.c:693:6: note: Assuming 'name' is null
           if (name) {
               ^~~~
   drivers/md/dm-ioctl.c:693:2: note: Taking false branch
           if (name) {
           ^
   drivers/md/dm-ioctl.c:703:7: note: 'tt' is null
           if (!tt)
                ^~
   drivers/md/dm-ioctl.c:703:2: note: Taking true branch
           if (!tt)
           ^
   drivers/md/dm-ioctl.c:711:27: note: Passing null pointer value via 1st p=
arameter 'param'
           vers =3D get_result_buffer(param, param_size, &len);
                                    ^~~~~
   drivers/md/dm-ioctl.c:711:9: note: Calling 'get_result_buffer'
           vers =3D get_result_buffer(param, param_size, &len);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-ioctl.c:538:20: note: Access to field 'data_start' results=
 in a dereference of a null pointer (loaded from variable 'param')
           param->data_start =3D align_ptr(param + 1) - (void *) param;
           ~~~~~             ^
   drivers/md/dm-ioctl.c:623:3: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(nl->name, hc->name);
                   ^~~~~~
   drivers/md/dm-ioctl.c:623:3: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
                   strcpy(nl->name, hc->name);
                   ^~~~~~
   drivers/md/dm-ioctl.c:633:5: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcpy(uuid_ptr, hc->uuid);
                                   ^~~~~~
   drivers/md/dm-ioctl.c:633:5: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
                                   strcpy(uuid_ptr, hc->uuid);
                                   ^~~~~~
   drivers/md/dm-ioctl.c:680:5: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
       strcpy(info->vers->name, tt->name);
       ^~~~~~
   drivers/md/dm-ioctl.c:680:5: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
       strcpy(info->vers->name, tt->name);
       ^~~~~~
   drivers/md/dm-ioctl.c:1061:6: warning: Call to function 'sscanf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           x =3D sscanf(geostr, "%lu %lu %lu %lu%c", indata,
               ^~~~~~
   drivers/md/dm-ioctl.c:1061:6: note: Call to function 'sscanf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sscanf_s' in case of C11
           x =3D sscanf(geostr, "%lu %lu %lu %lu%c", indata,
               ^~~~~~
   drivers/md/dm-ioctl.c:1260:3: warning: Call to function 'strncpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncpy(spec->target_type, ti->type->name,
                   ^~~~~~~
   drivers/md/dm-ioctl.c:1260:3: note: Call to function 'strncpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'strncpy_s' in case of C11
                   strncpy(spec->target_type, ti->type->name,
                   ^~~~~~~
   drivers/md/dm-ioctl.c:1835:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(param, 0, param_size);
                   ^~~~~~
   drivers/md/dm-ioctl.c:1835:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(param, 0, param_size);
                   ^~~~~~
   drivers/md/dm-ioctl.c:1884:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dmi, param_kernel, minimum_data_size);
           ^~~~~~
   drivers/md/dm-ioctl.c:1884:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(dmi, param_kernel, minimum_data_size);
           ^~~~~~
   drivers/md/dm-ioctl.c:2126:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, hc->name);
                   ^~~~~~
   drivers/md/dm-ioctl.c:2126:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(name, hc->name);
                   ^~~~~~
   drivers/md/dm-ioctl.c:2128:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(uuid, hc->uuid ? : "");
                   ^~~~~~
   drivers/md/dm-ioctl.c:2128:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(uuid, hc->uuid ? : "");
                   ^~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   sound/pci/hda/hda_eld.c:230:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(e, 0, sizeof(*e));
           ^~~~~~
   sound/pci/hda/hda_eld.c:230:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(e, 0, sizeof(*e));
           ^~~~~~
   sound/pci/hda/hda_eld.c:385:3: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf2, sizeof(buf2),
                   ^~~~~~~~
   sound/pci/hda/hda_eld.c:385:3: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
                   snprintf(buf2, sizeof(buf2),
                   ^~~~~~~~
>> sound/pci/hda/hda_eld.c:501:7: warning: Call to function 'sscanf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sscanf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
                   if (sscanf(line, "%s %llx", name, &val) !=3D 2)
                       ^~~~~~
   sound/pci/hda/hda_eld.c:501:7: note: Call to function 'sscanf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sscanf_s' in case =
of C11
                   if (sscanf(line, "%s %llx", name, &val) !=3D 2)
                       ^~~~~~
   sound/pci/hda/hda_eld.c:648:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, ELD_FIXED_BYTES + ELD_MAX_MNL + ELD_MAX_SAD * 3);
           ^~~~~~
   sound/pci/hda/hda_eld.c:648:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(buf, 0, ELD_FIXED_BYTES + ELD_MAX_MNL + ELD_MAX_SAD * 3);
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/scsi/wd719x.c:221:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(scb->CDB, cmd->cmnd, cmd->cmd_len);
           ^~~~~~
   drivers/scsi/wd719x.c:221:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(scb->CDB, cmd->cmnd, cmd->cmd_len);
           ^~~~~~
   drivers/scsi/wd719x.c:310:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(wd->hash_virt, 0, WD719X_HASH_TABLE_SIZE);
           ^~~~~~
   drivers/scsi/wd719x.c:310:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(wd->hash_virt, 0, WD719X_HASH_TABLE_SIZE);
           ^~~~~~
   drivers/scsi/wd719x.c:338:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(wd->fw_virt, fw_wcs->data, fw_wcs->size);
           ^~~~~~
   drivers/scsi/wd719x.c:338:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(wd->fw_virt, fw_wcs->data, fw_wcs->size);
           ^~~~~~
   drivers/scsi/wd719x.c:339:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(wd->fw_virt + ALIGN(fw_wcs->size, 4), fw_risc->data,
           ^~~~~~
   drivers/scsi/wd719x.c:339:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(wd->fw_virt + ALIGN(fw_wcs->size, 4), fw_risc->data,
           ^~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   96 warnings generated.
   drivers/scsi/st.c:528:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(SRpnt->sense, rq->sense, SCSI_SENSE_BUFFERSIZE);
                   ^~~~~~
   drivers/scsi/st.c:528:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(SRpnt->sense, rq->sense, SCSI_SENSE_BUFFERSIZE);
                   ^~~~~~
   drivers/scsi/st.c:578:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rq->cmd, 0, BLK_MAX_CDB);
           ^~~~~~
   drivers/scsi/st.c:578:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(rq->cmd, 0, BLK_MAX_CDB);
           ^~~~~~
   drivers/scsi/st.c:579:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rq->cmd, cmd, rq->cmd_len);
           ^~~~~~
   drivers/scsi/st.c:579:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(rq->cmd, cmd, rq->cmd_len);
           ^~~~~~
   drivers/scsi/st.c:637:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(SRpnt->cmd, cmd, sizeof(SRpnt->cmd));
           ^~~~~~
   drivers/scsi/st.c:637:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(SRpnt->cmd, cmd, sizeof(SRpnt->cmd));
           ^~~~~~
   drivers/scsi/st.c:779:3: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(cmd, 0, MAX_COMMAND_SIZE);
                   ^~~~~~
   drivers/scsi/st.c:779:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset(cmd, 0, MAX_COMMAND_SIZE);
                   ^~~~~~
   drivers/scsi/st.c:974:3: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset((void *) &cmd[0], 0, MAX_COMMAND_SIZE);
                   ^~~~~~
   drivers/scsi/st.c:974:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset((void *) &cmd[0], 0, MAX_COMMAND_SIZE);
                   ^~~~~~
   drivers/scsi/st.c:1106:3: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset((void *) &cmd[0], 0, MAX_COMMAND_SIZE);
                   ^~~~~~
   drivers/scsi/st.c:1106:3: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                   memset((void *) &cmd[0], 0, MAX_COMMAND_SIZE);
                   ^~~~~~
   drivers/scsi/st.c:1132:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset((void *) &cmd[0], 0, MAX_COMMAND_SIZE);
           ^~~~~~
   drivers/scsi/st.c:1132:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset((void *) &cmd[0], 0, MAX_COMMAND_SIZE);
           ^~~~~~
   drivers/scsi/st.c:1377:3: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(cmd, 0, MAX_COMMAND_SIZE);
                   ^~~~~~
   drivers/scsi/st.c:1377:3: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                   memset(cmd, 0, MAX_COMMAND_SIZE);
                   ^~~~~~
   drivers/scsi/st.c:1713:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cmd, 0, MAX_COMMAND_SIZE);
           ^~~~~~
   drivers/scsi/st.c:1713:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(cmd, 0, MAX_COMMAND_SIZE);

vim +70 drivers/soc/versatile/soc-integrator.c

f956a785a282f6 Linus Walleij 2014-10-24  66  =

734776eb16e8ca Sudeep Holla  2020-05-23  67  static ssize_t
734776eb16e8ca Sudeep Holla  2020-05-23  68  arch_show(struct device *dev, =
struct device_attribute *attr, char *buf)
f956a785a282f6 Linus Walleij 2014-10-24  69  {
f956a785a282f6 Linus Walleij 2014-10-24 @70  	return sprintf(buf, "%s\n", i=
ntegrator_arch_str(integrator_coreid));
f956a785a282f6 Linus Walleij 2014-10-24  71  }
f956a785a282f6 Linus Walleij 2014-10-24  72  =


:::::: The code at line 70 was first introduced by commit
:::::: f956a785a282f6b5a3e7d59937548f8b7c04d1ac soc: move SoC driver for th=
e ARM Integrator

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4018571918459299277==--

