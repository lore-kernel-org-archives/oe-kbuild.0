Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4566A2FFFA4
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 19:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768937450; cv=none; b=CwpYpc8NpGeJIuSYELe8TuTUVedJrbYe/dpIlqYnQnKJCta6FuSE4aKokKSjm2p4wOtEYldYwJLs2UedrVy6IEoRz6k4JQo5GffZ8iN9uC2r2ipxIQHWGAElRkygHgPQYdplznhdEIj+n3YB5aIiC7WXuUOuDhVlZUPmbhed/oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768937450; c=relaxed/simple;
	bh=fHs6GaYwcxjpduGt4AYvEyD7ASh/S5rFvLUn9leBplI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UErPucPkrAzz6x8TnKlj/R6folcuH/CgiYmQ+YKZJwEpvBqI9Bxm/dUQ+5MK+8mkEq8u6rlcGyGwR8MZmbIbGQWDdxm0tfzAbvLIN3UqfJFa3llak+oRzziik9Jb1Pzx3nXs6pZsPNueRvYK0ivzx81aFo9c+AIDbEU8L0LMGVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHApFT+N; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHApFT+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768937449; x=1800473449;
  h=date:from:to:cc:subject:message-id;
  bh=fHs6GaYwcxjpduGt4AYvEyD7ASh/S5rFvLUn9leBplI=;
  b=dHApFT+N3q0FaECVhDhrvUIGhmcLXeKb9FBxf5aMyT0HqSxt7ki5yxgW
   w8lpa8aXzM+Ocb2RSonuDrDuisM94ZLZhqKUiLGRiwmltZkjL/7DgInvl
   9ofDSH3HhS9tXd6Akf/e8wXECwt2JBw0wGp/I6LLwy7DYIom9dM9tI0/F
   TnBTRAVQ4mgVKq5TJIMc2hx3OlmdNG86CQiao5JoQ3S3CBybI+S+r2t9e
   9vNPnLgQNeCWfaKep5ZtyTGwDiSJvo7gkIDCkWkqvKQSsn2PPcXHCN3ib
   rYOtnSiWskpx152x5n4jqI3FhtHgjB0mx9zfgQcW3X0vKSJ3DnvdmSZzi
   A==;
X-CSE-ConnectionGUID: NzwzdX57RO+UZf/CvMgWCg==
X-CSE-MsgGUID: aMJgME1XQN+/ZDLoQJf2lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70129678"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70129678"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 11:30:48 -0800
X-CSE-ConnectionGUID: bFZdGLoASqSPp0nFk+POSA==
X-CSE-MsgGUID: yppPAdlCT+eCQ05aokr8sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="236881280"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jan 2026 11:30:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viHR6-00000000PQX-1I32;
	Tue, 20 Jan 2026 19:30:44 +0000
Date: Wed, 21 Jan 2026 03:30:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6044/8302]
 drivers/soc/renesas/rzn1_irqmux.c:125:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601210349.B40O8be9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/soc/renesas/rzn1_irqmux.c:125:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   053966c344dbd346e71305f530e91ea77916189f
commit: 49261f479d45714692587ff0abe0c5279c6068d6 [6044/8302] soc: renesas: Add support for RZ/N1 GPIO Interrupt Multiplexer
:::::: branch date: 3 hours ago
:::::: commit date: 5 days ago
config: riscv-randconfig-r123-20260120 (https://download.01.org/0day-ci/archive/20260121/202601210349.B40O8be9-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210349.B40O8be9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601210349.B40O8be9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/soc/renesas/rzn1_irqmux.c:125:1: sparse: sparse: bad integer constant expression
   drivers/soc/renesas/rzn1_irqmux.c:125:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/soc/renesas/rzn1_irqmux.c:126:1: sparse: sparse: bad integer constant expression
   drivers/soc/renesas/rzn1_irqmux.c:126:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/soc/renesas/rzn1_irqmux.c:127:1: sparse: sparse: bad integer constant expression
   drivers/soc/renesas/rzn1_irqmux.c:127:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/soc/renesas/rzn1_irqmux.c:127:1: sparse: sparse: bad integer constant expression
   drivers/soc/renesas/rzn1_irqmux.c:127:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +125 drivers/soc/renesas/rzn1_irqmux.c

49261f479d4571 Herve Codina (Schneider Electric  2026-01-14  124) 
49261f479d4571 Herve Codina (Schneider Electric  2026-01-14 @125) MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
