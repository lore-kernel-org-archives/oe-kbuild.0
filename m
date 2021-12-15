Content-Type: multipart/mixed; boundary="===============3584724922303380228=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android12-5.10-2021-09 4582/10860] lib/test_kasan_module.c:41:2: warning: Value stored to 'unused' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 16 Dec 2021 07:28:36 +0800
Message-ID: <202112160728.tIW3Y6j7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3584724922303380228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.10-2021-=
09
head:   ee75d385a3eaa0e0f430d77b0e610914e3764678
commit: 916518ead7a5c918acbd0bdb48e8e5dd10e62bd8 [4582/10860] FROMGIT: kasa=
n: rename CONFIG_TEST_KASAN_MODULE
:::::: branch date: 5 days ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-c007-20211214 (https://download.01.org/0day-ci/ar=
chive/20211216/202112160728.tIW3Y6j7-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kern=
el/common
        git fetch --no-tags android-common android12-5.10-2021-09
        git checkout 916518ead7a5c918acbd0bdb48e8e5dd10e62bd8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:311:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:301:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/scsi/libsas/sas_expander.c:1851:2: note: Loop condition is true.=
  Entering loop body
           list_for_each_entry(ch, &ex->children, siblings) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/scsi/libsas/sas_expander.c:1852:3: note: Taking true branch
                   if (dev_is_expander(ch->dev_type)) {
                   ^
   drivers/scsi/libsas/sas_expander.c:1853:10: note: Calling 'sas_find_bcas=
t_dev'
                           res =3D sas_find_bcast_dev(ch, src_dev);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_expander.c:1832:8: note: Calling 'sas_get_ex_cha=
nge_count'
           res =3D sas_get_ex_change_count(dev, &ex_change_count);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_expander.c:1782:6: note: Assuming 'rg_req' is no=
n-null
           if (!rg_req)
               ^~~~~~~
   drivers/scsi/libsas/sas_expander.c:1782:2: note: Taking false branch
           if (!rg_req)
           ^
   drivers/scsi/libsas/sas_expander.c:1785:12: note: Calling 'alloc_smp_res=
p'
           rg_resp =3D alloc_smp_resp(RG_RESP_SIZE);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_expander.c:163:9: note: Calling 'kzalloc'
           return kzalloc(size, GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:664:9: note: Uninitialized value stored to field 'r=
esult'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:664:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_expander.c:163:9: note: Returning from 'kzalloc'
           return kzalloc(size, GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_expander.c:163:2: note: Returning pointer, which=
 participates in a condition later
           return kzalloc(size, GFP_KERNEL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_expander.c:1785:12: note: Returning from 'alloc_=
smp_resp'
           rg_resp =3D alloc_smp_resp(RG_RESP_SIZE);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_expander.c:1786:6: note: Assuming 'rg_resp' is n=
on-null
           if (!rg_resp) {
               ^~~~~~~~
   drivers/scsi/libsas/sas_expander.c:1786:2: note: Taking false branch
           if (!rg_resp) {
           ^
   drivers/scsi/libsas/sas_expander.c:1793:8: note: Calling 'smp_execute_ta=
sk'
           res =3D smp_execute_task(dev, rg_req, RG_REQ_SIZE, rg_resp,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_expander.c:148:2: note: Returning without writin=
g to 'resp->result'
           return smp_execute_task_sg(dev, &req_sg, &resp_sg);
           ^
   drivers/scsi/libsas/sas_expander.c:148:2: note: Returning value, which p=
articipates in a condition later
           return smp_execute_task_sg(dev, &req_sg, &resp_sg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_expander.c:1793:8: note: Returning from 'smp_exe=
cute_task'
           res =3D smp_execute_task(dev, rg_req, RG_REQ_SIZE, rg_resp,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libsas/sas_expander.c:1795:6: note: Assuming 'res' is 0
           if (res)
               ^~~
   drivers/scsi/libsas/sas_expander.c:1795:2: note: Taking false branch
           if (res)
           ^
   drivers/scsi/libsas/sas_expander.c:1797:22: note: The left operand of '!=
=3D' is a garbage value
           if (rg_resp->result !=3D SMP_RESP_FUNC_ACC) {
               ~~~~~~~~~~~~~~~ ^
   Suppressed 4 warnings (4 in non-user code).
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
   10 warnings generated.
>> lib/test_kasan_module.c:41:2: warning: Value stored to 'unused' is never=
 read [clang-analyzer-deadcode.DeadStores]
           unused =3D copy_from_user(kmem, usermem, size + 1 + OOB_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:41:2: note: Value stored to 'unused' is never re=
ad
           unused =3D copy_from_user(kmem, usermem, size + 1 + OOB_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:44:2: warning: Value stored to 'unused' is never=
 read [clang-analyzer-deadcode.DeadStores]
           unused =3D copy_to_user(usermem, kmem, size + 1 + OOB_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:44:2: note: Value stored to 'unused' is never re=
ad
           unused =3D copy_to_user(usermem, kmem, size + 1 + OOB_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:47:2: warning: Value stored to 'unused' is never=
 read [clang-analyzer-deadcode.DeadStores]
           unused =3D __copy_from_user(kmem, usermem, size + 1 + OOB_TAG_OF=
F);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:47:2: note: Value stored to 'unused' is never re=
ad
           unused =3D __copy_from_user(kmem, usermem, size + 1 + OOB_TAG_OF=
F);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:50:2: warning: Value stored to 'unused' is never=
 read [clang-analyzer-deadcode.DeadStores]
           unused =3D __copy_to_user(usermem, kmem, size + 1 + OOB_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:50:2: note: Value stored to 'unused' is never re=
ad
           unused =3D __copy_to_user(usermem, kmem, size + 1 + OOB_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:53:2: warning: Value stored to 'unused' is never=
 read [clang-analyzer-deadcode.DeadStores]
           unused =3D __copy_from_user_inatomic(kmem, usermem, size + 1 + O=
OB_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   lib/test_kasan_module.c:53:2: note: Value stored to 'unused' is never re=
ad
           unused =3D __copy_from_user_inatomic(kmem, usermem, size + 1 + O=
OB_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   lib/test_kasan_module.c:56:2: warning: Value stored to 'unused' is never=
 read [clang-analyzer-deadcode.DeadStores]
           unused =3D __copy_to_user_inatomic(usermem, kmem, size + 1 + OOB=
_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   lib/test_kasan_module.c:56:2: note: Value stored to 'unused' is never re=
ad
           unused =3D __copy_to_user_inatomic(usermem, kmem, size + 1 + OOB=
_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   lib/test_kasan_module.c:59:2: warning: Value stored to 'unused' is never=
 read [clang-analyzer-deadcode.DeadStores]
           unused =3D strncpy_from_user(kmem, usermem, size + 1 + OOB_TAG_O=
FF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:59:2: note: Value stored to 'unused' is never re=
ad
           unused =3D strncpy_from_user(kmem, usermem, size + 1 + OOB_TAG_O=
FF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/test_kasan_module.c:76:8: warning: Use of memory after it is freed [=
clang-analyzer-unix.Malloc]
           fp->i =3D 1;
           ~~~~~ ^
   lib/test_kasan_module.c:72:30: note: Left side of '&&' is false
           struct kasan_rcu_info *fp =3D container_of(rp,
                                       ^
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   lib/test_kasan_module.c:72:30: note: Taking false branch
           struct kasan_rcu_info *fp =3D container_of(rp,
                                       ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:323:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:311:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:303:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   lib/test_kasan_module.c:72:30: note: Loop condition is false.  Exiting l=
oop
           struct kasan_rcu_info *fp =3D container_of(rp,
                                       ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:323:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:311:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:301:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   lib/test_kasan_module.c:75:2: note: Memory is released
           kfree(fp);
           ^~~~~~~~~
   lib/test_kasan_module.c:76:8: note: Use of memory after it is freed
           fp->i =3D 1;
           ~~~~~ ^
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/gfs2/glock.c:643:3: warning: Called function pointer is null (null de=
reference) [clang-analyzer-core.CallAndMessage]
                   glops->go_inval(gl, target =3D=3D LM_ST_DEFERRED ? 0 : D=
IO_METADATA);
                   ^~~~~~~~~~~~~~~
   fs/gfs2/glock.c:586:42: note: Assuming 'gh' is null
           unsigned int lck_flags =3D (unsigned int)(gh ? gh->gh_flags : 0);
                                                   ^~
   fs/gfs2/glock.c:586:42: note: '?' condition is false
   fs/gfs2/glock.c:589:6: note: Assuming 'target' is equal to LM_ST_UNLOCKED
           if (target !=3D LM_ST_UNLOCKED && glock_blocked_by_withdraw(gl) =
&&
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:589:31: note: Left side of '&&' is false
           if (target !=3D LM_ST_UNLOCKED && glock_blocked_by_withdraw(gl) =
&&
                                        ^
   fs/gfs2/glock.c:594:19: note: Assuming 'target' is not equal to field 'g=
l_state'
           GLOCK_BUG_ON(gl, gl->gl_state =3D=3D target);
                            ^
   fs/gfs2/glock.h:205:46: note: expanded from macro 'GLOCK_BUG_ON'
   #define GLOCK_BUG_ON(gl,x) do { if (unlikely(x)) {              \
                                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/gfs2/glock.c:594:2: note: Taking false branch
           GLOCK_BUG_ON(gl, gl->gl_state =3D=3D target);
           ^
   fs/gfs2/glock.h:205:33: note: expanded from macro 'GLOCK_BUG_ON'
   #define GLOCK_BUG_ON(gl,x) do { if (unlikely(x)) {              \
                                   ^
   fs/gfs2/glock.c:594:2: note: Loop condition is false.  Exiting loop
           GLOCK_BUG_ON(gl, gl->gl_state =3D=3D target);
           ^
   fs/gfs2/glock.h:205:28: note: expanded from macro 'GLOCK_BUG_ON'
   #define GLOCK_BUG_ON(gl,x) do { if (unlikely(x)) {              \
                              ^
   fs/gfs2/glock.c:595:19: note: Assuming field 'gl_state' is not equal to =
field 'gl_target'
           GLOCK_BUG_ON(gl, gl->gl_state =3D=3D gl->gl_target);
                            ^
   fs/gfs2/glock.h:205:46: note: expanded from macro 'GLOCK_BUG_ON'
   #define GLOCK_BUG_ON(gl,x) do { if (unlikely(x)) {              \
                                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/gfs2/glock.c:595:2: note: Taking false branch

vim +/unused +41 lib/test_kasan_module.c

73228c7ecc5e40 Patricia Alfonso 2020-10-13  19  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  20  static noinline void __init=
 copy_user_test(void)
73228c7ecc5e40 Patricia Alfonso 2020-10-13  21  {
73228c7ecc5e40 Patricia Alfonso 2020-10-13  22  	char *kmem;
73228c7ecc5e40 Patricia Alfonso 2020-10-13  23  	char __user *usermem;
73228c7ecc5e40 Patricia Alfonso 2020-10-13  24  	size_t size =3D 10;
73228c7ecc5e40 Patricia Alfonso 2020-10-13  25  	int unused;
73228c7ecc5e40 Patricia Alfonso 2020-10-13  26  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  27  	kmem =3D kmalloc(size, GFP=
_KERNEL);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  28  	if (!kmem)
73228c7ecc5e40 Patricia Alfonso 2020-10-13  29  		return;
73228c7ecc5e40 Patricia Alfonso 2020-10-13  30  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  31  	usermem =3D (char __user *=
)vm_mmap(NULL, 0, PAGE_SIZE,
73228c7ecc5e40 Patricia Alfonso 2020-10-13  32  			    PROT_READ | PROT_WRI=
TE | PROT_EXEC,
73228c7ecc5e40 Patricia Alfonso 2020-10-13  33  			    MAP_ANONYMOUS | MAP_=
PRIVATE, 0);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  34  	if (IS_ERR(usermem)) {
73228c7ecc5e40 Patricia Alfonso 2020-10-13  35  		pr_err("Failed to allocat=
e user memory\n");
73228c7ecc5e40 Patricia Alfonso 2020-10-13  36  		kfree(kmem);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  37  		return;
73228c7ecc5e40 Patricia Alfonso 2020-10-13  38  	}
73228c7ecc5e40 Patricia Alfonso 2020-10-13  39  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  40  	pr_info("out-of-bounds in =
copy_from_user()\n");
73228c7ecc5e40 Patricia Alfonso 2020-10-13 @41  	unused =3D copy_from_user(=
kmem, usermem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  42  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  43  	pr_info("out-of-bounds in =
copy_to_user()\n");
73228c7ecc5e40 Patricia Alfonso 2020-10-13  44  	unused =3D copy_to_user(us=
ermem, kmem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  45  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  46  	pr_info("out-of-bounds in =
__copy_from_user()\n");
73228c7ecc5e40 Patricia Alfonso 2020-10-13  47  	unused =3D __copy_from_use=
r(kmem, usermem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  48  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  49  	pr_info("out-of-bounds in =
__copy_to_user()\n");
73228c7ecc5e40 Patricia Alfonso 2020-10-13  50  	unused =3D __copy_to_user(=
usermem, kmem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  51  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  52  	pr_info("out-of-bounds in =
__copy_from_user_inatomic()\n");
73228c7ecc5e40 Patricia Alfonso 2020-10-13  53  	unused =3D __copy_from_use=
r_inatomic(kmem, usermem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  54  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  55  	pr_info("out-of-bounds in =
__copy_to_user_inatomic()\n");
73228c7ecc5e40 Patricia Alfonso 2020-10-13  56  	unused =3D __copy_to_user_=
inatomic(usermem, kmem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  57  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  58  	pr_info("out-of-bounds in =
strncpy_from_user()\n");
73228c7ecc5e40 Patricia Alfonso 2020-10-13  59  	unused =3D strncpy_from_us=
er(kmem, usermem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  60  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  61  	vm_munmap((unsigned long)u=
sermem, PAGE_SIZE);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  62  	kfree(kmem);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  63  }
73228c7ecc5e40 Patricia Alfonso 2020-10-13  64  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  65  static struct kasan_rcu_inf=
o {
73228c7ecc5e40 Patricia Alfonso 2020-10-13  66  	int i;
73228c7ecc5e40 Patricia Alfonso 2020-10-13  67  	struct rcu_head rcu;
73228c7ecc5e40 Patricia Alfonso 2020-10-13  68  } *global_rcu_ptr;
73228c7ecc5e40 Patricia Alfonso 2020-10-13  69  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  70  static noinline void __init=
 kasan_rcu_reclaim(struct rcu_head *rp)
73228c7ecc5e40 Patricia Alfonso 2020-10-13  71  {
73228c7ecc5e40 Patricia Alfonso 2020-10-13  72  	struct kasan_rcu_info *fp =
=3D container_of(rp,
73228c7ecc5e40 Patricia Alfonso 2020-10-13  73  						struct kasan_rcu_info=
, rcu);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  74  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  75  	kfree(fp);
73228c7ecc5e40 Patricia Alfonso 2020-10-13 @76  	fp->i =3D 1;
73228c7ecc5e40 Patricia Alfonso 2020-10-13  77  }
73228c7ecc5e40 Patricia Alfonso 2020-10-13  78  =


:::::: The code at line 41 was first introduced by commit
:::::: 73228c7ecc5e40c0851c4703c5ec6ed38123e989 KASAN: port KASAN Tests to =
KUnit

:::::: TO: Patricia Alfonso <trishalfonso@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3584724922303380228==--

