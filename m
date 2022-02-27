Content-Type: multipart/mixed; boundary="===============0006088486397866813=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rafael-pm:linux-next 69/72] arch/x86/pci/acpi.c:362:36: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Sun, 27 Feb 2022 13:26:35 +0800
Message-ID: <202202271357.JdJqpOhe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0006088486397866813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-acpi(a)vger.kernel.org
CC: devel(a)acpica.org
CC: linux-pm(a)vger.kernel.org
TO: Hans de Goede <hdegoede@redhat.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 linux-next
head:   9e2511cc3be94084ed3b9311b8b72cc9a8bb6343
commit: 27422d1ca497b42e7d517bb3fe10662a4d37498b [69/72] x86/PCI: Disable e=
xclusion of E820 reserved addresses in some cases
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
227/202202271357.JdJqpOhe-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.g=
it/commit/?id=3D27422d1ca497b42e7d517bb3fe10662a4d37498b
        git remote add rafael-pm https://git.kernel.org/pub/scm/linux/kerne=
l/git/rafael/linux-pm.git
        git fetch --no-tags rafael-pm linux-next
        git checkout 27422d1ca497b42e7d517bb3fe10662a4d37498b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   fs/ext4/inode.c:6034:2: note: Taking true branch
           if (ext4_should_journal_data(inode))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inode.c:6035:3: note: Control jumps to line 6085
                   goto retry_alloc;
                   ^
   fs/ext4/inode.c:6087:2: note: '?' condition is false
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
   fs/ext4/inode.c:6087:2: note: '?' condition is false
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
   fs/ext4/inode.c:6087:2: note: Taking false branch
           if (IS_ERR(handle)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inode.c:6096:6: note: Assuming the condition is false
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
   fs/ext4/inode.c:6096:2: note: '?' condition is false
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
   fs/ext4/inode.c:6096:6: note: Assuming the condition is true
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
   fs/ext4/inode.c:6096:2: note: '?' condition is true
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
   fs/ext4/inode.c:6096:2: note: Taking true branch
           if (!ext4_should_journal_data(inode)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/inode.c:6097:9: note: 3rd function call argument is an uninitial=
ized value
                   err =3D block_page_mkwrite(vma, vmf, get_block);
                         ^                            ~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> arch/x86/pci/acpi.c:362:36: warning: Use of memory after it is freed [cl=
ang-analyzer-unix.Malloc]
                           if (resource_is_efi_mmio_region(entry->res)) {
                                                           ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/x86/pci/acpi.c:358:2: note: Assuming 'pci_use_crs' is true
           if (pci_use_crs) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/x86/pci/acpi.c:358:2: note: '?' condition is false
           if (pci_use_crs) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   arch/x86/pci/acpi.c:358:6: note: 'pci_use_crs' is true
           if (pci_use_crs) {
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
   arch/x86/pci/acpi.c:358:2: note: '?' condition is true
           if (pci_use_crs) {
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
   arch/x86/pci/acpi.c:358:2: note: Taking true branch
           if (pci_use_crs) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   arch/x86/pci/acpi.c:359:3: note: Loop condition is true.  Entering loop =
body
                   resource_list_for_each_entry_safe(entry, tmp, &ci->resou=
rces) {
                   ^
   include/linux/resource_ext.h:67:2: note: expanded from macro 'resource_l=
ist_for_each_entry_safe'
           list_for_each_entry_safe((entry), (tmp), (list), node)
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   arch/x86/pci/acpi.c:360:4: note: '?' condition is false
                           if (resource_is_pcicfg_ioport(entry->res))
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   arch/x86/pci/acpi.c:360:4: note: '?' condition is true
                           if (resource_is_pcicfg_ioport(entry->res))
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
   arch/x86/pci/acpi.c:360:4: note: Taking true branch
                           if (resource_is_pcicfg_ioport(entry->res))
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   arch/x86/pci/acpi.c:361:5: note: Calling 'resource_list_destroy_entry'
                                   resource_list_destroy_entry(entry);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/resource_ext.h:60:2: note: Calling 'resource_list_free_ent=
ry'
           resource_list_free_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/resource_ext.h:53:2: note: Memory is released
           kfree(entry);

vim +362 arch/x86/pci/acpi.c

27422d1ca497b4 Hans de Goede 2022-02-16  349  =

4d6b4e69a245e9 Jiang Liu     2015-10-14  350  static int pci_acpi_root_prep=
are_resources(struct acpi_pci_root_info *ci)
62f420f828249f Gary Hade     2007-10-03  351  {
4d6b4e69a245e9 Jiang Liu     2015-10-14  352  	struct acpi_device *device =
=3D ci->bridge;
4d6b4e69a245e9 Jiang Liu     2015-10-14  353  	int busnum =3D ci->root->sec=
ondary.start;
63f1789ec71677 Jiang Liu     2015-03-04  354  	struct resource_entry *entry=
, *tmp;
4d6b4e69a245e9 Jiang Liu     2015-10-14  355  	int status;
62f420f828249f Gary Hade     2007-10-03  356  =

4d6b4e69a245e9 Jiang Liu     2015-10-14  357  	status =3D acpi_pci_probe_ro=
ot_resources(ci);
4d6b4e69a245e9 Jiang Liu     2015-10-14  358  	if (pci_use_crs) {
27422d1ca497b4 Hans de Goede 2022-02-16  359  		resource_list_for_each_entr=
y_safe(entry, tmp, &ci->resources) {
4d6b4e69a245e9 Jiang Liu     2015-10-14  360  			if (resource_is_pcicfg_iop=
ort(entry->res))
4d6b4e69a245e9 Jiang Liu     2015-10-14  361  				resource_list_destroy_ent=
ry(entry);
27422d1ca497b4 Hans de Goede 2022-02-16 @362  			if (resource_is_efi_mmio_r=
egion(entry->res)) {
27422d1ca497b4 Hans de Goede 2022-02-16  363  				dev_info(&device->dev,
27422d1ca497b4 Hans de Goede 2022-02-16  364  					"host bridge window %pR =
is marked by EFI as MMIO\n",
27422d1ca497b4 Hans de Goede 2022-02-16  365  					entry->res);
27422d1ca497b4 Hans de Goede 2022-02-16  366  				pci_use_e820 =3D false;
27422d1ca497b4 Hans de Goede 2022-02-16  367  			}
27422d1ca497b4 Hans de Goede 2022-02-16  368  		}
4d6b4e69a245e9 Jiang Liu     2015-10-14  369  		return status;
4d6b4e69a245e9 Jiang Liu     2015-10-14  370  	}
4d6b4e69a245e9 Jiang Liu     2015-10-14  371  =

4d6b4e69a245e9 Jiang Liu     2015-10-14  372  	resource_list_for_each_entry=
_safe(entry, tmp, &ci->resources) {
4d6b4e69a245e9 Jiang Liu     2015-10-14  373  		dev_printk(KERN_DEBUG, &dev=
ice->dev,
4d6b4e69a245e9 Jiang Liu     2015-10-14  374  			   "host bridge window %pR=
 (ignored)\n", entry->res);
63f1789ec71677 Jiang Liu     2015-03-04  375  		resource_list_destroy_entry=
(entry);
62f420f828249f Gary Hade     2007-10-03  376  	}
4d6b4e69a245e9 Jiang Liu     2015-10-14  377  	x86_pci_root_bus_resources(b=
usnum, &ci->resources);
4d6b4e69a245e9 Jiang Liu     2015-10-14  378  =

4d6b4e69a245e9 Jiang Liu     2015-10-14  379  	return 0;
63f1789ec71677 Jiang Liu     2015-03-04  380  }
62f420f828249f Gary Hade     2007-10-03  381  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0006088486397866813==--

