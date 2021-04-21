Content-Type: multipart/mixed; boundary="===============7174800901895004677=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mtd/nand/raw/nandsim.c:1792 ns_switch_state() error: we previously assumed 'ns->op' could be null (see line 1714)
Date: Wed, 21 Apr 2021 09:15:27 +0800
Message-ID: <202104210912.mm8Wu526-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7174800901895004677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1fe5501ba1abf2b7e78295df73675423bd6899a0
commit: 88f9f3e89a8ad1594c4d9c599bdf9c904e3976fe mtd: rawnand: nandsim: Use=
 a consistent ns_ prefix for all functions
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-m031-20210420 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mtd/nand/raw/nandsim.c:1792 ns_switch_state() error: we previously =
assumed 'ns->op' could be null (see line 1714)

vim +1792 drivers/mtd/nand/raw/nandsim.c

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1708  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1709  /*
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1710   * Switch simulator's state.
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1711   */
88f9f3e89a8ad1 drivers/mtd/nand/raw/nandsim.c Miquel Raynal    2020-05-25  =
1712  static void ns_switch_state(struct nandsim *ns)
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1713  {
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16 @=
1714  	if (ns->op) {
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1715  		/*
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1716  		 * The current operation have already been identified.
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1717  		 * Just follow the states chain.
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1718  		 */
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1719  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1720  		ns->stateidx +=3D 1;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1721  		ns->state =3D ns->nxstate;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1722  		ns->nxstate =3D ns->op[ns->stateidx + 1];
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1723  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1724  		NS_DBG("switch_state: operation is known, switch to the next state,=
 "
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1725  			"state: %s, nxstate: %s\n",
88f9f3e89a8ad1 drivers/mtd/nand/raw/nandsim.c Miquel Raynal    2020-05-25  =
1726  		       ns_get_state_name(ns->state),
88f9f3e89a8ad1 drivers/mtd/nand/raw/nandsim.c Miquel Raynal    2020-05-25  =
1727  		       ns_get_state_name(ns->nxstate));
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1728  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1729  		/* See, whether we need to do some action */
88f9f3e89a8ad1 drivers/mtd/nand/raw/nandsim.c Miquel Raynal    2020-05-25  =
1730  		if ((ns->state & ACTION_MASK) &&
88f9f3e89a8ad1 drivers/mtd/nand/raw/nandsim.c Miquel Raynal    2020-05-25  =
1731  		    ns_do_state_action(ns, ns->state) < 0) {
88f9f3e89a8ad1 drivers/mtd/nand/raw/nandsim.c Miquel Raynal    2020-05-25  =
1732  			ns_switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1733  			return;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1734  		}
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1735  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1736  	} else {
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1737  		/*
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1738  		 * We don't yet know which operation we perform.
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1739  		 * Try to identify it.
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1740  		 */
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1741  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1742  		/*
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1743  		 *  The only event causing the switch_state function to
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1744  		 *  be called with yet unknown operation is new command.
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1745  		 */
88f9f3e89a8ad1 drivers/mtd/nand/raw/nandsim.c Miquel Raynal    2020-05-25  =
1746  		ns->state =3D ns_get_state_by_command(ns->regs.command);
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1747  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1748  		NS_DBG("switch_state: operation is unknown, try to find it\n");
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1749  =

88f9f3e89a8ad1 drivers/mtd/nand/raw/nandsim.c Miquel Raynal    2020-05-25  =
1750  		if (ns_find_operation(ns, 0) !=3D 0)
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1751  			return;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1752  =

88f9f3e89a8ad1 drivers/mtd/nand/raw/nandsim.c Miquel Raynal    2020-05-25  =
1753  		if ((ns->state & ACTION_MASK) &&
88f9f3e89a8ad1 drivers/mtd/nand/raw/nandsim.c Miquel Raynal    2020-05-25  =
1754  		    ns_do_state_action(ns, ns->state) < 0) {
88f9f3e89a8ad1 drivers/mtd/nand/raw/nandsim.c Miquel Raynal    2020-05-25  =
1755  			ns_switch_to_ready_state(ns, NS_STATUS_FAILED(ns));
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1756  			return;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1757  		}
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1758  	}
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1759  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1760  	/* For 16x devices column means the page offset in words */
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1761  	if ((ns->nxstate & STATE_ADDR_MASK) && ns->busw =3D=3D 16) {
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1762  		NS_DBG("switch_state: double the column number for 16x device\n");
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1763  		ns->regs.column <<=3D 1;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1764  	}
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1765  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1766  	if (NS_STATE(ns->nxstate) =3D=3D STATE_READY) {
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1767  		/*
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1768  		 * The current state is the last. Return to STATE_READY
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1769  		 */
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1770  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1771  		u_char status =3D NS_STATUS_OK(ns);
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1772  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1773  		/* In case of data states, see if all bytes were input/output */
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1774  		if ((ns->state & (STATE_DATAIN_MASK | STATE_DATAOUT_MASK))
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1775  			&& ns->regs.count !=3D ns->regs.num) {
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1776  			NS_WARN("switch_state: not all bytes were processed, %d left\n",
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1777  					ns->regs.num - ns->regs.count);
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1778  			status =3D NS_STATUS_FAILED(ns);
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1779  		}
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1780  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1781  		NS_DBG("switch_state: operation complete, switch to STATE_READY sta=
te\n");
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1782  =

88f9f3e89a8ad1 drivers/mtd/nand/raw/nandsim.c Miquel Raynal    2020-05-25  =
1783  		ns_switch_to_ready_state(ns, status);
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1784  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1785  		return;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1786  	} else if (ns->nxstate & (STATE_DATAIN_MASK | STATE_DATAOUT_MASK)) {
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1787  		/*
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1788  		 * If the next state is data input/output, switch to it now
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1789  		 */
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1790  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1791  		ns->state      =3D ns->nxstate;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16 @=
1792  		ns->nxstate    =3D ns->op[++ns->stateidx + 1];
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1793  		ns->regs.num   =3D ns->regs.count =3D 0;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1794  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1795  		NS_DBG("switch_state: the next state is data I/O, switch, "
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1796  			"state: %s, nxstate: %s\n",
88f9f3e89a8ad1 drivers/mtd/nand/raw/nandsim.c Miquel Raynal    2020-05-25  =
1797  		       ns_get_state_name(ns->state),
88f9f3e89a8ad1 drivers/mtd/nand/raw/nandsim.c Miquel Raynal    2020-05-25  =
1798  		       ns_get_state_name(ns->nxstate));
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1799  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1800  		/*
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1801  		 * Set the internal register to the count of bytes which
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1802  		 * are expected to be input or output
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1803  		 */
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1804  		switch (NS_STATE(ns->state)) {
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1805  			case STATE_DATAIN:
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1806  			case STATE_DATAOUT:
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1807  				ns->regs.num =3D ns->geom.pgszoob - ns->regs.off - ns->regs.colum=
n;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1808  				break;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1809  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1810  			case STATE_DATAOUT_ID:
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1811  				ns->regs.num =3D ns->geom.idbytes;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1812  				break;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1813  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1814  			case STATE_DATAOUT_STATUS:
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1815  				ns->regs.count =3D ns->regs.num =3D 0;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1816  				break;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1817  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1818  			default:
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1819  				NS_ERR("switch_state: BUG! unknown data state\n");
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1820  		}
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1821  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1822  	} else if (ns->nxstate & STATE_ADDR_MASK) {
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1823  		/*
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1824  		 * If the next state is address input, set the internal
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1825  		 * register to the number of expected address bytes
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1826  		 */
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1827  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1828  		ns->regs.count =3D 0;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1829  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1830  		switch (NS_STATE(ns->nxstate)) {
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1831  			case STATE_ADDR_PAGE:
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1832  				ns->regs.num =3D ns->geom.pgaddrbytes;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1833  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1834  				break;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1835  			case STATE_ADDR_SEC:
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1836  				ns->regs.num =3D ns->geom.secaddrbytes;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1837  				break;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1838  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1839  			case STATE_ADDR_ZERO:
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1840  				ns->regs.num =3D 1;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1841  				break;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1842  =

74216be41a61a8 drivers/mtd/nand/nandsim.c     Artem Bityutskiy 2008-07-30  =
1843  			case STATE_ADDR_COLUMN:
74216be41a61a8 drivers/mtd/nand/nandsim.c     Artem Bityutskiy 2008-07-30  =
1844  				/* Column address is always 2 bytes */
74216be41a61a8 drivers/mtd/nand/nandsim.c     Artem Bityutskiy 2008-07-30  =
1845  				ns->regs.num =3D ns->geom.pgaddrbytes - ns->geom.secaddrbytes;
74216be41a61a8 drivers/mtd/nand/nandsim.c     Artem Bityutskiy 2008-07-30  =
1846  				break;
74216be41a61a8 drivers/mtd/nand/nandsim.c     Artem Bityutskiy 2008-07-30  =
1847  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1848  			default:
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1849  				NS_ERR("switch_state: BUG! unknown address state\n");
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1850  		}
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1851  	} else {
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1852  		/*
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1853  		 * Just reset internal counters.
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1854  		 */
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1855  =

^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1856  		ns->regs.num =3D 0;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1857  		ns->regs.count =3D 0;
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1858  	}
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1859  }
^1da177e4c3f41 drivers/mtd/nand/nandsim.c     Linus Torvalds   2005-04-16  =
1860  =


:::::: The code at line 1792 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7174800901895004677==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7174800901895004677==--

