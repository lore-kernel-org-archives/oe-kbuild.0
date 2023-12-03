Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE7F138E
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORGD2gJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585113; x=1733121113;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Fre8yrEfy0je/9r9gHHN4LwTwqhDjsCe6PJLeo2QgA4=;
  b=ORGD2gJf2M8evgIzDRNX/J0KxEvn0xLBE3LX8WVazlmKOnuQ9FpIJvEx
   5MY3bfcGqkE6WY4Ka8upXhaHUlOYxy5kf2IS1UbU5+Ust8UzxiNfTUfU2
   boauiajpuI+MH0eDuPconyxKnIqHpNdNGZYRQ5Sbn079ZDEE6EwjE6LLT
   noBLQt2jHRPOrh5HMoc1Yqvf+S1xSVd6rc/wmKahKyNJ/KT35qgP6klNl
   MoPfBvYOj5VCaQVmxsGxximVBgpwaqQSHdH/6r8FPdUBrI7zV49DgbjgR
   B5aZv5A+z+JGap8S3rikYnqOeGxmCzJ2eACEDJnvX6dIR7E/+3ESESxDO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="6942675"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="6942675"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:31:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="893652739"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="893652739"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 02 Dec 2023 22:31:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g10-0006KE-2H;
	Sun, 03 Dec 2023 06:31:42 +0000
Date: Sun, 3 Dec 2023 14:31:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 3/3] serial: core: Move console character device
 handling from printk
Message-ID: <202312030049.kH4sh6rq-lkp@intel.com>
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
In-Reply-To: <20231121113203.61341-4-tony@atomide.com>
References: <20231121113203.61341-4-tony@atomide.com>
TO: Tony Lindgren <tony@atomide.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
TO: Petr Mladek <pmladek@suse.com>
TO: Steven Rostedt <rostedt@goodmis.org>
TO: John Ogness <john.ogness@linutronix.de>
TO: Sergey Senozhatsky <senozhatsky@chromium.org>
CC: "David S . Miller" <davem@davemloft.net>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Dhruva Gole <d-gole@ti.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Johan Hovold <johan@kernel.org>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: linux-kernel@vger.kernel.org
CC: linux-serial@vger.kernel.org

Hi Tony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.7-rc3 next-20231201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Lindgren/printk-Save-console-options-for-add_preferred_console_match/20231121-193809
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231121113203.61341-4-tony%40atomide.com
patch subject: [PATCH v3 3/3] serial: core: Move console character device handling from printk
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: parisc-randconfig-r081-20231122 (https://download.01.org/0day-ci/archive/20231203/202312030049.kH4sh6rq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312030049.kH4sh6rq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312030049.kH4sh6rq-lkp@intel.com/

smatch warnings:
drivers/tty/serial/serial_base_bus.c:266 serial_base_add_preferred_console() error: uninitialized symbol 'nmbr_match'.
drivers/tty/serial/serial_base_bus.c:265 serial_base_add_preferred_console() error: uninitialized symbol 'char_match'.
drivers/tty/serial/serial_base_bus.c:266 serial_base_add_preferred_console() error: uninitialized symbol 'nmbr_match'.
drivers/tty/serial/serial_base_bus.c:266 serial_base_add_preferred_console() error: uninitialized symbol 'nmbr_match'.
drivers/tty/serial/serial_base_bus.c:266 serial_base_add_preferred_console() error: uninitialized symbol 'nmbr_match'.
drivers/tty/serial/serial_base_bus.c:266 serial_base_add_preferred_console() error: uninitialized symbol 'nmbr_match'.

vim +/nmbr_match +266 drivers/tty/serial/serial_base_bus.c

b1b8726ec3f40b Tony Lindgren 2023-11-21  245  
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  246  /*
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  247   * serial_base_add_preferred_console - Adds a preferred console
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  248   * @drv: Serial port device driver
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  249   * @port: Serial port instance
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  250   *
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  251   * Tries to add a preferred console for a serial port if specified in the
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  252   * kernel command line. Supports both the traditional character device such
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  253   * as console=ttyS0, and a hardware addressing based console=DEVNAME:0.0
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  254   * style name.
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  255   *
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  256   * Translates the kernel command line option using a hardware based addressing
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  257   * console=DEVNAME:0.0 to the serial port character device such as ttyS0.
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  258   *
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  259   * Note that duplicates are ignored by add_preferred_console().
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  260   */
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  261  int serial_base_add_preferred_console(struct uart_driver *drv,
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  262  				      struct uart_port *port)
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  263  {
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  264  	const char *port_match __free(kfree);
b1b8726ec3f40b Tony Lindgren 2023-11-21 @265  	const char *char_match __free(kfree);
b1b8726ec3f40b Tony Lindgren 2023-11-21 @266  	const char *nmbr_match __free(kfree);
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  267  	int ret;
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  268  
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  269  	port_match = kasprintf(GFP_KERNEL, "%s:%i.%i", dev_name(port->dev),
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  270  			       port->ctrl_id, port->port_id);
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  271  	if (!port_match)
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  272  		return -ENOMEM;
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  273  
b1b8726ec3f40b Tony Lindgren 2023-11-21  274  	char_match = kasprintf(GFP_KERNEL, "%s%i", drv->dev_name, port->line);
b1b8726ec3f40b Tony Lindgren 2023-11-21  275  	if (!char_match)
b1b8726ec3f40b Tony Lindgren 2023-11-21  276  		return -ENOMEM;
b1b8726ec3f40b Tony Lindgren 2023-11-21  277  
b1b8726ec3f40b Tony Lindgren 2023-11-21  278  	/* Handle ttyS specific options */
b1b8726ec3f40b Tony Lindgren 2023-11-21  279  	if (!strncmp(drv->dev_name, "ttyS", 4)) {
b1b8726ec3f40b Tony Lindgren 2023-11-21  280  		/* No name, just a number */
b1b8726ec3f40b Tony Lindgren 2023-11-21  281  		nmbr_match = kasprintf(GFP_KERNEL, "%i", port->line);
b1b8726ec3f40b Tony Lindgren 2023-11-21  282  		if (!nmbr_match)
b1b8726ec3f40b Tony Lindgren 2023-11-21  283  			return -ENODEV;
b1b8726ec3f40b Tony Lindgren 2023-11-21  284  
b1b8726ec3f40b Tony Lindgren 2023-11-21  285  		ret = add_preferred_console_match(nmbr_match, drv->dev_name,
b1b8726ec3f40b Tony Lindgren 2023-11-21  286  						  port->line);
b1b8726ec3f40b Tony Lindgren 2023-11-21  287  		if (ret && ret != -ENOENT)
b1b8726ec3f40b Tony Lindgren 2023-11-21  288  			return ret;
b1b8726ec3f40b Tony Lindgren 2023-11-21  289  
b1b8726ec3f40b Tony Lindgren 2023-11-21  290  		/* Sparc ttya and ttyb */
b1b8726ec3f40b Tony Lindgren 2023-11-21  291  		ret = serial_base_add_sparc_console(drv, port);
b1b8726ec3f40b Tony Lindgren 2023-11-21  292  		if (ret)
b1b8726ec3f40b Tony Lindgren 2023-11-21  293  			return ret;
b1b8726ec3f40b Tony Lindgren 2023-11-21  294  	}
b1b8726ec3f40b Tony Lindgren 2023-11-21  295  
b1b8726ec3f40b Tony Lindgren 2023-11-21  296  	/* Handle the traditional character device name style console=ttyS0 */
b1b8726ec3f40b Tony Lindgren 2023-11-21  297  	ret = add_preferred_console_match(char_match, drv->dev_name, port->line);
b1b8726ec3f40b Tony Lindgren 2023-11-21  298  	if (ret && ret != -ENOENT)
b1b8726ec3f40b Tony Lindgren 2023-11-21  299  		return ret;
b1b8726ec3f40b Tony Lindgren 2023-11-21  300  
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  301  	/* Translate a hardware addressing style console=DEVNAME:0.0 */
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  302  	ret = add_preferred_console_match(port_match, drv->dev_name, port->line);
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  303  	if (ret && ret != -ENOENT)
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  304  		return ret;
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  305  
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  306  	return 0;
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  307  }
e4ebdcd790e0f3 Tony Lindgren 2023-11-21  308  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
