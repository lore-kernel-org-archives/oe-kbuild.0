Content-Type: multipart/mixed; boundary="===============0918460294584509668=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/3] ipmi: msghandler: add a interface to clean message queue in sysfs
Date: Mon, 28 Mar 2022 09:13:58 +0800
Message-ID: <202203280935.qLHzaRMm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0918460294584509668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <tencent_4BC3A56F75CA5B8CE8D32E90FC61A78FFF05@qq.com>
References: <tencent_4BC3A56F75CA5B8CE8D32E90FC61A78FFF05@qq.com>
TO: Chen Guanqiao <chen.chenchacha@foxmail.com>
TO: minyard(a)acm.org
TO: openipmi-developer(a)lists.sourceforge.net
TO: linux-kernel(a)vger.kernel.org
CC: Chen Guanqiao <chen.chenchacha@foxmail.com>

Hi Chen,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on cminyard-ipmi/for-next]
[also build test WARNING on v5.17 next-20220325]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Guanqiao/ipmi-m=
sghandler-Get-the-number-of-user-through-sysfs/20220328-005308
base:   https://github.com/cminyard/linux-ipmi for-next
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arm-randconfig-c002-20220327 (https://download.01.org/0day-ci/archi=
ve/20220328/202203280935.qLHzaRMm-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/56b9ec5a2846208cd82=
155435eae0c15622057e5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chen-Guanqiao/ipmi-msghandler-Get-=
the-number-of-user-through-sysfs/20220328-005308
        git checkout 56b9ec5a2846208cd82155435eae0c15622057e5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/kref.h:65:3: note: Calling 'intf_free'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:721:2: note: Attempt to free release=
d memory
           kfree(intf);
           ^~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2352:3: warning: Potential leak of m=
emory pointed to by 'smi_msg' [clang-analyzer-unix.Malloc]
                   ipmi_free_recv_msg(recv_msg);
                   ^
   drivers/char/ipmi/ipmi_msghandler.c:3638:6: note: Assuming field 'in_shu=
tdown' is false
           if (!intf->in_shutdown)
               ^~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:3638:2: note: Taking true branch
           if (!intf->in_shutdown)
           ^
   drivers/char/ipmi/ipmi_msghandler.c:3639:3: note: Calling 'bmc_get_devic=
e_id'
                   bmc_get_device_id(intf, NULL, NULL, NULL, NULL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2709:9: note: Calling '__bmc_get_dev=
ice_id'
           return __bmc_get_device_id(intf, bmc, id, guid_set, guid, -1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2578:18: note: 'intf' is not equal t=
o NULL
           bool intf_set =3D intf !=3D NULL;
                           ^~~~
   drivers/char/ipmi/ipmi_msghandler.c:2580:7: note: 'intf' is non-null
           if (!intf) {
                ^~~~
   drivers/char/ipmi/ipmi_msghandler.c:2580:2: note: Taking false branch
           if (!intf) {
           ^
   drivers/char/ipmi/ipmi_msghandler.c:2607:6: note: Assuming field 'in_bmc=
_register' is false
           if (intf->in_bmc_register ||
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2607:6: note: Left side of '||' is f=
alse
   drivers/char/ipmi/ipmi_msghandler.c:2608:7: note: Assuming field 'dyn_id=
_set' is 0
               (bmc->dyn_id_set && time_is_after_jiffies(bmc->dyn_id_expiry=
)))
                ^~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2608:23: note: Left side of '&&' is =
false
               (bmc->dyn_id_set && time_is_after_jiffies(bmc->dyn_id_expiry=
)))
                                ^
   drivers/char/ipmi/ipmi_msghandler.c:2612:2: note: Calling '__get_guid'
           __get_guid(intf);
           ^~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:3459:7: note: Calling 'send_guid_cmd'
           rv =3D send_guid_cmd(intf, 0);
                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:3403:9: note: Calling 'i_ipmi_reques=
t'
           return i_ipmi_request(NULL,
                  ^~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2290:6: note: 'supplied_recv' is null
           if (supplied_recv)
               ^~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2290:2: note: Taking false branch
           if (supplied_recv)
           ^
   drivers/char/ipmi/ipmi_msghandler.c:2294:7: note: 'recv_msg' is not equa=
l to NULL
                   if (recv_msg =3D=3D NULL) {
                       ^~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2294:3: note: Taking false branch
                   if (recv_msg =3D=3D NULL) {
                   ^
   drivers/char/ipmi/ipmi_msghandler.c:2301:6: note: 'supplied_smi' is null
           if (supplied_smi)
               ^~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2301:2: note: Taking false branch
           if (supplied_smi)
           ^
   drivers/char/ipmi/ipmi_msghandler.c:2304:13: note: Calling 'ipmi_alloc_s=
mi_msg'
                   smi_msg =3D ipmi_alloc_smi_msg();
                             ^~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:5204:7: note: Memory is allocated
           rv =3D kmalloc(sizeof(struct ipmi_smi_msg), GFP_ATOMIC);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:5205:6: note: Assuming 'rv' is non-n=
ull
           if (rv) {
               ^~
   drivers/char/ipmi/ipmi_msghandler.c:5205:2: note: Taking true branch
           if (rv) {
           ^
   drivers/char/ipmi/ipmi_msghandler.c:2304:13: note: Returned allocated me=
mory
                   smi_msg =3D ipmi_alloc_smi_msg();
                             ^~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2305:7: note: 'smi_msg' is not equal=
 to NULL
                   if (smi_msg =3D=3D NULL) {
                       ^~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2305:3: note: Taking false branch
                   if (smi_msg =3D=3D NULL) {
                   ^
   drivers/char/ipmi/ipmi_msghandler.c:2314:6: note: Assuming field 'in_shu=
tdown' is true
           if (intf->in_shutdown) {
               ^~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2314:2: note: Taking true branch
           if (intf->in_shutdown) {
           ^
   drivers/char/ipmi/ipmi_msghandler.c:2316:3: note: Control jumps to line =
2351
                   goto out_err;
                   ^
   drivers/char/ipmi/ipmi_msghandler.c:2352:3: note: Potential leak of memo=
ry pointed to by 'smi_msg'
                   ipmi_free_recv_msg(recv_msg);
                   ^
>> drivers/char/ipmi/ipmi_msghandler.c:2816:2: warning: Use of memory after=
 it is freed [clang-analyzer-unix.Malloc]
           list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
           ^
   include/linux/rculist.h:393:9: note: expanded from macro 'list_for_each_=
entry_rcu'
                   pos =3D list_entry_rcu(pos->member.next, typeof(*pos), m=
ember))
                         ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   drivers/char/ipmi/ipmi_msghandler.c:3025:6: note: Assuming the condition=
 is false
           if (!sysfs_streq(buf, "1"))
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:3025:2: note: Taking false branch
           if (!sysfs_streq(buf, "1"))
           ^
   drivers/char/ipmi/ipmi_msghandler.c:3028:2: note: Calling 'cleanup_msgs_=
queue'
           cleanup_msgs_queue();
           ^~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:2816:2: note: Left side of '||' is f=
alse
           list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/char/ipmi/ipmi_msghandler.c:2816:2: note: Left side of '||' is f=
alse
           list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/char/ipmi/ipmi_msghandler.c:2816:2: note: Left side of '||' is t=
rue
           list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:314:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   drivers/char/ipmi/ipmi_msghandler.c:2816:2: note: Taking false branch
           list_for_each_entry_rcu(intf, &ipmi_interfaces, link) {
           ^
   include/linux/rculist.h:391:13: note: expanded from macro 'list_for_each=
_entry_rcu'
                pos =3D list_entry_rcu((head)->next, typeof(*pos), member);=
  \
                      ^
   include/linux/rculist.h:307:15: note: expanded from macro 'list_entry_rc=
u'
           container_of(READ_ONCE(ptr), type, member)
                        ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/char/ipmi/ipmi_msghandler.c:2816:2: note: Loop condition is fals=
e.  Exiting loop

vim +2816 drivers/char/ipmi/ipmi_msghandler.c

56b9ec5a284620 Chen Guanqiao 2022-03-28  2809  =

56b9ec5a284620 Chen Guanqiao 2022-03-28  2810  static void cleanup_msgs_que=
ue(void)
56b9ec5a284620 Chen Guanqiao 2022-03-28  2811  {
56b9ec5a284620 Chen Guanqiao 2022-03-28  2812  	struct ipmi_smi *intf;
56b9ec5a284620 Chen Guanqiao 2022-03-28  2813  	int index;
56b9ec5a284620 Chen Guanqiao 2022-03-28  2814  =

56b9ec5a284620 Chen Guanqiao 2022-03-28  2815  	index =3D srcu_read_lock(&i=
pmi_interfaces_srcu);
56b9ec5a284620 Chen Guanqiao 2022-03-28 @2816  	list_for_each_entry_rcu(int=
f, &ipmi_interfaces, link) {
56b9ec5a284620 Chen Guanqiao 2022-03-28  2817  		struct bmc_device *bmc =3D=
 intf->bmc;
56b9ec5a284620 Chen Guanqiao 2022-03-28  2818  =

56b9ec5a284620 Chen Guanqiao 2022-03-28  2819  		kref_get(&intf->refcount);
56b9ec5a284620 Chen Guanqiao 2022-03-28  2820  		mutex_lock(&intf->bmc_reg_=
mutex);
56b9ec5a284620 Chen Guanqiao 2022-03-28  2821  		mutex_lock(&bmc->dyn_mutex=
);
56b9ec5a284620 Chen Guanqiao 2022-03-28  2822  =

56b9ec5a284620 Chen Guanqiao 2022-03-28  2823  		__cleanup_msgs_queue(intf);
56b9ec5a284620 Chen Guanqiao 2022-03-28  2824  =

56b9ec5a284620 Chen Guanqiao 2022-03-28  2825  		mutex_unlock(&bmc->dyn_mut=
ex);
56b9ec5a284620 Chen Guanqiao 2022-03-28  2826  		mutex_unlock(&intf->bmc_re=
g_mutex);
56b9ec5a284620 Chen Guanqiao 2022-03-28  2827  		kref_put(&intf->refcount, =
intf_free);
56b9ec5a284620 Chen Guanqiao 2022-03-28  2828  	}
56b9ec5a284620 Chen Guanqiao 2022-03-28  2829  	srcu_read_unlock(&ipmi_inte=
rfaces_srcu, index);
56b9ec5a284620 Chen Guanqiao 2022-03-28  2830  }
56b9ec5a284620 Chen Guanqiao 2022-03-28  2831  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0918460294584509668==--

