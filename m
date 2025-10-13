Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C78924A079
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Oct 2025 11:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760355321; cv=none; b=IZz/Krjb9yD3MgtH03Zo/BeQU49hFKehYWeDCE63GMHoqm9MvG9nlMH+1Mi5wSEOOoawk5iLZogwu0GVshtQuBwm2X+kgyIsC20J+LxznYnlZW9lnXxFaj8bn0AH821+Lzpuph44JnoMI6P9+VNGrx/zzl8huE8aABr7eUeWcrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760355321; c=relaxed/simple;
	bh=13SmfkJkUcAF4oEjFh5Dc1sHjBZhGoF/JH8wHdNLo2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b171/oDcJMn9hONcYvw6DvxGnmDew4WY+1szvq/C5QFEulOMcitei9jS7oyh5lXa1Na3CqlwjR/6ERJMGp2Xwh9nBTc8R3cnsrqnSuksTLsFWgyJIDzIVDO/TRLc2YxVdpOsXMivT8AxNOLLSsOt6CjJ2YEHSYeD932FW1rRuzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqVxT6CI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqVxT6CI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760355319; x=1791891319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=13SmfkJkUcAF4oEjFh5Dc1sHjBZhGoF/JH8wHdNLo2g=;
  b=dqVxT6CIXjjJ6OgC9tIWZKJhU4iLB8UPwXY/ZWyjjRhgrOXt5mRs8PJ+
   wzkG/twjXgHoRcAZ3yIZ8FgTImh5SHQ+XzfL4+BI5BuXwDWhePg84CvDj
   s+spjEFt3QDwSlp6RV1SIXUg5YEd0kb6O8g8eS/LUed01YDXz22Xk4Hw+
   GONokOiwUdtOLy+kKHvw9OgTRzikdcFGVl7loCDoTR8mgezRYy1AUMM2l
   gtXK4AdlP8bPbwZbliVRXqVNdVWr/Js22Q/maqdEu3oPiV3cp+j8kyR5V
   oMn7gAPAnjnSWe+jmhJdsONbSSR6kIGbzkFapNfxHUYySKfTtm9saY/Wi
   A==;
X-CSE-ConnectionGUID: n5rgkOMURDa0D4WLPW0OxQ==
X-CSE-MsgGUID: cR377LyqSGuxWBZlgYDnRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62194009"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="62194009"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 04:35:19 -0700
X-CSE-ConnectionGUID: uGN+hIj0TcOV35/W7F0JTA==
X-CSE-MsgGUID: uY+va4FrQsWsfcSh9Ylbzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="180719766"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 13 Oct 2025 04:35:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8Gpf-0000Ot-34;
	Mon, 13 Oct 2025 11:35:15 +0000
Date: Mon, 13 Oct 2025 19:34:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk:next/dt64 5/7]
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb:
 /soc@0/clock-controller@19c00000: failed to match any schema with
 compatible: ['samsung,exynosautov920-cmu-mfc']
Message-ID: <202510131959.Q1i8pOFj-lkp@intel.com>
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
TO: Raghav Sharma <raghav.s@samsung.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/dt64
head:   f409bd20f0a94ca4eece7eb919b800e013abc043
commit: e3be50e829aa1aee713bf0c6907acf13d48be310 [5/7] arm64: dts: exynosautov920: add CMU_MFC clock DT nodes
:::::: branch date: 9 hours ago
:::::: commit date: 11 hours ago
config: arm64-randconfig-054-20251013 (https://download.01.org/0day-ci/archive/20251013/202510131959.Q1i8pOFj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251013/202510131959.Q1i8pOFj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510131959.Q1i8pOFj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/clock-controller@19c00000: failed to match any schema with compatible: ['samsung,exynosautov920-cmu-mfc']
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: /soc@0/clock-controller@1a800000: failed to match any schema with compatible: ['samsung,exynosautov920-cmu-m2m']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
