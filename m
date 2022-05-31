Content-Type: multipart/mixed; boundary="===============5056978283335974083=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/ipv4/tcp_fastopen.c:97 tcp_fastopen_reset_cipher() warn: possible memory leak of 'ctx'
Date: Tue, 31 May 2022 17:49:32 +0800
Message-ID: <202205311732.UCAiYskK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5056978283335974083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ab2afa23bd197df47819a87f0265c0ac95c5b6a
commit: e93abb840a2c356ed2809c31fcedb058601ac2e4 net/tcp_fastopen: remove t=
cp_fastopen_ctx_lock
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
config: ia64-randconfig-m031-20220530 (https://download.01.org/0day-ci/arch=
ive/20220531/202205311732.UCAiYskK-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/ipv4/tcp_fastopen.c:97 tcp_fastopen_reset_cipher() warn: possible memor=
y leak of 'ctx'

vim +/ctx +97 net/ipv4/tcp_fastopen.c

437138485656c4 Haishuang Yan  2017-09-27  63  =

9092a76d3cf863 Jason Baron    2019-05-29  64  int tcp_fastopen_reset_cipher=
(struct net *net, struct sock *sk,
438ac88009bcb1 Ard Biesheuvel 2019-06-19  65  			      void *primary_key, v=
oid *backup_key)
9092a76d3cf863 Jason Baron    2019-05-29  66  {
9092a76d3cf863 Jason Baron    2019-05-29  67  	struct tcp_fastopen_context =
*ctx, *octx;
9092a76d3cf863 Jason Baron    2019-05-29  68  	struct fastopen_queue *q;
9092a76d3cf863 Jason Baron    2019-05-29  69  	int err =3D 0;
1046716368979d Jerry Chu      2012-08-31  70  =

c681edae33e86f Ard Biesheuvel 2019-06-17  71  	ctx =3D kmalloc(sizeof(*ctx)=
, GFP_KERNEL);
c681edae33e86f Ard Biesheuvel 2019-06-17  72  	if (!ctx) {
c681edae33e86f Ard Biesheuvel 2019-06-17  73  		err =3D -ENOMEM;
9092a76d3cf863 Jason Baron    2019-05-29  74  		goto out;
9092a76d3cf863 Jason Baron    2019-05-29  75  	}
c681edae33e86f Ard Biesheuvel 2019-06-17  76  =

438ac88009bcb1 Ard Biesheuvel 2019-06-19  77  	ctx->key[0].key[0] =3D get_u=
naligned_le64(primary_key);
438ac88009bcb1 Ard Biesheuvel 2019-06-19  78  	ctx->key[0].key[1] =3D get_u=
naligned_le64(primary_key + 8);
c681edae33e86f Ard Biesheuvel 2019-06-17  79  	if (backup_key) {
438ac88009bcb1 Ard Biesheuvel 2019-06-19  80  		ctx->key[1].key[0] =3D get_=
unaligned_le64(backup_key);
438ac88009bcb1 Ard Biesheuvel 2019-06-19  81  		ctx->key[1].key[1] =3D get_=
unaligned_le64(backup_key + 8);
c681edae33e86f Ard Biesheuvel 2019-06-17  82  		ctx->num =3D 2;
c681edae33e86f Ard Biesheuvel 2019-06-17  83  	} else {
c681edae33e86f Ard Biesheuvel 2019-06-17  84  		ctx->num =3D 1;
c681edae33e86f Ard Biesheuvel 2019-06-17  85  	}
c681edae33e86f Ard Biesheuvel 2019-06-17  86  =

1fba70e5b6bed5 Yuchung Cheng  2017-10-18  87  	if (sk) {
1fba70e5b6bed5 Yuchung Cheng  2017-10-18  88  		q =3D &inet_csk(sk)->icsk_a=
ccept_queue.fastopenq;
e93abb840a2c35 Eric Dumazet   2021-07-19  89  		octx =3D xchg((__force stru=
ct tcp_fastopen_context **)&q->ctx, ctx);
1fba70e5b6bed5 Yuchung Cheng  2017-10-18  90  	} else {
e93abb840a2c35 Eric Dumazet   2021-07-19  91  		octx =3D xchg((__force stru=
ct tcp_fastopen_context **)&net->ipv4.tcp_fastopen_ctx, ctx);
1fba70e5b6bed5 Yuchung Cheng  2017-10-18  92  	}
1046716368979d Jerry Chu      2012-08-31  93  =

1046716368979d Jerry Chu      2012-08-31  94  	if (octx)
1046716368979d Jerry Chu      2012-08-31  95  		call_rcu(&octx->rcu, tcp_fa=
stopen_ctx_free);
9092a76d3cf863 Jason Baron    2019-05-29  96  out:
1046716368979d Jerry Chu      2012-08-31 @97  	return err;
1046716368979d Jerry Chu      2012-08-31  98  }
1046716368979d Jerry Chu      2012-08-31  99  =


:::::: The code at line 97 was first introduced by commit
:::::: 1046716368979dee857a2b8a91c4a8833f21b9cb tcp: TCP Fast Open Server -=
 header & support functions

:::::: TO: Jerry Chu <hkchu@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5056978283335974083==--

