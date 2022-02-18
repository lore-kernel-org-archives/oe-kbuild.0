Content-Type: multipart/mixed; boundary="===============1041370447025020523=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next 8/9] net: tcp: use tcp_drop_reason() for tcp_data_queue()
Date: Fri, 18 Feb 2022 08:13:52 +0800
Message-ID: <202202180859.0jwsUrAj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1041370447025020523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220216035426.2233808-9-imagedong@tencent.com>
References: <20220216035426.2233808-9-imagedong@tencent.com>
TO: menglong8.dong(a)gmail.com
TO: dsahern(a)kernel.org
TO: kuba(a)kernel.org
CC: edumazet(a)google.com
CC: davem(a)davemloft.net
CC: rostedt(a)goodmis.org
CC: mingo(a)redhat.com
CC: yoshfuji(a)linux-ipv6.org
CC: ast(a)kernel.org
CC: daniel(a)iogearbox.net
CC: hawk(a)kernel.org
CC: john.fastabend(a)gmail.com
CC: imagedong(a)tencent.com
CC: talalahmad(a)google.com
CC: keescook(a)chromium.org
CC: ilias.apalodimas(a)linaro.org
CC: alobakin(a)pm.me
CC: memxor(a)gmail.com
CC: atenart(a)kernel.org
CC: bigeasy(a)linutronix.de
CC: pabeni(a)redhat.com
CC: linyunsheng(a)huawei.com
CC: arnd(a)arndb.de
CC: yajun.deng(a)linux.dev
CC: roopa(a)nvidia.com
CC: willemb(a)google.com
CC: vvs(a)virtuozzo.com
CC: cong.wang(a)bytedance.com
CC: luiz.von.dentz(a)intel.com
CC: linux-kernel(a)vger.kernel.org
CC: netdev(a)vger.kernel.org

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/menglong8-dong-gmail-com/n=
et-add-skb-drop-reasons-to-TCP-packet-receive/20220216-115735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
b0471c26108160217fc17acec4a9fdce92aaeeea
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20218/202202180859.0jwsUrAj-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a=
783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d3fa06a06317774b62dc4ffa9=
3cf2a8ee67508ef
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review menglong8-dong-gmail-com/net-add-s=
kb-drop-reasons-to-TCP-packet-receive/20220216-115735
        git checkout d3fa06a06317774b62dc4ffa93cf2a8ee67508ef
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:639:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1036:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:639:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:1036:3: note: Loop condition is false.  Exiting loop
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   include/linux/hid.h:1037:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:656:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:640:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   fs/cifs/smb2ops.c:4216:3: warning: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(message, "R");
                   ^~~~~~
   fs/cifs/smb2ops.c:4216:3: note: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119
                   strcat(message, "R");
                   ^~~~~~
   fs/cifs/smb2ops.c:4220:3: warning: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(message, "H");
                   ^~~~~~
   fs/cifs/smb2ops.c:4220:3: note: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119
                   strcat(message, "H");
                   ^~~~~~
   fs/cifs/smb2ops.c:4224:3: warning: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(message, "W");
                   ^~~~~~
   fs/cifs/smb2ops.c:4224:3: note: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119
                   strcat(message, "W");
                   ^~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   fs/cifs/smb2transport.c:442:3: warning: Value stored to 'rc' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   rc =3D generate_key(ses, ptriplet->encryption.label,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2transport.c:442:3: note: Value stored to 'rc' is never read
                   rc =3D generate_key(ses, ptriplet->encryption.label,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   net/ipv4/tcp_input.c:3404:3: warning: Value stored to 'icsk' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   icsk =3D inet_csk(sk);
                   ^      ~~~~~~~~~~~~
   net/ipv4/tcp_input.c:3404:3: note: Value stored to 'icsk' is never read
                   icsk =3D inet_csk(sk);
                   ^      ~~~~~~~~~~~~
>> net/ipv4/tcp_input.c:5010:2: warning: Value stored to 'reason' is never =
read [clang-analyzer-deadcode.DeadStores]
           reason =3D SKB_DROP_REASON_NOT_SPECIFIED;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_input.c:5010:2: note: Value stored to 'reason' is never read
           reason =3D SKB_DROP_REASON_NOT_SPECIFIED;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_input.c:5334:11: warning: Access to field 'truesize' result=
s in a dereference of a null pointer [clang-analyzer-core.NullDereference]
                   goal -=3D rb_to_skb(node)->truesize;
                           ^
   include/linux/skbuff.h:3658:23: note: expanded from macro 'rb_to_skb'
   #define rb_to_skb(rb) rb_entry_safe(rb, struct sk_buff, rbnode)
                         ^
   include/linux/rbtree.h:78:2: note: expanded from macro 'rb_entry_safe'
           ({ typeof(ptr) ____ptr =3D (ptr); \
           ^
   net/ipv4/tcp_input.c:5325:6: note: Left side of '||' is false
           if (RB_EMPTY_ROOT(&tp->out_of_order_queue))
               ^
   include/linux/rbtree.h:30:31: note: expanded from macro 'RB_EMPTY_ROOT'
   #define RB_EMPTY_ROOT(root)  (READ_ONCE((root)->rb_node) =3D=3D NULL)
                                 ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:316:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/ipv4/tcp_input.c:5325:6: note: Left side of '||' is false
           if (RB_EMPTY_ROOT(&tp->out_of_order_queue))
               ^
   include/linux/rbtree.h:30:31: note: expanded from macro 'RB_EMPTY_ROOT'
   #define RB_EMPTY_ROOT(root)  (READ_ONCE((root)->rb_node) =3D=3D NULL)
                                 ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:316:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/ipv4/tcp_input.c:5325:6: note: Left side of '||' is false
           if (RB_EMPTY_ROOT(&tp->out_of_order_queue))
               ^
   include/linux/rbtree.h:30:31: note: expanded from macro 'RB_EMPTY_ROOT'
   #define RB_EMPTY_ROOT(root)  (READ_ONCE((root)->rb_node) =3D=3D NULL)
                                 ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:316:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/ipv4/tcp_input.c:5325:6: note: Left side of '||' is true
           if (RB_EMPTY_ROOT(&tp->out_of_order_queue))
               ^
   include/linux/rbtree.h:30:31: note: expanded from macro 'RB_EMPTY_ROOT'
   #define RB_EMPTY_ROOT(root)  (READ_ONCE((root)->rb_node) =3D=3D NULL)
                                 ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   net/ipv4/tcp_input.c:5325:6: note: Taking false branch
           if (RB_EMPTY_ROOT(&tp->out_of_order_queue))
               ^
   include/linux/rbtree.h:30:31: note: expanded from macro 'RB_EMPTY_ROOT'
   #define RB_EMPTY_ROOT(root)  (READ_ONCE((root)->rb_node) =3D=3D NULL)
                                 ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:349:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:337:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:329:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/ipv4/tcp_input.c:5325:6: note: Loop condition is false.  Exiting loop
           if (RB_EMPTY_ROOT(&tp->out_of_order_queue))
               ^
   include/linux/rbtree.h:30:31: note: expanded from macro 'RB_EMPTY_ROOT'
   #define RB_EMPTY_ROOT(root)  (READ_ONCE((root)->rb_node) =3D=3D NULL)
                                 ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \

vim +/reason +5010 net/ipv4/tcp_input.c

03f45c883c6f39 Eric Dumazet             2018-04-16  4987  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  4988  static void tcp_d=
ata_queue(struct sock *sk, struct sk_buff *skb)
^1da177e4c3f41 Linus Torvalds           2005-04-16  4989  {
^1da177e4c3f41 Linus Torvalds           2005-04-16  4990  	struct tcp_sock =
*tp =3D tcp_sk(sk);
d3fa06a0631777 Menglong Dong            2022-02-16  4991  	enum skb_drop_re=
ason reason;
5357f0bd4edf0b Eric Dumazet             2017-08-01  4992  	bool fragstolen;
5357f0bd4edf0b Eric Dumazet             2017-08-01  4993  	int eaten;
^1da177e4c3f41 Linus Torvalds           2005-04-16  4994  =

6787b7e350d355 Jianguo Wu               2021-07-09  4995  	/* If a subflow =
has been reset, the packet should not continue
6787b7e350d355 Jianguo Wu               2021-07-09  4996  	 * to be process=
ed, drop the packet.
6787b7e350d355 Jianguo Wu               2021-07-09  4997  	 */
6787b7e350d355 Jianguo Wu               2021-07-09  4998  	if (sk_is_mptcp(=
sk) && !mptcp_incoming_options(sk, skb)) {
6787b7e350d355 Jianguo Wu               2021-07-09  4999  		__kfree_skb(skb=
);
6787b7e350d355 Jianguo Wu               2021-07-09  5000  		return;
6787b7e350d355 Jianguo Wu               2021-07-09  5001  	}
648ef4b88673da Mat Martineau            2020-01-21  5002  =

532182cd610782 Eric Dumazet             2016-04-01  5003  	if (TCP_SKB_CB(s=
kb)->seq =3D=3D TCP_SKB_CB(skb)->end_seq) {
532182cd610782 Eric Dumazet             2016-04-01  5004  		__kfree_skb(skb=
);
532182cd610782 Eric Dumazet             2016-04-01  5005  		return;
532182cd610782 Eric Dumazet             2016-04-01  5006  	}
f84af32cbca70a Eric Dumazet             2010-04-28  5007  	skb_dst_drop(skb=
);
155c6e1ad4a778 Peter Pan(=E6=BD=98=E5=8D=AB=E5=B9=B3         2014-09-24  50=
08) 	__skb_pull(skb, tcp_hdr(skb)->doff * 4);
^1da177e4c3f41 Linus Torvalds           2005-04-16  5009  =

d3fa06a0631777 Menglong Dong            2022-02-16 @5010  	reason =3D SKB_D=
ROP_REASON_NOT_SPECIFIED;
^1da177e4c3f41 Linus Torvalds           2005-04-16  5011  	tp->rx_opt.dsack=
 =3D 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  5012  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  5013  	/*  Queue data f=
or delivery to the user.
^1da177e4c3f41 Linus Torvalds           2005-04-16  5014  	 *  Packets in s=
equence go to the receive queue.
^1da177e4c3f41 Linus Torvalds           2005-04-16  5015  	 *  Out of seque=
nce packets to the out_of_order_queue.
^1da177e4c3f41 Linus Torvalds           2005-04-16  5016  	 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  5017  	if (TCP_SKB_CB(s=
kb)->seq =3D=3D tp->rcv_nxt) {
fb223502ec0889 Yafang Shao              2018-06-24  5018  		if (tcp_receive=
_window(tp) =3D=3D 0) {
d3fa06a0631777 Menglong Dong            2022-02-16  5019  			reason =3D SKB=
_DROP_REASON_TCP_ZEROWINDOW;
fb223502ec0889 Yafang Shao              2018-06-24  5020  			NET_INC_STATS(=
sock_net(sk), LINUX_MIB_TCPZEROWINDOWDROP);
^1da177e4c3f41 Linus Torvalds           2005-04-16  5021  			goto out_of_wi=
ndow;
fb223502ec0889 Yafang Shao              2018-06-24  5022  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  5023  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  5024  		/* Ok. In seque=
nce. In window. */
^1da177e4c3f41 Linus Torvalds           2005-04-16  5025  queue_and_out:
76dfa6082032b5 Eric Dumazet             2015-05-15  5026  		if (skb_queue_l=
en(&sk->sk_receive_queue) =3D=3D 0)
76dfa6082032b5 Eric Dumazet             2015-05-15  5027  			sk_forced_mem_=
schedule(sk, skb->truesize);
ea5d0c32498e1a Yafang Shao              2018-06-28  5028  		else if (tcp_tr=
y_rmem_schedule(sk, skb, skb->truesize)) {
d3fa06a0631777 Menglong Dong            2022-02-16  5029  			reason =3D SKB=
_DROP_REASON_PROTO_MEM;
ea5d0c32498e1a Yafang Shao              2018-06-28  5030  			NET_INC_STATS(=
sock_net(sk), LINUX_MIB_TCPRCVQDROP);
ba3bb0e76ccd46 Eric Dumazet             2020-06-30  5031  			sk->sk_data_re=
ady(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  5032  			goto drop;
ea5d0c32498e1a Yafang Shao              2018-06-28  5033  		}
5357f0bd4edf0b Eric Dumazet             2017-08-01  5034  =

e7395f1f4ba24d Eric Dumazet             2018-11-26  5035  		eaten =3D tcp_q=
ueue_rcv(sk, skb, &fragstolen);
^1da177e4c3f41 Linus Torvalds           2005-04-16  5036  		if (skb->len)
9e412ba7632f71 Ilpo J=C3=A4rvinen            2007-04-20  5037  			tcp_event=
_data_recv(sk, skb);
155c6e1ad4a778 Peter Pan(=E6=BD=98=E5=8D=AB=E5=B9=B3         2014-09-24  50=
38) 		if (TCP_SKB_CB(skb)->tcp_flags & TCPHDR_FIN)
20c4cb792de2b5 Eric Dumazet             2011-10-20  5039  			tcp_fin(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  5040  =

9f5afeae51526b Yaogong Wang             2016-09-07  5041  		if (!RB_EMPTY_R=
OOT(&tp->out_of_order_queue)) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  5042  			tcp_ofo_queue(=
sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  5043  =

15bdd5686c2c61 Yuchung Cheng            2018-08-09  5044  			/* RFC5681. 4.=
2. SHOULD send immediate ACK, when
^1da177e4c3f41 Linus Torvalds           2005-04-16  5045  			 * gap in queu=
e is filled.
^1da177e4c3f41 Linus Torvalds           2005-04-16  5046  			 */
9f5afeae51526b Yaogong Wang             2016-09-07  5047  			if (RB_EMPTY_R=
OOT(&tp->out_of_order_queue))
15bdd5686c2c61 Yuchung Cheng            2018-08-09  5048  				inet_csk(sk)-=
>icsk_ack.pending |=3D ICSK_ACK_NOW;
^1da177e4c3f41 Linus Torvalds           2005-04-16  5049  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  5050  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  5051  		if (tp->rx_opt.=
num_sacks)
^1da177e4c3f41 Linus Torvalds           2005-04-16  5052  			tcp_sack_remov=
e(tp);
^1da177e4c3f41 Linus Torvalds           2005-04-16  5053  =

31770e34e43d6c Florian Westphal         2017-08-30  5054  		tcp_fast_path_c=
heck(sk);
31770e34e43d6c Florian Westphal         2017-08-30  5055  =

923dd347b8904c Eric Dumazet             2012-05-02  5056  		if (eaten > 0)
923dd347b8904c Eric Dumazet             2012-05-02  5057  			kfree_skb_part=
ial(skb, fragstolen);
1d57f19539c074 Eric Dumazet             2012-09-17  5058  		if (!sock_flag(=
sk, SOCK_DEAD))
03f45c883c6f39 Eric Dumazet             2018-04-16  5059  			tcp_data_ready=
(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  5060  		return;
^1da177e4c3f41 Linus Torvalds           2005-04-16  5061  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  5062  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  5063  	if (!after(TCP_S=
KB_CB(skb)->end_seq, tp->rcv_nxt)) {
7788174e8726c3 Yuchung Cheng            2018-08-29  5064  		tcp_rcv_spuriou=
s_retrans(sk, skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  5065  		/* A retransmit=
, 2nd most common case.  Force an immediate ack. */
d3fa06a0631777 Menglong Dong            2022-02-16  5066  		reason =3D SKB_=
DROP_REASON_TCP_OLD_DATA;
c10d9310edf5aa Eric Dumazet             2016-04-29  5067  		NET_INC_STATS(s=
ock_net(sk), LINUX_MIB_DELAYEDACKLOST);
1ed834655a0d42 Pavel Emelyanov          2008-07-16  5068  		tcp_dsack_set(s=
k, TCP_SKB_CB(skb)->seq, TCP_SKB_CB(skb)->end_seq);
^1da177e4c3f41 Linus Torvalds           2005-04-16  5069  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  5070  out_of_window:
9a9c9b51e54618 Eric Dumazet             2018-05-21  5071  		tcp_enter_quick=
ack_mode(sk, TCP_MAX_QUICKACKS);
463c84b97f2401 Arnaldo Carvalho de Melo 2005-08-09  5072  		inet_csk_schedu=
le_ack(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  5073  drop:
d3fa06a0631777 Menglong Dong            2022-02-16  5074  		tcp_drop_reason=
(sk, skb, reason);
^1da177e4c3f41 Linus Torvalds           2005-04-16  5075  		return;
^1da177e4c3f41 Linus Torvalds           2005-04-16  5076  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  5077  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  5078  	/* Out of window=
. F.e. zero window probe. */
d3fa06a0631777 Menglong Dong            2022-02-16  5079  	if (!before(TCP_=
SKB_CB(skb)->seq,
d3fa06a0631777 Menglong Dong            2022-02-16  5080  		    tp->rcv_nxt=
 + tcp_receive_window(tp))) {
d3fa06a0631777 Menglong Dong            2022-02-16  5081  		reason =3D SKB_=
DROP_REASON_TCP_OVERWINDOW;
^1da177e4c3f41 Linus Torvalds           2005-04-16  5082  		goto out_of_win=
dow;
d3fa06a0631777 Menglong Dong            2022-02-16  5083  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  5084  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  5085  	if (before(TCP_S=
KB_CB(skb)->seq, tp->rcv_nxt)) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  5086  		/* Partial pack=
et, seq < rcv_next < end_seq */
1ed834655a0d42 Pavel Emelyanov          2008-07-16  5087  		tcp_dsack_set(s=
k, TCP_SKB_CB(skb)->seq, tp->rcv_nxt);
^1da177e4c3f41 Linus Torvalds           2005-04-16  5088  =

^1da177e4c3f41 Linus Torvalds           2005-04-16  5089  		/* If window is=
 closed, drop tail of packet. But after
^1da177e4c3f41 Linus Torvalds           2005-04-16  5090  		 * remembering =
D-SACK for its head made in previous line.
^1da177e4c3f41 Linus Torvalds           2005-04-16  5091  		 */
fb223502ec0889 Yafang Shao              2018-06-24  5092  		if (!tcp_receiv=
e_window(tp)) {
d3fa06a0631777 Menglong Dong            2022-02-16  5093  			reason =3D SKB=
_DROP_REASON_TCP_ZEROWINDOW;
fb223502ec0889 Yafang Shao              2018-06-24  5094  			NET_INC_STATS(=
sock_net(sk), LINUX_MIB_TCPZEROWINDOWDROP);
^1da177e4c3f41 Linus Torvalds           2005-04-16  5095  			goto out_of_wi=
ndow;
fb223502ec0889 Yafang Shao              2018-06-24  5096  		}
^1da177e4c3f41 Linus Torvalds           2005-04-16  5097  		goto queue_and_=
out;
^1da177e4c3f41 Linus Torvalds           2005-04-16  5098  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  5099  =

e86b291962cbf4 Eric Dumazet             2012-03-18  5100  	tcp_data_queue_o=
fo(sk, skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  5101  }
^1da177e4c3f41 Linus Torvalds           2005-04-16  5102  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1041370447025020523==--

