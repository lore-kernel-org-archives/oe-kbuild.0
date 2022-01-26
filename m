Content-Type: multipart/mixed; boundary="===============8112642857589663324=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kernel/traps.c:533:24: warning: Value stored to 't' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 26 Jan 2022 11:44:50 +0800
Message-ID: <202201261107.VM0YszyG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8112642857589663324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: b968e84b509da593c50dc3db679e1d33de701f78 x86/iopl: Fake iopl(3) CLI=
/STI usage
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220126/202201261107.VM0YszyG-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
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
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   drivers/hwmon/adc128d818.c:217:2: note: The value -128 is assigned to 'r=
egval'
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/adc128d818.c:218:29: note: The result of the left shift is=
 undefined because the left operand is negative
           data->temp[index] =3D regval << 1;
                               ~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/video/fbdev/s1d13xxxfb.c:681:2: warning: Value stored to 'is_dua=
l' is never read [clang-analyzer-deadcode.DeadStores]
           is_dual =3D (panel & 0x02) !=3D 0;
           ^         ~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/s1d13xxxfb.c:681:2: note: Value stored to 'is_dual' =
is never read
           is_dual =3D (panel & 0x02) !=3D 0;
           ^         ~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/s1d13xxxfb.c:683:2: warning: Value stored to 'lcd_bp=
p' is never read [clang-analyzer-deadcode.DeadStores]
           lcd_bpp =3D s1d13xxxfb_width_tab[is_tft][(panel >> 4) & 3];
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/s1d13xxxfb.c:683:2: note: Value stored to 'lcd_bpp' =
is never read
           lcd_bpp =3D s1d13xxxfb_width_tab[is_tft][(panel >> 4) & 3];
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> arch/x86/kernel/traps.c:533:24: warning: Value stored to 't' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct thread_struct *t =3D &current->thread;
                                 ^   ~~~~~~~~~~~~~~~~
   arch/x86/kernel/traps.c:533:24: note: Value stored to 't' during its ini=
tialization is never read
           struct thread_struct *t =3D &current->thread;
                                 ^   ~~~~~~~~~~~~~~~~
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
   drivers/pci/setup-bus.c:87:2: warning: Use of memory after it is freed [=
clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(dev_res, tmp, head, list) {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/pci/setup-bus.c:1907:6: note: Assuming field 'parent' is non-null
           if (!io_res->parent && align)
               ^~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1907:22: note: Left side of '&&' is false
           if (!io_res->parent && align)
                               ^
   drivers/pci/setup-bus.c:1911:6: note: Assuming field 'parent' is non-null
           if (!mmio_res->parent && align)
               ^~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1911:24: note: Left side of '&&' is false
           if (!mmio_res->parent && align)
                                 ^
   drivers/pci/setup-bus.c:1915:6: note: Assuming field 'parent' is non-null
           if (!mmio_pref_res->parent && align)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1915:29: note: Left side of '&&' is false
           if (!mmio_pref_res->parent && align)
                                      ^
   drivers/pci/setup-bus.c:1923:2: note: Calling 'adjust_bridge_window'
           adjust_bridge_window(bridge, io_res, add_list, resource_size(&io=
));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/pci/setup-bus.c:1867:6: note: Assuming field 'parent' is null
           if (res->parent)
               ^~~~~~~~~~~
   drivers/pci/setup-bus.c:1867:2: note: Taking false branch
           if (res->parent)
           ^
   drivers/pci/setup-bus.c:1870:6: note: Assuming 'new_size' is not equal t=
o 0
           if (!new_size)
               ^~~~~~~~~
   drivers/pci/setup-bus.c:1870:2: note: Taking false branch
           if (!new_size)
           ^
   drivers/pci/setup-bus.c:1873:6: note: Assuming 'new_size' is <=3D 'size'
           if (new_size > size) {
               ^~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1873:2: note: Taking false branch
           if (new_size > size) {
           ^
   drivers/pci/setup-bus.c:1877:13: note: Assuming 'new_size' is >=3D 'size'
           } else if (new_size < size) {
                      ^~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:1877:9: note: Taking false branch
           } else if (new_size < size) {
                  ^
   drivers/pci/setup-bus.c:1884:2: note: Calling 'remove_from_list'
           remove_from_list(add_list, res);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/setup-bus.c:87:2: note: Left side of '&&' is false
           list_for_each_entry_safe(dev_res, tmp, head, list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)

vim +/t +533 arch/x86/kernel/traps.c

59c1dcbed5b51ca Jann Horn      2019-12-19  530  =

b968e84b509da59 Peter Zijlstra 2021-09-17  531  static bool fixup_iopl_exce=
ption(struct pt_regs *regs)
b968e84b509da59 Peter Zijlstra 2021-09-17  532  {
b968e84b509da59 Peter Zijlstra 2021-09-17 @533  	struct thread_struct *t =
=3D &current->thread;
b968e84b509da59 Peter Zijlstra 2021-09-17  534  	unsigned char byte;
b968e84b509da59 Peter Zijlstra 2021-09-17  535  	unsigned long ip;
b968e84b509da59 Peter Zijlstra 2021-09-17  536  =

b968e84b509da59 Peter Zijlstra 2021-09-17  537  	if (!IS_ENABLED(CONFIG_X86=
_IOPL_IOPERM) || t->iopl_emul !=3D 3)
b968e84b509da59 Peter Zijlstra 2021-09-17  538  		return false;
b968e84b509da59 Peter Zijlstra 2021-09-17  539  =

b968e84b509da59 Peter Zijlstra 2021-09-17  540  	if (insn_get_effective_ip(=
regs, &ip))
b968e84b509da59 Peter Zijlstra 2021-09-17  541  		return false;
b968e84b509da59 Peter Zijlstra 2021-09-17  542  =

b968e84b509da59 Peter Zijlstra 2021-09-17  543  	if (get_user(byte, (const =
char __user *)ip))
b968e84b509da59 Peter Zijlstra 2021-09-17  544  		return false;
b968e84b509da59 Peter Zijlstra 2021-09-17  545  =

b968e84b509da59 Peter Zijlstra 2021-09-17  546  	if (byte !=3D 0xfa && byte=
 !=3D 0xfb)
b968e84b509da59 Peter Zijlstra 2021-09-17  547  		return false;
b968e84b509da59 Peter Zijlstra 2021-09-17  548  =

b968e84b509da59 Peter Zijlstra 2021-09-17  549  	if (!t->iopl_warn && print=
k_ratelimit()) {
b968e84b509da59 Peter Zijlstra 2021-09-17  550  		pr_err("%s[%d] attempts t=
o use CLI/STI, pretending it's a NOP, ip:%lx",
b968e84b509da59 Peter Zijlstra 2021-09-17  551  		       current->comm, tas=
k_pid_nr(current), ip);
b968e84b509da59 Peter Zijlstra 2021-09-17  552  		print_vma_addr(KERN_CONT =
" in ", ip);
b968e84b509da59 Peter Zijlstra 2021-09-17  553  		pr_cont("\n");
b968e84b509da59 Peter Zijlstra 2021-09-17  554  		t->iopl_warn =3D 1;
b968e84b509da59 Peter Zijlstra 2021-09-17  555  	}
b968e84b509da59 Peter Zijlstra 2021-09-17  556  =

b968e84b509da59 Peter Zijlstra 2021-09-17  557  	regs->ip +=3D 1;
b968e84b509da59 Peter Zijlstra 2021-09-17  558  	return true;
b968e84b509da59 Peter Zijlstra 2021-09-17  559  }
b968e84b509da59 Peter Zijlstra 2021-09-17  560  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8112642857589663324==--

