Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC84415DBC1
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Oct 2025 14:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761662647; cv=none; b=mY8+D/GNN7uDf8EHw+yeRdx96vm7Qw3yXT2tslMf5odgW33jWbvOmoRYBJ/fCkkAXZ+utTZGZcu9v2W7I0NbC3lgwElvkbvm/ZawhX39S6fxIHSurN4cNdLYPO/WKMGggWdrbXNzSQU/YPjgozyJbFvWv+vtNvOzIcD+GqeeZzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761662647; c=relaxed/simple;
	bh=obYduYZ78QB4ZcN7dALcpPhWCrW7a4G3wU/Z3gBevWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M5np329qNilQYFb8Dq1C5lRWeGwHrcT+vfThs7inhoQuMUnvoqOyHTKOiJhy5NqBogaL2r2uxJSgMbczXxNlNKTWa9ytW6umn/NvnOyo7b5sWcwk+mm80AwDg7PZ5DHA3lsQGVJwMzcNkkgCaVPCPKu/eN726mYqU9Z4IsVCzxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BS0W+om5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BS0W+om5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761662646; x=1793198646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=obYduYZ78QB4ZcN7dALcpPhWCrW7a4G3wU/Z3gBevWk=;
  b=BS0W+om5LQe2Ugvq97KHn6eUQ3Z6K8SDNS3taykt0r+cqL3BBl9kd8AZ
   3NFIoP0eZ8dYldtu49/xuo7PDpBYd8VI97zcjdCXZuUqHFrW/cTTlVDmC
   mYk8t2wnsW8s3tlk3JwshEH+Egti5Noc2jHhMR1ymWMU1JFJ3V9FpzHlo
   JfEO0ym4AS4AQpaK2/9/TlFQDb/EyiYrygB7WAa9DmXyP0BQakuezYkYS
   LVfurMNXCOq4N1PzQEJyPVMb2WiixZjOli7VxvgLcJ1M+HHfz7PDnN8na
   FS0V1Tq199R55HBNT/KUxkxFHiC+MmvUuRKySgWRSYkg8NEACFMvMm0qR
   A==;
X-CSE-ConnectionGUID: hNqCaeKNT6SQZVZVxrBzyg==
X-CSE-MsgGUID: j049xQH4TO6hWFxiTJuEGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89234892"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="89234892"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 07:44:05 -0700
X-CSE-ConnectionGUID: /7sTRMGrSiS3U2KQE/oxbA==
X-CSE-MsgGUID: ti+WG7ZLTOGekVuBd7q0nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="184991697"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 07:44:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDkvZ-000JG3-2G;
	Tue, 28 Oct 2025 14:44:01 +0000
Date: Tue, 28 Oct 2025 22:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/damon/stat.c:60:21-22: WARNING opportunity for secs_to_jiffies()
Message-ID: <202510282200.etAaEoFg-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: SeongJae Park <sj@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd57572253bc356330dbe5b233c2e1d8426c66fd
commit: fabdd1e911da43cddbf17acf930171ba4b944477 mm/damon/stat: calculate and expose estimated memory bandwidth
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: s390-randconfig-r053-20251028 (https://download.01.org/0day-ci/archive/20251028/202510282200.etAaEoFg-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510282200.etAaEoFg-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/damon/stat.c:60:21-22: WARNING opportunity for secs_to_jiffies()

vim +60 mm/damon/stat.c

fabdd1e911da43 SeongJae Park 2025-06-04  53  
fabdd1e911da43 SeongJae Park 2025-06-04  54  static int damon_stat_after_aggregation(struct damon_ctx *c)
fabdd1e911da43 SeongJae Park 2025-06-04  55  {
fabdd1e911da43 SeongJae Park 2025-06-04  56  	static unsigned long last_refresh_jiffies;
fabdd1e911da43 SeongJae Park 2025-06-04  57  
fabdd1e911da43 SeongJae Park 2025-06-04  58  	/* avoid unnecessarily frequent stat update */
fabdd1e911da43 SeongJae Park 2025-06-04  59  	if (time_before_eq(jiffies, last_refresh_jiffies +
fabdd1e911da43 SeongJae Park 2025-06-04 @60  				msecs_to_jiffies(5 * MSEC_PER_SEC)))
fabdd1e911da43 SeongJae Park 2025-06-04  61  		return 0;
fabdd1e911da43 SeongJae Park 2025-06-04  62  	last_refresh_jiffies = jiffies;
fabdd1e911da43 SeongJae Park 2025-06-04  63  
fabdd1e911da43 SeongJae Park 2025-06-04  64  	damon_stat_set_estimated_memory_bandwidth(c);
fabdd1e911da43 SeongJae Park 2025-06-04  65  	return 0;
fabdd1e911da43 SeongJae Park 2025-06-04  66  }
fabdd1e911da43 SeongJae Park 2025-06-04  67  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
