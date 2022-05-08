Content-Type: multipart/mixed; boundary="===============1782583744059913810=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9026/9759] drivers/i2c/busses/i2c-at91-master.c:717 at91_twi_xfer() error: uninitialized symbol 'dma_buf'.
Date: Sun, 08 May 2022 19:30:32 +0800
Message-ID: <202205081947.fD7bMIMF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1782583744059913810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Michael Walle <michael@walle.cc>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: 03fbb903c8bf7e53e101e8d9a7b261264317c411 [9026/9759] i2c: at91: use=
 dma safe buffers
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: csky-randconfig-m031-20220508 (https://download.01.org/0day-ci/arch=
ive/20220508/202205081947.fD7bMIMF-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/i2c/busses/i2c-at91-master.c:717 at91_twi_xfer() error: uninitializ=
ed symbol 'dma_buf'.

Old smatch warnings:
drivers/i2c/busses/i2c-at91-master.c:837 at91_init_twi_recovery_gpio() warn=
: passing zero to 'PTR_ERR'

vim +/dma_buf +717 drivers/i2c/busses/i2c-at91-master.c

fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  651  =

fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  652  static int at91_twi_xfer(struct i2c_adapter *adap, struct i2c_msg=
 *msg, int num)
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  653  {
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  654  	struct at91_twi_dev *dev =3D i2c_get_adapdata(adap);
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  655  	int ret;
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  656  	unsigned int_addr_flag =3D 0;
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  657  	struct i2c_msg *m_start =3D msg;
434f14e745442a drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2016-08=
-03  658  	bool is_read;
03fbb903c8bf7e drivers/i2c/busses/i2c-at91-master.c Michael Walle   2022-04=
-07  659  	u8 *dma_buf;
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  660  =

fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  661  	dev_dbg(&adap->dev, "at91_xfer: processing %d messages:\n", num);
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  662  =

d64a818859af3b drivers/i2c/busses/i2c-at91.c        Wenyou Yang     2014-10=
-24  663  	ret =3D pm_runtime_get_sync(dev->dev);
d64a818859af3b drivers/i2c/busses/i2c-at91.c        Wenyou Yang     2014-10=
-24  664  	if (ret < 0)
d64a818859af3b drivers/i2c/busses/i2c-at91.c        Wenyou Yang     2014-10=
-24  665  		goto out;
d64a818859af3b drivers/i2c/busses/i2c-at91.c        Wenyou Yang     2014-10=
-24  666  =

a7405844da1c80 drivers/i2c/busses/i2c-at91.c        Wolfram Sang    2015-01=
-07  667  	if (num =3D=3D 2) {
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  668  		int internal_address =3D 0;
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  669  		int i;
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  670  =

fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  671  		/* 1st msg is put into the internal address, start with 2nd */
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  672  		m_start =3D &msg[1];
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  673  		for (i =3D 0; i < msg->len; ++i) {
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  674  			const unsigned addr =3D msg->buf[msg->len - 1 - i];
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  675  =

fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  676  			internal_address |=3D addr << (8 * i);
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  677  			int_addr_flag +=3D AT91_TWI_IADRSZ_1;
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  678  		}
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  679  		at91_twi_write(dev, AT91_TWI_IADR, internal_address);
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  680  	}
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  681  =

434f14e745442a drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2016-08=
-03  682  	dev->use_alt_cmd =3D false;
0ef6f3213dac48 drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2015-06=
-09  683  	is_read =3D (m_start->flags & I2C_M_RD);
0ef6f3213dac48 drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2015-06=
-09  684  	if (dev->pdata->has_alt_cmd) {
434f14e745442a drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2016-08=
-03  685  		if (m_start->len > 0 &&
434f14e745442a drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2016-08=
-03  686  		    m_start->len < AT91_I2C_MAX_ALT_CMD_DATA_SIZE) {
0ef6f3213dac48 drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2015-06=
-09  687  			at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_ACMEN);
0ef6f3213dac48 drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2015-06=
-09  688  			at91_twi_write(dev, AT91_TWI_ACR,
0ef6f3213dac48 drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2015-06=
-09  689  				       AT91_TWI_ACR_DATAL(m_start->len) |
0ef6f3213dac48 drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2015-06=
-09  690  				       ((is_read) ? AT91_TWI_ACR_DIR : 0));
434f14e745442a drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2016-08=
-03  691  			dev->use_alt_cmd =3D true;
0ef6f3213dac48 drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2015-06=
-09  692  		} else {
0ef6f3213dac48 drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2015-06=
-09  693  			at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_ACMDIS);
0ef6f3213dac48 drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2015-06=
-09  694  		}
0ef6f3213dac48 drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2015-06=
-09  695  	}
0ef6f3213dac48 drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2015-06=
-09  696  =

0ef6f3213dac48 drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2015-06=
-09  697  	at91_twi_write(dev, AT91_TWI_MMR,
0ef6f3213dac48 drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2015-06=
-09  698  		       (m_start->addr << 16) |
0ef6f3213dac48 drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2015-06=
-09  699  		       int_addr_flag |
434f14e745442a drivers/i2c/busses/i2c-at91.c        Cyrille Pitchen 2016-08=
-03  700  		       ((!dev->use_alt_cmd && is_read) ? AT91_TWI_MREAD : 0));
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  701  =

fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  702  	dev->buf_len =3D m_start->len;
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  703  	dev->buf =3D m_start->buf;
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  704  	dev->msg =3D m_start;
75b81f339c6af4 drivers/i2c/busses/i2c-at91.c        Marek Roszko    2014-08=
-20  705  	dev->recv_len_abort =3D false;
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  706  =

03fbb903c8bf7e drivers/i2c/busses/i2c-at91-master.c Michael Walle   2022-04=
-07  707  	if (dev->use_dma) {
03fbb903c8bf7e drivers/i2c/busses/i2c-at91-master.c Michael Walle   2022-04=
-07  708  		dma_buf =3D i2c_get_dma_safe_msg_buf(m_start, 1);
03fbb903c8bf7e drivers/i2c/busses/i2c-at91-master.c Michael Walle   2022-04=
-07  709  		if (!dma_buf) {
03fbb903c8bf7e drivers/i2c/busses/i2c-at91-master.c Michael Walle   2022-04=
-07  710  			ret =3D -ENOMEM;
03fbb903c8bf7e drivers/i2c/busses/i2c-at91-master.c Michael Walle   2022-04=
-07  711  			goto out;
03fbb903c8bf7e drivers/i2c/busses/i2c-at91-master.c Michael Walle   2022-04=
-07  712  		}
03fbb903c8bf7e drivers/i2c/busses/i2c-at91-master.c Michael Walle   2022-04=
-07  713  		dev->buf =3D dma_buf;
03fbb903c8bf7e drivers/i2c/busses/i2c-at91-master.c Michael Walle   2022-04=
-07  714  	}
03fbb903c8bf7e drivers/i2c/busses/i2c-at91-master.c Michael Walle   2022-04=
-07  715  =

fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  716  	ret =3D at91_do_twi_transfer(dev);
03fbb903c8bf7e drivers/i2c/busses/i2c-at91-master.c Michael Walle   2022-04=
-07 @717  	i2c_put_dma_safe_msg_buf(dma_buf, m_start, !ret);
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  718  =

d64a818859af3b drivers/i2c/busses/i2c-at91.c        Wenyou Yang     2014-10=
-24  719  	ret =3D (ret < 0) ? ret : num;
d64a818859af3b drivers/i2c/busses/i2c-at91.c        Wenyou Yang     2014-10=
-24  720  out:
d64a818859af3b drivers/i2c/busses/i2c-at91.c        Wenyou Yang     2014-10=
-24  721  	pm_runtime_mark_last_busy(dev->dev);
d64a818859af3b drivers/i2c/busses/i2c-at91.c        Wenyou Yang     2014-10=
-24  722  	pm_runtime_put_autosuspend(dev->dev);
d64a818859af3b drivers/i2c/busses/i2c-at91.c        Wenyou Yang     2014-10=
-24  723  =

d64a818859af3b drivers/i2c/busses/i2c-at91.c        Wenyou Yang     2014-10=
-24  724  	return ret;
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  725  }
fac368a0404842 drivers/i2c/busses/i2c-at91.c        Nikolaus Voss   2011-11=
-08  726  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1782583744059913810==--

