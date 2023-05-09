Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779F4137A
	for <oe-kbuild@lists.linux.dev>; Tue,  9 May 2023 03:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683604314; x=1715140314;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bvS/QFJxzBlNXvPy7moAfHwIdlMSYTMCJCwNgjW/FqU=;
  b=fPmgpRsbamx6WhPGbHRZiyjs8wVphMW5SPkWOoozSvmJBsYB4wPw0a2d
   OAJzlj9Xl63rqi9EC3ynfcnogaRGB8Jy5sTKjoeLNrbAXErfqQgy79PaH
   Lfsxr8cntUBYTxJgdhTTTxtr8DGsGIQxtvYNW4ey84tb6U7sF3S4nziNr
   vmBHKaZ58G7AZF1AGdk326vi/TAumPH2s9kzlJG8tY5rwNayT/gpB6Z5h
   Fyb56/MB5DzZRo45pyByd1EvrNExHvhrLyFSkqowNqVO4nuOzcspd26Mf
   UyQg+7IZanvfP2J+4Nh3KiSJEYFOyt3ySMYvlZGLBlqauvQ242V5XvoC0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="339029675"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="339029675"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 20:51:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="810498883"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="810498883"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 May 2023 20:51:52 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwEOF-0001eW-1b;
	Tue, 09 May 2023 03:51:51 +0000
Date: Tue, 9 May 2023 11:50:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v10 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
Message-ID: <202305091121.PdL0GJRJ-lkp@intel.com>
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
In-Reply-To: <20230508110339.38699-1-tony@atomide.com>
References: <20230508110339.38699-1-tony@atomide.com>
TO: Tony Lindgren <tony@atomide.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Dhruva Gole <d-gole@ti.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Johan Hovold <johan@kernel.org>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: linux-omap@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-serial@vger.kernel.org

Hi Tony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.4-rc1 next-20230508]
[cannot apply to tty/tty-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Lindgren/serial-core-Start-managing-serial-controllers-to-enable-runtime-PM/20230508-190805
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20230508110339.38699-1-tony%40atomide.com
patch subject: [PATCH v10 1/1] serial: core: Start managing serial controllers to enable runtime PM
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230509/202305091121.PdL0GJRJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305091121.PdL0GJRJ-lkp@intel.com/

smatch warnings:
drivers/tty/serial/serial_base_bus.c:102 serial_base_device_add() error: uninitialized symbol 'id'.

vim +/id +102 drivers/tty/serial/serial_base_bus.c

2f298f9dbe3a1d Tony Lindgren 2023-05-08   77  
2f298f9dbe3a1d Tony Lindgren 2023-05-08   78  static struct device *serial_base_device_add(struct uart_port *port,
2f298f9dbe3a1d Tony Lindgren 2023-05-08   79  					     struct device *parent_dev,
2f298f9dbe3a1d Tony Lindgren 2023-05-08   80  					     const struct device_type *type)
2f298f9dbe3a1d Tony Lindgren 2023-05-08   81  {
2f298f9dbe3a1d Tony Lindgren 2023-05-08   82  	struct serial_base_device *sbd;
2f298f9dbe3a1d Tony Lindgren 2023-05-08   83  	int err, id;
2f298f9dbe3a1d Tony Lindgren 2023-05-08   84  
2f298f9dbe3a1d Tony Lindgren 2023-05-08   85  	sbd = kzalloc(sizeof(*sbd), GFP_KERNEL);
2f298f9dbe3a1d Tony Lindgren 2023-05-08   86  	if (!sbd)
2f298f9dbe3a1d Tony Lindgren 2023-05-08   87  		return NULL;
2f298f9dbe3a1d Tony Lindgren 2023-05-08   88  
2f298f9dbe3a1d Tony Lindgren 2023-05-08   89  	device_initialize(&sbd->dev);
2f298f9dbe3a1d Tony Lindgren 2023-05-08   90  	sbd->dev.type = type;
2f298f9dbe3a1d Tony Lindgren 2023-05-08   91  	sbd->dev.parent = parent_dev;
2f298f9dbe3a1d Tony Lindgren 2023-05-08   92  	sbd->dev.bus = &serial_base_bus_type;
2f298f9dbe3a1d Tony Lindgren 2023-05-08   93  	sbd->dev.release = &serial_base_release;
2f298f9dbe3a1d Tony Lindgren 2023-05-08   94  
2f298f9dbe3a1d Tony Lindgren 2023-05-08   95  	if (type == &serial_ctrl_type) {
2f298f9dbe3a1d Tony Lindgren 2023-05-08   96  		id = port->ctrl_id;
2f298f9dbe3a1d Tony Lindgren 2023-05-08   97  	} else if (type == &serial_port_type) {
2f298f9dbe3a1d Tony Lindgren 2023-05-08   98  		id = port->line;
2f298f9dbe3a1d Tony Lindgren 2023-05-08   99  		sbd->port = port;
2f298f9dbe3a1d Tony Lindgren 2023-05-08  100  	}
2f298f9dbe3a1d Tony Lindgren 2023-05-08  101  
2f298f9dbe3a1d Tony Lindgren 2023-05-08 @102  	err = dev_set_name(&sbd->dev, "%s.%s.%d", type->name, dev_name(port->dev), id);
2f298f9dbe3a1d Tony Lindgren 2023-05-08  103  	if (err)
2f298f9dbe3a1d Tony Lindgren 2023-05-08  104  		goto err_free_dev;
2f298f9dbe3a1d Tony Lindgren 2023-05-08  105  
2f298f9dbe3a1d Tony Lindgren 2023-05-08  106  	err = device_add(&sbd->dev);
2f298f9dbe3a1d Tony Lindgren 2023-05-08  107  	if (err)
2f298f9dbe3a1d Tony Lindgren 2023-05-08  108  		goto err_put_device;
2f298f9dbe3a1d Tony Lindgren 2023-05-08  109  
2f298f9dbe3a1d Tony Lindgren 2023-05-08  110  	return &sbd->dev;
2f298f9dbe3a1d Tony Lindgren 2023-05-08  111  
2f298f9dbe3a1d Tony Lindgren 2023-05-08  112  err_put_device:
2f298f9dbe3a1d Tony Lindgren 2023-05-08  113  	put_device(&sbd->dev);
2f298f9dbe3a1d Tony Lindgren 2023-05-08  114  
2f298f9dbe3a1d Tony Lindgren 2023-05-08  115  err_free_dev:
2f298f9dbe3a1d Tony Lindgren 2023-05-08  116  	kfree(sbd);
2f298f9dbe3a1d Tony Lindgren 2023-05-08  117  
2f298f9dbe3a1d Tony Lindgren 2023-05-08  118  	return NULL;
2f298f9dbe3a1d Tony Lindgren 2023-05-08  119  }
2f298f9dbe3a1d Tony Lindgren 2023-05-08  120  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
