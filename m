Content-Type: multipart/mixed; boundary="===============0549391702849462293=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [bpf-next:master 16/27] net/xdp/xsk_buff_pool.c:267:2: warning: Either the condition '!dma_map' is redundant or there is possible null pointer dereference: dma_map.
Date: Wed, 02 Sep 2020 02:35:55 +0800
Message-ID: <202009020252.d9P8D9GV%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0549391702849462293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Magnus Karlsson <magnus.karlsson@intel.com>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
head:   ebc4ecd48ca6552b223047839f66e9a9c09aea4c
commit: 921b68692abb4fd02237b6875b2056bc59435116 [16/27] xsk: Enable sharin=
g of dma mappings
:::::: branch date: 5 hours ago
:::::: commit date: 23 hours ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> net/xdp/xsk_buff_pool.c:267:2: warning: Either the condition '!dma_map' =
is redundant or there is possible null pointer dereference: dma_map. [nullP=
ointerRedundantCheck]
    dma_map->dma_pages =3D kvcalloc(nr_pages, sizeof(*dma_map->dma_pages), =
GFP_KERNEL);
    ^
   net/xdp/xsk_buff_pool.c:268:6: note: Assuming that condition '!dma_map' =
is not redundant
    if (!dma_map) {
        ^
   net/xdp/xsk_buff_pool.c:267:2: note: Null pointer dereference
    dma_map->dma_pages =3D kvcalloc(nr_pages, sizeof(*dma_map->dma_pages), =
GFP_KERNEL);
    ^

# https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?=
id=3D921b68692abb4fd02237b6875b2056bc59435116
git remote add bpf-next https://git.kernel.org/pub/scm/linux/kernel/git/bpf=
/bpf-next.git
git fetch --no-tags bpf-next master
git checkout 921b68692abb4fd02237b6875b2056bc59435116
vim +267 net/xdp/xsk_buff_pool.c

921b68692abb4fd Magnus Karlsson 2020-08-28  257  =

921b68692abb4fd Magnus Karlsson 2020-08-28  258  static struct xsk_dma_map =
*xp_create_dma_map(struct device *dev, struct net_device *netdev,
921b68692abb4fd Magnus Karlsson 2020-08-28  259  					     u32 nr_pages, st=
ruct xdp_umem *umem)
921b68692abb4fd Magnus Karlsson 2020-08-28  260  {
921b68692abb4fd Magnus Karlsson 2020-08-28  261  	struct xsk_dma_map *dma_m=
ap;
921b68692abb4fd Magnus Karlsson 2020-08-28  262  =

921b68692abb4fd Magnus Karlsson 2020-08-28  263  	dma_map =3D kzalloc(sizeo=
f(*dma_map), GFP_KERNEL);
921b68692abb4fd Magnus Karlsson 2020-08-28  264  	if (!dma_map)
921b68692abb4fd Magnus Karlsson 2020-08-28  265  		return NULL;
921b68692abb4fd Magnus Karlsson 2020-08-28  266  =

921b68692abb4fd Magnus Karlsson 2020-08-28 @267  	dma_map->dma_pages =3D kv=
calloc(nr_pages, sizeof(*dma_map->dma_pages), GFP_KERNEL);
921b68692abb4fd Magnus Karlsson 2020-08-28  268  	if (!dma_map) {
921b68692abb4fd Magnus Karlsson 2020-08-28  269  		kfree(dma_map);
921b68692abb4fd Magnus Karlsson 2020-08-28  270  		return NULL;
921b68692abb4fd Magnus Karlsson 2020-08-28  271  	}
921b68692abb4fd Magnus Karlsson 2020-08-28  272  =

921b68692abb4fd Magnus Karlsson 2020-08-28  273  	dma_map->netdev =3D netde=
v;
921b68692abb4fd Magnus Karlsson 2020-08-28  274  	dma_map->dev =3D dev;
921b68692abb4fd Magnus Karlsson 2020-08-28  275  	dma_map->dma_need_sync =
=3D false;
921b68692abb4fd Magnus Karlsson 2020-08-28  276  	dma_map->dma_pages_cnt =
=3D nr_pages;
921b68692abb4fd Magnus Karlsson 2020-08-28  277  	refcount_set(&dma_map->us=
ers, 0);
921b68692abb4fd Magnus Karlsson 2020-08-28  278  	list_add(&dma_map->list, =
&umem->xsk_dma_list);
921b68692abb4fd Magnus Karlsson 2020-08-28  279  	return dma_map;
921b68692abb4fd Magnus Karlsson 2020-08-28  280  }
921b68692abb4fd Magnus Karlsson 2020-08-28  281  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0549391702849462293==--

