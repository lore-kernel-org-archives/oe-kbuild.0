Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078751F4622
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Mar 2025 15:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743004483; cv=none; b=kO7h9mT/9zs/PiZG1jd4DcpbhP3P89WMvEIdboGiwaIBRZOtUzaRUvsxtmLV6rgq9a/4ysc+TdQTDbGaiIpGzvAFhHDJ+YNBknDLvAVILxzyjs3iYMiwBeZh2g7qzxszhPBZZD6GV5SH0L4MdxvsysiU5PEsVePZ8ViIjZ689hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743004483; c=relaxed/simple;
	bh=6kHIrfmeRHEyeRszZTAs/q/W0jEKdysTL56zq6PQkbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EIn6Rc66DSkc/0r1kuNStCL+H2REsWwr13SX/OAFz6yOSPF4mczuCMBnZjSwY2bCPp3g7ytPZFkefGoFgAig+jJXMnfvKrKt47Xg6W4K2h8IsaNPZl9zFgThUqa2dXlp3Mv3ZVxBxYy5AI02NDXTJHFOvyLPnJBdNM0ECVLyx9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1a2q5FU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1a2q5FU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743004481; x=1774540481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6kHIrfmeRHEyeRszZTAs/q/W0jEKdysTL56zq6PQkbw=;
  b=V1a2q5FUcv6XtxxkdbM29D40UgIh81mkGpcoHhd0lrV7aiu4s3NhMIJl
   scu9bN9+bS32mKfw9aAwZ6NHRLELDfsc9Nq4ddqopIcnS2YiyPeMvjIER
   ljrrK8IxvWqHy/LRDOVv5LzDqSojzyK/8JCgr2lDwecF4jVQSF3CgMLZB
   ZgFq19x/kQ+a1uAwOKJNwVAL3kut1z2omeZoAlZpOiJSQlc/RzZ1V5W49
   aVV1JQ76ijKAiveO/GV7X+fVcjDodZaDKRgFcrKWXeh3+DsbuOTvd4+NM
   bPLIH3GZN6Nlw/U505GaalRYo0f43zvBrxDsYACkEekaltDGVtJ5ZGX3R
   g==;
X-CSE-ConnectionGUID: LcGbP9RGQH+eg2gtv7i+Mw==
X-CSE-MsgGUID: r/VlI3J1QcmtJA0JD3kYTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43542615"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="43542615"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 08:54:37 -0700
X-CSE-ConnectionGUID: sKr+GOaZSqOO1KXKgDLsKw==
X-CSE-MsgGUID: 4oBzOuKIR6uqgSOO3jnEKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="130004691"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 26 Mar 2025 08:54:35 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txT5N-0005rU-1h;
	Wed, 26 Mar 2025 15:54:33 +0000
Date: Wed, 26 Mar 2025 23:54:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/genexis-xg6846b-smp 5/5]
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: cpu@0:
 enable-method: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202503262331.Ur3IwOPf-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-smp
head:   74a053f3376f99f845cba56e7ae3c03206223cc6
commit: 74a053f3376f99f845cba56e7ae3c03206223cc6 [5/5] SMP stab
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20250325 (https://download.01.org/0day-ci/archive/20250326/202503262331.Ur3IwOPf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503262331.Ur3IwOPf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503262331.Ur3IwOPf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: cpu@0: enable-method: 'oneOf' conditional failed, one must be fixed:
   	'brcm,bcm6846' is not one of ['psci', 'spin-table']
   	'brcm,bcm6846' is not one of ['actions,s500-smp', 'allwinner,sun6i-a31', 'allwinner,sun8i-a23', 'allwinner,sun9i-a80-smp', 'allwinner,sun8i-a83t-smp', 'amlogic,meson8-smp', 'amlogic,meson8b-smp', 'arm,realview-smp', 'aspeed,ast2600-smp', 'brcm,bcm11351-cpu-method', 'brcm,bcm23550', 'brcm,bcm2836-smp', 'brcm,bcm63138', 'brcm,bcm-nsp-smp', 'brcm,brahma-b15', 'marvell,armada-375-smp', 'marvell,armada-380-smp', 'marvell,armada-390-smp', 'marvell,armada-xp-smp', 'marvell,98dx3236-smp', 'marvell,mmp3-smp', 'mediatek,mt6589-smp', 'mediatek,mt81xx-tz-smp', 'qcom,gcc-msm8660', 'qcom,kpss-acc-v1', 'qcom,kpss-acc-v2', 'qcom,msm8226-smp', 'qcom,msm8909-smp', 'qcom,msm8916-smp', 'renesas,apmu', 'renesas,r9a06g032-smp', 'rockchip,rk3036-smp', 'rockchip,rk3066-smp', 'socionext,milbeaut-m10v-smp', 'ste,dbx500-smp', 'ti,am3352', 'ti,am4372']
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: cpu@1: enable-method: 'oneOf' conditional failed, one must be fixed:
   	'brcm,bcm6846' is not one of ['psci', 'spin-table']
   	'brcm,bcm6846' is not one of ['actions,s500-smp', 'allwinner,sun6i-a31', 'allwinner,sun8i-a23', 'allwinner,sun9i-a80-smp', 'allwinner,sun8i-a83t-smp', 'amlogic,meson8-smp', 'amlogic,meson8b-smp', 'arm,realview-smp', 'aspeed,ast2600-smp', 'brcm,bcm11351-cpu-method', 'brcm,bcm23550', 'brcm,bcm2836-smp', 'brcm,bcm63138', 'brcm,bcm-nsp-smp', 'brcm,brahma-b15', 'marvell,armada-375-smp', 'marvell,armada-380-smp', 'marvell,armada-390-smp', 'marvell,armada-xp-smp', 'marvell,98dx3236-smp', 'marvell,mmp3-smp', 'mediatek,mt6589-smp', 'mediatek,mt81xx-tz-smp', 'qcom,gcc-msm8660', 'qcom,kpss-acc-v1', 'qcom,kpss-acc-v2', 'qcom,msm8226-smp', 'qcom,msm8909-smp', 'qcom,msm8916-smp', 'renesas,apmu', 'renesas,r9a06g032-smp', 'rockchip,rk3036-smp', 'rockchip,rk3066-smp', 'socionext,milbeaut-m10v-smp', 'ste,dbx500-smp', 'ti,am3352', 'ti,am4372']
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: reset-controller@300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/brcm,bcm-pmb.yaml#
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: reset-controller@300000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/brcm,bcm-pmb.yaml#
   arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: reset-controller@320100: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/brcm,bcm-pmb.yaml#
   arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: reset-controller@320100: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/brcm,bcm-pmb.yaml#
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: /bus@ff800000/bootlut@7f0000: failed to match any schema with compatible: ['brcm,bcm6846-bootlut']
--
>> arch/arm/boot/dts/broadcom/bcm96846.dtb: cpu@0: enable-method: 'oneOf' conditional failed, one must be fixed:
   	'brcm,bcm6846' is not one of ['psci', 'spin-table']
   	'brcm,bcm6846' is not one of ['actions,s500-smp', 'allwinner,sun6i-a31', 'allwinner,sun8i-a23', 'allwinner,sun9i-a80-smp', 'allwinner,sun8i-a83t-smp', 'amlogic,meson8-smp', 'amlogic,meson8b-smp', 'arm,realview-smp', 'aspeed,ast2600-smp', 'brcm,bcm11351-cpu-method', 'brcm,bcm23550', 'brcm,bcm2836-smp', 'brcm,bcm63138', 'brcm,bcm-nsp-smp', 'brcm,brahma-b15', 'marvell,armada-375-smp', 'marvell,armada-380-smp', 'marvell,armada-390-smp', 'marvell,armada-xp-smp', 'marvell,98dx3236-smp', 'marvell,mmp3-smp', 'mediatek,mt6589-smp', 'mediatek,mt81xx-tz-smp', 'qcom,gcc-msm8660', 'qcom,kpss-acc-v1', 'qcom,kpss-acc-v2', 'qcom,msm8226-smp', 'qcom,msm8909-smp', 'qcom,msm8916-smp', 'renesas,apmu', 'renesas,r9a06g032-smp', 'rockchip,rk3036-smp', 'rockchip,rk3066-smp', 'socionext,milbeaut-m10v-smp', 'ste,dbx500-smp', 'ti,am3352', 'ti,am4372']
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/broadcom/bcm96846.dtb: cpu@1: enable-method: 'oneOf' conditional failed, one must be fixed:
   	'brcm,bcm6846' is not one of ['psci', 'spin-table']
   	'brcm,bcm6846' is not one of ['actions,s500-smp', 'allwinner,sun6i-a31', 'allwinner,sun8i-a23', 'allwinner,sun9i-a80-smp', 'allwinner,sun8i-a83t-smp', 'amlogic,meson8-smp', 'amlogic,meson8b-smp', 'arm,realview-smp', 'aspeed,ast2600-smp', 'brcm,bcm11351-cpu-method', 'brcm,bcm23550', 'brcm,bcm2836-smp', 'brcm,bcm63138', 'brcm,bcm-nsp-smp', 'brcm,brahma-b15', 'marvell,armada-375-smp', 'marvell,armada-380-smp', 'marvell,armada-390-smp', 'marvell,armada-xp-smp', 'marvell,98dx3236-smp', 'marvell,mmp3-smp', 'mediatek,mt6589-smp', 'mediatek,mt81xx-tz-smp', 'qcom,gcc-msm8660', 'qcom,kpss-acc-v1', 'qcom,kpss-acc-v2', 'qcom,msm8226-smp', 'qcom,msm8909-smp', 'qcom,msm8916-smp', 'renesas,apmu', 'renesas,r9a06g032-smp', 'rockchip,rk3036-smp', 'rockchip,rk3066-smp', 'socionext,milbeaut-m10v-smp', 'ste,dbx500-smp', 'ti,am3352', 'ti,am4372']
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/broadcom/bcm96846.dtb: reset-controller@300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/brcm,bcm-pmb.yaml#
>> arch/arm/boot/dts/broadcom/bcm96846.dtb: reset-controller@300000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/brcm,bcm-pmb.yaml#
   arch/arm/boot/dts/broadcom/bcm96846.dtb: reset-controller@320100: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/brcm,bcm-pmb.yaml#
   arch/arm/boot/dts/broadcom/bcm96846.dtb: reset-controller@320100: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/brcm,bcm-pmb.yaml#
>> arch/arm/boot/dts/broadcom/bcm96846.dtb: /bus@ff800000/bootlut@7f0000: failed to match any schema with compatible: ['brcm,bcm6846-bootlut']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
