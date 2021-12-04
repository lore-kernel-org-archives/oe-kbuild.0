Content-Type: multipart/mixed; boundary="===============2353780850435900985=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v2 net-next 2/4] txhash: Add socket option to control TX hash rethink behavior
Date: Sat, 04 Dec 2021 18:51:25 +0800
Message-ID: <202112041819.olaAZP8L-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2353780850435900985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211202164031.18134-3-hmukos@yandex-team.ru>
References: <20211202164031.18134-3-hmukos@yandex-team.ru>
TO: Akhmat Karakotov <hmukos@yandex-team.ru>

Hi Akhmat,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on arnd-asm-generic/master]
[cannot apply to net-next/master deller-parisc/for-next bpf-next/master bpf=
/master linus/master davem-sparc/master v5.16-rc3 next-20211203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Akhmat-Karakotov/txhash-Ma=
ke-rethinking-txhash-behavior-configurable-via-sysctl/20211203-014057
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.gi=
t master
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001-20211203 (https://download.01.org/0day-ci/ar=
chive/20211204/202112041819.olaAZP8L-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/ipv4/inet_connection_sock.c:1049 inet_csk_listen_start() warn: impossib=
le condition '(sk->sk_txrehash =3D=3D -1) =3D> (0-255 =3D=3D (-1))'

vim +1049 net/ipv4/inet_connection_sock.c

e337e24d6624e7 Christoph Paasch         2012-12-14  1037  =

f985c65c908f6b Eric Dumazet             2015-10-14  1038  int inet_csk_list=
en_start(struct sock *sk, int backlog)
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1039  {
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1040  	struct inet_conn=
ection_sock *icsk =3D inet_csk(sk);
10cbc8f179177c Eric Dumazet             2015-10-02  1041  	struct inet_sock=
 *inet =3D inet_sk(sk);
086c653f586259 Craig Gallek             2016-02-10  1042  	int err =3D -EAD=
DRINUSE;
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1043  =

ef547f2ac16bd9 Eric Dumazet             2015-10-02  1044  	reqsk_queue_allo=
c(&icsk->icsk_accept_queue);
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1045  =

a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1046  	sk->sk_ack_backl=
og =3D 0;
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1047  	inet_csk_delack_=
init(sk);
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1048  =

5a9ea3173f8cf5 Akhmat Karakotov         2021-12-02 @1049  	if (sk->sk_txreh=
ash =3D=3D SOCK_TXREHASH_DEFAULT)
5a9ea3173f8cf5 Akhmat Karakotov         2021-12-02  1050  		sk->sk_txrehash=
 =3D READ_ONCE(sock_net(sk)->core.sysctl_txrehash);
5a9ea3173f8cf5 Akhmat Karakotov         2021-12-02  1051  =

a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1052  	/* There is race=
 window here: we announce ourselves listening,
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1053  	 * but this tran=
sition is still not validated by get_port().
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1054  	 * It is OK, bec=
ause this socket enters to hash table only
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1055  	 * after validat=
ion is complete.
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1056  	 */
563e0bb0dc74b3 Yafang Shao              2017-12-20  1057  	inet_sk_state_st=
ore(sk, TCP_LISTEN);
c720c7e8383aff Eric Dumazet             2009-10-15  1058  	if (!sk->sk_prot=
->get_port(sk, inet->inet_num)) {
c720c7e8383aff Eric Dumazet             2009-10-15  1059  		inet->inet_spor=
t =3D htons(inet->inet_num);
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1060  =

a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1061  		sk_dst_reset(sk=
);
086c653f586259 Craig Gallek             2016-02-10  1062  		err =3D sk->sk_=
prot->hash(sk);
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1063  =

086c653f586259 Craig Gallek             2016-02-10  1064  		if (likely(!err=
))
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1065  			return 0;
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1066  	}
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1067  =

563e0bb0dc74b3 Yafang Shao              2017-12-20  1068  	inet_sk_set_stat=
e(sk, TCP_CLOSE);
086c653f586259 Craig Gallek             2016-02-10  1069  	return err;
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1070  }
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1071  EXPORT_SYMBOL_GPL=
(inet_csk_listen_start);
a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1072  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2353780850435900985==--

