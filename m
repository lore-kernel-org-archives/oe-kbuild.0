Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E1036A024
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Feb 2026 07:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772263306; cv=none; b=bV215V7jQwwwWRV4Um/ol+t51jFzOb9j42cU8EPK5C5tVL83IZcp8ECc+Daq+5PYRcpNjlx0klgIKpvMkVAQMFXiuQpuETUwdQqh/dncIooWZ7MsbqQGToNVV7qk9sYbZ8HK1vRV3qjT4kL6h82KDPfQcZBPKvqw6GzVtCDJOLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772263306; c=relaxed/simple;
	bh=Eg1xPjDykvVFN6g71e76oLl+gcoqP89t6ypQDr76Edo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RDSY9zAd5V3dXZKOJNDPPgi1rf4AIzeaYvW7DTJUfkilUoR8WzETBMsiZonVkZQFswh0cTvGFLwCPL4HpQWuEyDqcIvczQGQ1DwTiSYY/sQvtqdYH7WoRe6mCZBqsx1w80W47itH64GB7Of+IUwshMnZjXv2rCy8R5dsyScy5f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCJFO71A; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCJFO71A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772263303; x=1803799303;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Eg1xPjDykvVFN6g71e76oLl+gcoqP89t6ypQDr76Edo=;
  b=bCJFO71AjwNzAVjozKcSWAEXaqkAE6UH9lWKRPWD85AezxEDbaIxFh2L
   8k1Dhc3ml1CYQYu//egX67FRUWsCgwrPER5KjJzYiJkSvYOJixvwRzZMb
   vXS/XEecJ/6ZAkSE/8oY/Hdw6lOXCaNfZnhrwDpO0WCo9WgzsjrKYz9n1
   /D5WjONPMx2G08NTZatAyAJYxA7OalQ/Akg90HxY4U8xVrKkfTG7FponN
   XRIJh5ZhcMkvDZGLtKsImC7B+RsGDbcyRQ6m7SEVSSspQH/69sCZ5r5+M
   rzWeC/jBfHweV0haI0442lyUZns1xxFR/zQlMR/FInOhHBrpphqX9Kzu5
   A==;
X-CSE-ConnectionGUID: oksArVPvQlOaIWmvYbAMGw==
X-CSE-MsgGUID: POBBSS6fRYSdoGe70vYpiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73387937"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="73387937"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 23:21:43 -0800
X-CSE-ConnectionGUID: bAf5BFr+SvC8h8T7ByxWUg==
X-CSE-MsgGUID: +DuYxRpdTCWtJfjTnAWE8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="244381683"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Feb 2026 23:21:41 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwEdv-000000000lR-01LM;
	Sat, 28 Feb 2026 07:21:39 +0000
Date: Sat, 28 Feb 2026 08:21:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/5] ARM: dts: bcm4708-linksys-ea6300-v1: specify switch
Message-ID: <202602280826.8tYJqTPE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260220021353.40554-5-rosenp@gmail.com>
References: <20260220021353.40554-5-rosenp@gmail.com>
TO: Rosen Penev <rosenp@gmail.com>
TO: devicetree@vger.kernel.org
CC: Florian Fainelli <florian.fainelli@broadcom.com>
CC: Hauke Mehrtens <hauke@hauke-m.de>
CC: "Rafał Miłecki" <zajec5@gmail.com>
CC: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.0-rc1 next-20260227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/ARM-dts-bcm4709-linksys-ea9200-set-WAN-MAC/20260220-101855
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260220021353.40554-5-rosenp%40gmail.com
patch subject: [PATCH 4/5] ARM: dts: bcm4708-linksys-ea6300-v1: specify switch
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm-randconfig-2052-20260220 (https://download.01.org/0day-ci/archive/20260228/202602280826.8tYJqTPE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602280826.8tYJqTPE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602280826.8tYJqTPE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): ports:port@5: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dtb: ethernet-switch@18007000 (brcm,bcm53011-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
