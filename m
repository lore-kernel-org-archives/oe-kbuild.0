Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90684149C47
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Oct 2024 20:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728937625; cv=none; b=FJNmEoCReivGjF44iE/MOfioncMeaCG52EWIpYmEXHrFo1w7cZD984Ya3WfOTfahILF15GxWKpKimM02sgx8PG0L3CnnV4xNE3wP2aRZYWxhhEpinwvB4K1DgmUtEUY4qbt+iXFRs1qhHU6tVHl8k5SSOs5X67MEALvJK+sWHO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728937625; c=relaxed/simple;
	bh=8ssZ34D/AOU/LT7BVcCx6sm7QiUCJCeZLLmvqK9Mq0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tw0u4mR8RoScSBhLKWcCYwvEDjSFO5eJ/7co6I+/eMvRRccWmJIMuG0ClvDGumTV5vyrU+hC3gczE+TcnmeP1X+Es8rB3gizI0YjWFvlyxKfHlzygOl/lu4hnHhtk1mfZqS9xlzp3uTgoHwL6/8NO0qlQETCoMm/FJaAQWOByjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gPvbPtaN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPvbPtaN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728937624; x=1760473624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ssZ34D/AOU/LT7BVcCx6sm7QiUCJCeZLLmvqK9Mq0s=;
  b=gPvbPtaNnGOtRp1K6xY6omu/IR9VPo/kVyUF4qsD4iIElf67zSfGe6zt
   s/YWvRTyJUYbXDeS0Eb5qlE+jtAKEdqzShOXrTFAXnPfuALNKhPsKE9m2
   ntJerAZ4gZNog2O4nDsRr5jhKUXLO50zoyiHKVJyG09tk/hzdmNcfVlR2
   lqP+aSwScXcwP+8KCLLMNuWS5aPj+/BJdnLnEHYxzAi3hJE5vBqsaeIGP
   WETJlcRZ002tcvJFtO3mLQRZuJE4jHiaW7iGe8uzG3NwjZke9zoazPHD+
   4amZfJVdEeqlEoReP9zHi7UKlAju9f1SznmlUlifEZJHXaZZpa9v8GSjP
   A==;
X-CSE-ConnectionGUID: 6NfRTVKoS6yts/WswlIyuA==
X-CSE-MsgGUID: NuOEdgt5TV2/yeenp20lcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32104886"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="32104886"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 13:27:03 -0700
X-CSE-ConnectionGUID: +Cn0qyslS/WEUJjSJ1WFrQ==
X-CSE-MsgGUID: bj3HoVSOT0eAHlkpuO01Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="82243112"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Oct 2024 13:27:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Red-000H5F-2i;
	Mon, 14 Oct 2024 20:26:59 +0000
Date: Tue, 15 Oct 2024 04:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/kernel/hiperdispatch.c:237 hiperdispatch_ctl_handler()
 warn: (struct ctl_table)->procname cannot be NULL. Expression :
 ctl->procname
Message-ID: <202410150456.QJWKP8mj-lkp@intel.com>
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
TO: Mete Durlu <meted@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eca631b8fe808748d7585059c4307005ca5c5820
commit: b9271a533433dd4049723d4668418709e1927e12 s390/hiperdispatch: Add hiperdispatch sysctl interface
date:   7 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 weeks ago
config: s390-randconfig-r073-20241014 (https://download.01.org/0day-ci/archive/20241015/202410150456.QJWKP8mj-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410150456.QJWKP8mj-lkp@intel.com/

smatch warnings:
arch/s390/kernel/hiperdispatch.c:237 hiperdispatch_ctl_handler() warn: (struct ctl_table)->procname cannot be NULL. Expression : ctl->procname
arch/s390/kernel/hiperdispatch.c:236 hiperdispatch_ctl_handler() warn: (struct ctl_table)->procname cannot be NULL. Expression : ctl_entry.procname
arch/s390/kernel/hiperdispatch.c:236 hiperdispatch_ctl_handler() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : ctl_entry.proc_handler

vim +237 arch/s390/kernel/hiperdispatch.c

b9271a533433dd Mete Durlu 2024-08-12  230  
b9271a533433dd Mete Durlu 2024-08-12  231  static int hiperdispatch_ctl_handler(const struct ctl_table *ctl, int write,
b9271a533433dd Mete Durlu 2024-08-12  232  				     void *buffer, size_t *lenp, loff_t *ppos)
b9271a533433dd Mete Durlu 2024-08-12  233  {
b9271a533433dd Mete Durlu 2024-08-12  234  	int hiperdispatch;
b9271a533433dd Mete Durlu 2024-08-12  235  	int rc;
b9271a533433dd Mete Durlu 2024-08-12 @236  	struct ctl_table ctl_entry = {
b9271a533433dd Mete Durlu 2024-08-12 @237  		.procname	= ctl->procname,
b9271a533433dd Mete Durlu 2024-08-12  238  		.data		= &hiperdispatch,
b9271a533433dd Mete Durlu 2024-08-12  239  		.maxlen		= sizeof(int),
b9271a533433dd Mete Durlu 2024-08-12  240  		.extra1		= SYSCTL_ZERO,
b9271a533433dd Mete Durlu 2024-08-12  241  		.extra2		= SYSCTL_ONE,
b9271a533433dd Mete Durlu 2024-08-12  242  	};
b9271a533433dd Mete Durlu 2024-08-12  243  
b9271a533433dd Mete Durlu 2024-08-12  244  	hiperdispatch = hd_enabled;
b9271a533433dd Mete Durlu 2024-08-12  245  	rc = proc_douintvec_minmax(&ctl_entry, write, buffer, lenp, ppos);
b9271a533433dd Mete Durlu 2024-08-12  246  	if (rc < 0 || !write)
b9271a533433dd Mete Durlu 2024-08-12  247  		return rc;
b9271a533433dd Mete Durlu 2024-08-12  248  	mutex_lock(&smp_cpu_state_mutex);
b9271a533433dd Mete Durlu 2024-08-12  249  	if (hd_set_hiperdispatch_mode(hiperdispatch))
b9271a533433dd Mete Durlu 2024-08-12  250  		topology_schedule_update();
b9271a533433dd Mete Durlu 2024-08-12  251  	mutex_unlock(&smp_cpu_state_mutex);
b9271a533433dd Mete Durlu 2024-08-12  252  	return 0;
b9271a533433dd Mete Durlu 2024-08-12  253  }
b9271a533433dd Mete Durlu 2024-08-12  254  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
