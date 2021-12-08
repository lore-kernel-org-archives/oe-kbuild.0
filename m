Content-Type: multipart/mixed; boundary="===============4590869492352702288=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 06/18] tcp: authopt: Hook into tcp core
Date: Thu, 09 Dec 2021 05:09:46 +0800
Message-ID: <202112090428.Dm5nhj1N-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4590869492352702288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <c6a0af64b6e41aa74d70dc0f7321a5f2293ee53e.1638962992.git.cdleo=
nard@gmail.com>
References: <c6a0af64b6e41aa74d70dc0f7321a5f2293ee53e.1638962992.git.cdleon=
ard@gmail.com>
TO: Leonard Crestez <cdleonard@gmail.com>
TO: David Ahern <dsahern@kernel.org>
TO: Dmitry Safonov <0x7f454c46@gmail.com>
TO: Eric Dumazet <edumazet@google.com>
CC: Francesco Ruggeri <fruggeri@arista.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
CC: Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Yuchung Cheng <ycheng@google.com>

Hi Leonard,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 1fe5b01262844be03de98afdd56d1d393df04d7e]

url:    https://github.com/0day-ci/linux/commits/Leonard-Crestez/tcp-Initia=
l-support-for-RFC5925-auth-option/20211208-194125
base:   1fe5b01262844be03de98afdd56d1d393df04d7e
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-m001-20211207 (https://download.01.org/0day-ci/ar=
chive/20211209/202112090428.Dm5nhj1N-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/ipv6/tcp_ipv6.c:1635 tcp_v6_sig_check() error: uninitialized symbol 'ao=
'.
net/ipv6/tcp_ipv6.c:1640 tcp_v6_sig_check() error: uninitialized symbol 'md=
5'.
net/ipv6/tcp_ipv6.c:1655 tcp_v6_sig_check_req() error: uninitialized symbol=
 'ao'.
net/ipv6/tcp_ipv6.c:1660 tcp_v6_sig_check_req() error: uninitialized symbol=
 'md5'.
net/ipv4/tcp_ipv4.c:1967 tcp_v4_sig_check() error: uninitialized symbol 'ao=
'.
net/ipv4/tcp_ipv4.c:1972 tcp_v4_sig_check() error: uninitialized symbol 'md=
5'.
net/ipv4/tcp_ipv4.c:1987 tcp_v4_sig_check_req() error: uninitialized symbol=
 'ao'.
net/ipv4/tcp_ipv4.c:1992 tcp_v4_sig_check_req() error: uninitialized symbol=
 'md5'.

vim +/ao +1635 net/ipv6/tcp_ipv6.c

2dc49d1680b534 Nicolas Dichtel 2014-12-22  1623  =

5935c41094c73e Leonard Crestez 2021-12-08  1624  static int tcp_v6_sig_chec=
k(struct sock *sk,
5935c41094c73e Leonard Crestez 2021-12-08  1625  			    struct sk_buff *skb,
5935c41094c73e Leonard Crestez 2021-12-08  1626  			    int dif,
5935c41094c73e Leonard Crestez 2021-12-08  1627  			    int sdif)
5935c41094c73e Leonard Crestez 2021-12-08  1628  {
5935c41094c73e Leonard Crestez 2021-12-08  1629  	const u8 *md5, *ao;
5935c41094c73e Leonard Crestez 2021-12-08  1630  	int ret;
5935c41094c73e Leonard Crestez 2021-12-08  1631  =

5935c41094c73e Leonard Crestez 2021-12-08  1632  	ret =3D tcp_parse_sig_opt=
ions(tcp_hdr(skb), &md5, &ao);
5935c41094c73e Leonard Crestez 2021-12-08  1633  	if (ret)
5935c41094c73e Leonard Crestez 2021-12-08  1634  		return ret;
5935c41094c73e Leonard Crestez 2021-12-08 @1635  	ret =3D tcp_authopt_inbou=
nd_check(sk, skb, ao);
5935c41094c73e Leonard Crestez 2021-12-08  1636  	if (ret < 0)
5935c41094c73e Leonard Crestez 2021-12-08  1637  		return ret;
5935c41094c73e Leonard Crestez 2021-12-08  1638  	if (ret =3D=3D 1)
5935c41094c73e Leonard Crestez 2021-12-08  1639  		return 0;
5935c41094c73e Leonard Crestez 2021-12-08 @1640  	return tcp_v6_inbound_md5=
_hash(sk, skb, dif, sdif, md5);
5935c41094c73e Leonard Crestez 2021-12-08  1641  }
5935c41094c73e Leonard Crestez 2021-12-08  1642  =

5935c41094c73e Leonard Crestez 2021-12-08  1643  static int tcp_v6_sig_chec=
k_req(struct request_sock *req,
5935c41094c73e Leonard Crestez 2021-12-08  1644  				struct sk_buff *skb,
5935c41094c73e Leonard Crestez 2021-12-08  1645  				int dif,
5935c41094c73e Leonard Crestez 2021-12-08  1646  				int sdif)
5935c41094c73e Leonard Crestez 2021-12-08  1647  {
5935c41094c73e Leonard Crestez 2021-12-08  1648  	struct sock *lsk =3D req-=
>rsk_listener;
5935c41094c73e Leonard Crestez 2021-12-08  1649  	const u8 *md5, *ao;
5935c41094c73e Leonard Crestez 2021-12-08  1650  	int ret;
5935c41094c73e Leonard Crestez 2021-12-08  1651  =

5935c41094c73e Leonard Crestez 2021-12-08  1652  	ret =3D tcp_parse_sig_opt=
ions(tcp_hdr(skb), &md5, &ao);
5935c41094c73e Leonard Crestez 2021-12-08  1653  	if (ret)
5935c41094c73e Leonard Crestez 2021-12-08  1654  		return ret;
5935c41094c73e Leonard Crestez 2021-12-08 @1655  	ret =3D tcp_authopt_inbou=
nd_check_req(req, skb, ao);
5935c41094c73e Leonard Crestez 2021-12-08  1656  	if (ret < 0)
5935c41094c73e Leonard Crestez 2021-12-08  1657  		return ret;
5935c41094c73e Leonard Crestez 2021-12-08  1658  	if (ret =3D=3D 1)
5935c41094c73e Leonard Crestez 2021-12-08  1659  		return 0;
5935c41094c73e Leonard Crestez 2021-12-08 @1660  	return tcp_v6_inbound_md5=
_hash(lsk, skb, dif, sdif, md5);
5935c41094c73e Leonard Crestez 2021-12-08  1661  }
5935c41094c73e Leonard Crestez 2021-12-08  1662  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============4590869492352702288==--

