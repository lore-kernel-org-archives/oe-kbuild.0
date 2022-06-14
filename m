Content-Type: multipart/mixed; boundary="===============2226459274109392677=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/fortify-string.h:45:33: warning: use of NULL 'nonce' where non-null expected [CWE-476]
Date: Tue, 14 Jun 2022 17:42:50 +0800
Message-ID: <202206141748.tgBXJMRe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2226459274109392677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/fortify-string.h:45:33: warning: use of NULL 'nonce' where n=
on-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: bfb9700bdf35417454a9bb8b67221d89d7c6e75a fscrypt: factor out fscryp=
t_policy_to_key_spec()
date:   5 weeks ago
:::::: branch date: 34 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220613 (https://download.01.org/0day-ci/archi=
ve/20220614/202206141748.tgBXJMRe-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dbfb9700bdf35417454a9bb8b67221d89d7c6e75a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bfb9700bdf35417454a9bb8b67221d89d7c6e75a
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/string.h:253,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:62,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from include/linux/crypto.h:20,
                    from include/crypto/skcipher.h:12,
                    from fs/crypto/keysetup.c:11:
   include/linux/fortify-string.h: In function 'fscrypt_setup_encryption_in=
fo':
>> include/linux/fortify-string.h:45:33: warning: use of NULL 'nonce' where=
 non-null expected [CWE-476] [-Wanalyzer-null-argument]
      45 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:362:9: note: in expansion of macro '__und=
erlying_memcpy'
     362 |         __underlying_##op(p, q, __fortify_size);                =
        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:369:26: note: in expansion of macro '__fo=
rtify_memcpy_chk'
     369 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,          =
        \
         |                          ^~~~~~~~~~~~~~~~~~~~
   fs/crypto/keysetup.c:541:9: note: in expansion of macro 'memcpy'
     541 |         memcpy(crypt_info->ci_nonce, nonce, FSCRYPT_FILE_NONCE_S=
IZE);
         |         ^~~~~~
     'fscrypt_get_encryption_info': events 1-8
       |
       |  608 | int fscrypt_get_encryption_info(struct inode *inode, bool a=
llow_unsupported)
       |      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'fscrypt_get_encryption_info'
       |......
       |  614 |         if (fscrypt_has_encryption_key(inode))
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       |  617 |         res =3D inode->i_sb->s_cop->get_context(inode, &ctx=
, sizeof(ctx));
       |      |               ~~~~~~~~~~~
       |      |                    |
       |      |                    (3) ...to here
       |  618 |         if (res < 0) {
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch (when 'res >=3D 0')=
...
       |......
       |  625 |         res =3D fscrypt_policy_from_context(&policy, &ctx, =
res);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       |      |               |
       |      |               (5) ...to here
       |  626 |         if (res) {
       |      |            ~
       |      |            |
       |      |            (6) following 'false' branch (when 'res =3D=3D 0=
')...
       |......
       |  634 |         if (!fscrypt_supported_policy(&policy, inode)) {
       |      |            ~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            | |
       |      |            | (7) ...to here
       |      |            (8) following 'true' branch...
       |
     'fscrypt_get_encryption_info': events 9-10
       |
       |fs/crypto/fscrypt_private.h:98:20:
       |   98 |         switch (ctx->version) {
       |      |         ~~~~~~  ~~~^~~~~~~~~
       |      |         |          |
       |      |         |          (9) ...to here
       |      |         (10) following 'default:' branch...
       |
     'fscrypt_get_encryption_info': event 11
       |
       |include/linux/fs.h:2181:41:
       | 2181 | #define IS_CASEFOLDED(inode)    ((inode)->i_flags & S_CASEF=
OLD)
       |      |                                  ~~~~~~~^~~~~~~~~
       |      |                                         |
       |      |                                         (11) ...to here
   fs/crypto/keysetup.c:642:45: note: in expansion of macro 'IS_CASEFOLDED'
       |  642 |                                             IS_CASEFOLDED(i=
node) &&
       |      |                                             ^~~~~~~~~~~~~
       |
     'fscrypt_get_encryption_info': event 12
       |
       |  642 |                                             IS_CASEFOLDED(i=
node) &&
       |
     'fscrypt_get_encryption_info': event 13
       |
       |  643 |                                             S_ISDIR(inode->=
i_mode));
   include/uapi/linux/stat.h:23:28: note: in definition of macro 'S_ISDIR'
       |   23 | #define S_ISDIR(m)      (((m) & S_IFMT) =3D=3D S_IFDIR)
       |      |                            ^
       |
     'fscrypt_get_encryption_info': events 14-16
       |
       |fs/crypto/keysetup.c:642:66:
       |  640 |         res =3D fscrypt_setup_encryption_info(inode, &polic=
y,
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
       =

       |      |               |
       |      |               (15) ...to here
       |      |               (16) calling 'fscrypt_setup_encryption_info' =
from 'fscrypt_get_encryption_info'
       |  641 |                                             fscrypt_context=
_nonce(&ctx),
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |  642 |                                             IS_CASEFOLDED(i=
node) &&
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~
       |  643 |                                             S_ISDIR(inode->=
i_mode));
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~
       |
       +--> 'fscrypt_setup_encryption_info': events 17-21
              |
              |  521 | fscrypt_setup_encryption_info(struct inode *inode,
              |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (17) entry to 'fscrypt_setup_encryption_info'
              |......

vim +/nonce +45 include/linux/fortify-string.h

3009f891bb9f32 Kees Cook      2021-08-02  30  =

a28a6e860c6cf2 Francis Laniel 2021-02-25  31  #if defined(CONFIG_KASAN_GENE=
RIC) || defined(CONFIG_KASAN_SW_TAGS)
a28a6e860c6cf2 Francis Laniel 2021-02-25  32  extern void *__underlying_mem=
chr(const void *p, int c, __kernel_size_t size) __RENAME(memchr);
a28a6e860c6cf2 Francis Laniel 2021-02-25  33  extern int __underlying_memcm=
p(const void *p, const void *q, __kernel_size_t size) __RENAME(memcmp);
a28a6e860c6cf2 Francis Laniel 2021-02-25  34  extern void *__underlying_mem=
cpy(void *p, const void *q, __kernel_size_t size) __RENAME(memcpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  35  extern void *__underlying_mem=
move(void *p, const void *q, __kernel_size_t size) __RENAME(memmove);
a28a6e860c6cf2 Francis Laniel 2021-02-25  36  extern void *__underlying_mem=
set(void *p, int c, __kernel_size_t size) __RENAME(memset);
a28a6e860c6cf2 Francis Laniel 2021-02-25  37  extern char *__underlying_str=
cat(char *p, const char *q) __RENAME(strcat);
a28a6e860c6cf2 Francis Laniel 2021-02-25  38  extern char *__underlying_str=
cpy(char *p, const char *q) __RENAME(strcpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  39  extern __kernel_size_t __unde=
rlying_strlen(const char *p) __RENAME(strlen);
a28a6e860c6cf2 Francis Laniel 2021-02-25  40  extern char *__underlying_str=
ncat(char *p, const char *q, __kernel_size_t count) __RENAME(strncat);
a28a6e860c6cf2 Francis Laniel 2021-02-25  41  extern char *__underlying_str=
ncpy(char *p, const char *q, __kernel_size_t size) __RENAME(strncpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  42  #else
a28a6e860c6cf2 Francis Laniel 2021-02-25  43  #define __underlying_memchr	_=
_builtin_memchr
a28a6e860c6cf2 Francis Laniel 2021-02-25  44  #define __underlying_memcmp	_=
_builtin_memcmp
a28a6e860c6cf2 Francis Laniel 2021-02-25 @45  #define __underlying_memcpy	_=
_builtin_memcpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  46  #define __underlying_memmove	=
__builtin_memmove
a28a6e860c6cf2 Francis Laniel 2021-02-25  47  #define __underlying_memset	_=
_builtin_memset
a28a6e860c6cf2 Francis Laniel 2021-02-25  48  #define __underlying_strcat	_=
_builtin_strcat
a28a6e860c6cf2 Francis Laniel 2021-02-25  49  #define __underlying_strcpy	_=
_builtin_strcpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  50  #define __underlying_strlen	_=
_builtin_strlen
a28a6e860c6cf2 Francis Laniel 2021-02-25  51  #define __underlying_strncat	=
__builtin_strncat
a28a6e860c6cf2 Francis Laniel 2021-02-25  52  #define __underlying_strncpy	=
__builtin_strncpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  53  #endif
a28a6e860c6cf2 Francis Laniel 2021-02-25  54  =


:::::: The code at line 45 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified fu=
nctions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2226459274109392677==--

