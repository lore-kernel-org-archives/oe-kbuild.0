Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C452FFF9B
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 13:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764941156; cv=none; b=al4r5qLD5x90F7rgmOGwaYvu1gFobkB2GBySytojmL24CD7OjPeSTJPr/R7KmQs5EQ8/1PUgf8Ey+yHx8O6e26lJyzxI9vokZsXH0R4Zj6riWBfHBsrNf7/eBXdRYgKbQf+CabfQ3zx2J8ll+GyXw9iS4km1RXyF8hJrFTEkbHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764941156; c=relaxed/simple;
	bh=ngsY/USb5vsN0vd6LJdzc92r7zzISIGytkTpnjtIvHM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F4NDl93CbTlDW6PXQ19upJSKYAw6x2qszMxJc4Jp72Q/RCsOCYl0IfkRtow9B2Db5kfRGePcCdQEeY7IVZTfCES4QqVBKu+7NlOk97GmYt0iRYaas2brSOYS7EN+cA3LBS5CbpnjxHBG6esO8ylEuCU79FuGoCGWoZr86lrUcZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWMkfUyK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWMkfUyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764941154; x=1796477154;
  h=date:from:to:subject:message-id:mime-version;
  bh=ngsY/USb5vsN0vd6LJdzc92r7zzISIGytkTpnjtIvHM=;
  b=mWMkfUyKOOkPGg7Bij6gwxW5Jqq+MqI9S4qhW4SFUdcnuFHiLklYpFn2
   udS99tQsgJ31FTwXuOoKZICanyQXG3iHWuxoBs4ymI6jPdgPsXIEzITwm
   u01Je6o/utogwXnSbIyuhv4hZOnCuJsm0+7mDAMPiL2t8jKVFKaQTriFD
   49Xjqmvw61gL0kraA9YS9VZ64B4bG8kS0+23ZyA9v2Hu0J+4f+wbKKNLG
   7bX8JH7tDHTTU2jPB6ojoSzoNgEZiN5Dnbu3TuvwGJAUMc/cnh0x+xCk+
   q2a9fthXZm9UcdPJZbhJ+3VkNOGwUza+viSO2Le/LUm1ThTc9S+iABx+B
   Q==;
X-CSE-ConnectionGUID: 9rZ08qMWSZmyFvIuK3xI9g==
X-CSE-MsgGUID: YE8Y7FpVR6qFUggKn4olEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="89625186"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="89625186"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 05:25:53 -0800
X-CSE-ConnectionGUID: 0LXpNFHJQ9ukfRZ0rlrmIA==
X-CSE-MsgGUID: nKKhYc47QSWVypj+xaop4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="199732860"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 05 Dec 2025 05:25:52 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRVok-000000000w5-0LZN
	for oe-kbuild@lists.linux.dev;
	Fri, 05 Dec 2025 13:25:50 +0000
Date: Fri, 5 Dec 2025 14:25:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [litex-hub:litex-rebase 10/15] checkpatch: ERROR:SPACING: space
 required before the open parenthesis '('
Message-ID: <202512051445.kig7Ciuc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Craviee <dcraviee@internships.antmicro.com>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   296c02a312917e381bdb9ff6b3d0364b8074e529
commit: 9b6706ca9287d6fcf605dc7fe454f5e535940dda [10/15] LiteX: driver for SPI Flash (mtd) device
:::::: branch date: 70 minutes ago
:::::: commit date: 70 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251205/202512051445.kig7Ciuc-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#347: FILE: drivers/mtd/spi-nor/litex-spiflash.c:230:
+	if(busy(nor, TIMEOUT_MS, READ_STATUS_REGISTER, WORK_IN_PROGRESS) != 0)

ERROR:SPACING: space required before the open parenthesis '('
#354: FILE: drivers/mtd/spi-nor/litex-spiflash.c:237:
+	if(busy(nor, TIMEOUT_ERASE_MS, READ_FLAG_STATUS_REGISTER, ERASE_BUSY) != 0)

ERROR:SPACING: space required before the open parenthesis '('
#357: FILE: drivers/mtd/spi-nor/litex-spiflash.c:240:
+	if(busy(nor, TIMEOUT_ERASE_MS, READ_STATUS_REGISTER, WORK_IN_PROGRESS) != 0)

ERROR:SPACING: space required before the open parenthesis '('
#381: FILE: drivers/mtd/spi-nor/litex-spiflash.c:264:
+	if(busy(nor, TIMEOUT_MS, READ_STATUS_REGISTER, WORK_IN_PROGRESS) != 0)

ERROR:SPACING: space required before the open parenthesis '('
#389: FILE: drivers/mtd/spi-nor/litex-spiflash.c:272:
+	if(busy(nor, TIMEOUT_MS, READ_STATUS_REGISTER, WORK_IN_PROGRESS) != 0)

ERROR:SPACING: space required before the open parenthesis '('
#405: FILE: drivers/mtd/spi-nor/litex-spiflash.c:288:
+	if(busy(nor, TIMEOUT_MS, READ_STATUS_REGISTER, WORK_IN_PROGRESS) != 0)

ERROR:SPACING: space required before the open parenthesis '('
#412: FILE: drivers/mtd/spi-nor/litex-spiflash.c:295:
+	if(busy(nor, TIMEOUT_MS, READ_STATUS_REGISTER, WORK_IN_PROGRESS) != 0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
