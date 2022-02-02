Content-Type: multipart/mixed; boundary="===============2742245066276221692=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/rapidio/devices/rio_mport_cdev.c:587:17: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Thu, 03 Feb 2022 00:12:51 +0800
Message-ID: <202202030030.z983zmzV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2742245066276221692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9f7fb8de5d9bac17b6392a14af40baf555d9129b
commit: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: swit=
ch to static_assert
date:   3 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220201 (https://download.01.org/0day-ci/archi=
ve/20220203/202202030030.z983zmzV-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e84=
4b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De1edc277e6f6dfb372216522dfc57f9381c39e35
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e1edc277e6f6dfb372216522dfc57f9381c39e35
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                  ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:390:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:316:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   kernel/bpf/lpm_trie.c:693:2: note: Loop condition is false. Execution co=
ntinues on line 704
           for (node =3D search_root; node;) {
           ^
   kernel/bpf/lpm_trie.c:704:24: note: Access to field 'prefixlen' results =
in a dereference of a null pointer (loaded from variable 'next_node')
           next_key->prefixlen =3D next_node->prefixlen;
                                 ^~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/rapidio/rio-scan.c:561:10: warning: Although the value stored to=
 'tmp' is used in the enclosing expression, the value is never actually rea=
d from 'tmp' [clang-analyzer-deadcode.DeadStores]
           while ((tmp =3D rio_get_host_deviceid_lock(port, hopcount))
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/rio-scan.c:561:10: note: Although the value stored to 't=
mp' is used in the enclosing expression, the value is never actually read f=
rom 'tmp'
           while ((tmp =3D rio_get_host_deviceid_lock(port, hopcount))
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/rapidio/devices/rio_mport_cdev.c:300:2: warning: Undefined or ga=
rbage value returned to caller [clang-analyzer-core.uninitialized.UndefRetu=
rn]
           return ret;
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:2070:6: note: Assuming the cond=
ition is false
           if (atomic_read(&md->active) =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:2070:2: note: Taking false bran=
ch
           if (atomic_read(&md->active) =3D=3D 0)
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:2073:2: note: Control jumps to =
'case 2149084421:'  at line 2074
           switch (cmd) {
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:2075:10: note: Calling 'rio_mpo=
rt_maint_rd'
                   return rio_mport_maint_rd(data, (void __user *)arg, 1);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:266:6: note: 'ret' declared wit=
hout an initial value
           int ret, i;
               ^~~
   drivers/rapidio/devices/rio_mport_cdev.c:268:2: note: Taking false branch
           if (unlikely(copy_from_user(&maint_io, arg, sizeof(maint_io))))
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:271:7: note: Assuming the condi=
tion is false
           if ((maint_io.offset % 4) ||
                ^~~~~~~~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:271:6: note: Left side of '||' =
is false
           if ((maint_io.offset % 4) ||
               ^
   drivers/rapidio/devices/rio_mport_cdev.c:272:7: note: Assuming field 'le=
ngth' is not equal to 0
               (maint_io.length =3D=3D 0) || (maint_io.length % 4) ||
                ^~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:271:6: note: Left side of '||' =
is false
           if ((maint_io.offset % 4) ||
               ^
   drivers/rapidio/devices/rio_mport_cdev.c:272:33: note: Assuming the cond=
ition is false
               (maint_io.length =3D=3D 0) || (maint_io.length % 4) ||
                                          ^~~~~~~~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:271:6: note: Left side of '||' =
is false
           if ((maint_io.offset % 4) ||
               ^
   drivers/rapidio/devices/rio_mport_cdev.c:273:6: note: Assuming the condi=
tion is false
               (maint_io.length + maint_io.offset) > RIO_MAINT_SPACE_SZ)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:271:2: note: Taking false branch
           if ((maint_io.offset % 4) ||
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:277:6: note: Assuming 'buffer' =
is not equal to NULL
           if (buffer =3D=3D NULL)
               ^~~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:277:2: note: Taking false branch
           if (buffer =3D=3D NULL)
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:282:14: note: Assuming 'i' is >=
=3D 'length'
           for (i =3D 0; i < length; i++) {
                       ^~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:282:2: note: Loop condition is =
false. Execution continues on line 295
           for (i =3D 0; i < length; i++) {
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:295:6: note: Assuming the condi=
tion is true
           if (unlikely(copy_to_user((void __user *)(uintptr_t)maint_io.buf=
fer,
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/rapidio/devices/rio_mport_cdev.c:295:2: note: Taking false branch
           if (unlikely(copy_to_user((void __user *)(uintptr_t)maint_io.buf=
fer,
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:300:2: note: Undefined or garba=
ge value returned to caller
           return ret;
           ^      ~~~
>> drivers/rapidio/devices/rio_mport_cdev.c:587:17: warning: Use of memory =
after it is freed [clang-analyzer-unix.Malloc]
                   mutex_unlock(&req->map->md->buf_mutex);
                                 ^
   drivers/rapidio/devices/rio_mport_cdev.c:603:2: note: Calling 'kref_put'
           kref_put(&req->refcount, dma_req_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'dma_req_free'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:579:6: note: Assuming field 'pa=
ge_list' is null
           if (req->page_list) {
               ^~~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:579:2: note: Taking false branch
           if (req->page_list) {
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:584:6: note: Assuming field 'ma=
p' is non-null
           if (req->map) {
               ^~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:584:2: note: Taking true branch
           if (req->map) {
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:586:3: note: Calling 'kref_put'
                   kref_put(&req->map->ref, mport_release_mapping);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'mport_release_mapping'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:2149:2: note: Taking false bran=
ch
           rmcd_debug(MMAP, "type %d mapping @ %p (phys =3D %pad) for %s",
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:73:3: note: expanded from macro=
 'rmcd_debug'
                   no_printk(KERN_DEBUG pr_fmt(DRV_PREFIX fmt "\n"), ##arg)
                   ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:2155:2: note: Control jumps to =
'case MAP_OUTBOUND:'  at line 2163
           switch (map->dir) {
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:2165:3: note:  Execution contin=
ues on line 2167
                   break;
                   ^
   drivers/rapidio/devices/rio_mport_cdev.c:2167:2: note: Memory is released
           kfree(map);
           ^~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:586:3: note: Returning; memory =
was released
                   kref_put(&req->map->ref, mport_release_mapping);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:587:17: note: Use of memory aft=
er it is freed
                   mutex_unlock(&req->map->md->buf_mutex);
                                 ^~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:2185:16: warning: Use of memory=
 after it is freed [clang-analyzer-unix.Malloc]
           mutex_unlock(&map->md->buf_mutex);
                         ^~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:2182:2: note: Taking false bran=
ch
           rmcd_debug(MMAP, "%pad", &map->phys_addr);
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:73:3: note: expanded from macro=
 'rmcd_debug'
                   no_printk(KERN_DEBUG pr_fmt(DRV_PREFIX fmt "\n"), ##arg)
                   ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:2184:2: note: Calling 'kref_put'
           kref_put(&map->ref, mport_release_mapping);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'mport_release_mapping'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/rapidio/devices/rio_mport_cdev.c:2149:2: note: Taking false bran=
ch
           rmcd_debug(MMAP, "type %d mapping @ %p (phys =3D %pad) for %s",
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:73:3: note: expanded from macro=
 'rmcd_debug'
                   no_printk(KERN_DEBUG pr_fmt(DRV_PREFIX fmt "\n"), ##arg)
                   ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:2155:2: note: Control jumps to =
'case MAP_OUTBOUND:'  at line 2163
           switch (map->dir) {
           ^
   drivers/rapidio/devices/rio_mport_cdev.c:2165:3: note:  Execution contin=
ues on line 2167
                   break;
                   ^
   drivers/rapidio/devices/rio_mport_cdev.c:2167:2: note: Memory is released
           kfree(map);
           ^~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);

vim +587 drivers/rapidio/devices/rio_mport_cdev.c

e8de370188d098 Alexandre Bounine 2016-03-22  569  =

bbd876adb8c729 Ioan Nicu         2018-04-10  570  static void dma_req_free(=
struct kref *ref)
e8de370188d098 Alexandre Bounine 2016-03-22  571  {
bbd876adb8c729 Ioan Nicu         2018-04-10  572  	struct mport_dma_req *re=
q =3D container_of(ref, struct mport_dma_req,
bbd876adb8c729 Ioan Nicu         2018-04-10  573  			refcount);
e8de370188d098 Alexandre Bounine 2016-03-22  574  	struct mport_cdev_priv *=
priv =3D req->priv;
e8de370188d098 Alexandre Bounine 2016-03-22  575  =

e8de370188d098 Alexandre Bounine 2016-03-22  576  	dma_unmap_sg(req->dmach-=
>device->dev,
e8de370188d098 Alexandre Bounine 2016-03-22  577  		     req->sgt.sgl, req-=
>sgt.nents, req->dir);
e8de370188d098 Alexandre Bounine 2016-03-22  578  	sg_free_table(&req->sgt);
e8de370188d098 Alexandre Bounine 2016-03-22  579  	if (req->page_list) {
67446283d89467 John Hubbard      2020-06-04  580  		unpin_user_pages(req->p=
age_list, req->nr_pages);
e8de370188d098 Alexandre Bounine 2016-03-22  581  		kfree(req->page_list);
e8de370188d098 Alexandre Bounine 2016-03-22  582  	}
e8de370188d098 Alexandre Bounine 2016-03-22  583  =

e8de370188d098 Alexandre Bounine 2016-03-22  584  	if (req->map) {
e8de370188d098 Alexandre Bounine 2016-03-22  585  		mutex_lock(&req->map->m=
d->buf_mutex);
e8de370188d098 Alexandre Bounine 2016-03-22  586  		kref_put(&req->map->ref=
, mport_release_mapping);
e8de370188d098 Alexandre Bounine 2016-03-22 @587  		mutex_unlock(&req->map-=
>md->buf_mutex);
e8de370188d098 Alexandre Bounine 2016-03-22  588  	}
e8de370188d098 Alexandre Bounine 2016-03-22  589  =

e8de370188d098 Alexandre Bounine 2016-03-22  590  	kref_put(&priv->dma_ref,=
 mport_release_dma);
e8de370188d098 Alexandre Bounine 2016-03-22  591  =

e8de370188d098 Alexandre Bounine 2016-03-22  592  	kfree(req);
e8de370188d098 Alexandre Bounine 2016-03-22  593  }
e8de370188d098 Alexandre Bounine 2016-03-22  594  =


:::::: The code at line 587 was first introduced by commit
:::::: e8de370188d098bb49483c287b44925957c3c9b6 rapidio: add mport char dev=
ice driver

:::::: TO: Alexandre Bounine <alexandre.bounine@idt.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2742245066276221692==--

