Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB6313D628
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jul 2024 19:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721763354; cv=none; b=dnQEWBLsti63xQ24RfkOG0hIIGl/yNJqr7OxBFqx/4NEMQT4reYNHvZfJgXyUW2XKiyo06Tw/yLxG91ISkJ2hgrArzPE3IJ1tA9tSKYk7xN7sctPp7QPlJvXKxmFhdZzZfYJeNMILR9FgfmJITSdvtHTS9w7Gsqugx6Fe32WD44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721763354; c=relaxed/simple;
	bh=nXkiyl/mrjQVViediKVipYCTs37q12Bd5sxMCL1adug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aT15zMFUAyXKBc2NoRlwCSALb9wDCr7vON0H/6OeWWkXDvHn8LhqkgAXhuR+fUZbG7wIzmUbrJEpbiTL2gILZJxjVvFivwwYKrjaytwXGrRzS5vibZgQTdIMglTgCyhQxOmXdlZnk7xQqLwP0s1Ecpg5y7HrG3yA/aaZmOfngcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QslmPyUR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QslmPyUR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721763352; x=1753299352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nXkiyl/mrjQVViediKVipYCTs37q12Bd5sxMCL1adug=;
  b=QslmPyURzN2jF86oMU9FXPqJSlogELTZ6aXOMYUL1Qg/ZSBj70IAz8VX
   de4JNJiZgdWyB8AKThJMHQQhY9UID9WVS7vhOt6/1lAjWbqSdEUGCGXEm
   fwlBw+4TO+nD6S5pUBPR5CtbcIxY34CSvXOeV1Y1LwKkMzoHJaLXEUN45
   mzC5QG8Y8cJ+yArCZeGh34H07KzGQTUhAAhs0+ls8dQ3zx7UaIB4qVwZp
   8rPQslyODk2gFT9J7io3V1qMI8xIrT9yudX6TKv7cTot652ZZUZCjzriN
   nV+C67Xcbb6evTDa0oYlqqlAVpZCQdwO+2rnkAi7ZzSPhPIzvY6hRDRSg
   w==;
X-CSE-ConnectionGUID: cjj4e5H1QWuI0iJQ9Rxi4w==
X-CSE-MsgGUID: 1M5qaUvQSBy+Gb9rWwkW0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="44833991"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="44833991"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 12:35:51 -0700
X-CSE-ConnectionGUID: DkCrXJeMTaqYSYmlu8mRtg==
X-CSE-MsgGUID: WrlIkgHbQImNJVwUIkkyhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="83353567"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jul 2024 12:35:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWLIa-000mJ0-0N;
	Tue, 23 Jul 2024 19:35:48 +0000
Date: Wed, 24 Jul 2024 03:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/comedi/drivers/cb_das16_cs.c:203 das16cs_ao_insn_write()
 warn: iterator 'i' not incremented
Message-ID: <202407240308.zUjuRkXo-lkp@intel.com>
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
TO: Ian Abbott <abbotti@mev.co.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   28bbe4ea686a023929d907cc168430b61094811c
commit: 98a15816636044f25be4644db2a3e09fad68aaf7 Revert "comedi: add HAS_IOPORT dependencies"
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: parisc-randconfig-r071-20240723 (https://download.01.org/0day-ci/archive/20240724/202407240308.zUjuRkXo-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407240308.zUjuRkXo-lkp@intel.com/

smatch warnings:
drivers/comedi/drivers/cb_das16_cs.c:203 das16cs_ao_insn_write() warn: iterator 'i' not incremented

vim +/i +203 drivers/comedi/drivers/cb_das16_cs.c

f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18  190  
6b00f53e9175ab drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2014-08-25  191  static int das16cs_ao_insn_write(struct comedi_device *dev,
0a85b6f0ab0d2e drivers/staging/comedi/drivers/cb_das16_cs.c Mithlesh Thukral   2009-06-08  192  				 struct comedi_subdevice *s,
6b00f53e9175ab drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2014-08-25  193  				 struct comedi_insn *insn,
6b00f53e9175ab drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2014-08-25  194  				 unsigned int *data)
f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18  195  {
16a8cdfc135269 drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2012-06-25  196  	struct das16cs_private *devpriv = dev->private;
6b00f53e9175ab drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2014-08-25  197  	unsigned int chan = CR_CHAN(insn->chanspec);
6b00f53e9175ab drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2014-08-25  198  	unsigned int val = s->readback[chan];
944fd0c92ab764 drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2015-10-12  199  	unsigned short misc1;
f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18  200  	int bit;
6b00f53e9175ab drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2014-08-25  201  	int i;
f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18  202  
f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18 @203  	for (i = 0; i < insn->n; i++) {
6b00f53e9175ab drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2014-08-25  204  		val = data[i];
f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18  205  
944fd0c92ab764 drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2015-10-12  206  		outw(devpriv->misc1, dev->iobase + DAS16CS_MISC1_REG);
5f74ea14c07fee drivers/staging/comedi/drivers/cb_das16_cs.c Greg Kroah-Hartman 2009-04-27  207  		udelay(1);
f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18  208  
6f2e618c3bd58d drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2015-10-12  209  		/* raise the DACxCS line for the non-selected channel */
944fd0c92ab764 drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2015-10-12  210  		misc1 = devpriv->misc1 & ~DAS16CS_MISC1_DAC_MASK;
f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18  211  		if (chan)
944fd0c92ab764 drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2015-10-12  212  			misc1 |= DAS16CS_MISC1_DAC0CS;
f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18  213  		else
944fd0c92ab764 drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2015-10-12  214  			misc1 |= DAS16CS_MISC1_DAC1CS;
f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18  215  
944fd0c92ab764 drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2015-10-12  216  		outw(misc1, dev->iobase + DAS16CS_MISC1_REG);
5f74ea14c07fee drivers/staging/comedi/drivers/cb_das16_cs.c Greg Kroah-Hartman 2009-04-27  217  		udelay(1);
f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18  218  
f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18  219  		for (bit = 15; bit >= 0; bit--) {
6f2e618c3bd58d drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2015-10-12  220  			if ((val >> bit) & 0x1)
944fd0c92ab764 drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2015-10-12  221  				misc1 |= DAS16CS_MISC1_DACSD;
6f2e618c3bd58d drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2015-10-12  222  			else
944fd0c92ab764 drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2015-10-12  223  				misc1 &= ~DAS16CS_MISC1_DACSD;
944fd0c92ab764 drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2015-10-12  224  			outw(misc1, dev->iobase + DAS16CS_MISC1_REG);
5f74ea14c07fee drivers/staging/comedi/drivers/cb_das16_cs.c Greg Kroah-Hartman 2009-04-27  225  			udelay(1);
944fd0c92ab764 drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2015-10-12  226  			outw(misc1 | DAS16CS_MISC1_DACCLK,
2845efb967ed9d drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2015-10-12  227  			     dev->iobase + DAS16CS_MISC1_REG);
5f74ea14c07fee drivers/staging/comedi/drivers/cb_das16_cs.c Greg Kroah-Hartman 2009-04-27  228  			udelay(1);
f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18  229  		}
0a77678cae47fb drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2012-06-25  230  		/*
0a77678cae47fb drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2012-06-25  231  		 * Make both DAC0CS and DAC1CS high to load
0a77678cae47fb drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2012-06-25  232  		 * the new data and update analog the output
0a77678cae47fb drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2012-06-25  233  		 */
944fd0c92ab764 drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2015-10-12  234  		outw(misc1 | DAS16CS_MISC1_DAC0CS | DAS16CS_MISC1_DAC1CS,
6f2e618c3bd58d drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2015-10-12  235  		     dev->iobase + DAS16CS_MISC1_REG);
f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18  236  	}
6b00f53e9175ab drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2014-08-25  237  	s->readback[chan] = val;
f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18  238  
6b00f53e9175ab drivers/staging/comedi/drivers/cb_das16_cs.c H Hartley Sweeten  2014-08-25  239  	return insn->n;
f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18  240  }
f0922ec52c3f57 drivers/staging/comedi/drivers/cb_das16_cs.c David Schleef      2009-02-18  241  

:::::: The code at line 203 was first introduced by commit
:::::: f0922ec52c3f575aef2860b52dbb246274aec03f Staging: comedi: add cb_das16_cs driver

:::::: TO: David Schleef <ds@schleef.org>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
