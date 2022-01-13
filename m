Content-Type: multipart/mixed; boundary="===============6182941094746550660=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 bpf-next 2/5] bpf: af_unix: Use batching algorithm in bpf unix iter.
Date: Fri, 14 Jan 2022 01:20:39 +0800
Message-ID: <202201140137.dztxZIjJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6182941094746550660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220113002849.4384-3-kuniyu@amazon.co.jp>
References: <20220113002849.4384-3-kuniyu@amazon.co.jp>
TO: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev(a)vger.kernel.org
TO: Jakub Kicinski <kuba@kernel.org>
TO: Alexei Starovoitov <ast@kernel.org>
TO: Daniel Borkmann <daniel@iogearbox.net>
TO: Andrii Nakryiko <andrii@kernel.org>
CC: Martin KaFai Lau <kafai@fb.com>
CC: Benjamin Herrenschmidt <benh@amazon.com>
CC: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
CC: bpf(a)vger.kernel.org

Hi Kuniyuki,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Kuniyuki-Iwashima/bpf-Batc=
hing-iter-for-AF_UNIX-sockets/20220113-083151
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm-randconfig-m031-20220113 (https://download.01.org/0day-ci/archi=
ve/20220114/202201140137.dztxZIjJ-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/unix/af_unix.c:3464 bpf_iter_unix_batch() warn: sleeping in atomic cont=
ext

Old smatch warnings:
net/unix/af_unix.c:1586 unix_stream_connect() warn: variable dereferenced b=
efore check 'other' (see line 1469)
net/unix/af_unix.c:2652 manage_oob() warn: returning freed memory 'skb'

vim +3464 net/unix/af_unix.c

a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3436  =

a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3437  static struct sock *bpf_=
iter_unix_batch(struct seq_file *seq,
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3438  					loff_t *pos)
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3439  {
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3440  	struct bpf_unix_iter_st=
ate *iter =3D seq->private;
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3441  	unsigned int expected;
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3442  	bool resized =3D false;
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3443  	struct sock *sk;
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3444  =

a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3445  	if (iter->st_bucket_don=
e)
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3446  		*pos =3D set_bucket_of=
fset(get_bucket(*pos) + 1, 1);
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3447  =

a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3448  again:
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3449  	/* Get a new batch */
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3450  	iter->cur_sk =3D 0;
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3451  	iter->end_sk =3D 0;
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3452  =

a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3453  	sk =3D unix_get_first(s=
eq, pos);
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3454  	if (!sk)
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3455  		return NULL; /* Done */
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3456  =

a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3457  	expected =3D bpf_iter_u=
nix_hold_batch(seq, sk);
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3458  =

a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3459  	if (iter->end_sk =3D=3D=
 expected) {
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3460  		iter->st_bucket_done =
=3D true;
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3461  		return sk;
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3462  	}
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3463  =

a8f4be17743b80 Kuniyuki Iwashima 2022-01-13 @3464  	if (!resized && !bpf_it=
er_unix_realloc_batch(iter, expected * 3 / 2)) {
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3465  		resized =3D true;
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3466  		goto again;
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3467  	}
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3468  =

a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3469  	return sk;
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3470  }
a8f4be17743b80 Kuniyuki Iwashima 2022-01-13  3471  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6182941094746550660==--

