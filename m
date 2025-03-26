Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A975145B25
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Mar 2025 08:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742978423; cv=none; b=J2JQvgsvhAFaaOr9qBtI+C9wHzFwVlw6/vrxUYGtqPkahSTEjcnNbNOAgTtGdWZG9AfNhSmHLF8uYGa3T+AncNtHZLJ66qwaM8+O1xsbfCAlM+egUfvcNMDh38FITywwqBSwhJvbFidbCJOC4iIUWUDTJbNHEtSnqtzMMVjG7xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742978423; c=relaxed/simple;
	bh=sGMqFxFXfZQLJhP9Qtpconkkfz36+IeGvxt9t6gQi0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N2Ff9o7PFGpc8oYUPeRnHKTXluin3QGZL+jZbzWAwYjfKQXDq556DTbLXEtjVoylO1iJRUxVqfnLNGzbGwueeQcJXqkDbcrKfr8jdNh0p5QBlRQi+o1C47Nn58ENr3y9FRNG2LnrgZcnjsDaOLsVtvN+duFf1E1gKoSTkS0zlTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njMaYe08; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njMaYe08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742978422; x=1774514422;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sGMqFxFXfZQLJhP9Qtpconkkfz36+IeGvxt9t6gQi0Y=;
  b=njMaYe08QuS7w5TVVqIgMwzvzRZkrDCtQ77nox2bhfJDUoFHK/YZkdz7
   sEY0zDw9+3vjmAEJFzfbRmwirsn7+//DnhvxglJaSIcJY/EIusVWPTada
   3oLK7cTxkDkaKr+hMz8wkUlQhmIjdpfgBZ4UZf6NVlumcADLHqNkExjVy
   h4FbRsqiQgMMCC8i5pK26muz1shaUCLud5XamWLkIRgJKiAVrXrDBtssN
   BBh1rlgeDB4P3I61MwOL3LS626wYV4H+nEEzLpL4ISfzuCoo7XY28nqKZ
   DSiUw/5hGOXS6RkKX5/EpcIPw6PkxbnnE3ba6Qq/kNhs5rSi/J31psUtY
   w==;
X-CSE-ConnectionGUID: Q53UewgHSra5gzU7mYzyiA==
X-CSE-MsgGUID: NQzdmywzQm+zaPRVA42vEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44414483"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="44414483"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 01:40:22 -0700
X-CSE-ConnectionGUID: AJKC3nDqSnmDAdfPFstSEg==
X-CSE-MsgGUID: 3qMCKyotRUGXYdmyJRg0FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="124605384"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 26 Mar 2025 01:40:19 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txMJ4-0005b3-05;
	Wed, 26 Mar 2025 08:40:15 +0000
Date: Wed, 26 Mar 2025 16:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/platform/cznic/turris-omnia-mcu-gpio.c:1068:7-32: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202503261645.at3TFpTO-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Marek Behún" <kabel@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>

Hi Marek,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1e26c5e28ca5821a824e90dd359556f5e9e7b89f
commit: 74a22fced5a012c57f56d1cf7ea926cc366a2a3a platform: cznic: turris-omnia-mcu: Make poweroff and wakeup code optional
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: loongarch-randconfig-r052-20250326 (https://download.01.org/0day-ci/archive/20250326/202503261645.at3TFpTO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503261645.at3TFpTO-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/platform/cznic/turris-omnia-mcu-gpio.c:1068:7-32: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +1068 drivers/platform/cznic/turris-omnia-mcu-gpio.c

dfa556e45ae9ec Marek Behún 2024-07-01   999  
dfa556e45ae9ec Marek Behún 2024-07-01  1000  int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
dfa556e45ae9ec Marek Behún 2024-07-01  1001  {
dfa556e45ae9ec Marek Behún 2024-07-01  1002  	bool new_api = mcu->features & OMNIA_FEAT_NEW_INT_API;
dfa556e45ae9ec Marek Behún 2024-07-01  1003  	struct device *dev = &mcu->client->dev;
dfa556e45ae9ec Marek Behún 2024-07-01  1004  	unsigned long irqflags;
dfa556e45ae9ec Marek Behún 2024-07-01  1005  	int err;
dfa556e45ae9ec Marek Behún 2024-07-01  1006  
dfa556e45ae9ec Marek Behún 2024-07-01  1007  	err = devm_mutex_init(dev, &mcu->lock);
dfa556e45ae9ec Marek Behún 2024-07-01  1008  	if (err)
dfa556e45ae9ec Marek Behún 2024-07-01  1009  		return err;
dfa556e45ae9ec Marek Behún 2024-07-01  1010  
dfa556e45ae9ec Marek Behún 2024-07-01  1011  	mcu->gc.request = omnia_gpio_request;
dfa556e45ae9ec Marek Behún 2024-07-01  1012  	mcu->gc.get_direction = omnia_gpio_get_direction;
dfa556e45ae9ec Marek Behún 2024-07-01  1013  	mcu->gc.direction_input = omnia_gpio_direction_input;
dfa556e45ae9ec Marek Behún 2024-07-01  1014  	mcu->gc.direction_output = omnia_gpio_direction_output;
dfa556e45ae9ec Marek Behún 2024-07-01  1015  	mcu->gc.get = omnia_gpio_get;
dfa556e45ae9ec Marek Behún 2024-07-01  1016  	mcu->gc.get_multiple = omnia_gpio_get_multiple;
dfa556e45ae9ec Marek Behún 2024-07-01  1017  	mcu->gc.set = omnia_gpio_set;
dfa556e45ae9ec Marek Behún 2024-07-01  1018  	mcu->gc.set_multiple = omnia_gpio_set_multiple;
dfa556e45ae9ec Marek Behún 2024-07-01  1019  	mcu->gc.init_valid_mask = omnia_gpio_init_valid_mask;
dfa556e45ae9ec Marek Behún 2024-07-01  1020  	mcu->gc.can_sleep = true;
dfa556e45ae9ec Marek Behún 2024-07-01  1021  	mcu->gc.names = omnia_mcu_gpio_templates;
dfa556e45ae9ec Marek Behún 2024-07-01  1022  	mcu->gc.base = -1;
dfa556e45ae9ec Marek Behún 2024-07-01  1023  	mcu->gc.ngpio = ARRAY_SIZE(omnia_gpios);
dfa556e45ae9ec Marek Behún 2024-07-01  1024  	mcu->gc.label = "Turris Omnia MCU GPIOs";
dfa556e45ae9ec Marek Behún 2024-07-01  1025  	mcu->gc.parent = dev;
dfa556e45ae9ec Marek Behún 2024-07-01  1026  	mcu->gc.owner = THIS_MODULE;
dfa556e45ae9ec Marek Behún 2024-07-01  1027  	mcu->gc.of_gpio_n_cells = 3;
dfa556e45ae9ec Marek Behún 2024-07-01  1028  	mcu->gc.of_xlate = omnia_gpio_of_xlate;
dfa556e45ae9ec Marek Behún 2024-07-01  1029  
dfa556e45ae9ec Marek Behún 2024-07-01  1030  	gpio_irq_chip_set_chip(&mcu->gc.irq, &omnia_mcu_irq_chip);
dfa556e45ae9ec Marek Behún 2024-07-01  1031  	/* This will let us handle the parent IRQ in the driver */
dfa556e45ae9ec Marek Behún 2024-07-01  1032  	mcu->gc.irq.parent_handler = NULL;
dfa556e45ae9ec Marek Behún 2024-07-01  1033  	mcu->gc.irq.num_parents = 0;
dfa556e45ae9ec Marek Behún 2024-07-01  1034  	mcu->gc.irq.parents = NULL;
dfa556e45ae9ec Marek Behún 2024-07-01  1035  	mcu->gc.irq.default_type = IRQ_TYPE_NONE;
dfa556e45ae9ec Marek Behún 2024-07-01  1036  	mcu->gc.irq.handler = handle_bad_irq;
dfa556e45ae9ec Marek Behún 2024-07-01  1037  	mcu->gc.irq.threaded = true;
dfa556e45ae9ec Marek Behún 2024-07-01  1038  	if (new_api)
dfa556e45ae9ec Marek Behún 2024-07-01  1039  		mcu->gc.irq.init_hw = omnia_irq_init_hw;
dfa556e45ae9ec Marek Behún 2024-07-01  1040  	mcu->gc.irq.init_valid_mask = omnia_irq_init_valid_mask;
dfa556e45ae9ec Marek Behún 2024-07-01  1041  
dfa556e45ae9ec Marek Behún 2024-07-01  1042  	err = devm_gpiochip_add_data(dev, &mcu->gc, mcu);
dfa556e45ae9ec Marek Behún 2024-07-01  1043  	if (err)
dfa556e45ae9ec Marek Behún 2024-07-01  1044  		return dev_err_probe(dev, err, "Cannot add GPIO chip\n");
dfa556e45ae9ec Marek Behún 2024-07-01  1045  
dfa556e45ae9ec Marek Behún 2024-07-01  1046  	/*
dfa556e45ae9ec Marek Behún 2024-07-01  1047  	 * Before requesting the interrupt, if firmware does not support the new
dfa556e45ae9ec Marek Behún 2024-07-01  1048  	 * interrupt API, we need to cache the value of the status word, so that
dfa556e45ae9ec Marek Behún 2024-07-01  1049  	 * when it changes, we may compare the new value with the cached one in
dfa556e45ae9ec Marek Behún 2024-07-01  1050  	 * the interrupt handler.
dfa556e45ae9ec Marek Behún 2024-07-01  1051  	 */
dfa556e45ae9ec Marek Behún 2024-07-01  1052  	if (!new_api) {
dfa556e45ae9ec Marek Behún 2024-07-01  1053  		err = omnia_read_status_word_old_fw(mcu, &mcu->last_status);
dfa556e45ae9ec Marek Behún 2024-07-01  1054  		if (err)
dfa556e45ae9ec Marek Behún 2024-07-01  1055  			return dev_err_probe(dev, err,
dfa556e45ae9ec Marek Behún 2024-07-01  1056  					     "Cannot read status word\n");
dfa556e45ae9ec Marek Behún 2024-07-01  1057  
dfa556e45ae9ec Marek Behún 2024-07-01  1058  		INIT_DELAYED_WORK(&mcu->button_release_emul_work,
dfa556e45ae9ec Marek Behún 2024-07-01  1059  				  button_release_emul_fn);
dfa556e45ae9ec Marek Behún 2024-07-01  1060  	}
dfa556e45ae9ec Marek Behún 2024-07-01  1061  
dfa556e45ae9ec Marek Behún 2024-07-01  1062  	irqflags = IRQF_ONESHOT;
dfa556e45ae9ec Marek Behún 2024-07-01  1063  	if (new_api)
dfa556e45ae9ec Marek Behún 2024-07-01  1064  		irqflags |= IRQF_TRIGGER_LOW;
dfa556e45ae9ec Marek Behún 2024-07-01  1065  	else
dfa556e45ae9ec Marek Behún 2024-07-01  1066  		irqflags |= IRQF_TRIGGER_FALLING;
dfa556e45ae9ec Marek Behún 2024-07-01  1067  
dfa556e45ae9ec Marek Behún 2024-07-01 @1068  	err = devm_request_threaded_irq(dev, mcu->client->irq, NULL,

:::::: The code at line 1068 was first introduced by commit
:::::: dfa556e45ae9ecc199e598222debc8f1883a7cce platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs

:::::: TO: Marek Behún <kabel@kernel.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
