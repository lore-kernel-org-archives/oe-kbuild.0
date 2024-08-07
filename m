Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C38191F7C
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Aug 2024 05:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723007723; cv=none; b=lj1rQWvpdnj7/mAd9ofF4eMjY8gkr7Haoc5FaU681FyOd9qxDv3p5XoosOXIuGgMnqcebad57QFR9FjElT748KT4927F/44ZZSxuot6+GXvhXcuKOcRmFVenyi+KZ6iB3ywEUrDRoLktuY9kih3Gm9Vfcixf1iHnu4GwgmyPXog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723007723; c=relaxed/simple;
	bh=KKMjvsXLQNsHllUTQSTefCVZWTlNHs8qRBey5MOvcAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dkvs3KZz8m+p/gnAKA+gjoTT88bLDqzqKMXHiMLp4b53GkQpTdZo72RtesG/WYFW83YPI8Ua2t5igXJGMiiHfYxI4D29K37daVqI0gmlj+8DP6P/r1uzir59TR1khHwqh1nlb6tjx0IhfxbAmQZvCwtvlGJppPLgjr378kkV9qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9fDOCNC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9fDOCNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723007721; x=1754543721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KKMjvsXLQNsHllUTQSTefCVZWTlNHs8qRBey5MOvcAI=;
  b=d9fDOCNCw2mht973C3CW97TW4+3JM61VDRhMLoiOwZPCk/lBHloNF5Ze
   2k7ZkFRATU9QA6MsULdFr0SFk/rpdJPFbohxXVAebV21pdYew56cWJq9/
   xM2tpsEUauDT0zfMxeKz1VG3Kwi7WoUoEisOJl1xxJR4CD+xidoL98ML4
   68jb2gef0ss/mQxKtq0kqykLGCgAIJ1p9r2V/e1WobBHqbQ0cWupRWHma
   gyRJci2vfwFPewoNDe2CdJh+xRoKppmDfUt/Rw469EIU+66Tz+20Uj20O
   PFEL5gOn4QPAb11H26yeyKh7lxTMbnJwHw6KjSegxKhCUHE3m4a4+xpSt
   A==;
X-CSE-ConnectionGUID: Wm61dLtZRJK9BHGB2XriMw==
X-CSE-MsgGUID: tMNHTO32SOSmvpLfWlSD+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21200576"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="21200576"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 22:15:21 -0700
X-CSE-ConnectionGUID: VSZYOJqIRzmh5wqpuhhi+Q==
X-CSE-MsgGUID: 7fhsxGrfSTu7982/IBSf5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="61376459"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 06 Aug 2024 22:15:19 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbZ13-00059E-0H;
	Wed, 07 Aug 2024 05:15:17 +0000
Date: Wed, 7 Aug 2024 13:14:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e80100-yoga: Update panel bindings
Message-ID: <202408071214.Elh8KJRi-lkp@intel.com>
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
In-Reply-To: <20240806202218.9060-1-robdclark@gmail.com>
References: <20240806202218.9060-1-robdclark@gmail.com>
TO: Rob Clark <robdclark@gmail.com>
TO: linux-arm-msm@vger.kernel.org
CC: Stephan Gerhold <stephan.gerhold@linaro.org>
CC: Abel Vesa <abel.vesa@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Clark <robdclark@chromium.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.11-rc2 next-20240806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/arm64-dts-qcom-x1e80100-yoga-Update-panel-bindings/20240807-043351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240806202218.9060-1-robdclark%40gmail.com
patch subject: [PATCH v4] arm64: dts: qcom: x1e80100-yoga: Update panel bindings
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arm64-randconfig-051-20240807 (https://download.01.org/0day-ci/archive/20240807/202408071214.Elh8KJRi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071214.Elh8KJRi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408071214.Elh8KJRi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:3873.11-3883.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pci@1bf8000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: panel: compatible: 'oneOf' conditional failed, one must be fixed:
   	['samsung,atna45dc02', 'samsung,atna33xc20'] is too long
   	'samsung,atna33xc20' was expected
   	'samsung,atna45af01' was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,atna33xc20.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/display-subsystem@ae00000/displayport-controller@aea0000/aux-bus/panel: failed to match any schema with compatible: ['samsung,atna45dc02', 'samsung,atna33xc20']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
