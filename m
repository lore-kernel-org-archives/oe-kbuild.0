Content-Type: multipart/mixed; boundary="===============8422603104031030851=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v19 bpf-next 05/23] net: xdp: add xdp_update_skb_shared_info utility routine
Date: Thu, 02 Dec 2021 02:39:32 +0800
Message-ID: <202112020224.AtozUlej-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8422603104031030851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <90a6c9dfd3877a44248daca8fe7cc33a8c0addf0.1638272238.git.loren=
zo@kernel.org>
References: <90a6c9dfd3877a44248daca8fe7cc33a8c0addf0.1638272238.git.lorenz=
o@kernel.org>
TO: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Lorenzo,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Lorenzo-Bianconi/mvneta-in=
troduce-XDP-multi-buffer-support/20211130-195834
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: i386-randconfig-m021-20211130 (https://download.01.org/0day-ci/arch=
ive/20211202/202112020224.AtozUlej-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/core/xdp.c:560 __xdp_build_skb_from_frame() error: uninitialized symbol=
 'nr_frags'.

vim +/nr_frags +560 net/core/xdp.c

65e6dcf73398dd Lorenzo Bianconi 2021-01-29  527  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  528  struct sk_buff *__xdp_buil=
d_skb_from_frame(struct xdp_frame *xdpf,
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  529  					   struct sk_buff *sk=
b,
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  530  					   struct net_device =
*dev)
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  531  {
72df9af110288c Lorenzo Bianconi 2021-11-30  532  	struct skb_shared_info *s=
info =3D xdp_get_shared_info_from_frame(xdpf);
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  533  	unsigned int headroom, fr=
ame_size;
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  534  	void *hard_start;
72df9af110288c Lorenzo Bianconi 2021-11-30  535  	u8 nr_frags;
72df9af110288c Lorenzo Bianconi 2021-11-30  536  =

72df9af110288c Lorenzo Bianconi 2021-11-30  537  	/* xdp multi-buff frame */
72df9af110288c Lorenzo Bianconi 2021-11-30  538  	if (unlikely(xdp_frame_is=
_mb(xdpf)))
72df9af110288c Lorenzo Bianconi 2021-11-30  539  		nr_frags =3D sinfo->nr_f=
rags;
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  540  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  541  	/* Part of headroom was r=
eserved to xdpf */
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  542  	headroom =3D sizeof(*xdpf=
) + xdpf->headroom;
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  543  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  544  	/* Memory size backing xd=
p_frame data already have reserved
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  545  	 * room for build_skb to =
place skb_shared_info in tailroom.
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  546  	 */
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  547  	frame_size =3D xdpf->fram=
e_sz;
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  548  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  549  	hard_start =3D xdpf->data=
 - headroom;
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  550  	skb =3D build_skb_around(=
skb, hard_start, frame_size);
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  551  	if (unlikely(!skb))
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  552  		return NULL;
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  553  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  554  	skb_reserve(skb, headroom=
);
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  555  	__skb_put(skb, xdpf->len);
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  556  	if (xdpf->metasize)
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  557  		skb_metadata_set(skb, xd=
pf->metasize);
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  558  =

72df9af110288c Lorenzo Bianconi 2021-11-30  559  	if (unlikely(xdp_frame_is=
_mb(xdpf)))
72df9af110288c Lorenzo Bianconi 2021-11-30 @560  		xdp_update_skb_shared_in=
fo(skb, nr_frags,
72df9af110288c Lorenzo Bianconi 2021-11-30  561  					   sinfo->xdp_frags_s=
ize,
72df9af110288c Lorenzo Bianconi 2021-11-30  562  					   nr_frags * xdpf->f=
rame_sz,
72df9af110288c Lorenzo Bianconi 2021-11-30  563  					   xdp_frame_is_frag_=
pfmemalloc(xdpf));
72df9af110288c Lorenzo Bianconi 2021-11-30  564  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  565  	/* Essential SKB info: pr=
otocol and skb->dev */
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  566  	skb->protocol =3D eth_typ=
e_trans(skb, dev);
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  567  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  568  	/* Optional SKB info, cur=
rently missing:
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  569  	 * - HW checksum info		(s=
kb->ip_summed)
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  570  	 * - HW RX hash			(skb_se=
t_hash)
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  571  	 * - RX ring dev queue in=
dex	(skb_record_rx_queue)
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  572  	 */
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  573  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  574  	/* Until page_pool get SK=
B return path, release DMA here */
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  575  	xdp_release_frame(xdpf);
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  576  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  577  	/* Allow SKB to reuse are=
a used by xdp_frame */
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  578  	xdp_scrub_frame(xdpf);
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  579  =

97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  580  	return skb;
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  581  }
97a0e1ea7b41c2 Lorenzo Bianconi 2021-01-12  582  EXPORT_SYMBOL_GPL(__xdp_bu=
ild_skb_from_frame);
89f479f0eccfc8 Lorenzo Bianconi 2021-01-12  583  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8422603104031030851==--

