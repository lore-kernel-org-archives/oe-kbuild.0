Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0451425948B
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734032650; cv=none; b=JBCPjfOMTYKpkHPBiqEAQ2lHqUEZHuCv0thU4X7S+lCB0ocWBWEwN2SbJnoKx6IqDzm/AU2qZ6w2b5wOuQL2gxieghOgWpuOEUDbOF82WuZSKSJriBCZ16Um0yDJsxd5Ftad6HEho1v3llKtvMKZ+0d5yB3q8W1SIPBnfXzUsLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734032650; c=relaxed/simple;
	bh=jIAohkRq/XEKKLpdVgl+p9s2ntwQhTH0Uv7liQWMqNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n5AEFkJ/eBy9C8Ch37leSTP6wZruPgBtr6wetgEgSk5l6Qu+FofVkJB1fUsyM7PuCNo4BVjQaNmLmjyvcAp9+YyLI6socJW7mF8Y3bG1H1cy58vzd9AeAMGfwjnfrnXxndDzspepRWZW7hl1egd77l+wx5WQfsiVc4fEEW7BRpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VG378jrO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VG378jrO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734032650; x=1765568650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jIAohkRq/XEKKLpdVgl+p9s2ntwQhTH0Uv7liQWMqNU=;
  b=VG378jrOpLK7i3rLIPKtahKduraZ5avaGkjpv3OcgIUetTPbuHUyjDHR
   MFE+wI90TdLoardEXl2IfGblkAuVcSI4lCfQiWNbfLjGB5uUezUr8hywb
   G/8dW5rJaE06Bd2uWGih/PywIeKHwQKfS+rVwkrCRuUEJyDVLBOIDg6aK
   SVPSYDnSHociF+YIjWoCD+v1h6TwMQSC4SSN281acz9SCdObP/loM24fW
   G4OVSsGT6FoP7l0J9xVmM1lJdl8nFO0SOnGZ9ilu1l9DsSLop/6+9cr6O
   pdCrXJBE64wlCqB2YByK4awz6lnIBqX9PQq/OE6rdkpnCEGTmrwFZvIjn
   Q==;
X-CSE-ConnectionGUID: ukcBUWkARiqha9KJN+9exg==
X-CSE-MsgGUID: R4Eg01WsS924VCHqh1Zm1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45478917"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45478917"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 11:44:09 -0800
X-CSE-ConnectionGUID: 0wLF6jMLQIe6pBAsTaNmXg==
X-CSE-MsgGUID: bTobnxXCSPqLAZX2BDxIFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100484272"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Dec 2024 11:44:07 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLp6T-000BGD-0W;
	Thu, 12 Dec 2024 19:44:05 +0000
Date: Fri, 13 Dec 2024 03:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ambarus:acpm-v4-upstream 9/10]
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: power-management:
 mboxes: [[16, 0, 0], [16, 0, 1], [16, 0, 2], [16, 0, 3], [16, 0, 4], [16, 0,
 5], [16, 0, 6], [16, 0, 7], [16, 0, 8], [16, 0, 9], [16, 0, 10], [16, 0,
 11], [16, 0, 12], [16, 0, 13], [16,...
Message-ID: <202412130310.vKyU7XWZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tudor Ambarus <tudor.ambarus@linaro.org>

tree:   https://github.com/ambarus/linux-0day acpm-v4-upstream
head:   a7e0ce0f6a033307db912fc77b1bbb7c3e1df757
commit: 8ad5ec4e154930f42fa9256013410949a7afa369 [9/10] arm64: dts: exynos: gs101: add ACPM protocol node
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-051-20241212 (https://download.01.org/0day-ci/archive/20241213/202412130310.vKyU7XWZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412130310.vKyU7XWZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412130310.vKyU7XWZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: power-management: mboxes: [[16, 0, 0], [16, 0, 1], [16, 0, 2], [16, 0, 3], [16, 0, 4], [16, 0, 5], [16, 0, 6], [16, 0, 7], [16, 0, 8], [16, 0, 9], [16, 0, 10], [16, 0, 11], [16, 0, 12], [16, 0, 13], [16, 0, 14]] is too long
   	from schema $id: http://devicetree.org/schemas/firmware/google,gs101-acpm-ipc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
