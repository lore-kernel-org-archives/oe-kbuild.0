Content-Type: multipart/mixed; boundary="===============7594440879536477681=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 net-next 12/13] af_unix: Replace the big lock with small locks.
Date: Thu, 25 Nov 2021 22:55:05 +0800
Message-ID: <202111252239.o3Nemms9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7594440879536477681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211124021431.48956-13-kuniyu@amazon.co.jp>
References: <20211124021431.48956-13-kuniyu@amazon.co.jp>
TO: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev(a)vger.kernel.org
TO: Jakub Kicinski <kuba@kernel.org>
CC: Al Viro <viro@zeniv.linux.org.uk>
CC: Eric Dumazet <eric.dumazet@gmail.com>
CC: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
CC: Benjamin Herrenschmidt <benh@amazon.com>

Hi Kuniyuki,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Kuniyuki-Iwashima/af_unix-=
Replace-unix_table_lock-with-per-hash-locks/20211124-102129
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
2106efda785b55a8957efed9a52dfa28ee0d7280
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001-20211125 (https://download.01.org/0day-ci/arch=
ive/20211125/202111252239.o3Nemms9-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> net/unix/af_unix.c:3258:2-11: second lock on line 3258

vim +3258 net/unix/af_unix.c

7123aaa3a141652 Eric Dumazet      2012-06-08  3242  =

7123aaa3a141652 Eric Dumazet      2012-06-08  3243  static struct sock *uni=
x_next_socket(struct seq_file *seq,
7123aaa3a141652 Eric Dumazet      2012-06-08  3244  				     struct sock *s=
k,
7123aaa3a141652 Eric Dumazet      2012-06-08  3245  				     loff_t *pos)
7123aaa3a141652 Eric Dumazet      2012-06-08  3246  {
657190b06338092 Kuniyuki Iwashima 2021-11-24  3247  	unsigned long bucket =
=3D get_bucket(*pos);
7123aaa3a141652 Eric Dumazet      2012-06-08  3248  =

7123aaa3a141652 Eric Dumazet      2012-06-08  3249  	while (sk > (struct so=
ck *)SEQ_START_TOKEN) {
7123aaa3a141652 Eric Dumazet      2012-06-08  3250  		sk =3D sk_next(sk);
7123aaa3a141652 Eric Dumazet      2012-06-08  3251  		if (!sk)
7123aaa3a141652 Eric Dumazet      2012-06-08  3252  			goto next_bucket;
7123aaa3a141652 Eric Dumazet      2012-06-08  3253  		if (sock_net(sk) =3D=
=3D seq_file_net(seq))
7123aaa3a141652 Eric Dumazet      2012-06-08  3254  			return sk;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3255  	}
7123aaa3a141652 Eric Dumazet      2012-06-08  3256  =

7123aaa3a141652 Eric Dumazet      2012-06-08  3257  	do {
657190b06338092 Kuniyuki Iwashima 2021-11-24 @3258  		spin_lock(&unix_table=
_locks[bucket]);
7123aaa3a141652 Eric Dumazet      2012-06-08  3259  		sk =3D unix_from_buck=
et(seq, pos);
7123aaa3a141652 Eric Dumazet      2012-06-08  3260  		if (sk)
7123aaa3a141652 Eric Dumazet      2012-06-08  3261  			return sk;
7123aaa3a141652 Eric Dumazet      2012-06-08  3262  =

7123aaa3a141652 Eric Dumazet      2012-06-08  3263  next_bucket:
657190b06338092 Kuniyuki Iwashima 2021-11-24  3264  		spin_unlock(&unix_tab=
le_locks[bucket++]);
7123aaa3a141652 Eric Dumazet      2012-06-08  3265  		*pos =3D set_bucket_o=
ffset(bucket, 1);
7123aaa3a141652 Eric Dumazet      2012-06-08  3266  	} while (bucket < ARRA=
Y_SIZE(unix_socket_table));
7123aaa3a141652 Eric Dumazet      2012-06-08  3267  =

^1da177e4c3f415 Linus Torvalds    2005-04-16  3268  	return NULL;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3269  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  3270  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7594440879536477681==--

