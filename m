Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C9233554F
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Jan 2026 16:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769789232; cv=none; b=ILguP0V6YUhxsdcaRuUD6/fuBadhMMRfH0t/x8nvIT2RojuiQJOQgk1JjOXnq6gTDDMU+nJKtKekRDKvczooSKnl4PqjD4jLOXSMwYow24dD0rgUIKK8y0xzlOZnkl7YkNshRch8cXF+v/4YaQEh+3yXb0q+nDv1tOCjUK/adVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769789232; c=relaxed/simple;
	bh=LT0nevcbCEHsZQ+4juhYJR/fg4zy0JEDtt2urUdPPJU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p/HUcVdtL/fM0twI5yH7I54Q2uxjm/UMvRMPeOtlUKw02j4i5pN4P9BbIR0MEi1d9oH0foEZkvI6m7pdwhF7qxOrveoDqmTNID9m08S8jb+wTNn/T3QZsOrhUWRZIvn3LCK3Ian5w8+M67MNZyf2U319v1gLivS0puhVGgQSq/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hOBtPx/7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hOBtPx/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769789230; x=1801325230;
  h=date:from:to:cc:subject:message-id;
  bh=LT0nevcbCEHsZQ+4juhYJR/fg4zy0JEDtt2urUdPPJU=;
  b=hOBtPx/7TpHBTmpKsKiTRIx5kOFcspoyDbXvRiYvlOkWAfMs+e4kh8aI
   vHr2bAc1sauOvaNoRSiX8B+EZ/DAYy6jkdSLUSVdYum4u2srG7lAnQtPT
   ne9wIFSiyj6tPlvgtgu1TfsO1UmHQQBCYaj8snEBtdunvDpJPU02UUT2N
   EmPkjPm2AxRRWv3wftuYtqYmNkfKN7bEN7WkI3wR9E4s6qiWqYDhmFOA3
   x1gGd0bK2rKElBmqxiaoXkPTpaq/UZvMgIAFiofFK6tMvjmbnNBWz03UG
   ow22YrI5z7XXcKRw9WSz5roIaA5sflu/XFHM+qe6ZLrQyMYOExFjpqbRH
   Q==;
X-CSE-ConnectionGUID: j6QN/O5vS72lYAqT3TnTSw==
X-CSE-MsgGUID: zkOWyruXSriHcmGUuvu/fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71097537"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="71097537"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 08:07:09 -0800
X-CSE-ConnectionGUID: /EUu/uh3TRGGPStNzLINJQ==
X-CSE-MsgGUID: Womxj7wyStaJX/ChhX95XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="208125662"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 30 Jan 2026 08:07:08 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlr1V-000000002WL-1GS2;
	Fri, 30 Jan 2026 16:07:05 +0000
Date: Fri, 30 Jan 2026 17:06:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [andersson:wip/glymur-next-20260128 4/4]
 arch/arm64/boot/dts/qcom/glymur-crd.dtb: dma-controller@800000
 (qcom,glymur-gpi-dma): interrupts: [[0, 588, 4], [0, 589, 4], [0, 590, 4],
 [0, 591, 4], [0, 592, 4], [0, 593, 4], [0, 594, 4], [0, 595, 4], [0, 596, 4],
 [0, 597, 4], [0, 598, 4], [0, 599, 4], ...
Message-ID: <202601301710.SZRHpMnn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
CC: Qiang Yu <qiang.yu@oss.qualcomm.com>
CC: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
CC: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://github.com/andersson/kernel wip/glymur-next-20260128
head:   32fb50a203fa3c4678db7246e0b4681bf9612a47
commit: 32fb50a203fa3c4678db7246e0b4681bf9612a47 [4/4] arm64: dts: qcom: glymur: Enable Glymur CRD board support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260129 (https://download.01.org/0day-ci/archive/20260130/202601301710.SZRHpMnn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301710.SZRHpMnn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601301710.SZRHpMnn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/glymur.dtsi:4654.36-4686.5: Warning (simple_bus_reg): /soc@0/system-cache-controller@20400000: simple-bus unit address format error, expected "21800000"
   arch/arm64/boot/dts/qcom/glymur.dtsi:4695.23-4712.5: Warning (simple_bus_reg): /soc@0/sram@81e08000: simple-bus unit address format error, expected "81e08600"
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: dma-controller@800000 (qcom,glymur-gpi-dma): interrupts: [[0, 588, 4], [0, 589, 4], [0, 590, 4], [0, 591, 4], [0, 592, 4], [0, 593, 4], [0, 594, 4], [0, 595, 4], [0, 596, 4], [0, 597, 4], [0, 598, 4], [0, 599, 4], [2, 129, 4], [2, 130, 4], [2, 131, 4], [2, 132, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: dma-controller@a00000 (qcom,glymur-gpi-dma): interrupts: [[0, 279, 4], [0, 280, 4], [0, 281, 4], [0, 282, 4], [0, 283, 4], [0, 284, 4], [0, 293, 4], [0, 294, 4], [0, 295, 4], [0, 296, 4], [0, 297, 4], [0, 298, 4], [2, 124, 4], [2, 125, 4], [2, 126, 4], [2, 127, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: dma-controller@b00000 (qcom,glymur-gpi-dma): interrupts: [[2, 76, 4], [2, 77, 4], [2, 78, 4], [2, 79, 4], [2, 80, 4], [2, 81, 4], [2, 82, 4], [2, 83, 4], [2, 84, 4], [2, 85, 4], [2, 86, 4], [2, 87, 4], [2, 88, 4], [2, 89, 4], [2, 90, 4], [2, 91, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): led-controller@ee00:compatible:0: 'qcom,pmh0101-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm660l-flash-led', 'qcom,pm7550-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): pwm:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm'] is too long
   	'qcom,pmh0101-pwm' is not one of ['qcom,pm660l-lpg', 'qcom,pm8150b-lpg', 'qcom,pm8150l-lpg', 'qcom,pm8350c-pwm', 'qcom,pm8916-pwm', 'qcom,pm8941-lpg', 'qcom,pm8994-lpg', 'qcom,pmc8180c-lpg', 'qcom,pmi632-lpg', 'qcom,pmi8950-pwm', 'qcom,pmi8994-lpg', 'qcom,pmi8998-lpg', 'qcom,pmk8550-pwm']
   	'qcom,pmh0101-pwm' is not one of ['qcom,pm6150l-lpg']
   	'qcom,pmh0101-pwm' is not one of ['qcom,pm8550-pwm']
   	'qcom,pmh0101-pwm' is not one of ['qcom,pm8937-pwm']
   	'qcom,pm8150l-lpg' was expected
   	'qcom,pm8916-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: led-controller@ee00 (qcom,pmh0101-flash-led): compatible:0: 'qcom,pmh0101-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm660l-flash-led', 'qcom,pm7550-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
   	from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: /soc@0/arbiter@c400000/spmi@c426000/pmic@1/led-controller@ee00: failed to match any schema with compatible: ['qcom,pmh0101-flash-led', 'qcom,spmi-flash-led']
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: pwm (qcom,pmh0101-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm'] is too long
   	'qcom,pmh0101-pwm' is not one of ['qcom,pm660l-lpg', 'qcom,pm8150b-lpg', 'qcom,pm8150l-lpg', 'qcom,pm8350c-pwm', 'qcom,pm8916-pwm', 'qcom,pm8941-lpg', 'qcom,pm8994-lpg', 'qcom,pmc8180c-lpg', 'qcom,pmi632-lpg', 'qcom,pmi8950-pwm', 'qcom,pmi8994-lpg', 'qcom,pmi8998-lpg', 'qcom,pmk8550-pwm']
   	'qcom,pmh0101-pwm' is not one of ['qcom,pm6150l-lpg']
   	'qcom,pmh0101-pwm' is not one of ['qcom,pm8550-pwm']
   	'qcom,pmh0101-pwm' is not one of ['qcom,pm8937-pwm']
   	'qcom,pm8150l-lpg' was expected
   	'qcom,pm8916-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: /soc@0/arbiter@c400000/spmi@c426000/pmic@1/pwm: failed to match any schema with compatible: ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
