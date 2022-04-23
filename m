Content-Type: multipart/mixed; boundary="===============2759541410568281168=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC][PATCH] ptrace: Don't change __state
Date: Sat, 23 Apr 2022 19:43:04 +0800
Message-ID: <202204231931.zYt2oG4b-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2759541410568281168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <875yn3zdag.fsf_-_@email.froward.int.ebiederm.org>
References: <875yn3zdag.fsf_-_@email.froward.int.ebiederm.org>
TO: "Eric W. Biederman" <ebiederm@xmission.com>

Hi "Eric,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v5.18-rc3 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-W-Biederman/ptr=
ace-Don-t-change-__state/20220421-045703
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
b253435746d9a4a701b5f09211b9c14d3370d0da
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20220420 (https://download.01.org/0day-ci/archi=
ve/20220423/202204231931.zYt2oG4b-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd=
5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/7d3fafb75102c0e8d52=
82487c2822d0f3b301aa9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Eric-W-Biederman/ptrace-Don-t-chan=
ge-__state/20220421-045703
        git checkout 7d3fafb75102c0e8d5282487c2822d0f3b301aa9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~
   security/keys/request_key.c:165:2: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(keyring_str[1], "%d", prkey);
           ^~~~~~~
   security/keys/request_key.c:165:2: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           sprintf(keyring_str[1], "%d", prkey);
           ^~~~~~~
   security/keys/request_key.c:172:2: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(keyring_str[2], "%d", sskey);
           ^~~~~~~
   security/keys/request_key.c:172:2: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           sprintf(keyring_str[2], "%d", sskey);
           ^~~~~~~
   security/keys/request_key.c:510:3: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   security/keys/request_key.c:510:3: note: Value stored to 'ret' is never =
read
                   ret =3D 0;
                   ^     ~
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   kernel/panic.c:427:13: warning: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   s =3D buf + sprintf(buf, "Tainted: ");
                             ^~~~~~~
   kernel/panic.c:427:13: note: Call to function 'sprintf' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'sprintf_s' in case of C11
                   s =3D buf + sprintf(buf, "Tainted: ");
                             ^~~~~~~
   kernel/panic.c:435:3: warning: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(buf, sizeof(buf), "Not tainted");
                   ^~~~~~~~
   kernel/panic.c:435:3: note: Call to function 'snprintf' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'snprintf_s' in case of C11
                   snprintf(buf, sizeof(buf), "Not tainted");
                   ^~~~~~~~
   kernel/panic.c:654:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(__start_once, 0, __end_once - __start_once);
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
   kernel/panic.c:654:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(__start_once, 0, __end_once - __start_once);
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
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   kernel/cpu.c:2282:9: warning: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", st->state);
                  ^~~~~~~
   kernel/cpu.c:2282:9: note: Call to function 'sprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", st->state);
                  ^~~~~~~
   kernel/cpu.c:2330:9: warning: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", st->target);
                  ^~~~~~~
   kernel/cpu.c:2330:9: note: Call to function 'sprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", st->target);
                  ^~~~~~~
   kernel/cpu.c:2389:9: warning: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", st->fail);
                  ^~~~~~~
   kernel/cpu.c:2389:9: note: Call to function 'sprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", st->fail);
                  ^~~~~~~
   kernel/cpu.c:2418:10: warning: Call to function 'sprintf' is insecure as=
 it does not provide bounding of the memory buffer or security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'sprintf_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           cur =3D sprintf(buf, "%3d: %s\n", i, sp->name);
                                 ^~~~~~~
   kernel/cpu.c:2418:10: note: Call to function 'sprintf' is insecure as it=
 does not provide bounding of the memory buffer or security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11
                           cur =3D sprintf(buf, "%3d: %s\n", i, sp->name);
                                 ^~~~~~~
   kernel/cpu.c:2504:9: warning: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE - 2, "%s\n", state);
                  ^~~~~~~~
   kernel/cpu.c:2504:9: note: Call to function 'snprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE - 2, "%s\n", state);
                  ^~~~~~~~
   kernel/cpu.c:2517:9: warning: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE - 2, "%d\n", sched_smt_active());
                  ^~~~~~~~
   kernel/cpu.c:2517:9: note: Call to function 'snprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE - 2, "%d\n", sched_smt_active());
                  ^~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
>> kernel/ptrace.c:894:6: warning: Branch condition evaluates to a garbage =
value [clang-analyzer-core.uninitialized.Branch]
           if (need_siglock)
               ^
   kernel/ptrace.c:1054:2: note: Control jumps to 'case 7:'  at line 1233
           switch (request) {
           ^
   kernel/ptrace.c:1234:10: note: Calling 'ptrace_resume'
                   return ptrace_resume(child, request, data);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ptrace.c:852:2: note: 'need_siglock' declared without an initial =
value
           bool need_siglock;
           ^~~~~~~~~~~~~~~~~
   kernel/ptrace.c:854:2: note: Taking false branch
           if (!valid_signal(data))
           ^
   kernel/ptrace.c:857:6: note: 'request' is not equal to PTRACE_SYSCALL
           if (request =3D=3D PTRACE_SYSCALL)
               ^~~~~~~
   kernel/ptrace.c:857:2: note: Taking false branch
           if (request =3D=3D PTRACE_SYSCALL)
           ^
   kernel/ptrace.c:869:2: note: Taking false branch
           if (is_singleblock(request)) {
           ^
   kernel/ptrace.c:873:13: note: 'request' is not equal to 9
           } else if (is_singlestep(request) || is_sysemu_singlestep(reques=
t)) {
                      ^
   kernel/ptrace.c:832:34: note: expanded from macro 'is_singlestep'
   #define is_singlestep(request)          ((request) =3D=3D PTRACE_SINGLES=
TEP)
                                            ^~~~~~~~~
   kernel/ptrace.c:873:13: note: Left side of '||' is false
           } else if (is_singlestep(request) || is_sysemu_singlestep(reques=
t)) {
                      ^
   kernel/ptrace.c:832:33: note: expanded from macro 'is_singlestep'
   #define is_singlestep(request)          ((request) =3D=3D PTRACE_SINGLES=
TEP)
                                           ^
   kernel/ptrace.c:873:9: note: Taking false branch
           } else if (is_singlestep(request) || is_sysemu_singlestep(reques=
t)) {
                  ^
   kernel/ptrace.c:894:6: note: Branch condition evaluates to a garbage val=
ue
           if (need_siglock)
               ^~~~~~~~~~~~
   Suppressed 51 warnings (50 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   fs/jfs/jfs_metapage.c:671:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(mp->data, 0, PSIZE);
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
   fs/jfs/jfs_metapage.c:671:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(mp->data, 0, PSIZE);
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
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   fs/jfs/jfs_logmgr.c:433:4: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(dst, src, nbytes);
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
   fs/jfs/jfs_logmgr.c:433:4: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                           memcpy(dst, src, nbytes);
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'

vim +894 kernel/ptrace.c

36df29d7994180c Roland McGrath 2008-01-30  868  =

5b88abbf770a0e1 Roland McGrath 2008-01-30  869  	if (is_singleblock(request=
)) {
5b88abbf770a0e1 Roland McGrath 2008-01-30  870  		if (unlikely(!arch_has_bl=
ock_step()))
5b88abbf770a0e1 Roland McGrath 2008-01-30  871  			return -EIO;
5b88abbf770a0e1 Roland McGrath 2008-01-30  872  		user_enable_block_step(ch=
ild);
5b88abbf770a0e1 Roland McGrath 2008-01-30  873  	} else if (is_singlestep(r=
equest) || is_sysemu_singlestep(request)) {
36df29d7994180c Roland McGrath 2008-01-30  874  		if (unlikely(!arch_has_si=
ngle_step()))
36df29d7994180c Roland McGrath 2008-01-30  875  			return -EIO;
36df29d7994180c Roland McGrath 2008-01-30  876  		user_enable_single_step(c=
hild);
3a709703538c471 Roland McGrath 2009-04-07  877  	} else {
36df29d7994180c Roland McGrath 2008-01-30  878  		user_disable_single_step(=
child);
3a709703538c471 Roland McGrath 2009-04-07  879  	}
36df29d7994180c Roland McGrath 2008-01-30  880  =

b72c186999e689c Oleg Nesterov  2015-04-16  881  	/*
b72c186999e689c Oleg Nesterov  2015-04-16  882  	 * Change ->exit_code and =
->state under siglock to avoid the race
b72c186999e689c Oleg Nesterov  2015-04-16  883  	 * with wait_task_stopped(=
) in between; a non-zero ->exit_code will
b72c186999e689c Oleg Nesterov  2015-04-16  884  	 * wrongly look like anoth=
er report from tracee.
b72c186999e689c Oleg Nesterov  2015-04-16  885  	 *
b72c186999e689c Oleg Nesterov  2015-04-16  886  	 * Note that we need siglo=
ck even if ->exit_code =3D=3D data and/or this
b72c186999e689c Oleg Nesterov  2015-04-16  887  	 * status was not reported=
 yet, the new status must not be cleared by
b72c186999e689c Oleg Nesterov  2015-04-16  888  	 * wait_task_stopped() aft=
er resume.
b72c186999e689c Oleg Nesterov  2015-04-16  889  	 *
b72c186999e689c Oleg Nesterov  2015-04-16  890  	 * If data =3D=3D 0 we do =
not care if wait_task_stopped() reports the old
b72c186999e689c Oleg Nesterov  2015-04-16  891  	 * status and clears the c=
ode too; this can't race with the tracee, it
b72c186999e689c Oleg Nesterov  2015-04-16  892  	 * takes siglock after res=
ume.
b72c186999e689c Oleg Nesterov  2015-04-16  893  	 */
b72c186999e689c Oleg Nesterov  2015-04-16 @894  	if (need_siglock)
b72c186999e689c Oleg Nesterov  2015-04-16  895  		spin_lock_irq(&child->sig=
hand->siglock);
36df29d7994180c Roland McGrath 2008-01-30  896  	child->exit_code =3D data;
0666fb51b1483f2 Oleg Nesterov  2011-05-25  897  	wake_up_state(child, __TAS=
K_TRACED);
b72c186999e689c Oleg Nesterov  2015-04-16  898  	if (need_siglock)
b72c186999e689c Oleg Nesterov  2015-04-16  899  		spin_unlock_irq(&child->s=
ighand->siglock);
36df29d7994180c Roland McGrath 2008-01-30  900  =

36df29d7994180c Roland McGrath 2008-01-30  901  	return 0;
36df29d7994180c Roland McGrath 2008-01-30  902  }
36df29d7994180c Roland McGrath 2008-01-30  903  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2759541410568281168==--

