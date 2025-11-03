Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5E82F9DB0
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Nov 2025 10:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762165401; cv=none; b=nVIcoqRybgIVcyaHM0BBts7OlVZMrY3U95V4BgGDBdyCjhasOjfF90nAc6H1zJoca9m+oouwvVGpI5YpipdRMx3jbp8vszlXiwifQXhxKT3RaXTbCHooTC/dfMp98bTBoZkHyLPaQtvqJfoUby73Oon8rj6s9Kf3iY1DAX8HyZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762165401; c=relaxed/simple;
	bh=ZrvOE4vMl9zzmRtFV7K5vJrGGOBhC1kSs20pwnFbDcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DGMYUb8g1wLqOlXxh8OeDWRlKhiehl6ZIZj00FZzimVKMF52qWzsnLH9X/lUA6PyuJATUPt4Ru5a4z5HYgxmCp+EC2jveMpmFWfTOTo8DImZ59osH0+Sl4UPQKVVCqJm8jcqPHoRc3xjQ88U40+5cFIp/ujTwnC6hAZwZ4XfgtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9WVTWHq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9WVTWHq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762165399; x=1793701399;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZrvOE4vMl9zzmRtFV7K5vJrGGOBhC1kSs20pwnFbDcQ=;
  b=K9WVTWHq93eGDF7A0usT6LgZeLHzL9m1lWDjinukiAsxUAug1XkG97w1
   oF68biw9hhURrmdDPN/mpBZ4GMwRUNhHR5qUjrcYqs3aexeMMxSycJrYS
   EWRfK2wPAs5Z4EW2zhtyZIDWQpS2s3TCYcxNbh8rtzBGtaSE1jrHPRD/s
   N3qcHknwfHexXQV4NA6i4pwwqtSDhj/FLTvHltnArlnRzzaxhtoJ4C+JH
   fR2InGabQ1vTUhKkYERftPNwaPUQwzb+AObHqMa0VIMmiLsxR8iXAcEoL
   jXgVHe0syfVJg4DbY0+Ib3ihBzTIk5VXf583ZREolqI+lwT+t/18my1nw
   Q==;
X-CSE-ConnectionGUID: rhCqJUISTDixA4OPyiYHjw==
X-CSE-MsgGUID: 57FVEdx6Qh2tHre2BONXbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64333967"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="64333967"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 02:23:18 -0800
X-CSE-ConnectionGUID: /9a/WSHFRmuZvR0JSXG0Tg==
X-CSE-MsgGUID: IMZdh4PbSq2az4SccsVlPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="187554359"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2025 02:23:18 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFriV-000Q22-2w;
	Mon, 03 Nov 2025 10:23:15 +0000
Date: Mon, 3 Nov 2025 18:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gerg-m68knommu:dt 1/14] drivers/tty/serial/mcf.c:586:25: sparse:
 sparse: unsigned value that used to be signed checked against zero?
Message-ID: <202511031828.5Wnh1Fft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/tty/serial/mcf.c:586:25: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-m68k@lists.linux-m68k.org
CC: uclinux-dev@uclinux.org
TO: Greg Ungerer <gerg@linux-m68k.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   b432ddfcbb9146556fe9f6623fc6819a85c734b3
commit: eb0c2bf59aeda4481f69d166a3014c9ea4865229 [1/14] serial: mcf: convert to use proper platform resources
:::::: branch date: 11 hours ago
:::::: commit date: 7 days ago
config: m68k-randconfig-r132-20251103 (https://download.01.org/0day-ci/archive/20251103/202511031828.5Wnh1Fft-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511031828.5Wnh1Fft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511031828.5Wnh1Fft-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/mcf.c:586:25: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/tty/serial/mcf.c:585:37: sparse: signed value source

vim +586 drivers/tty/serial/mcf.c

49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  570  
9671f09921d93e drivers/tty/serial/mcf.c Bill Pemberton    2012-11-19  571  static int mcf_probe(struct platform_device *pdev)
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  572  {
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  573  	struct uart_port *port;
eb0c2bf59aeda4 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  574  	struct resource *res;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  575  
eb0c2bf59aeda4 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  576  	if (pdev->id >= MCF_MAXPORTS)
eb0c2bf59aeda4 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  577  		return -ENODEV;
eb0c2bf59aeda4 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  578  	port = &mcf_ports[pdev->id].port;
eb0c2bf59aeda4 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  579  
eb0c2bf59aeda4 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  580  	port->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
eb0c2bf59aeda4 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  581  	if (IS_ERR(port->membase))
eb0c2bf59aeda4 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  582  		return PTR_ERR(port->membase);
eb0c2bf59aeda4 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  583  	port->mapbase = res->start;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  584  
eb0c2bf59aeda4 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  585  	port->irq = platform_get_irq(pdev, 0);
eb0c2bf59aeda4 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15 @586  	if (port->irq < 0)
eb0c2bf59aeda4 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  587  		return port->irq;
eb0c2bf59aeda4 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  588  
eb0c2bf59aeda4 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  589  	port->line = pdev->id;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  590  	port->type = PORT_MCF;
201d8975ae5ada drivers/tty/serial/mcf.c Greg Ungerer      2015-01-08  591  	port->dev = &pdev->dev;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  592  	port->iotype = SERIAL_IO_MEM;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  593  	port->uartclk = MCF_BUSCLK;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  594  	port->ops = &mcf_uart_ops;
5fda7a0e715c32 drivers/tty/serial/mcf.c Peter Hurley      2014-06-16  595  	port->flags = UPF_BOOT_AUTOCONF;
2fc0184dae7be5 drivers/tty/serial/mcf.c Ricardo Ribalda   2014-11-06  596  	port->rs485_config = mcf_config_rs485;
0139da50dc53f0 drivers/tty/serial/mcf.c Ilpo Järvinen     2022-07-04  597  	port->rs485_supported = mcf_rs485_supported;
4be87603b6dc9e drivers/tty/serial/mcf.c Angelo Dureghello 2020-10-02  598  	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_MCF_CONSOLE);
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  599  
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  600  	uart_add_one_port(&mcf_driver, port);
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  601  	return 0;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  602  }
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  603  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
