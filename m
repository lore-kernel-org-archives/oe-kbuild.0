Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06AD1DA38
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Sep 2023 11:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694603671; x=1726139671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AU8SLyTh6irFdELtFwt83J46oW6P/0fLcRgXH7xysX8=;
  b=l4hoeKgw9WJHq5RGDfWxUSpYQTXsbGMgX+agKMr1dmZ9HjPRKYVNvM/7
   p1xVmqAuSbTM8pKsbz5Q2BxwLg9p+u/3nSk8e6PxTQnq97VNuxbHSus1A
   NvPwPGxcIeBOlf+YjTV88MLBTwznNBg9eNL+D3mNo/nNVtjSSjZyxsMWF
   SJpRLeczwaSSp9XwGhpVRZRZQvKAQG2B2dJP4jKZdS0ytoE1DM43e29Ox
   72pZScaNYIfy09CWtsencslWb9HytdzjjLtDwFrIPzkrzV0Rysic3VwGQ
   I2OfS/ydKeXd4rRu8A+V2LBolgO0bnfXMGA/CpKW3odyVF9qo2nrpoNOW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="363660563"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="363660563"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 04:14:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="917791460"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="917791460"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Sep 2023 04:14:29 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgNpA-0000Qz-0n;
	Wed, 13 Sep 2023 11:14:25 +0000
Date: Wed, 13 Sep 2023 19:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/comedi/drivers/dt3000.c:701 dt3000_auto_attach() warn:
 'pcidev->irq' from request_irq() not released on lines: 645,676.
Message-ID: <202309131931.sFkT4S7o-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3669558bdf354cd352be955ef2764cde6a9bf5ec
commit: 70912985545adc81716164271401c9ffb0acdd0f efi: libstub: Implement devicepath support for initrd commandline loader
date:   10 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131931.sFkT4S7o-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230913/202309131931.sFkT4S7o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309131931.sFkT4S7o-lkp@intel.com/

smatch warnings:
drivers/comedi/drivers/dt3000.c:701 dt3000_auto_attach() warn: 'pcidev->irq' from request_irq() not released on lines: 645,676.
drivers/firmware/efi/libstub/file.c:147 efi_open_device_path() error: we previously assumed 'text_to_dp' could be null (see line 140)

vim +701 drivers/comedi/drivers/dt3000.c

9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  607  
a690b7e535f2f9 drivers/staging/comedi/drivers/dt3000.c Bill Pemberton    2012-11-19  608  static int dt3000_auto_attach(struct comedi_device *dev,
cf7df5864aaac1 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2013-03-05  609  			      unsigned long context)
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  610  {
750af5e568d060 drivers/staging/comedi/drivers/dt3000.c Ian Abbott        2012-10-30  611  	struct pci_dev *pcidev = comedi_to_pci_dev(dev);
476f62eb168f38 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-06-18  612  	const struct dt3k_boardtype *board = NULL;
9a1a6cf8ae5ca5 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2012-10-15  613  	struct dt3k_private *devpriv;
34c43922e62708 drivers/staging/comedi/drivers/dt3000.c Bill Pemberton    2009-03-16  614  	struct comedi_subdevice *s;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  615  	int ret = 0;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  616  
cf7df5864aaac1 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2013-03-05  617  	if (context < ARRAY_SIZE(dt3k_boardtypes))
476f62eb168f38 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-06-18  618  		board = &dt3k_boardtypes[context];
476f62eb168f38 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-06-18  619  	if (!board)
fbbeddfa91df61 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2012-10-25  620  		return -ENODEV;
476f62eb168f38 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-06-18  621  	dev->board_ptr = board;
476f62eb168f38 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-06-18  622  	dev->board_name = board->name;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  623  
0bdab509bf9c6d drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2013-06-24  624  	devpriv = comedi_alloc_devpriv(dev, sizeof(*devpriv));
c34fa261b0ac3a drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2012-10-23  625  	if (!devpriv)
c34fa261b0ac3a drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2012-10-23  626  		return -ENOMEM;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  627  
818f569fe930c5 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2013-03-13  628  	ret = comedi_pci_enable(dev);
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  629  	if (ret < 0)
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  630  		return ret;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  631  
fee3b2455c849b drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2014-07-29  632  	dev->mmio = pci_ioremap_bar(pcidev, 0);
fee3b2455c849b drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2014-07-29  633  	if (!dev->mmio)
5512a35b38f9ca drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2012-07-18  634  		return -ENOMEM;
5512a35b38f9ca drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2012-07-18  635  
98f6303b6faf34 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2013-12-05  636  	if (pcidev->irq) {
fbbeddfa91df61 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2012-10-25  637  		ret = request_irq(pcidev->irq, dt3k_interrupt, IRQF_SHARED,
fbbeddfa91df61 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2012-10-25  638  				  dev->board_name, dev);
98f6303b6faf34 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2013-12-05  639  		if (ret == 0)
606f1295cfe8fd drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2012-07-18  640  			dev->irq = pcidev->irq;
98f6303b6faf34 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2013-12-05  641  	}
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  642  
2f0b9d082e5d00 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2012-06-11  643  	ret = comedi_alloc_subdevices(dev, 4);
8b6c56949ffa83 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2012-06-12  644  	if (ret)
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  645  		return ret;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  646  
2e310235ca8f26 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-10-08  647  	/* Analog Input subdevice */
9263cd67b95e28 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2012-09-05  648  	s = &dev->subdevices[0];
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  649  	s->type		= COMEDI_SUBD_AI;
98f6303b6faf34 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2013-12-05  650  	s->subdev_flags	= SDF_READABLE | SDF_GROUND | SDF_DIFF;
476f62eb168f38 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-06-18  651  	s->n_chan	= board->adchan;
91644956fd5399 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-10-08  652  	s->maxdata	= board->ai_is_16bit ? 0xffff : 0x0fff;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  653  	s->range_table	= &range_dt3000_ai;	/* XXX */
2e310235ca8f26 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-10-08  654  	s->insn_read	= dt3k_ai_insn_read;
98f6303b6faf34 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2013-12-05  655  	if (dev->irq) {
98f6303b6faf34 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2013-12-05  656  		dev->read_subdev = s;
98f6303b6faf34 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2013-12-05  657  		s->subdev_flags	|= SDF_CMD_READ;
98f6303b6faf34 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2013-12-05  658  		s->len_chanlist	= 512;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  659  		s->do_cmd	= dt3k_ai_cmd;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  660  		s->do_cmdtest	= dt3k_ai_cmdtest;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  661  		s->cancel	= dt3k_ai_cancel;
98f6303b6faf34 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2013-12-05  662  	}
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  663  
78c2f455e2efcb drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-10-08  664  	/* Analog Output subdevice */
9263cd67b95e28 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2012-09-05  665  	s = &dev->subdevices[1];
78c2f455e2efcb drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-10-08  666  	if (board->has_ao) {
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  667  		s->type		= COMEDI_SUBD_AO;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  668  		s->subdev_flags	= SDF_WRITABLE;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  669  		s->n_chan	= 2;
78c2f455e2efcb drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-10-08  670  		s->maxdata	= 0x0fff;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  671  		s->range_table	= &range_bipolar10;
41e7a107104d74 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2014-08-25  672  		s->insn_write	= dt3k_ao_insn_write;
41e7a107104d74 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2014-08-25  673  
41e7a107104d74 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2014-08-25  674  		ret = comedi_alloc_subdev_readback(s);
41e7a107104d74 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2014-08-25  675  		if (ret)
41e7a107104d74 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2014-08-25  676  			return ret;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  677  
78c2f455e2efcb drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-10-08  678  	} else {
78c2f455e2efcb drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-10-08  679  		s->type		= COMEDI_SUBD_UNUSED;
78c2f455e2efcb drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-10-08  680  	}
78c2f455e2efcb drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-10-08  681  
3a7b06f7329668 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-10-08  682  	/* Digital I/O subdevice */
9263cd67b95e28 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2012-09-05  683  	s = &dev->subdevices[2];
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  684  	s->type		= COMEDI_SUBD_DIO;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  685  	s->subdev_flags	= SDF_READABLE | SDF_WRITABLE;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  686  	s->n_chan	= 8;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  687  	s->maxdata	= 1;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  688  	s->range_table	= &range_digital;
3a7b06f7329668 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-10-08  689  	s->insn_config	= dt3k_dio_insn_config;
3a7b06f7329668 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-10-08  690  	s->insn_bits	= dt3k_dio_insn_bits;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  691  
649c836ea37d30 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-10-08  692  	/* Memory subdevice */
9263cd67b95e28 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2012-09-05  693  	s = &dev->subdevices[3];
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  694  	s->type		= COMEDI_SUBD_MEMORY;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  695  	s->subdev_flags	= SDF_READABLE;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  696  	s->n_chan	= 0x1000;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  697  	s->maxdata	= 0xff;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  698  	s->range_table	= &range_unknown;
649c836ea37d30 drivers/staging/comedi/drivers/dt3000.c H Hartley Sweeten 2015-10-08  699  	s->insn_read	= dt3k_mem_insn_read;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  700  
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19 @701  	return 0;
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  702  }
9a21297d79ea96 drivers/staging/comedi/drivers/dt3000.c David Schleef     2009-02-19  703  

:::::: The code at line 701 was first introduced by commit
:::::: 9a21297d79ea96041e50792ae7ed425450df7350 Staging: comedi: add dt3000 driver

:::::: TO: David Schleef <ds@schleef.org>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
