Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5CB18643
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 02:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733970855; cv=none; b=g9usvWs/4izt9cRwEQJb+wIK38Yq5T2+SQW7SoMLkoWFSGVWjOIRCB9JXOdh1A+Fyb87gia5ufTWf83f7pDJtNQOpuw4UwXJYj+Gpkd59RyDM2URyjE3Kk3Ubg/jaohz9kHhk9ly5tLLfPy6PgVlzUYmmp/sNhJ37yCJ1VxI/fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733970855; c=relaxed/simple;
	bh=DMvnDBQp4mkFhQZEWJzzFqCC6gbY4RmxmC/2+25cKOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dt1FDysJ1LNnlvKoSvo5URH4Lp2AIZvPpCMd0S7jXwuMkx5PGLm2O3/B9X6QZlOKrRl+63Sd6bIapQCHd6+U0So0HtgPa1CmGzKx8YhDYTew9j+HD7H8q8MHFeZsC42t/Q8PrVstsCvBqZI4K3mhW8qgnNkwFZOl9MSaaIkV11k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SiARsS4o; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SiARsS4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733970853; x=1765506853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DMvnDBQp4mkFhQZEWJzzFqCC6gbY4RmxmC/2+25cKOY=;
  b=SiARsS4oA0zTQ91yxjS+oI2j9fGOe+vTjY15HIpecswJ4Xsc14lA5rJm
   1lD5pWMd/GSuxF4Z54ECJl1N1fwvTtXAfmytk2c57/SNPlSh6Nlw/pW4J
   yoMgVsHLMCMB1JWKkAJr5zq2IyyNKinO1yTXbAA3vjioQYZgarUUixUtz
   l4XEGCQRQycU5gXrZgWlA1KVgLoEU4xufvPUSvco2dYPZkQTdH2kkVXCy
   oPKdBMb6gsvURY8mA2U0A7LSiJ861VfUZptNQdVCvvtY88jFfBZ+mfGJT
   n+3ke+pKTkdS3ShhfEi1h3wjW3GfSkvwnTakiENWPo3KKZlxZz286twDA
   Q==;
X-CSE-ConnectionGUID: enUk8yhISiKcokvOw/R7Qg==
X-CSE-MsgGUID: VklciQ7rSbyM6UUhZoHRow==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45758642"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45758642"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 18:34:12 -0800
X-CSE-ConnectionGUID: Ow5JI2qyQGO9mMc8c3Mcxw==
X-CSE-MsgGUID: /dAsLAtXRlSkdmNf3z9CWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100173861"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Dec 2024 18:34:10 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLZ1k-0007LV-1a;
	Thu, 12 Dec 2024 02:34:08 +0000
Date: Thu, 12 Dec 2024 10:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 09/14] arm64: dts: qcom: sdm845-starqltechn: add
 max77705 PMIC
Message-ID: <202412121043.V3aWcoge-lkp@intel.com>
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
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-9-ec604481d691@gmail.com>
References: <20241209-starqltechn_integration_upstream-v8-9-ec604481d691@gmail.com>
TO: Dzmitry Sankouski <dsankouski@gmail.com>
TO: cros-qcom-dts-watchers@chromium.org
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Jaroslav Kysela <perex@perex.cz>
TO: Takashi Iwai <tiwai@suse.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-sound@vger.kernel.org
CC: Dzmitry Sankouski <dsankouski@gmail.com>

Hi Dzmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d1486dca38afd08ca279ae94eb3a397f10737824]

url:    https://github.com/intel-lab-lkp/linux/commits/Dzmitry-Sankouski/ASoC-dt-bindings-Add-bindings-for-WCD934x-DAIs/20241209-201427
base:   d1486dca38afd08ca279ae94eb3a397f10737824
patch link:    https://lore.kernel.org/r/20241209-starqltechn_integration_upstream-v8-9-ec604481d691%40gmail.com
patch subject: [PATCH v8 09/14] arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20241210 (https://download.01.org/0day-ci/archive/20241212/202412121043.V3aWcoge-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121043.V3aWcoge-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412121043.V3aWcoge-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts:434.10-488.4: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@ac0000/i2c@a98000/pmic@66: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4686.27-4737.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4758.27-4809.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1221.44-1224.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/geniqup@ac0000/i2c@a98000/pmic@66: failed to match any schema with compatible: ['maxim,max77705']
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/geniqup@ac0000/i2c@a98000/pmic@66/leds: failed to match any schema with compatible: ['maxim,max77705-rgb']
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/geniqup@ac0000/i2c@a98000/pmic@66/charger: failed to match any schema with compatible: ['maxim,max77705-charger']
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/geniqup@ac0000/i2c@a98000/pmic@66/fuel-gauge: failed to match any schema with compatible: ['maxim,max77705-battery']
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/geniqup@ac0000/i2c@a98000/pmic@66/haptic: failed to match any schema with compatible: ['maxim,max77705-haptic']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
