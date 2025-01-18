Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E231632D7
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jan 2025 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737194695; cv=none; b=h/Jkol+FBC8xh8/5SUiX797a5gKSCo6QATK6qEaojAtITSmIbPlzIopVdi2hL2tOcxF9MY7yTPykCSbjH1WObVfhCSBOcJCAFRGlZgBGQQxb+l5lzHHYd5desTqEAde5n0qy+8KXn6u210/jqO5kuu4dNL2vxfyXvCFHI7S7e74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737194695; c=relaxed/simple;
	bh=zAU67jDswxlAUTbjEMe0nhiibUI9j7EZWXusJBI/Z4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pb382RjeqLl5mTGRwGz53w+hpPTpM9ho8lc2YO1jXgfReXpNspzio0Z+aWCbvjXawXZBioR3BvWhYwEbpxp+YEWHPRO1CfMgyuGVQyoP3d1vbeN6icNXZpXu4FAStnF9s4P73J7KjnfHqwiROjKx5mxpK+KqYjgtgg/4R0WABxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQKVIFrh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQKVIFrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737194694; x=1768730694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zAU67jDswxlAUTbjEMe0nhiibUI9j7EZWXusJBI/Z4I=;
  b=aQKVIFrhGHw7/BacL2QVvOgVFVA73BN90pqSQr3FPxgWG37e5Wb0J8Bp
   BOfaKF7uF6z2zJlLN4CrbxBV2Xoh2GXkPMo7hcQQcs7w7kukSQnR38wg8
   /wEZ/gxaRCIY7c387YsUHgGAgd1v9SxSEXwzL4DO1Nlt/YfxIIT+k7IC4
   Jc1+peiyJtE0zwDbZBBaKVSEOExqdDGs0qS9eXzUtKZDfy8qL3N9duIS1
   /+nAYqsuubhUBEngPVYiJ72mu0ElE1jWnRJVjDfT72qh0JmS6Fw4vuEg0
   VfR7C74JW5P+pQf0XgPY+Upo+CyBPti2k62GxcCKrPoKghuH+AJUMB0z1
   Q==;
X-CSE-ConnectionGUID: +mHE39rFRpC8OT+oM7CkBg==
X-CSE-MsgGUID: ZI4XZzoQRcaTjNE8zZikHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48122969"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="48122969"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 02:04:53 -0800
X-CSE-ConnectionGUID: C9ncyUiAQP6iL0yWomCeAQ==
X-CSE-MsgGUID: ELk+7FdASiKRFI0hjLPHXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143305701"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jan 2025 02:04:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ5hB-000UIB-2S;
	Sat, 18 Jan 2025 10:04:49 +0000
Date: Sat, 18 Jan 2025 18:04:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 4/5] arm64: dts: amlogic: a4: add pinctrl node
Message-ID: <202501181746.T6gMA3FS-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250115-amlogic-pinctrl-v3-4-2b8536457aba@amlogic.com>
References: <20250115-amlogic-pinctrl-v3-4-2b8536457aba@amlogic.com>
TO: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Kevin Hilman <khilman@baylibre.com>
TO: Jerome Brunet <jbrunet@baylibre.com>
TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-amlogic@lists.infradead.org
CC: Xianwei Zhao <xianwei.zhao@amlogic.com>

Hi Xianwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4de5110762b94b9978fb8182a568572fb2194f8b]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-pinctrl-Add-support-for-Amlogic-SoCs/20250115-144534
base:   4de5110762b94b9978fb8182a568572fb2194f8b
patch link:    https://lore.kernel.org/r/20250115-amlogic-pinctrl-v3-4-2b8536457aba%40amlogic.com
patch subject: [PATCH v3 4/5] arm64: dts: amlogic: a4: add pinctrl node
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250118/202501181746.T6gMA3FS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181746.T6gMA3FS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501181746.T6gMA3FS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:54.27-182.4: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl: missing or empty reg/ranges property

vim +54 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi

10cc4f469cc4d6 Xianwei Zhao 2025-01-15  52  
10cc4f469cc4d6 Xianwei Zhao 2025-01-15  53  &apb {
10cc4f469cc4d6 Xianwei Zhao 2025-01-15 @54  	periphs_pinctrl: pinctrl {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
