Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB19F181
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Dec 2023 00:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIKiqu47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702340308; x=1733876308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4dxKasTPXdh4IrnoFkl5sdOK2iAOz9t5JOyM1epTC9s=;
  b=oIKiqu47wfLDt4R3Whfd27Ty6a7NFEmDLjBWjE1+6OqxtxVTyXHGA2fG
   Ff3Lfii5e9P9dtb0t0ovv4UocvmSAylcUMLJ1sh2Ksa4Sfx9qm9KI5Z4j
   NYx6ppdhXBsypUjp8VwF4ObXYSSgs1a+bjwIauTYUc7872ViVM71wfTMC
   L8cBIdEl/i7LYDjf90uvWRnf40TYNbWtGnMdNeIbrPE8bx3YjViWfKPT7
   zkcvN6JN31jaz3nHUuY24s6szGdyGHZtTr+/I69kntad27Q+jON9gIv/a
   xCxbQy/vVfTdtpuUYnEzVFmsBxzOUrxIMyx+GcHsUWqA2vJXTgL7UXd5P
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="13423287"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="13423287"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 16:18:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="749495203"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="749495203"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Dec 2023 16:18:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCqTe-000IbJ-2T;
	Tue, 12 Dec 2023 00:18:22 +0000
Date: Tue, 12 Dec 2023 08:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/hamradio/scc.c:1748 scc_net_siocdevprivate() warn:
 potential spectre issue 'Ivec' [w]
Message-ID: <202312120826.wrConx3j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
commit: 25ec92fbdd23a0a2bfd2bdf489e60ea4f0ae46d1 hamradio: use ndo_siocdevprivate
date:   2 years, 5 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 2 years, 5 months ago
config: i386-randconfig-141-20231111 (https://download.01.org/0day-ci/archive/20231212/202312120826.wrConx3j-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231212/202312120826.wrConx3j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312120826.wrConx3j-lkp@intel.com/

New smatch warnings:
drivers/net/hamradio/scc.c:1748 scc_net_siocdevprivate() warn: potential spectre issue 'Ivec' [w]
drivers/net/hamradio/scc.c:1783 scc_net_siocdevprivate() error: buffer overflow 'SCC_Info' 8 <= s32max
drivers/net/hamradio/scc.c:1946 scc_net_siocdevprivate() warn: 'hwcfg.vector_latch' from __request_region() not released on lines: 1827.

Old smatch warnings:
drivers/net/hamradio/scc.c:1784 scc_net_siocdevprivate() error: buffer overflow 'SCC_Info' 8 <= s32max
drivers/net/hamradio/scc.c:1785 scc_net_siocdevprivate() error: buffer overflow 'SCC_Info' 8 <= s32max
drivers/net/hamradio/scc.c:1786 scc_net_siocdevprivate() error: buffer overflow 'SCC_Info' 8 <= s32max
drivers/net/hamradio/scc.c:1787 scc_net_siocdevprivate() error: buffer overflow 'SCC_Info' 8 <= s32max
drivers/net/hamradio/scc.c:1788 scc_net_siocdevprivate() error: buffer overflow 'SCC_Info' 8 <= s32max
drivers/net/hamradio/scc.c:1800 scc_net_siocdevprivate() error: buffer overflow 'SCC_Info' 8 <= s32max
drivers/net/hamradio/scc.c:1801 scc_net_siocdevprivate() error: buffer overflow 'SCC_Info' 8 <= s32max
drivers/net/hamradio/scc.c:1802 scc_net_siocdevprivate() error: buffer overflow 'SCC_Info' 8 <= s32max
drivers/net/hamradio/scc.c:1803 scc_net_siocdevprivate() error: buffer overflow 'SCC_Info' 8 <= s32max
drivers/net/hamradio/scc.c:1804 scc_net_siocdevprivate() error: buffer overflow 'SCC_Info' 8 <= s32max
drivers/net/hamradio/scc.c:1822 scc_net_siocdevprivate() error: buffer overflow 'SCC_Info' 8 <= s32max
drivers/net/hamradio/scc.c:1823 scc_net_siocdevprivate() error: buffer overflow 'SCC_Info' 8 <= s32max
drivers/net/hamradio/scc.c:1826 scc_net_siocdevprivate() error: buffer overflow 'SCC_Info' 8 <= s32max

vim +/Ivec +1748 drivers/net/hamradio/scc.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  1695  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1696  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  1697   * SIOCSCCCFG		- configure driver	arg: (struct scc_hw_config *) arg
^1da177e4c3f41 Linus Torvalds     2005-04-16  1698   * SIOCSCCINI		- initialize driver	arg: ---
^1da177e4c3f41 Linus Torvalds     2005-04-16  1699   * SIOCSCCCHANINI	- initialize channel	arg: (struct scc_modem *) arg
^1da177e4c3f41 Linus Torvalds     2005-04-16  1700   * SIOCSCCSMEM		- set memory		arg: (struct scc_mem_config *) arg
^1da177e4c3f41 Linus Torvalds     2005-04-16  1701   * SIOCSCCGKISS		- get level 1 parameter	arg: (struct scc_kiss_cmd *) arg
^1da177e4c3f41 Linus Torvalds     2005-04-16  1702   * SIOCSCCSKISS		- set level 1 parameter arg: (struct scc_kiss_cmd *) arg
^1da177e4c3f41 Linus Torvalds     2005-04-16  1703   * SIOCSCCGSTAT		- get driver status	arg: (struct scc_stat *) arg
^1da177e4c3f41 Linus Torvalds     2005-04-16  1704   * SIOCSCCCAL		- send calib. pattern	arg: (struct scc_calibrate *) arg
^1da177e4c3f41 Linus Torvalds     2005-04-16  1705   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1706  
25ec92fbdd23a0 Arnd Bergmann      2021-07-27  1707  static int scc_net_siocdevprivate(struct net_device *dev,
25ec92fbdd23a0 Arnd Bergmann      2021-07-27  1708  				  struct ifreq *ifr, void __user *arg, int cmd)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1709  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1710  	struct scc_kiss_cmd kiss_cmd;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1711  	struct scc_mem_config memcfg;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1712  	struct scc_hw_config hwcfg;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1713  	struct scc_calibrate cal;
f4bdd264b43cc6 Wang Chen          2008-11-20  1714  	struct scc_channel *scc = (struct scc_channel *) dev->ml_priv;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1715  	int chan;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1716  	unsigned char device_name[IFNAMSIZ];
^1da177e4c3f41 Linus Torvalds     2005-04-16  1717  	
^1da177e4c3f41 Linus Torvalds     2005-04-16  1718  	if (!Driver_Initialized)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1719  	{
^1da177e4c3f41 Linus Torvalds     2005-04-16  1720  		if (cmd == SIOCSCCCFG)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1721  		{
^1da177e4c3f41 Linus Torvalds     2005-04-16  1722  			int found = 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1723  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1724  			if (!capable(CAP_SYS_RAWIO)) return -EPERM;
25ec92fbdd23a0 Arnd Bergmann      2021-07-27  1725  			if (in_compat_syscall())
25ec92fbdd23a0 Arnd Bergmann      2021-07-27  1726  				return -EOPNOTSUPP;
25ec92fbdd23a0 Arnd Bergmann      2021-07-27  1727  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1728  			if (!arg) return -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1729  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1730  			if (Nchips >= SCC_MAXCHIPS) 
^1da177e4c3f41 Linus Torvalds     2005-04-16  1731  				return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1732  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1733  			if (copy_from_user(&hwcfg, arg, sizeof(hwcfg)))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1734  				return -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1735  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1736  			if (hwcfg.irq == 2) hwcfg.irq = 9;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1737  
60e4ad7a72fd7c Yinghai Lu         2008-08-19  1738  			if (hwcfg.irq < 0 || hwcfg.irq >= nr_irqs)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1739  				return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1740  				
^1da177e4c3f41 Linus Torvalds     2005-04-16  1741  			if (!Ivec[hwcfg.irq].used && hwcfg.irq)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1742  			{
1b36efe07f83ec Jeff Garzik        2007-10-29  1743  				if (request_irq(hwcfg.irq, scc_isr,
9714481e677562 Michael Opdenacker 2013-10-05  1744  						0, "AX.25 SCC",
1b36efe07f83ec Jeff Garzik        2007-10-29  1745  						(void *)(long) hwcfg.irq))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1746  					printk(KERN_WARNING "z8530drv: warning, cannot get IRQ %d\n", hwcfg.irq);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1747  				else
^1da177e4c3f41 Linus Torvalds     2005-04-16 @1748  					Ivec[hwcfg.irq].used = 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1749  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1750  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1751  			if (hwcfg.vector_latch && !Vector_Latch) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1752  				if (!request_region(hwcfg.vector_latch, 1, "scc vector latch"))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1753  					printk(KERN_WARNING "z8530drv: warning, cannot reserve vector latch port 0x%lx\n, disabled.", hwcfg.vector_latch);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1754  				else
^1da177e4c3f41 Linus Torvalds     2005-04-16  1755  					Vector_Latch = hwcfg.vector_latch;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1756  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1757  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1758  			if (hwcfg.clock == 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1759  				hwcfg.clock = SCC_DEFAULT_CLOCK;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1760  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1761  #ifndef SCC_DONT_CHECK
^1da177e4c3f41 Linus Torvalds     2005-04-16  1762  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1763  			if(request_region(hwcfg.ctrl_a, 1, "scc-probe"))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1764  			{
^1da177e4c3f41 Linus Torvalds     2005-04-16  1765  				disable_irq(hwcfg.irq);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1766  				Outb(hwcfg.ctrl_a, 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1767  				OutReg(hwcfg.ctrl_a, R9, FHWRES);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1768  				udelay(100);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1769  				OutReg(hwcfg.ctrl_a,R13,0x55);		/* is this chip really there? */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1770  				udelay(5);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1771  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1772  				if (InReg(hwcfg.ctrl_a,R13) != 0x55)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1773  					found = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1774  				enable_irq(hwcfg.irq);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1775  				release_region(hwcfg.ctrl_a, 1);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1776  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1777  			else
^1da177e4c3f41 Linus Torvalds     2005-04-16  1778  				found = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1779  #endif
^1da177e4c3f41 Linus Torvalds     2005-04-16  1780  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1781  			if (found)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1782  			{
^1da177e4c3f41 Linus Torvalds     2005-04-16 @1783  				SCC_Info[2*Nchips  ].ctrl = hwcfg.ctrl_a;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1784  				SCC_Info[2*Nchips  ].data = hwcfg.data_a;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1785  				SCC_Info[2*Nchips  ].irq  = hwcfg.irq;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1786  				SCC_Info[2*Nchips+1].ctrl = hwcfg.ctrl_b;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1787  				SCC_Info[2*Nchips+1].data = hwcfg.data_b;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1788  				SCC_Info[2*Nchips+1].irq  = hwcfg.irq;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1789  			
^1da177e4c3f41 Linus Torvalds     2005-04-16  1790  				SCC_ctrl[Nchips].chan_A = hwcfg.ctrl_a;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1791  				SCC_ctrl[Nchips].chan_B = hwcfg.ctrl_b;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1792  				SCC_ctrl[Nchips].irq    = hwcfg.irq;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1793  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1794  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1795  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1796  			for (chan = 0; chan < 2; chan++)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1797  			{
^1da177e4c3f41 Linus Torvalds     2005-04-16  1798  				sprintf(device_name, "%s%i", SCC_DriverName, 2*Nchips+chan);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1799  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1800  				SCC_Info[2*Nchips+chan].special = hwcfg.special;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1801  				SCC_Info[2*Nchips+chan].clock = hwcfg.clock;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1802  				SCC_Info[2*Nchips+chan].brand = hwcfg.brand;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1803  				SCC_Info[2*Nchips+chan].option = hwcfg.option;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1804  				SCC_Info[2*Nchips+chan].enhanced = hwcfg.escc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1805  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1806  #ifdef SCC_DONT_CHECK
^1da177e4c3f41 Linus Torvalds     2005-04-16  1807  				printk(KERN_INFO "%s: data port = 0x%3.3x  control port = 0x%3.3x\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  1808  					device_name, 
^1da177e4c3f41 Linus Torvalds     2005-04-16  1809  					SCC_Info[2*Nchips+chan].data, 
^1da177e4c3f41 Linus Torvalds     2005-04-16  1810  					SCC_Info[2*Nchips+chan].ctrl);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1811  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1812  #else
^1da177e4c3f41 Linus Torvalds     2005-04-16  1813  				printk(KERN_INFO "%s: data port = 0x%3.3lx  control port = 0x%3.3lx -- %s\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  1814  					device_name,
^1da177e4c3f41 Linus Torvalds     2005-04-16  1815  					chan? hwcfg.data_b : hwcfg.data_a, 
^1da177e4c3f41 Linus Torvalds     2005-04-16  1816  					chan? hwcfg.ctrl_b : hwcfg.ctrl_a,
^1da177e4c3f41 Linus Torvalds     2005-04-16  1817  					found? "found" : "missing");
^1da177e4c3f41 Linus Torvalds     2005-04-16  1818  #endif
^1da177e4c3f41 Linus Torvalds     2005-04-16  1819  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1820  				if (found)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1821  				{
^1da177e4c3f41 Linus Torvalds     2005-04-16  1822  					request_region(SCC_Info[2*Nchips+chan].ctrl, 1, "scc ctrl");
^1da177e4c3f41 Linus Torvalds     2005-04-16  1823  					request_region(SCC_Info[2*Nchips+chan].data, 1, "scc data");
^1da177e4c3f41 Linus Torvalds     2005-04-16  1824  					if (Nchips+chan != 0 &&
^1da177e4c3f41 Linus Torvalds     2005-04-16  1825  					    scc_net_alloc(device_name, 
^1da177e4c3f41 Linus Torvalds     2005-04-16  1826  							  &SCC_Info[2*Nchips+chan]))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1827  					    return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1828  				}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1829  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1830  			
^1da177e4c3f41 Linus Torvalds     2005-04-16  1831  			if (found) Nchips++;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1832  			
^1da177e4c3f41 Linus Torvalds     2005-04-16  1833  			return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1834  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1835  		
^1da177e4c3f41 Linus Torvalds     2005-04-16  1836  		if (cmd == SIOCSCCINI)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1837  		{
^1da177e4c3f41 Linus Torvalds     2005-04-16  1838  			if (!capable(CAP_SYS_RAWIO))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1839  				return -EPERM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1840  				
^1da177e4c3f41 Linus Torvalds     2005-04-16  1841  			if (Nchips == 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1842  				return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1843  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1844  			z8530_init();
^1da177e4c3f41 Linus Torvalds     2005-04-16  1845  			return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1846  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1847  		
^1da177e4c3f41 Linus Torvalds     2005-04-16  1848  		return -EINVAL;	/* confuse the user */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1849  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1850  	
^1da177e4c3f41 Linus Torvalds     2005-04-16  1851  	if (!scc->init)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1852  	{
^1da177e4c3f41 Linus Torvalds     2005-04-16  1853  		if (cmd == SIOCSCCCHANINI)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1854  		{
^1da177e4c3f41 Linus Torvalds     2005-04-16  1855  			if (!capable(CAP_NET_ADMIN)) return -EPERM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1856  			if (!arg) return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1857  			
^1da177e4c3f41 Linus Torvalds     2005-04-16  1858  			scc->stat.bufsize   = SCC_BUFSIZE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1859  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1860  			if (copy_from_user(&scc->modem, arg, sizeof(struct scc_modem)))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1861  				return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1862  			
^1da177e4c3f41 Linus Torvalds     2005-04-16  1863  			/* default KISS Params */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1864  		
^1da177e4c3f41 Linus Torvalds     2005-04-16  1865  			if (scc->modem.speed < 4800)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1866  			{
^1da177e4c3f41 Linus Torvalds     2005-04-16  1867  				scc->kiss.txdelay = 36;		/* 360 ms */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1868  				scc->kiss.persist = 42;		/* 25% persistence */			/* was 25 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1869  				scc->kiss.slottime = 16;	/* 160 ms */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1870  				scc->kiss.tailtime = 4;		/* minimal reasonable value */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1871  				scc->kiss.fulldup = 0;		/* CSMA */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1872  				scc->kiss.waittime = 50;	/* 500 ms */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1873  				scc->kiss.maxkeyup = 10;	/* 10 s */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1874  				scc->kiss.mintime = 3;		/* 3 s */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1875  				scc->kiss.idletime = 30;	/* 30 s */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1876  				scc->kiss.maxdefer = 120;	/* 2 min */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1877  				scc->kiss.softdcd = 0;		/* hardware dcd */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1878  			} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1879  				scc->kiss.txdelay = 10;		/* 100 ms */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1880  				scc->kiss.persist = 64;		/* 25% persistence */			/* was 25 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1881  				scc->kiss.slottime = 8;		/* 160 ms */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1882  				scc->kiss.tailtime = 1;		/* minimal reasonable value */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1883  				scc->kiss.fulldup = 0;		/* CSMA */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1884  				scc->kiss.waittime = 50;	/* 500 ms */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1885  				scc->kiss.maxkeyup = 7;		/* 7 s */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1886  				scc->kiss.mintime = 3;		/* 3 s */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1887  				scc->kiss.idletime = 30;	/* 30 s */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1888  				scc->kiss.maxdefer = 120;	/* 2 min */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1889  				scc->kiss.softdcd = 0;		/* hardware dcd */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1890  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1891  			
^1da177e4c3f41 Linus Torvalds     2005-04-16  1892  			scc->tx_buff = NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1893  			skb_queue_head_init(&scc->tx_queue);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1894  			scc->init = 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1895  			
^1da177e4c3f41 Linus Torvalds     2005-04-16  1896  			return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1897  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1898  		
^1da177e4c3f41 Linus Torvalds     2005-04-16  1899  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1900  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1901  	
^1da177e4c3f41 Linus Torvalds     2005-04-16  1902  	switch(cmd)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1903  	{
^1da177e4c3f41 Linus Torvalds     2005-04-16  1904  		case SIOCSCCRESERVED:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1905  			return -ENOIOCTLCMD;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1906  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1907  		case SIOCSCCSMEM:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1908  			if (!capable(CAP_SYS_RAWIO)) return -EPERM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1909  			if (!arg || copy_from_user(&memcfg, arg, sizeof(memcfg)))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1910  				return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1911  			scc->stat.bufsize   = memcfg.bufsize;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1912  			return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1913  		
^1da177e4c3f41 Linus Torvalds     2005-04-16  1914  		case SIOCSCCGSTAT:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1915  			if (!arg || copy_to_user(arg, &scc->stat, sizeof(scc->stat)))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1916  				return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1917  			return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1918  		
^1da177e4c3f41 Linus Torvalds     2005-04-16  1919  		case SIOCSCCGKISS:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1920  			if (!arg || copy_from_user(&kiss_cmd, arg, sizeof(kiss_cmd)))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1921  				return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1922  			kiss_cmd.param = scc_get_param(scc, kiss_cmd.command);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1923  			if (copy_to_user(arg, &kiss_cmd, sizeof(kiss_cmd)))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1924  				return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1925  			return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1926  		
^1da177e4c3f41 Linus Torvalds     2005-04-16  1927  		case SIOCSCCSKISS:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1928  			if (!capable(CAP_NET_ADMIN)) return -EPERM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1929  			if (!arg || copy_from_user(&kiss_cmd, arg, sizeof(kiss_cmd)))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1930  				return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1931  			return scc_set_param(scc, kiss_cmd.command, kiss_cmd.param);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1932  		
^1da177e4c3f41 Linus Torvalds     2005-04-16  1933  		case SIOCSCCCAL:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1934  			if (!capable(CAP_SYS_RAWIO)) return -EPERM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1935  			if (!arg || copy_from_user(&cal, arg, sizeof(cal)) || cal.time == 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1936  				return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1937  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1938  			scc_start_calibrate(scc, cal.time, cal.pattern);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1939  			return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1940  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1941  		default:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1942  			return -ENOIOCTLCMD;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1943  		
^1da177e4c3f41 Linus Torvalds     2005-04-16  1944  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1945  	
^1da177e4c3f41 Linus Torvalds     2005-04-16 @1946  	return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1947  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1948  

:::::: The code at line 1748 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
