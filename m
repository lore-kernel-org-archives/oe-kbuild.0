Content-Type: multipart/mixed; boundary="===============8641171422860760587=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:bpf/bpf-next/master 56/154] net/core/xdp.c:592 __xdp_build_skb_from_frame() error: uninitialized symbol 'nr_frags'.
Date: Sat, 29 Jan 2022 10:40:38 +0800
Message-ID: <202201291044.nf0hEdu4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8641171422860760587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "GNU/Weeb Mailing List" <gwml@gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block bpf/bpf-next/master
head:   b3dddab2ff10853aa3ef70483415d07fee3034ba
commit: d65a1906b31246492449eafe9cace188cb59e26c [56/154] net: xdp: add xdp=
_update_skb_shared_info utility routine
:::::: branch date: 23 hours ago
:::::: commit date: 7 days ago
config: microblaze-randconfig-m031-20220127 (https://download.01.org/0day-c=
i/archive/20220129/202201291044.nf0hEdu4-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/core/xdp.c:592 __xdp_build_skb_from_frame() error: uninitialized symbol=
 'nr_frags'.

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:91 current_thread_info() error: u=
ninitialized symbol 'sp'.

vim +/nr_frags +592 net/core/xdp.c

65e6dcf73398dd Lorenzo Bianconi 2021-01-29  559  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  560  struct sk_buff *__xdp_buil=
d_skb_from_frame(struct xdp_frame *xdpf,
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  561  					   struct sk_buff *sk=
b,
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  562  					   struct net_device =
*dev)
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  563  {
d65a1906b31246 Lorenzo Bianconi 2022-01-21  564  	struct skb_shared_info *s=
info =3D xdp_get_shared_info_from_frame(xdpf);
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  565  	unsigned int headroom, fr=
ame_size;
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  566  	void *hard_start;
d65a1906b31246 Lorenzo Bianconi 2022-01-21  567  	u8 nr_frags;
d65a1906b31246 Lorenzo Bianconi 2022-01-21  568  =

d65a1906b31246 Lorenzo Bianconi 2022-01-21  569  	/* xdp frags frame */
d65a1906b31246 Lorenzo Bianconi 2022-01-21  570  	if (unlikely(xdp_frame_ha=
s_frags(xdpf)))
d65a1906b31246 Lorenzo Bianconi 2022-01-21  571  		nr_frags =3D sinfo->nr_f=
rags;
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  572  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  573  	/* Part of headroom was r=
eserved to xdpf */
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  574  	headroom =3D sizeof(*xdpf=
) + xdpf->headroom;
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  575  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  576  	/* Memory size backing xd=
p_frame data already have reserved
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  577  	 * room for build_skb to =
place skb_shared_info in tailroom.
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  578  	 */
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  579  	frame_size =3D xdpf->fram=
e_sz;
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  580  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  581  	hard_start =3D xdpf->data=
 - headroom;
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  582  	skb =3D build_skb_around(=
skb, hard_start, frame_size);
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  583  	if (unlikely(!skb))
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  584  		return NULL;
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  585  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  586  	skb_reserve(skb, headroom=
);
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  587  	__skb_put(skb, xdpf->len);
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  588  	if (xdpf->metasize)
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  589  		skb_metadata_set(skb, xd=
pf->metasize);
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  590  =

d65a1906b31246 Lorenzo Bianconi 2022-01-21  591  	if (unlikely(xdp_frame_ha=
s_frags(xdpf)))
d65a1906b31246 Lorenzo Bianconi 2022-01-21 @592  		xdp_update_skb_shared_in=
fo(skb, nr_frags,
d65a1906b31246 Lorenzo Bianconi 2022-01-21  593  					   sinfo->xdp_frags_s=
ize,
d65a1906b31246 Lorenzo Bianconi 2022-01-21  594  					   nr_frags * xdpf->f=
rame_sz,
d65a1906b31246 Lorenzo Bianconi 2022-01-21  595  					   xdp_frame_is_frag_=
pfmemalloc(xdpf));
d65a1906b31246 Lorenzo Bianconi 2022-01-21  596  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  597  	/* Essential SKB info: pr=
otocol and skb->dev */
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  598  	skb->protocol =3D eth_typ=
e_trans(skb, dev);
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  599  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  600  	/* Optional SKB info, cur=
rently missing:
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  601  	 * - HW checksum info		(s=
kb->ip_summed)
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  602  	 * - HW RX hash			(skb_se=
t_hash)
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  603  	 * - RX ring dev queue in=
dex	(skb_record_rx_queue)
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  604  	 */
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  605  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  606  	/* Until page_pool get SK=
B return path, release DMA here */
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  607  	xdp_release_frame(xdpf);
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  608  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  609  	/* Allow SKB to reuse are=
a used by xdp_frame */
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  610  	xdp_scrub_frame(xdpf);
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  611  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  612  	return skb;
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  613  }
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  614  EXPORT_SYMBOL_GPL(__xdp_bu=
ild_skb_from_frame);
89f479f0eccfc8 Lorenzo Bianconi 2021-01-12  615  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8641171422860760587==--

