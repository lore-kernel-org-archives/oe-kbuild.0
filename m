Content-Type: multipart/mixed; boundary="===============5912948193932492502=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2060/9759] drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c:91:12: warning: Signed integer overflow for expression '0xffff<<16'. [integerOverflow]
Date: Sat, 07 May 2022 21:21:07 +0800
Message-ID: <202205072152.LvTnVME0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5912948193932492502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andy Gospodarek <gospo@broadcom.com>
CC: Michael Chan <michael.chan@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: a7559bc8c17c3f9a91dcbeefe8642ba757fd09e8 [2060/9759] bnxt: support =
transmit and free of aggregation buffers
:::::: branch date: 29 hours ago
:::::: commit date: 4 weeks ago
compiler: ia64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a7559bc8c17c3f9a91dcbeefe8642ba757fd09e8
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c:330:24: warning: Parameter=
 'frames' can be declared with const [constParameter]
       struct xdp_frame **frames, u32 flags)
                          ^
   drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c:180:19: warning: Parameter=
 'data_ptr' can be declared with const [constParameter]
      u16 cons, u8 **data_ptr, unsigned int *len,
                     ^
>> drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c:91:12: warning: Signed int=
eger overflow for expression '0xffff<<16'. [integerOverflow]
    flags &=3D ~TX_BD_LEN;
              ^

vim +91 drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c

4f81def272de17 Pavan Chebbi    2022-04-01   24  =

c1ba92a86db24d Michael Chan    2019-07-08   25  struct bnxt_sw_tx_bd *bnxt_=
xmit_bd(struct bnxt *bp,
c1ba92a86db24d Michael Chan    2019-07-08   26  				   struct bnxt_tx_ring_=
info *txr,
a7559bc8c17c3f Andy Gospodarek 2022-04-08   27  				   dma_addr_t mapping, =
u32 len,
a7559bc8c17c3f Andy Gospodarek 2022-04-08   28  				   struct xdp_buff *xdp)
38413406277fd0 Michael Chan    2017-02-06   29  {
a7559bc8c17c3f Andy Gospodarek 2022-04-08   30  	struct skb_shared_info *si=
nfo;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   31  	struct bnxt_sw_tx_bd *tx_b=
uf, *first_buf;
38413406277fd0 Michael Chan    2017-02-06   32  	struct tx_bd *txbd;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   33  	int num_frags =3D 0;
38413406277fd0 Michael Chan    2017-02-06   34  	u32 flags;
38413406277fd0 Michael Chan    2017-02-06   35  	u16 prod;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   36  	int i;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   37  =

a7559bc8c17c3f Andy Gospodarek 2022-04-08   38  	if (xdp && xdp_buff_has_fr=
ags(xdp)) {
a7559bc8c17c3f Andy Gospodarek 2022-04-08   39  		sinfo =3D xdp_get_shared_=
info_from_buff(xdp);
a7559bc8c17c3f Andy Gospodarek 2022-04-08   40  		num_frags =3D sinfo->nr_f=
rags;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   41  	}
38413406277fd0 Michael Chan    2017-02-06   42  =

a7559bc8c17c3f Andy Gospodarek 2022-04-08   43  	/* fill up the first buffe=
r */
38413406277fd0 Michael Chan    2017-02-06   44  	prod =3D txr->tx_prod;
38413406277fd0 Michael Chan    2017-02-06   45  	tx_buf =3D &txr->tx_buf_ri=
ng[prod];
a7559bc8c17c3f Andy Gospodarek 2022-04-08   46  	first_buf =3D tx_buf;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   47  	tx_buf->nr_frags =3D num_f=
rags;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   48  	if (xdp)
a7559bc8c17c3f Andy Gospodarek 2022-04-08   49  		tx_buf->page =3D virt_to_=
head_page(xdp->data);
38413406277fd0 Michael Chan    2017-02-06   50  =

38413406277fd0 Michael Chan    2017-02-06   51  	txbd =3D &txr->tx_desc_rin=
g[TX_RING(prod)][TX_IDX(prod)];
a7559bc8c17c3f Andy Gospodarek 2022-04-08   52  	flags =3D ((len) << TX_BD_=
LEN_SHIFT) | ((num_frags + 1) << TX_BD_FLAGS_BD_CNT_SHIFT);
38413406277fd0 Michael Chan    2017-02-06   53  	txbd->tx_bd_len_flags_type=
 =3D cpu_to_le32(flags);
38413406277fd0 Michael Chan    2017-02-06   54  	txbd->tx_bd_opaque =3D pro=
d;
38413406277fd0 Michael Chan    2017-02-06   55  	txbd->tx_bd_haddr =3D cpu_=
to_le64(mapping);
38413406277fd0 Michael Chan    2017-02-06   56  =

a7559bc8c17c3f Andy Gospodarek 2022-04-08   57  	/* now let us fill up the =
frags into the next buffers */
a7559bc8c17c3f Andy Gospodarek 2022-04-08   58  	for (i =3D 0; i < num_frag=
s ; i++) {
a7559bc8c17c3f Andy Gospodarek 2022-04-08   59  		skb_frag_t *frag =3D &sin=
fo->frags[i];
a7559bc8c17c3f Andy Gospodarek 2022-04-08   60  		struct bnxt_sw_tx_bd *fra=
g_tx_buf;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   61  		struct pci_dev *pdev =3D =
bp->pdev;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   62  		dma_addr_t frag_mapping;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   63  		int frag_len;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   64  =

a7559bc8c17c3f Andy Gospodarek 2022-04-08   65  		prod =3D NEXT_TX(prod);
a7559bc8c17c3f Andy Gospodarek 2022-04-08   66  		txr->tx_prod =3D prod;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   67  =

a7559bc8c17c3f Andy Gospodarek 2022-04-08   68  		/* first fill up the firs=
t buffer */
a7559bc8c17c3f Andy Gospodarek 2022-04-08   69  		frag_tx_buf =3D &txr->tx_=
buf_ring[prod];
a7559bc8c17c3f Andy Gospodarek 2022-04-08   70  		frag_tx_buf->page =3D skb=
_frag_page(frag);
a7559bc8c17c3f Andy Gospodarek 2022-04-08   71  =

a7559bc8c17c3f Andy Gospodarek 2022-04-08   72  		txbd =3D &txr->tx_desc_ri=
ng[TX_RING(prod)][TX_IDX(prod)];
a7559bc8c17c3f Andy Gospodarek 2022-04-08   73  =

a7559bc8c17c3f Andy Gospodarek 2022-04-08   74  		frag_len =3D skb_frag_siz=
e(frag);
a7559bc8c17c3f Andy Gospodarek 2022-04-08   75  		frag_mapping =3D skb_frag=
_dma_map(&pdev->dev, frag, 0,
a7559bc8c17c3f Andy Gospodarek 2022-04-08   76  						frag_len, DMA_TO_DEVI=
CE);
a7559bc8c17c3f Andy Gospodarek 2022-04-08   77  =

a7559bc8c17c3f Andy Gospodarek 2022-04-08   78  		if (unlikely(dma_mapping_=
error(&pdev->dev, frag_mapping)))
a7559bc8c17c3f Andy Gospodarek 2022-04-08   79  			return NULL;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   80  =

a7559bc8c17c3f Andy Gospodarek 2022-04-08   81  		dma_unmap_addr_set(frag_t=
x_buf, mapping, frag_mapping);
a7559bc8c17c3f Andy Gospodarek 2022-04-08   82  =

a7559bc8c17c3f Andy Gospodarek 2022-04-08   83  		flags =3D frag_len << TX_=
BD_LEN_SHIFT;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   84  		txbd->tx_bd_len_flags_typ=
e =3D cpu_to_le32(flags);
a7559bc8c17c3f Andy Gospodarek 2022-04-08   85  		txbd->tx_bd_opaque =3D pr=
od;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   86  		txbd->tx_bd_haddr =3D cpu=
_to_le64(frag_mapping);
a7559bc8c17c3f Andy Gospodarek 2022-04-08   87  =

a7559bc8c17c3f Andy Gospodarek 2022-04-08   88  		len =3D frag_len;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   89  	}
a7559bc8c17c3f Andy Gospodarek 2022-04-08   90  =

a7559bc8c17c3f Andy Gospodarek 2022-04-08  @91  	flags &=3D ~TX_BD_LEN;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   92  	txbd->tx_bd_len_flags_type=
 =3D cpu_to_le32(((len) << TX_BD_LEN_SHIFT) | flags |
a7559bc8c17c3f Andy Gospodarek 2022-04-08   93  			TX_BD_FLAGS_PACKET_END);
a7559bc8c17c3f Andy Gospodarek 2022-04-08   94  	/* Sync TX BD */
a7559bc8c17c3f Andy Gospodarek 2022-04-08   95  	wmb();
38413406277fd0 Michael Chan    2017-02-06   96  	prod =3D NEXT_TX(prod);
38413406277fd0 Michael Chan    2017-02-06   97  	txr->tx_prod =3D prod;
a7559bc8c17c3f Andy Gospodarek 2022-04-08   98  =

a7559bc8c17c3f Andy Gospodarek 2022-04-08   99  	return first_buf;
c1ba92a86db24d Michael Chan    2019-07-08  100  }
c1ba92a86db24d Michael Chan    2019-07-08  101  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5912948193932492502==--

