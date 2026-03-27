Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B546F2DCC1F
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 19:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774641255; cv=none; b=GkhIBJAfXLfEvGjJ+9YZXzzDi27axZHRLYG/UBitYRCi28PTo1LzVbOc9tYPL3BqlFmw8iJCbjpVmjfqKQPhYrDjostVTDMQaGthKyyj1Pud6Mg+zUwfLRLAdc6YTPndqlyzh/nGu2+rQTdknVTzUgMM6ggXnomYNYXH0vDymss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774641255; c=relaxed/simple;
	bh=V8Axxemc6Uw8miCV3+HOCILujbalwnr/AoSFL6Lz5AM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tLGX/tDfHS1Ufipvhgu0grauBspNMZ6Y8o5PFi8P7/s8RbDP1YAHXxDfEj/aY28esvtdUJjcBQ2OhsIN5KPktWVmeTEhAFBaUmrGpK5U3LaFC4KqnPnV4EvCGuN9ORgmXqdgarF9JHK9qrnlk1M4aTUaYYQnBB/nQLXto6P1KO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYq8A/aE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYq8A/aE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774641252; x=1806177252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V8Axxemc6Uw8miCV3+HOCILujbalwnr/AoSFL6Lz5AM=;
  b=NYq8A/aEJTpLquGYhRUMII0f0kngq5Pn60Sp+piP7hWt1Khy5ei1Q81H
   CDRiJuoAT9rQWnI9gIyyP9C3+3LfBvK7iDPCKneUTAGhtCYMp1VLRjilM
   6QbzK4QDcalQr5F1ugUQGts8YOgLpOJTfVisx9UQks12ZOl9rQeXpJlYu
   anSmyKz98+guHLOw00Ub92nJ/xWXlCjZZODhXYa6kQxssx4Zpb8gqYcFv
   COUCAVdR+92ejxFXDi6UVqau4tU+yXaaZWL97VWadtdVurJdarLY/sH3k
   XSEtswEa4f3vLwxE18RUN6gIRG9KimvNds6/dNCuPovGlFA2nz3s5Qu5L
   Q==;
X-CSE-ConnectionGUID: ZaYL6BVQTra291CHKJi4sA==
X-CSE-MsgGUID: nVoRzKXySKe+aLspFrY5Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="74752739"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="74752739"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 12:54:11 -0700
X-CSE-ConnectionGUID: ac+X0r48Se6r6Vd4JEiVkw==
X-CSE-MsgGUID: 3NNsUd7iTjaV9W8GQhOGBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="224613585"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Mar 2026 12:54:09 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6DFv-00000000AfN-1b8K;
	Fri, 27 Mar 2026 19:54:07 +0000
Date: Sat, 28 Mar 2026 03:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1] thermal: core: Address thermal zone removal races
 with resume
Message-ID: <202603280307.P9324SuS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <12876512.O9o76ZdvQC@rafael.j.wysocki>
References: <12876512.O9o76ZdvQC@rafael.j.wysocki>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: Linux PM <linux-pm@vger.kernel.org>
CC: Mauricio Faria de Oliveira <mfo@igalia.com>
CC: LKML <linux-kernel@vger.kernel.org>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Lukasz Luba <lukasz.luba@arm.com>

Hi Rafael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/thermal]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rafael-J-Wysocki/thermal-core-Address-thermal-zone-removal-races-with-resume/20260327-222101
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/12876512.O9o76ZdvQC%40rafael.j.wysocki
patch subject: [PATCH v1] thermal: core: Address thermal zone removal races with resume
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: i386-randconfig-141-20260328 (https://download.01.org/0day-ci/archive/20260328/202603280307.P9324SuS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603280307.P9324SuS-lkp@intel.com/

smatch warnings:
drivers/thermal/thermal_core.c:1913 thermal_init() warn: missing error code 'result'

vim +/result +1913 drivers/thermal/thermal_core.c

ff140fea847e1c drivers/thermal/thermal_core.c Zhang Rui         2015-10-30  1899  
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui         2008-01-17  1900  static int __init thermal_init(void)
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui         2008-01-17  1901  {
80a26a5c22b90a drivers/thermal/thermal_core.c Zhang Rui         2013-03-26  1902  	int result;
80a26a5c22b90a drivers/thermal/thermal_core.c Zhang Rui         2013-03-26  1903  
755113d7678681 drivers/thermal/thermal_core.c Daniel Lezcano    2024-01-09  1904  	thermal_debug_init();
755113d7678681 drivers/thermal/thermal_core.c Daniel Lezcano    2024-01-09  1905  
d2a89b52839597 drivers/thermal/thermal_core.c Daniel Lezcano    2020-07-17  1906  	result = thermal_netlink_init();
d2a89b52839597 drivers/thermal/thermal_core.c Daniel Lezcano    2020-07-17  1907  	if (result)
d2a89b52839597 drivers/thermal/thermal_core.c Daniel Lezcano    2020-07-17  1908  		goto error;
d2a89b52839597 drivers/thermal/thermal_core.c Daniel Lezcano    2020-07-17  1909  
f777132b791874 drivers/thermal/thermal_core.c Rafael J. Wysocki 2026-03-26  1910  	thermal_wq = alloc_workqueue("thermal_events",
f777132b791874 drivers/thermal/thermal_core.c Rafael J. Wysocki 2026-03-26  1911  				      WQ_FREEZABLE | WQ_POWER_EFFICIENT | WQ_PERCPU, 0);
f777132b791874 drivers/thermal/thermal_core.c Rafael J. Wysocki 2026-03-26  1912  	if (!thermal_wq)
f777132b791874 drivers/thermal/thermal_core.c Rafael J. Wysocki 2026-03-26 @1913  		goto unregister_netlink;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
