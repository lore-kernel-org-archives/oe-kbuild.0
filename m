Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32929AD5A
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 22:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733092248; cv=none; b=Sre77QXiZM5WzW5Dq5R06UqUf0r5Iy5J6zdQ0EVxszXsdK5hpKvfOB9XsoL5GLXQG7eykxqxc0jhyyOd4bDv4VLmeOinnFpueEKD1j68TMvRfPYcoMppTdnT8vgFhJ/5ypzX1kdqxQ+l4Ls/6aOtXGswX/sUdbt8NjwXOsaxKm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733092248; c=relaxed/simple;
	bh=dKrIsEM0903V9ClRaGjOgsaHCZJZ1cyLeVDPhm6AHQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PZIHFMtJ4NG0t2MA7XEdFJTvd+3hf4aAiClBKlLdvTBbdXet6lmMwoNhjMvTIJUzBu7iY9WFqbOhY1BvBhk4Jdn8sY12hoFrbLWS0lWbZcBEuofYYJuricuVyF9U1eBQVHPI/6yJQeWNrxARtdJ4j2Wcu6Hm0FFIi9sDnX2voj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JC2NK2TC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JC2NK2TC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733092246; x=1764628246;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dKrIsEM0903V9ClRaGjOgsaHCZJZ1cyLeVDPhm6AHQ0=;
  b=JC2NK2TCCCHGUNePraSopo00iPHQ78/BXLqpNwb08ppRiU9bffyL1azr
   tWAeLAY73p0fD55Oxwex274NKRI5rAZsKypXbE9mnlBSuDYVeF8ux5GUV
   XY5OAJJoOjx4ZBN5bn1g464FytBneV5h4NBE371e0RN7ndOQucjoR408E
   o/7Sg/w2PJ8xnuGaYnDTNX04a+eupVneRns04ginxX4TOvyZS5Ec/Bmai
   zMEPYmOqrO8vMkIaV3WFtYMvYjFaLk9GSQlvLQ/FVH0wYbPTAp7aIDipg
   J7yTlJoctu5wbTiOzbvsvy4zUvnGCOQZAemA4aGQm8/1X3dWDzcBILunx
   g==;
X-CSE-ConnectionGUID: LQCyl7AfQnCLHIMFNux9LA==
X-CSE-MsgGUID: cZ3cZmWxR5OzeKrTouuHww==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="43862412"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="43862412"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 14:30:45 -0800
X-CSE-ConnectionGUID: kUW7ievgRbia//Teq+nrzQ==
X-CSE-MsgGUID: qAjqdxfySLK6FFBBvCD5Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="92758593"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2024 14:30:45 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHsSg-0001tR-1v;
	Sun, 01 Dec 2024 22:30:42 +0000
Date: Mon, 2 Dec 2024 06:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/st/cw1200/cw1200_spi.c:440
 cw1200_spi_disconnect() error: we previously assumed 'self' could be null
 (see line 433)
Message-ID: <202412020634.KMaI6dDS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Linus Walleij <linus.walleij@linaro.org>
CC: Kalle Valo <kvalo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
commit: 2719a9e7156c4b3983b43db467c1ff96801bda99 wifi: cw1200: Convert to GPIO descriptors
date:   10 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-r073-20241111 (https://download.01.org/0day-ci/archive/20241202/202412020634.KMaI6dDS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412020634.KMaI6dDS-lkp@intel.com/

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
