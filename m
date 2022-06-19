Content-Type: multipart/mixed; boundary="===============2974377099811812920=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/fortify-string.h:41:33: warning: use of NULL 'extra' where non-null expected [CWE-476]
Date: Sun, 19 Jun 2022 20:02:48 +0800
Message-ID: <202206191946.YIs96YkU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2974377099811812920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/fortify-string.h:41:33: warning: use of NULL 'extra' where n=
on-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hangbin Liu <liuhangbin@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 841e95641e4cb695586b036f330d6d272fcd7173 bonding: add extra field f=
or bond_opt_value
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220617 (https://download.01.org/0day-ci/archi=
ve/20220619/202206191946.YIs96YkU-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D841e95641e4cb695586b036f330d6d272fcd7173
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 841e95641e4cb695586b036f330d6d272fcd7173
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/string.h:253,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/net/bonding/bond_main.c:35:
   include/linux/ipv6.h: In function '__bond_opt_init.part.0':
>> include/linux/fortify-string.h:41:33: warning: use of NULL 'extra' where=
 non-null expected [CWE-476] [-Wanalyzer-null-argument]
      41 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:225:16: note: in expansion of macro '__un=
derlying_memcpy'
     225 |         return __underlying_memcpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~
     'bond_check_params': events 1-5
       |
       |drivers/net/bonding/bond_main.c:5568:12:
       | 5568 | static int bond_check_params(struct bond_params *params)
       |      |            ^~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'bond_check_params'
       |......
       | 5584 |         if (mode) {
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 5594 |         if (xmit_hash_policy) {
       |      |             ~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (3) ...to here
       |......
       | 5682 |         if (!bond_mode_uses_arp(bond_mode)) {
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch...
       |......
       | 5690 |         if (tx_queues < 1 || tx_queues > 255) {
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                           |
       |      |                           (5) ...to here
       |
     'bond_check_params': event 6
       |
       |include/net/bond_options.h:137:41:
       |  137 | #define bond_opt_initval(optval, value) __bond_opt_init(opt=
val, NULL, value, NULL, 0)
       |      |                                         ^~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                         |
       |      |                                         (6) calling '__bond=
_opt_init' from 'bond_check_params'
   drivers/net/bonding/bond_main.c:5708:9: note: in expansion of macro 'bon=
d_opt_initval'
       | 5708 |         bond_opt_initval(&newval, packets_per_slave);
       |      |         ^~~~~~~~~~~~~~~~
       |
       +--> '__bond_opt_init': event 7
              |
              |include/net/bond_options.h:124:20:
              |  124 | static inline void __bond_opt_init(struct bond_opt_v=
alue *optval,
              |      |                    ^~~~~~~~~~~~~~~
              |      |                    |
              |      |                    (7) entry to '__bond_opt_init'
              |
            '__bond_opt_init': event 8
              |
              |include/linux/fortify-string.h:207:12:
              |  207 |         if (p_size < size)
              |      |            ^
              |      |            |
              |      |            (8) following 'false' branch (when 'p_siz=
e > 39')...
              |
            '__bond_opt_init': event 9
              |
              |   43 | #define __underlying_memset     __builtin_memset
              |      |                                 ^
              |      |                                 |
              |      |                                 (9) ...to here
   include/linux/fortify-string.h:209:16: note: in expansion of macro '__un=
derlying_memset'
              |  209 |         return __underlying_memset(p, c, size);
              |      |                ^~~~~~~~~~~~~~~~~~~
              |
            '__bond_opt_init': events 10-14
              |
              |include/net/bond_options.h:130:12:
              |  130 |         if (value !=3D ULLONG_MAX)
              |      |            ^
              |      |            |
              |      |            (10) following 'false' branch (when 'valu=
e =3D=3D 18446744073709551615')...
              |  131 |                 optval->value =3D value;
              |  132 |         else if (string)
              |      |                 ~
              |      |                 |
              |      |                 (11) ...to here
              |      |                 (12) following 'false' branch (when =
'string' is NULL)...
              |  133 |                 optval->string =3D string;
              |  134 |         else if (extra_len <=3D BOND_OPT_EXTRA_MAXLE=
N)
              |      |                 ~
              |      |                 |
              |      |                 (13) ...to here
              |      |                 (14) following 'true' branch (when '=
extra_len <=3D 16')...
              |
            '__bond_opt_init': event 15
              |
              |cc1:
              | (15): ...to here
              |
            '__bond_opt_init': event 16
              |
              |cc1:
              | (16): calling '__bond_opt_init.part.0' from '__bond_opt_ini=
t'
              |
--
   In file included from include/linux/string.h:253,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/net/bonding/bond_netlink.c:8:
   include/linux/fortify-string.h: In function '__bond_opt_init.part.0':
>> include/linux/fortify-string.h:41:33: warning: use of NULL 'extra' where=
 non-null expected [CWE-476] [-Wanalyzer-null-argument]
      41 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:225:16: note: in expansion of macro '__un=
derlying_memcpy'
     225 |         return __underlying_memcpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~
     'bond_newlink': events 1-2
       |
       |drivers/net/bonding/bond_netlink.c:469:12:
       |  469 | static int bond_newlink(struct net *src_net, struct net_dev=
ice *bond_dev,
       |      |            ^~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'bond_newlink'
       |......
       |  475 |         err =3D bond_changelink(bond_dev, tb, data, extack);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (2) calling 'bond_changelink' from 'bond_newl=
ink'
       |
       +--> 'bond_changelink': events 3-6
              |
              |  160 | static int bond_changelink(struct net_device *bond_d=
ev, struct nlattr *tb[],
              |      |            ^~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'bond_changelink'
              |......
              |  169 |         if (!data)
              |      |            ~
              |      |            |
              |      |            (4) following 'false' branch (when 'data'=
 is non-NULL)...
              |......
              |  172 |         if (data[IFLA_BOND_MODE]) {
              |      |            ~~~~~~~~~~~~~~~~~~~~~
              |      |            |    |
              |      |            |    (5) ...to here
              |      |            (6) following 'true' branch...
              |
            'bond_changelink': event 7
              |
              |include/net/netlink.h:1608:16:
              | 1608 |         return *(u8 *) nla_data(nla);
              |      |                ^~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (7) ...to here
              |
            'bond_changelink': event 8
              |
              |include/net/bond_options.h:137:41:
              |  137 | #define bond_opt_initval(optval, value) __bond_opt_i=
nit(optval, NULL, value, NULL, 0)
              |      |                                         ^~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                                         |
              |      |                                         (8) calling =
'__bond_opt_init' from 'bond_changelink'
   drivers/net/bonding/bond_netlink.c:175:17: note: in expansion of macro '=
bond_opt_initval'
              |  175 |                 bond_opt_initval(&newval, mode);
              |      |                 ^~~~~~~~~~~~~~~~
              |
              +--> '__bond_opt_init': event 9
                     |
                     |include/net/bond_options.h:124:20:
                     |  124 | static inline void __bond_opt_init(struct bon=
d_opt_value *optval,
                     |      |                    ^~~~~~~~~~~~~~~
                     |      |                    |
                     |      |                    (9) entry to '__bond_opt_i=
nit'
                     |
                   '__bond_opt_init': event 10
                     |
                     |include/linux/fortify-string.h:207:12:
                     |  207 |         if (p_size < size)
                     |      |            ^
                     |      |            |
                     |      |            (10) following 'false' branch (whe=
n 'p_size > 39')...
                     |
                   '__bond_opt_init': event 11
                     |
                     |   43 | #define __underlying_memset     __builtin_mem=
set
                     |      |                                 ^
                     |      |                                 |
                     |      |                                 (11) ...to he=
re
   include/linux/fortify-string.h:209:16: note: in expansion of macro '__un=
derlying_memset'
                     |  209 |         return __underlying_memset(p, c, size=
);
                     |      |                ^~~~~~~~~~~~~~~~~~~
                     |
                   '__bond_opt_init': events 12-16
                     |
                     |include/net/bond_options.h:130:12:
                     |  130 |         if (value !=3D ULLONG_MAX)
                     |      |            ^
                     |      |            |
                     |      |            (12) following 'false' branch (whe=
n 'value =3D=3D 18446744073709551615')...
                     |  131 |                 optval->value =3D value;
                     |  132 |         else if (string)
                     |      |                 ~
                     |      |                 |
                     |      |                 (13) ...to here
                     |      |                 (14) following 'false' branch=
 (when 'string' is NULL)...
                     |  133 |                 optval->string =3D string;
                     |  134 |         else if (extra_len <=3D BOND_OPT_EXTR=
A_MAXLEN)
                     |      |                 ~
                     |      |                 |
                     |      |                 (15) ...to here
                     |      |                 (16) following 'true' branch =
(when 'extra_len <=3D 16')...
--
   In file included from include/linux/string.h:253,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/uio.h:10,
                    from include/linux/socket.h:8,
                    from include/uapi/linux/if.h:25,
                    from drivers/net/bonding/bond_options.c:9:
   drivers/net/bonding/bond_options.c: In function '__bond_opt_init':
>> include/linux/fortify-string.h:41:33: warning: use of NULL 'extra' where=
 non-null expected [CWE-476] [-Wanalyzer-null-argument]
      41 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:225:16: note: in expansion of macro '__un=
derlying_memcpy'
     225 |         return __underlying_memcpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~
     'bond_opt_tryset_rtnl': events 1-2
       |
       |drivers/net/bonding/bond_options.c:764:5:
       |  764 | int bond_opt_tryset_rtnl(struct bonding *bond, unsigned int=
 option, char *buf)
       |      |     ^~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'bond_opt_tryset_rtnl'
       |......
       |  769 |         if (!rtnl_trylock())
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |
     'bond_opt_tryset_rtnl': event 3
       |
       |include/net/bond_options.h:138:39:
       |  138 | #define bond_opt_initstr(optval, str) __bond_opt_init(optva=
l, str, ULLONG_MAX, NULL, 0)
       |      |                                       ^~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                       |
       |      |                                       (3) ...to here
   drivers/net/bonding/bond_options.c:771:9: note: in expansion of macro 'b=
ond_opt_initstr'
       |  771 |         bond_opt_initstr(&optval, buf);
       |      |         ^~~~~~~~~~~~~~~~
       |
     'bond_opt_tryset_rtnl': event 4
       |
       |include/net/bond_options.h:138:39:
       |  138 | #define bond_opt_initstr(optval, str) __bond_opt_init(optva=
l, str, ULLONG_MAX, NULL, 0)
       |      |                                       ^~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                       |
       |      |                                       (4) calling '__bond_o=
pt_init' from 'bond_opt_tryset_rtnl'
   drivers/net/bonding/bond_options.c:771:9: note: in expansion of macro 'b=
ond_opt_initstr'
       |  771 |         bond_opt_initstr(&optval, buf);
       |      |         ^~~~~~~~~~~~~~~~
       |
       +--> '__bond_opt_init': event 5
              |
              |include/net/bond_options.h:124:20:
              |  124 | static inline void __bond_opt_init(struct bond_opt_v=
alue *optval,
              |      |                    ^~~~~~~~~~~~~~~
              |      |                    |
              |      |                    (5) entry to '__bond_opt_init'
              |
            '__bond_opt_init': event 6
              |
              |include/linux/fortify-string.h:207:12:
              |  207 |         if (p_size < size)
              |      |            ^
              |      |            |
              |      |            (6) following 'false' branch (when 'p_siz=
e > 39')...
              |
            '__bond_opt_init': event 7
              |
              |   43 | #define __underlying_memset     __builtin_memset
              |      |                                 ^
              |      |                                 |
              |      |                                 (7) ...to here
   include/linux/fortify-string.h:209:16: note: in expansion of macro '__un=
derlying_memset'
              |  209 |         return __underlying_memset(p, c, size);
              |      |                ^~~~~~~~~~~~~~~~~~~
              |
            '__bond_opt_init': events 8-13
              |
              |include/net/bond_options.h:130:12:
              |  130 |         if (value !=3D ULLONG_MAX)
              |      |            ^
              |      |            |
              |      |            (8) following 'false' branch (when 'value=
 =3D=3D 18446744073709551615')...
              |  131 |                 optval->value =3D value;
              |  132 |         else if (string)
              |      |                 ~
              |      |                 |
              |      |                 (9) ...to here
              |      |                 (10) following 'false' branch (when =
'string' is NULL)...
              |  133 |                 optval->string =3D string;
              |  134 |         else if (extra_len <=3D BOND_OPT_EXTRA_MAXLE=
N)
              |      |                 ~
              |      |                 |
              |      |                 (11) ...to here
              |      |                 (12) following 'true' branch (when '=
extra_len <=3D 16')...
              |  135 |                 memcpy(optval->extra, extra, extra_l=
en);
              |      |                        ~~~~~~~~~~~~~
              |      |                              |
              |      |                              (13) ...to here
              |
            '__bond_opt_init': event 14
              |
              |include/linux/fortify-string.h:223:12:
              |  223 |         if (p_size < size || q_size < size)
              |      |            ^
              |      |            |
              |      |            (14) following 'false' branch...
              |
            '__bond_opt_init': event 15
              |

vim +/extra +41 include/linux/fortify-string.h

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
--===============2974377099811812920==--

