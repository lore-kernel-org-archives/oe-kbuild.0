Content-Type: multipart/mixed; boundary="===============6055193825953199103=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next] tcp: add accessors to read/set tp->snd_cwnd
Date: Fri, 08 Apr 2022 23:53:52 +0800
Message-ID: <202204082321.zN7WNaI9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6055193825953199103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220405233538.947344-1-eric.dumazet@gmail.com>
References: <20220405233538.947344-1-eric.dumazet@gmail.com>
TO: Eric Dumazet <eric.dumazet@gmail.com>

Hi Eric,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/tcp-add=
-accessors-to-read-set-tp-snd_cwnd/20220406-161903
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
89695196f0ba78a17453f9616355f2ca6b293402
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
408/202204082321.zN7WNaI9-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a1c4e7b0b591c2203bb=
d899b37c3ca442559734a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Eric-Dumazet/tcp-add-accessors-to-=
read-set-tp-snd_cwnd/20220406-161903
        git checkout a1c4e7b0b591c2203bbd899b37c3ca442559734a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   sound/soc/soc-dapm.c:1655:2: note: '?' condition is false
           if (power_up)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/soc/soc-dapm.c:1655:6: note: 'power_up' is true
           if (power_up)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   sound/soc/soc-dapm.c:1655:2: note: '?' condition is true
           if (power_up)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   sound/soc/soc-dapm.c:1655:2: note: Taking true branch
           if (power_up)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/soc/soc-dapm.c:1660:2: note: Loop condition is false. Execution co=
ntinues on line 1729
           list_for_each_entry_safe(w, n, list, power_list) {
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   sound/soc/soc-dapm.c:1729:6: note: Assuming the condition is false
           if (!list_empty(&pending))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/soc/soc-dapm.c:1729:2: note: '?' condition is false
           if (!list_empty(&pending))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/soc/soc-dapm.c:1729:6: note: Assuming the condition is true
           if (!list_empty(&pending))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   sound/soc/soc-dapm.c:1729:2: note: '?' condition is true
           if (!list_empty(&pending))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   sound/soc/soc-dapm.c:1729:2: note: Taking true branch
           if (!list_empty(&pending))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/soc/soc-dapm.c:1730:3: note: Calling 'dapm_seq_run_coalesced'
                   dapm_seq_run_coalesced(card, &pending);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-dapm.c:1594:6: note: Assigned value is garbage or undefined
           reg =3D w->reg;
               ^ ~~~~~~
   1 warning generated.
>> net/ipv4/tcp_cong.c:418:32: warning: Division by zero [clang-analyzer-co=
re.DivideZero]
                   u32 delta =3D tp->snd_cwnd_cnt / w;
                                                ^
   net/ipv4/tcp_cong.c:438:2: note: '?' condition is false
           if (!tcp_is_cwnd_limited(sk))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/ipv4/tcp_cong.c:438:2: note: '?' condition is false
           if (!tcp_is_cwnd_limited(sk))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/ipv4/tcp_cong.c:438:2: note: Taking false branch
           if (!tcp_is_cwnd_limited(sk))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/ipv4/tcp_cong.c:442:2: note: '?' condition is false
           if (tcp_in_slow_start(tp)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/ipv4/tcp_cong.c:442:2: note: '?' condition is true
           if (tcp_in_slow_start(tp)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/ipv4/tcp_cong.c:442:2: note: Taking true branch
           if (tcp_in_slow_start(tp)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
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
a1c4e7b0b591c2 Eric Dumazet      2022-04-05  413  		tcp_snd_cwnd_set(tp, tc=
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
a1c4e7b0b591c2 Eric Dumazet      2022-04-05  421  		tcp_snd_cwnd_set(tp, tc=
p_snd_cwnd(tp) + delta);
758ce5c8d11d6f Ilpo J=C3=A4rvinen     2009-02-28  422  	}
a1c4e7b0b591c2 Eric Dumazet      2022-04-05  423  	tcp_snd_cwnd_set(tp, min=
(tcp_snd_cwnd(tp), tp->snd_cwnd_clamp));
758ce5c8d11d6f Ilpo J=C3=A4rvinen     2009-02-28  424  }
758ce5c8d11d6f Ilpo J=C3=A4rvinen     2009-02-28  425  EXPORT_SYMBOL_GPL(tc=
p_cong_avoid_ai);
758ce5c8d11d6f Ilpo J=C3=A4rvinen     2009-02-28  426  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6055193825953199103==--

