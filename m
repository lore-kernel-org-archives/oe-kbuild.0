Content-Type: multipart/mixed; boundary="===============4328673266926401669=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [zohar-integrity:next-integrity.fsverity-v9 6/9] security/integrity/ima/ima_template_lib.c:310:17: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length ...
Date: Fri, 06 May 2022 23:10:45 +0800
Message-ID: <202205062329.JzTTLp3Z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4328673266926401669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-integrity(a)vger.kernel.org
TO: Mimi Zohar <zohar@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integri=
ty.git next-integrity.fsverity-v9
head:   79c13fb366f892e266037bc7ddcd6d51f90d1189
commit: 989dc72511f7b57b94b42eabfcbe79d9070de6e3 [6/9] ima: define a new te=
mplate field named 'd-ngv2' and templates
:::::: branch date: 17 hours ago
:::::: commit date: 23 hours ago
config: arm-randconfig-c002-20220505 (https://download.01.org/0day-ci/archi=
ve/20220506/202205062329.JzTTLp3Z-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integ=
rity.git/commit/?id=3D989dc72511f7b57b94b42eabfcbe79d9070de6e3
        git remote add zohar-integrity https://git.kernel.org/pub/scm/linux=
/kernel/git/zohar/linux-integrity.git
        git fetch --no-tags zohar-integrity next-integrity.fsverity-v9
        git checkout 989dc72511f7b57b94b42eabfcbe79d9070de6e3
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/quota/quota_v2.c:287:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&empty, 0, sizeof(struct v2r1_disk_dqblk));
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
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   security/keys/user_defined.c:75:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(upayload->data, prep->data, datalen);
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
   security/keys/user_defined.c:75:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(upayload->data, prep->data, datalen);
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
   security/keys/user_defined.c:184:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer, upayload->data, buflen);
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
   security/keys/user_defined.c:184:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer, upayload->data, buflen);
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
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   security/integrity/ima/ima_template_lib.c:57:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, data, datalen);
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
   security/integrity/ima/ima_template_lib.c:57:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, data, datalen);
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
   security/integrity/ima/ima_template_lib.c:320:3: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer + offset, digest, digestsize);
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
   security/integrity/ima/ima_template_lib.c:345:2: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&hash, 0, sizeof(hash));
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
   security/integrity/ima/ima_template_lib.c:345:2: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
           memset(&hash, 0, sizeof(hash));
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
   security/integrity/ima/ima_template_lib.c:366:5: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(&hash, 0, sizeof(hash));
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
   security/integrity/ima/ima_template_lib.c:366:5: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
                                   memset(&hash, 0, sizeof(hash));
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
   Suppressed 52 warnings (51 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   crypto/aead.c:36:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(alignbuffer, key, keylen);
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
--===============4328673266926401669==--

