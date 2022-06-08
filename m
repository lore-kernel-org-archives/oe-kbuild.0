Content-Type: multipart/mixed; boundary="===============4605766929542099999=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sashal-stable:pending-5.10 370/373] drivers/i2c/busses/i2c-npcm7xx.c:1749:10: warning: Redundant initialization for 'status'. The initialized value is overwritten before it is read. [redundantInitialization]
Date: Wed, 08 Jun 2022 13:31:10 +0800
Message-ID: <202206081344.aAsuDANI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4605766929542099999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/i=
2c/busses/i2c-npcm7xx.c:1749:10: warning: Redundant initialization for 'sta=
tus'. The initialized value is overwritten before it is read. [redundantIni=
tialization]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git pending-5.10
head:   6d2c86b375e6eb49f508f3f8efe7ec77e33632f4
commit: c009b2220e563462677477b8e90edc17672e631c [370/373] i2c: npcm: Handl=
e spurious interrupts
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: alpha-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c009b2220e563462677477b8e90edc17672e631c
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/platform/chrome/cros_ec_proto.c:686:26: warning: Local variable =
'msg' shadows outer variable [shadowVariable]
     struct cros_ec_command msg;
                            ^
   drivers/platform/chrome/cros_ec_proto.c:686:26: note: Shadowed declarati=
on
     struct cros_ec_command msg;
                            ^
   drivers/platform/chrome/cros_ec_proto.c:686:26: note: Shadow variable
     struct cros_ec_command msg;
                            ^
>> drivers/platform/chrome/cros_ec_proto.c:687:40: warning: Local variable =
'event' shadows outer variable [shadowVariable]
     struct ec_response_get_next_event_v1 event;
                                          ^
   drivers/platform/chrome/cros_ec_proto.c:687:40: note: Shadowed declarati=
on
     struct ec_response_get_next_event_v1 event;
                                          ^
   drivers/platform/chrome/cros_ec_proto.c:687:40: note: Shadow variable
     struct ec_response_get_next_event_v1 event;
                                          ^
>> drivers/platform/chrome/cros_ec.c:94:26: warning: Local variable 'msg' s=
hadows outer variable [shadowVariable]
     struct cros_ec_command msg;
                            ^
   drivers/platform/chrome/cros_ec.c:94:26: note: Shadowed declaration
     struct cros_ec_command msg;
                            ^
   drivers/platform/chrome/cros_ec.c:94:26: note: Shadow variable
     struct cros_ec_command msg;
                            ^
>> drivers/platform/chrome/cros_ec.c:99:5: warning: Local variable 'u' shad=
ows outer variable [shadowVariable]
     } u;
       ^
   drivers/platform/chrome/cros_ec.c:99:5: note: Shadowed declaration
     } u;
       ^
   drivers/platform/chrome/cros_ec.c:99:5: note: Shadow variable
     } u;
       ^
--
>> drivers/soc/qcom/smsm.c:356:2: warning: %d in format string (no. 1) requ=
ires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_s=
int]
    snprintf(key, sizeof(key), "qcom,ipc-%d", host_id);
    ^
--

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/platform/chrome/cros_ec_proto.c:664:49: warning: Parameter 'even=
t' can be declared with const [constParameter]
             struct ec_response_get_next_event_v1 *event,
                                                   ^
--
>> drivers/pci/controller/dwc/pcie-designware-host.c:598:27: warning: Possi=
ble null pointer dereference: entry [nullPointer]
          PCIE_ATU_TYPE_MEM, entry->res->start,
                             ^
   drivers/pci/controller/dwc/pcie-designware-host.c:590:40: note: Assignme=
nt 'entry=3DNULL', assigned value is 0
     struct resource_entry *tmp, *entry =3D NULL;
                                          ^
   drivers/pci/controller/dwc/pcie-designware-host.c:594:32: note: Assuming=
 condition is false
      if (resource_type(tmp->res) =3D=3D IORESOURCE_MEM)
                                  ^
   drivers/pci/controller/dwc/pcie-designware-host.c:598:27: note: Null poi=
nter dereference
          PCIE_ATU_TYPE_MEM, entry->res->start,
                             ^
   drivers/pci/controller/dwc/pcie-designware-host.c:599:8: warning: Possib=
le null pointer dereference: entry [nullPointer]
          entry->res->start - entry->offset,
          ^
   drivers/pci/controller/dwc/pcie-designware-host.c:590:40: note: Assignme=
nt 'entry=3DNULL', assigned value is 0
     struct resource_entry *tmp, *entry =3D NULL;
                                          ^
   drivers/pci/controller/dwc/pcie-designware-host.c:594:32: note: Assuming=
 condition is false
      if (resource_type(tmp->res) =3D=3D IORESOURCE_MEM)
                                  ^
   drivers/pci/controller/dwc/pcie-designware-host.c:599:8: note: Null poin=
ter dereference
          entry->res->start - entry->offset,
          ^
   drivers/pci/controller/dwc/pcie-designware-host.c:600:22: warning: Possi=
ble null pointer dereference: entry [nullPointer]
          resource_size(entry->res));
                        ^
   drivers/pci/controller/dwc/pcie-designware-host.c:590:40: note: Assignme=
nt 'entry=3DNULL', assigned value is 0
     struct resource_entry *tmp, *entry =3D NULL;
                                          ^
   drivers/pci/controller/dwc/pcie-designware-host.c:594:32: note: Assuming=
 condition is false
      if (resource_type(tmp->res) =3D=3D IORESOURCE_MEM)
                                  ^
   drivers/pci/controller/dwc/pcie-designware-host.c:600:22: note: Null poi=
nter dereference
          resource_size(entry->res));
                        ^
>> drivers/i2c/busses/i2c-npcm7xx.c:1749:10: warning: Redundant initializat=
ion for 'status'. The initialized value is overwritten before it is read. [=
redundantInitialization]
     status =3D 0;
            ^
   drivers/i2c/busses/i2c-npcm7xx.c:1686:26: note: status is initialized
    int              status =3D -ENOTRECOVERABLE;
                            ^
   drivers/i2c/busses/i2c-npcm7xx.c:1749:10: note: status is overwritten
     status =3D 0;
            ^

vim +/status +1749 drivers/i2c/busses/i2c-npcm7xx.c

56a1485b102ed1 Tali Perry 2020-05-27  1679  =

56a1485b102ed1 Tali Perry 2020-05-27  1680  /* recovery using TGCLK functio=
nality of the module */
56a1485b102ed1 Tali Perry 2020-05-27  1681  static int npcm_i2c_recovery_tg=
clk(struct i2c_adapter *_adap)
56a1485b102ed1 Tali Perry 2020-05-27  1682  {
56a1485b102ed1 Tali Perry 2020-05-27  1683  	u8               val;
56a1485b102ed1 Tali Perry 2020-05-27  1684  	u8               fif_cts;
56a1485b102ed1 Tali Perry 2020-05-27  1685  	bool             done =3D fals=
e;
56a1485b102ed1 Tali Perry 2020-05-27  1686  	int              status =3D -E=
NOTRECOVERABLE;
56a1485b102ed1 Tali Perry 2020-05-27  1687  	struct npcm_i2c *bus =3D conta=
iner_of(_adap, struct npcm_i2c, adap);
56a1485b102ed1 Tali Perry 2020-05-27  1688  	/* Allow 3 bytes (27 toggles) =
to be read from the slave: */
56a1485b102ed1 Tali Perry 2020-05-27  1689  	int              iter =3D 27;
56a1485b102ed1 Tali Perry 2020-05-27  1690  =

56a1485b102ed1 Tali Perry 2020-05-27  1691  	if ((npcm_i2c_get_SDA(_adap) =
=3D=3D 1) && (npcm_i2c_get_SCL(_adap) =3D=3D 1)) {
c009b2220e5634 Tali Perry 2022-05-17  1692  		dev_dbg(bus->dev, "bus%d-0x%x=
 recovery skipped, bus not stuck",
c009b2220e5634 Tali Perry 2022-05-17  1693  			bus->num, bus->dest_addr);
56a1485b102ed1 Tali Perry 2020-05-27  1694  		npcm_i2c_reset(bus);
c009b2220e5634 Tali Perry 2022-05-17  1695  		return 0;
56a1485b102ed1 Tali Perry 2020-05-27  1696  	}
56a1485b102ed1 Tali Perry 2020-05-27  1697  =

56a1485b102ed1 Tali Perry 2020-05-27  1698  	npcm_i2c_int_enable(bus, false=
);
56a1485b102ed1 Tali Perry 2020-05-27  1699  	npcm_i2c_disable(bus);
56a1485b102ed1 Tali Perry 2020-05-27  1700  	npcm_i2c_enable(bus);
56a1485b102ed1 Tali Perry 2020-05-27  1701  	iowrite8(NPCM_I2CCST_BB, bus->=
reg + NPCM_I2CCST);
56a1485b102ed1 Tali Perry 2020-05-27  1702  	npcm_i2c_clear_tx_fifo(bus);
56a1485b102ed1 Tali Perry 2020-05-27  1703  	npcm_i2c_clear_rx_fifo(bus);
56a1485b102ed1 Tali Perry 2020-05-27  1704  	iowrite8(0, bus->reg + NPCM_I2=
CRXF_CTL);
56a1485b102ed1 Tali Perry 2020-05-27  1705  	iowrite8(0, bus->reg + NPCM_I2=
CTXF_CTL);
56a1485b102ed1 Tali Perry 2020-05-27  1706  	npcm_i2c_stall_after_start(bus=
, false);
56a1485b102ed1 Tali Perry 2020-05-27  1707  =

56a1485b102ed1 Tali Perry 2020-05-27  1708  	/* select bank 1 for FIFO regs=
 */
56a1485b102ed1 Tali Perry 2020-05-27  1709  	npcm_i2c_select_bank(bus, I2C_=
BANK_1);
56a1485b102ed1 Tali Perry 2020-05-27  1710  =

56a1485b102ed1 Tali Perry 2020-05-27  1711  	/* clear FIFO and relevant sta=
tus bits. */
56a1485b102ed1 Tali Perry 2020-05-27  1712  	fif_cts =3D ioread8(bus->reg +=
 NPCM_I2CFIF_CTS);
56a1485b102ed1 Tali Perry 2020-05-27  1713  	fif_cts &=3D ~NPCM_I2CFIF_CTS_=
SLVRSTR;
56a1485b102ed1 Tali Perry 2020-05-27  1714  	fif_cts |=3D NPCM_I2CFIF_CTS_C=
LR_FIFO;
56a1485b102ed1 Tali Perry 2020-05-27  1715  	iowrite8(fif_cts, bus->reg + N=
PCM_I2CFIF_CTS);
56a1485b102ed1 Tali Perry 2020-05-27  1716  	npcm_i2c_set_fifo(bus, -1, 0);
56a1485b102ed1 Tali Perry 2020-05-27  1717  =

56a1485b102ed1 Tali Perry 2020-05-27  1718  	/* Repeat the following sequen=
ce until SDA is released */
56a1485b102ed1 Tali Perry 2020-05-27  1719  	do {
56a1485b102ed1 Tali Perry 2020-05-27  1720  		/* Issue a single SCL toggle =
*/
56a1485b102ed1 Tali Perry 2020-05-27  1721  		iowrite8(NPCM_I2CCST_TGSCL, b=
us->reg + NPCM_I2CCST);
56a1485b102ed1 Tali Perry 2020-05-27  1722  		usleep_range(20, 30);
56a1485b102ed1 Tali Perry 2020-05-27  1723  		/* If SDA line is inactive (h=
igh), stop */
56a1485b102ed1 Tali Perry 2020-05-27  1724  		if (npcm_i2c_get_SDA(_adap)) {
56a1485b102ed1 Tali Perry 2020-05-27  1725  			done =3D true;
56a1485b102ed1 Tali Perry 2020-05-27  1726  			status =3D 0;
56a1485b102ed1 Tali Perry 2020-05-27  1727  		}
56a1485b102ed1 Tali Perry 2020-05-27  1728  	} while (!done && iter--);
56a1485b102ed1 Tali Perry 2020-05-27  1729  =

56a1485b102ed1 Tali Perry 2020-05-27  1730  	/* If SDA line is released: se=
nd start-addr-stop, to re-sync. */
56a1485b102ed1 Tali Perry 2020-05-27  1731  	if (npcm_i2c_get_SDA(_adap)) {
56a1485b102ed1 Tali Perry 2020-05-27  1732  		/* Send an address byte in wr=
ite direction: */
56a1485b102ed1 Tali Perry 2020-05-27  1733  		npcm_i2c_wr_byte(bus, bus->de=
st_addr);
56a1485b102ed1 Tali Perry 2020-05-27  1734  		npcm_i2c_master_start(bus);
56a1485b102ed1 Tali Perry 2020-05-27  1735  		/* Wait until START condition=
 is sent */
56a1485b102ed1 Tali Perry 2020-05-27  1736  		status =3D readx_poll_timeout=
(npcm_i2c_get_SCL, _adap, val, !val,
56a1485b102ed1 Tali Perry 2020-05-27  1737  					    20, 200);
56a1485b102ed1 Tali Perry 2020-05-27  1738  		/* If START condition was sen=
t */
56a1485b102ed1 Tali Perry 2020-05-27  1739  		if (npcm_i2c_is_master(bus) >=
 0) {
56a1485b102ed1 Tali Perry 2020-05-27  1740  			usleep_range(20, 30);
56a1485b102ed1 Tali Perry 2020-05-27  1741  			npcm_i2c_master_stop(bus);
56a1485b102ed1 Tali Perry 2020-05-27  1742  			usleep_range(200, 500);
56a1485b102ed1 Tali Perry 2020-05-27  1743  		}
56a1485b102ed1 Tali Perry 2020-05-27  1744  	}
56a1485b102ed1 Tali Perry 2020-05-27  1745  	npcm_i2c_reset(bus);
56a1485b102ed1 Tali Perry 2020-05-27  1746  	npcm_i2c_int_enable(bus, true);
56a1485b102ed1 Tali Perry 2020-05-27  1747  =

56a1485b102ed1 Tali Perry 2020-05-27  1748  	if ((npcm_i2c_get_SDA(_adap) =
=3D=3D 1) && (npcm_i2c_get_SCL(_adap) =3D=3D 1))
56a1485b102ed1 Tali Perry 2020-05-27 @1749  		status =3D 0;
56a1485b102ed1 Tali Perry 2020-05-27  1750  	else
56a1485b102ed1 Tali Perry 2020-05-27  1751  		status =3D -ENOTRECOVERABLE;
56a1485b102ed1 Tali Perry 2020-05-27  1752  	if (status) {
56a1485b102ed1 Tali Perry 2020-05-27  1753  		if (bus->rec_fail_cnt < ULLON=
G_MAX)
56a1485b102ed1 Tali Perry 2020-05-27  1754  			bus->rec_fail_cnt++;
56a1485b102ed1 Tali Perry 2020-05-27  1755  	} else {
56a1485b102ed1 Tali Perry 2020-05-27  1756  		if (bus->rec_succ_cnt < ULLON=
G_MAX)
56a1485b102ed1 Tali Perry 2020-05-27  1757  			bus->rec_succ_cnt++;
56a1485b102ed1 Tali Perry 2020-05-27  1758  	}
56a1485b102ed1 Tali Perry 2020-05-27  1759  	return status;
56a1485b102ed1 Tali Perry 2020-05-27  1760  }
56a1485b102ed1 Tali Perry 2020-05-27  1761  =


:::::: The code at line 1749 was first introduced by commit
:::::: 56a1485b102ed1cd5a4af8e87ed794699fd1cad2 i2c: npcm7xx: Add Nuvoton N=
PCM I2C controller driver

:::::: TO: Tali Perry <tali.perry1@gmail.com>
:::::: CC: Wolfram Sang <wsa@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4605766929542099999==--

