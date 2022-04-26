Content-Type: multipart/mixed; boundary="===============4969635570919577631=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/ecam.c:129:15: warning: Value stored to 'bsz' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 27 Apr 2022 06:20:05 +0800
Message-ID: <202204270647.sO16ZtaO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4969635570919577631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Russell King <rmk+kernel@armlinux.org.uk>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cf424ef014ac30b0da27125dd1fbdf10b0d3a520
commit: 8fe55ef23387ce3c7488375b1fd539420d7654bb PCI: Dynamically map ECAM =
regions
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-c007-20220425 (https://download.01.org/0day-ci/ar=
chive/20220427/202204270647.sO16ZtaO-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8fe55ef23387ce3c7488375b1fd539420d7654bb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8fe55ef23387ce3c7488375b1fd539420d7654bb
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/namespace.c:2218:13: warning: Access to field 'd_inode' results in a =
dereference of a null pointer (loaded from variable 'dentry') [clang-analyz=
er-core.NullDereference]
           inode_lock(dentry->d_inode);
                      ^
   fs/namespace.c:3728:1: note: Calling '__se_sys_pivot_root'
   SYSCALL_DEFINE2(pivot_root, const char __user *, new_root,
   ^
   include/linux/syscalls.h:217:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:232:2: note: expanded from macro =
'__SYSCALL_DEFINEx'
           __IA32_SYS_STUBx(x, name, __VA_ARGS__)                          \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:117:2: note: expanded from macro =
'__IA32_SYS_STUBx'
           __SYS_STUBx(ia32, sys##name,                                    \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:79:10: note: expanded from macro =
'__SYS_STUBx'
                   return __se_##name(__VA_ARGS__);                        \
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/namespace.c:3728:1: note: Calling '__do_sys_pivot_root'
   SYSCALL_DEFINE2(pivot_root, const char __user *, new_root,
   ^
   include/linux/syscalls.h:217:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:235:14: note: expanded from macro=
 '__SYSCALL_DEFINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/namespace.c:3736:6: note: Assuming the condition is false
           if (!may_mount())
               ^~~~~~~~~~~~
   fs/namespace.c:3736:2: note: Taking false branch
           if (!may_mount())
           ^
   fs/namespace.c:3741:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/namespace.c:3741:2: note: Taking false branch
           if (error)
           ^
   fs/namespace.c:3746:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/namespace.c:3746:2: note: Taking false branch
           if (error)
           ^
   fs/namespace.c:3750:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/namespace.c:3750:2: note: Taking false branch
           if (error)
           ^
   fs/namespace.c:3754:11: note: Calling 'lock_mount'
           old_mp =3D lock_mount(&old);
                    ^~~~~~~~~~~~~~~~
   fs/namespace.c:2219:6: note: Assuming the condition is true
           if (unlikely(cant_mount(dentry))) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/namespace.c:2219:2: note: Taking false branch
           if (unlikely(cant_mount(dentry))) {
           ^
   fs/namespace.c:2225:14: note: 'mnt' is non-null
           if (likely(!mnt)) {
                       ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/namespace.c:2225:2: note: Taking false branch
           if (likely(!mnt)) {
           ^
   fs/namespace.c:2238:2: note: Null pointer value stored to 'dentry'
           dentry =3D path->dentry =3D dget(mnt->mnt_root);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/namespace.c:2239:2: note: Control jumps to line 2218
           goto retry;
           ^
   fs/namespace.c:2218:13: note: Access to field 'd_inode' results in a der=
eference of a null pointer (loaded from variable 'dentry')
           inode_lock(dentry->d_inode);
                      ^~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/pci/ecam.c:129:15: warning: Value stored to 'bsz' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int bsz =3D 1 << cfg->bus_shift;
                        ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/pci/ecam.c:129:15: note: Value stored to 'bsz' during its initia=
lization is never read
           unsigned int bsz =3D 1 << cfg->bus_shift;
                        ^~~   ~~~~~~~~~~~~~~~~~~~
>> drivers/pci/ecam.c:130:15: warning: Value stored to 'busn' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int busn =3D bus->number;
                        ^~~~   ~~~~~~~~~~~
   drivers/pci/ecam.c:130:15: note: Value stored to 'busn' during its initi=
alization is never read
           unsigned int busn =3D bus->number;
                        ^~~~   ~~~~~~~~~~~
>> drivers/pci/ecam.c:151:28: warning: Value stored to 'cfg' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct pci_config_window *cfg =3D bus->sysdata;
                                     ^~~   ~~~~~~~~~~~~
   drivers/pci/ecam.c:151:28: note: Value stored to 'cfg' during its initia=
lization is never read
           struct pci_config_window *cfg =3D bus->sysdata;
                                     ^~~   ~~~~~~~~~~~~
   drivers/pci/ecam.c:152:15: warning: Value stored to 'busn' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int busn =3D bus->number;
                        ^~~~   ~~~~~~~~~~~
   drivers/pci/ecam.c:152:15: note: Value stored to 'busn' during its initi=
alization is never read
           unsigned int busn =3D bus->number;
                        ^~~~   ~~~~~~~~~~~
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
   5 warnings generated.
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
   5 warnings generated.
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   lib/vsprintf.c:371:20: warning: Assigned value is garbage or undefined [=
clang-analyzer-core.uninitialized.Assign]
                   buf[idx + width] =3D tmp[len - idx - 1];
                                    ^ ~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:352:6: note: Assuming 'num' is > 9
           if (num <=3D 9) {
               ^~~~~~~~
   lib/vsprintf.c:352:2: note: Taking false branch
           if (num <=3D 9) {
           ^
   lib/vsprintf.c:356:9: note: Calling 'put_dec'
                   len =3D put_dec(tmp, num) - tmp;
                         ^~~~~~~~~~~~~~~~~
   lib/vsprintf.c:258:6: note: Assuming the condition is false
           if (n >=3D 100*1000*1000)
               ^~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:258:2: note: Taking false branch
           if (n >=3D 100*1000*1000)
           ^
   lib/vsprintf.c:261:2: note: Taking false branch
           if (n >=3D 100*1000*1000)
           ^
   lib/vsprintf.c:264:9: note: Calling 'put_dec_trunc8'
           return put_dec_trunc8(buf, n);
                  ^~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:193:6: note: Assuming 'r' is < 100
           if (r < 100)
               ^~~~~~~
   lib/vsprintf.c:193:2: note: Taking true branch
           if (r < 100)
           ^
   lib/vsprintf.c:194:3: note: Control jumps to line 223
                   goto out_r;
                   ^
   lib/vsprintf.c:224:9: note: 'r' is >=3D 10
           buf +=3D r < 10 ? 1 : 2;

vim +/bsz +129 drivers/pci/ecam.c

35ff9477d880986 Jayachandran C 2016-05-10  125  =

8fe55ef23387ce3 Russell King   2021-05-13  126  static int pci_ecam_add_bus=
(struct pci_bus *bus)
8fe55ef23387ce3 Russell King   2021-05-13  127  {
8fe55ef23387ce3 Russell King   2021-05-13  128  	struct pci_config_window *=
cfg =3D bus->sysdata;
8fe55ef23387ce3 Russell King   2021-05-13 @129  	unsigned int bsz =3D 1 << =
cfg->bus_shift;
8fe55ef23387ce3 Russell King   2021-05-13 @130  	unsigned int busn =3D bus-=
>number;
8fe55ef23387ce3 Russell King   2021-05-13  131  	phys_addr_t start;
8fe55ef23387ce3 Russell King   2021-05-13  132  =

8fe55ef23387ce3 Russell King   2021-05-13  133  	if (!per_bus_mapping)
8fe55ef23387ce3 Russell King   2021-05-13  134  		return 0;
8fe55ef23387ce3 Russell King   2021-05-13  135  =

8fe55ef23387ce3 Russell King   2021-05-13  136  	if (busn < cfg->busr.start=
 || busn > cfg->busr.end)
8fe55ef23387ce3 Russell King   2021-05-13  137  		return -EINVAL;
8fe55ef23387ce3 Russell King   2021-05-13  138  =

8fe55ef23387ce3 Russell King   2021-05-13  139  	busn -=3D cfg->busr.start;
8fe55ef23387ce3 Russell King   2021-05-13  140  	start =3D cfg->res.start +=
 busn * bsz;
8fe55ef23387ce3 Russell King   2021-05-13  141  =

8fe55ef23387ce3 Russell King   2021-05-13  142  	cfg->winp[busn] =3D pci_re=
map_cfgspace(start, bsz);
8fe55ef23387ce3 Russell King   2021-05-13  143  	if (!cfg->winp[busn])
8fe55ef23387ce3 Russell King   2021-05-13  144  		return -ENOMEM;
8fe55ef23387ce3 Russell King   2021-05-13  145  =

8fe55ef23387ce3 Russell King   2021-05-13  146  	return 0;
8fe55ef23387ce3 Russell King   2021-05-13  147  }
8fe55ef23387ce3 Russell King   2021-05-13  148  =

8fe55ef23387ce3 Russell King   2021-05-13  149  static void pci_ecam_remove=
_bus(struct pci_bus *bus)
8fe55ef23387ce3 Russell King   2021-05-13  150  {
8fe55ef23387ce3 Russell King   2021-05-13 @151  	struct pci_config_window *=
cfg =3D bus->sysdata;
8fe55ef23387ce3 Russell King   2021-05-13  152  	unsigned int busn =3D bus-=
>number;
8fe55ef23387ce3 Russell King   2021-05-13  153  =

8fe55ef23387ce3 Russell King   2021-05-13  154  	if (!per_bus_mapping || bu=
sn < cfg->busr.start || busn > cfg->busr.end)
8fe55ef23387ce3 Russell King   2021-05-13  155  		return;
8fe55ef23387ce3 Russell King   2021-05-13  156  =

8fe55ef23387ce3 Russell King   2021-05-13  157  	busn -=3D cfg->busr.start;
8fe55ef23387ce3 Russell King   2021-05-13  158  	if (cfg->winp[busn]) {
8fe55ef23387ce3 Russell King   2021-05-13  159  		iounmap(cfg->winp[busn]);
8fe55ef23387ce3 Russell King   2021-05-13  160  		cfg->winp[busn] =3D NULL;
8fe55ef23387ce3 Russell King   2021-05-13  161  	}
8fe55ef23387ce3 Russell King   2021-05-13  162  }
8fe55ef23387ce3 Russell King   2021-05-13  163  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4969635570919577631==--

