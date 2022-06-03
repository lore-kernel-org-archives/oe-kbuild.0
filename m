Content-Type: multipart/mixed; boundary="===============8544179133133099498=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kernel/traps.c:533:24: warning: Value stored to 't' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 03 Jun 2022 10:19:20 +0800
Message-ID: <202206031015.fkhwSlYC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8544179133133099498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/x86/=
kernel/traps.c:533:24: warning: Value stored to 't' during its initializati=
on is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   58f9d52ff689a262bec7f5713c07f5a79e115168
commit: b968e84b509da593c50dc3db679e1d33de701f78 x86/iopl: Fake iopl(3) CLI=
/STI usage
date:   9 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-c007-20220530 (https://download.01.org/0day-ci/ar=
chive/20220603/202206031015.fkhwSlYC-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0776c4=
8f9b7e69fa447bee57c7c0985caa856be9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db968e84b509da593c50dc3db679e1d33de701f78
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b968e84b509da593c50dc3db679e1d33de701f78
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/asm-generic/bug.h:100:3: note: expanded from macro '__WARN_print=
f'
                   __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint))=
;\
                   ^
   arch/x86/include/asm/bug.h:76:33: note: expanded from macro '__WARN_FLAG=
S'
   #define __WARN_FLAGS(flags)                                     \
                                                                   ^
   lib/math/reciprocal_div.c:47:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:101:3: note: expanded from macro '__WARN_print=
f'
                   instrumentation_end();                                  \
                   ^
   include/linux/instrumentation.h:58:33: note: expanded from macro 'instru=
mentation_end'
   # define instrumentation_end()          do { } while(0)
                                           ^
   lib/math/reciprocal_div.c:47:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:97:38: note: expanded from macro '__WARN_print=
f'
   #define __WARN_printf(taint, arg...) do {                               \
                                        ^
   lib/math/reciprocal_div.c:51:14: note: The result of the left shift is u=
ndefined due to shifting by '64', which is greater or equal to the width of=
 type 'unsigned long long'
           mlow =3D 1ULL << (32 + l);
                       ^  ~~~~~~~~
   7 warnings generated.
   arch/x86/crypto/blowfish_glue.c:159:10: warning: Although the value stor=
ed to 'nbytes' is used in the enclosing expression, the value is never actu=
ally read from 'nbytes' [clang-analyzer-deadcode.DeadStores]
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   arch/x86/crypto/blowfish_glue.c:159:10: note: Although the value stored =
to 'nbytes' is used in the enclosing expression, the value is never actuall=
y read from 'nbytes'
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   arch/x86/crypto/blowfish_glue.c:240:10: warning: Although the value stor=
ed to 'nbytes' is used in the enclosing expression, the value is never actu=
ally read from 'nbytes' [clang-analyzer-deadcode.DeadStores]
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   arch/x86/crypto/blowfish_glue.c:240:10: note: Although the value stored =
to 'nbytes' is used in the enclosing expression, the value is never actuall=
y read from 'nbytes'
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   Suppressed 5 warnings (3 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> arch/x86/kernel/traps.c:533:24: warning: Value stored to 't' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct thread_struct *t =3D &current->thread;
                                 ^   ~~~~~~~~~~~~~~~~
   arch/x86/kernel/traps.c:533:24: note: Value stored to 't' during its ini=
tialization is never read
           struct thread_struct *t =3D &current->thread;
                                 ^   ~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/jffs2/nodemgmt.c:516:47: warning: Access to field 'offset' results in=
 a dereference of a null pointer (loaded from variable 'jeb') [clang-analyz=
er-core.NullDereference]
               && (jeb !=3D c->nextblock || (ofs & ~3) !=3D jeb->offset + (=
c->sector_size - jeb->free_size))) {
                                                        ^~~
   fs/jffs2/nodemgmt.c:507:2: note: Value assigned to 'jeb'
           jeb =3D &c->blocks[ofs / c->sector_size];
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/nodemgmt.c:509:2: note: 0 is < 1
           jffs2_dbg(1, "%s(): Node@0x%x(%d), size 0x%x\n",
           ^
   fs/jffs2/debug.h:69:6: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
               ^~~~~~~~~~~~~~~~~~~~~
   ./include/generated/autoconf.h:748:31: note: expanded from macro 'CONFIG=
_JFFS2_FS_DEBUG'
   #define CONFIG_JFFS2_FS_DEBUG 0
                                 ^
   fs/jffs2/nodemgmt.c:509:2: note: Taking false branch
           jffs2_dbg(1, "%s(): Node at 0x%x(%d), size 0x%x\n",
           ^
   fs/jffs2/debug.h:69:2: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
           ^
   fs/jffs2/nodemgmt.c:509:2: note: Loop condition is false.  Exiting loop
           jffs2_dbg(1, "%s(): Node at 0x%x(%d), size 0x%x\n",
           ^
   fs/jffs2/debug.h:67:37: note: expanded from macro 'jffs2_dbg'
   #define jffs2_dbg(level, fmt, ...)              \
                                                   ^
   fs/jffs2/nodemgmt.c:515:7: note: Assuming field 'nextblock' is null
           if ((c->nextblock || ((ofs & 3) !=3D REF_OBSOLETE))
                ^~~~~~~~~~~~
   fs/jffs2/nodemgmt.c:515:7: note: Left side of '||' is false
   fs/jffs2/nodemgmt.c:515:24: note: Assuming the condition is true
           if ((c->nextblock || ((ofs & 3) !=3D REF_OBSOLETE))
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/nodemgmt.c:515:6: note: Left side of '&&' is true
           if ((c->nextblock || ((ofs & 3) !=3D REF_OBSOLETE))
               ^
   fs/jffs2/nodemgmt.c:516:10: note: Assuming 'jeb' is equal to field 'next=
block'
               && (jeb !=3D c->nextblock || (ofs & ~3) !=3D jeb->offset + (=
c->sector_size - jeb->free_size))) {
                   ^~~~~~~~~~~~~~~~~~~
   fs/jffs2/nodemgmt.c:516:10: note: Left side of '||' is false
   fs/jffs2/nodemgmt.c:516:47: note: Access to field 'offset' results in a =
dereference of a null pointer (loaded from variable 'jeb')
               && (jeb !=3D c->nextblock || (ofs & ~3) !=3D jeb->offset + (=
c->sector_size - jeb->free_size))) {
                                                        ^~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   kernel/time/clocksource.c:684:2: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
           list_for_each_entry(cs, &clocksource_list, list) {
           ^
   include/linux/list.h:630:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
--
                       ^~~~~~~~~~~~~~~~~~
   fs/ntfs3/attrib.c:1570:3: note: Taking false branch
                   if (next_svcn =3D=3D evcn1) {
                   ^
   fs/ntfs3/attrib.c:1575:7: note: Assuming field 'size' is 0
                   if (!ni->attr_list.size) {
                       ^~~~~~~~~~~~~~~~~~~
   fs/ntfs3/attrib.c:1575:3: note: Taking true branch
                   if (!ni->attr_list.size) {
                   ^
   fs/ntfs3/attrib.c:1577:8: note: Assuming 'err' is 0
                           if (err)
                               ^~~
   fs/ntfs3/attrib.c:1577:4: note: Taking false branch
                           if (err)
                           ^
   fs/ntfs3/attrib.c:1581:4: note: Value assigned to 'attr_b'
                           attr_b =3D ni_find_attr(ni, NULL, &le_b, ATTR_DA=
TA, NULL,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/ntfs3/attrib.c:1583:8: note: Assuming 'attr_b' is null
                           if (!attr_b) {
                               ^~~~~~~
   fs/ntfs3/attrib.c:1583:4: note: Taking true branch
                           if (!attr_b) {
                           ^
   fs/ntfs3/attrib.c:1585:5: note: Control jumps to line 1667
                                   goto out;
                                   ^
   fs/ntfs3/attrib.c:1667:6: note: Assuming 'new_valid' is <=3D 'data_size'
           if (new_valid > data_size)
               ^~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/attrib.c:1667:2: note: Taking false branch
           if (new_valid > data_size)
           ^
   fs/ntfs3/attrib.c:1670:15: note: Dereference of null pointer
           valid_size =3D le64_to_cpu(attr_b->nres.valid_size);
                        ^
   include/linux/byteorder/generic.h:87:21: note: expanded from macro 'le64=
_to_cpu'
   #define le64_to_cpu __le64_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:32:50: note: expanded from =
macro '__le64_to_cpu'
   #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
                                                    ^~~
   fs/ntfs3/attrib.c:1962:19: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
                   u32 data_size =3D le32_to_cpu(attr->res.data_size);
                                   ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:50: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                    ^~~
   fs/ntfs3/attrib.c:1946:17: note: 'attr' initialized to a null pointer va=
lue
           struct ATTRIB *attr =3D NULL, *attr_b;
                          ^~~~
   fs/ntfs3/attrib.c:1953:6: note: Assuming 'bytes' is not equal to 0
           if (!bytes)
               ^~~~~~
   fs/ntfs3/attrib.c:1953:2: note: Taking false branch
           if (!bytes)
           ^
   fs/ntfs3/attrib.c:1958:6: note: Assuming 'attr_b' is non-null
           if (!attr_b)
               ^~~~~~~
   fs/ntfs3/attrib.c:1958:2: note: Taking false branch
           if (!attr_b)
           ^
   fs/ntfs3/attrib.c:1961:6: note: Assuming field 'non_res' is 0
           if (!attr_b->non_res) {
               ^~~~~~~~~~~~~~~~
   fs/ntfs3/attrib.c:1961:2: note: Taking true branch
           if (!attr_b->non_res) {
           ^
   fs/ntfs3/attrib.c:1962:19: note: Dereference of null pointer
                   u32 data_size =3D le32_to_cpu(attr->res.data_size);
                                   ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:50: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                    ^~~
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> arch/x86/kernel/traps.c:533:24: warning: Value stored to 't' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct thread_struct *t =3D &current->thread;
                                 ^   ~~~~~~~~~~~~~~~~
   arch/x86/kernel/traps.c:533:24: note: Value stored to 't' during its ini=
tialization is never read
           struct thread_struct *t =3D &current->thread;
                                 ^   ~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   include/linux/list.h:70:13: warning: Access to field 'prev' results in a=
 dereference of a null pointer (loaded from variable 'next') [clang-analyze=
r-core.NullDereference]
           next->prev =3D new;
                      ^
   mm/zsmalloc.c:2293:25: note: Left side of '&&' is false
           struct zs_pool *pool =3D container_of(shrinker, struct zs_pool,
                                  ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   mm/zsmalloc.c:2293:25: note: Taking false branch
           struct zs_pool *pool =3D container_of(shrinker, struct zs_pool,
                                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   mm/zsmalloc.c:2293:25: note: Loop condition is false.  Exiting loop
           struct zs_pool *pool =3D container_of(shrinker, struct zs_pool,
                                  ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   mm/zsmalloc.c:2301:16: note: Calling 'zs_compact'
           pages_freed =3D zs_compact(pool);
                         ^~~~~~~~~~~~~~~~
   mm/zsmalloc.c:2269:11: note: '?' condition is true
           for (i =3D ZS_SIZE_CLASSES - 1; i >=3D 0; i--) {

vim +/t +533 arch/x86/kernel/traps.c

59c1dcbed5b51c Jann Horn      2019-12-19  530  =

b968e84b509da5 Peter Zijlstra 2021-09-17  531  static bool fixup_iopl_excep=
tion(struct pt_regs *regs)
b968e84b509da5 Peter Zijlstra 2021-09-17  532  {
b968e84b509da5 Peter Zijlstra 2021-09-17 @533  	struct thread_struct *t =3D=
 &current->thread;
b968e84b509da5 Peter Zijlstra 2021-09-17  534  	unsigned char byte;
b968e84b509da5 Peter Zijlstra 2021-09-17  535  	unsigned long ip;
b968e84b509da5 Peter Zijlstra 2021-09-17  536  =

b968e84b509da5 Peter Zijlstra 2021-09-17  537  	if (!IS_ENABLED(CONFIG_X86_=
IOPL_IOPERM) || t->iopl_emul !=3D 3)
b968e84b509da5 Peter Zijlstra 2021-09-17  538  		return false;
b968e84b509da5 Peter Zijlstra 2021-09-17  539  =

b968e84b509da5 Peter Zijlstra 2021-09-17  540  	if (insn_get_effective_ip(r=
egs, &ip))
b968e84b509da5 Peter Zijlstra 2021-09-17  541  		return false;
b968e84b509da5 Peter Zijlstra 2021-09-17  542  =

b968e84b509da5 Peter Zijlstra 2021-09-17  543  	if (get_user(byte, (const c=
har __user *)ip))
b968e84b509da5 Peter Zijlstra 2021-09-17  544  		return false;
b968e84b509da5 Peter Zijlstra 2021-09-17  545  =

b968e84b509da5 Peter Zijlstra 2021-09-17  546  	if (byte !=3D 0xfa && byte =
!=3D 0xfb)
b968e84b509da5 Peter Zijlstra 2021-09-17  547  		return false;
b968e84b509da5 Peter Zijlstra 2021-09-17  548  =

b968e84b509da5 Peter Zijlstra 2021-09-17  549  	if (!t->iopl_warn && printk=
_ratelimit()) {
b968e84b509da5 Peter Zijlstra 2021-09-17  550  		pr_err("%s[%d] attempts to=
 use CLI/STI, pretending it's a NOP, ip:%lx",
b968e84b509da5 Peter Zijlstra 2021-09-17  551  		       current->comm, task=
_pid_nr(current), ip);
b968e84b509da5 Peter Zijlstra 2021-09-17  552  		print_vma_addr(KERN_CONT "=
 in ", ip);
b968e84b509da5 Peter Zijlstra 2021-09-17  553  		pr_cont("\n");
b968e84b509da5 Peter Zijlstra 2021-09-17  554  		t->iopl_warn =3D 1;
b968e84b509da5 Peter Zijlstra 2021-09-17  555  	}
b968e84b509da5 Peter Zijlstra 2021-09-17  556  =

b968e84b509da5 Peter Zijlstra 2021-09-17  557  	regs->ip +=3D 1;
b968e84b509da5 Peter Zijlstra 2021-09-17  558  	return true;
b968e84b509da5 Peter Zijlstra 2021-09-17  559  }
b968e84b509da5 Peter Zijlstra 2021-09-17  560  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8544179133133099498==--

