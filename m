Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1173A47
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Dec 2023 01:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgCdDCyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701997206; x=1733533206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5LUxQXouKctUKheBoOxDGBFVA35MGdDG523PzOTbJGs=;
  b=UgCdDCybeGAOTE+7mOfEzak1xTHkuaujxRS4xK6S/CiyEAq6XOlXyVGs
   jdWlPg7oY52Wn8HH+irMkm+awVZ7AM39bCLs1Dh9pq9+/1f0+76qO4lFj
   4GHOm1PKmXPVqyk7o3pcq6AcDu1EUbs1qNaVFLr7ndpFS66SmaOLhy4TH
   i9ea3sM0EmaTQhi7hXYw5BbU0+cWH4/oCK7Kxh2t3zctHuxwIUuQa6Po5
   ZtcbhTnnjAHOZrO3mwk3TpzNevTIRY+BAlIe2fmv5inPM3YJ6mfNhLYOh
   gfdtRfBlkobSQCrfG1g6SYLKJOAaSF6DFKIB1fZg8IvkmNVercStiTXJ/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="7694240"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="7694240"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 16:59:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="13311783"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Dec 2023 16:59:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBPDb-000D3V-2h;
	Fri, 08 Dec 2023 00:59:51 +0000
Date: Fri, 8 Dec 2023 08:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.1 3/19] dtbs_check:
 Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml:
Message-ID: <202312080815.VS5fTE7m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml:"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   69af1437218c47d5f137e5fa68c64a9ca0f7ce22
commit: 3221f9ebd92a7a3445a68b65cf11db17a28b3ae4 [3/19] UPSTREAM: ASoC: dt-bindings: mediatek,mt8188-mt6359: use common sound card
:::::: branch date: 31 hours ago
:::::: commit date: 3 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312080815.VS5fTE7m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312080815.VS5fTE7m-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml: title: 'Marvell Platforms Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/net/wireless/silabs,wfx.yaml: title: 'Silicon Labs WFxxx devicetree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/power/supply/dlg,da9150-fuel-gauge.yaml: title: 'Dialog Semiconductor DA9150 Fuel-Gauge Power Supply bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/sound/sound-card-common.yaml
   Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml: title: 'Qualcomm Technologies, Inc. PM8008 PMIC bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/net/wireless/microchip,wilc1000.yaml: title: 'Microchip WILC wireless devicetree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/net/wireless/qca,ath9k.yaml: title: 'Qualcomm Atheros ath9k wireless devices Generic Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
