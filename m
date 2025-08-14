Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEE81FDA94
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 19:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755199951; cv=none; b=YExNdaImHl6ag+optJjURkXKhykl7FdZluMNgy/ln35rDHCZOTKPg5UfGAUuG77NyVs25N0EdTjI1V76rgbyWyCKCtq4kIzp9LiVBCu3HdWdGxfLE95Iic7IJGUr35OEeLelePUieMhU9vAp93JG76iKkQqV8DY0KTNeYk92vF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755199951; c=relaxed/simple;
	bh=asx77V0grBbgTOZgA6De5MEePDxFSCRvLBErHnMRnhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dKTx5vR4UMkHAesRQ59s/J3ENv5krNCTp90GYYi95YEZFZ5iKomIcg5ql9KlGNLQX6rGdo0s/TCHSP2pEVSSrEDpitRAb50nab6ja/lhPDDAgdpGXOu1v0e/vxkinZ/+Yq0eghkWX9872mwqRXUqEn34HuPktiNjUcW/HCmNSZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNftB33P; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNftB33P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755199942; x=1786735942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=asx77V0grBbgTOZgA6De5MEePDxFSCRvLBErHnMRnhY=;
  b=QNftB33PCBMCJmsdKA1Rd3u9dLuyz8hIR1nEixc6RCDLVkfv8NOtvDJO
   SWeJqtgaSGBEGKXGGzJs2wznBFLdWFbM+y4ko46yYD38BvWUYvI47Vzmm
   kIIp6HiQ1WZ6JkscirXU8PL7Ev7XRe/lgwomMQNvCKhJwUuIMKGwGACgw
   amNuGsumsNPlpqVoRseMLEZ5OJWWHWloFIMfWKvmTie0xjVsihzVna6YG
   lhCIrKMQCRDn1dVcXPZ9SYhFH+9/weEXI2UmscAABu8nl4LUGUPgjbfpH
   5pV/dWxq9W5pGrc4MSX9Idsd8mTD0xSPkdJFFSTLsFTXhqiDGCkCLdMSR
   Q==;
X-CSE-ConnectionGUID: PSDFVNU2Qc+22t87HLg97w==
X-CSE-MsgGUID: VHh7h9fhT4CJ3ZIojhuQnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57673072"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57673072"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 12:32:22 -0700
X-CSE-ConnectionGUID: 8Tk1XAvoQCuGJJvkxKMa/A==
X-CSE-MsgGUID: wP1rMVAPRr+fnxQAtHBuPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197682756"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2025 12:32:19 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umdgP-000BGq-04;
	Thu, 14 Aug 2025 19:32:17 +0000
Date: Fri, 15 Aug 2025 03:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] dts: describe x1e80100 ufs
Message-ID: <202508150303.u7aLZ2G5-lkp@intel.com>
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
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-052-20250814 (https://download.01.org/0day-ci/archive/20250815/202508150303.u7aLZ2G5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150303.u7aLZ2G5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508150303.u7aLZ2G5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:2905.23-2911.5: Warning (simple_bus_reg): /soc@0/crypto@1d90000: simple-bus unit address format error, expected "1d88000"
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4970.11-4980.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
   arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
--
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: wifi@0 (pci17cb,1107): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: wifi@0 (pci17cb,1107): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: wifi@0 (pci17cb,1107): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: wifi@0 (pci17cb,1107): 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: wifi@0 (pci17cb,1107): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: phy@1d80000 (qcom,x1e80100-qmp-ufs-phy): clocks: [[2, 0], [61, 242]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: crypto@1d90000 (qcom,x1e80100-inline-crypto-engine): compatible:0: 'qcom,x1e80100-inline-crypto-engine' is not one of ['qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: /soc@0/crypto@1d90000: failed to match any schema with compatible: ['qcom,x1e80100-inline-crypto-engine', 'qcom,inline-crypto-engine']

vim +/1d88000 +2905 arch/arm64/boot/dts/qcom/x1e80100.dtsi

af16b00578a7a1d Rajendra Nayak      2023-12-05    24  
af16b00578a7a1d Rajendra Nayak      2023-12-05    25  / {
af16b00578a7a1d Rajendra Nayak      2023-12-05    26  	interrupt-parent = <&intc>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    27  
af16b00578a7a1d Rajendra Nayak      2023-12-05    28  	#address-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    29  	#size-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    30  
af16b00578a7a1d Rajendra Nayak      2023-12-05    31  	chosen { };
af16b00578a7a1d Rajendra Nayak      2023-12-05    32  
af16b00578a7a1d Rajendra Nayak      2023-12-05    33  	clocks {
af16b00578a7a1d Rajendra Nayak      2023-12-05    34  		xo_board: xo-board {
af16b00578a7a1d Rajendra Nayak      2023-12-05    35  			compatible = "fixed-clock";
af16b00578a7a1d Rajendra Nayak      2023-12-05    36  			clock-frequency = <76800000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    37  			#clock-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    38  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05    39  
af16b00578a7a1d Rajendra Nayak      2023-12-05    40  		sleep_clk: sleep-clk {
af16b00578a7a1d Rajendra Nayak      2023-12-05    41  			compatible = "fixed-clock";
67e25a3e12d1283 Dmitry Baryshkov    2024-12-24    42  			clock-frequency = <32764>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    43  			#clock-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    44  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05    45  
af16b00578a7a1d Rajendra Nayak      2023-12-05    46  		bi_tcxo_div2: bi-tcxo-div2-clk {
af16b00578a7a1d Rajendra Nayak      2023-12-05    47  			compatible = "fixed-factor-clock";
af16b00578a7a1d Rajendra Nayak      2023-12-05    48  			#clock-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    49  
af16b00578a7a1d Rajendra Nayak      2023-12-05    50  			clocks = <&rpmhcc RPMH_CXO_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    51  			clock-mult = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    52  			clock-div = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    53  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05    54  
af16b00578a7a1d Rajendra Nayak      2023-12-05    55  		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
af16b00578a7a1d Rajendra Nayak      2023-12-05    56  			compatible = "fixed-factor-clock";
af16b00578a7a1d Rajendra Nayak      2023-12-05    57  			#clock-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    58  
af16b00578a7a1d Rajendra Nayak      2023-12-05    59  			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    60  			clock-mult = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    61  			clock-div = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    62  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05    63  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05    64  
af16b00578a7a1d Rajendra Nayak      2023-12-05    65  	cpus {
af16b00578a7a1d Rajendra Nayak      2023-12-05    66  		#address-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    67  		#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    68  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    69  		cpu0: cpu@0 {
af16b00578a7a1d Rajendra Nayak      2023-12-05    70  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05    71  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05    72  			reg = <0x0 0x0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    73  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    74  			next-level-cache = <&l2_0>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30    75  			power-domains = <&cpu_pd0>, <&scmi_dvfs 0>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30    76  			power-domain-names = "psci", "perf";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    77  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    78  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    79  			l2_0: l2-cache {
af16b00578a7a1d Rajendra Nayak      2023-12-05    80  				compatible = "cache";
af16b00578a7a1d Rajendra Nayak      2023-12-05    81  				cache-level = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    82  				cache-unified;
af16b00578a7a1d Rajendra Nayak      2023-12-05    83  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05    84  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05    85  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    86  		cpu1: cpu@100 {
af16b00578a7a1d Rajendra Nayak      2023-12-05    87  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05    88  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05    89  			reg = <0x0 0x100>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    90  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    91  			next-level-cache = <&l2_0>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30    92  			power-domains = <&cpu_pd1>, <&scmi_dvfs 0>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30    93  			power-domain-names = "psci", "perf";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    94  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05    95  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05    96  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22    97  		cpu2: cpu@200 {
af16b00578a7a1d Rajendra Nayak      2023-12-05    98  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05    99  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   100  			reg = <0x0 0x200>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   101  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   102  			next-level-cache = <&l2_0>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   103  			power-domains = <&cpu_pd2>, <&scmi_dvfs 0>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   104  			power-domain-names = "psci", "perf";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   105  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   106  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   107  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   108  		cpu3: cpu@300 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   109  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   110  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   111  			reg = <0x0 0x300>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   112  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   113  			next-level-cache = <&l2_0>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   114  			power-domains = <&cpu_pd3>, <&scmi_dvfs 0>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   115  			power-domain-names = "psci", "perf";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   116  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   117  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   118  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   119  		cpu4: cpu@10000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   120  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   121  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   122  			reg = <0x0 0x10000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   123  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   124  			next-level-cache = <&l2_1>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   125  			power-domains = <&cpu_pd4>, <&scmi_dvfs 1>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   126  			power-domain-names = "psci", "perf";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   127  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   128  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   129  			l2_1: l2-cache {
af16b00578a7a1d Rajendra Nayak      2023-12-05   130  				compatible = "cache";
af16b00578a7a1d Rajendra Nayak      2023-12-05   131  				cache-level = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   132  				cache-unified;
af16b00578a7a1d Rajendra Nayak      2023-12-05   133  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   134  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   135  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   136  		cpu5: cpu@10100 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   137  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   138  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   139  			reg = <0x0 0x10100>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   140  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   141  			next-level-cache = <&l2_1>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   142  			power-domains = <&cpu_pd5>, <&scmi_dvfs 1>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   143  			power-domain-names = "psci", "perf";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   144  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   145  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   146  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   147  		cpu6: cpu@10200 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   148  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   149  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   150  			reg = <0x0 0x10200>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   151  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   152  			next-level-cache = <&l2_1>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   153  			power-domains = <&cpu_pd6>, <&scmi_dvfs 1>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   154  			power-domain-names = "psci", "perf";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   155  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   156  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   157  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   158  		cpu7: cpu@10300 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   159  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   160  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   161  			reg = <0x0 0x10300>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   162  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   163  			next-level-cache = <&l2_1>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   164  			power-domains = <&cpu_pd7>, <&scmi_dvfs 1>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   165  			power-domain-names = "psci", "perf";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   166  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   167  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   168  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   169  		cpu8: cpu@20000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   170  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   171  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   172  			reg = <0x0 0x20000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   173  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   174  			next-level-cache = <&l2_2>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   175  			power-domains = <&cpu_pd8>, <&scmi_dvfs 2>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   176  			power-domain-names = "psci", "perf";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   177  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   178  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   179  			l2_2: l2-cache {
af16b00578a7a1d Rajendra Nayak      2023-12-05   180  				compatible = "cache";
af16b00578a7a1d Rajendra Nayak      2023-12-05   181  				cache-level = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   182  				cache-unified;
af16b00578a7a1d Rajendra Nayak      2023-12-05   183  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   184  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   185  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   186  		cpu9: cpu@20100 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   187  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   188  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   189  			reg = <0x0 0x20100>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   190  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   191  			next-level-cache = <&l2_2>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   192  			power-domains = <&cpu_pd9>, <&scmi_dvfs 2>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   193  			power-domain-names = "psci", "perf";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   194  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   195  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   196  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   197  		cpu10: cpu@20200 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   198  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   199  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   200  			reg = <0x0 0x20200>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   201  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   202  			next-level-cache = <&l2_2>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   203  			power-domains = <&cpu_pd10>, <&scmi_dvfs 2>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   204  			power-domain-names = "psci", "perf";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   205  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   206  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   207  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   208  		cpu11: cpu@20300 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   209  			device_type = "cpu";
af16b00578a7a1d Rajendra Nayak      2023-12-05   210  			compatible = "qcom,oryon";
af16b00578a7a1d Rajendra Nayak      2023-12-05   211  			reg = <0x0 0x20300>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   212  			enable-method = "psci";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   213  			next-level-cache = <&l2_2>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   214  			power-domains = <&cpu_pd11>, <&scmi_dvfs 2>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   215  			power-domain-names = "psci", "perf";
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   216  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   217  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   218  
af16b00578a7a1d Rajendra Nayak      2023-12-05   219  		cpu-map {
af16b00578a7a1d Rajendra Nayak      2023-12-05   220  			cluster0 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   221  				core0 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   222  					cpu = <&cpu0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   223  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   224  
af16b00578a7a1d Rajendra Nayak      2023-12-05   225  				core1 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   226  					cpu = <&cpu1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   227  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   228  
af16b00578a7a1d Rajendra Nayak      2023-12-05   229  				core2 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   230  					cpu = <&cpu2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   231  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   232  
af16b00578a7a1d Rajendra Nayak      2023-12-05   233  				core3 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   234  					cpu = <&cpu3>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   235  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   236  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   237  
af16b00578a7a1d Rajendra Nayak      2023-12-05   238  			cluster1 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   239  				core0 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   240  					cpu = <&cpu4>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   241  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   242  
af16b00578a7a1d Rajendra Nayak      2023-12-05   243  				core1 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   244  					cpu = <&cpu5>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   245  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   246  
af16b00578a7a1d Rajendra Nayak      2023-12-05   247  				core2 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   248  					cpu = <&cpu6>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   249  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   250  
af16b00578a7a1d Rajendra Nayak      2023-12-05   251  				core3 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   252  					cpu = <&cpu7>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   253  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   254  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   255  
f08edb5299166b7 Konrad Dybcio       2025-02-03   256  			cpu_map_cluster2: cluster2 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   257  				core0 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   258  					cpu = <&cpu8>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   259  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   260  
af16b00578a7a1d Rajendra Nayak      2023-12-05   261  				core1 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   262  					cpu = <&cpu9>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   263  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   264  
af16b00578a7a1d Rajendra Nayak      2023-12-05   265  				core2 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   266  					cpu = <&cpu10>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   267  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   268  
af16b00578a7a1d Rajendra Nayak      2023-12-05   269  				core3 {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   270  					cpu = <&cpu11>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   271  				};
af16b00578a7a1d Rajendra Nayak      2023-12-05   272  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   273  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   274  
af16b00578a7a1d Rajendra Nayak      2023-12-05   275  		idle-states {
af16b00578a7a1d Rajendra Nayak      2023-12-05   276  			entry-method = "psci";
af16b00578a7a1d Rajendra Nayak      2023-12-05   277  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   278  			cluster_c4: cpu-sleep-0 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   279  				compatible = "arm,idle-state";
af16b00578a7a1d Rajendra Nayak      2023-12-05   280  				idle-state-name = "ret";
af16b00578a7a1d Rajendra Nayak      2023-12-05   281  				arm,psci-suspend-param = <0x00000004>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   282  				entry-latency-us = <180>;
2e65616ef07fa4c Konrad Dybcio       2024-07-16   283  				exit-latency-us = <500>;
2e65616ef07fa4c Konrad Dybcio       2024-07-16   284  				min-residency-us = <600>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   285  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   286  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   287  
af16b00578a7a1d Rajendra Nayak      2023-12-05   288  		domain-idle-states {
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   289  			cluster_cl4: cluster-sleep-0 {
cb939b9b3542685 Rajendra Nayak      2024-03-17   290  				compatible = "domain-idle-state";
af16b00578a7a1d Rajendra Nayak      2023-12-05   291  				arm,psci-suspend-param = <0x01000044>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   292  				entry-latency-us = <350>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   293  				exit-latency-us = <500>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   294  				min-residency-us = <2500>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   295  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   296  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   297  			cluster_cl5: cluster-sleep-1 {
cb939b9b3542685 Rajendra Nayak      2024-03-17   298  				compatible = "domain-idle-state";
af16b00578a7a1d Rajendra Nayak      2023-12-05   299  				arm,psci-suspend-param = <0x01000054>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   300  				entry-latency-us = <2200>;
2e65616ef07fa4c Konrad Dybcio       2024-07-16   301  				exit-latency-us = <4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   302  				min-residency-us = <7000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   303  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   304  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   305  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05   306  
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   307  	dummy-sink {
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   308  		compatible = "arm,coresight-dummy-sink";
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   309  
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   310  		in-ports {
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   311  			port {
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   312  				eud_in: endpoint {
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   313  					remote-endpoint = <&swao_rep_out1>;
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   314  				};
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   315  			};
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   316  		};
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   317  	};
d7cfd75ba0d3ee7 Jie Gan             2024-12-05   318  
af16b00578a7a1d Rajendra Nayak      2023-12-05   319  	firmware {
af16b00578a7a1d Rajendra Nayak      2023-12-05   320  		scm: scm {
af16b00578a7a1d Rajendra Nayak      2023-12-05   321  			compatible = "qcom,scm-x1e80100", "qcom,scm";
af16b00578a7a1d Rajendra Nayak      2023-12-05   322  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   323  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
8beaf6e08d986eb Johan Hovold        2024-10-02   324  			qcom,dload-mode = <&tcsr 0x19000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   325  		};
892c83aa39cb4c1 Sibi Sankar         2024-10-30   326  
892c83aa39cb4c1 Sibi Sankar         2024-10-30   327  		scmi {
892c83aa39cb4c1 Sibi Sankar         2024-10-30   328  			compatible = "arm,scmi";
892c83aa39cb4c1 Sibi Sankar         2024-10-30   329  			mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   330  			mbox-names = "tx", "rx";
892c83aa39cb4c1 Sibi Sankar         2024-10-30   331  			shmem = <&cpu_scp_lpri0>, <&cpu_scp_lpri1>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   332  
892c83aa39cb4c1 Sibi Sankar         2024-10-30   333  			#address-cells = <1>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   334  			#size-cells = <0>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   335  
892c83aa39cb4c1 Sibi Sankar         2024-10-30   336  			scmi_dvfs: protocol@13 {
892c83aa39cb4c1 Sibi Sankar         2024-10-30   337  				reg = <0x13>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   338  				#power-domain-cells = <1>;
892c83aa39cb4c1 Sibi Sankar         2024-10-30   339  			};
892c83aa39cb4c1 Sibi Sankar         2024-10-30   340  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   341  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05   342  
af16b00578a7a1d Rajendra Nayak      2023-12-05   343  	clk_virt: interconnect-0 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   344  		compatible = "qcom,x1e80100-clk-virt";
af16b00578a7a1d Rajendra Nayak      2023-12-05   345  		#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   346  		qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   347  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05   348  
af16b00578a7a1d Rajendra Nayak      2023-12-05   349  	mc_virt: interconnect-1 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   350  		compatible = "qcom,x1e80100-mc-virt";
af16b00578a7a1d Rajendra Nayak      2023-12-05   351  		#interconnect-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   352  		qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   353  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05   354  
af16b00578a7a1d Rajendra Nayak      2023-12-05   355  	memory@80000000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   356  		device_type = "memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05   357  		/* We expect the bootloader to fill in the size */
af16b00578a7a1d Rajendra Nayak      2023-12-05   358  		reg = <0 0x80000000 0 0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   359  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05   360  
af16b00578a7a1d Rajendra Nayak      2023-12-05   361  	pmu {
af16b00578a7a1d Rajendra Nayak      2023-12-05   362  		compatible = "arm,armv8-pmuv3";
af16b00578a7a1d Rajendra Nayak      2023-12-05   363  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   364  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05   365  
af16b00578a7a1d Rajendra Nayak      2023-12-05   366  	psci {
af16b00578a7a1d Rajendra Nayak      2023-12-05   367  		compatible = "arm,psci-1.0";
af16b00578a7a1d Rajendra Nayak      2023-12-05   368  		method = "smc";
af16b00578a7a1d Rajendra Nayak      2023-12-05   369  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   370  		cpu_pd0: power-domain-cpu0 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   371  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   372  			power-domains = <&cluster_pd0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   373  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   374  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   375  		cpu_pd1: power-domain-cpu1 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   376  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   377  			power-domains = <&cluster_pd0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   378  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   379  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   380  		cpu_pd2: power-domain-cpu2 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   381  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   382  			power-domains = <&cluster_pd0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   383  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   384  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   385  		cpu_pd3: power-domain-cpu3 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   386  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   387  			power-domains = <&cluster_pd0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   388  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   389  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   390  		cpu_pd4: power-domain-cpu4 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   391  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   392  			power-domains = <&cluster_pd1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   393  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   394  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   395  		cpu_pd5: power-domain-cpu5 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   396  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   397  			power-domains = <&cluster_pd1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   398  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   399  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   400  		cpu_pd6: power-domain-cpu6 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   401  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   402  			power-domains = <&cluster_pd1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   403  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   404  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   405  		cpu_pd7: power-domain-cpu7 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   406  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   407  			power-domains = <&cluster_pd1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   408  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   409  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   410  		cpu_pd8: power-domain-cpu8 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   411  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   412  			power-domains = <&cluster_pd2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   413  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   414  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   415  		cpu_pd9: power-domain-cpu9 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   416  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   417  			power-domains = <&cluster_pd2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   418  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   419  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   420  		cpu_pd10: power-domain-cpu10 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   421  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   422  			power-domains = <&cluster_pd2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   423  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   424  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   425  		cpu_pd11: power-domain-cpu11 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   426  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   427  			power-domains = <&cluster_pd2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   428  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   429  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   430  		cluster_pd0: power-domain-cpu-cluster0 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   431  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   432  			domain-idle-states = <&cluster_cl4>, <&cluster_cl5>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   433  			power-domains = <&system_pd>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   434  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   435  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   436  		cluster_pd1: power-domain-cpu-cluster1 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   437  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   438  			domain-idle-states = <&cluster_cl4>, <&cluster_cl5>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   439  			power-domains = <&system_pd>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   440  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   441  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   442  		cluster_pd2: power-domain-cpu-cluster2 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   443  			#power-domain-cells = <0>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   444  			domain-idle-states = <&cluster_cl4>, <&cluster_cl5>;
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   445  			power-domains = <&system_pd>;
f33767e3cfa5d40 Konrad Dybcio       2024-01-02   446  		};
f33767e3cfa5d40 Konrad Dybcio       2024-01-02   447  
6a3649903ccd959 Krzysztof Kozlowski 2024-10-22   448  		system_pd: power-domain-system {
f33767e3cfa5d40 Konrad Dybcio       2024-01-02   449  			#power-domain-cells = <0>;
f33767e3cfa5d40 Konrad Dybcio       2024-01-02   450  			/* TODO: system-wide idle states */
af16b00578a7a1d Rajendra Nayak      2023-12-05   451  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   452  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05   453  
af16b00578a7a1d Rajendra Nayak      2023-12-05   454  	reserved-memory {
af16b00578a7a1d Rajendra Nayak      2023-12-05   455  		#address-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   456  		#size-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   457  		ranges;
af16b00578a7a1d Rajendra Nayak      2023-12-05   458  
af16b00578a7a1d Rajendra Nayak      2023-12-05   459  		gunyah_hyp_mem: gunyah-hyp@80000000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   460  			reg = <0x0 0x80000000 0x0 0x800000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   461  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   462  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   463  
af16b00578a7a1d Rajendra Nayak      2023-12-05   464  		hyp_elf_package_mem: hyp-elf-package@80800000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   465  			reg = <0x0 0x80800000 0x0 0x200000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   466  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   467  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   468  
af16b00578a7a1d Rajendra Nayak      2023-12-05   469  		ncc_mem: ncc@80a00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   470  			reg = <0x0 0x80a00000 0x0 0x400000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   471  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   472  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   473  
af16b00578a7a1d Rajendra Nayak      2023-12-05   474  		cpucp_log_mem: cpucp-log@80e00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   475  			reg = <0x0 0x80e00000 0x0 0x40000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   476  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   477  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   478  
af16b00578a7a1d Rajendra Nayak      2023-12-05   479  		cpucp_mem: cpucp@80e40000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   480  			reg = <0x0 0x80e40000 0x0 0x540000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   481  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   482  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   483  
af16b00578a7a1d Rajendra Nayak      2023-12-05   484  		reserved-region@81380000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   485  			reg = <0x0 0x81380000 0x0 0x80000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   486  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   487  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   488  
af16b00578a7a1d Rajendra Nayak      2023-12-05   489  		tags_mem: tags-region@81400000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   490  			reg = <0x0 0x81400000 0x0 0x1a0000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   491  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   492  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   493  
af16b00578a7a1d Rajendra Nayak      2023-12-05   494  		xbl_dtlog_mem: xbl-dtlog@81a00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   495  			reg = <0x0 0x81a00000 0x0 0x40000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   496  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   497  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   498  
af16b00578a7a1d Rajendra Nayak      2023-12-05   499  		xbl_ramdump_mem: xbl-ramdump@81a40000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   500  			reg = <0x0 0x81a40000 0x0 0x1c0000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   501  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   502  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   503  
af16b00578a7a1d Rajendra Nayak      2023-12-05   504  		aop_image_mem: aop-image@81c00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   505  			reg = <0x0 0x81c00000 0x0 0x60000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   506  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   507  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   508  
af16b00578a7a1d Rajendra Nayak      2023-12-05   509  		aop_cmd_db_mem: aop-cmd-db@81c60000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   510  			compatible = "qcom,cmd-db";
af16b00578a7a1d Rajendra Nayak      2023-12-05   511  			reg = <0x0 0x81c60000 0x0 0x20000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   512  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   513  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   514  
af16b00578a7a1d Rajendra Nayak      2023-12-05   515  		aop_config_mem: aop-config@81c80000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   516  			reg = <0x0 0x81c80000 0x0 0x20000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   517  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   518  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   519  
af16b00578a7a1d Rajendra Nayak      2023-12-05   520  		tme_crash_dump_mem: tme-crash-dump@81ca0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   521  			reg = <0x0 0x81ca0000 0x0 0x40000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   522  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   523  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   524  
af16b00578a7a1d Rajendra Nayak      2023-12-05   525  		tme_log_mem: tme-log@81ce0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   526  			reg = <0x0 0x81ce0000 0x0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   527  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   528  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   529  
af16b00578a7a1d Rajendra Nayak      2023-12-05   530  		uefi_log_mem: uefi-log@81ce4000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   531  			reg = <0x0 0x81ce4000 0x0 0x10000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   532  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   533  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   534  
af16b00578a7a1d Rajendra Nayak      2023-12-05   535  		secdata_apss_mem: secdata-apss@81cff000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   536  			reg = <0x0 0x81cff000 0x0 0x1000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   537  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   538  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   539  
af16b00578a7a1d Rajendra Nayak      2023-12-05   540  		pdp_ns_shared_mem: pdp-ns-shared@81e00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   541  			reg = <0x0 0x81e00000 0x0 0x100000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   542  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   543  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   544  
af16b00578a7a1d Rajendra Nayak      2023-12-05   545  		gpu_prr_mem: gpu-prr@81f00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   546  			reg = <0x0 0x81f00000 0x0 0x10000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   547  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   548  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   549  
af16b00578a7a1d Rajendra Nayak      2023-12-05   550  		tpm_control_mem: tpm-control@81f10000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   551  			reg = <0x0 0x81f10000 0x0 0x10000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   552  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   553  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   554  
af16b00578a7a1d Rajendra Nayak      2023-12-05   555  		usb_ucsi_shared_mem: usb-ucsi-shared@81f20000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   556  			reg = <0x0 0x81f20000 0x0 0x10000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   557  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   558  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   559  
af16b00578a7a1d Rajendra Nayak      2023-12-05   560  		pld_pep_mem: pld-pep@81f30000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   561  			reg = <0x0 0x81f30000 0x0 0x6000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   562  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   563  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   564  
af16b00578a7a1d Rajendra Nayak      2023-12-05   565  		pld_gmu_mem: pld-gmu@81f36000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   566  			reg = <0x0 0x81f36000 0x0 0x1000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   567  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   568  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   569  
af16b00578a7a1d Rajendra Nayak      2023-12-05   570  		pld_pdp_mem: pld-pdp@81f37000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   571  			reg = <0x0 0x81f37000 0x0 0x1000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   572  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   573  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   574  
af16b00578a7a1d Rajendra Nayak      2023-12-05   575  		tz_stat_mem: tz-stat@82700000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   576  			reg = <0x0 0x82700000 0x0 0x100000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   577  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   578  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   579  
af16b00578a7a1d Rajendra Nayak      2023-12-05   580  		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   581  			reg = <0x0 0x82800000 0x0 0xc00000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   582  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   583  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   584  
af16b00578a7a1d Rajendra Nayak      2023-12-05   585  		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@84b00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   586  			reg = <0x0 0x84b00000 0x0 0x800000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   587  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   588  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   589  
af16b00578a7a1d Rajendra Nayak      2023-12-05   590  		spu_secure_shared_memory_mem: spu-secure-shared-memory@85300000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   591  			reg = <0x0 0x85300000 0x0 0x80000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   592  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   593  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   594  
af16b00578a7a1d Rajendra Nayak      2023-12-05   595  		adsp_boot_dtb_mem: adsp-boot-dtb@866c0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   596  			reg = <0x0 0x866c0000 0x0 0x40000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   597  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   598  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   599  
af16b00578a7a1d Rajendra Nayak      2023-12-05   600  		spss_region_mem: spss-region@86700000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   601  			reg = <0x0 0x86700000 0x0 0x400000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   602  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   603  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   604  
af16b00578a7a1d Rajendra Nayak      2023-12-05   605  		adsp_boot_mem: adsp-boot@86b00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   606  			reg = <0x0 0x86b00000 0x0 0xc00000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   607  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   608  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   609  
af16b00578a7a1d Rajendra Nayak      2023-12-05   610  		video_mem: video@87700000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   611  			reg = <0x0 0x87700000 0x0 0x700000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   612  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   613  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   614  
af16b00578a7a1d Rajendra Nayak      2023-12-05   615  		adspslpi_mem: adspslpi@87e00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   616  			reg = <0x0 0x87e00000 0x0 0x3a00000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   617  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   618  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   619  
af16b00578a7a1d Rajendra Nayak      2023-12-05   620  		q6_adsp_dtb_mem: q6-adsp-dtb@8b800000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   621  			reg = <0x0 0x8b800000 0x0 0x80000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   622  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   623  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   624  
af16b00578a7a1d Rajendra Nayak      2023-12-05   625  		cdsp_mem: cdsp@8b900000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   626  			reg = <0x0 0x8b900000 0x0 0x2000000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   627  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   628  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   629  
af16b00578a7a1d Rajendra Nayak      2023-12-05   630  		q6_cdsp_dtb_mem: q6-cdsp-dtb@8d900000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   631  			reg = <0x0 0x8d900000 0x0 0x80000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   632  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   633  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   634  
af16b00578a7a1d Rajendra Nayak      2023-12-05   635  		gpu_microcode_mem: gpu-microcode@8d9fe000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   636  			reg = <0x0 0x8d9fe000 0x0 0x2000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   637  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   638  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   639  
af16b00578a7a1d Rajendra Nayak      2023-12-05   640  		cvp_mem: cvp@8da00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   641  			reg = <0x0 0x8da00000 0x0 0x700000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   642  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   643  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   644  
af16b00578a7a1d Rajendra Nayak      2023-12-05   645  		camera_mem: camera@8e100000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   646  			reg = <0x0 0x8e100000 0x0 0x800000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   647  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   648  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   649  
af16b00578a7a1d Rajendra Nayak      2023-12-05   650  		av1_encoder_mem: av1-encoder@8e900000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   651  			reg = <0x0 0x8e900000 0x0 0x700000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   652  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   653  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   654  
af16b00578a7a1d Rajendra Nayak      2023-12-05   655  		reserved-region@8f000000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   656  			reg = <0x0 0x8f000000 0x0 0xa00000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   657  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   658  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   659  
af16b00578a7a1d Rajendra Nayak      2023-12-05   660  		wpss_mem: wpss@8fa00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   661  			reg = <0x0 0x8fa00000 0x0 0x1900000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   662  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   663  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   664  
af16b00578a7a1d Rajendra Nayak      2023-12-05   665  		q6_wpss_dtb_mem: q6-wpss-dtb@91300000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   666  			reg = <0x0 0x91300000 0x0 0x80000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   667  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   668  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   669  
af16b00578a7a1d Rajendra Nayak      2023-12-05   670  		xbl_sc_mem: xbl-sc@d8000000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   671  			reg = <0x0 0xd8000000 0x0 0x40000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   672  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   673  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   674  
af16b00578a7a1d Rajendra Nayak      2023-12-05   675  		reserved-region@d8040000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   676  			reg = <0x0 0xd8040000 0x0 0xa0000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   677  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   678  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   679  
af16b00578a7a1d Rajendra Nayak      2023-12-05   680  		qtee_mem: qtee@d80e0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   681  			reg = <0x0 0xd80e0000 0x0 0x520000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   682  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   683  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   684  
af16b00578a7a1d Rajendra Nayak      2023-12-05   685  		ta_mem: ta@d8600000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   686  			reg = <0x0 0xd8600000 0x0 0x8a00000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   687  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   688  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   689  
af16b00578a7a1d Rajendra Nayak      2023-12-05   690  		tags_mem1: tags@e1000000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   691  			reg = <0x0 0xe1000000 0x0 0x26a0000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   692  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   693  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   694  
af16b00578a7a1d Rajendra Nayak      2023-12-05   695  		llcc_lpi_mem: llcc-lpi@ff800000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   696  			reg = <0x0 0xff800000 0x0 0x600000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   697  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   698  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   699  
af16b00578a7a1d Rajendra Nayak      2023-12-05   700  		smem_mem: smem@ffe00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   701  			compatible = "qcom,smem";
af16b00578a7a1d Rajendra Nayak      2023-12-05   702  			reg = <0x0 0xffe00000 0x0 0x200000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   703  			hwlocks = <&tcsr_mutex 3>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   704  			no-map;
af16b00578a7a1d Rajendra Nayak      2023-12-05   705  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   706  	};
af16b00578a7a1d Rajendra Nayak      2023-12-05   707  
c8327bb53b87285 Stephan Gerhold     2024-10-07   708  	qup_opp_table_100mhz: opp-table-qup100mhz {
c8327bb53b87285 Stephan Gerhold     2024-10-07   709  		compatible = "operating-points-v2";
c8327bb53b87285 Stephan Gerhold     2024-10-07   710  
c8327bb53b87285 Stephan Gerhold     2024-10-07   711  		opp-75000000 {
c8327bb53b87285 Stephan Gerhold     2024-10-07   712  			opp-hz = /bits/ 64 <75000000>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   713  			required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   714  		};
c8327bb53b87285 Stephan Gerhold     2024-10-07   715  
c8327bb53b87285 Stephan Gerhold     2024-10-07   716  		opp-100000000 {
c8327bb53b87285 Stephan Gerhold     2024-10-07   717  			opp-hz = /bits/ 64 <100000000>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   718  			required-opps = <&rpmhpd_opp_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   719  		};
c8327bb53b87285 Stephan Gerhold     2024-10-07   720  	};
c8327bb53b87285 Stephan Gerhold     2024-10-07   721  
c8327bb53b87285 Stephan Gerhold     2024-10-07   722  	qup_opp_table_120mhz: opp-table-qup120mhz {
c8327bb53b87285 Stephan Gerhold     2024-10-07   723  		compatible = "operating-points-v2";
c8327bb53b87285 Stephan Gerhold     2024-10-07   724  
c8327bb53b87285 Stephan Gerhold     2024-10-07   725  		opp-75000000 {
c8327bb53b87285 Stephan Gerhold     2024-10-07   726  			opp-hz = /bits/ 64 <75000000>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   727  			required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   728  		};
c8327bb53b87285 Stephan Gerhold     2024-10-07   729  
c8327bb53b87285 Stephan Gerhold     2024-10-07   730  		opp-120000000 {
c8327bb53b87285 Stephan Gerhold     2024-10-07   731  			opp-hz = /bits/ 64 <120000000>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   732  			required-opps = <&rpmhpd_opp_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   733  		};
c8327bb53b87285 Stephan Gerhold     2024-10-07   734  	};
c8327bb53b87285 Stephan Gerhold     2024-10-07   735  
0b6ae7364b1133f Sibi Sankar         2024-01-29   736  	smp2p-adsp {
0b6ae7364b1133f Sibi Sankar         2024-01-29   737  		compatible = "qcom,smp2p";
0b6ae7364b1133f Sibi Sankar         2024-01-29   738  
0b6ae7364b1133f Sibi Sankar         2024-01-29   739  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
0b6ae7364b1133f Sibi Sankar         2024-01-29   740  					     IPCC_MPROC_SIGNAL_SMP2P
0b6ae7364b1133f Sibi Sankar         2024-01-29   741  					     IRQ_TYPE_EDGE_RISING>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   742  
0b6ae7364b1133f Sibi Sankar         2024-01-29   743  		mboxes = <&ipcc IPCC_CLIENT_LPASS
0b6ae7364b1133f Sibi Sankar         2024-01-29   744  				IPCC_MPROC_SIGNAL_SMP2P>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   745  
0b6ae7364b1133f Sibi Sankar         2024-01-29   746  		qcom,smem = <443>, <429>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   747  		qcom,local-pid = <0>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   748  		qcom,remote-pid = <2>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   749  
0b6ae7364b1133f Sibi Sankar         2024-01-29   750  		smp2p_adsp_out: master-kernel {
0b6ae7364b1133f Sibi Sankar         2024-01-29   751  			qcom,entry-name = "master-kernel";
0b6ae7364b1133f Sibi Sankar         2024-01-29   752  			#qcom,smem-state-cells = <1>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   753  		};
0b6ae7364b1133f Sibi Sankar         2024-01-29   754  
0b6ae7364b1133f Sibi Sankar         2024-01-29   755  		smp2p_adsp_in: slave-kernel {
0b6ae7364b1133f Sibi Sankar         2024-01-29   756  			qcom,entry-name = "slave-kernel";
0b6ae7364b1133f Sibi Sankar         2024-01-29   757  			interrupt-controller;
0b6ae7364b1133f Sibi Sankar         2024-01-29   758  			#interrupt-cells = <2>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   759  		};
0b6ae7364b1133f Sibi Sankar         2024-01-29   760  	};
0b6ae7364b1133f Sibi Sankar         2024-01-29   761  
0b6ae7364b1133f Sibi Sankar         2024-01-29   762  	smp2p-cdsp {
0b6ae7364b1133f Sibi Sankar         2024-01-29   763  		compatible = "qcom,smp2p";
0b6ae7364b1133f Sibi Sankar         2024-01-29   764  
0b6ae7364b1133f Sibi Sankar         2024-01-29   765  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
0b6ae7364b1133f Sibi Sankar         2024-01-29   766  					     IPCC_MPROC_SIGNAL_SMP2P
0b6ae7364b1133f Sibi Sankar         2024-01-29   767  					     IRQ_TYPE_EDGE_RISING>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   768  
0b6ae7364b1133f Sibi Sankar         2024-01-29   769  		mboxes = <&ipcc IPCC_CLIENT_CDSP
0b6ae7364b1133f Sibi Sankar         2024-01-29   770  				IPCC_MPROC_SIGNAL_SMP2P>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   771  
0b6ae7364b1133f Sibi Sankar         2024-01-29   772  		qcom,smem = <94>, <432>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   773  		qcom,local-pid = <0>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   774  		qcom,remote-pid = <5>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   775  
0b6ae7364b1133f Sibi Sankar         2024-01-29   776  		smp2p_cdsp_out: master-kernel {
0b6ae7364b1133f Sibi Sankar         2024-01-29   777  			qcom,entry-name = "master-kernel";
0b6ae7364b1133f Sibi Sankar         2024-01-29   778  			#qcom,smem-state-cells = <1>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   779  		};
0b6ae7364b1133f Sibi Sankar         2024-01-29   780  
0b6ae7364b1133f Sibi Sankar         2024-01-29   781  		smp2p_cdsp_in: slave-kernel {
0b6ae7364b1133f Sibi Sankar         2024-01-29   782  			qcom,entry-name = "slave-kernel";
0b6ae7364b1133f Sibi Sankar         2024-01-29   783  			interrupt-controller;
0b6ae7364b1133f Sibi Sankar         2024-01-29   784  			#interrupt-cells = <2>;
0b6ae7364b1133f Sibi Sankar         2024-01-29   785  		};
0b6ae7364b1133f Sibi Sankar         2024-01-29   786  	};
0b6ae7364b1133f Sibi Sankar         2024-01-29   787  
af16b00578a7a1d Rajendra Nayak      2023-12-05   788  	soc: soc@0 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   789  		compatible = "simple-bus";
af16b00578a7a1d Rajendra Nayak      2023-12-05   790  
af16b00578a7a1d Rajendra Nayak      2023-12-05   791  		#address-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   792  		#size-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   793  		dma-ranges = <0 0 0 0 0x10 0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   794  		ranges = <0 0 0 0 0x10 0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   795  
af16b00578a7a1d Rajendra Nayak      2023-12-05   796  		gcc: clock-controller@100000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   797  			compatible = "qcom,x1e80100-gcc";
af16b00578a7a1d Rajendra Nayak      2023-12-05   798  			reg = <0 0x00100000 0 0x200000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   799  
af16b00578a7a1d Rajendra Nayak      2023-12-05   800  			clocks = <&bi_tcxo_div2>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   801  				 <&sleep_clk>,
f8af195beeb0096 Qiang Yu            2024-11-04   802  				 <&pcie3_phy>,
5eb83fc10289db0 Abel Vesa           2024-01-29   803  				 <&pcie4_phy>,
62ab23e1550820e Johan Hovold        2024-07-22   804  				 <&pcie5_phy>,
5eb83fc10289db0 Abel Vesa           2024-01-29   805  				 <&pcie6a_phy>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   806  				 <0>,
4af46b7bd66fa3a Abel Vesa           2024-01-29   807  				 <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29   808  				 <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
4af46b7bd66fa3a Abel Vesa           2024-01-29   809  				 <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   810  
af16b00578a7a1d Rajendra Nayak      2023-12-05   811  			power-domains = <&rpmhpd RPMHPD_CX>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   812  			#clock-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   813  			#reset-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   814  			#power-domain-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   815  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   816  
6a07a4f3f509c37 Sibi Sankar         2024-01-29   817  		ipcc: mailbox@408000 {
6a07a4f3f509c37 Sibi Sankar         2024-01-29   818  			compatible = "qcom,x1e80100-ipcc", "qcom,ipcc";
6a07a4f3f509c37 Sibi Sankar         2024-01-29   819  			reg = <0 0x00408000 0 0x1000>;
6a07a4f3f509c37 Sibi Sankar         2024-01-29   820  
6a07a4f3f509c37 Sibi Sankar         2024-01-29   821  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
6a07a4f3f509c37 Sibi Sankar         2024-01-29   822  			interrupt-controller;
6a07a4f3f509c37 Sibi Sankar         2024-01-29   823  			#interrupt-cells = <3>;
6a07a4f3f509c37 Sibi Sankar         2024-01-29   824  
6a07a4f3f509c37 Sibi Sankar         2024-01-29   825  			#mbox-cells = <2>;
6a07a4f3f509c37 Sibi Sankar         2024-01-29   826  		};
6a07a4f3f509c37 Sibi Sankar         2024-01-29   827  
af16b00578a7a1d Rajendra Nayak      2023-12-05   828  		gpi_dma2: dma-controller@800000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   829  			compatible = "qcom,x1e80100-gpi-dma", "qcom,sm6350-gpi-dma";
af16b00578a7a1d Rajendra Nayak      2023-12-05   830  			reg = <0 0x00800000 0 0x60000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   831  
af16b00578a7a1d Rajendra Nayak      2023-12-05   832  			interrupts = <GIC_SPI 788 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   833  				     <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   834  				     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   835  				     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   836  				     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   837  				     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   838  				     <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   839  				     <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   840  				     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   841  				     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   842  				     <GIC_SPI 798 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   843  				     <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   844  
af16b00578a7a1d Rajendra Nayak      2023-12-05   845  			dma-channels = <12>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   846  			dma-channel-mask = <0x3e>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   847  			#dma-cells = <3>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   848  
af16b00578a7a1d Rajendra Nayak      2023-12-05   849  			iommus = <&apps_smmu 0x436 0x0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   850  
af16b00578a7a1d Rajendra Nayak      2023-12-05   851  			status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05   852  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05   853  
af16b00578a7a1d Rajendra Nayak      2023-12-05   854  		qupv3_2: geniqup@8c0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   855  			compatible = "qcom,geni-se-qup";
af16b00578a7a1d Rajendra Nayak      2023-12-05   856  			reg = <0 0x008c0000 0 0x2000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   857  
af16b00578a7a1d Rajendra Nayak      2023-12-05   858  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   859  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   860  			clock-names = "m-ahb",
af16b00578a7a1d Rajendra Nayak      2023-12-05   861  				      "s-ahb";
af16b00578a7a1d Rajendra Nayak      2023-12-05   862  
af16b00578a7a1d Rajendra Nayak      2023-12-05   863  			iommus = <&apps_smmu 0x423 0x0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   864  
af16b00578a7a1d Rajendra Nayak      2023-12-05   865  			#address-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   866  			#size-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   867  			ranges;
af16b00578a7a1d Rajendra Nayak      2023-12-05   868  
af16b00578a7a1d Rajendra Nayak      2023-12-05   869  			status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05   870  
af16b00578a7a1d Rajendra Nayak      2023-12-05   871  			i2c16: i2c@880000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   872  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05   873  				reg = <0 0x00880000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   874  
af16b00578a7a1d Rajendra Nayak      2023-12-05   875  				interrupts = <GIC_SPI 808 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   876  
af16b00578a7a1d Rajendra Nayak      2023-12-05   877  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   878  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05   879  
af16b00578a7a1d Rajendra Nayak      2023-12-05   880  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   881  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11   882  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11   883  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   884  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   885  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   886  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05   887  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05   888  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05   889  
c8327bb53b87285 Stephan Gerhold     2024-10-07   890  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   891  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   892  
af16b00578a7a1d Rajendra Nayak      2023-12-05   893  				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   894  				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   895  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05   896  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05   897  
af16b00578a7a1d Rajendra Nayak      2023-12-05   898  				pinctrl-0 = <&qup_i2c16_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   899  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05   900  
af16b00578a7a1d Rajendra Nayak      2023-12-05   901  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   902  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   903  
af16b00578a7a1d Rajendra Nayak      2023-12-05   904  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05   905  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   906  
af16b00578a7a1d Rajendra Nayak      2023-12-05   907  			spi16: spi@880000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   908  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05   909  				reg = <0 0x00880000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   910  
af16b00578a7a1d Rajendra Nayak      2023-12-05   911  				interrupts = <GIC_SPI 808 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   912  
af16b00578a7a1d Rajendra Nayak      2023-12-05   913  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   914  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05   915  
af16b00578a7a1d Rajendra Nayak      2023-12-05   916  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   917  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11   918  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11   919  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   920  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   921  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   922  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05   923  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05   924  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05   925  
c8327bb53b87285 Stephan Gerhold     2024-10-07   926  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   927  				operating-points-v2 = <&qup_opp_table_120mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   928  
af16b00578a7a1d Rajendra Nayak      2023-12-05   929  				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   930  				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   931  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05   932  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05   933  
af16b00578a7a1d Rajendra Nayak      2023-12-05   934  				pinctrl-0 = <&qup_spi16_data_clk>, <&qup_spi16_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   935  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05   936  
af16b00578a7a1d Rajendra Nayak      2023-12-05   937  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   938  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   939  
af16b00578a7a1d Rajendra Nayak      2023-12-05   940  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05   941  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   942  
af16b00578a7a1d Rajendra Nayak      2023-12-05   943  			i2c17: i2c@884000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   944  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05   945  				reg = <0 0x00884000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   946  
af16b00578a7a1d Rajendra Nayak      2023-12-05   947  				interrupts = <GIC_SPI 809 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   948  
af16b00578a7a1d Rajendra Nayak      2023-12-05   949  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   950  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05   951  
af16b00578a7a1d Rajendra Nayak      2023-12-05   952  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   953  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11   954  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11   955  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   956  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   957  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   958  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05   959  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05   960  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05   961  
c8327bb53b87285 Stephan Gerhold     2024-10-07   962  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   963  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   964  
af16b00578a7a1d Rajendra Nayak      2023-12-05   965  				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   966  				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   967  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05   968  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05   969  
af16b00578a7a1d Rajendra Nayak      2023-12-05   970  				pinctrl-0 = <&qup_i2c17_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   971  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05   972  
af16b00578a7a1d Rajendra Nayak      2023-12-05   973  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   974  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   975  
af16b00578a7a1d Rajendra Nayak      2023-12-05   976  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05   977  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05   978  
af16b00578a7a1d Rajendra Nayak      2023-12-05   979  			spi17: spi@884000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05   980  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05   981  				reg = <0 0x00884000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   982  
af16b00578a7a1d Rajendra Nayak      2023-12-05   983  				interrupts = <GIC_SPI 809 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   984  
af16b00578a7a1d Rajendra Nayak      2023-12-05   985  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   986  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05   987  
af16b00578a7a1d Rajendra Nayak      2023-12-05   988  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   989  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11   990  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11   991  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05   992  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05   993  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05   994  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05   995  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05   996  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05   997  
c8327bb53b87285 Stephan Gerhold     2024-10-07   998  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07   999  				operating-points-v2 = <&qup_opp_table_120mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1000  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1001  				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1002  				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1003  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1004  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1005  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1006  				pinctrl-0 = <&qup_spi17_data_clk>, <&qup_spi17_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1007  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1008  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1009  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1010  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1011  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1012  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1013  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1014  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1015  			i2c18: i2c@888000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1016  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1017  				reg = <0 0x00888000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1018  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1019  				interrupts = <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1020  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1021  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1022  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1023  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1024  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1025  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1026  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1027  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1028  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1029  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1030  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1031  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1032  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1033  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1034  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1035  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1036  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1037  				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1038  				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1039  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1040  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1041  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1042  				pinctrl-0 = <&qup_i2c18_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1043  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1044  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1045  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1046  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1047  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1048  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1049  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1050  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1051  			spi18: spi@888000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1052  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1053  				reg = <0 0x00888000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1054  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1055  				interrupts = <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1056  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1057  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1058  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1059  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1060  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1061  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1062  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1063  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1064  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1065  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1066  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1067  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1068  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1069  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1070  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1071  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1072  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1073  				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1074  				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1075  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1076  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1077  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1078  				pinctrl-0 = <&qup_spi18_data_clk>, <&qup_spi18_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1079  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1080  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1081  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1082  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1083  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1084  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1085  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1086  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1087  			i2c19: i2c@88c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1088  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1089  				reg = <0 0x0088c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1090  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1091  				interrupts = <GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1092  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1093  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1094  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1095  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1096  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1097  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1098  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1099  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1100  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1101  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1102  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1103  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1104  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1105  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1106  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1107  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1108  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1109  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1110  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1111  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1112  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1113  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1114  				pinctrl-0 = <&qup_i2c19_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1115  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1116  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1117  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1118  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1119  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1120  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1121  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1122  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1123  			spi19: spi@88c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1124  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1125  				reg = <0 0x0088c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1126  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1127  				interrupts = <GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1128  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1129  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1130  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1131  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1132  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1133  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1134  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1135  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1136  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1137  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1138  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1139  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1140  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1141  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1142  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1143  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1144  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1145  				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1146  				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1147  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1148  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1149  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1150  				pinctrl-0 = <&qup_spi19_data_clk>, <&qup_spi19_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1151  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1152  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1153  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1154  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1155  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1156  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1157  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1158  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1159  			i2c20: i2c@890000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1160  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1161  				reg = <0 0x00890000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1162  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1163  				interrupts = <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1164  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1165  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1166  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1167  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1168  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1169  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1170  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1171  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1172  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1173  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1174  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1175  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1176  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1177  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1178  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1179  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1180  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1181  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1182  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1183  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1184  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1185  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1186  				pinctrl-0 = <&qup_i2c20_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1187  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1188  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1189  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1190  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1191  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1192  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1193  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1194  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1195  			spi20: spi@890000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1196  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1197  				reg = <0 0x00890000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1198  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1199  				interrupts = <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1200  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1201  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1202  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1203  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1204  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1205  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1206  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1207  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1208  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1209  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1210  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1211  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1212  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1213  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1214  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1215  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1216  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1217  				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1218  				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1219  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1220  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1221  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1222  				pinctrl-0 = <&qup_spi20_data_clk>, <&qup_spi20_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1223  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1224  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1225  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1226  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1227  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1228  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1229  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1230  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1231  			i2c21: i2c@894000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1232  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1233  				reg = <0 0x00894000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1234  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1235  				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1236  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1237  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1238  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1239  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1240  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1241  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1242  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1243  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1244  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1245  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1246  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1247  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1248  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1249  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1250  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1251  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1252  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1253  				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1254  				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1255  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1256  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1257  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1258  				pinctrl-0 = <&qup_i2c21_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1259  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1260  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1261  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1262  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1263  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1264  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1265  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1266  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1267  			spi21: spi@894000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1268  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1269  				reg = <0 0x00894000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1270  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1271  				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1272  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1273  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1274  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1275  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1276  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1277  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1278  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1279  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1280  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1281  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1282  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1283  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1284  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1285  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1286  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1287  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1288  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1289  				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1290  				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1291  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1292  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1293  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1294  				pinctrl-0 = <&qup_spi21_data_clk>, <&qup_spi21_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1295  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1296  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1297  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1298  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1299  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1300  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1301  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1302  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1303  			uart21: serial@894000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1304  				compatible = "qcom,geni-uart";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1305  				reg = <0 0x00894000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1306  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1307  				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1308  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1309  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1310  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1311  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1312  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1313  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1314  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1315  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1316  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1317  						     "qup-config";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1318  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1319  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1320  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1321  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1322  				pinctrl-0 = <&qup_uart21_default>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1323  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1324  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1325  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1326  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1327  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1328  			i2c22: i2c@898000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1329  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1330  				reg = <0 0x00898000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1331  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1332  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1333  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1334  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1335  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1336  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1337  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1338  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1339  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1340  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1341  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1342  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1343  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1344  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1345  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1346  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1347  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1348  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1349  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1350  				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1351  				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1352  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1353  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1354  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1355  				pinctrl-0 = <&qup_i2c22_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1356  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1357  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1358  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1359  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1360  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1361  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1362  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1363  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1364  			spi22: spi@898000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1365  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1366  				reg = <0 0x00898000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1367  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1368  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1369  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1370  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1371  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1372  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1373  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1374  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1375  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1376  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1377  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1378  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1379  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1380  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1381  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1382  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1383  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1384  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1385  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1386  				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1387  				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1388  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1389  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1390  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1391  				pinctrl-0 = <&qup_spi22_data_clk>, <&qup_spi22_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1392  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1393  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1394  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1395  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1396  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1397  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1398  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1399  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1400  			i2c23: i2c@89c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1401  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1402  				reg = <0 0x0089c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1403  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1404  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1405  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1406  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1407  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1408  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1409  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1410  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1411  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1412  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1413  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1414  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1415  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1416  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1417  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1418  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1419  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1420  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1421  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1422  				dmas = <&gpi_dma2 0 7 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1423  				       <&gpi_dma2 1 7 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1424  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1425  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1426  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1427  				pinctrl-0 = <&qup_i2c23_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1428  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1429  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1430  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1431  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1432  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1433  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1434  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1435  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1436  			spi23: spi@89c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1437  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1438  				reg = <0 0x0089c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1439  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1440  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1441  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1442  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1443  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1444  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1445  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1446  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1447  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1448  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1449  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1450  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1451  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1452  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1453  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1454  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1455  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1456  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1457  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1458  				dmas = <&gpi_dma2 0 7 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1459  				       <&gpi_dma2 1 7 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1460  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1461  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1462  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1463  				pinctrl-0 = <&qup_spi23_data_clk>, <&qup_spi23_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1464  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1465  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1466  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1467  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1468  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1469  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1470  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1471  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1472  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1473  		gpi_dma1: dma-controller@a00000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1474  			compatible = "qcom,x1e80100-gpi-dma", "qcom,sm6350-gpi-dma";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1475  			reg = <0 0x00a00000 0 0x60000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1476  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1477  			interrupts = <GIC_SPI 776 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1478  				     <GIC_SPI 777 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1479  				     <GIC_SPI 778 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1480  				     <GIC_SPI 779 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1481  				     <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1482  				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1483  				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1484  				     <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1485  				     <GIC_SPI 784 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1486  				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1487  				     <GIC_SPI 786 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1488  				     <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1489  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1490  			dma-channels = <12>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1491  			dma-channel-mask = <0x3e>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1492  			#dma-cells = <3>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1493  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1494  			iommus = <&apps_smmu 0x136 0x0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1495  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1496  			status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1497  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1498  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1499  		qupv3_1: geniqup@ac0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1500  			compatible = "qcom,geni-se-qup";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1501  			reg = <0 0x00ac0000 0 0x2000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1502  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1503  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1504  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1505  			clock-names = "m-ahb",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1506  				      "s-ahb";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1507  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1508  			iommus = <&apps_smmu 0x123 0x0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1509  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1510  			#address-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1511  			#size-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1512  			ranges;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1513  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1514  			status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1515  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1516  			i2c8: i2c@a80000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1517  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1518  				reg = <0 0x00a80000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1519  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1520  				interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1521  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1522  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1523  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1524  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1525  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1526  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1527  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1528  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1529  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1530  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1531  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1532  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1533  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1534  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1535  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1536  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1537  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1538  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1539  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1540  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1541  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1542  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1543  				pinctrl-0 = <&qup_i2c8_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1544  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1545  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1546  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1547  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1548  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1549  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1550  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1551  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1552  			spi8: spi@a80000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1553  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1554  				reg = <0 0x00a80000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1555  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1556  				interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1557  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1558  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1559  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1560  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1561  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1562  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1563  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1564  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1565  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1566  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1567  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1568  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1569  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1570  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1571  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1572  				operating-points-v2 = <&qup_opp_table_120mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1573  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1574  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1575  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1576  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1577  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1578  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1579  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1580  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1581  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1582  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1583  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1584  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1585  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1586  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1587  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1588  			i2c9: i2c@a84000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1589  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1590  				reg = <0 0x00a84000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1591  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1592  				interrupts = <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1593  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1594  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1595  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1596  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1597  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1598  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1599  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1600  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1601  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1602  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1603  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1604  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1605  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1606  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1607  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1608  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1609  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1610  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1611  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1612  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1613  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1614  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1615  				pinctrl-0 = <&qup_i2c9_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1616  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1617  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1618  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1619  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1620  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1621  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1622  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1623  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1624  			spi9: spi@a84000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1625  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1626  				reg = <0 0x00a84000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1627  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1628  				interrupts = <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1629  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1630  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1631  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1632  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1633  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1634  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1635  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1636  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1637  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1638  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1639  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1640  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1641  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1642  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1643  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1644  				operating-points-v2 = <&qup_opp_table_120mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1645  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1646  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1647  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1648  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1649  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1650  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1651  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1652  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1653  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1654  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1655  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1656  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1657  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1658  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1659  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1660  			i2c10: i2c@a88000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1661  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1662  				reg = <0 0x00a88000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1663  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1664  				interrupts = <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1665  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1666  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1667  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1668  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1669  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1670  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1671  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1672  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1673  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1674  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1675  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1676  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1677  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1678  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1679  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1680  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1681  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1682  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1683  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1684  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1685  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1686  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1687  				pinctrl-0 = <&qup_i2c10_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1688  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1689  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1690  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1691  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1692  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1693  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1694  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1695  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1696  			spi10: spi@a88000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1697  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1698  				reg = <0 0x00a88000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1699  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1700  				interrupts = <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1701  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1702  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1703  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1704  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1705  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1706  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1707  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1708  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1709  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1710  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1711  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1712  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1713  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1714  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1715  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1716  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1717  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1718  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1719  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1720  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1721  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1722  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1723  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1724  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1725  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1726  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1727  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1728  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1729  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1730  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1731  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1732  			i2c11: i2c@a8c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1733  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1734  				reg = <0 0x00a8c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1735  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1736  				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1737  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1738  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1739  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1740  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1741  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1742  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1743  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1744  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1745  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1746  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1747  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1748  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1749  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1750  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1751  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1752  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1753  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1754  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1755  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1756  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1757  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1758  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1759  				pinctrl-0 = <&qup_i2c11_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1760  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1761  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1762  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1763  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1764  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1765  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1766  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1767  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1768  			spi11: spi@a8c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1769  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1770  				reg = <0 0x00a8c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1771  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1772  				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1773  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1774  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1775  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1776  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1777  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1778  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1779  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1780  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1781  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1782  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1783  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1784  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1785  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1786  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1787  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1788  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1789  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1790  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1791  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1792  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1793  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1794  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1795  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1796  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1797  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1798  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1799  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1800  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1801  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1802  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1803  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1804  			i2c12: i2c@a90000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1805  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1806  				reg = <0 0x00a90000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1807  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1808  				interrupts = <GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1809  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1810  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1811  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1812  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1813  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1814  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1815  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1816  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1817  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1818  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1819  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1820  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1821  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1822  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1823  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1824  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1825  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1826  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1827  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1828  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1829  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1830  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1831  				pinctrl-0 = <&qup_i2c12_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1832  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1833  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1834  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1835  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1836  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1837  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1838  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1839  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1840  			spi12: spi@a90000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1841  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1842  				reg = <0 0x00a90000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1843  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1844  				interrupts = <GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1845  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1846  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1847  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1848  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1849  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1850  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1851  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1852  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1853  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1854  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1855  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1856  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1857  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1858  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1859  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1860  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1861  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1862  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1863  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1864  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1865  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1866  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1867  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1868  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1869  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1870  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1871  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1872  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1873  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1874  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1875  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1876  			i2c13: i2c@a94000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1877  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1878  				reg = <0 0x00a94000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1879  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1880  				interrupts = <GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1881  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1882  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1883  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1884  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1885  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1886  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1887  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1888  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1889  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1890  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1891  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1892  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1893  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1894  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1895  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1896  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1897  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1898  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1899  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1900  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1901  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1902  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1903  				pinctrl-0 = <&qup_i2c13_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1904  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1905  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1906  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1907  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1908  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1909  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1910  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1911  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1912  			spi13: spi@a94000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1913  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1914  				reg = <0 0x00a94000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1915  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1916  				interrupts = <GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1917  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1918  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1919  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1920  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1921  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1922  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1923  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1924  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1925  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1926  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1927  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1928  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1929  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1930  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1931  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1932  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1933  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1934  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1935  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1936  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1937  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1938  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1939  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1940  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1941  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1942  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1943  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1944  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1945  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1946  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1947  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1948  			i2c14: i2c@a98000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1949  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1950  				reg = <0 0x00a98000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1951  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1952  				interrupts = <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1953  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1954  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1955  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1956  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1957  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1958  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1959  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1960  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1961  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1962  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1963  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1964  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1965  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1966  
c8327bb53b87285 Stephan Gerhold     2024-10-07  1967  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1968  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  1969  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1970  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1971  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1972  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  1973  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1974  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1975  				pinctrl-0 = <&qup_i2c14_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1976  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1977  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1978  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1979  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1980  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1981  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1982  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  1983  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1984  			spi14: spi@a98000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  1985  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1986  				reg = <0 0x00a98000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1987  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1988  				interrupts = <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1989  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1990  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1991  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  1992  
af16b00578a7a1d Rajendra Nayak      2023-12-05  1993  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1994  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  1995  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  1996  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  1997  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  1998  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  1999  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2000  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2001  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2002  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2003  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2004  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2005  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2006  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2007  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2008  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2009  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2010  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2011  				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2012  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2013  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2014  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2015  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2016  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2017  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2018  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2019  
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2020  			uart14: serial@a98000 {
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2021  				compatible = "qcom,geni-uart";
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2022  				reg = <0 0x00a98000 0 0x4000>;
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2023  
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2024  				interrupts = <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>;
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2025  
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2026  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2027  				clock-names = "se";
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2028  
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2029  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2030  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2031  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2032  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2033  				interconnect-names = "qup-core",
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2034  						     "qup-config";
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2035  
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2036  				power-domains = <&rpmhpd RPMHPD_CX>;
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2037  				operating-points-v2 = <&qup_opp_table_100mhz>;
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2038  
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2039  				pinctrl-0 = <&qup_uart14_default>;
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2040  				pinctrl-names = "default";
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2041  
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2042  				status = "disabled";
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2043  			};
85b4b74ba904c9e Stephan Gerhold     2024-10-07  2044  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2045  			i2c15: i2c@a9c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2046  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2047  				reg = <0 0x00a9c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2048  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2049  				interrupts = <GIC_SPI 807 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2050  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2051  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2052  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2053  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2054  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2055  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2056  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2057  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2058  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2059  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2060  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2061  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2062  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2063  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2064  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2065  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2066  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2067  				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2068  				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2069  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2070  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2071  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2072  				pinctrl-0 = <&qup_i2c15_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2073  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2074  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2075  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2076  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2077  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2078  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2079  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2080  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2081  			spi15: spi@a9c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2082  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2083  				reg = <0 0x00a9c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2084  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2085  				interrupts = <GIC_SPI 807 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2086  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2087  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2088  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2089  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2090  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2091  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2092  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2093  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2094  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2095  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2096  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2097  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2098  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2099  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2100  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2101  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2102  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2103  				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2104  				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2105  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2106  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2107  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2108  				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2109  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2110  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2111  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2112  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2113  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2114  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2115  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2116  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2117  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2118  		gpi_dma0: dma-controller@b00000  {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2119  			compatible = "qcom,x1e80100-gpi-dma", "qcom,sm6350-gpi-dma";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2120  			reg = <0 0x00b00000 0 0x60000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2121  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2122  			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2123  				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2124  				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2125  				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2126  				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2127  				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2128  				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2129  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2130  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2131  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2132  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2133  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2134  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2135  			dma-channels = <12>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2136  			dma-channel-mask = <0x3e>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2137  			#dma-cells = <3>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2138  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2139  			iommus = <&apps_smmu 0x456 0x0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2140  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2141  			status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2142  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2143  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2144  		qupv3_0: geniqup@bc0000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2145  			compatible = "qcom,geni-se-qup";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2146  			reg = <0 0x00bc0000 0 0x2000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2147  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2148  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2149  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2150  			clock-names = "m-ahb",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2151  				      "s-ahb";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2152  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2153  			iommus = <&apps_smmu 0x443 0x0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2154  			#address-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2155  			#size-cells = <2>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2156  			ranges;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2157  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2158  			status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2159  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2160  			i2c0: i2c@b80000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2161  				compatible = "qcom,geni-i2c";
27302c7d8590995 Konrad Dybcio       2024-07-11  2162  				reg = <0 0x00b80000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2163  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2164  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2165  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2166  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2167  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2168  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2169  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2170  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2171  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2172  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2173  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2174  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2175  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2176  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2177  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2178  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2179  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2180  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2181  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2182  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2183  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2184  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2185  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2186  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2187  				pinctrl-0 = <&qup_i2c0_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2188  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2189  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2190  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2191  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2192  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2193  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2194  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2195  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2196  			spi0: spi@b80000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2197  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2198  				reg = <0 0x00b80000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2199  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2200  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2201  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2202  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2203  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2204  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2205  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2206  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2207  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2208  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2209  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2210  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2211  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2212  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2213  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2214  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2215  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2216  				operating-points-v2 = <&qup_opp_table_120mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2217  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2218  				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2219  				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2220  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2221  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2222  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2223  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2224  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2225  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2226  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2227  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2228  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2229  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2230  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2231  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2232  			i2c1: i2c@b84000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2233  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2234  				reg = <0 0x00b84000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2235  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2236  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2237  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2238  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2239  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2240  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2241  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2242  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2243  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2244  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2245  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2246  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2247  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2248  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2249  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2250  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2251  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2252  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2253  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2254  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2255  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2256  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2257  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2258  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2259  				pinctrl-0 = <&qup_i2c1_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2260  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2261  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2262  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2263  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2264  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2265  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2266  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2267  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2268  			spi1: spi@b84000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2269  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2270  				reg = <0 0x00b84000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2271  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2272  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2273  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2274  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2275  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2276  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2277  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2278  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2279  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2280  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2281  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2282  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2283  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2284  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2285  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2286  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2287  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2288  				operating-points-v2 = <&qup_opp_table_120mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2289  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2290  				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2291  				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2292  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2293  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2294  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2295  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2296  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2297  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2298  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2299  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2300  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2301  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2302  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2303  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2304  			i2c2: i2c@b88000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2305  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2306  				reg = <0 0x00b88000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2307  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2308  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2309  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2310  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2311  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2312  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2313  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2314  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2315  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2316  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2317  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2318  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2319  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2320  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2321  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2322  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2323  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2324  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2325  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2326  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2327  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2328  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2329  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2330  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2331  				pinctrl-0 = <&qup_i2c2_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2332  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2333  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2334  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2335  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2336  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2337  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2338  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2339  
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2340  			uart2: serial@b88000 {
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2341  				compatible = "qcom,geni-uart";
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2342  				reg = <0 0x00b88000 0 0x4000>;
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2343  
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2344  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2345  
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2346  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2347  				clock-names = "se";
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2348  
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2349  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2350  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2351  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2352  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2353  				interconnect-names = "qup-core",
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2354  						     "qup-config";
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2355  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2356  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2357  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2358  
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2359  				pinctrl-0 = <&qup_uart2_default>;
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2360  				pinctrl-names = "default";
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2361  
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2362  				status = "disabled";
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2363  			};
ecbdce2041ee09c Konrad Dybcio       2024-08-26  2364  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2365  			spi2: spi@b88000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2366  				compatible = "qcom,geni-spi";
27302c7d8590995 Konrad Dybcio       2024-07-11  2367  				reg = <0 0x00b88000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2368  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2369  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2370  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2371  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2372  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2373  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2374  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2375  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2376  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2377  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2378  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2379  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2380  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2381  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2382  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2383  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2384  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2385  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2386  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2387  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2388  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2389  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2390  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2391  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2392  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2393  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2394  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2395  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2396  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2397  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2398  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2399  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2400  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2401  			i2c3: i2c@b8c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2402  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2403  				reg = <0 0x00b8c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2404  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2405  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2406  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2407  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2408  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2409  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2410  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2411  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2412  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2413  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2414  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2415  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2416  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2417  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2418  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2419  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2420  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2421  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2422  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2423  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2424  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2425  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2426  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2427  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2428  				pinctrl-0 = <&qup_i2c3_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2429  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2430  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2431  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2432  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2433  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2434  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2435  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2436  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2437  			spi3: spi@b8c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2438  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2439  				reg = <0 0x00b8c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2440  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2441  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2442  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2443  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2444  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2445  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2446  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2447  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2448  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2449  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2450  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2451  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2452  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2453  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2454  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2455  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2456  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2457  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2458  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2459  				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2460  				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2461  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2462  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2463  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2464  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2465  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2466  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2467  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2468  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2469  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2470  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2471  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2472  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2473  			i2c4: i2c@b90000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2474  				compatible = "qcom,geni-i2c";
27302c7d8590995 Konrad Dybcio       2024-07-11  2475  				reg = <0 0x00b90000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2476  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2477  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2478  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2479  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2480  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2481  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2482  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2483  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2484  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2485  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2486  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2487  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2488  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2489  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2490  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2491  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2492  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2493  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2494  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2495  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2496  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2497  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2498  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2499  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2500  				pinctrl-0 = <&qup_i2c4_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2501  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2502  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2503  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2504  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2505  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2506  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2507  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2508  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2509  			spi4: spi@b90000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2510  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2511  				reg = <0 0x00b90000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2512  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2513  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2514  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2515  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2516  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2517  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2518  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2519  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2520  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2521  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2522  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2523  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2524  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2525  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2526  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2527  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2528  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2529  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2530  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2531  				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2532  				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2533  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2534  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2535  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2536  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2537  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2538  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2539  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2540  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2541  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2542  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2543  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2544  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2545  			i2c5: i2c@b94000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2546  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2547  				reg = <0 0x00b94000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2548  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2549  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2550  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2551  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2552  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2553  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2554  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2555  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2556  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2557  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2558  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2559  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2560  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2561  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2562  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2563  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2564  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2565  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2566  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2567  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2568  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2569  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2570  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2571  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2572  				pinctrl-0 = <&qup_i2c5_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2573  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2574  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2575  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2576  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2577  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2578  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2579  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2580  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2581  			spi5: spi@b94000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2582  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2583  				reg = <0 0x00b94000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2584  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2585  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2586  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2587  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2588  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2589  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2590  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2591  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2592  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2593  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2594  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2595  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2596  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2597  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2598  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2599  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2600  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2601  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2602  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2603  				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2604  				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2605  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2606  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2607  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2608  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2609  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2610  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2611  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2612  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2613  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2614  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2615  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2616  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2617  			i2c6: i2c@b98000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2618  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2619  				reg = <0 0x00b98000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2620  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2621  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2622  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2623  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2624  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2625  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2626  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2627  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2628  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2629  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2630  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2631  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2632  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2633  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2634  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2635  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2636  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2637  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2638  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2639  				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2640  				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2641  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2642  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2643  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2644  				pinctrl-0 = <&qup_i2c6_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2645  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2646  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2647  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2648  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2649  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2650  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2651  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2652  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2653  			spi6: spi@b98000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2654  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2655  				reg = <0 0x00b98000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2656  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2657  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2658  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2659  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2660  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2661  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2662  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2663  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2664  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2665  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2666  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2667  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2668  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2669  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2670  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2671  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2672  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2673  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2674  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2675  				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2676  				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2677  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2678  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2679  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2680  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2681  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2682  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2683  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2684  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2685  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2686  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2687  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2688  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2689  			i2c7: i2c@b9c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2690  				compatible = "qcom,geni-i2c";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2691  				reg = <0 0x00b9c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2692  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2693  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2694  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2695  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2696  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2697  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2698  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2699  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2700  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2701  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2702  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2703  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2704  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2705  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2706  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2707  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2708  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2709  				required-opps = <&rpmhpd_opp_low_svs>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2710  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2711  				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2712  				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2713  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2714  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2715  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2716  				pinctrl-0 = <&qup_i2c7_data_clk>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2717  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2718  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2719  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2720  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2721  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2722  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2723  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2724  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2725  			spi7: spi@b9c000 {
af16b00578a7a1d Rajendra Nayak      2023-12-05  2726  				compatible = "qcom,geni-spi";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2727  				reg = <0 0x00b9c000 0 0x4000>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2728  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2729  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2730  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2731  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2732  				clock-names = "se";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2733  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2734  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2735  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7017524e39dbf6b Konrad Dybcio       2025-01-11  2736  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7017524e39dbf6b Konrad Dybcio       2025-01-11  2737  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2738  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1d Rajendra Nayak      2023-12-05  2739  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2740  				interconnect-names = "qup-core",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2741  						     "qup-config",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2742  						     "qup-memory";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2743  
c8327bb53b87285 Stephan Gerhold     2024-10-07  2744  				power-domains = <&rpmhpd RPMHPD_CX>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2745  				operating-points-v2 = <&qup_opp_table_100mhz>;
c8327bb53b87285 Stephan Gerhold     2024-10-07  2746  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2747  				dmas = <&gpi_dma0 0 7 QCOM_GPI_SPI>,
af16b00578a7a1d Rajendra Nayak      2023-12-05  2748  				       <&gpi_dma0 1 7 QCOM_GPI_SPI>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2749  				dma-names = "tx",
af16b00578a7a1d Rajendra Nayak      2023-12-05  2750  					    "rx";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2751  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2752  				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2753  				pinctrl-names = "default";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2754  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2755  				#address-cells = <1>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2756  				#size-cells = <0>;
af16b00578a7a1d Rajendra Nayak      2023-12-05  2757  
af16b00578a7a1d Rajendra Nayak      2023-12-05  2758  				status = "disabled";
af16b00578a7a1d Rajendra Nayak      2023-12-05  2759  			};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2760  		};
af16b00578a7a1d Rajendra Nayak      2023-12-05  2761  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2762  		tsens0: thermal-sensor@c271000 {
4e915987ff5b91e Rajendra Nayak      2024-06-21  2763  			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
4e915987ff5b91e Rajendra Nayak      2024-06-21  2764  			reg = <0 0x0c271000 0 0x1000>,
4e915987ff5b91e Rajendra Nayak      2024-06-21  2765  			      <0 0x0c222000 0 0x1000>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2766  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2767  			interrupts-extended = <&pdc 26 IRQ_TYPE_LEVEL_HIGH>,
4e915987ff5b91e Rajendra Nayak      2024-06-21  2768  					      <&intc GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2769  			interrupt-names = "uplow",
4e915987ff5b91e Rajendra Nayak      2024-06-21  2770  					  "critical";
4e915987ff5b91e Rajendra Nayak      2024-06-21  2771  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2772  			#qcom,sensors = <16>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2773  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2774  			#thermal-sensor-cells = <1>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2775  		};
4e915987ff5b91e Rajendra Nayak      2024-06-21  2776  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2777  		tsens1: thermal-sensor@c272000 {
4e915987ff5b91e Rajendra Nayak      2024-06-21  2778  			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
4e915987ff5b91e Rajendra Nayak      2024-06-21  2779  			reg = <0 0x0c272000 0 0x1000>,
4e915987ff5b91e Rajendra Nayak      2024-06-21  2780  			      <0 0x0c223000 0 0x1000>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2781  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2782  			interrupts-extended = <&pdc 27 IRQ_TYPE_LEVEL_HIGH>,
4e915987ff5b91e Rajendra Nayak      2024-06-21  2783  					      <&intc GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2784  			interrupt-names = "uplow",
4e915987ff5b91e Rajendra Nayak      2024-06-21  2785  					  "critical";
4e915987ff5b91e Rajendra Nayak      2024-06-21  2786  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2787  			#qcom,sensors = <16>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2788  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2789  			#thermal-sensor-cells = <1>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2790  		};
4e915987ff5b91e Rajendra Nayak      2024-06-21  2791  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2792  		tsens2: thermal-sensor@c273000 {
4e915987ff5b91e Rajendra Nayak      2024-06-21  2793  			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
4e915987ff5b91e Rajendra Nayak      2024-06-21  2794  			reg = <0 0x0c273000 0 0x1000>,
4e915987ff5b91e Rajendra Nayak      2024-06-21  2795  			      <0 0x0c224000 0 0x1000>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2796  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2797  			interrupts-extended = <&pdc 28 IRQ_TYPE_LEVEL_HIGH>,
4e915987ff5b91e Rajendra Nayak      2024-06-21  2798  					      <&intc GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2799  			interrupt-names = "uplow",
4e915987ff5b91e Rajendra Nayak      2024-06-21  2800  					  "critical";
4e915987ff5b91e Rajendra Nayak      2024-06-21  2801  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2802  			#qcom,sensors = <16>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2803  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2804  			#thermal-sensor-cells = <1>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2805  		};
4e915987ff5b91e Rajendra Nayak      2024-06-21  2806  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2807  		tsens3: thermal-sensor@c274000 {
4e915987ff5b91e Rajendra Nayak      2024-06-21  2808  			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
4e915987ff5b91e Rajendra Nayak      2024-06-21  2809  			reg = <0 0x0c274000 0 0x1000>,
4e915987ff5b91e Rajendra Nayak      2024-06-21  2810  			      <0 0x0c225000 0 0x1000>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2811  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2812  			interrupts-extended = <&pdc 29 IRQ_TYPE_LEVEL_HIGH>,
4e915987ff5b91e Rajendra Nayak      2024-06-21  2813  					      <&intc GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2814  			interrupt-names = "uplow",
4e915987ff5b91e Rajendra Nayak      2024-06-21  2815  					  "critical";
4e915987ff5b91e Rajendra Nayak      2024-06-21  2816  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2817  			#qcom,sensors = <16>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2818  
4e915987ff5b91e Rajendra Nayak      2024-06-21  2819  			#thermal-sensor-cells = <1>;
4e915987ff5b91e Rajendra Nayak      2024-06-21  2820  		};
4e915987ff5b91e Rajendra Nayak      2024-06-21  2821  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2822  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2823  		ufs_mem_hc: ufs@1d84000 {
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2824  			compatible = "qcom,x1e80100-ufshc",
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2825  			"qcom,ufshc", "jedec,ufs-2.0";
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2826  			reg = <0 0x01d84000 0 0x3000>;     
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2827  			
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2828  			
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2829  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2830  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2831  			phys = <&ufs_mem_phy>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2832  			phy-names = "ufsphy";
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2833  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2834  			lanes-per-direction = <2>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2835  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2836  			#reset-cells = <1>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2837  			resets = <&gcc GCC_UFS_PHY_BCR>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2838  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2839  			reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2840  			reset-names = "rst";
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2841  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2842  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2843  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2844  			iommus = <&apps_smmu 0x1a0 0x0>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2845  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2846  			clock-names = "core_clk",
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2847  				      "bus_aggr_clk",
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2848  				      "iface_clk",
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2849  				      "core_clk_unipro",
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2850  				      "ref_clk",
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2851  				      "tx_lane0_sync_clk",
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2852  				      "rx_lane0_sync_clk",
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2853  				      "rx_lane1_sync_clk";
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2854  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2855  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2856  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2857  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2858  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2859  				 <&rpmhcc RPMH_CXO_CLK>,
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2860  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2861  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2862  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2863  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2864  			freq-table-hz = <100000000 403000000>,
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2865  					<0 0>,
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2866  					<0 0>,
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2867  					<100000000 403000000>,
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2868  					<100000000 403000000>,
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2869  					<0 0>,
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2870  					<0 0>,
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2871  					<0 0>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2872  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2873  			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2874  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2875  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2876  					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2877  			interconnect-names = "ufs-ddr", "cpu-ufs";
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2878  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2879  			qcom,ice = <&ice>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2880  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2881  			status = "disabled";
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2882  		};
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2883  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2884  		ufs_mem_phy: phy@1d80000 {
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2885  			compatible = "qcom,x1e80100-qmp-ufs-phy";
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2886  			reg = <0 0x01d80000 0 0x2000>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2887  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2888  			clocks = <&rpmhcc RPMH_CXO_CLK>,
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2889  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2890  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2891  			clock-names = "ref",
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2892  				      "ref_aux",
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2893  				      "qref";
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2894  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2895  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2896  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2897  			resets = <&ufs_mem_hc 0>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2898  			reset-names = "ufsphy";
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2899  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2900  			#phy-cells = <0>;
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2901  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2902  			status = "disabled";
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2903  		};
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14  2904  
02d35a8f0e5bb03 Harrison Vanderbyl  2025-08-14 @2905  		ice: crypto@1d90000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
