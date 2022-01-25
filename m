Content-Type: multipart/mixed; boundary="===============1443600285949418949=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 9992/9999] net/bluetooth/sco.c:740 sco_sock_sendmsg() warn: passing zero to 'PTR_ERR'
Date: Tue, 25 Jan 2022 16:48:06 +0800
Message-ID: <202201251609.fy4tmQXu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1443600285949418949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   26a3cf7b7d542f4ff85e2855ab69140bff097a50
commit: b6f5b38fa8be1941fd566b1d2d6c0cb1b393915a [9992/9999] UPSTREAM: Blue=
tooth: SCO: Replace use of memcpy_from_msg with bt_skb_sendmsg
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: mips-randconfig-m031-20220124 (https://download.01.org/0day-ci/arch=
ive/20220125/202201251609.fy4tmQXu-lkp(a)intel.com/config)
compiler: mips64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/bluetooth/sco.c:740 sco_sock_sendmsg() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +740 net/bluetooth/sco.c

^1da177e4c3f41 Linus Torvalds         2005-04-16  721  =

1b784140474e4f Ying Xue               2015-03-02  722  static int sco_sock_=
sendmsg(struct socket *sock, struct msghdr *msg,
1b784140474e4f Ying Xue               2015-03-02  723  			    size_t len)
^1da177e4c3f41 Linus Torvalds         2005-04-16  724  {
^1da177e4c3f41 Linus Torvalds         2005-04-16  725  	struct sock *sk =3D=
 sock->sk;
b6f5b38fa8be19 Luiz Augusto von Dentz 2021-09-03  726  	struct sk_buff *skb;
b9dbdbc1f4404c Gustavo Padovan        2010-05-01  727  	int err;
^1da177e4c3f41 Linus Torvalds         2005-04-16  728  =

^1da177e4c3f41 Linus Torvalds         2005-04-16  729  	BT_DBG("sock %p, sk=
 %p", sock, sk);
^1da177e4c3f41 Linus Torvalds         2005-04-16  730  =

c1cbe4b7ad0bc4 Benjamin LaHaise       2005-12-13  731  	err =3D sock_error(=
sk);
c1cbe4b7ad0bc4 Benjamin LaHaise       2005-12-13  732  	if (err)
c1cbe4b7ad0bc4 Benjamin LaHaise       2005-12-13  733  		return err;
^1da177e4c3f41 Linus Torvalds         2005-04-16  734  =

^1da177e4c3f41 Linus Torvalds         2005-04-16  735  	if (msg->msg_flags =
& MSG_OOB)
^1da177e4c3f41 Linus Torvalds         2005-04-16  736  		return -EOPNOTSUPP;
^1da177e4c3f41 Linus Torvalds         2005-04-16  737  =

b6f5b38fa8be19 Luiz Augusto von Dentz 2021-09-03  738  	skb =3D bt_skb_send=
msg(sk, msg, len, len, 0, 0);
b6f5b38fa8be19 Luiz Augusto von Dentz 2021-09-03  739  	if (IS_ERR_OR_NULL(=
skb))
b6f5b38fa8be19 Luiz Augusto von Dentz 2021-09-03 @740  		return PTR_ERR(skb=
);
4dfba42604f08a Takashi Iwai           2021-08-28  741  =

^1da177e4c3f41 Linus Torvalds         2005-04-16  742  	lock_sock(sk);
^1da177e4c3f41 Linus Torvalds         2005-04-16  743  =

^1da177e4c3f41 Linus Torvalds         2005-04-16  744  	if (sk->sk_state =
=3D=3D BT_CONNECTED)
b6f5b38fa8be19 Luiz Augusto von Dentz 2021-09-03  745  		err =3D sco_send_f=
rame(sk, skb);
^1da177e4c3f41 Linus Torvalds         2005-04-16  746  	else
^1da177e4c3f41 Linus Torvalds         2005-04-16  747  		err =3D -ENOTCONN;
^1da177e4c3f41 Linus Torvalds         2005-04-16  748  =

^1da177e4c3f41 Linus Torvalds         2005-04-16  749  	release_sock(sk);
b6f5b38fa8be19 Luiz Augusto von Dentz 2021-09-03  750  	if (err)
b6f5b38fa8be19 Luiz Augusto von Dentz 2021-09-03  751  		kfree_skb(skb);
^1da177e4c3f41 Linus Torvalds         2005-04-16  752  	return err;
^1da177e4c3f41 Linus Torvalds         2005-04-16  753  }
^1da177e4c3f41 Linus Torvalds         2005-04-16  754  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1443600285949418949==--

