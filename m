Content-Type: multipart/mixed; boundary="===============0890058008543022496=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2051/9759] drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c:117:19: warning: Parameter 'data_ptr' can be declared with const [constParameter]
Date: Sat, 07 May 2022 18:48:13 +0800
Message-ID: <202205071804.r6UcFhcN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0890058008543022496==
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
commit: b231c3f3414cfc7bf8fb1e246ed5a3d523616520 [2051/9759] bnxt: refactor=
 bnxt_rx_xdp to separate xdp_init_buff/xdp_prepare_buff
:::::: branch date: 26 hours ago
:::::: commit date: 4 weeks ago
compiler: ia64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b231c3f3414cfc7bf8fb1e246ed5a3d523616520
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/hisilicon/hns3/hns3_common/hclge_comm_cmd.c:265:29:=
 warning: Parameter 'desc' can be declared with const [constParameter]
            struct hclge_desc *desc, int num)
                               ^
   drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c:237:24: warning: Parameter=
 'frames' can be declared with const [constParameter]
       struct xdp_frame **frames, u32 flags)
                          ^
>> drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c:117:19: warning: Parameter=
 'data_ptr' can be declared with const [constParameter]
      u16 cons, u8 **data_ptr, unsigned int *len,
                     ^

vim +/data_ptr +117 drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c

b231c3f3414cfc Andy Gospodarek 2022-04-08  115  =

b231c3f3414cfc Andy Gospodarek 2022-04-08  116  void bnxt_xdp_buff_init(str=
uct bnxt *bp, struct bnxt_rx_ring_info *rxr,
b231c3f3414cfc Andy Gospodarek 2022-04-08 @117  			u16 cons, u8 **data_ptr,=
 unsigned int *len,
b231c3f3414cfc Andy Gospodarek 2022-04-08  118  			struct xdp_buff *xdp)
b231c3f3414cfc Andy Gospodarek 2022-04-08  119  {
b231c3f3414cfc Andy Gospodarek 2022-04-08  120  	struct bnxt_sw_rx_bd *rx_b=
uf;
b231c3f3414cfc Andy Gospodarek 2022-04-08  121  	struct pci_dev *pdev;
b231c3f3414cfc Andy Gospodarek 2022-04-08  122  	dma_addr_t mapping;
b231c3f3414cfc Andy Gospodarek 2022-04-08  123  	u32 offset;
b231c3f3414cfc Andy Gospodarek 2022-04-08  124  =

b231c3f3414cfc Andy Gospodarek 2022-04-08  125  	pdev =3D bp->pdev;
b231c3f3414cfc Andy Gospodarek 2022-04-08  126  	rx_buf =3D &rxr->rx_buf_ri=
ng[cons];
b231c3f3414cfc Andy Gospodarek 2022-04-08  127  	offset =3D bp->rx_offset;
b231c3f3414cfc Andy Gospodarek 2022-04-08  128  =

b231c3f3414cfc Andy Gospodarek 2022-04-08  129  	mapping =3D rx_buf->mappin=
g - bp->rx_dma_offset;
b231c3f3414cfc Andy Gospodarek 2022-04-08  130  	dma_sync_single_for_cpu(&p=
dev->dev, mapping + offset, *len, bp->rx_dir);
b231c3f3414cfc Andy Gospodarek 2022-04-08  131  =

b231c3f3414cfc Andy Gospodarek 2022-04-08  132  	xdp_init_buff(xdp, BNXT_PA=
GE_MODE_BUF_SIZE + offset, &rxr->xdp_rxq);
b231c3f3414cfc Andy Gospodarek 2022-04-08  133  	xdp_prepare_buff(xdp, *dat=
a_ptr - offset, offset, *len, false);
b231c3f3414cfc Andy Gospodarek 2022-04-08  134  }
b231c3f3414cfc Andy Gospodarek 2022-04-08  135  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0890058008543022496==--

