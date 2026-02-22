Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E723D2F872
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Feb 2026 00:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771720690; cv=none; b=ei3+X3VJKC6sL7zBLTenJ8xZDDU1WtlO5XR0VPrX1xK7FNP9EoCXe6DVljQSO2PP78M2s6te6S1ksIFQRBSQMbNFtTRJt6ABlPLe2iiSzWqjpJOMwxMGs+a6KogqRxEocY5Fu4OUauI4p17Yk6/6XJks9UAvzcNRpq6fJuYPgB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771720690; c=relaxed/simple;
	bh=Rdz+D4vat8br4thdxA8IJzyExMQX484kMXNFtSFR798=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rRF6BODG4ak5U+H2wMbMy6lgM7jnLk/VCPdX03uIa2mNLpSYnCq21FQUrzjPKFKOJBhCCdgk9RUYqJuS1lxTSoUU23fiLqgNy54PpTjIRojMEopwGaxiCdyUFx49w/naDqUaFdRzPgKEZYNEFZUjggzJ4YSzf9rca7XYIrvaFeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvOT8uiL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvOT8uiL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771720688; x=1803256688;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Rdz+D4vat8br4thdxA8IJzyExMQX484kMXNFtSFR798=;
  b=mvOT8uiLqo2QlD/2jtDaULZnJZ/DAPsF6Ynb3aa9vL+sOLvuWQQB0PY8
   d/mHUWNFbbvZdtoQltHp3sItvZMgwK08mN0UkRO3DwQTOvkTcMKtM0cOO
   4RGQiczo/mrnHZElHko4fbi+PGZUWqWm61a5jKsh6eYTBCm8fGFTiRZqO
   T4NUNAZixNWff03XD6PT6sgY9sECZ9hH1OErJwjnKAI7onFbIv9XvVIri
   QTFkuE7UnIGKRQ4vwQgdlBTxxnVdpQ3FGur1/IZ6JKZPl0grTxA2yljuD
   EgZKjdk61u44T8uoklf6IrJYsELS3/Su/lsrjl9hOQ0OLTVapfcalvAfM
   Q==;
X-CSE-ConnectionGUID: rNAufJxHQU+gTcb7jFDFTw==
X-CSE-MsgGUID: hMtFCODtSLKyUSsFITg6PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="72643885"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="72643885"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 16:38:08 -0800
X-CSE-ConnectionGUID: CYKQWxoJRuSL5j15FwXE5A==
X-CSE-MsgGUID: +pqFC4yZSUKA1DFz/GB3vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="220194252"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 21 Feb 2026 16:38:06 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtxU4-000000004Wd-0c7V;
	Sun, 22 Feb 2026 00:38:04 +0000
Date: Sun, 22 Feb 2026 01:37:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/5] ARM: dts: bcm4709-asus-rt-ac87u: specify switch
Message-ID: <202602220110.iFx93aIe-lkp@intel.com>
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
In-Reply-To: <20260220021353.40554-4-rosenp@gmail.com>
References: <20260220021353.40554-4-rosenp@gmail.com>
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
patch link:    https://lore.kernel.org/r/20260220021353.40554-4-rosenp%40gmail.com
patch subject: [PATCH 3/5] ARM: dts: bcm4709-asus-rt-ac87u: specify switch
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2052-20260220 (https://download.01.org/0day-ci/archive/20260222/202602220110.iFx93aIe-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602220110.iFx93aIe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602220110.iFx93aIe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dtb: pcie@12000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dtb: pcie@13000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dtb: pcie@13000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dtb: pcie@14000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dtb: pcie@14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@7: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): ports:port@7: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
   	'managed' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
>> arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dtb: ethernet-switch@18007000 (brcm,bcm53012-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
