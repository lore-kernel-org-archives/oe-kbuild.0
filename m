Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3044432AAD1
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Feb 2026 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772181214; cv=none; b=rdesE7hG3/HVg7qkjTtjf4/RIcieYPohQwcTHfK5lO5qkTLpte8hh/oS0gV6nl36DazkUEnGJYvXOyqxbsqT1cv692AcLWhO3hz8JI5J7Vz4RpLkLLACgs+3Y+QFfpdvN1lDX7B5OUY2PWH1ejTbnsq79nV59/iqxnVIV4hptFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772181214; c=relaxed/simple;
	bh=7E3NF2uBc+b/UHZrKkagNboUkC1EFQ1an8L7HRB7chc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ukz2kgcay9WFcTxTzmxIKxhkdCxTedONnBR76dLHuXca9y2R84IZbN+6rCnS384iRTAIyLI/+XTABJaJ6WssJhV78Xasq3/qJugOXBfgvAkuC1rl06Q7OUrcezYG0IQFA5ErQBesog93dPIGfq51+N1+aqbXK2ZRZI0NFsdgfBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYD8umRy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYD8umRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772181213; x=1803717213;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7E3NF2uBc+b/UHZrKkagNboUkC1EFQ1an8L7HRB7chc=;
  b=LYD8umRyX3c0MMBXOX23VcDQ4DEDGZI5wfUcJbW9Ru6BznTIFgeu8ob7
   6ggbS0qAo3BRnVLWVk+tPqQUaoWQaA0UF7IBdoIWt28UI5tFWalBflIcL
   QdJg2NYtyTwEHYzyeaEwZQ2XReedct5NIiRkLe6r+MPcf8UFKq9BntK69
   X/C1FaouyoDGhJAEumT+So0DXtxr7m2LoqYn//v37mZsPJDj0EgRVPKcq
   aSOUSviSbJx/SM3OmXCoTZKWOUJHqXwLIXO+NwtRjf8F/8epyfn6yNIqz
   04l32GEGU0eJ3T5jgIknGZMo8Jsst1iP5JzT+/RpNmVMsCh7pPbO6ZW2w
   w==;
X-CSE-ConnectionGUID: LLifBmZ/TlyVHPYrTH7bkg==
X-CSE-MsgGUID: mGFDEqQrRkyMAGzq/CmnSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83895742"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="83895742"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 00:33:30 -0800
X-CSE-ConnectionGUID: qM69vdaBTjuABQYpxhVrlQ==
X-CSE-MsgGUID: 9VfiaRbNRCek5z7fBLogCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="247355149"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 27 Feb 2026 00:33:29 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvtHp-000000000Vh-45o3;
	Fri, 27 Feb 2026 08:33:25 +0000
Date: Fri, 27 Feb 2026 09:32:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/5] ARM: dts: bcm4709-asus-rt-ac87u: specify switch
Message-ID: <202602270928.3i75n9d7-lkp@intel.com>
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
[also build test WARNING on v7.0-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/ARM-dts-bcm4709-linksys-ea9200-set-WAN-MAC/20260220-101855
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260220021353.40554-4-rosenp%40gmail.com
patch subject: [PATCH 3/5] ARM: dts: bcm4709-asus-rt-ac87u: specify switch
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-2052-20260220 (https://download.01.org/0day-ci/archive/20260227/202602270928.3i75n9d7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270928.3i75n9d7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602270928.3i75n9d7-lkp@intel.com/

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
