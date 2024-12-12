Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB4117C230
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 06:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733983660; cv=none; b=lcVboKl/PKtL4t4FZvy1QV0Nuw1ZpZt6kMW3FsNUzBM2UD6lxa7vazNTUBWZhoM6J2N18Q2rVS+5FHwvze4hUg7pVzPsvFac5OZ5dw9jJbORDffwaDodmdlliyHjAQWyDn5Obmib0gZZn+mZdoODU7UKOehdF+STei+eIPDgHA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733983660; c=relaxed/simple;
	bh=4ZogS1RfOuiLpJQ2N1wMM6SdvD42E8SJhmdwq/WEbgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NWXbUPFHz8ad/ZnbXccecuWtKRjwyHXwK6aKEQrTzUsEn2BENdK1uhyRfELKNyEnecasKZFrZjp85Gt8MzgxH4OcsFSZBp/XJqSExKxODnD6fvHKwi4swtTkoWkJhQH3NG8IpenuKKPPLJQxjjrPasRjM7rtUHXmaQTmyvDXwZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OhxeIpjc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhxeIpjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733983658; x=1765519658;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4ZogS1RfOuiLpJQ2N1wMM6SdvD42E8SJhmdwq/WEbgk=;
  b=OhxeIpjc8vbs5+X1guI26LI8Ck6Q3qBct5rnO6cXSzViKEmLtcv0lIc8
   +w291ToexMuvbD9D34xIEakct281iphDyKmDoT4go17f8moJFPyKHVLaa
   D9pYBs5vtmvt8ndTDmMoZBMK9YU77lll+MSO62OhAUki+PZLMgBqpY7iR
   xsux0v1TMUT5+D3k5+s/2fTyZ0VYaGtVBV3M8N6/asvUz/IvuVqWF64l0
   IvCrHLYvWzz9gt7c5UP4ENw2UtEo9XCx3fKRxaGIyrWS7zk1r4keIrM8J
   HHfjWO45ZwmhIrcM9TGtYCQF4lIzjZnzp/H36YaGdZopABbWfOA7Dciez
   A==;
X-CSE-ConnectionGUID: Vup9CxvVROCqWlEmdNwXdQ==
X-CSE-MsgGUID: 76w4yOSWRWysjs171EVeFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34513496"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34513496"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 22:07:38 -0800
X-CSE-ConnectionGUID: L6/2HQqUQVeo2CywajutlQ==
X-CSE-MsgGUID: ZHhavwSZSeeUq96nesYvtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="95967180"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Dec 2024 22:07:36 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLcMI-0007US-0h;
	Thu, 12 Dec 2024 06:07:34 +0000
Date: Thu, 12 Dec 2024 14:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/st/cw1200/cw1200_spi.c:440
 cw1200_spi_disconnect() error: we previously assumed 'self' could be null
 (see line 433)
Message-ID: <202412121336.V5NwlFsb-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>
CC: Kalle Valo <kvalo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   231825b2e1ff6ba799c5eaf396d3ab2354e37c6b
commit: 2719a9e7156c4b3983b43db467c1ff96801bda99 wifi: cw1200: Convert to GPIO descriptors
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20241210 (https://download.01.org/0day-ci/archive/20241212/202412121336.V5NwlFsb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412121336.V5NwlFsb-lkp@intel.com/

smatch warnings:
drivers/net/wireless/st/cw1200/cw1200_spi.c:440 cw1200_spi_disconnect() error: we previously assumed 'self' could be null (see line 433)

vim +/self +440 drivers/net/wireless/st/cw1200/cw1200_spi.c

a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  427  
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  428  /* Disconnect Function to be called by SPI stack when device is disconnected */
a0386bba70934d drivers/net/wireless/st/cw1200/cw1200_spi.c Uwe Kleine-König 2022-01-23  429  static void cw1200_spi_disconnect(struct spi_device *func)
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  430  {
911373cca1b455 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-06-01  431  	struct hwbus_priv *self = spi_get_drvdata(func);
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  432  
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24 @433  	if (self) {
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  434  		cw1200_spi_irq_unsubscribe(self);
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  435  		if (self->core) {
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  436  			cw1200_core_release(self->core);
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  437  			self->core = NULL;
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  438  		}
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  439  	}
2719a9e7156c4b drivers/net/wireless/st/cw1200/cw1200_spi.c Linus Walleij    2024-01-31 @440  	cw1200_spi_off(self, dev_get_platdata(&func->dev));
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  441  }
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  442  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
