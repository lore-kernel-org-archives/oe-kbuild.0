Content-Type: multipart/mixed; boundary="===============1204151647786756987=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vdpa/vdpa_user/vduse_dev.c:986:17: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Fri, 26 Aug 2022 16:33:25 +0800
Message-ID: <202208261614.hqgqSxL9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1204151647786756987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/v=
dpa/vdpa_user/vduse_dev.c:986:17: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Xie Yongji <xieyongji@bytedance.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4c612826bec1441214816827979b62f84a097e91
commit: 79a463be9e0051997508d52cf411ed5e91d657f6 vduse: Support registering=
 userspace memory for IOVA regions
date:   2 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 2 weeks ago
config: s390-randconfig-c005-20220823 (https://download.01.org/0day-ci/arch=
ive/20220826/202208261614.hqgqSxL9-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project d00e97=
df0fe8c67f694c4d027297f4382ce72b38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D79a463be9e0051997508d52cf411ed5e91d657f6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 79a463be9e0051997508d52cf411ed5e91d657f6
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
                                            ^
   include/linux/hid.h:1055:3: note: Loop condition is false.  Exiting loop
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:674:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:658:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:464:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:435:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:387:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   include/linux/hid.h:1056:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:674:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:658:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/crypto/atmel-sha204a.c:51:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data, &work_data->cmd.data, max);
                   ^~~~~~
   drivers/crypto/atmel-sha204a.c:51:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(data, &work_data->cmd.data, max);
                   ^~~~~~
   drivers/crypto/atmel-sha204a.c:89:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, cmd.data, max);
           ^~~~~~
   drivers/crypto/atmel-sha204a.c:89:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, cmd.data, max);
           ^~~~~~
   drivers/crypto/atmel-sha204a.c:106:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&i2c_priv->hwrng, 0, sizeof(i2c_priv->hwrng));
           ^~~~~~
   drivers/crypto/atmel-sha204a.c:106:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&i2c_priv->hwrng, 0, sizeof(i2c_priv->hwrng));
           ^~~~~~
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/crypto/ccree/cc_driver.c:176:2: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prefix, sizeof(prefix), "%s[%zu]: ", name, len);
           ^~~~~~~~
   drivers/crypto/ccree/cc_driver.c:176:2: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(prefix, sizeof(prefix), "%s[%zu]: ", name, len);
           ^~~~~~~~
   Suppressed 52 warnings (40 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   95 warnings generated.
   drivers/vdpa/vdpa.c:96:8: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D snprintf(buf, PAGE_SIZE, "%s\n", vdev->driver_override);
                 ^~~~~~~~
   drivers/vdpa/vdpa.c:96:8: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
           len =3D snprintf(buf, PAGE_SIZE, "%s\n", vdev->driver_override);
                 ^~~~~~~~
   drivers/vdpa/vdpa.c:585:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(config.net.mac, macaddr, sizeof(config.net.mac));
                   ^~~~~~
   drivers/vdpa/vdpa.c:585:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(config.net.mac, macaddr, sizeof(config.net.mac));
                   ^~~~~~
   Suppressed 93 warnings (81 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   98 warnings generated.
   drivers/vdpa/vdpa_user/vduse_dev.c:386:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&msg->resp, &resp, sizeof(resp));
           ^~~~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:386:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&msg->resp, &resp, sizeof(resp));
           ^~~~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:444:3: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&vq->state, 0, sizeof(vq->state));
                   ^~~~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:444:3: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
                   memset(&vq->state, 0, sizeof(vq->state));
                   ^~~~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:680:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, dev->config + offset, len);
           ^~~~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:680:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, dev->config + offset, len);
           ^~~~~~
>> drivers/vdpa/vdpa_user/vduse_dev.c:986:17: warning: Dereference of null =
pointer [clang-analyzer-core.NullDereference]
           mmap_read_lock(current->mm);
                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/vdpa/vdpa_user/vduse_dev.c:1034:6: note: Assuming field 'broken'=
 is false
           if (unlikely(dev->broken))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:1034:2: note: Taking false branch
           if (unlikely(dev->broken))
           ^
   drivers/vdpa/vdpa_user/vduse_dev.c:1037:2: note: Control jumps to 'case =
1076920600:'  at line 1199
           switch (cmd) {
           ^
   drivers/vdpa/vdpa_user/vduse_dev.c:1203:3: note: Taking false branch
                   if (copy_from_user(&umem, argp, sizeof(umem)))
                   ^
   drivers/vdpa/vdpa_user/vduse_dev.c:1207:7: note: Assuming the condition =
is false
                   if (!is_mem_zero((const char *)umem.reserved,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:1207:3: note: Taking false branch
                   if (!is_mem_zero((const char *)umem.reserved,
                   ^
   drivers/vdpa/vdpa_user/vduse_dev.c:1211:9: note: Calling 'vduse_dev_reg_=
umem'
                   ret =3D vduse_dev_reg_umem(dev, umem.iova,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:968:6: note: Assuming field 'bounce_m=
ap' is not equal to 0
           if (!dev->domain->bounce_map ||
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:968:6: note: Left side of '||' is fal=
se
   drivers/vdpa/vdpa_user/vduse_dev.c:969:6: note: Assuming 'size' is equal=
 to field 'bounce_size'
               size !=3D dev->domain->bounce_size ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:968:6: note: Left side of '||' is fal=
se
           if (!dev->domain->bounce_map ||
               ^
   drivers/vdpa/vdpa_user/vduse_dev.c:970:6: note: Assuming 'iova' is equal=
 to 0
               iova !=3D 0 || uaddr & ~PAGE_MASK)
               ^~~~~~~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:968:6: note: Left side of '||' is fal=
se
           if (!dev->domain->bounce_map ||
               ^
   drivers/vdpa/vdpa_user/vduse_dev.c:970:19: note: Assuming the condition =
is false
               iova !=3D 0 || uaddr & ~PAGE_MASK)
                            ^~~~~~~~~~~~~~~~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:968:2: note: Taking false branch
           if (!dev->domain->bounce_map ||
           ^
   drivers/vdpa/vdpa_user/vduse_dev.c:975:6: note: Assuming field 'umem' is=
 null
           if (dev->umem)
               ^~~~~~~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:975:2: note: Taking false branch
           if (dev->umem)
           ^
   drivers/vdpa/vdpa_user/vduse_dev.c:982:9: note: Calling 'kzalloc'
           umem =3D kzalloc(sizeof(*umem), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:588:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:605:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:982:9: note: Returning from 'kzalloc'
           umem =3D kzalloc(sizeof(*umem), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:983:6: note: Assuming 'page_list' is =
non-null
           if (!page_list || !umem)
               ^~~~~~~~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:983:6: note: Left side of '||' is fal=
se
   drivers/vdpa/vdpa_user/vduse_dev.c:983:20: note: Assuming 'umem' is non-=
null
           if (!page_list || !umem)
                             ^~~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:983:2: note: Taking false branch
           if (!page_list || !umem)
           ^
   drivers/vdpa/vdpa_user/vduse_dev.c:986:17: note: Dereference of null poi=
nter
           mmap_read_lock(current->mm);
                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^

vim +986 drivers/vdpa/vdpa_user/vduse_dev.c

79a463be9e0051 Xie Yongji 2022-08-03   958  =

79a463be9e0051 Xie Yongji 2022-08-03   959  static int vduse_dev_reg_umem(s=
truct vduse_dev *dev,
79a463be9e0051 Xie Yongji 2022-08-03   960  			      u64 iova, u64 uaddr, u=
64 size)
79a463be9e0051 Xie Yongji 2022-08-03   961  {
79a463be9e0051 Xie Yongji 2022-08-03   962  	struct page **page_list =3D NU=
LL;
79a463be9e0051 Xie Yongji 2022-08-03   963  	struct vduse_umem *umem =3D NU=
LL;
79a463be9e0051 Xie Yongji 2022-08-03   964  	long pinned =3D 0;
79a463be9e0051 Xie Yongji 2022-08-03   965  	unsigned long npages, lock_lim=
it;
79a463be9e0051 Xie Yongji 2022-08-03   966  	int ret;
79a463be9e0051 Xie Yongji 2022-08-03   967  =

79a463be9e0051 Xie Yongji 2022-08-03   968  	if (!dev->domain->bounce_map ||
79a463be9e0051 Xie Yongji 2022-08-03   969  	    size !=3D dev->domain->bou=
nce_size ||
79a463be9e0051 Xie Yongji 2022-08-03   970  	    iova !=3D 0 || uaddr & ~PA=
GE_MASK)
79a463be9e0051 Xie Yongji 2022-08-03   971  		return -EINVAL;
79a463be9e0051 Xie Yongji 2022-08-03   972  =

79a463be9e0051 Xie Yongji 2022-08-03   973  	mutex_lock(&dev->mem_lock);
79a463be9e0051 Xie Yongji 2022-08-03   974  	ret =3D -EEXIST;
79a463be9e0051 Xie Yongji 2022-08-03   975  	if (dev->umem)
79a463be9e0051 Xie Yongji 2022-08-03   976  		goto unlock;
79a463be9e0051 Xie Yongji 2022-08-03   977  =

79a463be9e0051 Xie Yongji 2022-08-03   978  	ret =3D -ENOMEM;
79a463be9e0051 Xie Yongji 2022-08-03   979  	npages =3D size >> PAGE_SHIFT;
79a463be9e0051 Xie Yongji 2022-08-03   980  	page_list =3D __vmalloc(array_=
size(npages, sizeof(struct page *)),
79a463be9e0051 Xie Yongji 2022-08-03   981  			      GFP_KERNEL_ACCOUNT);
79a463be9e0051 Xie Yongji 2022-08-03   982  	umem =3D kzalloc(sizeof(*umem)=
, GFP_KERNEL);
79a463be9e0051 Xie Yongji 2022-08-03   983  	if (!page_list || !umem)
79a463be9e0051 Xie Yongji 2022-08-03   984  		goto unlock;
79a463be9e0051 Xie Yongji 2022-08-03   985  =

79a463be9e0051 Xie Yongji 2022-08-03  @986  	mmap_read_lock(current->mm);
79a463be9e0051 Xie Yongji 2022-08-03   987  =

79a463be9e0051 Xie Yongji 2022-08-03   988  	lock_limit =3D PFN_DOWN(rlimit=
(RLIMIT_MEMLOCK));
79a463be9e0051 Xie Yongji 2022-08-03   989  	if (npages + atomic64_read(&cu=
rrent->mm->pinned_vm) > lock_limit)
79a463be9e0051 Xie Yongji 2022-08-03   990  		goto out;
79a463be9e0051 Xie Yongji 2022-08-03   991  =

79a463be9e0051 Xie Yongji 2022-08-03   992  	pinned =3D pin_user_pages(uadd=
r, npages, FOLL_LONGTERM | FOLL_WRITE,
79a463be9e0051 Xie Yongji 2022-08-03   993  				page_list, NULL);
79a463be9e0051 Xie Yongji 2022-08-03   994  	if (pinned !=3D npages) {
79a463be9e0051 Xie Yongji 2022-08-03   995  		ret =3D pinned < 0 ? pinned :=
 -ENOMEM;
79a463be9e0051 Xie Yongji 2022-08-03   996  		goto out;
79a463be9e0051 Xie Yongji 2022-08-03   997  	}
79a463be9e0051 Xie Yongji 2022-08-03   998  =

79a463be9e0051 Xie Yongji 2022-08-03   999  	ret =3D vduse_domain_add_user_=
bounce_pages(dev->domain,
79a463be9e0051 Xie Yongji 2022-08-03  1000  						 page_list, pinned);
79a463be9e0051 Xie Yongji 2022-08-03  1001  	if (ret)
79a463be9e0051 Xie Yongji 2022-08-03  1002  		goto out;
79a463be9e0051 Xie Yongji 2022-08-03  1003  =

79a463be9e0051 Xie Yongji 2022-08-03  1004  	atomic64_add(npages, &current-=
>mm->pinned_vm);
79a463be9e0051 Xie Yongji 2022-08-03  1005  =

79a463be9e0051 Xie Yongji 2022-08-03  1006  	umem->pages =3D page_list;
79a463be9e0051 Xie Yongji 2022-08-03  1007  	umem->npages =3D pinned;
79a463be9e0051 Xie Yongji 2022-08-03  1008  	umem->iova =3D iova;
79a463be9e0051 Xie Yongji 2022-08-03  1009  	umem->mm =3D current->mm;
79a463be9e0051 Xie Yongji 2022-08-03  1010  	mmgrab(current->mm);
79a463be9e0051 Xie Yongji 2022-08-03  1011  =

79a463be9e0051 Xie Yongji 2022-08-03  1012  	dev->umem =3D umem;
79a463be9e0051 Xie Yongji 2022-08-03  1013  out:
79a463be9e0051 Xie Yongji 2022-08-03  1014  	if (ret && pinned > 0)
79a463be9e0051 Xie Yongji 2022-08-03  1015  		unpin_user_pages(page_list, p=
inned);
79a463be9e0051 Xie Yongji 2022-08-03  1016  =

79a463be9e0051 Xie Yongji 2022-08-03  1017  	mmap_read_unlock(current->mm);
79a463be9e0051 Xie Yongji 2022-08-03  1018  unlock:
79a463be9e0051 Xie Yongji 2022-08-03  1019  	if (ret) {
79a463be9e0051 Xie Yongji 2022-08-03  1020  		vfree(page_list);
79a463be9e0051 Xie Yongji 2022-08-03  1021  		kfree(umem);
79a463be9e0051 Xie Yongji 2022-08-03  1022  	}
79a463be9e0051 Xie Yongji 2022-08-03  1023  	mutex_unlock(&dev->mem_lock);
79a463be9e0051 Xie Yongji 2022-08-03  1024  	return ret;
79a463be9e0051 Xie Yongji 2022-08-03  1025  }
79a463be9e0051 Xie Yongji 2022-08-03  1026  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1204151647786756987==--

