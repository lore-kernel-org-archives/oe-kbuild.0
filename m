Content-Type: multipart/mixed; boundary="===============1526285876333689956=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:bpf/bpf-next/master 186/270] net/ipv4/tcp_bpf.c:354:4: warning: Argument to kfree() is the address of the local variable 'tmp', which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
Date: Wed, 23 Mar 2022 09:35:49 +0800
Message-ID: <202203230906.D7fHJVsd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1526285876333689956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Wang Yufen <wangyufen@huawei.com>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://github.com/ammarfaizi2/linux-block bpf/bpf-next/master
head:   7f0059b58f0257d895fafd2f2e3afe3bbdf21e64
commit: 2486ab434b2c2a14e9237296db00b1e1b7ae3273 [186/270] bpf, sockmap: Fi=
x double uncharge the mem of sk_msg
:::::: branch date: 7 hours ago
:::::: commit date: 7 days ago
config: riscv-randconfig-c006-20220322 (https://download.01.org/0day-ci/arc=
hive/20220323/202203230906.D7fHJVsd-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f47=
08fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/2486ab434b2c2a1=
4e9237296db00b1e1b7ae3273
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block bpf/bpf-next/master
        git checkout 2486ab434b2c2a14e9237296db00b1e1b7ae3273
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/skbuff.h:2605:1: note: Returning without writing to 'skb->=
end'
   }
   ^
   net/ipv4/raw.c:376:2: note: Returning from 'skb_reserve'
           skb_reserve(skb, hlen);
           ^~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/raw.c:381:2: note: Calling 'skb_dst_set'
           skb_dst_set(skb, &rt->dst);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:1131:21: note: 'dst' is non-null
           skb->slow_gro |=3D !!dst;
                              ^~~
   include/linux/skbuff.h:1133:1: note: Returning without writing to 'skb->=
end'
   }
   ^
   net/ipv4/raw.c:381:2: note: Returning from 'skb_dst_set'
           skb_dst_set(skb, &rt->dst);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/raw.c:384:2: note: Calling 'skb_reset_network_header'
           skb_reset_network_header(skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2746:1: note: Returning without writing to 'skb->=
end'
   }
   ^
   net/ipv4/raw.c:384:2: note: Returning from 'skb_reset_network_header'
           skb_reset_network_header(skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/raw.c:386:2: note: Value assigned to field 'end'
           skb_put(skb, length);
           ^~~~~~~~~~~~~~~~~~~~
   net/ipv4/raw.c:390:2: note: Calling 'skb_setup_tx_timestamp'
           skb_setup_tx_timestamp(skb, sockc->tsflags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2698:39: note: Passing value via 3rd parameter 'tx_fl=
ags'
           _sock_tx_timestamp(skb->sk, tsflags, &skb_shinfo(skb)->tx_flags,
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2698:2: note: Calling '_sock_tx_timestamp'
           _sock_tx_timestamp(skb->sk, tsflags, &skb_shinfo(skb)->tx_flags,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2680:6: note: Assuming 'tsflags' is not equal to 0
           if (unlikely(tsflags)) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/net/sock.h:2680:2: note: Taking true branch
           if (unlikely(tsflags)) {
           ^
   include/net/sock.h:2682:7: note: Assuming the condition is true
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2682:7: note: Left side of '&&' is true
   include/net/sock.h:2682:44: note: Assuming 'tskey' is null
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                                                            ^~~~~
   include/net/sock.h:2682:7: note: Assuming pointer value is null
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2682:50: note: Left side of '&&' is false
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                                                                  ^
   include/net/sock.h:2686:6: note: Assuming the condition is false
           if (unlikely(sock_flag(sk, SOCK_WIFI_STATUS)))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/net/sock.h:2686:2: note: Taking true branch
           if (unlikely(sock_flag(sk, SOCK_WIFI_STATUS)))
           ^
   include/net/sock.h:2687:13: note: Dereference of null pointer (loaded fr=
om variable 'tx_flags')
                   *tx_flags |=3D SKBTX_WIFI_STATUS;
                    ~~~~~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> net/ipv4/tcp_bpf.c:354:4: warning: Argument to kfree() is the address of=
 the local variable 'tmp', which is not memory allocated by malloc() [clang=
-analyzer-unix.Malloc]
                           kfree(msg);
                           ^
   net/ipv4/tcp_bpf.c:483:16: note: 'psock' is non-null
           if (unlikely(!psock))
                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/ipv4/tcp_bpf.c:483:2: note: Taking false branch
           if (unlikely(!psock))
           ^
   net/ipv4/tcp_bpf.c:487:6: note: Assuming field 'cork' is null
           if (psock->cork) {
               ^~~~~~~~~~~
   net/ipv4/tcp_bpf.c:487:2: note: Taking false branch
           if (psock->cork) {
           ^
   net/ipv4/tcp_bpf.c:495:2: note: Taking false branch
           if (unlikely(sk_msg_full(msg)))
           ^
   net/ipv4/tcp_bpf.c:501:2: note: Taking false branch
           if (sk_msg_full(msg))
           ^
   net/ipv4/tcp_bpf.c:503:6: note: Assuming field 'cork_bytes' is 0
           if (psock->cork_bytes) {
               ^~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bpf.c:503:2: note: Taking false branch
           if (psock->cork_bytes) {
           ^
   net/ipv4/tcp_bpf.c:515:8: note: Calling 'tcp_bpf_send_verdict'
           err =3D tcp_bpf_send_verdict(sk, psock, msg, &copied, flags);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bpf.c:287:6: note: Assuming field 'eval' is equal to __SK_N=
ONE
           if (psock->eval =3D=3D __SK_NONE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bpf.c:287:2: note: Taking true branch
           if (psock->eval =3D=3D __SK_NONE) {
           ^
   net/ipv4/tcp_bpf.c:298:6: note: Assuming field 'cork_bytes' is 0
           if (msg->cork_bytes &&
               ^~~~~~~~~~~~~~~
   net/ipv4/tcp_bpf.c:298:22: note: Left side of '&&' is false
           if (msg->cork_bytes &&
                               ^
   net/ipv4/tcp_bpf.c:312:6: note: Assuming field 'apply_bytes' is not equa=
l to 0
           if (psock->apply_bytes && psock->apply_bytes < tosend)
               ^~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bpf.c:312:6: note: Left side of '&&' is true
   net/ipv4/tcp_bpf.c:312:28: note: Assuming 'tosend' is <=3D field 'apply_=
bytes'
           if (psock->apply_bytes && psock->apply_bytes < tosend)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bpf.c:312:2: note: Taking false branch
           if (psock->apply_bytes && psock->apply_bytes < tosend)
           ^
   net/ipv4/tcp_bpf.c:315:2: note: Control jumps to 'case __SK_REDIRECT:'  =
at line 324
           switch (psock->eval) {
           ^
   net/ipv4/tcp_bpf.c:327:7: note: Assuming field 'apply_bytes' is not equa=
l to 0
                   if (!psock->apply_bytes) {
                       ^~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bpf.c:327:3: note: Taking false branch
                   if (!psock->apply_bytes) {
                   ^
   net/ipv4/tcp_bpf.c:333:7: note: Assuming field 'cork' is non-null
                   if (psock->cork) {
                       ^~~~~~~~~~~
   net/ipv4/tcp_bpf.c:333:3: note: Taking true branch
                   if (psock->cork) {
                   ^
   net/ipv4/tcp_bpf.c:342:7: note: 'eval' is not equal to __SK_REDIRECT
                   if (eval =3D=3D __SK_REDIRECT)
                       ^~~~
   net/ipv4/tcp_bpf.c:342:3: note: Taking false branch
                   if (eval =3D=3D __SK_REDIRECT)
                   ^
   net/ipv4/tcp_bpf.c:346:3: note: Taking true branch
                   if (unlikely(ret < 0)) {
                   ^
   net/ipv4/tcp_bpf.c:349:9: note: 'cork' is true
                           if (!cork)
                                ^~~~
   net/ipv4/tcp_bpf.c:349:4: note: Taking false branch
                           if (!cork)
                           ^
   net/ipv4/tcp_bpf.c:352:7: note: 'cork' is true
                   if (cork) {
                       ^~~~
   net/ipv4/tcp_bpf.c:352:3: note: Taking true branch
                   if (cork) {
                   ^
   net/ipv4/tcp_bpf.c:354:4: note: Argument to kfree() is the address of th=
e local variable 'tmp', which is not memory allocated by malloc()
                           kfree(msg);
                           ^     ~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/soundwire/bus.c:1235:6: warning: The result of the left shift is=
 undefined due to shifting by '255', which is greater or equal to the width=
 of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (BIT(scale_index) !=3D scale || scale_index > 6) {
               ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'

vim +/tmp +354 net/ipv4/tcp_bpf.c

c0fd336ea4ca82 YueHaibing      2020-03-20  276  =

604326b41a6fb9 Daniel Borkmann 2018-10-13  277  static int tcp_bpf_send_ver=
dict(struct sock *sk, struct sk_psock *psock,
604326b41a6fb9 Daniel Borkmann 2018-10-13  278  				struct sk_msg *msg, int=
 *copied, int flags)
604326b41a6fb9 Daniel Borkmann 2018-10-13  279  {
031097d9e079e4 Jakub Kicinski  2019-11-27  280  	bool cork =3D false, enosp=
c =3D sk_msg_full(msg);
604326b41a6fb9 Daniel Borkmann 2018-10-13  281  	struct sock *sk_redir;
7246d8ed4dcce2 John Fastabend  2018-11-26  282  	u32 tosend, delta =3D 0;
cd9733f5d75c94 Liu Jian        2021-10-12  283  	u32 eval =3D __SK_NONE;
604326b41a6fb9 Daniel Borkmann 2018-10-13  284  	int ret;
604326b41a6fb9 Daniel Borkmann 2018-10-13  285  =

604326b41a6fb9 Daniel Borkmann 2018-10-13  286  more_data:
7246d8ed4dcce2 John Fastabend  2018-11-26  287  	if (psock->eval =3D=3D __S=
K_NONE) {
7246d8ed4dcce2 John Fastabend  2018-11-26  288  		/* Track delta in msg siz=
e to add/subtract it on SK_DROP from
7246d8ed4dcce2 John Fastabend  2018-11-26  289  		 * returned to user copie=
d size. This ensures user doesn't
7246d8ed4dcce2 John Fastabend  2018-11-26  290  		 * get a positive return =
code with msg_cut_data and SK_DROP
7246d8ed4dcce2 John Fastabend  2018-11-26  291  		 * verdict.
7246d8ed4dcce2 John Fastabend  2018-11-26  292  		 */
7246d8ed4dcce2 John Fastabend  2018-11-26  293  		delta =3D msg->sg.size;
604326b41a6fb9 Daniel Borkmann 2018-10-13  294  		psock->eval =3D sk_psock_=
msg_verdict(sk, psock, msg);
7246d8ed4dcce2 John Fastabend  2018-11-26  295  		delta -=3D msg->sg.size;
7246d8ed4dcce2 John Fastabend  2018-11-26  296  	}
604326b41a6fb9 Daniel Borkmann 2018-10-13  297  =

604326b41a6fb9 Daniel Borkmann 2018-10-13  298  	if (msg->cork_bytes &&
604326b41a6fb9 Daniel Borkmann 2018-10-13  299  	    msg->cork_bytes > msg-=
>sg.size && !enospc) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  300  		psock->cork_bytes =3D msg=
->cork_bytes - msg->sg.size;
604326b41a6fb9 Daniel Borkmann 2018-10-13  301  		if (!psock->cork) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  302  			psock->cork =3D kzalloc(=
sizeof(*psock->cork),
604326b41a6fb9 Daniel Borkmann 2018-10-13  303  					      GFP_ATOMIC | __G=
FP_NOWARN);
604326b41a6fb9 Daniel Borkmann 2018-10-13  304  			if (!psock->cork)
604326b41a6fb9 Daniel Borkmann 2018-10-13  305  				return -ENOMEM;
604326b41a6fb9 Daniel Borkmann 2018-10-13  306  		}
604326b41a6fb9 Daniel Borkmann 2018-10-13  307  		memcpy(psock->cork, msg, =
sizeof(*msg));
604326b41a6fb9 Daniel Borkmann 2018-10-13  308  		return 0;
604326b41a6fb9 Daniel Borkmann 2018-10-13  309  	}
604326b41a6fb9 Daniel Borkmann 2018-10-13  310  =

604326b41a6fb9 Daniel Borkmann 2018-10-13  311  	tosend =3D msg->sg.size;
604326b41a6fb9 Daniel Borkmann 2018-10-13  312  	if (psock->apply_bytes && =
psock->apply_bytes < tosend)
604326b41a6fb9 Daniel Borkmann 2018-10-13  313  		tosend =3D psock->apply_b=
ytes;
604326b41a6fb9 Daniel Borkmann 2018-10-13  314  =

604326b41a6fb9 Daniel Borkmann 2018-10-13  315  	switch (psock->eval) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  316  	case __SK_PASS:
604326b41a6fb9 Daniel Borkmann 2018-10-13  317  		ret =3D tcp_bpf_push(sk, =
msg, tosend, flags, true);
604326b41a6fb9 Daniel Borkmann 2018-10-13  318  		if (unlikely(ret)) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  319  			*copied -=3D sk_msg_free=
(sk, msg);
604326b41a6fb9 Daniel Borkmann 2018-10-13  320  			break;
604326b41a6fb9 Daniel Borkmann 2018-10-13  321  		}
604326b41a6fb9 Daniel Borkmann 2018-10-13  322  		sk_msg_apply_bytes(psock,=
 tosend);
604326b41a6fb9 Daniel Borkmann 2018-10-13  323  		break;
604326b41a6fb9 Daniel Borkmann 2018-10-13  324  	case __SK_REDIRECT:
604326b41a6fb9 Daniel Borkmann 2018-10-13  325  		sk_redir =3D psock->sk_re=
dir;
604326b41a6fb9 Daniel Borkmann 2018-10-13  326  		sk_msg_apply_bytes(psock,=
 tosend);
cd9733f5d75c94 Liu Jian        2021-10-12  327  		if (!psock->apply_bytes) {
cd9733f5d75c94 Liu Jian        2021-10-12  328  			/* Clean up before relea=
sing the sock lock. */
cd9733f5d75c94 Liu Jian        2021-10-12  329  			eval =3D psock->eval;
cd9733f5d75c94 Liu Jian        2021-10-12  330  			psock->eval =3D __SK_NON=
E;
cd9733f5d75c94 Liu Jian        2021-10-12  331  			psock->sk_redir =3D NULL;
cd9733f5d75c94 Liu Jian        2021-10-12  332  		}
604326b41a6fb9 Daniel Borkmann 2018-10-13  333  		if (psock->cork) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  334  			cork =3D true;
604326b41a6fb9 Daniel Borkmann 2018-10-13  335  			psock->cork =3D NULL;
604326b41a6fb9 Daniel Borkmann 2018-10-13  336  		}
84472b436e760b Wang Yufen      2022-03-04  337  		sk_msg_return(sk, msg, ms=
g->sg.size);
604326b41a6fb9 Daniel Borkmann 2018-10-13  338  		release_sock(sk);
cd9733f5d75c94 Liu Jian        2021-10-12  339  =

604326b41a6fb9 Daniel Borkmann 2018-10-13  340  		ret =3D tcp_bpf_sendmsg_r=
edir(sk_redir, msg, tosend, flags);
cd9733f5d75c94 Liu Jian        2021-10-12  341  =

cd9733f5d75c94 Liu Jian        2021-10-12  342  		if (eval =3D=3D __SK_REDI=
RECT)
cd9733f5d75c94 Liu Jian        2021-10-12  343  			sock_put(sk_redir);
cd9733f5d75c94 Liu Jian        2021-10-12  344  =

604326b41a6fb9 Daniel Borkmann 2018-10-13  345  		lock_sock(sk);
604326b41a6fb9 Daniel Borkmann 2018-10-13  346  		if (unlikely(ret < 0)) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  347  			int free =3D sk_msg_free=
_nocharge(sk, msg);
604326b41a6fb9 Daniel Borkmann 2018-10-13  348  =

604326b41a6fb9 Daniel Borkmann 2018-10-13  349  			if (!cork)
604326b41a6fb9 Daniel Borkmann 2018-10-13  350  				*copied -=3D free;
604326b41a6fb9 Daniel Borkmann 2018-10-13  351  		}
604326b41a6fb9 Daniel Borkmann 2018-10-13  352  		if (cork) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  353  			sk_msg_free(sk, msg);
604326b41a6fb9 Daniel Borkmann 2018-10-13 @354  			kfree(msg);
604326b41a6fb9 Daniel Borkmann 2018-10-13  355  			msg =3D NULL;
604326b41a6fb9 Daniel Borkmann 2018-10-13  356  			ret =3D 0;
604326b41a6fb9 Daniel Borkmann 2018-10-13  357  		}
604326b41a6fb9 Daniel Borkmann 2018-10-13  358  		break;
604326b41a6fb9 Daniel Borkmann 2018-10-13  359  	case __SK_DROP:
604326b41a6fb9 Daniel Borkmann 2018-10-13  360  	default:
604326b41a6fb9 Daniel Borkmann 2018-10-13  361  		sk_msg_free_partial(sk, m=
sg, tosend);
604326b41a6fb9 Daniel Borkmann 2018-10-13  362  		sk_msg_apply_bytes(psock,=
 tosend);
7246d8ed4dcce2 John Fastabend  2018-11-26  363  		*copied -=3D (tosend + de=
lta);
604326b41a6fb9 Daniel Borkmann 2018-10-13  364  		return -EACCES;
604326b41a6fb9 Daniel Borkmann 2018-10-13  365  	}
604326b41a6fb9 Daniel Borkmann 2018-10-13  366  =

604326b41a6fb9 Daniel Borkmann 2018-10-13  367  	if (likely(!ret)) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  368  		if (!psock->apply_bytes) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  369  			psock->eval =3D  __SK_NO=
NE;
604326b41a6fb9 Daniel Borkmann 2018-10-13  370  			if (psock->sk_redir) {
604326b41a6fb9 Daniel Borkmann 2018-10-13  371  				sock_put(psock->sk_redi=
r);
604326b41a6fb9 Daniel Borkmann 2018-10-13  372  				psock->sk_redir =3D NUL=
L;
604326b41a6fb9 Daniel Borkmann 2018-10-13  373  			}
604326b41a6fb9 Daniel Borkmann 2018-10-13  374  		}
604326b41a6fb9 Daniel Borkmann 2018-10-13  375  		if (msg &&
604326b41a6fb9 Daniel Borkmann 2018-10-13  376  		    msg->sg.data[msg->sg.=
start].page_link &&
84472b436e760b Wang Yufen      2022-03-04  377  		    msg->sg.data[msg->sg.=
start].length) {
84472b436e760b Wang Yufen      2022-03-04  378  			if (eval =3D=3D __SK_RED=
IRECT)
84472b436e760b Wang Yufen      2022-03-04  379  				sk_mem_charge(sk, msg->=
sg.size);
604326b41a6fb9 Daniel Borkmann 2018-10-13  380  			goto more_data;
604326b41a6fb9 Daniel Borkmann 2018-10-13  381  		}
84472b436e760b Wang Yufen      2022-03-04  382  	}
604326b41a6fb9 Daniel Borkmann 2018-10-13  383  	return ret;
604326b41a6fb9 Daniel Borkmann 2018-10-13  384  }
604326b41a6fb9 Daniel Borkmann 2018-10-13  385  =


:::::: The code at line 354 was first introduced by commit
:::::: 604326b41a6fb9b4a78b6179335decee0365cd8c bpf, sockmap: convert to ge=
neric sk_msg interface

:::::: TO: Daniel Borkmann <daniel@iogearbox.net>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1526285876333689956==--

