Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03EA256E
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jan 2023 23:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674256413; x=1705792413;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=p6RYfsMxbFVKHxz9dE1kY4T/UVksjwj5xUCl4XeAT70=;
  b=a0+a/TO0md/ANv9YOcCnw7CTsNLqr2rrYrN+WMBgnMX6h5A5sxEy5Ken
   QyI/Wg8MORsaB2epDFm2S9AJALrAHI8LmgswKQ+bK4ReFjldIdR3SqIw0
   +qpCvxKNT2OT6z0B4e9YVyztINYbnZACF8xnJfg9ZmEe3joVBKkJh/mjs
   4HXActL+Fqta0KpkMflL+V7JMoLuPPsvQLSjW6TmGl0XjTYRMSpg7Mr33
   eb5ttxC31aAnZIILirCdb2KeQ0dKNDzuIeniiibbo95YvNn7zRknkxuUN
   Wby3XIW3DWnhOSjocRufLB7QOWutu/yg6Z8buZPl6BQxmjJ5lqWQJIxUk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="326994399"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="326994399"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 15:13:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="906126134"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="906126134"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Jan 2023 15:13:31 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ0Ze-00035N-2X;
	Fri, 20 Jan 2023 23:13:30 +0000
Date: Sat, 21 Jan 2023 07:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tty:tty-next 17/90] drivers/tty/serial/liteuart.c:328
 liteuart_probe() warn: missing unwind goto?
Message-ID: <202301210724.SCRcRjOR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-serial@vger.kernel.org
TO: Gabriel Somlo <gsomlo@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Jiri Slaby <jirislaby@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-next
head:   05e2600cb0a4d73b0779cf29512819616252aeeb
commit: 5602cf99dcdcc0bf8f9a5979b7443fbe46686995 [17/90] serial: liteuart: add IRQ support for the RX path
:::::: branch date: 32 hours ago
:::::: commit date: 33 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230121/202301210724.SCRcRjOR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/tty/serial/liteuart.c:328 liteuart_probe() warn: missing unwind goto?

vim +328 drivers/tty/serial/liteuart.c

1da81e5562fac8 Filip Kokosinski 2020-10-13  293  
1da81e5562fac8 Filip Kokosinski 2020-10-13  294  static int liteuart_probe(struct platform_device *pdev)
1da81e5562fac8 Filip Kokosinski 2020-10-13  295  {
1da81e5562fac8 Filip Kokosinski 2020-10-13  296  	struct liteuart_port *uart;
1da81e5562fac8 Filip Kokosinski 2020-10-13  297  	struct uart_port *port;
1da81e5562fac8 Filip Kokosinski 2020-10-13  298  	struct xa_limit limit;
1da81e5562fac8 Filip Kokosinski 2020-10-13  299  	int dev_id, ret;
1da81e5562fac8 Filip Kokosinski 2020-10-13  300  
1da81e5562fac8 Filip Kokosinski 2020-10-13  301  	/* look for aliases; auto-enumerate for free index if not found */
1da81e5562fac8 Filip Kokosinski 2020-10-13  302  	dev_id = of_alias_get_id(pdev->dev.of_node, "serial");
1da81e5562fac8 Filip Kokosinski 2020-10-13  303  	if (dev_id < 0)
1da81e5562fac8 Filip Kokosinski 2020-10-13  304  		limit = XA_LIMIT(0, CONFIG_SERIAL_LITEUART_MAX_PORTS);
1da81e5562fac8 Filip Kokosinski 2020-10-13  305  	else
1da81e5562fac8 Filip Kokosinski 2020-10-13  306  		limit = XA_LIMIT(dev_id, dev_id);
1da81e5562fac8 Filip Kokosinski 2020-10-13  307  
1da81e5562fac8 Filip Kokosinski 2020-10-13  308  	uart = devm_kzalloc(&pdev->dev, sizeof(struct liteuart_port), GFP_KERNEL);
1da81e5562fac8 Filip Kokosinski 2020-10-13  309  	if (!uart)
1da81e5562fac8 Filip Kokosinski 2020-10-13  310  		return -ENOMEM;
1da81e5562fac8 Filip Kokosinski 2020-10-13  311  
1da81e5562fac8 Filip Kokosinski 2020-10-13  312  	ret = xa_alloc(&liteuart_array, &dev_id, uart, limit, GFP_KERNEL);
1da81e5562fac8 Filip Kokosinski 2020-10-13  313  	if (ret)
1da81e5562fac8 Filip Kokosinski 2020-10-13  314  		return ret;
1da81e5562fac8 Filip Kokosinski 2020-10-13  315  
1da81e5562fac8 Filip Kokosinski 2020-10-13  316  	uart->id = dev_id;
1da81e5562fac8 Filip Kokosinski 2020-10-13  317  	port = &uart->port;
1da81e5562fac8 Filip Kokosinski 2020-10-13  318  
1da81e5562fac8 Filip Kokosinski 2020-10-13  319  	/* get membase */
1da81e5562fac8 Filip Kokosinski 2020-10-13  320  	port->membase = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
dd5e90b16cca8a Johan Hovold     2021-11-17  321  	if (IS_ERR(port->membase)) {
dd5e90b16cca8a Johan Hovold     2021-11-17  322  		ret = PTR_ERR(port->membase);
dd5e90b16cca8a Johan Hovold     2021-11-17  323  		goto err_erase_id;
dd5e90b16cca8a Johan Hovold     2021-11-17  324  	}
1da81e5562fac8 Filip Kokosinski 2020-10-13  325  
5602cf99dcdcc0 Gabriel Somlo    2022-11-23  326  	ret = platform_get_irq_optional(pdev, 0);
5602cf99dcdcc0 Gabriel Somlo    2022-11-23  327  	if (ret < 0 && ret != -ENXIO)
5602cf99dcdcc0 Gabriel Somlo    2022-11-23 @328  		return ret;
5602cf99dcdcc0 Gabriel Somlo    2022-11-23  329  	if (ret > 0)
5602cf99dcdcc0 Gabriel Somlo    2022-11-23  330  		port->irq = ret;
5602cf99dcdcc0 Gabriel Somlo    2022-11-23  331  
1da81e5562fac8 Filip Kokosinski 2020-10-13  332  	/* values not from device tree */
1da81e5562fac8 Filip Kokosinski 2020-10-13  333  	port->dev = &pdev->dev;
1da81e5562fac8 Filip Kokosinski 2020-10-13  334  	port->iotype = UPIO_MEM;
1da81e5562fac8 Filip Kokosinski 2020-10-13  335  	port->flags = UPF_BOOT_AUTOCONF;
1da81e5562fac8 Filip Kokosinski 2020-10-13  336  	port->ops = &liteuart_ops;
1da81e5562fac8 Filip Kokosinski 2020-10-13  337  	port->fifosize = 16;
1da81e5562fac8 Filip Kokosinski 2020-10-13  338  	port->type = PORT_UNKNOWN;
1da81e5562fac8 Filip Kokosinski 2020-10-13  339  	port->line = dev_id;
1da81e5562fac8 Filip Kokosinski 2020-10-13  340  	spin_lock_init(&port->lock);
1da81e5562fac8 Filip Kokosinski 2020-10-13  341  
0f55f89d98c8b3 Ilia Sergachev   2021-11-15  342  	platform_set_drvdata(pdev, port);
0f55f89d98c8b3 Ilia Sergachev   2021-11-15  343  
dd5e90b16cca8a Johan Hovold     2021-11-17  344  	ret = uart_add_one_port(&liteuart_driver, &uart->port);
dd5e90b16cca8a Johan Hovold     2021-11-17  345  	if (ret)
dd5e90b16cca8a Johan Hovold     2021-11-17  346  		goto err_erase_id;
dd5e90b16cca8a Johan Hovold     2021-11-17  347  
dd5e90b16cca8a Johan Hovold     2021-11-17  348  	return 0;
dd5e90b16cca8a Johan Hovold     2021-11-17  349  
dd5e90b16cca8a Johan Hovold     2021-11-17  350  err_erase_id:
dd5e90b16cca8a Johan Hovold     2021-11-17  351  	xa_erase(&liteuart_array, uart->id);
dd5e90b16cca8a Johan Hovold     2021-11-17  352  
dd5e90b16cca8a Johan Hovold     2021-11-17  353  	return ret;
1da81e5562fac8 Filip Kokosinski 2020-10-13  354  }
1da81e5562fac8 Filip Kokosinski 2020-10-13  355  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
