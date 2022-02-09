Content-Type: multipart/mixed; boundary="===============2236232338081038501=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 576/907] drivers/dma/xilinx/xilinx_frmbuf.c:727 xilinx_xdma_get_drm_vid_fmts() warn: passing a valid pointer to 'PTR_ERR'
Date: Thu, 10 Feb 2022 01:32:53 +0800
Message-ID: <202202100121.5zLIr9Ko-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2236232338081038501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Jeffrey Mouroux <jeff.mouroux@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Radhey Pandey <radheys@xilinx.com>
CC: John Nichols <jnichol@xilinx.com>
CC: Hyun Kwon <hyun.kwon@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   423a108a01e05e84b59a4c4885c16bf3cd8c90c7
commit: c869e53ce34decde8d196cb8032d248031278784 [576/907] dmaengine: xilin=
x_frmbuf: New driver for Video Framebuffer IP
:::::: branch date: 8 hours ago
:::::: commit date: 8 days ago
config: arm-randconfig-m031-20220208 (https://download.01.org/0day-ci/archi=
ve/20220210/202202100121.5zLIr9Ko-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/dma/xilinx/xilinx_frmbuf.c:727 xilinx_xdma_get_drm_vid_fmts() warn:=
 passing a valid pointer to 'PTR_ERR'
drivers/dma/xilinx/xilinx_frmbuf.c:744 xilinx_xdma_get_v4l2_vid_fmts() warn=
: passing a valid pointer to 'PTR_ERR'
drivers/dma/xilinx/xilinx_frmbuf.c:761 xilinx_xdma_get_fid() warn: passing =
a valid pointer to 'PTR_ERR'
drivers/dma/xilinx/xilinx_frmbuf.c:789 xilinx_xdma_set_fid() warn: passing =
a valid pointer to 'PTR_ERR'
drivers/dma/xilinx/xilinx_frmbuf.c:812 xilinx_xdma_get_earlycb() warn: pass=
ing a valid pointer to 'PTR_ERR'
drivers/dma/xilinx/xilinx_frmbuf.c:838 xilinx_xdma_set_earlycb() warn: pass=
ing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +727 drivers/dma/xilinx/xilinx_frmbuf.c

c869e53ce34dec Jeffrey Mouroux 2017-07-13  718  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  719  int xilinx_xdma_get_drm_vid=
_fmts(struct dma_chan *chan, u32 *fmt_cnt,
c869e53ce34dec Jeffrey Mouroux 2017-07-13  720  				 u32 **fmts)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  721  {
c869e53ce34dec Jeffrey Mouroux 2017-07-13  722  	struct xilinx_frmbuf_devic=
e *xdev;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  723  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  724  	xdev =3D frmbuf_find_dev(c=
han);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  725  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  726  	if (IS_ERR(xdev))
c869e53ce34dec Jeffrey Mouroux 2017-07-13 @727  		return PTR_ERR(xdev);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  728  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  729  	*fmt_cnt =3D xdev->drm_fmt=
_cnt;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  730  	*fmts =3D xdev->drm_memory=
_fmts;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  731  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  732  	return 0;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  733  }
c869e53ce34dec Jeffrey Mouroux 2017-07-13  734  EXPORT_SYMBOL(xilinx_xdma_g=
et_drm_vid_fmts);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  735  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  736  int xilinx_xdma_get_v4l2_vi=
d_fmts(struct dma_chan *chan, u32 *fmt_cnt,
c869e53ce34dec Jeffrey Mouroux 2017-07-13  737  				  u32 **fmts)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  738  {
c869e53ce34dec Jeffrey Mouroux 2017-07-13  739  	struct xilinx_frmbuf_devic=
e *xdev;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  740  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  741  	xdev =3D frmbuf_find_dev(c=
han);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  742  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  743  	if (IS_ERR(xdev))
c869e53ce34dec Jeffrey Mouroux 2017-07-13 @744  		return PTR_ERR(xdev);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  745  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  746  	*fmt_cnt =3D xdev->v4l2_fm=
t_cnt;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  747  	*fmts =3D xdev->v4l2_memor=
y_fmts;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  748  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  749  	return 0;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  750  }
c869e53ce34dec Jeffrey Mouroux 2017-07-13  751  EXPORT_SYMBOL(xilinx_xdma_g=
et_v4l2_vid_fmts);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  752  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  753  int xilinx_xdma_get_fid(str=
uct dma_chan *chan,
c869e53ce34dec Jeffrey Mouroux 2017-07-13  754  			struct dma_async_tx_desc=
riptor *async_tx, u32 *fid)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  755  {
c869e53ce34dec Jeffrey Mouroux 2017-07-13  756  	struct xilinx_frmbuf_devic=
e *xdev;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  757  	struct xilinx_frmbuf_tx_de=
scriptor *desc;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  758  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  759  	xdev =3D frmbuf_find_dev(c=
han);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  760  	if (IS_ERR(xdev))
c869e53ce34dec Jeffrey Mouroux 2017-07-13 @761  		return PTR_ERR(xdev);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  762  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  763  	if (!async_tx || !fid)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  764  		return -EINVAL;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  765  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  766  	if (xdev->chan.direction !=
=3D DMA_DEV_TO_MEM)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  767  		return -EINVAL;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  768  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  769  	desc =3D to_dma_tx_descrip=
tor(async_tx);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  770  	if (!desc)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  771  		return -EINVAL;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  772  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  773  	*fid =3D desc->fid;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  774  	return 0;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  775  }
c869e53ce34dec Jeffrey Mouroux 2017-07-13  776  EXPORT_SYMBOL(xilinx_xdma_g=
et_fid);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  777  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  778  int xilinx_xdma_set_fid(str=
uct dma_chan *chan,
c869e53ce34dec Jeffrey Mouroux 2017-07-13  779  			struct dma_async_tx_desc=
riptor *async_tx, u32 fid)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  780  {
c869e53ce34dec Jeffrey Mouroux 2017-07-13  781  	struct xilinx_frmbuf_devic=
e *xdev;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  782  	struct xilinx_frmbuf_tx_de=
scriptor *desc;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  783  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  784  	if (fid > 1 || !async_tx)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  785  		return -EINVAL;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  786  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  787  	xdev =3D frmbuf_find_dev(c=
han);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  788  	if (IS_ERR(xdev))
c869e53ce34dec Jeffrey Mouroux 2017-07-13 @789  		return PTR_ERR(xdev);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  790  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  791  	if (xdev->chan.direction !=
=3D DMA_MEM_TO_DEV)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  792  		return -EINVAL;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  793  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  794  	desc =3D to_dma_tx_descrip=
tor(async_tx);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  795  	if (!desc)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  796  		return -EINVAL;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  797  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  798  	desc->fid =3D fid;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  799  	return 0;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  800  }
c869e53ce34dec Jeffrey Mouroux 2017-07-13  801  EXPORT_SYMBOL(xilinx_xdma_s=
et_fid);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  802  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  803  int xilinx_xdma_get_earlycb=
(struct dma_chan *chan,
c869e53ce34dec Jeffrey Mouroux 2017-07-13  804  			    struct dma_async_tx_=
descriptor *async_tx,
c869e53ce34dec Jeffrey Mouroux 2017-07-13  805  			    bool *enable)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  806  {
c869e53ce34dec Jeffrey Mouroux 2017-07-13  807  	struct xilinx_frmbuf_devic=
e *xdev;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  808  	struct xilinx_frmbuf_tx_de=
scriptor *desc;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  809  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  810  	xdev =3D frmbuf_find_dev(c=
han);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  811  	if (IS_ERR(xdev))
c869e53ce34dec Jeffrey Mouroux 2017-07-13 @812  		return PTR_ERR(xdev);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  813  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  814  	if (!async_tx || !enable)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  815  		return -EINVAL;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  816  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  817  	desc =3D to_dma_tx_descrip=
tor(async_tx);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  818  	if (!desc)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  819  		return -EINVAL;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  820  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  821  	*enable =3D desc->earlycb;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  822  	return 0;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  823  }
c869e53ce34dec Jeffrey Mouroux 2017-07-13  824  EXPORT_SYMBOL(xilinx_xdma_g=
et_earlycb);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  825  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  826  int xilinx_xdma_set_earlycb=
(struct dma_chan *chan,
c869e53ce34dec Jeffrey Mouroux 2017-07-13  827  			    struct dma_async_tx_=
descriptor *async_tx,
c869e53ce34dec Jeffrey Mouroux 2017-07-13  828  			    bool enable)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  829  {
c869e53ce34dec Jeffrey Mouroux 2017-07-13  830  	struct xilinx_frmbuf_devic=
e *xdev;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  831  	struct xilinx_frmbuf_tx_de=
scriptor *desc;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  832  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  833  	if (!async_tx)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  834  		return -EINVAL;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  835  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  836  	xdev =3D frmbuf_find_dev(c=
han);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  837  	if (IS_ERR(xdev))
c869e53ce34dec Jeffrey Mouroux 2017-07-13 @838  		return PTR_ERR(xdev);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  839  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  840  	desc =3D to_dma_tx_descrip=
tor(async_tx);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  841  	if (!desc)
c869e53ce34dec Jeffrey Mouroux 2017-07-13  842  		return -EINVAL;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  843  =

c869e53ce34dec Jeffrey Mouroux 2017-07-13  844  	desc->earlycb =3D enable;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  845  	return 0;
c869e53ce34dec Jeffrey Mouroux 2017-07-13  846  }
c869e53ce34dec Jeffrey Mouroux 2017-07-13  847  EXPORT_SYMBOL(xilinx_xdma_s=
et_earlycb);
c869e53ce34dec Jeffrey Mouroux 2017-07-13  848  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2236232338081038501==--

