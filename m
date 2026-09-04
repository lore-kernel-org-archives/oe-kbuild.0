Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40824EC67D
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Sep 2026 17:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543834; cv=none; b=VSv0pb9692BDvCiJpG3FWr5DM54wm/OGnSvu67nLfiVXGf+4+LdmXDwCvibMdaIvS2TFe7vZOYttg7jH76E8YyqYnBS4uOtVjjAARMtAVjFKIOts2LqEkiD0xG9ZpRTGpYJSlkletzxvfFhBtdqZ7vgWrL7MqcRWhNvhHufmiRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543834; c=relaxed/simple;
	bh=sPAlJLx/I5i7GBUl5YShBFV8rLVr6r4ennGXMt6Ow/4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bwgr4y4vYcxMJP4irtcbgWgye9ow+FaJQlyDr8j6sfATaavEP+Po2Epx47lb5j3xO8y4lGUjE1HWMYmkgh1a7umeSlWLEgIrziIIn5RBijYqFg2RTrSNaAGLL2oje0AwycpLWw5WsM9nymNM/Y+LxUrbJO4wjHoDl4XjYPBV7RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkQe/FlK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkQe/FlK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788543831; x=1820079831;
  h=date:from:to:cc:subject:message-id;
  bh=sPAlJLx/I5i7GBUl5YShBFV8rLVr6r4ennGXMt6Ow/4=;
  b=RkQe/FlK1JWoqw5NnxLDMxnSmk9n+O7VHp7rX+0wIlShzva+PYZUDb0E
   mWR5coxl1SAT3gW9XTLZwH8UU2EUdaJ23IC7o6HgDsTdeX1eGJAB3fkSm
   Bn0DfJ5YWtm8FCCoQb4azVCn3rObaWSug7JemwJWprw48JS0B/h0/EKfI
   ARNDwWKX9eCXxWOy6IBJy2yur3BUxjBdUnxGvB4f1pXkdHbcvPMo4pr5Y
   zfkdySESSlkj2C7ER7dPpZ+ZtbGloWx2UOHF8MgPZizTYH2o2jj4qcb+f
   /SnZGqoALt5NuyxudCn2R7I3w2TSMNnEg0LI+2l3MCbKCQAHIhEuCn5Y4
   A==;
X-CSE-ConnectionGUID: z9AglCFPRK2aF76BODfdJQ==
X-CSE-MsgGUID: RjxeouzHQTOdgpjGQMcpGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88976153"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88976153"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 10:43:50 -0700
X-CSE-ConnectionGUID: h2IR8rgyQ8am/CLstPFEcw==
X-CSE-MsgGUID: NzjRfulXR1WQPsAZK1qJdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="270079126"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Sep 2026 10:43:49 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2Xx5-00000000A1y-0nZn;
	Fri, 04 Sep 2026 17:43:47 +0000
Date: Sat, 05 Sep 2026 01:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/tty/serial/cpm_uart.c:1533:31: sparse: sparse:
 unsigned value that used to be signed checked against zero?
Message-ID: <202609050125.uYZtQhn3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/tty/serial/cpm_uart.c:1533:31: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rosen Penev <rosenp@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   421066905cbceca1f78cba5f7d92b4980317ab2b
commit: 831603b3e8aa3892de229fda846b2f859c518699 serial: cpm_uart: replace irq_of_parse_and_map with platform_get_irq
date:   8 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 weeks ago
config: powerpc-randconfig-r111-20260904 (https://download.01.org/0day-ci/archive/20260905/202609050125.uYZtQhn3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050125.uYZtQhn3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 831603b3e8aa ("serial: cpm_uart: replace irq_of_parse_and_map with platform_get_irq")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609050125.uYZtQhn3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/cpm_uart.c:1091:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc volatile [usertype] *bdp @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *rx_cur @@
   drivers/tty/serial/cpm_uart.c:1091:13: sparse:     expected struct cpm_buf_desc volatile [usertype] *bdp
   drivers/tty/serial/cpm_uart.c:1091:13: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *rx_cur
   drivers/tty/serial/cpm_uart.c:1110:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc volatile [usertype] *bdp @@     got struct cpm_buf_desc [noderef] [usertype] __iomem *rx_bd_base @@
   drivers/tty/serial/cpm_uart.c:1110:21: sparse:     expected struct cpm_buf_desc volatile [usertype] *bdp
   drivers/tty/serial/cpm_uart.c:1110:21: sparse:     got struct cpm_buf_desc [noderef] [usertype] __iomem *rx_bd_base
   drivers/tty/serial/cpm_uart.c:1113:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cpm_buf_desc [noderef] [usertype] __iomem *rx_cur @@     got struct cpm_buf_desc [usertype] * @@
   drivers/tty/serial/cpm_uart.c:1113:23: sparse:     expected struct cpm_buf_desc [noderef] [usertype] __iomem *rx_cur
   drivers/tty/serial/cpm_uart.c:1113:23: sparse:     got struct cpm_buf_desc [usertype] *
>> drivers/tty/serial/cpm_uart.c:1533:31: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/tty/serial/cpm_uart.c:1532:43: sparse: signed value source

vim +1533 drivers/tty/serial/cpm_uart.c

7ae870368d198a drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1515  
9671f09921d93e drivers/tty/serial/cpm_uart/cpm_uart_core.c Bill Pemberton   2012-11-19  1516  static int cpm_uart_probe(struct platform_device *ofdev)
7ae870368d198a drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1517  {
7ae870368d198a drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1518  	int index = probe_index++;
7ae870368d198a drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1519  	struct uart_cpm_port *pinfo = &cpm_uart_ports[index];
7ae870368d198a drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1520  	int ret;
7ae870368d198a drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1521  
7ae870368d198a drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1522  	pinfo->port.line = index;
7ae870368d198a drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1523  
7ae870368d198a drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1524  	if (index >= UART_NR)
7ae870368d198a drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1525  		return -ENODEV;
7ae870368d198a drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1526  
696faedd616e20 drivers/tty/serial/cpm_uart/cpm_uart_core.c Jingoo Han       2013-05-23  1527  	platform_set_drvdata(ofdev, pinfo);
7ae870368d198a drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1528  
bd86ef378412fc drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2009-04-03  1529  	/* initialize the device pointer for the port */
bd86ef378412fc drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2009-04-03  1530  	pinfo->port.dev = &ofdev->dev;
bd86ef378412fc drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2009-04-03  1531  
831603b3e8aa38 drivers/tty/serial/cpm_uart.c               Rosen Penev      2026-06-06  1532  	pinfo->port.irq = platform_get_irq(ofdev, 0);
831603b3e8aa38 drivers/tty/serial/cpm_uart.c               Rosen Penev      2026-06-06 @1533  	if (pinfo->port.irq < 0)
831603b3e8aa38 drivers/tty/serial/cpm_uart.c               Rosen Penev      2026-06-06  1534  		return pinfo->port.irq;
7ae870368d198a drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1535  
30963b2f75bfdb drivers/tty/serial/cpm_uart/cpm_uart_core.c Christophe Leroy 2022-09-30  1536  	ret = cpm_uart_init_port(ofdev->dev.of_node, pinfo);
30963b2f75bfdb drivers/tty/serial/cpm_uart/cpm_uart_core.c Christophe Leroy 2022-09-30  1537  	if (!ret)
7ae870368d198a drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1538  		return uart_add_one_port(&cpm_reg, &pinfo->port);
30963b2f75bfdb drivers/tty/serial/cpm_uart/cpm_uart_core.c Christophe Leroy 2022-09-30  1539  
30963b2f75bfdb drivers/tty/serial/cpm_uart/cpm_uart_core.c Christophe Leroy 2022-09-30  1540  	return ret;
7ae870368d198a drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1541  }
7ae870368d198a drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1542  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
