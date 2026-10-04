Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B19414A2A
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791103786; cv=none; b=sIUUeW5xuoymGMT/gsw40/w5hXgmPe4tmXsaNjqcCoiwQyrAx6VbKRSIZfS1TOyRTJHkX9hYaMEI2PqsAIHzQcso/nPZ7hmhw+QWJ536xJqx2y1mIrMw4iDhpjy2n+rETxH1YIIy+6AlJ8BIsS8/Uo5p9P1aUZpxHhntT9tRO+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791103786; c=relaxed/simple;
	bh=M3mvx261y7TpD5ov5MoAajZEfX57wK0IsnE5ZQ0rUHM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LkJXF/DRoCrulgCCpMjHpYDtOToF/CHcRvGjdHfO8Icc/mq6uWkpCK0slTNaso6Id/ipaol5I/tnFnuYKikcI5yIU1CIKV2BueEOebvsKoyJQ9Ja83EkdbGnpA6BzjQauaXaaTZYJ1hUnYomk16dcoRjfv1oN/8q3WkFok5q7ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2rxXZ3I; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2rxXZ3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791103782; x=1822639782;
  h=date:from:to:cc:subject:message-id;
  bh=M3mvx261y7TpD5ov5MoAajZEfX57wK0IsnE5ZQ0rUHM=;
  b=a2rxXZ3IAeKaZVRyff4k9UjpK4z3Q/0muVnIYSYhoO0azpErsw0r93tW
   ly7F1S4ocEAFmcIYgvV3r/x+7YINv86dG2kxDKuSKPpy8G0Jf9mYhlOXD
   MKOxAWo0tselRFAwPXXtbRzuN/HJLJTvmvShvlJ97+meuq/bNK7br6tRE
   XXhX/dRHTulexgYtqPUi6wwK+wI+Nmp+wkzqKOr0HHThBRosXdHzmD7fN
   SqtiBd7DA+LriIf+rajCkCz88u/Id4fQY7zX2E5HgbYx00aUNwgQvI+LT
   6it51HdY4UiY1H4yyZFl8/7icnC2in+4ts5mDbXHV7lVOMmtJLSgEsv3g
   g==;
X-CSE-ConnectionGUID: m9VO8Fv9ThqjrJx6KEIbAg==
X-CSE-MsgGUID: hvNlnR15SfS6PcBf7oK4Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="91908133"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="91908133"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 01:49:38 -0700
X-CSE-ConnectionGUID: 3Rj66pz1SIS4n+hMIA4BAg==
X-CSE-MsgGUID: wvgoqr50STGONiiW92J1jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="276126570"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 04 Oct 2026 01:49:37 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDHuY-000000000FT-3NBo;
	Sun, 04 Oct 2026 08:49:34 +0000
Date: Sun, 04 Oct 2026 10:49:30 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/tty/serial/cpm_uart.c:1533:5-20: WARNING: Unsigned
 expression compared with zero: pinfo -> port . irq < 0
Message-ID: <202610041027.gpXgSTFO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rosen Penev <rosenp@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6addb4f385570ebc11c4eb499a4f1c149f313e84
commit: 831603b3e8aa3892de229fda846b2f859c518699 serial: cpm_uart: replace irq_of_parse_and_map with platform_get_irq
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: powerpc-randconfig-r2105-20261004 (https://download.01.org/0day-ci/archive/20261004/202610041027.gpXgSTFO-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 831603b3e8aa ("serial: cpm_uart: replace irq_of_parse_and_map with platform_get_irq")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610041027.gpXgSTFO-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/tty/serial/cpm_uart.c:1533:5-20: WARNING: Unsigned expression compared with zero: pinfo -> port . irq < 0

vim +1533 drivers/tty/serial/cpm_uart.c

7ae870368d198af drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1515  
9671f09921d93e7 drivers/tty/serial/cpm_uart/cpm_uart_core.c Bill Pemberton   2012-11-19  1516  static int cpm_uart_probe(struct platform_device *ofdev)
7ae870368d198af drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1517  {
7ae870368d198af drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1518  	int index = probe_index++;
7ae870368d198af drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1519  	struct uart_cpm_port *pinfo = &cpm_uart_ports[index];
7ae870368d198af drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1520  	int ret;
7ae870368d198af drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1521  
7ae870368d198af drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1522  	pinfo->port.line = index;
7ae870368d198af drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1523  
7ae870368d198af drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1524  	if (index >= UART_NR)
7ae870368d198af drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1525  		return -ENODEV;
7ae870368d198af drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1526  
696faedd616e202 drivers/tty/serial/cpm_uart/cpm_uart_core.c Jingoo Han       2013-05-23  1527  	platform_set_drvdata(ofdev, pinfo);
7ae870368d198af drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1528  
bd86ef378412fc3 drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2009-04-03  1529  	/* initialize the device pointer for the port */
bd86ef378412fc3 drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2009-04-03  1530  	pinfo->port.dev = &ofdev->dev;
bd86ef378412fc3 drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2009-04-03  1531  
831603b3e8aa389 drivers/tty/serial/cpm_uart.c               Rosen Penev      2026-06-06  1532  	pinfo->port.irq = platform_get_irq(ofdev, 0);
831603b3e8aa389 drivers/tty/serial/cpm_uart.c               Rosen Penev      2026-06-06 @1533  	if (pinfo->port.irq < 0)
831603b3e8aa389 drivers/tty/serial/cpm_uart.c               Rosen Penev      2026-06-06  1534  		return pinfo->port.irq;
7ae870368d198af drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1535  
30963b2f75bfdbb drivers/tty/serial/cpm_uart/cpm_uart_core.c Christophe Leroy 2022-09-30  1536  	ret = cpm_uart_init_port(ofdev->dev.of_node, pinfo);
30963b2f75bfdbb drivers/tty/serial/cpm_uart/cpm_uart_core.c Christophe Leroy 2022-09-30  1537  	if (!ret)
7ae870368d198af drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1538  		return uart_add_one_port(&cpm_reg, &pinfo->port);
30963b2f75bfdbb drivers/tty/serial/cpm_uart/cpm_uart_core.c Christophe Leroy 2022-09-30  1539  
30963b2f75bfdbb drivers/tty/serial/cpm_uart/cpm_uart_core.c Christophe Leroy 2022-09-30  1540  	return ret;
7ae870368d198af drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1541  }
7ae870368d198af drivers/serial/cpm_uart/cpm_uart_core.c     Scott Wood       2007-07-17  1542  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
