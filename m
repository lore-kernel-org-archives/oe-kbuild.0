Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038F93AA4F7
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jul 2026 23:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784331320; cv=none; b=aPg7cFP0vvxsfQxxuu89thbA0Gav1nppUBrPe1t0Yhx/8DdMofGRSAzpBOpMmOSf6YcfL2o1v1OAQXxW+ShrwHaTh2lrzfF0jjvsLx2cuKzvEnLyqQ3xv8mpAI79RmC7a33/7gd1opHDliodcFyCOmrWwHn7HWRxnxC0CVnMStU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784331320; c=relaxed/simple;
	bh=T8AarOV+hH73Cdu5YkP7qFTchzHTxjBnizYD7jYOTuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rKcH/Z7G08RORg7p9GxvTM6y8+IpEfv2ZQ44PArNtx63j/3k4XN/GopRT6lvnSnhwuHrLWzTjWZ35wX9sVyRY/H6nf+LGkKJwBnStY2zmDjVLtaHSfBAVHOnweAl67fgKaYPQsF+ebcNu54dR07ABFAcyI1dMylvLc/tJP7XheY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOBvmlrf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOBvmlrf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784331314; x=1815867314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T8AarOV+hH73Cdu5YkP7qFTchzHTxjBnizYD7jYOTuQ=;
  b=GOBvmlrfnvtdu87hg69JbKUzolM1cSsY+LjVp4TzGgXM1yz9ZEab6lrl
   HioQjMXKElSuo/BSe5CIftC5crMqbiwMqmE1gXqZC0NgVnCD3u/0S5yuB
   9aaF33FvCIED3ChvdUNLZwLHMk6Oxw4EGuh1j4t6li0iCKmuWWsiU+XRj
   9xIK7XTEJO+upspIvTwUfx30q7PVY8sd+1HuOBGjlJxoMGy4wUcs2iX6h
   zYTvP0TuE/Sb1Bx/YF6kQrulXfuXZ+TmKNFThnGpQYLwXvyujGPsYTy2+
   3JmFsgJueHuxed7AUiS+MRyL8lCLXLkJDoKl1a9oIiijkTySY1E05v+DG
   Q==;
X-CSE-ConnectionGUID: 1MTnvKCPSzeIx/yT6v37Yg==
X-CSE-MsgGUID: NquAUC8GQQi79eaKicBjYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="72543856"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="72543856"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 16:35:09 -0700
X-CSE-ConnectionGUID: I4SR82O1SyO7IInEhTREQA==
X-CSE-MsgGUID: z+DQESBpQY6Qs95Mq0bpJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="256994935"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 17 Jul 2026 16:35:07 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wks5B-000000005fN-2i8c;
	Fri, 17 Jul 2026 23:35:05 +0000
Date: Sat, 18 Jul 2026 01:35:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: monaco: enable audio ML offload
 memory and SMMU mappings
Message-ID: <202607180121.3ddV4ije-lkp@intel.com>
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
In-Reply-To: <20260716151854.3041914-3-pratyush.meduri@oss.qualcomm.com>
References: <20260716151854.3041914-3-pratyush.meduri@oss.qualcomm.com>
TO: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Pratyush,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b8809969e1d7a591e0f49dd464a5d04b3cf02ab1]

url:    https://github.com/intel-lab-lkp/linux/commits/Pratyush-Meduri/arm64-dts-qcom-lemans-enable-audio-ML-offload-memory-and-SMMU-mappings/20260717-052616
base:   b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
patch link:    https://lore.kernel.org/r/20260716151854.3041914-3-pratyush.meduri%40oss.qualcomm.com
patch subject: [PATCH v1 2/2] arm64: dts: qcom: monaco: enable audio ML offload memory and SMMU mappings
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-2054-20260717 (https://download.01.org/0day-ci/archive/20260718/202607180121.3ddV4ije-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180121.3ddV4ije-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607180121.3ddV4ije-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/lemans.dtsi:5497.28-5560.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:5581.28-5635.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: service@1 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: service@1 (qcom,q6apm): dais: Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: dais (qcom,q6apm-dais): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:5497.28-5560.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:5581.28-5635.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: service@1 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: service@1 (qcom,q6apm): dais: Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: dais (qcom,q6apm-dais): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:5497.28-5560.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:5581.28-5635.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: service@1 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: service@1 (qcom,q6apm): dais: Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: dais (qcom,q6apm-dais): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml
--
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: service@1 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: service@1 (qcom,q6apm): dais: Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: dais (qcom,q6apm-dais): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml
--
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: service@1 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: service@1 (qcom,q6apm): dais: Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera.dtb: dais (qcom,q6apm-dais): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml
--
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: remoteproc@30000000 (qcom,sa8775p-adsp-pas): iommus: [[54, 12288, 0], [54, 12384, 9], [54, 12386, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: remoteproc@30000000 (qcom,sa8775p-adsp-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: service@1 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: service@1 (qcom,q6apm): dais: Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: dais (qcom,q6apm-dais): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml
--
>> arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtb: service@1 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtb: service@1 (qcom,q6apm): dais: Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtb: dais (qcom,q6apm-dais): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml
--
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: remoteproc@30000000 (qcom,sa8775p-adsp-pas): iommus: [[54, 12288, 0], [54, 12384, 9], [54, 12386, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: remoteproc@30000000 (qcom,sa8775p-adsp-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: service@1 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: service@1 (qcom,q6apm): dais: Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: dais (qcom,q6apm-dais): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml
--
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: remoteproc@30000000 (qcom,sa8775p-adsp-pas): iommus: [[54, 12288, 0], [54, 12384, 9], [54, 12386, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: remoteproc@30000000 (qcom,sa8775p-adsp-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: service@1 (qcom,q6apm): dais: 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: service@1 (qcom,q6apm): dais: Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: dais (qcom,q6apm-dais): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
