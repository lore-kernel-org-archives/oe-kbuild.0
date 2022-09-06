Content-Type: multipart/mixed; boundary="===============6450167341673653263=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/fortify-string.h:22:33: warning: use of NULL 'mpext' where non-null expected [CWE-476]
Date: Tue, 06 Sep 2022 08:20:41 +0800
Message-ID: <202209060859.PP9Zqz1D-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6450167341673653263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/fortify-string.h:22:33: warning: use of NULL 'mpext' where n=
on-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Paolo Abeni <pabeni@redhat.com>
CC: Mat Martineau <mathew.j.martineau@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   53e99dcff61e1523ec1c3628b2d564ba15d32eb7
commit: f70cad1085d1e01d3ec73c1078405f906237feee mptcp: stop relying on tcp=
_tx_skb_cache
date:   12 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-c001-20220905 (https://download.01.org/0day-ci/ar=
chive/20220906/202209060859.PP9Zqz1D-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df70cad1085d1e01d3ec73c1078405f906237feee
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f70cad1085d1e01d3ec73c1078405f906237feee
        # save the config file
        make ARCH=3Dx86_64 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/string.h:262,
                    from include/linux/bitmap.h:10,
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
                    from net/mptcp/protocol.c:10:
   net/mptcp/protocol.c: In function 'mptcp_sendmsg_frag':
>> include/linux/fortify-string.h:22:33: warning: use of NULL 'mpext' where=
 non-null expected [CWE-476] [-Wanalyzer-null-argument]
      22 | #define __underlying_memset     __builtin_memset
         |                                 ^
   include/linux/fortify-string.h:175:16: note: in expansion of macro '__un=
derlying_memset'
     175 |         return __underlying_memset(p, c, size);
         |                ^~~~~~~~~~~~~~~~~~~
     'mptcp_subflow_process_delegated': events 1-4
       |
       |net/mptcp/protocol.c:3045:6:
       | 3045 | void mptcp_subflow_process_delegated(struct sock *ssk)
       |      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |      |
       |      |      (1) entry to 'mptcp_subflow_process_delegated'
       |......
       | 3051 |         if (!sock_owned_by_user(sk))
       |      |            ~
       |      |            |
       |      |            (2) following 'true' branch...
       | 3052 |                 __mptcp_subflow_push_pending(sk, ssk);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (3) ...to here
       |      |                 (4) calling '__mptcp_subflow_push_pending' =
from 'mptcp_subflow_process_delegated'
       |
       +--> '__mptcp_subflow_push_pending': events 5-16
              |
              | 1593 | static void __mptcp_subflow_push_pending(struct sock=
 *sk, struct sock *ssk)
              |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (5) entry to '__mptcp_subflow_push_pendi=
ng'
              |......
              | 1605 |         while ((dfrag =3D mptcp_send_head(sk))) {
              |      |                ~
              |      |                |
              |      |                (6) following 'true' branch...
              | 1606 |                 info.sent =3D dfrag->already_sent;
              |      |                 ~~~~
              |      |                 |
              |      |                 (7) ...to here
              |......
              | 1609 |                 while (len > 0) {
              |      |                        ~~~~~~~
              |      |                            |
              |      |                            (8) following 'true' bran=
ch (when 'len > 0')...
              | 1610 |                         int ret =3D 0;
              |      |                         ~~~
              |      |                         |
              |      |                         (9) ...to here
              |......
              | 1616 |                         xmit_ssk =3D first ? ssk : m=
ptcp_subflow_get_send(mptcp_sk(sk));
              |      |                                    ~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                                                |
              |      |                                                (10) =
following 'true' branch (when 'first !=3D 0')...
              | 1617 |                         if (!xmit_ssk)
              |      |                         ~~ ~
              |      |                         |  |
              |      |                         |  (12) following 'false' br=
anch...
              |      |                         (11) ...to here
              | 1618 |                                 goto out;
              | 1619 |                         if (xmit_ssk !=3D ssk) {
              |      |                         ~~ ~
              |      |                         |  |
              |      |                         |  (14) following 'false' br=
anch...
              |      |                         (13) ...to here
              |......
              | 1624 |                         ret =3D mptcp_sendmsg_frag(s=
k, ssk, dfrag, &info);
              |      |                         ~~~   ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
              |      |                         |     |
              |      |                         |     (16) calling 'mptcp_se=
ndmsg_frag' from '__mptcp_subflow_push_pending'
              |      |                         (15) ...to here
              |
              +--> 'mptcp_sendmsg_frag': events 17-20
                     |
                     | 1278 | static int mptcp_sendmsg_frag(struct sock *sk=
, struct sock *ssk,
                     |      |            ^~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (17) entry to 'mptcp_sendmsg_frag'
                     |......
                     | 1296 |         if (WARN_ON_ONCE(info->sent > info->l=
imit ||
                     |      |            ~
                     |      |            |
                     |      |            (18) following 'false' branch...
                     |......
                     | 1301 |         info->mss_now =3D tcp_send_mss(ssk, &=
info->size_goal, info->flags);
                     |      |         ~~~~
                     |      |         |
                     |      |         (19) ...to here
                     |......
                     | 1328 |                 skb =3D mptcp_alloc_tx_skb(sk=
, ssk, info->data_lock_held);
                     |      |                       ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                       |
                     |      |                       (20) calling 'mptcp_all=
oc_tx_skb' from 'mptcp_sendmsg_frag'
                     |
                     +--> 'mptcp_alloc_tx_skb': events 21-22
                            |
                            | 1253 | static struct sk_buff *mptcp_alloc_tx_=
skb(struct sock *sk, struct sock *ssk, bool data_lock_held)
                            |      |                        ^~~~~~~~~~~~~~~=
~~~
                            |      |                        |
                            |      |                        (21) entry to '=
mptcp_alloc_tx_skb'
                            |......
                            | 1263 |         return __mptcp_alloc_tx_skb(sk=
, ssk, gfp);

vim +/mpext +22 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25   4  =

a28a6e860c6cf2 Francis Laniel 2021-02-25   5  =

a28a6e860c6cf2 Francis Laniel 2021-02-25   6  #if defined(CONFIG_KASAN_GENE=
RIC) || defined(CONFIG_KASAN_SW_TAGS)
a28a6e860c6cf2 Francis Laniel 2021-02-25   7  extern void *__underlying_mem=
chr(const void *p, int c, __kernel_size_t size) __RENAME(memchr);
a28a6e860c6cf2 Francis Laniel 2021-02-25   8  extern int __underlying_memcm=
p(const void *p, const void *q, __kernel_size_t size) __RENAME(memcmp);
a28a6e860c6cf2 Francis Laniel 2021-02-25   9  extern void *__underlying_mem=
cpy(void *p, const void *q, __kernel_size_t size) __RENAME(memcpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  10  extern void *__underlying_mem=
move(void *p, const void *q, __kernel_size_t size) __RENAME(memmove);
a28a6e860c6cf2 Francis Laniel 2021-02-25  11  extern void *__underlying_mem=
set(void *p, int c, __kernel_size_t size) __RENAME(memset);
a28a6e860c6cf2 Francis Laniel 2021-02-25  12  extern char *__underlying_str=
cat(char *p, const char *q) __RENAME(strcat);
a28a6e860c6cf2 Francis Laniel 2021-02-25  13  extern char *__underlying_str=
cpy(char *p, const char *q) __RENAME(strcpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  14  extern __kernel_size_t __unde=
rlying_strlen(const char *p) __RENAME(strlen);
a28a6e860c6cf2 Francis Laniel 2021-02-25  15  extern char *__underlying_str=
ncat(char *p, const char *q, __kernel_size_t count) __RENAME(strncat);
a28a6e860c6cf2 Francis Laniel 2021-02-25  16  extern char *__underlying_str=
ncpy(char *p, const char *q, __kernel_size_t size) __RENAME(strncpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  17  #else
a28a6e860c6cf2 Francis Laniel 2021-02-25  18  #define __underlying_memchr	_=
_builtin_memchr
a28a6e860c6cf2 Francis Laniel 2021-02-25  19  #define __underlying_memcmp	_=
_builtin_memcmp
a28a6e860c6cf2 Francis Laniel 2021-02-25  20  #define __underlying_memcpy	_=
_builtin_memcpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  21  #define __underlying_memmove	=
__builtin_memmove
a28a6e860c6cf2 Francis Laniel 2021-02-25 @22  #define __underlying_memset	_=
_builtin_memset
a28a6e860c6cf2 Francis Laniel 2021-02-25  23  #define __underlying_strcat	_=
_builtin_strcat
a28a6e860c6cf2 Francis Laniel 2021-02-25  24  #define __underlying_strcpy	_=
_builtin_strcpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  25  #define __underlying_strlen	_=
_builtin_strlen
a28a6e860c6cf2 Francis Laniel 2021-02-25  26  #define __underlying_strncat	=
__builtin_strncat
a28a6e860c6cf2 Francis Laniel 2021-02-25  27  #define __underlying_strncpy	=
__builtin_strncpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  28  #endif
a28a6e860c6cf2 Francis Laniel 2021-02-25  29  =


:::::: The code at line 22 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified fu=
nctions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6450167341673653263==--

