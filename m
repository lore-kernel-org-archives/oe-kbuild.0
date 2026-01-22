Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4E4349AEB
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078879; cv=none; b=epKIyJlGeAyHaPfB3E2iKLdSZEayw7Na35QWKYeTw5rF1lfXgS45IsbbGoKM5w5Bcyuzoy6zDz5uY9v7F1Aep1VgKAg+4EW2Ivedc28m1RKnQl8o2F9s4iV80nStfaz+DqP/D/4ngd/a6u261l+mYMnhntvjn7RM1D1fQVTGCss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078879; c=relaxed/simple;
	bh=uIXzhWJjJgS25kIVrH5Q2gkh9FtAwSwfF7fB62yisR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BbAdo3K3seku9ZwzNMVoDpcfb/D352pSkJ7Flvv/XuNHoFCF1NHaC29RU4/749DYTvLg/R/lUWnP0eXkBryZ0TN5bx9AA0tgk38Gl1We00wQ7BvD02PHrwOh10XOnXiQicXY9ZwpASjtHSEFPhKuOzFXybcH0SXOG3u/Ppb90/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AI8rmvWa; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AI8rmvWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769078878; x=1800614878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uIXzhWJjJgS25kIVrH5Q2gkh9FtAwSwfF7fB62yisR0=;
  b=AI8rmvWawNPrBZmpdAGD7S8EvtXodUt8kfRK76s6i6wBgSmdm/kIOrIE
   hJbBvOnJV+Sq5fR1DlOgQyCioYPhyWHrPcYGlnlRoFZdqyVju1uCJW0cl
   HMk8dZD0v9XfPF1jJOGFURFpgYdDsMTnSaPcj9qV+rg5zyEuX9OLcc2pB
   WFyZGOQX8tYKL7NO50kVzm37j91W87WiuDvJcqAUQcQyifwmJy/Z0PKth
   zNZW8alCeAxBZ6hvHk7NL2vDzGLf5u1QNL55xvCm2XdYP5WoCaalFxD1X
   dDOUFWgDu5SlaU3isOIVlfTXVgZOPLGSqRB0nkivM5QL+kN6Qtzki9Ki9
   g==;
X-CSE-ConnectionGUID: coWCNesRR7Cwh0xKU1f+TA==
X-CSE-MsgGUID: 7ZEx3cTkRkydfzysSk/vFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69335413"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="69335413"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 02:47:57 -0800
X-CSE-ConnectionGUID: hOaWczJXQSihkLNw6wdtew==
X-CSE-MsgGUID: tP5Uqv/vS6a6gs6fGCo1+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="207134328"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jan 2026 02:47:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1visEE-00000000SkH-0y3h;
	Thu, 22 Jan 2026 10:47:54 +0000
Date: Thu, 22 Jan 2026 18:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] hwmon: Add JEDEC PMIC50x0 driver
Message-ID: <202601221838.VOt9H5c1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hwmon/pmic50x0.c:258:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260121151947.37719-3-almogbs@amazon.com>
References: <20260121151947.37719-3-almogbs@amazon.com>
TO: Almog Ben Shaul <almogbs@amazon.com>
TO: linux-hwmon@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: itamark@amazon.com
CC: talel@amazon.com
CC: farbere@amazon.com
CC: ayalstei@amazon.com
CC: dwmw@amazon.com
CC: almogbs@amazon.com

Hi Almog,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on robh/for-next linus/master v6.19-rc6 next-20260121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Almog-Ben-Shaul/dt-bindings-trivial-devices-Add-jedec-pmic50x0/20260122-001958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20260121151947.37719-3-almogbs%40amazon.com
patch subject: [PATCH 2/2] hwmon: Add JEDEC PMIC50x0 driver
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: openrisc-randconfig-r134-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221838.VOt9H5c1-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221838.VOt9H5c1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601221838.VOt9H5c1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/pmic50x0.c:258:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmic50x0.c:258:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/hwmon/pmic50x0.c:259:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmic50x0.c:259:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/hwmon/pmic50x0.c:837:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmic50x0.c:837:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/hwmon/pmic50x0.c:838:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmic50x0.c:838:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hwmon/pmic50x0.c:839:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmic50x0.c:839:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/hwmon/pmic50x0.c:839:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmic50x0.c:839:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +258 drivers/hwmon/pmic50x0.c

5f2418cc971fbd Almog Ben Shaul 2026-01-21  256  
5f2418cc971fbd Almog Ben Shaul 2026-01-21  257  static unsigned int error_polling_ms = PMIC50X0_ERR_POLL_INTERVAL_MSEC;
5f2418cc971fbd Almog Ben Shaul 2026-01-21 @258  module_param(error_polling_ms, uint, 0644);
5f2418cc971fbd Almog Ben Shaul 2026-01-21  259  MODULE_PARM_DESC(error_polling_ms, "PMIC error polling interval in msec, default = 1000");
5f2418cc971fbd Almog Ben Shaul 2026-01-21  260  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
