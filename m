Content-Type: multipart/mixed; boundary="===============7146027942857279109=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [intel-linux-intel-lts:5.4/yocto 40/1142] drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:972 dw_chan_prep_dma_cyclic() error: uninitialized symbol 'mem'.
Date: Tue, 02 Mar 2021 10:51:51 +0300
Message-ID: <20210302075151.GT2222@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7146027942857279109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel/linux-intel-lts.git  5.4/yocto
head:   eeb611e5394c56d45c5cc8f7dc484c9f19e93143
commit: 94e13c2880167751eb5cbbcb0e7be68ca83f0653 [40/1142] dmaengine: dw-ax=
i-dma: support cyclic mode
config: x86_64-randconfig-m001-20210301 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:972 dw_chan_prep_dma_cyclic(=
) error: uninitialized symbol 'mem'.
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:972 dw_chan_prep_dma_cyclic(=
) error: uninitialized symbol 'len'.

Old smatch warnings:
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1050 dw_chan_prep_dma_cyclic=
() error: uninitialized symbol 'len'.
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1058 dw_chan_prep_dma_cyclic=
() error: uninitialized symbol 'mem'.

vim +/mem +972 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

94e13c28801677 Sia Jee Heng    2020-06-26   913  static struct dma_async_tx=
_descriptor *
94e13c28801677 Sia Jee Heng    2020-06-26   914  dw_chan_prep_dma_cyclic(st=
ruct dma_chan *dchan, dma_addr_t buf_addr,
94e13c28801677 Sia Jee Heng    2020-06-26   915  			size_t buf_len, size_t =
period_len,
94e13c28801677 Sia Jee Heng    2020-06-26   916  			enum dma_transfer_direc=
tion direction,
94e13c28801677 Sia Jee Heng    2020-06-26   917  			unsigned long flags)
94e13c28801677 Sia Jee Heng    2020-06-26   918  {
94e13c28801677 Sia Jee Heng    2020-06-26   919  	struct axi_dma_chan *chan=
 =3D dchan_to_axi_dma_chan(dchan);
94e13c28801677 Sia Jee Heng    2020-06-26   920  	struct axi_dma_desc *firs=
t =3D NULL, *prev =3D NULL;
94e13c28801677 Sia Jee Heng    2020-06-26   921  	unsigned int reg_width;
94e13c28801677 Sia Jee Heng    2020-06-26   922  	unsigned int mem_width;
94e13c28801677 Sia Jee Heng    2020-06-26   923  	unsigned int data_width =
=3D BIT(chan->chip->dw->hdata->m_data_width);
94e13c28801677 Sia Jee Heng    2020-06-26   924  	dma_addr_t reg;
94e13c28801677 Sia Jee Heng    2020-06-26   925  	u32 reg_value =3D 0;
94e13c28801677 Sia Jee Heng    2020-06-26   926  	unsigned int i =3D 0;
94e13c28801677 Sia Jee Heng    2020-06-26   927  	u32 ctllo, ctlhi;
94e13c28801677 Sia Jee Heng    2020-06-26   928  	size_t total_len =3D 0;
94e13c28801677 Sia Jee Heng    2020-06-26   929  	size_t block_ts, max_bloc=
k_ts;
94e13c28801677 Sia Jee Heng    2020-06-26   930  	u8 lms =3D 0; // Select A=
XI0 master for LLI fetching
94e13c28801677 Sia Jee Heng    2020-06-26   931  	u32 offset;
94e13c28801677 Sia Jee Heng    2020-06-26   932  =

94e13c28801677 Sia Jee Heng    2020-06-26   933  	if (unlikely(!is_slave_di=
rection(direction)))
94e13c28801677 Sia Jee Heng    2020-06-26   934  		return NULL;
94e13c28801677 Sia Jee Heng    2020-06-26   935  =

94e13c28801677 Sia Jee Heng    2020-06-26   936  	chan->direction =3D direc=
tion;
94e13c28801677 Sia Jee Heng    2020-06-26   937  	chan->cyclic =3D 0x1;
94e13c28801677 Sia Jee Heng    2020-06-26   938  =

94e13c28801677 Sia Jee Heng    2020-06-26   939  	max_block_ts =3D chan->ch=
ip->dw->hdata->block_size[chan->id];
94e13c28801677 Sia Jee Heng    2020-06-26   940  =

94e13c28801677 Sia Jee Heng    2020-06-26   941  	axi_set_hw_channel(chan->=
chip, chan->hw_hs_num);
94e13c28801677 Sia Jee Heng    2020-06-26   942  =

94e13c28801677 Sia Jee Heng    2020-06-26   943  	switch (direction) {
94e13c28801677 Sia Jee Heng    2020-06-26   944  	case DMA_MEM_TO_DEV:
94e13c28801677 Sia Jee Heng    2020-06-26   945  		reg_width =3D __ffs(chan=
->slave_config.dst_addr_width);
94e13c28801677 Sia Jee Heng    2020-06-26   946  =

94e13c28801677 Sia Jee Heng    2020-06-26   947  		chan->reg_width =3D reg_=
width;
94e13c28801677 Sia Jee Heng    2020-06-26   948  		if (reg_width =3D=3D DWA=
XIDMAC_TRANS_WIDTH_16) {
94e13c28801677 Sia Jee Heng    2020-06-26   949  			offset =3D DMAC_APB_HAL=
FWORD_WR_CH_EN;
94e13c28801677 Sia Jee Heng    2020-06-26   950  			reg_value =3D axi_dma_a=
pb_ioread32(chan->chip, offset);
94e13c28801677 Sia Jee Heng    2020-06-26   951  			reg_value |=3D 0x1 << c=
han->id;
94e13c28801677 Sia Jee Heng    2020-06-26   952  			axi_dma_apb_iowrite32(c=
han->chip,
94e13c28801677 Sia Jee Heng    2020-06-26   953  				DMAC_APB_HALFWORD_WR_C=
H_EN, reg_value);
94e13c28801677 Sia Jee Heng    2020-06-26   954  		} else if (reg_width =3D=
=3D DWAXIDMAC_TRANS_WIDTH_8) {
94e13c28801677 Sia Jee Heng    2020-06-26   955  			offset =3D DMAC_APB_BYT=
E_WR_CH_EN;
94e13c28801677 Sia Jee Heng    2020-06-26   956  			reg_value =3D axi_dma_a=
pb_ioread32(chan->chip, offset);
94e13c28801677 Sia Jee Heng    2020-06-26   957  			reg_value |=3D 0x1 << c=
han->id;
94e13c28801677 Sia Jee Heng    2020-06-26   958  			axi_dma_apb_iowrite32(c=
han->chip, offset, reg_value);
94e13c28801677 Sia Jee Heng    2020-06-26   959  		}
94e13c28801677 Sia Jee Heng    2020-06-26   960  		reg =3D chan->slave_conf=
ig.dst_addr;
94e13c28801677 Sia Jee Heng    2020-06-26   961  =

94e13c28801677 Sia Jee Heng    2020-06-26   962  		ctllo =3D axi_dma_prepar=
e_ctllo(chan) |
94e13c28801677 Sia Jee Heng    2020-06-26   963  			reg_width << CH_CTL_L_D=
ST_WIDTH_POS |
94e13c28801677 Sia Jee Heng    2020-06-26   964  			DWAXIDMAC_CH_CTL_L_NOIN=
C << CH_CTL_L_DST_INC_POS |
94e13c28801677 Sia Jee Heng    2020-06-26   965  			DWAXIDMAC_CH_CTL_L_INC =
<< CH_CTL_L_SRC_INC_POS;
94e13c28801677 Sia Jee Heng    2020-06-26   966  =

94e13c28801677 Sia Jee Heng    2020-06-26   967  		for (i =3D 0; i < buf_le=
n / period_len; i++) {
94e13c28801677 Sia Jee Heng    2020-06-26   968  			struct axi_dma_desc *de=
sc;
94e13c28801677 Sia Jee Heng    2020-06-26   969  			size_t xfer_len;
94e13c28801677 Sia Jee Heng    2020-06-26   970  			u32 mem, len;
94e13c28801677 Sia Jee Heng    2020-06-26   971  =

94e13c28801677 Sia Jee Heng    2020-06-26  @972  			mem_width =3D __ffs(dat=
a_width | mem | len);
                                                                           =
                            ^^^^^^^^^
These aren't initialized.

94e13c28801677 Sia Jee Heng    2020-06-26   973  			if (mem_width > DWAXIDM=
AC_TRANS_WIDTH_32)
94e13c28801677 Sia Jee Heng    2020-06-26   974  				mem_width =3D DWAXIDMA=
C_TRANS_WIDTH_32;
94e13c28801677 Sia Jee Heng    2020-06-26   975  =

94e13c28801677 Sia Jee Heng    2020-06-26   976  			xfer_len =3D period_len;
94e13c28801677 Sia Jee Heng    2020-06-26   977  			block_ts =3D period_len;
94e13c28801677 Sia Jee Heng    2020-06-26   978  =

94e13c28801677 Sia Jee Heng    2020-06-26   979  			desc =3D axi_desc_get(c=
han);
94e13c28801677 Sia Jee Heng    2020-06-26   980  			if (unlikely(!desc))
94e13c28801677 Sia Jee Heng    2020-06-26   981  				goto err_desc_get;
94e13c28801677 Sia Jee Heng    2020-06-26   982  =

94e13c28801677 Sia Jee Heng    2020-06-26   983  			if (block_ts > max_bloc=
k_ts) {
94e13c28801677 Sia Jee Heng    2020-06-26   984  				block_ts =3D max_block=
_ts;
94e13c28801677 Sia Jee Heng    2020-06-26   985  				xfer_len =3D max_block=
_ts << mem_width;
94e13c28801677 Sia Jee Heng    2020-06-26   986  			}
94e13c28801677 Sia Jee Heng    2020-06-26   987  =

94e13c28801677 Sia Jee Heng    2020-06-26   988  			ctlhi =3D axi_dma_prepa=
re_ctlhi(chan);
94e13c28801677 Sia Jee Heng    2020-06-26   989  =

94e13c28801677 Sia Jee Heng    2020-06-26   990  			ctllo |=3D mem_width <<=
 CH_CTL_L_SRC_WIDTH_POS;
94e13c28801677 Sia Jee Heng    2020-06-26   991  			write_desc_sar(desc, bu=
f_addr + i * period_len);
94e13c28801677 Sia Jee Heng    2020-06-26   992  			write_desc_dar(desc, re=
g);
94e13c28801677 Sia Jee Heng    2020-06-26   993  			desc->lli.block_ts_lo =
=3D period_len / 4;
94e13c28801677 Sia Jee Heng    2020-06-26   994  			desc->lli.ctl_hi =3D cp=
u_to_le32(ctlhi);
94e13c28801677 Sia Jee Heng    2020-06-26   995  			desc->lli.ctl_lo =3D cp=
u_to_le32(ctllo);
94e13c28801677 Sia Jee Heng    2020-06-26   996  =

94e13c28801677 Sia Jee Heng    2020-06-26   997  			set_desc_src_master(des=
c);
94e13c28801677 Sia Jee Heng    2020-06-26   998  			set_desc_src_master(des=
c);
94e13c28801677 Sia Jee Heng    2020-06-26   999  =

94e13c28801677 Sia Jee Heng    2020-06-26  1000  			// Manage transfer list=
 (xfer_list)
94e13c28801677 Sia Jee Heng    2020-06-26  1001  			if (!first) {
94e13c28801677 Sia Jee Heng    2020-06-26  1002  				first =3D desc;
94e13c28801677 Sia Jee Heng    2020-06-26  1003  			} else {
94e13c28801677 Sia Jee Heng    2020-06-26  1004  				write_desc_llp(prev, d=
esc->vd.tx.phys | lms);
94e13c28801677 Sia Jee Heng    2020-06-26  1005  				list_add_tail(&desc->x=
fer_list,
94e13c28801677 Sia Jee Heng    2020-06-26  1006  					      &first->xfer_li=
st);
94e13c28801677 Sia Jee Heng    2020-06-26  1007  			}
94e13c28801677 Sia Jee Heng    2020-06-26  1008  			prev =3D desc;
94e13c28801677 Sia Jee Heng    2020-06-26  1009  			if (i =3D=3D ((buf_len =
/ period_len) - 1))
94e13c28801677 Sia Jee Heng    2020-06-26  1010  				write_desc_llp(prev, f=
irst->vd.tx.phys | lms);
94e13c28801677 Sia Jee Heng    2020-06-26  1011  =

94e13c28801677 Sia Jee Heng    2020-06-26  1012  			total_len +=3D xfer_len;
94e13c28801677 Sia Jee Heng    2020-06-26  1013  =

94e13c28801677 Sia Jee Heng    2020-06-26  1014  			set_desc_last(desc);
94e13c28801677 Sia Jee Heng    2020-06-26  1015  		}
94e13c28801677 Sia Jee Heng    2020-06-26  1016  		break;
94e13c28801677 Sia Jee Heng    2020-06-26  1017  	case DMA_DEV_TO_MEM:
94e13c28801677 Sia Jee Heng    2020-06-26  1018  		reg_width =3D __ffs(chan=
->slave_config.src_addr_width);
94e13c28801677 Sia Jee Heng    2020-06-26  1019  =

94e13c28801677 Sia Jee Heng    2020-06-26  1020  		chan->reg_width =3D reg_=
width;
94e13c28801677 Sia Jee Heng    2020-06-26  1021  		if (reg_width =3D=3D DWA=
XIDMAC_TRANS_WIDTH_16) {
94e13c28801677 Sia Jee Heng    2020-06-26  1022  			offset =3D DMAC_APB_HAL=
FWORD_WR_CH_EN;
94e13c28801677 Sia Jee Heng    2020-06-26  1023  			reg_value =3D axi_dma_a=
pb_ioread32(chan->chip, offset);
94e13c28801677 Sia Jee Heng    2020-06-26  1024  			reg_value |=3D 0x1 << c=
han->id;
94e13c28801677 Sia Jee Heng    2020-06-26  1025  			axi_dma_apb_iowrite32(c=
han->chip, offset, reg_value);
94e13c28801677 Sia Jee Heng    2020-06-26  1026  		} else if (reg_width =3D=
=3D DWAXIDMAC_TRANS_WIDTH_8) {
94e13c28801677 Sia Jee Heng    2020-06-26  1027  			offset =3D DMAC_APB_BYT=
E_WR_CH_EN;
94e13c28801677 Sia Jee Heng    2020-06-26  1028  			reg_value =3D axi_dma_a=
pb_ioread32(chan->chip, offset);
94e13c28801677 Sia Jee Heng    2020-06-26  1029  			reg_value |=3D 0x1 << c=
han->id;
94e13c28801677 Sia Jee Heng    2020-06-26  1030  			axi_dma_apb_iowrite32(c=
han->chip, offset, reg_value);
94e13c28801677 Sia Jee Heng    2020-06-26  1031  		}
94e13c28801677 Sia Jee Heng    2020-06-26  1032  		reg =3D chan->slave_conf=
ig.src_addr;
94e13c28801677 Sia Jee Heng    2020-06-26  1033  		if (reg_width > DWAXIDMA=
C_TRANS_WIDTH_32)
94e13c28801677 Sia Jee Heng    2020-06-26  1034  			reg_width =3D DWAXIDMAC=
_TRANS_WIDTH_32;
94e13c28801677 Sia Jee Heng    2020-06-26  1035  		ctllo =3D axi_dma_prepar=
e_ctllo(chan) |
94e13c28801677 Sia Jee Heng    2020-06-26  1036  			reg_width << CH_CTL_L_S=
RC_WIDTH_POS |
94e13c28801677 Sia Jee Heng    2020-06-26  1037  			DWAXIDMAC_CH_CTL_L_INC =
<< CH_CTL_L_DST_INC_POS |
94e13c28801677 Sia Jee Heng    2020-06-26  1038  			// Workaround
94e13c28801677 Sia Jee Heng    2020-06-26  1039  			DWAXIDMAC_CH_CTL_L_NOIN=
C << CH_CTL_L_SRC_INC_POS;
94e13c28801677 Sia Jee Heng    2020-06-26  1040  =

94e13c28801677 Sia Jee Heng    2020-06-26  1041  		for (i =3D 0; i < buf_le=
n / period_len; i++) {
94e13c28801677 Sia Jee Heng    2020-06-26  1042  			struct axi_dma_desc *de=
sc;
94e13c28801677 Sia Jee Heng    2020-06-26  1043  			size_t xfer_len;
94e13c28801677 Sia Jee Heng    2020-06-26  1044  			u32 mem, len;
94e13c28801677 Sia Jee Heng    2020-06-26  1045  =

94e13c28801677 Sia Jee Heng    2020-06-26  1046  			desc =3D axi_desc_get(c=
han);
94e13c28801677 Sia Jee Heng    2020-06-26  1047  			if (unlikely(!desc))
94e13c28801677 Sia Jee Heng    2020-06-26  1048  				goto err_desc_get;
94e13c28801677 Sia Jee Heng    2020-06-26  1049  =

94e13c28801677 Sia Jee Heng    2020-06-26  1050  			xfer_len =3D len;
94e13c28801677 Sia Jee Heng    2020-06-26  1051  			block_ts =3D xfer_len >=
> reg_width;
94e13c28801677 Sia Jee Heng    2020-06-26  1052  			if (block_ts > max_bloc=
k_ts) {
94e13c28801677 Sia Jee Heng    2020-06-26  1053  				block_ts =3D max_block=
_ts;
94e13c28801677 Sia Jee Heng    2020-06-26  1054  				xfer_len =3D max_block=
_ts << reg_width;
94e13c28801677 Sia Jee Heng    2020-06-26  1055  			}
94e13c28801677 Sia Jee Heng    2020-06-26  1056  			xfer_len =3D period_len;
94e13c28801677 Sia Jee Heng    2020-06-26  1057  			block_ts =3D period_len;
94e13c28801677 Sia Jee Heng    2020-06-26  1058  			mem_width =3D __ffs(dat=
a_width | mem | xfer_len);
                                                                           =
                            ^^^
94e13c28801677 Sia Jee Heng    2020-06-26  1059  			if (mem_width > DWAXIDM=
AC_TRANS_WIDTH_32)
94e13c28801677 Sia Jee Heng    2020-06-26  1060  				mem_width =3D DWAXIDMA=
C_TRANS_WIDTH_32;
94e13c28801677 Sia Jee Heng    2020-06-26  1061  =

94e13c28801677 Sia Jee Heng    2020-06-26  1062  			ctlhi =3D axi_dma_prepa=
re_ctlhi(chan);
94e13c28801677 Sia Jee Heng    2020-06-26  1063  			ctllo |=3D mem_width <<=
 CH_CTL_L_DST_WIDTH_POS;
94e13c28801677 Sia Jee Heng    2020-06-26  1064  =

94e13c28801677 Sia Jee Heng    2020-06-26  1065  			write_desc_sar(desc, re=
g);
94e13c28801677 Sia Jee Heng    2020-06-26  1066  			write_desc_dar(desc, bu=
f_addr + i * period_len);
94e13c28801677 Sia Jee Heng    2020-06-26  1067  			if (reg_width =3D=3D DW=
AXIDMAC_TRANS_WIDTH_16)
94e13c28801677 Sia Jee Heng    2020-06-26  1068  				desc->lli.block_ts_lo =
=3D period_len / 2;
94e13c28801677 Sia Jee Heng    2020-06-26  1069  			else if (reg_width >=3D=
 DWAXIDMAC_TRANS_WIDTH_32)
94e13c28801677 Sia Jee Heng    2020-06-26  1070  				desc->lli.block_ts_lo =
=3D period_len / 4;
94e13c28801677 Sia Jee Heng    2020-06-26  1071  			desc->lli.ctl_hi =3D cp=
u_to_le32(ctlhi);
94e13c28801677 Sia Jee Heng    2020-06-26  1072  			desc->lli.ctl_lo =3D cp=
u_to_le32(ctllo);
94e13c28801677 Sia Jee Heng    2020-06-26  1073  =

94e13c28801677 Sia Jee Heng    2020-06-26  1074  			set_desc_src_master(des=
c);
94e13c28801677 Sia Jee Heng    2020-06-26  1075  			set_desc_src_master(des=
c);
94e13c28801677 Sia Jee Heng    2020-06-26  1076  =

94e13c28801677 Sia Jee Heng    2020-06-26  1077  			// Manage transfer list=
 (xfer_list)
94e13c28801677 Sia Jee Heng    2020-06-26  1078  			if (!first) {
94e13c28801677 Sia Jee Heng    2020-06-26  1079  				first =3D desc;
94e13c28801677 Sia Jee Heng    2020-06-26  1080  			} else {
94e13c28801677 Sia Jee Heng    2020-06-26  1081  				write_desc_llp(prev, d=
esc->vd.tx.phys | lms);
94e13c28801677 Sia Jee Heng    2020-06-26  1082  				list_add_tail(&desc->x=
fer_list,
94e13c28801677 Sia Jee Heng    2020-06-26  1083  					      &first->xfer_li=
st);
94e13c28801677 Sia Jee Heng    2020-06-26  1084  			}
94e13c28801677 Sia Jee Heng    2020-06-26  1085  			prev =3D desc;
94e13c28801677 Sia Jee Heng    2020-06-26  1086  			if (i =3D=3D ((buf_len =
/ period_len) - 1))
94e13c28801677 Sia Jee Heng    2020-06-26  1087  				write_desc_llp(prev, f=
irst->vd.tx.phys | lms);
94e13c28801677 Sia Jee Heng    2020-06-26  1088  =

94e13c28801677 Sia Jee Heng    2020-06-26  1089  			total_len +=3D xfer_len;
94e13c28801677 Sia Jee Heng    2020-06-26  1090  =

94e13c28801677 Sia Jee Heng    2020-06-26  1091  			// TODO: check if needed
94e13c28801677 Sia Jee Heng    2020-06-26  1092  			set_desc_last(desc);
94e13c28801677 Sia Jee Heng    2020-06-26  1093  		}
94e13c28801677 Sia Jee Heng    2020-06-26  1094  		break;
94e13c28801677 Sia Jee Heng    2020-06-26  1095  	default:
94e13c28801677 Sia Jee Heng    2020-06-26  1096  		return NULL;
94e13c28801677 Sia Jee Heng    2020-06-26  1097  	}
94e13c28801677 Sia Jee Heng    2020-06-26  1098  =

94e13c28801677 Sia Jee Heng    2020-06-26  1099  	if (unlikely(!first))
94e13c28801677 Sia Jee Heng    2020-06-26  1100  		return NULL;
94e13c28801677 Sia Jee Heng    2020-06-26  1101  =

94e13c28801677 Sia Jee Heng    2020-06-26  1102  	return vchan_tx_prep(&cha=
n->vc, &first->vd, flags);
94e13c28801677 Sia Jee Heng    2020-06-26  1103  =

94e13c28801677 Sia Jee Heng    2020-06-26  1104  err_desc_get:
94e13c28801677 Sia Jee Heng    2020-06-26  1105  	if (first)
94e13c28801677 Sia Jee Heng    2020-06-26  1106  		axi_desc_put(first);
94e13c28801677 Sia Jee Heng    2020-06-26  1107  =

94e13c28801677 Sia Jee Heng    2020-06-26  1108  	return NULL;
94e13c28801677 Sia Jee Heng    2020-06-26  1109  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =


_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave(a)lists.01.org

--===============7146027942857279109==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7146027942857279109==--

