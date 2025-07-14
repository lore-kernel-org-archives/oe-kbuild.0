Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006E7944F
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 07:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752478885; cv=none; b=bJjBtWXUfZLprq44x10j9y5DMDnJUhwdkv9NnBbVOhFDMDK6Wk1mMG0XaGSmeN4Tp+xiPRir0IMznTb5wR8U9T4b2eGqYRx+XJT/saBZvwJSaMWJ3GAmE2utbznNJBKNXRZZsm5A2PM354zZmgfBzkYrYBduiViaqRp5UpurF/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752478885; c=relaxed/simple;
	bh=aVM/tHIwQvjGaZCPvz5/E2RlFjifvhkYMwasKHi7vWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EPRRA6NwcTy+zx+siBVGRPVadiA9Lm0qNsgfAFLlZMU3iYUr/u0Vlxar/jrIvC0UAQVxWcxS683IJRqYT4L+OIla2B1ipGf0zoJzoDHj0AFDAutbe2O7l2Ut2bxtirgKUcZRYSa/PwiPIq5t3TXpoLXnoCxV4zRbzr+UV5C4isI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJIC/WFe; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJIC/WFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752478884; x=1784014884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aVM/tHIwQvjGaZCPvz5/E2RlFjifvhkYMwasKHi7vWE=;
  b=dJIC/WFeg/URWrCgeKCIIjJfZI8Bu2ps+ZZkHhGcNYkMQjmIeguEaenE
   Bsa/YPe3xzVBP9Syotw0YAwOFQqXLlFskI8VWuCKUprMOxq65uYobOzYn
   tApW4W/tZYK+gx8Yhv75blKVTtJvfiWPJ2vmM80594MChgEVJc0ulmE79
   AV5oEyduDcRjluRJQnBf98eUdmyVukwCPnuPWVytK2+nanVuC3zPx22tm
   V1V1gWFNfvoOL2/hEAjQKesOEZJ/3Nu6Nb+DOTKp1qJE3feAQP6OyxeFw
   UfiEcQ75vmyp+5dY/MdJgaHPdC9TTSjNHmkVlv1AKZrSXe3RBN8Nxd9SR
   Q==;
X-CSE-ConnectionGUID: qFTcGdnJQTyPsZKaCHrTHw==
X-CSE-MsgGUID: ZClueYPmTYCPDjobUfAP1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="57274062"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="57274062"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 00:41:23 -0700
X-CSE-ConnectionGUID: fsHTFCGgQS6KVIW1k8PRCg==
X-CSE-MsgGUID: 6zxt2k0+QTSZIK4tfl5qdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="156496996"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jul 2025 00:41:21 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubDoO-0008eP-0o;
	Mon, 14 Jul 2025 07:41:20 +0000
Date: Mon, 14 Jul 2025 15:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [brgl:gpio/for-next 45/46] drivers/gpio/gpio-viperboard.c:385:2-8:
 preceding lock on line 380
Message-ID: <202507141754.Jhvrzv5i-lkp@intel.com>
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
CC: linux-gpio@vger.kernel.org
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   e502df58b5e3767c00e887744b6eff43b7fde3ea
commit: 55e2d1eec110f1278324882714b64465e4e58ced [45/46] gpio: viperboard: use new GPIO line value setter callbacks
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: i386-randconfig-051-20250714 (https://download.01.org/0day-ci/archive/20250714/202507141754.Jhvrzv5i-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202507141754.Jhvrzv5i-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-viperboard.c:385:2-8: preceding lock on line 380

vim +385 drivers/gpio/gpio-viperboard.c

9d5b72de0d1627 Lars Poeschel       2012-11-05  370  
9d5b72de0d1627 Lars Poeschel       2012-11-05  371  static int vprbrd_gpiob_direction_output(struct gpio_chip *chip,
d111e7a387d71b Hennie Muller       2019-07-21  372  			unsigned int offset, int value)
9d5b72de0d1627 Lars Poeschel       2012-11-05  373  {
9d5b72de0d1627 Lars Poeschel       2012-11-05  374  	int ret;
2a873c8d623023 Linus Walleij       2015-12-07  375  	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
9d5b72de0d1627 Lars Poeschel       2012-11-05  376  	struct vprbrd *vb = gpio->vb;
9d5b72de0d1627 Lars Poeschel       2012-11-05  377  
9d5b72de0d1627 Lars Poeschel       2012-11-05  378  	gpio->gpiob_out |= (1 << offset);
9d5b72de0d1627 Lars Poeschel       2012-11-05  379  
9d5b72de0d1627 Lars Poeschel       2012-11-05 @380  	mutex_lock(&vb->lock);
9d5b72de0d1627 Lars Poeschel       2012-11-05  381  
9d5b72de0d1627 Lars Poeschel       2012-11-05  382  	ret = vprbrd_gpiob_setdir(vb, offset, 1);
55e2d1eec110f1 Bartosz Golaszewski 2025-07-07  383  	if (ret) {
58383c78425e4e Linus Walleij       2015-11-04  384  		dev_err(chip->parent, "usb error setting pin to output\n");
55e2d1eec110f1 Bartosz Golaszewski 2025-07-07 @385  		return ret;
55e2d1eec110f1 Bartosz Golaszewski 2025-07-07  386  	}
9d5b72de0d1627 Lars Poeschel       2012-11-05  387  
9d5b72de0d1627 Lars Poeschel       2012-11-05  388  	mutex_unlock(&vb->lock);
9d5b72de0d1627 Lars Poeschel       2012-11-05  389  
55e2d1eec110f1 Bartosz Golaszewski 2025-07-07  390  	return vprbrd_gpiob_set(chip, offset, value);
9d5b72de0d1627 Lars Poeschel       2012-11-05  391  }
9d5b72de0d1627 Lars Poeschel       2012-11-05  392  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
