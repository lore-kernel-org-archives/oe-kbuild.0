Content-Type: multipart/mixed; boundary="===============7496485127893745540=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/chrome/cros_ec_lpc.c:382 cros_ec_lpc_probe() warn: consider using resource_size() here
Date: Thu, 11 Aug 2022 03:30:44 +0800
Message-ID: <202208110349.IluaEBSD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7496485127893745540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Dustin L. Howett" <dustin@howett.net>
CC: "Tzung-Bi Shih" <tzungbi@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f41445645ab5d172e6090d00c332c335d8dba337
commit: c9bc1a0ef9f613a7bc1adfff4c67dc5e5d7d1709 platform/chrome: cros_ec_l=
pcs: reserve the MEC LPC I/O ports first
date:   3 months ago
:::::: branch date: 53 minutes ago
:::::: commit date: 3 months ago
config: i386-randconfig-m021-20220808 (https://download.01.org/0day-ci/arch=
ive/20220811/202208110349.IluaEBSD-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/platform/chrome/cros_ec_lpc.c:382 cros_ec_lpc_probe() warn: conside=
r using resource_size() here

vim +382 drivers/platform/chrome/cros_ec_lpc.c

a6df7798d03b29 Gwendal Grignou        2017-05-16  334  =

ec2f33ab582bf6 Bill Richardson        2015-02-02  335  static int cros_ec_l=
pc_probe(struct platform_device *pdev)
ec2f33ab582bf6 Bill Richardson        2015-02-02  336  {
ec2f33ab582bf6 Bill Richardson        2015-02-02  337  	struct device *dev =
=3D &pdev->dev;
a6df7798d03b29 Gwendal Grignou        2017-05-16  338  	struct acpi_device =
*adev;
a6df7798d03b29 Gwendal Grignou        2017-05-16  339  	acpi_status status;
ec2f33ab582bf6 Bill Richardson        2015-02-02  340  	struct cros_ec_devi=
ce *ec_dev;
bce70fef727924 Shawn Nematbakhsh      2017-05-16  341  	u8 buf[2];
da1cf5a1cf124f Enrico Granata         2018-10-09  342  	int irq, ret;
ec2f33ab582bf6 Bill Richardson        2015-02-02  343  =

c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  344  	/*
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  345  	 * The Framework La=
ptop (and possibly other non-ChromeOS devices)
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  346  	 * only exposes the=
 eight I/O ports that are required for the Microchip EC.
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  347  	 * Requesting a lar=
ger reservation will fail.
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  348  	 */
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  349  	if (!devm_request_r=
egion(dev, EC_HOST_CMD_REGION0,
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  350  				 EC_HOST_CMD_MEC=
_REGION_SIZE, dev_name(dev))) {
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  351  		dev_err(dev, "coul=
dn't reserve MEC region\n");
ec2f33ab582bf6 Bill Richardson        2015-02-02  352  		return -EBUSY;
ec2f33ab582bf6 Bill Richardson        2015-02-02  353  	}
ec2f33ab582bf6 Bill Richardson        2015-02-02  354  =

22c040fa21b604 Enric Balletbo i Serra 2019-06-14  355  	/*
22c040fa21b604 Enric Balletbo i Serra 2019-06-14  356  	 * Read the mapped =
ID twice, the first one is assuming the
22c040fa21b604 Enric Balletbo i Serra 2019-06-14  357  	 * EC is a Microchi=
p Embedded Controller (MEC) variant, if the
22c040fa21b604 Enric Balletbo i Serra 2019-06-14  358  	 * protocol fails, =
fallback to the non MEC variant and try to
22c040fa21b604 Enric Balletbo i Serra 2019-06-14  359  	 * read again the I=
D.
22c040fa21b604 Enric Balletbo i Serra 2019-06-14  360  	 */
22c040fa21b604 Enric Balletbo i Serra 2019-06-14  361  	cros_ec_lpc_ops.rea=
d =3D cros_ec_lpc_mec_read_bytes;
22c040fa21b604 Enric Balletbo i Serra 2019-06-14  362  	cros_ec_lpc_ops.wri=
te =3D cros_ec_lpc_mec_write_bytes;
22c040fa21b604 Enric Balletbo i Serra 2019-06-14  363  	cros_ec_lpc_ops.rea=
d(EC_LPC_ADDR_MEMMAP + EC_MEMMAP_ID, 2, buf);
22c040fa21b604 Enric Balletbo i Serra 2019-06-14  364  	if (buf[0] !=3D 'E'=
 || buf[1] !=3D 'C') {
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  365  		if (!devm_request_=
region(dev, EC_LPC_ADDR_MEMMAP, EC_MEMMAP_SIZE,
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  366  					 dev_name(dev))=
) {
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  367  			dev_err(dev, "cou=
ldn't reserve memmap region\n");
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  368  			return -EBUSY;
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  369  		}
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  370  =

22c040fa21b604 Enric Balletbo i Serra 2019-06-14  371  		/* Re-assign read/=
write operations for the non MEC variant */
22c040fa21b604 Enric Balletbo i Serra 2019-06-14  372  		cros_ec_lpc_ops.re=
ad =3D cros_ec_lpc_read_bytes;
22c040fa21b604 Enric Balletbo i Serra 2019-06-14  373  		cros_ec_lpc_ops.wr=
ite =3D cros_ec_lpc_write_bytes;
22c040fa21b604 Enric Balletbo i Serra 2019-06-14  374  		cros_ec_lpc_ops.re=
ad(EC_LPC_ADDR_MEMMAP + EC_MEMMAP_ID, 2,
22c040fa21b604 Enric Balletbo i Serra 2019-06-14  375  				     buf);
bce70fef727924 Shawn Nematbakhsh      2017-05-16  376  		if (buf[0] !=3D 'E=
' || buf[1] !=3D 'C') {
ec2f33ab582bf6 Bill Richardson        2015-02-02  377  			dev_err(dev, "EC =
ID not detected\n");
ec2f33ab582bf6 Bill Richardson        2015-02-02  378  			return -ENODEV;
ec2f33ab582bf6 Bill Richardson        2015-02-02  379  		}
ec2f33ab582bf6 Bill Richardson        2015-02-02  380  =

c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  381  		/* Reserve the rem=
aining I/O ports required by the non-MEC protocol. */
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17 @382  		if (!devm_request_=
region(dev, EC_HOST_CMD_REGION0 + EC_HOST_CMD_MEC_REGION_SIZE,
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  383  					 EC_HOST_CMD_RE=
GION_SIZE - EC_HOST_CMD_MEC_REGION_SIZE,
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  384  					 dev_name(dev))=
) {
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  385  			dev_err(dev, "cou=
ldn't reserve remainder of region0\n");
ec2f33ab582bf6 Bill Richardson        2015-02-02  386  			return -EBUSY;
ec2f33ab582bf6 Bill Richardson        2015-02-02  387  		}
ec2f33ab582bf6 Bill Richardson        2015-02-02  388  		if (!devm_request_=
region(dev, EC_HOST_CMD_REGION1,
ec2f33ab582bf6 Bill Richardson        2015-02-02  389  					 EC_HOST_CMD_RE=
GION_SIZE, dev_name(dev))) {
ec2f33ab582bf6 Bill Richardson        2015-02-02  390  			dev_err(dev, "cou=
ldn't reserve region1\n");
ec2f33ab582bf6 Bill Richardson        2015-02-02  391  			return -EBUSY;
ec2f33ab582bf6 Bill Richardson        2015-02-02  392  		}
c9bc1a0ef9f613 Dustin L. Howett       2022-02-17  393  	}
ec2f33ab582bf6 Bill Richardson        2015-02-02  394  =

ec2f33ab582bf6 Bill Richardson        2015-02-02  395  	ec_dev =3D devm_kza=
lloc(dev, sizeof(*ec_dev), GFP_KERNEL);
ec2f33ab582bf6 Bill Richardson        2015-02-02  396  	if (!ec_dev)
ec2f33ab582bf6 Bill Richardson        2015-02-02  397  		return -ENOMEM;
ec2f33ab582bf6 Bill Richardson        2015-02-02  398  =

ec2f33ab582bf6 Bill Richardson        2015-02-02  399  	platform_set_drvdat=
a(pdev, ec_dev);
ec2f33ab582bf6 Bill Richardson        2015-02-02  400  	ec_dev->dev =3D dev;
ec2f33ab582bf6 Bill Richardson        2015-02-02  401  	ec_dev->phys_name =
=3D dev_name(dev);
ec2f33ab582bf6 Bill Richardson        2015-02-02  402  	ec_dev->cmd_xfer =
=3D cros_ec_cmd_xfer_lpc;
d365407079d331 Stephen Barber         2015-06-09  403  	ec_dev->pkt_xfer =
=3D cros_ec_pkt_xfer_lpc;
ec2f33ab582bf6 Bill Richardson        2015-02-02  404  	ec_dev->cmd_readmem=
 =3D cros_ec_lpc_readmem;
2c7589af3c4dee Stephen Barber         2015-06-09  405  	ec_dev->din_size =
=3D sizeof(struct ec_host_response) +
2c7589af3c4dee Stephen Barber         2015-06-09  406  			   sizeof(struct =
ec_response_get_protocol_info);
2c7589af3c4dee Stephen Barber         2015-06-09  407  	ec_dev->dout_size =
=3D sizeof(struct ec_host_request);
ec2f33ab582bf6 Bill Richardson        2015-02-02  408  =

da1cf5a1cf124f Enrico Granata         2018-10-09  409  	/*
da1cf5a1cf124f Enrico Granata         2018-10-09  410  	 * Some boards do n=
ot have an IRQ allotted for cros_ec_lpc,
da1cf5a1cf124f Enrico Granata         2018-10-09  411  	 * which makes ENXI=
O an expected (and safe) scenario.
da1cf5a1cf124f Enrico Granata         2018-10-09  412  	 */
a69b4eebe513b8 Enric Balletbo i Serra 2019-11-29  413  	irq =3D platform_ge=
t_irq_optional(pdev, 0);
da1cf5a1cf124f Enrico Granata         2018-10-09  414  	if (irq > 0)
da1cf5a1cf124f Enrico Granata         2018-10-09  415  		ec_dev->irq =3D ir=
q;
da1cf5a1cf124f Enrico Granata         2018-10-09  416  	else if (irq !=3D -=
ENXIO) {
da1cf5a1cf124f Enrico Granata         2018-10-09  417  		dev_err(dev, "coul=
dn't retrieve IRQ number (%d)\n", irq);
da1cf5a1cf124f Enrico Granata         2018-10-09  418  		return irq;
da1cf5a1cf124f Enrico Granata         2018-10-09  419  	}
da1cf5a1cf124f Enrico Granata         2018-10-09  420  =

ec2f33ab582bf6 Bill Richardson        2015-02-02  421  	ret =3D cros_ec_reg=
ister(ec_dev);
ec2f33ab582bf6 Bill Richardson        2015-02-02  422  	if (ret) {
ec2f33ab582bf6 Bill Richardson        2015-02-02  423  		dev_err(dev, "coul=
dn't register ec_dev (%d)\n", ret);
ec2f33ab582bf6 Bill Richardson        2015-02-02  424  		return ret;
ec2f33ab582bf6 Bill Richardson        2015-02-02  425  	}
ec2f33ab582bf6 Bill Richardson        2015-02-02  426  =

a6df7798d03b29 Gwendal Grignou        2017-05-16  427  	/*
a6df7798d03b29 Gwendal Grignou        2017-05-16  428  	 * Connect a notify=
 handler to process MKBP messages if we have a
a6df7798d03b29 Gwendal Grignou        2017-05-16  429  	 * companion ACPI d=
evice.
a6df7798d03b29 Gwendal Grignou        2017-05-16  430  	 */
a6df7798d03b29 Gwendal Grignou        2017-05-16  431  	adev =3D ACPI_COMPA=
NION(dev);
a6df7798d03b29 Gwendal Grignou        2017-05-16  432  	if (adev) {
a6df7798d03b29 Gwendal Grignou        2017-05-16  433  		status =3D acpi_in=
stall_notify_handler(adev->handle,
a6df7798d03b29 Gwendal Grignou        2017-05-16  434  						     ACPI_ALL_=
NOTIFY,
a6df7798d03b29 Gwendal Grignou        2017-05-16  435  						     cros_ec_l=
pc_acpi_notify,
a6df7798d03b29 Gwendal Grignou        2017-05-16  436  						     ec_dev);
a6df7798d03b29 Gwendal Grignou        2017-05-16  437  		if (ACPI_FAILURE(s=
tatus))
a6df7798d03b29 Gwendal Grignou        2017-05-16  438  			dev_warn(dev, "Fa=
iled to register notifier %08x\n",
a6df7798d03b29 Gwendal Grignou        2017-05-16  439  				 status);
a6df7798d03b29 Gwendal Grignou        2017-05-16  440  	}
a6df7798d03b29 Gwendal Grignou        2017-05-16  441  =

ec2f33ab582bf6 Bill Richardson        2015-02-02  442  	return 0;
ec2f33ab582bf6 Bill Richardson        2015-02-02  443  }
ec2f33ab582bf6 Bill Richardson        2015-02-02  444  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7496485127893745540==--

