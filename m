Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98794219C9E
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Nov 2024 23:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731452426; cv=none; b=EoyR77miH5PYazh19JxDrVU9iIApNiQzI+4tNnNX0ZzMEIlhRSFWbEbRoR01BIHalEiEHYIVXI7apWoowcU58oPFUZa/jMZV412rwuNRVU68SKE/MFKWdxNVR4yzjgnhd18hH2ZJCcySwf9JGNTsggdhgc3hCo5ysxawPl1hSZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731452426; c=relaxed/simple;
	bh=thLDH/NXw19q9J1QlDdfLA/IKmum2Hhh37vdjDNK8qg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e1Ah8r+I/bIZfcWTNi8Au/D3xHZb3qxPHNJcRIfjU4hImqKstUGWZisPVJG0TzKb8n12A7iVpgJqPPqeH3xOWkrqDC49gfeSkQPRle/vYsSMsmol+WboSbsw7TgYYJF+ylpJ5lddIitu8MHRs9IVGwzGxpdZdksYLEckF8nM+bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nj5ubMQQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nj5ubMQQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731452424; x=1762988424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=thLDH/NXw19q9J1QlDdfLA/IKmum2Hhh37vdjDNK8qg=;
  b=nj5ubMQQRE5fcsBYvdld/MLYOQ+D3i2KabxNGZQcguiNGlrInhdxxZAq
   JSlXdNOIuE8qLZAwmo4v8Q04Iuyf8f7tL9aQK/wjyg9LYoNIUYK/B/L5c
   4O8U7dU55t5upTVOqreFdcbpZJfGb131UrtMfdYq7sFEbYKnmIF1EqcJ2
   VAH4aLy9/yhU0e1lASNIhx5sdV2mrN9IYOHI1BYBO9O0ienRfzTCkJQ+a
   9U6Bj1rJyKNYMgOLzwtyr5NmBm7WrQR5LBenAPRfBcVRu5C0SlASe7drr
   kwPWr45AsLJtDsBTzAOaJ0tp2lWqtKOxen4xxqnXP9Wzexy4OHDWcwHy6
   A==;
X-CSE-ConnectionGUID: 8NiVLeVBTVKMMYmy+VCcyA==
X-CSE-MsgGUID: Aci4fJs3QSqMxAzcTYjdnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35026526"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="35026526"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 15:00:24 -0800
X-CSE-ConnectionGUID: TK3399SuSK6dYQnDDAbkxg==
X-CSE-MsgGUID: vqmBS+/tS0aQUnIbJPShbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="87832732"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Nov 2024 15:00:23 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAzrx-0001nt-0S;
	Tue, 12 Nov 2024 23:00:21 +0000
Date: Wed, 13 Nov 2024 06:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 39/48]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: usb@ffec03f000:
 'thead,misc-sysreg', 'vbus-supply' do not match any of the regexes:
 '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
Message-ID: <202411130607.NV6TBAGB-lkp@intel.com>
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
head:   b0b9c5dfe5239c799b6da7dadef7586860b61313
commit: 4aeb151b4e0dd319591bbbe106a259b48128eb5d [39/48] riscv: dts: thead: Enable Lichee Pi 4A USB
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: riscv-randconfig-052-20241113 (https://download.01.org/0day-ci/archive/20241113/202411130607.NV6TBAGB-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130607.NV6TBAGB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411130607.NV6TBAGB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
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
