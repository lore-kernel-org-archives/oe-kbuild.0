Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E7E34C820
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 19:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768159195; cv=none; b=LvrEDOPSV0QLOaE48o3wJuMAgMPbk27ChqRrbGdcAsrRyDFHS7X9RATcOLtEpgYFH4DXpgOB5ga7bjl2084Zb5tyEltvnLElPP5CDvaosWJyWzX7HfdbGQDSSBNPqxeYgV9fTekb6Tth6x+WHPYPr4KykflIqI6NWOxLpNueYb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768159195; c=relaxed/simple;
	bh=AmoQvDAVaYU04Gg8vnxFT1H4uVIxz64J5hesBN/C1yQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jLwsIiVo85MgLSCcS57XpVPeGM3pONAHvw13vOwYY96Qyyeteb1/ZGJT4HHyCWVOfGmj4bzB0bx0qUMq5ZPixwwTyhvpzY+CmT6F4bgEEVO+qFUt1flvV6cLP9B1ET85IwUusMJDvg0ceAjollGug56T7V6h22/MdsVw2s8KW8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxbE0xh5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxbE0xh5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768159194; x=1799695194;
  h=date:from:to:cc:subject:message-id;
  bh=AmoQvDAVaYU04Gg8vnxFT1H4uVIxz64J5hesBN/C1yQ=;
  b=UxbE0xh5jSeEmjpdGIkTBIK/k3kV3zYHtpBbZdPvWH+TZ/q4T4PhpJBE
   vdIc8Kmao4WZ8vh8i0BInSbyy6d3lfu4WkrY3zp87URYb324fIPuMHmVF
   LlbRHRsQOb6B1hoUjuWE32AC6+fgjX3nbErsGvX2GLrrejs6zvHsdLZ2E
   qvJ2IlvIU8e50vqtoWgkAzTAIfrSEgkKYycVbSwwSLjJ5LktJ70oJtMCL
   EEYjtzU0v+Cyl50qSL+IRFRmuZ8o2Zuklv02eb4DfSz/5RteMwWQHkH2j
   9pVXDyInRhpW3Byl/jiy0QxWvQpieICGn8yi5bnceFlYUCKNcrj8zk+ZA
   Q==;
X-CSE-ConnectionGUID: cAJznwDsS4is+xomaCQPKA==
X-CSE-MsgGUID: Pk9OZz/XT9aTiofH7CJYxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69362342"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69362342"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 11:19:53 -0800
X-CSE-ConnectionGUID: 84R+EOybT92RxdIztwh0Iw==
X-CSE-MsgGUID: p2AYzLgpSI+t0JXM4CkUOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204636995"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jan 2026 11:19:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf0yc-00000000CdY-2pfc;
	Sun, 11 Jan 2026 19:19:50 +0000
Date: Mon, 12 Jan 2026 03:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1815/5095]
 drivers/hwmon/pmbus/mp5926.c:181:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601120341.amlGG4BK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hwmon/pmbus/mp5926.c:181:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
commit: c6c80820ac5d845c19c4de2e6054e7c246017044 [1815/5095] hwmon: (pmbus) Add mp5926 driver
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: openrisc-randconfig-r122-20260111 (https://download.01.org/0day-ci/archive/20260112/202601120341.amlGG4BK-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120341.amlGG4BK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601120341.amlGG4BK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/pmbus/mp5926.c:181:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmbus/mp5926.c:181:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/hwmon/pmbus/mp5926.c:182:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmbus/mp5926.c:182:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hwmon/pmbus/mp5926.c:183:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmbus/mp5926.c:183:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/hwmon/pmbus/mp5926.c:183:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmbus/mp5926.c:183:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/hwmon/pmbus/mp5926.c:184:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmbus/mp5926.c:184:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"

vim +181 drivers/hwmon/pmbus/mp5926.c

c6c80820ac5d84 Yuxi Wang 2025-12-19  179  
c6c80820ac5d84 Yuxi Wang 2025-12-19  180  module_i2c_driver(mp5926_driver);
c6c80820ac5d84 Yuxi Wang 2025-12-19 @181  MODULE_AUTHOR("Yuxi Wang <Yuxi.Wang@monolithicpower.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
