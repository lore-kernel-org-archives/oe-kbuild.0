Content-Type: multipart/mixed; boundary="===============4061504437509042769=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/erofs/fscache.c:39:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Tue, 02 Aug 2022 10:55:53 +0800
Message-ID: <202208021014.BqIl1uzY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4061504437509042769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 fs/erofs/fscache.c:39:2: warning: Use of memory after it is freed [clang-a=
nalyzer-unix.Malloc]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: John Hubbard <jhubbard@nvidia.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9de1f9c8ca5100a02a2e271bdbde36202e251b4b
commit: a4ab14e1d8fe83cc1ed8910b788117ec2ed25179 gen_compile_commands: hand=
le multiple lines per .mod file
date:   5 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220731 (https://download.01.org/0day-ci/archi=
ve/20220802/202208021014.BqIl1uzY-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00=
cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da4ab14e1d8fe83cc1ed8910b788117ec2ed25179
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a4ab14e1d8fe83cc1ed8910b788117ec2ed25179
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   drivers/base/power/domain.c:1520:6: note: Assuming 'has_governor' is fal=
se
           if (has_governor) {
               ^~~~~~~~~~~~
   drivers/base/power/domain.c:1520:2: note: Taking false branch
           if (has_governor) {
           ^
   drivers/base/power/domain.c:1535:6: note: Assuming field 'domain_data' i=
s null
           if (dev->power.subsys_data->domain_data)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/power/domain.c:1535:2: note: Taking false branch
           if (dev->power.subsys_data->domain_data)
           ^
   drivers/base/power/domain.c:1542:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/base/power/domain.c:1542:2: note: Taking false branch
           if (ret)
           ^
   drivers/base/power/domain.c:1630:13: note: Returning from 'genpd_alloc_d=
ev_data'
           gpd_data =3D genpd_alloc_dev_data(dev, gd);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/power/domain.c:1631:2: note: Taking false branch
           if (IS_ERR(gpd_data))
           ^
   drivers/base/power/domain.c:1636:8: note: Assuming field 'attach_dev' is=
 non-null
           ret =3D genpd->attach_dev ? genpd->attach_dev(genpd, dev) : 0;
                 ^~~~~~~~~~~~~~~~~
   drivers/base/power/domain.c:1636:8: note: '?' condition is true
   drivers/base/power/domain.c:1637:6: note: Assuming 'ret' is not equal to=
 0
           if (ret)
               ^~~
   drivers/base/power/domain.c:1637:2: note: Taking true branch
           if (ret)
           ^
   drivers/base/power/domain.c:1638:3: note: Control jumps to line 1653
                   goto out;
                   ^
   drivers/base/power/domain.c:1653:6: note: 'ret' is not equal to 0
           if (ret)
               ^~~
   drivers/base/power/domain.c:1653:2: note: Taking true branch
           if (ret)
           ^
   drivers/base/power/domain.c:1654:3: note: Calling 'genpd_free_dev_data'
                   genpd_free_dev_data(dev, gpd_data);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/power/domain.c:1564:2: note: 1st function call argument is =
an uninitialized value
           kfree(gpd_data->td);
           ^     ~~~~~~~~~~~~
   drivers/base/power/domain.c:3108:3: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(state, sizeof(state), "%s-%u",
                   ^~~~~~~~
   drivers/base/power/domain.c:3108:3: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(state, sizeof(state), "%s-%u",
                   ^~~~~~~~
   drivers/base/power/domain.c:3111:3: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(state, sizeof(state), "%s",
                   ^~~~~~~~
   drivers/base/power/domain.c:3111:3: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(state, sizeof(state), "%s",
                   ^~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (61 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   net/802/psnap.c:84:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(skb_push(skb, 5), dl->type, 5);
           ^~~~~~
   net/802/psnap.c:84:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(skb_push(skb, 5), dl->type, 5);
           ^~~~~~
   net/802/psnap.c:137:3: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(proto->type, desc, 5);
                   ^~~~~~
   net/802/psnap.c:137:3: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                   memcpy(proto->type, desc, 5);
                   ^~~~~~
   Suppressed 61 warnings (61 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   Suppressed 66 warnings (66 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   95 warnings generated.
   net/sched/sch_generic.c:836:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&opt.priomap, prio2band, TC_PRIO_MAX + 1);
           ^~~~~~
   net/sched/sch_generic.c:836:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(&opt.priomap, prio2band, TC_PRIO_MAX + 1);
           ^~~~~~
   net/sched/sch_generic.c:1525:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(r, 0, sizeof(*r));
           ^~~~~~
   net/sched/sch_generic.c:1525:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(r, 0, sizeof(*r));
           ^~~~~~
   Suppressed 93 warnings (92 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
>> fs/erofs/fscache.c:39:2: warning: Use of memory after it is freed [clang=
-analyzer-unix.Malloc]
           erofs_fscache_put_request(subreq->rreq);
           ^
   fs/erofs/fscache.c:121:6: note: Assuming the condition is false
           if (IS_ERR_VALUE(transferred_or_error))
               ^
   include/linux/err.h:22:25: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/fscache.c:121:2: note: Taking false branch
           if (IS_ERR_VALUE(transferred_or_error))
           ^
   fs/erofs/fscache.c:124:2: note: Taking true branch
           if (atomic_dec_and_test(&rreq->nr_outstanding))
           ^
   fs/erofs/fscache.c:125:3: note: Calling 'erofs_fscache_rreq_complete'
                   erofs_fscache_rreq_complete(rreq);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/fscache.c:112:2: note: Calling 'erofs_fscache_put_request'
           erofs_fscache_put_request(rreq);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/fscache.c:28:2: note: Taking false branch
           if (!refcount_dec_and_test(&rreq->ref))
           ^
   fs/erofs/fscache.c:30:6: note: Assuming field 'ops' is null
           if (rreq->cache_resources.ops)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/fscache.c:30:2: note: Taking false branch
           if (rreq->cache_resources.ops)
           ^
   fs/erofs/fscache.c:32:2: note: Memory is released
           kfree(rreq);
           ^~~~~~~~~~~
   fs/erofs/fscache.c:112:2: note: Returning; memory was released via 1st p=
arameter
           erofs_fscache_put_request(rreq);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/fscache.c:125:3: note: Returning; memory was released via 1st p=
arameter
                   erofs_fscache_rreq_complete(rreq);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/fscache.c:127:2: note: Calling 'erofs_fscache_put_subrequest'
           erofs_fscache_put_subrequest(subreq);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/fscache.c:37:2: note: Taking false branch
           if (!refcount_dec_and_test(&subreq->ref))
           ^
   fs/erofs/fscache.c:39:2: note: Use of memory after it is freed
           erofs_fscache_put_request(subreq->rreq);
           ^                         ~~~~~~~~~~~~
   fs/erofs/fscache.c:254:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, src + offset, len);
           ^~~~~~
   fs/erofs/fscache.c:254:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(dst, src + offset, len);
           ^~~~~~
   fs/erofs/fscache.c:255:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dst + len, 0, PAGE_SIZE - len);
           ^~~~~~
   fs/erofs/fscache.c:255:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(dst + len, 0, PAGE_SIZE - len);
           ^~~~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   fs/erofs/fscache.c:121:6: note: Assuming the condition is false
           if (IS_ERR_VALUE(transferred_or_error))
               ^
   include/linux/err.h:22:25: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/fscache.c:121:2: note: Taking false branch
           if (IS_ERR_VALUE(transferred_or_error))
           ^
   fs/erofs/fscache.c:124:2: note: Taking true branch
           if (atomic_dec_and_test(&rreq->nr_outstanding))
           ^
   fs/erofs/fscache.c:125:3: note: Calling 'erofs_fscache_rreq_complete'
                   erofs_fscache_rreq_complete(rreq);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/fscache.c:111:2: note: Calling 'erofs_fscache_clear_subrequests'
           erofs_fscache_clear_subrequests(rreq);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/fscache.c:47:2: note: Loop condition is true.  Entering loop bo=
dy
           while (!list_empty(&rreq->subrequests)) {
           ^
   fs/erofs/fscache.c:51:3: note: Calling 'erofs_fscache_put_subrequest'
                   erofs_fscache_put_subrequest(subreq);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/fscache.c:37:2: note: Taking false branch
           if (!refcount_dec_and_test(&subreq->ref))
           ^
   fs/erofs/fscache.c:40:2: note: Memory is released
           kfree(subreq);
           ^~~~~~~~~~~~~
   fs/erofs/fscache.c:51:3: note: Returning; memory was released
                   erofs_fscache_put_subrequest(subreq);

vim +39 fs/erofs/fscache.c

d435d53228dd03 Xin Yin 2022-05-09  34  =

d435d53228dd03 Xin Yin 2022-05-09  35  static void erofs_fscache_put_subreq=
uest(struct netfs_io_subrequest *subreq)
d435d53228dd03 Xin Yin 2022-05-09  36  {
d435d53228dd03 Xin Yin 2022-05-09  37  	if (!refcount_dec_and_test(&subreq-=
>ref))
d435d53228dd03 Xin Yin 2022-05-09  38  		return;
d435d53228dd03 Xin Yin 2022-05-09 @39  	erofs_fscache_put_request(subreq->r=
req);
d435d53228dd03 Xin Yin 2022-05-09  40  	kfree(subreq);
d435d53228dd03 Xin Yin 2022-05-09  41  }
d435d53228dd03 Xin Yin 2022-05-09  42  =


:::::: The code at line 39 was first introduced by commit
:::::: d435d53228dd039fffecae123b8c138af6f96f99 erofs: change to use asynch=
ronous io for fscache readpage/readahead

:::::: TO: Xin Yin <yinxin.x@bytedance.com>
:::::: CC: Gao Xiang <hsiangkao@linux.alibaba.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4061504437509042769==--

