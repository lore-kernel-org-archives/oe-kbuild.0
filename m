Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA004C83
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Jan 2025 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738163241; cv=none; b=nvZgqrxFznYkVrhNo+yaz1gH0utYBfn8nV9uElCeKrj3KJuW8gkG8cj5lbWZcXht2PPRe/5sNa3ITbrdnyHTj4CEWDPUBGnDvMf5TB9DkAhoab4XMFHoRaccEKcyipYm/5rk33APdxGS2xQfGT/nYLwVXtqJfgMRGtG6TO++QIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738163241; c=relaxed/simple;
	bh=pW1Nqio8LDpYoMB/MAKkZBq8Yrv0cRe08srQ7ID0SsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DWE2+rKIzYmV8j3ce6TyOn6OPcHB2g1sPhvsjDkwRrhqnfgbl9FhwfCJhG/xBZy5O/RZTVSdDG4swBJFuRzO5yTRDuG3yojNC17r16BMUfayxPo/VPLUsldofXgoQlEkwcVVDyBANyUqhuKH/zGv31ssUYQn2au+m4JpR+g4fQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnO7DqvP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnO7DqvP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738163240; x=1769699240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pW1Nqio8LDpYoMB/MAKkZBq8Yrv0cRe08srQ7ID0SsU=;
  b=DnO7DqvP+wnfbKbhQlMfzk40kiZvESMQ1c3yAl1rFc6irjeXDnq+DGZS
   ckhjEFV+Nn4Riy/qQHoAJnZH1h/g1fJKct8p3MEwCSk+Ge7mp+9nndx1d
   hk+lUmhh4FtSkvBBQWRXCaAqn7hte6R8CjH0rqWubXtahTeVhXZwQsVNT
   i4DcXuMSfTsFT56axyqHXL0QYtBKUapZYsU0NzWoXZB6/0qbHPlyupbU8
   upxdg6KH5tePBE74kzOoQujshCTJT7NncGm+Yd8ft0J8DtKQZQ2ORrdwd
   wQnPOpKSkYgrVJ4gSdDwv8i9b1FyFXJz4f6o0BbLhejsGxKD+hyHvrwkp
   g==;
X-CSE-ConnectionGUID: /80VZ/M2TX2tina5YiLMPQ==
X-CSE-MsgGUID: jrXeMrbvS1Cs1bRuJYa/TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38937321"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="38937321"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 07:07:12 -0800
X-CSE-ConnectionGUID: 5b+0cd35TX+0fjw9YeJP4w==
X-CSE-MsgGUID: Vm2n1MO4S/ih/S9Ju8ROEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="109035099"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Jan 2025 07:07:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1td9el-000j3H-1d;
	Wed, 29 Jan 2025 15:07:07 +0000
Date: Wed, 29 Jan 2025 23:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 1/4] arm64: dts: rockchip: add overlay test for
 Wolfvision PF5
Message-ID: <202501292254.IalRivBZ-lkp@intel.com>
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
In-Reply-To: <20250128-pre-ict-jaguar-v3-1-7be2f09d390a@cherry.de>
References: <20250128-pre-ict-jaguar-v3-1-7be2f09d390a@cherry.de>
TO: Quentin Schulz <foss+kernel@0leil.net>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Jagan Teki <jagan@edgeble.ai>
TO: Niklas Cassel <cassel@kernel.org>
TO: Michael Riesch <michael.riesch@wolfvision.net>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Quentin Schulz <quentin.schulz@cherry.de>

Hi Quentin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6d61a53dd6f55405ebcaea6ee38d1ab5a8856c2c]

url:    https://github.com/intel-lab-lkp/linux/commits/Quentin-Schulz/arm64-dts-rockchip-add-overlay-test-for-Wolfvision-PF5/20250128-210629
base:   6d61a53dd6f55405ebcaea6ee38d1ab5a8856c2c
patch link:    https://lore.kernel.org/r/20250128-pre-ict-jaguar-v3-1-7be2f09d390a%40cherry.de
patch subject: [PATCH v3 1/4] arm64: dts: rockchip: add overlay test for Wolfvision PF5
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-051-20250129 (https://download.01.org/0day-ci/archive/20250129/202501292254.IalRivBZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501292254.IalRivBZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501292254.IalRivBZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: panel@0: compatible: ['jasonic,jt240mhqs-hwt-ek-e3', 'sitronix,st7789v'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/sitronix,st7789v.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55: compatible:0: 'sitronix,st1624' is not one of ['sitronix,st1232', 'sitronix,st1633']
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55: compatible: ['sitronix,st1624', 'sitronix,st1633'] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55: Unevaluated properties are not allowed ('compatible', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: /i2c@fe5a0000/touchscreen@55: failed to match any schema with compatible: ['sitronix,st1624', 'sitronix,st1633']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
