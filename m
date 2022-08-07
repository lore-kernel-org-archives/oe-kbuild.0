Content-Type: multipart/mixed; boundary="===============2631891421201632599=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/kallsyms.c:855:41: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Mon, 08 Aug 2022 00:21:10 +0800
Message-ID: <202208080056.PZ8Jd38I-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2631891421201632599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: kernel/ka=
llsyms.c:855:41: warning: Dereference of null pointer [clang-analyzer-core.=
NullDereference]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alan Maguire <alan.maguire@oracle.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1612c382ffbdf1f673caec76502b1c00e6d35363
commit: 647cafa22349026a8435030e9157074ab7fe5710 bpf: add a ksym BPF iterat=
or
date:   4 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 weeks ago
config: s390-randconfig-c005-20220804 (https://download.01.org/0day-ci/arch=
ive/20220808/202208080056.PZ8Jd38I-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42=
705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D647cafa22349026a8435030e9157074ab7fe5710
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 647cafa22349026a8435030e9157074ab7fe5710
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   kernel/dma/direct.c:383:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(ret, 0, size);
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
   Suppressed 60 warnings (48 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   kernel/gcov/clang.c:230:3: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(fn->counters, 0,
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
   kernel/gcov/clang.c:230:3: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                   memset(fn->counters, 0,
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
   kernel/gcov/clang.c:302:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(fn_dup->counters, fn->counters, cv_size);
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   kernel/gcov/clang.c:302:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(fn_dup->counters, fn->counters, cv_size);
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 51 warnings (45 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   119 warnings generated.
   kernel/kallsyms.c:458:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buffer, "0x%lx", address - symbol_offset);
                          ^~~~~~~
   kernel/kallsyms.c:458:10: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   return sprintf(buffer, "0x%lx", address - symbol_offset);
                          ^~~~~~~
   kernel/kallsyms.c:461:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(buffer, name);
                   ^~~~~~
   kernel/kallsyms.c:461:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(buffer, name);
                   ^~~~~~
   kernel/kallsyms.c:466:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(buffer + len, "+%#lx/%#lx", offset, siz=
e);
                          ^~~~~~~
   kernel/kallsyms.c:466:10: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   len +=3D sprintf(buffer + len, "+%#lx/%#lx", offset, siz=
e);
                          ^~~~~~~
   kernel/kallsyms.c:469:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
                   len +=3D sprintf(buffer + len, " [%s", modname);
                          ^~~~~~~
   kernel/kallsyms.c:469:10: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
                   len +=3D sprintf(buffer + len, " [%s", modname);
                          ^~~~~~~
   kernel/kallsyms.c:479:10: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(buffer + len, "]");
                          ^~~~~~~
   kernel/kallsyms.c:479:10: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
                   len +=3D sprintf(buffer + len, "]");
                          ^~~~~~~
>> kernel/kallsyms.c:855:41: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           iter->show_value =3D kallsyms_show_value(current_cred());
                                                  ^
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/rcupdate.h:595:31: note: expanded from macro 'rcu_derefere=
nce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:401:35: note: expanded from macro '__rcu_derefe=
rence_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   kernel/kallsyms.c:855:41: note: Left side of '&&' is false
           iter->show_value =3D kallsyms_show_value(current_cred());
                                                  ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:595:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:399:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:348:48: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   kernel/kallsyms.c:855:41: note: Loop condition is false.  Exiting loop
           iter->show_value =3D kallsyms_show_value(current_cred());
                                                  ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:595:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:399:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:348:32: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   kernel/kallsyms.c:855:41: note: Dereference of null pointer
           iter->show_value =3D kallsyms_show_value(current_cred());
                                                  ^
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/rcupdate.h:595:31: note: expanded from macro 'rcu_derefere=
nce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:401:35: note: expanded from macro '__rcu_derefe=
rence_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   Suppressed 113 warnings (100 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (49 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   include/linux/trace_events.h:161:17: warning: Dereference of null pointe=
r [clang-analyzer-core.NullDereference]
           entry->pid                      =3D current->pid;
                                             ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/trace/trace_events_inject.c:293:6: note: Assuming the condition i=
s false
           if (cnt >=3D PAGE_SIZE)
               ^~~~~~~~~~~~~~~~
   kernel/trace/trace_events_inject.c:293:2: note: Taking false branch
           if (cnt >=3D PAGE_SIZE)
           ^
   kernel/trace/trace_events_inject.c:297:2: note: Taking false branch
           if (IS_ERR(buf))
           ^
   kernel/trace/trace_events_inject.c:303:6: note: Assuming 'file' is non-n=
ull
           if (file) {
               ^~~~
   kernel/trace/trace_events_inject.c:303:2: note: Taking true branch
           if (file) {
           ^
   kernel/trace/trace_events_inject.c:305:10: note: Calling 'parse_entry'
                   size =3D parse_entry(buf, call, &entry);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_inject.c:206:6: note: Assuming 'entry' is non-=
null
           if (!entry)

vim +855 kernel/kallsyms.c

647cafa2234902 Alan Maguire 2022-07-12  845  =

647cafa2234902 Alan Maguire 2022-07-12  846  static int bpf_iter_ksym_init(=
void *priv_data, struct bpf_iter_aux_info *aux)
647cafa2234902 Alan Maguire 2022-07-12  847  {
647cafa2234902 Alan Maguire 2022-07-12  848  	struct kallsym_iter *iter =3D=
 priv_data;
647cafa2234902 Alan Maguire 2022-07-12  849  =

647cafa2234902 Alan Maguire 2022-07-12  850  	reset_iter(iter, 0);
647cafa2234902 Alan Maguire 2022-07-12  851  =

647cafa2234902 Alan Maguire 2022-07-12  852  	/* cache here as in kallsyms_=
open() case; use current process
647cafa2234902 Alan Maguire 2022-07-12  853  	 * credentials to tell BPF it=
erators if values should be shown.
647cafa2234902 Alan Maguire 2022-07-12  854  	 */
647cafa2234902 Alan Maguire 2022-07-12 @855  	iter->show_value =3D kallsyms=
_show_value(current_cred());
647cafa2234902 Alan Maguire 2022-07-12  856  =

647cafa2234902 Alan Maguire 2022-07-12  857  	return 0;
647cafa2234902 Alan Maguire 2022-07-12  858  }
647cafa2234902 Alan Maguire 2022-07-12  859  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2631891421201632599==--

