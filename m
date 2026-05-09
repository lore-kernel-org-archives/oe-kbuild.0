Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF625221F39
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 11:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778327067; cv=none; b=FqxbIE5cxHd2SXVyCnm1WdY+s0MX7qLw1eHSiRATamyecr6EAs5w2LE8fbquPLA3CJDz/tCpKzcLnsYAtr73dfABk5zY9O2NE0L4KPz/4SQIolIz8+l+0m3BbCgvTjn5cMmCXyR9qh66hp0T0VZqIpDdmlXnjygsuZKOhpUS7CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778327067; c=relaxed/simple;
	bh=P5LAfiyPj5Dr1k0TuSVQ+9qYBDjmC6Ru4nftc5HCtBQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aOtftJ9974B5UmcAw4KQiz4eZvtC5cP4mNgKkQ8Ir5VLvxRdjmRySb4TyIkdgfgWrE4Hhdas017uUoHgO2MsbrDioWERMzQO38z4GaYo4S3DlwJPXEP6Xm+3fNh+OY6ECSwj7H6PUDsUDfdv4aRUm8lsm+Hcgg4RIN4smHxwlBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSX04Td4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSX04Td4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778327066; x=1809863066;
  h=date:from:to:cc:subject:message-id;
  bh=P5LAfiyPj5Dr1k0TuSVQ+9qYBDjmC6Ru4nftc5HCtBQ=;
  b=VSX04Td49cdb0YWKzy98q9HzNGOypeY3oG+wqiN7UKqpQSb1a1Cid+IY
   JecRDm3VwuV3QkttglEPHEh1kVfZelrOWqD73wd5p8aucumZb13IaZWnw
   znWdGQeUxw5kXW7rFO1Yv75tpOgo1+G0f1foS4WQgWYhHMJHJIexg/p3b
   q7eEoh0c5EONphCTrNoh1A3uzRCU70373VjeTxBlXUh2XuIRqFzKS7NTY
   72f4/lFAQ3y3WS92aj9qDDxvmli/TRmsaKSRWMDiMtfSJbj4nB1bOHUsA
   67oPm6v2yJFMeL1/DmFhLCyzzszWtcicrG/wiXhxt/52jmVvKW2JSABsJ
   A==;
X-CSE-ConnectionGUID: ACyyy7YgRJuiIx1bidmP/g==
X-CSE-MsgGUID: SDIqo81/S6ewRMT4cZIAtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79471006"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79471006"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 04:44:26 -0700
X-CSE-ConnectionGUID: VvO50idkTFezOuwb2ZWjZg==
X-CSE-MsgGUID: oRTQ+ccAQ0uRyv5Ei9ccrw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 09 May 2026 04:44:24 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLg6Y-000000007Pf-1wIG;
	Sat, 09 May 2026 11:44:22 +0000
Date: Sat, 09 May 2026 13:43:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:qcom/dt64 149/155]
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: bluetooth
 (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
Message-ID: <202605091343.FkDN9ypq-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git qcom/dt64
head:   fc12767c19d49663b13ba2def6e4674df041c8a2
commit: d27267558fd25acb07d7ff28a7ff44eacf799eaf [149/155] arm64: dts: qcom: lemans; Add EL2 overlay
:::::: branch date: 4 months ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2055-20260506 (https://download.01.org/0day-ci/archive/20260509/202605091343.FkDN9ypq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091343.FkDN9ypq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605091343.FkDN9ypq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: remoteproc@26300000 (qcom,sa8775p-cdsp0-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: remoteproc@2a300000 (qcom,sa8775p-cdsp1-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: remoteproc@30000000 (qcom,sa8775p-adsp-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
--
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: remoteproc@26300000 (qcom,sa8775p-cdsp0-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: remoteproc@2a300000 (qcom,sa8775p-cdsp1-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: remoteproc@30000000 (qcom,sa8775p-adsp-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
