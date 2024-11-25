Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA61C63C
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Nov 2024 04:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732509361; cv=none; b=YnowGjQQDDgjbeorCUJAMj/EctIcb2Wy/yxJgkuEds7v1jHFJdIULK+MPB50wgpeUVqR8mZFZpC5gD5zzq8k1x9yQz0TB8gLnnjR+ORqX4NcaPC0l1Z3opJQ00NFETeJf/u13dSkc+8wooZP68m8RCDa05DxbFgUxNP20Vwrg5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732509361; c=relaxed/simple;
	bh=20GmEZPzORsRpArVDBAuZN2ayh1ccKyYD4PL9utYhis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cfyBWk7x7YQEh4jGE9UxWZKu1Etbaa6U9Z8qTzYFPqOqCkJYaeQB5o2tmeNc5BHC59Cy2prqu38juV6Pl4NtJH8aVwtN8isrCVR1YMwOlSRjfwiEsdXxHPfBMrU5zadkIb1alzA3HBBljLMyYtp5iBeXAJQXag25xwgVGiOAcYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwCmreI6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwCmreI6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732509358; x=1764045358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=20GmEZPzORsRpArVDBAuZN2ayh1ccKyYD4PL9utYhis=;
  b=dwCmreI6Qc7OtB4tzZ5v0jTlZZBgMboFq73KG7I1mrvLPOsnmbWY+XCO
   D7DCDMI6foABlXT/sdETbNi4O+ZnB2zoVChJ9FlRk9FJYCNq54JwxNXZZ
   DNEQTlwdFW5+RB/bLAdCYP1V6ZcPhQGiVuy5KjMWSWdcXmnR1y+8sHCb/
   HbXYsw5hLhBwk3IJ35zeSsXh7OautEkY7xcbvKmi1ZoiK/xKN6U9l6CPc
   a56WT1t0KdtjHl6m5KgAEsQRr/vkmXQR5t3kailJdHwzIPyhSc6R0Dg+i
   gq7ylTd790JWAxrtbni86tb2163+BAlFv2Bjtg7syEtilpRnFeIt7z1Va
   g==;
X-CSE-ConnectionGUID: D7jnAk4OSpW16LPa7Z4SzQ==
X-CSE-MsgGUID: yvkBb1WkRructJfFsaQ4qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="31960707"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="31960707"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 20:35:58 -0800
X-CSE-ConnectionGUID: pMEq7XDsQ22PXtdpXm0fQQ==
X-CSE-MsgGUID: oNycn9gwTbe7o1cuz/0JbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="90941522"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Nov 2024 20:35:57 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFQpH-0005th-10;
	Mon, 25 Nov 2024 04:35:55 +0000
Date: Mon, 25 Nov 2024 12:35:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 37/48]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb:
 /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible:
 ['thead,th1520-misc-sysreg', 'syscon']
Message-ID: <202411251227.Xyzlpgh1-lkp@intel.com>
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
TO: Emil Renner Berthing <kernel@esmil.dk>

tree:   https://github.com/esmil/linux th1520
head:   b0b9c5dfe5239c799b6da7dadef7586860b61313
commit: a82aae031f0bc8928a1d647ecffbc4e5e2648604 [37/48] riscv: dts: thead: Add TH1520 USB nodes
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: riscv-randconfig-052-20241113 (https://download.01.org/0day-ci/archive/20241125/202411251227.Xyzlpgh1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251227.Xyzlpgh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411251227.Xyzlpgh1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000: 'thead,misc-sysreg' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
--
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/misc_sysreg@ffec02c000: failed to match any schema with compatible: ['thead,th1520-misc-sysreg', 'syscon']
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: usb@ffec03f000: 'thead,misc-sysreg' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
