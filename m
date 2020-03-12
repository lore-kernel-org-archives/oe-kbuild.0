Content-Type: multipart/mixed; boundary="===============9158078141611395175=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [pinchartl-media:media/drm/dpsub/next 5/14] drivers/dma/xilinx/xilinx_dpdma.c:389 xilinx_dpdma_debugfs_read() warn: maybe return -EFAULT instead of the bytes remaining?
Date: Thu, 12 Mar 2020 06:56:42 -0700
Message-ID: <20200312135642.GL11561@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9158078141611395175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://linuxtv.org/pinchartl/media.git media/drm/dpsub/next
head:   fc1d178201c64a7b0106f84de5503eead44c0586
commit: efaa5ceddb7bdb19307a215e8ec207ded1c87474 [5/14] dmaengine: xilinx: =
dpdma: Add debugfs support

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/dma/xilinx/xilinx_dpdma.c:389 xilinx_dpdma_debugfs_read() warn: may=
be return -EFAULT instead of the bytes remaining?

git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
git remote update pinchartl-media
git checkout efaa5ceddb7bdb19307a215e8ec207ded1c87474
vim +389 drivers/dma/xilinx/xilinx_dpdma.c

efaa5ceddb7bdb Laurent Pinchart 2019-11-07  357  static ssize_t xilinx_dpdm=
a_debugfs_read(struct file *f, char __user *buf,
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  358  					 size_t size, loff_t =
*pos)
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  359  {
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  360  	enum xilinx_dpdma_testcas=
es testcase;
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  361  	char *kern_buff;
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  362  	int ret;

	ret =3D 0;

efaa5ceddb7bdb Laurent Pinchart 2019-11-07  363  =

efaa5ceddb7bdb Laurent Pinchart 2019-11-07  364  	if (*pos !=3D 0 || size <=
=3D 0)
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  365  		return -EINVAL;
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  366  =

efaa5ceddb7bdb Laurent Pinchart 2019-11-07  367  	kern_buff =3D kzalloc(XIL=
INX_DPDMA_DEBUGFS_READ_MAX_SIZE, GFP_KERNEL);
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  368  	if (!kern_buff) {
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  369  		dpdma_debugfs.testcase =
=3D DPDMA_TC_NONE;
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  370  		return -ENOMEM;
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  371  	}
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  372  =

efaa5ceddb7bdb Laurent Pinchart 2019-11-07  373  	testcase =3D READ_ONCE(dp=
dma_debugfs.testcase);
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  374  	if (testcase !=3D DPDMA_T=
C_NONE) {
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  375  		ret =3D dpdma_debugfs_re=
qs[testcase].read(kern_buff);
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  376  		if (ret < 0)
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  377  			goto done;
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  378  	} else {
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  379  		strlcpy(kern_buff, "No t=
estcase executed",
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  380  			XILINX_DPDMA_DEBUGFS_RE=
AD_MAX_SIZE);
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  381  	}
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  382  =

efaa5ceddb7bdb Laurent Pinchart 2019-11-07  383  	size =3D min(size, strlen=
(kern_buff));
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  384  	ret =3D copy_to_user(buf,=
 kern_buff, size);

	if (copy_to_user(buf, kern_buff, size))
		ret =3D -EFAULT;

efaa5ceddb7bdb Laurent Pinchart 2019-11-07  385  =

efaa5ceddb7bdb Laurent Pinchart 2019-11-07  386  done:
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  387  	kfree(kern_buff);
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  388  	if (ret)
efaa5ceddb7bdb Laurent Pinchart 2019-11-07 @389  		return ret;
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  390  =

efaa5ceddb7bdb Laurent Pinchart 2019-11-07  391  	*pos =3D size + 1;
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  392  	return size;
efaa5ceddb7bdb Laurent Pinchart 2019-11-07  393  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============9158078141611395175==--

