Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FB1A95E
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Nov 2024 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732701090; cv=none; b=j9uRaceL3ygwG7d8c7N1rtTFlpGDJ0x1NjLEw3VBBkE6i/PgWMT0cEMWqQTsNZgDI6I3cZ9kK78gnvvqz+SyMZ7wm1ORLXvM3DTWO9boRo3oyPWJYo2lnlajuHrva/O0ilaFlRH2R8DChuCI1sZKXvgFStmdQb8ESjG0RNlM2xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732701090; c=relaxed/simple;
	bh=VkzwXG/T0beT4ilgB/usUee6apo+R5skys/OlMWv7WY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hd859vDcqlXj0dVTdfDryp/eWW6EuLDkAgWa4O3xCgJ57AiP/TS12qGJWR8AaDF699DdVM0sRFdLxHB4843Qr08Uyjbe2tHzp8uAEVJzeV+esDh6xjgU0Uska6IeMZro7YnVAaHSqqx40CVeIP6JdxyVsmoBGFUPpDdIvBigDIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RmDjkY7i; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RmDjkY7i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732701088; x=1764237088;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VkzwXG/T0beT4ilgB/usUee6apo+R5skys/OlMWv7WY=;
  b=RmDjkY7iSEXLSvUpg6eA21yR/MPys/EIO/G88vpqVpxg1mSwEK1PEnnq
   pQy84MFlZVJQZhVY8xaqy7PSrGVyf6LlzBFGIIHFqkPQ/JaEJTKKRMpJE
   yEUgvKtrXVCY9n/1DF+J46H1Yag/+e5tqQMjUNIcejcgzXkdxpArthYWG
   ZdcrWngQCq8HouKAbTYXzFeLmVwfAKRb+Hgv8rj+/X11MgDKyJUZilqQ+
   afVTuK+BuGasvQegx10Vml5EYwYm+Bm2cIx6J++KHh8oJeqNZAEDigR/B
   v4X6a5g8u2xiY2mm7uLFFiVY6Otj6wQjN8Eh7f2y1euneMJO4nbfnR9tB
   w==;
X-CSE-ConnectionGUID: pJIg8yOBRV+E5+r7k+fGOw==
X-CSE-MsgGUID: hieP56AnQxmlNMFSJ54Yog==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43556468"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="43556468"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 01:51:27 -0800
X-CSE-ConnectionGUID: J8aLULoFQLee9CYZurwpFA==
X-CSE-MsgGUID: DT6cVg93SIiS2TuDZI3f3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="95976107"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Nov 2024 01:51:26 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGEhg-0007tf-1s;
	Wed, 27 Nov 2024 09:51:24 +0000
Date: Wed, 27 Nov 2024 17:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/st/cw1200/cw1200_spi.c:440
 cw1200_spi_disconnect() error: we previously assumed 'self' could be null
 (see line 433)
Message-ID: <202411271742.Xa7CNVh1-lkp@intel.com>
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
head:   aaf20f870da056752f6386693cc0d8e25421ef35
commit: 2719a9e7156c4b3983b43db467c1ff96801bda99 wifi: cw1200: Convert to GPIO descriptors
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-r073-20241111 (https://download.01.org/0day-ci/archive/20241127/202411271742.Xa7CNVh1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411271742.Xa7CNVh1-lkp@intel.com/

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
