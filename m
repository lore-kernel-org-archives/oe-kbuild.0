Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE142F26
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jul 2024 06:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721628199; cv=none; b=tnMc6SxdDFqJsw1rj2mZ5fslh2tPjgVy9crStLW1gZGoh2p30L8xMVjXMUw7YwJ1Y2w+J4hr0y4XYrW//V8r9W878i2ws0VVlkd1GZtFwc6VgIdet7kAhCOb0k3cyZdSpi80w11ypSc8qjPfsT4tY0JzScwnBMvhgsFFljjnGlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721628199; c=relaxed/simple;
	bh=3nvdbehZUVM6PAGlPxG030Fnc9veRxSLfC+x528SMT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kbW0rrddT6TDgSZntV6FkKXLi5zPOjxHJSpCj6+jF4HSZcXHBkA+Ht7mva9NyuYhYtvitaxGE/g0CvuBktdRUPuRLYr7mM7uQR7dUIDroYlNfzNzjP1Qft9jSOS4r4+/4BA6Lg1boJ1TDqCI54fv6k/WRTEHSI02Lj4QvcWXFx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSvNdBkr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSvNdBkr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721628197; x=1753164197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3nvdbehZUVM6PAGlPxG030Fnc9veRxSLfC+x528SMT8=;
  b=kSvNdBkrck4m7yIxP5CUKSJD0oAbIw/n1yr4OHgyTY+Oa9C1cviipdFL
   pr5u2X4GlRQu5tkEIVhqZX6Nt1djU5JLRD1kYELhj3LsewxCicAnEgk22
   btbiOPED3H6gyc9BYmtFWyZPo7CwOgxF23e7/AmZY7YcaNLw21Ttb9ha1
   rBmIX0aLW6H4CGCG6a+jZ9wdNVgs7BEUN/4duLqRIpC4dVjCZrrBSgDOo
   9Lwgvg2frh2Z2CcVjoaRFSm2JY7VuTalm+GzWL/JBAXmspoZ6jn9AcSZA
   4C+M6intEsT53NCx5ZS4HRRE7zGgwDdVo4qEae1v2/zAHM8MwiTlMJPvC
   w==;
X-CSE-ConnectionGUID: pwH4I9XSS4uKsf+YKYN3bA==
X-CSE-MsgGUID: m/VnS+pARRmdalCF8yljtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="22941435"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="22941435"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 23:03:16 -0700
X-CSE-ConnectionGUID: w7m/eLqFSHSHkr9NeGYkFw==
X-CSE-MsgGUID: +uvVHsW1RYmkjWFNxVNwSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="56876304"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jul 2024 23:03:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVm8f-000kvA-0x;
	Mon, 22 Jul 2024 06:03:13 +0000
Date: Mon, 22 Jul 2024 14:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 37/43]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000:
 'thead,misc-sysreg', 'vbus-supply' do not match any of the regexes:
 '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
Message-ID: <202407221339.MNDEE6T1-lkp@intel.com>
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
TO: Jisheng Zhang <jszhang@kernel.org>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>

tree:   https://github.com/esmil/linux th1520
head:   350a58164ab57fa986bd3dadd6c975d3f6e39fcf
commit: f8e9edd0a6c0d323e01544bedec1008b38e43cd6 [37/43] riscv: dts: thead: Enable Lichee Pi 4A USB
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: riscv-randconfig-051-20240722 (https://download.01.org/0day-ci/archive/20240722/202407221339.MNDEE6T1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407221339.MNDEE6T1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407221339.MNDEE6T1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/syscon@ffec003000: failed to match any schema with compatible: ['thead,th1520-gmac-apb', 'syscon']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/syscon@ffec004000: failed to match any schema with compatible: ['thead,th1520-gmac-apb', 'syscon']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'thead,misc-sysreg', 'vbus-supply' do not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
