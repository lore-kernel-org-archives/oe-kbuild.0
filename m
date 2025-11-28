Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6DE1D8E01
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 03:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764301553; cv=none; b=MiLukjMdASDjA/MFlAzxsoU0GQyYSZImnDUJ/o2quhoxpLR9gMIufeLzM5tSQJU4h9VuszO5sd5atuAJgwGLa5PcRkbB/cLC3o6gV27Dnyht1yj3wsodDlw8Hsfd+Gb0wdzIZhCeKjoYBtwtkQNRC4/chUZQ3DElFEpuSHB5MVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764301553; c=relaxed/simple;
	bh=BKxf5D5F4hKRX4fOnuTIf8WzbCHScBtwk+weg5O9+pY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WYOsmdNzVSFKF4GQLEPG4ZV2xA35jfYC0q62iuMUAOhvm4K7A8zcZf+1IEKQxxuxVhjQtZqZ7vHAmo/uki219BVjvs3OIQzgs6mtyTIVpxIAsXuIuL5636yIPIOi2KxXdDCkb9eOYIcMEZm0oxYG0oHE7WDAUN9O1QDSw+GMyUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WCTikGti; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCTikGti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764301552; x=1795837552;
  h=date:from:to:subject:message-id:mime-version;
  bh=BKxf5D5F4hKRX4fOnuTIf8WzbCHScBtwk+weg5O9+pY=;
  b=WCTikGti5WCrc+wyiyia83lfxG5IUc3EHgpesbJ4dcStpl0RblKKSY2y
   UJhwbxCt3rErXbOI0lpY/sLBaOX2Say6r06yCfEqhfskfTL6DznwLpc8Y
   ohG5eZ/YYOpl90L/mJ08YcKltrlOggvwmIumTWl+6+1aiY8pXrAU0/YOZ
   3AOcHR0PrKkTJLP123enjllcGRdqY6DniKLDfnCqm0cedNF+a80FWQtob
   8JCLMQMVl+o1zLnd+9HTi3j2EErfmu4ixucHBeiDWWfIBatGjFxzFt63N
   wQZYLCoxK/lr8JCWEoZx6QCzDdyxRsygFMdaG6KAiuRmzzVlndvzxIQac
   g==;
X-CSE-ConnectionGUID: m03TYzYfS/6PAu23aOEQEQ==
X-CSE-MsgGUID: xZSyzRMcRAWTCW927hjDsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="65524726"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="65524726"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 19:45:51 -0800
X-CSE-ConnectionGUID: LNz0/aheTyO1dzyRaMYj9w==
X-CSE-MsgGUID: 3T3y0zxhRbiJ9XamQ06YPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="230642704"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 27 Nov 2025 19:45:50 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOpQZ-000000001vv-3Bps
	for oe-kbuild@lists.linux.dev;
	Fri, 28 Nov 2025 03:45:47 +0000
Date: Fri, 28 Nov 2025 04:45:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [litex-hub:litex-rebase 10/15] checkpatch: ERROR:SPACING: space
 required before the open parenthesis '('
Message-ID: <202511280404.116Mvtem-lkp@intel.com>
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
head:   8149f28aa60a619b57e2d4d50e4211a307ce7e3d
commit: a5f2233577548e3d35c89d7add50bcdb04ea2c5d [10/15] LiteX: driver for SPI Flash (mtd) device
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251128/202511280404.116Mvtem-lkp@intel.com/reproduce)

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
