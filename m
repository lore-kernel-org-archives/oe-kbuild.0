Content-Type: multipart/mixed; boundary="===============8433646568014287698=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 678/2855] net/unix/af_unix.c:3464 bpf_iter_unix_batch() warn: sleeping in atomic context
Date: Sat, 29 Jan 2022 14:52:42 +0800
Message-ID: <202201291408.fAi0F1UY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8433646568014287698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b605fdc54c2b28c30ef06d9db99282d8a32ae4be
commit: 855d8e77ffb05be6e54c34dababccb20318aec00 [678/2855] bpf: af_unix: U=
se batching algorithm in bpf unix iter.
:::::: branch date: 26 hours ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-m001-20220124 (https://download.01.org/0day-ci/ar=
chive/20220129/202201291408.fAi0F1UY-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/unix/af_unix.c:3464 bpf_iter_unix_batch() warn: sleeping in atomic cont=
ext

Old smatch warnings:
net/unix/af_unix.c:1586 unix_stream_connect() warn: variable dereferenced b=
efore check 'other' (see line 1469)

vim +3464 net/unix/af_unix.c

855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3436  =

855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3437  static struct sock *bpf_=
iter_unix_batch(struct seq_file *seq,
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3438  					loff_t *pos)
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3439  {
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3440  	struct bpf_unix_iter_st=
ate *iter =3D seq->private;
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3441  	unsigned int expected;
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3442  	bool resized =3D false;
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3443  	struct sock *sk;
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3444  =

855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3445  	if (iter->st_bucket_don=
e)
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3446  		*pos =3D set_bucket_of=
fset(get_bucket(*pos) + 1, 1);
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3447  =

855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3448  again:
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3449  	/* Get a new batch */
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3450  	iter->cur_sk =3D 0;
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3451  	iter->end_sk =3D 0;
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3452  =

855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3453  	sk =3D unix_get_first(s=
eq, pos);
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3454  	if (!sk)
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3455  		return NULL; /* Done */
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3456  =

855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3457  	expected =3D bpf_iter_u=
nix_hold_batch(seq, sk);
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3458  =

855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3459  	if (iter->end_sk =3D=3D=
 expected) {
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3460  		iter->st_bucket_done =
=3D true;
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3461  		return sk;
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3462  	}
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3463  =

855d8e77ffb05b Kuniyuki Iwashima 2022-01-13 @3464  	if (!resized && !bpf_it=
er_unix_realloc_batch(iter, expected * 3 / 2)) {
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3465  		resized =3D true;
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3466  		goto again;
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3467  	}
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3468  =

855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3469  	return sk;
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3470  }
855d8e77ffb05b Kuniyuki Iwashima 2022-01-13  3471  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8433646568014287698==--

