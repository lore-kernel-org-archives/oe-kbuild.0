Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529FC1C8612
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 12:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754741071; cv=none; b=jBlY5t/1n4fgIw5oiUvkfk6wkN7ggX7wuoEygZbXBEcZ3QCaCEpkCN3I1wFrdTPu59EYYgxsNPeaY5TnBjkvYPvwgAcAbPEljLav5Hzqd3cbsUQ/CgbPy6RzWc49h4PiV7XNbSJPeeMvESdlgvskG9AAwWpOwYM5i9OMhpKoR8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754741071; c=relaxed/simple;
	bh=zJyeOaxYi+OjJxc5oakhWARN1k4FPz85/v4UuUNSmDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZE/+usu/PNV+cTpfqjasr08k1syo+dUyaXt/0bd4R7+T/b3rbSFYiFmFVAktSRPtClDhu3bA9+7MRC93D9L0AGn/KWRDhuCG6k5vDQkPbkPjDVT98mE73qjNozItLJj4P0h0RBB0glHWjaxQozgRUnkMq8lC7trBUph7idrzUOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9H284ib; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9H284ib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754741069; x=1786277069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zJyeOaxYi+OjJxc5oakhWARN1k4FPz85/v4UuUNSmDI=;
  b=R9H284ibQqz38B9Iv1PgEBkPUwQh+ixlmPQzPgetNzg2PBLAeZMEAjsp
   hfn0IWz5vMekOnlcxPi6vZdw6VfpvZMJVm6OI6afmNHU7I6pyUCRcezUM
   F9SnqsP1hfKmh5M/66Vi9fCStanmtt27INGdh9dr92tF77OWKL+O8QBEi
   XQ4Hqv4uTB+O31KR5JGs4IrV2cK74E8D7Vvm75RXssFo7EGbHMY1FK3PG
   gQRWuFsHjurDU6ryZ6O6s9p/UYQgF7o+If6MK0maFrO1m/FysgzOdb56L
   NpbzGr/szGzD0YhnjDs2Xrj3fOsIe6Ov+QJs36wlWDCUi9VwqduDeA08x
   g==;
X-CSE-ConnectionGUID: GmUHoaSsTTqT/exXOWENyQ==
X-CSE-MsgGUID: ZlxIehelSYyqbYlTwnBf1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57029743"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57029743"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 05:04:29 -0700
X-CSE-ConnectionGUID: hFdXz3npTZWDfoWiHVou8A==
X-CSE-MsgGUID: Pwd9lap2TySG8Gm1dK7wcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165179589"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 09 Aug 2025 05:04:28 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukiIs-0004mK-1H;
	Sat, 09 Aug 2025 12:04:05 +0000
Date: Sat, 9 Aug 2025 20:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sa8775p: Add clocks for QoS
 configuration
Message-ID: <202508091914.dyC2H7rc-lkp@intel.com>
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
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-052-20250809 (https://download.01.org/0day-ci/archive/20250809/202508091914.dyC2H7rc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091914.dyC2H7rc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508091914.dyC2H7rc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p.dtsi:2400.37-2405.5: Warning (simple_bus_reg): /soc@0/interconnect@01680000: simple-bus unit address format error, expected "1680000"
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: soc@0 (simple-bus): interconnect@01680000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
--
   arch/arm64/boot/dts/qcom/sa8775p.dtsi:2400.37-2405.5: Warning (simple_bus_reg): /soc@0/interconnect@01680000: simple-bus unit address format error, expected "1680000"
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: soc@0 (simple-bus): interconnect@01680000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
