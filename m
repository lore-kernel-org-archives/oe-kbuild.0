Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D050E26AE4
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 00:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755477393; cv=none; b=Q2o6RLrxlGLbXU0QLuuC3cvskC/isgw6B/oBRcgDildPm/g0cBnxwYtSHk1pTZjadKxJiFUDObdKXuZXFujS6hQXHFqNbBnq8E+8qefdrJmHT3ABf8wH9fZgQCXWIminiFqt4ZM6MV1Ybvz2TAMrO4Gc+KkV+KDg9DaDU7g2hho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755477393; c=relaxed/simple;
	bh=BMETpxBssu/dPOhJyuwb/m3Ty/oZkasLsCHbZi0qv6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lvydzSfOLCszKoy1BMe8dd6TLgjk51QXM9emvUdR9kYdF6HEHlaKskKyoCi29etbyAnIDby541aqaUSHeKd63coPbVc6NirQcHysLMpaxTxUHtX1GV0tG74fmd7EEGQZE2f3x2k1wuuz1l4WbtHJCnpRdGWHG1FCMCkZoCbb7bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RG+XOGaS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RG+XOGaS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755477392; x=1787013392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BMETpxBssu/dPOhJyuwb/m3Ty/oZkasLsCHbZi0qv6I=;
  b=RG+XOGaSDZx0NOpILyI9qSC5tVL1bj8yKZ8Au1S0uVNeXJxDYeC6H8Ix
   LL2jWtufye1METiwwY2k+aDZaniL2GCHKQ6dMp3IkMOcbFMp3xnyUvLZO
   koT7BE+SXltrZK817pF5I+JWo3LS2ZSA4PXw6NF4vKZtT/V6EBtifB++1
   Vq3RbLTZtbZNJx6rdMfa66bmdCC06WFkR256VetfuUpOBZmKKH9W0PWx+
   XZtqrvaxMQqgJqnOyx8inO8CNN4jV/c3pjL0HBssT1eWrKMuu3galLkpK
   nClubNnXwkJbe91rVK77yWnLkqjc2gglI5m47I2B6MpEw/0op47VAKdML
   w==;
X-CSE-ConnectionGUID: 8Wgo1Yb9T8+hoF+QDRGzLQ==
X-CSE-MsgGUID: fud/8cn+QjiIEc4E78qkMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="75148701"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="75148701"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 17:36:32 -0700
X-CSE-ConnectionGUID: HuLHAKnKRsq2l/nLWMcHnQ==
X-CSE-MsgGUID: lw3XamFESpGtD/KSNH10JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171689313"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 17 Aug 2025 17:36:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unnrQ-000Dnt-0S;
	Mon, 18 Aug 2025 00:36:28 +0000
Date: Mon, 18 Aug 2025 08:35:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tty:tty-testing 8/24] drivers/tty/serial/qcom_geni_serial.c:274
 get_port_from_line() error: Calling ida_alloc_range() with a 'max' argument
 which is a power of 2. -1 missing?
Message-ID: <202508180815.R2nDyajs-lkp@intel.com>
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
CC: linux-serial@vger.kernel.org
TO: Zong Jiang <quic_zongjian@quicinc.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
head:   7cd9f5d6c5a3f31d2b282d31ddc4d78ff83a5c08
commit: 9391ab1ed9b3fe0d1af7d7858d9bf42f476628c8 [8/24] serial: qcom-geni: Make UART port count configurable via Kconfig
:::::: branch date: 14 hours ago
:::::: commit date: 4 days ago
config: parisc-randconfig-r072-20250818 (https://download.01.org/0day-ci/archive/20250818/202508180815.R2nDyajs-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508180815.R2nDyajs-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/qcom_geni_serial.c:274 get_port_from_line() error: Calling ida_alloc_range() with a 'max' argument which is a power of 2. -1 missing?

Old smatch warnings:
drivers/tty/serial/qcom_geni_serial.c:1931 qcom_geni_serial_probe() warn: missing unwind goto?

vim +/max +274 drivers/tty/serial/qcom_geni_serial.c

c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  259  
c3e7966c60745f Zong Jiang                  2025-08-12  260  static struct qcom_geni_serial_port *get_port_from_line(int line, bool console, struct device *dev)
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  261  {
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  262  	struct qcom_geni_serial_port *port;
9391ab1ed9b3fe Zong Jiang                  2025-08-12  263  	int nr_ports = console ? GENI_UART_CONS_PORTS : CONFIG_SERIAL_QCOM_GENI_UART_PORTS;
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  264  
a53be6945f5123 Viken Dadhaniya             2025-03-27  265  	if (console) {
a53be6945f5123 Viken Dadhaniya             2025-03-27  266  		if (line < 0 || line >= nr_ports)
a53be6945f5123 Viken Dadhaniya             2025-03-27  267  			return ERR_PTR(-ENXIO);
a53be6945f5123 Viken Dadhaniya             2025-03-27  268  
a53be6945f5123 Viken Dadhaniya             2025-03-27  269  		port = &qcom_geni_console_port;
a53be6945f5123 Viken Dadhaniya             2025-03-27  270  	} else {
a53be6945f5123 Viken Dadhaniya             2025-03-27  271  		int max_alias_num = of_alias_get_highest_id("serial");
a53be6945f5123 Viken Dadhaniya             2025-03-27  272  
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  273  		if (line < 0 || line >= nr_ports)
a53be6945f5123 Viken Dadhaniya             2025-03-27 @274  			line = ida_alloc_range(&port_ida, max_alias_num + 1, nr_ports, GFP_KERNEL);
a53be6945f5123 Viken Dadhaniya             2025-03-27  275  		else
a53be6945f5123 Viken Dadhaniya             2025-03-27  276  			line = ida_alloc_range(&port_ida, line, nr_ports, GFP_KERNEL);
a53be6945f5123 Viken Dadhaniya             2025-03-27  277  
a53be6945f5123 Viken Dadhaniya             2025-03-27  278  		if (line < 0)
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  279  			return ERR_PTR(-ENXIO);
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  280  
c3e7966c60745f Zong Jiang                  2025-08-12  281  		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
c3e7966c60745f Zong Jiang                  2025-08-12  282  		if (!port)
c3e7966c60745f Zong Jiang                  2025-08-12  283  			return ERR_PTR(-ENOMEM);
c3e7966c60745f Zong Jiang                  2025-08-12  284  
c3e7966c60745f Zong Jiang                  2025-08-12  285  		port->uport.iotype = UPIO_MEM;
c3e7966c60745f Zong Jiang                  2025-08-12  286  		port->uport.ops = &qcom_geni_uart_pops;
c3e7966c60745f Zong Jiang                  2025-08-12  287  		port->uport.flags = UPF_BOOT_AUTOCONF;
c3e7966c60745f Zong Jiang                  2025-08-12  288  		port->uport.line = line;
a53be6945f5123 Viken Dadhaniya             2025-03-27  289  	}
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  290  	return port;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  291  }
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  292  

:::::: The code at line 274 was first introduced by commit
:::::: a53be6945f5123c19d6fcc30783876705a2e0f00 serial: qcom-geni: Remove alias dependency from qcom serial driver

:::::: TO: Viken Dadhaniya <quic_vdadhani@quicinc.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
