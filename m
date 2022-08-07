Content-Type: multipart/mixed; boundary="===============2570113911572420010=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/trace/trace_syscalls.c:306:36: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sun, 07 Aug 2022 11:19:24 +0800
Message-ID: <202208071104.VGnNEFOT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2570113911572420010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 kernel/trace/trace_syscalls.c:306:36: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Heiko Carstens <hca@linux.ibm.com>

Hi Heiko,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4d1044fcb996e8de9b9ab392f4a767890e45202d
commit: 4c25f0ff6336738fcb03216ae103c3c17908304a s390/entry: workaround llv=
m's IAS limitations
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: s390-randconfig-c005-20220804 (https://download.01.org/0day-ci/arch=
ive/20220807/202208071104.VGnNEFOT-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42=
705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4c25f0ff6336738fcb03216ae103c3c17908304a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4c25f0ff6336738fcb03216ae103c3c17908304a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   #define this_cpu_add_8(pcp, val) arch_this_cpu_add(pcp, val, "laag", "ag=
si", long)
                                    ^
   arch/s390/include/asm/percpu.h:71:2: note: expanded from macro 'arch_thi=
s_cpu_add'
           preempt_disable_notrace();                                      \
           ^
   include/linux/preempt.h:254:35: note: expanded from macro 'preempt_disab=
le_notrace'
   #define preempt_disable_notrace() \
                                     ^
   include/linux/vmstat.h:71:2: note: Loop condition is false.  Exiting loop
           this_cpu_inc(vm_event_states.event[item]);
           ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_=
inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   include/linux/percpu-defs.h:380:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   arch/s390/include/asm/percpu.h:72:10: note: expanded from macro 'arch_th=
is_cpu_add'
           ptr__ =3D raw_cpu_ptr(&(pcp));                            \
                   ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/vmstat.h:71:2: note: Dereference of null pointer
           this_cpu_inc(vm_event_states.event[item]);
           ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_=
inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   include/linux/percpu-defs.h:380:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   mm/vmacache.c:32:9: warning: Dereference of null pointer [clang-analyzer=
-core.NullDereference]
           return current->mm =3D=3D mm && !(current->flags & PF_KTHREAD);
                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/vmacache.c:45:7: note: Calling 'vmacache_valid_mm'
           if (!vmacache_valid_mm(mm))
                ^~~~~~~~~~~~~~~~~~~~~
   mm/vmacache.c:32:9: note: Dereference of null pointer
           return current->mm =3D=3D mm && !(current->flags & PF_KTHREAD);
                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   kernel/trace/trace_syscalls.c:220:9: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           pos +=3D snprintf(buf + pos, LEN_OR_ZERO, "\"");
                  ^~~~~~~~
   kernel/trace/trace_syscalls.c:220:9: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           pos +=3D snprintf(buf + pos, LEN_OR_ZERO, "\"");
                  ^~~~~~~~
   kernel/trace/trace_syscalls.c:222:10: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos +=3D snprintf(buf + pos, LEN_OR_ZERO, "%s: 0x%%0%zul=
x%s",
                          ^~~~~~~~
   kernel/trace/trace_syscalls.c:222:10: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
                   pos +=3D snprintf(buf + pos, LEN_OR_ZERO, "%s: 0x%%0%zul=
x%s",
                          ^~~~~~~~
   kernel/trace/trace_syscalls.c:226:9: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           pos +=3D snprintf(buf + pos, LEN_OR_ZERO, "\"");
                  ^~~~~~~~
   kernel/trace/trace_syscalls.c:226:9: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           pos +=3D snprintf(buf + pos, LEN_OR_ZERO, "\"");
                  ^~~~~~~~
   kernel/trace/trace_syscalls.c:229:10: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos +=3D snprintf(buf + pos, LEN_OR_ZERO,
                          ^~~~~~~~
   kernel/trace/trace_syscalls.c:229:10: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
                   pos +=3D snprintf(buf + pos, LEN_OR_ZERO,
                          ^~~~~~~~
>> kernel/trace/trace_syscalls.c:306:36: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           syscall_nr =3D trace_get_syscall_nr(current, regs);
                                             ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/trace/trace_syscalls.c:306:36: note: Dereference of null pointer
           syscall_nr =3D trace_get_syscall_nr(current, regs);
                                             ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/trace/trace_syscalls.c:334:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(entry->args, args, sizeof(unsigned long) * sys_data->nb_a=
rgs);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   kernel/trace/trace_syscalls.c:334:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(entry->args, args, sizeof(unsigned long) * sys_data->nb_a=
rgs);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   kernel/trace/trace_syscalls.c:351:36: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           syscall_nr =3D trace_get_syscall_nr(current, regs);
                                             ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/trace/trace_syscalls.c:351:36: note: Dereference of null pointer
           syscall_nr =3D trace_get_syscall_nr(current, regs);
                                             ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/trace/trace_syscalls.c:597:36: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           syscall_nr =3D trace_get_syscall_nr(current, regs);
                                             ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/trace/trace_syscalls.c:597:36: note: Dereference of null pointer
           syscall_nr =3D trace_get_syscall_nr(current, regs);
                                             ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/trace/trace_syscalls.c:623:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&rec->args, args, sizeof(unsigned long) * sys_data->nb_ar=
gs);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   kernel/trace/trace_syscalls.c:623:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&rec->args, args, sizeof(unsigned long) * sys_data->nb_ar=
gs);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
--
                   snprintf(cp_command, sizeof(cp_command),
                   ^~~~~~~~
   drivers/s390/char/vmlogrdr.c:466:4: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buffer, FENCE, sizeof(FENCE));
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/char/vmlogrdr.c:466:4: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                           memcpy(buffer, FENCE, sizeof(FENCE));
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/char/vmlogrdr.c:535:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", priv->autopurge);
                  ^~~~~~~
   drivers/s390/char/vmlogrdr.c:535:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", priv->autopurge);
                  ^~~~~~~
   drivers/s390/char/vmlogrdr.c:555:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cp_command, 0x00, sizeof(cp_command));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/char/vmlogrdr.c:555:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(cp_command, 0x00, sizeof(cp_command));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/char/vmlogrdr.c:556:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(cp_response, 0x00, sizeof(cp_response));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/char/vmlogrdr.c:556:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(cp_response, 0x00, sizeof(cp_response));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/char/vmlogrdr.c:566:3: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(cp_command, sizeof(cp_command),
                   ^~~~~~~~
   drivers/s390/char/vmlogrdr.c:566:3: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(cp_command, sizeof(cp_command),
                   ^~~~~~~~
   drivers/s390/char/vmlogrdr.c:570:3: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(cp_command, sizeof(cp_command),
                   ^~~~~~~~
   drivers/s390/char/vmlogrdr.c:570:3: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(cp_command, sizeof(cp_command),
                   ^~~~~~~~
   drivers/s390/char/vmlogrdr.c:609:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", priv->autorecording);
                  ^~~~~~~
   drivers/s390/char/vmlogrdr.c:609:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", priv->autorecording);
                  ^~~~~~~
>> drivers/s390/char/vmlogrdr.c:829:8: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
           if (! MACHINE_IS_VM) {
                 ^
   arch/s390/include/asm/setup.h:80:25: note: expanded from macro 'MACHINE_=
IS_VM'
   #define MACHINE_IS_VM           (S390_lowcore.machine_flags & MACHINE_FL=
AG_VM)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/s390/char/vmlogrdr.c:829:8: note: Dereference of null pointer
           if (! MACHINE_IS_VM) {
                 ^
   arch/s390/include/asm/setup.h:80:25: note: expanded from macro 'MACHINE_=
IS_VM'
   #define MACHINE_IS_VM           (S390_lowcore.machine_flags & MACHINE_FL=
AG_VM)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/dma/virt-dma.c:97:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&cb, 0, sizeof(cb));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/dma/virt-dma.c:97:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(&cb, 0, sizeof(cb));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 58 warnings (46 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/dma/dmatest.c:376:28: warning: Dereference of null pointer [clan=
g-analyzer-core.NullDereference]
           const char      *thread_name =3D current->comm;
                                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/dma/dmatest.c:404:2: note: Loop condition is true.  Entering loo=
p body
           for (; (buf =3D *bufs); bufs++) {
           ^
   drivers/dma/dmatest.c:406:19: note: Assuming 'i' is < 'end'
                   for (i =3D start; i < end; i++) {
                                   ^~~~~~~
   drivers/dma/dmatest.c:406:3: note: Loop condition is true.  Entering loo=
p body
                   for (i =3D start; i < end; i++) {
                   ^
   drivers/dma/dmatest.c:409:8: note: Assuming 'actual' is not equal to 'ex=
pected'
                           if (actual !=3D expected) {
                               ^~~~~~~~~~~~~~~~~~
   drivers/dma/dmatest.c:409:4: note: Taking true branch
                           if (actual !=3D expected) {
                           ^
   drivers/dma/dmatest.c:410:9: note: 'error_count' is < MAX_ERROR_COUNT
                                   if (error_count < MAX_ERROR_COUNT)
                                       ^~~~~~~~~~~
   drivers/dma/dmatest.c:410:5: note: Taking true branch
                                   if (error_count < MAX_ERROR_COUNT)
                                   ^
   drivers/dma/dmatest.c:411:6: note: Calling 'dmatest_mismatch'
                                           dmatest_mismatch(actual, pattern=
, i,
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/dma/dmatest.c:376:28: note: Dereference of null pointer
           const char      *thread_name =3D current->comm;
                                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/dma/dmatest.c:460:4: warning: Dereference of null pointer [clang=
-analyzer-core.NullDereference]
                           current->comm, n, err, src_off, dst_off, len, da=
ta);
                           ^
   include/linux/printk.h:519:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
--
   drivers/s390/char/sclp_early.c:58:15: note: Assuming field 'rnmax' is 0
           sclp.rnmax =3D sccb->rnmax ? sccb->rnmax : sccb->rnmax2;
                        ^~~~~~~~~~~
   drivers/s390/char/sclp_early.c:58:15: note: '?' condition is false
   drivers/s390/char/sclp_early.c:59:13: note: Assuming field 'rnsize' is 0
           sclp.rzm =3D sccb->rnsize ? sccb->rnsize : sccb->rnsize2;
                      ^~~~~~~~~~~~
   drivers/s390/char/sclp_early.c:59:13: note: '?' condition is false
   drivers/s390/char/sclp_early.c:63:6: note: Assuming field 'hamaxpow' is 0
           if (sccb->hamaxpow && sccb->hamaxpow < 64)
               ^~~~~~~~~~~~~~
   drivers/s390/char/sclp_early.c:63:21: note: Left side of '&&' is false
           if (sccb->hamaxpow && sccb->hamaxpow < 64)
                              ^
   drivers/s390/char/sclp_early.c:68:6: note: Assuming field 'hcpua' is 0
           if (!sccb->hcpua) {
               ^~~~~~~~~~~~
   drivers/s390/char/sclp_early.c:68:2: note: Taking true branch
           if (!sccb->hcpua) {
           ^
   drivers/s390/char/sclp_early.c:69:7: note: Dereference of null pointer
                   if (MACHINE_IS_VM)
                       ^
   arch/s390/include/asm/setup.h:80:25: note: expanded from macro 'MACHINE_=
IS_VM'
   #define MACHINE_IS_VM           (S390_lowcore.machine_flags & MACHINE_FL=
AG_VM)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/s390/char/sclp_early.c:96:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&sclp_ipl_info.loadparm, &sccb->loadparm, LOADPARM_LEN);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/char/sclp_early.c:96:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&sclp_ipl_info.loadparm, &sccb->loadparm, LOADPARM_LEN);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/char/sclp_early.c:131:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sccb, 0, length);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/char/sclp_early.c:131:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(sccb, 0, length);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 64 warnings (52 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/leds/trigger/ledtrig-tty.c:33:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
                   len =3D sprintf(buf, "%s\n", trigger_data->ttyname);
                         ^~~~~~~
   drivers/leds/trigger/ledtrig-tty.c:33:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
                   len =3D sprintf(buf, "%s\n", trigger_data->ttyname);
                         ^~~~~~~
   Suppressed 58 warnings (46 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (46 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
>> fs/jffs2/build.c:201:6: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]
                                           JFFS2_ERROR("child dir \"%s\" (i=
no #%u) of dir ino #%u is also hard linked from dir ino #%u\n",
                                           ^
   fs/jffs2/debug.h:81:21: note: expanded from macro 'JFFS2_ERROR'
                  task_pid_nr(current), __func__, ##__VA_ARGS__)
                              ^
   fs/jffs2/build.c:380:2: note: Taking false branch
           if (jffs2_blocks_use_vmalloc(c))
           ^
   fs/jffs2/build.c:385:6: note: Assuming field 'blocks' is non-null
           if (!c->blocks)
               ^~~~~~~~~~
   fs/jffs2/build.c:385:2: note: Taking false branch
           if (!c->blocks)
           ^
   fs/jffs2/build.c:388:12: note: Assuming 'i' is >=3D field 'nr_blocks'
           for (i=3D0; i<c->nr_blocks; i++) {
                     ^~~~~~~~~~~~~~
   fs/jffs2/build.c:388:2: note: Loop condition is false. Execution continu=
es on line 394
           for (i=3D0; i<c->nr_blocks; i++) {
           ^
   fs/jffs2/build.c:410:6: note: 'ret' is 0
           if (ret)
               ^~~
   fs/jffs2/build.c:410:2: note: Taking false branch
           if (ret)
           ^
   fs/jffs2/build.c:413:6: note: Calling 'jffs2_build_filesystem'
           if (jffs2_build_filesystem(c)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/build.c:106:2: note: Taking false branch
           dbg_fsbuild("build FS data structures\n");
           ^
   fs/jffs2/debug.h:155:31: note: expanded from macro 'dbg_fsbuild'
   #define dbg_fsbuild(fmt, ...)   no_printk(fmt, ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/jffs2/build.c:114:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   fs/jffs2/build.c:114:2: note: Taking false branch
           if (ret)
           ^
   fs/jffs2/build.c:117:2: note: Taking false branch
           dbg_fsbuild("scanned flash completely\n");
           ^
   fs/jffs2/debug.h:155:31: note: expanded from macro 'dbg_fsbuild'
   #define dbg_fsbuild(fmt, ...)   no_printk(fmt, ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/jffs2/build.c:120:2: note: Taking false branch
           dbg_fsbuild("pass 1 starting\n");
           ^
   fs/jffs2/debug.h:155:31: note: expanded from macro 'dbg_fsbuild'
   #define dbg_fsbuild(fmt, ...)   no_printk(fmt, ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/jffs2/build.c:123:2: note: Loop condition is true.  Entering loop body
           for_each_inode(i, c, ic) {
           ^
   fs/jffs2/build.c:47:2: note: expanded from macro 'for_each_inode'
           for (i =3D 0, ic =3D first_inode_chain(&i, (c));    \
           ^
   fs/jffs2/build.c:124:7: note: Assuming field 'scan_dents' is non-null
                   if (ic->scan_dents) {
                       ^~~~~~~~~~~~~~
   fs/jffs2/build.c:124:3: note: Taking true branch
                   if (ic->scan_dents) {
                   ^
   fs/jffs2/build.c:125:4: note: Calling 'jffs2_build_inode_pass1'
                           jffs2_build_inode_pass1(c, ic, &dir_hardlinks);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/build.c:58:2: note: Taking false branch
           dbg_fsbuild("building directory inode #%u\n", ic->ino);
           ^
   fs/jffs2/debug.h:155:31: note: expanded from macro 'dbg_fsbuild'
   #define dbg_fsbuild(fmt, ...)   no_printk(fmt, ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/jffs2/build.c:61:2: note: Loop condition is true.  Entering loop body
           for(fd =3D ic->scan_dents; fd; fd =3D fd->next) {
           ^
   fs/jffs2/build.c:63:7: note: Assuming field 'ino' is not equal to 0, whi=
ch participates in a condition later
                   if (!fd->ino)
                       ^~~~~~~~
   fs/jffs2/build.c:63:3: note: Taking false branch
                   if (!fd->ino)
                   ^
   fs/jffs2/build.c:69:7: note: Assuming 'child_ic' is non-null, which part=
icipates in a condition later
                   if (!child_ic) {
                       ^~~~~~~~~
   fs/jffs2/build.c:69:3: note: Taking false branch
                   if (!child_ic) {
--
                      ^
   include/asm-generic/io.h:464:8: note: Calling '__raw_readb'
           val =3D __raw_readb(PCI_IOBASE + addr);
                 ^
   include/asm-generic/io.h:74:21: note: expanded from macro '__raw_readb'
   #define __raw_readb __raw_readb
                       ^
   include/asm-generic/io.h:77:9: note: Dereference of null pointer
           return *(const volatile u8 __force *)addr;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/io.h:111:31: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
           *(volatile u8 __force *)addr =3D value;
                                        ^
   drivers/comedi/drivers/pcl711.c:341:2: note: Calling 'pcl711_set_changai=
n'
           pcl711_set_changain(dev, s, cmd->chanlist[0]);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/pcl711.c:216:2: note: Calling '_outb'
           outb(PCL711_AI_GAIN(range), dev->iobase + PCL711_AI_GAIN_REG);
           ^
   include/asm-generic/io.h:541:14: note: expanded from macro 'outb'
   #define outb _outb
                ^
   include/asm-generic/io.h:497:15: note: expanded from macro '_outb'
   #define _outb _outb
                 ^
   include/asm-generic/io.h:500:2: note: Loop condition is false.  Exiting =
loop
           __io_pbw();
           ^
   include/asm-generic/io.h:49:24: note: expanded from macro '__io_pbw'
   #define __io_pbw()     __io_bw()
                          ^
   include/asm-generic/io.h:37:24: note: expanded from macro '__io_bw'
   #define __io_bw()      wmb()
                          ^
   include/asm-generic/barrier.h:38:20: note: expanded from macro 'wmb'
   #define wmb()   do { kcsan_wmb(); __wmb(); } while (0)
                        ^
   include/linux/kcsan-checks.h:265:21: note: expanded from macro 'kcsan_wm=
b'
   #define kcsan_wmb()     do { } while (0)
                           ^
   include/asm-generic/io.h:500:2: note: Loop condition is false.  Exiting =
loop
           __io_pbw();
           ^
   include/asm-generic/io.h:49:24: note: expanded from macro '__io_pbw'
   #define __io_pbw()     __io_bw()
                          ^
   include/asm-generic/io.h:37:24: note: expanded from macro '__io_bw'
   #define __io_bw()      wmb()
                          ^
   include/asm-generic/barrier.h:38:15: note: expanded from macro 'wmb'
   #define wmb()   do { kcsan_wmb(); __wmb(); } while (0)
                   ^
   include/asm-generic/io.h:501:22: note: Passing null pointer value via 2n=
d parameter 'addr'
           __raw_writeb(value, PCI_IOBASE + addr);
                               ^
   include/asm-generic/io.h:444:20: note: expanded from macro 'PCI_IOBASE'
   #define PCI_IOBASE ((void __iomem *)0)
                      ^
   include/asm-generic/io.h:501:2: note: Calling '__raw_writeb'
           __raw_writeb(value, PCI_IOBASE + addr);
           ^
   include/asm-generic/io.h:108:22: note: expanded from macro '__raw_writeb'
   #define __raw_writeb __raw_writeb
                        ^
   include/asm-generic/io.h:111:31: note: Dereference of null pointer
           *(volatile u8 __force *)addr =3D value;
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   Suppressed 58 warnings (46 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   fs/jffs2/file.c:161:3: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&ri, 0, sizeof(ri));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/jffs2/file.c:161:3: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                   memset(&ri, 0, sizeof(ri));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
>> fs/jffs2/nodelist.c:138:4: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
                           JFFS2_ERROR("duplicate frag at %08x (%p,%p)\n", =
newfrag->ofs, newfrag, base);
                           ^
   fs/jffs2/debug.h:81:21: note: expanded from macro 'JFFS2_ERROR'
                  task_pid_nr(current), __func__, ##__VA_ARGS__)
                              ^
   fs/jffs2/nodelist.c:368:15: note: Assuming field 'size' is not equal to 0
           if (unlikely(!fn->size))
                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/jffs2/nodelist.c:368:20: note: Field 'size' is not equal to 0
           if (unlikely(!fn->size))
                             ^
   fs/jffs2/nodelist.c:368:2: note: Taking false branch
           if (unlikely(!fn->size))
           ^
   fs/jffs2/nodelist.c:372:16: note: 'newfrag' is non-null
           if (unlikely(!newfrag))
                         ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/jffs2/nodelist.c:372:16: note: 'newfrag' is non-null
           if (unlikely(!newfrag))
                         ^
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   fs/jffs2/nodelist.c:372:2: note: Taking false branch
           if (unlikely(!newfrag))
           ^
   fs/jffs2/nodelist.c:376:2: note: Taking false branch
           dbg_fragtree("adding node %#04x-%#04x @0x%08x on flash, newfrag =
*%p\n",
           ^
   fs/jffs2/debug.h:115:32: note: expanded from macro 'dbg_fragtree'
   #define dbg_fragtree(fmt, ...)  no_printk(fmt, ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/jffs2/nodelist.c:379:8: note: Calling 'jffs2_add_frag_to_fragtree'
           ret =3D jffs2_add_frag_to_fragtree(c, &f->fragtree, newfrag);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/nodelist.c:223:6: note: 'this' is non-null
           if (this) {
               ^~~~
   fs/jffs2/nodelist.c:223:2: note: Taking true branch
           if (this) {
           ^
   fs/jffs2/nodelist.c:224:3: note: Taking false branch
                   dbg_fragtree2("lookup gave frag 0x%04x-0x%04x; phys 0x%0=
8x (*%p)\n",
                   ^
   fs/jffs2/debug.h:120:33: note: expanded from macro 'dbg_fragtree2'
   #define dbg_fragtree2(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/jffs2/nodelist.c:233:6: note: 'lastend' is > field 'ofs'
           if (lastend <=3D newfrag->ofs) {
               ^~~~~~~
   fs/jffs2/nodelist.c:233:2: note: Taking false branch
           if (lastend <=3D newfrag->ofs) {
           ^
   fs/jffs2/nodelist.c:249:6: note: Assuming field 'node' is null
           if (this->node)
               ^~~~~~~~~~
   fs/jffs2/nodelist.c:249:2: note: Taking false branch
           if (this->node)
           ^
   fs/jffs2/nodelist.c:254:3: note: Taking false branch
                   dbg_fragtree2("dealing with hole frag %u-%u.\n",
                   ^
   fs/jffs2/debug.h:120:33: note: expanded from macro 'dbg_fragtree2'
   #define dbg_fragtree2(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/jffs2/nodelist.c:260:6: note: Assuming 'newfrag->ofs' is <=3D 'this->=
ofs'
           if (newfrag->ofs > this->ofs) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/nodelist.c:260:2: note: Taking false branch
           if (newfrag->ofs > this->ofs) {
           ^
   fs/jffs2/nodelist.c:314:3: note: Taking false branch
                   dbg_fragtree2("inserting newfrag (*%p),%d-%d in before '=
this' (*%p),%d-%d\n",
                   ^
   fs/jffs2/debug.h:120:33: note: expanded from macro 'dbg_fragtree2'
   #define dbg_fragtree2(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
--
                          ^~~~~~~
   drivers/s390/cio/device.c:552:11: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           return sprintf(buf, "no path\n");
                                  ^~~~~~~
   drivers/s390/cio/device.c:552:11: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                           return sprintf(buf, "no path\n");
                                  ^~~~~~~
   drivers/s390/cio/device.c:554:11: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           return sprintf(buf, "no device\n");
                                  ^~~~~~~
   drivers/s390/cio/device.c:554:11: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                           return sprintf(buf, "no device\n");
                                  ^~~~~~~
   drivers/s390/cio/device.c:557:10: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "good\n");
                          ^~~~~~~
   drivers/s390/cio/device.c:557:10: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "good\n");
                          ^~~~~~~
   drivers/s390/cio/device.c:584:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%02x\n", sch->vpm);
                  ^~~~~~~
   drivers/s390/cio/device.c:584:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%02x\n", sch->vpm);
                  ^~~~~~~
   drivers/s390/cio/device.c:990:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&sch->config, 0, sizeof(sch->config));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/cio/device.c:990:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&sch->config, 0, sizeof(sch->config));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/cio/device.c:1325:21: warning: Dereference of null pointer =
[clang-analyzer-core.NullDereference]
           if (signal_pending(current))
                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/s390/cio/device.c:1314:6: note: Assuming the condition is false
           if (is_blacklisted(id->ssid, id->devno) &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/s390/cio/device.c:1314:42: note: Left side of '&&' is false
           if (is_blacklisted(id->ssid, id->devno) &&
                                                   ^
   drivers/s390/cio/device.c:1325:21: note: Dereference of null pointer
           if (signal_pending(current))
                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   fs/jffs2/erase.c:60:2: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memset(instr, 0, sizeof(*instr));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/jffs2/erase.c:60:2: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
           memset(instr, 0, sizeof(*instr));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> fs/jffs2/erase.c:246:3: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]
                   JFFS2_WARNING("inode_cache/xattr_datum/xattr_ref"
                   ^
   fs/jffs2/debug.h:85:15: note: expanded from macro 'JFFS2_WARNING'
                   task_pid_nr(current), __func__, ##__VA_ARGS__)
                               ^
   fs/jffs2/erase.c:110:9: note: Assuming the condition is true
           while (!list_empty(&c->erase_complete_list) ||
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/erase.c:110:46: note: Left side of '||' is true
           while (!list_empty(&c->erase_complete_list) ||
                                                       ^
   fs/jffs2/erase.c:113:7: note: Assuming the condition is false
                   if (!list_empty(&c->erase_complete_list)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/erase.c:113:3: note: Taking false branch
                   if (!list_empty(&c->erase_complete_list)) {
                   ^
   fs/jffs2/erase.c:126:14: note: Assuming the condition is true
                   } else if (!list_empty(&c->erase_pending_list)) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/erase.c:126:10: note: Taking true branch
                   } else if (!list_empty(&c->erase_pending_list)) {
                          ^
   fs/jffs2/erase.c:128:4: note: 0 is < 1
                           jffs2_dbg(1, "Starting erase of pending block 0x=
%08x\n",
                           ^
   fs/jffs2/debug.h:69:6: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
               ^~~~~~~~~~~~~~~~~~~~~
   ./include/generated/autoconf.h:413:31: note: expanded from macro 'CONFIG=
_JFFS2_FS_DEBUG'
   #define CONFIG_JFFS2_FS_DEBUG 0
                                 ^
   fs/jffs2/erase.c:128:4: note: Taking false branch
                           jffs2_dbg(1, "Starting erase of pending block 0x=
%08x\n",
                           ^
   fs/jffs2/debug.h:69:2: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
           ^
   fs/jffs2/erase.c:128:4: note: Loop condition is false.  Exiting loop
                           jffs2_dbg(1, "Starting erase of pending block 0x=
%08x\n",
                           ^
   fs/jffs2/debug.h:67:37: note: expanded from macro 'jffs2_dbg'
   #define jffs2_dbg(level, fmt, ...)              \
                                                   ^
   fs/jffs2/erase.c:137:4: note: Calling 'jffs2_free_jeb_node_refs'
                           jffs2_free_jeb_node_refs(c, jeb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/erase.c:292:2: note: 0 is < 1
           jffs2_dbg(1, "Freeing all node refs for eraseblock offset 0x%08x=
\n",
           ^
   fs/jffs2/debug.h:69:6: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
               ^~~~~~~~~~~~~~~~~~~~~
   ./include/generated/autoconf.h:413:31: note: expanded from macro 'CONFIG=
_JFFS2_FS_DEBUG'
   #define CONFIG_JFFS2_FS_DEBUG 0
                                 ^
   fs/jffs2/erase.c:292:2: note: Taking false branch
           jffs2_dbg(1, "Freeing all node refs for eraseblock offset 0x%08x=
\n",
           ^
   fs/jffs2/debug.h:69:2: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
           ^
   fs/jffs2/erase.c:292:2: note: Loop condition is false.  Exiting loop
           jffs2_dbg(1, "Freeing all node refs for eraseblock offset 0x%08x=
\n",
           ^
   fs/jffs2/debug.h:67:37: note: expanded from macro 'jffs2_dbg'
   #define jffs2_dbg(level, fmt, ...)              \
                                                   ^
   fs/jffs2/erase.c:297:2: note: Loop condition is true.  Entering loop body
           while (ref) {
           ^
   fs/jffs2/erase.c:298:7: note: Assuming the condition is false
                   if (ref->flash_offset =3D=3D REF_LINK_NODE) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/erase.c:298:3: note: Taking false branch
                   if (ref->flash_offset =3D=3D REF_LINK_NODE) {
                   ^
   fs/jffs2/erase.c:304:7: note: Assuming the condition is true
                   if (ref->flash_offset !=3D REF_EMPTY_NODE && ref->next_i=
n_ino)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/erase.c:304:7: note: Left side of '&&' is true
   fs/jffs2/erase.c:304:46: note: Assuming field 'next_in_ino' is non-null
                   if (ref->flash_offset !=3D REF_EMPTY_NODE && ref->next_i=
n_ino)
                                                              ^~~~~~~~~~~~~=
~~~
   fs/jffs2/erase.c:304:3: note: Taking true branch
                   if (ref->flash_offset !=3D REF_EMPTY_NODE && ref->next_i=
n_ino)
                   ^
   fs/jffs2/erase.c:305:4: note: Calling 'jffs2_remove_node_refs_from_ino_l=
ist'
                           jffs2_remove_node_refs_from_ino_list(c, ref, jeb=
);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/erase.c:217:2: note: Loop condition is true.  Entering loop body
           while (1) {
           ^
   fs/jffs2/erase.c:218:7: note: Assuming field 'next_in_ino' is non-null
                   if (!(*prev)->next_in_ino) {
                       ^~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/erase.c:218:3: note: Taking false branch
                   if (!(*prev)->next_in_ino) {
                   ^
   fs/jffs2/erase.c:227:7: note: Assuming the condition is true
--
           memcpy(&buffer[WP512_BLOCK_SIZE - WP512_LENGTHBYTES],
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   crypto/wp512.c:1103:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(out, D, WP384_DIGEST_SIZE);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   crypto/wp512.c:1103:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(out, D, WP384_DIGEST_SIZE);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   crypto/wp512.c:1114:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(out, D, WP256_DIGEST_SIZE);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   crypto/wp512.c:1114:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(out, D, WP256_DIGEST_SIZE);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (20 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   arch/s390/include/asm/timex.h:256:6: warning: Dereference of null pointe=
r [clang-analyzer-core.NullDereference]
           if (MACHINE_HAS_SCC)
               ^
   arch/s390/include/asm/setup.h:96:27: note: expanded from macro 'MACHINE_=
HAS_SCC'
   #define MACHINE_HAS_SCC         (S390_lowcore.machine_flags & MACHINE_FL=
AG_SCC)
                                    ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/lib/delay.c:46:2: note: Calling 'delay_loop'
           delay_loop(nsecs);
           ^~~~~~~~~~~~~~~~~
   arch/s390/lib/delay.c:32:10: note: Calling 'tod_after'
           while (!tod_after(get_tod_clock_monotonic(), end))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/timex.h:256:6: note: Dereference of null pointer
           if (MACHINE_HAS_SCC)
               ^
   arch/s390/include/asm/setup.h:96:27: note: expanded from macro 'MACHINE_=
HAS_SCC'
   #define MACHINE_HAS_SCC         (S390_lowcore.machine_flags & MACHINE_FL=
AG_SCC)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
>> fs/ubifs/budget.c:263:13: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           if (uid_eq(current_fsuid(), c->rp_uid) || capable(CAP_SYS_RESOUR=
CE) ||
                      ^
   include/linux/cred.h:387:27: note: expanded from macro 'current_fsuid'
   #define current_fsuid()         (current_cred_xxx(fsuid))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/ubifs/budget.c:430:18: note: Assuming field 'new_page' is > 1
           ubifs_assert(c, req->new_page <=3D 1);
                           ^
   fs/ubifs/debug.h:143:17: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
                          ^~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/ubifs/budget.c:430:23: note: Field 'new_page' is > 1
           ubifs_assert(c, req->new_page <=3D 1);
                                ^
   fs/ubifs/budget.c:430:2: note: Taking true branch
           ubifs_assert(c, req->new_page <=3D 1);
           ^
   fs/ubifs/debug.h:143:2: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
           ^
   fs/ubifs/budget.c:430:2: note: Loop condition is false.  Exiting loop
           ubifs_assert(c, req->new_page <=3D 1);
           ^
   fs/ubifs/debug.h:142:31: note: expanded from macro 'ubifs_assert'
   #define ubifs_assert(c, expr) do {                                      =
       \
                                 ^
   fs/ubifs/budget.c:431:18: note: Assuming field 'dirtied_page' is > 1
           ubifs_assert(c, req->dirtied_page <=3D 1);
                           ^
   fs/ubifs/debug.h:143:17: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
                          ^~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/ubifs/budget.c:431:23: note: Field 'dirtied_page' is > 1
           ubifs_assert(c, req->dirtied_page <=3D 1);
                                ^
   fs/ubifs/budget.c:431:2: note: Taking true branch
           ubifs_assert(c, req->dirtied_page <=3D 1);
           ^
   fs/ubifs/debug.h:143:2: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
           ^
   fs/ubifs/budget.c:431:2: note: Loop condition is false.  Exiting loop
           ubifs_assert(c, req->dirtied_page <=3D 1);
           ^
   fs/ubifs/debug.h:142:31: note: expanded from macro 'ubifs_assert'
   #define ubifs_assert(c, expr) do {                                      =
       \
                                 ^
   fs/ubifs/budget.c:432:18: note: Assuming field 'new_dent' is > 1
           ubifs_assert(c, req->new_dent <=3D 1);
                           ^
   fs/ubifs/debug.h:143:17: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
                          ^~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/ubifs/budget.c:432:23: note: Field 'new_dent' is > 1
           ubifs_assert(c, req->new_dent <=3D 1);
                                ^
   fs/ubifs/budget.c:432:2: note: Taking true branch
           ubifs_assert(c, req->new_dent <=3D 1);
           ^
   fs/ubifs/debug.h:143:2: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
           ^
   fs/ubifs/budget.c:432:2: note: Loop condition is false.  Exiting loop
           ubifs_assert(c, req->new_dent <=3D 1);
           ^
   fs/ubifs/debug.h:142:31: note: expanded from macro 'ubifs_assert'
   #define ubifs_assert(c, expr) do {                                      =
       \
                                 ^
   fs/ubifs/budget.c:433:18: note: Assuming field 'mod_dent' is > 1
           ubifs_assert(c, req->mod_dent <=3D 1);
--
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
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
   arch/s390/kvm/interrupt.c:2672:2: note: Control jumps to 'case 10:' @=
line 2705
           switch (attr->group) {
           ^
   arch/s390/kvm/interrupt.c:2706:7: note: Calling 'flic_inject_airq'
                   r =3D flic_inject_airq(dev->kvm, attr);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kvm/interrupt.c:2641:6: note: Assuming 'adapter' is non-null
           if (!adapter)
               ^~~~~~~~
   arch/s390/kvm/interrupt.c:2641:2: note: Taking false branch
           if (!adapter)
           ^
   arch/s390/kvm/interrupt.c:2644:9: note: Calling 'kvm_s390_inject_airq'
           return kvm_s390_inject_airq(kvm, adapter);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kvm/interrupt.c:2616:34: note: Left side of '||' is true
           if (!test_kvm_facility(kvm, 72) || !adapter->suppressible)
                                           ^
   arch/s390/kvm/interrupt.c:2617:10: note: Calling 'kvm_s390_inject_vm'
                   return kvm_s390_inject_vm(kvm, &s390int);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kvm/interrupt.c:2019:6: note: Assuming 'inti' is non-null
           if (!inti)
               ^~~~~
   arch/s390/kvm/interrupt.c:2019:2: note: Taking false branch
           if (!inti)
           ^
   arch/s390/kvm/interrupt.c:2023:2: note: Control jumps to 'case 0:'  at l=
ine 2043
           switch (inti->type) {
           ^
   arch/s390/kvm/interrupt.c:2048:3: note:  Execution continues on line 2053
                   break;
                   ^
   arch/s390/kvm/interrupt.c:2053:2: note: Calling 'trace_kvm_s390_inject_v=
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
   Suppressed 88 warnings (75 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
>> fs/jffs2/background.c:85:15: warning: Dereference of null pointer [clang=
-analyzer-core.NullDereference]
           c->gc_task =3D current;
                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/jffs2/background.c:85:15: note: Dereference of null pointer
           c->gc_task =3D current;
                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   fs/jffs2/fs.c:445:2: warning: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memset(ri, 0, sizeof(*ri));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/jffs2/fs.c:445:2: note: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11
           memset(ri, 0, sizeof(*ri));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> fs/jffs2/fs.c:447:49: warning: Dereference of null pointer [clang-analyz=
er-core.NullDereference]
           ri->uid =3D cpu_to_je16(from_kuid(&init_user_ns, current_fsuid()=
));
                                                          ^
   include/linux/cred.h:387:27: note: expanded from macro 'current_fsuid'
   #define current_fsuid()         (current_cred_xxx(fsuid))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
                                     ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/rcupdate.h:594:31: note: expanded from macro 'rcu_derefere=
nce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
                                        ^
   include/linux/rcupdate.h:400:35: note: expanded from macro '__rcu_derefe=
rence_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   fs/jffs2/nodelist.h:36:36: note: expanded from macro 'cpu_to_je16'
   #define cpu_to_je16(x) ((jint16_t){x})
                                      ^
   fs/jffs2/fs.c:431:2: note: 0 is < 1
           jffs2_dbg(1, "%s(): dir_i %ld, mode 0x%x\n",
           ^
   fs/jffs2/debug.h:69:6: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
               ^~~~~~~~~~~~~~~~~~~~~
   ./include/generated/autoconf.h:413:31: note: expanded from macro 'CONFIG=
_JFFS2_FS_DEBUG'
   #define CONFIG_JFFS2_FS_DEBUG 0
                                 ^
   fs/jffs2/fs.c:431:2: note: Taking false branch
           jffs2_dbg(1, "%s(): dir_i %ld, mode 0x%x\n",
           ^
   fs/jffs2/debug.h:69:2: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
           ^
   fs/jffs2/fs.c:431:2: note: Loop condition is false.  Exiting loop
           jffs2_dbg(1, "%s(): dir_i %ld, mode 0x%x\n",
           ^
   fs/jffs2/debug.h:67:37: note: expanded from macro 'jffs2_dbg'
   #define jffs2_dbg(level, fmt, ...)              \
                                                   ^
   fs/jffs2/fs.c:438:6: note: Assuming 'inode' is non-null
           if (!inode)
               ^~~~~~
   fs/jffs2/fs.c:438:2: note: Taking false branch
           if (!inode)
           ^
   fs/jffs2/fs.c:447:49: note: Left side of '&&' is false
           ri->uid =3D cpu_to_je16(from_kuid(&init_user_ns, current_fsuid()=
));
                                                          ^
   include/linux/cred.h:387:27: note: expanded from macro 'current_fsuid'
   #define current_fsuid()         (current_cred_xxx(fsuid))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:594:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:398:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:347:48: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   fs/jffs2/fs.c:447:49: note: Loop condition is false.  Exiting loop
           ri->uid =3D cpu_to_je16(from_kuid(&init_user_ns, current_fsuid()=
));
                                                          ^
   include/linux/cred.h:387:27: note: expanded from macro 'current_fsuid'
   #define current_fsuid()         (current_cred_xxx(fsuid))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:594:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:398:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:347:32: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   fs/jffs2/fs.c:447:49: note: Dereference of null pointer
           ri->uid =3D cpu_to_je16(from_kuid(&init_user_ns, current_fsuid()=
));
                                                          ^
   include/linux/cred.h:387:27: note: expanded from macro 'current_fsuid'
   #define current_fsuid()         (current_cred_xxx(fsuid))
                                    ^
   include/linux/cred.h:378:2: note: expanded from macro 'current_cred_xxx'
           current_cred()->xxx;                    \
           ^
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
--
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   crypto/tcrypt.c:1411:5: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(&iv, 0xff, iv_len);
                                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   crypto/tcrypt.c:1411:5: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
                                   memset(&iv, 0xff, iv_len);
                                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 58 warnings (46 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/misc/eeprom/max6875.c:65:26: warning: The result of the left shi=
ft is undefined because the left operand is negative [clang-analyzer-core.U=
ndefinedBinaryOperatorResult]
           buf =3D &data->data[slice << SLICE_BITS];
                                   ^
   drivers/misc/eeprom/max6875.c:116:36: note: Assuming 'slice' is <=3D 'ma=
x_slice'
           for (slice =3D (off >> SLICE_BITS); slice <=3D max_slice; slice+=
+)
                                             ^~~~~~~~~~~~~~~~~~
   drivers/misc/eeprom/max6875.c:116:2: note: Loop condition is true.  Ente=
ring loop body
           for (slice =3D (off >> SLICE_BITS); slice <=3D max_slice; slice+=
+)
           ^
   drivers/misc/eeprom/max6875.c:116:36: note: Assuming 'slice' is <=3D 'ma=
x_slice'
           for (slice =3D (off >> SLICE_BITS); slice <=3D max_slice; slice+=
+)
                                             ^~~~~~~~~~~~~~~~~~
   drivers/misc/eeprom/max6875.c:116:2: note: Loop condition is true.  Ente=
ring loop body
           for (slice =3D (off >> SLICE_BITS); slice <=3D max_slice; slice+=
+)
           ^
   drivers/misc/eeprom/max6875.c:116:56: note: Value assigned to 'slice'
           for (slice =3D (off >> SLICE_BITS); slice <=3D max_slice; slice+=
+)
                                                                 ^~~~~~~
   drivers/misc/eeprom/max6875.c:116:36: note: Assuming 'slice' is <=3D 'ma=
x_slice'
           for (slice =3D (off >> SLICE_BITS); slice <=3D max_slice; slice+=
+)
                                             ^~~~~~~~~~~~~~~~~~
   drivers/misc/eeprom/max6875.c:116:2: note: Loop condition is true.  Ente=
ring loop body
           for (slice =3D (off >> SLICE_BITS); slice <=3D max_slice; slice+=
+)
           ^
   drivers/misc/eeprom/max6875.c:117:32: note: Passing value via 2nd parame=
ter 'slice'
                   max6875_update_slice(client, slice);
                                                ^~~~~
   drivers/misc/eeprom/max6875.c:117:3: note: Calling 'max6875_update_slice'
                   max6875_update_slice(client, slice);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/eeprom/max6875.c:60:6: note: Assuming 'slice' is < USER_EEP=
ROM_SLICES
           if (slice >=3D USER_EEPROM_SLICES)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/eeprom/max6875.c:60:2: note: Taking false branch
           if (slice >=3D USER_EEPROM_SLICES)
           ^
   drivers/misc/eeprom/max6875.c:65:26: note: The result of the left shift =
is undefined because the left operand is negative
           buf =3D &data->data[slice << SLICE_BITS];
                             ~~~~~ ^
   drivers/misc/eeprom/max6875.c:119:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, &data->data[off], count);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/misc/eeprom/max6875.c:119:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, &data->data[off], count);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
>> fs/jffs2/super.c:146:2: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]
           JFFS2_DEBUG("Parent of directory ino #%u is #%u\n",
           ^
   fs/jffs2/debug.h:93:21: note: expanded from macro 'JFFS2_DEBUG'
                  task_pid_nr(current), __func__, ##__VA_ARGS__)
                              ^~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/jffs2/super.c:140:2: note: Taking false branch
           BUG_ON(!d_is_dir(child));
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/jffs2/super.c:140:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!d_is_dir(child));
           ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/jffs2/super.c:146:2: note: Loop condition is false.  Exiting loop
           JFFS2_DEBUG("Parent of directory ino #%u is #%u\n",
           ^
   fs/jffs2/debug.h:92:2: note: expanded from macro 'JFFS2_DEBUG'
           printk(KERN_DEBUG "[JFFS2 DBG] (%d) %s: " fmt,                  \
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
   fs/jffs2/super.c:146:2: note: Dereference of null pointer
           JFFS2_DEBUG("Parent of directory ino #%u is #%u\n",
           ^
   fs/jffs2/debug.h:93:21: note: expanded from macro 'JFFS2_DEBUG'
                  task_pid_nr(current), __func__, ##__VA_ARGS__)
                              ^~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   crypto/adiantum.c:552:6: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/adiantum.c:552:6: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/adiantum.c:556:6: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/adiantum.c:556:6: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   Suppressed 68 warnings (56 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   crypto/nhpoly1305.c:165:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&state->buffer[state->buflen], src, bytes);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   crypto/nhpoly1305.c:165:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(&state->buffer[state->buflen], src, bytes);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
--
                           memcpy(evbuf, (void *) ((addr_t) evbuf + evbuf->=
length),
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/char/sclp.c:932:4: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                           memcpy(evbuf, (void *) ((addr_t) evbuf + evbuf->=
length),
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/char/sclp.c:951:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           clear_page(sccb);
           ^
   arch/s390/include/asm/page.h:51:26: note: expanded from macro 'clear_pag=
e'
   #define clear_page(page)        memset((page), 0, PAGE_SIZE)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/char/sclp.c:951:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           clear_page(sccb);
           ^
   arch/s390/include/asm/page.h:51:26: note: expanded from macro 'clear_pag=
e'
   #define clear_page(page)        memset((page), 0, PAGE_SIZE)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/char/sclp.c:952:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&sclp_init_req, 0, sizeof(struct sclp_req));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/char/sclp.c:952:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(&sclp_init_req, 0, sizeof(struct sclp_req));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/char/sclp.c:1208:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%i\n", sclp_console_pages);
                  ^~~~~~~
   drivers/s390/char/sclp.c:1208:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%i\n", sclp_console_pages);
                  ^~~~~~~
   drivers/s390/char/sclp.c:1215:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%i\n", sclp_console_drop);
                  ^~~~~~~
   drivers/s390/char/sclp.c:1215:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%i\n", sclp_console_drop);
                  ^~~~~~~
   drivers/s390/char/sclp.c:1222:9: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", sclp_console_full);
                  ^~~~~~~
   drivers/s390/char/sclp.c:1222:9: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", sclp_console_full);
                  ^~~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
>> fs/jffs2/debug.c:34:3: warning: Dereference of null pointer [clang-analy=
zer-core.NullDereference]
                   JFFS2_ERROR("eeep, space accounting for block at 0x%08x =
is screwed.\n", jeb->offset);
                   ^
   fs/jffs2/debug.h:81:21: note: expanded from macro 'JFFS2_ERROR'
                  task_pid_nr(current), __func__, ##__VA_ARGS__)
                              ^
   fs/jffs2/debug.c:56:2: note: Calling '__jffs2_dbg_acct_sanity_check_nolo=
ck'
           jffs2_dbg_acct_sanity_check_nolock(c, jeb);
           ^
   fs/jffs2/debug.h:270:2: note: expanded from macro 'jffs2_dbg_acct_sanity=
_check_nolock'
           __jffs2_dbg_acct_sanity_check_nolock(c, jeb)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/debug.c:31:15: note: Assuming 'jeb' is non-null
           if (unlikely(jeb && jeb->used_size + jeb->dirty_size +
                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/jffs2/debug.c:31:15: note: Left side of '&&' is true
           if (unlikely(jeb && jeb->used_size + jeb->dirty_size +
                        ^
   fs/jffs2/debug.c:31:22: note: Assuming the condition is true
           if (unlikely(jeb && jeb->used_size + jeb->dirty_size +
                               ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/jffs2/debug.c:31:15: note: 'jeb' is non-null
           if (unlikely(jeb && jeb->used_size + jeb->dirty_size +
                        ^
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   fs/jffs2/debug.c:31:15: note: Left side of '&&' is true
           if (unlikely(jeb && jeb->used_size + jeb->dirty_size +
                        ^
   fs/jffs2/debug.c:31:2: note: Taking true branch
           if (unlikely(jeb && jeb->used_size + jeb->dirty_size +
           ^
   fs/jffs2/debug.c:34:3: note: Loop condition is false.  Exiting loop
                   JFFS2_ERROR("eeep, space accounting for block at 0x%08x =
is screwed.\n", jeb->offset);
                   ^
   fs/jffs2/debug.h:80:2: note: expanded from macro 'JFFS2_ERROR'
           pr_err("error: (%d) %s: " fmt,                          \
           ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
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
   fs/jffs2/debug.c:34:3: note: Dereference of null pointer
                   JFFS2_ERROR("eeep, space accounting for block at 0x%08x =
is screwed.\n", jeb->offset);
                   ^
   fs/jffs2/debug.h:81:21: note: expanded from macro 'JFFS2_ERROR'
                  task_pid_nr(current), __func__, ##__VA_ARGS__)
                              ^~~~~~~
   include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/jffs2/debug.c:43:3: warning: Dereference of null pointer [clang-analy=
zer-core.NullDereference]
                   JFFS2_ERROR("eeep, space accounting superblock info is s=
crewed.\n");
                   ^
   fs/jffs2/debug.h:81:21: note: expanded from macro 'JFFS2_ERROR'
                  task_pid_nr(current), __func__, ##__VA_ARGS__)
                              ^
   fs/jffs2/debug.c:56:2: note: Calling '__jffs2_dbg_acct_sanity_check_nolo=
ck'
           jffs2_dbg_acct_sanity_check_nolock(c, jeb);
           ^
   fs/jffs2/debug.h:270:2: note: expanded from macro 'jffs2_dbg_acct_sanity=
_check_nolock'
           __jffs2_dbg_acct_sanity_check_nolock(c, jeb)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/debug.c:31:15: note: Assuming 'jeb' is null
           if (unlikely(jeb && jeb->used_size + jeb->dirty_size +
--
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   lib/842/842_compress.c:598:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(p->out, 0, pad);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   lib/842/842_decompress.c:205:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(p->out, &p->ostart[offset], size);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   lib/842/842_decompress.c:205:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(p->out, &p->ostart[offset], size);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   lib/842/842_decompress.c:319:5: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(p.out, p.out - 8, 8);
                                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   lib/842/842_decompress.c:319:5: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(p.out, p.out - 8, 8);
                                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   lib/842/842_decompress.c:332:4: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(p.out, 0, 8);
                           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   lib/842/842_decompress.c:332:4: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                           memset(p.out, 0, 8);
                           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
>> fs/jffs2/nodemgmt.c:174:30: warning: Dereference of null pointer [clang-=
analyzer-core.NullDereference]
                                           DECLARE_WAITQUEUE(wait, current);
                                                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name =3D __WAITQUEUE_INITIALIZER(name, t=
sk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITI=
ALIZER'
           .private        =3D tsk,                                        =
          \
                             ^~~
   fs/jffs2/nodemgmt.c:82:2: note: 0 is < 1
           jffs2_dbg(1, "%s(): Requested 0x%x bytes\n", __func__, minsize);
           ^
   fs/jffs2/debug.h:69:6: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
               ^~~~~~~~~~~~~~~~~~~~~
   ./include/generated/autoconf.h:413:31: note: expanded from macro 'CONFIG=
_JFFS2_FS_DEBUG'
   #define CONFIG_JFFS2_FS_DEBUG 0
                                 ^
   fs/jffs2/nodemgmt.c:82:2: note: Taking false branch
           jffs2_dbg(1, "%s(): Requested 0x%x bytes\n", __func__, minsize);
           ^
   fs/jffs2/debug.h:69:2: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
           ^
   fs/jffs2/nodemgmt.c:82:2: note: Loop condition is false.  Exiting loop
           jffs2_dbg(1, "%s(): Requested 0x%x bytes\n", __func__, minsize);
           ^
   fs/jffs2/debug.h:67:37: note: expanded from macro 'jffs2_dbg'
   #define jffs2_dbg(level, fmt, ...)              \
                                                   ^
   fs/jffs2/nodemgmt.c:85:2: note: 0 is < 1
           jffs2_dbg(1, "%s(): alloc sem got\n", __func__);
           ^
   fs/jffs2/debug.h:69:6: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
               ^~~~~~~~~~~~~~~~~~~~~
   ./include/generated/autoconf.h:413:31: note: expanded from macro 'CONFIG=
_JFFS2_FS_DEBUG'
   #define CONFIG_JFFS2_FS_DEBUG 0
                                 ^
   fs/jffs2/nodemgmt.c:85:2: note: Taking false branch
           jffs2_dbg(1, "%s(): alloc sem got\n", __func__);
           ^
   fs/jffs2/debug.h:69:2: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
           ^
   fs/jffs2/nodemgmt.c:85:2: note: Loop condition is false.  Exiting loop
           jffs2_dbg(1, "%s(): alloc sem got\n", __func__);
           ^
   fs/jffs2/debug.h:67:37: note: expanded from macro 'jffs2_dbg'
   #define jffs2_dbg(level, fmt, ...)              \
                                                   ^
   fs/jffs2/nodemgmt.c:93:6: note: Assuming 'prio' is equal to ALLOC_DELETI=
ON
           if (prio !=3D ALLOC_DELETION && !jffs2_rp_can_write(c)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/nodemgmt.c:93:29: note: Left side of '&&' is false
           if (prio !=3D ALLOC_DELETION && !jffs2_rp_can_write(c)) {
                                      ^
   fs/jffs2/nodemgmt.c:99:2: note: Loop condition is true.  Entering loop b=
ody
           while(ret =3D=3D -EAGAIN) {
           ^
   fs/jffs2/nodemgmt.c:100:9: note: Assuming the condition is true
                   while(c->nr_free_blocks + c->nr_erasing_blocks < blocksn=
eeded) {
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/jffs2/nodemgmt.c:100:3: note: Loop condition is true.  Entering loop =
body
                   while(c->nr_free_blocks + c->nr_erasing_blocks < blocksn=
eeded) {
                   ^
   fs/jffs2/nodemgmt.c:116:8: note: Assuming 'dirty' is >=3D field 'nospc_d=
irty_size'
                           if (dirty < c->nospc_dirty_size) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/nodemgmt.c:116:4: note: Taking false branch
                           if (dirty < c->nospc_dirty_size) {
                           ^
   fs/jffs2/nodemgmt.c:141:9: note: Assuming the condition is false
                           if ( (avail / c->sector_size) <=3D blocksneeded)=
 {
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/nodemgmt.c:141:4: note: Taking false branch
                           if ( (avail / c->sector_size) <=3D blocksneeded)=
 {
                           ^
   fs/jffs2/nodemgmt.c:157:4: note: 0 is < 1
                           jffs2_dbg(1, "Triggering GC pass. nr_free_blocks=
 %d, nr_erasing_blocks %d, free_size 0x%08x, dirty_size 0x%08x, wasted_size=
 0x%08x, used_size 0x%08x, erasing_size 0x%08x, bad_size 0x%08x (total 0x%0=
8x of 0x%08x)\n",
                           ^
   fs/jffs2/debug.h:69:6: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
               ^~~~~~~~~~~~~~~~~~~~~
   ./include/generated/autoconf.h:413:31: note: expanded from macro 'CONFIG=
_JFFS2_FS_DEBUG'
   #define CONFIG_JFFS2_FS_DEBUG 0
                                 ^
   fs/jffs2/nodemgmt.c:157:4: note: Taking false branch
                           jffs2_dbg(1, "Triggering GC pass. nr_free_blocks=
 %d, nr_erasing_blocks %d, free_size 0x%08x, dirty_size 0x%08x, wasted_size=
 0x%08x, used_size 0x%08x, erasing_size 0x%08x, bad_size 0x%08x (total 0x%0=
8x of 0x%08x)\n",
                           ^
   fs/jffs2/debug.h:69:2: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
           ^
   fs/jffs2/nodemgmt.c:157:4: note: Loop condition is false.  Exiting loop
                           jffs2_dbg(1, "Triggering GC pass. nr_free_blocks=
 %d, nr_erasing_blocks %d, free_size 0x%08x, dirty_size 0x%08x, wasted_size=
 0x%08x, used_size 0x%08x, erasing_size 0x%08x, bad_size 0x%08x (total 0x%0=
8x of 0x%08x)\n",
--
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/ethernet/eth.c:242:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(eth->h_dest, neigh->ha, ETH_ALEN);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/ethernet/eth.c:265:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(((u8 *) hh->hh_data) + HH_DATA_OFF(sizeof(struct ethhdr)),
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/ethernet/eth.c:265:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(((u8 *) hh->hh_data) + HH_DATA_OFF(sizeof(struct ethhdr)),
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 118 warnings (106 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   105 warnings generated.
   net/ethtool/strset.c:286:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&data->sets, &info_template, sizeof(data->sets));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/ethtool/strset.c:286:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(&data->sets, &info_template, sizeof(data->sets));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 104 warnings (92 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   104 warnings generated.
   Suppressed 104 warnings (92 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   104 warnings generated.
   Suppressed 104 warnings (92 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   104 warnings generated.
   Suppressed 104 warnings (92 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   104 warnings generated.
   Suppressed 104 warnings (92 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   104 warnings generated.
   Suppressed 104 warnings (92 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   104 warnings generated.
   Suppressed 104 warnings (92 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (46 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   113 warnings generated.
>> drivers/net/team/team_mode_loadbalance.c:213:15: warning: Dereference of=
 null pointer [clang-analyzer-core.NullDereference]
           pcpu_stats =3D this_cpu_ptr(lb_priv->pcpu_stats);
                        ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^
   include/linux/percpu-defs.h:242:2: note: expanded from macro 'raw_cpu_pt=
r'
           arch_raw_cpu_ptr(ptr);                                          \
           ^
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^
   drivers/net/team/team_mode_loadbalance.c:231:24: note: Left side of '||'=
 is false
           select_tx_port_func =3D rcu_dereference_bh(lb_priv->select_tx_po=
rt_func);
                                 ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/net/team/team_mode_loadbalance.c:231:24: note: Left side of '||'=
 is false
           select_tx_port_func =3D rcu_dereference_bh(lb_priv->select_tx_po=
rt_func);
                                 ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/net/team/team_mode_loadbalance.c:231:24: note: Left side of '||'=
 is false
           select_tx_port_func =3D rcu_dereference_bh(lb_priv->select_tx_po=
rt_func);
                                 ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/net/team/team_mode_loadbalance.c:231:24: note: Left side of '||'=
 is true
           select_tx_port_func =3D rcu_dereference_bh(lb_priv->select_tx_po=
rt_func);
                                 ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   drivers/net/team/team_mode_loadbalance.c:231:24: note: Taking false bran=
ch
           select_tx_port_func =3D rcu_dereference_bh(lb_priv->select_tx_po=
rt_func);
--
                             ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:242:2: note: expanded from macro 'raw_cpu_pt=
r'
           arch_raw_cpu_ptr(ptr);                                          \
           ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   kernel/bpf/cpumap.c:782:33: warning: Dereference of null pointer [clang-=
analyzer-core.NullDereference]
           struct list_head *flush_list =3D this_cpu_ptr(&cpu_map_flush_lis=
t);
                                          ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:242:2: note: expanded from macro 'raw_cpu_pt=
r'
           arch_raw_cpu_ptr(ptr);                                          \
           ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   kernel/bpf/cpumap.c:782:33: note: Loop condition is false.  Exiting loop
           struct list_head *flush_list =3D this_cpu_ptr(&cpu_map_flush_lis=
t);
                                          ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/bpf/cpumap.c:782:33: note: Dereference of null pointer
           struct list_head *flush_list =3D this_cpu_ptr(&cpu_map_flush_lis=
t);
                                          ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:242:2: note: expanded from macro 'raw_cpu_pt=
r'
           arch_raw_cpu_ptr(ptr);                                          \
           ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   Suppressed 110 warnings (98 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   94 warnings generated.
   fs/ubifs/debug.c:99:11: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           len -=3D snprintf(p, len, "(%lu, %s)",
                                  ^~~~~~~~
   fs/ubifs/debug.c:99:11: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
                           len -=3D snprintf(p, len, "(%lu, %s)",
                                  ^~~~~~~~
   fs/ubifs/debug.c:105:11: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           len -=3D snprintf(p, len, "(%lu, %s, %#08x)",
                                  ^~~~~~~~
   fs/ubifs/debug.c:105:11: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
                           len -=3D snprintf(p, len, "(%lu, %s, %#08x)",
                                  ^~~~~~~~
   fs/ubifs/debug.c:110:11: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           len -=3D snprintf(p, len, "(%lu, %s, %u)",
                                  ^~~~~~~~
   fs/ubifs/debug.c:110:11: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
                           len -=3D snprintf(p, len, "(%lu, %s, %u)",
                                  ^~~~~~~~
   fs/ubifs/debug.c:115:11: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           len -=3D snprintf(p, len, "(%lu, %s)",
                                  ^~~~~~~~
   fs/ubifs/debug.c:115:11: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
                           len -=3D snprintf(p, len, "(%lu, %s)",
                                  ^~~~~~~~
   fs/ubifs/debug.c:120:11: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           len -=3D snprintf(p, len, "(bad key type: %#08x,=
 %#08x)",
                                  ^~~~~~~~
   fs/ubifs/debug.c:120:11: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
                           len -=3D snprintf(p, len, "(bad key type: %#08x,=
 %#08x)",
                                  ^~~~~~~~
   fs/ubifs/debug.c:124:10: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len -=3D snprintf(p, len, "bad key format %d", c->key_fm=
t);
                          ^~~~~~~~
   fs/ubifs/debug.c:124:10: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
                   len -=3D snprintf(p, len, "bad key format %d", c->key_fm=
t);
                          ^~~~~~~~
>> fs/ubifs/debug.c:604:9: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]
                  current->pid, lst->empty_lebs, lst->idx_lebs);
                  ^
   fs/ubifs/debug.c:1053:6: note: Assuming 'free' is not equal to field 'sa=
ved_free'
           if (free !=3D d->saved_free) {
               ^~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/debug.c:1053:2: note: Taking true branch
           if (free !=3D d->saved_free) {
           ^
   fs/ubifs/debug.c:1056:3: note: Control jumps to line 1062
                   goto out;
                   ^
   fs/ubifs/debug.c:1063:2: note: Calling 'ubifs_dump_lstats'
           ubifs_dump_lstats(&d->saved_lst);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/debug.c:603:2: note: Loop condition is false.  Exiting loop
           pr_err("(pid %d) Lprops statistics: empty_lebs %d, idx_lebs  %d\=
n",
           ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
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
   fs/ubifs/debug.c:604:9: note: Dereference of null pointer
                  current->pid, lst->empty_lebs, lst->idx_lebs);
                  ^
   include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/ubifs/debug.c:623:9: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]
                  current->pid, bi->data_growth + bi->dd_growth,
                  ^
   fs/ubifs/debug.c:2761:6: note: Assuming field 'dentry' is not equal to f=
ield 'dfs_dump_lprops'
           if (file->f_path.dentry =3D=3D d->dfs_dump_lprops) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/debug.c:2761:2: note: Taking false branch
           if (file->f_path.dentry =3D=3D d->dfs_dump_lprops) {
           ^
   fs/ubifs/debug.c:2765:6: note: Assuming field 'dentry' is equal to field=
 'dfs_dump_budg'
           if (file->f_path.dentry =3D=3D d->dfs_dump_budg) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/debug.c:2765:2: note: Taking true branch
           if (file->f_path.dentry =3D=3D d->dfs_dump_budg) {
           ^
   fs/ubifs/debug.c:2766:3: note: Calling 'ubifs_dump_budg'
                   ubifs_dump_budg(c, &c->bi);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/debug.c:622:2: note: Loop condition is false.  Exiting loop
           pr_err("(pid %d) Budgeting info: data budget sum %lld, total bud=
get sum %lld\n",
           ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
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
   fs/ubifs/debug.c:623:9: note: Dereference of null pointer
                  current->pid, bi->data_growth + bi->dd_growth,
                  ^
   include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/ubifs/debug.c:777:52: warning: Dereference of null pointer [clang-ana=
lyzer-core.NullDereference]
           pr_err("(pid %d) start dumping LEB properties\n", current->pid);
--
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/debug.c:2582:3: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(p + from, 0xFF, to - from);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/debug.c:2582:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset(p + from, 0xFF, to - from);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/debug.c:2745:13: warning: The left operand of '=3D=3D' is a gar=
bage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (buf[0] =3D=3D '1')
                      ^
   fs/ubifs/debug.c:2924:8: note: Calling 'interpret_user_input'
           val =3D interpret_user_input(u, count);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/debug.c:2741:13: note: Assuming '__UNIQUE_ID___x266' is < '__UN=
IQUE_ID___y267'
           buf_size =3D min_t(size_t, count, (sizeof(buf) - 1));
                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   fs/ubifs/debug.c:2741:13: note: '?' condition is true
           buf_size =3D min_t(size_t, count, (sizeof(buf) - 1));
                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   fs/ubifs/debug.c:2742:6: note: Calling 'copy_from_user'
           if (copy_from_user(buf, u, buf_size))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:151:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:153:2: note: Returning without writing to '*to'
           return n;
           ^
   fs/ubifs/debug.c:2742:6: note: Returning from 'copy_from_user'
           if (copy_from_user(buf, u, buf_size))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/debug.c:2742:6: note: Assuming the condition is false
           if (copy_from_user(buf, u, buf_size))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/debug.c:2742:2: note: Taking false branch
           if (copy_from_user(buf, u, buf_size))
           ^
   fs/ubifs/debug.c:2745:13: note: The left operand of '=3D=3D' is a garbag=
e value
           if (buf[0] =3D=3D '1')
               ~~~~~~ ^
   fs/ubifs/debug.c:2825:6: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           n =3D snprintf(d->dfs_dir_name, UBIFS_DFS_DIR_LEN + 1, UBIFS_DFS=
_DIR_NAME,
               ^~~~~~~~
   fs/ubifs/debug.c:2825:6: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
           n =3D snprintf(d->dfs_dir_name, UBIFS_DFS_DIR_LEN + 1, UBIFS_DFS=
_DIR_NAME,
               ^~~~~~~~
   Suppressed 75 warnings (63 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
>> drivers/accessibility/speakup/speakup_apollo.c:147:3: warning: Value sto=
red to 'jiffy_delta_val' is never read [clang-analyzer-deadcode.DeadStores]
                   jiffy_delta_val =3D jiffy_delta->u.n.value;
                   ^                 ~~~~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/speakup_apollo.c:147:3: note: Value stored=
 to 'jiffy_delta_val' is never read
                   jiffy_delta_val =3D jiffy_delta->u.n.value;
                   ^                 ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/accessibility/speakup/speakup_apollo.c:148:3: warning: Value sto=
red to 'full_time_val' is never read [clang-analyzer-deadcode.DeadStores]
                   full_time_val =3D full_time->u.n.value;
                   ^               ~~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/speakup_apollo.c:148:3: note: Value stored=
 to 'full_time_val' is never read
                   full_time_val =3D full_time->u.n.value;
                   ^               ~~~~~~~~~~~~~~~~~~~~
>> drivers/accessibility/speakup/speakup_apollo.c:149:3: warning: Value sto=
red to 'delay_time_val' is never read [clang-analyzer-deadcode.DeadStores]
                   delay_time_val =3D delay_time->u.n.value;
                   ^                ~~~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/speakup_apollo.c:149:3: note: Value stored=
 to 'delay_time_val' is never read
                   delay_time_val =3D delay_time->u.n.value;
                   ^                ~~~~~~~~~~~~~~~~~~~~~
>> drivers/accessibility/speakup/speakup_apollo.c:162:3: warning: Dereferen=
ce of null pointer [clang-analyzer-core.NullDereference]
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:210:3: note: expanded from macro 'set_current_stat=
e'
                   debug_normal_state_change((state_value));               \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched.h:138:3: note: expanded from macro 'debug_normal_sta=
te_change'
                   current->task_state_change =3D _THIS_IP_;               =
  \
                   ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/accessibility/speakup/speakup_apollo.c:140:2: note: Loop conditi=
on is false.  Exiting loop
           spin_lock_irqsave(&speakup_info.spinlock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/accessibility/speakup/speakup_apollo.c:140:2: note: Loop conditi=
on is false.  Exiting loop
           spin_lock_irqsave(&speakup_info.spinlock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/accessibility/speakup/speakup_apollo.c:145:9: note: Assuming the=
 condition is true
           while (!kthread_should_stop()) {
                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/speakup_apollo.c:145:2: note: Loop conditi=
on is true.  Entering loop body
           while (!kthread_should_stop()) {
           ^
   drivers/accessibility/speakup/speakup_apollo.c:146:3: note: Loop conditi=
on is false.  Exiting loop
                   spin_lock_irqsave(&speakup_info.spinlock, flags);
                   ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/accessibility/speakup/speakup_apollo.c:146:3: note: Loop conditi=
on is false.  Exiting loop
                   spin_lock_irqsave(&speakup_info.spinlock, flags);
                   ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/accessibility/speakup/speakup_apollo.c:150:7: note: Assuming fie=
ld 'flushing' is 0
                   if (speakup_info.flushing) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/speakup_apollo.c:150:3: note: Taking false=
 branch
                   if (speakup_info.flushing) {
                   ^
   drivers/accessibility/speakup/speakup_apollo.c:157:7: note: Assuming the=
 condition is false
                   if (synth_buffer_empty()) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/speakup_apollo.c:157:3: note: Taking false=
 branch
                   if (synth_buffer_empty()) {
                   ^
   drivers/accessibility/speakup/speakup_apollo.c:162:3: note: Dereference =
of null pointer
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:210:3: note: expanded from macro 'set_current_stat=
e'
                   debug_normal_state_change((state_value));               \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched.h:138:3: note: expanded from macro 'debug_normal_sta=
te_change'
                   current->task_state_change =3D _THIS_IP_;               =
  \
                   ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 58 warnings (46 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   123 warnings generated.
   net/ethtool/tunnels.c:226:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ctx, 0, sizeof(*ctx));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/ethtool/tunnels.c:226:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(ctx, 0, sizeof(*ctx));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
--
                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:13369:22: note: Dereference of null pointer
           perf_event_init_cpu(smp_processor_id());
                               ^
   include/linux/smp.h:264:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_i=
d'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:13392:10: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                   return sprintf(page, "%s\n", pmu_attr->event_str);
                          ^~~~~~~
   kernel/events/core.c:13392:10: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
                   return sprintf(page, "%s\n", pmu_attr->event_str);
                          ^~~~~~~
   Suppressed 114 warnings (102 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
   Suppressed 75 warnings (63 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   87 warnings generated.
   fs/ubifs/journal.c:57:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ino->padding1, 0, 4);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/journal.c:57:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(ino->padding1, 0, 4);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/journal.c:58:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ino->padding2, 0, 26);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/journal.c:58:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(ino->padding2, 0, 26);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/journal.c:78:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(trun->padding, 0, 12);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/journal.c:78:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(trun->padding, 0, 12);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> fs/ubifs/journal.c:380:3: warning: Value stored to 'cmt_retries' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   cmt_retries =3D dbg_check_lprops(c);
                   ^             ~~~~~~~~~~~~~~~~~~~
   fs/ubifs/journal.c:380:3: note: Value stored to 'cmt_retries' is never r=
ead
                   cmt_retries =3D dbg_check_lprops(c);
                   ^             ~~~~~~~~~~~~~~~~~~~
   fs/ubifs/journal.c:479:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ino->data, ui->data, ui->data_len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/journal.c:479:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(ino->data, ui->data, ui->data_len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/journal.c:604:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dent->name, fname_name(nm), fname_len(nm));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/journal.c:604:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(dent->name, fname_name(nm), fname_len(nm));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
>> fs/ubifs/journal.c:604:2: warning: Null pointer passed as 2nd argument t=
o memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(dent->name, fname_name(nm), fname_len(nm));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^                    ~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^
   fs/ubifs/journal.c:543:41: note: Assuming the condition is true
           int aligned_dlen, aligned_ilen, sync =3D IS_DIRSYNC(dir);
                                                  ^
   include/linux/fs.h:2161:28: note: expanded from macro 'IS_DIRSYNC'
   #define IS_DIRSYNC(inode)       (__IS_FLG(inode, SB_SYNCHRONOUS|SB_DIRSY=
NC) || \
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/fs.h:2155:31: note: expanded from macro '__IS_FLG'
   #define __IS_FLG(inode, flg)    ((inode)->i_sb->s_flags & (flg))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/journal.c:543:41: note: Left side of '||' is true
           int aligned_dlen, aligned_ilen, sync =3D IS_DIRSYNC(dir);
                                                  ^
   include/linux/fs.h:2161:71: note: expanded from macro 'IS_DIRSYNC'
   #define IS_DIRSYNC(inode)       (__IS_FLG(inode, SB_SYNCHRONOUS|SB_DIRSY=
NC) || \
                                                                           =
    ^
   fs/ubifs/journal.c:544:26: note: Assuming 'deletion' is not equal to 0
           int last_reference =3D !!(deletion && inode->i_nlink =3D=3D 0);
                                   ^~~~~~~~
   fs/ubifs/journal.c:544:26: note: Left side of '&&' is true
   fs/ubifs/journal.c:544:38: note: Assuming field 'i_nlink' is equal to 0
           int last_reference =3D !!(deletion && inode->i_nlink =3D=3D 0);
                                               ^~~~~~~~~~~~~~~~~~~
   fs/ubifs/journal.c:554:2: note: Assuming the condition is false
           ubifs_assert(c, mutex_is_locked(&host_ui->ui_mutex));
           ^
   fs/ubifs/debug.h:143:15: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
               ~~~~~~~~~^~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/ubifs/journal.c:554:2: note: Assuming the condition is false
           ubifs_assert(c, mutex_is_locked(&host_ui->ui_mutex));
           ^
   fs/ubifs/debug.h:143:15: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
               ~~~~~~~~~^~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   fs/ubifs/journal.c:554:2: note: Taking false branch
           ubifs_assert(c, mutex_is_locked(&host_ui->ui_mutex));
           ^
   fs/ubifs/debug.h:143:2: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
           ^
   fs/ubifs/journal.c:554:2: note: Loop condition is false.  Exiting loop
           ubifs_assert(c, mutex_is_locked(&host_ui->ui_mutex));
           ^
   fs/ubifs/debug.h:142:31: note: expanded from macro 'ubifs_assert'
   #define ubifs_assert(c, expr) do {                                      =
       \
                                 ^
   fs/ubifs/journal.c:565:7: note: 'last_reference' is 1
           if (!last_reference) {
                ^~~~~~~~~~~~~~
   fs/ubifs/journal.c:565:2: note: Taking false branch
           if (!last_reference) {
           ^
   fs/ubifs/journal.c:575:2: note: Taking false branch
           if (ubifs_authenticated(c))
           ^
   fs/ubifs/journal.c:580:9: note: Calling 'kzalloc'
           dent =3D kzalloc(len, GFP_NOFS);
                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:569:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:586:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/journal.c:580:9: note: Returning from 'kzalloc'
           dent =3D kzalloc(len, GFP_NOFS);
                  ^~~~~~~~~~~~~~~~~~~~~~
--
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/exec.c:1655:2: note: Call to function 'memset' is insecure as it does=
 not provide security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'memset_s' in case of C11
           memset(bprm->buf, 0, BINPRM_BUF_SIZE);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/exec.c:1756:12: warning: Dereference of null pointer [clang-analyzer-=
core.NullDereference]
           old_pid =3D current->pid;
                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/exec.c:1756:12: note: Dereference of null pointer
           old_pid =3D current->pid;
                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/exec.c:1882:7: warning: Dereference of null pointer [clang-analyzer-c=
ore.NullDereference]
           if ((current->flags & PF_NPROC_EXCEEDED) &&
                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/exec.c:2090:1: note: Calling '__do_sys_execveat'
   SYSCALL_DEFINE5(execveat,
   ^
   include/linux/syscalls.h:221:36: note: expanded from macro 'SYSCALL_DEFI=
NE5'
   #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/syscall_wrapper.h:157:14: note: expanded from macr=
o '__SYSCALL_DEFINEx'
                   long ret =3D __do_sys##name(SYSCALL_PT_ARGS(x, regs,    =
                  \
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/exec.c:2096:9: note: Calling 'do_execveat'
           return do_execveat(fd,
                  ^~~~~~~~~~~~~~~
   fs/exec.c:2022:9: note: Calling 'do_execveat_common'
           return do_execveat_common(fd, filename, argv, envp, flags);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/exec.c:1873:2: note: Taking false branch
           if (IS_ERR(filename))
           ^
   fs/exec.c:1882:7: note: Dereference of null pointer
           if ((current->flags & PF_NPROC_EXCEEDED) &&
                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/exec.c:2060:25: warning: Dereference of null pointer [clang-analyzer-=
core.NullDereference]
           struct mm_struct *mm =3D current->mm;
                                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/exec.c:2060:25: note: Dereference of null pointer
           struct mm_struct *mm =3D current->mm;
                                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
>> fs/ubifs/misc.c:34:38: warning: Dereference of null pointer [clang-analy=
zer-core.NullDereference]
                  c->vi.ubi_num, c->vi.vol_id, current->pid,
                                               ^
   include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/ubifs/misc.c:33:2: note: Loop condition is false.  Exiting loop
           pr_err("UBIFS error (ubi%d:%d pid %d): %ps: %pV\n",
           ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
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
   fs/ubifs/misc.c:34:38: note: Dereference of null pointer
                  c->vi.ubi_num, c->vi.vol_id, current->pid,
                                               ^
   include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/ubifs/misc.c:53:32: warning: Dereference of null pointer [clang-analy=
zer-core.NullDereference]
                   c->vi.ubi_num, c->vi.vol_id, current->pid,
                                                ^
   include/linux/printk.h:499:37: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                              ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/ubifs/misc.c:52:2: note: Loop condition is false.  Exiting loop
           pr_warn("UBIFS warning (ubi%d:%d pid %d): %ps: %pV\n",
           ^
   include/linux/printk.h:499:2: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
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
   fs/ubifs/misc.c:53:32: note: Dereference of null pointer
                   c->vi.ubi_num, c->vi.vol_id, current->pid,
                                                ^
   include/linux/printk.h:499:37: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                              ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
--
                                   ^~~~~~~~~~~~~~~~
   drivers/virtio/virtio_ring.c:2225:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(vq->split.desc_state, 0, vring.num *
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 58 warnings (46 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   89 warnings generated.
   drivers/net/phy/xilinx_gmii2rgmii.c:113:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&priv->conv_phy_drv, priv->phy_dev->drv,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/net/phy/xilinx_gmii2rgmii.c:113:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&priv->conv_phy_drv, priv->phy_dev->drv,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 88 warnings (76 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   88 warnings generated.
   Suppressed 88 warnings (76 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   78 warnings generated.
   fs/ubifs/tnc.c:393:3: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(node, zbr->leaf, zbr->len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/tnc.c:393:3: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
                   memcpy(node, zbr->leaf, zbr->len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/tnc.c:1671:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf + rlen, wbuf->buf + offs + rlen - wbuf->offs, len - r=
len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/tnc.c:1671:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(buf + rlen, wbuf->buf + offs + rlen - wbuf->offs, len - r=
len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
>> fs/ubifs/tnc.c:2798:4: warning: Value stored to 'key' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                           key =3D from_key;
                           ^     ~~~~~~~~
   fs/ubifs/tnc.c:2798:4: note: Value stored to 'key' is never read
                           key =3D from_key;
                           ^     ~~~~~~~~
   Suppressed 75 warnings (63 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   drivers/input/misc/da7280.c:565:3: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(haptics->snp_mem, 0, DA7280_SNP_MEM_SIZE);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/input/misc/da7280.c:565:3: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                   memset(haptics->snp_mem, 0, DA7280_SNP_MEM_SIZE);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/input/misc/da7280.c:887:3: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(haptics->snp_mem, 0, DA7280_SNP_MEM_SIZE);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/input/misc/da7280.c:887:3: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                   memset(haptics->snp_mem, 0, DA7280_SNP_MEM_SIZE);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 68 warnings (56 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   124 warnings generated.
   arch/s390/include/asm/preempt.h:17:9: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   kernel/trace/trace.c:8435:2: note: Calling 'tracing_snapshot_instance'
           tracing_snapshot_instance(tr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:1132:2: note: Calling 'tracing_snapshot_instance_co=
nd'
           tracing_snapshot_instance_cond(tr, NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:1105:6: note: Calling 'preempt_count'
           if (in_nmi()) {
               ^
   include/linux/preempt.h:118:20: note: expanded from macro 'in_nmi'
   #define in_nmi()                (nmi_count())
                                    ^~~~~~~~~~~
   include/linux/preempt.h:101:22: note: expanded from macro 'nmi_count'
   #define nmi_count()     (preempt_count() & NMI_MASK)
                            ^~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
--
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/jffs2/wbuf.c:382:4: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                           memcpy(buf + (c->wbuf_ofs - start), c->wbuf, end=
 - c->wbuf_ofs);
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/jffs2/wbuf.c:446:3: warning: Call to function 'memmove' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(c->wbuf, rewrite_buf + towrite, c->wbuf_len);
                   ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   fs/jffs2/wbuf.c:446:3: note: Call to function 'memmove' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memmove_s' in case of C11
                   memmove(c->wbuf, rewrite_buf + towrite, c->wbuf_len);
                   ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   fs/jffs2/wbuf.c:451:4: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(c->wbuf, buf, end-start);
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/jffs2/wbuf.c:451:4: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                           memcpy(c->wbuf, buf, end-start);
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/jffs2/wbuf.c:453:4: warning: Call to function 'memmove' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(c->wbuf, c->wbuf + (start - c->wbuf_ofs)=
, end - start);
                           ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   fs/jffs2/wbuf.c:453:4: note: Call to function 'memmove' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memmove_s' in case of C11
                           memmove(c->wbuf, c->wbuf + (start - c->wbuf_ofs)=
, end - start);
                           ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
>> fs/jffs2/wbuf.c:508:6: warning: Dereference of null pointer [clang-analy=
zer-core.NullDereference]
                                           JFFS2_ERROR("Failed to iget() in=
o #%u, err %ld\n",
                                           ^
   fs/jffs2/debug.h:81:21: note: expanded from macro 'JFFS2_ERROR'
                  task_pid_nr(current), __func__, ##__VA_ARGS__)
                              ^~~~~~~
   include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/jffs2/wbuf.c:288:6: note: Assuming the condition is false
           if (c->wbuf_ofs % c->mtd->erasesize)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/wbuf.c:288:2: note: Taking false branch
           if (c->wbuf_ofs % c->mtd->erasesize)
           ^
   fs/jffs2/wbuf.c:294:10: note: Assuming the condition is true
           BUG_ON(!ref_obsolete(jeb->last_node));
                   ^
   fs/jffs2/nodelist.h:138:28: note: expanded from macro 'ref_obsolete'
   #define ref_obsolete(ref)       (((ref)->flash_offset & 3) =3D=3D REF_OB=
SOLETE)
                                    ^
   include/asm-generic/bug.h:161:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/jffs2/wbuf.c:294:2: note: Taking false branch
           BUG_ON(!ref_obsolete(jeb->last_node));
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/jffs2/wbuf.c:294:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!ref_obsolete(jeb->last_node));
           ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/jffs2/wbuf.c:298:2: note: Loop condition is true.  Entering loop body
           for (next =3D raw =3D jeb->first_node; next; raw =3D next) {
           ^
   fs/jffs2/wbuf.c:299:10: note: Calling 'ref_next'
                   next =3D ref_next(raw);
                          ^~~~~~~~~~~~~
   fs/jffs2/nodelist.h:106:6: note: Assuming the condition is false
           if (ref->flash_offset =3D=3D REF_LINK_NODE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/nodelist.h:106:2: note: Taking false branch
           if (ref->flash_offset =3D=3D REF_LINK_NODE) {
           ^
   fs/jffs2/nodelist.h:113:6: note: Assuming the condition is false
           if (ref->flash_offset =3D=3D REF_EMPTY_NODE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/nodelist.h:113:2: note: Taking false branch
           if (ref->flash_offset =3D=3D REF_EMPTY_NODE)
           ^
   fs/jffs2/nodelist.h:116:2: note: Returning pointer (loaded from 'ref'), =
which participates in a condition later
           return ref;
           ^~~~~~~~~~
   fs/jffs2/wbuf.c:299:10: note: Returning from 'ref_next'
                   next =3D ref_next(raw);
                          ^~~~~~~~~~~~~
   fs/jffs2/wbuf.c:301:7: note: Assuming the condition is false
                   if (ref_obsolete(raw) || =

                       ^
   fs/jffs2/nodelist.h:138:28: note: expanded from macro 'ref_obsolete'
   #define ref_obsolete(ref)       (((ref)->flash_offset & 3) =3D=3D REF_OB=
SOLETE)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/jffs2/wbuf.c:301:7: note: Left side of '||' is false
                   if (ref_obsolete(raw) || =

                       ^
   fs/jffs2/nodelist.h:138:27: note: expanded from macro 'ref_obsolete'
   #define ref_obsolete(ref)       (((ref)->flash_offset & 3) =3D=3D REF_OB=
SOLETE)
                                   ^
   fs/jffs2/wbuf.c:302:8: note: 'next' is non-null
                       (next && ref_offset(next) <=3D c->wbuf_ofs)) {
                        ^~~~
   fs/jffs2/wbuf.c:302:8: note: Left side of '&&' is true
   fs/jffs2/wbuf.c:302:16: note: Assuming the condition is false
                       (next && ref_offset(next) <=3D c->wbuf_ofs)) {
                                ^
   fs/jffs2/nodelist.h:137:26: note: expanded from macro 'ref_offset'
   #define ref_offset(ref)         ((ref)->flash_offset & ~3)
                                   ^
   fs/jffs2/wbuf.c:301:3: note: Taking false branch
--
   fs/ubifs/tnc_commit.c:784:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(zroot, &c->zroot, sizeof(struct ubifs_zbranch));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/tnc_commit.c:784:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(zroot, &c->zroot, sizeof(struct ubifs_zbranch));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/tnc_commit.c:1008:4: warning: Call to function 'memmove' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(c->cbuf, c->cbuf + blen, used);
                           ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   fs/ubifs/tnc_commit.c:1008:4: note: Call to function 'memmove' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memmove_s' in case of C11
                           memmove(c->cbuf, c->cbuf + blen, used);
                           ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   Suppressed 75 warnings (63 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   drivers/staging/iio/impedance-analyzer/ad5933.c:288:9: warning: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (int)freqreg);
                  ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:288:9: note: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (int)freqreg);
                  ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:340:9: warning: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D sprintf(buf, "%u\n",
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:340:9: note: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   len =3D sprintf(buf, "%u\n",
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:344:9: warning: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D sprintf(buf, "%u %u %u %u\n", st->range_avail[0],
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:344:9: note: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   len =3D sprintf(buf, "%u %u %u %u\n", st->range_avail[0],
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:349:9: warning: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D sprintf(buf, "%d\n", st->settling_cycles);
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:349:9: note: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   len =3D sprintf(buf, "%d\n", st->settling_cycles);
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:352:9: warning: Call to =
function 'sprintf' is insecure as it does not provide bounding of the memor=
y buffer or security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.De=
precatedOrUnsafeBufferHandling]
                   len =3D sprintf(buf, "%s\n",
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:352:9: note: Call to fun=
ction 'sprintf' is insecure as it does not provide bounding of the memory b=
uffer or security checks introduced in the C11 standard. Replace with analo=
gous functions that support length arguments or provides boundary checks su=
ch as 'sprintf_s' in case of C11
                   len =3D sprintf(buf, "%s\n",
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:357:9: warning: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D sprintf(buf, "1 0.2\n");
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:357:9: note: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   len =3D sprintf(buf, "1 0.2\n");
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:360:9: warning: Call to =
function 'sprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len =3D sprintf(buf, "%d\n", st->freq_points);
                         ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:360:9: note: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   len =3D sprintf(buf, "%d\n", st->freq_points);
                         ^~~~~~~
>> drivers/staging/iio/impedance-analyzer/ad5933.c:641:11: warning: Assigne=
d value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                           val[0] =3D be16_to_cpu(buf[0]);
                                  ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:615:6: note: Assuming th=
e condition is false
           if (st->state =3D=3D AD5933_CTRL_INIT_START_FREQ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:615:2: note: Taking fals=
e branch
           if (st->state =3D=3D AD5933_CTRL_INIT_START_FREQ) {
           ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:623:8: note: Calling 'ad=
5933_i2c_read'
           ret =3D ad5933_i2c_read(st->client, AD5933_REG_STATUS, 1, &statu=
s);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:144:2: note: Loop condit=
ion is true.  Entering loop body
           while (len--) {
           ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:146:7: note: Assuming 'r=
et' is >=3D 0
                   if (ret < 0) {
                       ^~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:146:3: note: Taking fals=
e branch
                   if (ret < 0) {
                   ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:144:2: note: Loop condit=
ion is false. Execution continues on line 152
           while (len--) {
           ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:152:2: note: Returning z=
ero, which participates in a condition later
           return 0;
           ^~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:623:8: note: Returning f=
rom 'ad5933_i2c_read'
           ret =3D ad5933_i2c_read(st->client, AD5933_REG_STATUS, 1, &statu=
s);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:624:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:624:2: note: Taking fals=
e branch
           if (ret)
           ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:627:6: note: Assuming th=
e condition is true
           if (status & AD5933_STAT_DATA_VALID) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:627:2: note: Taking true=
 branch
           if (status & AD5933_STAT_DATA_VALID) {
           ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:631:5: note: Assuming th=
e condition is false
                                   test_bit(1, indio_dev->active_scan_mask)=
 ?
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:631:5: note: '?' conditi=
on is false
   drivers/staging/iio/impedance-analyzer/ad5933.c:630:9: note: Calling 'ad=
5933_i2c_read'
                   ret =3D ad5933_i2c_read(st->client,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:144:2: note: Loop condit=
ion is false. Execution continues on line 152
           while (len--) {
           ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:152:2: note: Returning z=
ero, which participates in a condition later
           return 0;
           ^~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:630:9: note: Returning f=
rom 'ad5933_i2c_read'
                   ret =3D ad5933_i2c_read(st->client,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:634:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:634:3: note: Taking fals=
e branch
                   if (ret)
                   ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:637:7: note: Assuming 's=
can_count' is not equal to 2
                   if (scan_count =3D=3D 2) {
                       ^~~~~~~~~~~~~~~
   drivers/staging/iio/impedance-analyzer/ad5933.c:637:3: note: Taking fals=
e branch
                   if (scan_count =3D=3D 2) {
                   ^
   drivers/staging/iio/impedance-analyzer/ad5933.c:641:11: note: Assigned v=
alue is garbage or undefined
                           val[0] =3D be16_to_cpu(buf[0]);
                                  ^
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   146 warnings generated.
   include/linux/sched/mm.h:332:23: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
           unsigned int flags =3D current->flags & PF_MEMALLOC;
                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   net/core/sock.c:325:9: note: Assuming the condition is false
           BUG_ON(!sock_flag(sk, SOCK_MEMALLOC));
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
   net/core/sock.c:325:9: note: Assuming the condition is false
           BUG_ON(!sock_flag(sk, SOCK_MEMALLOC));
                  ^
   include/asm-generic/bug.h:161:45: note: expanded from macro 'BUG_ON'
--
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/input/mouse/cyapa_gen3.c:997:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&cyapa->product_id[13], &query_data[11], 2);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   lib/lz4/lz4_compress.c:449:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   LZ4_memcpy(op, anchor, lastRun);
                   ^
   lib/lz4/lz4defs.h:150:36: note: expanded from macro 'LZ4_memcpy'
   #define LZ4_memcpy(dst, src, size) __builtin_memcpy(dst, src, size)
                                      ^~~~~~~~~~~~~~~~
   lib/lz4/lz4_compress.c:449:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   LZ4_memcpy(op, anchor, lastRun);
                   ^
   lib/lz4/lz4defs.h:150:36: note: expanded from macro 'LZ4_memcpy'
   #define LZ4_memcpy(dst, src, size) __builtin_memcpy(dst, src, size)
                                      ^~~~~~~~~~~~~~~~
   lib/lz4/lz4_compress.c:711:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   LZ4_memcpy(op, anchor, lastRunSize);
                   ^
   lib/lz4/lz4defs.h:150:36: note: expanded from macro 'LZ4_memcpy'
   #define LZ4_memcpy(dst, src, size) __builtin_memcpy(dst, src, size)
                                      ^~~~~~~~~~~~~~~~
   lib/lz4/lz4_compress.c:711:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   LZ4_memcpy(op, anchor, lastRunSize);
                   ^
   lib/lz4/lz4defs.h:150:36: note: expanded from macro 'LZ4_memcpy'
   #define LZ4_memcpy(dst, src, size) __builtin_memcpy(dst, src, size)
                                      ^~~~~~~~~~~~~~~~
   lib/lz4/lz4_compress.c:772:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(LZ4_stream, 0, sizeof(LZ4_stream_t));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   lib/lz4/lz4_compress.c:772:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(LZ4_stream, 0, sizeof(LZ4_stream_t));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   lib/lz4/lz4_compress.c:848:2: warning: Call to function 'memmove' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(safeBuffer, previousDictEnd - dictSize, dictSize);
           ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   lib/lz4/lz4_compress.c:848:2: note: Call to function 'memmove' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memmove_s' in case of C11
           memmove(safeBuffer, previousDictEnd - dictSize, dictSize);
           ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   98 warnings generated.
>> fs/jffs2/readinode.c:69:3: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
                   JFFS2_WARNING("MTD point returned len too short: %zu ins=
tead of %u.\n", retlen, tn->csize);
                   ^
   fs/jffs2/debug.h:85:15: note: expanded from macro 'JFFS2_WARNING'
                   task_pid_nr(current), __func__, ##__VA_ARGS__)
                               ^
   fs/jffs2/readinode.c:1398:6: note: Assuming 'f' is non-null
           if (!f)
               ^~
   fs/jffs2/readinode.c:1398:2: note: Taking false branch
           if (!f)
           ^
   fs/jffs2/readinode.c:1401:2: note: Loop condition is false.  Exiting loop
           mutex_init(&f->sem);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   fs/jffs2/readinode.c:1405:8: note: Calling 'jffs2_do_read_inode_internal'
           ret =3D jffs2_do_read_inode_internal(c, f, &n);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/readinode.c:1154:2: note: Taking false branch
           dbg_readinode("ino #%u pino/nlink is %d\n", f->inocache->ino,
           ^
   fs/jffs2/debug.h:103:33: note: expanded from macro 'dbg_readinode'
   #define dbg_readinode(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/jffs2/readinode.c:1162:6: note: 'ret' is 0
           if (ret) {
               ^~~
   fs/jffs2/readinode.c:1162:2: note: Taking false branch
           if (ret) {
           ^
   fs/jffs2/readinode.c:1169:8: note: Calling 'jffs2_build_inode_fragtree'
           ret =3D jffs2_build_inode_fragtree(c, f, &rii);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/readinode.c:459:11: note: Field 'mdata_tn' is null
           if (rii->mdata_tn) {
                    ^
   fs/jffs2/readinode.c:459:2: note: Taking false branch
           if (rii->mdata_tn) {
           ^
   fs/jffs2/readinode.c:473:2: note: Loop condition is true.  Entering loop=
 body
           while ((last =3D pen)) {
           ^
   fs/jffs2/readinode.c:479:7: note: Assuming field 'overlapped' is 0
                   if (unlikely(last->overlapped)) {
                       ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   fs/jffs2/readinode.c:479:3: note: Taking false branch
                   if (unlikely(last->overlapped)) {
                   ^
   fs/jffs2/readinode.c:495:3: note: Loop condition is true.  Entering loop=
 body
                   while (this) {
                   ^
   fs/jffs2/readinode.c:500:8: note: Calling 'check_tn_node'
                           if (check_tn_node(c, this)) {
                               ^~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/readinode.c:154:9: note: Assuming the condition is false
           BUG_ON(ref_obsolete(tn->fn->raw));
                  ^
   fs/jffs2/nodelist.h:138:28: note: expanded from macro 'ref_obsolete'
   #define ref_obsolete(ref)       (((ref)->flash_offset & 3) =3D=3D REF_OB=
SOLETE)
                                    ^
   include/asm-generic/bug.h:161:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/jffs2/readinode.c:154:2: note: Taking false branch
           BUG_ON(ref_obsolete(tn->fn->raw));
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/jffs2/readinode.c:154:2: note: Loop condition is false.  Exiting loop
           BUG_ON(ref_obsolete(tn->fn->raw));
           ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/jffs2/readinode.c:157:6: note: Assuming the condition is false
           if (ref_flags(tn->fn->raw) !=3D REF_UNCHECKED)
               ^
   fs/jffs2/nodelist.h:136:25: note: expanded from macro 'ref_flags'
   #define ref_flags(ref)          ((ref)->flash_offset & 3)
                                   ^
   fs/jffs2/readinode.c:157:2: note: Taking false branch
           if (ref_flags(tn->fn->raw) !=3D REF_UNCHECKED)
--
   include/linux/compiler_types.h:324:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   kernel/events/ring_buffer.c:512:2: note: Loop condition is false.  Exiti=
ng loop
           WRITE_ONCE(rb->user_page->aux_head, rb->aux_head);
           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^
   include/asm-generic/rwonce.h:53:35: note: expanded from macro '__WRITE_O=
NCE'
   #define __WRITE_ONCE(x, val)                                            \
                                                                           ^
   kernel/events/ring_buffer.c:512:2: note: Loop condition is false.  Exiti=
ng loop
           WRITE_ONCE(rb->user_page->aux_head, rb->aux_head);
           ^
   include/asm-generic/rwonce.h:58:33: note: expanded from macro 'WRITE_ONC=
E'
   #define WRITE_ONCE(x, val)                                              \
                                                                           ^
   kernel/events/ring_buffer.c:513:2: note: Taking false branch
           if (rb_need_aux_wakeup(rb))
           ^
   kernel/events/ring_buffer.c:516:6: note: 'wakeup' is true
           if (wakeup) {
               ^~~~~~
   kernel/events/ring_buffer.c:516:2: note: Taking true branch
           if (wakeup) {
           ^
   kernel/events/ring_buffer.c:517:7: note: Assuming the condition is true
                   if (handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/ring_buffer.c:517:3: note: Taking true branch
                   if (handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)
                   ^
   kernel/events/ring_buffer.c:518:37: note: Dereference of null pointer
                           handle->event->pending_disable =3D smp_processor=
_id();
                                                            ^
   include/linux/smp.h:264:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_i=
d'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   78 warnings generated.
   fs/ubifs/compress.c:136:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(out_buf, in_buf, in_len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/compress.c:136:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(out_buf, in_buf, in_len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/compress.c:172:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(out_buf, in_buf, in_len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/compress.c:172:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(out_buf, in_buf, in_len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
>> fs/ubifs/compress.c:203:11: warning: Dereference of null pointer [clang-=
analyzer-core.NullDereference]
                                  current->pid, compr->name, PTR_ERR(compr-=
>cc));
                                  ^
   fs/ubifs/compress.c:233:8: note: Calling 'compr_init'
           err =3D compr_init(&lzo_compr);
                 ^~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/compress.c:199:6: note: Assuming field 'capi_name' is non-null
           if (compr->capi_name) {
               ^~~~~~~~~~~~~~~~
   fs/ubifs/compress.c:199:2: note: Taking true branch
           if (compr->capi_name) {
           ^
   fs/ubifs/compress.c:201:3: note: Taking true branch
                   if (IS_ERR(compr->cc)) {
                   ^
   fs/ubifs/compress.c:202:4: note: Loop condition is false.  Exiting loop
                           pr_err("UBIFS error (pid %d): cannot initialize =
compressor %s, error %ld",
                           ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
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
   fs/ubifs/compress.c:203:11: note: Dereference of null pointer
                                  current->pid, compr->name, PTR_ERR(compr-=
>cc));
                                  ^
   include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 75 warnings (63 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   76 warnings generated.
   fs/ubifs/master.c:107:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(c->mst_node, snod->node, snod->len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/master.c:107:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(c->mst_node, snod->node, snod->len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 75 warnings (63 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/leds/trigger/ledtrig-transient.c:48:9: warning: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", transient_data->activate);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-transient.c:48:9: note: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", transient_data->activate);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-transient.c:100:9: warning: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", transient_data->duration);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-transient.c:100:9: note: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", transient_data->duration);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-transient.c:127:9: warning: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", state);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-transient.c:127:9: note: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", state);
                  ^~~~~~~
--
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/super.c:180:4: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                           memcpy(ui->data, ino->data, ui->data_len);
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/super.c:206:3: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ui->data, ino->data, ui->data_len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/super.c:206:3: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                   memcpy(ui->data, ino->data, ui->data_len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/super.c:230:3: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ui->data, ino->data, ui->data_len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/super.c:230:3: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                   memcpy(ui->data, ino->data, ui->data_len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/super.c:275:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset((void *)ui + sizeof(struct inode), 0,
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/super.c:275:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset((void *)ui + sizeof(struct inode), 0,
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/super.c:1371:2: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(c->bgt_name, BGT_NAME_PATTERN, c->vi.ubi_num, c->vi.vol_=
id);
           ^~~~~~~
   fs/ubifs/super.c:1371:2: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           sprintf(c->bgt_name, BGT_NAME_PATTERN, c->vi.ubi_num, c->vi.vol_=
id);
           ^~~~~~~
>> fs/ubifs/super.c:2450:10: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
                          current->pid, err);
                          ^
   include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/ubifs/super.c:2369:2: note: Taking false branch
           BUILD_BUG_ON(sizeof(struct ubifs_ch) !=3D 24);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:332:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/ubifs/super.c:2369:2: note: Loop condition is false.  Exiting loop
           BUILD_BUG_ON(sizeof(struct ubifs_ch) !=3D 24);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:324:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/ubifs/super.c:2372:2: note: Taking false branch
           BUILD_BUG_ON(UBIFS_CH_SZ        & 7);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:332:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/ubifs/super.c:2372:2: note: Loop condition is false.  Exiting loop
           BUILD_BUG_ON(UBIFS_CH_SZ        & 7);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:324:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/ubifs/super.c:2373:2: note: Taking false branch
           BUILD_BUG_ON(UBIFS_INO_NODE_SZ  & 7);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
--
   drivers/net/team/team.c:54:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr.__data, dev_addr, port_dev->addr_len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/net/team/team.c:54:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(addr.__data, dev_addr, port_dev->addr_len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/net/team/team.c:560:3: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&team->ops, 0, sizeof(struct team_mode_ops));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/team/team.c:560:3: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                   memset(&team->ops, 0, sizeof(struct team_mode_ops));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/team/team.c:568:3: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&team->mode_priv, 0,
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/team/team.c:568:3: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                   memset(&team->mode_priv, 0,
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/team/team.c:584:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&team->ops, new_mode->ops, sizeof(struct team_mode_ops));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/net/team/team.c:584:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(&team->ops, new_mode->ops, sizeof(struct team_mode_ops));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
>> drivers/net/team/team.c:750:16: warning: Dereference of null pointer [cl=
ang-analyzer-core.NullDereference]
                   pcpu_stats =3D this_cpu_ptr(team->pcpu_stats);
                                ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:242:2: note: expanded from macro 'raw_cpu_pt=
r'
           arch_raw_cpu_ptr(ptr);                                          \
           ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   drivers/net/team/team.c:728:8: note: Calling 'skb_share_check'
           skb =3D skb_share_check(skb, GFP_ATOMIC);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:1962:2: note: Taking false branch
           might_sleep_if(gfpflags_allow_blocking(pri));
           ^
   include/linux/kernel.h:193:35: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                     ^
   include/linux/skbuff.h:1962:2: note: Loop condition is false.  Exiting l=
oop
           might_sleep_if(gfpflags_allow_blocking(pri));
           ^
   include/linux/kernel.h:193:30: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                ^
   include/linux/skbuff.h:1963:6: note: Assuming the condition is false
           if (skb_shared(skb)) {
               ^~~~~~~~~~~~~~~
   include/linux/skbuff.h:1963:2: note: Taking false branch
           if (skb_shared(skb)) {
           ^
   include/linux/skbuff.h:1972:2: note: Returning pointer (loaded from 'skb=
'), which participates in a condition later
           return skb;
           ^~~~~~~~~~
   drivers/net/team/team.c:728:8: note: Returning from 'skb_share_check'
           skb =3D skb_share_check(skb, GFP_ATOMIC);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/team/team.c:729:6: note: Assuming 'skb' is non-null
           if (!skb)
               ^~~~
   drivers/net/team/team.c:729:2: note: Taking false branch
           if (!skb)
           ^
   drivers/net/team/team.c:736:2: note: Taking false branch
           if (!team_port_enabled(port)) {
           ^
   drivers/net/team/team.c:747:6: note: Assuming 'res' is equal to RX_HANDL=
ER_ANOTHER
           if (res =3D=3D RX_HANDLER_ANOTHER) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/team/team.c:747:2: note: Taking true branch
           if (res =3D=3D RX_HANDLER_ANOTHER) {
           ^
   drivers/net/team/team.c:750:16: note: Loop condition is false.  Exiting =
loop
                   pcpu_stats =3D this_cpu_ptr(team->pcpu_stats);
                                ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   drivers/net/team/team.c:750:16: note: Dereference of null pointer
                   pcpu_stats =3D this_cpu_ptr(team->pcpu_stats);
                                ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:242:2: note: expanded from macro 'raw_cpu_pt=
r'
           arch_raw_cpu_ptr(ptr);                                          \
           ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   drivers/net/team/team.c:760:3: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
                   this_cpu_inc(team->pcpu_stats->rx_nohandler);
                   ^
   include/linux/percpu-defs.h:520:28: note: expanded from macro 'this_cpu_=
inc'
   #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
                                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   include/linux/percpu-defs.h:379:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
--
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/packet/af_packet.c:4034:3: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&po->stats, 0, sizeof(po->stats));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/packet/af_packet.c:4034:3: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                   memset(&po->stats, 0, sizeof(po->stats));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 128 warnings (116 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   drivers/leds/leds-blinkm.c:545:18: warning: The left operand of '=3D=3D'=
 is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (tmpargs[0] =3D=3D 0x09)
                       ~~~~~~~~~~ ^
   drivers/leds/leds-blinkm.c:527:2: note: Taking false branch
           if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA
           ^
   drivers/leds/leds-blinkm.c:536:2: note: Loop condition is true.  Enterin=
g loop body
           while (count > 0) {
           ^
   drivers/leds/leds-blinkm.c:538:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   drivers/leds/leds-blinkm.c:538:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/leds/leds-blinkm.c:541:9: note: Calling 'blinkm_read'
                   ret =3D blinkm_read(client, BLM_GET_ADDR, tmpargs);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:320:14: note: Assuming 'i' is >=3D 'retlen'
           for (i =3D 0; i < retlen; i++) {
                       ^~~~~~~~~~
   drivers/leds/leds-blinkm.c:320:2: note: Loop condition is false. Executi=
on continues on line 328
           for (i =3D 0; i < retlen; i++) {
           ^
   drivers/leds/leds-blinkm.c:328:2: note: Returning without writing to '*a=
rg'
           return 0;
           ^
   drivers/leds/leds-blinkm.c:328:2: note: Returning zero, which participat=
es in a condition later
           return 0;
           ^~~~~~~~
   drivers/leds/leds-blinkm.c:541:9: note: Returning from 'blinkm_read'
                   ret =3D blinkm_read(client, BLM_GET_ADDR, tmpargs);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-blinkm.c:542:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   drivers/leds/leds-blinkm.c:542:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/leds/leds-blinkm.c:545:18: note: The left operand of '=3D=3D' is=
 a garbage value
                   if (tmpargs[0] =3D=3D 0x09)
                       ~~~~~~~~~~ ^
   drivers/leds/leds-blinkm.c:610:4: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(blinkm_led_name, sizeof(blinkm_led_name=
),
                           ^~~~~~~~
   drivers/leds/leds-blinkm.c:610:4: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                           snprintf(blinkm_led_name, sizeof(blinkm_led_name=
),
                           ^~~~~~~~
   drivers/leds/leds-blinkm.c:627:4: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(blinkm_led_name, sizeof(blinkm_led_name=
),
                           ^~~~~~~~
   drivers/leds/leds-blinkm.c:627:4: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                           snprintf(blinkm_led_name, sizeof(blinkm_led_name=
),
                           ^~~~~~~~
   drivers/leds/leds-blinkm.c:644:4: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(blinkm_led_name, sizeof(blinkm_led_name=
),
                           ^~~~~~~~
   drivers/leds/leds-blinkm.c:644:4: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                           snprintf(blinkm_led_name, sizeof(blinkm_led_name=
),
                           ^~~~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   76 warnings generated.
>> fs/jffs2/xattr.c:128:2: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]
           JFFS2_NOTICE("xdatum_mem_usage from %u byte to %u byte (%u byte =
reclaimed)\n",
           ^
   fs/jffs2/debug.h:89:17: note: expanded from macro 'JFFS2_NOTICE'
                     task_pid_nr(current), __func__, ##__VA_ARGS__)
                                 ^
   fs/jffs2/xattr.c:1226:6: note: Assuming 'raw' is equal to field 'node'
           if (xd->node !=3D raw)
               ^~~~~~~~~~~~~~~
   fs/jffs2/xattr.c:1226:2: note: Taking false branch
           if (xd->node !=3D raw)
           ^
   fs/jffs2/xattr.c:1228:6: note: Assuming the condition is false
           if (xd->flags & (JFFS2_XFLAGS_DEAD|JFFS2_XFLAGS_INVALID))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/xattr.c:1228:2: note: Taking false branch
           if (xd->flags & (JFFS2_XFLAGS_DEAD|JFFS2_XFLAGS_INVALID))
           ^
   fs/jffs2/xattr.c:1231:7: note: Calling 'load_xattr_datum'
           rc =3D load_xattr_datum(c, xd);
                ^~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/xattr.c:272:2: note: Assuming the condition is true
           BUG_ON(xd->flags & JFFS2_XFLAGS_DEAD);
           ^
   include/asm-generic/bug.h:161:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   fs/jffs2/xattr.c:272:2: note: Taking false branch
           BUG_ON(xd->flags & JFFS2_XFLAGS_DEAD);
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/jffs2/xattr.c:272:2: note: Loop condition is false.  Exiting loop
           BUG_ON(xd->flags & JFFS2_XFLAGS_DEAD);
           ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/jffs2/xattr.c:273:6: note: Assuming field 'xname' is null
           if (xd->xname)
               ^~~~~~~~~
   fs/jffs2/xattr.c:273:2: note: Taking false branch
           if (xd->xname)
           ^
   fs/jffs2/xattr.c:275:6: note: Assuming the condition is false
           if (xd->flags & JFFS2_XFLAGS_INVALID)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/xattr.c:275:2: note: Taking false branch
           if (xd->flags & JFFS2_XFLAGS_INVALID)
           ^
   fs/jffs2/xattr.c:277:6: note: Assuming the condition is true
           if (unlikely(is_xattr_datum_unchecked(c, xd)))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   fs/jffs2/xattr.c:277:2: note: Taking false branch
           if (unlikely(is_xattr_datum_unchecked(c, xd)))
           ^
   fs/jffs2/xattr.c:279:7: note: 'rc' is 0
           if (!rc)
                ^~
   fs/jffs2/xattr.c:279:2: note: Taking true branch
           if (!rc)
           ^
   fs/jffs2/xattr.c:280:8: note: Calling 'do_load_xattr_datum'
                   rc =3D do_load_xattr_datum(c, xd);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/xattr.c:212:9: note: Assuming the condition is false
           BUG_ON(ref_flags(xd->node) !=3D REF_PRISTINE);
                  ^
   fs/jffs2/nodelist.h:136:25: note: expanded from macro 'ref_flags'
   #define ref_flags(ref)          ((ref)->flash_offset & 3)
                                   ^
   include/asm-generic/bug.h:161:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/jffs2/xattr.c:212:2: note: Taking false branch
           BUG_ON(ref_flags(xd->node) !=3D REF_PRISTINE);
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/jffs2/xattr.c:212:2: note: Loop condition is false.  Exiting loop
           BUG_ON(ref_flags(xd->node) !=3D REF_PRISTINE);
--
   drivers/input/keyboard/lm8323.c:595:9: note: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", !lm->kp_enabled);
                  ^~~~~~~
   drivers/input/keyboard/lm8323.c:705:2: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(lm->phys, sizeof(lm->phys),
           ^~~~~~~~
   drivers/input/keyboard/lm8323.c:705:2: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(lm->phys, sizeof(lm->phys),
           ^~~~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   76 warnings generated.
   fs/ubifs/sysfs.c:101:6: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           n =3D snprintf(dfs_dir_name, UBIFS_DFS_DIR_LEN + 1, UBIFS_DFS_DI=
R_NAME,
               ^~~~~~~~
   fs/ubifs/sysfs.c:101:6: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           n =3D snprintf(dfs_dir_name, UBIFS_DFS_DIR_LEN + 1, UBIFS_DFS_DI=
R_NAME,
               ^~~~~~~~
   Suppressed 75 warnings (63 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   76 warnings generated.
   fs/ubifs/crypto.c:40:3: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(p + in_len, 0, pad_len - in_len);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/crypto.c:40:3: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
                   memset(p + in_len, 0, pad_len - in_len);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 75 warnings (63 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   79 warnings generated.
   fs/ubifs/xattr.c:370:3: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, ui->data, ui->data_len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/xattr.c:370:3: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                   memcpy(buf, ui->data, ui->data_len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/xattr.c:437:4: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buffer + written, fname_name(&nm), fname_=
len(&nm) + 1);
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/xattr.c:437:4: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                           memcpy(buffer + written, fname_name(&nm), fname_=
len(&nm) + 1);
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
>> fs/ubifs/xattr.c:658:3: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, XATTR_SECURITY_PREFIX);
                   ^~~~~~
   fs/ubifs/xattr.c:658:3: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
                   strcpy(name, XATTR_SECURITY_PREFIX);
                   ^~~~~~
   fs/ubifs/xattr.c:659:3: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name + XATTR_SECURITY_PREFIX_LEN, xattr->name);
                   ^~~~~~
   fs/ubifs/xattr.c:659:3: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
                   strcpy(name + XATTR_SECURITY_PREFIX_LEN, xattr->name);
                   ^~~~~~
   Suppressed 75 warnings (63 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/iio/proximity/srf08.c:233:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "[0.043 0.043 11.008]\n");
                  ^~~~~~~
   drivers/iio/proximity/srf08.c:233:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "[0.043 0.043 11.008]\n");
                  ^~~~~~~
   drivers/iio/proximity/srf08.c:245:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d.%03d\n", data->range_mm / 1000,
                  ^~~~~~~
   drivers/iio/proximity/srf08.c:245:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d.%03d\n", data->range_mm / 1000,
                  ^~~~~~~
   drivers/iio/proximity/srf08.c:323:11: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           len +=3D sprintf(buf + len, "%d ",
                                  ^~~~~~~
   drivers/iio/proximity/srf08.c:323:11: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                           len +=3D sprintf(buf + len, "%d ",
                                  ^~~~~~~
   drivers/iio/proximity/srf08.c:326:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/iio/proximity/srf08.c:326:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           len +=3D sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/iio/proximity/srf08.c:341:8: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D sprintf(buf, "%d\n", data->sensitivity);
                 ^~~~~~~
   drivers/iio/proximity/srf08.c:341:8: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           len =3D sprintf(buf, "%d\n", data->sensitivity);
                 ^~~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   lib/lz4/lz4hc_compress.c:63:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset((void *)hc4->hashTable, 0, sizeof(hc4->hashTable));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   lib/lz4/lz4hc_compress.c:63:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset((void *)hc4->hashTable, 0, sizeof(hc4->hashTable));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   lib/lz4/lz4hc_compress.c:64:2: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hc4->chainTable, 0xFF, sizeof(hc4->chainTable));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   lib/lz4/lz4hc_compress.c:64:2: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
           memset(hc4->chainTable, 0xFF, sizeof(hc4->chainTable));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   lib/lz4/lz4hc_compress.c:573:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   LZ4_memcpy(op, anchor, iend - anchor);
                   ^
   lib/lz4/lz4defs.h:150:36: note: expanded from macro 'LZ4_memcpy'
   #define LZ4_memcpy(dst, src, size) __builtin_memcpy(dst, src, size)
--
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:324:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/iio/proximity/sx9310.c:447:6: note: Assuming 'regval' is not equ=
al to 0
           if (!regval)
               ^~~~~~~
   drivers/iio/proximity/sx9310.c:447:2: note: Taking false branch
           if (!regval)
           ^
   drivers/iio/proximity/sx9310.c:451:17: note: The left operand of '>>' is=
 a garbage value
           *val =3D pthresh >> (5 - regval);
                  ~~~~~~~ ^
   drivers/iio/proximity/sx9310.c:564:26: warning: The left operand of '>>'=
 is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           else if (val =3D=3D pthresh >> 2)
                                   ^
   drivers/iio/proximity/sx9310.c:632:6: note: Assuming field 'type' is equ=
al to IIO_PROXIMITY
           if (chan->type !=3D IIO_PROXIMITY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:632:2: note: Taking false branch
           if (chan->type !=3D IIO_PROXIMITY)
           ^
   drivers/iio/proximity/sx9310.c:635:2: note: Control jumps to 'case IIO_E=
V_INFO_HYSTERESIS:'  at line 647
           switch (info) {
           ^
   drivers/iio/proximity/sx9310.c:648:10: note: Calling 'sx9310_write_hyste=
resis'
                   return sx9310_write_hysteresis(data, chan, val);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:556:11: note: 'pthresh' declared without =
an initial value
           int ret, pthresh;
                    ^~~~~~~
   drivers/iio/proximity/sx9310.c:558:8: note: Calling 'sx9310_read_thresh'
           ret =3D sx9310_read_thresh(data, chan, &pthresh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:417:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   drivers/iio/proximity/sx9310.c:417:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/proximity/sx9310.c:421:6: note: Assuming 'ret' is not equal =
to 0
           if (ret)
               ^~~
   drivers/iio/proximity/sx9310.c:421:2: note: Taking true branch
           if (ret)
           ^
   drivers/iio/proximity/sx9310.c:422:3: note: Returning without writing to=
 '*val'
                   return ret;
                   ^
   drivers/iio/proximity/sx9310.c:558:8: note: Returning from 'sx9310_read_=
thresh'
           ret =3D sx9310_read_thresh(data, chan, &pthresh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:559:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/proximity/sx9310.c:559:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/proximity/sx9310.c:562:6: note: Assuming 'val' is not equal =
to 0
           if (val =3D=3D 0)
               ^~~~~~~~
   drivers/iio/proximity/sx9310.c:562:2: note: Taking false branch
           if (val =3D=3D 0)
           ^
   drivers/iio/proximity/sx9310.c:564:26: note: The left operand of '>>' is=
 a garbage value
           else if (val =3D=3D pthresh >> 2)
                           ~~~~~~~ ^
   drivers/iio/proximity/sx9310.c:808:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(reg_def, &sx9310_default_regs[idx], sizeof(*reg_def));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:808:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(reg_def, &sx9310_default_regs[idx], sizeof(*reg_def));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 68 warnings (56 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   86 warnings generated.
>> fs/ubifs/lpt.c:242:24: warning: Although the value stored to 'val' is us=
ed in the enclosing expression, the value is never actually read from 'val'=
 [clang-analyzer-deadcode.DeadStores]
                                                   *++p =3D (uint8_t)(val >=
>=3D 8);
                                                                    ^      =
 ~
   fs/ubifs/lpt.c:242:24: note: Although the value stored to 'val' is used =
in the enclosing expression, the value is never actually read from 'val'
                                                   *++p =3D (uint8_t)(val >=
>=3D 8);
                                                                    ^      =
 ~
   fs/ubifs/lpt.c:253:23: warning: Although the value stored to 'val' is us=
ed in the enclosing expression, the value is never actually read from 'val'=
 [clang-analyzer-deadcode.DeadStores]
                                           *++p =3D (uint8_t)(val >>=3D 8);
                                                            ^       ~
   fs/ubifs/lpt.c:253:23: note: Although the value stored to 'val' is used =
in the enclosing expression, the value is never actually read from 'val'
                                           *++p =3D (uint8_t)(val >>=3D 8);
                                                            ^       ~
>> fs/ubifs/lpt.c:302:7: warning: The left expression of the compound assig=
nment is an uninitialized value. The computed value will also be garbage [c=
lang-analyzer-core.uninitialized.Assign]
                   val <<=3D (8 - b);
                       ^
   fs/ubifs/lpt.c:2086:6: note: Assuming the condition is false
           if (start_lnum =3D=3D -1) {
               ^~~~~~~~~~~~~~~~
   fs/ubifs/lpt.c:2086:2: note: Taking false branch
           if (start_lnum =3D=3D -1) {
           ^
   fs/ubifs/lpt.c:2092:18: note: Assuming 'start_lnum' is < field 'main_fir=
st'
           ubifs_assert(c, start_lnum >=3D c->main_first && start_lnum < c-=
>leb_cnt);
                           ^
   fs/ubifs/debug.h:143:17: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
                          ^~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/ubifs/lpt.c:2092:46: note: Left side of '&&' is false
           ubifs_assert(c, start_lnum >=3D c->main_first && start_lnum < c-=
>leb_cnt);
                                                       ^
   fs/ubifs/lpt.c:2092:18: note: 'start_lnum' is < field 'main_first'
           ubifs_assert(c, start_lnum >=3D c->main_first && start_lnum < c-=
>leb_cnt);
                           ^
   fs/ubifs/debug.h:143:17: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
                          ^~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   fs/ubifs/lpt.c:2092:46: note: Left side of '&&' is false
           ubifs_assert(c, start_lnum >=3D c->main_first && start_lnum < c-=
>leb_cnt);
                                                       ^
   fs/ubifs/lpt.c:2092:2: note: Taking true branch
           ubifs_assert(c, start_lnum >=3D c->main_first && start_lnum < c-=
>leb_cnt);
           ^
   fs/ubifs/debug.h:143:2: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
           ^
   fs/ubifs/lpt.c:2092:2: note: Loop condition is false.  Exiting loop
           ubifs_assert(c, start_lnum >=3D c->main_first && start_lnum < c-=
>leb_cnt);
           ^
   fs/ubifs/debug.h:142:31: note: expanded from macro 'ubifs_assert'
   #define ubifs_assert(c, expr) do {                                      =
       \
                                 ^
   fs/ubifs/lpt.c:2093:18: note: Assuming 'end_lnum' is < field 'main_first'
           ubifs_assert(c, end_lnum >=3D c->main_first && end_lnum < c->leb=
_cnt);
                           ^
   fs/ubifs/debug.h:143:17: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
                          ^~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/ubifs/lpt.c:2093:44: note: Left side of '&&' is false
           ubifs_assert(c, end_lnum >=3D c->main_first && end_lnum < c->leb=
_cnt);
                                                     ^
   fs/ubifs/lpt.c:2093:18: note: 'end_lnum' is < field 'main_first'
           ubifs_assert(c, end_lnum >=3D c->main_first && end_lnum < c->leb=
_cnt);
                           ^
   fs/ubifs/debug.h:143:17: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
                          ^~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   fs/ubifs/lpt.c:2093:44: note: Left side of '&&' is false
           ubifs_assert(c, end_lnum >=3D c->main_first && end_lnum < c->leb=
_cnt);
                                                     ^
   fs/ubifs/lpt.c:2093:2: note: Taking true branch
           ubifs_assert(c, end_lnum >=3D c->main_first && end_lnum < c->leb=
_cnt);
           ^
   fs/ubifs/debug.h:143:2: note: expanded from macro 'ubifs_assert'
           if (unlikely(!(expr))) {                                        =
       \
           ^
   fs/ubifs/lpt.c:2093:2: note: Loop condition is false.  Exiting loop
           ubifs_assert(c, end_lnum >=3D c->main_first && end_lnum < c->leb=
_cnt);
           ^
   fs/ubifs/debug.h:142:31: note: expanded from macro 'ubifs_assert'
   #define ubifs_assert(c, expr) do {                                      =
       \
                                 ^
   fs/ubifs/lpt.c:2095:6: note: Assuming field 'nroot' is null
           if (!c->nroot) {
               ^~~~~~~~~
   fs/ubifs/lpt.c:2095:2: note: Taking true branch
           if (!c->nroot) {
           ^
   fs/ubifs/lpt.c:2096:9: note: Calling 'ubifs_read_nnode'
                   err =3D ubifs_read_nnode(c, NULL, 0);
--
                   memset(ptr, 0, size);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   mm/memblock.c:1599:3: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
                   memset(ptr, 0, size);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 68 warnings (56 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   fs/ubifs/scan.c:360:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(head)) {
           ^
   fs/ubifs/scan.c:363:3: note: Memory is released
                   kfree(node);
                   ^~~~~~~~~~~
   fs/ubifs/scan.c:360:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(head)) {
           ^
   fs/ubifs/scan.c:362:3: note: Calling 'list_del'
                   list_del(&node->list);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
                       ^
   fs/ubifs/scan.c:360:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(head)) {
           ^
   fs/ubifs/scan.c:363:3: note: Memory is released
                   kfree(node);
                   ^~~~~~~~~~~
   fs/ubifs/scan.c:360:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(head)) {
           ^
   fs/ubifs/scan.c:362:3: note: Calling 'list_del'
                   list_del(&node->list);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 75 warnings (63 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   79 warnings generated.
   fs/ubifs/replay.c:464:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(nbuf, name, nlen);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/replay.c:464:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(nbuf, name, nlen);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
>> fs/ubifs/replay.c:807:4: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   fs/ubifs/replay.c:807:4: note: Value stored to 'err' is never read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   fs/ubifs/replay.c:871:2: note: Loop condition is true.  Entering loop bo=
dy
           while (!list_empty(&c->replay_buds)) {
           ^
   fs/ubifs/replay.c:874:3: note: Memory is released
                   kfree(b);
                   ^~~~~~~~
   fs/ubifs/replay.c:871:2: note: Loop condition is true.  Entering loop bo=
dy
           while (!list_empty(&c->replay_buds)) {
           ^
   fs/ubifs/replay.c:873:3: note: Calling 'list_del'
                   list_del(&b->list);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
                       ^
   fs/ubifs/replay.c:871:2: note: Loop condition is true.  Entering loop bo=
dy
           while (!list_empty(&c->replay_buds)) {
           ^
   fs/ubifs/replay.c:874:3: note: Memory is released
                   kfree(b);
                   ^~~~~~~~
   fs/ubifs/replay.c:871:2: note: Loop condition is true.  Entering loop bo=
dy
           while (!list_empty(&c->replay_buds)) {
           ^
   fs/ubifs/replay.c:873:3: note: Calling 'list_del'
                   list_del(&b->list);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 75 warnings (63 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   96 warnings generated.
   Suppressed 96 warnings (84 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   99 warnings generated.
   Suppressed 99 warnings (87 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   99 warnings generated.
   Suppressed 99 warnings (87 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   106 warnings generated.
   net/llc/llc_if.c:93:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(daddr.mac, dmac, sizeof(daddr.mac));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/llc/llc_if.c:93:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(daddr.mac, dmac, sizeof(daddr.mac));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/llc/llc_if.c:94:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(laddr.mac, lmac, sizeof(laddr.mac));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
--
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kvm/vsie.c:1385:6: note: Assuming the condition is false
           if (!test_kvm_cpu_feat(vcpu->kvm, KVM_S390_VM_CPU_FEAT_SIEF2))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kvm/vsie.c:1385:2: note: Taking false branch
           if (!test_kvm_cpu_feat(vcpu->kvm, KVM_S390_VM_CPU_FEAT_SIEF2))
           ^
   arch/s390/kvm/vsie.c:1387:6: note: Assuming the condition is false
           if (vcpu->arch.sie_block->gpsw.mask & PSW_MASK_PSTATE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kvm/vsie.c:1387:2: note: Taking false branch
           if (vcpu->arch.sie_block->gpsw.mask & PSW_MASK_PSTATE)
           ^
   arch/s390/kvm/vsie.c:1390:2: note: Taking false branch
           BUILD_BUG_ON(sizeof(struct vsie_page) !=3D PAGE_SIZE);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:332:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   arch/s390/kvm/vsie.c:1390:2: note: Loop condition is false.  Exiting loop
           BUILD_BUG_ON(sizeof(struct vsie_page) !=3D PAGE_SIZE);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:324:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   arch/s390/kvm/vsie.c:1394:6: note: Assuming the condition is true
           if (unlikely(scb_addr & 0x1ffUL))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   arch/s390/kvm/vsie.c:1394:2: note: Taking false branch
           if (unlikely(scb_addr & 0x1ffUL))
           ^
   arch/s390/kvm/vsie.c:1397:21: note: Dereference of null pointer
           if (signal_pending(current) || kvm_s390_vcpu_has_irq(vcpu, 0) ||
                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 87 warnings (75 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/s390/net/smsgiucv.c:69:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(sender, buffer, 8);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/net/smsgiucv.c:69:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(sender, buffer, 8);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
>> drivers/s390/net/smsgiucv.c:141:7: warning: Dereference of null pointer =
[clang-analyzer-core.NullDereference]
           if (!MACHINE_IS_VM) {
                ^
   arch/s390/include/asm/setup.h:80:25: note: expanded from macro 'MACHINE_=
IS_VM'
   #define MACHINE_IS_VM           (S390_lowcore.machine_flags & MACHINE_FL=
AG_VM)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/s390/net/smsgiucv.c:141:7: note: Dereference of null pointer
           if (!MACHINE_IS_VM) {
                ^
   arch/s390/include/asm/setup.h:80:25: note: expanded from macro 'MACHINE_=
IS_VM'
   #define MACHINE_IS_VM           (S390_lowcore.machine_flags & MACHINE_FL=
AG_VM)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   124 warnings generated.
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:205:12: warning: Dereference =
of null pointer [clang-analyzer-core.NullDereference]
           int cpu =3D get_cpu();
                     ^
   include/linux/smp.h:267:42: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id=
(); })
                                                         ^~~~~~~~~~~~~~~~~~=
~~
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_i=
d'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:205:12: note: Loop condition =
is false.  Exiting loop
           int cpu =3D get_cpu();
                     ^
   include/linux/smp.h:267:23: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id=
(); })
                                      ^
   include/linux/preempt.h:201:27: note: expanded from macro 'preempt_disab=
le'
   #define preempt_disable() \
                             ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:205:12: note: Dereference of =
null pointer
           int cpu =3D get_cpu();
                     ^
   include/linux/smp.h:267:42: note: expanded from macro 'get_cpu'
   #define get_cpu()               ({ preempt_disable(); __smp_processor_id=
(); })
                                                         ^~~~~~~~~~~~~~~~~~=
~~
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_i=
d'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:219:2: warning: Dereference o=
f null pointer [clang-analyzer-core.NullDereference]
           __this_cpu_write(kvm_running_vcpu, NULL);
           ^
   include/linux/percpu-defs.h:452:2: note: expanded from macro '__this_cpu=
_write'
           raw_cpu_write(pcp, val);                                        \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:421:34: note: expanded from macro 'raw_cpu_w=
rite'
   #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_,=
 pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   include/linux/percpu-defs.h:380:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:216:2: note: Loop condition i=
s false.  Exiting loop
           preempt_disable();
           ^
   include/linux/preempt.h:201:27: note: expanded from macro 'preempt_disab=
le'
   #define preempt_disable() \
                             ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:219:2: note: Loop condition i=
s false.  Exiting loop
           __this_cpu_write(kvm_running_vcpu, NULL);
           ^
   include/linux/percpu-defs.h:452:2: note: expanded from macro '__this_cpu=
_write'
           raw_cpu_write(pcp, val);                                        \
           ^
   include/linux/percpu-defs.h:421:34: note: expanded from macro 'raw_cpu_w=
rite'
   #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_,=
 pcp, val)
                                           ^
   include/linux/percpu-defs.h:375:2: note: expanded from macro '__pcpu_siz=
e_call'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   arch/s390/kvm/../../../virt/kvm/kvm_main.c:219:2: note: Control jumps to=
 'case 8:'  at line 219
           __this_cpu_write(kvm_running_vcpu, NULL);
           ^
   include/linux/percpu-defs.h:452:2: note: expanded from macro '__this_cpu=
_write'
--
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   73 warnings generated.
   drivers/iio/chemical/scd30_core.c:383:16: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return ret ?: sprintf(buf, "%d\n", val);
                         ^~~~~~~
   drivers/iio/chemical/scd30_core.c:383:16: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
           return ret ?: sprintf(buf, "%d\n", val);
                         ^~~~~~~
   drivers/iio/chemical/scd30_core.c:417:16: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return ret ?: sprintf(buf, "%d\n", val);
                         ^~~~~~~
   drivers/iio/chemical/scd30_core.c:417:16: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
           return ret ?: sprintf(buf, "%d\n", val);
                         ^~~~~~~
   drivers/iio/chemical/scd30_core.c:606:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&scan, 0, sizeof(scan));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/iio/chemical/scd30_core.c:606:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&scan, 0, sizeof(scan));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/iio/chemical/scd30_core.c:607:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(scan.data, state->meas, sizeof(state->meas));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/iio/chemical/scd30_core.c:607:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(scan.data, state->meas, sizeof(state->meas));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 69 warnings (57 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   76 warnings generated.
   fs/ubifs/log.c:627:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf + *offs, node, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/log.c:627:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(buf + *offs, node, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 75 warnings (63 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   80 warnings generated.
>> fs/ubifs/commit.c:113:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D 0;
                   ^     ~
   fs/ubifs/commit.c:113:3: note: Value stored to 'err' is never read
                   err =3D 0;
                   ^     ~
>> fs/ubifs/commit.c:281:18: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
                     c->bgt_name, current->pid);
                                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/ubifs/commit.c:281:18: note: Dereference of null pointer
                     c->bgt_name, current->pid);
                                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> fs/ubifs/commit.c:668:19: warning: Use of memory after it is freed [clan=
g-analyzer-unix.Malloc]
                                   if (iip + 1 < le16_to_cpu(idx->child_cnt=
)) {
                                                 ^
   include/linux/byteorder/generic.h:91:21: note: expanded from macro 'le16=
_to_cpu'
   #define le16_to_cpu __le16_to_cpu
                       ^
   include/uapi/linux/byteorder/big_endian.h:37:58: note: expanded from mac=
ro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   fs/ubifs/commit.c:565:2: note: Taking false branch
           if (!dbg_is_chk_index(c))
           ^
   fs/ubifs/commit.c:583:2: note: Loop condition is true.  Entering loop bo=
dy
           while (1) {
           ^
   fs/ubifs/commit.c:588:7: note: Assuming 'i' is non-null
                   if (!i) {
                       ^~
   fs/ubifs/commit.c:588:3: note: Taking false branch
                   if (!i) {
                   ^
   fs/ubifs/commit.c:598:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   fs/ubifs/commit.c:598:3: note: Taking false branch
                   if (err)
                   ^
   fs/ubifs/commit.c:602:7: note: Assuming 'child_cnt' is >=3D 1
                   if (child_cnt < 1 || child_cnt > c->fanout) {
                       ^~~~~~~~~~~~~
   fs/ubifs/commit.c:602:7: note: Left side of '||' is false
   fs/ubifs/commit.c:602:24: note: Assuming 'child_cnt' is <=3D field 'fano=
ut'
                   if (child_cnt < 1 || child_cnt > c->fanout) {
                                        ^~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/commit.c:602:3: note: Taking false branch
                   if (child_cnt < 1 || child_cnt > c->fanout) {
                   ^
   fs/ubifs/commit.c:606:7: note: 'first' is 1
                   if (first) {
                       ^~~~~
   fs/ubifs/commit.c:606:3: note: Taking true branch
                   if (first) {
                   ^
   fs/ubifs/commit.c:609:8: note: Assuming the condition is false
                           if (le16_to_cpu(idx->level) !=3D d->old_zroot_le=
vel) {
                               ^
   include/linux/byteorder/generic.h:91:21: note: expanded from macro 'le16=
_to_cpu'
   #define le16_to_cpu __le16_to_cpu
                       ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: expanded from mac=
ro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                            ^
   include/uapi/linux/swab.h:102:21: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                       ^
   fs/ubifs/commit.c:609:4: note: Taking false branch
                           if (le16_to_cpu(idx->level) !=3D d->old_zroot_le=
vel) {
                           ^
   fs/ubifs/commit.c:613:8: note: Assuming the condition is false
                           if (le64_to_cpu(idx->ch.sqnum) !=3D d->old_zroot=
_sqnum) {
                               ^
   include/linux/byteorder/generic.h:87:21: note: expanded from macro 'le64=
_to_cpu'
   #define le64_to_cpu __le64_to_cpu
                       ^
   include/uapi/linux/byteorder/big_endian.h:33:26: note: expanded from mac=
ro '__le64_to_cpu'
   #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
                            ^
   include/uapi/linux/swab.h:128:21: note: expanded from macro '__swab64'
   #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
                       ^
   fs/ubifs/commit.c:613:4: note: Taking false branch
                           if (le64_to_cpu(idx->ch.sqnum) !=3D d->old_zroot=
_sqnum) {
                           ^
   fs/ubifs/commit.c:624:7: note: Assuming the condition is false
                   if (le16_to_cpu(idx->level) !=3D last_level - 1) {
                       ^
   include/linux/byteorder/generic.h:91:21: note: expanded from macro 'le16=
_to_cpu'
   #define le16_to_cpu __le16_to_cpu
                       ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: expanded from mac=
ro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                            ^
   include/uapi/linux/swab.h:102:21: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                       ^
   fs/ubifs/commit.c:624:3: note: Taking false branch
                   if (le16_to_cpu(idx->level) !=3D last_level - 1) {
                   ^
   fs/ubifs/commit.c:632:7: note: Assuming the condition is false
                   if (le64_to_cpu(idx->ch.sqnum) >=3D last_sqnum) {
                       ^
   include/linux/byteorder/generic.h:87:21: note: expanded from macro 'le64=
_to_cpu'
   #define le64_to_cpu __le64_to_cpu
                       ^
   include/uapi/linux/byteorder/big_endian.h:33:26: note: expanded from mac=
ro '__le64_to_cpu'
   #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
                            ^
   include/uapi/linux/swab.h:128:21: note: expanded from macro '__swab64'
--
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:90:7: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           p +=3D sprintf(p, "  RX channel FSM state: %s\n",
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:90:7: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           p +=3D sprintf(p, "  RX channel FSM state: %s\n",
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:92:7: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           p +=3D sprintf(p, "  TX channel FSM state: %s\n",
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:92:7: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           p +=3D sprintf(p, "  TX channel FSM state: %s\n",
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:94:7: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "  Max. TX buffer used: %ld\n",
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:94:7: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "  Max. TX buffer used: %ld\n",
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:96:7: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "  Max. chained SKBs: %ld\n",
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:96:7: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "  Max. chained SKBs: %ld\n",
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:98:7: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "  TX single write ops: %ld\n",
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:98:7: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "  TX single write ops: %ld\n",
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:100:7: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "  TX multi write ops: %ld\n",
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:100:7: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "  TX multi write ops: %ld\n",
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:102:7: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "  Netto bytes written: %ld\n",
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:102:7: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "  Netto bytes written: %ld\n",
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:104:2: warning: Value stored to 'p' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           p +=3D sprintf(p, "  Max. TX IO-time: %u\n",
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/s390/net/ctcm_sysfs.c:104:2: note: Value stored to 'p' is never =
read
           p +=3D sprintf(p, "  Max. TX IO-time: %u\n",
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/s390/net/ctcm_sysfs.c:104:7: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "  Max. TX IO-time: %u\n",
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:104:7: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "  Max. TX IO-time: %u\n",
                ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:122:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0\n");
                  ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:122:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0\n");
                  ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:132:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&priv->channel[WRITE]->prof, 0,
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/net/ctcm_sysfs.c:132:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&priv->channel[WRITE]->prof, 0,
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/s390/net/ctcm_sysfs.c:144:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", priv->protocol);
                  ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:144:9: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", priv->protocol);
                  ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:186:9: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   drivers/s390/net/ctcm_sysfs.c:186:9: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   Suppressed 99 warnings (87 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
>> fs/jffs2/scan.c:340:3: warning: Dereference of null pointer [clang-analy=
zer-core.NullDereference]
                   JFFS2_WARNING("node CRC failed at %#08x, read=3D%#08x, c=
alc=3D%#08x\n",
                   ^
   fs/jffs2/debug.h:85:15: note: expanded from macro 'JFFS2_WARNING'
                   task_pid_nr(current), __func__, ##__VA_ARGS__)
                               ^
   fs/jffs2/scan.c:462:2: note: 0 is < 1
           jffs2_dbg(1, "%s(): Scanning block@0x%x\n", __func__, ofs);
           ^
   fs/jffs2/debug.h:69:6: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
               ^~~~~~~~~~~~~~~~~~~~~
   ./include/generated/autoconf.h:413:31: note: expanded from macro 'CONFIG=
_JFFS2_FS_DEBUG'
   #define CONFIG_JFFS2_FS_DEBUG 0
                                 ^
   fs/jffs2/scan.c:462:2: note: Taking false branch
           jffs2_dbg(1, "%s(): Scanning block at 0x%x\n", __func__, ofs);
           ^
   fs/jffs2/debug.h:69:2: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
           ^
   fs/jffs2/scan.c:462:2: note: Loop condition is false.  Exiting loop
           jffs2_dbg(1, "%s(): Scanning block at 0x%x\n", __func__, ofs);
           ^
   fs/jffs2/debug.h:67:37: note: expanded from macro 'jffs2_dbg'
   #define jffs2_dbg(level, fmt, ...)              \
                                                   ^
   fs/jffs2/scan.c:465:28: note: Assuming field 'type' is not equal to 4
           if (jffs2_cleanmarker_oob(c)) {
                                     ^
   fs/jffs2/os-linux.h:111:35: note: expanded from macro 'jffs2_cleanmarker=
_oob'
   #define jffs2_cleanmarker_oob(c) (c->mtd->type =3D=3D MTD_NANDFLASH)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/scan.c:465:2: note: Taking false branch
           if (jffs2_cleanmarker_oob(c)) {
           ^
   fs/jffs2/scan.c:485:2: note: Taking false branch
           if (jffs2_sum_active()) {
           ^
   fs/jffs2/scan.c:560:6: note: Assuming 'buf_size' is not equal to 0
           if (!buf_size) {
               ^~~~~~~~~
   fs/jffs2/scan.c:560:2: note: Taking false branch
           if (!buf_size) {
           ^
   fs/jffs2/scan.c:566:7: note: 'err' is 0
                   if (err)
                       ^~~
   fs/jffs2/scan.c:566:3: note: Taking false branch
                   if (err)
                   ^
   fs/jffs2/scan.c:574:8: note: 'ofs' is < 'max_ofs'
           while(ofs < max_ofs && *(uint32_t *)(&buf[ofs]) =3D=3D 0xFFFFFFF=
F)
                 ^~~
   fs/jffs2/scan.c:574:8: note: Left side of '&&' is true
   fs/jffs2/scan.c:574:25: note: Assuming the condition is false
           while(ofs < max_ofs && *(uint32_t *)(&buf[ofs]) =3D=3D 0xFFFFFFF=
F)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/scan.c:574:2: note: Loop condition is false. Execution continue=
s on line 577
           while(ofs < max_ofs && *(uint32_t *)(&buf[ofs]) =3D=3D 0xFFFFFFF=
F)
           ^
   fs/jffs2/scan.c:577:6: note: 'ofs' is not equal to 'max_ofs'
           if (ofs =3D=3D max_ofs) {
               ^~~
   fs/jffs2/scan.c:577:2: note: Taking false branch
           if (ofs =3D=3D max_ofs) {
           ^
   fs/jffs2/scan.c:598:6: note: 'ofs' is 0
           if (ofs) {
               ^~~
   fs/jffs2/scan.c:598:2: note: Taking false branch
           if (ofs) {
           ^
   fs/jffs2/scan.c:612:2: note: Taking false branch
           dbg_summary("no summary found in jeb 0x%08x. Apply original scan=
.\n",jeb->offset);
           ^
   fs/jffs2/debug.h:148:31: note: expanded from macro 'dbg_summary'
   #define dbg_summary(fmt, ...)   no_printk(fmt, ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/jffs2/scan.c:615:8: note: Assuming the condition is true
           while(ofs < jeb->offset + c->sector_size) {
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/scan.c:615:2: note: Loop condition is true.  Entering loop body
           while(ofs < jeb->offset + c->sector_size) {
           ^
   fs/jffs2/scan.c:621:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   fs/jffs2/scan.c:621:3: note: Taking false branch
                   if (err)
                   ^
   fs/jffs2/scan.c:626:7: note: Assuming the condition is false
                   if (ofs & 3) {
                       ^~~~~~~
   fs/jffs2/scan.c:626:3: note: Taking false branch
                   if (ofs & 3) {
                   ^
   fs/jffs2/scan.c:631:7: note: Assuming 'ofs' is not equal to 'prevofs'
--
   drivers/input/misc/adxl34x.c:749:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(ac->phys, sizeof(ac->phys), "%s/input0", dev_name(dev));
           ^~~~~~~~
   drivers/input/misc/adxl34x.c:749:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(ac->phys, sizeof(ac->phys), "%s/input0", dev_name(dev));
           ^~~~~~~~
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/input/misc/kxtj9.c:299:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", tj9->last_poll_interval);
                  ^~~~~~~
   drivers/input/misc/kxtj9.c:299:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", tj9->last_poll_interval);
                  ^~~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/input/misc/pcf8574_keypad.c:121:2: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(lp->name, DRV_NAME);
           ^~~~~~~
   drivers/input/misc/pcf8574_keypad.c:121:2: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(lp->name, DRV_NAME);
           ^~~~~~~
   drivers/input/misc/pcf8574_keypad.c:122:2: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(lp->phys, "kp_data/input0");
           ^~~~~~~
   drivers/input/misc/pcf8574_keypad.c:122:2: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(lp->phys, "kp_data/input0");
           ^~~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   Suppressed 53 warnings (53 in non-user code).
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
   99 warnings generated.
   drivers/net/wan/hdlc_ppp.c:399:6: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                           memcpy(out + nak_len, valid_accm,
                                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wan/hdlc_ppp.c:399:6: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                                           memcpy(out + nak_len, valid_accm,
                                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wan/hdlc_ppp.c:414:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(out + rej_len, opt, opt[1]);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wan/hdlc_ppp.c:414:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(out + rej_len, opt, opt[1]);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
>> drivers/net/wan/hdlc_ppp.c:460:7: warning: Dereference of null pointer [=
clang-analyzer-core.NullDereference]
                   if (ppp->protos[IDX_LCP].state =3D=3D OPENED)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wan/hdlc_ppp.c:437:2: note: 'ppp' initialized here
           struct ppp *ppp =3D get_ppp(dev);
           ^~~~~~~~~~~~~~~
   drivers/net/wan/hdlc_ppp.c:448:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave(&ppp->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/net/wan/hdlc_ppp.c:448:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave(&ppp->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/net/wan/hdlc_ppp.c:450:6: note: Assuming the condition is false
           if (skb->len < sizeof(struct hdlc_header))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wan/hdlc_ppp.c:450:2: note: Taking false branch
           if (skb->len < sizeof(struct hdlc_header))
           ^
   drivers/net/wan/hdlc_ppp.c:453:6: note: Assuming field 'address' is equa=
l to HDLC_ADDR_ALLSTATIONS
           if (hdr->address !=3D HDLC_ADDR_ALLSTATIONS ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wan/hdlc_ppp.c:453:6: note: Left side of '||' is false
   drivers/net/wan/hdlc_ppp.c:454:6: note: Assuming field 'control' is equa=
l to HDLC_CTRL_UI
               hdr->control !=3D HDLC_CTRL_UI)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wan/hdlc_ppp.c:453:2: note: Taking false branch
           if (hdr->address !=3D HDLC_ADDR_ALLSTATIONS ||
           ^
   drivers/net/wan/hdlc_ppp.c:458:10: note: Calling 'get_proto'
           proto =3D get_proto(dev, pid);
                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/wan/hdlc_ppp.c:114:2: note: Control jumps to 'case 32855:'  =
at line 119
           switch (pid) {
           ^
   drivers/net/wan/hdlc_ppp.c:120:3: note: Returning pointer, which partici=
pates in a condition later
                   return &ppp->protos[IDX_IPV6CP];
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wan/hdlc_ppp.c:458:10: note: Returning from 'get_proto'
           proto =3D get_proto(dev, pid);
                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/wan/hdlc_ppp.c:459:6: note: Assuming 'proto' is null
           if (!proto) {
               ^~~~~~
   drivers/net/wan/hdlc_ppp.c:459:2: note: Taking true branch
           if (!proto) {
           ^
   drivers/net/wan/hdlc_ppp.c:460:7: note: Dereference of null pointer
                   if (ppp->protos[IDX_LCP].state =3D=3D OPENED)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 96 warnings (84 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   kernel/trace/trace_printk.c:77:5: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcpy(fmt, *iter);
                                   ^~~~~~
   kernel/trace/trace_printk.c:77:5: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                                   strcpy(fmt, *iter);
                                   ^~~~~~
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   Suppressed 59 warnings (47 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   62 warnings generated.
   kernel/trace/tracing_map.c:295:3: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(a->pages[i], 0, PAGE_SIZE);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   kernel/trace/tracing_map.c:295:3: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
                   memset(a->pages[i], 0, PAGE_SIZE);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
--
   drivers/mtd/tests/oobtest.c:390:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   drivers/mtd/tests/oobtest.c:390:2: note: Taking false branch
           if (err)
           ^
   drivers/mtd/tests/oobtest.c:399:2: note: Loop condition is false.  Exiti=
ng loop
           pr_info("test 1 of 5\n");
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
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
   drivers/mtd/tests/oobtest.c:402:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   drivers/mtd/tests/oobtest.c:402:2: note: Taking false branch
           if (err)
           ^
   drivers/mtd/tests/oobtest.c:405:2: note: Calling 'prandom_seed_state'
           prandom_seed_state(&rnd_state, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/prandom.h:120:2: note: Calling 'prandom_u32_add_noise'
           PRANDOM_ADD_NOISE(state, i, 0, 0);
           ^
   include/linux/prandom.h:22:2: note: expanded from macro 'PRANDOM_ADD_NOI=
SE'
           prandom_u32_add_noise((unsigned long)(a), (unsigned long)(b), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/prandom.h:66:7: note: Loop condition is false.  Exiting lo=
op
           a ^=3D raw_cpu_read(net_rand_noise);
                ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:319:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/prandom.h:66:7: note: Control jumps to 'case 8:'  at line =
66
           a ^=3D raw_cpu_read(net_rand_noise);
                ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:320:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           switch(sizeof(variable)) {                                      \
           ^
   include/linux/prandom.h:66:7: note: Loop condition is false.  Exiting lo=
op
           a ^=3D raw_cpu_read(net_rand_noise);
                ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 8: pscr_ret__ =3D stem##8(variable); break;                =
  \
                                ^
   note: expanded from here
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:67:3: note: expanded from macro 'raw_cpu_ge=
neric_read'
           *raw_cpu_ptr(&(pcp));                                           \
            ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/prandom.h:66:7: note: Dereference of null pointer
           a ^=3D raw_cpu_read(net_rand_noise);
                ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 8: pscr_ret__ =3D stem##8(variable); break;                =
  \
                                ^~~~~~~~~~~~~~~~~
   note: expanded from here
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   79 warnings generated.
>> fs/ubifs/gc.c:357:3: warning: Use of memory after it is freed [clang-ana=
lyzer-unix.Malloc]
                   list_for_each_entry_safe(snod, tmp, &sleb->nodes, list) {
                   ^
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   fs/ubifs/gc.c:337:6: note: Assuming the condition is false
           if (wbuf->lnum =3D=3D -1) {
               ^~~~~~~~~~~~~~~~
   fs/ubifs/gc.c:337:2: note: Taking false branch
           if (wbuf->lnum =3D=3D -1) {
           ^
   fs/ubifs/gc.c:348:6: note: 'err' is 0
           if (err)
               ^~~
   fs/ubifs/gc.c:348:2: note: Taking false branch
           if (err)
           ^
   fs/ubifs/gc.c:352:2: note: Loop condition is true.  Entering loop body
           while (1) {
           ^
   fs/ubifs/gc.c:357:3: note: Loop condition is true.  Entering loop body
                   list_for_each_entry_safe(snod, tmp, &sleb->nodes, list) {
                   ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   fs/ubifs/gc.c:360:9: note: Assuming 'avail' is >=3D field 'len'
                           if  (snod->len > avail)
                                ^~~~~~~~~~~~~~~~~
   fs/ubifs/gc.c:360:4: note: Taking false branch
                           if  (snod->len > avail)
                           ^
   fs/ubifs/gc.c:369:8: note: 'err' is 0
                           if (err)
                               ^~~
   fs/ubifs/gc.c:369:4: note: Taking false branch
                           if (err)
                           ^
   fs/ubifs/gc.c:372:10: note: Calling 'move_node'
                           err =3D move_node(c, sleb, snod, wbuf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/gc.c:310:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/ubifs/gc.c:310:2: note: Taking false branch
           if (err)
           ^
   fs/ubifs/gc.c:317:2: note: Memory is released
           kfree(snod);
           ^~~~~~~~~~~
   fs/ubifs/gc.c:372:10: note: Returning; memory was released via 3rd param=
eter
                           err =3D move_node(c, sleb, snod, wbuf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/gc.c:373:8: note: Assuming 'err' is 0
                           if (err)
                               ^~~
   fs/ubifs/gc.c:373:4: note: Taking false branch
                           if (err)
                           ^
   fs/ubifs/gc.c:357:3: note: Loop condition is false. Execution continues =
on line 379
                   list_for_each_entry_safe(snod, tmp, &sleb->nodes, list) {
                   ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   fs/ubifs/gc.c:379:3: note: Loop condition is true.  Entering loop body
                   list_for_each_entry_safe(snod, tmp, &nondata, list) {
                   ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   fs/ubifs/gc.c:382:8: note: Assuming 'avail' is < 'min'
                           if (avail < min)
                               ^~~~~~~~~~~
   fs/ubifs/gc.c:382:4: note: Taking true branch
                           if (avail < min)
                           ^
   fs/ubifs/gc.c:383:5: note:  Execution continues on line 410
                                   break;
                                   ^
   fs/ubifs/gc.c:410:30: note: Left side of '&&' is false
                   if (ubifs_authenticated(c) && moved) {
                                              ^
   fs/ubifs/gc.c:436:7: note: Assuming the condition is false
                   if (list_empty(&sleb->nodes) && list_empty(&nondata))
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/gc.c:436:32: note: Left side of '&&' is false
                   if (list_empty(&sleb->nodes) && list_empty(&nondata))
                                                ^
   fs/ubifs/gc.c:444:7: note: Assuming 'err' is 0
                   if (err)
--
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
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/mtd/nand/raw/nand_toshiba.c:63:29: warning: The left operand of =
'&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           bitflips =3D ecc_status[i] & TOSHIBA_NAND_ECC_ST=
ATUS_MASK;
                                                    ^
   drivers/mtd/nand/raw/nand_toshiba.c:116:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/nand/raw/nand_toshiba.c:116:2: note: Taking false branch
           if (ret)
           ^
   drivers/mtd/nand/raw/nand_toshiba.c:119:9: note: Calling 'toshiba_nand_b=
enand_eccstatus'
           return toshiba_nand_benand_eccstatus(chip);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_toshiba.c:58:8: note: Calling 'toshiba_nand_be=
nand_read_eccstatus_op'
           ret =3D toshiba_nand_benand_read_eccstatus_op(chip, ecc_status);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_toshiba.c:34:2: note: Taking true branch
           if (nand_has_exec_op(chip)) {
           ^
   drivers/mtd/nand/raw/nand_toshiba.c:39:9: note: '?' condition is true
                                       PSEC_TO_NSEC(sdr->tADL_min)),
                                       ^
   include/linux/mtd/rawnand.h:769:25: note: expanded from macro 'PSEC_TO_N=
SEC'
   #define PSEC_TO_NSEC(x) __DIVIDE(x, 1000)
                           ^
   include/linux/mtd/rawnand.h:765:25: note: expanded from macro '__DIVIDE'
           (__typeof__(dividend))(sizeof(dividend) <=3D sizeof(unsigned lon=
g) ?      \
                                  ^
   drivers/mtd/nand/raw/nand_toshiba.c:44:10: note: Calling 'nand_exec_op'
                   return nand_exec_op(chip, &op);
                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/internals.h:136:2: note: Taking false branch
           if (!nand_has_exec_op(chip))
           ^
   drivers/mtd/nand/raw/internals.h:139:14: note: Assuming the condition is=
 false
           if (WARN_ON(op->cs >=3D nanddev_ntargets(&chip->base)))
                       ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/mtd/nand/raw/internals.h:139:2: note: Taking false branch
           if (WARN_ON(op->cs >=3D nanddev_ntargets(&chip->base)))
           ^
   drivers/mtd/nand/raw/internals.h:142:2: note: Returning value, which par=
ticipates in a condition later
           return chip->controller->ops->exec_op(chip, op, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_toshiba.c:44:10: note: Returning from 'nand_ex=
ec_op'
                   return nand_exec_op(chip, &op);
                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_toshiba.c:44:3: note: Returning without writin=
g to '*buf'
                   return nand_exec_op(chip, &op);
                   ^
   drivers/mtd/nand/raw/nand_toshiba.c:44:3: note: Returning value, which p=
articipates in a condition later
                   return nand_exec_op(chip, &op);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_toshiba.c:58:8: note: Returning from 'toshiba_=
nand_benand_read_eccstatus_op'
           ret =3D toshiba_nand_benand_read_eccstatus_op(chip, ecc_status);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_toshiba.c:59:6: note: Assuming 'ret' is 0
           if (!ret) {
               ^~~~
   drivers/mtd/nand/raw/nand_toshiba.c:59:2: note: Taking true branch
           if (!ret) {
           ^
   drivers/mtd/nand/raw/nand_toshiba.c:62:8: note: The value 0 is assigned =
to 'i'
                   for (i =3D 0; i < chip->ecc.steps; i++) {
                        ^~~~~
   drivers/mtd/nand/raw/nand_toshiba.c:62:15: note: Assuming 'i' is < field=
 'steps'
                   for (i =3D 0; i < chip->ecc.steps; i++) {
                               ^~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/nand_toshiba.c:62:3: note: Loop condition is true. =
 Entering loop body
                   for (i =3D 0; i < chip->ecc.steps; i++) {
                   ^
   drivers/mtd/nand/raw/nand_toshiba.c:63:29: note: The left operand of '&'=
 is a garbage value
                           bitflips =3D ecc_status[i] & TOSHIBA_NAND_ECC_ST=
ATUS_MASK;
                                      ~~~~~~~~~~~~~ ^
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
>> fs/jffs2/gc.c:222:4: warning: Dereference of null pointer [clang-analyze=
r-core.NullDereference]
                           sleep_on_spinunlock(&c->inocache_wq, &c->inocach=
e_lock);
                           ^
   fs/jffs2/os-linux.h:43:29: note: expanded from macro 'sleep_on_spinunloc=
k'
                   DECLARE_WAITQUEUE(__wait, current);             \
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name =3D __WAITQUEUE_INITIALIZER(name, t=
sk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITI=
ALIZER'
           .private        =3D tsk,                                        =
          \
                             ^~~
   fs/jffs2/gc.c:134:6: note: Assuming the condition is false
           if (mutex_lock_interruptible(&c->alloc_sem))
               ^
   include/linux/mutex.h:188:40: note: expanded from macro 'mutex_lock_inte=
rruptible'
   #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(l=
ock, 0)
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/jffs2/gc.c:134:2: note: Taking false branch
           if (mutex_lock_interruptible(&c->alloc_sem))
           ^
   fs/jffs2/gc.c:138:2: note: Loop condition is true.  Entering loop body
           for (;;) {
           ^
   fs/jffs2/gc.c:143:3: note: Calling 'spin_lock'
                   spin_lock(&c->erase_completion_lock);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:349:2: note: Value assigned to field 'unchecked=
_size', which participates in a condition later
           raw_spin_lock(&lock->rlock);
           ^
   include/linux/spinlock.h:215:29: note: expanded from macro 'raw_spin_loc=
k'
   #define raw_spin_lock(lock)     _raw_spin_lock(lock)
                                   ^~~~~~~~~~~~~~~~~~~~
   fs/jffs2/gc.c:143:3: note: Returning from 'spin_lock'
                   spin_lock(&c->erase_completion_lock);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/gc.c:144:7: note: Assuming field 'unchecked_size' is not equal =
to 0
                   if (!c->unchecked_size)
                       ^~~~~~~~~~~~~~~~~~
   fs/jffs2/gc.c:144:3: note: Taking false branch
                   if (!c->unchecked_size)
                   ^
   fs/jffs2/gc.c:148:8: note: 'xattr' is 0
                   if (!xattr)
                        ^~~~~
   fs/jffs2/gc.c:148:3: note: Taking true branch
                   if (!xattr)
                   ^
   fs/jffs2/gc.c:158:55: note: Assuming 'bucket' is < field 'inocache_hashs=
ize'
                   for (bucket =3D c->check_ino % c->inocache_hashsize ; bu=
cket < c->inocache_hashsize; bucket++) {
                                                                       ^~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/gc.c:158:3: note: Loop condition is true.  Entering loop body
                   for (bucket =3D c->check_ino % c->inocache_hashsize ; bu=
cket < c->inocache_hashsize; bucket++) {
                   ^
   fs/jffs2/gc.c:159:4: note: Loop condition is true.  Entering loop body
                           for (ic =3D c->inocache_list[bucket]; ic; ic =3D=
 ic->next) {
                           ^
   fs/jffs2/gc.c:160:9: note: Assuming 'want_ino' is <=3D field 'ino'
                                   if (ic->ino < want_ino)
                                       ^~~~~~~~~~~~~~~~~~
   fs/jffs2/gc.c:160:5: note: Taking false branch
                                   if (ic->ino < want_ino)
                                   ^
   fs/jffs2/gc.c:163:9: note: Assuming field 'state' is not equal to INO_ST=
ATE_CHECKEDABSENT
                                   if (ic->state !=3D INO_STATE_CHECKEDABSE=
NT &&
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/gc.c:163:9: note: Left side of '&&' is true
   fs/jffs2/gc.c:164:9: note: Assuming field 'state' is not equal to INO_ST=
ATE_PRESENT
                                       ic->state !=3D INO_STATE_PRESENT)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jffs2/gc.c:163:5: note: Taking true branch
                                   if (ic->state !=3D INO_STATE_CHECKEDABSE=
NT &&
                                   ^
   fs/jffs2/gc.c:165:6: note: Control jumps to line 189
                                           goto got_next; /* with inocache_=
lock held */
                                           ^
   fs/jffs2/gc.c:191:7: note: Assuming field 'pino_nlink' is not equal to 0
                   if (!ic->pino_nlink) {
                       ^~~~~~~~~~~~~~~
   fs/jffs2/gc.c:191:3: note: Taking false branch
                   if (!ic->pino_nlink) {
                   ^
   fs/jffs2/gc.c:198:3: note: Control jumps to 'case 5:'  at line 211
                   switch(ic->state) {
                   ^
   fs/jffs2/gc.c:215:4: note: 0 is < 1
                           jffs2_dbg(1, "Waiting for ino #%u to finish read=
ing\n",
                           ^
   fs/jffs2/debug.h:69:6: note: expanded from macro 'jffs2_dbg'
           if (CONFIG_JFFS2_FS_DEBUG >=3D level)     \
               ^~~~~~~~~~~~~~~~~~~~~
   ./include/generated/autoconf.h:413:31: note: expanded from macro 'CONFIG=
_JFFS2_FS_DEBUG'
   #define CONFIG_JFFS2_FS_DEBUG 0
                                 ^
   fs/jffs2/gc.c:215:4: note: Taking false branch
--
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:898:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&crxnfc, 0, sizeof(crxnfc));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:1064:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buffer, netdev_rss_key, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:1064:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(buffer, netdev_rss_key, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:1439:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&wol, 0, sizeof(struct ethtool_wolinfo));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:1439:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&wol, 0, sizeof(struct ethtool_wolinfo));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:1477:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&edata, 0, sizeof(struct ethtool_eee));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:1477:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&edata, 0, sizeof(struct ethtool_eee));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:1981:2: warning: Call to function 'vsnprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           vsnprintf(*data, ETH_GSTRING_LEN, fmt, args);
           ^~~~~~~~~
   net/ethtool/ioctl.c:1981:2: note: Call to function 'vsnprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'vsnprintf_s' in case of C11
           vsnprintf(*data, ETH_GSTRING_LEN, fmt, args);
           ^~~~~~~~~
>> net/ethtool/ioctl.c:2033:28: warning: Dereference of null pointer [clang=
-analyzer-core.NullDereference]
                   } while (!signal_pending(current) && (!id.data || i < co=
unt));
                                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   net/ethtool/ioctl.c:2737:6: note: Assuming 'dev' is non-null
           if (!dev)
               ^~~~
   net/ethtool/ioctl.c:2737:2: note: Taking false branch
           if (!dev)
           ^
   net/ethtool/ioctl.c:2740:6: note: Assuming 'ethcmd' is not equal to ETHT=
OOL_PERQUEUE
           if (ethcmd =3D=3D ETHTOOL_PERQUEUE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2740:2: note: Taking false branch
           if (ethcmd =3D=3D ETHTOOL_PERQUEUE) {
           ^
   net/ethtool/ioctl.c:2747:2: note: Control jumps to the 'default' case at=
 line 2785
           switch (sub_cmd) {
           ^
   net/ethtool/ioctl.c:2786:3: note: Taking false branch
                   if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
                   ^
   net/ethtool/ioctl.c:2790:6: note: Assuming field 'parent' is null
           if (dev->dev.parent)
               ^~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2790:2: note: Taking false branch
           if (dev->dev.parent)
           ^
   net/ethtool/ioctl.c:2793:6: note: Assuming the condition is false
           if (!netif_device_present(dev)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2793:2: note: Taking false branch
           if (!netif_device_present(dev)) {
           ^
   net/ethtool/ioctl.c:2798:6: note: Assuming field 'begin' is non-null
           if (dev->ethtool_ops->begin) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2798:2: note: Taking true branch
           if (dev->ethtool_ops->begin) {
           ^
   net/ethtool/ioctl.c:2800:7: note: Assuming 'rc' is >=3D 0
                   if (rc < 0)
                       ^~~~~~
   net/ethtool/ioctl.c:2800:3: note: Taking false branch
                   if (rc < 0)
                   ^
   net/ethtool/ioctl.c:2805:2: note: Control jumps to 'case 28:' @line 2=
876
           switch (ethcmd) {
           ^
   net/ethtool/ioctl.c:2877:8: note: Calling 'ethtool_phys_id'
                   rc =3D ethtool_phys_id(dev, useraddr);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:1996:6: note: Assuming field 'set_phys_id' is non-nu=
ll
           if (!ops->set_phys_id)
               ^~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:1996:2: note: Taking false branch
           if (!ops->set_phys_id)
           ^
   net/ethtool/ioctl.c:1999:6: note: 'busy' is false
           if (busy)
               ^~~~
   net/ethtool/ioctl.c:1999:2: note: Taking false branch
           if (busy)
           ^
   net/ethtool/ioctl.c:2002:6: note: Assuming the condition is false
           if (copy_from_user(&id, useraddr, sizeof(id)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2002:2: note: Taking false branch
           if (copy_from_user(&id, useraddr, sizeof(id)))
           ^
   net/ethtool/ioctl.c:2006:6: note: Assuming 'rc' is >=3D 0
           if (rc < 0)
               ^~~~~~
   net/ethtool/ioctl.c:2006:2: note: Taking false branch
           if (rc < 0)
           ^
   net/ethtool/ioctl.c:2016:6: note: Assuming 'rc' is not equal to 0
           if (rc =3D=3D 0) {
               ^~~~~~~
   net/ethtool/ioctl.c:2016:2: note: Taking false branch
           if (rc =3D=3D 0) {
           ^
   net/ethtool/ioctl.c:2028:9: note: '?' condition is false
                                       (i++ & 1) ? ETHTOOL_ID_OFF : ETHTOOL=
_ID_ON);
                                       ^
   net/ethtool/ioctl.c:2030:8: note: Assuming 'rc' is 0
                           if (rc)
                               ^~
   net/ethtool/ioctl.c:2030:4: note: Taking false branch
                           if (rc)
                           ^
   net/ethtool/ioctl.c:2033:28: note: Dereference of null pointer
                   } while (!signal_pending(current) && (!id.data || i < co=
unt));
                                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
--
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/lpt_commit.c:464:4: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(buf + offs, 0xff, alen - wlen);
                           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/lpt_commit.c:464:4: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                           memset(buf + offs, 0xff, alen - wlen);
                           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/lpt_commit.c:490:4: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(buf + offs, 0xff, alen - wlen);
                           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/lpt_commit.c:490:4: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                           memset(buf + offs, 0xff, alen - wlen);
                           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/lpt_commit.c:513:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf + offs, 0xff, alen - wlen);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/lpt_commit.c:513:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(buf + offs, 0xff, alen - wlen);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/lpt_commit.c:1243:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(c->ltab_cmt, c->ltab,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ubifs/lpt_commit.c:1243:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(c->ltab_cmt, c->ltab,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
>> fs/ubifs/lpt_commit.c:1847:44: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           pr_err("(pid %d) start dumping LEB %d\n", current->pid, lnum);
                                                     ^
   include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/ubifs/lpt_commit.c:1847:2: note: Loop condition is false.  Exiting lo=
op
           pr_err("(pid %d) start dumping LEB %d\n", current->pid, lnum);
           ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
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
   fs/ubifs/lpt_commit.c:1847:44: note: Dereference of null pointer
           pr_err("(pid %d) start dumping LEB %d\n", current->pid, lnum);
                                                     ^
   include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/ubifs/lpt_commit.c:1950:50: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           pr_err("(pid %d) start dumping all LPT LEBs\n", current->pid);
                                                           ^
   fs/ubifs/lpt_commit.c:1708:2: note: Taking false branch
           if (!dbg_is_chk_lprops(c))
           ^
   fs/ubifs/lpt_commit.c:1711:14: note: Assuming 'i' is >=3D field 'lpt_leb=
s'
           for (i =3D 0; i < c->lpt_lebs; i++) {
                       ^~~~~~~~~~~~~~~
   fs/ubifs/lpt_commit.c:1711:2: note: Loop condition is false. Execution c=
ontinues on line 1719
           for (i =3D 0; i < c->lpt_lebs; i++) {
           ^
   fs/ubifs/lpt_commit.c:1719:6: note: Assuming 'free' is < field 'lpt_sz'
           if (free < c->lpt_sz) {
               ^~~~~~~~~~~~~~~~
   fs/ubifs/lpt_commit.c:1719:2: note: Taking true branch
           if (free < c->lpt_sz) {
           ^
   fs/ubifs/lpt_commit.c:1723:3: note: Calling 'ubifs_dump_lpt_lebs'
                   ubifs_dump_lpt_lebs(c);
                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/lpt_commit.c:1950:2: note: Loop condition is false.  Exiting lo=
op
           pr_err("(pid %d) start dumping all LPT LEBs\n", current->pid);
           ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
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
   fs/ubifs/lpt_commit.c:1950:50: note: Dereference of null pointer
           pr_err("(pid %d) start dumping all LPT LEBs\n", current->pid);
                                                           ^
   include/linux/printk.h:489:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
--
                   ^
   fs/fuse/control.c:126:8: note: Returning from 'fuse_conn_limit_write'
           ret =3D fuse_conn_limit_write(file, buf, count, ppos, &val,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/control.c:128:6: note: Assuming 'ret' is > 0
           if (ret > 0) {
               ^~~~~~~
   fs/fuse/control.c:128:2: note: Taking true branch
           if (ret > 0) {
           ^
   fs/fuse/control.c:129:26: note: Calling 'fuse_ctl_file_conn_get'
                   struct fuse_conn *fc =3D fuse_ctl_file_conn_get(file);
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/control.c:28:6: note: Assuming 'fc' is non-null
           if (fc)
               ^~
   fs/fuse/control.c:28:2: note: Taking true branch
           if (fc)
           ^
   fs/fuse/control.c:31:2: note: Returning pointer (loaded from 'fc'), whic=
h participates in a condition later
           return fc;
           ^~~~~~~~~
   fs/fuse/control.c:129:26: note: Returning from 'fuse_ctl_file_conn_get'
                   struct fuse_conn *fc =3D fuse_ctl_file_conn_get(file);
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/control.c:130:7: note: Assuming 'fc' is non-null
                   if (fc) {
                       ^~
   fs/fuse/control.c:130:3: note: Taking true branch
                   if (fc) {
                   ^
   fs/fuse/control.c:132:23: note: Assigned value is garbage or undefined
                           fc->max_background =3D val;
                                              ^ ~~~
   fs/fuse/control.c:179:27: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
           fc->congestion_threshold =3D val;
                                    ^ ~~~
   fs/fuse/control.c:165:2: note: 'val' declared without an initial value
           unsigned val;
           ^~~~~~~~~~~~
   fs/fuse/control.c:169:8: note: Calling 'fuse_conn_limit_write'
           ret =3D fuse_conn_limit_write(file, buf, count, ppos, &val,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/control.c:84:6: note: Assuming the condition is false
           if (*ppos)
               ^~~~~
   fs/fuse/control.c:84:2: note: Taking false branch
           if (*ppos)
           ^
   fs/fuse/control.c:88:6: note: Assuming 'err' is not equal to 0
           if (err)
               ^~~
   fs/fuse/control.c:88:2: note: Taking true branch
           if (err)
           ^
   fs/fuse/control.c:89:3: note: Returning without writing to '*val'
                   return err;
                   ^
   fs/fuse/control.c:169:8: note: Returning from 'fuse_conn_limit_write'
           ret =3D fuse_conn_limit_write(file, buf, count, ppos, &val,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/control.c:171:6: note: Assuming 'ret' is > 0
           if (ret <=3D 0)
               ^~~~~~~~
   fs/fuse/control.c:171:2: note: Taking false branch
           if (ret <=3D 0)
           ^
   fs/fuse/control.c:173:7: note: Calling 'fuse_ctl_file_conn_get'
           fc =3D fuse_ctl_file_conn_get(file);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/control.c:28:6: note: Assuming 'fc' is non-null
           if (fc)
               ^~
   fs/fuse/control.c:28:2: note: Taking true branch
           if (fc)
           ^
   fs/fuse/control.c:31:2: note: Returning pointer (loaded from 'fc'), whic=
h participates in a condition later
           return fc;
           ^~~~~~~~~
   fs/fuse/control.c:173:7: note: Returning from 'fuse_ctl_file_conn_get'
           fc =3D fuse_ctl_file_conn_get(file);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/control.c:174:6: note: Assuming 'fc' is non-null
           if (!fc)
               ^~~
   fs/fuse/control.c:174:2: note: Taking false branch
           if (!fc)
           ^
   fs/fuse/control.c:179:27: note: Assigned value is garbage or undefined
           fc->congestion_threshold =3D val;
                                    ^ ~~~
   fs/fuse/control.c:266:2: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(name, "%u", fc->dev);
           ^~~~~~~
   fs/fuse/control.c:266:2: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           sprintf(name, "%u", fc->dev);
           ^~~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
>> drivers/mtd/ubi/attach.c:403:2: warning: Dereference of null pointer [cl=
ang-analyzer-core.NullDereference]
           ubi_assert(vol_id =3D=3D be32_to_cpu(vid_hdr->vol_id));
           ^
   drivers/mtd/ubi/debug.h:20:30: note: expanded from macro 'ubi_assert'
                          __func__, __LINE__, current->pid);               =
     \
                                              ^~~~~~~
   include/linux/printk.h:479:34: note: expanded from macro 'pr_crit'
           printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/mtd/ubi/attach.c:403:13: note: Assuming 'vol_id' is not equal to=
 field 'vol_id'
           ubi_assert(vol_id =3D=3D be32_to_cpu(vid_hdr->vol_id));
                      ^
   drivers/mtd/ubi/debug.h:18:17: note: expanded from macro 'ubi_assert'
           if (unlikely(!(expr))) {                                        =
     \
               ~~~~~~~~~~~^~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   drivers/mtd/ubi/attach.c:403:13: note: 'vol_id' is not equal to field 'v=
ol_id'
           ubi_assert(vol_id =3D=3D be32_to_cpu(vid_hdr->vol_id));
                      ^
   drivers/mtd/ubi/debug.h:18:17: note: expanded from macro 'ubi_assert'
           if (unlikely(!(expr))) {                                        =
     \
                          ^~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   drivers/mtd/ubi/attach.c:403:2: note: Taking true branch
           ubi_assert(vol_id =3D=3D be32_to_cpu(vid_hdr->vol_id));
           ^
   drivers/mtd/ubi/debug.h:18:2: note: expanded from macro 'ubi_assert'
           if (unlikely(!(expr))) {                                        =
     \
           ^
   drivers/mtd/ubi/attach.c:403:2: note: Loop condition is false.  Exiting =
loop
           ubi_assert(vol_id =3D=3D be32_to_cpu(vid_hdr->vol_id));
           ^
   drivers/mtd/ubi/debug.h:19:3: note: expanded from macro 'ubi_assert'
                   pr_crit("UBI assert failed in %s at %u (pid %d)\n",     =
     \
                   ^
   include/linux/printk.h:479:2: note: expanded from macro 'pr_crit'
           printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
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
   drivers/mtd/ubi/attach.c:403:2: note: Dereference of null pointer
           ubi_assert(vol_id =3D=3D be32_to_cpu(vid_hdr->vol_id));
           ^
   drivers/mtd/ubi/debug.h:20:30: note: expanded from macro 'ubi_assert'
                          __func__, __LINE__, current->pid);               =
     \
                                              ^~~~~~~
   include/linux/printk.h:479:34: note: expanded from macro 'pr_crit'
           printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/mtd/ubi/attach.c:878:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ubi->peb_buf, 0x00, ubi->leb_size);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
--
                   for (rt =3D rcu_dereference_bh(dn_rt_hash_table[hash].ch=
ain); rt;
                             ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *local =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:352:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:340:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:324:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/decnet/dn_route.c:1250:13: note: Left side of '&&' is false
                   for (rt =3D rcu_dereference_bh(dn_rt_hash_table[hash].ch=
ain); rt;
                             ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:347:48: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   net/decnet/dn_route.c:1250:13: note: Loop condition is false.  Exiting l=
oop
                   for (rt =3D rcu_dereference_bh(dn_rt_hash_table[hash].ch=
ain); rt;
                             ^
   include/linux/rcupdate.h:611:31: note: expanded from macro 'rcu_derefere=
nce_bh'
   #define rcu_dereference_bh(p) rcu_dereference_bh_check(p, 0)
                                 ^
   include/linux/rcupdate.h:547:2: note: expanded from macro 'rcu_dereferen=
ce_bh_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:347:32: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   net/decnet/dn_route.c:1250:3: note: Loop condition is false. Execution c=
ontinues on line 1263
                   for (rt =3D rcu_dereference_bh(dn_rt_hash_table[hash].ch=
ain); rt;
                   ^
   net/decnet/dn_route.c:1273:8: note: Returning from '__dn_route_output_ke=
y'
           err =3D __dn_route_output_key(pprt, flp, flags);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/decnet/dn_route.c:1274:6: note: Assuming 'err' is equal to 0
           if (err =3D=3D 0 && flp->flowidn_proto) {
               ^~~~~~~~
   net/decnet/dn_route.c:1274:6: note: Left side of '&&' is true
   net/decnet/dn_route.c:1274:23: note: Field 'flowic_proto' is 2
           if (err =3D=3D 0 && flp->flowidn_proto) {
                                ^
   include/net/flow.h:165:36: note: expanded from macro 'flowidn_proto'
   #define flowidn_proto           __fl_common.flowic_proto
                                               ^
   net/decnet/dn_route.c:1274:2: note: Taking true branch
           if (err =3D=3D 0 && flp->flowidn_proto) {
           ^
   net/decnet/dn_route.c:1277:3: note: Taking true branch
                   if (IS_ERR(*pprt)) {
                   ^
   net/decnet/dn_route.c:1279:4: note: Null pointer value stored to 'rt'
                           *pprt =3D NULL;
                           ^~~~~~~~~~~~
   net/decnet/dn_route.c:1282:2: note: Returning value (loaded from 'err'),=
 which participates in a condition later
           return err;
           ^~~~~~~~~~
   net/decnet/dn_route.c:1694:9: note: Returning from 'dn_route_output_key'
                   err =3D dn_route_output_key((struct dst_entry **)&rt, &f=
ld, 0);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/decnet/dn_route.c:1698:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   net/decnet/dn_route.c:1698:2: note: Taking false branch
           if (err)
           ^
   net/decnet/dn_route.c:1701:6: note: Assuming the condition is true
           if (rtm->rtm_flags & RTM_F_NOTIFY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/decnet/dn_route.c:1701:2: note: Taking true branch
           if (rtm->rtm_flags & RTM_F_NOTIFY)
           ^
   net/decnet/dn_route.c:1702:16: note: Access to field 'rt_flags' results =
in a dereference of a null pointer (loaded from variable 'rt')
                   rt->rt_flags |=3D RTCF_NOTIFY;
                   ~~           ^
   Suppressed 102 warnings (90 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   133 warnings generated.
>> net/unix/unix_bpf.c:18:2: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           DEFINE_WAIT_FUNC(wait, woken_wake_function);
           ^
   include/linux/wait.h:1174:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   net/unix/unix_bpf.c:59:16: note: 'psock' is non-null
           if (unlikely(!psock))
                         ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   net/unix/unix_bpf.c:59:16: note: 'psock' is non-null
           if (unlikely(!psock))
                         ^
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   net/unix/unix_bpf.c:59:2: note: Taking false branch
           if (unlikely(!psock))
           ^
   net/unix/unix_bpf.c:63:6: note: Assuming the condition is false
           if (!skb_queue_empty(&sk->sk_receive_queue) &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/unix/unix_bpf.c:63:46: note: Left side of '&&' is false
           if (!skb_queue_empty(&sk->sk_receive_queue) &&
                                                       ^
   net/unix/unix_bpf.c:72:6: note: Assuming 'copied' is 0
           if (!copied) {
               ^~~~~~~
   net/unix/unix_bpf.c:72:2: note: Taking true branch
           if (!copied) {
           ^
   net/unix/unix_bpf.c:77:10: note: Calling 'unix_msg_wait_data'
                   data =3D unix_msg_wait_data(sk, psock, timeo);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/unix/unix_bpf.c:18:2: note: Dereference of null pointer
           DEFINE_WAIT_FUNC(wait, woken_wake_function);
           ^
   include/linux/wait.h:1174:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 132 warnings (120 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   115 warnings generated.
   include/linux/jhash.h:95:25: warning: The left operand of '<<' is a garb=
age value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           case 6:  b +=3D (u32)k[5]<<8;     fallthrough;
                                  ^
   net/batman-adv/translation-table.c:4200:7: note: Calling 'batadv_tt_glob=
al_hash_find'
           tt =3D batadv_tt_global_hash_find(bat_priv, addr, vid);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/batman-adv/translation-table.c:202:20: note: Calling 'batadv_tt_hash=
_find'
           tt_common_entry =3D batadv_tt_hash_find(bat_priv->tt.global_hash=
, addr,
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   net/batman-adv/translation-table.c:133:6: note: Assuming 'hash' is non-n=
ull
           if (!hash)
               ^~~~~
   net/batman-adv/translation-table.c:133:2: note: Taking false branch
           if (!hash)
           ^
   net/batman-adv/translation-table.c:136:2: note: Calling 'ether_addr_copy'
           ether_addr_copy(to_search.addr, addr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/batman-adv/translation-table.c:136:2: note: Returning from 'ether_ad=
dr_copy'
           ether_addr_copy(to_search.addr, addr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/batman-adv/translation-table.c:139:10: note: Calling 'batadv_choose_=
tt'
           index =3D batadv_choose_tt(&to_search, hash->size);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/batman-adv/translation-table.c:110:9: note: Calling 'jhash'
           hash =3D jhash(&tt->addr, ETH_ALEN, hash);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jhash.h:79:2: note: Loop condition is false. Execution con=
tinues on line 88
           while (length > 12) {
           ^
   include/linux/jhash.h:88:2: note: Control jumps to 'case 6:'  at line 95
           switch (length) {
           ^
   include/linux/jhash.h:95:25: note: The left operand of '<<' is a garbage=
 value
           case 6:  b +=3D (u32)k[5]<<8;     fallthrough;
                              ~~~~^
   net/batman-adv/main.h:358:2: warning: Dereference of null pointer [clang=
-analyzer-core.NullDereference]
           this_cpu_add(bat_priv->bat_counters[idx], count);

vim +306 kernel/trace/trace_syscalls.c

540b7b8d65575c Li Zefan                  2009-08-19  292  =

12ab74ee00d154 Steven Rostedt            2012-08-08  293  static void ftrac=
e_syscall_enter(void *data, struct pt_regs *regs, long id)
ee08c6eccb7d12 Frederic Weisbecker       2009-03-07  294  {
12ab74ee00d154 Steven Rostedt            2012-08-08  295  	struct trace_arr=
ay *tr =3D data;
7f1d2f8210195c Steven Rostedt (Red Hat   2015-05-05  296) 	struct trace_eve=
nt_file *trace_file;
bed1ffca022cc8 Frederic Weisbecker       2009-03-13  297  	struct syscall_t=
race_enter *entry;
bed1ffca022cc8 Frederic Weisbecker       2009-03-13  298  	struct syscall_m=
etadata *sys_data;
bed1ffca022cc8 Frederic Weisbecker       2009-03-13  299  	struct ring_buff=
er_event *event;
13292494379f92 Steven Rostedt (VMware    2019-12-13  300) 	struct trace_buf=
fer *buffer;
36590c50b2d072 Sebastian Andrzej Siewior 2021-01-25  301  	unsigned int tra=
ce_ctx;
d08e411397cb6f Steven Rostedt (Red Hat   2016-11-07  302) 	unsigned long ar=
gs[6];
ee08c6eccb7d12 Frederic Weisbecker       2009-03-07  303  	int syscall_nr;
f431b634f24d09 Steven Rostedt            2013-02-12  304  	int size;
ee08c6eccb7d12 Frederic Weisbecker       2009-03-07  305  =

f431b634f24d09 Steven Rostedt            2013-02-12 @306  	syscall_nr =3D t=
race_get_syscall_nr(current, regs);
086ba77a6db00e Rabin Vincent             2014-10-29  307  	if (syscall_nr <=
 0 || syscall_nr >=3D NR_syscalls)
cd0980fc8add25 Hendrik Brueckner         2009-08-25  308  		return;
d562aff93bfb53 Tom Zanussi               2013-10-24  309  =

d562aff93bfb53 Tom Zanussi               2013-10-24  310  	/* Here we're in=
side tp handler's rcu_read_lock_sched (__DO_TRACE) */
7f1d2f8210195c Steven Rostedt (Red Hat   2015-05-05  311) 	trace_file =3D r=
cu_dereference_sched(tr->enter_syscall_files[syscall_nr]);
7f1d2f8210195c Steven Rostedt (Red Hat   2015-05-05  312) 	if (!trace_file)
d562aff93bfb53 Tom Zanussi               2013-10-24  313  		return;
d562aff93bfb53 Tom Zanussi               2013-10-24  314  =

09a5059aa1a2cb Steven Rostedt (Red Hat   2015-05-13  315) 	if (trace_trigge=
r_soft_disabled(trace_file))
fb34a08c3469b2 Jason Baron               2009-08-10  316  		return;
ee08c6eccb7d12 Frederic Weisbecker       2009-03-07  317  =

bed1ffca022cc8 Frederic Weisbecker       2009-03-13  318  	sys_data =3D sys=
call_nr_to_meta(syscall_nr);
bed1ffca022cc8 Frederic Weisbecker       2009-03-13  319  	if (!sys_data)
bed1ffca022cc8 Frederic Weisbecker       2009-03-13  320  		return;
bed1ffca022cc8 Frederic Weisbecker       2009-03-13  321  =

bed1ffca022cc8 Frederic Weisbecker       2009-03-13  322  	size =3D sizeof(=
*entry) + sizeof(unsigned long) * sys_data->nb_args;
bed1ffca022cc8 Frederic Weisbecker       2009-03-13  323  =

36590c50b2d072 Sebastian Andrzej Siewior 2021-01-25  324  	trace_ctx =3D tr=
acing_gen_ctx();
11034ae9c20f40 zhangwei(Jovi             2013-04-10  325) =

3e2a56e6f63949 Steven Rostedt            2022-01-07  326  	event =3D trace_=
event_buffer_lock_reserve(&buffer, trace_file,
36590c50b2d072 Sebastian Andrzej Siewior 2021-01-25  327  			sys_data->ente=
r_event->event.type, size, trace_ctx);
bed1ffca022cc8 Frederic Weisbecker       2009-03-13  328  	if (!event)
bed1ffca022cc8 Frederic Weisbecker       2009-03-13  329  		return;
bed1ffca022cc8 Frederic Weisbecker       2009-03-13  330  =

bed1ffca022cc8 Frederic Weisbecker       2009-03-13  331  	entry =3D ring_b=
uffer_event_data(event);
bed1ffca022cc8 Frederic Weisbecker       2009-03-13  332  	entry->nr =3D sy=
scall_nr;
b35f549df1d752 Steven Rostedt (Red Hat   2016-11-07  333) 	syscall_get_argu=
ments(current, regs, args);
d08e411397cb6f Steven Rostedt (Red Hat   2016-11-07  334) 	memcpy(entry->ar=
gs, args, sizeof(unsigned long) * sys_data->nb_args);
bed1ffca022cc8 Frederic Weisbecker       2009-03-13  335  =

7f1d2f8210195c Steven Rostedt (Red Hat   2015-05-05  336) 	event_trigger_un=
lock_commit(trace_file, buffer, event, entry,
36590c50b2d072 Sebastian Andrzej Siewior 2021-01-25  337  				    trace_ctx=
);
ee08c6eccb7d12 Frederic Weisbecker       2009-03-07  338  }
ee08c6eccb7d12 Frederic Weisbecker       2009-03-07  339  =


:::::: The code at line 306 was first introduced by commit
:::::: f431b634f24d099872e78acc356c7fd35913b36b tracing/syscalls: Allow arc=
hs to ignore tracing compat syscalls

:::::: TO: Steven Rostedt <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2570113911572420010==--

