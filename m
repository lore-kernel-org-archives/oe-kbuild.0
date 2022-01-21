Content-Type: multipart/mixed; boundary="===============7765556748744745921=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] inet: missing lock releases in udp.c
Date: Sat, 22 Jan 2022 05:13:06 +0800
Message-ID: <202201220528.juyE42K0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7765556748744745921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220121031553.5342-1-ycaibb@gmail.com>
References: <20220121031553.5342-1-ycaibb@gmail.com>
TO: ycaibb <ycaibb@gmail.com>
TO: davem(a)davemloft.net
TO: yoshfuji(a)linux-ipv6.org
TO: dsahern(a)kernel.org
TO: kuba(a)kernel.org
TO: ast(a)kernel.org
TO: daniel(a)iogearbox.net
TO: andrii(a)kernel.org
TO: kafai(a)fb.com
TO: songliubraving(a)fb.com
TO: yhs(a)fb.com

Hi ycaibb,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on net/master horms-ipvs/master linus/master v5.16=
 next-20220121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/ycaibb/inet-missing-lock-r=
eleases-in-udp-c/20220121-111922
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
8aaaf2f3af2ae212428f4db1af34214225f5cec3
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-m001-20220117 (https://download.01.org/0day-ci/ar=
chive/20220122/202201220528.juyE42K0-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ipv4/udp.c:2979 udp_get_first() warn: curly braces intended?

Old smatch warnings:
net/ipv4/udp.c:496 __udp4_lib_lookup() warn: potential spectre issue 'udpta=
ble->hash2' [r]
net/ipv4/udp.c:2288 __udp4_lib_mcast_deliver() warn: potential spectre issu=
e 'udptable->hash2' [r]
net/ipv4/udp.c:2520 __udp4_lib_mcast_demux_lookup() warn: potential spectre=
 issue 'udp_table.hash' [r]
net/ipv4/udp.c:2551 __udp4_lib_demux_lookup() warn: potential spectre issue=
 'udp_table.hash2' [r]

vim +2979 net/ipv4/udp.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  2952  =

645ca708f936b2 Eric Dumazet      2008-10-29  2953  static struct sock *udp_=
get_first(struct seq_file *seq, int start)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2954  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2955  	struct sock *sk;
9e8ca27afab6c9 Yonghong Song     2020-06-23  2956  	struct udp_seq_afinfo *=
afinfo;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2957  	struct udp_iter_state *=
state =3D seq->private;
6f191efe48af62 Denis V. Lunev    2008-03-28  2958  	struct net *net =3D seq=
_file_net(seq);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2959  =

9e8ca27afab6c9 Yonghong Song     2020-06-23  2960  	if (state->bpf_seq_afin=
fo)
9e8ca27afab6c9 Yonghong Song     2020-06-23  2961  		afinfo =3D state->bpf_=
seq_afinfo;
9e8ca27afab6c9 Yonghong Song     2020-06-23  2962  	else
9e8ca27afab6c9 Yonghong Song     2020-06-23  2963  		afinfo =3D PDE_DATA(fi=
le_inode(seq->file));
9e8ca27afab6c9 Yonghong Song     2020-06-23  2964  =

a3d2599b24462c Christoph Hellwig 2018-04-10  2965  	for (state->bucket =3D =
start; state->bucket <=3D afinfo->udp_table->mask;
f86dcc5aa8c790 Eric Dumazet      2009-10-07  2966  	     ++state->bucket) {
a3d2599b24462c Christoph Hellwig 2018-04-10  2967  		struct udp_hslot *hslo=
t =3D &afinfo->udp_table->hash[state->bucket];
f86dcc5aa8c790 Eric Dumazet      2009-10-07  2968  =

ca065d0cf80fa5 Eric Dumazet      2016-04-01  2969  		if (hlist_empty(&hslot=
->head))
f86dcc5aa8c790 Eric Dumazet      2009-10-07  2970  			continue;
f86dcc5aa8c790 Eric Dumazet      2009-10-07  2971  =

645ca708f936b2 Eric Dumazet      2008-10-29  2972  		spin_lock_bh(&hslot->l=
ock);
ca065d0cf80fa5 Eric Dumazet      2016-04-01  2973  		sk_for_each(sk, &hslot=
->head) {
878628fbf2589e YOSHIFUJI Hideaki 2008-03-26  2974  			if (!net_eq(sock_net(=
sk), net))
a91275eff43a52 Daniel Lezcano    2008-03-21  2975  				continue;
9e8ca27afab6c9 Yonghong Song     2020-06-23  2976  			if (afinfo->family =
=3D=3D AF_UNSPEC ||
9e8ca27afab6c9 Yonghong Song     2020-06-23  2977  			    sk->sk_family =3D=
=3D afinfo->family)
1b84613d303e14 Ryan Cai          2022-01-21  2978  				spin_unlock_bh(&hslo=
t->lock);
^1da177e4c3f41 Linus Torvalds    2005-04-16 @2979  				goto found;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2980  		}
645ca708f936b2 Eric Dumazet      2008-10-29  2981  		spin_unlock_bh(&hslot-=
>lock);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2982  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2983  	sk =3D NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2984  found:
^1da177e4c3f41 Linus Torvalds    2005-04-16  2985  	return sk;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2986  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  2987  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7765556748744745921==--

