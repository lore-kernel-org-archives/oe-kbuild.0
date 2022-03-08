Content-Type: multipart/mixed; boundary="===============6354498691905179542=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mcgrof:modules-testing 1/14] kernel/module/decompress.c:215:2: warning: Value stored to 'error' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 09 Mar 2022 05:07:04 +0800
Message-ID: <202203090558.7BykQHZQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6354498691905179542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Aaron Tomlin <atomlin@redhat.com>
CC: Luis Chamberlain <mcgrof@kernel.org>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git mo=
dules-testing
head:   2139ea23db5919966c90392bb0b994b80cefd4b6
commit: 4f244f3c74d1aee08609ab3cbb40e589d033677b [1/14] module: Move all in=
to module/
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm-randconfig-c002-20220308 (https://download.01.org/0day-ci/archi=
ve/20220309/202203090558.7BykQHZQ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/=
commit/?id=3D4f244f3c74d1aee08609ab3cbb40e589d033677b
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/g=
it/mcgrof/linux.git
        git fetch --no-tags mcgrof modules-testing
        git checkout 4f244f3c74d1aee08609ab3cbb40e589d033677b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
            ^~~~
   drivers/firmware/qemu_fw_cfg.c:500:6: note: Left side of '||' is false
           if (!dir || !target || !name || !*name)
               ^
   drivers/firmware/qemu_fw_cfg.c:500:26: note: 'name' is non-null
           if (!dir || !target || !name || !*name)
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
   drivers/firmware/qemu_fw_cfg.c:500:6: note: Left side of '||' is false
           if (!dir || !target || !name || !*name)
               ^
   drivers/firmware/qemu_fw_cfg.c:500:2: note: '?' condition is false
           if (!dir || !target || !name || !*name)
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
   drivers/firmware/qemu_fw_cfg.c:500:2: note: Taking false branch
           if (!dir || !target || !name || !*name)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/firmware/qemu_fw_cfg.c:505:6: note: Assuming 'name_copy' is non-=
null
           if (!name_copy)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/firmware/qemu_fw_cfg.c:505:2: note: '?' condition is false
           if (!name_copy)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/firmware/qemu_fw_cfg.c:505:7: note: 'name_copy' is non-null
           if (!name_copy)
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
   drivers/firmware/qemu_fw_cfg.c:505:2: note: '?' condition is false
           if (!name_copy)
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
   drivers/firmware/qemu_fw_cfg.c:505:2: note: Taking false branch
           if (!name_copy)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/firmware/qemu_fw_cfg.c:509:10: note: Assuming 'tok' is non-null
           while ((tok =3D strsep(&p, "/")) && *tok) {
                   ^~~
   drivers/firmware/qemu_fw_cfg.c:509:9: note: Left side of '&&' is true
           while ((tok =3D strsep(&p, "/")) && *tok) {
                  ^
   drivers/firmware/qemu_fw_cfg.c:509:2: note: Loop condition is false. Exe=
cution continues on line 557
           while ((tok =3D strsep(&p, "/")) && *tok) {
           ^
   drivers/firmware/qemu_fw_cfg.c:558:2: note: Undefined or garbage value r=
eturned to caller
           return ret;
           ^      ~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> kernel/module/decompress.c:215:2: warning: Value stored to 'error' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           error =3D module_extend_max_pages(info, n_pages);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/module/decompress.c:215:2: note: Value stored to 'error' is never=
 read
           error =3D module_extend_max_pages(info, n_pages);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   5 warnings generated.
   arch/arm/include/asm/atomic.h:224:1: warning: Use of memory after it is =
freed [clang-analyzer-unix.Malloc]
   ATOMIC_OPS(sub, -=3D, sub)
   ^
   arch/arm/include/asm/atomic.h:221:2: note: expanded from macro 'ATOMIC_O=
PS'
           ATOMIC_FETCH_OP(op, c_op, asm_op)
           ^
   arch/arm/include/asm/atomic.h:193:8: note: expanded from macro 'ATOMIC_F=
ETCH_OP'
           val =3D v->counter;                                             =
  \
                 ^
   drivers/usb/gadget/legacy/raw_gadget.c:389:2: note: Loop condition is fa=
lse.  Exiting loop
           spin_lock_irqsave(&dev->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:221:3: note: expanded from macro 'local_irq_sav=
e'
                   raw_local_irq_save(flags);              \
                   ^
   include/linux/irqflags.h:176:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   drivers/usb/gadget/legacy/raw_gadget.c:389:2: note: Assuming the conditi=
on is false
           spin_lock_irqsave(&dev->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/irqflags.h:222:7: note: expanded from macro 'local_irq_sav=
e'
                   if (!raw_irqs_disabled_flags(flags))    \
                   ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/usb/gadget/legacy/raw_gadget.c:389:2: note: '?' condition is fal=
se
           spin_lock_irqsave(&dev->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/irqflags.h:222:3: note: expanded from macro 'local_irq_sav=
e'
                   if (!raw_irqs_disabled_flags(flags))    \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^

vim +/error +215 kernel/module/decompress.c

b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  203  =

b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  204  =
int module_decompress(struct load_info *info, const void *buf, size_t size)
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  205  {
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  206  =
	unsigned int n_pages;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  207  =
	ssize_t data_size;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  208  =
	int error;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  209  =

b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  210  =
	/*
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  211  =
	 * Start with number of pages twice as big as needed for
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  212  =
	 * compressed data.
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  213  =
	 */
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  214  =
	n_pages =3D DIV_ROUND_UP(size, PAGE_SIZE) * 2;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05 @215  =
	error =3D module_extend_max_pages(info, n_pages);
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  216  =

b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  217  =
	data_size =3D MODULE_DECOMPRESS_FN(info, buf, size);
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  218  =
	if (data_size < 0) {
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  219  =
		error =3D data_size;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  220  =
		goto err;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  221  =
	}
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  222  =

b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  223  =
	info->hdr =3D vmap(info->pages, info->used_pages, VM_MAP, PAGE_KERNEL);
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  224  =
	if (!info->hdr) {
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  225  =
		error =3D -ENOMEM;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  226  =
		goto err;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  227  =
	}
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  228  =

b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  229  =
	info->len =3D data_size;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  230  =
	return 0;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  231  =

b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  232  =
err:
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  233  =
	module_decompress_cleanup(info);
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  234  =
	return error;
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  235  }
b1ae6dc41eaaa9 kernel/module_decompress.c Dmitry Torokhov 2022-01-05  236  =


:::::: The code at line 215 was first introduced by commit
:::::: b1ae6dc41eaaa98bb75671e0f3665bfda248c3e7 module: add in-kernel suppo=
rt for decompressing

:::::: TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
:::::: CC: Luis Chamberlain <mcgrof@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6354498691905179542==--

