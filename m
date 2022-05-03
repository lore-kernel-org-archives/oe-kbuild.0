Content-Type: multipart/mixed; boundary="===============4014590537978882548=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/pensando/ionic/ionic_txrx.c:149 ionic_rx_frags() warn: variable dereferenced before check 'buf_info->page' (see line 137)
Date: Tue, 03 May 2022 20:41:00 +0800
Message-ID: <202205032018.aKbDyphO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4014590537978882548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Shannon Nelson <snelson@pensando.io>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9050ba3a61a4b5bd84c2cde092a100404f814f31
commit: e75ccac1d0644c9d7ad531cb9a81c499930c06da ionic: use fewer inits on =
the buf_info struct
date:   9 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-m001-20220502 (https://download.01.org/0day-ci/ar=
chive/20220503/202205032018.aKbDyphO-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/pensando/ionic/ionic_txrx.c:149 ionic_rx_frags() warn:=
 variable dereferenced before check 'buf_info->page' (see line 137)

vim +149 drivers/net/ethernet/pensando/ionic/ionic_txrx.c

2b5720f2690857 Shannon Nelson 2021-03-10  118  =

08f2e4b2b2008c Shannon Nelson 2019-10-23  119  static struct sk_buff *ionic=
_rx_frags(struct ionic_queue *q,
08f2e4b2b2008c Shannon Nelson 2019-10-23  120  				      struct ionic_desc_=
info *desc_info,
a25edab93b2877 Shannon Nelson 2021-03-10  121  				      struct ionic_rxq_c=
omp *comp)
0f3154e6bcb354 Shannon Nelson 2019-09-03  122  {
89e572e7369fd9 Shannon Nelson 2021-03-10  123  	struct net_device *netdev =
=3D q->lif->netdev;
4b0a7539a3728f Shannon Nelson 2021-03-10  124  	struct ionic_buf_info *buf_=
info;
89e572e7369fd9 Shannon Nelson 2021-03-10  125  	struct ionic_rx_stats *stat=
s;
f37bc3462e80d2 Shannon Nelson 2021-03-10  126  	struct device *dev =3D q->d=
ev;
08f2e4b2b2008c Shannon Nelson 2019-10-23  127  	struct sk_buff *skb;
08f2e4b2b2008c Shannon Nelson 2019-10-23  128  	unsigned int i;
08f2e4b2b2008c Shannon Nelson 2019-10-23  129  	u16 frag_len;
08f2e4b2b2008c Shannon Nelson 2019-10-23  130  	u16 len;
08f2e4b2b2008c Shannon Nelson 2019-10-23  131  =

89e572e7369fd9 Shannon Nelson 2021-03-10  132  	stats =3D q_to_rx_stats(q);
89e572e7369fd9 Shannon Nelson 2021-03-10  133  =

4b0a7539a3728f Shannon Nelson 2021-03-10  134  	buf_info =3D &desc_info->bu=
fs[0];
08f2e4b2b2008c Shannon Nelson 2019-10-23  135  	len =3D le16_to_cpu(comp->l=
en);
08f2e4b2b2008c Shannon Nelson 2019-10-23  136  =

e75ccac1d0644c Shannon Nelson 2021-07-27 @137  	prefetchw(buf_info->page);
08f2e4b2b2008c Shannon Nelson 2019-10-23  138  =

89e572e7369fd9 Shannon Nelson 2021-03-10  139  	skb =3D napi_get_frags(&q_t=
o_qcq(q)->napi);
89e572e7369fd9 Shannon Nelson 2021-03-10  140  	if (unlikely(!skb)) {
89e572e7369fd9 Shannon Nelson 2021-03-10  141  		net_warn_ratelimited("%s: =
SKB alloc failed on %s!\n",
89e572e7369fd9 Shannon Nelson 2021-03-10  142  				     netdev->name, q->na=
me);
89e572e7369fd9 Shannon Nelson 2021-03-10  143  		stats->alloc_err++;
08f2e4b2b2008c Shannon Nelson 2019-10-23  144  		return NULL;
89e572e7369fd9 Shannon Nelson 2021-03-10  145  	}
08f2e4b2b2008c Shannon Nelson 2019-10-23  146  =

08f2e4b2b2008c Shannon Nelson 2019-10-23  147  	i =3D comp->num_sg_elems + =
1;
08f2e4b2b2008c Shannon Nelson 2019-10-23  148  	do {
4b0a7539a3728f Shannon Nelson 2021-03-10 @149  		if (unlikely(!buf_info->pa=
ge)) {
08f2e4b2b2008c Shannon Nelson 2019-10-23  150  			dev_kfree_skb(skb);
08f2e4b2b2008c Shannon Nelson 2019-10-23  151  			return NULL;
0f3154e6bcb354 Shannon Nelson 2019-09-03  152  		}
0f3154e6bcb354 Shannon Nelson 2019-09-03  153  =

4b0a7539a3728f Shannon Nelson 2021-03-10  154  		frag_len =3D min_t(u16, le=
n, IONIC_PAGE_SIZE - buf_info->page_offset);
08f2e4b2b2008c Shannon Nelson 2019-10-23  155  		len -=3D frag_len;
08f2e4b2b2008c Shannon Nelson 2019-10-23  156  =

4b0a7539a3728f Shannon Nelson 2021-03-10  157  		dma_sync_single_for_cpu(de=
v,
4b0a7539a3728f Shannon Nelson 2021-03-10  158  					buf_info->dma_addr + bu=
f_info->page_offset,
4b0a7539a3728f Shannon Nelson 2021-03-10  159  					frag_len, DMA_FROM_DEVI=
CE);
4b0a7539a3728f Shannon Nelson 2021-03-10  160  =

08f2e4b2b2008c Shannon Nelson 2019-10-23  161  		skb_add_rx_frag(skb, skb_s=
hinfo(skb)->nr_frags,
4b0a7539a3728f Shannon Nelson 2021-03-10  162  				buf_info->page, buf_info=
->page_offset, frag_len,
4b0a7539a3728f Shannon Nelson 2021-03-10  163  				IONIC_PAGE_SIZE);
4b0a7539a3728f Shannon Nelson 2021-03-10  164  =

4b0a7539a3728f Shannon Nelson 2021-03-10  165  		if (!ionic_rx_buf_recycle(=
q, buf_info, frag_len)) {
4b0a7539a3728f Shannon Nelson 2021-03-10  166  			dma_unmap_page(dev, buf_i=
nfo->dma_addr,
4b0a7539a3728f Shannon Nelson 2021-03-10  167  				       IONIC_PAGE_SIZE, =
DMA_FROM_DEVICE);
e75ccac1d0644c Shannon Nelson 2021-07-27  168  			buf_info->page =3D NULL;
4b0a7539a3728f Shannon Nelson 2021-03-10  169  		}
4b0a7539a3728f Shannon Nelson 2021-03-10  170  =

4b0a7539a3728f Shannon Nelson 2021-03-10  171  		buf_info++;
4b0a7539a3728f Shannon Nelson 2021-03-10  172  =

08f2e4b2b2008c Shannon Nelson 2019-10-23  173  		i--;
08f2e4b2b2008c Shannon Nelson 2019-10-23  174  	} while (i > 0);
08f2e4b2b2008c Shannon Nelson 2019-10-23  175  =

08f2e4b2b2008c Shannon Nelson 2019-10-23  176  	return skb;
0f3154e6bcb354 Shannon Nelson 2019-09-03  177  }
0f3154e6bcb354 Shannon Nelson 2019-09-03  178  =


:::::: The code at line 149 was first introduced by commit
:::::: 4b0a7539a3728f0fd7a11087d64371e8c28b4723 ionic: implement Rx page re=
use

:::::: TO: Shannon Nelson <snelson@pensando.io>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4014590537978882548==--

