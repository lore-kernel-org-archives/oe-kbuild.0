Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675542;
	b=b6vnPkwNoTikA82ddoWzQwOtZXe0F96gRKc/BIPcdFuQ33hpRPhyNzKYRKWuaa96cqN8
	 NkWk32/1HSv3Rnnjgs7irit1Q5uTROJcQktlAM4ArDWlToqrQMX9QiTJnyeLBMbM/gjiZ
	 tXb/NZYDdHXUsR2PEt3k/WQQNJgZG9nMFCG4xSWnGKbzQZZJacAwyUWheMWgP8x0nkpaq
	 h/BoKTSVkwetw0UA867J9CNWrGGbUwglGykCT7rkjbIM/GX2mOM71UUOiaDI4JIXCQqUD
	 /dMiQXU+TbvnILxgofm9uxJ4F5b+CXVZRi8a2ibwRCEBlKrlWAwPwAQa1sHxso82JeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675542;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=lFuQxlUo3YYM3uB/mKy0XWU+9W8D5X2uNJ4A+vcXiG0=;
	b=I3JHub68Wg0KXs9TERPHluwBZDQ4IfQsMjBJKQoG181ZimeDy9N/LgwmcbnczrCnoRYt
	 kWUfk3/OVimdYP4ujUfhstOooQubkcpePI1D8P5IUIn+HqQp8MSF1eZiDm6EuOGWe2BMW
	 UfkPX8hY1ht1PLeHhwS8dcxUBqvJrI3hLjx5OEeisM7ogaAKQJ0IgMQB744ZytP/4KZzP
	 7HWmtoER46S3GCQXJCPcCfLxQnnH3nXcYa2SN5DmpIYkx1gJYI9ySW6Uqj2HFYNfPNj3Z
	 VQCO59bsTaaw8uBwaIMLAascAXV+QjGcNDhnPyTX5o2zFKCmetJN67THkh1n0bDB4MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gXuc3lHu;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E749606A323
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 16:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E749606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gXuc3lHu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794675542; x=1826211542;
  h=date:from:to:cc:subject:message-id;
  bh=GRU/h4yhA9oPeOhr5Zy0A8WXOT0VrF2oQzlkemZKOzU=;
  b=gXuc3lHuVvaH3J/NwjlHXo8Tz3lVfSOZUc6O1ivFOXc56TCiwVgq6qGB
   BtCxImDTB7fxC82pS4ulh30OB/EmHgJUmx6YrNBcJuR0d06KIl6GX+l7w
   288Jnkq0JEAlTMKVsSOdPmW737LviVEA1FoI22W3eCxoUay7wawuyGMvh
   VwGeX7Pr2kEfLoiiNv7a0RbVQG1k500i6BC9Qlq+f1VUicbJMbWCrEGKJ
   Drws0EuL7OlEEnwPEwSxaB098XTCTv80ZoyWFuJNkelgk2YaylklSXKIh
   qd8CsaY6oBefaldoFR7ZzJT+hFyIFnLdFhcMQYSuwlGbE+78RcEjxQIMH
   g==;
X-CSE-ConnectionGUID: fuFP/OaSSgaK6AvGe0NZcw==
X-CSE-MsgGUID: XSDjPIkIRv2UbLPogtIHag==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3496165"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3496165"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 08:59:01 -0800
X-CSE-ConnectionGUID: fKxbDPebSoSzYAM/mo5jBg==
X-CSE-MsgGUID: tRgVoHd2SJSvxdpg9V9RDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9186254"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 14 Nov 2026 08:59:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSH5e-000000001pL-15Ei;
	Sat, 14 Nov 2026 16:58:58 +0000
Date: Sat, 14 Nov 2026 17:58:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARNING: modpost: drivers/macintosh/ans-lcd.ko: missing
 MODULE_DESCRIPTION()
Message-ID: <202611141732.2t4o8o87-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit | /zdci/kbuild/indicators/d9/d900723d78adec229996aefbab0dcaa66a177b77-reported_build_error_fbc-warning"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jani Nikula <jani.nikula@intel.com>
CC: Nicolas Schier <nsc@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   97d73c8251226cf27cc6656b4c542869bb8c69fa
commit: d900723d78adec229996aefbab0dcaa66a177b77 modpost: use mod_warn() and mod_error(), clean up logging
date:   3 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 months ago
config: powerpc-randconfig-r2109-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141732.2t4o8o87-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611141732.2t4o8o87-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d900723d78ad ("modpost: use mod_warn() and mod_error(), clean up logging")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611141732.2t4o8o87-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/macintosh/ans-lcd.ko: missing MODULE_DESCRIPTION()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
