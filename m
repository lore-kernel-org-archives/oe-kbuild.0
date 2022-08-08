Content-Type: multipart/mixed; boundary="===============8332471004661512835=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/fortify-string.h:41:33: warning: use of NULL '*(struct napi_gro_cb *)((char *)skb + 24).frag0' where non-null expected [CWE-476]
Date: Mon, 08 Aug 2022 08:53:18 +0800
Message-ID: <202208080847.fCs2Hdkj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8332471004661512835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/fortify-string.h:41:33: warning: use of NULL '*(struct napi_=
gro_cb *)((char *)skb + 24).frag0' where non-null expected [CWE-476] [-Wana=
lyzer-null-argument]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3bc1bc0b59d04e997db25b84babf459ca1cd80b7
commit: 587652bbdd06ab38a4c1b85e40f933d2cf4a1147 net: gro: populate net/cor=
e/gro.c
date:   9 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-c001-20220801 (https://download.01.org/0day-ci/arch=
ive/20220808/202208080847.fCs2Hdkj-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D587652bbdd06ab38a4c1b85e40f933d2cf4a1147
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 587652bbdd06ab38a4c1b85e40f933d2cf4a1147
        # save the config file
        make ARCH=3Di386 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/string.h:253,
                    from arch/x86/include/asm/page_32.h:35,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/processor.h:19,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:65,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/skbuff.h:15,
                    from include/linux/ip.h:16,
                    from include/net/gro.h:7,
                    from net/core/gro.c:2:
   include/linux/fortify-string.h: In function 'gro_pull_from_frag0':
>> include/linux/fortify-string.h:41:33: warning: use of NULL '*(struct nap=
i_gro_cb *)((char *)skb + 24).frag0' where non-null expected [CWE-476] [-Wa=
nalyzer-null-argument]
      41 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:225:16: note: in expansion of macro '__un=
derlying_memcpy'
     225 |         return __underlying_memcpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~
     'napi_frags_skb': events 1-2
       |
       |net/core/gro.c:691:24:
       |  691 | static struct sk_buff *napi_frags_skb(struct napi_struct *n=
api)
       |      |                        ^~~~~~~~~~~~~~
       |      |                        |
       |      |                        (1) entry to 'napi_frags_skb'
       |......
       |  700 |         skb_gro_reset_offset(skb, hlen);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'skb_gro_reset_offset' from 'napi_frags=
_skb'
       |
       +--> 'skb_gro_reset_offset': event 3
              |
              |  375 | static inline void skb_gro_reset_offset(struct sk_bu=
ff *skb, u32 nhoff)
              |      |                    ^~~~~~~~~~~~~~~~~~~~
              |      |                    |
              |      |                    (3) entry to 'skb_gro_reset_offse=
t'
              |
            'skb_gro_reset_offset': event 4
              |
              |  381 |         NAPI_GRO_CB(skb)->frag0 =3D NULL;
              |
            'skb_gro_reset_offset': event 5
              |
              |  381 |         NAPI_GRO_CB(skb)->frag0 =3D NULL;
              |
            'skb_gro_reset_offset': event 6
              |
              |  381 |         NAPI_GRO_CB(skb)->frag0 =3D NULL;
              |
            'skb_gro_reset_offset': event 7
              |
              |  381 |         NAPI_GRO_CB(skb)->frag0 =3D NULL;
              |
       <------+
       |
     'napi_frags_skb': events 8-11
       |
       |  700 |         skb_gro_reset_offset(skb, hlen);
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (8) returning to 'napi_frags_skb' from 'skb_gro_res=
et_offset'
       |  701 | =

       |  702 |         if (unlikely(skb_gro_header_hard(skb, hlen))) {
       |      |            ~
       |      |            |
       |      |            (9) following 'false' branch...
       |......
       |  711 |                 eth =3D (const struct ethhdr *)skb->data;
       |      |                 ~~~
       |      |                 |
       |      |                 (10) ...to here
       |  712 |                 gro_pull_from_frag0(skb, hlen);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (11) calling 'gro_pull_from_frag0' from 'na=
pi_frags_skb'
       |
       +--> 'gro_pull_from_frag0': event 12
              |
              |  394 | static void gro_pull_from_frag0(struct sk_buff *skb,=
 int grow)
              |      |             ^~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (12) entry to 'gro_pull_from_frag0'
              |
            'gro_pull_from_frag0': event 13
              |
              |include/asm-generic/bug.h:65:35:
              |   65 | #define BUG_ON(condition) do { if (unlikely(conditio=
n)) BUG(); } while (0)
              |      |                                   ^
              |      |                                   |
              |      |                                   (13) following 'fa=
lse' branch...
   net/core/gro.c:398:9: note: in expansion of macro 'BUG_ON'
              |  398 |         BUG_ON(skb->end - skb->tail < grow);
              |      |         ^~~~~~
              |
            'gro_pull_from_frag0': event 14
              |
              |include/linux/compiler-gcc.h:63:12:
              |   63 |         do {                                    \
              |      |            ^
              |      |            |
              |      |            (14) ...to here
   arch/x86/include/asm/bug.h:67:9: note: in expansion of macro 'unreachabl=
e'
              |   67 |         unreachable();                              =
            \
              |      |         ^~~~~~~~~~~
   include/asm-generic/bug.h:65:57: note: in expansion of macro 'BUG'
              |   65 | #define BUG_ON(condition) do { if (unlikely(conditio=
n)) BUG(); } while (0)
              |      |                                                     =
    ^~~
   net/core/gro.c:398:9: note: in expansion of macro 'BUG_ON'
              |  398 |         BUG_ON(skb->end - skb->tail < grow);
              |      |         ^~~~~~
              |
            'gro_pull_from_frag0': events 15-16

vim +41 include/linux/fortify-string.h

3009f891bb9f32 Kees Cook      2021-08-02  26  =

a28a6e860c6cf2 Francis Laniel 2021-02-25  27  #if defined(CONFIG_KASAN_GENE=
RIC) || defined(CONFIG_KASAN_SW_TAGS)
a28a6e860c6cf2 Francis Laniel 2021-02-25  28  extern void *__underlying_mem=
chr(const void *p, int c, __kernel_size_t size) __RENAME(memchr);
a28a6e860c6cf2 Francis Laniel 2021-02-25  29  extern int __underlying_memcm=
p(const void *p, const void *q, __kernel_size_t size) __RENAME(memcmp);
a28a6e860c6cf2 Francis Laniel 2021-02-25  30  extern void *__underlying_mem=
cpy(void *p, const void *q, __kernel_size_t size) __RENAME(memcpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  31  extern void *__underlying_mem=
move(void *p, const void *q, __kernel_size_t size) __RENAME(memmove);
a28a6e860c6cf2 Francis Laniel 2021-02-25  32  extern void *__underlying_mem=
set(void *p, int c, __kernel_size_t size) __RENAME(memset);
a28a6e860c6cf2 Francis Laniel 2021-02-25  33  extern char *__underlying_str=
cat(char *p, const char *q) __RENAME(strcat);
a28a6e860c6cf2 Francis Laniel 2021-02-25  34  extern char *__underlying_str=
cpy(char *p, const char *q) __RENAME(strcpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  35  extern __kernel_size_t __unde=
rlying_strlen(const char *p) __RENAME(strlen);
a28a6e860c6cf2 Francis Laniel 2021-02-25  36  extern char *__underlying_str=
ncat(char *p, const char *q, __kernel_size_t count) __RENAME(strncat);
a28a6e860c6cf2 Francis Laniel 2021-02-25  37  extern char *__underlying_str=
ncpy(char *p, const char *q, __kernel_size_t size) __RENAME(strncpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  38  #else
a28a6e860c6cf2 Francis Laniel 2021-02-25  39  #define __underlying_memchr	_=
_builtin_memchr
a28a6e860c6cf2 Francis Laniel 2021-02-25  40  #define __underlying_memcmp	_=
_builtin_memcmp
a28a6e860c6cf2 Francis Laniel 2021-02-25 @41  #define __underlying_memcpy	_=
_builtin_memcpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  42  #define __underlying_memmove	=
__builtin_memmove
a28a6e860c6cf2 Francis Laniel 2021-02-25  43  #define __underlying_memset	_=
_builtin_memset
a28a6e860c6cf2 Francis Laniel 2021-02-25  44  #define __underlying_strcat	_=
_builtin_strcat
a28a6e860c6cf2 Francis Laniel 2021-02-25  45  #define __underlying_strcpy	_=
_builtin_strcpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  46  #define __underlying_strlen	_=
_builtin_strlen
a28a6e860c6cf2 Francis Laniel 2021-02-25  47  #define __underlying_strncat	=
__builtin_strncat
a28a6e860c6cf2 Francis Laniel 2021-02-25  48  #define __underlying_strncpy	=
__builtin_strncpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  49  #endif
a28a6e860c6cf2 Francis Laniel 2021-02-25  50  =


:::::: The code@line 41 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified fu=
nctions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8332471004661512835==--

