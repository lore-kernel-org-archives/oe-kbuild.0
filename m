Content-Type: multipart/mixed; boundary="===============0636617273614940909=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:xdp_hints 5/52] net/bpf/core.c:648 __xdp_build_skb_from_frame() error: uninitialized symbol 'nr_frags'.
Date: Sun, 03 Jul 2022 07:10:19 +0800
Message-ID: <202207030728.VX55VQmL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0636617273614940909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>

tree:   https://github.com/alobakin/linux xdp_hints
head:   e9f4215398901c2e3f477da53abc668ce7b7e320
commit: 40ce0c8bf2731c92fb015a03a7f9b26d90d547d0 [5/52] net, xdp: decouple =
XDP code from the core networking code
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20703/202207030728.VX55VQmL-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/bpf/core.c:648 __xdp_build_skb_from_frame() error: uninitialized symbol=
 'nr_frags'.

vim +/nr_frags +648 net/bpf/core.c

65e6dcf73398dd net/core/xdp.c Lorenzo Bianconi 2021-01-29  615  =

97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  616  struct sk_b=
uff *__xdp_build_skb_from_frame(struct xdp_frame *xdpf,
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  617  					   str=
uct sk_buff *skb,
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  618  					   str=
uct net_device *dev)
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  619  {
d65a1906b31246 net/core/xdp.c Lorenzo Bianconi 2022-01-21  620  	struct skb=
_shared_info *sinfo =3D xdp_get_shared_info_from_frame(xdpf);
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  621  	unsigned i=
nt headroom, frame_size;
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  622  	void *hard=
_start;
d65a1906b31246 net/core/xdp.c Lorenzo Bianconi 2022-01-21  623  	u8 nr_frag=
s;
d65a1906b31246 net/core/xdp.c Lorenzo Bianconi 2022-01-21  624  =

d65a1906b31246 net/core/xdp.c Lorenzo Bianconi 2022-01-21  625  	/* xdp fra=
gs frame */
d65a1906b31246 net/core/xdp.c Lorenzo Bianconi 2022-01-21  626  	if (unlike=
ly(xdp_frame_has_frags(xdpf)))
d65a1906b31246 net/core/xdp.c Lorenzo Bianconi 2022-01-21  627  		nr_frags =
=3D sinfo->nr_frags;
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  628  =

97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  629  	/* Part of=
 headroom was reserved to xdpf */
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  630  	headroom =
=3D sizeof(*xdpf) + xdpf->headroom;
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  631  =

97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  632  	/* Memory =
size backing xdp_frame data already have reserved
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  633  	 * room fo=
r build_skb to place skb_shared_info in tailroom.
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  634  	 */
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  635  	frame_size=
 =3D xdpf->frame_sz;
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  636  =

97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  637  	hard_start=
 =3D xdpf->data - headroom;
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  638  	skb =3D bu=
ild_skb_around(skb, hard_start, frame_size);
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  639  	if (unlike=
ly(!skb))
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  640  		return NU=
LL;
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  641  =

97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  642  	skb_reserv=
e(skb, headroom);
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  643  	__skb_put(=
skb, xdpf->len);
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  644  	if (xdpf->=
metasize)
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  645  		skb_metad=
ata_set(skb, xdpf->metasize);
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  646  =

d65a1906b31246 net/core/xdp.c Lorenzo Bianconi 2022-01-21  647  	if (unlike=
ly(xdp_frame_has_frags(xdpf)))
d65a1906b31246 net/core/xdp.c Lorenzo Bianconi 2022-01-21 @648  		xdp_updat=
e_skb_shared_info(skb, nr_frags,
d65a1906b31246 net/core/xdp.c Lorenzo Bianconi 2022-01-21  649  					   sin=
fo->xdp_frags_size,
d65a1906b31246 net/core/xdp.c Lorenzo Bianconi 2022-01-21  650  					   nr_=
frags * xdpf->frame_sz,
d65a1906b31246 net/core/xdp.c Lorenzo Bianconi 2022-01-21  651  					   xdp=
_frame_is_frag_pfmemalloc(xdpf));
d65a1906b31246 net/core/xdp.c Lorenzo Bianconi 2022-01-21  652  =

97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  653  	/* Essenti=
al SKB info: protocol and skb->dev */
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  654  	skb->proto=
col =3D eth_type_trans(skb, dev);
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  655  =

97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  656  	/* Optiona=
l SKB info, currently missing:
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  657  	 * - HW ch=
ecksum info		(skb->ip_summed)
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  658  	 * - HW RX=
 hash			(skb_set_hash)
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  659  	 * - RX ri=
ng dev queue index	(skb_record_rx_queue)
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  660  	 */
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  661  =

97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  662  	/* Until p=
age_pool get SKB return path, release DMA here */
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  663  	xdp_releas=
e_frame(xdpf);
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  664  =

97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  665  	/* Allow S=
KB to reuse area used by xdp_frame */
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  666  	xdp_scrub_=
frame(xdpf);
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  667  =

97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  668  	return skb;
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  669  }
97a0e1ea7b41c2 net/core/xdp.c Lorenzo Bianconi 2021-01-12  670  EXPORT_SYMB=
OL_GPL(__xdp_build_skb_from_frame);
89f479f0eccfc8 net/core/xdp.c Lorenzo Bianconi 2021-01-12  671  =


:::::: The code at line 648 was first introduced by commit
:::::: d65a1906b31246492449eafe9cace188cb59e26c net: xdp: add xdp_update_sk=
b_shared_info utility routine

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0636617273614940909==--

