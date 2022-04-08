Content-Type: multipart/mixed; boundary="===============4711614721097321061=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [avpatel:riscv_kvm_aia_v1 28/29] arch/riscv/kvm/aia_aplic.c:303:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sat, 09 Apr 2022 03:07:49 +0800
Message-ID: <202204090340.bp3iI4Xa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4711614721097321061==
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
commit: 196003ab7c663f9dd0f9d635d68d2d621cd1d441 [28/29] RISC-V: KVM: Add i=
n-kernel emulation of AIA APLIC
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-c006-20220408 (https://download.01.org/0day-ci/arc=
hive/20220409/202204090340.bp3iI4Xa-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51=
b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/196003ab7c663f9dd0f9d635d=
68d2d621cd1d441
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_kvm_aia_v1
        git checkout 196003ab7c663f9dd0f9d635d68d2d621cd1d441
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^
   include/linux/printk.h:531:2: note: expanded from macro 'pr_cont'
           printk(KERN_CONT fmt, ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   mm/percpu.c:2521:26: note: 'unit' is < 'unit_end'
                           for (unit_end +=3D upa; unit < unit_end; unit++)
                                                 ^~~~
   mm/percpu.c:2521:4: note: Loop condition is true.  Entering loop body
                           for (unit_end +=3D upa; unit < unit_end; unit++)
                           ^
   mm/percpu.c:2522:9: note: Assuming the condition is false
                                   if (gi->cpu_map[unit] !=3D NR_CPUS)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/percpu.c:2522:5: note: Taking false branch
                                   if (gi->cpu_map[unit] !=3D NR_CPUS)
                                   ^
   mm/percpu.c:2526:6: note: Loop condition is false.  Exiting loop
                                           pr_cont("%s ", empty_str);
                                           ^
   include/linux/printk.h:531:2: note: expanded from macro 'pr_cont'
           printk(KERN_CONT fmt, ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   mm/percpu.c:2521:26: note: Assuming 'unit' is >=3D 'unit_end'
                           for (unit_end +=3D upa; unit < unit_end; unit++)
                                                 ^~~~~~~~~~~~~~~
   mm/percpu.c:2521:4: note: Loop condition is false. Execution continues o=
n line 2514
                           for (unit_end +=3D upa; unit < unit_end; unit++)
                           ^
   mm/percpu.c:2514:8: note: Assuming 'alloc' is >=3D 'alloc_end'
                        alloc < alloc_end; alloc++) {
                        ^~~~~~~~~~~~~~~~~
   mm/percpu.c:2513:3: note: Loop condition is false. Execution continues o=
n line 2508
                   for (alloc_end +=3D gi->nr_units / upa;
                   ^
   mm/percpu.c:2508:18: note: Assuming 'group' is < field 'nr_groups'
           for (group =3D 0; group < ai->nr_groups; group++) {
                           ^~~~~~~~~~~~~~~~~~~~~
   mm/percpu.c:2508:2: note: Loop condition is true.  Entering loop body
           for (group =3D 0; group < ai->nr_groups; group++) {
           ^
   mm/percpu.c:2512:23: note: Division by zero
                   BUG_ON(gi->nr_units % upa);
                                       ^
   include/asm-generic/bug.h:161:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/regulator/max8660.c:396:3: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(of_node, 0, sizeof(of_node));
                   ^~~~~~
   drivers/regulator/max8660.c:396:3: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                   memset(of_node, 0, sizeof(of_node));
                   ^~~~~~
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
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
>> arch/riscv/kvm/aia_aplic.c:303:6: warning: Branch condition evaluates to=
 a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (inject)
               ^~~~~~
   arch/riscv/kvm/aia_aplic.c:252:7: note: 'inject' declared without an ini=
tial value
           bool inject, ie;
                ^~~~~~
   arch/riscv/kvm/aia_aplic.c:257:6: note: Assuming 'aplic' is non-null
           if (!aplic || !source || (aplic->nr_irqs <=3D source))
               ^~~~~~
   arch/riscv/kvm/aia_aplic.c:257:6: note: Left side of '||' is false
   arch/riscv/kvm/aia_aplic.c:257:16: note: Assuming 'source' is not equal =
to 0
           if (!aplic || !source || (aplic->nr_irqs <=3D source))
                         ^~~~~~~
   arch/riscv/kvm/aia_aplic.c:257:6: note: Left side of '||' is false
           if (!aplic || !source || (aplic->nr_irqs <=3D source))
               ^
   arch/riscv/kvm/aia_aplic.c:257:28: note: Assuming 'source' is < field 'n=
r_irqs'
           if (!aplic || !source || (aplic->nr_irqs <=3D source))
                                     ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/aia_aplic.c:257:2: note: Taking false branch
           if (!aplic || !source || (aplic->nr_irqs <=3D source))
           ^
   arch/riscv/kvm/aia_aplic.c:260:8: note: Assuming the condition is false
           ie =3D (aplic->domaincfg & APLIC_DOMAINCFG_IE) ? true : false;
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/aia_aplic.c:260:7: note: '?' condition is false
           ie =3D (aplic->domaincfg & APLIC_DOMAINCFG_IE) ? true : false;
                ^
   arch/riscv/kvm/aia_aplic.c:262:2: note: Loop condition is false.  Exitin=
g loop
           raw_spin_lock_irqsave(&irqd->lock, flags);
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   arch/riscv/kvm/aia_aplic.c:264:6: note: Assuming the condition is true
           if (irqd->sourcecfg & APLIC_SOURCECFG_D)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/aia_aplic.c:264:2: note: Taking true branch
           if (irqd->sourcecfg & APLIC_SOURCECFG_D)
           ^
   arch/riscv/kvm/aia_aplic.c:265:3: note: Control jumps to line 301
                   goto skip_unlock;
                   ^
   arch/riscv/kvm/aia_aplic.c:301:2: note: Loop condition is false.  Exitin=
g loop
           raw_spin_unlock_irqrestore(&irqd->lock, flags);
           ^
   include/linux/spinlock.h:278:2: note: expanded from macro 'raw_spin_unlo=
ck_irqrestore'
           do {                                                    \
           ^
   arch/riscv/kvm/aia_aplic.c:303:6: note: Branch condition evaluates to a =
garbage value
           if (inject)
               ^~~~~~
   Suppressed 33 warnings (32 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   80 warnings generated.
   kernel/fork.c:1120:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&mm->rss_stat, 0, sizeof(mm->rss_stat));
           ^~~~~~
   kernel/fork.c:1120:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(&mm->rss_stat, 0, sizeof(mm->rss_stat));
           ^~~~~~
   kernel/fork.c:1171:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mm, 0, sizeof(*mm));
           ^~~~~~
   kernel/fork.c:1171:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(mm, 0, sizeof(*mm));
           ^~~~~~
   kernel/fork.c:1516:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(mm, oldmm, sizeof(*mm));
           ^~~~~~
   kernel/fork.c:1516:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(mm, oldmm, sizeof(*mm));
           ^~~~~~
   kernel/fork.c:1645:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sig->action, current->sighand->action, sizeof(sig->action=
));
           ^~~~~~
   kernel/fork.c:1645:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(sig->action, current->sighand->action, sizeof(sig->action=
));
           ^~~~~~
   kernel/fork.c:1713:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sig->rlim, current->signal->rlim, sizeof sig->rlim);
           ^~~~~~
   kernel/fork.c:1713:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(sig->rlim, current->signal->rlim, sizeof sig->rlim);
           ^~~~~~
   kernel/fork.c:2178:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&p->irqtrace, 0, sizeof(p->irqtrace));
           ^~~~~~
   kernel/fork.c:2178:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(&p->irqtrace, 0, sizeof(p->irqtrace));
           ^~~~~~
   Suppressed 74 warnings (72 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   lib/lz4/lz4hc_compress.c:63:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset((void *)hc4->hashTable, 0, sizeof(hc4->hashTable));
           ^~~~~~
   lib/lz4/lz4hc_compress.c:63:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset((void *)hc4->hashTable, 0, sizeof(hc4->hashTable));
           ^~~~~~
   lib/lz4/lz4hc_compress.c:64:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]

vim +303 arch/riscv/kvm/aia_aplic.c

196003ab7c663f Anup Patel 2022-01-19  248  =

196003ab7c663f Anup Patel 2022-01-19  249  int kvm_riscv_aia_aplic_inject(s=
truct kvm *kvm, u32 source, bool level)
196003ab7c663f Anup Patel 2022-01-19  250  {
196003ab7c663f Anup Patel 2022-01-19  251  	u32 target;
196003ab7c663f Anup Patel 2022-01-19  252  	bool inject, ie;
196003ab7c663f Anup Patel 2022-01-19  253  	unsigned long flags;
196003ab7c663f Anup Patel 2022-01-19  254  	struct aplic_irq *irqd;
196003ab7c663f Anup Patel 2022-01-19  255  	struct aplic *aplic =3D kvm->ar=
ch.aia.aplic_state;
196003ab7c663f Anup Patel 2022-01-19  256  =

196003ab7c663f Anup Patel 2022-01-19  257  	if (!aplic || !source || (aplic=
->nr_irqs <=3D source))
196003ab7c663f Anup Patel 2022-01-19  258  		return -ENODEV;
196003ab7c663f Anup Patel 2022-01-19  259  	irqd =3D &aplic->irqs[source];
196003ab7c663f Anup Patel 2022-01-19  260  	ie =3D (aplic->domaincfg & APLI=
C_DOMAINCFG_IE) ? true : false;
196003ab7c663f Anup Patel 2022-01-19  261  =

196003ab7c663f Anup Patel 2022-01-19  262  	raw_spin_lock_irqsave(&irqd->lo=
ck, flags);
196003ab7c663f Anup Patel 2022-01-19  263  =

196003ab7c663f Anup Patel 2022-01-19  264  	if (irqd->sourcecfg & APLIC_SOU=
RCECFG_D)
196003ab7c663f Anup Patel 2022-01-19  265  		goto skip_unlock;
196003ab7c663f Anup Patel 2022-01-19  266  =

196003ab7c663f Anup Patel 2022-01-19  267  	switch (irqd->sourcecfg & APLIC=
_SOURCECFG_SM_MASK) {
196003ab7c663f Anup Patel 2022-01-19  268  	case APLIC_SOURCECFG_SM_EDGE_RI=
SE:
196003ab7c663f Anup Patel 2022-01-19  269  		if (level && !(irqd->state & A=
PLIC_IRQ_STATE_INPUT) &&
196003ab7c663f Anup Patel 2022-01-19  270  		    !(irqd->state & APLIC_IRQ_=
STATE_PENDING))
196003ab7c663f Anup Patel 2022-01-19  271  			irqd->state |=3D APLIC_IRQ_ST=
ATE_PENDING;
196003ab7c663f Anup Patel 2022-01-19  272  		break;
196003ab7c663f Anup Patel 2022-01-19  273  	case APLIC_SOURCECFG_SM_EDGE_FA=
LL:
196003ab7c663f Anup Patel 2022-01-19  274  		if (!level && (irqd->state & A=
PLIC_IRQ_STATE_INPUT) &&
196003ab7c663f Anup Patel 2022-01-19  275  		    !(irqd->state & APLIC_IRQ_=
STATE_PENDING))
196003ab7c663f Anup Patel 2022-01-19  276  			irqd->state |=3D APLIC_IRQ_ST=
ATE_PENDING;
196003ab7c663f Anup Patel 2022-01-19  277  		break;
196003ab7c663f Anup Patel 2022-01-19  278  	case APLIC_SOURCECFG_SM_LEVEL_H=
IGH:
196003ab7c663f Anup Patel 2022-01-19  279  		if (level && !(irqd->state & A=
PLIC_IRQ_STATE_PENDING))
196003ab7c663f Anup Patel 2022-01-19  280  			irqd->state |=3D APLIC_IRQ_ST=
ATE_PENDING;
196003ab7c663f Anup Patel 2022-01-19  281  		break;
196003ab7c663f Anup Patel 2022-01-19  282  	case APLIC_SOURCECFG_SM_LEVEL_L=
OW:
196003ab7c663f Anup Patel 2022-01-19  283  		if (!level && !(irqd->state & =
APLIC_IRQ_STATE_PENDING))
196003ab7c663f Anup Patel 2022-01-19  284  			irqd->state |=3D APLIC_IRQ_ST=
ATE_PENDING;
196003ab7c663f Anup Patel 2022-01-19  285  		break;
196003ab7c663f Anup Patel 2022-01-19  286  	}
196003ab7c663f Anup Patel 2022-01-19  287  =

196003ab7c663f Anup Patel 2022-01-19  288  	if (level)
196003ab7c663f Anup Patel 2022-01-19  289  		irqd->state |=3D APLIC_IRQ_STA=
TE_INPUT;
196003ab7c663f Anup Patel 2022-01-19  290  	else
196003ab7c663f Anup Patel 2022-01-19  291  		irqd->state &=3D ~APLIC_IRQ_ST=
ATE_INPUT;
196003ab7c663f Anup Patel 2022-01-19  292  =

196003ab7c663f Anup Patel 2022-01-19  293  	inject =3D false;
196003ab7c663f Anup Patel 2022-01-19  294  	target =3D irqd->target;
196003ab7c663f Anup Patel 2022-01-19  295  	if (ie && (irqd->state & APLIC_=
IRQ_STATE_ENPEND)) {
196003ab7c663f Anup Patel 2022-01-19  296  		irqd->state &=3D ~APLIC_IRQ_ST=
ATE_PENDING;
196003ab7c663f Anup Patel 2022-01-19  297  		inject =3D true;
196003ab7c663f Anup Patel 2022-01-19  298  	}
196003ab7c663f Anup Patel 2022-01-19  299  =

196003ab7c663f Anup Patel 2022-01-19  300  skip_unlock:
196003ab7c663f Anup Patel 2022-01-19  301  	raw_spin_unlock_irqrestore(&irq=
d->lock, flags);
196003ab7c663f Anup Patel 2022-01-19  302  =

196003ab7c663f Anup Patel 2022-01-19 @303  	if (inject)
196003ab7c663f Anup Patel 2022-01-19  304  		aplic_inject_msi(kvm, source, =
target);
196003ab7c663f Anup Patel 2022-01-19  305  =

196003ab7c663f Anup Patel 2022-01-19  306  	return 0;
196003ab7c663f Anup Patel 2022-01-19  307  }
196003ab7c663f Anup Patel 2022-01-19  308  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4711614721097321061==--

