Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A832641FC
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jun 2025 16:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697147; cv=none; b=ia1j0uPArWyt8NUV1usBPK2i8UuFHl8BNwJCVhKoSuLRf9bvGeY2etjRkQN6yiS3igVmuf13wbxoMQzmxx7IFvxfkHuASROXRuD7dNEzeqgrSeZ3/9f9eehNW3JAs7gZWnBx/kg1XdgM/GRBmrQHTxkWEuGpkNnOPzEwab+ve9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697147; c=relaxed/simple;
	bh=Y4dwxI2fxnINhEzUBVFacj5fAsoH7qoBHy3hf6U2GQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nTkN0N2v8yoiw4oKP0HqPMMObr9iBtvUTK83AyJPQGAZBP4zqfvxEGafQ1fUVPcCrzj/UiOYYpiVzUzcil+Ut05DL7nJ0VRzQmnMJcaIBbbAPlMnpobfJbQ4RX8Y/9JoIe+gU5JTFcZYhBTLYyfy3WZs+NawhSDei3ZUPSRxQV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7904Pq8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7904Pq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750697146; x=1782233146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y4dwxI2fxnINhEzUBVFacj5fAsoH7qoBHy3hf6U2GQI=;
  b=N7904Pq8kc70kNw/H2g3HoiSGB8DIk8Vc5jkAxOyhRiwiYRX7T8LYklG
   bhoZZyRHY52X7Ha7TJExR/XosGNLxteqcM4/8qhUjhYo4qLH0cyVv5RsL
   gk8gh3HuL6KAJKVBsZCPsJDRe/mXrlrQD/0D8VE7InJO6699JJGSfsLdn
   eM34iviq859sk4Er/bHVgBK+tlTI3DD15Zgm5I/WyKtBbStS9VDFP8ADj
   ZlJTQrnh3n0IM9XlLd7CRZvphghUYfoCXULxN3g/0G/xPRiQ+VSjo8sCV
   EG7eHe+o7oBZLIxgDp79VsKeBX26mMhsryiqQ6PrToK2zXX4kJw43SDZa
   Q==;
X-CSE-ConnectionGUID: OqMJMk/QT9OefaqLJ/Ss+g==
X-CSE-MsgGUID: TMvGatn0S6+zvyjx2XCVRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52785055"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="52785055"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 09:45:46 -0700
X-CSE-ConnectionGUID: wjYCilOBT7+UW8bXPbJ5WQ==
X-CSE-MsgGUID: RItQmwzJSDeC95VbEKY7GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="157141648"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jun 2025 09:45:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTkIf-000P7W-2R;
	Mon, 23 Jun 2025 16:45:41 +0000
Date: Tue, 24 Jun 2025 00:45:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
Message-ID: <202506240042.fVcEBmFv-lkp@intel.com>
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
In-Reply-To: <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
References: <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
TO: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: phone-devel@vger.kernel.org
CC: Cristian Cozzolino <cristian_ci@protonmail.com>

Hi Cristian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0ff41df1cb268fc69e703a08a57ee14ae967d0ca]

url:    https://github.com/intel-lab-lkp/linux/commits/Cristian-Cozzolino-via-B4-Relay/dt-bindings-vendor-prefixes-Add-Flipkart/20250621-035317
base:   0ff41df1cb268fc69e703a08a57ee14ae967d0ca
patch link:    https://lore.kernel.org/r/20250620-rimob-initial-devicetree-v1-3-8e667ea21f82%40protonmail.com
patch subject: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for Billion Capture+
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250621 (https://download.01.org/0day-ci/archive/20250624/202506240042.fVcEBmFv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240042.fVcEBmFv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506240042.fVcEBmFv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8953.dtsi:910.27-960.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1328.11-1338.7: Warning (graph_child_address): /soc@0/usb@70f8800/usb@7000000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dtb: gpu@1c00000 (qcom,adreno-506.0): clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
