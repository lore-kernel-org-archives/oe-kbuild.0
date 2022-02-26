Content-Type: multipart/mixed; boundary="===============1440447743631567422=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:next/linux-next/master 378/379] mm/sparse-vmemmap.c:747:17: warning: Value stored to 'next' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 26 Feb 2022 12:24:39 +0800
Message-ID: <202202261206.iayFIHUI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1440447743631567422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Mark Brown <broonie@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block next/linux-next/master
head:   44948bd49d878dad6c9707e34f4a06df73c3a800
commit: 15aa3a056caa5192fe614cacebf054634b4c5e90 [378/379] Fix up more mism=
erges
:::::: branch date: 26 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20226/202202261206.iayFIHUI-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/15aa3a056caa519=
2fe614cacebf054634b4c5e90
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block next/linux-next/master
        git checkout 15aa3a056caa5192fe614cacebf054634b4c5e90
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/pinctrl/intel/pinctrl-intel.c:1777:15: note: Value stored to 'n'=
 during its initialization is never read
           unsigned int n =3D reg / sizeof(u32);
                        ^   ~~~~~~~~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-intel.c:1778:17: warning: Value stored to =
'dev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct device *dev =3D pctrl->dev;
                          ^~~   ~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-intel.c:1778:17: note: Value stored to 'de=
v' during its initialization is never read
           struct device *dev =3D pctrl->dev;
                          ^~~   ~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/hwmon/f71882fg.c:1801:4: warning: Division by zero [clang-analyz=
er-core.DivideZero]
                           / fan_from_reg(data->fan_full_speed[nr]);
   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1795:6: note: Assuming the condition is false
           if (data->pwm_enable & (1 << (2 * nr)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1795:2: note: Taking false branch
           if (data->pwm_enable & (1 << (2 * nr)))
           ^
   drivers/hwmon/f71882fg.c:1801:6: note: Calling 'fan_from_reg'
                           / fan_from_reg(data->fan_full_speed[nr]);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1148:9: note: Assuming 'reg' is 0
           return reg ? (1500000 / reg) : 0;
                  ^~~
   drivers/hwmon/f71882fg.c:1148:9: note: '?' condition is false
   drivers/hwmon/f71882fg.c:1148:2: note: Returning zero
           return reg ? (1500000 / reg) : 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1801:6: note: Returning from 'fan_from_reg'
                           / fan_from_reg(data->fan_full_speed[nr]);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1801:4: note: Division by zero
                           / fan_from_reg(data->fan_full_speed[nr]);
   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   mm/swap_state.c:165:9: warning: Value stored to 'entry' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
                   void *entry =3D xas_store(&xas, shadow);
                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap_state.c:165:9: note: Value stored to 'entry' during its initiali=
zation is never read
                   void *entry =3D xas_store(&xas, shadow);
                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   mm/swapfile.c:533:28: warning: Value stored to 'ci' during its initializ=
ation is never read [clang-analyzer-deadcode.DeadStores]
           struct swap_cluster_info *ci =3D si->cluster_info + idx;
                                     ^~   ~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:533:28: note: Value stored to 'ci' during its initializati=
on is never read
           struct swap_cluster_info *ci =3D si->cluster_info + idx;
                                     ^~   ~~~~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1312:2: warning: Value stored to 'count' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           count =3D p->swap_map[offset];
           ^       ~~~~~~~~~~~~~~~~~~~
   mm/swapfile.c:1312:2: note: Value stored to 'count' is never read
           count =3D p->swap_map[offset];
           ^       ~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> mm/sparse-vmemmap.c:747:17: warning: Value stored to 'next' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
                   unsigned long next =3D addr, last =3D addr + size;
                                 ^~~~   ~~~~
   mm/sparse-vmemmap.c:747:17: note: Value stored to 'next' during its init=
ialization is never read
                   unsigned long next =3D addr, last =3D addr + size;
                                 ^~~~   ~~~~
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
   14 warnings generated.
   drivers/block/aoe/aoecmd.c:152:13: warning: Although the value stored to=
 'lba' is used in the enclosing expression, the value is never actually rea=
d from 'lba' [clang-analyzer-deadcode.DeadStores]
           ah->lba5 =3D lba >>=3D 8;
                      ^       ~
   drivers/block/aoe/aoecmd.c:152:13: note: Although the value stored to 'l=
ba' is used in the enclosing expression, the value is never actually read f=
rom 'lba'
           ah->lba5 =3D lba >>=3D 8;
                      ^       ~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   arch/x86/include/asm/paravirt.h:55:2: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
           PVOP_VCALL0(cpu.io_delay);
           ^
   arch/x86/include/asm/paravirt_types.h:512:2: note: expanded from macro '=
PVOP_VCALL0'
           __PVOP_VCALL(op)
           ^
   arch/x86/include/asm/paravirt_types.h:492:8: note: expanded from macro '=
__PVOP_VCALL'
           (void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,        \
                 ^
   arch/x86/include/asm/paravirt_types.h:447:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^
   arch/x86/include/asm/paravirt_types.h:405:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __edi =3D __edi, __esi =3D __esi,             \
                         ^
   drivers/usb/host/pci-quirks.c:509:2: note: Calling 'usb_amd_quirk_pll'
           usb_amd_quirk_pll(0);
           ^~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/pci-quirks.c:343:12: note: 'disable' is 0
           u32 bit =3D disable ? 0 : 1;
                     ^~~~~~~
   drivers/usb/host/pci-quirks.c:343:12: note: '?' condition is false
   drivers/usb/host/pci-quirks.c:346:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&amd_lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/usb/host/pci-quirks.c:346:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&amd_lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/usb/host/pci-quirks.c:348:6: note: 'disable' is 0
           if (disable) {
               ^~~~~~~
   drivers/usb/host/pci-quirks.c:348:2: note: Taking false branch
           if (disable) {
           ^
   drivers/usb/host/pci-quirks.c:356:7: note: Assuming field 'isoc_reqs' is=
 <=3D 0
                   if (amd_chipset.isoc_reqs > 0) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/pci-quirks.c:356:3: note: Taking false branch
                   if (amd_chipset.isoc_reqs > 0) {
                   ^
   drivers/usb/host/pci-quirks.c:362:6: note: Assuming field 'gen' is equal=
 to AMD_CHIPSET_SB800
           if (amd_chipset.sb_type.gen =3D=3D AMD_CHIPSET_SB800 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/pci-quirks.c:362:51: note: Left side of '||' is true
           if (amd_chipset.sb_type.gen =3D=3D AMD_CHIPSET_SB800 ||
                                                            ^
   drivers/usb/host/pci-quirks.c:365:3: note: Calling 'outb_p'
                   outb_p(AB_REG_BAR_LOW, 0xcd6);
                   ^
   arch/x86/include/asm/io.h:337:16: note: expanded from macro 'outb_p'
   #define outb_p outb_p
                  ^
   arch/x86/include/asm/io.h:320:1: note: Calling 'slow_down_io'
   BUILDIO(b, b, char)
   ^
   arch/x86/include/asm/io.h:278:2: note: expanded from macro 'BUILDIO'
           slow_down_io();                                                 \
           ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:55:2: note: Assigned value is garbage or=
 undefined

vim +/next +747 mm/sparse-vmemmap.c

69543e15fc8fb75 Joao Martins      2022-02-24  723  =

69543e15fc8fb75 Joao Martins      2022-02-24  724  static int __meminit vme=
mmap_populate_compound_pages(unsigned long start_pfn,
69543e15fc8fb75 Joao Martins      2022-02-24  725  						     unsigned long=
 start,
69543e15fc8fb75 Joao Martins      2022-02-24  726  						     unsigned long=
 end, int node,
69543e15fc8fb75 Joao Martins      2022-02-24  727  						     struct dev_pa=
gemap *pgmap)
69543e15fc8fb75 Joao Martins      2022-02-24  728  {
69543e15fc8fb75 Joao Martins      2022-02-24  729  	unsigned long size, add=
r;
69543e15fc8fb75 Joao Martins      2022-02-24  730  	pte_t *pte;
69543e15fc8fb75 Joao Martins      2022-02-24  731  	int rc;
69543e15fc8fb75 Joao Martins      2022-02-24  732  =

69543e15fc8fb75 Joao Martins      2022-02-24  733  	if (reuse_compound_sect=
ion(start_pfn, pgmap)) {
69543e15fc8fb75 Joao Martins      2022-02-24  734  		pte =3D compound_secti=
on_tail_page(start);
4076bbc93eda6e1 Joao Martins      2022-02-24  735  		if (!pte)
4076bbc93eda6e1 Joao Martins      2022-02-24  736  			return -ENOMEM;
69543e15fc8fb75 Joao Martins      2022-02-24  737  =

69543e15fc8fb75 Joao Martins      2022-02-24  738  		/*
69543e15fc8fb75 Joao Martins      2022-02-24  739  		 * Reuse the page that=
 was populated in the prior iteration
69543e15fc8fb75 Joao Martins      2022-02-24  740  		 * with just tail stru=
ct pages.
69543e15fc8fb75 Joao Martins      2022-02-24  741  		 */
69543e15fc8fb75 Joao Martins      2022-02-24  742  		return vmemmap_populat=
e_range(start, end, node, pte_page(*pte));
69543e15fc8fb75 Joao Martins      2022-02-24  743  	}
69543e15fc8fb75 Joao Martins      2022-02-24  744  =

69543e15fc8fb75 Joao Martins      2022-02-24  745  	size =3D min(end - star=
t, pgmap_vmemmap_nr(pgmap) * sizeof(struct page));
69543e15fc8fb75 Joao Martins      2022-02-24  746  	for (addr =3D start; ad=
dr < end; addr +=3D size) {
69543e15fc8fb75 Joao Martins      2022-02-24 @747  		unsigned long next =3D=
 addr, last =3D addr + size;
69543e15fc8fb75 Joao Martins      2022-02-24  748  =

69543e15fc8fb75 Joao Martins      2022-02-24  749  		/* Populate the head p=
age vmemmap page */
69543e15fc8fb75 Joao Martins      2022-02-24  750  		pte =3D vmemmap_popula=
te_address(addr, node, NULL, NULL);
69543e15fc8fb75 Joao Martins      2022-02-24  751  		if (!pte)
69543e15fc8fb75 Joao Martins      2022-02-24  752  			return -ENOMEM;
69543e15fc8fb75 Joao Martins      2022-02-24  753  =

69543e15fc8fb75 Joao Martins      2022-02-24  754  		/* Populate the tail p=
ages vmemmap page */
69543e15fc8fb75 Joao Martins      2022-02-24  755  		next =3D addr + PAGE_S=
IZE;
69543e15fc8fb75 Joao Martins      2022-02-24  756  		pte =3D vmemmap_popula=
te_address(next, node, NULL, NULL);
69543e15fc8fb75 Joao Martins      2022-02-24  757  		if (!pte)
69543e15fc8fb75 Joao Martins      2022-02-24  758  			return -ENOMEM;
69543e15fc8fb75 Joao Martins      2022-02-24  759  =

69543e15fc8fb75 Joao Martins      2022-02-24  760  		/*
69543e15fc8fb75 Joao Martins      2022-02-24  761  		 * Reuse the previous =
page for the rest of tail pages
69543e15fc8fb75 Joao Martins      2022-02-24  762  		 * See layout diagram =
in Documentation/vm/vmemmap_dedup.rst
69543e15fc8fb75 Joao Martins      2022-02-24  763  		 */
69543e15fc8fb75 Joao Martins      2022-02-24  764  		next +=3D PAGE_SIZE;
69543e15fc8fb75 Joao Martins      2022-02-24  765  		rc =3D vmemmap_populat=
e_range(next, last, node, pte_page(*pte));
69543e15fc8fb75 Joao Martins      2022-02-24  766  		if (rc)
69543e15fc8fb75 Joao Martins      2022-02-24  767  			return -ENOMEM;
8f6aac419bd590f Christoph Lameter 2007-10-16  768  	}
29c71111d055738 Andy Whitcroft    2007-10-16  769  =

29c71111d055738 Andy Whitcroft    2007-10-16  770  	return 0;
8f6aac419bd590f Christoph Lameter 2007-10-16  771  }
8f6aac419bd590f Christoph Lameter 2007-10-16  772  =


:::::: The code@line 747 was first introduced by commit
:::::: 69543e15fc8fb75dac97bd88442acbcd8d016704 mm/sparse-vmemmap: improve =
memory savings for compound devmaps

:::::: TO: Joao Martins <joao.m.martins@oracle.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1440447743631567422==--

