Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BA58BE0
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jul 2024 00:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720830900; cv=none; b=cJemXtnkaA1zxHc69Ds1+IUF/x3YgpV/AN2AUweXumkNwVX88o3IdDH4kAekacc+Z4+W3AvUkwSsp1q6hOtVOWvXLJBZZQD0Q6SdmXm+lxZtiL3HWNJCjabAJK6hmB7SSYMGb95G7sjbjF7cXuniXECXrbzSrS2iVnmCDhjTiDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720830900; c=relaxed/simple;
	bh=g/POdK6sxcAa+r5Rm8Dz77SMCxJWa/vL3qNohNY/BJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eOLjYSWHLKvREpsx+lBEMasM3/ewmOX8wwW8quOfZ+BxMEqNtkO20H2O8LudjztcMORAwp7urqHX+YFINqFiW/9uO69JbGhLWTXfA1XcJdom+0HxFkU/UwX9EQpyab6YCEyQuiq7geKe6qbgHOHUaCIwAaKUWtBeePQve0d0z2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K8BBg/1Y; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K8BBg/1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720830898; x=1752366898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g/POdK6sxcAa+r5Rm8Dz77SMCxJWa/vL3qNohNY/BJk=;
  b=K8BBg/1YQ2+8cMrToaelhrDY//AQ4DarodoZxUTU4WeaVygMEKcREh0C
   bW2cdHecNxiFgSaj/H43wbE/t04265bV29qt9o4pDpa9/I/aq/ug6Tc49
   fL0fSHp3GPYw6RB4wEOvuZngKBeX6Zbcm97JEpiZUUx5XWrRgGMualf5f
   snOsKenTBBUY2/1zG/Y4Xdu566zXw4ZeNRB1IylISZmvu2/pQrYZFtzGq
   kHfXRW/PDMfzCiCJnNwEyNWS6LhrX7bsLSZq9/6LvnR+/HXZRGVrcMIka
   k4ypq1rPMEdDHUkuh92ttQyL6L48v/JCWNc/J6EhU5Fa2EUcn1lT0TFLN
   w==;
X-CSE-ConnectionGUID: ASmSldWhRMm2C4ceoTRaMQ==
X-CSE-MsgGUID: 9CBDQkhDQmuJqYP+vK6xbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="35833060"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="35833060"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 17:34:57 -0700
X-CSE-ConnectionGUID: d0X5iBJXRI2K0vFFCOVlBw==
X-CSE-MsgGUID: 2iMVvID6RHqqxCJFF6K+Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="48954437"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jul 2024 17:34:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSQiz-000bUA-12;
	Sat, 13 Jul 2024 00:34:53 +0000
Date: Sat, 13 Jul 2024 08:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8916-wingtech-wt865x8: Add
 Lenovo A6000/A6010
Message-ID: <202407130829.vpvTae8o-lkp@intel.com>
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
In-Reply-To: <20240712-msm89xx-wingtech-init-v1-2-64f4aa1870bd@trvn.ru>
References: <20240712-msm89xx-wingtech-init-v1-2-64f4aa1870bd@trvn.ru>
TO: Nikita Travkin <nikita@trvn.ru>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: Nikita Travkin <nikita@trvn.ru>
CC: Anton Bambura <jenneron@postmarketos.org>
CC: Stephan Gerhold <stephan@gerhold.net>

Hi Nikita,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3fe121b622825ff8cc995a1e6b026181c48188db]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikita-Travkin/dt-bindings-arm-qcom-Add-msm8916-39-based-Lenovo-devices/20240713-001903
base:   3fe121b622825ff8cc995a1e6b026181c48188db
patch link:    https://lore.kernel.org/r/20240712-msm89xx-wingtech-init-v1-2-64f4aa1870bd%40trvn.ru
patch subject: [PATCH 2/3] arm64: dts: qcom: msm8916-wingtech-wt865x8: Add Lenovo A6000/A6010
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arm64-randconfig-051-20240713 (https://download.01.org/0day-ci/archive/20240713/202407130829.vpvTae8o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407130829.vpvTae8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407130829.vpvTae8o-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: pmic@0: mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
   	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	[1] is not of type 'integer'
   	[1] is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: mpps@a000: mpp4-state: 'oneOf' conditional failed, one must be fixed:
   	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	[1] is not of type 'integer'
   	[1] is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: pmic@0: mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
   	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	[1] is not of type 'integer'
   	[1] is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: mpps@a000: mpp4-state: 'oneOf' conditional failed, one must be fixed:
   	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
   	[1] is not of type 'integer'
   	[1] is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /usb-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
