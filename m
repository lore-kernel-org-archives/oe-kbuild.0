Content-Type: multipart/mixed; boundary="===============2081572210066053643=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next v2 1/3] net: Add a bhash2 table hashed by port + address
Date: Thu, 14 Jul 2022 23:30:18 +0800
Message-ID: <202207142304.r7aVTnSg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2081572210066053643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220712235310.1935121-2-joannelkoong@gmail.com>
References: <20220712235310.1935121-2-joannelkoong@gmail.com>
TO: Joanne Koong <joannelkoong@gmail.com>
TO: netdev(a)vger.kernel.org
CC: edumazet(a)google.com
CC: kafai(a)fb.com
CC: kuba(a)kernel.org
CC: davem(a)davemloft.net
CC: pabeni(a)redhat.com
CC: Joanne Koong <joannelkoong@gmail.com>

Hi Joanne,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Joanne-Koong/Add-a-s=
econd-bind-table-hashed-by-port-address/20220713-075808
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
5022e221c98a609e0e5b0a73852c7e3d32f1c545
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20220=
714/202207142304.r7aVTnSg-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9=
c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=3D1 build):
        # https://github.com/intel-lab-lkp/linux/commit/2e20fc25bca52fbc786=
bbae312df56514c10798d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Joanne-Koong/Add-a-second-bind-tab=
le-hashed-by-port-address/20220713-075808
        git checkout 2e20fc25bca52fbc786bbae312df56514c10798d
        # save the config file
         ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/ipv4/inet_hashtables.c:853:31: warning: variable 'head' set but not =
used [-Wunused-but-set-variable]
           struct inet_bind_hashbucket *head, *head2;
                                        ^
   1 warning generated.


vim +/head +853 net/ipv4/inet_hashtables.c

2e20fc25bca52f Joanne Koong 2022-07-12  849  =

2e20fc25bca52f Joanne Koong 2022-07-12  850  int inet_bhash2_update_saddr(s=
truct inet_bind_hashbucket *prev_saddr, struct sock *sk)
2e20fc25bca52f Joanne Koong 2022-07-12  851  {
2e20fc25bca52f Joanne Koong 2022-07-12  852  	struct inet_hashinfo *hinfo =
=3D sk->sk_prot->h.hashinfo;
2e20fc25bca52f Joanne Koong 2022-07-12 @853  	struct inet_bind_hashbucket *=
head, *head2;
2e20fc25bca52f Joanne Koong 2022-07-12  854  	struct inet_bind2_bucket *tb2=
, *new_tb2;
2e20fc25bca52f Joanne Koong 2022-07-12  855  	int l3mdev =3D inet_sk_bound_=
l3mdev(sk);
2e20fc25bca52f Joanne Koong 2022-07-12  856  	int port =3D inet_sk(sk)->ine=
t_num;
2e20fc25bca52f Joanne Koong 2022-07-12  857  	struct net *net =3D sock_net(=
sk);
2e20fc25bca52f Joanne Koong 2022-07-12  858  =

2e20fc25bca52f Joanne Koong 2022-07-12  859  	/* Allocate a bind2 bucket ah=
ead of time to avoid permanently putting
2e20fc25bca52f Joanne Koong 2022-07-12  860  	 * the bhash2 table in an inc=
onsistent state if a new tb2 bucket
2e20fc25bca52f Joanne Koong 2022-07-12  861  	 * allocation fails.
2e20fc25bca52f Joanne Koong 2022-07-12  862  	 */
2e20fc25bca52f Joanne Koong 2022-07-12  863  	new_tb2 =3D kmem_cache_alloc(=
hinfo->bind2_bucket_cachep, GFP_ATOMIC);
2e20fc25bca52f Joanne Koong 2022-07-12  864  	if (!new_tb2)
2e20fc25bca52f Joanne Koong 2022-07-12  865  		return -ENOMEM;
2e20fc25bca52f Joanne Koong 2022-07-12  866  =

2e20fc25bca52f Joanne Koong 2022-07-12  867  	head =3D &hinfo->bhash[inet_b=
hashfn(net, port,
2e20fc25bca52f Joanne Koong 2022-07-12  868  					  hinfo->bhash_size)];
2e20fc25bca52f Joanne Koong 2022-07-12  869  	head2 =3D inet_bhashfn_portad=
dr(hinfo, sk, net, port);
2e20fc25bca52f Joanne Koong 2022-07-12  870  =

2e20fc25bca52f Joanne Koong 2022-07-12  871  	spin_lock_bh(&prev_saddr->loc=
k);
2e20fc25bca52f Joanne Koong 2022-07-12  872  	__sk_del_bind2_node(sk);
2e20fc25bca52f Joanne Koong 2022-07-12  873  	inet_bind2_bucket_destroy(hin=
fo->bind2_bucket_cachep,
2e20fc25bca52f Joanne Koong 2022-07-12  874  				  inet_csk(sk)->icsk_bind2=
_hash);
2e20fc25bca52f Joanne Koong 2022-07-12  875  	spin_unlock_bh(&prev_saddr->l=
ock);
2e20fc25bca52f Joanne Koong 2022-07-12  876  =

2e20fc25bca52f Joanne Koong 2022-07-12  877  	spin_lock_bh(&head2->lock);
2e20fc25bca52f Joanne Koong 2022-07-12  878  	tb2 =3D inet_bind2_bucket_fin=
d(head2, net, port, l3mdev, sk);
2e20fc25bca52f Joanne Koong 2022-07-12  879  	if (!tb2) {
2e20fc25bca52f Joanne Koong 2022-07-12  880  		tb2 =3D new_tb2;
2e20fc25bca52f Joanne Koong 2022-07-12  881  		inet_bind2_bucket_init(tb2, =
net, head2, port, l3mdev, sk);
2e20fc25bca52f Joanne Koong 2022-07-12  882  	}
2e20fc25bca52f Joanne Koong 2022-07-12  883  	sk_add_bind2_node(sk, &tb2->o=
wners);
2e20fc25bca52f Joanne Koong 2022-07-12  884  	inet_csk(sk)->icsk_bind2_hash=
 =3D tb2;
2e20fc25bca52f Joanne Koong 2022-07-12  885  	spin_unlock_bh(&head2->lock);
2e20fc25bca52f Joanne Koong 2022-07-12  886  =

2e20fc25bca52f Joanne Koong 2022-07-12  887  	if (tb2 !=3D new_tb2)
2e20fc25bca52f Joanne Koong 2022-07-12  888  		kmem_cache_free(hinfo->bind2=
_bucket_cachep, new_tb2);
2e20fc25bca52f Joanne Koong 2022-07-12  889  =

2e20fc25bca52f Joanne Koong 2022-07-12  890  	return 0;
2e20fc25bca52f Joanne Koong 2022-07-12  891  }
2e20fc25bca52f Joanne Koong 2022-07-12  892  EXPORT_SYMBOL_GPL(inet_bhash2_=
update_saddr);
2e20fc25bca52f Joanne Koong 2022-07-12  893  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2081572210066053643==--

