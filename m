Content-Type: multipart/mixed; boundary="===============6265219526714986168=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/fortify-string.h:43:33: warning: use of NULL '*dst.mt' where non-null expected [CWE-476]
Date: Tue, 28 Jun 2022 09:49:19 +0800
Message-ID: <202206280935.9j7kM0ly-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6265219526714986168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/l=
inux/fortify-string.h:43:33: warning: use of NULL '*dst.mt' where non-null =
expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   941e3e7912696b9fbe3586083a7c2e102cee7a87
commit: f68f2ff91512c199ec24883001245912afc17873 fortify: Detect struct mem=
ber overflows in memcpy() at compile-time
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-c001-20220627 (https://download.01.org/0day-ci/ar=
chive/20220628/202206280935.9j7kM0ly-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df68f2ff91512c199ec24883001245912afc17873
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f68f2ff91512c199ec24883001245912afc17873
        # save the config file
         ARCH=3Dx86_64 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/string.h:253,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:22,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:65,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from net/netfilter/nft_set_pipapo.c:333:
   net/netfilter/nft_set_pipapo.c: In function 'pipapo_clone':
>> include/linux/fortify-string.h:43:33: warning: use of NULL '*dst.mt' whe=
re non-null expected [CWE-476] [-Wanalyzer-null-argument]
      43 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:301:9: note: in expansion of macro '__und=
erlying_memcpy'
     301 |         __underlying_##op(p, q, __fortify_size);                =
        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:308:26: note: in expansion of macro '__fo=
rtify_memcpy_chk'
     308 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,          =
        \
         |                          ^~~~~~~~~~~~~~~~~~~~
   net/netfilter/nft_set_pipapo.c:1327:17: note: in expansion of macro 'mem=
cpy'
    1327 |                 memcpy(dst->mt, src->mt, src->rules * sizeof(*sr=
c->mt));
         |                 ^~~~~~
     'nft_pipapo_init': events 1-4
       |
       | 2047 | static int nft_pipapo_init(const struct nft_set *set,
       |      |            ^~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'nft_pipapo_init'
       |......
       | 2063 |         if (!m)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 2066 |         m->field_count =3D field_count;
       |      |         ~   =

       |      |         |
       |      |         (3) ...to here
       |......
       | 2070 |         if (!m->scratch) {
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch...
       |
     'nft_pipapo_init': event 5
       |
       |cc1:
       | (5): ...to here
       |
     'nft_pipapo_init': event 6
       |
       | 2079 |         if (!m->scratch_aligned) {
       |      |            ^
       |      |            |
       |      |            (6) following 'false' branch...
       |
     'nft_pipapo_init': event 7
       |
       |cc1:
       | (7): ...to here
       |
     'nft_pipapo_init': event 8
       |
       |net/netfilter/nft_set_pipapo.h:86:22:
       |   86 |              (index) < (match)->field_count;               =
     \
       |      |              ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
       |      |                      |
       |      |                      (8) following 'true' branch...
   net/netfilter/nft_set_pipapo.c:2089:9: note: in expansion of macro 'nft_=
pipapo_for_each_field'
       | 2089 |         nft_pipapo_for_each_field(f, i, m) {
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |
     'nft_pipapo_init': event 9
       |
       | 2090 |                 int len =3D desc->field_len[i] ? : set->kle=
n;
       |      |                 ^~~
       |      |                 |
       |      |                 (9) ...to here
       |
     'nft_pipapo_init': event 10
       |
       | 2100 |                 f->mt =3D NULL;
       |
     'nft_pipapo_init': event 11
       |
       | 2100 |                 f->mt =3D NULL;
       |
     'nft_pipapo_init': event 12
       |
       | 2100 |                 f->mt =3D NULL;
       |
     'nft_pipapo_init': event 13
       |
       | 2100 |                 f->mt =3D NULL;
       |
     'nft_pipapo_init': event 14
       |
       | 2100 |                 f->mt =3D NULL;
       |
     'nft_pipapo_init': event 15
       |
       | 2100 |                 f->mt =3D NULL;
       |
     'nft_pipapo_init': event 16
       |
       | 2100 |                 f->mt =3D NULL;
       |
     'nft_pipapo_init': event 17
       |
       |net/netfilter/nft_set_pipapo.h:86:22:
       |   86 |              (index) < (match)->field_count;               =
     \

vim +43 include/linux/fortify-string.h

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
--===============6265219526714986168==--

