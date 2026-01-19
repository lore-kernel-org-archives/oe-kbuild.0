Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9B52561A7
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 06:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804094; cv=none; b=Gp1IvALRIZj4Ro6+5mUqkgwgz2gksoUA0DL6XHxFFNaxpcw7jeYQYUXThOusoM1QrijFPEP7RHNW3XcI2TTpLI1FKR42I2xUnDLG6yBj6wm5WdORCCo2ZStJY11ezUnI4CQHBRZIZNV2VT4kN1qkzXYPoiGpkqlBTZPJgM5jV+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804094; c=relaxed/simple;
	bh=OOTEZP32F8npjTTKFKOgSknWjHXJsMLzA+8jm1WCR3U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YQx2qH6G9/r3Xca7/G1+2Nvr0fQ1e3lJfMiRZsfJq/BYdF0ulOApCfC/AAHVV/b3kVmifBRlU3Sz74kJZdsLT6v37dS43EqUX9PJ3RbvDuS/PTUBOz0Usctb7Da9MtyoqoTQx4hZtF7blr292dlwQn8mcR2tlIENdX2tS9wB3bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=To7E6yHT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="To7E6yHT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768804093; x=1800340093;
  h=date:from:to:cc:subject:message-id;
  bh=OOTEZP32F8npjTTKFKOgSknWjHXJsMLzA+8jm1WCR3U=;
  b=To7E6yHTi/j2WrwnU+hH7+qR3ul6FH94gGRTQ6OvLtydaW5ycOLpuW4d
   xbtmkRjOiczGoRTnCvDkXjnWnInbd48q4p8IrTUrHG60z8r7klf1aOeI0
   Us2ks5icGYGIQtRFK8K0s1NM2+lozjsbFIOIB59h3cdPJ5yfEjwAPcpEB
   yebT0tRtmOm9liO4Udud37usyf/HRaE+O8uSmAKLhurYwaHbRx2wi9w+e
   qoiPktt0hD/YrpZDjmY6kNqRrge95wksSEOHL2+x4gcw0KtDSfXEAaxoy
   uW23ky+wv0HZMg3UUlonirUqvtrAEm+E+/337SxQ7zIkpf4xJBWTWLg0E
   Q==;
X-CSE-ConnectionGUID: /56BP9+TSM2U/4pqv8VJ9A==
X-CSE-MsgGUID: JNziW/0BRyaDfc1QD+rVaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="57564575"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="57564575"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 22:28:12 -0800
X-CSE-ConnectionGUID: Wjg5PDYlQ66UNLqPvfD9TA==
X-CSE-MsgGUID: Eo1BRcoMRxGWHPXtF2odPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="204933312"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jan 2026 22:28:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhikD-00000000NVr-1P8W;
	Mon, 19 Jan 2026 06:28:09 +0000
Date: Mon, 19 Jan 2026 14:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1079/6849]
 drivers/gpu/drm/sitronix/st7571.c:916:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601191419.ND40M02s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/sitronix/st7571.c:916:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Marcus Folkesson <marcus.folkesson@gmail.com>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: b362de167daf2f1e42a6d5ea2d4e51e8d9d031fd [1079/6849] drm/sitronix/st7571: split up the driver into a common and an i2c part
:::::: branch date: 3 days ago
:::::: commit date: 5 weeks ago
config: microblaze-randconfig-r123-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191419.ND40M02s-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191419.ND40M02s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601191419.ND40M02s-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/sitronix/st7571.c:916:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7571.c:916:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpu/drm/sitronix/st7571.c:917:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7571.c:917:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/drm/sitronix/st7571.c:918:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7571.c:918:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpu/drm/sitronix/st7571.c:918:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/sitronix/st7571.c:918:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +916 drivers/gpu/drm/sitronix/st7571.c

b362de167daf2f1 Marcus Folkesson 2025-12-15  915  
b362de167daf2f1 Marcus Folkesson 2025-12-15 @916  MODULE_AUTHOR("Marcus Folkesson <marcus.folkesson@gmail.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
