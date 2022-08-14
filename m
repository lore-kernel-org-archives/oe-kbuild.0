Content-Type: multipart/mixed; boundary="===============0808166431406717438=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/fortify-string.h:43:33: warning: use of NULL 'nonce' where non-null expected [CWE-476]
Date: Sun, 14 Aug 2022 17:10:54 +0800
Message-ID: <202208141743.AELvZxu4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0808166431406717438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/l=
inux/fortify-string.h:43:33: warning: use of NULL 'nonce' where non-null ex=
pected [CWE-476] [-Wanalyzer-null-argument]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aea23e7c464bfdec04b52cf61edb62030e9e0d0a
commit: 28e77cc1c0686621a4d416f599cee5ab369daa0a fortify: Detect struct mem=
ber overflows in memset() at compile-time
date:   6 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220814 (https://download.01.org/0day-ci/archi=
ve/20220814/202208141743.AELvZxu4-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D28e77cc1c0686621a4d416f599cee5ab369daa0a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 28e77cc1c0686621a4d416f599cee5ab369daa0a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
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
   fs/crypto/keysetup.c: In function 'fscrypt_setup_encryption_info':
>> include/linux/fortify-string.h:43:33: warning: use of NULL 'nonce' where=
 non-null expected [CWE-476] [-Wanalyzer-null-argument]
      43 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:340:9: note: in expansion of macro '__und=
erlying_memcpy'
     340 |         __underlying_##op(p, q, __fortify_size);                =
        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:347:26: note: in expansion of macro '__fo=
rtify_memcpy_chk'
     347 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,          =
        \
         |                          ^~~~~~~~~~~~~~~~~~~~
   fs/crypto/keysetup.c:555:9: note: in expansion of macro 'memcpy'
     555 |         memcpy(crypt_info->ci_nonce, nonce, FSCRYPT_FILE_NONCE_S=
IZE);
         |         ^~~~~~
     'fscrypt_get_encryption_info': events 1-10
       |
       |  622 | int fscrypt_get_encryption_info(struct inode *inode, bool a=
llow_unsupported)
       |      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'fscrypt_get_encryption_info'
       |......
       |  628 |         if (fscrypt_has_encryption_key(inode))
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       |  631 |         res =3D inode->i_sb->s_cop->get_context(inode, &ctx=
, sizeof(ctx));
       |      |               ~~~~~~~~~~~
       |      |                    |
       |      |                    (3) ...to here
       |  632 |         if (res < 0) {
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch (when 'res >=3D 0')=
...
       |......
       |  639 |         res =3D fscrypt_policy_from_context(&policy, &ctx, =
res);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       |      |               |
       |      |               (5) ...to here
       |  640 |         if (res) {
       |      |            ~
       |      |            |
       |      |            (6) following 'false' branch (when 'res =3D=3D 0=
')...
       |......
       |  648 |         if (!fscrypt_supported_policy(&policy, inode)) {
       |      |            ~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            | |
       |      |            | (7) ...to here
       |      |            (8) following 'true' branch...
       |......
       |  654 |         res =3D fscrypt_setup_encryption_info(inode, &polic=
y,
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (9) ...to here
       |      |               (10) calling 'fscrypt_context_nonce' from 'fs=
crypt_get_encryption_info'
       |  655 |                                             fscrypt_context=
_nonce(&ctx),
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |  656 |                                             IS_CASEFOLDED(i=
node) &&
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~
       |  657 |                                             S_ISDIR(inode->=
i_mode));
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~
       |
       +--> 'fscrypt_context_nonce': events 11-12
              |
              |fs/crypto/fscrypt_private.h:96:25:
              |   96 | static inline const u8 *fscrypt_context_nonce(const =
union fscrypt_context *ctx)
              |      |                         ^~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (11) entry to 'fscrypt_conte=
xt_nonce'
              |   97 | {
              |   98 |         switch (ctx->version) {
              |      |         ~~~~~~           =

              |      |         |
              |      |         (12) following 'default:' branch...
              |
            'fscrypt_context_nonce': event 13
              |
              |cc1:
              | (13): ...to here
              |
       <------+
       |
     'fscrypt_get_encryption_info': events 14-15
       |
       |fs/crypto/keysetup.c:654:15:
       |  654 |         res =3D fscrypt_setup_encryption_info(inode, &polic=
y,
       |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (14) returning to 'fscrypt_get_encryption_inf=
o' from 'fscrypt_context_nonce'
       |      |               (15) calling 'fscrypt_setup_encryption_info' =
from 'fscrypt_get_encryption_info'
       |  655 |                                             fscrypt_context=
_nonce(&ctx),
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |  656 |                                             IS_CASEFOLDED(i=
node) &&
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~
       |  657 |                                             S_ISDIR(inode->=
i_mode));
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~
       |
       +--> 'fscrypt_setup_encryption_info': events 16-20
              |
              |  535 | fscrypt_setup_encryption_info(struct inode *inode,
              |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (16) entry to 'fscrypt_setup_encryption_info'

vim +/nonce +43 include/linux/fortify-string.h

3009f891bb9f32 Kees Cook      2021-08-02  28  =

a28a6e860c6cf2 Francis Laniel 2021-02-25  29  #if defined(CONFIG_KASAN_GENE=
RIC) || defined(CONFIG_KASAN_SW_TAGS)
a28a6e860c6cf2 Francis Laniel 2021-02-25  30  extern void *__underlying_mem=
chr(const void *p, int c, __kernel_size_t size) __RENAME(memchr);
a28a6e860c6cf2 Francis Laniel 2021-02-25  31  extern int __underlying_memcm=
p(const void *p, const void *q, __kernel_size_t size) __RENAME(memcmp);
a28a6e860c6cf2 Francis Laniel 2021-02-25  32  extern void *__underlying_mem=
cpy(void *p, const void *q, __kernel_size_t size) __RENAME(memcpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  33  extern void *__underlying_mem=
move(void *p, const void *q, __kernel_size_t size) __RENAME(memmove);
a28a6e860c6cf2 Francis Laniel 2021-02-25  34  extern void *__underlying_mem=
set(void *p, int c, __kernel_size_t size) __RENAME(memset);
a28a6e860c6cf2 Francis Laniel 2021-02-25  35  extern char *__underlying_str=
cat(char *p, const char *q) __RENAME(strcat);
a28a6e860c6cf2 Francis Laniel 2021-02-25  36  extern char *__underlying_str=
cpy(char *p, const char *q) __RENAME(strcpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  37  extern __kernel_size_t __unde=
rlying_strlen(const char *p) __RENAME(strlen);
a28a6e860c6cf2 Francis Laniel 2021-02-25  38  extern char *__underlying_str=
ncat(char *p, const char *q, __kernel_size_t count) __RENAME(strncat);
a28a6e860c6cf2 Francis Laniel 2021-02-25  39  extern char *__underlying_str=
ncpy(char *p, const char *q, __kernel_size_t size) __RENAME(strncpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  40  #else
a28a6e860c6cf2 Francis Laniel 2021-02-25  41  #define __underlying_memchr	_=
_builtin_memchr
a28a6e860c6cf2 Francis Laniel 2021-02-25  42  #define __underlying_memcmp	_=
_builtin_memcmp
a28a6e860c6cf2 Francis Laniel 2021-02-25 @43  #define __underlying_memcpy	_=
_builtin_memcpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  44  #define __underlying_memmove	=
__builtin_memmove
a28a6e860c6cf2 Francis Laniel 2021-02-25  45  #define __underlying_memset	_=
_builtin_memset
a28a6e860c6cf2 Francis Laniel 2021-02-25  46  #define __underlying_strcat	_=
_builtin_strcat
a28a6e860c6cf2 Francis Laniel 2021-02-25  47  #define __underlying_strcpy	_=
_builtin_strcpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  48  #define __underlying_strlen	_=
_builtin_strlen
a28a6e860c6cf2 Francis Laniel 2021-02-25  49  #define __underlying_strncat	=
__builtin_strncat
a28a6e860c6cf2 Francis Laniel 2021-02-25  50  #define __underlying_strncpy	=
__builtin_strncpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  51  #endif
a28a6e860c6cf2 Francis Laniel 2021-02-25  52  =


:::::: The code at line 43 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified fu=
nctions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0808166431406717438==--

