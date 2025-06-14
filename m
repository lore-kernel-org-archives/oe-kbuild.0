Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9BD2E11B1
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Jun 2025 05:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749880509; cv=none; b=fLOkbq2s+RCd2Wjf1BTmPEloAy4B8NFwiABkgi/WJTz1TK9Beyggzj88oKfsz/kbb+vUeb3+xgirrRnEOureusDDHW9m3FCgUI3fuUTdqAxS+69L9ssVhofPtyE2c+uvTP7BfDtDfPGxKMpfFab6iIbrNHUmve5uZH0KOuQrLxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749880509; c=relaxed/simple;
	bh=TH1K05TdJP8Tmyn4lfwpKlVJ6+dv86p69kVJnXZgfpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QSN6a20awP5XFqgio8Qcqdx6qLsqUae694vgzk8UbzwBTrR9qWKgYEOgi3Bl00y73bpH0ElRDkzX7uuaWXSL5O/aXPQi7sKogrzGv5SE19aOtnsAe5lnSv5Wf1RBBoM7SB9XhhosauU/EffAsTkymvU1puY/9F+v327YyNPRXqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPZvnyTt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPZvnyTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749880506; x=1781416506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TH1K05TdJP8Tmyn4lfwpKlVJ6+dv86p69kVJnXZgfpQ=;
  b=VPZvnyTtFcEX8fZt9PF428jL6HnLq5vI1oHTHmUn2DQ7iQHVIeBn2UHF
   Qw9YbyikzPDoOo3QTp5t8pHAZpcboaI4GO/EgZzecTCo5TX3HaGsOSpKW
   HP+gz2vTsAZxguJvBsBNX3o3cmM/rPmt7neyhoCN+Kj3Jr1+VRueQMeav
   j/08G4Bx6r8TUQwdJGgfnYdLSHA7Xw0Grm+HAAF+nSL1S+ZJuKyNuHzlE
   Hv92TZIU4VXy9tKrQExo3KGHZnhAqTrEnpiWMMsdiGi9l4XUgBHg+NnDw
   BVlU9PO/1nLvE3JfkAg4wzR6PrKUBdf7BDD4k5uDCUKB3f06u67M9UTdq
   A==;
X-CSE-ConnectionGUID: iDrsCUwARCm2eptu1dEZWQ==
X-CSE-MsgGUID: dO8+1S/8QhGvBURV3gMU/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="74627194"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="74627194"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 22:55:05 -0700
X-CSE-ConnectionGUID: UtiU580CSGyGZcGHyuJvDw==
X-CSE-MsgGUID: gNPEb2AFQ0muuqUG10MvRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="153166534"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jun 2025 22:55:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQJr4-000DLC-2t;
	Sat, 14 Jun 2025 05:55:02 +0000
Date: Sat, 14 Jun 2025 13:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 3/9] arm64: dts: exynos: ExynosAutov920: add USB and
 USB-phy nodes
Message-ID: <202506141359.OZuDgnwX-lkp@intel.com>
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
In-Reply-To: <20250613055613.866909-4-pritam.sutar@samsung.com>
References: <20250613055613.866909-4-pritam.sutar@samsung.com>
TO: Pritam Manohar Sutar <pritam.sutar@samsung.com>
TO: vkoul@kernel.org
TO: kishon@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: alim.akhtar@samsung.com
TO: andre.draszik@linaro.org
TO: peter.griffin@linaro.org
TO: kauschluss@disroot.org
TO: ivo.ivanov.ivanov1@gmail.com
TO: m.szyprowski@samsung.com
TO: s.nawrocki@samsung.com
TO: pritam.sutar@samsung.com
CC: linux-phy@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: rosa.pila@samsung.com
CC: dev.tailor@samsung.com
CC: faraz.ata@samsung.com
CC: muhammed.ali@samsung.com
CC: selvarasu.g@samsung.com

Hi Pritam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc1]
[cannot apply to krzk/for-next next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pritam-Manohar-Sutar/dt-bindings-phy-samsung-usb3-drd-phy-add-ExynosAutov920-HS-phy-compatible/20250613-151601
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250613055613.866909-4-pritam.sutar%40samsung.com
patch subject: [PATCH v3 3/9] arm64: dts: exynos: ExynosAutov920: add USB and USB-phy nodes
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-051-20250614 (https://download.01.org/0day-ci/archive/20250614/202506141359.OZuDgnwX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506141359.OZuDgnwX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506141359.OZuDgnwX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb@16700000 (samsung,exynosautov920-dwusb3): 'vdd33-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/samsung,exynos-dwc3.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb@16800000 (samsung,exynosautov920-dwusb3): 'vdd33-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/samsung,exynos-dwc3.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb@16900000 (samsung,exynosautov920-dwusb3): 'vdd33-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/samsung,exynos-dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
