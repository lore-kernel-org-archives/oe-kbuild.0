Content-Type: multipart/mixed; boundary="===============4074515187181233203=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 10/31] net/tcp: Calculate TCP-AO traffic keys
Date: Sat, 27 Aug 2022 11:58:33 +0800
Message-ID: <202208271151.00tHdiGE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4074515187181233203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220818170005.747015-11-dima@arista.com>
References: <20220818170005.747015-11-dima@arista.com>
TO: Dmitry Safonov <dima@arista.com>
TO: Eric Dumazet <edumazet@google.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: Dmitry Safonov <dima@arista.com>
CC: Andy Lutomirski <luto@amacapital.net>
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Bob Gilligan <gilligan@arista.com>
CC: David Ahern <dsahern@kernel.org>
CC: Eric Biggers <ebiggers@kernel.org>
CC: Francesco Ruggeri <fruggeri@arista.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
CC: Ivan Delalande <colona@arista.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Leonard Crestez <cdleonard@gmail.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Salam Noureddine <noureddine@arista.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: linux-crypto(a)vger.kernel.org

Hi Dmitry,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on e34cfee65ec891a319ce79797dda18083af33a76]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Safonov/net-t=
cp-Add-TCP-AO-support/20220819-010628
base:   e34cfee65ec891a319ce79797dda18083af33a76
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/202=
20827/202208271151.00tHdiGE-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> net/ipv4/tcp_ao.c:333:21-32: ERROR: reference preceded by free on line 3=
32

vim +333 net/ipv4/tcp_ao.c

a58f130caaa0601 Dmitry Safonov 2022-08-18  280  =

a58f130caaa0601 Dmitry Safonov 2022-08-18  281  void tcp_ao_connect_init(st=
ruct sock *sk)
a58f130caaa0601 Dmitry Safonov 2022-08-18  282  {
a58f130caaa0601 Dmitry Safonov 2022-08-18  283  	struct tcp_ao_info *ao_inf=
o;
a58f130caaa0601 Dmitry Safonov 2022-08-18  284  	struct tcp_ao_key *key;
a58f130caaa0601 Dmitry Safonov 2022-08-18  285  	struct tcp_sock *tp =3D tc=
p_sk(sk);
a58f130caaa0601 Dmitry Safonov 2022-08-18  286  	union tcp_ao_addr *addr;
a58f130caaa0601 Dmitry Safonov 2022-08-18  287  	int family;
a58f130caaa0601 Dmitry Safonov 2022-08-18  288  =

a58f130caaa0601 Dmitry Safonov 2022-08-18  289  	ao_info =3D rcu_dereferenc=
e_protected(tp->ao_info,
a58f130caaa0601 Dmitry Safonov 2022-08-18  290  					    lockdep_sock_is_he=
ld(sk));
a58f130caaa0601 Dmitry Safonov 2022-08-18  291  	if (!ao_info)
a58f130caaa0601 Dmitry Safonov 2022-08-18  292  		return;
a58f130caaa0601 Dmitry Safonov 2022-08-18  293  =

a58f130caaa0601 Dmitry Safonov 2022-08-18  294  	/* Remove all keys that do=
n't match the peer */
a58f130caaa0601 Dmitry Safonov 2022-08-18  295  	family =3D sk->sk_family;
a58f130caaa0601 Dmitry Safonov 2022-08-18  296  	if (family =3D=3D AF_INET)
a58f130caaa0601 Dmitry Safonov 2022-08-18  297  		addr =3D (union tcp_ao_ad=
dr *)&sk->sk_daddr;
a58f130caaa0601 Dmitry Safonov 2022-08-18  298  	else
a58f130caaa0601 Dmitry Safonov 2022-08-18  299  		addr =3D (union tcp_ao_ad=
dr *)&sk->sk_v6_daddr;
a58f130caaa0601 Dmitry Safonov 2022-08-18  300  =

a58f130caaa0601 Dmitry Safonov 2022-08-18  301  	hlist_for_each_entry_rcu(k=
ey, &ao_info->head, node) {
a58f130caaa0601 Dmitry Safonov 2022-08-18  302  		if (tcp_ao_key_cmp(key, a=
ddr, key->prefixlen, family,
a58f130caaa0601 Dmitry Safonov 2022-08-18  303  		    -1, -1, sk->sk_dport)=
 =3D=3D 0)
a58f130caaa0601 Dmitry Safonov 2022-08-18  304  			continue;
a58f130caaa0601 Dmitry Safonov 2022-08-18  305  =

a58f130caaa0601 Dmitry Safonov 2022-08-18  306  		if (key =3D=3D ao_info->c=
urrent_key)
a58f130caaa0601 Dmitry Safonov 2022-08-18  307  			ao_info->current_key =3D=
 NULL;
a58f130caaa0601 Dmitry Safonov 2022-08-18  308  		if (key =3D=3D ao_info->r=
next_key)
a58f130caaa0601 Dmitry Safonov 2022-08-18  309  			ao_info->rnext_key =3D N=
ULL;
a58f130caaa0601 Dmitry Safonov 2022-08-18  310  		hlist_del_rcu(&key->node);
a58f130caaa0601 Dmitry Safonov 2022-08-18  311  		crypto_pool_release(key->=
crypto_pool_id);
a58f130caaa0601 Dmitry Safonov 2022-08-18  312  		atomic_sub(tcp_ao_sizeof_=
key(key), &sk->sk_omem_alloc);
a58f130caaa0601 Dmitry Safonov 2022-08-18  313  		kfree_rcu(key, rcu);
a58f130caaa0601 Dmitry Safonov 2022-08-18  314  	}
a58f130caaa0601 Dmitry Safonov 2022-08-18  315  =

a58f130caaa0601 Dmitry Safonov 2022-08-18  316  	key =3D tp->af_specific->a=
o_lookup(sk, sk, -1, -1);
a58f130caaa0601 Dmitry Safonov 2022-08-18  317  	if (key) {
a58f130caaa0601 Dmitry Safonov 2022-08-18  318  		/* if current_key or rnex=
t_key were not provided,
a58f130caaa0601 Dmitry Safonov 2022-08-18  319  		 * use the first key matc=
hing the peer
a58f130caaa0601 Dmitry Safonov 2022-08-18  320  		 */
a58f130caaa0601 Dmitry Safonov 2022-08-18  321  		if (!ao_info->current_key)
a58f130caaa0601 Dmitry Safonov 2022-08-18  322  			ao_info->current_key =3D=
 key;
a58f130caaa0601 Dmitry Safonov 2022-08-18  323  		if (!ao_info->rnext_key)
a58f130caaa0601 Dmitry Safonov 2022-08-18  324  			ao_info->rnext_key =3D k=
ey;
a58f130caaa0601 Dmitry Safonov 2022-08-18  325  		tp->tcp_header_len +=3D t=
cp_ao_len(key);
a58f130caaa0601 Dmitry Safonov 2022-08-18  326  =

a58f130caaa0601 Dmitry Safonov 2022-08-18  327  		ao_info->lisn =3D htonl(t=
p->write_seq);
a58f130caaa0601 Dmitry Safonov 2022-08-18  328  		ao_info->snd_sne =3D 0;
a58f130caaa0601 Dmitry Safonov 2022-08-18  329  		ao_info->snd_sne_seq =3D =
tp->write_seq;
a58f130caaa0601 Dmitry Safonov 2022-08-18  330  	} else {
a58f130caaa0601 Dmitry Safonov 2022-08-18  331  		WARN_ON_ONCE(1);
a58f130caaa0601 Dmitry Safonov 2022-08-18 @332  		kfree(tp->ao_info);
a58f130caaa0601 Dmitry Safonov 2022-08-18 @333  		rcu_assign_pointer(tp->ao=
_info, NULL);
a58f130caaa0601 Dmitry Safonov 2022-08-18  334  	}
a58f130caaa0601 Dmitry Safonov 2022-08-18  335  }
a58f130caaa0601 Dmitry Safonov 2022-08-18  336  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4074515187181233203==--

