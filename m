Content-Type: multipart/mixed; boundary="===============3678644948542475294=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 1/2] cpumask: Fix invalid uniprocessor mask assumption
Date: Sat, 04 Jun 2022 20:02:10 +0800
Message-ID: <202206041950.Be4CObej-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3678644948542475294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: include/l=
inux/cpumask.h:134:11: warning: Dereference of null pointer [clang-analyzer=
-core.NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <017b97698ba58d33bf45d30317d5a73c5b93d2a0.1654201862.git.sande=
r@svanheule.net>
References: <017b97698ba58d33bf45d30317d5a73c5b93d2a0.1654201862.git.sander=
@svanheule.net>
TO: Sander Vanheule <sander@svanheule.net>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Yury Norov <yury.norov@gmail.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Valentin Schneider <vschneid@redhat.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Marco Elver <elver@google.com>
TO: Barry Song <song.bao.hua@hisilicon.com>
CC: linux-kernel(a)vger.kernel.org
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Sander Vanheule <sander@svanheule.net>

Hi Sander,

I love your patch! Perhaps something to improve:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v5.18 next-20220603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Sander-Vanheule/cpum=
ask-Fix-invalid-uniprocessor-assumptions/20220603-050659
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ever=
ything
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
604/202206041950.Be4CObej-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c7=
6683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4bf6a27a30fc5847a5f=
c6e6dae56e5716c2625ad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sander-Vanheule/cpumask-Fix-invali=
d-uniprocessor-assumptions/20220603-050659
        git checkout 4bf6a27a30fc5847a5fc6e6dae56e5716c2625ad
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^
   block/blk-mq.c:3012:17: note: Assuming the condition is false
           if (rq->bio && blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask) < 0)
                          ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   block/blk-mq.c:3012:2: note: '?' condition is false
           if (rq->bio && blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask) < 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   block/blk-mq.c:3012:6: note: Assuming field 'bio' is non-null
           if (rq->bio && blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask) < 0)
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
   block/blk-mq.c:3012:6: note: Left side of '&&' is true
           if (rq->bio && blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask) < 0)
               ^
   block/blk-mq.c:3012:17: note: Assuming the condition is true
           if (rq->bio && blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask) < 0)
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
   block/blk-mq.c:3012:2: note: '?' condition is true
           if (rq->bio && blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask) < 0)
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
   block/blk-mq.c:3012:2: note: Taking true branch
           if (rq->bio && blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask) < 0)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   block/blk-mq.c:3013:3: note: Control jumps to line 3018
                   goto free_and_out;
                   ^
   block/blk-mq.c:3018:2: note: 1st function call argument is an uninitiali=
zed value
           if (bio)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^                    ~~~~
   block/blk-mq.c:4234:3: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(new_tags, set->tags, cur_nr_hw_queues *
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   block/blk-mq.c:4234:3: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                   memcpy(new_tags, set->tags, cur_nr_hw_queues *
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   block/blk-mq.c:4344:2: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memset(set, 0, sizeof(*set));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   block/blk-mq.c:4344:2: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
           memset(set, 0, sizeof(*set));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
>> include/linux/cpumask.h:134:11: warning: Dereference of null pointer [cl=
ang-analyzer-core.NullDereference]
           return !(*cpumask_bits(srcp1) & *cpumask_bits(srcp2) & 1);
                    ^
   block/blk-mq.c:3335:31: note: Assuming '____ptr' is null
           struct blk_mq_hw_ctx *hctx =3D hlist_entry_safe(node,
                                        ^
   include/linux/list.h:1029:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^~~~~~~
   block/blk-mq.c:3335:31: note: '?' condition is false
           struct blk_mq_hw_ctx *hctx =3D hlist_entry_safe(node,
                                        ^
   include/linux/list.h:1029:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^
   block/blk-mq.c:3338:6: note: Assuming the condition is false
           if (!cpumask_test_cpu(cpu, hctx->cpumask) ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   block/blk-mq.c:3338:6: note: Left side of '||' is false
           if (!cpumask_test_cpu(cpu, hctx->cpumask) ||
               ^
   block/blk-mq.c:3339:7: note: Calling 'blk_mq_last_cpu_in_hctx'
               !blk_mq_last_cpu_in_hctx(cpu, hctx))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   block/blk-mq.c:3326:24: note: Passing null pointer value via 1st paramet=
er 'srcp1'
           if (cpumask_first_and(hctx->cpumask, cpu_online_mask) !=3D cpu)
                                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   block/blk-mq.c:3326:6: note: Calling 'cpumask_first_and'
           if (cpumask_first_and(hctx->cpumask, cpu_online_mask) !=3D cpu)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/linux/cpumask.h:134:11: note: Dereference of null pointer
           return !(*cpumask_bits(srcp1) & *cpumask_bits(srcp2) & 1);
                    ^~~~~~~~~~~~~~~~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/nvme/host/multipath.c:40:9: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           return sprintf(buf, "%s\n", nvme_iopolicy_names[iopolicy]);
                  ^~~~~~~
   drivers/nvme/host/multipath.c:40:9: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           return sprintf(buf, "%s\n", nvme_iopolicy_names[iopolicy]);
                  ^~~~~~~
   drivers/nvme/host/multipath.c:498:2: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(head->disk->disk_name, "nvme%dn%d",
           ^~~~~~~
   drivers/nvme/host/multipath.c:498:2: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           sprintf(head->disk->disk_name, "nvme%dn%d",
           ^~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/nvme/host/fabrics.c:70:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(host->nqn, NVMF_NQN_SIZE,
           ^~~~~~~~
   drivers/nvme/host/fabrics.c:70:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(host->nqn, NVMF_NQN_SIZE,
           ^~~~~~~~
   drivers/nvme/host/fabrics.c:388:2: warning: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(data->subsysnqn, ctrl->opts->subsysnqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:388:2: note: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11
           strncpy(data->subsysnqn, ctrl->opts->subsysnqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:389:2: warning: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(data->hostnqn, ctrl->opts->host->nqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:389:2: note: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11
           strncpy(data->hostnqn, ctrl->opts->host->nqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:449:2: warning: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(data->subsysnqn, ctrl->opts->subsysnqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:449:2: note: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11
           strncpy(data->subsysnqn, ctrl->opts->subsysnqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:450:2: warning: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(data->hostnqn, ctrl->opts->host->nqn, NVMF_NQN_SIZE);

vim +134 include/linux/cpumask.h

9b51d9d866482a Yury Norov      2021-08-14  130  =

93ba139ba8190c Yury Norov      2021-08-14  131  static inline unsigned int =
cpumask_first_and(const struct cpumask *srcp1,
93ba139ba8190c Yury Norov      2021-08-14  132  					     const struct cpum=
ask *srcp2)
93ba139ba8190c Yury Norov      2021-08-14  133  {
4bf6a27a30fc58 Sander Vanheule 2022-06-02 @134  	return !(*cpumask_bits(src=
p1) & *cpumask_bits(srcp2) & 1);
93ba139ba8190c Yury Norov      2021-08-14  135  }
93ba139ba8190c Yury Norov      2021-08-14  136  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3678644948542475294==--

