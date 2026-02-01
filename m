Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC42B3EBF3D
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Feb 2026 20:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769976552; cv=none; b=jXfT6SiBUqb+Fl5PFgi2g8BmEXyXU9/X+OjU+n6DsY9gNb8qtAlRk7KUFRVi31y5bGDdcXQ4JF9+tPNaRzXRwtne7NJkGq1Xb0bHqlFi0CqY5nFs8+wQU6mEep2qvdXNkGiIjckET2HYBp17Ypz/zEhqqSH+AOeBb1lMWtuCj0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769976552; c=relaxed/simple;
	bh=W//McgY/E9MOx7+cOXMC5vCw1sclgB70TSsDFKjaPZI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=upOtwIkybXwBQQVzViLSIBjAVlD8x2weHsQXPRrQRlHzhy2+OGospVK0iDFxeODJPbXucxSF6026bddxrfHb8I0PscLdRW+JizRxwmI/oiO+w+Wpm7D/hWuqurES+0oON3a5cUPclesHAtDtab+YWdlQaKf9A59EGyzRYt9kj0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewIeHr1v; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewIeHr1v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769976549; x=1801512549;
  h=date:from:to:cc:subject:message-id;
  bh=W//McgY/E9MOx7+cOXMC5vCw1sclgB70TSsDFKjaPZI=;
  b=ewIeHr1v02GXAYWEw03xxWcfxfhU6enZQIvmCDlmJ98kWk7/YXVjRwWa
   1YYaXAg8PhWDuyRCTus+LUDqagPuZpKdh/Swad4QneQJweqQNW/oZ+7E7
   l32FEFH49ocGKwYpcz/YxND0tBkCQOJE6mT/RLDJ9tCTImbcgNmDVSbFF
   b/HmTu5mWPQdRohcFRa0X+//fgV31aCuGfLW52GXn8zHO3xtmNR8RkrPY
   /RMqvVbiJ5MlpLJPyGqb+3YAZ/N/ek9FsR1vPVKFid5iNDCRQtdQ56nsp
   GCcP2EnbW2UTqzKXU+iBrdAL3OvmfuJjP0vxgzWhU2bY9Tyx3IyF4+gAn
   g==;
X-CSE-ConnectionGUID: 37GFe+xpRnepXpdKvZRZ0g==
X-CSE-MsgGUID: rJhbSMA9SN6+qR5yTZDgow==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71201857"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="71201857"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 12:09:08 -0800
X-CSE-ConnectionGUID: eO5DGCe9R6m2Hb0Kf4/+wg==
X-CSE-MsgGUID: N/qoqyXHRNuakBTlBjUKFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="214264245"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Feb 2026 12:09:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmdkn-00000000f1I-15x4;
	Sun, 01 Feb 2026 20:09:05 +0000
Date: Mon, 02 Feb 2026 04:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ardb:x86-pie-v4-wip 20/21]
 arch/x86/boot/startup/relocate.c:19:26: sparse: sparse: invalid initializer
Message-ID: <202602020419.UqxaI892-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/boot/startup/relocate.c:19:26: sparse: sparse: invalid initializer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   f706b38ea2701854b12c604e2b0eb94d229ea8f2
commit: fab6dd07b7371cff689427db19d85a874ed32a32 [20/21] x86/boot: Apply ELF PIE relocation fixups during startup
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-123-20260201 (https://download.01.org/0day-ci/archive/20260202/202602020419.UqxaI892-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602020419.UqxaI892-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602020419.UqxaI892-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/boot/startup/relocate.c:19:26: sparse: sparse: invalid initializer
>> arch/x86/boot/startup/relocate.c:19:59: sparse: sparse: need scalar for ++/--
   arch/x86/boot/startup/relocate.c:24:26: sparse: sparse: invalid initializer
   arch/x86/boot/startup/relocate.c:24:59: sparse: sparse: need scalar for ++/--

vim +19 arch/x86/boot/startup/relocate.c

fab6dd07b7371c Ard Biesheuvel 2026-01-31  11  
fab6dd07b7371c Ard Biesheuvel 2026-01-31  12  void __init startup_relocate_kernel(void)
fab6dd07b7371c Ard Biesheuvel 2026-01-31  13  {
fab6dd07b7371c Ard Biesheuvel 2026-01-31  14  	u64 *place;
fab6dd07b7371c Ard Biesheuvel 2026-01-31  15  
fab6dd07b7371c Ard Biesheuvel 2026-01-31  16  	if (!va_shift)
fab6dd07b7371c Ard Biesheuvel 2026-01-31  17  		return;
fab6dd07b7371c Ard Biesheuvel 2026-01-31  18  
fab6dd07b7371c Ard Biesheuvel 2026-01-31 @19  	for (auto rela = rela_start; rela < rela_end; rela++) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
