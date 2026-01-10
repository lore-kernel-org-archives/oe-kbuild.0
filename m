Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937186BB5B
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 22:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768083571; cv=none; b=dmFuJVOTHS/C5Wm8AYPCUDkfNLQV8mL9+dUAQFjXGU+YbfL388IS2TDAVtbHw9bRh+l1goHNp3tSo78qWnsP3xqEqknFzT6zr/TTeBYnSEvbDfPIG5MbjDIdom7KpZPwp5LsXNnPCGp6yBhTx27oKK30MsNRbsEB2EVy+wmDZLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768083571; c=relaxed/simple;
	bh=iQT1gwFEWdKZgRNHY3kTpFw6h2ANrI4UerwmvlL+0QU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jki8AdtJ557P8O6Oc5ypXOD7f83pSpI5Q4XCapYibGrXZztVejBRAqJcfEzKms53Bth9c19oiTyXEaPTfyYCksYGodeH5SM4FYdfUjy9fyriZkrBl+Y4XefpcHZA416s5nPZqMGMe76tsATTgh3HT+23SD8aQcs2FC9aaHkRZdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IElSJOHX; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IElSJOHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768083570; x=1799619570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iQT1gwFEWdKZgRNHY3kTpFw6h2ANrI4UerwmvlL+0QU=;
  b=IElSJOHXWFlN02p2xRlcYtnYuy13kV6gvX1undr5celnDuttLPzeSlo5
   egLqB4Ha2W0lFhzFfq1/XdSOkvsfb+qT5EadW4QALQfgNhKP6hCrMPQE8
   0WfzqUo9j12VZEkyA/2fdEuhvGQtFgNZswZiUChZlFws4lvd5JwW2UNdJ
   EeFjqFXk0yqDxSkO9FTRtMP8alUJL3wYAiDNViqZ49eEa+Pwasg4FnLGg
   UR83N/jd+lTLe1wfkbL0TYCGQ2siR1S85K35sCeDtC8nCRTQc2EJSts5p
   vj7CO4Eo7jYP2cJE4fYPRaFGiHq4OmAMN1yN4IXrLUN3+C9Ei3KC6h/9P
   A==;
X-CSE-ConnectionGUID: PQCZB1jYQgeptNl/rWxnrg==
X-CSE-MsgGUID: VEwf41FgT3C5ChhiJXBiuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="73051144"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="73051144"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 14:19:29 -0800
X-CSE-ConnectionGUID: RlNc4jVzSUOR+Bo9XkQvPw==
X-CSE-MsgGUID: lFacsfFhQHqtWpbDK93Fmw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jan 2026 14:19:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vehIr-000000009Fk-2k8Q;
	Sat, 10 Jan 2026 22:19:25 +0000
Date: Sun, 11 Jan 2026 06:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/3] watchdog: atcwdt200: Add driver for Andes ATCWDT200
Message-ID: <202601110510.7ItbCM9e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/watchdog/atcwdt200_wdt.c:586:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260107145058.213334-3-cl634@andestech.com>
References: <20260107145058.213334-3-cl634@andestech.com>
TO: CL Wang <cl634@andestech.com>
TO: cl634@andestech.com
TO: wim@linux-watchdog.org
TO: linux@roeck-us.net
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-watchdog@vger.kernel.org
CC: tim609@andestech.com

Hi CL,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on groeck-staging/hwmon-next linus/master v6.19-rc4 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/CL-Wang/dt-bindings-watchdog-Add-support-for-Andes-ATCWDT200/20260107-233010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260107145058.213334-3-cl634%40andestech.com
patch subject: [PATCH 2/3] watchdog: atcwdt200: Add driver for Andes ATCWDT200
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-r112-20260110 (https://download.01.org/0day-ci/archive/20260111/202601110510.7ItbCM9e-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601110510.7ItbCM9e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601110510.7ItbCM9e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/watchdog/atcwdt200_wdt.c:586:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/atcwdt200_wdt.c:586:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/watchdog/atcwdt200_wdt.c:587:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/atcwdt200_wdt.c:587:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/watchdog/atcwdt200_wdt.c:590:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/atcwdt200_wdt.c:590:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/watchdog/atcwdt200_wdt.c:591:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/atcwdt200_wdt.c:591:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/watchdog/atcwdt200_wdt.c:594:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/atcwdt200_wdt.c:594:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/watchdog/atcwdt200_wdt.c:595:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/atcwdt200_wdt.c:595:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/watchdog/atcwdt200_wdt.c:596:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/atcwdt200_wdt.c:596:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +586 drivers/watchdog/atcwdt200_wdt.c

22003ac2445ca8c CL Wang 2026-01-07  585  
22003ac2445ca8c CL Wang 2026-01-07 @586  module_param(timeout, uint, 0);
22003ac2445ca8c CL Wang 2026-01-07  587  MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default="
22003ac2445ca8c CL Wang 2026-01-07  588  		 __MODULE_STRING(ATCWDT_TIMEOUT) ")");
22003ac2445ca8c CL Wang 2026-01-07  589  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
