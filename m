Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA5F2E1F08
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755792279; cv=none; b=QiXNFdx36vjxQSD39y/Tj1AJbjmfFeoVsWxAPHiGIitxlARn52d4eR/ZcI2L0WaLQMAGuDPk44OOs12e0o3aRiSuEHSpkFmgZEL2lJnrby21FMJ5dEbSgirjn53mCT/VNELhlglk1s/ePCPjMy0ehzw2/8CcHkam+CjEMiWW/yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755792279; c=relaxed/simple;
	bh=r+HVe/MRZGv6+j8JgOXRdJVVYFW//HTteV4bKFmCYtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBklEK6CTK0HsLGTalGrVAbZtvePiV2OmiRPX+R/SaDsHSLdYbH1uqhJD0WU3AnSZf8SqsItY+NDbyLjvyjvKAXs/PBT0uAHFy7eHiwZfk5CcIrEX7KjQWqpDBprp8lj+rRUIbKSqZK/xIFEu50hLZPKt8RlCFxfIe4DbeEbJ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRbctJ4m; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRbctJ4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755792278; x=1787328278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r+HVe/MRZGv6+j8JgOXRdJVVYFW//HTteV4bKFmCYtg=;
  b=iRbctJ4mOlsfhwxY7CV/d5W68HXz+9wXSidH+QzMU1Lla9PVJSyR0ABz
   S74gMLPnAcz7PTeo488LWeOOGKrqtMFjTfiXgCnBIxwpdpVKsKySDW1QM
   dj2HZkV2A3FTwp0nvMmrBQowT0TOa02jXCf7/HcYN4rS9QSmvwwmqSOQh
   G8ijQj21Ju2d0uaGRxt5WTKc6QydsYCkuG/5/fl1cKneRi2zIRZ838Y7A
   G4Uqo1lV+uzCoswtsBeCKjfSLRtpgdEe0JQn08EYdx63t0pJGxT4vF/Je
   TLTa0rn8RbD3IbfQC1YCtkSbW9YIuqsM04jRVhsp9z0OW2Lfoe5Xha8oB
   A==;
X-CSE-ConnectionGUID: bC2NdbEeQWyE/w6C3Nmi/A==
X-CSE-MsgGUID: 1iSpiQ19SjW1583KzmICkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57290964"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57290964"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 09:04:37 -0700
X-CSE-ConnectionGUID: Jpmto8iiQ5mtNZ5k2spQ+g==
X-CSE-MsgGUID: /p5N90ToRNieUn2earGzVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168363694"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Aug 2025 09:04:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up7mD-000KSX-2e;
	Thu, 21 Aug 2025 16:04:33 +0000
Date: Fri, 22 Aug 2025 00:02:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] dt-bindings: thermal: rockchip: tighten grf
 requirements
Message-ID: <202508212359.j11JNUZT-lkp@intel.com>
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
In-Reply-To: <20250820-thermal-rockchip-grf-warning-v2-3-c7e2d35017b8@kernel.org>
References: <20250820-thermal-rockchip-grf-warning-v2-3-c7e2d35017b8@kernel.org>
TO: Sebastian Reichel <sebastian.reichel@collabora.com>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Zhang Rui <rui.zhang@intel.com>
TO: Lukasz Luba <lukasz.luba@arm.com>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>
CC: Diederik de Haas <didi.debian@cknow.org>
CC: linux-pm@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: kernel@collabora.com
CC: Sebastian Reichel <sebastian.reichel@collabora.com>

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/thermal-rockchip-unify-struct-rockchip_tsadc_chip-format/20250821-014309
base:   c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
patch link:    https://lore.kernel.org/r/20250820-thermal-rockchip-grf-warning-v2-3-c7e2d35017b8%40kernel.org
patch subject: [PATCH v2 3/3] dt-bindings: thermal: rockchip: tighten grf requirements
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-052-20250821 (https://download.01.org/0day-ci/archive/20250821/202508212359.j11JNUZT-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508212359.j11JNUZT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508212359.j11JNUZT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c.dtb: tsadc@ff250000 (rockchip,rk3328-tsadc): rockchip,grf: False schema does not allow [[58]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dtb: tsadc@ff250000 (rockchip,rk3328-tsadc): rockchip,grf: False schema does not allow [[58]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtb: tsadc@ff250000 (rockchip,rk3328-tsadc): rockchip,grf: False schema does not allow [[56]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb: tsadc@ff250000 (rockchip,rk3328-tsadc): rockchip,grf: False schema does not allow [[57]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb: tsadc@ff250000 (rockchip,rk3328-tsadc): rockchip,grf: False schema does not allow [[58]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dtb: tsadc@ff250000 (rockchip,rk3328-tsadc): rockchip,grf: False schema does not allow [[58]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
