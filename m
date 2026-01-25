Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1596A4594A
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 14:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769349849; cv=none; b=av/JkkOxr/5Sq5LMCyz99YhSR1NgTf8cmZfARh/EIEp9q3kiWy4em64laCqpcYTuPb4l387bZGW37lOgM2h8l7ZH4P4lU/dTteyit+4xmuqiLVq10XCx4COYp5jxCs7RcxEd1ipW/Pt95yQx0rQIDUgCj/ORtYRAyWN6RjBQDk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769349849; c=relaxed/simple;
	bh=+ZPrH7gU2O/wklHmgcpy3wx1rIyNL37ccc2NR2mQ0qw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tlruO/MIO1K4eh60zLc40P/wRDexnbe6bGfnpMNlp0xr98zryuqkf0U6NA9tFTRZndDZ+S5MsGDosnKHHN0HoM10x83cKWGiJ9ihxkwXKPJyWeSxi9dk5dtpJwiCT2ncrsp8spQu/OWPBQvK92OooZFo6l7b+D6Y8QSm+GF/xBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PabvYQaa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PabvYQaa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769349847; x=1800885847;
  h=date:from:to:cc:subject:message-id;
  bh=+ZPrH7gU2O/wklHmgcpy3wx1rIyNL37ccc2NR2mQ0qw=;
  b=PabvYQaaek/mBhAEfwTCKFdns2YbQrG5fAwl4L0aZtjH93JkK0C2mtp1
   8D3Merfd+BZs3d9yvqHg/nOOtmctqvO0NK9EhHFi9KXicyFXhZEirQtZ3
   KOsem1uEEuf1Yq7mcwzWjXoEjWwChioaQywvVYi0Eu/8gAQUBnOuoWTue
   xsDqxvENfiuY6WcWVecCdguuCYR2F8IicskbdEs5wmdf9093UpHveaN9h
   uVHTGlmQZuJZin1ME7qaFg73sBnkR4E5Z+DKvANVs7Rz06tCnSNhTybsx
   TPyArn6tNMJRfoh20zCZkHBakNCG3fyLxWvmmyhd9PXCLgi4TDNhwAPCN
   w==;
X-CSE-ConnectionGUID: UhyhCEiGTaWmQMAMCox6UA==
X-CSE-MsgGUID: TTwnRAUgSFe5DcX84zamDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70445410"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70445410"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 06:04:07 -0800
X-CSE-ConnectionGUID: j2vmDel8SQirUlvgYAtv8g==
X-CSE-MsgGUID: DTNIogEOTa+52Fhk2dZQFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="230423920"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jan 2026 06:04:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk0ih-00000000W3C-1VIs;
	Sun, 25 Jan 2026 14:04:03 +0000
Date: Sun, 25 Jan 2026 22:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_sd6hc_support_v1 4/11]
 drivers/mmc/host/sdhci-cadence4.c:715:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601252216.3eHFqduD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/mmc/host/sdhci-cadence4.c:715:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tanmay Kathpalia <tanmay.kathpalia@altera.com>
CC: Dinh Nguyen <dinguyen@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_sd6hc_support_v1
head:   a79ac29af37c6923eb8f16457c8d10a545fbcc61
commit: d7c721b1149a4f280ca061566acc95b52df2d351 [4/11] mmc: sdhci-cadence: add Cadence SD6HC support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc64-randconfig-r134-20260125 (https://download.01.org/0day-ci/archive/20260125/202601252216.3eHFqduD-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601252216.3eHFqduD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601252216.3eHFqduD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mmc/host/sdhci-cadence4.c:715:1: sparse: sparse: bad integer constant expression
   drivers/mmc/host/sdhci-cadence4.c:715:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/mmc/host/sdhci-cadence4.c:716:1: sparse: sparse: bad integer constant expression
   drivers/mmc/host/sdhci-cadence4.c:716:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/mmc/host/sdhci-cadence4.c:717:1: sparse: sparse: bad integer constant expression
   drivers/mmc/host/sdhci-cadence4.c:717:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/mmc/host/sdhci-cadence4.c:717:1: sparse: sparse: bad integer constant expression
   drivers/mmc/host/sdhci-cadence4.c:717:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +715 drivers/mmc/host/sdhci-cadence4.c

ff6af28faff53a drivers/mmc/host/sdhci-cadence.c Masahiro Yamada 2016-12-08  714  
ff6af28faff53a drivers/mmc/host/sdhci-cadence.c Masahiro Yamada 2016-12-08 @715  MODULE_AUTHOR("Masahiro Yamada <yamada.masahiro@socionext.com>");

:::::: The code at line 715 was first introduced by commit
:::::: ff6af28faff53a7389230026b83e543385f7b21d mmc: sdhci-cadence: add Cadence SD4HC support

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
