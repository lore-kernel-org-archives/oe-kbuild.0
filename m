Content-Type: multipart/mixed; boundary="===============7120002162314040490=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8236/14285] arch/s390/kvm/interrupt.c:3365:13: warning: Although the value stored to 'found' is used in the enclosing expression, the value is never actually read from 'found' [clang-analyzer-deadcode.DeadStores]
Date: Wed, 03 Aug 2022 10:40:28 +0800
Message-ID: <202208031008.BukmgeA5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7120002162314040490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/s390=
/kvm/interrupt.c:3365:13: warning: Although the value stored to 'found' is =
used in the enclosing expression, the value is never actually read from 'fo=
und' [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Matthew Rosato <mjrosato@linux.ibm.com>
CC: Christian Borntraeger <borntraeger@linux.ibm.com>
CC: Pierre Morel <pmorel@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7c5e07b73ff3011c9b82d4a3286a3362b951ad2b
commit: 73f91b004321f2510fa79e66035dbbf1870fcf56 [8236/14285] KVM: s390: pc=
i: enable host forwarding of Adapter Event Notifications
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20220801 (https://download.01.org/0day-ci/arch=
ive/20220803/202208031008.BukmgeA5-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00=
cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D73f91b004321f2510fa79e66035dbbf1870fcf56
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 73f91b004321f2510fa79e66035dbbf1870fcf56
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   arch/s390/kvm/interrupt.c:3022:3: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&irq, 0, sizeof(irq));
                   ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   arch/s390/kvm/interrupt.c:3022:3: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
                   memset(&irq, 0, sizeof(irq));
                   ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   arch/s390/kvm/interrupt.c:3035:4: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&irq, 0, sizeof(irq));
                           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   arch/s390/kvm/interrupt.c:3035:4: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
                           memset(&irq, 0, sizeof(irq));
                           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   arch/s390/kvm/interrupt.c:3049:3: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&irq, 0, sizeof(irq));
                   ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   arch/s390/kvm/interrupt.c:3049:3: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
                   memset(&irq, 0, sizeof(irq));
                   ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   arch/s390/kvm/interrupt.c:3170:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(gi->origin, 0, sizeof(struct kvm_s390_gisa));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   arch/s390/kvm/interrupt.c:3170:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(gi->origin, 0, sizeof(struct kvm_s390_gisa));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> arch/s390/kvm/interrupt.c:3365:13: warning: Although the value stored to=
 'found' is used in the enclosing expression, the value is never actually r=
ead from 'found' [clang-analyzer-deadcode.DeadStores]
                                   first =3D found =3D false;
                                           ^       ~~~~~
   arch/s390/kvm/interrupt.c:3365:13: note: Although the value stored to 'f=
ound' is used in the enclosing expression, the value is never actually read=
 from 'found'
                                   first =3D found =3D false;
                                           ^       ~~~~~
   arch/s390/kvm/trace-s390.h:125:1: warning: Dereference of null pointer [=
clang-analyzer-core.NullDereference]
   TRACE_EVENT(kvm_s390_inject_vm,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   arch/s390/kvm/interrupt.c:2674:2: note: Control jumps to 'case 10:'  at =
line 2707
           switch (attr->group) {
           ^
   arch/s390/kvm/interrupt.c:2708:7: note: Calling 'flic_inject_airq'
                   r =3D flic_inject_airq(dev->kvm, attr);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kvm/interrupt.c:2643:6: note: Assuming 'adapter' is non-null
           if (!adapter)
               ^~~~~~~~
   arch/s390/kvm/interrupt.c:2643:2: note: Taking false branch
           if (!adapter)
           ^
   arch/s390/kvm/interrupt.c:2646:9: note: Calling 'kvm_s390_inject_airq'
           return kvm_s390_inject_airq(kvm, adapter);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kvm/interrupt.c:2618:34: note: Left side of '||' is true
           if (!test_kvm_facility(kvm, 72) || !adapter->suppressible)
                                           ^
   arch/s390/kvm/interrupt.c:2619:10: note: Calling 'kvm_s390_inject_vm'
                   return kvm_s390_inject_vm(kvm, &s390int);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kvm/interrupt.c:2021:6: note: Assuming 'inti' is non-null
           if (!inti)
               ^~~~~
   arch/s390/kvm/interrupt.c:2021:2: note: Taking false branch
           if (!inti)
           ^
   arch/s390/kvm/interrupt.c:2025:2: note: Control jumps to 'case 0:'  at l=
ine 2045
           switch (inti->type) {
           ^
   arch/s390/kvm/interrupt.c:2050:3: note:  Execution continues on line 2055
                   break;
                   ^
   arch/s390/kvm/interrupt.c:2055:2: note: Calling 'trace_kvm_s390_inject_v=
m'
           trace_kvm_s390_inject_vm(s390int->type, s390int->parm, s390int->=
parm64,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   arch/s390/kvm/trace-s390.h:125:1: note: Assuming the condition is true
   TRACE_EVENT(kvm_s390_inject_vm,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:247:7: note: expanded from macro '__DECLARE_T=
RACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kvm/trace-s390.h:125:1: note: Taking true branch
   TRACE_EVENT(kvm_s390_inject_vm,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:247:3: note: expanded from macro '__DECLARE_T=
RACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   arch/s390/kvm/trace-s390.h:125:1: note: Dereference of null pointer
   TRACE_EVENT(kvm_s390_inject_vm,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:250:18: note: expanded from macro '__DECLARE_=
TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:149:31: note: expanded from macro 'TP_CONDITI=
ON'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:188:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   arch/s390/kvm/trace-s390.h:150:1: warning: Dereference of null pointer [=
clang-analyzer-core.NullDereference]
   TRACE_EVENT(kvm_s390_inject_vcpu,

vim +3365 arch/s390/kvm/interrupt.c

73f91b004321f2 Matthew Rosato 2022-06-06  3343  =

73f91b004321f2 Matthew Rosato 2022-06-06  3344  static void aen_process_gai=
t(u8 isc)
73f91b004321f2 Matthew Rosato 2022-06-06  3345  {
73f91b004321f2 Matthew Rosato 2022-06-06  3346  	bool found =3D false, firs=
t =3D true;
73f91b004321f2 Matthew Rosato 2022-06-06  3347  	union zpci_sic_iib iib =3D=
 {{0}};
73f91b004321f2 Matthew Rosato 2022-06-06  3348  	unsigned long si, flags;
73f91b004321f2 Matthew Rosato 2022-06-06  3349  =

73f91b004321f2 Matthew Rosato 2022-06-06  3350  	spin_lock_irqsave(&aift->g=
ait_lock, flags);
73f91b004321f2 Matthew Rosato 2022-06-06  3351  =

73f91b004321f2 Matthew Rosato 2022-06-06  3352  	if (!aift->gait) {
73f91b004321f2 Matthew Rosato 2022-06-06  3353  		spin_unlock_irqrestore(&a=
ift->gait_lock, flags);
73f91b004321f2 Matthew Rosato 2022-06-06  3354  		return;
73f91b004321f2 Matthew Rosato 2022-06-06  3355  	}
73f91b004321f2 Matthew Rosato 2022-06-06  3356  =

73f91b004321f2 Matthew Rosato 2022-06-06  3357  	for (si =3D 0;;) {
73f91b004321f2 Matthew Rosato 2022-06-06  3358  		/* Scan adapter summary i=
ndicator bit vector */
73f91b004321f2 Matthew Rosato 2022-06-06  3359  		si =3D airq_iv_scan(aift-=
>sbv, si, airq_iv_end(aift->sbv));
73f91b004321f2 Matthew Rosato 2022-06-06  3360  		if (si =3D=3D -1UL) {
73f91b004321f2 Matthew Rosato 2022-06-06  3361  			if (first || found) {
73f91b004321f2 Matthew Rosato 2022-06-06  3362  				/* Re-enable interrupts=
. */
73f91b004321f2 Matthew Rosato 2022-06-06  3363  				zpci_set_irq_ctrl(SIC_I=
RQ_MODE_SINGLE, isc,
73f91b004321f2 Matthew Rosato 2022-06-06  3364  						  &iib);
73f91b004321f2 Matthew Rosato 2022-06-06 @3365  				first =3D found =3D fal=
se;
73f91b004321f2 Matthew Rosato 2022-06-06  3366  			} else {
73f91b004321f2 Matthew Rosato 2022-06-06  3367  				/* Interrupts on and al=
l bits processed */
73f91b004321f2 Matthew Rosato 2022-06-06  3368  				break;
73f91b004321f2 Matthew Rosato 2022-06-06  3369  			}
73f91b004321f2 Matthew Rosato 2022-06-06  3370  			found =3D false;
73f91b004321f2 Matthew Rosato 2022-06-06  3371  			si =3D 0;
73f91b004321f2 Matthew Rosato 2022-06-06  3372  			/* Scan again after re-e=
nabling interrupts */
73f91b004321f2 Matthew Rosato 2022-06-06  3373  			continue;
73f91b004321f2 Matthew Rosato 2022-06-06  3374  		}
73f91b004321f2 Matthew Rosato 2022-06-06  3375  		found =3D true;
73f91b004321f2 Matthew Rosato 2022-06-06  3376  		aen_host_forward(si);
73f91b004321f2 Matthew Rosato 2022-06-06  3377  	}
73f91b004321f2 Matthew Rosato 2022-06-06  3378  =

73f91b004321f2 Matthew Rosato 2022-06-06  3379  	spin_unlock_irqrestore(&ai=
ft->gait_lock, flags);
73f91b004321f2 Matthew Rosato 2022-06-06  3380  }
73f91b004321f2 Matthew Rosato 2022-06-06  3381  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7120002162314040490==--

