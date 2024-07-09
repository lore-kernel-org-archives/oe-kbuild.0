Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37680137776
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 06:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720505471; cv=none; b=h1BwPr4IpMsE6uY9nBCX0Kg3PVQT6FP1ZyHEyG9NTh3t2Hzap8r2YlA8oSgWUVEay6270tfZqhk57KSoNVY+0p1Z0kaHZnW5V2omXiZxW6/eDJOWxlVXcTNTgr8ueIo/hDAdsaXdWgsnufUJz3SjRfFTV5DM7LSVOothE+eDNUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720505471; c=relaxed/simple;
	bh=lrFkhHc4aoPEymkknd01g47FFC3l2OZPukDgLLCp/9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cmcJulzX2QWl+Ldgblmh/m2yNK2zpa0TEqcgiw4raWyPXE7XuPrk8PVMVnmo+hUFAjfc02ronV4qq7SYOKR0sY/AfgIzeAfEk/nrycZ9WGJIjYCdxvB55UcfYXpZhKRefJWrV1Qg+XBRlvLo5BiXymdWrQ9Na1bGsQx9epF7ggQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IelFLkbf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IelFLkbf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720505469; x=1752041469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lrFkhHc4aoPEymkknd01g47FFC3l2OZPukDgLLCp/9k=;
  b=IelFLkbfyKw+dCRxoaeKDKE+ORBGqMdaSKgoCZiOH8kiSOCoDIyAf2Bt
   B7NC0koqLHzoKUTfUezjb2LMzzW7i9K5XGjTQQoy3JejmzI0FONAw1bca
   MfXgpbhEivvlb8AK3G2YF+pB/RVlyDMtNPq1FQ1apPZ3mcktVka12aRct
   0PHK3V+XXJOjRzXCDSc/mRm6RGsSlMZkA2zFMU3Twfg7DtXCDhV0rN7NX
   6JUBsIssGy53Z71UFq1S/Ojhtf8L/XQfTsITAeqqfXL6OghL+fDq068bS
   oGlAmZzQQekb8DW/QbUcEj8teAFcFpe/x4vfIGYKjcmSfG4Cyld4Z2vt6
   g==;
X-CSE-ConnectionGUID: GSA+cnWARd2t51ImwbsW/g==
X-CSE-MsgGUID: vQcw1dG7RVWO0rGwOYyv1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="40247716"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="40247716"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 23:11:07 -0700
X-CSE-ConnectionGUID: tH5a3gviQFm9BRpfqrralQ==
X-CSE-MsgGUID: qtD4w/a2RkmYdmS9zDP5kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="52069120"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jul 2024 23:11:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR447-000WNQ-2Y;
	Tue, 09 Jul 2024 06:11:03 +0000
Date: Tue, 9 Jul 2024 14:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.11 285/291]
 arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: clock-controller@ab00000: clocks:
 [[44, 192], [41, 0]] is too long
Message-ID: <202407091447.HcASyJ92-lkp@intel.com>
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
TO: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   2881fcfc8f32c536a4bf708066d6fea9ba762e86
commit: cfe9685473add0ae76952f0eb54489c3547db335 [285/291] arm64: dts: qcom: sm8150: Add video clock controller node
:::::: branch date: 13 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20240707 (https://download.01.org/0day-ci/archive/20240709/202407091447.HcASyJ92-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091447.HcASyJ92-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407091447.HcASyJ92-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3944.27-4016.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4037.27-4090.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: clock-controller@ab00000: clocks: [[44, 192], [41, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: clock-controller@ab00000: clock-names:0: 'bi_tcxo' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: clock-controller@ab00000: clock-names: ['iface', 'bi_tcxo'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
   arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: /soc@0/interconnect@ac00000: failed to match any schema with compatible: ['qcom,sm8150-camnoc-virt']
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3944.27-4016.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4037.27-4090.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: clock-controller@ab00000: clocks: [[44, 192], [41, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: clock-controller@ab00000: clock-names:0: 'bi_tcxo' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: clock-controller@ab00000: clock-names: ['iface', 'bi_tcxo'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: /soc@0/interconnect@ac00000: failed to match any schema with compatible: ['qcom,sm8150-camnoc-virt']
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3944.27-4016.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4037.27-4090.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: /soc@0/geniqup@8c0000/i2c@884000/da7280@4a: failed to match any schema with compatible: ['dlg,da7280']
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: clock-controller@ab00000: clocks: [[44, 192], [41, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: clock-controller@ab00000: clock-names:0: 'bi_tcxo' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: clock-controller@ab00000: clock-names: ['iface', 'bi_tcxo'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: /soc@0/interconnect@ac00000: failed to match any schema with compatible: ['qcom,sm8150-camnoc-virt']
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3944.27-4016.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4037.27-4090.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: gpu@2c00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,adreno-640.1', 'qcom,adreno', 'amd,imageon'] is too long
   	'qcom,adreno-640.1' does not match '^qcom,adreno-[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]$'
   	'qcom,adreno-640.1' does not match '^amd,imageon-200\\.[0-1]$'
   	'amd,imageon' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: clock-controller@ab00000: clocks: [[44, 192], [41, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: clock-controller@ab00000: clock-names:0: 'bi_tcxo' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: clock-controller@ab00000: clock-names: ['iface', 'bi_tcxo'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: /soc@0/interconnect@ac00000: failed to match any schema with compatible: ['qcom,sm8150-camnoc-virt']
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3944.27-4016.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4037.27-4090.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: clock-controller@ab00000: clocks: [[2, 192], [42, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: clock-controller@ab00000: clock-names:0: 'bi_tcxo' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: clock-controller@ab00000: clock-names: ['iface', 'bi_tcxo'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: /soc@0/interconnect@ac00000: failed to match any schema with compatible: ['qcom,sm8150-camnoc-virt']
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3944.27-4016.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4037.27-4090.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: clock-controller@ab00000: clocks: [[2, 192], [42, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: clock-controller@ab00000: clock-names:0: 'bi_tcxo' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: clock-controller@ab00000: clock-names: ['iface', 'bi_tcxo'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: /soc@0/interconnect@ac00000: failed to match any schema with compatible: ['qcom,sm8150-camnoc-virt']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
