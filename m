Content-Type: multipart/mixed; boundary="===============6673127235060884084=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/unix/af_unix.c:2471 manage_oob() warn: returning freed memory 'skb'
Date: Fri, 26 Nov 2021 17:55:19 +0800
Message-ID: <202111261743.2W1C2ZA9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6673127235060884084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Rao Shoaib <rao.shoaib@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a4849f6000e29235a2707f22e39da6b897bb9543
commit: 314001f0bf927015e459c9d387d62a231fe93af3 af_unix: Add OOB support
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
config: openrisc-randconfig-m031-20211123 (https://download.01.org/0day-ci/=
archive/20211126/202111261743.2W1C2ZA9-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/unix/af_unix.c:2471 manage_oob() warn: returning freed memory 'skb'

vim +/skb +2471 net/unix/af_unix.c

314001f0bf92701 Rao Shoaib 2021-08-01  2445  =

314001f0bf92701 Rao Shoaib 2021-08-01  2446  static struct sk_buff *manage_=
oob(struct sk_buff *skb, struct sock *sk,
314001f0bf92701 Rao Shoaib 2021-08-01  2447  				  int flags, int copied)
314001f0bf92701 Rao Shoaib 2021-08-01  2448  {
314001f0bf92701 Rao Shoaib 2021-08-01  2449  	struct unix_sock *u =3D unix_=
sk(sk);
314001f0bf92701 Rao Shoaib 2021-08-01  2450  =

314001f0bf92701 Rao Shoaib 2021-08-01  2451  	if (!unix_skb_len(skb) && !(f=
lags & MSG_PEEK)) {
314001f0bf92701 Rao Shoaib 2021-08-01  2452  		skb_unlink(skb, &sk->sk_rece=
ive_queue);
314001f0bf92701 Rao Shoaib 2021-08-01  2453  		consume_skb(skb);
314001f0bf92701 Rao Shoaib 2021-08-01  2454  		skb =3D NULL;
314001f0bf92701 Rao Shoaib 2021-08-01  2455  	} else {
314001f0bf92701 Rao Shoaib 2021-08-01  2456  		if (skb =3D=3D u->oob_skb) {
314001f0bf92701 Rao Shoaib 2021-08-01  2457  			if (copied) {
314001f0bf92701 Rao Shoaib 2021-08-01  2458  				skb =3D NULL;
314001f0bf92701 Rao Shoaib 2021-08-01  2459  			} else if (sock_flag(sk, SO=
CK_URGINLINE)) {
314001f0bf92701 Rao Shoaib 2021-08-01  2460  				if (!(flags & MSG_PEEK)) {
314001f0bf92701 Rao Shoaib 2021-08-01  2461  					u->oob_skb =3D NULL;
314001f0bf92701 Rao Shoaib 2021-08-01  2462  					consume_skb(skb);
314001f0bf92701 Rao Shoaib 2021-08-01  2463  				}
314001f0bf92701 Rao Shoaib 2021-08-01  2464  			} else if (!(flags & MSG_PE=
EK)) {
314001f0bf92701 Rao Shoaib 2021-08-01  2465  				skb_unlink(skb, &sk->sk_re=
ceive_queue);
314001f0bf92701 Rao Shoaib 2021-08-01  2466  				consume_skb(skb);
314001f0bf92701 Rao Shoaib 2021-08-01  2467  				skb =3D skb_peek(&sk->sk_r=
eceive_queue);
314001f0bf92701 Rao Shoaib 2021-08-01  2468  			}
314001f0bf92701 Rao Shoaib 2021-08-01  2469  		}
314001f0bf92701 Rao Shoaib 2021-08-01  2470  	}
314001f0bf92701 Rao Shoaib 2021-08-01 @2471  	return skb;
314001f0bf92701 Rao Shoaib 2021-08-01  2472  }
314001f0bf92701 Rao Shoaib 2021-08-01  2473  #endif
314001f0bf92701 Rao Shoaib 2021-08-01  2474  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6673127235060884084==--

