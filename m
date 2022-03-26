Content-Type: multipart/mixed; boundary="===============1539550053187120714=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] Bluetooth: btusb: Add Intel devcoredump support
Date: Sat, 26 Mar 2022 13:47:39 +0800
Message-ID: <202203261345.wp9YyAkO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1539550053187120714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220320183225.2.I61857ea92be43418b8ce16839f79a4704cc89fa6@=
changeid>
References: <20220320183225.2.I61857ea92be43418b8ce16839f79a4704cc89fa6@c=
hangeid>
TO: Manish Mandlik <mmandlik@google.com>
TO: marcel(a)holtmann.org
TO: luiz.dentz(a)gmail.com
CC: chromeos-bluetooth-upstreaming(a)chromium.org
CC: linux-bluetooth(a)vger.kernel.org
CC: "Abhishek Pandit-Subedi" <abhishekpandit@chromium.org>
CC: Manish Mandlik <mmandlik@google.com>
CC: Chethan Tumkur Narayan <chethan.tumkur.narayan@intel.com>
CC: Johan Hedberg <johan.hedberg@gmail.com>
CC: linux-kernel(a)vger.kernel.org

Hi Manish,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bluetooth/master]
[also build test WARNING on bluetooth-next/master v5.17 next-20220325]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Manish-Mandlik/Bluetooth-A=
dd-support-for-devcoredump/20220321-093553
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
.git master
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
326/202203261345.wp9YyAkO-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/677f482cb7027ab030842015c=
fd6c188568df39f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Manish-Mandlik/Bluetooth-Add-suppo=
rt-for-devcoredump/20220321-093553
        git checkout 677f482cb7027ab030842015cfd6c188568df39f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                      ^~~~
   drivers/bluetooth/btintel.c:636:2: note: '?' condition is false
           if (skb->data[0]) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/bluetooth/btintel.c:636:2: note: '?' condition is false
           if (skb->data[0]) {
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
   drivers/bluetooth/btintel.c:636:2: note: Taking false branch
           if (skb->data[0]) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/bluetooth/btintel.c:643:2: note: Calling 'btintel_parse_version_=
tlv'
           btintel_parse_version_tlv(hdev, version, skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btintel.c:530:2: note: Loop condition is false. Execut=
ion continues on line 617
           while (skb->len) {
           ^
   drivers/bluetooth/btintel.c:617:2: note: Returning without writing to 'v=
ersion->cnvi_bt'
           return 0;
           ^
   drivers/bluetooth/btintel.c:643:2: note: Returning from 'btintel_parse_v=
ersion_tlv'
           btintel_parse_version_tlv(hdev, version, skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btintel.c:646:2: note: Returning without writing to 'v=
ersion->cnvi_bt'
           return 0;
           ^
   drivers/bluetooth/btintel.c:2360:8: note: Returning from 'btintel_read_v=
ersion_tlv'
           err =3D btintel_read_version_tlv(hdev, &new_ver);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btintel.c:2361:2: note: '?' condition is false
           if (err)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/bluetooth/btintel.c:2361:6: note: 'err' is 0
           if (err)
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
   drivers/bluetooth/btintel.c:2361:2: note: '?' condition is false
           if (err)
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
   drivers/bluetooth/btintel.c:2361:2: note: Taking false branch
           if (err)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/bluetooth/btintel.c:2364:2: note: Calling 'btintel_version_info_=
tlv'
           btintel_version_info_tlv(hdev, &new_ver);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btintel.c:444:6: note: The left operand of '&' is a ga=
rbage value
           if (INTEL_HW_PLATFORM(version->cnvi_bt) !=3D 0x37) {
               ^
   drivers/bluetooth/btintel.h:146:53: note: expanded from macro 'INTEL_HW_=
PLATFORM'
   #define INTEL_HW_PLATFORM(cnvx_bt)      ((u8)(((cnvx_bt) & 0x0000ff00) >=
> 8))
                                                   ~~~~~~~  ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
>> drivers/bluetooth/btintel.c:1425:2: warning: Value stored to 'ptr' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           ptr +=3D read;
           ^      ~~~~
   drivers/bluetooth/btintel.c:1425:2: note: Value stored to 'ptr' is never=
 read
           ptr +=3D read;
           ^      ~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   sound/synth/util_mem.c:50:3: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
                   list_del(p);
                   ^        ~
   sound/synth/util_mem.c:46:6: note: Assuming 'hdr' is non-null
           if (!hdr)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/synth/util_mem.c:46:2: note: '?' condition is false
           if (!hdr)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/synth/util_mem.c:46:7: note: 'hdr' is non-null
           if (!hdr)
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
   sound/synth/util_mem.c:46:7: note: 'hdr' is non-null
           if (!hdr)
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
   sound/synth/util_mem.c:46:2: note: '?' condition is false
           if (!hdr)
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
   sound/synth/util_mem.c:46:2: note: Taking false branch
           if (!hdr)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/synth/util_mem.c:49:2: note: Loop condition is true.  Entering loo=
p body
           while ((p =3D hdr->block.next) !=3D &hdr->block) {
           ^
   sound/synth/util_mem.c:51:3: note: Memory is released
                   kfree(get_memblk(p));
                   ^~~~~~~~~~~~~~~~~~~~
   sound/synth/util_mem.c:49:2: note: Loop condition is true.  Entering loo=
p body
           while ((p =3D hdr->block.next) !=3D &hdr->block) {
           ^
   sound/synth/util_mem.c:50:3: note: Use of memory after it is freed
                   list_del(p);
                   ^        ~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   net/ipv6/route.c:567:6: warning: Access to field 'nh' results in a deref=
erence of a null pointer (loaded from variable 'f6i') [clang-analyzer-core.=
NullDereference]
           if (unlikely(f6i->nh)) {
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^                ~
   include/linux/compiler.h:33:33: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                        ^~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'

vim +/ptr +1425 drivers/bluetooth/btintel.c

927ac8da35db763 Joseph Hwang           2021-08-15  1404  =

677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1405  static int btintel=
_dmp_hdr(struct hci_dev *hdev, char *buf, size_t size)
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1406  {
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1407  	char *ptr =3D buf;
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1408  	size_t rem =3D si=
ze;
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1409  	size_t read =3D 0;
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1410  =

677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1411  	read =3D snprintf=
(ptr, rem, "Controller Name: 0x%X\n", hw_variant);
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1412  	rem -=3D read;
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1413  	ptr +=3D read;
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1414  =

677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1415  	read =3D snprintf=
(ptr, rem, "Firmware Version: 0x%X\n", fw_build_num);
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1416  	rem -=3D read;
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1417  	ptr +=3D read;
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1418  =

677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1419  	read =3D snprintf=
(ptr, rem, "Driver: %s\n", driver_name);
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1420  	rem -=3D read;
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1421  	ptr +=3D read;
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1422  =

677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1423  	read =3D snprintf=
(ptr, rem, "Vendor: Intel\n");
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1424  	rem -=3D read;
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20 @1425  	ptr +=3D read;
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1426  =

677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1427  	return size - rem;
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1428  }
677f482cb7027ab Abhishek Pandit-Subedi 2022-03-20  1429  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1539550053187120714==--

