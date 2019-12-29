Content-Type: multipart/mixed; boundary="===============4134189092652574895=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v5 2/2] spi: cadence-quadpsi: Add support for the Cadence QSPI controller
Date: Sun, 29 Dec 2019 20:49:47 +0300
Message-ID: <20191229174947.GB3889@kadam>
In-Reply-To: <20191226071058.20041-3-vadivel.muruganx.ramuthevar@linux.intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4134189092652574895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi "Ramuthevar,Vadivel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on spi/for-next]
[cannot apply to v5.5-rc3 next-20191219]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Ramuthevar-Vadivel-Murugan=
X/spi-cadence-quadpsi-Add-support-for-the-Cadence-QSPI-controller/20191226-=
152805
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for=
-next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/spi/spi-cadence-quadspi.c:412 cqspi_read_execute() warn: if stateme=
nt not indented
drivers/spi/spi-cadence-quadspi.c:1015 cqspi_probe() error: we previously a=
ssumed 'pdata' could be null (see line 1004)

# https://github.com/0day-ci/linux/commit/7d7e98888a40e593dcd442db83b53d929=
80c036f
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 7d7e98888a40e593dcd442db83b53d92980c036f
vim +412 drivers/spi/spi-cadence-quadspi.c

7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  381  static int cqspi=
_read_execute(struct struct_cqspi *cqspi,
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  382  			      const s=
truct spi_mem_op *op, u8 *rxbuf)
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  383  {
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  384  	struct platform=
_device *pdev =3D cqspi->pdev;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  385  	struct cqspi_pl=
atform_data *pdata =3D pdev->dev.platform_data;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  386  	void *reg_base =
=3D cqspi->iobase;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  387  	void *ahb_base =
=3D cqspi->qspi_ahb_virt;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  388  	u32 rxlen =3D o=
p->data.nbytes;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  389  	u8 *rxbuf_end =
=3D rxbuf + rxlen;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  390  	u32 mod_bytes =
=3D rxlen % 4;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  391  	u32 bytes_to_re=
ad =3D 0;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  392  	int remaining =
=3D op->data.nbytes;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  393  	unsigned long t=
imeout;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  394  	int ret;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  395  =

7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  396  	writel(remainin=
g, reg_base + CQSPI_REG_INDIRECTRDBYTES);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  397  =

7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  398  	mb();/* flush p=
revious writes */
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  399  =

7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  400  	writel(pdata->f=
ifo_depth - CQSPI_REG_SRAM_RESV_WORDS,
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  401  	       reg_base=
 + CQSPI_REG_SRAMPARTITION);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  402  	/* Clear all in=
terrupts. */
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  403  	writel(CQSPI_IR=
Q_STATUS_MASK, reg_base + CQSPI_REG_IRQSTATUS);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  404  	writel(CQSPI_IR=
Q_MASK_RD, reg_base + CQSPI_REG_IRQMASK);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  405  =

7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  406  	reinit_completi=
on(&cqspi->transfer_complete);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  407  	writel(CQSPI_RE=
G_INDIRECTRD_START_MASK,
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  408  	       reg_base=
 + CQSPI_REG_INDIRECTRD);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  409  =

7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  410  	timeout =3D mse=
cs_to_jiffies(CQSPI_READ_TIMEOUT_MS);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  411  	while (remainin=
g > 0) {
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26 @412  		if (!wait_for_=
completion_timeout(&cqspi->transfer_complete,
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  413  						 timeout))
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  414  		ret =3D -ETIME=
DOUT;

This should be indented and "return -ETIMEDOUT;" or a break or
something?

7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  415  =

7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  416  		bytes_to_read =
=3D CQSPI_GET_RD_SRAM_LEVEL(reg_base);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  417  =

7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  418  		while (bytes_t=
o_read !=3D 0) {
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  419  			unsigned int =
word_remain =3D round_down(remaining, 4);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  420  =

7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  421  			bytes_to_read=
 *=3D CQSPI_FIFO_WIDTH;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  422  			bytes_to_read=
 =3D bytes_to_read > remaining ?
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  423  						remaining =
: bytes_to_read;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  424  			bytes_to_read=
 =3D round_down(bytes_to_read, 4);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  425  			if (bytes_to_=
read) {
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  426  				ioread32_rep=
(ahb_base, rxbuf,
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  427  					     (bytes=
_to_read / 4));
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  428  			} else if (!w=
ord_remain && mod_bytes) {
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  429  				unsigned int=
 temp =3D ioread32(ahb_base);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  430  =

7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  431  				bytes_to_rea=
d =3D mod_bytes;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  432  				memcpy(rxbuf=
, &temp, min((unsigned int)
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  433  				       (rxbu=
f_end - rxbuf), bytes_to_read));
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  434  			}
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  435  =

7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  436  			rxbuf +=3D by=
tes_to_read;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  437  			remaining -=
=3D bytes_to_read;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  438  			bytes_to_read=
 =3D CQSPI_GET_RD_SRAM_LEVEL(reg_base);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  439  		}
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  440  =

7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  441  		if (remaining =
< 0)
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  442  			reinit_comple=
tion(&cqspi->transfer_complete);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  443  	}
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  444  =

7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  445  	/* Check indire=
ct done status */
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  446  	ret =3D cqspi_w=
ait_for_bit(reg_base + CQSPI_REG_INDIRECTRD,
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  447  				 CQSPI_REG_I=
NDIRECTRD_DONE_MASK, 0);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  448  	if (ret) {
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  449  		dev_err(&pdev-=
>dev,
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  450  			"Indirect rea=
d completion error (%i)\n", ret);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  451  		goto failrd;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  452  	}
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  453  =

7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  454  	/* Disable inte=
rrupt */
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  455  	writel(0, reg_b=
ase + CQSPI_REG_IRQMASK);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  456  	/* Clear indire=
ct completion status */
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  457  	writel(CQSPI_RE=
G_INDIRECTRD_DONE_MASK, reg_base + CQSPI_REG_INDIRECTRD);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  458  =

7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  459  	return 0;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  460  failrd:
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  461  	/* Disable inte=
rrupt */
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  462  	writel(0, reg_b=
ase + CQSPI_REG_IRQMASK);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  463  	/* Cancel the i=
ndirect read */
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  464  	writel(CQSPI_RE=
G_INDIRECTWR_CANCEL_MASK,
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  465  	       reg_base=
 + CQSPI_REG_INDIRECTRD);
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  466  	return ret;
7d7e98888a40e5 Ramuthevar Vadivel Murugan 2019-12-26  467  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============4134189092652574895==--

