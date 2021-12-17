Content-Type: multipart/mixed; boundary="===============3041761301598518906=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.10 65/1981] drivers/spi/spi-zynqmp-gqspi.c:968:3-9: preceding lock on line 959
Date: Sat, 18 Dec 2021 03:01:38 +0800
Message-ID: <202112180238.NUlXfiNL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3041761301598518906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Quanyang Wang <quanyang.wang@windriver.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.10
head:   87ec9a2d98a7a7dfc98b57348a0ec310fd170e4b
commit: bc753db9c74d949b33bbb8b08a9b6340b57a444f [65/1981] spi: spi-zynqmp-=
gqspi: add mutex locking for exec_op
:::::: branch date: 3 days ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-c002-20211216 (https://download.01.org/0day-ci/ar=
chive/20211218/202112180238.NUlXfiNL-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-zynqmp-gqspi.c:968:3-9: preceding lock on line 959

vim +968 drivers/spi/spi-zynqmp-gqspi.c

9e3a000362aecb Naga Sureshkumar Relli 2018-03-26   934  =

1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   935  /**
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   936   * zynqmp_qspi_exec=
_op() - Initiates the QSPI transfer
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   937   * @mem: The SPI me=
mory
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   938   * @op: The memory =
operation to execute
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   939   *
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   940   * Executes a memor=
y operation.
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   941   *
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   942   * This function fi=
rst selects the chip and starts the memory operation.
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   943   *
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   944   * Return: 0 in cas=
e of success, a negative error code otherwise.
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   945   */
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   946  static int zynqmp_q=
spi_exec_op(struct spi_mem *mem,
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   947  			       const str=
uct spi_mem_op *op)
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   948  {
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   949  	struct zynqmp_qspi=
 *xqspi =3D spi_controller_get_devdata
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   950  				    (mem->spi->=
master);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   951  	int err =3D 0, i;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   952  	u8 *tmpbuf;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   953  	u32 genfifoentry =
=3D 0;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   954  =

1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   955  	dev_dbg(xqspi->dev=
, "cmd:%#x mode:%d.%d.%d.%d\n",
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   956  		op->cmd.opcode, o=
p->cmd.buswidth, op->addr.buswidth,
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   957  		op->dummy.buswidt=
h, op->data.buswidth);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   958  =

bc753db9c74d94 Quanyang Wang          2020-11-19  @959  	mutex_lock(&xqspi-=
>op_lock);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   960  	zynqmp_qspi_config=
_op(xqspi, mem->spi);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   961  	zynqmp_qspi_chipse=
lect(mem->spi, false);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   962  	genfifoentry |=3D =
xqspi->genfifocs;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   963  	genfifoentry |=3D =
xqspi->genfifobus;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   964  =

1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   965  	if (op->cmd.opcode=
) {
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   966  		tmpbuf =3D kzallo=
c(op->cmd.nbytes, GFP_KERNEL | GFP_DMA);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   967  		if (!tmpbuf)
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  @968  			return -ENOMEM;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   969  		tmpbuf[0] =3D op-=
>cmd.opcode;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   970  		reinit_completion=
(&xqspi->data_completion);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   971  		xqspi->txbuf =3D =
tmpbuf;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   972  		xqspi->rxbuf =3D =
NULL;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   973  		xqspi->bytes_to_t=
ransfer =3D op->cmd.nbytes;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   974  		xqspi->bytes_to_r=
eceive =3D 0;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   975  		zynqmp_qspi_write=
_op(xqspi, op->cmd.buswidth, genfifoentry);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   976  		zynqmp_gqspi_writ=
e(xqspi, GQSPI_CONFIG_OFST,
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   977  				   zynqmp_gqspi=
_read(xqspi, GQSPI_CONFIG_OFST) |
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   978  				   GQSPI_CFG_ST=
ART_GEN_FIFO_MASK);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   979  		zynqmp_gqspi_writ=
e(xqspi, GQSPI_IER_OFST,
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   980  				   GQSPI_IER_GE=
NFIFOEMPTY_MASK |
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   981  				   GQSPI_IER_TX=
NOT_FULL_MASK);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   982  		if (!wait_for_com=
pletion_interruptible_timeout
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   983  		    (&xqspi->data=
_completion, msecs_to_jiffies(1000))) {
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   984  			err =3D -ETIMEDO=
UT;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   985  			kfree(tmpbuf);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   986  			goto return_err;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   987  		}
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   988  		kfree(tmpbuf);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   989  	}
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   990  =

1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   991  	if (op->addr.nbyte=
s) {
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   992  		for (i =3D 0; i <=
 op->addr.nbytes; i++) {
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   993  			*(((u8 *)xqspi->=
txbuf) + i) =3D op->addr.val >>
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   994  					(8 * (op->addr=
.nbytes - i - 1));
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   995  		}
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   996  =

1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   997  		reinit_completion=
(&xqspi->data_completion);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   998  		xqspi->rxbuf =3D =
NULL;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24   999  		xqspi->bytes_to_t=
ransfer =3D op->addr.nbytes;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1000  		xqspi->bytes_to_r=
eceive =3D 0;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1001  		zynqmp_qspi_write=
_op(xqspi, op->addr.buswidth, genfifoentry);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1002  		zynqmp_gqspi_writ=
e(xqspi, GQSPI_CONFIG_OFST,
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1003  				   zynqmp_gqspi=
_read(xqspi,
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1004  						     GQSPI_CO=
NFIG_OFST) |
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1005  				   GQSPI_CFG_ST=
ART_GEN_FIFO_MASK);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1006  		zynqmp_gqspi_writ=
e(xqspi, GQSPI_IER_OFST,
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1007  				   GQSPI_IER_TX=
EMPTY_MASK |
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1008  				   GQSPI_IER_GE=
NFIFOEMPTY_MASK |
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1009  				   GQSPI_IER_TX=
NOT_FULL_MASK);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1010  		if (!wait_for_com=
pletion_interruptible_timeout
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1011  		    (&xqspi->data=
_completion, msecs_to_jiffies(1000))) {
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1012  			err =3D -ETIMEDO=
UT;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1013  			goto return_err;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1014  		}
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1015  	}
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1016  =

1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1017  	if (op->dummy.nbyt=
es) {
5e19e3ddfa5d4b Quanyang Wang          2020-11-16  1018  		xqspi->txbuf =3D =
NULL;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1019  		xqspi->rxbuf =3D =
NULL;
5e19e3ddfa5d4b Quanyang Wang          2020-11-16  1020  		/*
5e19e3ddfa5d4b Quanyang Wang          2020-11-16  1021  		 * xqspi->bytes_t=
o_transfer here represents the dummy circles
5e19e3ddfa5d4b Quanyang Wang          2020-11-16  1022  		 * per data line.
5e19e3ddfa5d4b Quanyang Wang          2020-11-16  1023  		 */
5e19e3ddfa5d4b Quanyang Wang          2020-11-16  1024  		xqspi->bytes_to_t=
ransfer =3D op->dummy.nbytes * 8 / op->dummy.buswidth;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1025  		xqspi->bytes_to_r=
eceive =3D 0;
5e19e3ddfa5d4b Quanyang Wang          2020-11-16  1026  		/*
5e19e3ddfa5d4b Quanyang Wang          2020-11-16  1027  		 * Using op->data=
.buswidth instead of op->dummy.buswidth since
5e19e3ddfa5d4b Quanyang Wang          2020-11-16  1028  		 * the specificat=
ion requires that the dummy.buswidth should
5e19e3ddfa5d4b Quanyang Wang          2020-11-16  1029  		 * be the same as=
 data.buswidth.
5e19e3ddfa5d4b Quanyang Wang          2020-11-16  1030  		 */
5e19e3ddfa5d4b Quanyang Wang          2020-11-16  1031  		zynqmp_qspi_write=
_op(xqspi, op->data.buswidth,
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1032  				     genfifoent=
ry);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1033  		zynqmp_gqspi_writ=
e(xqspi, GQSPI_CONFIG_OFST,
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1034  				   zynqmp_gqspi=
_read(xqspi, GQSPI_CONFIG_OFST) |
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1035  				   GQSPI_CFG_ST=
ART_GEN_FIFO_MASK);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1036  	}
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1037  =

1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1038  	if (op->data.nbyte=
s) {
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1039  		reinit_completion=
(&xqspi->data_completion);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1040  		if (op->data.dir =
=3D=3D SPI_MEM_DATA_OUT) {
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1041  			xqspi->txbuf =3D=
 (u8 *)op->data.buf.out;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1042  			xqspi->rxbuf =3D=
 NULL;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1043  			xqspi->bytes_to_=
transfer =3D op->data.nbytes;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1044  			xqspi->bytes_to_=
receive =3D 0;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1045  			zynqmp_qspi_writ=
e_op(xqspi, op->data.buswidth,
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1046  					     genfifoen=
try);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1047  			zynqmp_gqspi_wri=
te(xqspi, GQSPI_CONFIG_OFST,
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1048  					   zynqmp_gqsp=
i_read
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1049  					   (xqspi, GQS=
PI_CONFIG_OFST) |
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1050  					   GQSPI_CFG_S=
TART_GEN_FIFO_MASK);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1051  			zynqmp_gqspi_wri=
te(xqspi, GQSPI_IER_OFST,
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1052  					   GQSPI_IER_T=
XEMPTY_MASK |
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1053  					   GQSPI_IER_G=
ENFIFOEMPTY_MASK |
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1054  					   GQSPI_IER_T=
XNOT_FULL_MASK);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1055  		} else {
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1056  			xqspi->txbuf =3D=
 NULL;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1057  			xqspi->rxbuf =3D=
 (u8 *)op->data.buf.in;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1058  			xqspi->bytes_to_=
receive =3D op->data.nbytes;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1059  			xqspi->bytes_to_=
transfer =3D 0;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1060  			zynqmp_qspi_read=
_op(xqspi, op->data.buswidth,
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1061  					    genfifoent=
ry);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1062  			zynqmp_gqspi_wri=
te(xqspi, GQSPI_CONFIG_OFST,
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1063  					   zynqmp_gqsp=
i_read
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1064  					   (xqspi, GQS=
PI_CONFIG_OFST) |
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1065  					   GQSPI_CFG_S=
TART_GEN_FIFO_MASK);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1066  			if (xqspi->mode =
=3D=3D GQSPI_MODE_DMA) {
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1067  				zynqmp_gqspi_wr=
ite
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1068  					(xqspi, GQSPI_=
QSPIDMA_DST_I_EN_OFST,
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1069  					 GQSPI_QSPIDMA=
_DST_I_EN_DONE_MASK);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1070  			} else {
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1071  				zynqmp_gqspi_wr=
ite(xqspi, GQSPI_IER_OFST,
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1072  						   GQSPI_IER_=
GENFIFOEMPTY_MASK |
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1073  						   GQSPI_IER_=
RXNEMPTY_MASK |
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1074  						   GQSPI_IER_=
RXEMPTY_MASK);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1075  			}
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1076  		}
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1077  		if (!wait_for_com=
pletion_interruptible_timeout
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1078  		    (&xqspi->data=
_completion, msecs_to_jiffies(1000)))
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1079  			err =3D -ETIMEDO=
UT;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1080  	}
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1081  =

1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1082  return_err:
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1083  =

1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1084  	zynqmp_qspi_chipse=
lect(mem->spi, true);
bc753db9c74d94 Quanyang Wang          2020-11-19  1085  	mutex_unlock(&xqsp=
i->op_lock);
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1086  =

1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1087  	return err;
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1088  }
1c26372e5aa9e5 Amit Kumar Mahapatra   2020-09-24  1089  =


:::::: The code at line 968 was first introduced by commit
:::::: 1c26372e5aa9e53391a1f8fe0dc7cd93a7e5ba9e spi: spi-zynqmp-gqspi: Upda=
te driver to use spi-mem framework

:::::: TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3041761301598518906==--

