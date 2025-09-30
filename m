Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D6E2BCF41
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Sep 2025 06:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759214954; cv=none; b=qyipyBgKHCZjFOcSSbs+Z2RIgSQd8QRdOSyQPNThcg+CJzBgSIQz0kQ+3dvc+vuwpLitBT2tkOiJfQnfdQV89WGJw3zvsTrJDFU5Zz7VigoyGzqIXup2+Jy5zJyObq08PLAc8x6ict/+E2oTF03jP+OUfCfp1SXpgAlENTo0Y/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759214954; c=relaxed/simple;
	bh=pRcrfn82c2X5iBd6JnHZt73b4ebXPXAa309p4FQvPcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FLIgiURwGcAi4stKfUon3EtgS9yYBq+JtN1fmGXjpVSeClQ6ygYTBWOhiZo6CjaE6wUQF/6QPvgRxxUbiLNQkVe1konTj/IalBbETugZjnhfCoqxZQ6Zy6NXLkQ4wGZnhzUTWakQk4mXvFBN6DR5iN/whAhMce91jbjwDTWogwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4zYvG41; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4zYvG41"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759214952; x=1790750952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pRcrfn82c2X5iBd6JnHZt73b4ebXPXAa309p4FQvPcw=;
  b=l4zYvG41V3iV+KF8njSWEbzmbjLQnYL2tUiswfw2aPurrXdiizTJGuDt
   0fi8REjvY8tEvHYM8CUtXC0FieMyZ4z3rqLbFb87Lxvj+IBadgp2xV3jF
   3K5io480JeExuSV+eQlOlIhv7vYjggbn6wCiyz3icFwpZ3XKI4ZYZy9B3
   yAZt9ieA6rk2WyAwnF6Dins7wY+LUpm8XQyqZ7k7GYiBBS3brtDBN/Ozn
   K5wUdch50cS4tWV+Cu2QQlXOqtt02TkbDGG2QNxG1JeYOD+FzGJzC+oDt
   pRWj5gbUbxxUhN5hg7uJNViu6D6lQ5hIjzAFmJ6EdQCuzBnMo1zY//3+z
   A==;
X-CSE-ConnectionGUID: fUCvzhnxRy2v+DWJcv26qw==
X-CSE-MsgGUID: yixXai+WQPmpAb0oC6m+OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72826999"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="72826999"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 23:49:11 -0700
X-CSE-ConnectionGUID: KPLGe43ASsuTGuWcsbQu9w==
X-CSE-MsgGUID: 329D3UQ9S/C/yo3M8XkLjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="183625254"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2025 23:49:10 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3UAc-0000yd-2X;
	Tue, 30 Sep 2025 06:49:06 +0000
Date: Tue, 30 Sep 2025 14:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 1/3] dtbindings: add binding for iommu-map-masked
 property
Message-ID: <202509301453.52T9rrjH-lkp@intel.com>
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
In-Reply-To: <20250928171718.436440-2-charan.kalla@oss.qualcomm.com>
References: <20250928171718.436440-2-charan.kalla@oss.qualcomm.com>
TO: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>

Hi Charan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250926]
[also build test WARNING on v6.17]
[cannot apply to robh/for-next linus/master v6.17-rc7 v6.17-rc6 v6.17-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charan-Teja-Kalla/dtbindings-add-binding-for-iommu-map-masked-property/20250929-011949
base:   next-20250926
patch link:    https://lore.kernel.org/r/20250928171718.436440-2-charan.kalla%40oss.qualcomm.com
patch subject: [RFC PATCH 1/3] dtbindings: add binding for iommu-map-masked property
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250929 (https://download.01.org/0day-ci/archive/20250930/202509301453.52T9rrjH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cd4c5280c73d42fd41819cc8927d00787ade88e0)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509301453.52T9rrjH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509301453.52T9rrjH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: video-codec@aa00000 (qcom,x1e80100-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:4873.28-4934.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4955.28-5007.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: video-codec@aa00000 (qcom,sa8775p-iris): iommus: [[55, 2176, 1024], [55, 2183, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: video-codec@aa00000 (qcom,sa8775p-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: video-codec@aa00000 (qcom,sa8775p-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
--
>> arch/arm64/boot/dts/qcom/monaco-evk.dtb: video-codec@aa00000 (qcom,qcs8300-iris): iommus: [[54, 2176, 1024], [54, 2183, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/monaco-evk.dtb: video-codec@aa00000 (qcom,qcs8300-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/monaco-evk.dtb: video-codec@aa00000 (qcom,qcs8300-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: video-codec@aa00000 (qcom,qcs8300-iris): iommus: [[54, 2176, 1024], [54, 2183, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: video-codec@aa00000 (qcom,qcs8300-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: video-codec@aa00000 (qcom,qcs8300-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3928.27-3983.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4097.22-4187.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: video-codec@aa00000 (qcom,sm8550-iris): iommus: [[53, 6464, 0], [53, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:4873.28-4934.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4955.28-5007.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: video-codec@aa00000 (qcom,sa8775p-iris): iommus: [[55, 2176, 1024], [55, 2183, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: video-codec@aa00000 (qcom,sa8775p-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: video-codec@aa00000 (qcom,sa8775p-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:4873.28-4934.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4955.28-5007.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: video-codec@aa00000 (qcom,sa8775p-iris): iommus: [[55, 2176, 1024], [55, 2183, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: video-codec@aa00000 (qcom,sa8775p-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: video-codec@aa00000 (qcom,sa8775p-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:4873.28-4934.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4955.28-5007.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: video-codec@aa00000 (qcom,sa8775p-iris): iommus: [[56, 2176, 1024], [56, 2183, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: video-codec@aa00000 (qcom,sa8775p-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: video-codec@aa00000 (qcom,sa8775p-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
   arch/arm64/boot/dts/qcom/lemans.dtsi:4873.28-4934.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4955.28-5007.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: video-codec@aa00000 (qcom,sa8775p-iris): iommus: [[56, 2176, 1024], [56, 2183, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: video-codec@aa00000 (qcom,sa8775p-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: video-codec@aa00000 (qcom,sa8775p-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3833.27-3907.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3928.27-3983.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4097.22-4187.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: video-codec@aa00000 (qcom,sm8550-iris): iommus: [[53, 6464, 0], [53, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: video-codec@aa00000 (qcom,sm8550-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: video-codec@aa00000 (qcom,sm8550-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3928.27-3983.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4097.22-4187.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: video-codec@aa00000 (qcom,sm8550-iris): iommus: [[53, 6464, 0], [53, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: video-codec@aa00000 (qcom,sm8550-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: video-codec@aa00000 (qcom,sm8550-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3928.27-3983.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4097.22-4187.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: video-codec@aa00000 (qcom,sm8550-iris): iommus: [[53, 6464, 0], [53, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: video-codec@aa00000 (qcom,sm8550-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: video-codec@aa00000 (qcom,sm8550-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3833.27-3907.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3928.27-3983.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4097.22-4187.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dtb: video-codec@aa00000 (qcom,sm8550-iris): iommus: [[53, 6464, 0], [53, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3833.27-3907.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3928.27-3983.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4097.22-4187.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: video-codec@aa00000 (qcom,sm8550-iris): iommus: [[53, 6464, 0], [53, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5049.22-5140.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5474.27-5549.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5571.27-5627.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: video-codec@aa00000 (qcom,sm8650-iris): iommus: [[75, 6464, 0], [75, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: video-codec@aa00000 (qcom,sm8650-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: video-codec@aa00000 (qcom,sm8650-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5049.22-5140.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5571.27-5627.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: video-codec@aa00000 (qcom,sm8650-iris): iommus: [[75, 6464, 0], [75, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: video-codec@aa00000 (qcom,sm8650-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: video-codec@aa00000 (qcom,sm8650-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5049.22-5140.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5571.27-5627.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: video-codec@aa00000 (qcom,sm8650-iris): iommus: [[75, 6464, 0], [75, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: video-codec@aa00000 (qcom,sm8650-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: video-codec@aa00000 (qcom,sm8650-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: video-codec@aa00000 (qcom,x1e80100-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: video-codec@aa00000 (qcom,x1e80100-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: video-codec@aa00000 (qcom,x1e80100-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: video-codec@aa00000 (qcom,x1e80100-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: video-codec@aa00000 (qcom,x1e80100-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: video-codec@aa00000 (qcom,x1e80100-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: video-codec@aa00000 (qcom,x1e80100-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: video-codec@aa00000 (qcom,x1e80100-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[50, 6464, 0], [50, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[50, 6464, 0], [50, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[50, 6464, 0], [50, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4942.11-4952.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[50, 6464, 0], [50, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: video-codec@aa00000 (qcom,sa8775p-iris): iommus: [[55, 2176, 1024], [55, 2183, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: video-codec@aa00000 (qcom,sa8775p-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: video-codec@aa00000 (qcom,sa8775p-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
--
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: video-codec@aa00000 (qcom,sm8650-iris): iommus: [[75, 6464, 0], [75, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: video-codec@aa00000 (qcom,sm8650-iris): 'iommu-map-masked' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: video-codec@aa00000 (qcom,sm8650-iris): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[60, 6464, 0], [60, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[50, 6464, 0], [50, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[50, 6464, 0], [50, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[50, 6464, 0], [50, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: video-codec@aa00000 (qcom,x1e80100-iris): iommus: [[50, 6464, 0], [50, 6471, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
