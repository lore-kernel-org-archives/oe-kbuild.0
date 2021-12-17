Content-Type: multipart/mixed; boundary="===============1622717667063043073=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3098/8462] net/unix/af_unix.c:3255:2-11: second lock on line 3255
Date: Sat, 18 Dec 2021 07:16:18 +0800
Message-ID: <202112180756.LW6mSr0H-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1622717667063043073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   c122052c3cb861b3e61a01d2c2ab9069e470663e
commit: afd20b9290e184c203fe22f2d6b80dc7127ba724 [3098/8462] af_unix: Repla=
ce the big lock with small locks.
:::::: branch date: 10 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20211218/202112180756.LW6mSr0H-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> net/unix/af_unix.c:3255:2-11: second lock on line 3255

vim +3255 net/unix/af_unix.c

7123aaa3a14165 Eric Dumazet      2012-06-08  3239  =

7123aaa3a14165 Eric Dumazet      2012-06-08  3240  static struct sock *unix=
_next_socket(struct seq_file *seq,
7123aaa3a14165 Eric Dumazet      2012-06-08  3241  				     struct sock *sk,
7123aaa3a14165 Eric Dumazet      2012-06-08  3242  				     loff_t *pos)
7123aaa3a14165 Eric Dumazet      2012-06-08  3243  {
afd20b9290e184 Kuniyuki Iwashima 2021-11-24  3244  	unsigned long bucket =
=3D get_bucket(*pos);
7123aaa3a14165 Eric Dumazet      2012-06-08  3245  =

7123aaa3a14165 Eric Dumazet      2012-06-08  3246  	while (sk > (struct soc=
k *)SEQ_START_TOKEN) {
7123aaa3a14165 Eric Dumazet      2012-06-08  3247  		sk =3D sk_next(sk);
7123aaa3a14165 Eric Dumazet      2012-06-08  3248  		if (!sk)
7123aaa3a14165 Eric Dumazet      2012-06-08  3249  			goto next_bucket;
7123aaa3a14165 Eric Dumazet      2012-06-08  3250  		if (sock_net(sk) =3D=
=3D seq_file_net(seq))
7123aaa3a14165 Eric Dumazet      2012-06-08  3251  			return sk;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3252  	}
7123aaa3a14165 Eric Dumazet      2012-06-08  3253  =

7123aaa3a14165 Eric Dumazet      2012-06-08  3254  	do {
afd20b9290e184 Kuniyuki Iwashima 2021-11-24 @3255  		spin_lock(&unix_table_=
locks[bucket]);
7123aaa3a14165 Eric Dumazet      2012-06-08  3256  		sk =3D unix_from_bucke=
t(seq, pos);
7123aaa3a14165 Eric Dumazet      2012-06-08  3257  		if (sk)
7123aaa3a14165 Eric Dumazet      2012-06-08  3258  			return sk;
7123aaa3a14165 Eric Dumazet      2012-06-08  3259  =

7123aaa3a14165 Eric Dumazet      2012-06-08  3260  next_bucket:
afd20b9290e184 Kuniyuki Iwashima 2021-11-24  3261  		spin_unlock(&unix_tabl=
e_locks[bucket++]);
7123aaa3a14165 Eric Dumazet      2012-06-08  3262  		*pos =3D set_bucket_of=
fset(bucket, 1);
7123aaa3a14165 Eric Dumazet      2012-06-08  3263  	} while (bucket < ARRAY=
_SIZE(unix_socket_table));
7123aaa3a14165 Eric Dumazet      2012-06-08  3264  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  3265  	return NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3266  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  3267  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============1622717667063043073==--

