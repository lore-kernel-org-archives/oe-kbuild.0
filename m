Content-Type: multipart/mixed; boundary="===============2477806697106572301=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/fortify-string.h:45:33: warning: use of uninitialized value '*(unsigned int *)&val' [CWE-457]
Date: Sat, 03 Sep 2022 11:46:59 +0800
Message-ID: <202209031127.mm1gyvwz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2477806697106572301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/fortify-string.h:45:33: warning: use of uninitialized value =
'*(unsigned int *)&val' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ondrej Mosnacek <omosnace@redhat.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Brian Masney <bmasney@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d895ec7938c431fe61a731939da76a6461bc6133
commit: 16287397ec5c08aa58db6acf7dbc55470d78087d crypto: qcom-rng - fix inf=
inite loop on requests not multiple of WORD_SZ
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220831 (https://download.01.org/0day-ci/archi=
ve/20220903/202209031127.mm1gyvwz-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D16287397ec5c08aa58db6acf7dbc55470d78087d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 16287397ec5c08aa58db6acf7dbc55470d78087d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/crypto/qcom-rng.c: In function 'qcom_rng_read':
   drivers/crypto/qcom-rng.c:46:13: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      46 |         u32 val;
         |             ^~~
     'qcom_rng_read': event 1
       |
       |   46 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
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
                    from include/crypto/algapi.h:11,
                    from include/crypto/internal/rng.h:12,
                    from drivers/crypto/qcom-rng.c:6:
>> include/linux/fortify-string.h:45:33: warning: use of uninitialized valu=
e '*(unsigned int *)&val' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
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
   drivers/crypto/qcom-rng.c:62:25: note: in expansion of macro 'memcpy'
      62 |                         memcpy(data, &val, WORD_SZ);
         |                         ^~~~~~
     'qcom_rng_read': event 1
       |
       |   46 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) region created on stack here
       |
     'qcom_rng_read': event 2
       |
       |include/linux/iopoll.h:47:20:
       |   47 |                 if (cond) \
       |      |                    ^
       |      |                    |
       |      |                    (2) following 'true' branch...
   include/linux/iopoll.h:121:9: note: in expansion of macro 'read_poll_tim=
eout'
       |  121 |         read_poll_timeout(op, val, cond, sleep_us, timeout_=
us, false, addr)
       |      |         ^~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:156:9: note: in expansion of macro 'readx_poll_ti=
meout'
       |  156 |         readx_poll_timeout(readl, addr, val, cond, delay_us=
, timeout_us)
       |      |         ^~~~~~~~~~~~~~~~~~
   drivers/crypto/qcom-rng.c:51:23: note: in expansion of macro 'readl_poll=
_timeout'
       |   51 |                 ret =3D readl_poll_timeout(rng->base + PRNG=
_STATUS, val,
       |      |                       ^~~~~~~~~~~~~~~~~~
       |
     'qcom_rng_read': events 3-6
       |
       |   51 |                 ret =3D readl_poll_timeout(rng->base + PRNG=
_STATUS, val,
       |......
       |   58 |                 if (!val)
       |      |                    ~ =

       |      |                    |
       |      |                    (4) following 'false' branch (when 'val =
!=3D 0')...
       |......
       |   61 |                 if ((max - currsize) >=3D WORD_SZ) {
       |      |                 ~~ ~ =

       |      |                 |  |
       |      |                 |  (6) following 'true' branch...
       |      |                 (5) ...to here
       |
     'qcom_rng_read': event 7
       |
       |include/linux/fortify-string.h:358:62:
       |  358 |                              p_size_field, q_size_field, op=
) ({         \
       |      |                                                            =
  ^
       |      |                                                            =
  |
       |      |                                                            =
  (7) ...to here
   include/linux/fortify-string.h:369:26: note: in expansion of macro '__fo=
rtify_memcpy_chk'
       |  369 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,     =
             \
       |      |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/crypto/qcom-rng.c:62:25: note: in expansion of macro 'memcpy'
       |   62 |                         memcpy(data, &val, WORD_SZ);
       |      |                         ^~~~~~
       |
     'qcom_rng_read': event 8
       |
       |include/linux/fortify-string.h:45:33:
       |   45 | #define __underlying_memcpy     __builtin_memcpy
       |      |                                 ^
       |      |                                 |
       |      |                                 (8) use of uninitialized va=
lue '*(unsigned int *)&val' here
   include/linux/fortify-string.h:362:9: note: in expansion of macro '__und=
erlying_memcpy'
       |  362 |         __underlying_##op(p, q, __fortify_size);           =
             \
       |      |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:369:26: note: in expansion of macro '__fo=
rtify_memcpy_chk'
       |  369 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,     =
             \
       |      |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/crypto/qcom-rng.c:62:25: note: in expansion of macro 'memcpy'
       |   62 |                         memcpy(data, &val, WORD_SZ);
       |      |                         ^~~~~~
       |
>> include/linux/fortify-string.h:45:33: warning: use of uninitialized valu=
e '*(unsigned int *)&val' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
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
   drivers/crypto/qcom-rng.c:62:25: note: in expansion of macro 'memcpy'
      62 |                         memcpy(data, &val, WORD_SZ);
         |                         ^~~~~~
     'qcom_rng_generate': events 1-2
       |
       |   75 | static int qcom_rng_generate(struct crypto_rng *tfm,
       |      |            ^~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'qcom_rng_generate'
       |......
       |   84 |         if (ret)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'ret =3D=3D 0=
')...
       |
     'qcom_rng_generate': event 3
       |
       |include/linux/mutex.h:187:26:
       |  187 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
       |      |                          ^~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (3) ...to here
   drivers/crypto/qcom-rng.c:87:9: note: in expansion of macro 'mutex_lock'
       |   87 |         mutex_lock(&rng->lock);
       |      |         ^~~~~~~~~~
       |
     'qcom_rng_generate': event 4
       |
       |   89 |         ret =3D qcom_rng_read(rng, dstn, dlen);
       |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (4) calling 'qcom_rng_read' from 'qcom_rng_ge=
nerate'
       |
       +--> 'qcom_rng_read': events 5-6
              |
              |   43 | static int qcom_rng_read(struct qcom_rng *rng, u8 *d=
ata, unsigned int max)
              |      |            ^~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'qcom_rng_read'
              |......
              |   46 |         u32 val;
              |      |             ~~~
              |      |             |
              |      |             (6) region created on stack here
              |
            'qcom_rng_read': event 7
              |
              |include/linux/iopoll.h:47:20:
              |   47 |                 if (cond) \
              |      |                    ^
              |      |                    |
              |      |                    (7) following 'true' branch...
   include/linux/iopoll.h:121:9: note: in expansion of macro 'read_poll_tim=
eout'
              |  121 |         read_poll_timeout(op, val, cond, sleep_us, t=
imeout_us, false, addr)
              |      |         ^~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:156:9: note: in expansion of macro 'readx_poll_ti=
meout'
              |  156 |         readx_poll_timeout(readl, addr, val, cond, d=
elay_us, timeout_us)
              |      |         ^~~~~~~~~~~~~~~~~~
   drivers/crypto/qcom-rng.c:51:23: note: in expansion of macro 'readl_poll=
_timeout'
              |   51 |                 ret =3D readl_poll_timeout(rng->base=
 + PRNG_STATUS, val,
              |      |                       ^~~~~~~~~~~~~~~~~~
              |
            'qcom_rng_read': events 8-11
              |
              |   51 |                 ret =3D readl_poll_timeout(rng->base=
 + PRNG_STATUS, val,
              |......
              |   58 |                 if (!val)
              |      |                    ~ =

              |      |                    |
              |      |                    (9) following 'false' branch (whe=
n 'val !=3D 0')...
              |......
              |   61 |                 if ((max - currsize) >=3D WORD_SZ) {
              |      |                 ~~ ~ =

              |      |                 |  |
              |      |                 |  (11) following 'true' branch...
              |      |                 (10) ...to here
              |
            'qcom_rng_read': event 12
              |
              |include/linux/fortify-string.h:358:62:
              |  358 |                              p_size_field, q_size_fi=
eld, op) ({         \
              |      |                                                     =
         ^
              |      |                                                     =
         |
              |      |                                                     =
         (12) ...to here
   include/linux/fortify-string.h:369:26: note: in expansion of macro '__fo=
rtify_memcpy_chk'
              |  369 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, =
s,                  \
              |      |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/crypto/qcom-rng.c:62:25: note: in expansion of macro 'memcpy'
              |   62 |                         memcpy(data, &val, WORD_SZ);
              |      |                         ^~~~~~
              |
            'qcom_rng_read': event 13

vim +45 include/linux/fortify-string.h

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
--===============2477806697106572301==--

