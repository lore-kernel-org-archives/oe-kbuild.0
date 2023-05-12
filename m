Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DC5A920
	for <oe-kbuild@lists.linux.dev>; Fri, 12 May 2023 14:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683902872; x=1715438872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wp8/gEXxECujSKFn25oBAbHDXLlSyZKrACmmIe0ao+c=;
  b=WfVwzpPPglGHYfBjxFruguAJ/PNUhgPXxhPld5TQkb/HaNnHTW6wvvRx
   pQok96b7Cwi+D6bRRuYmH0Oo8EyJwBOz7s9rQZH2cSN78q0s4UnSubgwz
   JD6si6zoGqvTHz2AKl7GJEd8YwNPiXaWMm1/rr2kXEqImS9HLs6W5xsNQ
   Kc/0p4ZL2wf2Erg40WWdu1hx0TVUy8V/VQeRYNQNWIMSod380YkzgxhZW
   wcoHPPibjajv8IwCdC3dpJa4EkRrocVm0EUsn37zoUumfVEOXhMY3mKE+
   01mx9StLphi3JdVtYZNZPYrDG3mKyfUxTQsGEVbtIxEzW8PjRz6tIlmTS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="335322187"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="335322187"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 07:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="769835476"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="769835476"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 May 2023 07:47:50 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxU3h-0004wO-1k;
	Fri, 12 May 2023 14:47:49 +0000
Date: Fri, 12 May 2023 22:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 8/8] usb_pcwd: remove superfluous usb_device pointer
Message-ID: <202305122231.n8RlGMhT-lkp@intel.com>
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
In-Reply-To: <20230427133350.31064-9-oneukum@suse.com>
References: <20230427133350.31064-9-oneukum@suse.com>
TO: Oliver Neukum <oneukum@suse.com>
TO: wim@linux-watchdog.org
TO: linux@roeck-us.net
TO: linux-watchdog@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Oliver Neukum <oneukum@suse.com>

Hi Oliver,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.4-rc1 next-20230512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/pcwd_usb-stop-open-race-disconnect/20230427-223413
base:   linus/master
patch link:    https://lore.kernel.org/r/20230427133350.31064-9-oneukum%40suse.com
patch subject: [PATCH 8/8] usb_pcwd: remove superfluous usb_device pointer
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: parisc-randconfig-m041-20230509 (https://download.01.org/0day-ci/archive/20230512/202305122231.n8RlGMhT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305122231.n8RlGMhT-lkp@intel.com/

smatch warnings:
drivers/watchdog/pcwd_usb.c:215 usb_pcwd_send_command() warn: variable dereferenced before check 'usb_pcwd' (see line 211)

vim +/usb_pcwd +215 drivers/watchdog/pcwd_usb.c

^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  205  
143a2e54bf5321 drivers/watchdog/pcwd_usb.c      Wim Van Sebroeck   2009-03-18  206  static int usb_pcwd_send_command(struct usb_pcwd_private *usb_pcwd,
143a2e54bf5321 drivers/watchdog/pcwd_usb.c      Wim Van Sebroeck   2009-03-18  207  		unsigned char cmd, unsigned char *msb, unsigned char *lsb)
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  208  {
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  209  	int got_response, count;
5412df0bda90a2 drivers/watchdog/pcwd_usb.c      Guenter Roeck      2013-10-14  210  	unsigned char *buf;
41b4f0869562d7 drivers/watchdog/pcwd_usb.c      Oliver Neukum      2023-04-27 @211  	struct usb_device *udev = interface_to_usbdev(usb_pcwd->interface);
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  212  
143a2e54bf5321 drivers/watchdog/pcwd_usb.c      Wim Van Sebroeck   2009-03-18  213  	/* We will not send any commands if the USB PCWD device does
143a2e54bf5321 drivers/watchdog/pcwd_usb.c      Wim Van Sebroeck   2009-03-18  214  	 * not exist */
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16 @215  	if ((!usb_pcwd) || (!usb_pcwd->exists))
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  216  		return -1;
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  217  
5412df0bda90a2 drivers/watchdog/pcwd_usb.c      Guenter Roeck      2013-10-14  218  	buf = kmalloc(6, GFP_KERNEL);
5412df0bda90a2 drivers/watchdog/pcwd_usb.c      Guenter Roeck      2013-10-14  219  	if (buf == NULL)
5412df0bda90a2 drivers/watchdog/pcwd_usb.c      Guenter Roeck      2013-10-14  220  		return 0;
5412df0bda90a2 drivers/watchdog/pcwd_usb.c      Guenter Roeck      2013-10-14  221  
143a2e54bf5321 drivers/watchdog/pcwd_usb.c      Wim Van Sebroeck   2009-03-18  222  	/* The USB PC Watchdog uses a 6 byte report format.
143a2e54bf5321 drivers/watchdog/pcwd_usb.c      Wim Van Sebroeck   2009-03-18  223  	 * The board currently uses only 3 of the six bytes of the report. */
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  224  	buf[0] = cmd;			/* Byte 0 = CMD */
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  225  	buf[1] = *msb;			/* Byte 1 = Data MSB */
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  226  	buf[2] = *lsb;			/* Byte 2 = Data LSB */
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  227  	buf[3] = buf[4] = buf[5] = 0;	/* All other bytes not used */
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  228  
d7e92f7f768477 drivers/watchdog/pcwd_usb.c      Greg Kroah-Hartman 2013-12-19  229  	dev_dbg(&usb_pcwd->interface->dev,
d7e92f7f768477 drivers/watchdog/pcwd_usb.c      Greg Kroah-Hartman 2013-12-19  230  		"sending following data cmd=0x%02x msb=0x%02x lsb=0x%02x",
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  231  		buf[0], buf[1], buf[2]);
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  232  
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  233  	atomic_set(&usb_pcwd->cmd_received, 0);
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  234  
41b4f0869562d7 drivers/watchdog/pcwd_usb.c      Oliver Neukum      2023-04-27  235  	if (usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  236  			HID_REQ_SET_REPORT, HID_DT_REPORT,
ab5bbdc7015bb3 drivers/watchdog/pcwd_usb.c      Dan Carpenter      2013-11-08  237  			0x0200, usb_pcwd->interface_number, buf, 6,
ab5bbdc7015bb3 drivers/watchdog/pcwd_usb.c      Dan Carpenter      2013-11-08  238  			USB_COMMAND_TIMEOUT) != 6) {
d7e92f7f768477 drivers/watchdog/pcwd_usb.c      Greg Kroah-Hartman 2013-12-19  239  		dev_dbg(&usb_pcwd->interface->dev,
d7e92f7f768477 drivers/watchdog/pcwd_usb.c      Greg Kroah-Hartman 2013-12-19  240  			"usb_pcwd_send_command: error in usb_control_msg for cmd 0x%x 0x%x 0x%x\n",
d7e92f7f768477 drivers/watchdog/pcwd_usb.c      Greg Kroah-Hartman 2013-12-19  241  			cmd, *msb, *lsb);
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  242  	}
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  243  	/* wait till the usb card processed the command,
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  244  	 * with a max. timeout of USB_COMMAND_TIMEOUT */
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  245  	got_response = 0;
143a2e54bf5321 drivers/watchdog/pcwd_usb.c      Wim Van Sebroeck   2009-03-18  246  	for (count = 0; (count < USB_COMMAND_TIMEOUT) && (!got_response);
143a2e54bf5321 drivers/watchdog/pcwd_usb.c      Wim Van Sebroeck   2009-03-18  247  								count++) {
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  248  		mdelay(1);
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  249  		if (atomic_read(&usb_pcwd->cmd_received))
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  250  			got_response = 1;
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  251  	}
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  252  
9e05b78fea8883 drivers/watchdog/pcwd_usb.c      Oliver Neukum      2023-04-27  253  	smp_rmb(); /* ordering with respect to interrupt handler */
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  254  	if ((got_response) && (cmd == usb_pcwd->cmd_command)) {
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  255  		/* read back response */
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  256  		*msb = usb_pcwd->cmd_data_msb;
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  257  		*lsb = usb_pcwd->cmd_data_lsb;
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  258  	}
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  259  
5412df0bda90a2 drivers/watchdog/pcwd_usb.c      Guenter Roeck      2013-10-14  260  	kfree(buf);
5412df0bda90a2 drivers/watchdog/pcwd_usb.c      Guenter Roeck      2013-10-14  261  
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  262  	return got_response;
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  263  }
^1da177e4c3f41 drivers/char/watchdog/pcwd_usb.c Linus Torvalds     2005-04-16  264  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
