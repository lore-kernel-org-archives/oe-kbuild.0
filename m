Content-Type: multipart/mixed; boundary="===============0840066341638261928=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 637/907] drivers/dma/xilinx/xilinx_frmbuf.c:892 xilinx_xdma_get_fid_err_flag() warn: passing a valid pointer to 'PTR_ERR'
Date: Thu, 10 Feb 2022 03:35:14 +0800
Message-ID: <202202100314.acKaX1EC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0840066341638261928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Satish Kumar Nagireddy <satish.nagireddy.nagireddy@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Hyun Kwon <hyun.kwon@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   423a108a01e05e84b59a4c4885c16bf3cd8c90c7
commit: 70a120c172f12ea78d2775620b0a06bb5cf5f0c6 [637/907] dma: xilinx: Sup=
port early callback modes
:::::: branch date: 10 hours ago
:::::: commit date: 9 days ago
config: arm-randconfig-m031-20220208 (https://download.01.org/0day-ci/archi=
ve/20220210/202202100314.acKaX1EC-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/dma/xilinx/xilinx_frmbuf.c:892 xilinx_xdma_get_fid_err_flag() warn:=
 passing a valid pointer to 'PTR_ERR'
drivers/dma/xilinx/xilinx_frmbuf.c:910 xilinx_xdma_get_fid_out() warn: pass=
ing a valid pointer to 'PTR_ERR'
drivers/dma/xilinx/xilinx_frmbuf.c:927 xilinx_xdma_get_width_align() warn: =
passing a valid pointer to 'PTR_ERR'

Old smatch warnings:
drivers/dma/xilinx/xilinx_frmbuf.c:809 xilinx_xdma_get_drm_vid_fmts() warn:=
 passing a valid pointer to 'PTR_ERR'
drivers/dma/xilinx/xilinx_frmbuf.c:826 xilinx_xdma_get_v4l2_vid_fmts() warn=
: passing a valid pointer to 'PTR_ERR'
drivers/dma/xilinx/xilinx_frmbuf.c:843 xilinx_xdma_get_fid() warn: passing =
a valid pointer to 'PTR_ERR'
drivers/dma/xilinx/xilinx_frmbuf.c:871 xilinx_xdma_set_fid() warn: passing =
a valid pointer to 'PTR_ERR'
drivers/dma/xilinx/xilinx_frmbuf.c:943 xilinx_xdma_get_earlycb() warn: pass=
ing a valid pointer to 'PTR_ERR'
drivers/dma/xilinx/xilinx_frmbuf.c:969 xilinx_xdma_set_earlycb() warn: pass=
ing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +892 drivers/dma/xilinx/xilinx_frmbuf.c

c869e53ce34dec Jeffrey Mouroux        2017-07-13  884  =

70a120c172f12e Satish Kumar Nagireddy 2019-03-05  885  int xilinx_xdma_get_=
fid_err_flag(struct dma_chan *chan,
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  886  				 u32 *fid_err_fl=
ag)
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  887  {
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  888  	struct xilinx_frmbu=
f_device *xdev;
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  889  =

70a120c172f12e Satish Kumar Nagireddy 2019-03-05  890  	xdev =3D frmbuf_fin=
d_dev(chan);
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  891  	if (IS_ERR(xdev))
70a120c172f12e Satish Kumar Nagireddy 2019-03-05 @892  		return PTR_ERR(xde=
v);
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  893  =

70a120c172f12e Satish Kumar Nagireddy 2019-03-05  894  	if (xdev->chan.dire=
ction !=3D DMA_DEV_TO_MEM || !xdev->chan.idle)
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  895  		return -EINVAL;
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  896  =

70a120c172f12e Satish Kumar Nagireddy 2019-03-05  897  	*fid_err_flag =3D x=
dev->chan.fid_err_flag;
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  898  =

70a120c172f12e Satish Kumar Nagireddy 2019-03-05  899  	return 0;
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  900  }
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  901  EXPORT_SYMBOL(xilinx=
_xdma_get_fid_err_flag);
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  902  =

70a120c172f12e Satish Kumar Nagireddy 2019-03-05  903  int xilinx_xdma_get_=
fid_out(struct dma_chan *chan,
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  904  			    u32 *fid_out_=
val)
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  905  {
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  906  	struct xilinx_frmbu=
f_device *xdev;
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  907  =

70a120c172f12e Satish Kumar Nagireddy 2019-03-05  908  	xdev =3D frmbuf_fin=
d_dev(chan);
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  909  	if (IS_ERR(xdev))
70a120c172f12e Satish Kumar Nagireddy 2019-03-05 @910  		return PTR_ERR(xde=
v);
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  911  =

70a120c172f12e Satish Kumar Nagireddy 2019-03-05  912  	if (xdev->chan.dire=
ction !=3D DMA_DEV_TO_MEM || !xdev->chan.idle)
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  913  		return -EINVAL;
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  914  =

70a120c172f12e Satish Kumar Nagireddy 2019-03-05  915  	*fid_out_val =3D xd=
ev->chan.fid_out_val;
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  916  =

70a120c172f12e Satish Kumar Nagireddy 2019-03-05  917  	return 0;
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  918  }
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  919  EXPORT_SYMBOL(xilinx=
_xdma_get_fid_out);
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  920  =

70a120c172f12e Satish Kumar Nagireddy 2019-03-05  921  int xilinx_xdma_get_=
width_align(struct dma_chan *chan, u32 *width_align)
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  922  {
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  923  	struct xilinx_frmbu=
f_device *xdev;
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  924  =

70a120c172f12e Satish Kumar Nagireddy 2019-03-05  925  	xdev =3D frmbuf_fin=
d_dev(chan);
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  926  	if (IS_ERR(xdev))
70a120c172f12e Satish Kumar Nagireddy 2019-03-05 @927  		return PTR_ERR(xde=
v);
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  928  	*width_align =3D xd=
ev->ppc;
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  929  =

70a120c172f12e Satish Kumar Nagireddy 2019-03-05  930  	return 0;
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  931  }
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  932  EXPORT_SYMBOL(xilinx=
_xdma_get_width_align);
70a120c172f12e Satish Kumar Nagireddy 2019-03-05  933  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0840066341638261928==--

