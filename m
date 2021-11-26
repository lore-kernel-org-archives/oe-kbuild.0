Content-Type: multipart/mixed; boundary="===============7789815017059879983=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/xdp/xskmap.c:176 xsk_map_update_elem() warn: passing a valid pointer to 'PTR_ERR'
Date: Fri, 26 Nov 2021 22:06:46 +0800
Message-ID: <202111262153.8OyYbLF7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7789815017059879983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Zhu Yanjun <zyjzyj2000@gmail.com>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a4849f6000e29235a2707f22e39da6b897bb9543
commit: bb1b25cab04324d0749f7ae22653aff58157bf83 xdp: Remove the functions =
xsk_map_inc and xsk_map_put
date:   12 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 months ago
config: mips-randconfig-m031-20211123 (https://download.01.org/0day-ci/arch=
ive/20211126/202111262153.8OyYbLF7-lkp(a)intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/xdp/xskmap.c:176 xsk_map_update_elem() warn: passing a valid pointer to=
 'PTR_ERR'

vim +/PTR_ERR +176 net/xdp/xskmap.c

fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  145  =

fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  146  s=
tatic int xsk_map_update_elem(struct bpf_map *map, void *key, void *value,
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  147  	=
		       u64 map_flags)
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  148  {
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  149  	=
struct xsk_map *m =3D container_of(map, struct xsk_map, map);
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  150  	=
struct xdp_sock *xs, *old_xs, **map_entry;
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  151  	=
u32 i =3D *(u32 *)key, fd =3D *(u32 *)value;
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  152  	=
struct xsk_map_node *node;
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  153  	=
struct socket *sock;
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  154  	=
int err;
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  155  =

fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  156  	=
if (unlikely(map_flags > BPF_EXIST))
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  157  	=
	return -EINVAL;
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  158  	=
if (unlikely(i >=3D m->map.max_entries))
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  159  	=
	return -E2BIG;
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  160  =

fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  161  	=
sock =3D sockfd_lookup(fd, &err);
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  162  	=
if (!sock)
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  163  	=
	return err;
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  164  =

fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  165  	=
if (sock->sk->sk_family !=3D PF_XDP) {
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  166  	=
	sockfd_put(sock);
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  167  	=
	return -EOPNOTSUPP;
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  168  	}
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  169  =

fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  170  	=
xs =3D (struct xdp_sock *)sock->sk;
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  171  =

0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  172  	=
map_entry =3D &m->xsk_map[i];
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  173  	=
node =3D xsk_map_node_alloc(m, map_entry);
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  174  	=
if (IS_ERR(node)) {
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  175  	=
	sockfd_put(sock);
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15 @176  	=
	return PTR_ERR(node);
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  177  	}
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  178  =

0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  179  	=
spin_lock_bh(&m->lock);
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  180  	=
old_xs =3D READ_ONCE(*map_entry);
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  181  	=
if (old_xs =3D=3D xs) {
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  182  	=
	err =3D 0;
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  183  	=
	goto out;
36cc34358caf63 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  184  	=
} else if (old_xs && map_flags =3D=3D BPF_NOEXIST) {
36cc34358caf63 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  185  	=
	err =3D -EEXIST;
36cc34358caf63 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  186  	=
	goto out;
36cc34358caf63 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  187  	=
} else if (!old_xs && map_flags =3D=3D BPF_EXIST) {
36cc34358caf63 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  188  	=
	err =3D -ENOENT;
36cc34358caf63 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  189  	=
	goto out;
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  190  	}
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  191  	=
xsk_map_sock_add(xs, node);
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  192  	=
WRITE_ONCE(*map_entry, xs);
cee271678d0e31 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-10-08  193  	=
if (old_xs)
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  194  	=
	xsk_map_sock_delete(old_xs, map_entry);
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  195  	=
spin_unlock_bh(&m->lock);
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  196  	=
sockfd_put(sock);
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  197  	=
return 0;
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  198  =

0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  199  o=
ut:
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  200  	=
spin_unlock_bh(&m->lock);
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  201  	=
sockfd_put(sock);
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  202  	=
xsk_map_node_free(node);
0402acd683c678 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2019-08-15  203  	=
return err;
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  204  }
fbfc504a24f53f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel 2018-05-02  205  =


:::::: The code at line 176 was first introduced by commit
:::::: 0402acd683c678874df6bdbc23530ca07ea19353 xsk: remove AF_XDP socket f=
rom map when the socket is released

:::::: TO: Bj=C3=B6rn T=C3=B6pel <bjorn.topel@intel.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7789815017059879983==--

