Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427F9220F2D
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Mar 2026 21:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773092498; cv=none; b=MQiEWPpcne0Tfq+O+gVGuMYbKXLR+Chg3z9YUpUYV9HFlrWykxpNGDKinNcaJ8/yRpNCzI5a+2zbpoz+ZkgMfB6Me1QoJeBgOXqObR8WoawN3pun3vrpF+YB1Z/oohTcT0hmYkt0P9zLVU+MRK/q+mNDTw7NbJWh9BDTE74Xa7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773092498; c=relaxed/simple;
	bh=VMpBa1DWoP2QVZ/9amaCCBNdyfprd/nX0tETfrqBBW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VVRRNVbFMXczaPLGc7AchXyFX2mKAO9w47jDKszp9vFqLf3rg65NVw1o9dAi78Ppmm8RKhrWeblQt6KwLCXMIAU6xzRU/Oti0ilIEhzPklRJuNhe0vYa+G3w/QyAoKzQxN1iTdWvEYpTx1Iawsi1Yi8KUxijsAa0CwNXWtl4Vns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+iL0B4f; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+iL0B4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773092495; x=1804628495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VMpBa1DWoP2QVZ/9amaCCBNdyfprd/nX0tETfrqBBW0=;
  b=e+iL0B4foZL1XyXQS9U9MZq4T+s8wOr5AVy7nvpdFMDkGi33AZYH+YYP
   hxpDDPMy6GIOh/UM2PwOazhrV1JseHARwJh57nFxkN3bAGgi4kBX8LSF9
   un0Sy3L80miGEYQm1R+on6MaKcQqpr549w1EF1nJ9coFkiPXfdkxOTdOe
   8NPmcyF8Bgy5yc+tQwn9G0SEbBIKt9zpHyOaluZOJZpJ7wOgaNNlSGXTu
   DK4/HxQ9RXHu307k9L2KsYdjwdv5NATnSPU++Utt5JX4l/yYI8jpXTYOk
   nrbRkumdJOd7MPHg+JrnW84s8DnnissSRMEaC5Emwu3qcylt/umZTC3oq
   A==;
X-CSE-ConnectionGUID: fGspezpjS9O5Ub83UADZdQ==
X-CSE-MsgGUID: AlLLb47kRJyxnKyd3PTfmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73828175"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="73828175"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 14:41:34 -0700
X-CSE-ConnectionGUID: np+aRXloSOGFl9rJQLFyYQ==
X-CSE-MsgGUID: faN5OzUQS6ugzqaZ7piQ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="219021023"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 09 Mar 2026 14:41:34 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vziLz-000000002wT-1Kro;
	Mon, 09 Mar 2026 21:41:31 +0000
Date: Mon, 9 Mar 2026 22:40:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG
 Phone 3
Message-ID: <202603092255.faGFuxu5-lkp@intel.com>
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
In-Reply-To: <20260308-sm8250-asus-obiwan-v1-3-3c72941eb796@pm.me>
References: <20260308-sm8250-asus-obiwan-v1-3-3c72941eb796@pm.me>
TO: Alexander Koskovich <AKoskovich@pm.me>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Kees Cook <kees@kernel.org>
TO: Tony Luck <tony.luck@intel.com>
TO: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Alexander Koskovich <akoskovich@pm.me>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Koskovich/dt-bindings-arm-qcom-Add-ASUS-ROG-Phone-3/20260309-044301
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260308-sm8250-asus-obiwan-v1-3-3c72941eb796%40pm.me
patch subject: [PATCH 3/3] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG Phone 3
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-2051-20260309 (https://download.01.org/0day-ci/archive/20260309/202603092255.faGFuxu5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603092255.faGFuxu5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603092255.faGFuxu5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4947.27-5003.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8250-asus-obiwan.dtb: camera@36 (ovti,ov8856): 'orientation', 'rotation' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8856.yaml
   arch/arm64/boot/dts/qcom/sm8250-asus-obiwan.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any schema with compatible: ['tianma,ta066vvhm03']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
