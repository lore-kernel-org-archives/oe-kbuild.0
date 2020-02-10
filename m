Content-Type: multipart/mixed; boundary="===============3693918405087135295=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [mkl-can-next:v5.4/mcp25xxfd 5/99] drivers/net/can/spi/mcp25xxfd/mcp25xxfd-core.c:1305 mcp25xxfd_irq() warn: ignoring unreachable code.
Date: Mon, 10 Feb 2020 10:42:27 +0300
Message-ID: <20200210074227.GR24804@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3693918405087135295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.=
git v5.4/mcp25xxfd
head:   cdcc21e4acc1a753bc4fb151b938ba292ecf686b
commit: 6499ad52b2ad766769d55b8d59df0d36db848e95 [5/99] can: mcp25xxfd: ini=
tial commit

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/can/spi/mcp25xxfd/mcp25xxfd-core.c:1305 mcp25xxfd_irq() warn: i=
gnoring unreachable code.

Old smatch warnings:
drivers/net/can/spi/mcp25xxfd/mcp25xxfd-core.c:1667 mcp25xxfd_probe() warn:=
 passing zero to 'PTR_ERR'
drivers/net/can/spi/mcp25xxfd/mcp25xxfd-core.c:1675 mcp25xxfd_probe() warn:=
 passing zero to 'PTR_ERR'

# https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git/co=
mmit/?id=3D6499ad52b2ad766769d55b8d59df0d36db848e95
git remote add mkl-can-next https://git.kernel.org/pub/scm/linux/kernel/git=
/mkl/linux-can-next.git
git remote update mkl-can-next
git checkout 6499ad52b2ad766769d55b8d59df0d36db848e95
vim +1305 drivers/net/can/spi/mcp25xxfd/mcp25xxfd-core.c

6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1280  =

6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1281  		if (IS_ENABLED(CONFIG_=
CAN_MCP25XXFD_DEBUG) &&
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1282  		    intf_pending & ~(M=
CP25XXFD_CAN_INT_MODIF |
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1283  				     MCP25XXFD_CAN_I=
NT_TEFIF |
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1284  				     MCP25XXFD_CAN_I=
NT_RXIF |
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1285  				     MCP25XXFD_CAN_I=
NT_SERRIF |
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1286  				     MCP25XXFD_CAN_I=
NT_IVMIF)) {
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1287  			netdev_err(priv->ndev=
, "%s: intf_pending=3D0x%04x\n",
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1288  				   __func__, intf_pe=
nding);
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1289  			mcp25xxfd_dump(priv);
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1290  		}
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1291  =

6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1292  		/* ACK interrupts that=
 need to be ACKed in the
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1293  		 * MCP25XXFD_CAN_INT r=
egister.
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1294  		 */
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1295  		intf_pending_clearable=
 =3D intf_pending &
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1296  			MCP25XXFD_CAN_INT_INT=
ERRUPT_CLEARABLE;
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1297  		if (intf_pending_clear=
able) {
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1298  			err =3D regmap_update=
_bits(priv->map, MCP25XXFD_CAN_INT,
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1299  						 intf_pending_clea=
rable, 0x0);
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1300  			if (err)
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1301  				goto out_fail;
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1302  		}
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1303  	} while (1);
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1304  =

6499ad52b2ad76 Marc Kleine-Budde 2019-10-14 @1305  	return handled;

I guess the while (1) loop has no breaks.

6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1306  =

6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1307   out_fail:
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1308  	mcp25xxfd_dump(priv);
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1309  	mcp25xxfd_chip_interrup=
ts_disable(priv);
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1310  =

6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1311  	return handled;
6499ad52b2ad76 Marc Kleine-Budde 2019-10-14  1312  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3693918405087135295==--

