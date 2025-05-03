Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EC770814
	for <oe-kbuild@lists.linux.dev>; Sat,  3 May 2025 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746261453; cv=none; b=Ms4MACMSMnA/jlA5dNzC8FIZP46MXA7L43MAXkZerBM6gqBKBRh0BuIx/RLVLeD6xzqOaDLA2l4Gn2RAYI5xWBO3bwjXlBP7z379SZMm2rCEPzzbFdATEuXALO1j0phtOfZoyBNS8wXi+hnxkv096KqDQ5d37v44Knm/kUxm1fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746261453; c=relaxed/simple;
	bh=sdyD+4iSzT1flTArC8AD2ZMLRpEjzUrCSRqqsJQjBL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K6WW4JjJ/mOVs81wXt4Z13drHwZs6Bu7Jmtg+rp0qJ5GhqWio/sV+g3Y4CudrxqE7Ihs4AjnQylNkqaDheY1Eyy/k+k0fn04puNjW5ZGHJX7WOUYYEOZ5kcdqaU1UpGIumUX62Br1MlTUwgRFxfW9di8vn3jU3rTqUAm7KlTAfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEkq2Bl1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEkq2Bl1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746261451; x=1777797451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sdyD+4iSzT1flTArC8AD2ZMLRpEjzUrCSRqqsJQjBL0=;
  b=UEkq2Bl1kxirWG+IySEz5NvGtSdC8UFqIZQBHkmRsXQEAH1srYHFpqFa
   V5xZVRZsN6EBy9U3RVkXTGJ16MDr35V4ZC+SZtrdT2xrNNJUXtHXmUh/+
   uQwQO3OBSeuX/Tlrnsp2kiPMlm0X5d4gv7YcpVGUULG604vEJJ1tUU/O+
   4dXabESI1Ek+dsvm+QIcwlq+na4kAw3Ay6v0BSa1HVURbArVSqiygC4IG
   bybJVBdj6PEbWoCSx5vRSWm/O88P+SjJ0K/GyvOyR48VlDtBKpQaUgCN8
   2z4zKH09NBkvN1fVJJO+ZDsRR3jYM20f/a9rICkM4883NMjOm4HK6CdYQ
   w==;
X-CSE-ConnectionGUID: oFT4W9wcQKqREGdptBgszg==
X-CSE-MsgGUID: hyFUHBuVQRKNaXOobUOx/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="51752943"
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="51752943"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2025 01:37:30 -0700
X-CSE-ConnectionGUID: Zc2DczBWSGSp0DPWEAkXyA==
X-CSE-MsgGUID: evcAPtTBQKCQb+ulqqBDxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="165737726"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 May 2025 01:37:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uB8ND-0005Gj-09;
	Sat, 03 May 2025 08:37:27 +0000
Date: Sat, 3 May 2025 16:37:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: qcm6490-idp: Add WSA8830
 speakers and WCD9370 headset codec
Message-ID: <202505031524.B14EgEs3-lkp@intel.com>
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
In-Reply-To: <20250429092430.21477-7-quic_pkumpatl@quicinc.com>
References: <20250429092430.21477-7-quic_pkumpatl@quicinc.com>
TO: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: cros-qcom-dts-watchers@chromium.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: kernel@oss.qualcomm.com
CC: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
CC: Prasad Kumpatla <quic_pkumpatl@quicinc.com>

Hi Prasad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 33035b665157558254b3c21c3f049fd728e72368]

url:    https://github.com/intel-lab-lkp/linux/commits/Prasad-Kumpatla/arm64-dts-qcom-qcs6490-audioreach-Add-gpr-node/20250429-172836
base:   33035b665157558254b3c21c3f049fd728e72368
patch link:    https://lore.kernel.org/r/20250429092430.21477-7-quic_pkumpatl%40quicinc.com
patch subject: [PATCH v2 6/7] arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370 headset codec
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-053-20250502 (https://download.01.org/0day-ci/archive/20250503/202505031524.B14EgEs3-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505031524.B14EgEs3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505031524.B14EgEs3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4106.10-4116.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clock-names: ['mclk', 'macro', 'dcodec'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clocks: [[203, 56, 1], [203, 102, 1], [203, 103, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: pinctrl@33c0000 (qcom,sc7280-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: audio-codec-0 (qcom,wcd9370-codec): 'qcom,micbias4-microvolt' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wcd937x.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: audio-codec-0 (qcom,wcd9370-codec): Unevaluated properties are not allowed ('qcom,micbias1-microvolt', 'qcom,micbias2-microvolt', 'qcom,micbias3-microvolt', 'qcom,rx-device', 'qcom,tx-device', 'reset-gpios', 'vdd-buck-supply', 'vdd-mic-bias-supply', 'vdd-rxtx-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/qcom,wcd937x.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
