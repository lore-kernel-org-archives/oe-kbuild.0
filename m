Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBC436EA8F
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 05:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934683; cv=none; b=JcUnV4m7ouIRBlwF0gZA1ZOTDEphMBXs4gX9MknuYmEPodud1ADcl93mxOwzt3HA0NKI1MAAfxIq7Sz+oT4XVSgkPKhz4CXC1i/EV3KvJNDVgv/sc16MIx4DNz7zv2WSHpanO1ofS0GguhfKwsIsBh04RoMmJ2AWW1aZlXyY9rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934683; c=relaxed/simple;
	bh=bP8E363PbaFiEWxusosOWmg7FeaGobnyPHdUZRNb1aY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TrbxIUHhDSPw+n41pQCNKBNgcykQNoOdV+awoI4zg091SmY3UiQZZ2527sQDlKzkwCHG/jQMQt/4eXj2n7BhCqkBu5xqGBKAbgCrcPmlvE46UG6hRg1kBVDTrn7YKhphRN55k8hASSTka+uqrK/R+AHGGDIbXqwKanZa7QDasOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZU04Qpbb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZU04Qpbb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774934681; x=1806470681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bP8E363PbaFiEWxusosOWmg7FeaGobnyPHdUZRNb1aY=;
  b=ZU04Qpbba/hUglf9jN8pnLZzMXSouRSugY4fRgZQqYR2L3s+d5K1myXM
   13yx3Z7y6UgiKE07y0RkRH9OIQ6skiOwHffM6ypxQcQ3Q+LfCjblWMVn6
   RUbmb9crIj0rTI49UMchHJ4dZ0YQFfp3OFbA5I+adjWh2dVHultLXgLkj
   jmJqjWif9nPa35GSgbL176X44XspweQNaX0Re+2w/vg2vjjOSvl+OClbS
   loXs2kPVflh1eL9xlQ8aoJKqBTp2+1y6lPLCbCiRC0yk7ThNKctFnMljy
   WHeKDcVU+7L9oPLvYD6QRV+nOVe4JIrMuQzNWB2LFKD0gHcsOBKTYkGlt
   Q==;
X-CSE-ConnectionGUID: uxZKS2hOQYakQVUT/troUg==
X-CSE-MsgGUID: KJQ6BfLBT3KOk7gWTS6xOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="87013264"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="87013264"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 22:24:40 -0700
X-CSE-ConnectionGUID: qQZQE5+4SAeOuz8T7MyVMQ==
X-CSE-MsgGUID: HXcmbbheSlKPfM+bhZOc2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="249476938"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 30 Mar 2026 22:24:39 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Raf-000000008In-01tu;
	Tue, 31 Mar 2026 05:24:37 +0000
Date: Tue, 31 Mar 2026 07:24:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: add blsp2_spi4 node
Message-ID: <202603310728.A3mVZmj2-lkp@intel.com>
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
In-Reply-To: <20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92@linaro.org>
References: <20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92@linaro.org>
TO: Christopher Obbard <christopher.obbard@linaro.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Christopher Obbard <christopher.obbard@linaro.org>

Hi Christopher,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 54f966f63b379d0c62bb044b7903319776443a4a]

url:    https://github.com/intel-lab-lkp/linux/commits/Christopher-Obbard/arm64-dts-qcom-msm8996-add-blsp2_spi4-node/20260330-112743
base:   54f966f63b379d0c62bb044b7903319776443a4a
patch link:    https://lore.kernel.org/r/20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92%40linaro.org
patch subject: [PATCH] arm64: dts: qcom: msm8996: add blsp2_spi4 node
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-2055-20260330 (https://download.01.org/0day-ci/archive/20260331/202603310728.A3mVZmj2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev9+g4cd3cdfac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310728.A3mVZmj2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603310728.A3mVZmj2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): interrupts: [[0, 105, 4], [0, 239, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): reg: [[123441152, 1536], [123224064, 176128]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@76f8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: usb@6af8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
>> arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): interrupts: [[0, 105, 4], [0, 239, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
>> arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): reg: [[123441152, 1536], [123224064, 176128]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
   arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: usb@76f8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): interrupts: [[0, 105, 4], [0, 239, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): reg: [[123441152, 1536], [123224064, 176128]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): interrupts: [[0, 105, 4], [0, 239, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
>> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): reg: [[123441152, 1536], [123224064, 176128]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): interrupts: [[0, 105, 4], [0, 239, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): reg: [[123441152, 1536], [123224064, 176128]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): interrupts: [[0, 105, 4], [0, 239, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): reg: [[123441152, 1536], [123224064, 176128]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:3327.27-3342.5: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@7577000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): interrupts: [[0, 105, 4], [0, 239, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): reg: [[123441152, 1536], [123224064, 176128]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): interrupts: [[0, 105, 4], [0, 239, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): reg: [[123441152, 1536], [123224064, 176128]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): interrupts: [[0, 105, 4], [0, 239, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): reg: [[123441152, 1536], [123224064, 176128]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
--
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: panel@0 (jdi,fhd-r63452): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@6af8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: phy@7411000 (qcom,msm8996-qusb2-phy): 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: drv2604@5a (ti,drv2604): 'enable-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,drv260x.yaml
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): interrupts: [[0, 105, 4], [0, 239, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): reg: [[123441152, 1536], [123224064, 176128]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: panel@0 (jdi,fhd-r63452): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@6af8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: phy@7411000 (qcom,msm8996-qusb2-phy): 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): interrupts: [[0, 105, 4], [0, 239, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): reg: [[123441152, 1536], [123224064, 176128]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: phy@7411000 (qcom,msm8996-qusb2-phy): 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): interrupts: [[0, 105, 4], [0, 239, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: spi@75b9000 (qcom,spi-qup-v2.2.1): reg: [[123441152, 1536], [123224064, 176128]] is too long
   	from schema $id: http://devicetree.org/schemas/spi/qcom,spi-qup.yaml
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
