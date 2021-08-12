Content-Type: multipart/mixed; boundary="===============1138886808930639127=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-linux-intel-lts:5.4/yocto 40/1142] drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:993:47: sparse: sparse: incorrect type in assignment (different base types)
Date: Fri, 13 Aug 2021 06:24:24 +0800
Message-ID: <202108130617.MpYzchGW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1138886808930639127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Sia Jee Heng <jee.heng.sia@intel.com>
CC: "Li, Yifan" <yifan2.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.4/yocto
head:   eeb611e5394c56d45c5cc8f7dc484c9f19e93143
commit: 94e13c2880167751eb5cbbcb0e7be68ca83f0653 [40/1142] dmaengine: dw-ax=
i-dma: support cyclic mode
:::::: branch date: 12 months ago
:::::: commit date: 12 months ago
config: h8300-randconfig-s032-20210812 (attached as .config)
compiler: h8300-linux-gcc (GCC) 10.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-348-gf0e6938b-dirty
        # https://github.com/intel/linux-intel-lts/commit/94e13c2880167751e=
b5cbbcb0e7be68ca83f0653
        git remote add intel-linux-intel-lts https://github.com/intel/linux=
-intel-lts.git
        git fetch --no-tags intel-linux-intel-lts 5.4/yocto
        git checkout 94e13c2880167751eb5cbbcb0e7be68ca83f0653
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-10.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dh8300 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:993:47: sparse: sparse: i=
ncorrect type in assignment (different base types) @@     expected restrict=
ed __le32 [usertype] block_ts_lo @@     got unsigned long @@
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:993:47: sparse:     expec=
ted restricted __le32 [usertype] block_ts_lo
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:993:47: sparse:     got u=
nsigned long
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1068:55: sparse: sparse: =
incorrect type in assignment (different base types) @@     expected restric=
ted __le32 [usertype] block_ts_lo @@     got unsigned long @@
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1068:55: sparse:     expe=
cted restricted __le32 [usertype] block_ts_lo
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1068:55: sparse:     got =
unsigned long
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1070:55: sparse: sparse: =
incorrect type in assignment (different base types) @@     expected restric=
ted __le32 [usertype] block_ts_lo @@     got unsigned long @@
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1070:55: sparse:     expe=
cted restricted __le32 [usertype] block_ts_lo
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1070:55: sparse:     got =
unsigned long
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1169:59: sparse: sparse: =
incorrect type in argument 2 (different base types) @@     expected unsigne=
d int [usertype] irq_mask @@     got restricted __le32 [usertype] status_lo=
 @@
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1169:59: sparse:     expe=
cted unsigned int [usertype] irq_mask
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1169:59: sparse:     got =
restricted __le32 [usertype] status_lo
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1170:42: sparse: sparse: =
invalid assignment: |=3D
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1170:42: sparse:    left =
side has type restricted __le32
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c:1170:42: sparse:    right=
 side has type unsigned long
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through arch/h8300/include/asm/io.h, include/linux/scatterlist.h, include/l=
inux/dmaengine.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through include/linux/scatterlist.h, include/linux/dmaengine.h):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '<asn:2>' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '<asn:2>' of expression
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through arch/h8300/include/asm/io.h, include/linux/scatterlist.h, include/l=
inux/dmaengine.h):
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] b @@  =
   got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] b
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through include/linux/scatterlist.h, include/linux/dmaengine.h):
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '<asn:2>' of expression
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through arch/h8300/include/asm/io.h, include/linux/scatterlist.h, include/l=
inux/dmaengine.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through include/linux/scatterlist.h, include/linux/dmaengine.h):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '<asn:2>' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '<asn:2>' of expression
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through arch/h8300/include/asm/io.h, include/linux/scatterlist.h, include/l=
inux/dmaengine.h):
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] b @@  =
   got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] b
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through include/linux/scatterlist.h, include/linux/dmaengine.h):
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '<asn:2>' of expression
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through arch/h8300/include/asm/io.h, include/linux/scatterlist.h, include/l=
inux/dmaengine.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through include/linux/scatterlist.h, include/linux/dmaengine.h):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '<asn:2>' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '<asn:2>' of expression
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through arch/h8300/include/asm/io.h, include/linux/scatterlist.h, include/l=
inux/dmaengine.h):
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] b @@  =
   got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] b
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through include/linux/scatterlist.h, include/linux/dmaengine.h):
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '<asn:2>' of expression
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through arch/h8300/include/asm/io.h, include/linux/scatterlist.h, include/l=
inux/dmaengine.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through include/linux/scatterlist.h, include/linux/dmaengine.h):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '<asn:2>' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '<asn:2>' of expression
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through arch/h8300/include/asm/io.h, include/linux/scatterlist.h, include/l=
inux/dmaengine.h):
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] b @@  =
   got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] b
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through include/linux/scatterlist.h, include/linux/dmaengine.h):
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '<asn:2>' of expression
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through arch/h8300/include/asm/io.h, include/linux/scatterlist.h, include/l=
inux/dmaengine.h):
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] b @@  =
   got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] b
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through include/linux/scatterlist.h, include/linux/dmaengine.h):
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '<asn:2>' of expression
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through arch/h8300/include/asm/io.h, include/linux/scatterlist.h, include/l=
inux/dmaengine.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through include/linux/scatterlist.h, include/linux/dmaengine.h):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '<asn:2>' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '<asn:2>' of expression
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through arch/h8300/include/asm/io.h, include/linux/scatterlist.h, include/l=
inux/dmaengine.h):
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] b @@  =
   got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] b
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through include/linux/scatterlist.h, include/linux/dmaengine.h):
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '<asn:2>' of expression

vim +993 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c

1fe20f1b84548b Eugeniy Paltsev 2018-03-06   912  =

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

94e13c28801677 Sia Jee Heng    2020-06-26   972  			mem_width =3D __ffs(dat=
a_width | mem | len);
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
94e13c28801677 Sia Jee Heng    2020-06-26  @993  			desc->lli.block_ts_lo =
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
94e13c28801677 Sia Jee Heng    2020-06-26  1110  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1138886808930639127==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1138886808930639127==--

