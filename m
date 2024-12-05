Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1088F7D
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Dec 2024 03:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733370248; cv=none; b=DAMT6B/Ju+uVar5co8N8sFOmBf1d4AcGkik9PXRGueFs5wHHAC+djoNqv+zEicMhqfxtg8FY8sTxU6RVRrHEuHX/FVQ9Ugx+2RAtwx8vwqAJSLZjta1QDi64N/zWKXGXQwI/R/Qq6t28TfnBZzutZIycN7EfpI46MgIhKaY8ol8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733370248; c=relaxed/simple;
	bh=AAD/4cGQPjni6y/LpGdHhmp3I84MeEYuX83d4ZLXaF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jext1Qm6ShQJWJbhXTqvyDWvdVvytEutTHUe3kAHsZLFsGhtOMiVooAmaOWbq6YZH53XJHyLYu7M0cty6mKBTPihYX52O6aMm3kWbXg5ygsLuEqN2P5P4SfBMiosGjSpGvNVba9/wh0B36IWAenv6pxy8zKRjIfkNTrE8YPoy0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrJ3kXyj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrJ3kXyj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733370246; x=1764906246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AAD/4cGQPjni6y/LpGdHhmp3I84MeEYuX83d4ZLXaF0=;
  b=jrJ3kXyjGmylYVkToBIMAQ9fuOVYr0535YOy3DSfHAvjJYygADN45EwW
   s0fRtKzS+DYJcKjrWrSg013hh+m/mGV7q5x5VLhWE17820EpeZrgyJnPU
   8kj5gnvZzZNZ8D1CpkDjY196mOPjLPyDqhZBuwMJgwKyCpi6WMPABPTv1
   P+p/3hZf0jhfqgFVbYDYo83NuUfKlj9mxcVPlOz++RPgA8OA+eXLNMGM6
   nRwTzg3mdUFDT+om6eS07SeFb5VFMNlUMvsoGMoYpDtEa3Uaa9XMrsUGq
   leh71Not4wAEJQLppIC+x5xYRew9uYFO/of/+N19tGCzmQzMh8crYJJKa
   A==;
X-CSE-ConnectionGUID: AMgE0VnuQGWLNpOiRcofDQ==
X-CSE-MsgGUID: RU+XbhR4QzWOhfYdzS5Cxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44142157"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="44142157"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 19:44:05 -0800
X-CSE-ConnectionGUID: JfwyvAVJQKKbs8tIQR9HDQ==
X-CSE-MsgGUID: tSjDVZ1vRqm7Ju1cef+zRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="117219109"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 04 Dec 2024 19:44:05 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ2mY-0003lR-0o;
	Thu, 05 Dec 2024 03:44:02 +0000
Date: Thu, 5 Dec 2024 11:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: qcs6490-rb3gen: add and enable
 BT node
Message-ID: <202412051101.UGgeHePJ-lkp@intel.com>
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
In-Reply-To: <20241204131706.20791-3-quic_janathot@quicinc.com>
References: <20241204131706.20791-3-quic_janathot@quicinc.com>
TO: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Marcel Holtmann <marcel@holtmann.org>
TO: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
CC: quic_mohamull@quicinc.com
CC: quic_hbandi@quicinc.com
CC: quic_anubhavg@quicinc.com
CC: linux-arm-msm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-bluetooth@vger.kernel.org
CC: linux-pm@vger.kernel.org

Hi Janaki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on robh/for-next bluetooth/master brgl/gpio/for-next broonie-sound/for-next linus/master v6.13-rc1 next-20241204]
[cannot apply to bluetooth-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Janaki-Ramaiah-Thota/regulator-dt-bindings-qcom-qca6390-pmu-document-wcn6750-pmu/20241204-212115
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20241204131706.20791-3-quic_janathot%40quicinc.com
patch subject: [PATCH v4 2/4] arm64: dts: qcom: qcs6490-rb3gen: add and enable BT node
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-051-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051101.UGgeHePJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051101.UGgeHePJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412051101.UGgeHePJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'enable-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'swctrl-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'vddio-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'vddbtcxmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'vddasd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pinctrl@f100000: Unevaluated properties are not allowed ('qup_uart7_sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-pinctrl.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
