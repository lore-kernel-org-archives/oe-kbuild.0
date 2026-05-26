Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96952773CA
	for <oe-kbuild@lists.linux.dev>; Tue, 26 May 2026 02:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762688; cv=none; b=W4Mb8BLXyDT3epwgpXhbkuoVSALmAXOlmK+VxSRawNjPhbVjayHP0ehbg0V6lp3Sfeu/6Uh0o3NjL2lNNoImkOczaY78Qqj0heQv3EgKGirF/DtIE2rlvI2frqvM/prM7mtPIFq6oE/FfdqOWhW5G8wFh8xm7pN+jJeKpnIJzA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762688; c=relaxed/simple;
	bh=CQM2YvOpK7jQXKNetov8TJ33Gh928XOvA3kQOS3KrAQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=szTL4Qf6fCyUGMWBZlm0HaibNuFtbE2dGyKRXlx6mHb79ilCXRcZjaaQ3Kx7SsfY76mVMxAq3rFHriF6/oYGdMZMz8ijWl0ZjC/kp0mKRkHjER7ZR7K1Ac4QfG5whJUVZ4z942is/5yLKAFm7nE5xHc3bGr/gComzRhGP8K1YLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tp66L9s6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tp66L9s6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779762687; x=1811298687;
  h=date:from:to:cc:subject:message-id;
  bh=CQM2YvOpK7jQXKNetov8TJ33Gh928XOvA3kQOS3KrAQ=;
  b=Tp66L9s6UXnOtVcLIdjbhxViWirUJvte8KlPSzesAjXXVSFWkEsIWQEE
   wbgd7XqkhksSSS50SO8cA6u0J4qaGFIM9Hxkq9s/UqD5Ml2J2ehrmTypl
   MVlAoxeNWR6rXcYnYFf1kK6eGclS8Ozrt/WKx4ZUaFK4bOQ49hiXfTfim
   wPqXPOWfWM+qCtsyzWT7mrMmkABCw5Mc1wFqXMGmEHrYFtigk1Bk/YCo1
   +WssIW+ZvCfjr69FPRxV/KtevpTiLDf9hBKAnOHhwJQ6pUXfVMBVOExVP
   HmZHCpxVvMwrNyF8eUk//jt+fqMtr9GZvx/4kY2LR8IaRPwDxg4dqOzOF
   A==;
X-CSE-ConnectionGUID: 6ONoGj8jTBS58vhGiqDxpQ==
X-CSE-MsgGUID: oXEC7BjdTnOCIEKY6qI2Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91260530"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="91260530"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 19:31:26 -0700
X-CSE-ConnectionGUID: js2PINDdTaGsJJRK8YKPzQ==
X-CSE-MsgGUID: r704iqc5Sda6QTNMG7pIZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="246856943"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 25 May 2026 19:31:26 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRhZj-00000000CJR-2LYz;
	Tue, 26 May 2026 02:31:23 +0000
Date: Tue, 26 May 2026 04:30:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 9/114]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb:
 /soc/spi@39b10c000/hid-transport@0: failed to match any schema with
 compatible: ['apple,spi-hid-transport']
Message-ID: <202605260458.reA9OJLd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: 8889bf8cff77db2d9655f7f54bbc363c6b4d8895 [9/114] arm64: dts: apple: j31[46]: Add keyboard nodes
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260526/202605260458.reA9OJLd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605260458.reA9OJLd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605260458.reA9OJLd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
--
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
--
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
--
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
