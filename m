Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E4717578
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754732528; cv=none; b=jNlBO5XKanCTwN6oiO8jpaUOjI7UOYKXFfsHe+8I1X4hbzl7LifJMHMlisTImLZmG/KCLmt9Zqokn4KP1uX87ODQ5k03OverloOZIFY3Iq0wCosibCRqARrfFyf0PDFx5NNqkUMr/s8UO8+JM7Jh1r4S6LX3at1NDVJcwnAHpwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754732528; c=relaxed/simple;
	bh=7vSoQxV1KO2yzLwME7CLSJViWnu1rszVydFQefmxHqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P418mB10h8kX5+1E+0Ywnp913v3MtMrnz2mAuKjRF0P5XvbPrDDW61VDZmG5CmFk4Y0X+msnBqD0c5Kj8hSt/xc/p8aB0Cg/bJ3lhruhBG2onUYjdqpM7U6rXLIbxNEkkH2TuiSMENnHY14gg14W9eWGOLmc7UYMZrdp0zT10bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdyHzc3D; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdyHzc3D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754732527; x=1786268527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7vSoQxV1KO2yzLwME7CLSJViWnu1rszVydFQefmxHqI=;
  b=gdyHzc3D9PaqeSlkry2krRaEGI7rEP5BqL3fmZMF1G+bNJIMu3cUQ6zS
   hjULsYfAEqu45FsK9dmOXBl6kcjj68SncSvqxZCSyNXvEVF71O42vcDmJ
   SwhP0IDEfRD3c5DBhpts/JRY1iLeXY0hJolW95VBTcz798GRz5SkavSQ9
   3zAN/pzMeZhBM9PbB0AaJjRd8ZQ3G1LW8jk6YxTd9YjMqDldWEQ+Ha6hv
   SB83RRa4/li9z7MtQ8Gb3dTD0FG23liKEk3tlh6zd9vgXWUylZiqA5P31
   6KHNAtxvXZAzx1ax6bzn/LM87qvyMzYfgad8Zl6eXifV92eN6u/mTNkG1
   g==;
X-CSE-ConnectionGUID: WN93kVFrTa63j7xY/UVzRw==
X-CSE-MsgGUID: Kjq+rZGgTgiFI6YrRxPh/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56939330"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56939330"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 02:42:06 -0700
X-CSE-ConnectionGUID: 2pHgz4cfSVm4EH0/1UOkyA==
X-CSE-MsgGUID: 2TSz9uoRTIexhOyayHI5PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165506498"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 09 Aug 2025 02:42:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukg51-0004jk-28;
	Sat, 09 Aug 2025 09:41:50 +0000
Date: Sat, 9 Aug 2025 17:41:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sa8775p: Add clocks for QoS
 configuration
Message-ID: <202508091749.SwkM7Dvd-lkp@intel.com>
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
In-Reply-To: <20250808140300.14784-4-odelu.kukatla@oss.qualcomm.com>
References: <20250808140300.14784-4-odelu.kukatla@oss.qualcomm.com>
TO: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
TO: Georgi Djakov <djakov@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
CC: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Mike Tipton <mike.tipton@oss.qualcomm.com>

Hi Odelu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16 next-20250808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Odelu-Kukatla/dt-bindings-interconnect-add-clocks-property-to-enable-QoS-on-sa8775p/20250808-220708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250808140300.14784-4-odelu.kukatla%40oss.qualcomm.com
patch subject: [PATCH 3/3] arm64: dts: qcom: sa8775p: Add clocks for QoS configuration
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-051-20250809 (https://download.01.org/0day-ci/archive/20250809/202508091749.SwkM7Dvd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091749.SwkM7Dvd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508091749.SwkM7Dvd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p.dtsi:2400.37-2405.5: Warning (simple_bus_reg): /soc@0/interconnect@01680000: simple-bus unit address format error, expected "1680000"
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: soc@0 (simple-bus): interconnect@01680000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
--
   arch/arm64/boot/dts/qcom/sa8775p.dtsi:2400.37-2405.5: Warning (simple_bus_reg): /soc@0/interconnect@01680000: simple-bus unit address format error, expected "1680000"
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: soc@0 (simple-bus): interconnect@01680000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
