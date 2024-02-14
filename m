Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20F0125AF
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Feb 2024 08:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707899388; cv=none; b=daislVBsaVd4BCmuucQGx/fTV7jnGcYZKiSJkwl7EKSXsCUdsQusVgPJq/tE6LOrACTCE349Up/QjKGCjcZpDwB/dEGUisMiYdy7kM2ierW9tmKyN5KNLZYNt3+bFZ3jH9anqHSdJJeWNaxwStSKK072aIzvf6rzfvvLXtBzED0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707899388; c=relaxed/simple;
	bh=GTlzN7ujxbLj6T9p1dmovR7dEd2kYXi7KojzEi8RLyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CO+2sPbanN1aKA87GjU7svAW+BsjxEqyN0O2Yo2SUO+hatm9d8k4PFOR+9OHpqmZrUqlHq705T/S0e6qhzi9gAXl57Vtqay8A+KXYuN6sPxZ7tVd736FSgVdxKKIidbUg97J5cKuJKROPM2wmBoCAK7J7n5eqM7tqrEYnmdz/wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsrHJTu2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsrHJTu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707899385; x=1739435385;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GTlzN7ujxbLj6T9p1dmovR7dEd2kYXi7KojzEi8RLyA=;
  b=hsrHJTu2EWKr+/z6KMrn20ZHNSZY600rJgLo5l3G3dpalkYotvHJkk9T
   JoRY3h5qwJ07xuZtrHpxSeCWL3wEwYOasrUAQliHMctSqTH7ToN++u779
   sQhREojzTbj3Wnw/QO+xADMSwVkWbkrPPxmTetchDMHwOQ5Mic6tIXfDr
   LFUdQ6GTtYWZlqyUP71DorwWljayeraCwL/PjS8TpUE2PsmEjgm24hQSp
   S4nLE4uCElu5biTSO+Z8byL/pTYJEjF8Pz67jE7gM+5ZDBSg8HAj7pgwb
   nIgr1XhE8c98oRhgz4c6lsXm55BAZy/JWHqyw2v1sx3t+SWQUTpUX7kB6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19445322"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="19445322"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 00:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="7874638"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Feb 2024 00:29:41 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raAeA-0008b4-0J;
	Wed, 14 Feb 2024 08:29:38 +0000
Date: Wed, 14 Feb 2024 16:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 4/6] serial: core: Add support for DEVNAME:0.0 style
 naming for kernel console
Message-ID: <202402141619.BqEGGzwm-lkp@intel.com>
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
In-Reply-To: <20240213084545.40617-5-tony@atomide.com>
References: <20240213084545.40617-5-tony@atomide.com>
TO: Tony Lindgren <tony@atomide.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
TO: Petr Mladek <pmladek@suse.com>
TO: Steven Rostedt <rostedt@goodmis.org>
TO: John Ogness <john.ogness@linutronix.de>
TO: Sergey Senozhatsky <senozhatsky@chromium.org>
CC: "David S . Miller" <davem@davemloft.net>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Dhruva Gole <d-gole@ti.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Johan Hovold <johan@kernel.org>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: linux-kernel@vger.kernel.org
CC: linux-serial@vger.kernel.org

Hi Tony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6cc3028f797a549f256d593867a769ab6a8265f2]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Lindgren/printk-Save-console-options-for-add_preferred_console_match/20240213-171012
base:   6cc3028f797a549f256d593867a769ab6a8265f2
patch link:    https://lore.kernel.org/r/20240213084545.40617-5-tony%40atomide.com
patch subject: [PATCH v6 4/6] serial: core: Add support for DEVNAME:0.0 style naming for kernel console
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: i386-randconfig-141-20240214 (https://download.01.org/0day-ci/archive/20240214/202402141619.BqEGGzwm-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402141619.BqEGGzwm-lkp@intel.com/

smatch warnings:
drivers/tty/serial/serial_base_bus.c:255 serial_base_add_preferred_console() error: uninitialized symbol 'port_match'.

vim +/port_match +255 drivers/tty/serial/serial_base_bus.c

a2020a9ccacd63 Tony Lindgren 2024-02-13  233  
a2020a9ccacd63 Tony Lindgren 2024-02-13  234  /**
a2020a9ccacd63 Tony Lindgren 2024-02-13  235   * serial_base_add_preferred_console - Adds a preferred console
a2020a9ccacd63 Tony Lindgren 2024-02-13  236   * @drv: Serial port device driver
a2020a9ccacd63 Tony Lindgren 2024-02-13  237   * @port: Serial port instance
a2020a9ccacd63 Tony Lindgren 2024-02-13  238   *
a2020a9ccacd63 Tony Lindgren 2024-02-13  239   * Tries to add a preferred console for a serial port if specified in the
a2020a9ccacd63 Tony Lindgren 2024-02-13  240   * kernel command line. Supports both the traditional character device such
a2020a9ccacd63 Tony Lindgren 2024-02-13  241   * as console=ttyS0, and a hardware addressing based console=DEVNAME:0.0
a2020a9ccacd63 Tony Lindgren 2024-02-13  242   * style name.
a2020a9ccacd63 Tony Lindgren 2024-02-13  243   *
a2020a9ccacd63 Tony Lindgren 2024-02-13  244   * Translates the kernel command line option using a hardware based addressing
a2020a9ccacd63 Tony Lindgren 2024-02-13  245   * console=DEVNAME:0.0 to the serial port character device such as ttyS0.
a2020a9ccacd63 Tony Lindgren 2024-02-13  246   * Cannot be called early for ISA ports, depends on struct device.
a2020a9ccacd63 Tony Lindgren 2024-02-13  247   *
a2020a9ccacd63 Tony Lindgren 2024-02-13  248   * Note that duplicates are ignored by add_preferred_console().
a2020a9ccacd63 Tony Lindgren 2024-02-13  249   *
a2020a9ccacd63 Tony Lindgren 2024-02-13  250   * Return: 0 on success, negative error code on failure.
a2020a9ccacd63 Tony Lindgren 2024-02-13  251   */
a2020a9ccacd63 Tony Lindgren 2024-02-13  252  int serial_base_add_preferred_console(struct uart_driver *drv,
a2020a9ccacd63 Tony Lindgren 2024-02-13  253  				      struct uart_port *port)
a2020a9ccacd63 Tony Lindgren 2024-02-13  254  {
a2020a9ccacd63 Tony Lindgren 2024-02-13 @255  	const char *port_match __free(kfree);
a2020a9ccacd63 Tony Lindgren 2024-02-13  256  	int ret;
a2020a9ccacd63 Tony Lindgren 2024-02-13  257  
a2020a9ccacd63 Tony Lindgren 2024-02-13  258  	ret = serial_base_add_prefcon(drv->dev_name, port->line);
a2020a9ccacd63 Tony Lindgren 2024-02-13  259  	if (ret)
a2020a9ccacd63 Tony Lindgren 2024-02-13  260  		return ret;
a2020a9ccacd63 Tony Lindgren 2024-02-13  261  
a2020a9ccacd63 Tony Lindgren 2024-02-13  262  	port_match = kasprintf(GFP_KERNEL, "%s:%i.%i", dev_name(port->dev),
a2020a9ccacd63 Tony Lindgren 2024-02-13  263  			       port->ctrl_id, port->port_id);
a2020a9ccacd63 Tony Lindgren 2024-02-13  264  	if (!port_match)
a2020a9ccacd63 Tony Lindgren 2024-02-13  265  		return -ENOMEM;
a2020a9ccacd63 Tony Lindgren 2024-02-13  266  
a2020a9ccacd63 Tony Lindgren 2024-02-13  267  	/* Translate a hardware addressing style console=DEVNAME:0.0 */
a2020a9ccacd63 Tony Lindgren 2024-02-13  268  	return serial_base_add_one_prefcon(port_match, drv->dev_name, port->line);
a2020a9ccacd63 Tony Lindgren 2024-02-13  269  }
a2020a9ccacd63 Tony Lindgren 2024-02-13  270  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
