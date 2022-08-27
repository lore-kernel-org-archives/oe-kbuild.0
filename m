Content-Type: multipart/mixed; boundary="===============1170400738587274453=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 14/31] net/tcp: Add TCP-AO sign to twsk
Date: Sat, 27 Aug 2022 12:39:21 +0800
Message-ID: <202208271241.MAJo5i2m-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1170400738587274453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220818170005.747015-15-dima@arista.com>
References: <20220818170005.747015-15-dima@arista.com>
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
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/202=
20827/202208271241.MAJo5i2m-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> net/ipv4/tcp_ao.c:214:13-32: atomic_dec_and_test variation before object=
 free at line 218.
   net/ipv4/tcp_ao.c:214:13-32: atomic_dec_and_test variation before object=
 free at line 224.

vim +214 net/ipv4/tcp_ao.c

469bd71e5ea011f Dmitry Safonov 2022-08-18  199  =

5e1471f5e8131f9 Dmitry Safonov 2022-08-18  200  void tcp_ao_destroy_sock(st=
ruct sock *sk, bool twsk)
469bd71e5ea011f Dmitry Safonov 2022-08-18  201  {
469bd71e5ea011f Dmitry Safonov 2022-08-18  202  	struct tcp_ao_info *ao;
469bd71e5ea011f Dmitry Safonov 2022-08-18  203  	struct tcp_ao_key *key;
469bd71e5ea011f Dmitry Safonov 2022-08-18  204  	struct hlist_node *n;
469bd71e5ea011f Dmitry Safonov 2022-08-18  205  =

5e1471f5e8131f9 Dmitry Safonov 2022-08-18  206  	if (twsk) {
5e1471f5e8131f9 Dmitry Safonov 2022-08-18  207  		ao =3D rcu_dereference_pr=
otected(tcp_twsk(sk)->ao_info, 1);
5e1471f5e8131f9 Dmitry Safonov 2022-08-18  208  		tcp_twsk(sk)->ao_info =3D=
 NULL;
5e1471f5e8131f9 Dmitry Safonov 2022-08-18  209  	} else {
469bd71e5ea011f Dmitry Safonov 2022-08-18  210  		ao =3D rcu_dereference_pr=
otected(tcp_sk(sk)->ao_info, 1);
469bd71e5ea011f Dmitry Safonov 2022-08-18  211  		tcp_sk(sk)->ao_info =3D N=
ULL;
5e1471f5e8131f9 Dmitry Safonov 2022-08-18  212  	}
469bd71e5ea011f Dmitry Safonov 2022-08-18  213  =

5e1471f5e8131f9 Dmitry Safonov 2022-08-18 @214  	if (!ao || !atomic_dec_and=
_test(&ao->refcnt))
469bd71e5ea011f Dmitry Safonov 2022-08-18  215  		return;
469bd71e5ea011f Dmitry Safonov 2022-08-18  216  =

469bd71e5ea011f Dmitry Safonov 2022-08-18  217  	hlist_for_each_entry_safe(=
key, n, &ao->head, node) {
469bd71e5ea011f Dmitry Safonov 2022-08-18 @218  		hlist_del_rcu(&key->node);
5e1471f5e8131f9 Dmitry Safonov 2022-08-18  219  		if (!twsk)
469bd71e5ea011f Dmitry Safonov 2022-08-18  220  			atomic_sub(tcp_ao_sizeof=
_key(key), &sk->sk_omem_alloc);
469bd71e5ea011f Dmitry Safonov 2022-08-18  221  		call_rcu(&key->rcu, tcp_a=
o_key_free_rcu);
469bd71e5ea011f Dmitry Safonov 2022-08-18  222  	}
469bd71e5ea011f Dmitry Safonov 2022-08-18  223  =

469bd71e5ea011f Dmitry Safonov 2022-08-18  224  	kfree_rcu(ao, rcu);
469bd71e5ea011f Dmitry Safonov 2022-08-18  225  }
469bd71e5ea011f Dmitry Safonov 2022-08-18  226  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1170400738587274453==--

