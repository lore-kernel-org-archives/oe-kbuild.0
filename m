Content-Type: multipart/mixed; boundary="===============8280143869486823645=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6903/8646] net/ipv4/tcp_input.c:5010:2: warning: Value stored to 'reason' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 26 Feb 2022 12:34:56 +0800
Message-ID: <202202261220.JcaWXs0L-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8280143869486823645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Menglong Dong <imagedong@tencent.com>
CC: Mengen Sun <mengensun@tencent.com>
CC: Hao Peng <flyingpeng@tencent.com>
CC: Eric Dumazet <edumazet@google.com>
CC: David Ahern <dsahern@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   44948bd49d878dad6c9707e34f4a06df73c3a800
commit: a7ec381049c0d1f03e342063d75f5c3b314d0ec2 [6903/8646] net: tcp: use =
tcp_drop_reason() for tcp_data_queue()
:::::: branch date: 26 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20226/202202261220.JcaWXs0L-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Da7ec381049c0d1f03e342063d75f5c3b314d0ec2
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a7ec381049c0d1f03e342063d75f5c3b314d0ec2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/ocfs2/extent_map.c:491:7: note: Assuming the condition is false
                   if (i =3D=3D (le16_to_cpu(el->l_next_free_rec) - 1)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/extent_map.c:491:3: note: Taking false branch
                   if (i =3D=3D (le16_to_cpu(el->l_next_free_rec) - 1)) {
                   ^
   fs/ocfs2/extent_map.c:512:2: note: Returning without writing to '*hole_l=
en'
           return ret;
           ^
   fs/ocfs2/extent_map.c:512:2: note: Returning zero (loaded from 'ret'), w=
hich participates in a condition later
           return ret;
           ^~~~~~~~~~
   fs/ocfs2/extent_map.c:899:9: note: Returning from 'ocfs2_get_clusters_no=
cache'
                   ret =3D ocfs2_get_clusters_nocache(inode, di_bh, cpos, &=
hole_size,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   fs/ocfs2/extent_map.c:901:7: note: 'ret' is 0
                   if (ret) {
                       ^~~
   fs/ocfs2/extent_map.c:901:3: note: Taking false branch
                   if (ret) {
                   ^
   fs/ocfs2/extent_map.c:909:7: note: Assuming field 'e_blkno' is equal to 0
                   if (rec.e_blkno =3D=3D 0ULL) {
                       ^~~~~~~~~~~~~~~~~~~
   fs/ocfs2/extent_map.c:909:3: note: Taking true branch
                   if (rec.e_blkno =3D=3D 0ULL) {
                   ^
   fs/ocfs2/extent_map.c:910:9: note: Assigned value is garbage or undefined
                           clen =3D hole_size;
                                ^ ~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   include/linux/skbuff.h:3663:23: note: expanded from macro 'rb_to_skb'
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

03f45c883c6f391 Eric Dumazet             2018-04-16  4987  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  4988  static void tcp_=
data_queue(struct sock *sk, struct sk_buff *skb)
^1da177e4c3f415 Linus Torvalds           2005-04-16  4989  {
^1da177e4c3f415 Linus Torvalds           2005-04-16  4990  	struct tcp_sock=
 *tp =3D tcp_sk(sk);
a7ec381049c0d1f Menglong Dong            2022-02-20  4991  	enum skb_drop_r=
eason reason;
5357f0bd4edf0b3 Eric Dumazet             2017-08-01  4992  	bool fragstolen;
5357f0bd4edf0b3 Eric Dumazet             2017-08-01  4993  	int eaten;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4994  =

6787b7e350d3552 Jianguo Wu               2021-07-09  4995  	/* If a subflow=
 has been reset, the packet should not continue
6787b7e350d3552 Jianguo Wu               2021-07-09  4996  	 * to be proces=
sed, drop the packet.
6787b7e350d3552 Jianguo Wu               2021-07-09  4997  	 */
6787b7e350d3552 Jianguo Wu               2021-07-09  4998  	if (sk_is_mptcp=
(sk) && !mptcp_incoming_options(sk, skb)) {
6787b7e350d3552 Jianguo Wu               2021-07-09  4999  		__kfree_skb(sk=
b);
6787b7e350d3552 Jianguo Wu               2021-07-09  5000  		return;
6787b7e350d3552 Jianguo Wu               2021-07-09  5001  	}
648ef4b88673dad Mat Martineau            2020-01-21  5002  =

532182cd610782d Eric Dumazet             2016-04-01  5003  	if (TCP_SKB_CB(=
skb)->seq =3D=3D TCP_SKB_CB(skb)->end_seq) {
532182cd610782d Eric Dumazet             2016-04-01  5004  		__kfree_skb(sk=
b);
532182cd610782d Eric Dumazet             2016-04-01  5005  		return;
532182cd610782d Eric Dumazet             2016-04-01  5006  	}
f84af32cbca70a3 Eric Dumazet             2010-04-28  5007  	skb_dst_drop(sk=
b);
155c6e1ad4a778c Peter Pan(=E6=BD=98=E5=8D=AB=E5=B9=B3         2014-09-24  5=
008) 	__skb_pull(skb, tcp_hdr(skb)->doff * 4);
^1da177e4c3f415 Linus Torvalds           2005-04-16  5009  =

a7ec381049c0d1f Menglong Dong            2022-02-20 @5010  	reason =3D SKB_=
DROP_REASON_NOT_SPECIFIED;
^1da177e4c3f415 Linus Torvalds           2005-04-16  5011  	tp->rx_opt.dsac=
k =3D 0;
^1da177e4c3f415 Linus Torvalds           2005-04-16  5012  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  5013  	/*  Queue data =
for delivery to the user.
^1da177e4c3f415 Linus Torvalds           2005-04-16  5014  	 *  Packets in =
sequence go to the receive queue.
^1da177e4c3f415 Linus Torvalds           2005-04-16  5015  	 *  Out of sequ=
ence packets to the out_of_order_queue.
^1da177e4c3f415 Linus Torvalds           2005-04-16  5016  	 */
^1da177e4c3f415 Linus Torvalds           2005-04-16  5017  	if (TCP_SKB_CB(=
skb)->seq =3D=3D tp->rcv_nxt) {
fb223502ec08894 Yafang Shao              2018-06-24  5018  		if (tcp_receiv=
e_window(tp) =3D=3D 0) {
a7ec381049c0d1f Menglong Dong            2022-02-20  5019  			reason =3D SK=
B_DROP_REASON_TCP_ZEROWINDOW;
fb223502ec08894 Yafang Shao              2018-06-24  5020  			NET_INC_STATS=
(sock_net(sk), LINUX_MIB_TCPZEROWINDOWDROP);
^1da177e4c3f415 Linus Torvalds           2005-04-16  5021  			goto out_of_w=
indow;
fb223502ec08894 Yafang Shao              2018-06-24  5022  		}
^1da177e4c3f415 Linus Torvalds           2005-04-16  5023  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  5024  		/* Ok. In sequ=
ence. In window. */
^1da177e4c3f415 Linus Torvalds           2005-04-16  5025  queue_and_out:
76dfa6082032b5c Eric Dumazet             2015-05-15  5026  		if (skb_queue_=
len(&sk->sk_receive_queue) =3D=3D 0)
76dfa6082032b5c Eric Dumazet             2015-05-15  5027  			sk_forced_mem=
_schedule(sk, skb->truesize);
ea5d0c32498e1a0 Yafang Shao              2018-06-28  5028  		else if (tcp_t=
ry_rmem_schedule(sk, skb, skb->truesize)) {
a7ec381049c0d1f Menglong Dong            2022-02-20  5029  			reason =3D SK=
B_DROP_REASON_PROTO_MEM;
ea5d0c32498e1a0 Yafang Shao              2018-06-28  5030  			NET_INC_STATS=
(sock_net(sk), LINUX_MIB_TCPRCVQDROP);
ba3bb0e76ccd464 Eric Dumazet             2020-06-30  5031  			sk->sk_data_r=
eady(sk);
^1da177e4c3f415 Linus Torvalds           2005-04-16  5032  			goto drop;
ea5d0c32498e1a0 Yafang Shao              2018-06-28  5033  		}
5357f0bd4edf0b3 Eric Dumazet             2017-08-01  5034  =

e7395f1f4ba24dc Eric Dumazet             2018-11-26  5035  		eaten =3D tcp_=
queue_rcv(sk, skb, &fragstolen);
^1da177e4c3f415 Linus Torvalds           2005-04-16  5036  		if (skb->len)
9e412ba7632f712 Ilpo J=C3=A4rvinen            2007-04-20  5037  			tcp_even=
t_data_recv(sk, skb);
155c6e1ad4a778c Peter Pan(=E6=BD=98=E5=8D=AB=E5=B9=B3         2014-09-24  5=
038) 		if (TCP_SKB_CB(skb)->tcp_flags & TCPHDR_FIN)
20c4cb792de2b58 Eric Dumazet             2011-10-20  5039  			tcp_fin(sk);
^1da177e4c3f415 Linus Torvalds           2005-04-16  5040  =

9f5afeae51526b3 Yaogong Wang             2016-09-07  5041  		if (!RB_EMPTY_=
ROOT(&tp->out_of_order_queue)) {
^1da177e4c3f415 Linus Torvalds           2005-04-16  5042  			tcp_ofo_queue=
(sk);
^1da177e4c3f415 Linus Torvalds           2005-04-16  5043  =

15bdd5686c2c613 Yuchung Cheng            2018-08-09  5044  			/* RFC5681. 4=
.2. SHOULD send immediate ACK, when
^1da177e4c3f415 Linus Torvalds           2005-04-16  5045  			 * gap in que=
ue is filled.
^1da177e4c3f415 Linus Torvalds           2005-04-16  5046  			 */
9f5afeae51526b3 Yaogong Wang             2016-09-07  5047  			if (RB_EMPTY_=
ROOT(&tp->out_of_order_queue))
15bdd5686c2c613 Yuchung Cheng            2018-08-09  5048  				inet_csk(sk)=
->icsk_ack.pending |=3D ICSK_ACK_NOW;
^1da177e4c3f415 Linus Torvalds           2005-04-16  5049  		}
^1da177e4c3f415 Linus Torvalds           2005-04-16  5050  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  5051  		if (tp->rx_opt=
.num_sacks)
^1da177e4c3f415 Linus Torvalds           2005-04-16  5052  			tcp_sack_remo=
ve(tp);
^1da177e4c3f415 Linus Torvalds           2005-04-16  5053  =

31770e34e43d6c8 Florian Westphal         2017-08-30  5054  		tcp_fast_path_=
check(sk);
31770e34e43d6c8 Florian Westphal         2017-08-30  5055  =

923dd347b8904c2 Eric Dumazet             2012-05-02  5056  		if (eaten > 0)
923dd347b8904c2 Eric Dumazet             2012-05-02  5057  			kfree_skb_par=
tial(skb, fragstolen);
1d57f19539c0741 Eric Dumazet             2012-09-17  5058  		if (!sock_flag=
(sk, SOCK_DEAD))
03f45c883c6f391 Eric Dumazet             2018-04-16  5059  			tcp_data_read=
y(sk);
^1da177e4c3f415 Linus Torvalds           2005-04-16  5060  		return;
^1da177e4c3f415 Linus Torvalds           2005-04-16  5061  	}
^1da177e4c3f415 Linus Torvalds           2005-04-16  5062  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  5063  	if (!after(TCP_=
SKB_CB(skb)->end_seq, tp->rcv_nxt)) {
7788174e8726c30 Yuchung Cheng            2018-08-29  5064  		tcp_rcv_spurio=
us_retrans(sk, skb);
^1da177e4c3f415 Linus Torvalds           2005-04-16  5065  		/* A retransmi=
t, 2nd most common case.  Force an immediate ack. */
a7ec381049c0d1f Menglong Dong            2022-02-20  5066  		reason =3D SKB=
_DROP_REASON_TCP_OLD_DATA;
c10d9310edf5aa4 Eric Dumazet             2016-04-29  5067  		NET_INC_STATS(=
sock_net(sk), LINUX_MIB_DELAYEDACKLOST);
1ed834655a0d42e Pavel Emelyanov          2008-07-16  5068  		tcp_dsack_set(=
sk, TCP_SKB_CB(skb)->seq, TCP_SKB_CB(skb)->end_seq);
^1da177e4c3f415 Linus Torvalds           2005-04-16  5069  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  5070  out_of_window:
9a9c9b51e546188 Eric Dumazet             2018-05-21  5071  		tcp_enter_quic=
kack_mode(sk, TCP_MAX_QUICKACKS);
463c84b97f24010 Arnaldo Carvalho de Melo 2005-08-09  5072  		inet_csk_sched=
ule_ack(sk);
^1da177e4c3f415 Linus Torvalds           2005-04-16  5073  drop:
a7ec381049c0d1f Menglong Dong            2022-02-20  5074  		tcp_drop_reaso=
n(sk, skb, reason);
^1da177e4c3f415 Linus Torvalds           2005-04-16  5075  		return;
^1da177e4c3f415 Linus Torvalds           2005-04-16  5076  	}
^1da177e4c3f415 Linus Torvalds           2005-04-16  5077  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  5078  	/* Out of windo=
w. F.e. zero window probe. */
a7ec381049c0d1f Menglong Dong            2022-02-20  5079  	if (!before(TCP=
_SKB_CB(skb)->seq,
a7ec381049c0d1f Menglong Dong            2022-02-20  5080  		    tp->rcv_nx=
t + tcp_receive_window(tp))) {
a7ec381049c0d1f Menglong Dong            2022-02-20  5081  		reason =3D SKB=
_DROP_REASON_TCP_OVERWINDOW;
^1da177e4c3f415 Linus Torvalds           2005-04-16  5082  		goto out_of_wi=
ndow;
a7ec381049c0d1f Menglong Dong            2022-02-20  5083  	}
^1da177e4c3f415 Linus Torvalds           2005-04-16  5084  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  5085  	if (before(TCP_=
SKB_CB(skb)->seq, tp->rcv_nxt)) {
^1da177e4c3f415 Linus Torvalds           2005-04-16  5086  		/* Partial pac=
ket, seq < rcv_next < end_seq */
1ed834655a0d42e Pavel Emelyanov          2008-07-16  5087  		tcp_dsack_set(=
sk, TCP_SKB_CB(skb)->seq, tp->rcv_nxt);
^1da177e4c3f415 Linus Torvalds           2005-04-16  5088  =

^1da177e4c3f415 Linus Torvalds           2005-04-16  5089  		/* If window i=
s closed, drop tail of packet. But after
^1da177e4c3f415 Linus Torvalds           2005-04-16  5090  		 * remembering=
 D-SACK for its head made in previous line.
^1da177e4c3f415 Linus Torvalds           2005-04-16  5091  		 */
fb223502ec08894 Yafang Shao              2018-06-24  5092  		if (!tcp_recei=
ve_window(tp)) {
a7ec381049c0d1f Menglong Dong            2022-02-20  5093  			reason =3D SK=
B_DROP_REASON_TCP_ZEROWINDOW;
fb223502ec08894 Yafang Shao              2018-06-24  5094  			NET_INC_STATS=
(sock_net(sk), LINUX_MIB_TCPZEROWINDOWDROP);
^1da177e4c3f415 Linus Torvalds           2005-04-16  5095  			goto out_of_w=
indow;
fb223502ec08894 Yafang Shao              2018-06-24  5096  		}
^1da177e4c3f415 Linus Torvalds           2005-04-16  5097  		goto queue_and=
_out;
^1da177e4c3f415 Linus Torvalds           2005-04-16  5098  	}
^1da177e4c3f415 Linus Torvalds           2005-04-16  5099  =

e86b291962cbf47 Eric Dumazet             2012-03-18  5100  	tcp_data_queue_=
ofo(sk, skb);
^1da177e4c3f415 Linus Torvalds           2005-04-16  5101  }
^1da177e4c3f415 Linus Torvalds           2005-04-16  5102  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8280143869486823645==--

