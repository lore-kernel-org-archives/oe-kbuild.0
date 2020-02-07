Content-Type: multipart/mixed; boundary="===============6863290477661433303=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [android-goldfish:android-3.18 260/303] net/ipv4/tcp_input.c:875 tcp_verify_retransmit_hint() warn: if statement not indented
Date: Fri, 07 Feb 2020 06:33:50 +0300
Message-ID: <20200207033350.GL24804@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6863290477661433303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/goldfish android-3.18
head:   00127200e529357755b80e4ccdd1e956a2014e0f
commit: aead6225458bac4a4cf6329bc8accf3c68863495 [260/303] tcp: fix marked =
lost packets not being retransmitted

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ipv4/tcp_input.c:875 tcp_verify_retransmit_hint() warn: if statement no=
t indented

Old smatch warnings:
include/linux/netdevice.h:3585 net_gso_ok() warn: should 'gso_type << 16' b=
e a 64 bit type?

git remote add android-goldfish https://android.googlesource.com/kernel/gol=
dfish
git remote update android-goldfish
git checkout aead6225458bac4a4cf6329bc8accf3c68863495
vim +875 net/ipv4/tcp_input.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  871  =

006f582c73f4eda Ilpo J=C3=A4rvinen  2008-09-20  872  /* This must be called=
 before lost_out is incremented */
c8c213f20ce97c6 Ilpo J=C3=A4rvinen  2008-09-20  873  static void tcp_verify=
_retransmit_hint(struct tcp_sock *tp, struct sk_buff *skb)
c8c213f20ce97c6 Ilpo J=C3=A4rvinen  2008-09-20  874  {
aead6225458bac4 Pengcheng Yang 2020-01-14 @875  	if (((tp->retransmit_skb_h=
int =3D=3D NULL) && tp->retrans_out >=3D tp->lost_out) ||
aead6225458bac4 Pengcheng Yang 2020-01-14  876  	    (tp->retransmit_skb_hi=
nt &&
c8c213f20ce97c6 Ilpo J=C3=A4rvinen  2008-09-20  877  	     before(TCP_SKB_C=
B(skb)->seq,
aead6225458bac4 Pengcheng Yang 2020-01-14  878  		    TCP_SKB_CB(tp->retran=
smit_skb_hint)->seq)))
006f582c73f4eda Ilpo J=C3=A4rvinen  2008-09-20  879  =


What was this if statement supposed to do?

006f582c73f4eda Ilpo J=C3=A4rvinen  2008-09-20  880  	if (!tp->lost_out ||
006f582c73f4eda Ilpo J=C3=A4rvinen  2008-09-20  881  	    after(TCP_SKB_CB(=
skb)->end_seq, tp->retransmit_high))
006f582c73f4eda Ilpo J=C3=A4rvinen  2008-09-20  882  		tp->retransmit_high =
=3D TCP_SKB_CB(skb)->end_seq;
c8c213f20ce97c6 Ilpo J=C3=A4rvinen  2008-09-20  883  }
c8c213f20ce97c6 Ilpo J=C3=A4rvinen  2008-09-20  884  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6863290477661433303==--

