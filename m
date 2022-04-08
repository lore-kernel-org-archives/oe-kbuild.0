Content-Type: multipart/mixed; boundary="===============3467219916878928902=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [avpatel:riscv_kvm_aia_v1 24/29] arch/riscv/kvm/../../../virt/kvm/eventfd.c:392:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 08 Apr 2022 22:30:48 +0800
Message-ID: <202204082246.df2hCXqZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3467219916878928902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Anup Patel <apatel@ventanamicro.com>

tree:   https://github.com/avpatel/linux.git riscv_kvm_aia_v1
head:   dab41b5c8f55fb8e864a5e10fd181dd0d4443778
commit: 362960efc54f421c0c16da9e5d73d48bc569afad [24/29] RISC-V: KVM: Initi=
al skeletal support for in-kernel AIA irqchip
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-c006-20220408 (https://download.01.org/0day-ci/arc=
hive/20220408/202204082246.df2hCXqZ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51=
b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/362960efc54f421c0c16da9e5=
d73d48bc569afad
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_kvm_aia_v1
        git checkout 362960efc54f421c0c16da9e5d73d48bc569afad
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^
   include/linux/list.h:555:2: note: expanded from macro 'list_first_entry_=
or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
           ^~~~~~~~~~~~~~~
   drivers/base/regmap/regmap.c:1529:11: note: '?' condition is true
                   async =3D list_first_entry_or_null(&map->async_free,
                           ^
   include/linux/list.h:555:2: note: expanded from macro 'list_first_entry_=
or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
           ^
   drivers/base/regmap/regmap.c:1532:3: note: Calling 'list_del'
                   list_del(&async->list);
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/w1/slaves/w1_ds2433.c:116:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, &data->memory[off], count);
           ^~~~~~
   drivers/w1/slaves/w1_ds2433.c:116:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, &data->memory[off], count);
           ^~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/w1/slaves/w1_ds250x.c:161:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, &data->eprom[off], count);
           ^~~~~~
   drivers/w1/slaves/w1_ds250x.c:161:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, &data->eprom[off], count);
           ^~~~~~
   drivers/w1/slaves/w1_ds250x.c:201:3: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(data->nvmem_name, sizeof(data->nvmem_name),
                   ^~~~~~~~
   drivers/w1/slaves/w1_ds250x.c:201:3: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(data->nvmem_name, sizeof(data->nvmem_name),
                   ^~~~~~~~
   drivers/w1/slaves/w1_ds250x.c:206:3: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(data->nvmem_name, sizeof(data->nvmem_name),
                   ^~~~~~~~
   drivers/w1/slaves/w1_ds250x.c:206:3: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(data->nvmem_name, sizeof(data->nvmem_name),
                   ^~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   lib/string.c:142:3: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dest, src, len);
                   ^~~~~~
   lib/string.c:142:3: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
                   memcpy(dest, src, len);
                   ^~~~~~
   lib/string.c:328:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dest, src, len);
           ^~~~~~
   lib/string.c:328:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(dest, src, len);
           ^~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
>> arch/riscv/kvm/../../../virt/kvm/eventfd.c:392:2: warning: Value stored =
to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   arch/riscv/kvm/../../../virt/kvm/eventfd.c:392:2: note: Value stored to =
'ret' is never read
           ret =3D 0;
           ^     ~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   arch/riscv/kvm/../../../virt/kvm/coalesced_mmio.c:88:2: warning: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ring->coalesced_mmio[insert].data, val, len);
           ^~~~~~
   arch/riscv/kvm/../../../virt/kvm/coalesced_mmio.c:88:2: note: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ring->coalesced_mmio[insert].data, val, len);
           ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/hwtracing/stm/policy.c:90:10: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           count =3D sprintf(page, "%u %u\n", policy_node->first_master,
                   ^~~~~~~
   drivers/hwtracing/stm/policy.c:90:10: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           count =3D sprintf(page, "%u %u\n", policy_node->first_master,
                   ^~~~~~~
   drivers/hwtracing/stm/policy.c:106:6: warning: Call to function 'sscanf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(p, "%u %u", &first, &last) !=3D 2)
               ^~~~~~
   drivers/hwtracing/stm/policy.c:106:6: note: Call to function 'sscanf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(p, "%u %u", &first, &last) !=3D 2)
               ^~~~~~
   drivers/hwtracing/stm/policy.c:137:10: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           count =3D sprintf(page, "%u %u\n", policy_node->first_channel,
                   ^~~~~~~
   drivers/hwtracing/stm/policy.c:137:10: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           count =3D sprintf(page, "%u %u\n", policy_node->first_channel,
                   ^~~~~~~
   drivers/hwtracing/stm/policy.c:153:6: warning: Call to function 'sscanf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(p, "%u %u", &first, &last) !=3D 2)
               ^~~~~~
   drivers/hwtracing/stm/policy.c:153:6: note: Call to function 'sscanf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(p, "%u %u", &first, &last) !=3D 2)
               ^~~~~~
   drivers/hwtracing/stm/policy.c:294:10: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           count =3D sprintf(page, "%s\n",
                   ^~~~~~~
   drivers/hwtracing/stm/policy.c:294:10: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           count =3D sprintf(page, "%s\n",
                   ^~~~~~~
   drivers/hwtracing/stm/policy.c:310:10: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           count =3D sprintf(page, "%s\n",
                   ^~~~~~~
   drivers/hwtracing/stm/policy.c:310:10: note: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11
           count =3D sprintf(page, "%s\n",
                   ^~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   fs/splice.c:725:2: warning: Undefined or garbage value returned to calle=
r [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   fs/splice.c:630:2: note: 'ret' declared without an initial value
           ssize_t ret;
           ^~~~~~~~~~~
   fs/splice.c:632:15: note: Assuming 'array' is non-null
           if (unlikely(!array))
                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/splice.c:632:16: note: 'array' is non-null
           if (unlikely(!array))

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
--===============3467219916878928902==--

