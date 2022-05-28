Content-Type: multipart/mixed; boundary="===============8767396557643950795=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: security/integrity/ima/ima_template_lib.c:310:17: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length ...
Date: Sat, 28 May 2022 17:14:41 +0800
Message-ID: <202205281708.fASu9JNB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8767396557643950795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mimi Zohar <zohar@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
commit: 989dc72511f7b57b94b42eabfcbe79d9070de6e3 ima: define a new template=
 field named 'd-ngv2' and templates
date:   3 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
528/202205281708.fASu9JNB-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f=
9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D989dc72511f7b57b94b42eabfcbe79d9070de6e3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 989dc72511f7b57b94b42eabfcbe79d9070de6e3
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^~~~~~~~~~~~~~~~
   security/lsm_audit.c:316:9: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                                       memcpy(comm, tsk->comm, sizeof(comm)=
));
                                       ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   security/lsm_audit.c:419:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&sbn_pfx.s6_addr, 0,
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   security/lsm_audit.c:419:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(&sbn_pfx.s6_addr, 0,
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   security/lsm_audit.c:421:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&sbn_pfx.s6_addr, &a->u.ibpkey->subnet_prefix,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   security/lsm_audit.c:421:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(&sbn_pfx.s6_addr, &a->u.ibpkey->subnet_prefix,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 87 warnings (87 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   ipc/ipc_sysctl.c:31:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ipc_table, table, sizeof(ipc_table));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   ipc/ipc_sysctl.c:31:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(&ipc_table, table, sizeof(ipc_table));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   ipc/ipc_sysctl.c:42:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ipc_table, table, sizeof(ipc_table));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   ipc/ipc_sysctl.c:42:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(&ipc_table, table, sizeof(ipc_table));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   ipc/ipc_sysctl.c:65:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ipc_table, table, sizeof(ipc_table));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   ipc/ipc_sysctl.c:65:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(&ipc_table, table, sizeof(ipc_table));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   ipc/ipc_sysctl.c:78:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ipc_table, table, sizeof(ipc_table));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   ipc/ipc_sysctl.c:78:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(&ipc_table, table, sizeof(ipc_table));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   security/integrity/ima/ima_template_lib.c:57:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, data, datalen);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   security/integrity/ima/ima_template_lib.c:57:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, data, datalen);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
>> security/integrity/ima/ima_template_lib.c:310:17: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
                   offset +=3D 1 + sprintf(buffer, "%s:%s:",
                                 ^~~~~~~
   security/integrity/ima/ima_template_lib.c:310:17: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
                   offset +=3D 1 + sprintf(buffer, "%s:%s:",
                                 ^~~~~~~
   security/integrity/ima/ima_template_lib.c:315:17: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
                   offset +=3D 1 + sprintf(buffer, "%s:",
                                 ^~~~~~~
   security/integrity/ima/ima_template_lib.c:315:17: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
                   offset +=3D 1 + sprintf(buffer, "%s:",
                                 ^~~~~~~
   security/integrity/ima/ima_template_lib.c:320:3: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer + offset, digest, digestsize);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   security/integrity/ima/ima_template_lib.c:320:3: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer + offset, digest, digestsize);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   security/integrity/ima/ima_template_lib.c:345:2: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&hash, 0, sizeof(hash));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   security/integrity/ima/ima_template_lib.c:345:2: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
           memset(&hash, 0, sizeof(hash));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   security/integrity/ima/ima_template_lib.c:366:5: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(&hash, 0, sizeof(hash));
                                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   security/integrity/ima/ima_template_lib.c:366:5: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
                                   memset(&hash, 0, sizeof(hash));
                                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   mm/gup.c:650:2: warning: Value stored to 'page' is never read [clang-ana=
lyzer-deadcode.DeadStores]
           page =3D follow_trans_huge_pmd(vma, address, pmd, flags);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:650:2: note: Value stored to 'page' is never read
           page =3D follow_trans_huge_pmd(vma, address, pmd, flags);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   arch/x86/kernel/tls.c:98:4: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(desc, 0, sizeof(*desc));
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   arch/x86/kernel/tls.c:98:4: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                           memset(desc, 0, sizeof(*desc));
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   arch/x86/kernel/tls.c:199:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(info, 0, sizeof(*info));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   arch/x86/kernel/tls.c:199:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(info, 0, sizeof(*info));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +310 security/integrity/ima/ima_template_lib.c

b17fd9ecf854e8 Roberto Sassu         2017-05-16  286  =

3878d505aa718b Thiago Jung Bauermann 2019-06-27  287  static int ima_eventd=
igest_init_common(const u8 *digest, u32 digestsize,
989dc72511f7b5 Mimi Zohar            2021-12-23  288  				       u8 digest_=
type, u8 hash_algo,
dcf4e392867bf9 Roberto Sassu         2013-11-08  289  				       struct ima=
_field_data *field_data)
4d7aeee73f5304 Roberto Sassu         2013-06-07  290  {
3ce1217d6cd5df Roberto Sassu         2013-06-07  291  	/*
4d7aeee73f5304 Roberto Sassu         2013-06-07  292  	 * digest formats:
4d7aeee73f5304 Roberto Sassu         2013-06-07  293  	 *  - DATA_FMT_DIGES=
T: digest
644664627d2164 Mimi Zohar            2022-04-14  294  	 *  - DATA_FMT_DIGES=
T_WITH_ALGO: <hash algo> + ':' + '\0' + digest,
989dc72511f7b5 Mimi Zohar            2021-12-23  295  	 *  - DATA_FMT_DIGES=
T_WITH_TYPE_AND_ALGO:
989dc72511f7b5 Mimi Zohar            2021-12-23  296  	 *	<digest type> + '=
:' + <hash algo> + ':' + '\0' + digest,
644664627d2164 Mimi Zohar            2022-04-14  297  	 *
644664627d2164 Mimi Zohar            2022-04-14  298  	 *    where 'DATA_FM=
T_DIGEST' is the original digest format ('d')
644664627d2164 Mimi Zohar            2022-04-14  299  	 *      with a hash =
size limitation of 20 bytes,
989dc72511f7b5 Mimi Zohar            2021-12-23  300  	 *    where <digest =
type> is "ima",
644664627d2164 Mimi Zohar            2022-04-14  301  	 *    where <hash al=
go> is the hash_algo_name[] string.
4d7aeee73f5304 Roberto Sassu         2013-06-07  302  	 */
989dc72511f7b5 Mimi Zohar            2021-12-23  303  	u8 buffer[DIGEST_TYP=
E_NAME_LEN_MAX + CRYPTO_MAX_ALG_NAME + 2 +
989dc72511f7b5 Mimi Zohar            2021-12-23  304  		IMA_MAX_DIGEST_SIZE=
] =3D { 0 };
4d7aeee73f5304 Roberto Sassu         2013-06-07  305  	enum data_formats fm=
t =3D DATA_FMT_DIGEST;
4d7aeee73f5304 Roberto Sassu         2013-06-07  306  	u32 offset =3D 0;
4d7aeee73f5304 Roberto Sassu         2013-06-07  307  =

989dc72511f7b5 Mimi Zohar            2021-12-23  308  	if (digest_type < DI=
GEST_TYPE__LAST && hash_algo < HASH_ALGO__LAST) {
989dc72511f7b5 Mimi Zohar            2021-12-23  309  		fmt =3D DATA_FMT_DI=
GEST_WITH_TYPE_AND_ALGO;
989dc72511f7b5 Mimi Zohar            2021-12-23 @310  		offset +=3D 1 + spr=
intf(buffer, "%s:%s:",
989dc72511f7b5 Mimi Zohar            2021-12-23  311  				      digest_type=
_name[digest_type],
989dc72511f7b5 Mimi Zohar            2021-12-23  312  				      hash_algo_n=
ame[hash_algo]);
989dc72511f7b5 Mimi Zohar            2021-12-23  313  	} else if (hash_algo=
 < HASH_ALGO__LAST) {
4d7aeee73f5304 Roberto Sassu         2013-06-07  314  		fmt =3D DATA_FMT_DI=
GEST_WITH_ALGO;
989dc72511f7b5 Mimi Zohar            2021-12-23  315  		offset +=3D 1 + spr=
intf(buffer, "%s:",
dcf4e392867bf9 Roberto Sassu         2013-11-08  316  				      hash_algo_n=
ame[hash_algo]);
4d7aeee73f5304 Roberto Sassu         2013-06-07  317  	}
4d7aeee73f5304 Roberto Sassu         2013-06-07  318  =

4d7aeee73f5304 Roberto Sassu         2013-06-07  319  	if (digest)
4d7aeee73f5304 Roberto Sassu         2013-06-07  320  		memcpy(buffer + off=
set, digest, digestsize);
4d7aeee73f5304 Roberto Sassu         2013-06-07  321  	else
4d7aeee73f5304 Roberto Sassu         2013-06-07  322  		/*
4d7aeee73f5304 Roberto Sassu         2013-06-07  323  		 * If digest is NUL=
L, the event being recorded is a violation.
4d7aeee73f5304 Roberto Sassu         2013-06-07  324  		 * Make room for th=
e digest by increasing the offset of
4d7aeee73f5304 Roberto Sassu         2013-06-07  325  		 * IMA_DIGEST_SIZE.
4d7aeee73f5304 Roberto Sassu         2013-06-07  326  		 */
4d7aeee73f5304 Roberto Sassu         2013-06-07  327  		offset +=3D IMA_DIG=
EST_SIZE;
4d7aeee73f5304 Roberto Sassu         2013-06-07  328  =

4d7aeee73f5304 Roberto Sassu         2013-06-07  329  	return ima_write_tem=
plate_field_data(buffer, offset + digestsize,
4d7aeee73f5304 Roberto Sassu         2013-06-07  330  					     fmt, field_=
data);
4d7aeee73f5304 Roberto Sassu         2013-06-07  331  }
4d7aeee73f5304 Roberto Sassu         2013-06-07  332  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8767396557643950795==--

