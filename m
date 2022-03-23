Content-Type: multipart/mixed; boundary="===============9072139842531159658=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [avpatel:riscv_kvm_aia_v1 33/38] arch/riscv/kvm/../../../virt/kvm/eventfd.c:392:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 23 Mar 2022 09:15:19 +0800
Message-ID: <202203230947.AjswzFbw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9072139842531159658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Anup Patel <apatel@ventanamicro.com>

tree:   https://github.com/avpatel/linux.git riscv_kvm_aia_v1
head:   bafeaefb38960799e1f7ac9b6707a22e5be067d0
commit: 472607f8a84913ba6fda3fbda42c963a1df9e411 [33/38] RISC-V: KVM: Initi=
al skeletal support for in-kernel AIA irqchip
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-randconfig-c006-20220320 (https://download.01.org/0day-ci/arc=
hive/20220323/202203230947.AjswzFbw-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/472607f8a84913ba6fda3fbda=
42c963a1df9e411
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_kvm_aia_v1
        git checkout 472607f8a84913ba6fda3fbda42c963a1df9e411
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   drivers/dma-buf/dma-resv.c:165:18: note: '?' condition is false
                   max =3D max(4ul, roundup_pow_of_two(num_fences));
                                  ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/dma-buf/dma-resv.c:165:18: note: Calling '__roundup_pow_of_two'
                   max =3D max(4ul, roundup_pow_of_two(num_fences));
                                  ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __roundup_pow_of_two(n)                 \
           ^
   include/linux/minmax.h:52:36: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/minmax.h:38:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:32:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y =3D (y);               \
                                         ^
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:154:2: note: Taking true branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:155:10: note: Calling 'fls'
                   return fls(l);
                          ^~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal t=
o 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is f=
alse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is f=
alse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   include/linux/bitops.h:155:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:155:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
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
   4 warnings generated.
   Suppressed 4 warnings (2 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> arch/riscv/kvm/../../../virt/kvm/eventfd.c:392:2: warning: Value stored =
to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   arch/riscv/kvm/../../../virt/kvm/eventfd.c:392:2: note: Value stored to =
'ret' is never read
           ret =3D 0;
           ^     ~
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/base/cacheinfo.c:38:31: warning: Access to field 'fw_token' resu=
lts in a dereference of a null pointer (loaded from variable 'this_leaf') [=
clang-analyzer-core.NullDereference]
           return sib_leaf->fw_token =3D=3D this_leaf->fw_token;
                                        ^
   drivers/base/cacheinfo.c:225:6: note: Assuming field 'cpu_map_populated'=
 is false
           if (this_cpu_ci->cpu_map_populated)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:225:2: note: Taking false branch
           if (this_cpu_ci->cpu_map_populated)
           ^
   drivers/base/cacheinfo.c:228:2: note: Taking false branch
           if (of_have_populated_dt())
           ^
   drivers/base/cacheinfo.c:230:7: note: Taking false branch
           else if (!acpi_disabled)
                ^
   drivers/base/cacheinfo.c:233:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/base/cacheinfo.c:233:2: note: Taking false branch
           if (ret)
           ^
   drivers/base/cacheinfo.c:236:26: note: Loop condition is false.  Exiting=
 loop
           for (index =3D 0; index < cache_leaves(cpu); index++) {
                                   ^
   drivers/base/cacheinfo.c:26:28: note: expanded from macro 'cache_leaves'
   #define cache_leaves(cpu)       (ci_cacheinfo(cpu)->num_leaves)
                                    ^
   drivers/base/cacheinfo.c:25:29: note: expanded from macro 'ci_cacheinfo'
   #define ci_cacheinfo(cpu)       (&per_cpu(ci_cpu_cacheinfo, cpu))
                                     ^
   include/linux/percpu-defs.h:269:29: note: expanded from macro 'per_cpu'
   #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
                                     ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   drivers/base/cacheinfo.c:236:18: note: Assuming 'index' is < field 'num_=
leaves'
           for (index =3D 0; index < cache_leaves(cpu); index++) {
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:236:2: note: Loop condition is true.  Entering =
loop body
           for (index =3D 0; index < cache_leaves(cpu); index++) {
           ^
   drivers/base/cacheinfo.c:241:8: note: Calling 'cpumask_empty'
                   if (!cpumask_empty(&this_leaf->shared_cpu_map))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:557:9: note: Calling 'bitmap_empty'
           return bitmap_empty(cpumask_bits(srcp), nr_cpumask_bits);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:385:6: note: Left side of '&&' is false
           if (small_const_nbits(nbits))

vim +/ret +392 arch/riscv/kvm/../../../virt/kvm/eventfd.c

1a02b27035f820 Eric Auger            2015-09-18  292  =

721eecbf4fe995 Gregory Haskins       2009-05-20  293  static int
d4db2935e4fffe Alex Williamson       2012-06-29  294  kvm_irqfd_assign(stru=
ct kvm *kvm, struct kvm_irqfd *args)
721eecbf4fe995 Gregory Haskins       2009-05-20  295  {
166c9775f1f8b8 Eric Auger            2015-09-18  296  	struct kvm_kernel_ir=
qfd *irqfd, *tmp;
cffe78d92c217a Al Viro               2013-08-30  297  	struct fd f;
7a84428af7ca6a Alex Williamson       2012-09-21  298  	struct eventfd_ctx *=
eventfd =3D NULL, *resamplefd =3D NULL;
721eecbf4fe995 Gregory Haskins       2009-05-20  299  	int ret;
e6c8adca20ba45 Al Viro               2017-07-03  300  	__poll_t events;
9957c86d659a4d Paul Mackerras        2014-06-30  301  	int idx;
721eecbf4fe995 Gregory Haskins       2009-05-20  302  =

01c94e64f5a6f2 Eric Auger            2015-03-04  303  	if (!kvm_arch_intc_i=
nitialized(kvm))
01c94e64f5a6f2 Eric Auger            2015-03-04  304  		return -EAGAIN;
01c94e64f5a6f2 Eric Auger            2015-03-04  305  =

654f1f13ea56b9 Peter Xu              2019-05-05  306  	if (!kvm_arch_irqfd_=
allowed(kvm, args))
654f1f13ea56b9 Peter Xu              2019-05-05  307  		return -EINVAL;
654f1f13ea56b9 Peter Xu              2019-05-05  308  =

b12ce36a43f29d Ben Gardon            2019-02-11  309  	irqfd =3D kzalloc(si=
zeof(*irqfd), GFP_KERNEL_ACCOUNT);
721eecbf4fe995 Gregory Haskins       2009-05-20  310  	if (!irqfd)
721eecbf4fe995 Gregory Haskins       2009-05-20  311  		return -ENOMEM;
721eecbf4fe995 Gregory Haskins       2009-05-20  312  =

721eecbf4fe995 Gregory Haskins       2009-05-20  313  	irqfd->kvm =3D kvm;
d4db2935e4fffe Alex Williamson       2012-06-29  314  	irqfd->gsi =3D args-=
>gsi;
721eecbf4fe995 Gregory Haskins       2009-05-20  315  	INIT_LIST_HEAD(&irqf=
d->list);
721eecbf4fe995 Gregory Haskins       2009-05-20  316  	INIT_WORK(&irqfd->in=
ject, irqfd_inject);
721eecbf4fe995 Gregory Haskins       2009-05-20  317  	INIT_WORK(&irqfd->sh=
utdown, irqfd_shutdown);
5c73b9a2b1b4ec Ahmed S. Darwish      2020-07-20  318  	seqcount_spinlock_in=
it(&irqfd->irq_entry_sc, &kvm->irqfds.lock);
721eecbf4fe995 Gregory Haskins       2009-05-20  319  =

cffe78d92c217a Al Viro               2013-08-30  320  	f =3D fdget(args->fd=
);
cffe78d92c217a Al Viro               2013-08-30  321  	if (!f.file) {
cffe78d92c217a Al Viro               2013-08-30  322  		ret =3D -EBADF;
cffe78d92c217a Al Viro               2013-08-30  323  		goto out;
721eecbf4fe995 Gregory Haskins       2009-05-20  324  	}
721eecbf4fe995 Gregory Haskins       2009-05-20  325  =

cffe78d92c217a Al Viro               2013-08-30  326  	eventfd =3D eventfd_=
ctx_fileget(f.file);
721eecbf4fe995 Gregory Haskins       2009-05-20  327  	if (IS_ERR(eventfd))=
 {
721eecbf4fe995 Gregory Haskins       2009-05-20  328  		ret =3D PTR_ERR(eve=
ntfd);
721eecbf4fe995 Gregory Haskins       2009-05-20  329  		goto fail;
721eecbf4fe995 Gregory Haskins       2009-05-20  330  	}
721eecbf4fe995 Gregory Haskins       2009-05-20  331  =

721eecbf4fe995 Gregory Haskins       2009-05-20  332  	irqfd->eventfd =3D e=
ventfd;
721eecbf4fe995 Gregory Haskins       2009-05-20  333  =

7a84428af7ca6a Alex Williamson       2012-09-21  334  	if (args->flags & KV=
M_IRQFD_FLAG_RESAMPLE) {
166c9775f1f8b8 Eric Auger            2015-09-18  335  		struct kvm_kernel_i=
rqfd_resampler *resampler;
7a84428af7ca6a Alex Williamson       2012-09-21  336  =

7a84428af7ca6a Alex Williamson       2012-09-21  337  		resamplefd =3D even=
tfd_ctx_fdget(args->resamplefd);
7a84428af7ca6a Alex Williamson       2012-09-21  338  		if (IS_ERR(resample=
fd)) {
7a84428af7ca6a Alex Williamson       2012-09-21  339  			ret =3D PTR_ERR(re=
samplefd);
7a84428af7ca6a Alex Williamson       2012-09-21  340  			goto fail;
7a84428af7ca6a Alex Williamson       2012-09-21  341  		}
7a84428af7ca6a Alex Williamson       2012-09-21  342  =

7a84428af7ca6a Alex Williamson       2012-09-21  343  		irqfd->resamplefd =
=3D resamplefd;
7a84428af7ca6a Alex Williamson       2012-09-21  344  		INIT_LIST_HEAD(&irq=
fd->resampler_link);
7a84428af7ca6a Alex Williamson       2012-09-21  345  =

7a84428af7ca6a Alex Williamson       2012-09-21  346  		mutex_lock(&kvm->ir=
qfds.resampler_lock);
7a84428af7ca6a Alex Williamson       2012-09-21  347  =

7a84428af7ca6a Alex Williamson       2012-09-21  348  		list_for_each_entry=
(resampler,
49f8a1a5394d8b Alex Williamson       2012-12-06  349  				    &kvm->irqfds.=
resampler_list, link) {
7a84428af7ca6a Alex Williamson       2012-09-21  350  			if (resampler->not=
ifier.gsi =3D=3D irqfd->gsi) {
7a84428af7ca6a Alex Williamson       2012-09-21  351  				irqfd->resampler =
=3D resampler;
7a84428af7ca6a Alex Williamson       2012-09-21  352  				break;
7a84428af7ca6a Alex Williamson       2012-09-21  353  			}
7a84428af7ca6a Alex Williamson       2012-09-21  354  		}
7a84428af7ca6a Alex Williamson       2012-09-21  355  =

7a84428af7ca6a Alex Williamson       2012-09-21  356  		if (!irqfd->resampl=
er) {
b12ce36a43f29d Ben Gardon            2019-02-11  357  			resampler =3D kzal=
loc(sizeof(*resampler),
b12ce36a43f29d Ben Gardon            2019-02-11  358  					    GFP_KERNEL_A=
CCOUNT);
7a84428af7ca6a Alex Williamson       2012-09-21  359  			if (!resampler) {
7a84428af7ca6a Alex Williamson       2012-09-21  360  				ret =3D -ENOMEM;
7a84428af7ca6a Alex Williamson       2012-09-21  361  				mutex_unlock(&kvm=
->irqfds.resampler_lock);
7a84428af7ca6a Alex Williamson       2012-09-21  362  				goto fail;
7a84428af7ca6a Alex Williamson       2012-09-21  363  			}
7a84428af7ca6a Alex Williamson       2012-09-21  364  =

7a84428af7ca6a Alex Williamson       2012-09-21  365  			resampler->kvm =3D=
 kvm;
7a84428af7ca6a Alex Williamson       2012-09-21  366  			INIT_LIST_HEAD(&re=
sampler->list);
7a84428af7ca6a Alex Williamson       2012-09-21  367  			resampler->notifie=
r.gsi =3D irqfd->gsi;
7a84428af7ca6a Alex Williamson       2012-09-21  368  			resampler->notifie=
r.irq_acked =3D irqfd_resampler_ack;
7a84428af7ca6a Alex Williamson       2012-09-21  369  			INIT_LIST_HEAD(&re=
sampler->link);
7a84428af7ca6a Alex Williamson       2012-09-21  370  =

7a84428af7ca6a Alex Williamson       2012-09-21  371  			list_add(&resample=
r->link, &kvm->irqfds.resampler_list);
7a84428af7ca6a Alex Williamson       2012-09-21  372  			kvm_register_irq_a=
ck_notifier(kvm,
7a84428af7ca6a Alex Williamson       2012-09-21  373  						      &resample=
r->notifier);
7a84428af7ca6a Alex Williamson       2012-09-21  374  			irqfd->resampler =
=3D resampler;
7a84428af7ca6a Alex Williamson       2012-09-21  375  		}
7a84428af7ca6a Alex Williamson       2012-09-21  376  =

7a84428af7ca6a Alex Williamson       2012-09-21  377  		list_add_rcu(&irqfd=
->resampler_link, &irqfd->resampler->list);
719d93cd5f5c5c Christian Borntraeger 2014-01-16  378  		synchronize_srcu(&k=
vm->irq_srcu);
7a84428af7ca6a Alex Williamson       2012-09-21  379  =

7a84428af7ca6a Alex Williamson       2012-09-21  380  		mutex_unlock(&kvm->=
irqfds.resampler_lock);
7a84428af7ca6a Alex Williamson       2012-09-21  381  	}
7a84428af7ca6a Alex Williamson       2012-09-21  382  =

721eecbf4fe995 Gregory Haskins       2009-05-20  383  	/*
721eecbf4fe995 Gregory Haskins       2009-05-20  384  	 * Install our own c=
ustom wake-up handling so we are notified via
721eecbf4fe995 Gregory Haskins       2009-05-20  385  	 * a callback whenev=
er someone signals the underlying eventfd
721eecbf4fe995 Gregory Haskins       2009-05-20  386  	 */
721eecbf4fe995 Gregory Haskins       2009-05-20  387  	init_waitqueue_func_=
entry(&irqfd->wait, irqfd_wakeup);
721eecbf4fe995 Gregory Haskins       2009-05-20  388  	init_poll_funcptr(&i=
rqfd->pt, irqfd_ptable_queue_proc);
721eecbf4fe995 Gregory Haskins       2009-05-20  389  =

f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  390  	spin_lock_irq(&kvm->=
irqfds.lock);
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  391  =

f1d1c309f35e9b Michael S. Tsirkin    2010-01-13 @392  	ret =3D 0;
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  393  	list_for_each_entry(=
tmp, &kvm->irqfds.items, list) {
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  394  		if (irqfd->eventfd =
!=3D tmp->eventfd)
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  395  			continue;
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  396  		/* This fd is used =
for another irq already. */
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  397  		ret =3D -EBUSY;
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  398  		spin_unlock_irq(&kv=
m->irqfds.lock);
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  399  		goto fail;
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  400  	}
f1d1c309f35e9b Michael S. Tsirkin    2010-01-13  401  =

9957c86d659a4d Paul Mackerras        2014-06-30  402  	idx =3D srcu_read_lo=
ck(&kvm->irq_srcu);
9957c86d659a4d Paul Mackerras        2014-06-30  403  	irqfd_update(kvm, ir=
qfd);
bd2b53b20fcd0d Michael S. Tsirkin    2010-11-18  404  =

721eecbf4fe995 Gregory Haskins       2009-05-20  405  	list_add_tail(&irqfd=
->list, &kvm->irqfds.items);
721eecbf4fe995 Gregory Haskins       2009-05-20  406  =

684a0b719ddbba Cornelia Huck         2014-03-17  407  	spin_unlock_irq(&kvm=
->irqfds.lock);
684a0b719ddbba Cornelia Huck         2014-03-17  408  =

721eecbf4fe995 Gregory Haskins       2009-05-20  409  	/*
721eecbf4fe995 Gregory Haskins       2009-05-20  410  	 * Check if there wa=
s an event already pending on the eventfd
721eecbf4fe995 Gregory Haskins       2009-05-20  411  	 * before we registe=
red, and trigger it as if we didn't miss it.
721eecbf4fe995 Gregory Haskins       2009-05-20  412  	 */
9965ed174e7d38 Christoph Hellwig     2018-03-05  413  	events =3D vfs_poll(=
f.file, &irqfd->pt);
684a0b719ddbba Cornelia Huck         2014-03-17  414  =

a9a08845e9acbd Linus Torvalds        2018-02-11  415  	if (events & EPOLLIN)
721eecbf4fe995 Gregory Haskins       2009-05-20  416  		schedule_work(&irqf=
d->inject);
721eecbf4fe995 Gregory Haskins       2009-05-20  417  =


:::::: The code at line 392 was first introduced by commit
:::::: f1d1c309f35e9b0fb961cffd70fbd04f450ec47c KVM: only allow one gsi per=
 fd

:::::: TO: Michael S. Tsirkin <mst@redhat.com>
:::::: CC: Marcelo Tosatti <mtosatti@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9072139842531159658==--

