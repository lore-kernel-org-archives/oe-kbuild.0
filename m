Content-Type: multipart/mixed; boundary="===============0426866132368924180=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: allow to retrieve sol_socket opts from sock_addr progs
Date: Tue, 12 Jan 2021 05:51:05 +0800
Message-ID: <202101120518.SFCZfKcm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0426866132368924180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <9dbbf51e7f6868b3e9c8610a8d49b4493fb1b50f.1610381606.git.danie=
l@iogearbox.net>
References: <9dbbf51e7f6868b3e9c8610a8d49b4493fb1b50f.1610381606.git.daniel=
@iogearbox.net>
TO: Daniel Borkmann <daniel@iogearbox.net>
TO: ast(a)kernel.org
CC: yhs(a)fb.com
CC: bpf(a)vger.kernel.org
CC: netdev(a)vger.kernel.org
CC: Daniel Borkmann <daniel@iogearbox.net>

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Daniel-Borkmann/bpf-allow-=
to-retrieve-sol_socket-opts-from-sock_addr-progs/20210112-002246
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
   net/core/filter.c:612:12: warning: Pointer addition with NULL pointer. [=
nullPointerArithmetic]
     new_insn +=3D 3;
              ^
   net/core/filter.c:560:43: note: Assignment 'first_insn=3DNULL', assigned=
 value is 0
    struct bpf_insn *new_insn, *first_insn =3D NULL;
                                             ^
   net/core/filter.c:580:13: note: Assignment 'new_insn=3Dfirst_insn', assi=
gned value is 0
    new_insn =3D first_insn;
               ^
   net/core/filter.c:612:3: note: Compound assignment '+=3D', assigned valu=
e is 3
     new_insn +=3D 3;
     ^
   net/core/filter.c:612:12: note: Null pointer addition
     new_insn +=3D 3;
              ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   net/core/filter.c:8419:7: warning: Return value of function offsetof() i=
s not used. [ignoredReturnValue]
    case offsetof(struct __sk_buff, cb[0]) ...
         ^
   net/core/filter.c:8544:7: warning: Return value of function offsetof() i=
s not used. [ignoredReturnValue]
    case offsetof(struct __sk_buff, remote_ip6[0]) ...
         ^
   net/core/filter.c:8564:7: warning: Return value of function offsetof() i=
s not used. [ignoredReturnValue]
    case offsetof(struct __sk_buff, local_ip6[0]) ...
         ^
   net/core/filter.c:9231:7: warning: Return value of function offsetof() i=
s not used. [ignoredReturnValue]
    case offsetof(struct bpf_sock_ops, replylong[0]) ...
         ^
   net/core/filter.c:9283:7: warning: Return value of function offsetof() i=
s not used. [ignoredReturnValue]
    case offsetof(struct bpf_sock_ops, remote_ip6[0]) ...
         ^
   net/core/filter.c:9304:7: warning: Return value of function offsetof() i=
s not used. [ignoredReturnValue]
    case offsetof(struct bpf_sock_ops, local_ip6[0]) ...
         ^
   net/core/filter.c:9591:7: warning: Return value of function offsetof() i=
s not used. [ignoredReturnValue]
    case offsetof(struct sk_msg_md, remote_ip6[0]) ...
         ^
   net/core/filter.c:9612:7: warning: Return value of function offsetof() i=
s not used. [ignoredReturnValue]
    case offsetof(struct sk_msg_md, local_ip6[0]) ...
         ^
>> net/core/filter.c:4777:8: warning: Variable 'ret' is reassigned a value =
before the old one has been used. 'break;' missing? [redundantAssignInSwitc=
h]
      ret =3D sock_bindtoindex(sk, ifindex, false);
          ^
   net/core/filter.c:4764:9: note: Variable 'ret' is reassigned a value bef=
ore the old one has been used. 'break;' missing?
       ret =3D -ENODEV;
           ^
   net/core/filter.c:4777:8: note: Variable 'ret' is reassigned a value bef=
ore the old one has been used. 'break;' missing?
      ret =3D sock_bindtoindex(sk, ifindex, false);
          ^

vim +4777 net/core/filter.c

6acc5c2910689fc6 Chenbo Feng        2017-03-22  4696  =

beecf11bc2188067 Stanislav Fomichev 2020-04-30  4697  static int _bpf_setso=
ckopt(struct sock *sk, int level, int optname,
5cdc744caab7cb0d Neal Cardwell      2020-09-10  4698  			   char *optval, i=
nt optlen)
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4699  {
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4700  	char devname[IFNAMSI=
Z];
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4701  	int val, valbool;
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4702  	struct net *net;
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4703  	int ifindex;
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4704  	int ret =3D 0;
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4705  =

8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4706  	if (!sk_fullsock(sk))
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4707  		return -EINVAL;
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4708  =

beecf11bc2188067 Stanislav Fomichev 2020-04-30  4709  	sock_owned_by_me(sk);
beecf11bc2188067 Stanislav Fomichev 2020-04-30  4710  =

8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4711  	if (level =3D=3D SOL=
_SOCKET) {
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4712  		if (optlen !=3D siz=
eof(int) && optname !=3D SO_BINDTODEVICE)
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4713  			return -EINVAL;
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4714  		val =3D *((int *)op=
tval);
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4715  		valbool =3D val ? 1=
 : 0;
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4716  =

8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4717  		/* Only some socket=
ops are supported */
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4718  		switch (optname) {
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4719  		case SO_RCVBUF:
c9e4576743eeda8d Yafang Shao        2019-01-23  4720  			val =3D min_t(u32,=
 val, sysctl_rmem_max);
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4721  			sk->sk_userlocks |=
=3D SOCK_RCVBUF_LOCK;
ebb3b78db7bf8422 Eric Dumazet       2019-10-10  4722  			WRITE_ONCE(sk->sk_=
rcvbuf,
ebb3b78db7bf8422 Eric Dumazet       2019-10-10  4723  				   max_t(int, val=
 * 2, SOCK_MIN_RCVBUF));
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4724  			break;
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4725  		case SO_SNDBUF:
c9e4576743eeda8d Yafang Shao        2019-01-23  4726  			val =3D min_t(u32,=
 val, sysctl_wmem_max);
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4727  			sk->sk_userlocks |=
=3D SOCK_SNDBUF_LOCK;
e292f05e0df73f9f Eric Dumazet       2019-10-10  4728  			WRITE_ONCE(sk->sk_=
sndbuf,
e292f05e0df73f9f Eric Dumazet       2019-10-10  4729  				   max_t(int, val=
 * 2, SOCK_MIN_SNDBUF));
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4730  			break;
76a9ebe811fb3d06 Eric Dumazet       2018-10-15  4731  		case SO_MAX_PACING_=
RATE: /* 32bit version */
e224c390a6259c52 Yuchung Cheng      2019-01-17  4732  			if (val !=3D ~0U)
e224c390a6259c52 Yuchung Cheng      2019-01-17  4733  				cmpxchg(&sk->sk_p=
acing_status,
e224c390a6259c52 Yuchung Cheng      2019-01-17  4734  					SK_PACING_NONE,
e224c390a6259c52 Yuchung Cheng      2019-01-17  4735  					SK_PACING_NEEDED=
);
700465fd338fe5df Ke Li              2020-10-22  4736  			sk->sk_max_pacing_=
rate =3D (val =3D=3D ~0U) ?
700465fd338fe5df Ke Li              2020-10-22  4737  						 ~0UL : (unsign=
ed int)val;
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4738  			sk->sk_pacing_rate=
 =3D min(sk->sk_pacing_rate,
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4739  						 sk->sk_max_pac=
ing_rate);
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4740  			break;
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4741  		case SO_PRIORITY:
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4742  			sk->sk_priority =
=3D val;
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4743  			break;
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4744  		case SO_RCVLOWAT:
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4745  			if (val < 0)
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4746  				val =3D INT_MAX;
eac66402d1c342f0 Eric Dumazet       2019-10-09  4747  			WRITE_ONCE(sk->sk_=
rcvlowat, val ? : 1);
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4748  			break;
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4749  		case SO_MARK:
f4924f24da8c7ef6 Peter Oskolkov     2019-01-16  4750  			if (sk->sk_mark !=
=3D val) {
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4751  				sk->sk_mark =3D v=
al;
f4924f24da8c7ef6 Peter Oskolkov     2019-01-16  4752  				sk_dst_reset(sk);
f4924f24da8c7ef6 Peter Oskolkov     2019-01-16  4753  			}
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4754  			break;
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4755  		case SO_BINDTODEVIC=
E:
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4756  			optlen =3D min_t(l=
ong, optlen, IFNAMSIZ - 1);
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4757  			strncpy(devname, o=
ptval, optlen);
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4758  			devname[optlen] =
=3D 0;
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4759  =

70c58997c1e864c9 Ferenc Fejes       2020-05-30  4760  			ifindex =3D 0;
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4761  			if (devname[0] !=
=3D '\0') {
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4762  				struct net_device=
 *dev;
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4763  =

70c58997c1e864c9 Ferenc Fejes       2020-05-30  4764  				ret =3D -ENODEV;
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4765  =

70c58997c1e864c9 Ferenc Fejes       2020-05-30  4766  				net =3D sock_net(=
sk);
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4767  				dev =3D dev_get_b=
y_name(net, devname);
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4768  				if (!dev)
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4769  					break;
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4770  				ifindex =3D dev->=
ifindex;
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4771  				dev_put(dev);
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4772  			}
03f510703daae949 Daniel Borkmann    2021-01-11  4773  			fallthrough;
03f510703daae949 Daniel Borkmann    2021-01-11  4774  		case SO_BINDTOIFIND=
EX:
03f510703daae949 Daniel Borkmann    2021-01-11  4775  			if (optname =3D=3D=
 SO_BINDTOIFINDEX)
03f510703daae949 Daniel Borkmann    2021-01-11  4776  				ifindex =3D val;
70c58997c1e864c9 Ferenc Fejes       2020-05-30 @4777  			ret =3D sock_bindt=
oindex(sk, ifindex, false);
70c58997c1e864c9 Ferenc Fejes       2020-05-30  4778  			break;
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4779  		case SO_KEEPALIVE:
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4780  			if (sk->sk_prot->k=
eepalive)
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4781  				sk->sk_prot->keep=
alive(sk, valbool);
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4782  			sock_valbool_flag(=
sk, SOCK_KEEPOPEN, valbool);
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4783  			break;
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4784  		default:
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4785  			ret =3D -EINVAL;
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4786  		}
a5192c52377e6d28 Lawrence Brakmo    2017-07-02  4787  #ifdef CONFIG_INET
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4788  	} else if (level =3D=
=3D SOL_IP) {
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4789  		if (optlen !=3D siz=
eof(int) || sk->sk_family !=3D AF_INET)
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4790  			return -EINVAL;
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4791  =

6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4792  		val =3D *((int *)op=
tval);
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4793  		/* Only some option=
s are supported */
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4794  		switch (optname) {
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4795  		case IP_TOS:
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4796  			if (val < -1 || va=
l > 0xff) {
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4797  				ret =3D -EINVAL;
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4798  			} else {
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4799  				struct inet_sock =
*inet =3D inet_sk(sk);
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4800  =

6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4801  				if (val =3D=3D -1)
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4802  					val =3D 0;
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4803  				inet->tos =3D val;
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4804  			}
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4805  			break;
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4806  		default:
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4807  			ret =3D -EINVAL;
6f5c39fa5cd4a78c Nikita V. Shirokov 2018-03-26  4808  		}
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4809  #if IS_ENABLED(CONFIG=
_IPV6)
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4810  	} else if (level =3D=
=3D SOL_IPV6) {
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4811  		if (optlen !=3D siz=
eof(int) || sk->sk_family !=3D AF_INET6)
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4812  			return -EINVAL;
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4813  =

6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4814  		val =3D *((int *)op=
tval);
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4815  		/* Only some option=
s are supported */
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4816  		switch (optname) {
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4817  		case IPV6_TCLASS:
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4818  			if (val < -1 || va=
l > 0xff) {
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4819  				ret =3D -EINVAL;
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4820  			} else {
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4821  				struct ipv6_pinfo=
 *np =3D inet6_sk(sk);
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4822  =

6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4823  				if (val =3D=3D -1)
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4824  					val =3D 0;
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4825  				np->tclass =3D va=
l;
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4826  			}
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4827  			break;
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4828  		default:
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4829  			ret =3D -EINVAL;
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4830  		}
6f9bd3d731aac0d2 Lawrence Brakmo    2018-01-25  4831  #endif
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4832  	} else if (level =3D=
=3D SOL_TCP &&
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4833  		   sk->sk_prot->set=
sockopt =3D=3D tcp_setsockopt) {
91b5b21c7c16899a Lawrence Brakmo    2017-06-30  4834  		if (optname =3D=3D =
TCP_CONGESTION) {
91b5b21c7c16899a Lawrence Brakmo    2017-06-30  4835  			char name[TCP_CA_N=
AME_MAX];
91b5b21c7c16899a Lawrence Brakmo    2017-06-30  4836  =

91b5b21c7c16899a Lawrence Brakmo    2017-06-30  4837  			strncpy(name, optv=
al, min_t(long, optlen,
91b5b21c7c16899a Lawrence Brakmo    2017-06-30  4838  						    TCP_CA_NAME=
_MAX-1));
91b5b21c7c16899a Lawrence Brakmo    2017-06-30  4839  			name[TCP_CA_NAME_M=
AX-1] =3D 0;
29a949325c6c90f1 Neal Cardwell      2020-09-10  4840  			ret =3D tcp_set_co=
ngestion_control(sk, name, false, true);
91b5b21c7c16899a Lawrence Brakmo    2017-06-30  4841  		} else {
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4842  			struct inet_connec=
tion_sock *icsk =3D inet_csk(sk);
fc7478103c84af43 Lawrence Brakmo    2017-06-30  4843  			struct tcp_sock *t=
p =3D tcp_sk(sk);
2b8ee4f05d4f6a6c Martin KaFai Lau   2020-08-20  4844  			unsigned long time=
out;
fc7478103c84af43 Lawrence Brakmo    2017-06-30  4845  =

fc7478103c84af43 Lawrence Brakmo    2017-06-30  4846  			if (optlen !=3D si=
zeof(int))
fc7478103c84af43 Lawrence Brakmo    2017-06-30  4847  				return -EINVAL;
fc7478103c84af43 Lawrence Brakmo    2017-06-30  4848  =

fc7478103c84af43 Lawrence Brakmo    2017-06-30  4849  			val =3D *((int *)o=
ptval);
fc7478103c84af43 Lawrence Brakmo    2017-06-30  4850  			/* Only some optio=
ns are supported */
fc7478103c84af43 Lawrence Brakmo    2017-06-30  4851  			switch (optname) {
fc7478103c84af43 Lawrence Brakmo    2017-06-30  4852  			case TCP_BPF_IW:
31aa6503a15ba001 Yuchung Cheng      2019-01-08  4853  				if (val <=3D 0 ||=
 tp->data_segs_out > tp->syn_data)
91b5b21c7c16899a Lawrence Brakmo    2017-06-30  4854  					ret =3D -EINVAL;
fc7478103c84af43 Lawrence Brakmo    2017-06-30  4855  				else
fc7478103c84af43 Lawrence Brakmo    2017-06-30  4856  					tp->snd_cwnd =3D=
 val;
fc7478103c84af43 Lawrence Brakmo    2017-06-30  4857  				break;
13bf96411ad2bd16 Lawrence Brakmo    2017-06-30  4858  			case TCP_BPF_SNDCW=
ND_CLAMP:
13bf96411ad2bd16 Lawrence Brakmo    2017-06-30  4859  				if (val <=3D 0) {
13bf96411ad2bd16 Lawrence Brakmo    2017-06-30  4860  					ret =3D -EINVAL;
13bf96411ad2bd16 Lawrence Brakmo    2017-06-30  4861  				} else {
13bf96411ad2bd16 Lawrence Brakmo    2017-06-30  4862  					tp->snd_cwnd_cla=
mp =3D val;
13bf96411ad2bd16 Lawrence Brakmo    2017-06-30  4863  					tp->snd_ssthresh=
 =3D val;
13bf96411ad2bd16 Lawrence Brakmo    2017-06-30  4864  				}
6d3f06a0042ebd59 Colin Ian King     2017-07-04  4865  				break;
2b8ee4f05d4f6a6c Martin KaFai Lau   2020-08-20  4866  			case TCP_BPF_DELAC=
K_MAX:
2b8ee4f05d4f6a6c Martin KaFai Lau   2020-08-20  4867  				timeout =3D usecs=
_to_jiffies(val);
2b8ee4f05d4f6a6c Martin KaFai Lau   2020-08-20  4868  				if (timeout > TCP=
_DELACK_MAX ||
2b8ee4f05d4f6a6c Martin KaFai Lau   2020-08-20  4869  				    timeout < TCP=
_TIMEOUT_MIN)
2b8ee4f05d4f6a6c Martin KaFai Lau   2020-08-20  4870  					return -EINVAL;
2b8ee4f05d4f6a6c Martin KaFai Lau   2020-08-20  4871  				inet_csk(sk)->ics=
k_delack_max =3D timeout;
2b8ee4f05d4f6a6c Martin KaFai Lau   2020-08-20  4872  				break;
ca584ba070864c60 Martin KaFai Lau   2020-08-20  4873  			case TCP_BPF_RTO_M=
IN:
ca584ba070864c60 Martin KaFai Lau   2020-08-20  4874  				timeout =3D usecs=
_to_jiffies(val);
ca584ba070864c60 Martin KaFai Lau   2020-08-20  4875  				if (timeout > TCP=
_RTO_MIN ||
ca584ba070864c60 Martin KaFai Lau   2020-08-20  4876  				    timeout < TCP=
_TIMEOUT_MIN)
ca584ba070864c60 Martin KaFai Lau   2020-08-20  4877  					return -EINVAL;
ca584ba070864c60 Martin KaFai Lau   2020-08-20  4878  				inet_csk(sk)->ics=
k_rto_min =3D timeout;
ca584ba070864c60 Martin KaFai Lau   2020-08-20  4879  				break;
1e215300f1384072 Nikita V. Shirokov 2018-08-30  4880  			case TCP_SAVE_SYN:
1e215300f1384072 Nikita V. Shirokov 2018-08-30  4881  				if (val < 0 || va=
l > 1)
1e215300f1384072 Nikita V. Shirokov 2018-08-30  4882  					ret =3D -EINVAL;
1e215300f1384072 Nikita V. Shirokov 2018-08-30  4883  				else
1e215300f1384072 Nikita V. Shirokov 2018-08-30  4884  					tp->save_syn =3D=
 val;
1e215300f1384072 Nikita V. Shirokov 2018-08-30  4885  				break;
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4886  			case TCP_KEEPIDLE:
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4887  				ret =3D tcp_sock_=
set_keepidle_locked(sk, val);
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4888  				break;
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4889  			case TCP_KEEPINTVL:
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4890  				if (val < 1 || va=
l > MAX_TCP_KEEPINTVL)
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4891  					ret =3D -EINVAL;
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4892  				else
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4893  					tp->keepalive_in=
tvl =3D val * HZ;
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4894  				break;
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4895  			case TCP_KEEPCNT:
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4896  				if (val < 1 || va=
l > MAX_TCP_KEEPCNT)
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4897  					ret =3D -EINVAL;
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4898  				else
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4899  					tp->keepalive_pr=
obes =3D val;
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4900  				break;
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4901  			case TCP_SYNCNT:
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4902  				if (val < 1 || va=
l > MAX_TCP_SYNCNT)
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4903  					ret =3D -EINVAL;
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4904  				else
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4905  					icsk->icsk_syn_r=
etries =3D val;
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4906  				break;
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4907  			case TCP_USER_TIME=
OUT:
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4908  				if (val < 0)
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4909  					ret =3D -EINVAL;
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4910  				else
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4911  					icsk->icsk_user_=
timeout =3D val;
f9bcf96837f158db Dmitry Yakunin     2020-06-20  4912  				break;
eca43ee6c46db92d Nikita V. Shirokov 2020-10-09  4913  			case TCP_NOTSENT_L=
OWAT:
eca43ee6c46db92d Nikita V. Shirokov 2020-10-09  4914  				tp->notsent_lowat=
 =3D val;
eca43ee6c46db92d Nikita V. Shirokov 2020-10-09  4915  				sk->sk_write_spac=
e(sk);
eca43ee6c46db92d Nikita V. Shirokov 2020-10-09  4916  				break;
cb81110997d1f509 Prankur gupta      2020-12-02  4917  			case TCP_WINDOW_CL=
AMP:
cb81110997d1f509 Prankur gupta      2020-12-02  4918  				ret =3D tcp_set_w=
indow_clamp(sk, val);
cb81110997d1f509 Prankur gupta      2020-12-02  4919  				break;
fc7478103c84af43 Lawrence Brakmo    2017-06-30  4920  			default:
fc7478103c84af43 Lawrence Brakmo    2017-06-30  4921  				ret =3D -EINVAL;
fc7478103c84af43 Lawrence Brakmo    2017-06-30  4922  			}
91b5b21c7c16899a Lawrence Brakmo    2017-06-30  4923  		}
91b5b21c7c16899a Lawrence Brakmo    2017-06-30  4924  #endif
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4925  	} else {
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4926  		ret =3D -EINVAL;
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4927  	}
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4928  	return ret;
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4929  }
8c4b4c7e9ff04479 Lawrence Brakmo    2017-06-30  4930  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0426866132368924180==--

