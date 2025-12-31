Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A233530AAC9
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 19:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767209393; cv=none; b=d06+4RQCaP5VKstKG+tVuNWMpe+1SHSpMutBaVIDBt1thuvgcCYiiGkAXiQnDQkg/RoehOUC3cA44FxaPiI9AXGxg1pGiswVHKRKXs0g5++pms1zoSuJsytVpY0r3n+hNCn177pfplsymDkSqvNmCgwEhS0pWturdgOh60qgzIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767209393; c=relaxed/simple;
	bh=Yibf6StttJuQl4rsjbmGXAdMJ9NeEsF50iIidxITpRA=;
	h=Date:From:To:Subject:Message-ID; b=lJ+VIU+l7vATyB1JR+mb5JvduUjcQetnKixqX4FxTlAFW6Iw8Yadc85pIKeoTpo6XsHz9N0XP2WHr6/MjIUjZJLlKScAwP3vthGTH1Es0/Hd5BYyYZj42Q/9lSMZ0z1V5EImTbLg3SmadC3GZMojARjuuYmUrBsloFWAw62oB0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUEvlyY+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUEvlyY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767209392; x=1798745392;
  h=date:from:to:subject:message-id;
  bh=Yibf6StttJuQl4rsjbmGXAdMJ9NeEsF50iIidxITpRA=;
  b=HUEvlyY+mqjO/kFuItfvS1TwMCAZVBJl1h428hLHpy0SCNDz8An0VBcc
   xT5vtHSd3g63NePspsUeCjRo/qcaPRf+1QuykIJywoKUd7zfg9A2ju8GJ
   Tx2nV0omoYBlMpTeORLoeo1JgCaAoNvxzvbG88Y+8xytgRYneseFUD3qD
   IxdzlnPF35+KwTAQVRjTJE5C1vLK4hp9pc48TymtxOqAHLkDLU7imT2CK
   gHRVN25QYKVID9GChSdnxe1MwGVD00tPAMrnE+J8eYqdXSjQpHtqdDVWz
   pjzzmh5PYJuKWIgBA6ahHL2uNa4X10M0CfboJGiyvMYSDtiUvA0PnKRAS
   w==;
X-CSE-ConnectionGUID: aIcvgQzcRvavNtpk2TW+SQ==
X-CSE-MsgGUID: kOI18gkpQdmjmuM1FSHb4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="72625018"
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; 
   d="scan'208";a="72625018"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 11:29:51 -0800
X-CSE-ConnectionGUID: zORLd99hSkqlCMSGrUoIWQ==
X-CSE-MsgGUID: EgFkSBegRlOzvZTgXlQwAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; 
   d="scan'208";a="201376617"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 31 Dec 2025 11:29:50 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb1tE-0000000005n-1T7F
	for oe-kbuild@lists.linux.dev;
	Wed, 31 Dec 2025 19:29:48 +0000
Date: Wed, 31 Dec 2025 20:29:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [litex-hub:litex-rebase 10/15] checkpatch: ERROR:SPACING:
 space required before the open parenthesis '('
Message-ID: <202512312057.RN25YmQw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Craviee <dcraviee@internships.antmicro.com>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   c113f6e19870fac49ce445bc5692f08a6e6810a7
commit: 113a238ebf3275f09f20e19304e2f8d029c537b4 [10/15] LiteX: driver for SPI Flash (mtd) device
:::::: branch date: 74 minutes ago
:::::: commit date: 74 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251231/202512312057.RN25YmQw-lkp@intel.com/reproduce)

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
