Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE13A3016F3
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761208546; cv=none; b=I4dwDBZXitAJHHsC4W9w1o8vLxY2tBN0KL3rpWyXmHdpno8tTQgblOJrv9bH5JHEEEyA4DPb2DFs5hkznSLPe2D7Z4iwQXXCPBlY2iP0dsw5LG41JW4P989J82EdhvsAsNIcjCCkLDEiIRzHwrowiYMuobbZIjvFaXWglqhRLR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761208546; c=relaxed/simple;
	bh=1QZpG2I+9/TGLLKWwKuz3tpEwCIycttYsUtqtcLMvbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oKnuHx1RygB587n8J/1vANHMS8jMeKqHILA/coA4oval69S9D7Z11VlwMu4rCebfC1f006oVD3JxgTw4gh0Afsaye2fi3PbrkvWwsOiEN4UpaBTukToy4Md5R3hFPb2011Z5iuk+AjSxgI9tYgtN1xR3yd4/kaxiAzJMLCqJzRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBUv+dJP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBUv+dJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761208545; x=1792744545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1QZpG2I+9/TGLLKWwKuz3tpEwCIycttYsUtqtcLMvbc=;
  b=nBUv+dJP+l2DqQmrUTT0v45ITjJvaiWseUeTHcz/VRT2OHS9ttxyIN6x
   u8yLePWbI8fM8wJ5xzBlGtRXqXBA9zPuFBsLJbT/9W1QeSbdFQClZJKr3
   KcreakixnGXJUZ7iLmMByYpB3Nud2OPwtuU+o/V96+f8pWMgRCQ7wlbco
   PZXxWFJb6X0WQzBC+hOJUD8vsCR/Gr04hDyPrYZ8Ozi55E/t5K7WAjSq8
   edpmCf+THnq5j3BdRunlVrBPaFqKWXG/Z0gLsh1oddOIgVyPyDUObYE4h
   xn3BAtxmUNuJGn2kYzWuGBgmBT8pZ45EG4ih2EJSkxCw406hNqOVADjBB
   Q==;
X-CSE-ConnectionGUID: pukYNZDERLKBc/9g2d/TTA==
X-CSE-MsgGUID: hBnQVMqHSoapYKtj44umrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63466925"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="63466925"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 01:35:44 -0700
X-CSE-ConnectionGUID: yqY79O8vRzKzsZJRVNBXxw==
X-CSE-MsgGUID: XoJCGWb4RlG7yT7ef/LE/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="184873537"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Oct 2025 01:35:43 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBqnM-000DEH-2b;
	Thu, 23 Oct 2025 08:35:40 +0000
Date: Thu, 23 Oct 2025 16:32:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: toshiba: tmpv7708: Align node names with DT
 bindings
Message-ID: <202510231651.0dxuer07-lkp@intel.com>
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
In-Reply-To: <20251022133616.74492-2-krzysztof.kozlowski@linaro.org>
References: <20251022133616.74492-2-krzysztof.kozlowski@linaro.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.18-rc2 next-20251023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/arm64-dts-toshiba-tmpv7708-Align-node-names-with-DT-bindings/20251022-214637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251022133616.74492-2-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH] arm64: dts: toshiba: tmpv7708: Align node names with DT bindings
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-051-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231651.0dxuer07-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231651.0dxuer07-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510231651.0dxuer07-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: pinctrl@24190000 (toshiba,tmpv7708-pinctrl): pwm-pins:groups: ['pwm0_gpio16_grp', 'pwm1_gpio17_grp', 'pwm2_gpio18_grp', 'pwm3_gpio19_grp'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: pinctrl@24190000 (toshiba,tmpv7708-pinctrl): pwm-pins:groups: ['pwm0_gpio16_grp', 'pwm1_gpio17_grp', 'pwm2_gpio18_grp', 'pwm3_gpio19_grp'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/toshiba,visconti-dwmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
