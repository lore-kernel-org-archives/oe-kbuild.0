Content-Type: multipart/mixed; boundary="===============8779074082322460223=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1911/4328] net/ipv4/tcp_cong.c:418:32: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Sun, 17 Apr 2022 17:25:32 +0800
Message-ID: <202204171743.qmKlw6vi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8779074082322460223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   40354149f4d738dc3492d9998e45b3f02950369a
commit: 40570375356c874b1578e05c1dcc3ff7c1322dbe [1911/4328] tcp: add acces=
sors to read/set tp->snd_cwnd
:::::: branch date: 3 days ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-c007-20220411 (https://download.01.org/0day-ci/ar=
chive/20220417/202204171743.qmKlw6vi-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f=
560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D40570375356c874b1578e05c1dcc3ff7c1322dbe
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 40570375356c874b1578e05c1dcc3ff7c1322dbe
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   crypto/cmac.c:188:4: note: Call to function 'memset' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memset_s' in case of C11
                           memset(p, 0, rlen);
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
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   102 warnings generated.
   Suppressed 102 warnings (102 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   106 warnings generated.
   net/ipv4/tcp_cong.c:147:9: warning: Call to function 'strncpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D strncpy(buffer, ca->name,
                         ^~~~~~~
   net/ipv4/tcp_cong.c:147:9: note: Call to function 'strncpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'strncpy_s' in case of C11
                   ret =3D strncpy(buffer, ca->name,
                         ^~~~~~~
   net/ipv4/tcp_cong.c:168:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(icsk->icsk_ca_priv, 0, sizeof(icsk->icsk_ca_priv));
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
   net/ipv4/tcp_cong.c:168:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(icsk->icsk_ca_priv, 0, sizeof(icsk->icsk_ca_priv));
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
   net/ipv4/tcp_cong.c:197:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(icsk->icsk_ca_priv, 0, sizeof(icsk->icsk_ca_priv));
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
   net/ipv4/tcp_cong.c:197:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(icsk->icsk_ca_priv, 0, sizeof(icsk->icsk_ca_priv));
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
   net/ipv4/tcp_cong.c:264:11: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   offs +=3D snprintf(buf + offs, maxlen - offs,
                           ^~~~~~~~
   net/ipv4/tcp_cong.c:264:11: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                   offs +=3D snprintf(buf + offs, maxlen - offs,
                           ^~~~~~~~
   net/ipv4/tcp_cong.c:281:2: warning: Call to function 'strncpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(name, ca->name, TCP_CA_NAME_MAX);
           ^~~~~~~
   net/ipv4/tcp_cong.c:281:2: note: Call to function 'strncpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'strncpy_s' in case of C11
           strncpy(name, ca->name, TCP_CA_NAME_MAX);
           ^~~~~~~
   net/ipv4/tcp_cong.c:296:11: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   offs +=3D snprintf(buf + offs, maxlen - offs,
                           ^~~~~~~~
   net/ipv4/tcp_cong.c:296:11: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                   offs +=3D snprintf(buf + offs, maxlen - offs,
                           ^~~~~~~~
>> net/ipv4/tcp_cong.c:418:32: warning: Division by zero [clang-analyzer-co=
re.DivideZero]
                   u32 delta =3D tp->snd_cwnd_cnt / w;
                                                ^
   net/ipv4/tcp_cong.c:438:2: note: Taking false branch
           if (!tcp_is_cwnd_limited(sk))
           ^
   net/ipv4/tcp_cong.c:442:2: note: Taking true branch
           if (tcp_in_slow_start(tp)) {
           ^
   net/ipv4/tcp_cong.c:443:11: note: Calling 'tcp_slow_start'
                   acked =3D tcp_slow_start(tp, acked);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_cong.c:396:13: note: Assuming '__UNIQUE_ID___x541' is >=3D =
'__UNIQUE_ID___y542'
           u32 cwnd =3D min(tcp_snd_cwnd(tp) + acked, tp->snd_ssthresh);
                      ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   net/ipv4/tcp_cong.c:396:13: note: '?' condition is false
           u32 cwnd =3D min(tcp_snd_cwnd(tp) + acked, tp->snd_ssthresh);
                      ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   net/ipv4/tcp_cong.c:399:23: note: Assuming '__UNIQUE_ID___x543' is >=3D =
'__UNIQUE_ID___y544'
           tcp_snd_cwnd_set(tp, min(cwnd, tp->snd_cwnd_clamp));
                                ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   net/ipv4/tcp_cong.c:399:23: note: '?' condition is false
           tcp_snd_cwnd_set(tp, min(cwnd, tp->snd_cwnd_clamp));
                                ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   net/ipv4/tcp_cong.c:399:23: note: Passing value via 2nd parameter 'val'
           tcp_snd_cwnd_set(tp, min(cwnd, tp->snd_cwnd_clamp));
                                ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:2: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
           ^~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_cong.c:399:2: note: Calling 'tcp_snd_cwnd_set'
           tcp_snd_cwnd_set(tp, min(cwnd, tp->snd_cwnd_clamp));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/tcp.h:1217:15: note: Assuming 'val' is <=3D 0
           WARN_ON_ONCE((int)val <=3D 0);
                        ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   include/net/tcp.h:1217:2: note: Taking true branch
           WARN_ON_ONCE((int)val <=3D 0);
           ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/net/tcp.h:1217:2: note: Loop condition is false.  Exiting loop
           WARN_ON_ONCE((int)val <=3D 0);
           ^
   include/asm-generic/bug.h:106:3: note: expanded from macro 'WARN_ON_ONCE'
                   __WARN_FLAGS(BUGFLAG_ONCE |                     \

vim +418 net/ipv4/tcp_cong.c

40efc6fa179f44 Stephen Hemminger 2006-01-03  404  =

814d488c612605 Neal Cardwell     2015-01-28  405  /* In theory this is tp->=
snd_cwnd +=3D 1 / tp->snd_cwnd (or alternative w),
814d488c612605 Neal Cardwell     2015-01-28  406   * for every packet that =
was ACKed.
814d488c612605 Neal Cardwell     2015-01-28  407   */
e73ebb0881ea55 Neal Cardwell     2015-01-28  408  void tcp_cong_avoid_ai(st=
ruct tcp_sock *tp, u32 w, u32 acked)
758ce5c8d11d6f Ilpo J=C3=A4rvinen     2009-02-28  409  {
9949afa42be0b7 Neal Cardwell     2015-03-10  410  	/* If credits accumulate=
d at a higher w, apply them gently now. */
9949afa42be0b7 Neal Cardwell     2015-03-10  411  	if (tp->snd_cwnd_cnt >=
=3D w) {
9949afa42be0b7 Neal Cardwell     2015-03-10  412  		tp->snd_cwnd_cnt =3D 0;
40570375356c87 Eric Dumazet      2022-04-05  413  		tcp_snd_cwnd_set(tp, tc=
p_snd_cwnd(tp) + 1);
9949afa42be0b7 Neal Cardwell     2015-03-10  414  	}
9949afa42be0b7 Neal Cardwell     2015-03-10  415  =

e73ebb0881ea55 Neal Cardwell     2015-01-28  416  	tp->snd_cwnd_cnt +=3D ac=
ked;
758ce5c8d11d6f Ilpo J=C3=A4rvinen     2009-02-28  417  	if (tp->snd_cwnd_cn=
t >=3D w) {
814d488c612605 Neal Cardwell     2015-01-28 @418  		u32 delta =3D tp->snd_c=
wnd_cnt / w;
814d488c612605 Neal Cardwell     2015-01-28  419  =

814d488c612605 Neal Cardwell     2015-01-28  420  		tp->snd_cwnd_cnt -=3D d=
elta * w;
40570375356c87 Eric Dumazet      2022-04-05  421  		tcp_snd_cwnd_set(tp, tc=
p_snd_cwnd(tp) + delta);
758ce5c8d11d6f Ilpo J=C3=A4rvinen     2009-02-28  422  	}
40570375356c87 Eric Dumazet      2022-04-05  423  	tcp_snd_cwnd_set(tp, min=
(tcp_snd_cwnd(tp), tp->snd_cwnd_clamp));
758ce5c8d11d6f Ilpo J=C3=A4rvinen     2009-02-28  424  }
758ce5c8d11d6f Ilpo J=C3=A4rvinen     2009-02-28  425  EXPORT_SYMBOL_GPL(tc=
p_cong_avoid_ai);
758ce5c8d11d6f Ilpo J=C3=A4rvinen     2009-02-28  426  =


:::::: The code at line 418 was first introduced by commit
:::::: 814d488c61260521b1b3cc97063700a5a6667c8f tcp: fix the timid additive=
 increase on stretch ACKs

:::::: TO: Neal Cardwell <ncardwell@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8779074082322460223==--

