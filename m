Content-Type: multipart/mixed; boundary="===============6519140085131020410=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/virt/nitro_enclaves/ne_misc_dev.c:878:5: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 05 Dec 2021 09:01:59 +0800
Message-ID: <202112050806.U6x6yhzT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6519140085131020410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bbef3c7a63d2a4cb0f3f839db9e767f168c5e348
commit: a52f8a59aef46b59753e583bf4b28fccb069ce64 fortify: Explicitly disabl=
e Clang support
date:   2 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-c007-20211127 (https://download.01.org/0day-ci/ar=
chive/20211205/202112050806.U6x6yhzT-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da52f8a59aef46b59753e583bf4b28fccb069ce64
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a52f8a59aef46b59753e583bf4b28fccb069ce64
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/usb/misc/usbtest.c:2364:3: warning: Value stored to 'retval' is =
never read [clang-analyzer-deadcode.DeadStores]
                   retval =3D 0;
                   ^        ~
   drivers/usb/misc/usbtest.c:2364:3: note: Value stored to 'retval' is nev=
er read
                   retval =3D 0;
                   ^        ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/usb/misc/usbsevseg.c:255:4: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(buf, " [");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:255:4: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                           strcat(buf, " [");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:256:4: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(buf, display_textmodes[i]);
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:256:4: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                           strcat(buf, display_textmodes[i]);
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:257:4: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(buf, "] ");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:257:4: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                           strcat(buf, "] ");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:259:4: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(buf, " ");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:259:4: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                           strcat(buf, " ");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:260:4: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(buf, display_textmodes[i]);
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:260:4: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                           strcat(buf, display_textmodes[i]);
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:261:4: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(buf, " ");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:261:4: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                           strcat(buf, " ");
                           ^~~~~~
   drivers/usb/misc/usbsevseg.c:264:2: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, "\n");
           ^~~~~~
   drivers/usb/misc/usbsevseg.c:264:2: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
           strcat(buf, "\n");
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/virt/nitro_enclaves/ne_misc_dev.c:878:5: warning: Assigned value=
 is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   i =3D ne_mem_region->nr_pages;
                     ^ ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virt/nitro_enclaves/ne_misc_dev.c:852:6: note: Assuming 'rc' is =
>=3D 0
           if (rc < 0)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/virt/nitro_enclaves/ne_misc_dev.c:852:2: note: '?' condition is =
false
           if (rc < 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/virt/nitro_enclaves/ne_misc_dev.c:852:6: note: 'rc' is >=3D 0
           if (rc < 0)
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
   drivers/virt/nitro_enclaves/ne_misc_dev.c:852:6: note: 'rc' is >=3D 0
           if (rc < 0)
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
   drivers/virt/nitro_enclaves/ne_misc_dev.c:852:2: note: '?' condition is =
false
           if (rc < 0)
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
   drivers/virt/nitro_enclaves/ne_misc_dev.c:852:2: note: Taking false bran=
ch
           if (rc < 0)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/virt/nitro_enclaves/ne_misc_dev.c:855:18: note: Calling 'kzalloc'
           ne_mem_region =3D kzalloc(sizeof(*ne_mem_region), GFP_KERNEL);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Uninitialized value stored to field 'n=
r_pages'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virt/nitro_enclaves/ne_misc_dev.c:855:18: note: Returning from '=
kzalloc'
           ne_mem_region =3D kzalloc(sizeof(*ne_mem_region), GFP_KERNEL);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virt/nitro_enclaves/ne_misc_dev.c:856:6: note: Assuming 'ne_mem_=
region' is non-null
           if (!ne_mem_region)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/virt/nitro_enclaves/ne_misc_dev.c:856:2: note: '?' condition is =
false
           if (!ne_mem_region)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/virt/nitro_enclaves/ne_misc_dev.c:856:7: note: 'ne_mem_region' i=
s non-null
           if (!ne_mem_region)
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

vim +878 drivers/virt/nitro_enclaves/ne_misc_dev.c

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   826  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   827  /**
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   828   * ne_set_user_memory_regi=
on_ioctl() - Add user space memory region to the slot
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   829   *				       associated wi=
th the current enclave.
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   830   * @ne_enclave :	Private d=
ata associated with the current enclave.
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   831   * @mem_region :	User spac=
e memory region to be associated with the given slot.
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   832   *
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   833   * Context: Process contex=
t. This function is called with the ne_enclave mutex held.
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   834   * Return:
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   835   * * 0 on success.
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   836   * * Negative return value=
 on failure.
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   837   */
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   838  static int ne_set_user_mem=
ory_region_ioctl(struct ne_enclave *ne_enclave,
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   839  	struct ne_user_memory_reg=
ion mem_region)
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   840  {
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   841  	long gup_rc =3D 0;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   842  	unsigned long i =3D 0;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   843  	unsigned long max_nr_page=
s =3D 0;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   844  	unsigned long memory_size=
 =3D 0;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   845  	struct ne_mem_region *ne_=
mem_region =3D NULL;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   846  	unsigned long nr_phys_con=
tig_mem_regions =3D 0;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   847  	struct pci_dev *pdev =3D =
ne_devs.ne_pci_dev->pdev;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   848  	struct page **phys_contig=
_mem_regions =3D NULL;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   849  	int rc =3D -EINVAL;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   850  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   851  	rc =3D ne_sanity_check_us=
er_mem_region(ne_enclave, mem_region);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   852  	if (rc < 0)
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   853  		return rc;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   854  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   855  	ne_mem_region =3D kzalloc=
(sizeof(*ne_mem_region), GFP_KERNEL);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   856  	if (!ne_mem_region)
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   857  		return -ENOMEM;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   858  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   859  	max_nr_pages =3D mem_regi=
on.memory_size / NE_MIN_MEM_REGION_SIZE;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   860  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   861  	ne_mem_region->pages =3D =
kcalloc(max_nr_pages, sizeof(*ne_mem_region->pages),
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   862  				       GFP_KERNEL);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   863  	if (!ne_mem_region->pages=
) {
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   864  		rc =3D -ENOMEM;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   865  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   866  		goto free_mem_region;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   867  	}
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   868  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   869  	phys_contig_mem_regions =
=3D kcalloc(max_nr_pages, sizeof(*phys_contig_mem_regions),
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   870  					  GFP_KERNEL);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   871  	if (!phys_contig_mem_regi=
ons) {
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   872  		rc =3D -ENOMEM;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   873  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   874  		goto free_mem_region;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   875  	}
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   876  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   877  	do {
7dc9d4309fdb77 Andra Paraschiv 2020-09-21  @878  		i =3D ne_mem_region->nr_=
pages;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   879  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   880  		if (i =3D=3D max_nr_page=
s) {
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   881  			dev_err_ratelimited(ne_=
misc_dev.this_device,
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   882  					    "Reached max nr o=
f pages in the pages data struct\n");
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   883  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   884  			rc =3D -ENOMEM;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   885  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   886  			goto put_pages;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   887  		}
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   888  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   889  		gup_rc =3D get_user_page=
s(mem_region.userspace_addr + memory_size, 1, FOLL_GET,
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   890  					ne_mem_region->pages =
+ i, NULL);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   891  		if (gup_rc < 0) {
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   892  			rc =3D gup_rc;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   893  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   894  			dev_err_ratelimited(ne_=
misc_dev.this_device,
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   895  					    "Error in get use=
r pages [rc=3D%d]\n", rc);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   896  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   897  			goto put_pages;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   898  		}
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   899  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   900  		rc =3D ne_sanity_check_u=
ser_mem_region_page(ne_enclave, ne_mem_region->pages[i]);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   901  		if (rc < 0)
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   902  			goto put_pages;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   903  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   904  		/*
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   905  		 * TODO: Update once han=
dled non-contiguous memory regions
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   906  		 * received from user sp=
ace or contiguous physical memory regions
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   907  		 * larger than 2 MiB e.g=
. 8 MiB.
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   908  		 */
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   909  		phys_contig_mem_regions[=
i] =3D ne_mem_region->pages[i];
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   910  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   911  		memory_size +=3D page_si=
ze(ne_mem_region->pages[i]);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   912  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   913  		ne_mem_region->nr_pages+=
+;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   914  	} while (memory_size < me=
m_region.memory_size);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   915  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   916  	/*
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   917  	 * TODO: Update once hand=
led non-contiguous memory regions received
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   918  	 * from user space or con=
tiguous physical memory regions larger than
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   919  	 * 2 MiB e.g. 8 MiB.
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   920  	 */
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   921  	nr_phys_contig_mem_region=
s =3D ne_mem_region->nr_pages;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   922  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   923  	if ((ne_enclave->nr_mem_r=
egions + nr_phys_contig_mem_regions) >
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   924  	    ne_enclave->max_mem_r=
egions) {
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   925  		dev_err_ratelimited(ne_m=
isc_dev.this_device,
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   926  				    "Reached max memor=
y regions %lld\n",
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   927  				    ne_enclave->max_me=
m_regions);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   928  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   929  		rc =3D -NE_ERR_MEM_MAX_R=
EGIONS;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   930  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   931  		goto put_pages;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   932  	}
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   933  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   934  	for (i =3D 0; i < nr_phys=
_contig_mem_regions; i++) {
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   935  		u64 phys_region_addr =3D=
 page_to_phys(phys_contig_mem_regions[i]);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   936  		u64 phys_region_size =3D=
 page_size(phys_contig_mem_regions[i]);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   937  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   938  		if (phys_region_size & (=
NE_MIN_MEM_REGION_SIZE - 1)) {
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   939  			dev_err_ratelimited(ne_=
misc_dev.this_device,
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   940  					    "Physical mem reg=
ion size is not multiple of 2 MiB\n");
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   941  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   942  			rc =3D -EINVAL;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   943  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   944  			goto put_pages;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   945  		}
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   946  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   947  		if (!IS_ALIGNED(phys_reg=
ion_addr, NE_MIN_MEM_REGION_SIZE)) {
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   948  			dev_err_ratelimited(ne_=
misc_dev.this_device,
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   949  					    "Physical mem reg=
ion address is not 2 MiB aligned\n");
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   950  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   951  			rc =3D -EINVAL;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   952  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   953  			goto put_pages;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   954  		}
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   955  	}
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   956  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   957  	ne_mem_region->memory_siz=
e =3D mem_region.memory_size;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   958  	ne_mem_region->userspace_=
addr =3D mem_region.userspace_addr;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   959  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   960  	list_add(&ne_mem_region->=
mem_region_list_entry, &ne_enclave->mem_regions_list);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   961  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   962  	for (i =3D 0; i < nr_phys=
_contig_mem_regions; i++) {
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   963  		struct ne_pci_dev_cmd_re=
ply cmd_reply =3D {};
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   964  		struct slot_add_mem_req =
slot_add_mem_req =3D {};
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   965  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   966  		slot_add_mem_req.slot_ui=
d =3D ne_enclave->slot_uid;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   967  		slot_add_mem_req.paddr =
=3D page_to_phys(phys_contig_mem_regions[i]);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   968  		slot_add_mem_req.size =
=3D page_size(phys_contig_mem_regions[i]);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   969  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   970  		rc =3D ne_do_request(pde=
v, SLOT_ADD_MEM,
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   971  				   &slot_add_mem_req, =
sizeof(slot_add_mem_req),
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   972  				   &cmd_reply, sizeof(=
cmd_reply));
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   973  		if (rc < 0) {
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   974  			dev_err_ratelimited(ne_=
misc_dev.this_device,
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   975  					    "Error in slot ad=
d mem [rc=3D%d]\n", rc);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   976  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   977  			kfree(phys_contig_mem_r=
egions);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   978  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   979  			/*
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   980  			 * Exit here without pu=
t pages as memory regions may
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   981  			 * already been added.
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   982  			 */
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   983  			return rc;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   984  		}
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   985  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   986  		ne_enclave->mem_size +=
=3D slot_add_mem_req.size;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   987  		ne_enclave->nr_mem_regio=
ns++;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   988  	}
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   989  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   990  	kfree(phys_contig_mem_reg=
ions);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   991  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   992  	return 0;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   993  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21   994  put_pages:
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   995  	for (i =3D 0; i < ne_mem_=
region->nr_pages; i++)
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   996  		put_page(ne_mem_region->=
pages[i]);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   997  free_mem_region:
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   998  	kfree(phys_contig_mem_reg=
ions);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21   999  	kfree(ne_mem_region->page=
s);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21  1000  	kfree(ne_mem_region);
7dc9d4309fdb77 Andra Paraschiv 2020-09-21  1001  =

7dc9d4309fdb77 Andra Paraschiv 2020-09-21  1002  	return rc;
7dc9d4309fdb77 Andra Paraschiv 2020-09-21  1003  }
7dc9d4309fdb77 Andra Paraschiv 2020-09-21  1004  =


:::::: The code at line 878 was first introduced by commit
:::::: 7dc9d4309fdb7773df13a17e203c16966676f21a nitro_enclaves: Add logic f=
or setting an enclave memory region

:::::: TO: Andra Paraschiv <andraprs@amazon.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6519140085131020410==--

