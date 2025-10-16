Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71923254BC
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Oct 2025 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760606466; cv=none; b=so79LiNQr6QkhqHY8cqkqFwEFYcICrv4CYlt2mUpNxLWi1g8BV39n6+o2tYCCjcBCPZFiiBaUpZySW1w/icsyVAspqPAkHMcHdmZPTcFSN6oNUdG32rID1v7evnS89NuO1dLjryjvtP3fqFNJmESLb8Vu7vpHhMtjRg4+XdAkGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760606466; c=relaxed/simple;
	bh=xoNxfuC0i6bbN+JLzO1M2XYEbmpG7k5JKbP1a0xcn04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E3t5VPso8F0sagOkijLWXwqWqXPti0EVSPVHAt/MO6G8FswB4HYMRDi/jIbyHE08yZiP8RVETFRY6mJODEpP9Fte5mEwOZadJZPSwf0tVp22gzOcZTQssjQHWD9I7gFkIrVdYJ6gW9NpjuJtw1fg1vmnyI9WPlGnnVHRBah6P9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GR1qHZ3C; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GR1qHZ3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760606462; x=1792142462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xoNxfuC0i6bbN+JLzO1M2XYEbmpG7k5JKbP1a0xcn04=;
  b=GR1qHZ3CluvtK7ctulYyetKRB++yr4O3toRs3SlEe6pGDa1JTy6x30Wr
   Fx7rnq6I4K4sLDV3mtUr47zLng7mvMZ1ZFgKfQOyOxs2Izkt87+0XVbh0
   iiK8mVM6aExc7Y7tx0twi3wwyIqS6IVeI4D7Dck7LEfkgOfsWFvmLFP0m
   jipMvvd6p6DGL636HH876djtzqcmAts/h1fZf8GMgUx2JtQ89BJW3UGTd
   fD3JemtBZi5Fhd1jmYvUjCRoKYK69fBzghn4z856I+mUYlR3xXmGSDnZK
   UY36HyNJAUJQfURejeXXYbJ5SvgkKRTAWMZcajmSDitGSDIM38WXLMS0r
   A==;
X-CSE-ConnectionGUID: sIJPpcdwS82J4LGxXnUKcQ==
X-CSE-MsgGUID: 3I6WPpp4TSuEis4aVJPY1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62887880"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="62887880"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 02:21:01 -0700
X-CSE-ConnectionGUID: U/rDlD7IQs+y+VSijFaljw==
X-CSE-MsgGUID: gafu5zebQp+OeniuOVMooA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="182082591"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 16 Oct 2025 02:21:00 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9KAM-0004eB-0N;
	Thu, 16 Oct 2025 09:20:58 +0000
Date: Thu, 16 Oct 2025 17:20:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v5] dt-bindings: net: qcom: ethernet: Add
 interconnect properties
Message-ID: <202510161722.PmO2HWIO-lkp@intel.com>
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
In-Reply-To: <20251015-topic-qc_stmmac_icc_bindings-v5-1-da39126cff28@oss.qualcomm.com>
References: <20251015-topic-qc_stmmac_icc_bindings-v5-1-da39126cff28@oss.qualcomm.com>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Andrew Lunn <andrew+netdev@lunn.ch>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
CC: Andrew Halaney <ahalaney@redhat.com>

Hi Konrad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 52ba76324a9d7c39830c850999210a36ef023cde]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/dt-bindings-net-qcom-ethernet-Add-interconnect-properties/20251016-002721
base:   52ba76324a9d7c39830c850999210a36ef023cde
patch link:    https://lore.kernel.org/r/20251015-topic-qc_stmmac_icc_bindings-v5-1-da39126cff28%40oss.qualcomm.com
patch subject: [PATCH net-next v5] dt-bindings: net: qcom: ethernet: Add interconnect properties
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm64-randconfig-052-20251016 (https://download.01.org/0day-ci/archive/20251016/202510161722.PmO2HWIO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161722.PmO2HWIO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510161722.PmO2HWIO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/lemans.dtsi:4873.28-4934.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4955.28-5007.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): interconnect-names:0: 'cpu-mac' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): interconnect-names:1: 'mac-mem' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): interconnect-names:0: 'cpu-mac' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): interconnect-names:1: 'mac-mem' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:4873.28-4934.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4955.28-5007.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): interconnect-names:0: 'cpu-mac' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): interconnect-names:1: 'mac-mem' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): interconnect-names:0: 'cpu-mac' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): interconnect-names:1: 'mac-mem' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:4873.28-4934.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4955.28-5007.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): interconnect-names:0: 'cpu-mac' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): interconnect-names:1: 'mac-mem' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): interconnect-names:0: 'cpu-mac' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): interconnect-names:1: 'mac-mem' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:4873.28-4934.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4955.28-5007.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): interconnect-names:0: 'cpu-mac' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): interconnect-names:1: 'mac-mem' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): interconnect-names:0: 'cpu-mac' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): interconnect-names:1: 'mac-mem' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:4873.28-4934.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4955.28-5007.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): interconnect-names:0: 'cpu-mac' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): interconnect-names:1: 'mac-mem' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): interconnect-names:0: 'cpu-mac' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): interconnect-names:1: 'mac-mem' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
--
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): interconnect-names:0: 'cpu-mac' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): interconnect-names:1: 'mac-mem' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): interconnect-names:0: 'cpu-mac' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): interconnect-names:1: 'mac-mem' was expected
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
