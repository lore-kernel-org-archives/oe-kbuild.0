Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996E715C0
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Oct 2024 07:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728716887; cv=none; b=CzDTd3M7mluSYo9jRt/FdJXmplrynltysGI85eG2/oC/ALbdjyli5Qp3iG6FiiY4C52oP9QRS0FP5M+MeCucCqT8Q20YIRDgNFSb/WX7hAAxHuw4f4lbkANlE2gdoaIrdIcBQp6r8DNkTQNyK6nt2iLUCkAn35bGO6zmLW3bOsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728716887; c=relaxed/simple;
	bh=r1lcmT+0pPuHg80F9YMTatEKXYMF8hTmP5dXd1znwYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TyHRpFxHS0wjGf2W9zc1wu7VtlFT1Z4tP6DdlWYrxJUM3y9wjFHsIQKOrt4RaBez9xryM2yAIULB5zaY+b66PWsq5SSkynshTh35mm1IAXNij+Jcov0w7YSRElxUIscXCPBIXxvh1VXOi1Bo1dmmBY5JgaYvqzT+b6nGIZnoqlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1Xm25CT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1Xm25CT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728716886; x=1760252886;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=r1lcmT+0pPuHg80F9YMTatEKXYMF8hTmP5dXd1znwYE=;
  b=Q1Xm25CTKEDuPLWeXVuwYUYVvFb0tGArDPRawnhSMTVQKpCrM2lHuIew
   C9RJ9M+yRGNmd5FPonFg5qA9icUU74jgnnvwYfvK28/zhVRy3bT6oW5g5
   7VfTItoIC1XuO6kL6j50wo+hGMgfRR8gz9DtO1vJetcsMiXjjmy5ycfCr
   NF0tCkLU8m3AZLFCVIiyI4x5MzlOZmRqdcDu1PcndfLzGvsTWKkFy3uHa
   oj8rZZEXXt2ao2EpLzHOMu5AL/bRY85SYL2XWMym0BNS3KffL2yYiW/jj
   S5ckPDwxJCNqWH9sGbC2gF/NHodkU8E+Kjr6dx7N6VKloKCP1gd6Idald
   A==;
X-CSE-ConnectionGUID: 1pHWiUYwQiuyOyC0MOE5TA==
X-CSE-MsgGUID: FPmwIqrzT5WsU+0/Z+lSLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45596553"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="45596553"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 00:08:05 -0700
X-CSE-ConnectionGUID: Nr6RT4yPScC0hKsZjHG+4A==
X-CSE-MsgGUID: y6yUc6r0ThWZ1xNUoO+dHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77026464"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Oct 2024 00:07:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szWED-000D8t-1V;
	Sat, 12 Oct 2024 07:07:53 +0000
Date: Sat, 12 Oct 2024 15:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/st/cw1200/cw1200_spi.c:440
 cw1200_spi_disconnect() error: we previously assumed 'self' could be null
 (see line 433)
Message-ID: <202410121505.nyghqEkK-lkp@intel.com>
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
head:   09f6b0c8904bfaa1e0601bc102e1b6aa6de8c98f
commit: 2719a9e7156c4b3983b43db467c1ff96801bda99 wifi: cw1200: Convert to GPIO descriptors
date:   8 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20241012 (https://download.01.org/0day-ci/archive/20241012/202410121505.nyghqEkK-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410121505.nyghqEkK-lkp@intel.com/

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
