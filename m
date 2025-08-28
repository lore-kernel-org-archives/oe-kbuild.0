Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C960127A448
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Aug 2025 06:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756364241; cv=none; b=kmF6/NIDwd1rE4ejSwbF6ygrAIEF6ClRFyFZtr3/7ltDA77aDc4b6JRzcsIzYDTXR+Ud6QQk0iN7IV8cCep8hOV/eG8LH8c40EmregsFdZzt3djcRFrBG0GiZ84N2fo/N8ZecKpRJqI/D7jdk8PZCwmCkp9y+gx4lViRR9ik5qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756364241; c=relaxed/simple;
	bh=Fp4EKmkFIxyF6fYKoKOs4FzecOD0fJV/nDD4UTk61l4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B7uWLK0KpV05WBybuaUoCxyQsHeNUkf8C7YmLhcyoFq6NeJov4fvMRtfxQmWx3EOuXN5FBhxI/IeC+KIzn/oPPn7q52xwqTlXBB+nN9VoMVAusoQIXJCmzlKGKD3oVk60S1Z2bMDXp4iPvrzBPf6WS3tjdoJndllW0/4uP4SbZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VvTFrIGT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VvTFrIGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756364228; x=1787900228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fp4EKmkFIxyF6fYKoKOs4FzecOD0fJV/nDD4UTk61l4=;
  b=VvTFrIGTwcLoQn85OmUg4TndnrSwFI1QLsSc9k2mA9usJG76aFhSaV6w
   4JmDcQEQAPTvDmhE/retIfBgbNjqBWLphpPZPTgOZONo0dtbThi0xYdzy
   19u836iuIINfv1Q5EQei+UXK5btoi+TClgMVQYLeaNclY2Tz4vjikmZ9F
   ZfZq+tBhopfMImtog6j0405ZM57hWfnPQqNRukSZxsHU/wDRqwZQqtKiB
   EIhGCKEdaaCfOYKC0cXqF/otC8KOxvhAcmL+BN8Nv9YKBa56XLLkjTpv8
   AZDV3XD+FtAgXeVmUnXsRTLSqg2iFd2j3twO9a6SVUZ7YjhAWJWSKOjxb
   A==;
X-CSE-ConnectionGUID: cRz+Xu6qSyGAE4CvyehG2Q==
X-CSE-MsgGUID: 24vIOwY0Rge/0JN10NJgIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="62446889"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="62446889"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 23:57:06 -0700
X-CSE-ConnectionGUID: QWUX46+xRU2N1Syv/4tOYg==
X-CSE-MsgGUID: 44JIm0N5S+GXYeZ1UQdaQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="200991324"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 Aug 2025 23:57:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urWZB-000TSd-36;
	Thu, 28 Aug 2025 06:57:01 +0000
Date: Thu, 28 Aug 2025 14:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: Add display support for QCS615
Message-ID: <202508281444.kumY7fnm-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250827-add-display-support-for-qcs615-platform-v7-1-917c3de8f9ca@oss.qualcomm.com>
References: <20250827-add-display-support-for-qcs615-platform-v7-1-917c3de8f9ca@oss.qualcomm.com>
TO: Fange Zhang <fange.zhang@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: xiangxu.yin@oss.qualcomm.com
CC: tingwei.zhang@oss.qualcomm.com
CC: Li Liu <li.liu@oss.qualcomm.com>
CC: Fange Zhang <fange.zhang@oss.qualcomm.com>
CC: Dmitry Baryshkov <lumag@kernel.org>

Hi Fange,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d0630b758e593506126e8eda6c3d56097d1847c5]

url:    https://github.com/intel-lab-lkp/linux/commits/Fange-Zhang/arm64-dts-qcom-Add-display-support-for-QCS615/20250827-211505
base:   d0630b758e593506126e8eda6c3d56097d1847c5
patch link:    https://lore.kernel.org/r/20250827-add-display-support-for-qcs615-platform-v7-1-917c3de8f9ca%40oss.qualcomm.com
patch subject: [PATCH v7 1/2] arm64: dts: qcom: Add display support for QCS615
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-001-20250828 (https://download.01.org/0day-ci/archive/20250828/202508281444.kumY7fnm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508281444.kumY7fnm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508281444.kumY7fnm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm6150.dtsi:3674.27-3737.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property

vim +3674 arch/arm64/boot/dts/qcom/sm6150.dtsi

8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    20  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    21  / {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    22  	interrupt-parent = <&intc>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    23  	#address-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    24  	#size-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    25  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    26  	cpus {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    27  		#address-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    28  		#size-cells = <0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    29  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    30  		cpu0: cpu@0 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    31  			device_type = "cpu";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    32  			compatible = "arm,cortex-a55";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    33  			reg = <0x0 0x0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    34  			enable-method = "psci";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    35  			power-domains = <&cpu_pd0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    36  			power-domain-names = "psci";
82db707eb97d96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-11    37  			capacity-dmips-mhz = <1024>;
82db707eb97d96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-11    38  			dynamic-power-coefficient = <100>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    39  			next-level-cache = <&l2_0>;
fecc6e0b026027 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14    40  			clocks = <&cpufreq_hw 0>;
fecc6e0b026027 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14    41  			qcom,freq-domain = <&cpufreq_hw 0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    42  			#cooling-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    43  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    44  			l2_0: l2-cache {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    45  			      compatible = "cache";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    46  			      cache-level = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    47  			      cache-unified;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    48  			      next-level-cache = <&l3_0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    49  			};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    50  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    51  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    52  		cpu1: cpu@100 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    53  			device_type = "cpu";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    54  			compatible = "arm,cortex-a55";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    55  			reg = <0x0 0x100>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    56  			enable-method = "psci";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    57  			power-domains = <&cpu_pd1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    58  			power-domain-names = "psci";
82db707eb97d96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-11    59  			capacity-dmips-mhz = <1024>;
82db707eb97d96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-11    60  			dynamic-power-coefficient = <100>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    61  			next-level-cache = <&l2_100>;
fecc6e0b026027 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14    62  			clocks = <&cpufreq_hw 0>;
fecc6e0b026027 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14    63  			qcom,freq-domain = <&cpufreq_hw 0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    64  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    65  			l2_100: l2-cache {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    66  			      compatible = "cache";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    67  			      cache-level = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    68  			      cache-unified;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    69  			      next-level-cache = <&l3_0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    70  			};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    71  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    72  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    73  		cpu2: cpu@200 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    74  			device_type = "cpu";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    75  			compatible = "arm,cortex-a55";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    76  			reg = <0x0 0x200>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    77  			enable-method = "psci";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    78  			power-domains = <&cpu_pd2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    79  			power-domain-names = "psci";
82db707eb97d96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-11    80  			capacity-dmips-mhz = <1024>;
82db707eb97d96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-11    81  			dynamic-power-coefficient = <100>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    82  			next-level-cache = <&l2_200>;
fecc6e0b026027 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14    83  			clocks = <&cpufreq_hw 0>;
fecc6e0b026027 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14    84  			qcom,freq-domain = <&cpufreq_hw 0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    85  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    86  			l2_200: l2-cache {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    87  			      compatible = "cache";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    88  			      cache-level = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    89  			      cache-unified;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    90  			      next-level-cache = <&l3_0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    91  			};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    92  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    93  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    94  		cpu3: cpu@300 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    95  			device_type = "cpu";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    96  			compatible = "arm,cortex-a55";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    97  			reg = <0x0 0x300>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    98  			enable-method = "psci";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04    99  			power-domains = <&cpu_pd3>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   100  			power-domain-names = "psci";
82db707eb97d96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-11   101  			capacity-dmips-mhz = <1024>;
82db707eb97d96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-11   102  			dynamic-power-coefficient = <100>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   103  			next-level-cache = <&l2_300>;
fecc6e0b026027 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14   104  			clocks = <&cpufreq_hw 0>;
fecc6e0b026027 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14   105  			qcom,freq-domain = <&cpufreq_hw 0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   106  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   107  			l2_300: l2-cache {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   108  			      compatible = "cache";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   109  			      cache-level = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   110  			      cache-unified;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   111  			      next-level-cache = <&l3_0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   112  			};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   113  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   114  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   115  		cpu4: cpu@400 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   116  			device_type = "cpu";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   117  			compatible = "arm,cortex-a55";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   118  			reg = <0x0 0x400>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   119  			enable-method = "psci";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   120  			power-domains = <&cpu_pd4>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   121  			power-domain-names = "psci";
82db707eb97d96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-11   122  			capacity-dmips-mhz = <1024>;
82db707eb97d96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-11   123  			dynamic-power-coefficient = <100>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   124  			next-level-cache = <&l2_400>;
fecc6e0b026027 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14   125  			clocks = <&cpufreq_hw 0>;
fecc6e0b026027 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14   126  			qcom,freq-domain = <&cpufreq_hw 0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   127  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   128  			l2_400: l2-cache {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   129  			      compatible = "cache";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   130  			      cache-level = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   131  			      cache-unified;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   132  			      next-level-cache = <&l3_0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   133  			};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   134  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   135  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   136  		cpu5: cpu@500 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   137  			device_type = "cpu";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   138  			compatible = "arm,cortex-a55";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   139  			reg = <0x0 0x500>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   140  			enable-method = "psci";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   141  			power-domains = <&cpu_pd5>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   142  			power-domain-names = "psci";
82db707eb97d96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-11   143  			capacity-dmips-mhz = <1024>;
82db707eb97d96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-11   144  			dynamic-power-coefficient = <100>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   145  			next-level-cache = <&l2_500>;
fecc6e0b026027 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14   146  			clocks = <&cpufreq_hw 0>;
fecc6e0b026027 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14   147  			qcom,freq-domain = <&cpufreq_hw 0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   148  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   149  			l2_500: l2-cache {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   150  			      compatible = "cache";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   151  			      cache-level = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   152  			      cache-unified;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   153  			      next-level-cache = <&l3_0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   154  			};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   155  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   156  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   157  		cpu6: cpu@600 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   158  			device_type = "cpu";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   159  			compatible = "arm,cortex-a76";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   160  			reg = <0x0 0x600>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   161  			enable-method = "psci";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   162  			power-domains = <&cpu_pd6>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   163  			power-domain-names = "psci";
82db707eb97d96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-11   164  			capacity-dmips-mhz = <1740>;
82db707eb97d96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-11   165  			dynamic-power-coefficient = <404>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   166  			next-level-cache = <&l2_600>;
fecc6e0b026027 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14   167  			clocks = <&cpufreq_hw 1>;
fecc6e0b026027 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14   168  			qcom,freq-domain = <&cpufreq_hw 1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   169  			#cooling-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   170  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   171  			l2_600: l2-cache {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   172  			      compatible = "cache";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   173  			      cache-level = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   174  			      cache-unified;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   175  			      next-level-cache = <&l3_0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   176  			};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   177  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   178  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   179  		cpu7: cpu@700 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   180  			device_type = "cpu";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   181  			compatible = "arm,cortex-a76";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   182  			reg = <0x0 0x700>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   183  			enable-method = "psci";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   184  			power-domains = <&cpu_pd7>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   185  			power-domain-names = "psci";
82db707eb97d96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-11   186  			capacity-dmips-mhz = <1740>;
82db707eb97d96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-11   187  			dynamic-power-coefficient = <404>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   188  			next-level-cache = <&l2_700>;
fecc6e0b026027 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14   189  			clocks = <&cpufreq_hw 1>;
fecc6e0b026027 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14   190  			qcom,freq-domain = <&cpufreq_hw 1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   191  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   192  			l2_700: l2-cache {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   193  			      compatible = "cache";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   194  			      cache-level = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   195  			      cache-unified;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   196  			      next-level-cache = <&l3_0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   197  			};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   198  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   199  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   200  		cpu-map {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   201  			cluster0 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   202  				core0 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   203  					cpu = <&cpu0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   204  				};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   205  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   206  				core1 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   207  					cpu = <&cpu1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   208  				};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   209  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   210  				core2 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   211  					cpu = <&cpu2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   212  				};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   213  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   214  				core3 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   215  					cpu = <&cpu3>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   216  				};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   217  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   218  				core4 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   219  					cpu = <&cpu4>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   220  				};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   221  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   222  				core5 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   223  					cpu = <&cpu5>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   224  				};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   225  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   226  				core6 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   227  					cpu = <&cpu6>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   228  				};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   229  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   230  				core7 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   231  					cpu = <&cpu7>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   232  				};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   233  			};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   234  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   235  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   236  		l3_0: l3-cache {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   237  			compatible = "cache";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   238  			cache-level = <3>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   239  			cache-unified;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   240  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   241  	};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   242  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06   243  	dummy_eud: dummy-sink {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06   244  		compatible = "arm,coresight-dummy-sink";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06   245  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06   246  		in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06   247  			port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06   248  				eud_in: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06   249  					remote-endpoint = <&replicator_swao_out1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06   250  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06   251  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06   252  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06   253  	};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06   254  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   255  	idle-states {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   256  		entry-method = "psci";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   257  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   258  		little_cpu_sleep_0: cpu-sleep-0-0 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   259  			compatible = "arm,idle-state";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   260  			idle-state-name = "silver-power-collapse";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   261  			arm,psci-suspend-param = <0x40000003>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   262  			entry-latency-us = <549>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   263  			exit-latency-us = <901>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   264  			min-residency-us = <1774>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   265  			local-timer-stop;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   266  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   267  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   268  		little_cpu_sleep_1: cpu-sleep-0-1 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   269  			compatible = "arm,idle-state";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   270  			idle-state-name = "silver-rail-power-collapse";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   271  			arm,psci-suspend-param = <0x40000004>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   272  			entry-latency-us = <702>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   273  			exit-latency-us = <915>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   274  			min-residency-us = <4001>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   275  			local-timer-stop;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   276  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   277  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   278  		big_cpu_sleep_0: cpu-sleep-1-0 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   279  			compatible = "arm,idle-state";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   280  			idle-state-name = "gold-power-collapse";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   281  			arm,psci-suspend-param = <0x40000003>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   282  			entry-latency-us = <523>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   283  			exit-latency-us = <1244>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   284  			min-residency-us = <2207>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   285  			local-timer-stop;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   286  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   287  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   288  		big_cpu_sleep_1: cpu-sleep-1-1 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   289  			compatible = "arm,idle-state";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   290  			idle-state-name = "gold-rail-power-collapse";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   291  			arm,psci-suspend-param = <0x40000004>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   292  			entry-latency-us = <526>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   293  			exit-latency-us = <1854>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   294  			min-residency-us = <5555>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   295  			local-timer-stop;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   296  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   297  	};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   298  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   299  	domain-idle-states {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   300  		cluster_sleep_0: cluster-sleep-0 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   301  			compatible = "domain-idle-state";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   302  			arm,psci-suspend-param = <0x41000044>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   303  			entry-latency-us = <2752>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   304  			exit-latency-us = <3048>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   305  			min-residency-us = <6118>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   306  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   307  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   308  		cluster_sleep_1: cluster-sleep-1 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   309  			compatible = "domain-idle-state";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   310  			arm,psci-suspend-param = <0x41001344>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   311  			entry-latency-us = <3263>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   312  			exit-latency-us = <4562>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   313  			min-residency-us = <8467>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   314  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   315  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   316  		cluster_sleep_2: cluster-sleep-2 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   317  			compatible = "domain-idle-state";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   318  			arm,psci-suspend-param = <0x4100b344>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   319  			entry-latency-us = <3638>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   320  			exit-latency-us = <6562>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   321  			min-residency-us = <9826>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   322  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   323  	};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   324  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   325  	memory@80000000 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   326  		device_type = "memory";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   327  		/* We expect the bootloader to fill in the size */
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   328  		reg = <0 0x80000000 0 0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   329  	};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   330  
8c7f9d73de1bdb arch/arm64/boot/dts/qcom/qcs615.dtsi Qingqing Zhou             2024-11-05   331  	firmware {
8c7f9d73de1bdb arch/arm64/boot/dts/qcom/qcs615.dtsi Qingqing Zhou             2024-11-05   332  		scm {
8c7f9d73de1bdb arch/arm64/boot/dts/qcom/qcs615.dtsi Qingqing Zhou             2024-11-05   333  			compatible = "qcom,scm-qcs615", "qcom,scm";
8c7f9d73de1bdb arch/arm64/boot/dts/qcom/qcs615.dtsi Qingqing Zhou             2024-11-05   334  			qcom,dload-mode = <&tcsr 0x13000>;
8c7f9d73de1bdb arch/arm64/boot/dts/qcom/qcs615.dtsi Qingqing Zhou             2024-11-05   335  		};
8c7f9d73de1bdb arch/arm64/boot/dts/qcom/qcs615.dtsi Qingqing Zhou             2024-11-05   336  	};
8c7f9d73de1bdb arch/arm64/boot/dts/qcom/qcs615.dtsi Qingqing Zhou             2024-11-05   337  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   338  	camnoc_virt: interconnect-0 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   339  		compatible = "qcom,qcs615-camnoc-virt";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   340  		#interconnect-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   341  		qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   342  	};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   343  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   344  	ipa_virt: interconnect-1 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   345  		compatible = "qcom,qcs615-ipa-virt";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   346  		#interconnect-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   347  		qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   348  	};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   349  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   350  	mc_virt: interconnect-2 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   351  		compatible = "qcom,qcs615-mc-virt";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   352  		#interconnect-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   353  		qcom,bcm-voters = <&apps_bcm_voter>;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   354  	};
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   355  
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   356  	smp2p-adsp {
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   357  		compatible = "qcom,smp2p";
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   358  		qcom,smem = <443>, <429>;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   359  		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   360  		/* On this platform, bit 26 (normally SLPI) is repurposed for ADSP */
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   361  		mboxes = <&apss_shared 26>;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   362  
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   363  		qcom,local-pid = <0>;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   364  		qcom,remote-pid = <2>;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   365  
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   366  		adsp_smp2p_out: master-kernel {
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   367  			qcom,entry-name = "master-kernel";
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   368  			#qcom,smem-state-cells = <1>;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   369  		};
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   370  
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   371  		adsp_smp2p_in: slave-kernel {
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   372  			qcom,entry-name = "slave-kernel";
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   373  			interrupt-controller;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   374  			#interrupt-cells = <2>;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   375  		};
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   376  	};
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   377  
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   378  	smp2p-cdsp {
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   379  		compatible = "qcom,smp2p";
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   380  		qcom,smem = <94>, <432>;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   381  		interrupts = <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   382  		mboxes = <&apss_shared 6>;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   383  
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   384  		qcom,local-pid = <0>;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   385  		qcom,remote-pid = <5>;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   386  
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   387  		cdsp_smp2p_out: master-kernel {
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   388  			qcom,entry-name = "master-kernel";
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   389  			#qcom,smem-state-cells = <1>;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   390  		};
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   391  
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   392  		cdsp_smp2p_in: slave-kernel {
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   393  			qcom,entry-name = "slave-kernel";
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   394  			interrupt-controller;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   395  			#interrupt-cells = <2>;
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   396  		};
bf2a6a7765412d arch/arm64/boot/dts/qcom/qcs615.dtsi Kyle Deng                 2025-05-26   397  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   398  	};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   399  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   400  	qup_opp_table: opp-table-qup {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   401  		compatible = "operating-points-v2";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   402  		opp-shared;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   403  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   404  		opp-75000000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   405  			opp-hz = /bits/ 64 <75000000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   406  			required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   407  		};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   408  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   409  		opp-100000000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   410  			opp-hz = /bits/ 64 <100000000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   411  			required-opps = <&rpmhpd_opp_svs>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   412  		};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   413  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   414  		opp-128000000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   415  			opp-hz = /bits/ 64 <128000000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   416  			required-opps = <&rpmhpd_opp_nom>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   417  		};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   418  	};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   419  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   420  	psci {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   421  		compatible = "arm,psci-1.0";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   422  		method = "smc";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   423  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   424  		cpu_pd0: power-domain-cpu0 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   425  			#power-domain-cells = <0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   426  			power-domains = <&cluster_pd>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   427  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   428  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   429  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   430  		cpu_pd1: power-domain-cpu1 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   431  			#power-domain-cells = <0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   432  			power-domains = <&cluster_pd>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   433  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   434  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   435  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   436  		cpu_pd2: power-domain-cpu2 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   437  			#power-domain-cells = <0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   438  			power-domains = <&cluster_pd>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   439  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   440  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   441  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   442  		cpu_pd3: power-domain-cpu3 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   443  			#power-domain-cells = <0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   444  			power-domains = <&cluster_pd>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   445  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   446  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   447  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   448  		cpu_pd4: power-domain-cpu4 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   449  			#power-domain-cells = <0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   450  			power-domains = <&cluster_pd>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   451  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   452  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   453  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   454  		cpu_pd5: power-domain-cpu5 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   455  			#power-domain-cells = <0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   456  			power-domains = <&cluster_pd>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   457  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   458  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   459  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   460  		cpu_pd6: power-domain-cpu6 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   461  			#power-domain-cells = <0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   462  			power-domains = <&cluster_pd>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   463  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   464  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   465  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   466  		cpu_pd7: power-domain-cpu7 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   467  			#power-domain-cells = <0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   468  			power-domains = <&cluster_pd>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   469  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   470  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   471  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   472  		cluster_pd: power-domain-cluster {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   473  			#power-domain-cells = <0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   474  			domain-idle-states = <&cluster_sleep_0
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   475  					      &cluster_sleep_1
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   476  					      &cluster_sleep_2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   477  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   478  	};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   479  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   480  	reserved-memory {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   481  		#address-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   482  		#size-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   483  		ranges;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   484  
83934b5d6b1a96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-02-21   485  		aop_cmd_db_mem: aop-cmd-db@85f20000 {
83934b5d6b1a96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-02-21   486  			compatible = "qcom,cmd-db";
83934b5d6b1a96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-02-21   487  			reg = <0x0 0x85f20000 0x0 0x20000>;
83934b5d6b1a96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-02-21   488  			no-map;
83934b5d6b1a96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-02-21   489  		};
83934b5d6b1a96 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-02-21   490  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   491  		smem_region: smem@86000000 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   492  			compatible = "qcom,smem";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   493  			reg = <0x0 0x86000000 0x0 0x200000>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   494  			no-map;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   495  			hwlocks = <&tcsr_mutex 3>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   496  		};
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26   497  
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26   498  		rproc_cdsp_mem: rproc-cdsp@93b00000 {
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26   499  			reg = <0x0 0x93b00000 0x0 0x1e00000>;
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26   500  			no-map;
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26   501  		};
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26   502  
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26   503  		rproc_adsp_mem: rproc-adsp@95900000 {
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26   504  			reg = <0x0 0x95900000 0x0 0x1e00000>;
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26   505  			no-map;
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26   506  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   507  	};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   508  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   509  	soc: soc@0 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   510  		compatible = "simple-bus";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   511  		ranges = <0 0 0 0 0x10 0>;
58241be90050e5 arch/arm64/boot/dts/qcom/qcs615.dtsi Qingqing Zhou             2024-11-05   512  		dma-ranges = <0 0 0 0 0x10 0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   513  		#address-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   514  		#size-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   515  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   516  		gcc: clock-controller@100000 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   517  			compatible = "qcom,qcs615-gcc";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   518  			reg = <0 0x00100000 0 0x1f0000>;
be541b843114d5 arch/arm64/boot/dts/qcom/sm6150.dtsi Dmitry Baryshkov          2025-08-16   519  			clocks = <&rpmhcc RPMH_CXO_CLK>,
be541b843114d5 arch/arm64/boot/dts/qcom/sm6150.dtsi Dmitry Baryshkov          2025-08-16   520  				 <&rpmhcc RPMH_CXO_CLK_A>,
be541b843114d5 arch/arm64/boot/dts/qcom/sm6150.dtsi Dmitry Baryshkov          2025-08-16   521  				 <&sleep_clk>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   522  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   523  			#clock-cells = <1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   524  			#reset-cells = <1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   525  			#power-domain-cells = <1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   526  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   527  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   528  		qfprom: efuse@780000 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   529  			compatible = "qcom,qcs615-qfprom", "qcom,qfprom";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   530  			reg = <0x0 0x00780000 0x0 0x7000>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   531  			#address-cells = <1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   532  			#size-cells = <1>;
4b2769c7d7ce47 arch/arm64/boot/dts/qcom/qcs615.dtsi Krishna Kurapati          2024-11-21   533  
4b2769c7d7ce47 arch/arm64/boot/dts/qcom/qcs615.dtsi Krishna Kurapati          2024-11-21   534  			qusb2_hstx_trim: hstx-trim@1f8 {
4b2769c7d7ce47 arch/arm64/boot/dts/qcom/qcs615.dtsi Krishna Kurapati          2024-11-21   535  				reg = <0x1fb 0x1>;
4b2769c7d7ce47 arch/arm64/boot/dts/qcom/qcs615.dtsi Krishna Kurapati          2024-11-21   536  				bits = <1 4>;
4b2769c7d7ce47 arch/arm64/boot/dts/qcom/qcs615.dtsi Krishna Kurapati          2024-11-21   537  			};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   538  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   539  
a3daa844ed8104 arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-02-28   540  		rng@793000 {
a3daa844ed8104 arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-02-28   541  			compatible = "qcom,qcs615-trng", "qcom,trng";
a3daa844ed8104 arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-02-28   542  			reg = <0x0 0x00793000 0x0 0x1000>;
a3daa844ed8104 arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-02-28   543  		};
a3daa844ed8104 arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-02-28   544  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   545  		sdhc_1: mmc@7c4000 {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   546  			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   547  			reg = <0x0 0x007c4000 0x0 0x1000>,
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   548  			      <0x0 0x007c5000 0x0 0x1000>,
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   549  			      <0x0 0x007c8000 0x0 0x8000>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   550  			reg-names = "hc",
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   551  				    "cqhci",
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   552  				    "ice";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   553  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   554  			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   555  				     <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   556  			interrupt-names = "hc_irq",
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   557  					  "pwr_irq";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   558  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   559  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   560  				 <&gcc GCC_SDCC1_APPS_CLK>,
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   561  				 <&rpmhcc RPMH_CXO_CLK>,
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   562  				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   563  			clock-names = "iface",
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   564  				      "core",
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   565  				      "xo",
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   566  				      "ice";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   567  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   568  			resets = <&gcc GCC_SDCC1_BCR>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   569  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   570  			power-domains = <&rpmhpd RPMHPD_CX>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   571  			operating-points-v2 = <&sdhc1_opp_table>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   572  			iommus = <&apps_smmu 0x02c0 0x0>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   573  			interconnects = <&aggre1_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   574  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   575  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   576  					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   577  			interconnect-names = "sdhc-ddr",
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   578  					     "cpu-sdhc";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   579  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   580  			qcom,dll-config = <0x000f642c>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   581  			qcom,ddr-config = <0x80040868>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   582  			supports-cqe;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   583  			dma-coherent;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   584  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   585  			status = "disabled";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   586  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   587  			sdhc1_opp_table: opp-table {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   588  				compatible = "operating-points-v2";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   589  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   590  				opp-50000000 {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   591  					opp-hz = /bits/ 64 <50000000>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   592  					required-opps = <&rpmhpd_opp_low_svs>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   593  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   594  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   595  				opp-100000000 {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   596  					opp-hz = /bits/ 64 <100000000>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   597  					required-opps = <&rpmhpd_opp_svs>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   598  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   599  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   600  				opp-200000000 {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   601  					opp-hz = /bits/ 64 <200000000>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   602  					required-opps = <&rpmhpd_opp_svs_l1>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   603  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   604  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   605  				opp-384000000 {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   606  					opp-hz = /bits/ 64 <384000000>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   607  					required-opps = <&rpmhpd_opp_nom>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   608  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   609  			};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   610  		};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17   611  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   612  		gpi_dma0: dma-controller@800000  {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   613  			compatible = "qcom,qcs615-gpi-dma", "qcom,sdm845-gpi-dma";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   614  			reg = <0x0 0x800000 0x0 0x60000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   615  			#dma-cells = <3>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   616  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   617  				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   618  				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   619  				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   620  				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   621  				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   622  				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   623  				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   624  			dma-channels = <8>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   625  			dma-channel-mask = <0xf>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   626  			iommus = <&apps_smmu 0xd6 0x0>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   627  			status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   628  		};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   629  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   630  		qupv3_id_0: geniqup@8c0000 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   631  			compatible = "qcom,geni-se-qup";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   632  			reg = <0x0 0x008c0000 0x0 0x6000>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   633  			ranges;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   634  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   635  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   636  			clock-names = "m-ahb",
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   637  				      "s-ahb";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   638  			iommus = <&apps_smmu 0xc3 0x0>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   639  			#address-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   640  			#size-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   641  			status = "disabled";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   642  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   643  			uart0: serial@880000 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   644  				compatible = "qcom,geni-debug-uart";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   645  				reg = <0x0 0x00880000 0x0 0x4000>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   646  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   647  				clock-names = "se";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   648  				pinctrl-0 = <&qup_uart0_tx>, <&qup_uart0_rx>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   649  				pinctrl-names = "default";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04   650  				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   651  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   652  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   653  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   654  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   655  				interconnect-names = "qup-core",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   656  						     "qup-config";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   657  				power-domains = <&rpmhpd RPMHPD_CX>;
6a5e9b9738a322 arch/arm64/boot/dts/qcom/sm6150.dtsi Viken Dadhaniya           2025-06-30   658  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   659  				status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   660  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   661  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   662  			i2c1: i2c@884000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   663  				compatible = "qcom,geni-i2c";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   664  				reg = <0x0 0x884000 0x0 0x4000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   665  				#address-cells = <1>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   666  				#size-cells = <0>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   667  				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   668  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   669  				clock-names = "se";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   670  				pinctrl-0 = <&qup_i2c1_data_clk>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   671  				pinctrl-names = "default";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   672  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   673  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   674  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   675  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   676  						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   677  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   678  				interconnect-names = "qup-core",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   679  						     "qup-config",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   680  						     "qup-memory";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   681  				power-domains = <&rpmhpd RPMHPD_CX>;
6a5e9b9738a322 arch/arm64/boot/dts/qcom/sm6150.dtsi Viken Dadhaniya           2025-06-30   682  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   683  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   684  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   685  				dma-names = "tx",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   686  					    "rx";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   687  				status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   688  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   689  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   690  			i2c2: i2c@888000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   691  				compatible = "qcom,geni-i2c";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   692  				reg = <0x0 0x888000 0x0 0x4000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   693  				#address-cells = <1>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   694  				#size-cells = <0>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   695  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   696  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   697  				clock-names = "se";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   698  				pinctrl-0 = <&qup_i2c2_data_clk>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   699  				pinctrl-names = "default";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   700  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   701  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   702  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   703  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   704  						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   705  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   706  				interconnect-names = "qup-core",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   707  						     "qup-config",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   708  						     "qup-memory";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   709  				power-domains = <&rpmhpd RPMHPD_CX>;
6a5e9b9738a322 arch/arm64/boot/dts/qcom/sm6150.dtsi Viken Dadhaniya           2025-06-30   710  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   711  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   712  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   713  				dma-names = "tx",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   714  					    "rx";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   715  				status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   716  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   717  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   718  			spi2: spi@888000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   719  				compatible = "qcom,geni-spi";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   720  				reg = <0x0 0x00888000 0x0 0x4000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   721  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   722  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   723  				clock-names = "se";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   724  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   725  				pinctrl-names = "default";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   726  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   727  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   728  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   729  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   730  				interconnect-names = "qup-core",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   731  						     "qup-config";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   732  				power-domains = <&rpmhpd RPMHPD_CX>;
6a5e9b9738a322 arch/arm64/boot/dts/qcom/sm6150.dtsi Viken Dadhaniya           2025-06-30   733  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   734  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   735  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   736  				dma-names = "tx",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   737  					    "rx";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   738  				#address-cells = <1>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   739  				#size-cells = <0>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   740  				status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   741  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   742  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   743  			uart2: serial@888000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   744  				compatible = "qcom,geni-uart";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   745  				reg = <0x0 0x00888000 0x0 0x4000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   746  				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   747  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   748  				clock-names = "se";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   749  				pinctrl-0 = <&qup_uart2_cts>, <&qup_uart2_rts>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   750  					    <&qup_uart2_tx>, <&qup_uart2_rx>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   751  				pinctrl-names = "default";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   752  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   753  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   754  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   755  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   756  				interconnect-names = "qup-core",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   757  						     "qup-config";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   758  				power-domains = <&rpmhpd RPMHPD_CX>;
6a5e9b9738a322 arch/arm64/boot/dts/qcom/sm6150.dtsi Viken Dadhaniya           2025-06-30   759  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   760  				status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   761  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   762  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   763  			i2c3: i2c@88c000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   764  				compatible = "qcom,geni-i2c";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   765  				reg = <0x0 0x88c000 0x0 0x4000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   766  				#address-cells = <1>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   767  				#size-cells = <0>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   768  				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   769  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   770  				clock-names = "se";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   771  				pinctrl-0 = <&qup_i2c3_data_clk>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   772  				pinctrl-names = "default";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   773  				interconnects = <&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   774  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   775  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   776  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   777  						<&aggre1_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   778  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   779  				interconnect-names = "qup-core",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   780  						     "qup-config",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   781  						     "qup-memory";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   782  				power-domains = <&rpmhpd RPMHPD_CX>;
6a5e9b9738a322 arch/arm64/boot/dts/qcom/sm6150.dtsi Viken Dadhaniya           2025-06-30   783  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   784  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   785  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   786  				dma-names = "tx",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   787  					    "rx";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   788  				status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   789  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   790  		};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   791  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   792  		gpi_dma1: dma-controller@a00000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   793  			compatible = "qcom,qcs615-gpi-dma", "qcom,sdm845-gpi-dma";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   794  			reg = <0x0 0xa00000 0x0 0x60000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   795  			#dma-cells = <3>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   796  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   797  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   798  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   799  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   800  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   801  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   802  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   803  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   804  			dma-channels = <8>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   805  			dma-channel-mask = <0xf>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   806  			iommus = <&apps_smmu 0x376 0x0>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   807  			status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   808  		};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   809  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   810  		qupv3_id_1: geniqup@ac0000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   811  			compatible = "qcom,geni-se-qup";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   812  			reg = <0x0 0xac0000 0x0 0x2000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   813  			ranges;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   814  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   815  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   816  			clock-names = "m-ahb",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   817  				      "s-ahb";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   818  			iommus = <&apps_smmu 0x363 0x0>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   819  			#address-cells = <2>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   820  			#size-cells = <2>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   821  			status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   822  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   823  			i2c4: i2c@a80000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   824  				compatible = "qcom,geni-i2c";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   825  				reg = <0x0 0xa80000 0x0 0x4000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   826  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   827  				clock-names = "se";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   828  				pinctrl-0 = <&qup_i2c4_data_clk>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   829  				pinctrl-names = "default";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   830  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   831  				#address-cells = <1>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   832  				#size-cells = <0>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   833  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   834  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   835  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   836  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   837  						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   838  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   839  				interconnect-names = "qup-core",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   840  						     "qup-config",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   841  						     "qup-memory";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   842  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   843  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   844  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   845  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   846  				dma-names = "tx",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   847  					    "rx";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   848  				status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   849  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   850  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   851  			spi4: spi@a80000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   852  				compatible = "qcom,geni-spi";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   853  				reg = <0x0 0xa80000 0x0 0x4000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   854  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   855  				clock-names = "se";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   856  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   857  				pinctrl-names = "default";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   858  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   859  				#address-cells = <1>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   860  				#size-cells = <0>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   861  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   862  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   863  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   864  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   865  				interconnect-names = "qup-core",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   866  						     "qup-config";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   867  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   868  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   869  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   870  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   871  				dma-names = "tx",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   872  					    "rx";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   873  				status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   874  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   875  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   876  			uart4: serial@a80000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   877  				compatible = "qcom,geni-uart";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   878  				reg = <0x0 0xa80000 0x0 0x4000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   879  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   880  				clock-names = "se";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   881  				pinctrl-0 = <&qup_uart4_cts>, <&qup_uart4_rts>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   882  					    <&qup_uart4_tx>, <&qup_uart4_rx>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   883  				pinctrl-names = "default";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   884  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   885  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   886  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   887  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   888  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   889  				interconnect-names = "qup-core",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   890  						     "qup-config";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   891  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   892  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   893  				status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   894  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   895  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   896  			i2c5: i2c@a84000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   897  				compatible = "qcom,geni-i2c";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   898  				reg = <0x0 0xa84000 0x0 0x4000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   899  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   900  				clock-names = "se";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   901  				pinctrl-0 = <&qup_i2c5_data_clk>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   902  				pinctrl-names = "default";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   903  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   904  				#address-cells = <1>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   905  				#size-cells = <0>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   906  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   907  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   908  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   909  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   910  						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   911  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   912  				interconnect-names = "qup-core",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   913  						     "qup-config",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   914  						     "qup-memory";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   915  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   916  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   917  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   918  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   919  				dma-names = "tx",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   920  					    "rx";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   921  				status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   922  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   923  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   924  			i2c6: i2c@a88000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   925  				compatible = "qcom,geni-i2c";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   926  				reg = <0x0 0xa88000 0x0 0x4000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   927  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   928  				clock-names = "se";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   929  				pinctrl-0 = <&qup_i2c6_data_clk>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   930  				pinctrl-names = "default";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   931  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   932  				#address-cells = <1>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   933  				#size-cells = <0>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   934  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   935  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   936  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   937  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   938  						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   939  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   940  				interconnect-names = "qup-core",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   941  						     "qup-config",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   942  						     "qup-memory";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   943  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   944  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   945  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   946  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   947  				dma-names = "tx",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   948  					    "rx";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   949  				status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   950  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   951  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   952  			spi6: spi@a88000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   953  				compatible = "qcom,geni-spi";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   954  				reg = <0x0 0xa88000 0x0 0x4000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   955  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   956  				clock-names = "se";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   957  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   958  				pinctrl-names = "default";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   959  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   960  				#address-cells = <1>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   961  				#size-cells = <0>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   962  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   963  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   964  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   965  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   966  				interconnect-names = "qup-core",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   967  						     "qup-config";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   968  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   969  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   970  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   971  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   972  				dma-names = "tx",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   973  					    "rx";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   974  				status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   975  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   976  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   977  			uart6: serial@a88000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   978  				compatible = "qcom,geni-uart";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   979  				reg = <0x0 0xa88000 0x0 0x4000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   980  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   981  				clock-names = "se";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   982  				pinctrl-0 = <&qup_uart6_cts>, <&qup_uart6_rts>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   983  					    <&qup_uart6_tx>, <&qup_uart6_rx>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   984  				pinctrl-names = "default";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   985  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   986  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   987  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   988  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   989  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   990  				interconnect-names = "qup-core",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   991  						     "qup-config";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   992  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   993  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   994  				status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   995  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   996  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   997  			i2c7: i2c@a8c000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   998  				compatible = "qcom,geni-i2c";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15   999  				reg = <0x0 0xa8c000 0x0 0x4000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1000  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1001  				clock-names = "se";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1002  				pinctrl-0 = <&qup_i2c7_data_clk>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1003  				pinctrl-names = "default";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1004  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1005  				#address-cells = <1>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1006  				#size-cells = <0>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1007  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1008  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1009  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1010  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1011  						<&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1012  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1013  				interconnect-names = "qup-core",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1014  						     "qup-config",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1015  						     "qup-memory";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1016  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1017  				required-opps = <&rpmhpd_opp_low_svs>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1018  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1019  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1020  				dma-names = "tx",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1021  					    "rx";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1022  				status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1023  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1024  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1025  			spi7: spi@a8c000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1026  				compatible = "qcom,geni-spi";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1027  				reg = <0x0 0xa8c000 0x0 0x4000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1028  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1029  				clock-names = "se";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1030  				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1031  				pinctrl-names = "default";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1032  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1033  				#address-cells = <1>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1034  				#size-cells = <0>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1035  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1036  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1037  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1038  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1039  				interconnect-names = "qup-core",
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1040  						     "qup-config";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1041  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1042  				operating-points-v2 = <&qup_opp_table>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1043  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1044  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1045  				dma-names = "tx",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1046  					    "rx";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1047  				status = "disabled";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1048  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1049  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1050  			uart7: serial@a8c000 {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1051  				compatible = "qcom,geni-uart";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1052  				reg = <0x0 0xa8c000 0x0 0x4000>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1053  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1054  				clock-names = "se";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1055  				pinctrl-0 = <&qup_uart7_cts>, <&qup_uart7_rts>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1056  					    <&qup_uart7_tx>, <&qup_uart7_rx>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1057  				pinctrl-names = "default";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1058  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1059  				interconnects = <&aggre1_noc MASTER_BLSP_1 QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1060  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1061  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1062  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1063  				interconnect-names = "qup-core",
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1064  						     "qup-config";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1065  				power-domains = <&rpmhpd RPMHPD_CX>;
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1066  				operating-points-v2 = <&qup_opp_table>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1067  				status = "disabled";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1068  			};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1069  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1070  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1071  		config_noc: interconnect@1500000 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1072  			reg = <0x0 0x01500000 0x0 0x5080>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1073  			compatible = "qcom,qcs615-config-noc";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1074  			#interconnect-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1075  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1076  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1077  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1078  		system_noc: interconnect@1620000 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1079  			reg = <0x0 0x01620000 0x0 0x1f300>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1080  			compatible = "qcom,qcs615-system-noc";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1081  			#interconnect-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1082  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1083  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1084  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1085  		aggre1_noc: interconnect@1700000 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1086  			reg = <0x0 0x01700000 0x0 0x3f200>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1087  			compatible = "qcom,qcs615-aggre1-noc";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1088  			#interconnect-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1089  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1090  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1091  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1092  		mmss_noc: interconnect@1740000 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1093  			reg = <0x0 0x01740000 0x0 0x1c100>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1094  			compatible = "qcom,qcs615-mmss-noc";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1095  			#interconnect-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1096  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1097  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1098  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1099  		pcie: pcie@1c08000 {
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1100  			device_type = "pci";
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1101  			compatible = "qcom,pcie-qcs615", "qcom,pcie-sm8150";
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1102  			reg = <0x0 0x01c08000 0x0 0x3000>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1103  			      <0x0 0x40000000 0x0 0xf1d>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1104  			      <0x0 0x40000f20 0x0 0xa8>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1105  			      <0x0 0x40001000 0x0 0x1000>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1106  			      <0x0 0x40100000 0x0 0x100000>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1107  			      <0x0 0x01c0b000 0x0 0x1000>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1108  			reg-names = "parf",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1109  				    "dbi",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1110  				    "elbi",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1111  				    "atu",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1112  				    "config",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1113  				    "mhi";
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1114  			#address-cells = <3>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1115  			#size-cells = <2>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1116  			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1117  				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1118  			bus-range = <0x00 0xff>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1119  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1120  			dma-coherent;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1121  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1122  			linux,pci-domain = <0>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1123  			num-lanes = <1>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1124  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1125  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1126  				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1127  				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1128  				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1129  				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1130  				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1131  				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1132  				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1133  				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1134  			interrupt-names = "msi0",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1135  					  "msi1",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1136  					  "msi2",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1137  					  "msi3",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1138  					  "msi4",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1139  					  "msi5",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1140  					  "msi6",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1141  					  "msi7",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1142  					  "global";
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1143  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1144  			#interrupt-cells = <1>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1145  			interrupt-map-mask = <0 0 0 0x7>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1146  			interrupt-map = <0 0 0 1 &intc GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1147  					<0 0 0 2 &intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1148  					<0 0 0 3 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1149  					<0 0 0 4 &intc GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1150  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1151  			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1152  				 <&gcc GCC_PCIE_0_AUX_CLK>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1153  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1154  				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1155  				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1156  				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1157  			clock-names = "pipe",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1158  				      "aux",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1159  				      "cfg",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1160  				      "bus_master",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1161  				      "bus_slave",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1162  				      "slave_q2a";
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1163  			assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1164  			assigned-clock-rates = <19200000>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1165  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1166  			interconnects = <&aggre1_noc MASTER_PCIE QCOM_ICC_TAG_ALWAYS
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1167  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1168  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1169  					 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1170  			interconnect-names = "pcie-mem", "cpu-pcie";
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1171  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1172  			iommu-map = <0x0 &apps_smmu 0x400 0x1>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1173  				    <0x100 &apps_smmu 0x401 0x1>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1174  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1175  			resets = <&gcc GCC_PCIE_0_BCR>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1176  			reset-names = "pci";
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1177  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1178  			power-domains = <&gcc PCIE_0_GDSC>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1179  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1180  			phys = <&pcie_phy>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1181  			phy-names = "pciephy";
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1182  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1183  			max-link-speed = <2>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1184  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1185  			operating-points-v2 = <&pcie_opp_table>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1186  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1187  			status = "disabled";
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1188  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1189  			pcie_opp_table: opp-table {
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1190  				compatible = "operating-points-v2";
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1191  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1192  				/* GEN 1 x1 */
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1193  				opp-2500000 {
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1194  					opp-hz = /bits/ 64 <2500000>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1195  					required-opps = <&rpmhpd_opp_low_svs>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1196  					opp-peak-kBps = <250000 1>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1197  				};
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1198  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1199  				/* GEN 2 x1 */
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1200  				opp-5000000 {
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1201  					opp-hz = /bits/ 64 <5000000>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1202  					required-opps = <&rpmhpd_opp_low_svs>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1203  					opp-peak-kBps = <500000 1>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1204  				};
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1205  			};
e13555a3e17b57 arch/arm64/boot/dts/qcom/sm6150.dtsi Yu Zhang(Yuriy            2025-07-27  1206) 
e13555a3e17b57 arch/arm64/boot/dts/qcom/sm6150.dtsi Yu Zhang(Yuriy            2025-07-27  1207) 			pcie_port0: pcie@0 {
e13555a3e17b57 arch/arm64/boot/dts/qcom/sm6150.dtsi Yu Zhang(Yuriy            2025-07-27  1208) 				device_type = "pci";
e13555a3e17b57 arch/arm64/boot/dts/qcom/sm6150.dtsi Yu Zhang(Yuriy            2025-07-27  1209) 				reg = <0x0 0x0 0x0 0x0 0x0>;
e13555a3e17b57 arch/arm64/boot/dts/qcom/sm6150.dtsi Yu Zhang(Yuriy            2025-07-27  1210) 				#address-cells = <3>;
e13555a3e17b57 arch/arm64/boot/dts/qcom/sm6150.dtsi Yu Zhang(Yuriy            2025-07-27  1211) 				#size-cells = <2>;
e13555a3e17b57 arch/arm64/boot/dts/qcom/sm6150.dtsi Yu Zhang(Yuriy            2025-07-27  1212) 				ranges;
e13555a3e17b57 arch/arm64/boot/dts/qcom/sm6150.dtsi Yu Zhang(Yuriy            2025-07-27  1213) 				bus-range = <0x01 0xff>;
e13555a3e17b57 arch/arm64/boot/dts/qcom/sm6150.dtsi Yu Zhang(Yuriy            2025-07-27  1214) 			};
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1215  		};
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1216  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1217  		pcie_phy: phy@1c0e000 {
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1218  			compatible = "qcom,qcs615-qmp-gen3x1-pcie-phy";
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1219  			reg = <0x0 0x01c0e000 0x0 0x1000>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1220  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1221  			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1222  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1223  				 <&gcc GCC_PCIE_0_CLKREF_CLK>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1224  				 <&gcc GCC_PCIE0_PHY_REFGEN_CLK>,
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1225  				 <&gcc GCC_PCIE_0_PIPE_CLK>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1226  			clock-names = "aux",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1227  				      "cfg_ahb",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1228  				      "ref",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1229  				      "refgen",
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1230  				      "pipe";
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1231  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1232  			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1233  			reset-names = "phy";
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1234  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1235  			assigned-clocks = <&gcc GCC_PCIE0_PHY_REFGEN_CLK>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1236  			assigned-clock-rates = <100000000>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1237  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1238  			#clock-cells = <0>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1239  			clock-output-names = "pcie_0_pipe_clk";
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1240  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1241  			#phy-cells = <0>;
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1242  
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1243  			status = "disabled";
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1244  		};
718cc7542a000e arch/arm64/boot/dts/qcom/sm6150.dtsi Krishna chaitanya chundru 2025-07-25  1245  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1246  		ufs_mem_hc: ufshc@1d84000 {
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1247  			compatible = "qcom,qcs615-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1248  			reg = <0x0 0x01d84000 0x0 0x3000>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1249  			      <0x0 0x01d90000 0x0 0x8000>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1250  			reg-names = "std",
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1251  				    "ice";
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1252  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1253  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1254  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1255  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1256  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1257  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1258  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1259  				 <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1260  				 <&rpmhcc RPMH_CXO_CLK>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1261  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1262  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1263  			clock-names = "core_clk",
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1264  				      "bus_aggr_clk",
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1265  				      "iface_clk",
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1266  				      "core_clk_unipro",
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1267  				      "ref_clk",
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1268  				      "tx_lane0_sync_clk",
ea172f61f4fdb1 arch/arm64/boot/dts/qcom/qcs615.dtsi Konrad Dybcio             2025-03-27  1269  				      "rx_lane0_sync_clk",
ea172f61f4fdb1 arch/arm64/boot/dts/qcom/qcs615.dtsi Konrad Dybcio             2025-03-27  1270  				      "ice_core_clk";
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1271  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1272  			resets = <&gcc GCC_UFS_PHY_BCR>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1273  			reset-names = "rst";
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1274  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1275  			operating-points-v2 = <&ufs_opp_table>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1276  			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1277  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1278  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1279  					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1280  			interconnect-names = "ufs-ddr",
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1281  					     "cpu-ufs";
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1282  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1283  			power-domains = <&gcc UFS_PHY_GDSC>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1284  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1285  			iommus = <&apps_smmu 0x300 0x0>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1286  			dma-coherent;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1287  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1288  			lanes-per-direction = <1>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1289  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1290  			phys = <&ufs_mem_phy>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1291  			phy-names = "ufsphy";
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1292  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1293  			#reset-cells = <1>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1294  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1295  			status = "disabled";
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1296  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1297  			ufs_opp_table: opp-table {
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1298  				compatible = "operating-points-v2";
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1299  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1300  				opp-50000000 {
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1301  					opp-hz = /bits/ 64 <50000000>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1302  						 /bits/ 64 <0>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1303  						 /bits/ 64 <0>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1304  						 /bits/ 64 <37500000>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1305  						 /bits/ 64 <0>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1306  						 /bits/ 64 <0>,
ea172f61f4fdb1 arch/arm64/boot/dts/qcom/qcs615.dtsi Konrad Dybcio             2025-03-27  1307  						 /bits/ 64 <0>,
ea172f61f4fdb1 arch/arm64/boot/dts/qcom/qcs615.dtsi Konrad Dybcio             2025-03-27  1308  						 /bits/ 64 <75000000>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1309  					required-opps = <&rpmhpd_opp_low_svs>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1310  				};
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1311  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1312  				opp-100000000 {
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1313  					opp-hz = /bits/ 64 <100000000>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1314  						 /bits/ 64 <0>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1315  						 /bits/ 64 <0>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1316  						 /bits/ 64 <75000000>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1317  						 /bits/ 64 <0>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1318  						 /bits/ 64 <0>,
ea172f61f4fdb1 arch/arm64/boot/dts/qcom/qcs615.dtsi Konrad Dybcio             2025-03-27  1319  						 /bits/ 64 <0>,
ea172f61f4fdb1 arch/arm64/boot/dts/qcom/qcs615.dtsi Konrad Dybcio             2025-03-27  1320  						 /bits/ 64 <150000000>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1321  					required-opps = <&rpmhpd_opp_svs>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1322  				};
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1323  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1324  				opp-200000000 {
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1325  					opp-hz = /bits/ 64 <200000000>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1326  						 /bits/ 64 <0>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1327  						 /bits/ 64 <0>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1328  						 /bits/ 64 <150000000>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1329  						 /bits/ 64 <0>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1330  						 /bits/ 64 <0>,
ea172f61f4fdb1 arch/arm64/boot/dts/qcom/qcs615.dtsi Konrad Dybcio             2025-03-27  1331  						 /bits/ 64 <0>,
ea172f61f4fdb1 arch/arm64/boot/dts/qcom/qcs615.dtsi Konrad Dybcio             2025-03-27  1332  						 /bits/ 64 <300000000>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1333  					required-opps = <&rpmhpd_opp_nom>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1334  				};
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1335  			};
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1336  		};
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1337  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1338  		ufs_mem_phy: phy@1d87000 {
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1339  			compatible = "qcom,qcs615-qmp-ufs-phy", "qcom,sm6115-qmp-ufs-phy";
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1340  			reg = <0x0 0x01d87000 0x0 0xe00>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1341  			clocks = <&rpmhcc RPMH_CXO_CLK>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1342  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1343  				 <&gcc GCC_UFS_MEM_CLKREF_CLK>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1344  			clock-names = "ref",
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1345  				      "ref_aux",
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1346  				      "qref";
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1347  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1348  			power-domains = <&gcc UFS_PHY_GDSC>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1349  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1350  			resets = <&ufs_mem_hc 0>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1351  			reset-names = "ufsphy";
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1352  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1353  			#clock-cells = <1>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1354  			#phy-cells = <0>;
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1355  
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1356  			status = "disabled";
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1357  		};
a6a9d10e796957 arch/arm64/boot/dts/qcom/qcs615.dtsi Sayali Lokhande           2024-12-16  1358  
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1359  		cryptobam: dma-controller@1dc4000 {
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1360  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1361  			reg = <0x0 0x01dc4000 0x0 0x24000>;
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1362  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1363  			#dma-cells = <1>;
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1364  			qcom,ee = <0>;
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1365  			qcom,controlled-remotely;
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1366  			num-channels = <16>;
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1367  			qcom,num-ees = <4>;
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1368  			iommus = <&apps_smmu 0x0104 0x0011>;
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1369  		};
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1370  
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1371  		crypto: crypto@1dfa000 {
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1372  			compatible = "qcom,qcs615-qce", "qcom,sm8150-qce", "qcom,qce";
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1373  			reg = <0x0 0x01dfa000 0x0 0x6000>;
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1374  			dmas = <&cryptobam 4>, <&cryptobam 5>;
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1375  			dma-names = "rx", "tx";
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1376  			iommus = <&apps_smmu 0x0104 0x0011>;
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1377  			interconnects = <&aggre1_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1378  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1379  			interconnect-names = "memory";
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1380  		};
4153eb38970a9f arch/arm64/boot/dts/qcom/qcs615.dtsi Abhinaba Rakshit          2025-03-18  1381  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1382  		tcsr_mutex: hwlock@1f40000 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1383  			compatible = "qcom,tcsr-mutex";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1384  			reg = <0x0 0x01f40000 0x0 0x20000>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1385  			#hwlock-cells = <1>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1386  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1387  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1388  		tcsr: syscon@1fc0000 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1389  			compatible = "qcom,qcs615-tcsr", "syscon";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1390  			reg = <0x0 0x01fc0000 0x0 0x30000>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1391  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1392  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1393  		tlmm: pinctrl@3100000 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1394  			compatible = "qcom,qcs615-tlmm";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1395  			reg = <0x0 0x03100000 0x0 0x300000>,
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1396  			      <0x0 0x03500000 0x0 0x300000>,
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1397  			      <0x0 0x03d00000 0x0 0x300000>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1398  			reg-names = "east",
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1399  				    "west",
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1400  				    "south";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1401  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
80c82827327d80 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-19  1402  			gpio-ranges = <&tlmm 0 0 124>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1403  			gpio-controller;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1404  			#gpio-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1405  			interrupt-controller;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1406  			#interrupt-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1407  			wakeup-parent = <&pdc>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1408  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1409  			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1410  				pins = "gpio4", "gpio5";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1411  				function = "qup0";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1412  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1413  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1414  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1415  			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1416  				pins = "gpio0", "gpio1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1417  				function = "qup0";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1418  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1419  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1420  			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1421  				pins = "gpio18", "gpio19";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1422  				function = "qup0";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1423  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1424  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1425  			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1426  				pins = "gpio20", "gpio21";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1427  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1428  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1429  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1430  			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1431  				pins = "gpio14", "gpio15";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1432  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1433  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1434  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1435  			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1436  				pins = "gpio6", "gpio7";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1437  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1438  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1439  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1440  			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1441  				pins = "gpio10", "gpio11";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1442  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1443  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1444  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1445  			qup_spi2_data_clk: qup-spi2-data-clk-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1446  				pins = "gpio0", "gpio1", "gpio2";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1447  				function = "qup0";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1448  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1449  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1450  			qup_spi2_cs: qup-spi2-cs-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1451  				pins = "gpio3";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1452  				function = "qup0";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1453  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1454  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1455  			qup_spi2_cs_gpio: qup-spi2-cs-gpio-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1456  				pins = "gpio3";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1457  				function = "gpio";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1458  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1459  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1460  			qup_spi4_data_clk: qup-spi4-data-clk-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1461  				pins = "gpio20", "gpio21", "gpio22";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1462  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1463  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1464  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1465  			qup_spi4_cs: qup-spi4-cs-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1466  				pins = "gpio23";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1467  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1468  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1469  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1470  			qup_spi4_cs_gpio: qup-spi4-cs-gpio-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1471  				pins = "gpio23";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1472  				function = "gpio";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1473  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1474  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1475  			qup_spi6_data_clk: qup-spi6-data-clk-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1476  				pins = "gpio6", "gpio7", "gpio8";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1477  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1478  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1479  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1480  			qup_spi6_cs: qup-spi6-cs-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1481  				pins = "gpio9";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1482  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1483  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1484  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1485  			qup_spi6_cs_gpio: qup-spi6-cs-gpio-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1486  				pins = "gpio9";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1487  				function = "gpio";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1488  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1489  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1490  			qup_spi7_data_clk: qup-spi7-data-clk-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1491  				pins = "gpio10", "gpio11", "gpio12";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1492  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1493  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1494  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1495  			qup_spi7_cs: qup-spi7-cs-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1496  				pins = "gpio13";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1497  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1498  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1499  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1500  			qup_spi7_cs_gpio: qup-spi7-cs-gpio-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1501  				pins = "gpio13";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1502  				function = "gpio";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1503  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1504  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1505  			qup_uart0_tx: qup-uart0-tx-state {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1506  				pins = "gpio16";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1507  				function = "qup0";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1508  			};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1509  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1510  			qup_uart0_rx: qup-uart0-rx-state {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1511  				pins = "gpio17";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1512  				function = "qup0";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1513  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1514  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1515  			qup_uart2_cts: qup-uart2-cts-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1516  				pins = "gpio0";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1517  				function = "qup0";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1518  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1519  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1520  			qup_uart2_rts: qup-uart2-rts-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1521  				pins = "gpio1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1522  				function = "qup0";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1523  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1524  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1525  			qup_uart2_tx: qup-uart2-tx-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1526  				pins = "gpio2";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1527  				function = "qup0";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1528  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1529  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1530  			qup_uart2_rx: qup-uart2-rx-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1531  				pins = "gpio3";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1532  				function = "qup0";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1533  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1534  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1535  			qup_uart4_cts: qup-uart4-cts-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1536  				pins = "gpio20";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1537  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1538  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1539  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1540  			qup_uart4_rts: qup-uart4-rts-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1541  				pins = "gpio21";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1542  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1543  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1544  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1545  			qup_uart4_tx: qup-uart4-tx-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1546  				pins = "gpio22";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1547  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1548  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1549  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1550  			qup_uart4_rx: qup-uart4-rx-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1551  				pins = "gpio23";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1552  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1553  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1554  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1555  			qup_uart6_cts: qup-uart6-cts-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1556  				pins = "gpio6";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1557  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1558  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1559  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1560  			qup_uart6_rts: qup-uart6-rts-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1561  				pins = "gpio7";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1562  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1563  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1564  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1565  			qup_uart6_tx: qup-uart6-tx-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1566  				pins = "gpio8";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1567  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1568  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1569  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1570  			qup_uart6_rx: qup-uart6-rx-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1571  				pins = "gpio9";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1572  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1573  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1574  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1575  			qup_uart7_cts: qup-uart7-cts-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1576  				pins = "gpio10";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1577  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1578  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1579  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1580  			qup_uart7_rts: qup-uart7-rts-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1581  				pins = "gpio11";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1582  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1583  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1584  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1585  			qup_uart7_tx: qup-uart7-tx-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1586  				pins = "gpio12";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1587  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1588  			};
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1589  
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1590  			qup_uart7_rx: qup-uart7-rx-state {
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1591  				pins = "gpio13";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1592  				function = "qup1";
f6746dc9e379ea arch/arm64/boot/dts/qcom/qcs615.dtsi Viken Dadhaniya           2024-11-15  1593  			};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1594  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1595  			sdc1_state_on: sdc1-on-state {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1596  				clk-pins {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1597  					pins = "sdc1_clk";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1598  					bias-disable;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1599  					drive-strength = <16>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1600  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1601  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1602  				cmd-pins {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1603  					pins = "sdc1_cmd";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1604  					bias-pull-up;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1605  					drive-strength = <10>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1606  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1607  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1608  				data-pins {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1609  					pins = "sdc1_data";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1610  					bias-pull-up;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1611  					drive-strength = <10>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1612  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1613  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1614  				rclk-pins {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1615  					pins = "sdc1_rclk";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1616  					bias-pull-down;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1617  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1618  			};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1619  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1620  			sdc1_state_off: sdc1-off-state {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1621  				clk-pins {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1622  					pins = "sdc1_clk";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1623  					bias-disable;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1624  					drive-strength = <2>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1625  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1626  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1627  				cmd-pins {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1628  					pins = "sdc1_cmd";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1629  					bias-pull-up;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1630  					drive-strength = <2>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1631  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1632  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1633  				data-pins {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1634  					pins = "sdc1_data";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1635  					bias-pull-up;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1636  					drive-strength = <2>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1637  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1638  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1639  				rclk-pins {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1640  					pins = "sdc1_rclk";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1641  					bias-pull-down;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1642  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1643  			};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1644  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1645  			sdc2_state_on: sdc2-on-state {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1646  				clk-pins {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1647  					pins = "sdc2_clk";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1648  					bias-disable;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1649  					drive-strength = <16>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1650  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1651  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1652  				cmd-pins {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1653  					pins = "sdc2_cmd";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1654  					bias-pull-up;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1655  					drive-strength = <10>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1656  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1657  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1658  				data-pins {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1659  					pins = "sdc2_data";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1660  					bias-pull-up;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1661  					drive-strength = <10>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1662  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1663  			};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1664  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1665  			sdc2_state_off: sdc2-off-state {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1666  				clk-pins {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1667  					pins = "sdc2_clk";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1668  					bias-disable;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1669  					drive-strength = <2>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1670  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1671  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1672  				cmd-pins {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1673  					pins = "sdc2_cmd";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1674  					bias-pull-up;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1675  					drive-strength = <2>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1676  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1677  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1678  				data-pins {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1679  					pins = "sdc2_data";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1680  					bias-pull-up;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1681  					drive-strength = <2>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1682  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  1683  			};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1684  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  1685  
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  1686  		gpucc: clock-controller@5090000 {
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  1687  			compatible = "qcom,qcs615-gpucc";
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  1688  			reg = <0 0x05090000 0 0x9000>;
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  1689  
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  1690  			clocks = <&rpmhcc RPMH_CXO_CLK>,
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  1691  				 <&gcc GPLL0>,
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  1692  				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  1693  
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  1694  			#clock-cells = <1>;
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  1695  			#reset-cells = <1>;
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  1696  			#power-domain-cells = <1>;
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  1697  		};
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  1698  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1699  		stm@6002000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1700  			compatible = "arm,coresight-stm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1701  			reg = <0x0 0x06002000 0x0 0x1000>,
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1702  			      <0x0 0x16280000 0x0 0x180000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1703  			reg-names = "stm-base",
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1704  				    "stm-stimulus-base";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1705  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1706  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1707  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1708  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1709  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1710  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1711  					stm_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1712  						remote-endpoint = <&funnel_in0_in7>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1713  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1714  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1715  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1716  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1717  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1718  		tpda@6004000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1719  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1720  			reg = <0x0 0x06004000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1721  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1722  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1723  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1724  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1725  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1726  				#address-cells = <1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1727  				#size-cells = <0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1728  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1729  				port@0 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1730  					reg = <0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1731  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1732  					tpda_qdss_in0: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1733  						remote-endpoint = <&tpdm_center_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1734  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1735  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1736  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1737  				port@4 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1738  					reg = <4>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1739  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1740  					tpda_qdss_in4: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1741  						remote-endpoint = <&funnel_monaq_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1742  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1743  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1744  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1745  				port@5 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1746  					reg = <5>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1747  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1748  					tpda_qdss_in5: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1749  						remote-endpoint = <&funnel_ddr_0_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1750  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1751  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1752  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1753  				port@6 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1754  					reg = <6>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1755  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1756  					tpda_qdss_in6: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1757  						remote-endpoint = <&funnel_turing_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1758  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1759  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1760  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1761  				port@7 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1762  					reg = <7>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1763  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1764  					tpda_qdss_in7: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1765  						remote-endpoint = <&tpdm_vsense_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1766  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1767  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1768  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1769  				port@8 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1770  					reg = <8>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1771  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1772  					tpda_qdss_in8: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1773  						remote-endpoint = <&tpdm_dcc_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1774  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1775  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1776  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1777  				port@9 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1778  					reg = <9>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1779  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1780  					tpda_qdss_in9: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1781  						remote-endpoint = <&tpdm_prng_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1782  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1783  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1784  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1785  				port@b {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1786  					reg = <11>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1787  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1788  					tpda_qdss_in11: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1789  						remote-endpoint = <&tpdm_qm_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1790  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1791  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1792  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1793  				port@c {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1794  					reg = <12>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1795  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1796  					tpda_qdss_in12: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1797  						remote-endpoint = <&tpdm_west_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1798  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1799  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1800  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1801  				port@d {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1802  					reg = <13>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1803  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1804  					tpda_qdss_in13: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1805  						remote-endpoint = <&tpdm_pimem_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1806  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1807  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1808  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1809  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1810  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1811  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1812  					tpda_qdss_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1813  						remote-endpoint = <&funnel_qatb_in>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1814  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1815  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1816  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1817  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1818  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1819  		funnel@6005000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1820  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1821  			reg = <0x0 0x06005000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1822  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1823  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1824  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1825  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1826  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1827  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1828  					funnel_qatb_in: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1829  						remote-endpoint = <&tpda_qdss_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1830  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1831  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1832  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1833  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1834  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1835  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1836  					funnel_qatb_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1837  						remote-endpoint = <&funnel_in0_in6>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1838  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1839  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1840  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1841  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1842  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1843  		cti@6010000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1844  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1845  			reg = <0x0 0x06010000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1846  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1847  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1848  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1849  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1850  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1851  		cti@6011000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1852  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1853  			reg = <0x0 0x06011000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1854  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1855  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1856  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1857  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1858  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1859  		cti@6012000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1860  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1861  			reg = <0x0 0x06012000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1862  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1863  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1864  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1865  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1866  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1867  		cti@6013000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1868  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1869  			reg = <0x0 0x06013000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1870  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1871  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1872  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1873  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1874  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1875  		cti@6014000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1876  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1877  			reg = <0x0 0x06014000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1878  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1879  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1880  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1881  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1882  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1883  		cti@6015000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1884  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1885  			reg = <0x0 0x06015000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1886  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1887  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1888  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1889  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1890  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1891  		cti@6016000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1892  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1893  			reg = <0x0 0x06016000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1894  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1895  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1896  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1897  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1898  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1899  		cti@6017000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1900  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1901  			reg = <0x0 0x06017000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1902  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1903  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1904  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1905  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1906  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1907  		cti@6018000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1908  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1909  			reg = <0x0 0x06018000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1910  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1911  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1912  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1913  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1914  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1915  		cti@6019000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1916  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1917  			reg = <0x0 0x06019000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1918  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1919  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1920  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1921  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1922  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1923  		cti@601a000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1924  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1925  			reg = <0x0 0x0601a000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1926  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1927  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1928  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1929  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1930  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1931  		cti@601b000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1932  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1933  			reg = <0x0 0x0601b000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1934  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1935  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1936  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1937  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1938  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1939  		cti@601c000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1940  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1941  			reg = <0x0 0x0601c000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1942  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1943  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1944  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1945  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1946  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1947  		cti@601d000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1948  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1949  			reg = <0x0 0x0601d000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1950  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1951  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1952  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1953  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1954  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1955  		cti@601e000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1956  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1957  			reg = <0x0 0x0601e000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1958  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1959  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1960  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1961  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1962  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1963  		cti@601f000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1964  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1965  			reg = <0x0 0x0601f000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1966  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1967  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1968  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1969  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1970  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1971  		funnel@6041000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1972  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1973  			reg = <0x0 0x06041000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1974  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1975  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1976  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1977  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1978  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1979  				#address-cells = <1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1980  				#size-cells = <0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1981  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1982  				port@6 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1983  					reg = <6>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1984  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1985  					funnel_in0_in6: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1986  						remote-endpoint = <&funnel_qatb_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1987  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1988  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1989  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1990  				port@7 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1991  					reg = <7>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1992  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1993  					funnel_in0_in7: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1994  						remote-endpoint = <&stm_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1995  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1996  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1997  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1998  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  1999  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2000  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2001  					funnel_in0_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2002  						remote-endpoint = <&funnel_merg_in0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2003  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2004  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2005  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2006  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2007  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2008  		funnel@6042000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2009  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2010  			reg = <0x0 0x06042000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2011  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2012  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2013  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2014  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2015  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2016  				#address-cells = <1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2017  				#size-cells = <0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2018  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2019  				port@3 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2020  					reg = <3>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2021  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2022  					funnel_in1_in3: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2023  						remote-endpoint = <&replicator_swao_out0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2024  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2025  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2026  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2027  				port@4 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2028  					reg = <4>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2029  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2030  					funnel_in1_in4: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2031  						remote-endpoint = <&tpdm_wcss_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2032  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2033  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2034  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2035  				port@7 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2036  					reg = <7>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2037  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2038  					funnel_in1_in7: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2039  						remote-endpoint = <&funnel_apss_merg_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2040  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2041  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2042  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2043  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2044  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2045  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2046  					funnel_in1_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2047  						remote-endpoint = <&funnel_merg_in1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2048  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2049  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2050  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2051  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2052  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2053  		funnel@6045000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2054  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2055  			reg = <0x0 0x06045000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2056  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2057  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2058  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2059  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2060  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2061  				#address-cells = <1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2062  				#size-cells = <0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2063  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2064  				port@0 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2065  					reg = <0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2066  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2067  					funnel_merg_in0: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2068  						remote-endpoint = <&funnel_in0_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2069  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2070  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2071  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2072  				port@1 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2073  					reg = <1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2074  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2075  					funnel_merg_in1: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2076  						remote-endpoint = <&funnel_in1_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2077  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2078  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2079  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2080  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2081  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2082  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2083  					funnel_merg_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2084  						remote-endpoint = <&tmc_etf_in>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2085  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2086  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2087  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2088  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2089  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2090  		replicator@6046000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2091  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2092  			reg = <0x0 0x06046000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2093  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2094  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2095  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2096  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2097  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2098  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2099  					replicator0_in: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2100  						remote-endpoint = <&tmc_etf_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2101  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2102  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2103  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2104  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2105  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2106  				#address-cells = <1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2107  				#size-cells = <0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2108  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2109  				port@1 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2110  					reg = <1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2111  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2112  					replicator0_out1: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2113  						remote-endpoint = <&replicator1_in>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2114  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2115  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2116  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2117  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2118  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2119  		tmc@6047000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2120  			compatible = "arm,coresight-tmc", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2121  			reg = <0x0 0x06047000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2122  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2123  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2124  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2125  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2126  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2127  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2128  					tmc_etf_in: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2129  						remote-endpoint = <&funnel_merg_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2130  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2131  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2132  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2133  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2134  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2135  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2136  					tmc_etf_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2137  						remote-endpoint = <&replicator0_in>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2138  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2139  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2140  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2141  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2142  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2143  		replicator@604a000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2144  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2145  			reg = <0x0 0x0604a000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2146  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2147  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2148  			clock-names = "apb_pclk";
bd4f35786d5f07 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2025-05-22  2149  			status = "disabled";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2150  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2151  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2152  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2153  					replicator1_in: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2154  						remote-endpoint = <&replicator0_out1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2155  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2156  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2157  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2158  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2159  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2160  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2161  					replicator1_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2162  						remote-endpoint = <&funnel_swao_in6>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2163  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2164  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2165  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2166  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2167  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2168  		cti@683b000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2169  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2170  			reg = <0x0 0x0683b000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2171  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2172  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2173  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2174  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2175  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2176  		tpdm@6840000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2177  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2178  			reg = <0x0 0x06840000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2179  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2180  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2181  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2182  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2183  			qcom,cmb-element-bits = <64>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2184  			qcom,cmb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2185  			status = "disabled";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2186  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2187  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2188  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2189  					tpdm_vsense_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2190  						remote-endpoint = <&tpda_qdss_in7>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2191  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2192  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2193  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2194  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2195  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2196  		tpdm@684c000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2197  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2198  			reg = <0x0 0x0684c000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2199  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2200  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2201  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2202  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2203  			qcom,cmb-element-bits = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2204  			qcom,cmb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2205  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2206  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2207  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2208  					tpdm_prng_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2209  						remote-endpoint = <&tpda_qdss_in9>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2210  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2211  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2212  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2213  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2214  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2215  		tpdm@6850000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2216  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2217  			reg = <0x0 0x06850000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2218  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2219  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2220  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2221  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2222  			qcom,cmb-element-bits = <64>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2223  			qcom,cmb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2224  			qcom,dsb-element-bits = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2225  			qcom,dsb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2226  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2227  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2228  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2229  					tpdm_pimem_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2230  						remote-endpoint = <&tpda_qdss_in13>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2231  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2232  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2233  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2234  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2235  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2236  		tpdm@6860000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2237  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2238  			reg = <0x0 0x06860000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2239  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2240  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2241  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2242  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2243  			qcom,dsb-element-bits = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2244  			qcom,dsb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2245  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2246  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2247  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2248  					tpdm_turing_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2249  						remote-endpoint = <&funnel_turing_in>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2250  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2251  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2252  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2253  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2254  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2255  		funnel@6861000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2256  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2257  			reg = <0x0 0x06861000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2258  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2259  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2260  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2261  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2262  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2263  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2264  					funnel_turing_in: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2265  						remote-endpoint = <&tpdm_turing_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2266  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2267  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2268  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2269  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2270  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2271  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2272  					funnel_turing_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2273  						remote-endpoint = <&tpda_qdss_in6>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2274  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2275  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2276  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2277  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2278  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2279  		cti@6867000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2280  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2281  			reg = <0x0 0x06867000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2282  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2283  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2284  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2285  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2286  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2287  		tpdm@6870000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2288  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2289  			reg = <0x0 0x06870000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2290  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2291  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2292  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2293  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2294  			qcom,cmb-element-bits = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2295  			qcom,cmb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2296  			status = "disabled";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2297  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2298  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2299  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2300  					tpdm_dcc_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2301  						remote-endpoint = <&tpda_qdss_in8>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2302  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2303  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2304  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2305  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2306  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2307  		tpdm@699c000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2308  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2309  			reg = <0x0 0x0699c000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2310  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2311  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2312  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2313  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2314  			qcom,cmb-element-bits = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2315  			qcom,cmb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2316  			qcom,dsb-element-bits = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2317  			qcom,dsb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2318  			status = "disabled";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2319  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2320  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2321  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2322  					tpdm_wcss_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2323  						remote-endpoint = <&funnel_in1_in4>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2324  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2325  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2326  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2327  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2328  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2329  		tpdm@69c0000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2330  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2331  			reg = <0x0 0x069c0000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2332  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2333  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2334  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2335  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2336  			qcom,dsb-element-bits = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2337  			qcom,dsb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2338  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2339  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2340  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2341  					tpdm_monaq_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2342  						remote-endpoint = <&funnel_monaq_in>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2343  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2344  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2345  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2346  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2347  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2348  		funnel@69c3000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2349  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2350  			reg = <0x0 0x069c3000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2351  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2352  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2353  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2354  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2355  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2356  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2357  					funnel_monaq_in: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2358  						remote-endpoint = <&tpdm_monaq_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2359  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2360  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2361  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2362  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2363  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2364  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2365  					funnel_monaq_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2366  						remote-endpoint = <&tpda_qdss_in4>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2367  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2368  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2369  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2370  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2371  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2372  		tpdm@69d0000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2373  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2374  			reg = <0x0 0x069d0000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2375  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2376  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2377  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2378  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2379  			qcom,dsb-element-bits = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2380  			qcom,dsb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2381  			status = "disabled";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2382  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2383  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2384  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2385  					tpdm_qm_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2386  						remote-endpoint = <&tpda_qdss_in11>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2387  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2388  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2389  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2390  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2391  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2392  		tpdm@6a00000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2393  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2394  			reg = <0x0 0x06a00000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2395  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2396  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2397  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2398  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2399  			qcom,dsb-element-bits = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2400  			qcom,dsb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2401  			status = "disabled";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2402  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2403  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2404  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2405  					tpdm_ddr_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2406  						remote-endpoint = <&funnel_ddr_0_in>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2407  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2408  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2409  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2410  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2411  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2412  		cti@6a02000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2413  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2414  			reg = <0x0 0x06a02000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2415  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2416  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2417  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2418  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2419  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2420  		cti@6a03000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2421  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2422  			reg = <0x0 0x06a03000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2423  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2424  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2425  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2426  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2427  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2428  		cti@6a10000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2429  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2430  			reg = <0x0 0x06a10000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2431  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2432  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2433  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2434  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2435  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2436  		cti@6a11000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2437  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2438  			reg = <0x0 0x06a11000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2439  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2440  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2441  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2442  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2443  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2444  		funnel@6a05000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2445  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2446  			reg = <0x0 0x06a05000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2447  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2448  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2449  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2450  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2451  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2452  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2453  					funnel_ddr_0_in: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2454  						remote-endpoint = <&tpdm_ddr_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2455  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2456  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2457  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2458  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2459  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2460  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2461  					funnel_ddr_0_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2462  						remote-endpoint = <&tpda_qdss_in5>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2463  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2464  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2465  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2466  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2467  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2468  		tpda@6b01000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2469  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2470  			reg = <0x0 0x06b01000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2471  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2472  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2473  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2474  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2475  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2476  				#address-cells = <1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2477  				#size-cells = <0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2478  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2479  				port@0 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2480  					reg = <0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2481  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2482  					tpda_swao_in0: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2483  						remote-endpoint = <&tpdm_swao0_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2484  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2485  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2486  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2487  				port@1 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2488  					reg = <1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2489  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2490  					tpda_swao_in1: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2491  						remote-endpoint = <&tpdm_swao1_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2492  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2493  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2494  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2495  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2496  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2497  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2498  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2499  					tpda_swao_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2500  						remote-endpoint = <&funnel_swao_in7>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2501  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2502  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2503  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2504  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2505  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2506  		tpdm@6b02000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2507  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2508  			reg = <0x0 0x06b02000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2509  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2510  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2511  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2512  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2513  			qcom,cmb-element-bits = <64>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2514  			qcom,cmb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2515  			status = "disabled";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2516  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2517  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2518  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2519  					tpdm_swao0_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2520  						remote-endpoint = <&tpda_swao_in0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2521  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2522  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2523  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2524  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2525  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2526  		tpdm@6b03000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2527  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2528  			reg = <0x0 0x06b03000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2529  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2530  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2531  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2532  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2533  			qcom,dsb-element-bits = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2534  			qcom,dsb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2535  			status = "disabled";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2536  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2537  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2538  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2539  					tpdm_swao1_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2540  						remote-endpoint = <&tpda_swao_in1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2541  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2542  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2543  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2544  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2545  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2546  		cti@6b04000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2547  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2548  			reg = <0x0 0x06b04000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2549  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2550  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2551  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2552  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2553  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2554  		cti@6b05000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2555  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2556  			reg = <0x0 0x06b05000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2557  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2558  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2559  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2560  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2561  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2562  		cti@6b06000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2563  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2564  			reg = <0x0 0x06b06000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2565  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2566  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2567  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2568  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2569  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2570  		cti@6b07000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2571  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2572  			reg = <0x0 0x06b07000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2573  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2574  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2575  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2576  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2577  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2578  		funnel@6b08000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2579  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2580  			reg = <0x0 0x06b08000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2581  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2582  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2583  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2584  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2585  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2586  				#address-cells = <1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2587  				#size-cells = <0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2588  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2589  				port@6 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2590  					reg = <6>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2591  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2592  					funnel_swao_in6: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2593  						remote-endpoint = <&replicator1_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2594  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2595  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2596  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2597  				port@7 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2598  					reg = <7>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2599  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2600  					funnel_swao_in7: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2601  						remote-endpoint = <&tpda_swao_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2602  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2603  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2604  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2605  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2606  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2607  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2608  					funnel_swao_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2609  						remote-endpoint = <&tmc_etf_swao_in>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2610  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2611  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2612  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2613  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2614  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2615  		tmc@6b09000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2616  			compatible = "arm,coresight-tmc", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2617  			reg = <0x0 0x06b09000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2618  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2619  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2620  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2621  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2622  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2623  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2624  					tmc_etf_swao_in: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2625  						remote-endpoint = <&funnel_swao_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2626  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2627  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2628  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2629  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2630  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2631  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2632  					tmc_etf_swao_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2633  						remote-endpoint = <&replicator_swao_in>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2634  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2635  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2636  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2637  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2638  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2639  		replicator@6b0a000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2640  			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2641  			reg = <0x0 0x06b0a000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2642  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2643  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2644  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2645  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2646  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2647  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2648  					replicator_swao_in: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2649  						remote-endpoint = <&tmc_etf_swao_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2650  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2651  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2652  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2653  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2654  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2655  				#address-cells = <1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2656  				#size-cells = <0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2657  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2658  				port@0 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2659  					reg = <0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2660  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2661  					replicator_swao_out0: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2662  						remote-endpoint = <&funnel_in1_in3>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2663  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2664  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2665  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2666  				port@1 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2667  					reg = <1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2668  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2669  					replicator_swao_out1: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2670  						remote-endpoint = <&eud_in>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2671  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2672  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2673  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2674  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2675  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2676  		cti@6b21000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2677  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2678  			reg = <0x0 0x06b21000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2679  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2680  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2681  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2682  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2683  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2684  		tpdm@6b48000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2685  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2686  			reg = <0x0 0x06b48000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2687  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2688  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2689  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2690  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2691  			qcom,dsb-element-bits = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2692  			qcom,dsb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2693  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2694  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2695  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2696  					tpdm_west_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2697  						remote-endpoint = <&tpda_qdss_in12>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2698  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2699  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2700  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2701  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2702  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2703  		cti@6c13000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2704  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2705  			reg = <0x0 0x06c13000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2706  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2707  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2708  			clock-names = "apb_pclk";
1b7fc8a281cae9 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2025-06-11  2709  
1b7fc8a281cae9 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2025-06-11  2710  			/* Not all required clocks can be enabled from the OS */
1b7fc8a281cae9 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2025-06-11  2711  			status = "fail";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2712  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2713  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2714  		cti@6c20000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2715  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2716  			reg = <0x0 0x06c20000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2717  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2718  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2719  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2720  			status = "disabled";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2721  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2722  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2723  		tpdm@6c28000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2724  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2725  			reg = <0x0 0x06c28000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2726  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2727  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2728  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2729  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2730  			qcom,dsb-element-bits = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2731  			qcom,dsb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2732  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2733  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2734  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2735  					tpdm_center_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2736  						remote-endpoint = <&tpda_qdss_in0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2737  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2738  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2739  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2740  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2741  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2742  		cti@6c29000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2743  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2744  			reg = <0x0 0x06c29000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2745  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2746  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2747  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2748  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2749  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2750  		cti@6c2a000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2751  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2752  			reg = <0x0 0x06c2a000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2753  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2754  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2755  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2756  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2757  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2758  		cti@7020000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2759  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2760  			reg = <0x0 0x07020000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2761  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2762  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2763  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2764  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2765  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2766  		etm@7040000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2767  			compatible = "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2768  			reg = <0x0 0x07040000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2769  			cpu = <&cpu0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2770  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2771  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2772  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2773  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2774  			arm,coresight-loses-context-with-cpu;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2775  			qcom,skip-power-up;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2776  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2777  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2778  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2779  					etm0_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2780  						remote-endpoint = <&funnel_apss_in0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2781  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2782  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2783  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2784  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2785  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2786  		cti@7120000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2787  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2788  			reg = <0x0 0x07120000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2789  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2790  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2791  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2792  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2793  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2794  		etm@7140000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2795  			compatible = "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2796  			reg = <0x0 0x07140000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2797  			cpu = <&cpu1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2798  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2799  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2800  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2801  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2802  			arm,coresight-loses-context-with-cpu;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2803  			qcom,skip-power-up;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2804  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2805  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2806  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2807  					etm1_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2808  						remote-endpoint = <&funnel_apss_in1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2809  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2810  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2811  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2812  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2813  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2814  		cti@7220000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2815  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2816  			reg = <0x0 0x07220000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2817  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2818  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2819  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2820  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2821  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2822  		etm@7240000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2823  			compatible = "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2824  			reg = <0x0 0x07240000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2825  			cpu = <&cpu2>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2826  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2827  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2828  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2829  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2830  			arm,coresight-loses-context-with-cpu;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2831  			qcom,skip-power-up;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2832  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2833  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2834  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2835  					etm2_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2836  						remote-endpoint = <&funnel_apss_in2>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2837  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2838  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2839  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2840  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2841  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2842  		cti@7320000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2843  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2844  			reg = <0x0 0x07320000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2845  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2846  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2847  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2848  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2849  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2850  		etm@7340000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2851  			compatible = "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2852  			reg = <0x0 0x07340000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2853  			cpu = <&cpu3>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2854  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2855  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2856  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2857  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2858  			arm,coresight-loses-context-with-cpu;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2859  			qcom,skip-power-up;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2860  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2861  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2862  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2863  					etm3_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2864  						remote-endpoint = <&funnel_apss_in3>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2865  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2866  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2867  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2868  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2869  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2870  		cti@7420000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2871  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2872  			reg = <0x0 0x07420000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2873  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2874  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2875  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2876  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2877  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2878  		etm@7440000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2879  			compatible = "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2880  			reg = <0x0 0x07440000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2881  			cpu = <&cpu4>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2882  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2883  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2884  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2885  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2886  			arm,coresight-loses-context-with-cpu;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2887  			qcom,skip-power-up;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2888  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2889  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2890  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2891  					etm4_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2892  						remote-endpoint = <&funnel_apss_in4>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2893  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2894  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2895  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2896  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2897  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2898  		cti@7520000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2899  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2900  			reg = <0x0 0x07520000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2901  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2902  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2903  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2904  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2905  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2906  		etm@7540000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2907  			compatible = "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2908  			reg = <0x0 0x07540000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2909  			cpu = <&cpu5>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2910  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2911  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2912  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2913  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2914  			arm,coresight-loses-context-with-cpu;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2915  			qcom,skip-power-up;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2916  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2917  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2918  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2919  					etm5_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2920  						remote-endpoint = <&funnel_apss_in5>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2921  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2922  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2923  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2924  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2925  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2926  		cti@7620000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2927  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2928  			reg = <0x0 0x07620000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2929  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2930  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2931  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2932  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2933  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2934  		etm@7640000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2935  			compatible = "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2936  			reg = <0x0 0x07640000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2937  			cpu = <&cpu6>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2938  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2939  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2940  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2941  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2942  			arm,coresight-loses-context-with-cpu;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2943  			qcom,skip-power-up;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2944  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2945  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2946  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2947  					etm6_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2948  						remote-endpoint = <&funnel_apss_in6>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2949  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2950  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2951  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2952  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2953  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2954  		cti@7720000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2955  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2956  			reg = <0x0 0x07720000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2957  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2958  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2959  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2960  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2961  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2962  		etm@7740000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2963  			compatible = "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2964  			reg = <0x0 0x07740000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2965  			cpu = <&cpu7>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2966  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2967  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2968  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2969  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2970  			arm,coresight-loses-context-with-cpu;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2971  			qcom,skip-power-up;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2972  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2973  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2974  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2975  					etm7_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2976  						remote-endpoint = <&funnel_apss_in7>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2977  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2978  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2979  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2980  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2981  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2982  		funnel@7800000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2983  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2984  			reg = <0x0 0x07800000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2985  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2986  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2987  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2988  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2989  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2990  				#address-cells = <1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2991  				#size-cells = <0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2992  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2993  				port@0 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2994  					reg = <0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2995  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2996  					funnel_apss_in0: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2997  						remote-endpoint = <&etm0_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2998  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  2999  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3000  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3001  				port@1 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3002  					reg = <1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3003  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3004  					funnel_apss_in1: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3005  						remote-endpoint = <&etm1_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3006  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3007  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3008  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3009  				port@2 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3010  					reg = <2>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3011  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3012  					funnel_apss_in2: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3013  						remote-endpoint = <&etm2_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3014  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3015  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3016  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3017  				port@3 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3018  					reg = <3>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3019  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3020  					funnel_apss_in3: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3021  						remote-endpoint = <&etm3_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3022  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3023  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3024  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3025  				port@4 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3026  					reg = <4>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3027  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3028  					funnel_apss_in4: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3029  						remote-endpoint = <&etm4_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3030  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3031  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3032  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3033  				port@5 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3034  					reg = <5>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3035  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3036  					funnel_apss_in5: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3037  						remote-endpoint = <&etm5_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3038  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3039  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3040  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3041  				port@6 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3042  					reg = <6>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3043  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3044  					funnel_apss_in6: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3045  						remote-endpoint = <&etm6_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3046  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3047  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3048  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3049  				port@7 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3050  					reg = <7>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3051  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3052  					funnel_apss_in7: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3053  						remote-endpoint = <&etm7_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3054  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3055  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3056  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3057  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3058  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3059  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3060  					funnel_apss_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3061  						remote-endpoint = <&funnel_apss_merg_in0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3062  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3063  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3064  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3065  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3066  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3067  		funnel@7810000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3068  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3069  			reg = <0x0 0x07810000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3070  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3071  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3072  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3073  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3074  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3075  				#address-cells = <1>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3076  				#size-cells = <0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3077  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3078  				port@0 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3079  					reg = <0>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3080  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3081  					funnel_apss_merg_in0: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3082  						remote-endpoint = <&funnel_apss_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3083  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3084  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3085  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3086  				port@2 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3087  					reg = <2>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3088  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3089  					funnel_apss_merg_in2: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3090  						remote-endpoint = <&tpda_olc_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3091  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3092  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3093  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3094  				port@3 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3095  					reg = <3>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3096  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3097  					funnel_apss_merg_in3: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3098  						remote-endpoint = <&tpda_llm_silver_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3099  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3100  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3101  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3102  				port@4 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3103  					reg = <4>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3104  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3105  					funnel_apss_merg_in4: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3106  						remote-endpoint = <&tpda_llm_gold_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3107  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3108  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3109  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3110  				port@5 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3111  					reg = <5>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3112  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3113  					funnel_apss_merg_in5: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3114  						remote-endpoint = <&tpda_apss_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3115  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3116  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3117  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3118  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3119  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3120  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3121  					funnel_apss_merg_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3122  						remote-endpoint = <&funnel_in1_in7>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3123  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3124  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3125  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3126  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3127  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3128  		tpdm@7830000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3129  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3130  			reg = <0x0 0x07830000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3131  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3132  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3133  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3134  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3135  			qcom,cmb-element-bits = <64>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3136  			qcom,cmb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3137  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3138  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3139  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3140  					tpdm_olc_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3141  						remote-endpoint = <&tpda_olc_in>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3142  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3143  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3144  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3145  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3146  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3147  		tpda@7832000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3148  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3149  			reg = <0x0 0x07832000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3150  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3151  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3152  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3153  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3154  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3155  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3156  					tpda_olc_in: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3157  						remote-endpoint = <&tpdm_olc_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3158  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3159  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3160  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3161  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3162  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3163  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3164  					tpda_olc_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3165  						remote-endpoint = <&funnel_apss_merg_in2>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3166  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3167  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3168  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3169  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3170  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3171  		tpdm@7860000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3172  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3173  			reg = <0x0 0x07860000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3174  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3175  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3176  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3177  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3178  			qcom,dsb-element-bits = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3179  			qcom,dsb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3180  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3181  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3182  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3183  					tpdm_apss_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3184  						remote-endpoint = <&tpda_apss_in>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3185  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3186  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3187  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3188  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3189  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3190  		tpda@7862000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3191  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3192  			reg = <0x0 0x07862000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3193  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3194  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3195  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3196  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3197  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3198  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3199  					tpda_apss_in: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3200  						remote-endpoint = <&tpdm_apss_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3201  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3202  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3203  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3204  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3205  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3206  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3207  					tpda_apss_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3208  						remote-endpoint = <&funnel_apss_merg_in5>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3209  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3210  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3211  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3212  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3213  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3214  		tpdm@78a0000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3215  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3216  			reg = <0x0 0x078a0000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3217  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3218  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3219  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3220  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3221  			qcom,cmb-element-bits = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3222  			qcom,cmb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3223  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3224  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3225  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3226  					tpdm_llm_silver_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3227  						remote-endpoint = <&tpda_llm_silver_in>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3228  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3229  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3230  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3231  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3232  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3233  		tpdm@78b0000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3234  			compatible = "qcom,coresight-tpdm", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3235  			reg = <0x0 0x078b0000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3236  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3237  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3238  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3239  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3240  			qcom,cmb-element-bits = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3241  			qcom,cmb-msrs-num = <32>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3242  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3243  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3244  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3245  					tpdm_llm_gold_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3246  						remote-endpoint = <&tpda_llm_gold_in>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3247  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3248  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3249  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3250  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3251  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3252  		tpda@78c0000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3253  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3254  			reg = <0x0 0x078c0000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3255  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3256  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3257  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3258  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3259  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3260  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3261  					tpda_llm_silver_in: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3262  						remote-endpoint = <&tpdm_llm_silver_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3263  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3264  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3265  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3266  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3267  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3268  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3269  					tpda_llm_silver_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3270  						remote-endpoint = <&funnel_apss_merg_in3>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3271  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3272  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3273  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3274  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3275  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3276  		tpda@78d0000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3277  			compatible = "qcom,coresight-tpda", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3278  			reg = <0x0 0x078d0000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3279  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3280  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3281  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3282  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3283  			in-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3284  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3285  					tpda_llm_gold_in: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3286  						remote-endpoint = <&tpdm_llm_gold_out>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3287  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3288  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3289  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3290  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3291  			out-ports {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3292  				port {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3293  					tpda_llm_gold_out: endpoint {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3294  						remote-endpoint = <&funnel_apss_merg_in4>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3295  					};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3296  				};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3297  			};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3298  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3299  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3300  		cti@78e0000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3301  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3302  			reg = <0x0 0x078e0000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3303  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3304  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3305  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3306  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3307  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3308  		cti@78f0000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3309  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3310  			reg = <0x0 0x078f0000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3311  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3312  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3313  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3314  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3315  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3316  		cti@7900000 {
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3317  			compatible = "arm,coresight-cti", "arm,primecell";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3318  			reg = <0x0 0x07900000 0x0 0x1000>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3319  
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3320  			clocks = <&aoss_qmp>;
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3321  			clock-names = "apb_pclk";
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3322  		};
bf469630552a39 arch/arm64/boot/dts/qcom/qcs615.dtsi Jie Gan                   2024-11-06  3323  
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3324  		remoteproc_cdsp: remoteproc@8300000 {
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3325  			compatible = "qcom,qcs615-cdsp-pas", "qcom,sm8150-cdsp-pas";
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3326  			reg = <0x0 0x08300000 0x0 0x4040>;
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3327  
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3328  			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3329  					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3330  					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3331  					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3332  					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3333  			interrupt-names = "wdog",
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3334  					  "fatal",
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3335  					  "ready",
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3336  					  "handover",
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3337  					  "stop-ack";
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3338  
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3339  			clocks = <&rpmhcc RPMH_CXO_CLK>;
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3340  			clock-names = "xo";
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3341  
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3342  			power-domains = <&rpmhpd RPMHPD_CX>;
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3343  			power-domain-names = "cx";
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3344  
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3345  			memory-region = <&rproc_cdsp_mem>;
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3346  
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3347  			qcom,qmp = <&aoss_qmp>;
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3348  
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3349  			qcom,smem-states = <&cdsp_smp2p_out 0>;
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3350  			qcom,smem-state-names = "stop";
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3351  
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3352  			status = "disabled";
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3353  
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3354  			glink-edge {
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3355  				interrupts = <GIC_SPI 574 IRQ_TYPE_EDGE_RISING>;
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3356  				mboxes = <&apss_shared 4>;
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3357  				label = "cdsp";
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3358  				qcom,remote-pid = <5>;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3359  
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3360  				fastrpc {
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3361  					compatible = "qcom,fastrpc";
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3362  					qcom,glink-channels = "fastrpcglink-apps-dsp";
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3363  					label = "cdsp";
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3364  					#address-cells = <1>;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3365  					#size-cells = <0>;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3366  
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3367  					compute-cb@1 {
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3368  						compatible = "qcom,fastrpc-compute-cb";
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3369  						reg = <1>;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3370  						iommus = <&apps_smmu 0x1081 0x0>;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3371  						dma-coherent;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3372  					};
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3373  
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3374  					compute-cb@2 {
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3375  						compatible = "qcom,fastrpc-compute-cb";
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3376  						reg = <2>;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3377  						iommus = <&apps_smmu 0x1082 0x0>;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3378  						dma-coherent;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3379  					};
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3380  
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3381  					compute-cb@3 {
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3382  						compatible = "qcom,fastrpc-compute-cb";
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3383  						reg = <3>;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3384  						iommus = <&apps_smmu 0x1083 0x0>;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3385  						dma-coherent;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3386  					};
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3387  
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3388  					compute-cb@4 {
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3389  						compatible = "qcom,fastrpc-compute-cb";
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3390  						reg = <4>;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3391  						iommus = <&apps_smmu 0x1084 0x0>;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3392  						dma-coherent;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3393  					};
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3394  
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3395  					compute-cb@5 {
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3396  						compatible = "qcom,fastrpc-compute-cb";
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3397  						reg = <5>;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3398  						iommus = <&apps_smmu 0x1085 0x0>;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3399  						dma-coherent;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3400  					};
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3401  
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3402  					compute-cb@6 {
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3403  						compatible = "qcom,fastrpc-compute-cb";
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3404  						reg = <6>;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3405  						iommus = <&apps_smmu 0x1086 0x0>;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3406  						dma-coherent;
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3407  					};
d15cb624a60ab0 arch/arm64/boot/dts/qcom/sm6150.dtsi Ling Xu                   2025-07-29  3408  				};
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3409  			};
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3410  		};
18b011d4569da5 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2025-05-26  3411  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3412  		pmu@90b6300 {
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3413  			compatible = "qcom,qcs615-cpu-bwmon", "qcom,sdm845-bwmon";
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3414  			reg = <0x0 0x090b6300 0x0 0x600>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3415  			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3416  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3417  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3418  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3419  			operating-points-v2 = <&cpu_bwmon_opp_table>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3420  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3421  			cpu_bwmon_opp_table: opp-table {
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3422  				compatible = "operating-points-v2";
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3423  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3424  				opp-0 {
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3425  					opp-peak-kBps = <12896000>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3426  				};
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3427  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3428  				opp-1 {
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3429  					opp-peak-kBps = <14928000>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3430  				};
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3431  			};
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3432  		};
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3433  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3434  		pmu@90cd000 {
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3435  			compatible = "qcom,qcs615-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3436  			reg = <0x0 0x090cd000 0x0 0x1000>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3437  			interrupts = <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3438  			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3439  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3440  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3441  			operating-points-v2 = <&llcc_bwmon_opp_table>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3442  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3443  			llcc_bwmon_opp_table: opp-table {
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3444  				compatible = "operating-points-v2";
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3445  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3446  				opp-0 {
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3447  					opp-peak-kBps = <800000>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3448  				};
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3449  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3450  				opp-1 {
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3451  					opp-peak-kBps = <1200000>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3452  				};
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3453  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3454  				opp-2 {
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3455  					opp-peak-kBps = <1804800>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3456  				};
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3457  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3458  				opp-3 {
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3459  					opp-peak-kBps = <2188800>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3460  				};
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3461  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3462  				opp-4 {
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3463  					opp-peak-kBps = <2726400>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3464  				};
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3465  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3466  				opp-5 {
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3467  					opp-peak-kBps = <3072000>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3468  				};
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3469  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3470  				opp-6 {
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3471  					opp-peak-kBps = <4070400>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3472  				};
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3473  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3474  				opp-7 {
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3475  					opp-peak-kBps = <5414400>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3476  				};
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3477  
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3478  				opp-8 {
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3479  					opp-peak-kBps = <6220800>;
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3480  				};
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3481  			};
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3482  		};
89fc83a9472812 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-12-18  3483  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3484  		sdhc_2: mmc@8804000 {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3485  			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3486  			reg = <0x0 0x08804000 0x0 0x1000>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3487  			reg-names = "hc";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3488  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3489  			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3490  				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3491  			interrupt-names = "hc_irq",
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3492  					  "pwr_irq";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3493  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3494  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3495  				 <&gcc GCC_SDCC2_APPS_CLK>,
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3496  				 <&rpmhcc RPMH_CXO_CLK>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3497  			clock-names = "iface",
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3498  				      "core",
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3499  				      "xo";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3500  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3501  			power-domains = <&rpmhpd RPMHPD_CX>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3502  			operating-points-v2 = <&sdhc2_opp_table>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3503  			iommus = <&apps_smmu 0x02a0 0x0>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3504  			resets = <&gcc GCC_SDCC2_BCR>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3505  			interconnects = <&aggre1_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3506  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3507  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3508  					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3509  			interconnect-names = "sdhc-ddr",
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3510  					     "cpu-sdhc";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3511  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3512  			qcom,dll-config = <0x0007642c>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3513  			qcom,ddr-config = <0x80040868>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3514  			dma-coherent;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3515  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3516  			status = "disabled";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3517  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3518  			sdhc2_opp_table: opp-table {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3519  				compatible = "operating-points-v2";
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3520  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3521  				opp-50000000 {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3522  					opp-hz = /bits/ 64 <50000000>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3523  					required-opps = <&rpmhpd_opp_low_svs>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3524  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3525  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3526  				opp-100000000 {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3527  					opp-hz = /bits/ 64 <100000000>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3528  					required-opps = <&rpmhpd_opp_svs>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3529  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3530  
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3531  				opp-202000000 {
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3532  					opp-hz = /bits/ 64 <202000000>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3533  					required-opps = <&rpmhpd_opp_nom>;
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3534  				};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3535  			};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3536  		};
8009de059f8693 arch/arm64/boot/dts/qcom/qcs615.dtsi Yuanjie Yang              2024-12-17  3537  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  3538  		dc_noc: interconnect@9160000 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  3539  			reg = <0x0 0x09160000 0x0 0x3200>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  3540  			compatible = "qcom,qcs615-dc-noc";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  3541  			#interconnect-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  3542  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  3543  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  3544  
29af58ab4d17f5 arch/arm64/boot/dts/qcom/qcs615.dtsi Song Xue                  2024-10-31  3545  		llcc: system-cache-controller@9200000 {
29af58ab4d17f5 arch/arm64/boot/dts/qcom/qcs615.dtsi Song Xue                  2024-10-31  3546  			compatible = "qcom,qcs615-llcc";
29af58ab4d17f5 arch/arm64/boot/dts/qcom/qcs615.dtsi Song Xue                  2024-10-31  3547  			reg = <0x0 0x09200000 0x0 0x50000>,
29af58ab4d17f5 arch/arm64/boot/dts/qcom/qcs615.dtsi Song Xue                  2024-10-31  3548  			      <0x0 0x09600000 0x0 0x50000>;
29af58ab4d17f5 arch/arm64/boot/dts/qcom/qcs615.dtsi Song Xue                  2024-10-31  3549  			reg-names = "llcc0_base",
29af58ab4d17f5 arch/arm64/boot/dts/qcom/qcs615.dtsi Song Xue                  2024-10-31  3550  				    "llcc_broadcast_base";
29af58ab4d17f5 arch/arm64/boot/dts/qcom/qcs615.dtsi Song Xue                  2024-10-31  3551  		};
29af58ab4d17f5 arch/arm64/boot/dts/qcom/qcs615.dtsi Song Xue                  2024-10-31  3552  
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  3553  		gem_noc: interconnect@9680000 {
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  3554  			reg = <0x0 0x09680000 0x0 0x3e200>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  3555  			compatible = "qcom,qcs615-gem-noc";
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  3556  			#interconnect-cells = <2>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  3557  			qcom,bcm-voters = <&apps_bcm_voter>;
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  3558  		};
8e266654a2fe82 arch/arm64/boot/dts/qcom/qcs615.dtsi Lijuan Gao                2024-11-04  3559  
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3560  		videocc: clock-controller@ab00000 {
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3561  			compatible = "qcom,qcs615-videocc";
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3562  			reg = <0 0x0ab00000 0 0x10000>;
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3563  
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3564  			clocks = <&rpmhcc RPMH_CXO_CLK>,
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3565  				 <&sleep_clk>;
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3566  
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3567  			#clock-cells = <1>;
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3568  			#reset-cells = <1>;
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3569  			#power-domain-cells = <1>;
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3570  		};
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3571  
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3572  		camcc: clock-controller@ad00000 {
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3573  			compatible = "qcom,qcs615-camcc";
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3574  			reg = <0 0x0ad00000 0 0x10000>;
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3575  
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3576  			clocks = <&rpmhcc RPMH_CXO_CLK>;
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3577  
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3578  			#clock-cells = <1>;
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3579  			#reset-cells = <1>;
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3580  			#power-domain-cells = <1>;
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3581  		};
f9c36698db9178 arch/arm64/boot/dts/qcom/sm6150.dtsi Taniya Das                2025-08-14  3582  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3583  		mdss: display-subsystem@ae00000 {
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3584  			compatible = "qcom,sm6150-mdss";
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3585  			reg = <0x0 0x0ae00000 0x0 0x1000>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3586  			reg-names = "mdss";
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3587  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3588  			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3589  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3590  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3591  					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3592  			interconnect-names = "mdp0-mem",
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3593  					     "cpu-cfg";
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3594  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3595  			power-domains = <&dispcc MDSS_CORE_GDSC>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3596  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3597  			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3598  				 <&gcc GCC_DISP_HF_AXI_CLK>,
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3599  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3600  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3601  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3602  			interrupt-controller;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3603  			#interrupt-cells = <1>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3604  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3605  			iommus = <&apps_smmu 0x800 0x0>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3606  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3607  			#address-cells = <2>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3608  			#size-cells = <2>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3609  			ranges;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3610  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3611  			status = "disabled";
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3612  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3613  			mdss_mdp: display-controller@ae01000 {
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3614  				compatible = "qcom,sm6150-dpu";
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3615  				reg = <0x0 0x0ae01000 0x0 0x8f000>,
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3616  				      <0x0 0x0aeb0000 0x0 0x2008>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3617  				reg-names = "mdp",
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3618  					    "vbif";
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3619  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3620  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3621  					 <&gcc GCC_DISP_HF_AXI_CLK>,
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3622  					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3623  					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3624  				clock-names = "iface",
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3625  					      "bus",
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3626  					      "core",
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3627  					      "vsync";
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3628  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3629  				operating-points-v2 = <&mdp_opp_table>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3630  				power-domains = <&rpmhpd RPMHPD_CX>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3631  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3632  				interrupts-extended = <&mdss 0>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3633  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3634  				ports {
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3635  					#address-cells = <1>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3636  					#size-cells = <0>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3637  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3638  					port@0 {
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3639  						reg = <0>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3640  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3641  						dpu_intf0_out: endpoint {
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3642  						};
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3643  					};
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3644  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3645  					port@1 {
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3646  						reg = <1>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3647  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3648  						dpu_intf1_out: endpoint {
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3649  							remote-endpoint = <&mdss_dsi0_in>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3650  						};
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3651  					};
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3652  				};
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3653  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3654  				mdp_opp_table: opp-table {
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3655  					compatible = "operating-points-v2";
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3656  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3657  					opp-192000000 {
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3658  						opp-hz = /bits/ 64 <192000000>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3659  						required-opps = <&rpmhpd_opp_low_svs>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3660  					};
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3661  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3662  					opp-256000000 {
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3663  						opp-hz = /bits/ 64 <256000000>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3664  						required-opps = <&rpmhpd_opp_svs>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3665  					};
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3666  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3667  					opp-307200000 {
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3668  						opp-hz = /bits/ 64 <307200000>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3669  						required-opps = <&rpmhpd_opp_nom>;
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3670  					};
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3671  				};
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3672  			};
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27  3673  
ba660dab46612e arch/arm64/boot/dts/qcom/sm6150.dtsi Li Liu                    2025-08-27 @3674  			mdss_dsi0: dsi@ae94000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
