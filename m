Content-Type: multipart/mixed; boundary="===============8234037036330843351=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kernel/fpu/xstate.c:1785:3: warning: Value stored to 'guest' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 07 Aug 2022 15:48:02 +0800
Message-ID: <202208071553.rugHI6n6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8234037036330843351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/x86/=
kernel/fpu/xstate.c:1785:3: warning: Value stored to 'guest' is never read =
[clang-analyzer-deadcode.DeadStores]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Jing Liu <jing2.liu@intel.com>
CC: Yang Zhong <yang.zhong@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1612c382ffbdf1f673caec76502b1c00e6d35363
commit: 980fe2fddcff21937c93532b4597c8ea450346c1 x86/fpu: Extend fpu_xstate=
_prctl() with guest permissions
date:   7 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-c001-20220801 (https://download.01.org/0day-ci/arch=
ive/20220807/202208071553.rugHI6n6-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00=
cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D980fe2fddcff21937c93532b4597c8ea450346c1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 980fe2fddcff21937c93532b4597c8ea450346c1
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   arch/x86/kernel/apic/io_apic.c:1287:2: note: Loop condition is false.  E=
xiting loop
           printk(KERN_DEBUG ".......     : IO APIC version: %02X\n",
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:396:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   arch/x86/kernel/apic/io_apic.c:1295:6: note: Assuming field 'version' is=
 < 16
           if (reg_01.bits.version >=3D 0x10 && reg_02.raw !=3D reg_01.raw)=
 {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/apic/io_apic.c:1295:34: note: Left side of '&&' is false
           if (reg_01.bits.version >=3D 0x10 && reg_02.raw !=3D reg_01.raw)=
 {
                                           ^
   arch/x86/kernel/apic/io_apic.c:1305:6: note: Assuming field 'version' is=
 >=3D 32
           if (reg_01.bits.version >=3D 0x20 && reg_03.raw !=3D reg_02.raw =
&&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/apic/io_apic.c:1305:6: note: Left side of '&&' is true
   arch/x86/kernel/apic/io_apic.c:1305:48: note: The right operand of '!=3D=
' is a garbage value
           if (reg_01.bits.version >=3D 0x20 && reg_03.raw !=3D reg_02.raw =
&&
                                                         ^  ~~~~~~~~~~
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
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   2 warnings generated.
   arch/x86/kernel/pci-iommu_table.c:37:10: warning: Dereference of null po=
inter (loaded from variable 'p') [clang-analyzer-core.NullDereference]
                           tmp =3D *p;
                                 ^~
   arch/x86/kernel/pci-iommu_table.c:30:18: note: Assuming 'p' is < 'finish'
           for (p =3D start; p < finish; p++) {
                           ^~~~~~~~~~
   arch/x86/kernel/pci-iommu_table.c:30:2: note: Loop condition is true.  E=
ntering loop body
           for (p =3D start; p < finish; p++) {
           ^
   arch/x86/kernel/pci-iommu_table.c:36:7: note: 'q' is <=3D 'p'
                   if (q > p) {
                       ^
   arch/x86/kernel/pci-iommu_table.c:36:3: note: Taking false branch
                   if (q > p) {
                   ^
   arch/x86/kernel/pci-iommu_table.c:30:30: note: Null pointer value stored=
 to 'p'
           for (p =3D start; p < finish; p++) {
                                       ^~~
   arch/x86/kernel/pci-iommu_table.c:30:18: note: 'p' is < 'finish'
           for (p =3D start; p < finish; p++) {
                           ^
   arch/x86/kernel/pci-iommu_table.c:30:2: note: Loop condition is true.  E=
ntering loop body
           for (p =3D start; p < finish; p++) {
           ^
   arch/x86/kernel/pci-iommu_table.c:36:7: note: Assuming 'q' is > 'p'
                   if (q > p) {
                       ^~~~~
   arch/x86/kernel/pci-iommu_table.c:36:3: note: Taking true branch
                   if (q > p) {
                   ^
   arch/x86/kernel/pci-iommu_table.c:37:10: note: Dereference of null point=
er (loaded from variable 'p')
                           tmp =3D *p;
                                 ^~
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
>> arch/x86/kernel/fpu/xstate.c:1785:3: warning: Value stored to 'guest' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   guest =3D true;
                   ^       ~~~~
   arch/x86/kernel/fpu/xstate.c:1785:3: note: Value stored to 'guest' is ne=
ver read
                   guest =3D true;
                   ^       ~~~~
   2 warnings generated.
   fs/fscache/cache.c:47:2: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(xtag->name, name);
           ^~~~~~
   fs/fscache/cache.c:47:2: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
           strcpy(xtag->name, name);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/fscache/cookie.c:160:3: warning: Null pointer passed as 2nd argument =
to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(cookie->inline_aux, aux_data, cookie->aux_len);
                   ^
   arch/x86/include/asm/string_32.h:182:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^
   fs/fscache/cookie.c:268:9: note: Assuming 'def' is non-null
           BUG_ON(!def);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/fscache/cookie.c:268:2: note: Taking false branch
           BUG_ON(!def);
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/fscache/cookie.c:268:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!def);
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/fscache/cookie.c:270:2: note: Taking false branch
           _enter("{%s},{%s},%p,%u",
           ^
   fs/fscache/internal.h:378:26: note: expanded from macro '_enter'
   #define _enter(FMT, ...) no_printk("=3D=3D> %s("FMT")", __func__, ##__VA=
_ARGS__)
                            ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/fscache/cookie.c:274:6: note: Assuming 'index_key' is non-null
           if (!index_key || !index_key_len || index_key_len > 255 || aux_d=
ata_len > 255)
               ^~~~~~~~~~
   fs/fscache/cookie.c:274:6: note: Left side of '||' is false
   fs/fscache/cookie.c:274:20: note: Assuming 'index_key_len' is not equal =
to 0
           if (!index_key || !index_key_len || index_key_len > 255 || aux_d=
ata_len > 255)
                             ^~~~~~~~~~~~~~
   fs/fscache/cookie.c:274:6: note: Left side of '||' is false
           if (!index_key || !index_key_len || index_key_len > 255 || aux_d=
ata_len > 255)
               ^
   fs/fscache/cookie.c:274:38: note: Assuming 'index_key_len' is <=3D 255
           if (!index_key || !index_key_len || index_key_len > 255 || aux_d=
ata_len > 255)
                                               ^~~~~~~~~~~~~~~~~~~
   fs/fscache/cookie.c:274:6: note: Left side of '||' is false
           if (!index_key || !index_key_len || index_key_len > 255 || aux_d=
ata_len > 255)
               ^
   fs/fscache/cookie.c:274:61: note: Assuming 'aux_data_len' is <=3D 255
           if (!index_key || !index_key_len || index_key_len > 255 || aux_d=
ata_len > 255)
                                                                      ^~~~~=
~~~~~~~~~~~~~
   fs/fscache/cookie.c:274:2: note: Taking false branch
           if (!index_key || !index_key_len || index_key_len > 255 || aux_d=
ata_len > 255)
           ^
   fs/fscache/cookie.c:276:6: note: Assuming 'aux_data' is null
           if (!aux_data || !aux_data_len) {
               ^~~~~~~~~
   fs/fscache/cookie.c:276:16: note: Left side of '||' is true
           if (!aux_data || !aux_data_len) {
                         ^
   fs/fscache/cookie.c:277:3: note: Null pointer value stored to 'aux_data'
                   aux_data =3D NULL;
                   ^~~~~~~~~~~~~~~
   fs/fscache/cookie.c:281:2: note: Loop condition is false.  Exiting loop
           fscache_stat(&fscache_n_acquires);
           ^
   fs/fscache/internal.h:276:28: note: expanded from macro 'fscache_stat'
   #define fscache_stat(stat) do {} while (0)
                              ^
   fs/fscache/cookie.c:284:6: note: Assuming 'parent' is non-null
           if (!parent) {
               ^~~~~~~
   fs/fscache/cookie.c:284:2: note: Taking false branch
           if (!parent) {
           ^
   fs/fscache/cookie.c:291:9: note: Assuming the condition is false
           BUG_ON(!def->name[0]);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~

vim +/guest +1785 arch/x86/kernel/fpu/xstate.c

980fe2fddcff21 Thomas Gleixner 2022-01-05  1736  =

db8268df0983ad Chang S. Bae    2021-10-21  1737  /**
db8268df0983ad Chang S. Bae    2021-10-21  1738   * fpu_xstate_prctl - xsta=
te permission operations
db8268df0983ad Chang S. Bae    2021-10-21  1739   * @tsk:	Redundant pointer=
 to current
db8268df0983ad Chang S. Bae    2021-10-21  1740   * @option:	A subfunction =
of arch_prctl()
db8268df0983ad Chang S. Bae    2021-10-21  1741   * @arg2:	option argument
db8268df0983ad Chang S. Bae    2021-10-21  1742   * Return:	0 if successful=
; otherwise, an error code
db8268df0983ad Chang S. Bae    2021-10-21  1743   *
db8268df0983ad Chang S. Bae    2021-10-21  1744   * Option arguments:
db8268df0983ad Chang S. Bae    2021-10-21  1745   *
db8268df0983ad Chang S. Bae    2021-10-21  1746   * ARCH_GET_XCOMP_SUPP: Po=
inter to user space u64 to store the info
db8268df0983ad Chang S. Bae    2021-10-21  1747   * ARCH_GET_XCOMP_PERM: Po=
inter to user space u64 to store the info
db8268df0983ad Chang S. Bae    2021-10-21  1748   * ARCH_REQ_XCOMP_PERM: Fa=
cility number requested
db8268df0983ad Chang S. Bae    2021-10-21  1749   *
db8268df0983ad Chang S. Bae    2021-10-21  1750   * For facilities which re=
quire more than one XSTATE component, the request
db8268df0983ad Chang S. Bae    2021-10-21  1751   * must be the highest sta=
te component number related to that facility,
db8268df0983ad Chang S. Bae    2021-10-21  1752   * e.g. for AMX which requ=
ires XFEATURE_XTILE_CFG(17) and
db8268df0983ad Chang S. Bae    2021-10-21  1753   * XFEATURE_XTILE_DATA(18)=
 this would be XFEATURE_XTILE_DATA(18).
db8268df0983ad Chang S. Bae    2021-10-21  1754   */
db8268df0983ad Chang S. Bae    2021-10-21  1755  long fpu_xstate_prctl(stru=
ct task_struct *tsk, int option, unsigned long arg2)
db8268df0983ad Chang S. Bae    2021-10-21  1756  {
db8268df0983ad Chang S. Bae    2021-10-21  1757  	u64 __user *uptr =3D (u64=
 __user *)arg2;
db8268df0983ad Chang S. Bae    2021-10-21  1758  	u64 permitted, supported;
db8268df0983ad Chang S. Bae    2021-10-21  1759  	unsigned long idx =3D arg=
2;
980fe2fddcff21 Thomas Gleixner 2022-01-05  1760  	bool guest =3D false;
db8268df0983ad Chang S. Bae    2021-10-21  1761  =

db8268df0983ad Chang S. Bae    2021-10-21  1762  	if (tsk !=3D current)
db8268df0983ad Chang S. Bae    2021-10-21  1763  		return -EPERM;
db8268df0983ad Chang S. Bae    2021-10-21  1764  =

db8268df0983ad Chang S. Bae    2021-10-21  1765  	switch (option) {
db8268df0983ad Chang S. Bae    2021-10-21  1766  	case ARCH_GET_XCOMP_SUPP:
db8268df0983ad Chang S. Bae    2021-10-21  1767  		supported =3D fpu_user_c=
fg.max_features |	fpu_user_cfg.legacy_features;
db8268df0983ad Chang S. Bae    2021-10-21  1768  		return put_user(supporte=
d, uptr);
db8268df0983ad Chang S. Bae    2021-10-21  1769  =

db8268df0983ad Chang S. Bae    2021-10-21  1770  	case ARCH_GET_XCOMP_PERM:
db8268df0983ad Chang S. Bae    2021-10-21  1771  		/*
db8268df0983ad Chang S. Bae    2021-10-21  1772  		 * Lockless snapshot as =
it can also change right after the
db8268df0983ad Chang S. Bae    2021-10-21  1773  		 * dropping the lock.
db8268df0983ad Chang S. Bae    2021-10-21  1774  		 */
db8268df0983ad Chang S. Bae    2021-10-21  1775  		permitted =3D xstate_get=
_host_group_perm();
db8268df0983ad Chang S. Bae    2021-10-21  1776  		permitted &=3D XFEATURE_=
MASK_USER_SUPPORTED;
db8268df0983ad Chang S. Bae    2021-10-21  1777  		return put_user(permitte=
d, uptr);
db8268df0983ad Chang S. Bae    2021-10-21  1778  =

980fe2fddcff21 Thomas Gleixner 2022-01-05  1779  	case ARCH_GET_XCOMP_GUEST=
_PERM:
980fe2fddcff21 Thomas Gleixner 2022-01-05  1780  		permitted =3D xstate_get=
_guest_group_perm();
980fe2fddcff21 Thomas Gleixner 2022-01-05  1781  		permitted &=3D XFEATURE_=
MASK_USER_SUPPORTED;
980fe2fddcff21 Thomas Gleixner 2022-01-05  1782  		return put_user(permitte=
d, uptr);
980fe2fddcff21 Thomas Gleixner 2022-01-05  1783  =

980fe2fddcff21 Thomas Gleixner 2022-01-05  1784  	case ARCH_REQ_XCOMP_GUEST=
_PERM:
980fe2fddcff21 Thomas Gleixner 2022-01-05 @1785  		guest =3D true;
980fe2fddcff21 Thomas Gleixner 2022-01-05  1786  		fallthrough;
980fe2fddcff21 Thomas Gleixner 2022-01-05  1787  =

db8268df0983ad Chang S. Bae    2021-10-21  1788  	case ARCH_REQ_XCOMP_PERM:
db8268df0983ad Chang S. Bae    2021-10-21  1789  		if (!IS_ENABLED(CONFIG_X=
86_64))
db8268df0983ad Chang S. Bae    2021-10-21  1790  			return -EOPNOTSUPP;
db8268df0983ad Chang S. Bae    2021-10-21  1791  =

980fe2fddcff21 Thomas Gleixner 2022-01-05  1792  		return xstate_request_pe=
rm(idx, guest);
db8268df0983ad Chang S. Bae    2021-10-21  1793  =

db8268df0983ad Chang S. Bae    2021-10-21  1794  	default:
db8268df0983ad Chang S. Bae    2021-10-21  1795  		return -EINVAL;
db8268df0983ad Chang S. Bae    2021-10-21  1796  	}
db8268df0983ad Chang S. Bae    2021-10-21  1797  }
db8268df0983ad Chang S. Bae    2021-10-21  1798  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8234037036330843351==--

