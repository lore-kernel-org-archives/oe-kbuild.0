Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D223009FA
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 18:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769106753; cv=none; b=jGQtXdyQW1FFoJtReCNqkedJT0ajgxL5Za12cUYnZgSCcaPUGBE8TPMA6eHPfRs1pxntEH6+wOXUF5/kLdj4lgPb2RiIABJP0pntZrNbnnrM8/VfYiFe905W+13JglKPWyp5U0IcggZISBNxuCRBljqtggRdI0WDp00IEl5/pks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769106753; c=relaxed/simple;
	bh=RMPE7soeuDnTJvML+wqQYMry1y22OTZOjukYoR6cico=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D3ISMLpx0n3/aeHvDxAO8KFxElKJ2/qMKBmjpUKUv6fNFWw/r8PiwS+POLLcyhqWsgEwj6tNVZmy4mb9t/9E+oR6047xqHWCNZKu4rROyiwtf+LYcLWyb0OJIFYkTrkb8tpHBTulP2A1iP8f0RZEBmeJ3/6+0tHdTnALUdH0pw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amQepoYt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amQepoYt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769106744; x=1800642744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RMPE7soeuDnTJvML+wqQYMry1y22OTZOjukYoR6cico=;
  b=amQepoYtFve4iUrBgIKw4mELSxVO+J2exAYVMEMcOYPeelR1MhpFRZpD
   lYMrX78phbAMkO9P9p3hKpsHeKiVNY9xOuQS33FFt7sB3yEKL4KGpHRBW
   hZ7HfCrVv2mFIPYrhL+bQyPVKwa2M51SMScBsD2Evos4AuJGabU3HPB3S
   G6V2d4+BAOyYI75e1gwiOyBvdiTIoIDNKCT5NHw6XS4JDdwN8KQTwwEFX
   HvhKgM+9DgzdbgPglOkUrtBKmyNFL7D6pXuaq2tykybFEG+A1jSJ9WspN
   y1pHeMaf+oPH5zmHvLt4YchKATdi8VzlPGgbt1T3YrOnmpeiRt+1F/VRb
   A==;
X-CSE-ConnectionGUID: yIeQyhqKTdKWx8p0Z3pjnQ==
X-CSE-MsgGUID: O5hJivKEQ+qPd2sw+YQrbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="93025056"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="93025056"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 10:32:19 -0800
X-CSE-ConnectionGUID: zk71xATJTKKW01dHPEh/7A==
X-CSE-MsgGUID: bSNGGh70SG+PuX2THD/iLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="205922262"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Jan 2026 10:32:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vizTa-00000000TAw-3y6x;
	Thu, 22 Jan 2026 18:32:14 +0000
Date: Fri, 23 Jan 2026 02:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 3/9] clk: realtek: Introduce a common probe()
Message-ID: <202601230204.TiGCq9lc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/realtek/common.c:63:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260122110857.12995-4-eleanor.lin@realtek.com>
References: <20260122110857.12995-4-eleanor.lin@realtek.com>
TO: "Yu-Chun Lin" <eleanor.lin@realtek.com>
TO: mturquette@baylibre.com
TO: sboyd@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: p.zabel@pengutronix.de
TO: cylee12@realtek.com
TO: jyanchou@realtek.com
CC: devicetree@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: james.tai@realtek.com
CC: cy.huang@realtek.com
CC: stanley_chang@realtek.com
CC: eleanor.lin@realtek.com

Hi Yu-Chun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.19-rc6 next-20260121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Chun-Lin/dt-bindings-clock-Add-Realtek-RTD1625-Clock-Reset-Controller/20260122-194325
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260122110857.12995-4-eleanor.lin%40realtek.com
patch subject: [PATCH v3 3/9] clk: realtek: Introduce a common probe()
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: powerpc-randconfig-r123-20260122 (https://download.01.org/0day-ci/archive/20260123/202601230204.TiGCq9lc-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230204.TiGCq9lc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601230204.TiGCq9lc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/realtek/common.c:63:1: sparse: sparse: bad integer constant expression
   drivers/clk/realtek/common.c:63:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/realtek/common.c:64:1: sparse: sparse: bad integer constant expression
   drivers/clk/realtek/common.c:64:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/realtek/common.c:64:1: sparse: sparse: bad integer constant expression
   drivers/clk/realtek/common.c:64:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +63 drivers/clk/realtek/common.c

3c88898c54673d Cheng-Yu Lee 2026-01-22  62  
3c88898c54673d Cheng-Yu Lee 2026-01-22 @63  MODULE_DESCRIPTION("Realtek clock infrastructure");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
