Content-Type: multipart/mixed; boundary="===============2956835745554003063=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/kunit/executor.c:80:10: warning: Potential leak of memory pointed to by 'copy' [clang-analyzer-unix.Malloc]
Date: Tue, 12 Jul 2022 08:23:42 +0800
Message-ID: <202207120840.9F6TBqZD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2956835745554003063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: lib/kunit=
/executor.c:80:10: warning: Potential leak of memory pointed to by 'copy' [=
clang-analyzer-unix.Malloc]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Latypov <dlatypov@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Brendan Higgins <brendanhiggins@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5a29232d870d9e63fe5ff30b081be6ea7cc2465d
commit: a02353f491622e49c7ddedc6a6dc4f1d6ed2150a kunit: bail out of test fi=
ltering logic quicker if OOM
date:   9 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 weeks ago
config: riscv-randconfig-c006-20220707 (https://download.01.org/0day-ci/arc=
hive/20220712/202207120840.9F6TBqZD-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 77a38f=
6839980bfac61babb40d83772c51427011)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da02353f491622e49c7ddedc6a6dc4f1d6ed2150a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a02353f491622e49c7ddedc6a6dc4f1d6ed2150a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   crypto/gcm.c:946:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(iv + 4, req->iv, 8);
           ^~~~~~
   crypto/gcm.c:1078:6: warning: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   crypto/gcm.c:1078:6: note: Call to function 'snprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   crypto/gcm.c:1081:6: warning: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
               snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   crypto/gcm.c:1081:6: note: Call to function 'snprintf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'snprintf_s' in case of C11
               snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   lib/kunit/string-stream.c:85:8: warning: Call to function 'vsnprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D vsnprintf(NULL, 0, fmt, args_for_counting) + 1;
                 ^~~~~~~~~
   lib/kunit/string-stream.c:85:8: note: Call to function 'vsnprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'vsnprintf_s' in case of C11
           len =3D vsnprintf(NULL, 0, fmt, args_for_counting) + 1;
                 ^~~~~~~~~
   lib/kunit/string-stream.c:95:8: warning: Call to function 'vsnprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D vsnprintf(frag_container->fragment, len, fmt, args);
                 ^~~~~~~~~
   lib/kunit/string-stream.c:95:8: note: Call to function 'vsnprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'vsnprintf_s' in case of C11
           len =3D vsnprintf(frag_container->fragment, len, fmt, args);
                 ^~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   lib/kunit/assert.c:99:8: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D snprintf(NULL, 0, "%lld", value);
                 ^~~~~~~~
   lib/kunit/assert.c:99:8: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
           len =3D snprintf(NULL, 0, "%lld", value);
                 ^~~~~~~~
   lib/kunit/assert.c:107:2: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buffer, len+1, "%lld", value);
           ^~~~~~~~
   lib/kunit/assert.c:107:2: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
           snprintf(buffer, len+1, "%lld", value);
           ^~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   lib/kunit/executor.c:45:3: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(parsed->suite_glob, filter_glob);
                   ^~~~~~
   lib/kunit/executor.c:45:3: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
                   strcpy(parsed->suite_glob, filter_glob);
                   ^~~~~~
   lib/kunit/executor.c:52:2: warning: Call to function 'strncpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(parsed->suite_glob, filter_glob, period - filter_glob);
           ^~~~~~~
   lib/kunit/executor.c:52:2: note: Call to function 'strncpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'strncpy_s' in case of C11
           strncpy(parsed->suite_glob, filter_glob, period - filter_glob);
           ^~~~~~~
   lib/kunit/executor.c:53:2: warning: Call to function 'strncpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(parsed->test_glob, period + 1, len - (period - filter_gl=
ob));
           ^~~~~~~
   lib/kunit/executor.c:53:2: note: Call to function 'strncpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'strncpy_s' in case of C11
           strncpy(parsed->test_glob, period + 1, len - (period - filter_gl=
ob));
           ^~~~~~~
   lib/kunit/executor.c:76:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(copy, suite, sizeof(*copy));
           ^~~~~~
   lib/kunit/executor.c:76:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(copy, suite, sizeof(*copy));
           ^~~~~~
>> lib/kunit/executor.c:80:10: warning: Potential leak of memory pointed to=
 by 'copy' [clang-analyzer-unix.Malloc]
                   return ERR_PTR(-ENOMEM);
                          ^
   lib/kunit/executor.c:252:2: note: Assuming 'filter_glob_param' is non-nu=
ll
           if (filter_glob_param) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   lib/kunit/executor.c:252:2: note: '?' condition is false
           if (filter_glob_param) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   lib/kunit/executor.c:252:6: note: 'filter_glob_param' is non-null
           if (filter_glob_param) {
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
   lib/kunit/executor.c:252:2: note: '?' condition is true
           if (filter_glob_param) {
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
   lib/kunit/executor.c:252:2: note: Taking true branch
           if (filter_glob_param) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/kunit/executor.c:253:15: note: Calling 'kunit_filter_suites'
                   suite_set =3D kunit_filter_suites(&suite_set, filter_glo=
b_param, &err);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   lib/kunit/executor.c:167:6: note: Assuming 'copy' is non-null
           if (!copy) { /* won't be able to run anything, return an empty s=
et */
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   lib/kunit/executor.c:167:2: note: '?' condition is false
           if (!copy) { /* won't be able to run anything, return an empty s=
et */
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   lib/kunit/executor.c:167:7: note: 'copy' is non-null
           if (!copy) { /* won't be able to run anything, return an empty s=
et */
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
   lib/kunit/executor.c:167:2: note: '?' condition is false
           if (!copy) { /* won't be able to run anything, return an empty s=
et */
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
   lib/kunit/executor.c:167:2: note: Taking false branch
           if (!copy) { /* won't be able to run anything, return an empty s=
et */
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +/copy +80 lib/kunit/executor.c

a127b154a8f231 Daniel Latypov 2021-09-14  55  =

a127b154a8f231 Daniel Latypov 2021-09-14  56  /* Create a copy of suite wit=
h only tests that match test_glob. */
a127b154a8f231 Daniel Latypov 2021-09-14  57  static struct kunit_suite *
a127b154a8f231 Daniel Latypov 2021-09-14  58  kunit_filter_tests(struct kun=
it_suite *const suite, const char *test_glob)
a127b154a8f231 Daniel Latypov 2021-09-14  59  {
a127b154a8f231 Daniel Latypov 2021-09-14  60  	int n =3D 0;
a127b154a8f231 Daniel Latypov 2021-09-14  61  	struct kunit_case *filtered,=
 *test_case;
a127b154a8f231 Daniel Latypov 2021-09-14  62  	struct kunit_suite *copy;
a127b154a8f231 Daniel Latypov 2021-09-14  63  =

a127b154a8f231 Daniel Latypov 2021-09-14  64  	kunit_suite_for_each_test_ca=
se(suite, test_case) {
a127b154a8f231 Daniel Latypov 2021-09-14  65  		if (!test_glob || glob_matc=
h(test_glob, test_case->name))
a127b154a8f231 Daniel Latypov 2021-09-14  66  			++n;
a127b154a8f231 Daniel Latypov 2021-09-14  67  	}
a127b154a8f231 Daniel Latypov 2021-09-14  68  =

a127b154a8f231 Daniel Latypov 2021-09-14  69  	if (n =3D=3D 0)
a127b154a8f231 Daniel Latypov 2021-09-14  70  		return NULL;
a127b154a8f231 Daniel Latypov 2021-09-14  71  =

a127b154a8f231 Daniel Latypov 2021-09-14  72  	/* Use memcpy to workaround =
copy->name being const. */
a127b154a8f231 Daniel Latypov 2021-09-14  73  	copy =3D kmalloc(sizeof(*cop=
y), GFP_KERNEL);
a02353f491622e Daniel Latypov 2022-05-11  74  	if (!copy)
a02353f491622e Daniel Latypov 2022-05-11  75  		return ERR_PTR(-ENOMEM);
a127b154a8f231 Daniel Latypov 2021-09-14  76  	memcpy(copy, suite, sizeof(*=
copy));
a127b154a8f231 Daniel Latypov 2021-09-14  77  =

a127b154a8f231 Daniel Latypov 2021-09-14  78  	filtered =3D kcalloc(n + 1, =
sizeof(*filtered), GFP_KERNEL);
a02353f491622e Daniel Latypov 2022-05-11  79  	if (!filtered)
a02353f491622e Daniel Latypov 2022-05-11 @80  		return ERR_PTR(-ENOMEM);
a127b154a8f231 Daniel Latypov 2021-09-14  81  =

a127b154a8f231 Daniel Latypov 2021-09-14  82  	n =3D 0;
a127b154a8f231 Daniel Latypov 2021-09-14  83  	kunit_suite_for_each_test_ca=
se(suite, test_case) {
a127b154a8f231 Daniel Latypov 2021-09-14  84  		if (!test_glob || glob_matc=
h(test_glob, test_case->name))
a127b154a8f231 Daniel Latypov 2021-09-14  85  			filtered[n++] =3D *test_ca=
se;
a127b154a8f231 Daniel Latypov 2021-09-14  86  	}
a127b154a8f231 Daniel Latypov 2021-09-14  87  =

a127b154a8f231 Daniel Latypov 2021-09-14  88  	copy->test_cases =3D filtere=
d;
a127b154a8f231 Daniel Latypov 2021-09-14  89  	return copy;
a127b154a8f231 Daniel Latypov 2021-09-14  90  }
5d31f71efcb6bc Daniel Latypov 2021-02-05  91  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2956835745554003063==--

