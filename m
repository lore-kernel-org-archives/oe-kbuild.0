Content-Type: multipart/mixed; boundary="===============6045748128936897273=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mcgrof:modules-next 1/10] kernel/module/main.c:3475:4: warning: Null pointer passed as 1st argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Tue, 22 Feb 2022 07:10:11 +0800
Message-ID: <202202220739.d6DHS80N-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6045748128936897273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Aaron Tomlin <atomlin@redhat.com>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git mo=
dules-next
head:   c55dc78176e6fe97a9e92d24a7ff3015b14ac858
commit: 87b31159f78ab89d8ccda30d3eb9966af51bca64 [1/10] module: Move all in=
to module/
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007-20220221 (https://download.01.org/0day-ci/ar=
chive/20220222/202202220739.d6DHS80N-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/=
commit/?id=3D87b31159f78ab89d8ccda30d3eb9966af51bca64
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/g=
it/mcgrof/linux.git
        git fetch --no-tags mcgrof modules-next
        git checkout 87b31159f78ab89d8ccda30d3eb9966af51bca64
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/proc/proc_sysctl.c:1231:3: warning: Value stored to 'link' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   link =3D find_entry(&head, dir, procname, strlen(procnam=
e));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/proc/proc_sysctl.c:1231:3: note: Value stored to 'link' is never read
                   link =3D find_entry(&head, dir, procname, strlen(procnam=
e));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/acpi/thermal.c:1035:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(tz->name, device->pnp.bus_id);
           ^~~~~~
   drivers/acpi/thermal.c:1035:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(tz->name, device->pnp.bus_id);
           ^~~~~~
   drivers/acpi/thermal.c:1036:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_name(device), ACPI_THERMAL_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/thermal.c:1036:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(acpi_device_name(device), ACPI_THERMAL_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/thermal.c:1037:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_class(device), ACPI_THERMAL_CLASS);
           ^~~~~~
   drivers/acpi/thermal.c:1037:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(acpi_device_class(device), ACPI_THERMAL_CLASS);
           ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (5 in non-user code, 2 with check filters).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> kernel/module/main.c:3475:4: warning: Null pointer passed as 1st argumen=
t to memory copy function [clang-analyzer-unix.cstring.NullArg]
                           memcpy(dest, (void *)shdr->sh_addr, shdr->sh_siz=
e);
                           ^
   kernel/module/main.c:4169:1: note: Calling '__se_sys_init_module'
   SYSCALL_DEFINE3(init_module, void __user *, umod,
   ^
   include/linux/syscalls.h:219:36: note: expanded from macro 'SYSCALL_DEFI=
NE3'
   #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFIN=
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
   kernel/module/main.c:4169:1: note: Calling '__do_sys_init_module'
   SYSCALL_DEFINE3(init_module, void __user *, umod,
   ^
   include/linux/syscalls.h:219:36: note: expanded from macro 'SYSCALL_DEFI=
NE3'
   #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:235:14: note: expanded from macro=
 '__SYSCALL_DEFINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   kernel/module/main.c:4176:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/module/main.c:4176:2: note: Taking false branch
           if (err)
           ^
   kernel/module/main.c:4179:2: note: Taking false branch
           pr_debug("init_module: umod=3D%p, len=3D%lu, uargs=3D%p\n",
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   kernel/module/main.c:4183:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/module/main.c:4183:2: note: Taking false branch
           if (err)
           ^
   kernel/module/main.c:4186:9: note: Calling 'load_module'
           return load_module(&info, uargs, 0);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/module/main.c:3962:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/module/main.c:3962:2: note: Taking false branch
           if (err)
           ^
   kernel/module/main.c:3970:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/module/main.c:3970:2: note: Taking false branch
           if (err)
           ^
   kernel/module/main.c:3978:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   kernel/module/main.c:3978:2: note: Taking false branch
           if (err)
           ^
   kernel/module/main.c:3985:2: note: Taking false branch
           if (blacklisted(info->name)) {
           ^
   kernel/module/main.c:3992:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   kernel/module/main.c:3992:2: note: Taking false branch
           if (err)
           ^
   kernel/module/main.c:3996:2: note: Taking false branch
           if (!check_modstruct_version(info, info->mod)) {
           ^
   kernel/module/main.c:4002:8: note: Calling 'layout_and_allocate'
           mod =3D layout_and_allocate(info, flags);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/module/main.c:3571:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/module/main.c:3571:2: note: Taking false branch
           if (err)
           ^
   kernel/module/main.c:3577:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~

vim +3475 kernel/module/main.c

f91a13bb99b739 kernel/module.c Linus Torvalds 2010-08-05  3421  =

49668688dd5a5f kernel/module.c Rusty Russell  2010-08-05  3422  static int =
move_module(struct module *mod, struct load_info *info)
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3423  {
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3424  	int i;
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3425  	void *ptr;
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3426  =

65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3427  	/* Do the =
allocs. */
7523e4dc5057e1 kernel/module.c Rusty Russell  2015-11-26  3428  	ptr =3D mo=
dule_alloc(mod->core_layout.size);
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3429  	/*
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3430  	 * The poi=
nter to this block is stored in the module structure
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3431  	 * which i=
s inside the block. Just mark it as not being a
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3432  	 * leak.
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3433  	 */
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3434  	kmemleak_n=
ot_leak(ptr);
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3435  	if (!ptr)
d913188c751911 kernel/module.c Rusty Russell  2010-08-05  3436  		return -E=
NOMEM;
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3437  =

7523e4dc5057e1 kernel/module.c Rusty Russell  2015-11-26  3438  	memset(ptr=
, 0, mod->core_layout.size);
7523e4dc5057e1 kernel/module.c Rusty Russell  2015-11-26  3439  	mod->core_=
layout.base =3D ptr;
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3440  =

7523e4dc5057e1 kernel/module.c Rusty Russell  2015-11-26  3441  	if (mod->i=
nit_layout.size) {
7523e4dc5057e1 kernel/module.c Rusty Russell  2015-11-26  3442  		ptr =3D m=
odule_alloc(mod->init_layout.size);
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3443  		/*
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3444  		 * The po=
inter to this block is stored in the module structure
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3445  		 * which =
is inside the block. This block doesn't need to be
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3446  		 * scanne=
d as it contains data and code that will be freed
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3447  		 * after =
the module is initialized.
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3448  		 */
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3449  		kmemleak_=
ignore(ptr);
82fab442f5322b kernel/module.c Rusty Russell  2012-12-11  3450  		if (!ptr)=
 {
7523e4dc5057e1 kernel/module.c Rusty Russell  2015-11-26  3451  			module_m=
emfree(mod->core_layout.base);
d913188c751911 kernel/module.c Rusty Russell  2010-08-05  3452  			return -=
ENOMEM;
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3453  		}
7523e4dc5057e1 kernel/module.c Rusty Russell  2015-11-26  3454  		memset(pt=
r, 0, mod->init_layout.size);
7523e4dc5057e1 kernel/module.c Rusty Russell  2015-11-26  3455  		mod->init=
_layout.base =3D ptr;
82fab442f5322b kernel/module.c Rusty Russell  2012-12-11  3456  	} else
7523e4dc5057e1 kernel/module.c Rusty Russell  2015-11-26  3457  		mod->init=
_layout.base =3D NULL;
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3458  =

65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3459  	/* Transfe=
r each section which specifies SHF_ALLOC */
5e12416927975a kernel/module.c Jim Cromie     2011-12-06  3460  	pr_debug("=
final section addresses:\n");
49668688dd5a5f kernel/module.c Rusty Russell  2010-08-05  3461  	for (i =3D=
 0; i < info->hdr->e_shnum; i++) {
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3462  		void *des=
t;
49668688dd5a5f kernel/module.c Rusty Russell  2010-08-05  3463  		Elf_Shdr =
*shdr =3D &info->sechdrs[i];
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3464  =

49668688dd5a5f kernel/module.c Rusty Russell  2010-08-05  3465  		if (!(shd=
r->sh_flags & SHF_ALLOC))
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3466  			continue;
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3467  =

49668688dd5a5f kernel/module.c Rusty Russell  2010-08-05  3468  		if (shdr-=
>sh_entsize & INIT_OFFSET_MASK)
7523e4dc5057e1 kernel/module.c Rusty Russell  2015-11-26  3469  			dest =3D=
 mod->init_layout.base
49668688dd5a5f kernel/module.c Rusty Russell  2010-08-05  3470  				+ (shdr=
->sh_entsize & ~INIT_OFFSET_MASK);
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3471  		else
7523e4dc5057e1 kernel/module.c Rusty Russell  2015-11-26  3472  			dest =3D=
 mod->core_layout.base + shdr->sh_entsize;
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3473  =

49668688dd5a5f kernel/module.c Rusty Russell  2010-08-05  3474  		if (shdr-=
>sh_type !=3D SHT_NOBITS)
49668688dd5a5f kernel/module.c Rusty Russell  2010-08-05 @3475  			memcpy(d=
est, (void *)shdr->sh_addr, shdr->sh_size);
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3476  		/* Update=
 sh_addr to point to copy in image. */
49668688dd5a5f kernel/module.c Rusty Russell  2010-08-05  3477  		shdr->sh_=
addr =3D (unsigned long)dest;
5e12416927975a kernel/module.c Jim Cromie     2011-12-06  3478  		pr_debug(=
"\t0x%lx %s\n",
5e12416927975a kernel/module.c Jim Cromie     2011-12-06  3479  			 (long)s=
hdr->sh_addr, info->secstrings + shdr->sh_name);
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3480  	}
d913188c751911 kernel/module.c Rusty Russell  2010-08-05  3481  =

d913188c751911 kernel/module.c Rusty Russell  2010-08-05  3482  	return 0;
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3483  }
65b8a9b4d55253 kernel/module.c Linus Torvalds 2010-08-05  3484  =


:::::: The code at line 3475 was first introduced by commit
:::::: 49668688dd5a5f46c72f965835388ed16c596055 module: pass load_info into=
 other functions

:::::: TO: Rusty Russell <rusty@rustcorp.com.au>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6045748128936897273==--

