Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958C3126BFF
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Oct 2024 20:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730062119; cv=none; b=MHGkCvy4LglgYxkakfWFmBNpOWyG4zkQ5psxZovwO41m2FjQrV9wz+QX2dhobcC/33xi1erJOO12VBV5lqcZJK3rQDNBo8dlbrnlF08UULoMjh385AESJxKZ4veE/MDYccanUwsDcR1E+KpjKqzIkcCAJZ1c/wdyntsAmq0agQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730062119; c=relaxed/simple;
	bh=fay/4qPtSKlTdsIyNZpmK9MDD2EOEKk2fbZPK9PIUI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WdrgMJ8+SdOEmBdPa9LB+0JivRQcIbwdYdSugY+sdb2Diz0KnfqgVX25RrfzBltf2UByLMuHgC4onb14kmkdETFSLB2TcIRWZdANYUpKAzB4wXCFRCeTsTomYPMbhku64OVwjfPVvYMmVK0jIv1vnmEVPmM15WOdYX6/GvIG6ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwaTWk6o; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwaTWk6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730062117; x=1761598117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fay/4qPtSKlTdsIyNZpmK9MDD2EOEKk2fbZPK9PIUI8=;
  b=NwaTWk6oqG4SQKHR5gmiFn8tMxMUh7vT2Oxu5Wd2gQ4beOmmmes8p6MQ
   ouaU03KLnBAflGev9ryg9Q5dsmHLhDH4+9jY7vIRXHs5yWxiI46KwtX9C
   on8wqv4GSbWLXHRlgneNF5RaD/jGmuunQzh+kwdoKMz00CdR6AgwNXTI9
   ShKA9tcj2BrDaK2DWj8oNSKcGtd0SU/a7PKde6VScCy01Ef0Pb7kphz7A
   h1l6vDaRrRN+WhJq4zHyiK8NrsH7/3Vbne4kf0oY9W6gCl0IrPvvZJ//M
   JMQSIp4/Ts5h8/IzUicBrzr6n1Ho9enD7uZYmWlQTLlVFWut2XdaANvAy
   Q==;
X-CSE-ConnectionGUID: dsHNBLB0RmuKgJeSkipx4A==
X-CSE-MsgGUID: lspG1GNBTNmh8Qf+Wvi78g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52214185"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52214185"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 13:48:36 -0700
X-CSE-ConnectionGUID: IiRcv+I5T/2fFMD/n+krlQ==
X-CSE-MsgGUID: aiaIweQEQ9eMZZz1ggYgLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="86535960"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Oct 2024 13:48:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5ABc-000azI-2T;
	Sun, 27 Oct 2024 20:48:32 +0000
Date: Mon, 28 Oct 2024 04:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/kernel/hiperdispatch.c:237 hiperdispatch_ctl_handler()
 warn: (struct ctl_table)->procname cannot be NULL. Expression :
 ctl->procname
Message-ID: <202410280431.LHZQhsYJ-lkp@intel.com>
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
head:   ea1fda89f5b23734e10c62762990120d5ae23c43
commit: b9271a533433dd4049723d4668418709e1927e12 s390/hiperdispatch: Add hiperdispatch sysctl interface
date:   8 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 weeks ago
config: s390-randconfig-r072-20241027 (https://download.01.org/0day-ci/archive/20241028/202410280431.LHZQhsYJ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410280431.LHZQhsYJ-lkp@intel.com/

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
