Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DD723D2B1
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 21:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755208196; cv=none; b=UymI0JVwxToh19vDwml0VIl7ZmVRkkUOv9TcKXxfdAkCsc9HlFCoXmHO+Zpr/kFysahVbKMwZsVTwNX4Z2AnXPnYvw6EskqzXsm6l6C1KG3tv5rhLngeBrao9z4nbeq/J6wQv/rZ90VudTeXPHBxkhLpZD1azzYP3tMeKwjfKLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755208196; c=relaxed/simple;
	bh=pGGPhkl1Guijn0z31DAJi4AFyHEhofILS8GKWbjvgfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gWuOvfi0XFtuexVPkOl15e7Q7SuFX7M/IZjel9aSFoW6263iPhadNYf0XbjwQcuaHdi55tFvrtqGyrhnLw5k7v2jZjvY+CJ1KzbIMUahPjU5mpgFXewaZcyAmVZjItX9XftZod3f2vy6Ne3K0OurQgZatpvjz48n22a/X3hI3GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+55u5tP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+55u5tP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755208190; x=1786744190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pGGPhkl1Guijn0z31DAJi4AFyHEhofILS8GKWbjvgfQ=;
  b=Z+55u5tP/YVYM9sVNJl/wX4dEmonthW+xJu5tFHsHZ5wiYKH0IvLGIYo
   PWquaVaS5LaKZePAAYuTUROK4gAtmS6yL21yRCgi/vYNr+6uLgb1VDO+e
   k8gwBoOePvDtHvRTMo203/v4i837mHbz9ew3puMd/XeQsqA1J6Tuwq+lO
   p8HtnK7TOt7xFUmOEUK3/yb7mBKxd9GONb5IOq0wB/TdTM4umahbUYni6
   VPQwuJtF0/ZejxmNVoTN0Bv5zKD4GY/wSET7jTDVMZGH9VTTfsle5ZE/z
   m0xOp+kdnw83+uEnRprjwELYH6YqoECt1TMnfi4zb2Z+ys9uPFPchmMvf
   g==;
X-CSE-ConnectionGUID: TQByckYmRO+kpmrpu6ZGFQ==
X-CSE-MsgGUID: /DM9U0eLRrmKZIbcHd7yYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="67807000"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="67807000"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 14:49:49 -0700
X-CSE-ConnectionGUID: LrbHmwy2QFqXAzWLsyl0Dw==
X-CSE-MsgGUID: fdkideACQTugRSKdWj8OpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197709958"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2025 14:49:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umfpR-000BLc-1p;
	Thu, 14 Aug 2025 21:49:45 +0000
Date: Fri, 15 Aug 2025 05:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] dts: describe x1e80100 ufs
Message-ID: <202508150539.NEDRWuBN-lkp@intel.com>
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
In-Reply-To: <20250814005904.39173-4-harrison.vanderbyl@gmail.com>
References: <20250814005904.39173-4-harrison.vanderbyl@gmail.com>
TO: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
TO: marcus@nazgul.ch
TO: kirill@korins.ky
TO: vkoul@kernel.org
TO: kishon@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: mani@kernel.org
TO: alim.akhtar@samsung.com
TO: avri.altman@wdc.com
TO: bvanassche@acm.org
TO: andersson@kernel.org
TO: agross@kernel.org
TO: linux-arm-msm@vger.kernel.org
TO: linux-phy@lists.infradead.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-scsi@vger.kernel.org
CC: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>

Hi Harrison,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on mkp-scsi/for-next jejb-scsi/for-next linus/master v6.17-rc1 next-20250814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harrison-Vanderbyl/dt-bindings-describe-x1e80100-ufs/20250814-090247
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250814005904.39173-4-harrison.vanderbyl%40gmail.com
patch subject: [PATCH 3/3] dts: describe x1e80100 ufs
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-051-20250814 (https://download.01.org/0day-ci/archive/20250815/202508150539.NEDRWuBN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150539.NEDRWuBN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508150539.NEDRWuBN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> Lexical error: arch/arm64/boot/dts/qcom/x1e80100.dtsi:2839.29-44 Unexpected 'GPIO_ACTIVE_LOW'
   FATAL ERROR: Syntax error parsing input tree
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: wifi@0 (pci17cb,1107): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: wifi@0 (pci17cb,1107): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: wifi@0 (pci17cb,1107): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: wifi@0 (pci17cb,1107): 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
