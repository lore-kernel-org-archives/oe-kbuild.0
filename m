Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BD632B9BC
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840199; cv=none; b=m+KD/5Vh8PVnffcuIMz8E8ynPruBQrSsMsg9ZXBs4TYZ/iQPIQDjfpYlnTIAVRg4z4bFE97go590oDqbs4m5usF3n7vaN0c75gfrYXpYGc8HF41/M62+vUiGwhaFiLIshO6o1KW3d1iy/w+D7Ag+LSL72x0VPYNCj+TlqRHmT0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840199; c=relaxed/simple;
	bh=2CDSdLdPtfZx9NcUDOnlolmUq9aVBphgKNQd8POFQfk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HL27k/H7T5q22NGGQrqST0s29bGIRD0y0axxvkbjuVMIZAFxYxaJYktFtKHb9tOVPgF6fVfmZUH73ptyDNx1xaXVJMCF7BwO2s9hSYv7O8LhGerYIMghlUGDBNQ+oYdiy4w4CvTh+NxZ5pQE5XUUSe9an3JfC0uFWwihMRdRyXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zeto1JvP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zeto1JvP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768840198; x=1800376198;
  h=date:from:to:cc:subject:message-id;
  bh=2CDSdLdPtfZx9NcUDOnlolmUq9aVBphgKNQd8POFQfk=;
  b=Zeto1JvPH/HLqszLZrIAklNtRz5IY4qBB5LLubKibPcmMmuvGgr8BnRe
   2Jq0ellfAnnSOzGaka1bA7Za7AQOjTprMF9nEqWNn+CmFPtyhCEpGznDU
   Zu/t9vUL7bG2/xR7/3KK10cz64hqIy/Cf/Jf5dDw7YXfUQw7auaXUJ4ye
   gcXn0B1UIhDmkBricoX5TLckojvIph32kaKwOVAikVmlNKdURT29LQ9O4
   xK9scRjbjrcgrMJMRbtawRu4+F1UDw3FPdWP44iN5TbKewfJ9Fqevthva
   3Y5CiN5XNiK8yoka2h/bI9abozxAggiEBuYtdjQkaoGXEbQHf84+sX+SO
   g==;
X-CSE-ConnectionGUID: Jw4XbEG/Sumu2WRDIa3Xug==
X-CSE-MsgGUID: +7OLI6IISY+MQXlcvOAudw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70026114"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70026114"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:29:57 -0800
X-CSE-ConnectionGUID: KqzyS5utS2ybuIsKKCyzIQ==
X-CSE-MsgGUID: RWKrnOmpTcS9JfUjE1pzXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="205809040"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jan 2026 08:29:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhs8X-00000000O2f-2xu3;
	Mon, 19 Jan 2026 16:29:53 +0000
Date: Tue, 20 Jan 2026 00:29:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-pinctrl:devel 12/31]
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c:1107:1: sparse: sparse: bad
 integer constant expression
Message-ID: <202601200047.2JBDh53h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/pinctrl/meson/pinctrl-amlogic-a4.c:1107:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-gpio@vger.kernel.org
TO: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
CC: Linus Walleij <linusw@kernel.org>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>

Hi Bartosz,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   76d415763bae9488dd2b923b1348ce6f26c1f0ae
commit: d184b5fef6178e721c8c3d0f65eed63aba419f74 [12/31] pinctrl: meson: extend build coverage with COMPILE_TEST=y
:::::: branch date: 16 hours ago
:::::: commit date: 10 days ago
config: arm-randconfig-r112-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200047.2JBDh53h-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200047.2JBDh53h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601200047.2JBDh53h-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:1107:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:1107:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:1108:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:1108:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:1109:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:1109:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:1109:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:1109:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1107 drivers/pinctrl/meson/pinctrl-amlogic-a4.c

6e9be3abb78c2f Xianwei Zhao 2025-02-12  1106  
6e9be3abb78c2f Xianwei Zhao 2025-02-12 @1107  MODULE_AUTHOR("Xianwei Zhao <xianwei.zhao@amlogic.com>");

:::::: The code at line 1107 was first introduced by commit
:::::: 6e9be3abb78c2f6c97a51070004a5165702f0ed9 pinctrl: Add driver support for Amlogic SoCs

:::::: TO: Xianwei Zhao <xianwei.zhao@amlogic.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
