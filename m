Content-Type: multipart/mixed; boundary="===============4827361557508775412=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/asix/ax88796c_main.c:50:5: warning: Uninitialized variable: ret [uninitvar]
Date: Mon, 31 Jan 2022 06:28:07 +0800
Message-ID: <202201310436.TlACp6gK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4827361557508775412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "=C5=81ukasz Stelmach" <l.stelmach@samsung.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   24f4db1f3a2725a6308105081d822b26889e1018
commit: a97c69ba4f30e46abb9cc7be8b98227cb468fdf9 net: ax88796c: ASIX AX8879=
6C SPI Ethernet Adapter Driver
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
compiler: alpha-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/intel/e1000/e1000_main.c:284:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    ew32(IMC, ~0);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:285:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    E1000_WRITE_FLUSH();
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:297:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    ew32(IMS, IMS_ENABLE_MASK);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:298:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    E1000_WRITE_FLUSH();
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:334:14: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
     u32 manc =3D er32(MANC);
                ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:339:3: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
     ew32(MANC, manc);
     ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:348:14: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
     u32 manc =3D er32(MANC);
                ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:353:3: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
     ew32(MANC, manc);
     ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:401:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    ew32(ICS, E1000_ICS_LSC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:454:8: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
      if (er32(MANC) & E1000_MANC_SMBUS_EN)
          ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:496:9: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    rctl =3D er32(RCTL);
           ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:497:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    ew32(RCTL, rctl & ~E1000_RCTL_EN);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:503:9: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    tctl =3D er32(TCTL);
           ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:505:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    ew32(TCTL, tctl);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:507:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    E1000_WRITE_FLUSH();
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:603:3: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
     ew32(PBA, pba);
     ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:612:9: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
     pba =3D er32(PBA);
           ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:655:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    ew32(PBA, pba);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:678:3: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
     ew32(WUC, 0);
     ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:688:14: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
     u32 ctrl =3D er32(CTRL);
                ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:694:3: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
     ew32(CTRL, ctrl);
     ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:698:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    ew32(VET, ETHERNET_IEEE_VLAN_TYPE);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1137:7: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
     if (er32(STATUS) & E1000_STATUS_FUNC_1) {
         ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1164:7: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
     if (er32(STATUS) & E1000_STATUS_FUNC_1)
         ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1405:2: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
    ew32(ICS, E1000_ICS_LSC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1641:2: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
    ew32(TIPG, tipg);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1647:3: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
     ew32(TADV, adapter->tx_abs_int_delay);
     ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1651:9: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
    tctl =3D er32(TCTL);
           ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1677:2: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
    ew32(TCTL, tctl);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1788:9: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
    rctl =3D er32(RCTL);
           ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1843:2: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
    ew32(RCTL, rctl);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1871:9: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
    rctl =3D er32(RCTL);
           ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1872:2: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
    ew32(RCTL, rctl & ~E1000_RCTL_EN);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1878:3: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
     ew32(RADV, adapter->rx_abs_int_delay);
--
>> drivers/net/ethernet/intel/e1000/e1000_ethtool.c:123:6: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    if (er32(STATUS) & E1000_STATUS_LU) {
        ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:336:18: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
    regs_buff[0]  =3D er32(CTRL);
                    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:337:18: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
    regs_buff[1]  =3D er32(STATUS);
                    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:339:18: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
    regs_buff[2]  =3D er32(RCTL);
                    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:345:18: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
    regs_buff[7]  =3D er32(TCTL);
                    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:408:19: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
     regs_buff[26] =3D er32(MANC);
                     ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:726:11: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
    before =3D er32(STATUS);
             ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:727:11: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
    value =3D (er32(STATUS) & toggle);
             ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:728:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    ew32(STATUS, toggle);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:729:10: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
    after =3D er32(STATUS) & toggle;
            ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:737:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    ew32(STATUS, before);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:739:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_PATTERN_TEST(FCAL, 0xFFFFFFFF, 0xFFFFFFFF);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:740:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_PATTERN_TEST(FCAH, 0x0000FFFF, 0xFFFFFFFF);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:741:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_PATTERN_TEST(FCT, 0x0000FFFF, 0xFFFFFFFF);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:742:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_PATTERN_TEST(VET, 0x0000FFFF, 0xFFFFFFFF);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:750:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_PATTERN_TEST(FCTTV, 0x0000FFFF, 0x0000FFFF);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:751:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_PATTERN_TEST(TIPG, 0x3FFFFFFF, 0x3FFFFFFF);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:755:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_SET_AND_CHECK(RCTL, 0xFFFFFFFF, 0x00000000);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:758:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_SET_AND_CHECK(RCTL, before, 0x003FFFFB);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:759:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    REG_SET_AND_CHECK(TCTL, 0xFFFFFFFF, 0x00000000);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:762:3: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
     REG_SET_AND_CHECK(RCTL, before, 0xFFFFFFFF);
     ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:764:3: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
     REG_PATTERN_TEST(TXCW, 0xC000FFFF, 0x0000FFFF);
     ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:773:3: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
     REG_SET_AND_CHECK(RCTL, 0xFFFFFFFF, 0x01FFFFFF);
     ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:775:3: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
     REG_PATTERN_TEST(TXCW, 0x0000FFFF, 0x0000FFFF);
     ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:817:23: warning: Same v=
alue in both branches of ternary operator. [duplicateValueTernary]
    adapter->test_icr |=3D er32(ICR);
                         ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:847:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    ew32(IMC, 0xFFFFFFFF);
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:848:2: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    E1000_WRITE_FLUSH();
    ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:864:4: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
      ew32(IMC, mask);
      ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:865:4: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
      ew32(ICS, mask);
      ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:866:4: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
      E1000_WRITE_FLUSH();
      ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:882:3: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
     ew32(IMS, mask);
     ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:883:3: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
     ew32(ICS, mask);
     ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:884:3: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:900:4: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
      ew32(IMC, ~mask & 0x00007FFF);
--
>> drivers/net/ethernet/intel/i40e/i40e_txrx.c:2802:19: warning: union memb=
er 'Anonymous31::ipv6' is never used. [unusedStructMember]
     struct ipv6hdr *ipv6;
                     ^
--
>> drivers/net/ethernet/asix/ax88796c_main.c:50:5: warning: Uninitialized v=
ariable: ret [uninitvar]
       (ret & PSR_DEV_READY),
       ^
   drivers/net/ethernet/asix/ax88796c_main.c:79:5: warning: Uninitialized v=
ariable: ret [uninitvar]
       (ret & PSR_DEV_READY),
       ^

vim +50 drivers/net/ethernet/asix/ax88796c_main.c

a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  38  =

a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  39  static int ax88796c_sof=
t_reset(struct ax88796c_device *ax_local)
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  40  {
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  41  	u16 temp;
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  42  	int ret;
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  43  =

a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  44  	lockdep_assert_held(&a=
x_local->spi_lock);
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  45  =

a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  46  	AX_WRITE(&ax_local->ax=
_spi, PSR_RESET, P0_PSR);
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  47  	AX_WRITE(&ax_local->ax=
_spi, PSR_RESET_CLR, P0_PSR);
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  48  =

a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  49  	ret =3D read_poll_time=
out(AX_READ, ret,
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20 @50  				(ret & PSR_DEV_READ=
Y),
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  51  				0, jiffies_to_usecs=
(160 * HZ / 1000), false,
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  52  				&ax_local->ax_spi, =
P0_PSR);
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  53  	if (ret)
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  54  		return ret;
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  55  =

a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  56  	temp =3D AX_READ(&ax_l=
ocal->ax_spi, P4_SPICR);
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  57  	if (ax_local->priv_fla=
gs & AX_CAP_COMP) {
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  58  		AX_WRITE(&ax_local->a=
x_spi,
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  59  			 (temp | SPICR_RCEN =
| SPICR_QCEN), P4_SPICR);
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  60  		ax_local->ax_spi.comp=
 =3D 1;
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  61  	} else {
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  62  		AX_WRITE(&ax_local->a=
x_spi,
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  63  			 (temp & ~(SPICR_RCE=
N | SPICR_QCEN)), P4_SPICR);
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  64  		ax_local->ax_spi.comp=
 =3D 0;
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  65  	}
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  66  =

a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  67  	return 0;
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  68  }
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  69  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4827361557508775412==--

