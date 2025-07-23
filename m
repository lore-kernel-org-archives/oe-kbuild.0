Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EA01F4CAC
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Jul 2025 17:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753291005; cv=none; b=jr3elAC7Q/teUKhzORvlU/mqIpdJ/ePIuzqieNrg6/6UCx8s5LuVfu05MtRXPgUsBaNJXjjIG3dx59nqpqcFBnkzrptKQYXWlnVRCBebRdHCbStaVrjM7s5qAU597wnvVNZ6uNNO38s6ZMqYPXlRu6hMDAhpFPoL73Fs3P4/wx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753291005; c=relaxed/simple;
	bh=PDUaZHJCnxnXVysnTkDO8l78bvifqi/VZSbJnkTqZlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ij8KC0UV4SQWFqKnRNekOsVFxdjKstVftGgQv2TYKO0/+xnuLlckn/zZmt7x/fuiLTcaUQ3mUv70oKRWsAg3jTG3UATgqyO55uopJSc6M0Qx9kY4izlu12PzLIDY9ndFPdGRkPzFi4ceqSjXTDkTSuscOMslCvl1xK/nqLzghKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWqU54c3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWqU54c3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753291004; x=1784827004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PDUaZHJCnxnXVysnTkDO8l78bvifqi/VZSbJnkTqZlg=;
  b=WWqU54c32iY0PuNP7r+k3rgXX/oCcQsCafC+jmL3qAOP73wkAMfBqBqc
   q2uWC7ki+YqtMlnav4dyNP/8lZ9o+DZrVrc9fZBk8kob2muw58qjovoLQ
   jdcPjgBZHXqFbaxbqNXP/RNl/Kjk8kLgj4AfNvDHw6pTV3Msw4Y/I87WI
   zs3OKouHORnDsyNS3YAMVxG+7RPz4ieI058kbbRQcAXNTIqj1zer03wNc
   RlucDIlr/ddIrHAhyNhGdRIqXfh/DiB/9q/5e1w3le/dlsjUaquCyYFR9
   uBKWnsJ1xuw6td35e5UlCQb+w8B3nIl8EDCSLundEbQZ0qlrzVP/zBKPS
   w==;
X-CSE-ConnectionGUID: 6CZ1f7qxSmWdTBnqzqSY8Q==
X-CSE-MsgGUID: 0yR5IQxwT9ePjqdS1Xp71g==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55680279"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55680279"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:16:43 -0700
X-CSE-ConnectionGUID: lvYwz1/sS0Wnh5eKR9Fn7Q==
X-CSE-MsgGUID: e434ElSfTZmxNXIb0jX/5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="164082686"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jul 2025 10:16:42 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ued56-000JcJ-0G;
	Wed, 23 Jul 2025 17:16:40 +0000
Date: Thu, 24 Jul 2025 01:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/7] arm64: dts: qcom: lemans: Rename boards and clean up
 unsupported platforms
Message-ID: <202507240051.V4tp4ayb-lkp@intel.com>
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
In-Reply-To: <20250722144926.995064-6-wasim.nazir@oss.qualcomm.com>
References: <20250722144926.995064-6-wasim.nazir@oss.qualcomm.com>
TO: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Richard Cochran <richardcochran@gmail.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org
CC: kernel@oss.qualcomm.com
CC: Wasim Nazir <wasim.nazir@oss.qualcomm.com>

Hi Wasim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 05adbee3ad528100ab0285c15c91100e19e10138]

url:    https://github.com/intel-lab-lkp/linux/commits/Wasim-Nazir/arm64-dts-qcom-Rename-sa8775p-SoC-to-lemans/20250722-225646
base:   05adbee3ad528100ab0285c15c91100e19e10138
patch link:    https://lore.kernel.org/r/20250722144926.995064-6-wasim.nazir%40oss.qualcomm.com
patch subject: [PATCH 5/7] arm64: dts: qcom: lemans: Rename boards and clean up unsupported platforms
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-053-20250723 (https://download.01.org/0day-ci/archive/20250724/202507240051.V4tp4ayb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507240051.V4tp4ayb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507240051.V4tp4ayb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'qcom,sm8650' was expected
   	'qcom,sm8750' was expected
   	'qcom,x1e001de' was expected
   	'lenovo,thinkpad-t14s' was expected
   	'qcom,x1e80100' was expected
   	'qcom,x1p42100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
   arch/arm64/boot/dts/qcom/lemans-auto-ride.dtb: /: failed to match any schema with compatible: ['qcom,lemans-auto-ride', 'qcom,sa8775p']
   arch/arm64/boot/dts/qcom/lemans-auto-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/lemans-auto-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/lemans-auto-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/lemans-auto-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/lemans-auto-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/lemans-auto-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
>> arch/arm64/boot/dts/qcom/lemans-auto-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
   	'qcom,sm8650' was expected
   	'qcom,sm8750' was expected
   	'qcom,x1e001de' was expected
   	'lenovo,thinkpad-t14s' was expected
   	'qcom,x1e80100' was expected
   	'qcom,x1p42100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
   arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dtb: /: failed to match any schema with compatible: ['qcom,lemans-auto-ride-r3', 'qcom,sa8775p']
   arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
   arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
--
   	'qcom,sm8550' was expected
   	'qcom,qcs8550-aim300' was expected
   	'qcom,sm8650' was expected
   	'qcom,sm8750' was expected
   	'qcom,x1e001de' was expected
   	'lenovo,thinkpad-t14s' was expected
   	'qcom,x1e80100' was expected
   	'qcom,x1p42100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
   arch/arm64/boot/dts/qcom/lemans-ride-r3.dtb: /: failed to match any schema with compatible: ['qcom,lemans-ride-r3', 'qcom,sa8775p']
>> arch/arm64/boot/dts/qcom/lemans-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/lemans-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/lemans-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/lemans-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/lemans-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/lemans-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
>> arch/arm64/boot/dts/qcom/lemans-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
