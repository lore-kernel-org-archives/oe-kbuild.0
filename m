Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67EA1FCF
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRIUyOBh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701599957; x=1733135957;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+iNx2edn/7WK8g13BxBtaJ342pYeRVZr7cgK7PvYFDI=;
  b=MRIUyOBhRb7RAdq65jR3Q6vL0uK/O38yRVQNDzslAMDMVmQJzaPgTOMD
   Bns/mp/Wl6SfxGEcSM5oqj9nRxzrRzWx11YkZPsn8AmagHZ/emqIVCRxb
   7afso+KrhrHdTcP6cpzowEcfLpAFwga1glqU1bjX+/4s8+rbwq8ZXWfpD
   36wrrb2qs21rgXGWoM7O50c4b8mHlr/fswVMHC5d/yK4i3GsMR3CMTW5H
   Uh6YZELdqiJnlkPiWQGWjxk6CzS+s6w+u8tpXu9DpJGAcwymLY17FSZrb
   145MBTPbEE+odwAdAjU6VA7ERYBj3T3jasNEhlmOAY7hHQsmFWKuIbI5b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="678837"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="678837"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 02:39:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="1017549197"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="1017549197"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 03 Dec 2023 02:39:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9jsX-0006Yi-0f;
	Sun, 03 Dec 2023 10:39:13 +0000
Date: Sun, 3 Dec 2023 18:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] serial: core: implement support for rs485-mux-gpios
Message-ID: <202312031811.pmLZJIf5-lkp@intel.com>
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
In-Reply-To: <20231120151056.148450-3-linux@rasmusvillemoes.dk>
References: <20231120151056.148450-3-linux@rasmusvillemoes.dk>
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
CC: devicetree@vger.kernel.org
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Lukas Wunner <lukas@wunner.de>
CC: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: linux-kernel@vger.kernel.org
CC: linux-serial@vger.kernel.org

Hi Rasmus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.7-rc2]
[also build test WARNING on linus/master next-20231201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rasmus-Villemoes/dt-bindings-serial-rs485-add-rs485-mux-gpios-binding/20231120-231551
base:   v6.7-rc2
patch link:    https://lore.kernel.org/r/20231120151056.148450-3-linux%40rasmusvillemoes.dk
patch subject: [PATCH 2/2] serial: core: implement support for rs485-mux-gpios
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: hexagon-randconfig-r071-20231121 (https://download.01.org/0day-ci/archive/20231203/202312031811.pmLZJIf5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312031811.pmLZJIf5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312031811.pmLZJIf5-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/serial_core.c:3651 uart_get_rs485_mode() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/tty/serial/serial_core.c:392 uart_shutdown() error: uninitialized symbol 'flags'.
drivers/tty/serial/serial_core.c:2996 iomem_base_show() warn: argument 3 to %lX specifier is cast from pointer

vim +/PTR_ERR +3651 drivers/tty/serial/serial_core.c

68af43173d3fce Dmitry Safonov        2020-03-02  3580  
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3581  /**
743f93f822be1b Lukas Wunner          2017-11-24  3582   * uart_get_rs485_mode() - retrieve rs485 properties for given uart
a71725619ff63c Randy Dunlap          2020-06-15  3583   * @port: uart device's target port
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3584   *
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3585   * This function implements the device tree binding described in
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3586   * Documentation/devicetree/bindings/serial/rs485.txt.
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3587   */
c150c0f362c1e5 Lukas Wunner          2020-05-12  3588  int uart_get_rs485_mode(struct uart_port *port)
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3589  {
c150c0f362c1e5 Lukas Wunner          2020-05-12  3590  	struct serial_rs485 *rs485conf = &port->rs485;
c150c0f362c1e5 Lukas Wunner          2020-05-12  3591  	struct device *dev = port->dev;
7cda0b9eb6eb9e Andy Shevchenko       2023-10-03  3592  	enum gpiod_flags dflags;
7cda0b9eb6eb9e Andy Shevchenko       2023-10-03  3593  	struct gpio_desc *desc;
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3594  	u32 rs485_delay[2];
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3595  	int ret;
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3596  
743f93f822be1b Lukas Wunner          2017-11-24  3597  	ret = device_property_read_u32_array(dev, "rs485-rts-delay",
743f93f822be1b Lukas Wunner          2017-11-24  3598  					     rs485_delay, 2);
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3599  	if (!ret) {
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3600  		rs485conf->delay_rts_before_send = rs485_delay[0];
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3601  		rs485conf->delay_rts_after_send = rs485_delay[1];
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3602  	} else {
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3603  		rs485conf->delay_rts_before_send = 0;
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3604  		rs485conf->delay_rts_after_send = 0;
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3605  	}
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3606  
4dfd10351e49a7 Lino Sanfilippo       2022-07-10  3607  	uart_sanitize_serial_rs485_delays(port, rs485conf);
4dfd10351e49a7 Lino Sanfilippo       2022-07-10  3608  
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3609  	/*
f1e5b618c1c26c Lukas Wunner          2017-11-24  3610  	 * Clear full-duplex and enabled flags, set RTS polarity to active high
f1e5b618c1c26c Lukas Wunner          2017-11-24  3611  	 * to get to a defined state with the following properties:
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3612  	 */
f1e5b618c1c26c Lukas Wunner          2017-11-24  3613  	rs485conf->flags &= ~(SER_RS485_RX_DURING_TX | SER_RS485_ENABLED |
d58a2df3d8877b Lukas Wunner          2020-05-18  3614  			      SER_RS485_TERMINATE_BUS |
f1e5b618c1c26c Lukas Wunner          2017-11-24  3615  			      SER_RS485_RTS_AFTER_SEND);
f1e5b618c1c26c Lukas Wunner          2017-11-24  3616  	rs485conf->flags |= SER_RS485_RTS_ON_SEND;
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3617  
743f93f822be1b Lukas Wunner          2017-11-24  3618  	if (device_property_read_bool(dev, "rs485-rx-during-tx"))
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3619  		rs485conf->flags |= SER_RS485_RX_DURING_TX;
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3620  
743f93f822be1b Lukas Wunner          2017-11-24  3621  	if (device_property_read_bool(dev, "linux,rs485-enabled-at-boot-time"))
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3622  		rs485conf->flags |= SER_RS485_ENABLED;
f1e5b618c1c26c Lukas Wunner          2017-11-24  3623  
f1e5b618c1c26c Lukas Wunner          2017-11-24  3624  	if (device_property_read_bool(dev, "rs485-rts-active-low")) {
f1e5b618c1c26c Lukas Wunner          2017-11-24  3625  		rs485conf->flags &= ~SER_RS485_RTS_ON_SEND;
f1e5b618c1c26c Lukas Wunner          2017-11-24  3626  		rs485conf->flags |= SER_RS485_RTS_AFTER_SEND;
f1e5b618c1c26c Lukas Wunner          2017-11-24  3627  	}
c150c0f362c1e5 Lukas Wunner          2020-05-12  3628  
d58a2df3d8877b Lukas Wunner          2020-05-18  3629  	/*
d58a2df3d8877b Lukas Wunner          2020-05-18  3630  	 * Disabling termination by default is the safe choice:  Else if many
d58a2df3d8877b Lukas Wunner          2020-05-18  3631  	 * bus participants enable it, no communication is possible at all.
d58a2df3d8877b Lukas Wunner          2020-05-18  3632  	 * Works fine for short cables and users may enable for longer cables.
d58a2df3d8877b Lukas Wunner          2020-05-18  3633  	 */
7cda0b9eb6eb9e Andy Shevchenko       2023-10-03  3634  	desc = devm_gpiod_get_optional(dev, "rs485-term", GPIOD_OUT_LOW);
7cda0b9eb6eb9e Andy Shevchenko       2023-10-03  3635  	if (IS_ERR(desc))
7cda0b9eb6eb9e Andy Shevchenko       2023-10-03  3636  		return dev_err_probe(dev, PTR_ERR(desc), "Cannot get rs485-term-gpios\n");
7cda0b9eb6eb9e Andy Shevchenko       2023-10-03  3637  	port->rs485_term_gpio = desc;
8bec874f84d826 Ilpo Järvinen         2022-07-04  3638  	if (port->rs485_term_gpio)
8bec874f84d826 Ilpo Järvinen         2022-07-04  3639  		port->rs485_supported.flags |= SER_RS485_TERMINATE_BUS;
d58a2df3d8877b Lukas Wunner          2020-05-18  3640  
7cda0b9eb6eb9e Andy Shevchenko       2023-10-03  3641  	dflags = (rs485conf->flags & SER_RS485_RX_DURING_TX) ?
163f080eb717d2 Christoph Niedermaier 2022-12-02  3642  		 GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
7cda0b9eb6eb9e Andy Shevchenko       2023-10-03  3643  	desc = devm_gpiod_get_optional(dev, "rs485-rx-during-tx", dflags);
7cda0b9eb6eb9e Andy Shevchenko       2023-10-03  3644  	if (IS_ERR(desc))
7cda0b9eb6eb9e Andy Shevchenko       2023-10-03  3645  		return dev_err_probe(dev, PTR_ERR(desc), "Cannot get rs485-rx-during-tx-gpios\n");
7cda0b9eb6eb9e Andy Shevchenko       2023-10-03  3646  	port->rs485_rx_during_tx_gpio = desc;
163f080eb717d2 Christoph Niedermaier 2022-12-02  3647  
da0ccd117da1e4 Rasmus Villemoes      2023-11-20  3648  	dflags = (rs485conf->flags & SER_RS485_ENABLED) ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
da0ccd117da1e4 Rasmus Villemoes      2023-11-20  3649  	desc = devm_gpiod_get_optional(dev, "rs485-mux", dflags);
da0ccd117da1e4 Rasmus Villemoes      2023-11-20  3650  	if (IS_ERR(desc))
da0ccd117da1e4 Rasmus Villemoes      2023-11-20 @3651  		return dev_err_probe(dev, PTR_ERR(port->rs485_mux_gpio),
da0ccd117da1e4 Rasmus Villemoes      2023-11-20  3652  				     "Cannot get rs485-mux-gpios\n");
da0ccd117da1e4 Rasmus Villemoes      2023-11-20  3653  	port->rs485_mux_gpio = desc;
da0ccd117da1e4 Rasmus Villemoes      2023-11-20  3654  
c150c0f362c1e5 Lukas Wunner          2020-05-12  3655  	return 0;
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3656  }
743f93f822be1b Lukas Wunner          2017-11-24  3657  EXPORT_SYMBOL_GPL(uart_get_rs485_mode);
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3658  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
