Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3C9F9CB
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Sep 2024 19:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726687124; cv=none; b=Ors97jBFg6C/cRgUQZkko7OCd+MOLqD03RhmCox3qcQa6SZXRzEGVjX3LNypClRBv9O8llEadkxAZPTZb7pGFB9a6/BY/sKXnF0kE6ha8JYDJWovKk0OFsS//raP/PMdJhJW/a8XtkKr1unAO5H3rSRL4H24rTEn+ldFsMqs+E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726687124; c=relaxed/simple;
	bh=DKyzLSDiDeVn5icZkOSJ+GJXklqs8M4914GVNhYFnpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=agasgj5wVd+RlXS+4mgIReLfPeVoyv70EC/uqnwxyMuh43XRUtzEWVgJvSyDUNYcbyZTVwOKky6KdyozHHpO4H0DNVdV3PU8NVB/RF20UX/qQGCDkCl4lmFm8Nmbyd3Z5TF5TuOz/4e+UiU9cgQNR4QocbhiRoPwv7XxV8VdMCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZiXI5t6a; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZiXI5t6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726687121; x=1758223121;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DKyzLSDiDeVn5icZkOSJ+GJXklqs8M4914GVNhYFnpw=;
  b=ZiXI5t6a1v+gw56q2xY5Y1lQvyIANsdakUg1V9BcRk0Fg/M2bwToG3eD
   YnSg5r3rsftQPfkh8YzVHu4Xnq2kkhB49DURXX0irJP874zZg/A09s6FJ
   6l1La0WxDJaqbQlt2HdJjzXTcPdQUgn9qXFL8lXKl5RZa1fRBRk1wiwp4
   1TMvdxILPcRPhISnDzhuZ8MrDLPtJhzWp5fbG3C7t1TK7K31ocTBfX9LL
   l2YDz1iffxIuNkjBTpoRBqGO0/rOPUdPQ6d5YCXNGQXHAryC8dquoeJIV
   AZgy1JM0tPf0mUHgxNsY7Lddiug2u2a+FfD6XmB6g6LCra6G8Tsd74dO7
   w==;
X-CSE-ConnectionGUID: U9SPBNQFSl+YdvJ0qCYwQA==
X-CSE-MsgGUID: O6l+qr/nS0ayZ5ZxCU/DfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36994778"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="36994778"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 12:18:41 -0700
X-CSE-ConnectionGUID: /fGRk/RYS3yf/NjGg4A7bw==
X-CSE-MsgGUID: T+VC+0HcRVmJGX4NMaXUng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="69919457"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Sep 2024 12:18:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sr0CD-000CY8-12;
	Wed, 18 Sep 2024 19:18:37 +0000
Date: Thu, 19 Sep 2024 03:18:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] usb: gadget: r8a66597-udc: Fix double free in
 r8a66597_probe
Message-ID: <202409190243.3kr904bW-lkp@intel.com>
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
In-Reply-To: <20240916222937.12878-1-m.arhipov@rosa.ru>
References: <20240916222937.12878-1-m.arhipov@rosa.ru>
TO: Mikhail Arkhipov <m.arhipov@rosa.ru>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Mikhail Arkhipov <m.arhipov@rosa.ru>
CC: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
CC: Felipe Balbi <balbi@ti.com>
CC: Ben Dooks <ben.dooks@codethink.co.uk>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: linux-usb@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: lvc-project@linuxtesting.org

Hi Mikhail,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.11 next-20240917]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mikhail-Arkhipov/usb-gadget-r8a66597-udc-Fix-double-free-in-r8a66597_probe/20240917-063133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240916222937.12878-1-m.arhipov%40rosa.ru
patch subject: [PATCH] usb: gadget: r8a66597-udc: Fix double free in r8a66597_probe
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240917 (https://download.01.org/0day-ci/archive/20240919/202409190243.3kr904bW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409190243.3kr904bW-lkp@intel.com/

New smatch warnings:
drivers/usb/gadget/udc/r8a66597-udc.c:1962 r8a66597_probe() warn: curly braces intended?
drivers/usb/gadget/udc/r8a66597-udc.c:1964 r8a66597_probe() warn: inconsistent indenting

Old smatch warnings:
drivers/usb/gadget/udc/r8a66597-udc.c:1680 r8a66597_set_wedge() warn: can 'ep' even be NULL?

vim +1962 drivers/usb/gadget/udc/r8a66597-udc.c

b8a56e17e18cca drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2011-09-30  1832  
dad833823f842b drivers/usb/gadget/r8a66597-udc.c     Peter Chen                2014-05-18  1833  static int r8a66597_probe(struct platform_device *pdev)
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1834  {
f390f57c91c9c9 drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1835  	struct device *dev = &pdev->dev;
d2e27bdf2870e5 drivers/usb/gadget/r8a66597-udc.c     Magnus Damm               2009-08-19  1836  	char clk_name[8];
3c60e959fa3543 drivers/usb/gadget/udc/r8a66597-udc.c YueHaibing                2019-09-04  1837  	struct resource *ires;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1838  	int irq;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1839  	void __iomem *reg = NULL;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1840  	struct r8a66597 *r8a66597 = NULL;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1841  	int ret = 0;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1842  	int i;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1843  	unsigned long irq_trigger;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1844  
3c60e959fa3543 drivers/usb/gadget/udc/r8a66597-udc.c YueHaibing                2019-09-04  1845  	reg = devm_platform_ioremap_resource(pdev, 0);
4b11f88821aff3 drivers/usb/gadget/udc/r8a66597-udc.c Wei Yongjun               2014-07-20  1846  	if (IS_ERR(reg))
4b11f88821aff3 drivers/usb/gadget/udc/r8a66597-udc.c Wei Yongjun               2014-07-20  1847  		return PTR_ERR(reg);
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1848  
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1849  	ires = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
9c2076090c2815 drivers/usb/gadget/udc/r8a66597-udc.c Colin Ian King            2021-04-06  1850  	if (!ires)
9c2076090c2815 drivers/usb/gadget/udc/r8a66597-udc.c Colin Ian King            2021-04-06  1851  		return -EINVAL;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1852  	irq = ires->start;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1853  	irq_trigger = ires->flags & IRQF_TRIGGER_MASK;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1854  
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1855  	if (irq < 0) {
f390f57c91c9c9 drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1856  		dev_err(dev, "platform_get_irq error.\n");
776976a67ae25d drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1857  		return -ENODEV;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1858  	}
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1859  
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1860  	/* initialize ucd */
531bc938f9c54c drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1861  	r8a66597 = devm_kzalloc(dev, sizeof(struct r8a66597), GFP_KERNEL);
531bc938f9c54c drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1862  	if (r8a66597 == NULL)
531bc938f9c54c drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1863  		return -ENOMEM;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1864  
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1865  	spin_lock_init(&r8a66597->lock);
dae8eadf2a8a12 drivers/usb/gadget/r8a66597-udc.c     Jingoo Han                2013-05-23  1866  	platform_set_drvdata(pdev, r8a66597);
f390f57c91c9c9 drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1867  	r8a66597->pdata = dev_get_platdata(dev);
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1868  	r8a66597->irq_sense_low = irq_trigger == IRQF_TRIGGER_LOW;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1869  
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1870  	r8a66597->gadget.ops = &r8a66597_gadget_ops;
d327ab5b6d660d drivers/usb/gadget/r8a66597-udc.c     Michal Nazarewicz         2011-11-19  1871  	r8a66597->gadget.max_speed = USB_SPEED_HIGH;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1872  	r8a66597->gadget.name = udc_name;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1873  
e99e88a9d2b067 drivers/usb/gadget/udc/r8a66597-udc.c Kees Cook                 2017-10-16  1874  	timer_setup(&r8a66597->timer, r8a66597_timer, 0);
e8b48669de54d3 drivers/usb/gadget/r8a66597-udc.c     Paul Mundt                2010-06-02  1875  	r8a66597->reg = reg;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1876  
d2e27bdf2870e5 drivers/usb/gadget/r8a66597-udc.c     Magnus Damm               2009-08-19  1877  	if (r8a66597->pdata->on_chip) {
d2e27bdf2870e5 drivers/usb/gadget/r8a66597-udc.c     Magnus Damm               2009-08-19  1878  		snprintf(clk_name, sizeof(clk_name), "usb%d", pdev->id);
3d7037b76ba81a drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1879  		r8a66597->clk = devm_clk_get(dev, clk_name);
d2e27bdf2870e5 drivers/usb/gadget/r8a66597-udc.c     Magnus Damm               2009-08-19  1880  		if (IS_ERR(r8a66597->clk)) {
f390f57c91c9c9 drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1881  			dev_err(dev, "cannot get clock \"%s\"\n", clk_name);
3d7037b76ba81a drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1882  			return PTR_ERR(r8a66597->clk);
d2e27bdf2870e5 drivers/usb/gadget/r8a66597-udc.c     Magnus Damm               2009-08-19  1883  		}
989c78dd56307c drivers/usb/gadget/r8a66597-udc.c     Laurent Pinchart          2013-10-28  1884  		clk_prepare_enable(r8a66597->clk);
d2e27bdf2870e5 drivers/usb/gadget/r8a66597-udc.c     Magnus Damm               2009-08-19  1885  	}
569a50da7fe514 drivers/usb/gadget/r8a66597-udc.c     Viresh Kumar              2012-07-30  1886  
b8a56e17e18cca drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2011-09-30  1887  	if (r8a66597->pdata->sudmac) {
b8a56e17e18cca drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2011-09-30  1888  		ret = r8a66597_sudmac_ioremap(r8a66597, pdev);
b8a56e17e18cca drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2011-09-30  1889  		if (ret < 0)
b8a56e17e18cca drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2011-09-30  1890  			goto clean_up2;
b8a56e17e18cca drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2011-09-30  1891  	}
d2e27bdf2870e5 drivers/usb/gadget/r8a66597-udc.c     Magnus Damm               2009-08-19  1892  
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1893  	disable_controller(r8a66597); /* make sure controller is disabled */
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1894  
4b526951c356c9 drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1895  	ret = devm_request_irq(dev, irq, r8a66597_irq, IRQF_SHARED,
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1896  			       udc_name, r8a66597);
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1897  	if (ret < 0) {
f390f57c91c9c9 drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1898  		dev_err(dev, "request_irq error (%d)\n", ret);
d2e27bdf2870e5 drivers/usb/gadget/r8a66597-udc.c     Magnus Damm               2009-08-19  1899  		goto clean_up2;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1900  	}
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1901  
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1902  	INIT_LIST_HEAD(&r8a66597->gadget.ep_list);
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1903  	r8a66597->gadget.ep0 = &r8a66597->ep[0].ep;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1904  	INIT_LIST_HEAD(&r8a66597->gadget.ep0->ep_list);
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1905  	for (i = 0; i < R8A66597_MAX_NUM_PIPE; i++) {
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1906  		struct r8a66597_ep *ep = &r8a66597->ep[i];
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1907  
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1908  		if (i != 0) {
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1909  			INIT_LIST_HEAD(&r8a66597->ep[i].ep.ep_list);
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1910  			list_add_tail(&r8a66597->ep[i].ep.ep_list,
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1911  					&r8a66597->gadget.ep_list);
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1912  		}
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1913  		ep->r8a66597 = r8a66597;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1914  		INIT_LIST_HEAD(&ep->queue);
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1915  		ep->ep.name = r8a66597_ep_name[i];
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1916  		ep->ep.ops = &r8a66597_ep_ops;
e117e742d31068 drivers/usb/gadget/r8a66597-udc.c     Robert Baldyga            2013-12-13  1917  		usb_ep_set_maxpacket_limit(&ep->ep, 512);
0ec8026d7afee6 drivers/usb/gadget/udc/r8a66597-udc.c Robert Baldyga            2015-07-31  1918  
0ec8026d7afee6 drivers/usb/gadget/udc/r8a66597-udc.c Robert Baldyga            2015-07-31  1919  		if (i == 0) {
0ec8026d7afee6 drivers/usb/gadget/udc/r8a66597-udc.c Robert Baldyga            2015-07-31  1920  			ep->ep.caps.type_control = true;
0ec8026d7afee6 drivers/usb/gadget/udc/r8a66597-udc.c Robert Baldyga            2015-07-31  1921  		} else {
0ec8026d7afee6 drivers/usb/gadget/udc/r8a66597-udc.c Robert Baldyga            2015-07-31  1922  			ep->ep.caps.type_iso = true;
0ec8026d7afee6 drivers/usb/gadget/udc/r8a66597-udc.c Robert Baldyga            2015-07-31  1923  			ep->ep.caps.type_bulk = true;
0ec8026d7afee6 drivers/usb/gadget/udc/r8a66597-udc.c Robert Baldyga            2015-07-31  1924  			ep->ep.caps.type_int = true;
0ec8026d7afee6 drivers/usb/gadget/udc/r8a66597-udc.c Robert Baldyga            2015-07-31  1925  		}
0ec8026d7afee6 drivers/usb/gadget/udc/r8a66597-udc.c Robert Baldyga            2015-07-31  1926  		ep->ep.caps.dir_in = true;
0ec8026d7afee6 drivers/usb/gadget/udc/r8a66597-udc.c Robert Baldyga            2015-07-31  1927  		ep->ep.caps.dir_out = true;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1928  	}
e117e742d31068 drivers/usb/gadget/r8a66597-udc.c     Robert Baldyga            2013-12-13  1929  	usb_ep_set_maxpacket_limit(&r8a66597->ep[0].ep, 64);
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1930  	r8a66597->ep[0].pipenum = 0;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1931  	r8a66597->ep[0].fifoaddr = CFIFO;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1932  	r8a66597->ep[0].fifosel = CFIFOSEL;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1933  	r8a66597->ep[0].fifoctr = CFIFOCTR;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1934  	r8a66597->ep[0].pipectr = get_pipectr_addr(0);
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1935  	r8a66597->pipenum2ep[0] = &r8a66597->ep[0];
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1936  	r8a66597->epaddr2ep[0] = &r8a66597->ep[0];
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1937  
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1938  	r8a66597->ep0_req = r8a66597_alloc_request(&r8a66597->ep[0].ep,
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1939  							GFP_KERNEL);
f3423d3258cd99 drivers/usb/gadget/r8a66597-udc.c     Wei Yongjun               2013-05-07  1940  	if (r8a66597->ep0_req == NULL) {
f3423d3258cd99 drivers/usb/gadget/r8a66597-udc.c     Wei Yongjun               2013-05-07  1941  		ret = -ENOMEM;
885162d171841e drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1942  		goto clean_up2;
f3423d3258cd99 drivers/usb/gadget/r8a66597-udc.c     Wei Yongjun               2013-05-07  1943  	}
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1944  	r8a66597->ep0_req->complete = nop_completion;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1945  
f390f57c91c9c9 drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1946  	ret = usb_add_gadget_udc(dev, &r8a66597->gadget);
0f91349b89f37d drivers/usb/gadget/r8a66597-udc.c     Sebastian Andrzej Siewior 2011-06-28  1947  	if (ret)
0f91349b89f37d drivers/usb/gadget/r8a66597-udc.c     Sebastian Andrzej Siewior 2011-06-28  1948  		goto err_add_udc;
0f91349b89f37d drivers/usb/gadget/r8a66597-udc.c     Sebastian Andrzej Siewior 2011-06-28  1949  
f390f57c91c9c9 drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1950  	dev_info(dev, "version %s\n", DRIVER_VERSION);
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1951  	return 0;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1952  
0f91349b89f37d drivers/usb/gadget/r8a66597-udc.c     Sebastian Andrzej Siewior 2011-06-28  1953  err_add_udc:
0f91349b89f37d drivers/usb/gadget/r8a66597-udc.c     Sebastian Andrzej Siewior 2011-06-28  1954  	r8a66597_free_request(&r8a66597->ep[0].ep, r8a66597->ep0_req);
63c2ed15c3efd6 drivers/usb/gadget/udc/r8a66597-udc.c Mikhail Arkhipov          2024-09-17  1955  	r8a66597->ep0_req = NULL;
d2e27bdf2870e5 drivers/usb/gadget/r8a66597-udc.c     Magnus Damm               2009-08-19  1956  clean_up2:
3d7037b76ba81a drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1957  	if (r8a66597->pdata->on_chip)
989c78dd56307c drivers/usb/gadget/r8a66597-udc.c     Laurent Pinchart          2013-10-28  1958  		clk_disable_unprepare(r8a66597->clk);
885162d171841e drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1959  
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1960  	if (r8a66597->ep0_req)
776976a67ae25d drivers/usb/gadget/r8a66597-udc.c     Ben Dooks                 2014-06-17  1961  		r8a66597_free_request(&r8a66597->ep[0].ep, r8a66597->ep0_req);
63c2ed15c3efd6 drivers/usb/gadget/udc/r8a66597-udc.c Mikhail Arkhipov          2024-09-17 @1962  		r8a66597->ep0_req = NULL;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1963  
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19 @1964  	return ret;
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1965  }
c41442474a2698 drivers/usb/gadget/r8a66597-udc.c     Yoshihiro Shimoda         2009-08-19  1966  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
