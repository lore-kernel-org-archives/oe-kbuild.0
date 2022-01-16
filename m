Content-Type: multipart/mixed; boundary="===============1014909789087265937=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next v2] net: mptcp, Fast Open Mechanism
Date: Mon, 17 Jan 2022 02:41:17 +0800
Message-ID: <202201170247.BMTU5XYy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1014909789087265937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220116001259.203319-1-dmytro@shytyi.net>
References: <20220116001259.203319-1-dmytro@shytyi.net>
TO: Dmytro SHYTYI <dmytro@shytyi.net>
TO: mptcp(a)lists.linux.dev
CC: Dmytro SHYTYI <dmytro@shytyi.net>

Hi Dmytro,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.16]
[cannot apply to net-next/master linus/master next-20220116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dmytro-SHYTYI/net-mptcp-Fa=
st-Open-Mechanism/20220116-081430
base:    df0cc57e057f18e44dac8e6c18aba47ab53202f9
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20117/202201170247.BMTU5XYy-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/ipv4/tcp_input.c:6960 tcp_conn_request() warn: ignoring unreachable cod=
e.

vim +6960 net/ipv4/tcp_input.c

1fb6f159fd21c6 Octavian Purdila      2014-06-25  6864  =

1fb6f159fd21c6 Octavian Purdila      2014-06-25  6865  	tcp_clear_options(&=
tmp_opt);
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6866  	tmp_opt.mss_clamp =
=3D af_ops->mss_clamp;
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6867  	tmp_opt.user_mss  =
=3D tp->rx_opt.user_mss;
eed29f17f09ad7 Eric Dumazet          2017-06-07  6868  	tcp_parse_options(s=
ock_net(sk), skb, &tmp_opt, 0,
eed29f17f09ad7 Eric Dumazet          2017-06-07  6869  			  want_cookie ? N=
ULL : &foc);
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6870  =

1fb6f159fd21c6 Octavian Purdila      2014-06-25  6871  	if (want_cookie && =
!tmp_opt.saw_tstamp)
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6872  		tcp_clear_options(=
&tmp_opt);
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6873  =

bc58a1baf2a978 Hans Wippel           2018-03-23  6874  	if (IS_ENABLED(CONF=
IG_SMC) && want_cookie)
bc58a1baf2a978 Hans Wippel           2018-03-23  6875  		tmp_opt.smc_ok =3D=
 0;
bc58a1baf2a978 Hans Wippel           2018-03-23  6876  =

1fb6f159fd21c6 Octavian Purdila      2014-06-25  6877  	tmp_opt.tstamp_ok =
=3D tmp_opt.saw_tstamp;
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6878  	tcp_openreq_init(re=
q, &tmp_opt, skb, sk);
7a682575ad4829 KOVACS Krisztian      2016-09-23  6879  	inet_rsk(req)->no_s=
rccheck =3D inet_sk(sk)->transparent;
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6880  =

16f86165bd0a94 Eric Dumazet          2015-03-13  6881  	/* Note: tcp_v6_ini=
t_req() might override ir_iif for link locals */
6dd9a14e92e548 David Ahern           2015-12-16  6882  	inet_rsk(req)->ir_i=
if =3D inet_request_bound_dev_if(sk, skb);
16f86165bd0a94 Eric Dumazet          2015-03-13  6883  =

7ea851d19b2359 Florian Westphal      2020-11-30  6884  	dst =3D af_ops->rou=
te_req(sk, skb, &fl, req);
7ea851d19b2359 Florian Westphal      2020-11-30  6885  	if (!dst)
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6886  		goto drop_and_free;
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6887  =

84b114b98452c4 Eric Dumazet          2017-05-05  6888  	if (tmp_opt.tstamp_=
ok)
5d2ed0521ac98f Eric Dumazet          2017-06-07  6889  		tcp_rsk(req)->ts_o=
ff =3D af_ops->init_ts_off(net, skb);
95a22caee396ce Florian Westphal      2016-12-01  6890  =

f7b3bec6f5167e Florian Westphal      2014-11-03  6891  	if (!want_cookie &&=
 !isn) {
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6892  		/* Kill the follow=
ing clause, if you dislike this way. */
4396e46187ca50 Soheil Hassas Yeganeh 2017-03-15  6893  		if (!net->ipv4.sys=
ctl_tcp_syncookies &&
fee83d097b1620 Haishuang Yan         2016-12-28  6894  		    (net->ipv4.sys=
ctl_max_syn_backlog - inet_csk_reqsk_queue_len(sk) <
fee83d097b1620 Haishuang Yan         2016-12-28  6895  		     (net->ipv4.sy=
sctl_max_syn_backlog >> 2)) &&
d82bae12dc38d7 Soheil Hassas Yeganeh 2017-03-15  6896  		    !tcp_peer_is_p=
roven(req, dst)) {
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6897  			/* Without syncoo=
kies last quarter of
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6898  			 * backlog is fil=
led with destinations,
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6899  			 * proven to be a=
live.
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6900  			 * It means that =
we continue to communicate
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6901  			 * to destination=
s, already remembered
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6902  			 * to the moment =
of synflood.
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6903  			 */
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6904  			pr_drop_req(req, =
ntohs(tcp_hdr(skb)->source),
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6905  				    rsk_ops->fam=
ily);
52c7bf82e2e91e Dmytro SHYTYI         2022-01-16  6906  			//goto drop_and_r=
elease;
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6907  		}
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6908  =

84b114b98452c4 Eric Dumazet          2017-05-05  6909  		isn =3D af_ops->in=
it_seq(skb);
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6910  	}
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6911  =

f7b3bec6f5167e Florian Westphal      2014-11-03  6912  	tcp_ecn_create_requ=
est(req, skb, sk, dst);
f7b3bec6f5167e Florian Westphal      2014-11-03  6913  =

f7b3bec6f5167e Florian Westphal      2014-11-03  6914  	if (want_cookie) {
f7b3bec6f5167e Florian Westphal      2014-11-03  6915  		isn =3D cookie_ini=
t_sequence(af_ops, sk, skb, &req->mss);
f7b3bec6f5167e Florian Westphal      2014-11-03  6916  		if (!tmp_opt.tstam=
p_ok)
f7b3bec6f5167e Florian Westphal      2014-11-03  6917  			inet_rsk(req)->ec=
n_ok =3D 0;
f7b3bec6f5167e Florian Westphal      2014-11-03  6918  	}
f7b3bec6f5167e Florian Westphal      2014-11-03  6919  =

1fb6f159fd21c6 Octavian Purdila      2014-06-25  6920  	tcp_rsk(req)->snt_i=
sn =3D isn;
58d607d3e52f2b Eric Dumazet          2015-09-15  6921  	tcp_rsk(req)->txhas=
h =3D net_tx_rndhash();
e9b12edc133b54 Wei Wang              2020-09-09  6922  	tcp_rsk(req)->syn_t=
os =3D TCP_SKB_CB(skb)->ip_dsfield;
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6923  	tcp_openreq_init_rw=
in(req, sk, dst);
c6345ce7d361dc Amritha Nambiar       2018-06-29  6924  	sk_rx_queue_set(req=
_to_sk(req), skb);
ca6fb06518836e Eric Dumazet          2015-10-02  6925  	if (!want_cookie) {
ca6fb06518836e Eric Dumazet          2015-10-02  6926  		tcp_reqsk_record_s=
yn(sk, req, skb);
71c02379c762cb Christoph Paasch      2017-10-23  6927  		fastopen_sk =3D tc=
p_try_fastopen(sk, skb, req, &foc, dst);
ca6fb06518836e Eric Dumazet          2015-10-02  6928  	}
7c85af8810448d Eric Dumazet          2015-09-24  6929  	if (fastopen_sk) {
ca6fb06518836e Eric Dumazet          2015-10-02  6930  		af_ops->send_synac=
k(fastopen_sk, dst, &fl, req,
331fca4315efa3 Martin KaFai Lau      2020-08-20  6931  				    &foc, TCP_SY=
NACK_FASTOPEN, skb);
7656d842de93fd Eric Dumazet          2015-10-04  6932  		/* Add the child s=
ocket directly into the accept queue */
9d3e1368bb4589 Guillaume Nault       2019-03-08  6933  		if (!inet_csk_reqs=
k_queue_add(sk, req, fastopen_sk)) {
9d3e1368bb4589 Guillaume Nault       2019-03-08  6934  			reqsk_fastopen_re=
move(fastopen_sk, req, false);
9d3e1368bb4589 Guillaume Nault       2019-03-08  6935  			bh_unlock_sock(fa=
stopen_sk);
9d3e1368bb4589 Guillaume Nault       2019-03-08  6936  			sock_put(fastopen=
_sk);
9403cf23025880 Guillaume Nault       2019-03-19  6937  			goto drop_and_fre=
e;
9d3e1368bb4589 Guillaume Nault       2019-03-08  6938  		}
7656d842de93fd Eric Dumazet          2015-10-04  6939  		sk->sk_data_ready(=
sk);
7656d842de93fd Eric Dumazet          2015-10-04  6940  		bh_unlock_sock(fas=
topen_sk);
7c85af8810448d Eric Dumazet          2015-09-24  6941  		sock_put(fastopen_=
sk);
7c85af8810448d Eric Dumazet          2015-09-24  6942  	} else {
9439ce00f208d9 Eric Dumazet          2015-03-17  6943  		tcp_rsk(req)->tfo_=
listener =3D false;
ca6fb06518836e Eric Dumazet          2015-10-02  6944  		if (!want_cookie)
8550f328f45db6 Lawrence Brakmo       2017-06-30  6945  			inet_csk_reqsk_qu=
eue_hash_add(sk, req,
8550f328f45db6 Lawrence Brakmo       2017-06-30  6946  				tcp_timeout_init=
((struct sock *)req));
b3d051477cf94e Eric Dumazet          2016-04-13  6947  		af_ops->send_synac=
k(sk, dst, &fl, req, &foc,
b3d051477cf94e Eric Dumazet          2016-04-13  6948  				    !want_cookie=
 ? TCP_SYNACK_NORMAL :
331fca4315efa3 Martin KaFai Lau      2020-08-20  6949  						   TCP_SYNACK_=
COOKIE,
331fca4315efa3 Martin KaFai Lau      2020-08-20  6950  				    skb);
9caad864151e52 Eric Dumazet          2016-04-01  6951  		if (want_cookie) {
9caad864151e52 Eric Dumazet          2016-04-01  6952  			reqsk_free(req);
9caad864151e52 Eric Dumazet          2016-04-01  6953  			return 0;
9caad864151e52 Eric Dumazet          2016-04-01  6954  		}
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6955  	}
ca6fb06518836e Eric Dumazet          2015-10-02  6956  	reqsk_put(req);
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6957  	return 0;
1fb6f159fd21c6 Octavian Purdila      2014-06-25  6958  =

52c7bf82e2e91e Dmytro SHYTYI         2022-01-16  6959  //drop_and_release:
1fb6f159fd21c6 Octavian Purdila      2014-06-25 @6960  	dst_release(dst);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1014909789087265937==--

