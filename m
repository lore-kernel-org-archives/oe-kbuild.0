Content-Type: multipart/mixed; boundary="===============4374541232818491571=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/unix/af_unix.c:2471 manage_oob() warn: returning freed memory 'skb'
Date: Sat, 09 Jul 2022 01:26:42 +0800
Message-ID: <202207090117.Ub3gbT5M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4374541232818491571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Rao Shoaib <rao.shoaib@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e8a4e1c1bb697b1d9fc48f0e56dc0f50bc024bee
commit: 314001f0bf927015e459c9d387d62a231fe93af3 af_unix: Add OOB support
date:   11 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 11 months ago
config: m68k-randconfig-m031-20220708 (https://download.01.org/0day-ci/arch=
ive/20220709/202207090117.Ub3gbT5M-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/unix/af_unix.c:2471 manage_oob() warn: returning freed memory 'skb'

vim +/skb +2471 net/unix/af_unix.c

314001f0bf9270 Rao Shoaib 2021-08-01  2445  =

314001f0bf9270 Rao Shoaib 2021-08-01  2446  static struct sk_buff *manage_o=
ob(struct sk_buff *skb, struct sock *sk,
314001f0bf9270 Rao Shoaib 2021-08-01  2447  				  int flags, int copied)
314001f0bf9270 Rao Shoaib 2021-08-01  2448  {
314001f0bf9270 Rao Shoaib 2021-08-01  2449  	struct unix_sock *u =3D unix_s=
k(sk);
314001f0bf9270 Rao Shoaib 2021-08-01  2450  =

314001f0bf9270 Rao Shoaib 2021-08-01  2451  	if (!unix_skb_len(skb) && !(fl=
ags & MSG_PEEK)) {
314001f0bf9270 Rao Shoaib 2021-08-01  2452  		skb_unlink(skb, &sk->sk_recei=
ve_queue);
314001f0bf9270 Rao Shoaib 2021-08-01  2453  		consume_skb(skb);
314001f0bf9270 Rao Shoaib 2021-08-01  2454  		skb =3D NULL;
314001f0bf9270 Rao Shoaib 2021-08-01  2455  	} else {
314001f0bf9270 Rao Shoaib 2021-08-01  2456  		if (skb =3D=3D u->oob_skb) {
314001f0bf9270 Rao Shoaib 2021-08-01  2457  			if (copied) {
314001f0bf9270 Rao Shoaib 2021-08-01  2458  				skb =3D NULL;
314001f0bf9270 Rao Shoaib 2021-08-01  2459  			} else if (sock_flag(sk, SOC=
K_URGINLINE)) {
314001f0bf9270 Rao Shoaib 2021-08-01  2460  				if (!(flags & MSG_PEEK)) {
314001f0bf9270 Rao Shoaib 2021-08-01  2461  					u->oob_skb =3D NULL;
314001f0bf9270 Rao Shoaib 2021-08-01  2462  					consume_skb(skb);
314001f0bf9270 Rao Shoaib 2021-08-01  2463  				}
314001f0bf9270 Rao Shoaib 2021-08-01  2464  			} else if (!(flags & MSG_PEE=
K)) {
314001f0bf9270 Rao Shoaib 2021-08-01  2465  				skb_unlink(skb, &sk->sk_rec=
eive_queue);
314001f0bf9270 Rao Shoaib 2021-08-01  2466  				consume_skb(skb);
314001f0bf9270 Rao Shoaib 2021-08-01  2467  				skb =3D skb_peek(&sk->sk_re=
ceive_queue);
314001f0bf9270 Rao Shoaib 2021-08-01  2468  			}
314001f0bf9270 Rao Shoaib 2021-08-01  2469  		}
314001f0bf9270 Rao Shoaib 2021-08-01  2470  	}
314001f0bf9270 Rao Shoaib 2021-08-01 @2471  	return skb;
314001f0bf9270 Rao Shoaib 2021-08-01  2472  }
314001f0bf9270 Rao Shoaib 2021-08-01  2473  #endif
314001f0bf9270 Rao Shoaib 2021-08-01  2474  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4374541232818491571==--

