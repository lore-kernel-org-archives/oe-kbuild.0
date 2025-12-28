Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8933C1FBEA8
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Dec 2025 17:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766944619; cv=none; b=dbJIQsYwUV2NQ9Zh9CrpOCeTStCgcrYdQHA+MQGPjaHSrri8BNGOWdDLj8X9pyOy9hhdovLtBgh7QQPO7+HBxuqmP5qZA4f7eoP/1dZ9jGzyOfnbDTjFWbpLSXroXKyTlvRGR/YF3vbAbaKrY7y6RKxtFDheNdTor3XZL/i1b4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766944619; c=relaxed/simple;
	bh=lyRAVYy8fsFqD8aVqGX5X9JYzeC6E1mDBZ1xg4J81j0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=otRO+wOqeByJgzpu/zBRJlp4976/trliTh1V0vfG7THqg0NrTpmywjWRHmd7SLdwI1Y23jkTjPNfuwPE4R4zjjKS9M68maTB9QrGWlLnztYhx7vbiviWOXeo325bnlWXGhCtOqcrbOSIGZ4J1AA52dvr1c/0zIrnc+pgaranniM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEzzjxI5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEzzjxI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766944618; x=1798480618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lyRAVYy8fsFqD8aVqGX5X9JYzeC6E1mDBZ1xg4J81j0=;
  b=iEzzjxI5S2y9wKjxtO3EF/CRHEU48oRpg8faA+WZevhbJ58jJEH4NALQ
   cx9PIIPy2CJOv3kCstfHRygYQFIsWGTu0B0om6rFAT3RTRXM6CafBnx2u
   mXuzmusn1A8AtvU++3QVVGDSfLuB+9jETvXoRE4dUPM0jf1PY54uWguWW
   XTy5j/+eC4ivv4mH9U71Uv4a8oVpisUMJTf1/YBxM65i9NDehxylh7fTf
   X3pCIFd9dv4Ze/ta8Bqo+pLxaIp00AkE9ijogzMWFxfR8RENI2HshNbJw
   ryjR74QBXPTLnOicZzhF1stmCiMVH27eDYxm28RFeoAFf9LTKylJinUOY
   g==;
X-CSE-ConnectionGUID: SA6sNgxNQqONVNBK1NXAfg==
X-CSE-MsgGUID: /9gYUWJpTeGDFdLnwk0+nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="79700980"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="79700980"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 09:56:58 -0800
X-CSE-ConnectionGUID: IyZltmklSAKOny1BpSNYxw==
X-CSE-MsgGUID: fc2cT/M2TKi1sAqmn6wbmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="238172318"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Dec 2025 09:56:56 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZv0g-000000007Zg-0WXQ;
	Sun, 28 Dec 2025 17:56:54 +0000
Date: Sun, 28 Dec 2025 18:56:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: qcom: msm8994-octagon: Fix Analog Devices
 vendor prefix of AD7147
Message-ID: <202512281800.43JNYhEH-lkp@intel.com>
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
In-Reply-To: <20251226003923.3341904-1-vladimir.zapolskiy@linaro.org>
References: <20251226003923.3341904-1-vladimir.zapolskiy@linaro.org>
TO: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Gustave Monce <gustave.monce@outlook.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Vladimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Zapolskiy/arm64-dts-qcom-msm8994-octagon-Fix-Analog-Devices-vendor-prefix-of-AD7147/20251226-084113
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251226003923.3341904-1-vladimir.zapolskiy%40linaro.org
patch subject: [PATCH] arm64: dts: qcom: msm8994-octagon: Fix Analog Devices vendor prefix of AD7147
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2052-20251227 (https://download.01.org/0day-ci/archive/20251228/202512281800.43JNYhEH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project c9eb572b141746426560c650fadf9ab75cca9867)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512281800.43JNYhEH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512281800.43JNYhEH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: /soc@0/i2c@f9924000/tas2553@40: failed to match any schema with compatible: ['ti,tas2552']
>> arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: /soc@0/i2c@f9963000/touch@2c: failed to match any schema with compatible: ['adi,ad7147_captouch']
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800 (qcom,msm8994-dwc3): interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: /soc@0/i2c@f9924000/tas2553@40: failed to match any schema with compatible: ['ti,tas2552']
>> arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: /soc@0/i2c@f9963000/touch@2c: failed to match any schema with compatible: ['adi,ad7147_captouch']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
