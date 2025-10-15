Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A1E1E285A
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Oct 2025 23:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760571840; cv=none; b=tBqTEhTUgnvFDeU4ZUPu1Bcff+9L/8PWYOowlBiQ2eeu/LV6HXJLHDo2jbobZ9cHfRkTOtyfEuwkrbOj4K6Xo0ubhG8Rbajba2bhFIDqBzh0GkfDQ7CwMv/X6mHjjRc7epzQR9BIrPI4aIDxelgTK0QIK3wInX5p3rTsMo4L2Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760571840; c=relaxed/simple;
	bh=cFHaC6M4B/ZegwO4J9d0pAh1881krAlEZ3IGq1RmArQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mFo3wO5ifYqhsG+wZbICkodh7/Bd2IMtEa4DhRcV1dnJiv6HzgATfPPe5t5JVBRV3+zMLHOufgXKN/j8mCBDF9/8btdMlHFtKKirVA7l/ZaQu9VxkjryGh090R8Fsn4lxx82175z0AS9V+fL249MTooMXkBr0R5UGZCacYoi698=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtibXWlJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtibXWlJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760571839; x=1792107839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cFHaC6M4B/ZegwO4J9d0pAh1881krAlEZ3IGq1RmArQ=;
  b=DtibXWlJdS4iuFGzt6T6dKJcD/5/814urzh+wzheYj53pepqYfR/WhTC
   NUkkn9LBBsJq/Rsa23FoSCcdbKO1JELmLurdvZZ2h0BZdmv8fEuRjCI/T
   Z4n1YrKL5ugVgOFKUV3RLKA0Te6d3GS5kiU5YZC8amEV9LBIApYsIYYmR
   By+RKMLGSC17GtsKjJmLSeqyzg++EdmP+QsV88m4L6/NzUEqUi0mlq5FW
   1wXy4ouhBpasDLzjHveWrwZbPr5bNOLZvUYkJTq711UeHwvB+ralBengy
   n4Tn3ZcBnYscavL78mTn10K923p4EMZUOyxrHrKuSq+1dDjdw9AihKNrU
   w==;
X-CSE-ConnectionGUID: qo/N2AYHQ7WWUJE+KVP9cg==
X-CSE-MsgGUID: l629JqaiRayYoXysl/le1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62687944"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62687944"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 16:43:58 -0700
X-CSE-ConnectionGUID: iZCZNJ8vS7a/FGlGxJ0s5g==
X-CSE-MsgGUID: EmWEzUr/RyybCU3n3lEnnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="186314372"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 Oct 2025 16:43:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9B9l-0004If-32;
	Wed, 15 Oct 2025 23:43:49 +0000
Date: Thu, 16 Oct 2025 07:43:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add support for QCS615 talos
 evk board
Message-ID: <202510160713.L2K1IxeJ-lkp@intel.com>
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
In-Reply-To: <20251014120223.1914790-3-tessolveupstream@gmail.com>
References: <20251014120223.1914790-3-tessolveupstream@gmail.com>
TO: Sudarshan Shetty <tessolveupstream@gmail.com>
TO: andersson@kernel.org
CC: konradybcio@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: tessolveupstream@gmail.com

Hi Sudarshan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.18-rc1]
[also build test WARNING on linus/master next-20251015]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sudarshan-Shetty/dt-bindings-arm-qcom-Add-QCS615-Talos-EVK-SMARC-platform/20251014-200319
base:   v6.18-rc1
patch link:    https://lore.kernel.org/r/20251014120223.1914790-3-tessolveupstream%40gmail.com
patch subject: [PATCH v3 2/2] arm64: dts: qcom: Add support for QCS615 talos evk board
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20251015 (https://download.01.org/0day-ci/archive/20251016/202510160713.L2K1IxeJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160713.L2K1IxeJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510160713.L2K1IxeJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/talos-evk.dtb: clock-controller@100000 (qcom,qcs615-gcc): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
   arch/arm64/boot/dts/qcom/talos-evk.dtb: mcp2515@0 (microchip,mcp2515): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/net/can/microchip,mcp2510.yaml#
   arch/arm64/boot/dts/qcom/talos-evk.dtb: mcp2515@0 (microchip,mcp2515): Unevaluated properties are not allowed ('clock-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/microchip,mcp2510.yaml#
   arch/arm64/boot/dts/qcom/talos-evk.dtb: extcon-usb-1 (linux,extcon-usb-gpio): 'id-gpio', 'vbus-gpio' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/extcon/linux,extcon-usb-gpio.yaml#
>> arch/arm64/boot/dts/qcom/talos-evk.dtb: extcon-usb-1 (linux,extcon-usb-gpio): 'anyOf' conditional failed, one must be fixed:
   	'id-gpios' is a required property
   	'vbus-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/extcon/linux,extcon-usb-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
