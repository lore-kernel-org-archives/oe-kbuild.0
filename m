Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043FD6ABC
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 11:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TUAT6KGx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702206365; x=1733742365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E3R3H5+JuxRIaYXJNA3PZfRKSFqEOtmMNecxr/D9WV0=;
  b=TUAT6KGxFl7eCneK78ocysZLx8m9/OW3Td5OffIgv6n2QAvzpxQU+zRd
   uHa8DsLLkKJNYuwKK6QVZjEP4zqnExxWvzGshp6nRiPfmBTsIMAZ6Ki+f
   j5GHB9lcckRupvOHY4IuJAYw7fXP3LYVfnsj48h7DXnE6OUqhSY/NEELu
   sfAgbqOZLQ4fDt1a2kQo/ArIbKk8Asuo8UZ1Cud5ejZJ8JlObjPAkbGvT
   IEUn4xrafaZW7luhCzNeGMOtOkjY5JSFuVTBv76N5ZBMgipUSzbMSkKr2
   XQbKp1qmiCvkgkrV0WVxOCloxV18Kqa/j/1rmOEBOA5T4nvVjkB8uIKYk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="398408531"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="398408531"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 03:06:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="916473409"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="916473409"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 10 Dec 2023 03:06:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCHdI-000Gke-2O;
	Sun, 10 Dec 2023 11:06:00 +0000
Date: Sun, 10 Dec 2023 19:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/kernel/perf_cpum_cf.c:975 cfset_all_copy() warn: ignoring
 unreachable code.
Message-ID: <202312101819.GVv9G82J-lkp@intel.com>
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
TO: Thomas Richter <tmricht@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>
CC: Sumanth Korikkar <sumanthk@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: a029a4eab39e4bf542907a3263773fce3d48c983 s390/cpumf: Allow concurrent access for CPU Measurement Counter Facility
date:   2 years, 5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 2 years, 5 months ago
config: s390-randconfig-r071-20231115 (https://download.01.org/0day-ci/archive/20231210/202312101819.GVv9G82J-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312101819.GVv9G82J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312101819.GVv9G82J-lkp@intel.com/

smatch warnings:
arch/s390/kernel/perf_cpum_cf.c:975 cfset_all_copy() warn: ignoring unreachable code.

vim +975 arch/s390/kernel/perf_cpum_cf.c

a029a4eab39e4b Thomas Richter 2021-06-25  960  
a029a4eab39e4b Thomas Richter 2021-06-25  961  static int cfset_all_copy(unsigned long arg, cpumask_t *mask)
a029a4eab39e4b Thomas Richter 2021-06-25  962  {
a029a4eab39e4b Thomas Richter 2021-06-25  963  	struct s390_ctrset_read __user *ctrset_read;
a029a4eab39e4b Thomas Richter 2021-06-25  964  	unsigned int cpu, cpus, rc;
a029a4eab39e4b Thomas Richter 2021-06-25  965  	void __user *uptr;
a029a4eab39e4b Thomas Richter 2021-06-25  966  
a029a4eab39e4b Thomas Richter 2021-06-25  967  	ctrset_read = (struct s390_ctrset_read __user *)arg;
a029a4eab39e4b Thomas Richter 2021-06-25  968  	uptr = ctrset_read->data;
a029a4eab39e4b Thomas Richter 2021-06-25  969  	for_each_cpu(cpu, mask) {
a029a4eab39e4b Thomas Richter 2021-06-25  970  		struct cpu_cf_events *cpuhw = per_cpu_ptr(&cpu_cf_events, cpu);
a029a4eab39e4b Thomas Richter 2021-06-25  971  		struct s390_ctrset_cpudata __user *ctrset_cpudata;
a029a4eab39e4b Thomas Richter 2021-06-25  972  
a029a4eab39e4b Thomas Richter 2021-06-25  973  		ctrset_cpudata = uptr;
a029a4eab39e4b Thomas Richter 2021-06-25  974  		rc  = put_user(cpu, &ctrset_cpudata->cpu_nr);
a029a4eab39e4b Thomas Richter 2021-06-25 @975  		rc |= put_user(cpuhw->sets, &ctrset_cpudata->no_sets);
a029a4eab39e4b Thomas Richter 2021-06-25  976  		rc |= copy_to_user(ctrset_cpudata->data, cpuhw->data,
a029a4eab39e4b Thomas Richter 2021-06-25  977  				   cpuhw->used);
a029a4eab39e4b Thomas Richter 2021-06-25  978  		if (rc)
a029a4eab39e4b Thomas Richter 2021-06-25  979  			return -EFAULT;
a029a4eab39e4b Thomas Richter 2021-06-25  980  		uptr += sizeof(struct s390_ctrset_cpudata) + cpuhw->used;
a029a4eab39e4b Thomas Richter 2021-06-25  981  		cond_resched();
a029a4eab39e4b Thomas Richter 2021-06-25  982  	}
a029a4eab39e4b Thomas Richter 2021-06-25  983  	cpus = cpumask_weight(mask);
a029a4eab39e4b Thomas Richter 2021-06-25  984  	if (put_user(cpus, &ctrset_read->no_cpus))
a029a4eab39e4b Thomas Richter 2021-06-25  985  		return -EFAULT;
a029a4eab39e4b Thomas Richter 2021-06-25  986  	debug_sprintf_event(cf_dbg, 4, "%s copied %ld\n", __func__,
a029a4eab39e4b Thomas Richter 2021-06-25  987  			    uptr - (void __user *)ctrset_read->data);
a029a4eab39e4b Thomas Richter 2021-06-25  988  	return 0;
a029a4eab39e4b Thomas Richter 2021-06-25  989  }
a029a4eab39e4b Thomas Richter 2021-06-25  990  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
