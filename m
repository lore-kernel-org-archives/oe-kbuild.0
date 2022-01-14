Content-Type: multipart/mixed; boundary="===============8036607963670482404=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v10 1/2] bluetooth: msft: Handle MSFT Monitor Device Event
Date: Fri, 14 Jan 2022 15:58:36 +0800
Message-ID: <202201141502.K9VxPX1a-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8036607963670482404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220111081048.v10.1.Ic0a40b84dee3825302890aaea690e73165c7182=
0@changeid>
References: <20220111081048.v10.1.Ic0a40b84dee3825302890aaea690e73165c71820=
@changeid>
TO: Manish Mandlik <mmandlik@google.com>
TO: marcel(a)holtmann.org
TO: luiz.dentz(a)gmail.com
CC: linux-bluetooth(a)vger.kernel.org
CC: chromeos-bluetooth-upstreaming(a)chromium.org
CC: Manish Mandlik <mmandlik@google.com>
CC: "Miao-chen Chou" <mcchou@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Johan Hedberg <johan.hedberg@gmail.com>
CC: linux-kernel(a)vger.kernel.org
CC: netdev(a)vger.kernel.org

Hi Manish,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on next-20220113]
[cannot apply to bluetooth/master v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Manish-Mandlik/bluetooth-m=
sft-Handle-MSFT-Monitor-Device-Event/20220112-001634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
-next.git master
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
114/202201141502.K9VxPX1a-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/70532b5d55db00ce650dedd8f=
8dceece7a705dc5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Manish-Mandlik/bluetooth-msft-Hand=
le-MSFT-Monitor-Device-Event/20220112-001634
        git checkout 70532b5d55db00ce650dedd8f8dceece7a705dc5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/target/target_core_fabric_configfs.c:1009:2: note: Taking false =
branch
           if (kstrtoint(page, 0, &compl_val))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/target/target_core_fabric_configfs.c:1012:2: note: Control jumps=
 to the 'default' case at line 1019
           switch (compl_val) {
           ^
   drivers/target/target_core_fabric_configfs.c:1020:7: note: Assuming 'com=
pl_val' is >=3D 0
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/target/target_core_fabric_configfs.c:1020:7: note: Left side of =
'||' is false
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
                       ^
   drivers/target/target_core_fabric_configfs.c:1020:24: note: Assuming 'co=
mpl_val' is < 1
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/target/target_core_fabric_configfs.c:1020:7: note: Left side of =
'||' is false
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
                       ^
   drivers/target/target_core_fabric_configfs.c:1020:3: note: '?' condition=
 is false
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/target/target_core_fabric_configfs.c:1020:7: note: 'compl_val' i=
s >=3D 0
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
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
   drivers/target/target_core_fabric_configfs.c:1020:7: note: Left side of =
'||' is false
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
                       ^
   drivers/target/target_core_fabric_configfs.c:1020:24: note: 'compl_val' =
is < 1
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
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
   drivers/target/target_core_fabric_configfs.c:1020:7: note: Left side of =
'||' is false
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
                       ^
   drivers/target/target_core_fabric_configfs.c:1020:3: note: '?' condition=
 is false
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
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
   drivers/target/target_core_fabric_configfs.c:1020:3: note: Taking false =
branch
                   if (compl_val < 0 || compl_val >=3D nr_cpu_ids ||
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/target/target_core_fabric_configfs.c:1027:27: note: Access to fi=
eld 'cmd_compl_affinity' results in a dereference of a null pointer (loaded=
 from variable 'wwn')
                   wwn->cmd_compl_affinity =3D compl_val;
                   ~~~                     ^
   5 warnings generated.
>> net/bluetooth/msft.c:222:2: warning: Use of memory after it is freed [cl=
ang-analyzer-unix.Malloc]
           list_for_each_entry_safe(dev, tmp, &hdev->monitored_devices, lis=
t) {
           ^
   include/linux/list.h:718:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   net/bluetooth/msft.c:728:6: note: Assuming 'msft' is non-null
           if (!msft)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/bluetooth/msft.c:728:2: note: '?' condition is false
           if (!msft)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/bluetooth/msft.c:728:7: note: 'msft' is non-null
           if (!msft)
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
   net/bluetooth/msft.c:728:2: note: '?' condition is false
           if (!msft)
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
   net/bluetooth/msft.c:728:2: note: Taking false branch
           if (!msft)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/bluetooth/msft.c:734:6: note: Assuming field 'evt_prefix_len' is <=
=3D 0
           if (msft->evt_prefix_len > 0) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/bluetooth/msft.c:734:2: note: '?' condition is false
           if (msft->evt_prefix_len > 0) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/bluetooth/msft.c:734:12: note: Field 'evt_prefix_len' is <=3D 0
           if (msft->evt_prefix_len > 0) {
                     ^
   net/bluetooth/msft.c:734:2: note: '?' condition is false
           if (msft->evt_prefix_len > 0) {
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
   net/bluetooth/msft.c:734:2: note: Taking false branch
           if (msft->evt_prefix_len > 0) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +222 net/bluetooth/msft.c

182ee45da083db Luiz Augusto von Dentz 2021-10-27  214  =

70532b5d55db00 Manish Mandlik         2022-01-11  215  /* This function req=
uires the caller holds hdev->lock */
70532b5d55db00 Manish Mandlik         2022-01-11  216  static int msft_moni=
tor_device_del(struct hci_dev *hdev, __u16 mgmt_handle,
70532b5d55db00 Manish Mandlik         2022-01-11  217  				   bdaddr_t *bda=
ddr, __u8 addr_type)
70532b5d55db00 Manish Mandlik         2022-01-11  218  {
70532b5d55db00 Manish Mandlik         2022-01-11  219  	struct monitored_de=
vice *dev, *tmp;
70532b5d55db00 Manish Mandlik         2022-01-11  220  	int count =3D 0;
70532b5d55db00 Manish Mandlik         2022-01-11  221  =

70532b5d55db00 Manish Mandlik         2022-01-11 @222  	list_for_each_entry=
_safe(dev, tmp, &hdev->monitored_devices, list) {
70532b5d55db00 Manish Mandlik         2022-01-11  223  		/* mgmt_handle =3D=
=3D 0 indicates remove all devices, whereas,
70532b5d55db00 Manish Mandlik         2022-01-11  224  		 * bdaddr =3D=3D N=
ULL indicates remove all devices matching the
70532b5d55db00 Manish Mandlik         2022-01-11  225  		 * mgmt_handle.
70532b5d55db00 Manish Mandlik         2022-01-11  226  		 */
70532b5d55db00 Manish Mandlik         2022-01-11  227  		if ((!mgmt_handle =
|| dev->handle =3D=3D mgmt_handle) &&
70532b5d55db00 Manish Mandlik         2022-01-11  228  		    (!bdaddr || (!=
bacmp(bdaddr, &dev->bdaddr) &&
70532b5d55db00 Manish Mandlik         2022-01-11  229  				 addr_type =3D=
=3D dev->addr_type))) {
70532b5d55db00 Manish Mandlik         2022-01-11  230  			list_del(&dev->li=
st);
70532b5d55db00 Manish Mandlik         2022-01-11  231  			kfree(dev);
70532b5d55db00 Manish Mandlik         2022-01-11  232  			count++;
70532b5d55db00 Manish Mandlik         2022-01-11  233  		}
70532b5d55db00 Manish Mandlik         2022-01-11  234  	}
70532b5d55db00 Manish Mandlik         2022-01-11  235  =

70532b5d55db00 Manish Mandlik         2022-01-11  236  	return count;
70532b5d55db00 Manish Mandlik         2022-01-11  237  }
70532b5d55db00 Manish Mandlik         2022-01-11  238  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8036607963670482404==--

