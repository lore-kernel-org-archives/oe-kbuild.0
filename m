Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D153742AA9
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 18:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758478754; cv=none; b=cHaAX6ILfrLwnUIbvI+4cFsyrssjG+iiYT1BdoL3+q5gpA9GD+S6lOq4H7Lee3ibD2NZWP4gV7/tEVAYGZ1WQLudm1JL1i5NhjJrj3LEvyGSDzu0eNT6U6iBvNiICF8nvShPJoksOUwSA3A5t35jxuuHUmpcLH8wlEoy1MQj5oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758478754; c=relaxed/simple;
	bh=LF1jAVE5W6FuBZhzaIOC0jRtUmRLIqO3GBwGmuHTNmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AX+rGuCAq4tyzBCE74Gw74grT5JiKCp39wAUavgtH/rUq+RoUtQuQfVgNENVCUEHEgy/OU639Mdjee3qM2Q7gXoZpqLfreGGYPQ6HG5rDTpSHdeoeZeIDAl2qbK9zeZ0XyOHSCyQyHnpLzSuKUjlT5S/Xwx6t0dXNOZPmE4/lHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XpR7IL4O; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XpR7IL4O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758478753; x=1790014753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LF1jAVE5W6FuBZhzaIOC0jRtUmRLIqO3GBwGmuHTNmU=;
  b=XpR7IL4Or2l+nLVj5LeC3o9j0kppGFVi+l408vYnshc8U5fRnD44SQlG
   sMgGRli7M1Ml8xW/64cwCZJ6Bv34vAZCq0bsA48z2tWWJXrRdaCggbbe/
   d0Qddr98I3wAt2ZR0NJzlw6PHPnZl9yU6VCJLUMVO68jpQ9Ed1ywuOuLd
   8hamScw1Z3S/gPloIK0S7rX/I/vc+88j/+sWaRaoRzGg9uzUseSBqWlhr
   r3YlXjZBBSRepCKeRDOWJkch4tS9hdmYmh0ay7hBXUQKLp0r+FBd1UZgg
   6ogUyJfNFv+oJhhF6tdHKZPmCSj18+uRU210gJZJ5t/ffjtLe6D4g3rwS
   g==;
X-CSE-ConnectionGUID: niRjUMncTQyhsg8a8Am4IQ==
X-CSE-MsgGUID: VfqHVNfNTSyJ4H938D/74w==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="70999964"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="70999964"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 11:19:12 -0700
X-CSE-ConnectionGUID: QXIYasc0Tu+8nOtfmjn9pQ==
X-CSE-MsgGUID: bOlahNfKQXSy72FfmPxyHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="175897107"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Sep 2025 11:19:11 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0OeT-0000xN-0B;
	Sun, 21 Sep 2025 18:19:09 +0000
Date: Mon, 22 Sep 2025 02:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: Add EL2 overlay for Lemans
Message-ID: <202509220238.DWs8UjuG-lkp@intel.com>
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
In-Reply-To: <20250921-kvm_rproc_pas-v3-12-458f09647920@oss.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-12-458f09647920@oss.qualcomm.com>
TO: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Mathieu Poirier <mathieu.poirier@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-remoteproc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Hi Mukesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 846bd2225ec3cfa8be046655e02b9457ed41973e]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/dt-bindings-remoteproc-qcom-pas-Add-iommus-property/20250921-041055
base:   846bd2225ec3cfa8be046655e02b9457ed41973e
patch link:    https://lore.kernel.org/r/20250921-kvm_rproc_pas-v3-12-458f09647920%40oss.qualcomm.com
patch subject: [PATCH v3 12/12] arm64: dts: qcom: Add EL2 overlay for Lemans
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-051-20250921 (https://download.01.org/0day-ci/archive/20250922/202509220238.DWs8UjuG-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509220238.DWs8UjuG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509220238.DWs8UjuG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[253, 1], [253, 11], [253, 15], [253, 18], [253, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): reg: [[0, 183844864, 0, 260], [0, 183845376, 0, 192], [0, 183848960, 0, 1904], [0, 183853056, 0, 156], [0, 183857152, 0, 156]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[253, 1], [253, 28], [253, 32], [253, 35], [253, 36]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): reg: [[0, 183877632, 0, 260], [0, 183878144, 0, 192], [0, 183881728, 0, 1904], [0, 183885824, 0, 156], [0, 183889920, 0, 156]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-el2.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
--
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[267, 1], [267, 11], [267, 15], [267, 18], [267, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): reg: [[0, 183844864, 0, 260], [0, 183845376, 0, 192], [0, 183848960, 0, 1904], [0, 183853056, 0, 156], [0, 183857152, 0, 156]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[267, 1], [267, 28], [267, 32], [267, 35], [267, 36]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): reg: [[0, 183877632, 0, 260], [0, 183878144, 0, 192], [0, 183881728, 0, 1904], [0, 183885824, 0, 156], [0, 183889920, 0, 156]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[267, 1], [267, 11], [267, 15], [267, 18], [267, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): reg: [[0, 183844864, 0, 260], [0, 183845376, 0, 192], [0, 183848960, 0, 1904], [0, 183853056, 0, 156], [0, 183857152, 0, 156]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[267, 1], [267, 28], [267, 32], [267, 35], [267, 36]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): reg: [[0, 183877632, 0, 260], [0, 183878144, 0, 192], [0, 183881728, 0, 1904], [0, 183885824, 0, 156], [0, 183889920, 0, 156]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
