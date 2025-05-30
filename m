Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE1A230BF2
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615127; cv=none; b=EhKSxa2QF7tqhMo0EO3KJBj7/v7UwMbnio2i86fXkQCD6iZDHXjsy30MoHw1VSlHRSC7MnHfOheKyb2MOlzSwMNznMyNIS+/ugG3g2117wJWrbTwVTUY8ICBn82u5c7vedSxCZPfsAxQCFjkWZtMF8CQFPo+7RUWLdc4+HvS0tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615127; c=relaxed/simple;
	bh=qkXRqWd+Pln940CKAb/kdp1QeNsOXymO90tUCBd0d8U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XNPRkF6stnqHESTM3nzvSqKpbH44+hraacGnNl8dXZIAGzDiKMB3WxbHZkckqKWVF1lWBYPtAQPmjd2d2K0AkIbyEnmPMZQVCIUaORR0wcAEg0ypEYC79VhzV4a7a/vrU9/XAZsYFjwV8giRJVOzD70dS/gKR9qs0wCno1ftq7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgTCUzDp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgTCUzDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748615125; x=1780151125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qkXRqWd+Pln940CKAb/kdp1QeNsOXymO90tUCBd0d8U=;
  b=bgTCUzDpsvEuW5TS+EsJjn/wkhDRlkofmf0oKnrIPmS/4XBXC54PVDn9
   qTd8gpPkXrmRvd9bwmPCQknH6iUsWK5oKEO2mv878jPQFOXNlUjauMANi
   qpPDhW9As3avspPGGFDi+olMBw5Ky5ojmU4TUhu2wG+p0jG1Klos9zhoK
   20nQueSJ/GXDLxSLko4z2Ng0eqQjFSMM8+6mYdIxtRCJ0trRBgrlhJXs4
   7+EqHO3qDq86VNa2AtnVlN4z0RAH4uHPfeTz8T7C4fGtnmH8MAy2lxTLS
   G1MsSAbvUlfT1sQqnUeWqvMUl0yv6QyyRpnGiEYZSIXo9Lq952RLwyFZy
   A==;
X-CSE-ConnectionGUID: fNGt5EFzTe2YjmT+tlW7XA==
X-CSE-MsgGUID: Jvu9mSfPRZa6j5Hy/GBIcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="49827912"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="49827912"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 07:25:25 -0700
X-CSE-ConnectionGUID: L+Tu/Z4zSiWgC+LorAmrgQ==
X-CSE-MsgGUID: AfRizwgGSseRAWwWxM0xOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144867740"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 May 2025 07:25:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL0fh-000XhI-1Z;
	Fri, 30 May 2025 14:25:21 +0000
Date: Fri, 30 May 2025 22:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: qcom: Add coresight node for SM8650
Message-ID: <202505302219.QyjNWCvw-lkp@intel.com>
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
In-Reply-To: <20250529085650.3594253-1-quic_yingdeng@quicinc.com>
References: <20250529085650.3594253-1-quic_yingdeng@quicinc.com>
TO: Yingchao Deng <quic_yingdeng@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Yingchao Deng <quic_yingdeng@quicinc.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Yingchao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15 next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yingchao-Deng/arm64-dts-qcom-Add-coresight-node-for-SM8650/20250529-170012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250529085650.3594253-1-quic_yingdeng%40quicinc.com
patch subject: [PATCH] arm64: dts: qcom: Add coresight node for SM8650
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-051-20250530 (https://download.01.org/0day-ci/archive/20250530/202505302219.QyjNWCvw-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505302219.QyjNWCvw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505302219.QyjNWCvw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3853.27-3909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5215.14-5225.6: Warning (avoid_unnecessary_addr_size): /soc@0/replicator@10046000/out-ports: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5399.14-5409.6: Warning (avoid_unnecessary_addr_size): /soc@0/replicator@10b06000/out-ports: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: ete0 (arm,embedded-trace-extension): $nodename:0: 'ete0' does not match '^ete(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: display-subsystem@ae00000 (qcom,sm8650-mdss): interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: display-subsystem@ae00000 (qcom,sm8650-mdss): interconnects: [[208, 3, 7, 32, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: replicator@10046000 (arm,coresight-dynamic-replicator): out-ports:port@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: replicator@10046000 (arm,coresight-dynamic-replicator): Unevaluated properties are not allowed ('out-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: tmc@10048000 (arm,coresight-tmc): iommus: [[49, 1248, 0], [49, 1216, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: tmc@10048000 (arm,coresight-tmc): Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: replicator@10b06000 (arm,coresight-dynamic-replicator): out-ports:port@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: replicator@10b06000 (arm,coresight-dynamic-replicator): Unevaluated properties are not allowed ('out-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5403.12-5408.7: Warning (unit_address_vs_reg): /soc@0/replicator@10b06000/out-ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3853.27-3909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5215.14-5225.6: Warning (avoid_unnecessary_addr_size): /soc@0/replicator@10046000/out-ports: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5399.14-5409.6: Warning (avoid_unnecessary_addr_size): /soc@0/replicator@10b06000/out-ports: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: ete0 (arm,embedded-trace-extension): $nodename:0: 'ete0' does not match '^ete(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: display-subsystem@ae00000 (qcom,sm8650-mdss): interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: display-subsystem@ae00000 (qcom,sm8650-mdss): interconnects: [[191, 3, 7, 32, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: replicator@10046000 (arm,coresight-dynamic-replicator): out-ports:port@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: replicator@10046000 (arm,coresight-dynamic-replicator): Unevaluated properties are not allowed ('out-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: tmc@10048000 (arm,coresight-tmc): iommus: [[49, 1248, 0], [49, 1216, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: tmc@10048000 (arm,coresight-tmc): Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: replicator@10b06000 (arm,coresight-dynamic-replicator): out-ports:port@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: replicator@10b06000 (arm,coresight-dynamic-replicator): Unevaluated properties are not allowed ('out-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5403.12-5408.7: Warning (unit_address_vs_reg): /soc@0/replicator@10b06000/out-ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3853.27-3909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5215.14-5225.6: Warning (avoid_unnecessary_addr_size): /soc@0/replicator@10046000/out-ports: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5399.14-5409.6: Warning (avoid_unnecessary_addr_size): /soc@0/replicator@10b06000/out-ports: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: ete0 (arm,embedded-trace-extension): $nodename:0: 'ete0' does not match '^ete(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: display-subsystem@ae00000 (qcom,sm8650-mdss): interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: display-subsystem@ae00000 (qcom,sm8650-mdss): interconnects: [[200, 3, 7, 32, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: replicator@10046000 (arm,coresight-dynamic-replicator): out-ports:port@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: replicator@10046000 (arm,coresight-dynamic-replicator): Unevaluated properties are not allowed ('out-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: tmc@10048000 (arm,coresight-tmc): iommus: [[49, 1248, 0], [49, 1216, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: tmc@10048000 (arm,coresight-tmc): Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: replicator@10b06000 (arm,coresight-dynamic-replicator): out-ports:port@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: replicator@10b06000 (arm,coresight-dynamic-replicator): Unevaluated properties are not allowed ('out-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: ete0 (arm,embedded-trace-extension): $nodename:0: 'ete0' does not match '^ete(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: display-subsystem@ae00000 (qcom,sm8650-mdss): interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: display-subsystem@ae00000 (qcom,sm8650-mdss): interconnects: [[208, 3, 7, 32, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: replicator@10046000 (arm,coresight-dynamic-replicator): out-ports:port@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: replicator@10046000 (arm,coresight-dynamic-replicator): Unevaluated properties are not allowed ('out-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: tmc@10048000 (arm,coresight-tmc): iommus: [[49, 1248, 0], [49, 1216, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: tmc@10048000 (arm,coresight-tmc): Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: replicator@10b06000 (arm,coresight-dynamic-replicator): out-ports:port@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: replicator@10b06000 (arm,coresight-dynamic-replicator): Unevaluated properties are not allowed ('out-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
