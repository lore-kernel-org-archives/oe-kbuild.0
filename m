Content-Type: multipart/mixed; boundary="===============8225183130854740792=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/marvell/mvneta.c:2376 mvneta_swbm_build_skb() error: uninitialized symbol 'num_frags'.
Date: Sun, 10 Apr 2022 08:10:37 +0800
Message-ID: <202204100802.Ki6yYQXB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8225183130854740792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e1f700ebd6bea293abe3c7e2807b252018efde01
commit: 76a676947b56710097b755d37fd7d5cea09d6e7d net: mvneta: update frags =
bit before passing the xdp buffer to eBPF layer
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: microblaze-randconfig-m031-20220409 (https://download.01.org/0day-c=
i/archive/20220410/202204100802.Ki6yYQXB-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/marvell/mvneta.c:2376 mvneta_swbm_build_skb() error: u=
ninitialized symbol 'num_frags'.

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:91 current_thread_info() error: u=
ninitialized symbol 'sp'.
include/linux/skbuff.h:2971 __netdev_alloc_skb_ip_align() warn: should this=
 be a bitwise op?

vim +/num_frags +2376 drivers/net/ethernet/marvell/mvneta.c

8dc9a0888f4c8e2 Lorenzo Bianconi 2019-10-19  2350  =

ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2351  static struct sk_buff *
e4017570daee8ce Matteo Croce     2021-06-07  2352  mvneta_swbm_build_skb(st=
ruct mvneta_port *pp, struct page_pool *pool,
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2353  		      struct xdp_buff =
*xdp, u32 desc_status)
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2354  {
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2355  	struct skb_shared_info =
*sinfo =3D xdp_get_shared_info_from_buff(xdp);
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2356  	struct sk_buff *skb;
76a676947b56710 Lorenzo Bianconi 2022-01-21  2357  	u8 num_frags;
76a676947b56710 Lorenzo Bianconi 2022-01-21  2358  	int i;
76a676947b56710 Lorenzo Bianconi 2022-01-21  2359  =

76a676947b56710 Lorenzo Bianconi 2022-01-21  2360  	if (unlikely(xdp_buff_h=
as_frags(xdp)))
76a676947b56710 Lorenzo Bianconi 2022-01-21  2361  		num_frags =3D sinfo->n=
r_frags;
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2362  =

ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2363  	skb =3D build_skb(xdp->=
data_hard_start, PAGE_SIZE);
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2364  	if (!skb)
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2365  		return ERR_PTR(-ENOMEM=
);
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2366  =

57f05bc2ab2443b Yunsheng Lin     2021-08-06  2367  	skb_mark_for_recycle(sk=
b);
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2368  =

ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2369  	skb_reserve(skb, xdp->d=
ata - xdp->data_hard_start);
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2370  	skb_put(skb, xdp->data_=
end - xdp->data);
aff0824dc4d6ef5 Lorenzo Bianconi 2021-06-22  2371  	skb->ip_summed =3D mvne=
ta_rx_csum(pp, desc_status);
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2372  =

76a676947b56710 Lorenzo Bianconi 2022-01-21  2373  	if (likely(!xdp_buff_ha=
s_frags(xdp)))
76a676947b56710 Lorenzo Bianconi 2022-01-21  2374  		goto out;
76a676947b56710 Lorenzo Bianconi 2022-01-21  2375  =

ca0e014609f05fa Lorenzo Bianconi 2020-07-17 @2376  	for (i =3D 0; i < num_f=
rags; i++) {
5273144116d10f6 Lorenzo Bianconi 2020-09-19  2377  		skb_frag_t *frag =3D &=
sinfo->frags[i];
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2378  =

ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2379  		skb_add_rx_frag(skb, s=
kb_shinfo(skb)->nr_frags,
5273144116d10f6 Lorenzo Bianconi 2020-09-19  2380  				skb_frag_page(frag),=
 skb_frag_off(frag),
5273144116d10f6 Lorenzo Bianconi 2020-09-19  2381  				skb_frag_size(frag),=
 PAGE_SIZE);
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2382  	}
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2383  =

76a676947b56710 Lorenzo Bianconi 2022-01-21  2384  out:
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2385  	return skb;
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2386  }
ca0e014609f05fa Lorenzo Bianconi 2020-07-17  2387  =


:::::: The code at line 2376 was first introduced by commit
:::::: ca0e014609f05fab577dd251bb5400e815c9f3cf net: mvneta: move skb build=
 after descriptors processing

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8225183130854740792==--

