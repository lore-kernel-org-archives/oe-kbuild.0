Content-Type: multipart/mixed; boundary="===============5239673163405148662=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: security/lockdown/lockdown.c:103:15: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or ...
Date: Fri, 06 May 2022 09:54:35 +0800
Message-ID: <202205060918.Wd1VwGQc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5239673163405148662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0f5d752b1395e777ef81e28886945e5e939b7c8a
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   8 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-c002-20220505 (https://download.01.org/0day-ci/archi=
ve/20220506/202205060918.Wd1VwGQc-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   kernel/sched/core.c:7652:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(attr, 0, sizeof(*attr));
           ^~~~~~
   kernel/sched/core.c:7652:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(attr, 0, sizeof(*attr));
           ^~~~~~
   kernel/sched/core.c:9330:3: warning: Value stored to 'ptr' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   ptr +=3D nr_cpu_ids * sizeof(void **);
                   ^
   kernel/sched/core.c:9330:3: note: Value stored to 'ptr' is never read
   kernel/sched/core.c:10760:6: warning: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%20s %llu", tok, periodp) < 1)
               ^~~~~~
   kernel/sched/core.c:10760:6: note: Call to function 'sscanf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%20s %llu", tok, periodp) < 1)
               ^~~~~~
   kernel/sched/core.c:10765:6: warning: Call to function 'sscanf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(tok, "%llu", quotap))
               ^~~~~~
   kernel/sched/core.c:10765:6: note: Call to function 'sscanf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sscanf_s' in case of C11
           if (sscanf(tok, "%llu", quotap))
               ^~~~~~
   Suppressed 66 warnings (60 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (61 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (61 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   crypto/dh.c:28:2: warning: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI=
.DeprecatedOrUnsafeBufferHandling]
           memset(ctx, 0, sizeof(*ctx));
           ^~~~~~
   crypto/dh.c:28:2: note: Call to function 'memset' is insecure as it does=
 not provide security checks introduced in the C11 standard. Replace with a=
nalogous functions that support length arguments or provides boundary check=
s such as 'memset_s' in case of C11
           memset(ctx, 0, sizeof(*ctx));
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   crypto/dh_helper.c:19:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, src, size);
           ^~~~~~
   crypto/dh_helper.c:19:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(dst, src, size);
           ^~~~~~
   crypto/dh_helper.c:25:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, src, size);
           ^~~~~~
   crypto/dh_helper.c:25:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(dst, src, size);
           ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   crypto/rsa-pkcs1pad.c:411:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(req_ctx->in_buf + 1, 0xff, ps_end - 1);
           ^~~~~~
   crypto/rsa-pkcs1pad.c:411:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(req_ctx->in_buf + 1, 0xff, ps_end - 1);
           ^~~~~~
   crypto/rsa-pkcs1pad.c:415:3: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(req_ctx->in_buf + ps_end + 1, digest_info->data,
                   ^~~~~~
   crypto/rsa-pkcs1pad.c:415:3: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                   memcpy(req_ctx->in_buf + ps_end + 1, digest_info->data,
                   ^~~~~~
   crypto/rsa-pkcs1pad.c:627:7: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (snprintf(inst->alg.base.cra_name,
                       ^~~~~~~~
   crypto/rsa-pkcs1pad.c:627:7: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
                   if (snprintf(inst->alg.base.cra_name,
                       ^~~~~~~~
   crypto/rsa-pkcs1pad.c:632:7: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (snprintf(inst->alg.base.cra_driver_name,
                       ^~~~~~~~
   crypto/rsa-pkcs1pad.c:632:7: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
                   if (snprintf(inst->alg.base.cra_driver_name,
                       ^~~~~~~~
   crypto/rsa-pkcs1pad.c:644:7: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAM=
E,
                       ^~~~~~~~
   crypto/rsa-pkcs1pad.c:644:7: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
                   if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAM=
E,
                       ^~~~~~~~
   crypto/rsa-pkcs1pad.c:649:7: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (snprintf(inst->alg.base.cra_driver_name,
                       ^~~~~~~~
   crypto/rsa-pkcs1pad.c:649:7: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
                   if (snprintf(inst->alg.base.cra_driver_name,
                       ^~~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
>> security/lockdown/lockdown.c:103:15: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                                   offset +=3D sprintf(temp+offset, "[%s] "=
, label);
                                             ^~~~~~~
   security/lockdown/lockdown.c:103:15: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                                   offset +=3D sprintf(temp+offset, "[%s] "=
, label);
                                             ^~~~~~~
   security/lockdown/lockdown.c:105:15: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                                   offset +=3D sprintf(temp+offset, "%s ", =
label);
                                             ^~~~~~~
   security/lockdown/lockdown.c:105:15: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                                   offset +=3D sprintf(temp+offset, "%s ", =
label);
                                             ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   security/device_cgroup.c:242:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(acc, 0, ACCLEN);
           ^~~~~~
   security/device_cgroup.c:242:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(acc, 0, ACCLEN);
           ^~~~~~
   security/device_cgroup.c:265:3: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(str, "*");
                   ^~~~~~
   security/device_cgroup.c:265:3: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
                   strcpy(str, "*");
                   ^~~~~~
   security/device_cgroup.c:267:3: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(str, "%u", m);
                   ^~~~~~~
   security/device_cgroup.c:267:3: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   sprintf(str, "%u", m);
                   ^~~~~~~
   security/device_cgroup.c:611:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ex, 0, sizeof(ex));
           ^~~~~~
   security/device_cgroup.c:611:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(&ex, 0, sizeof(ex));
           ^~~~~~
   security/device_cgroup.c:661:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(temp, 0, sizeof(temp));
                   ^~~~~~
   security/device_cgroup.c:661:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(temp, 0, sizeof(temp));
                   ^~~~~~
   security/device_cgroup.c:683:3: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(temp, 0, sizeof(temp));
                   ^~~~~~
   security/device_cgroup.c:683:3: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
                   memset(temp, 0, sizeof(temp));
                   ^~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   fs/ramfs/file-nommu.c:101:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(data, 0, newsize);
           ^~~~~~
   fs/ramfs/file-nommu.c:101:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(data, 0, newsize);
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   fs/fat/cache.c:138:20: warning: The left operand of '=3D=3D' is a garbag=
e value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (new->fcluster =3D=3D -1) /* dummy cache */
                             ^
   fs/fat/cache.c:366:6: note: Left side of '&&' is true
           if (!is_fat32(sbi) && (inode->i_ino =3D=3D MSDOS_ROOT_INO)) {
               ^
   fs/fat/cache.c:366:25: note: Assuming field 'i_ino' is not equal to MSDO=
S_ROOT_INO
           if (!is_fat32(sbi) && (inode->i_ino =3D=3D MSDOS_ROOT_INO)) {
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:366:2: note: Taking false branch
           if (!is_fat32(sbi) && (inode->i_ino =3D=3D MSDOS_ROOT_INO)) {
           ^
   fs/fat/cache.c:374:6: note: Assuming 'from_bmap' is true
           if (!from_bmap) {
               ^~~~~~~~~~
   fs/fat/cache.c:374:2: note: Taking false branch
           if (!from_bmap) {
           ^
   fs/fat/cache.c:380:7: note: Assuming 'sector' is < 'last_block'
                   if (sector >=3D last_block)
                       ^~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:380:3: note: Taking false branch
                   if (sector >=3D last_block)
                   ^
   fs/fat/cache.c:384:9: note: Calling 'fat_get_mapped_cluster'
           return fat_get_mapped_cluster(inode, sector, last_block, mapped_=
blocks,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/fat/cache.c:320:12: note: Calling 'fat_bmap_cluster'
           cluster =3D fat_bmap_cluster(inode, cluster);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:296:6: note: Assuming field 'i_start' is not equal to 0
           if (MSDOS_I(inode)->i_start =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:296:2: note: Taking false branch
           if (MSDOS_I(inode)->i_start =3D=3D 0)
           ^
   fs/fat/cache.c:299:8: note: Calling 'fat_get_cluster'
           ret =3D fat_get_cluster(inode, cluster, &fclus, &dclus);

vim +103 security/lockdown/lockdown.c

000d388ed3bbed7 Matthew Garrett 2019-08-19   89  =

000d388ed3bbed7 Matthew Garrett 2019-08-19   90  static ssize_t lockdown_re=
ad(struct file *filp, char __user *buf, size_t count,
000d388ed3bbed7 Matthew Garrett 2019-08-19   91  			     loff_t *ppos)
000d388ed3bbed7 Matthew Garrett 2019-08-19   92  {
000d388ed3bbed7 Matthew Garrett 2019-08-19   93  	char temp[80];
000d388ed3bbed7 Matthew Garrett 2019-08-19   94  	int i, offset =3D 0;
000d388ed3bbed7 Matthew Garrett 2019-08-19   95  =

000d388ed3bbed7 Matthew Garrett 2019-08-19   96  	for (i =3D 0; i < ARRAY_S=
IZE(lockdown_levels); i++) {
000d388ed3bbed7 Matthew Garrett 2019-08-19   97  		enum lockdown_reason lev=
el =3D lockdown_levels[i];
000d388ed3bbed7 Matthew Garrett 2019-08-19   98  =

000d388ed3bbed7 Matthew Garrett 2019-08-19   99  		if (lockdown_reasons[lev=
el]) {
000d388ed3bbed7 Matthew Garrett 2019-08-19  100  			const char *label =3D l=
ockdown_reasons[level];
000d388ed3bbed7 Matthew Garrett 2019-08-19  101  =

000d388ed3bbed7 Matthew Garrett 2019-08-19  102  			if (kernel_locked_down =
=3D=3D level)
000d388ed3bbed7 Matthew Garrett 2019-08-19 @103  				offset +=3D sprintf(te=
mp+offset, "[%s] ", label);
000d388ed3bbed7 Matthew Garrett 2019-08-19  104  			else
000d388ed3bbed7 Matthew Garrett 2019-08-19  105  				offset +=3D sprintf(te=
mp+offset, "%s ", label);
000d388ed3bbed7 Matthew Garrett 2019-08-19  106  		}
000d388ed3bbed7 Matthew Garrett 2019-08-19  107  	}
000d388ed3bbed7 Matthew Garrett 2019-08-19  108  =

000d388ed3bbed7 Matthew Garrett 2019-08-19  109  	/* Convert the last space=
 to a newline if needed. */
000d388ed3bbed7 Matthew Garrett 2019-08-19  110  	if (offset > 0)
000d388ed3bbed7 Matthew Garrett 2019-08-19  111  		temp[offset-1] =3D '\n';
000d388ed3bbed7 Matthew Garrett 2019-08-19  112  =

000d388ed3bbed7 Matthew Garrett 2019-08-19  113  	return simple_read_from_b=
uffer(buf, count, ppos, temp, strlen(temp));
000d388ed3bbed7 Matthew Garrett 2019-08-19  114  }
000d388ed3bbed7 Matthew Garrett 2019-08-19  115  =


:::::: The code at line 103 was first introduced by commit
:::::: 000d388ed3bbed745f366ce71b2bb7c2ee70f449 security: Add a static lock=
down policy LSM

:::::: TO: Matthew Garrett <matthewgarrett@google.com>
:::::: CC: James Morris <jmorris@namei.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5239673163405148662==--

