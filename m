Content-Type: multipart/mixed; boundary="===============6966030852818055609=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1394/2142] fs/f2fs/super.c:500:31: warning: Value stored to 'policy' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 09 Jun 2022 23:16:57 +0800
Message-ID: <202206092348.TcS2Gnl3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6966030852818055609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/f2fs/s=
uper.c:500:31: warning: Value stored to 'policy' during its initialization =
is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Eric Biggers <ebiggers@google.com>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ff539ac73ea559a8c146d99ab14bfcaddd30547a
commit: b69c9585877949513cd3c9dea41801e9f2b8a6cb [1394/2142] f2fs: use the =
updated test_dummy_encryption helper functions
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20220608 (https://download.01.org/0day-ci/arc=
hive/20220609/202206092348.TcS2Gnl3-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436=
efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Db69c9585877949513cd3c9dea41801e9f2b8a6cb
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b69c9585877949513cd3c9dea41801e9f2b8a6cb
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~
   drivers/staging/iio/addac/adt7316.c:1617:9: warning: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", rev);
                  ^~~~~~~
   drivers/staging/iio/addac/adt7316.c:1617:9: note: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", rev);
                  ^~~~~~~
   drivers/staging/iio/addac/adt7316.c:1636:10: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "spi\n");
                          ^~~~~~~
   drivers/staging/iio/addac/adt7316.c:1636:10: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "spi\n");
                          ^~~~~~~
   drivers/staging/iio/addac/adt7316.c:1638:9: warning: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "i2c\n");
                  ^~~~~~~
   drivers/staging/iio/addac/adt7316.c:1638:9: note: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "i2c\n");
                  ^~~~~~~
   drivers/staging/iio/addac/adt7316.c:1848:9: warning: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "0x%x\n", chip->int_mask);
                  ^~~~~~~
   drivers/staging/iio/addac/adt7316.c:1848:9: note: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "0x%x\n", chip->int_mask);
                  ^~~~~~~
   drivers/staging/iio/addac/adt7316.c:1888:2: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D chip->bus.write(chip->bus.client, ADT7316_INT_MASK1, mas=
k);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/addac/adt7316.c:1888:2: note: Value stored to 'ret' =
is never read
           ret =3D chip->bus.write(chip->bus.client, ADT7316_INT_MASK1, mas=
k);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/iio/addac/adt7316.c:1922:9: warning: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data);
                  ^~~~~~~
   drivers/staging/iio/addac/adt7316.c:1922:9: note: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data);
                  ^~~~~~~
   drivers/staging/iio/addac/adt7316.c:1973:9: warning: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!(chip->config1 & ADT7316_INT_EN));
                  ^~~~~~~
   drivers/staging/iio/addac/adt7316.c:1973:9: note: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!(chip->config1 & ADT7316_INT_EN));
                  ^~~~~~~
   Suppressed 62 warnings (55 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/iio/potentiostat/lmp91000.c:141:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(data->buffer, 0, sizeof(data->buffer));
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
   drivers/iio/potentiostat/lmp91000.c:141:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(data->buffer, 0, sizeof(data->buffer));
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
   Suppressed 62 warnings (55 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   Suppressed 68 warnings (61 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   86 warnings generated.
   fs/f2fs/super.c:80:3: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ffi, 0, sizeof(struct f2fs_fault_info));
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
   fs/f2fs/super.c:80:3: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
                   memset(ffi, 0, sizeof(struct f2fs_fault_info));
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
>> fs/f2fs/super.c:500:31: warning: Value stored to 'policy' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct fscrypt_dummy_policy *policy =3D
                                        ^~~~~~
   fs/f2fs/super.c:500:31: note: Value stored to 'policy' during its initia=
lization is never read
           struct fscrypt_dummy_policy *policy =3D
                                        ^~~~~~
   fs/f2fs/super.c:1151:4: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(ext[ext_cnt], name);
                           ^~~~~~
   fs/f2fs/super.c:1151:4: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
                           strcpy(ext[ext_cnt], name);
                           ^~~~~~
   fs/f2fs/super.c:1175:4: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(noext[noext_cnt], name);
                           ^~~~~~
   fs/f2fs/super.c:1175:4: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
                           strcpy(noext[noext_cnt], name);
                           ^~~~~~
   fs/f2fs/super.c:3133:3: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(bh->b_data + F2FS_SUPER_OFFSET, super, sizeof(*su=
per));
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
   fs/f2fs/super.c:3133:3: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                   memcpy(bh->b_data + F2FS_SUPER_OFFSET, super, sizeof(*su=
per));
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
   fs/f2fs/super.c:3775:4: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(super, bh->b_data + F2FS_SUPER_OFFSET,
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
   fs/f2fs/super.c:3775:4: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                           memcpy(super, bh->b_data + F2FS_SUPER_OFFSET,
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
   fs/f2fs/super.c:3871:4: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(FDEV(i).path, RDEV(i).path, MAX_PATH_LEN);
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
   fs/f2fs/super.c:3871:4: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                           memcpy(FDEV(i).path, RDEV(i).path, MAX_PATH_LEN);
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
   fs/f2fs/super.c:4092:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&sb->s_uuid, raw_super->uuid, sizeof(raw_super->uuid));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \

vim +/policy +500 fs/f2fs/super.c

4b2414d04e99120 Chao Yu      2017-08-08  489  =

ed318a6cc0b6204 Eric Biggers 2020-05-12  490  static int f2fs_set_test_dumm=
y_encryption(struct super_block *sb,
ed318a6cc0b6204 Eric Biggers 2020-05-12  491  					  const char *opt,
ed318a6cc0b6204 Eric Biggers 2020-05-12  492  					  const substring_t *arg,
ed318a6cc0b6204 Eric Biggers 2020-05-12  493  					  bool is_remount)
ed318a6cc0b6204 Eric Biggers 2020-05-12  494  {
ed318a6cc0b6204 Eric Biggers 2020-05-12  495  	struct f2fs_sb_info *sbi =3D=
 F2FS_SB(sb);
b69c95858779495 Eric Biggers 2022-06-06  496  	struct fs_parameter param =
=3D {
b69c95858779495 Eric Biggers 2022-06-06  497  		.type =3D fs_value_is_strin=
g,
b69c95858779495 Eric Biggers 2022-06-06  498  		.string =3D arg->from ? arg=
->from : "",
b69c95858779495 Eric Biggers 2022-06-06  499  	};
b69c95858779495 Eric Biggers 2022-06-06 @500  	struct fscrypt_dummy_policy =
*policy =3D
b69c95858779495 Eric Biggers 2022-06-06  501  		&F2FS_OPTION(sbi).dummy_enc=
_policy;
ed318a6cc0b6204 Eric Biggers 2020-05-12  502  	int err;
ed318a6cc0b6204 Eric Biggers 2020-05-12  503  =

b69c95858779495 Eric Biggers 2022-06-06  504  	if (!IS_ENABLED(CONFIG_FS_EN=
CRYPTION)) {
b69c95858779495 Eric Biggers 2022-06-06  505  		f2fs_warn(sbi, "test_dummy_=
encryption option not supported");
b69c95858779495 Eric Biggers 2022-06-06  506  		return -EINVAL;
b69c95858779495 Eric Biggers 2022-06-06  507  	}
b69c95858779495 Eric Biggers 2022-06-06  508  =

ed318a6cc0b6204 Eric Biggers 2020-05-12  509  	if (!f2fs_sb_has_encrypt(sbi=
)) {
ed318a6cc0b6204 Eric Biggers 2020-05-12  510  		f2fs_err(sbi, "Encrypt feat=
ure is off");
ed318a6cc0b6204 Eric Biggers 2020-05-12  511  		return -EINVAL;
ed318a6cc0b6204 Eric Biggers 2020-05-12  512  	}
ed318a6cc0b6204 Eric Biggers 2020-05-12  513  =

ed318a6cc0b6204 Eric Biggers 2020-05-12  514  	/*
ed318a6cc0b6204 Eric Biggers 2020-05-12  515  	 * This mount option is just=
 for testing, and it's not worthwhile to
ed318a6cc0b6204 Eric Biggers 2020-05-12  516  	 * implement the extra compl=
exity (e.g. RCU protection) that would be
ed318a6cc0b6204 Eric Biggers 2020-05-12  517  	 * needed to allow it to be =
set or changed during remount.  We do allow
ed318a6cc0b6204 Eric Biggers 2020-05-12  518  	 * it to be specified during=
 remount, but only if there is no change.
ed318a6cc0b6204 Eric Biggers 2020-05-12  519  	 */
b69c95858779495 Eric Biggers 2022-06-06  520  	if (is_remount && !fscrypt_i=
s_dummy_policy_set(policy)) {
ed318a6cc0b6204 Eric Biggers 2020-05-12  521  		f2fs_warn(sbi, "Can't set t=
est_dummy_encryption on remount");
ed318a6cc0b6204 Eric Biggers 2020-05-12  522  		return -EINVAL;
ed318a6cc0b6204 Eric Biggers 2020-05-12  523  	}
b69c95858779495 Eric Biggers 2022-06-06  524  =

b69c95858779495 Eric Biggers 2022-06-06  525  	err =3D fscrypt_parse_test_d=
ummy_encryption(&param, policy);
ed318a6cc0b6204 Eric Biggers 2020-05-12  526  	if (err) {
ed318a6cc0b6204 Eric Biggers 2020-05-12  527  		if (err =3D=3D -EEXIST)
ed318a6cc0b6204 Eric Biggers 2020-05-12  528  			f2fs_warn(sbi,
ed318a6cc0b6204 Eric Biggers 2020-05-12  529  				  "Can't change test_dumm=
y_encryption on remount");
ed318a6cc0b6204 Eric Biggers 2020-05-12  530  		else if (err =3D=3D -EINVAL)
ed318a6cc0b6204 Eric Biggers 2020-05-12  531  			f2fs_warn(sbi, "Value of o=
ption \"%s\" is unrecognized",
ed318a6cc0b6204 Eric Biggers 2020-05-12  532  				  opt);
ed318a6cc0b6204 Eric Biggers 2020-05-12  533  		else
ed318a6cc0b6204 Eric Biggers 2020-05-12  534  			f2fs_warn(sbi, "Error proc=
essing option \"%s\" [%d]",
ed318a6cc0b6204 Eric Biggers 2020-05-12  535  				  opt, err);
ed318a6cc0b6204 Eric Biggers 2020-05-12  536  		return -EINVAL;
ed318a6cc0b6204 Eric Biggers 2020-05-12  537  	}
b69c95858779495 Eric Biggers 2022-06-06  538  	err =3D fscrypt_add_test_dum=
my_key(sb, policy);
b69c95858779495 Eric Biggers 2022-06-06  539  	if (err) {
b69c95858779495 Eric Biggers 2022-06-06  540  		f2fs_warn(sbi, "Error addin=
g test dummy encryption key [%d]",
b69c95858779495 Eric Biggers 2022-06-06  541  			  err);
b69c95858779495 Eric Biggers 2022-06-06  542  		return err;
b69c95858779495 Eric Biggers 2022-06-06  543  	}
ed318a6cc0b6204 Eric Biggers 2020-05-12  544  	f2fs_warn(sbi, "Test dummy e=
ncryption mode enabled");
64e3ed0b8ea0195 Eric Biggers 2022-04-30  545  	return 0;
ed318a6cc0b6204 Eric Biggers 2020-05-12  546  }
ed318a6cc0b6204 Eric Biggers 2020-05-12  547  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6966030852818055609==--

