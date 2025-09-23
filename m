Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC982252900
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 04:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758601741; cv=none; b=eAJiUr6hcJw3ef+a5dq/V8mTidh3n9YuoNHg9DW3HjAPN1FIk1Hm4ePDQvEOCV9X6Rmqt8WfzTu88zxh6tyhBiPpYrswMw3Tukpv9WfP01jN412+JlAGrBckEYlXe5ddWHxP9edMklNR52DFIGxPEH5xiLejXeLHbqKD5ZUFQpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758601741; c=relaxed/simple;
	bh=a4afKQryg9FQ423XnER0/lVV8gAkI5resFBtB8EMluU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S5prEoACbx5iM/x0eUwsnGB0SZxWWftMlxFX5mkaNjHpRCmy5z35kiImU6+IuHV2FzWWdiAYnypDCqaI+aBHSK6sx6JJdw+IQPUsV4EFr9wRFU2T5yPLKoOD8AixLajEIPvjYedg5cTuWPN8GqUIvbBwach+axe+ZLKACL+1/IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ac4uQTG6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ac4uQTG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758601739; x=1790137739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a4afKQryg9FQ423XnER0/lVV8gAkI5resFBtB8EMluU=;
  b=Ac4uQTG6/FnUhdDV1E5c7VfXblZItc35o+HTm6+GY/jQGWUguimyhuVw
   z8B3XeJHpjfcF8WqyJIVv8tf2bx+0cvHSRsJLBHEhOIhic9lYhUVotvWe
   RB5EvmMv2Drucd3k/OAnd5HMHT/wHBENPNP2oa93neoN+kfT3ATxaG61B
   QoPYXhp636mue3cb01yRqxZRm4d4kKg2/TrGHPELFywzkmIUNr/V5r4+I
   Q01Od/ynQzh7BE2fZwPYNZOd2kHT+78aJba38LBKfz4DXaoY1BFB5T7l6
   9sgg+UKHEfeq5w0mg31ksV/S/2fyGICskh4cFY7AyU1dIZneCjs+Lh07X
   g==;
X-CSE-ConnectionGUID: Am2W2+D9SMmP9mt/ZKIUew==
X-CSE-MsgGUID: 6sxWYn63RpSbrVTK4DzNSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64698618"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="64698618"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 21:28:59 -0700
X-CSE-ConnectionGUID: aMzQUQDkTnyEciTb5HheGQ==
X-CSE-MsgGUID: 4U5PjiAISSyDXZANMF6Gdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="180670674"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Sep 2025 21:28:58 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0ue7-0002kD-0A;
	Tue, 23 Sep 2025 04:28:55 +0000
Date: Tue, 23 Sep 2025 12:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [arm64:for-next/perf 5/28] drivers/perf/dwc_pcie_pmu.c:418
 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.
Message-ID: <202509231223.gZsX6Eio-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Ilkka Koskinen <ilkka@os.amperecomputing.com>
CC: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/perf
head:   6d2f913fda5683fbd4c3580262e10386c1263dfb
commit: 71396cfac97d0249fa7d8dcc8e649b6ba4c090e4 [5/28] perf/dwc_pcie: Support counting multiple lane events in parallel
:::::: branch date: 16 hours ago
:::::: commit date: 5 days ago
config: sparc64-randconfig-r072-20250922 (https://download.01.org/0day-ci/archive/20250923/202509231223.gZsX6Eio-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509231223.gZsX6Eio-lkp@intel.com/

smatch warnings:
drivers/perf/dwc_pcie_pmu.c:418 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.

vim +/time_event +418 drivers/perf/dwc_pcie_pmu.c

71396cfac97d02 Ilkka Koskinen 2025-08-28  400  
71396cfac97d02 Ilkka Koskinen 2025-08-28  401  static int dwc_pcie_pmu_validate_group(struct perf_event *event)
71396cfac97d02 Ilkka Koskinen 2025-08-28  402  {
71396cfac97d02 Ilkka Koskinen 2025-08-28  403  	struct perf_event *sibling, *leader = event->group_leader;
71396cfac97d02 Ilkka Koskinen 2025-08-28  404  	DECLARE_BITMAP(val_lane_events, 2 * DWC_PCIE_LANE_MAX_EVENTS_PER_GROUP);
71396cfac97d02 Ilkka Koskinen 2025-08-28  405  	bool time_event;
71396cfac97d02 Ilkka Koskinen 2025-08-28  406  	int type;
71396cfac97d02 Ilkka Koskinen 2025-08-28  407  
71396cfac97d02 Ilkka Koskinen 2025-08-28  408  	type = DWC_PCIE_EVENT_TYPE(leader);
71396cfac97d02 Ilkka Koskinen 2025-08-28  409  	if (type == DWC_PCIE_TIME_BASE_EVENT)
71396cfac97d02 Ilkka Koskinen 2025-08-28  410  		time_event = true;
71396cfac97d02 Ilkka Koskinen 2025-08-28  411  	else
71396cfac97d02 Ilkka Koskinen 2025-08-28  412  		if (dwc_pcie_pmu_validate_add_lane_event(leader, val_lane_events))
71396cfac97d02 Ilkka Koskinen 2025-08-28  413  			return -ENOSPC;
71396cfac97d02 Ilkka Koskinen 2025-08-28  414  
71396cfac97d02 Ilkka Koskinen 2025-08-28  415  	for_each_sibling_event(sibling, leader) {
71396cfac97d02 Ilkka Koskinen 2025-08-28  416  		type = DWC_PCIE_EVENT_TYPE(sibling);
71396cfac97d02 Ilkka Koskinen 2025-08-28  417  		if (type == DWC_PCIE_TIME_BASE_EVENT) {
71396cfac97d02 Ilkka Koskinen 2025-08-28 @418  			if (time_event)
71396cfac97d02 Ilkka Koskinen 2025-08-28  419  				return -ENOSPC;
71396cfac97d02 Ilkka Koskinen 2025-08-28  420  
71396cfac97d02 Ilkka Koskinen 2025-08-28  421  			time_event = true;
71396cfac97d02 Ilkka Koskinen 2025-08-28  422  			continue;
71396cfac97d02 Ilkka Koskinen 2025-08-28  423  		}
71396cfac97d02 Ilkka Koskinen 2025-08-28  424  
71396cfac97d02 Ilkka Koskinen 2025-08-28  425  		if (dwc_pcie_pmu_validate_add_lane_event(sibling, val_lane_events))
71396cfac97d02 Ilkka Koskinen 2025-08-28  426  			return -ENOSPC;
71396cfac97d02 Ilkka Koskinen 2025-08-28  427  	}
71396cfac97d02 Ilkka Koskinen 2025-08-28  428  
71396cfac97d02 Ilkka Koskinen 2025-08-28  429  	return 0;
71396cfac97d02 Ilkka Koskinen 2025-08-28  430  }
71396cfac97d02 Ilkka Koskinen 2025-08-28  431  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
