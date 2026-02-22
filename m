Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CD542AA3
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Feb 2026 23:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771803983; cv=none; b=PZ6uXlfgNFcOQw+IF3tk7I+14s1MBCBHC0C+L2gwimqCV/kQnomOI3a8eLMmQQW6oAZAbruIB2G6Vs5WHIugIiYVNCZdQp4yJD5z/LUS+migyE2huvW/LDh1Ct1zUxcmX+p2QHIfjRQCOeQMduTZclSYs7mMMT6Uef6X4Mvt9Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771803983; c=relaxed/simple;
	bh=NOQyU5LORfnSHBhwhncEA+eTgtp0ocCXUwPnozqeAcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=upPD6P3lFEWcQ5ZXCwC5/0My08eRLkFK+V+YJsv+3FGxV4z8FVms1e30SxFdyrXbSM9LqDzd9fx+eFyyY/D+h943edZP91u3SGrBBAdIGR0CpwHpRVXAHgfquhrLcuMKBmA4CiLpu4Y9315p8TDjtdHD4JXNmUMLN7NSjahnoVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGV9+scm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGV9+scm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771803979; x=1803339979;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NOQyU5LORfnSHBhwhncEA+eTgtp0ocCXUwPnozqeAcQ=;
  b=CGV9+scmlpRZevEt7X2oJ4OzpnmQZHKJAn/ojrqDbDYHN9bTQ4P9ya+h
   4XEUke2x6JZgqkBB3qr6oZHOT6BWUcSfDr4tmrdNDz9JZaUYSnn+RVZmw
   ZiwUqd4DYd3ol05WLpidUWiAJNetGBQ8QkggSbotg0awEEACW5yJeLcg0
   klchMfsfvPb8+5mw5FPmswI9IdPaxAvppn7WOBs5B2qtj6Lv60scTtvZd
   lA7t8i+K8WGGssse6geRlXt8ByfDskaXlrfW+7N70BKErE8wFRGplCRQt
   f/fzMoX7PPUm7SGaDAzu6+Rr82Jv+PgyKFZGIUe9hVxoviidk60v2vNpV
   A==;
X-CSE-ConnectionGUID: WQDMVuXHRu2tJ9PGtrsAwQ==
X-CSE-MsgGUID: hBPrQLa6RniCAK6dDkAS2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="84161722"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="84161722"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 15:46:18 -0800
X-CSE-ConnectionGUID: Jax9sZGWSc2c89sjQya9vA==
X-CSE-MsgGUID: yGde/FT3TWCLh9EDqcjRiw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 22 Feb 2026 15:46:17 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuJ9T-000000004kj-28TG;
	Sun, 22 Feb 2026 23:46:15 +0000
Date: Mon, 23 Feb 2026 00:46:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/5] ARM: dts: bcm4708-linksys-ea6300-v1: specify switch
Message-ID: <202602230029.hU0XT0Zj-lkp@intel.com>
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
[also build test WARNING on linus/master v6.19 next-20260220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/ARM-dts-bcm4709-linksys-ea9200-set-WAN-MAC/20260220-101855
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260220021353.40554-5-rosenp%40gmail.com
patch subject: [PATCH 4/5] ARM: dts: bcm4708-linksys-ea6300-v1: specify switch
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2052-20260220 (https://download.01.org/0day-ci/archive/20260223/202602230029.hU0XT0Zj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260223/202602230029.hU0XT0Zj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602230029.hU0XT0Zj-lkp@intel.com/

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
