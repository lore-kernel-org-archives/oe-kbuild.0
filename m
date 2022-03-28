Content-Type: multipart/mixed; boundary="===============3979423338358108783=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH mptcp-next v2 3/3] mptcp: listen diag dump support
Date: Tue, 29 Mar 2022 04:33:59 +0800
Message-ID: <202203290401.iBK94uHx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3979423338358108783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220328124913.29768-4-fw@strlen.de>
References: <20220328124913.29768-4-fw@strlen.de>
TO: Florian Westphal <fw@strlen.de>
TO: mptcp(a)lists.linux.dev
CC: Florian Westphal <fw@strlen.de>

Hi Florian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mptcp/export]
[also build test WARNING on linus/master v5.17 next-20220328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/mpt=
cp-inet-diag-listen-dump-support/20220328-205028
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-m021-20220328 (https://download.01.org/0day-ci/arch=
ive/20220329/202203290401.iBK94uHx-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/mptcp/mptcp_diag.c:121 mptcp_diag_dump_listeners() error: uninitialized=
 symbol 'bc'.
net/mptcp/mptcp_diag.c:122 mptcp_diag_dump_listeners() warn: inconsistent i=
ndenting

vim +/bc +121 net/mptcp/mptcp_diag.c

fedd1232547507 Florian Westphal 2022-03-28   75  =

6ef1c5326220cf Florian Westphal 2022-03-28   76  static void mptcp_diag_dum=
p_listeners(struct sk_buff *skb, struct netlink_callback *cb,
6ef1c5326220cf Florian Westphal 2022-03-28   77  				      const struct ine=
t_diag_req_v2 *r,
6ef1c5326220cf Florian Westphal 2022-03-28   78  				      bool net_admin)
6ef1c5326220cf Florian Westphal 2022-03-28   79  {
6ef1c5326220cf Florian Westphal 2022-03-28   80  	struct mptcp_diag_ctx *di=
ag_ctx =3D (void *)cb->ctx;
6ef1c5326220cf Florian Westphal 2022-03-28   81  	struct net *net =3D sock_=
net(skb->sk);
6ef1c5326220cf Florian Westphal 2022-03-28   82  	struct nlattr *bc;
6ef1c5326220cf Florian Westphal 2022-03-28   83  	int i;
6ef1c5326220cf Florian Westphal 2022-03-28   84  =

6ef1c5326220cf Florian Westphal 2022-03-28   85  	for (i =3D diag_ctx->l_sl=
ot; i < INET_LHTABLE_SIZE; i++) {
6ef1c5326220cf Florian Westphal 2022-03-28   86  		struct inet_listen_hashb=
ucket *ilb;
6ef1c5326220cf Florian Westphal 2022-03-28   87  		struct hlist_nulls_node =
*node;
6ef1c5326220cf Florian Westphal 2022-03-28   88  		struct sock *sk;
6ef1c5326220cf Florian Westphal 2022-03-28   89  		int num =3D 0;
6ef1c5326220cf Florian Westphal 2022-03-28   90  =

6ef1c5326220cf Florian Westphal 2022-03-28   91  		ilb =3D &tcp_hashinfo.li=
stening_hash[i];
6ef1c5326220cf Florian Westphal 2022-03-28   92  =

6ef1c5326220cf Florian Westphal 2022-03-28   93  		rcu_read_lock();
6ef1c5326220cf Florian Westphal 2022-03-28   94  		spin_lock(&ilb->lock);
6ef1c5326220cf Florian Westphal 2022-03-28   95  		sk_nulls_for_each(sk, no=
de, &ilb->nulls_head) {
6ef1c5326220cf Florian Westphal 2022-03-28   96  			const struct mptcp_subf=
low_context *ctx =3D mptcp_subflow_ctx(sk);
6ef1c5326220cf Florian Westphal 2022-03-28   97  			struct inet_sock *inet =
=3D inet_sk(sk);
6ef1c5326220cf Florian Westphal 2022-03-28   98  			int ret;
6ef1c5326220cf Florian Westphal 2022-03-28   99  =

6ef1c5326220cf Florian Westphal 2022-03-28  100  			if (num < diag_ctx->l_n=
um)
6ef1c5326220cf Florian Westphal 2022-03-28  101  				goto next_listen;
6ef1c5326220cf Florian Westphal 2022-03-28  102  =

6ef1c5326220cf Florian Westphal 2022-03-28  103  			if (!ctx || strcmp(inet=
_csk(sk)->icsk_ulp_ops->name, "mptcp"))
6ef1c5326220cf Florian Westphal 2022-03-28  104  				goto next_listen;
6ef1c5326220cf Florian Westphal 2022-03-28  105  =

6ef1c5326220cf Florian Westphal 2022-03-28  106  			sk =3D ctx->conn;
6ef1c5326220cf Florian Westphal 2022-03-28  107  			if (!sk || !net_eq(sock=
_net(sk), net))
6ef1c5326220cf Florian Westphal 2022-03-28  108  				goto next_listen;
6ef1c5326220cf Florian Westphal 2022-03-28  109  =

6ef1c5326220cf Florian Westphal 2022-03-28  110  			if (r->sdiag_family !=
=3D AF_UNSPEC &&
6ef1c5326220cf Florian Westphal 2022-03-28  111  			    sk->sk_family !=3D =
r->sdiag_family)
6ef1c5326220cf Florian Westphal 2022-03-28  112  				goto next_listen;
6ef1c5326220cf Florian Westphal 2022-03-28  113  =

6ef1c5326220cf Florian Westphal 2022-03-28  114  			if (r->id.idiag_sport !=
=3D inet->inet_sport &&
6ef1c5326220cf Florian Westphal 2022-03-28  115  			    r->id.idiag_sport)
6ef1c5326220cf Florian Westphal 2022-03-28  116  				goto next_listen;
6ef1c5326220cf Florian Westphal 2022-03-28  117  =

6ef1c5326220cf Florian Westphal 2022-03-28  118  			if (!refcount_inc_not_z=
ero(&sk->sk_refcnt))
6ef1c5326220cf Florian Westphal 2022-03-28  119  				goto next_listen;
6ef1c5326220cf Florian Westphal 2022-03-28  120  =

6ef1c5326220cf Florian Westphal 2022-03-28 @121  			ret =3D sk_diag_dump(sk=
, skb, cb, r, bc, net_admin);
6ef1c5326220cf Florian Westphal 2022-03-28 @122  					   sock_put(sk);
6ef1c5326220cf Florian Westphal 2022-03-28  123  			if (ret < 0) {
6ef1c5326220cf Florian Westphal 2022-03-28  124  				spin_unlock(&ilb->lock=
);
6ef1c5326220cf Florian Westphal 2022-03-28  125  				rcu_read_unlock();
6ef1c5326220cf Florian Westphal 2022-03-28  126  				diag_ctx->l_slot =3D i;
6ef1c5326220cf Florian Westphal 2022-03-28  127  				diag_ctx->l_num =3D nu=
m;
6ef1c5326220cf Florian Westphal 2022-03-28  128  				return;
6ef1c5326220cf Florian Westphal 2022-03-28  129  			}
6ef1c5326220cf Florian Westphal 2022-03-28  130  			diag_ctx->l_num =3D num=
 + 1;
6ef1c5326220cf Florian Westphal 2022-03-28  131  			num =3D 0;
6ef1c5326220cf Florian Westphal 2022-03-28  132  next_listen:
6ef1c5326220cf Florian Westphal 2022-03-28  133  			++num;
6ef1c5326220cf Florian Westphal 2022-03-28  134  		}
6ef1c5326220cf Florian Westphal 2022-03-28  135  		spin_unlock(&ilb->lock);
6ef1c5326220cf Florian Westphal 2022-03-28  136  		rcu_read_unlock();
6ef1c5326220cf Florian Westphal 2022-03-28  137  =

6ef1c5326220cf Florian Westphal 2022-03-28  138  		cond_resched();
6ef1c5326220cf Florian Westphal 2022-03-28  139  		diag_ctx->l_num =3D 0;
6ef1c5326220cf Florian Westphal 2022-03-28  140  	}
6ef1c5326220cf Florian Westphal 2022-03-28  141  =

6ef1c5326220cf Florian Westphal 2022-03-28  142  	diag_ctx->l_num =3D 0;
6ef1c5326220cf Florian Westphal 2022-03-28  143  	diag_ctx->l_slot =3D i;
6ef1c5326220cf Florian Westphal 2022-03-28  144  }
6ef1c5326220cf Florian Westphal 2022-03-28  145  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3979423338358108783==--

