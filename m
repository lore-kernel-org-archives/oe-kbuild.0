Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E806E35AC28
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Sep 2026 02:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790388779; cv=none; b=NdFg4fx4Zg5/t54ApnQSwz6lA/MI09VpAV/QvVPrLb9Cg9xxjRGWq+chuIux1FxTqlSl1mjI3CDT69Qz8OsvRRmISILLmZqjcX53CucjCYuzpToR5iq4cxxkyh+4IawhznFPaRdo9Z+nmhd0BQ08zT8jaiKQAKmt8NhVhXBjCRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790388779; c=relaxed/simple;
	bh=J5Z7hRPPsXbZ3jLKD8Hv5ZLIUM0mo+wJHLRYHylkbgQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n76wRV1cr3BeiFJqOlhp04bpHCxE+9MhPTB5X4dRWvAEx1CnJ+nBlMPVMCHEs5zz8LJ7qiNH+V33dATFCf3p0sTtkxbUb3JXVvtt5L5ol3Cep8m+kJcFPDDngjFnER78wPwkycWq0VpMXTL5oX1aVmI41778XFOChNZdlFYp894=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DFJ9IvQw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFJ9IvQw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790388776; x=1821924776;
  h=date:from:to:cc:subject:message-id;
  bh=J5Z7hRPPsXbZ3jLKD8Hv5ZLIUM0mo+wJHLRYHylkbgQ=;
  b=DFJ9IvQw+jCkXEUgmgHBXtK0PYmGqcu52ZXuaIOjYk2h/DUwDXZ3UeR2
   n79hF7naO42vmUAAy6w1jCqXdtAz3wPJn3/uGtKH6lfuUdmmVNZFNNj0S
   UYpeSdEMY3b+ypyK6wkiBaveF0nXCFd51P1FC4FT67SIDcF1UZ0UZ6wbj
   7W9gspcaZ5oIVbdnsc9Ciub7qCz0aieHdHPlvqfdn/8LisNuS5rZHMFfm
   YfupQqs111EOyL7bsa1jN5v3x/p4L+Z+sYJMaCJGP5flV9Mrj9deLQOir
   Mt47p603AfNG7P46/MDuB+waH1fBUdKZqjc9ITLfmH9S6+EIyZFnFPu6e
   g==;
X-CSE-ConnectionGUID: y0h/6doZSimzp4+FxhhoQg==
X-CSE-MsgGUID: quzmENoVROSUvSmMChi6qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90217463"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90217463"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 19:12:55 -0700
X-CSE-ConnectionGUID: 8P76LzLtTfeFaQqn8+DswQ==
X-CSE-MsgGUID: xCZGXQCNRvq1NygfCkOfxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="312398475"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 25 Sep 2026 19:12:53 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAHuD-000000000AZ-1sG5;
	Sat, 26 Sep 2026 02:12:49 +0000
Date: Sat, 26 Sep 2026 04:12:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [arnd-playground:randconfig-7.3-next 539/673]
 drivers/tty/serial/serial_port.c:247 __uart_read_properties() warn: if
 statement not indented
Message-ID: <202609260413.K1JgJ8UK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: c859e8d1c0dd5308ff6e4ab5c280b589a191e1a4 [539/673] 8250: port settings
:::::: branch date: 6 days ago
:::::: commit date: 9 days ago
config: i386-randconfig-2200-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260413.K1JgJ8UK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609260413.K1JgJ8UK-lkp@intel.com/

smatch warnings:
drivers/tty/serial/serial_port.c:247 __uart_read_properties() warn: if statement not indented

vim +247 drivers/tty/serial/serial_port.c

84a9582fd20306 Tony Lindgren   2023-05-25  152  
e894b6005dce0e Andy Shevchenko 2024-03-04  153  /**
e894b6005dce0e Andy Shevchenko 2024-03-04  154   * __uart_read_properties - read firmware properties of the given UART port
e894b6005dce0e Andy Shevchenko 2024-03-04  155   * @port: corresponding port
e894b6005dce0e Andy Shevchenko 2024-03-04  156   * @use_defaults: apply defaults (when %true) or validate the values (when %false)
e894b6005dce0e Andy Shevchenko 2024-03-04  157   *
e894b6005dce0e Andy Shevchenko 2024-03-04  158   * The following device properties are supported:
e894b6005dce0e Andy Shevchenko 2024-03-04  159   *   - clock-frequency (optional)
e894b6005dce0e Andy Shevchenko 2024-03-04  160   *   - fifo-size (optional)
e894b6005dce0e Andy Shevchenko 2024-03-04  161   *   - no-loopback-test (optional)
e894b6005dce0e Andy Shevchenko 2024-03-04  162   *   - reg-shift (defaults may apply)
e894b6005dce0e Andy Shevchenko 2024-03-04  163   *   - reg-offset (value may be validated)
e894b6005dce0e Andy Shevchenko 2024-03-04  164   *   - reg-io-width (defaults may apply or value may be validated)
e894b6005dce0e Andy Shevchenko 2024-03-04  165   *   - interrupts (OF only)
e894b6005dce0e Andy Shevchenko 2024-03-04  166   *   - serial [alias ID] (OF only)
e894b6005dce0e Andy Shevchenko 2024-03-04  167   *
e894b6005dce0e Andy Shevchenko 2024-03-04  168   * If the port->dev is of struct platform_device type the interrupt line
e894b6005dce0e Andy Shevchenko 2024-03-04  169   * will be retrieved via platform_get_irq() call against that device.
e894b6005dce0e Andy Shevchenko 2024-03-04  170   * Otherwise it will be assigned by fwnode_irq_get() call. In both cases
e894b6005dce0e Andy Shevchenko 2024-03-04  171   * the index 0 of the resource is used.
e894b6005dce0e Andy Shevchenko 2024-03-04  172   *
e894b6005dce0e Andy Shevchenko 2024-03-04  173   * The caller is responsible to initialize the following fields of the @port
e894b6005dce0e Andy Shevchenko 2024-03-04  174   *   ->dev (must be valid)
e894b6005dce0e Andy Shevchenko 2024-03-04  175   *   ->flags
166ac2bba167d5 Andy Shevchenko 2025-01-24  176   *   ->iobase
e894b6005dce0e Andy Shevchenko 2024-03-04  177   *   ->mapbase
e894b6005dce0e Andy Shevchenko 2024-03-04  178   *   ->mapsize
e894b6005dce0e Andy Shevchenko 2024-03-04  179   *   ->regshift (if @use_defaults is false)
e894b6005dce0e Andy Shevchenko 2024-03-04  180   * before calling this function. Alternatively the above mentioned fields
e894b6005dce0e Andy Shevchenko 2024-03-04  181   * may be zeroed, in such case the only ones, that have associated properties
e894b6005dce0e Andy Shevchenko 2024-03-04  182   * found, will be set to the respective values.
e894b6005dce0e Andy Shevchenko 2024-03-04  183   *
e894b6005dce0e Andy Shevchenko 2024-03-04  184   * If no error happened, the ->irq, ->mapbase, ->mapsize will be altered.
e894b6005dce0e Andy Shevchenko 2024-03-04  185   * The ->iotype is always altered.
e894b6005dce0e Andy Shevchenko 2024-03-04  186   *
e894b6005dce0e Andy Shevchenko 2024-03-04  187   * When @use_defaults is true and the respective property is not found
e894b6005dce0e Andy Shevchenko 2024-03-04  188   * the following values will be applied:
e894b6005dce0e Andy Shevchenko 2024-03-04  189   *   ->regshift = 0
e894b6005dce0e Andy Shevchenko 2024-03-04  190   * In this case IRQ must be provided, otherwise an error will be returned.
e894b6005dce0e Andy Shevchenko 2024-03-04  191   *
e894b6005dce0e Andy Shevchenko 2024-03-04  192   * When @use_defaults is false and the respective property is found
e894b6005dce0e Andy Shevchenko 2024-03-04  193   * the following values will be validated:
e894b6005dce0e Andy Shevchenko 2024-03-04  194   *   - reg-io-width (->iotype)
e894b6005dce0e Andy Shevchenko 2024-03-04  195   *   - reg-offset (->mapsize against ->mapbase)
e894b6005dce0e Andy Shevchenko 2024-03-04  196   *
e894b6005dce0e Andy Shevchenko 2024-03-04  197   * Returns: 0 on success or negative errno on failure
e894b6005dce0e Andy Shevchenko 2024-03-04  198   */
e894b6005dce0e Andy Shevchenko 2024-03-04  199  static int __uart_read_properties(struct uart_port *port, bool use_defaults)
e894b6005dce0e Andy Shevchenko 2024-03-04  200  {
e894b6005dce0e Andy Shevchenko 2024-03-04  201  	struct device *dev = port->dev;
e894b6005dce0e Andy Shevchenko 2024-03-04  202  	u32 value;
e894b6005dce0e Andy Shevchenko 2024-03-04  203  	int ret;
e894b6005dce0e Andy Shevchenko 2024-03-04  204  
e894b6005dce0e Andy Shevchenko 2024-03-04  205  	/* Read optional UART functional clock frequency */
e894b6005dce0e Andy Shevchenko 2024-03-04  206  
e894b6005dce0e Andy Shevchenko 2024-03-04  207  	/* Read the registers alignment (default: 8-bit) */
e894b6005dce0e Andy Shevchenko 2024-03-04  208  	ret = device_property_read_u32(dev, "reg-shift", &value);
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  209  	if (ret) {
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  210  	} else {
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  211  	}
e894b6005dce0e Andy Shevchenko 2024-03-04  212  
e894b6005dce0e Andy Shevchenko 2024-03-04  213  	/* Read the registers I/O access type (default: MMIO 8-bit) */
e894b6005dce0e Andy Shevchenko 2024-03-04  214  	ret = device_property_read_u32(dev, "reg-io-width", &value);
e894b6005dce0e Andy Shevchenko 2024-03-04  215  	if (ret) {
e894b6005dce0e Andy Shevchenko 2024-03-04  216  	} else {
e894b6005dce0e Andy Shevchenko 2024-03-04  217  		switch (value) {
e894b6005dce0e Andy Shevchenko 2024-03-04  218  		case 1:
e894b6005dce0e Andy Shevchenko 2024-03-04  219  			break;
e894b6005dce0e Andy Shevchenko 2024-03-04  220  		case 2:
e894b6005dce0e Andy Shevchenko 2024-03-04  221  			break;
e894b6005dce0e Andy Shevchenko 2024-03-04  222  		case 4:
e894b6005dce0e Andy Shevchenko 2024-03-04  223  			break;
e894b6005dce0e Andy Shevchenko 2024-03-04  224  		default:
e894b6005dce0e Andy Shevchenko 2024-03-04  225  			break;
e894b6005dce0e Andy Shevchenko 2024-03-04  226  		}
e894b6005dce0e Andy Shevchenko 2024-03-04  227  	}
e894b6005dce0e Andy Shevchenko 2024-03-04  228  
12397549b50140 Andy Shevchenko 2025-01-24  229  	if (!use_defaults && port->iotype == UPIO_UNKNOWN) {
12397549b50140 Andy Shevchenko 2025-01-24  230  		dev_err(dev, "Unsupported reg-io-width (%u)\n", value);
12397549b50140 Andy Shevchenko 2025-01-24  231  		return -EINVAL;
12397549b50140 Andy Shevchenko 2025-01-24  232  	}
12397549b50140 Andy Shevchenko 2025-01-24  233  
e894b6005dce0e Andy Shevchenko 2024-03-04  234  	/* Read the address mapping base offset (default: no offset) */
e894b6005dce0e Andy Shevchenko 2024-03-04  235  	ret = device_property_read_u32(dev, "reg-offset", &value);
e894b6005dce0e Andy Shevchenko 2024-03-04  236  	if (ret)
e894b6005dce0e Andy Shevchenko 2024-03-04  237  		value = 0;
e894b6005dce0e Andy Shevchenko 2024-03-04  238  
e894b6005dce0e Andy Shevchenko 2024-03-04  239  	/* Check for shifted address mapping overflow */
e894b6005dce0e Andy Shevchenko 2024-03-04  240  	if (!use_defaults && port->mapsize < value) {
e894b6005dce0e Andy Shevchenko 2024-03-04  241  		dev_err(dev, "reg-offset %u exceeds region size %pa\n", value, &port->mapsize);
e894b6005dce0e Andy Shevchenko 2024-03-04  242  		return -EINVAL;
e894b6005dce0e Andy Shevchenko 2024-03-04  243  	}
e894b6005dce0e Andy Shevchenko 2024-03-04  244  
e894b6005dce0e Andy Shevchenko 2024-03-04  245  	/* Read optional FIFO size */
e894b6005dce0e Andy Shevchenko 2024-03-04  246  
e894b6005dce0e Andy Shevchenko 2024-03-04 @247  	if (device_property_read_bool(dev, "no-loopback-test"))
e894b6005dce0e Andy Shevchenko 2024-03-04  248  
e894b6005dce0e Andy Shevchenko 2024-03-04  249  	/* Get index of serial line, if found in DT aliases */
e894b6005dce0e Andy Shevchenko 2024-03-04  250  	ret = of_alias_get_id(dev_of_node(dev), "serial");
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  251  	if (ret >= 0) {
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  252  	}
e894b6005dce0e Andy Shevchenko 2024-03-04  253  
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  254  	if (dev_is_platform(dev)) {
e894b6005dce0e Andy Shevchenko 2024-03-04  255  		ret = platform_get_irq(to_platform_device(dev), 0);
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  256  	} else if (dev_is_pnp(dev)) {
18ba7f2d99f698 Guanbing Huang  2024-04-16  257  		ret = pnp_irq(to_pnp_dev(dev), 0);
18ba7f2d99f698 Guanbing Huang  2024-04-16  258  		if (ret < 0)
18ba7f2d99f698 Guanbing Huang  2024-04-16  259  			ret = -ENXIO;
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  260  	} else {
e894b6005dce0e Andy Shevchenko 2024-03-04  261  		ret = fwnode_irq_get(dev_fwnode(dev), 0);
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  262  	}
e894b6005dce0e Andy Shevchenko 2024-03-04  263  	if (ret == -EPROBE_DEFER)
e894b6005dce0e Andy Shevchenko 2024-03-04  264  		return ret;
e894b6005dce0e Andy Shevchenko 2024-03-04  265  	if (ret > 0)
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  266  		;
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  267  	else if (use_defaults) {
e894b6005dce0e Andy Shevchenko 2024-03-04  268  		/* By default IRQ support is mandatory */
e894b6005dce0e Andy Shevchenko 2024-03-04  269  		return ret;
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  270  	} else {
c859e8d1c0dd53 Arnd Bergmann   2025-08-07  271  	}
e894b6005dce0e Andy Shevchenko 2024-03-04  272  
e894b6005dce0e Andy Shevchenko 2024-03-04  273  
e894b6005dce0e Andy Shevchenko 2024-03-04  274  	return 0;
e894b6005dce0e Andy Shevchenko 2024-03-04  275  }
e894b6005dce0e Andy Shevchenko 2024-03-04  276  

:::::: The code at line 247 was first introduced by commit
:::::: e894b6005dce0ed621b2788d6a249708fb6f95f9 serial: port: Introduce a common helper to read properties

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
