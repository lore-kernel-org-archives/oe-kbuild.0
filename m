Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352FD279DCD
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Oct 2025 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759934505; cv=none; b=DYZ7AgPPI/BhhdOGNjewhzRNkq1HJG/hvhFBzrUIseGmTobXp00ewQn4VnZznzSoXj7MDv97nsJ9imLV2U9X+N+Z9HaB+lPTDbbB/+2GYtRJLc5dO9ADdGjk8eq5kvetd/QrZEt2+v7jlFnjBpGjQCWUQ9PQ8zsdVXQhScIJFw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759934505; c=relaxed/simple;
	bh=nZDoNikb6HcbvxpLsNaBX8wLdDztRmjVZRzcwLX4YqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WaCYBgf9gxMt9CA9v7mofihq2mfXGNzZDHrdyHcGcM0GC05Q7m1a2xp2JsOznTfJE9KmeNGtK+AHOTg0sBqGzmG7NgJibGvx7cUjc9CBwkh9yBoNMaaqzwc1pVUwSLAcOR8kc3TipS7PSZKJpKUJn/oSnLNWdcJSU9j1fxTos5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSu/AVAF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSu/AVAF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759934504; x=1791470504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nZDoNikb6HcbvxpLsNaBX8wLdDztRmjVZRzcwLX4YqE=;
  b=FSu/AVAF6+1RymfcnXHs6dXhLq59s8pPCsNej6Xu5dKIwbB9AjMHYGt2
   Ok2sbY+3GrinPrqtP8wn+BaiNph2yIBmQCgWuusUXGb/dE0YwSV1XvUBO
   aoNNfbIHuariGz8BnOLJqCLcoe8mvVELBQ1sf9MLr9jlbgcNu/xChdTuB
   5dSHcGWE0ECmyHXrEK0WOA/lzk0FFjfs+YCpjVDHeg0yTiTj8Htpg2SG1
   QVmgKrHwpPfEj6zvwK9A7ca2vSUbTZ2pKdKM3Zuv+GjHG4vjoHni+ESjV
   9n32kF20z19c+KMMQlTqja+pkKkOwiKtyfFkrW3bioZbXTl8GAal82SFo
   g==;
X-CSE-ConnectionGUID: 3BBIMomFSfaK4+QHjSukQw==
X-CSE-MsgGUID: U5omUXU3T5aJb8YHprUT2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73558328"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; 
   d="scan'208";a="73558328"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 07:41:43 -0700
X-CSE-ConnectionGUID: I2jOVy6lTPiUPDaW9jHmmQ==
X-CSE-MsgGUID: wEv13ptnQn+Xxo77Rrlh0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; 
   d="scan'208";a="180391004"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 08 Oct 2025 07:41:42 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v6VMJ-0000000082r-2gVz;
	Wed, 08 Oct 2025 14:41:39 +0000
Date: Wed, 8 Oct 2025 16:40:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wsa:renesas/gen2/dtbs_check 6/7]
 arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: accelerometer@1d (adi,adxl345):
 'interrupts' is a dependency of 'interrupt-names'
Message-ID: <202510081633.k1wf2wjB-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/gen2/dtbs_check
head:   19674eee377f1af7a75a3c9f5ded7c8807be8910
commit: 87f93e46c7a1ad713bdfc92e71bd08692eb6c64d [6/7] ARM: dts: renesas: kzm9g: name interrupts for accelerometer
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2051-20251008 (https://download.01.org/0day-ci/archive/20251008/202510081633.k1wf2wjB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251008/202510081633.k1wf2wjB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510081633.k1wf2wjB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: cache-controller@f0100000 (arm,pl310-cache): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cache/l2c2x0.yaml#
>> arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: accelerometer@1d (adi,adxl345): 'interrupts' is a dependency of 'interrupt-names'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
   arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: bus@fec10000 (renesas,bsc-sh73a0): Unevaluated properties are not allowed ('ethernet@10000000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/bus/renesas,bsc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
