Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C924B658
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 00:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732927576; cv=none; b=s2Olu+tS+4hVclZc9Ah0f+j4XTLKEI9uORZZPnraR6Og24owE9fvWY1+nC17kjo5qICjP18Fv7cLLXLlcluTqZtltOMN3YeZObs/QAKAiZ9GILDGeZ0Dg4pFPpMWtBXCx4HHRDx7pmF71WWuGP80DG1ovm0TyDDTWT4LgaHSmow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732927576; c=relaxed/simple;
	bh=m/NC9OG1oW4hhloZ+nqlaXDB/9owJpTwiXgNDC17bfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A4F6Oh63fDrley1ZOIzCZnWBtcyCFFSBgb+PBdgJW5/HNtrAoYmEeGCyVYR1aUxYzep/dfwjC9BawJEl73HFmfScqLvDSiCDST2X/WqSnxkinloqiLYLaGaEf39C8qcWndQexMB1aHf2qTUz/7GjjHTHtS6KfKsL6kI0G1jsXBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7umOIIR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7umOIIR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732927574; x=1764463574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m/NC9OG1oW4hhloZ+nqlaXDB/9owJpTwiXgNDC17bfY=;
  b=D7umOIIR7XSZA/uetX+C7aHEFIV01c6bYWkjm4BDQwFHUdhJ2XWZILKg
   MGSxkKemAy80Yms+M8dx8X6SMkJkWgdLP4nniMVk9o2cyD3bcp56QTnIH
   H1OOaErUSIBpLhRJTzgyH3Qy9vHY0yQK0xIL8h4A1Z3RdIw0u3ejkcq0z
   B6PlGPe1gK7+yPjhM6IWUjy7V+/2ILI3Xud5U3BwSDC8YCyWwwU/4VmYK
   O3SCONNlxtwcs0simoO5fmIkqY6d1Yhyc4hshxBDP/s0EecbhQA80l2aw
   vkYAwUkyzMHKcDi7C8hYXI5U8XKGGqGz5btzWqjCNEpR+sxWYcqk7ukQv
   A==;
X-CSE-ConnectionGUID: ImvqbtGaSg6NjoOzPaksBg==
X-CSE-MsgGUID: aiP1x+8gSU2H2Xi+iTS4Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="43827905"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="43827905"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 16:46:13 -0800
X-CSE-ConnectionGUID: LHEzIC/zQtSvvUe7mFnEGQ==
X-CSE-MsgGUID: AGwxrHphTKiaKTdE8nLTdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="130081887"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Nov 2024 16:46:11 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHBcf-0000oD-01;
	Sat, 30 Nov 2024 00:46:09 +0000
Date: Sat, 30 Nov 2024 08:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: qcs6490-rb3gen2: enable
 Bluetooth
Message-ID: <202411300848.7ZFdMha5-lkp@intel.com>
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
In-Reply-To: <20241127115107.11549-2-quic_janathot@quicinc.com>
References: <20241127115107.11549-2-quic_janathot@quicinc.com>
TO: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Marcel Holtmann <marcel@holtmann.org>
TO: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
CC: quic_mohamull@quicinc.com
CC: quic_hbandi@quicinc.com
CC: quic_anubhavg@quicinc.com
CC: linux-arm-msm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-bluetooth@vger.kernel.org
CC: linux-pm@vger.kernel.org

Hi Janaki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth/master]
[also build test WARNING on linus/master next-20241128]
[cannot apply to robh/for-next broonie-regulator/for-next bluetooth-next/master brgl/gpio/for-next broonie-sound/for-next v6.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Janaki-Ramaiah-Thota/arm64-dts-qcom-qcs6490-rb3gen2-enable-Bluetooth/20241128-112231
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20241127115107.11549-2-quic_janathot%40quicinc.com
patch subject: [PATCH v4 1/2] arm64: dts: qcom: qcs6490-rb3gen2: enable Bluetooth
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-053-20241129 (https://download.01.org/0day-ci/archive/20241130/202411300848.7ZFdMha5-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300848.7ZFdMha5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411300848.7ZFdMha5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4582.26-4653.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4035.10-4045.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'enable-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'swctrl-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'vddio-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'vddbtcxmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'vddasd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: usb@8cf8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: /wcn6750-pmu: failed to match any schema with compatible: ['qcom,wcn6750-pmu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
