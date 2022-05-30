Content-Type: multipart/mixed; boundary="===============5585939594273141605=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/i2c/busses/i2c-qcom-geni.c:626 geni_i2c_gpi_xfer() error: uninitialized symbol 'rx_addr'.
Date: Tue, 31 May 2022 07:20:52 +0800
Message-ID: <202205310736.Oh37uaNh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5585939594273141605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vinod Koul <vkoul@kernel.org>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ab2afa23bd197df47819a87f0265c0ac95c5b6a
commit: d8703554f4dea9775417525b22b3d65ed1c6b16e i2c: qcom-geni: Add suppor=
t for GPI DMA
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-m031-20220530 (https://download.01.org/0day-ci/arc=
hive/20220531/202205310736.Oh37uaNh-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/i2c/busses/i2c-qcom-geni.c:626 geni_i2c_gpi_xfer() error: uninitial=
ized symbol 'rx_addr'.
drivers/i2c/busses/i2c-qcom-geni.c:635 geni_i2c_gpi_xfer() error: uninitial=
ized symbol 'tx_addr'.

Old smatch warnings:
drivers/i2c/busses/i2c-qcom-geni.c:635 geni_i2c_gpi_xfer() error: uninitial=
ized symbol 'rx_addr'.

vim +/rx_addr +626 drivers/i2c/busses/i2c-qcom-geni.c

d8703554f4dea9 Vinod Koul 2022-02-21  565  =

d8703554f4dea9 Vinod Koul 2022-02-21  566  static int geni_i2c_gpi_xfer(str=
uct geni_i2c_dev *gi2c, struct i2c_msg msgs[], int num)
d8703554f4dea9 Vinod Koul 2022-02-21  567  {
d8703554f4dea9 Vinod Koul 2022-02-21  568  	struct dma_slave_config config =
=3D {};
d8703554f4dea9 Vinod Koul 2022-02-21  569  	struct gpi_i2c_config periphera=
l =3D {};
d8703554f4dea9 Vinod Koul 2022-02-21  570  	int i, ret =3D 0, timeout;
d8703554f4dea9 Vinod Koul 2022-02-21  571  	dma_addr_t tx_addr, rx_addr;
d8703554f4dea9 Vinod Koul 2022-02-21  572  	void *tx_buf =3D NULL, *rx_buf =
=3D NULL;
d8703554f4dea9 Vinod Koul 2022-02-21  573  	const struct geni_i2c_clk_fld *=
itr =3D gi2c->clk_fld;
d8703554f4dea9 Vinod Koul 2022-02-21  574  =

d8703554f4dea9 Vinod Koul 2022-02-21  575  	config.peripheral_config =3D &p=
eripheral;
d8703554f4dea9 Vinod Koul 2022-02-21  576  	config.peripheral_size =3D size=
of(peripheral);
d8703554f4dea9 Vinod Koul 2022-02-21  577  =

d8703554f4dea9 Vinod Koul 2022-02-21  578  	peripheral.pack_enable =3D I2C_=
PACK_TX | I2C_PACK_RX;
d8703554f4dea9 Vinod Koul 2022-02-21  579  	peripheral.cycle_count =3D itr-=
>t_cycle_cnt;
d8703554f4dea9 Vinod Koul 2022-02-21  580  	peripheral.high_count =3D itr->=
t_high_cnt;
d8703554f4dea9 Vinod Koul 2022-02-21  581  	peripheral.low_count =3D itr->t=
_low_cnt;
d8703554f4dea9 Vinod Koul 2022-02-21  582  	peripheral.clk_div =3D itr->clk=
_div;
d8703554f4dea9 Vinod Koul 2022-02-21  583  	peripheral.set_config =3D 1;
d8703554f4dea9 Vinod Koul 2022-02-21  584  	peripheral.multi_msg =3D false;
d8703554f4dea9 Vinod Koul 2022-02-21  585  =

d8703554f4dea9 Vinod Koul 2022-02-21  586  	for (i =3D 0; i < num; i++) {
d8703554f4dea9 Vinod Koul 2022-02-21  587  		gi2c->cur =3D &msgs[i];
d8703554f4dea9 Vinod Koul 2022-02-21  588  		gi2c->err =3D 0;
d8703554f4dea9 Vinod Koul 2022-02-21  589  		dev_dbg(gi2c->se.dev, "msg[%d]=
.len:%d\n", i, gi2c->cur->len);
d8703554f4dea9 Vinod Koul 2022-02-21  590  =

d8703554f4dea9 Vinod Koul 2022-02-21  591  		peripheral.stretch =3D 0;
d8703554f4dea9 Vinod Koul 2022-02-21  592  		if (i < num - 1)
d8703554f4dea9 Vinod Koul 2022-02-21  593  			peripheral.stretch =3D 1;
d8703554f4dea9 Vinod Koul 2022-02-21  594  =

d8703554f4dea9 Vinod Koul 2022-02-21  595  		peripheral.addr =3D msgs[i].ad=
dr;
d8703554f4dea9 Vinod Koul 2022-02-21  596  =

d8703554f4dea9 Vinod Koul 2022-02-21  597  		if (msgs[i].flags & I2C_M_RD) {
d8703554f4dea9 Vinod Koul 2022-02-21  598  			ret =3D  geni_i2c_gpi(gi2c, &=
msgs[i], &config,
d8703554f4dea9 Vinod Koul 2022-02-21  599  					    &rx_addr, &rx_buf, I2C_=
READ, gi2c->rx_c);
d8703554f4dea9 Vinod Koul 2022-02-21  600  			if (ret)
d8703554f4dea9 Vinod Koul 2022-02-21  601  				goto err;
d8703554f4dea9 Vinod Koul 2022-02-21  602  		}
d8703554f4dea9 Vinod Koul 2022-02-21  603  =

d8703554f4dea9 Vinod Koul 2022-02-21  604  		ret =3D  geni_i2c_gpi(gi2c, &m=
sgs[i], &config,
d8703554f4dea9 Vinod Koul 2022-02-21  605  				    &tx_addr, &tx_buf, I2C_W=
RITE, gi2c->tx_c);
d8703554f4dea9 Vinod Koul 2022-02-21  606  		if (ret)
d8703554f4dea9 Vinod Koul 2022-02-21  607  			goto err;
d8703554f4dea9 Vinod Koul 2022-02-21  608  =

d8703554f4dea9 Vinod Koul 2022-02-21  609  		if (msgs[i].flags & I2C_M_RD)
d8703554f4dea9 Vinod Koul 2022-02-21  610  			dma_async_issue_pending(gi2c-=
>rx_c);
d8703554f4dea9 Vinod Koul 2022-02-21  611  		dma_async_issue_pending(gi2c->=
tx_c);
d8703554f4dea9 Vinod Koul 2022-02-21  612  =

d8703554f4dea9 Vinod Koul 2022-02-21  613  		timeout =3D wait_for_completio=
n_timeout(&gi2c->done, XFER_TIMEOUT);
d8703554f4dea9 Vinod Koul 2022-02-21  614  		if (!timeout) {
d8703554f4dea9 Vinod Koul 2022-02-21  615  			dev_err(gi2c->se.dev, "I2C ti=
meout gpi flags:%d addr:0x%x\n",
d8703554f4dea9 Vinod Koul 2022-02-21  616  				gi2c->cur->flags, gi2c->cur-=
>addr);
d8703554f4dea9 Vinod Koul 2022-02-21  617  			gi2c->err =3D -ETIMEDOUT;
d8703554f4dea9 Vinod Koul 2022-02-21  618  			goto err;
d8703554f4dea9 Vinod Koul 2022-02-21  619  		}
d8703554f4dea9 Vinod Koul 2022-02-21  620  =

d8703554f4dea9 Vinod Koul 2022-02-21  621  		if (gi2c->err) {
d8703554f4dea9 Vinod Koul 2022-02-21  622  			ret =3D gi2c->err;
d8703554f4dea9 Vinod Koul 2022-02-21  623  			goto err;
d8703554f4dea9 Vinod Koul 2022-02-21  624  		}
d8703554f4dea9 Vinod Koul 2022-02-21  625  =

d8703554f4dea9 Vinod Koul 2022-02-21 @626  		geni_i2c_gpi_unmap(gi2c, &msgs=
[i], tx_buf, tx_addr, rx_buf, rx_addr);
d8703554f4dea9 Vinod Koul 2022-02-21  627  	}
d8703554f4dea9 Vinod Koul 2022-02-21  628  =

d8703554f4dea9 Vinod Koul 2022-02-21  629  	return num;
d8703554f4dea9 Vinod Koul 2022-02-21  630  =

d8703554f4dea9 Vinod Koul 2022-02-21  631  err:
d8703554f4dea9 Vinod Koul 2022-02-21  632  	dev_err(gi2c->se.dev, "GPI tran=
sfer failed: %d\n", ret);
d8703554f4dea9 Vinod Koul 2022-02-21  633  	dmaengine_terminate_sync(gi2c->=
rx_c);
d8703554f4dea9 Vinod Koul 2022-02-21  634  	dmaengine_terminate_sync(gi2c->=
tx_c);
d8703554f4dea9 Vinod Koul 2022-02-21 @635  	geni_i2c_gpi_unmap(gi2c, &msgs[=
i], tx_buf, tx_addr, rx_buf, rx_addr);
d8703554f4dea9 Vinod Koul 2022-02-21  636  	return ret;
d8703554f4dea9 Vinod Koul 2022-02-21  637  }
d8703554f4dea9 Vinod Koul 2022-02-21  638  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5585939594273141605==--

