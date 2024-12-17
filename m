Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671DC1EE021
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 11:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734436381; cv=none; b=BCJTBaKC7pyYCNVaRAnqayWsEoxF+Y2LD1gRFCQx4DlnPedtJtv3Cl/pw2W902t6UvsrVHF7Wz5jk6CYdajWL+/7jL0EG4MEPnkVqEi0cMZhAUsXJefDpoRElXGDEMWOiEpOwy7dmk4L3qlGje+4NGWmw9xOGqnz7BgWaEAuzuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734436381; c=relaxed/simple;
	bh=Ax0i4N2K6NNPSDDnI+g0awFydMjZRwSL85Q79D1xQBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gaVFA4mepnDQjaU2yPySpRCNzICOaIyDcXFALIEacZwPIoyZF8CUsZDfGJxaPEXjE39Cd7OfEOxEnvUdpvQCxROk5q5VQ5vbOIXkhGgJSqbR18DSuydckQVR1VfPMZ7+DiclmRc68JLYZ7FW4SRGxZak6GsAjWPei9KJDuLRzhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7XYOWjs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7XYOWjs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734436379; x=1765972379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ax0i4N2K6NNPSDDnI+g0awFydMjZRwSL85Q79D1xQBc=;
  b=H7XYOWjs0ztWrnH8af7KXAAudMw/9pCg86UdaCoACrDx5IfGIKi1DhF1
   S3Qx4QLqPCoG7jU+rjOm6Ip526l4EmdamkvDU0WonGGL4YJYvJdi8r3ON
   dEjWvzedAbwWr1AEd2RrhZYxRarnUVbXlEIEsWCPN2tWObEKKbxHScUVt
   5I/dXvimfuvfkB5Qe7hy0wJgTogFc0AOx+LFyMj96KTDYRCLMtjs8Wf+i
   6YHX/8Zj/uxW87gbwplZiD/ujVpTFjuLD1mbKDUKBRtigo5vUtW6X3Que
   Y9cg4II5LbGQCQOhaoJ14ykAgWbEvfqaLQQQEehHRLxFoZ0nCWPKikx1U
   w==;
X-CSE-ConnectionGUID: r0GhtbK1TEenBDL9sydQ7A==
X-CSE-MsgGUID: m6/61TdWQayN2KPHivEvCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45339932"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45339932"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 03:52:59 -0800
X-CSE-ConnectionGUID: 9KDTnHxSTXu/fJ9XIo4U3Q==
X-CSE-MsgGUID: TrOIkYIGSjCHIHfVYr9Q3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102498735"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Dec 2024 03:52:57 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNW8F-000Eyq-2C;
	Tue, 17 Dec 2024 11:52:55 +0000
Date: Tue, 17 Dec 2024 19:52:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 1/1] kernel/sched/pelt.c:513 (null)()
 warn: (struct ctl_table)->procname cannot be NULL. Expression :
 sched_pelt_sysctls[1]->procname
Message-ID: <202412171947.sNq8s8iL-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   4c2c65ff08ee9a0f8d838770b1e921da2adf3fa2
commit: c07bf26056e9548038d69d8fce8e01dff3c7e1e4 [1/1] FROMLIST: sched/pelt: Introduce PELT multiplier
:::::: branch date: 15 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20241217 (https://download.01.org/0day-ci/archive/20241217/202412171947.sNq8s8iL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412171947.sNq8s8iL-lkp@intel.com/

smatch warnings:
kernel/sched/pelt.c:513 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : sched_pelt_sysctls[1]->procname
kernel/sched/pelt.c:513 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : sched_pelt_sysctls[1]->proc_handler

vim +513 kernel/sched/pelt.c

c07bf26056e954 Jing-Ting Wu 2023-01-05  512  
c07bf26056e954 Jing-Ting Wu 2023-01-05 @513  static struct ctl_table sched_pelt_sysctls[] = {
c07bf26056e954 Jing-Ting Wu 2023-01-05  514  	{
c07bf26056e954 Jing-Ting Wu 2023-01-05  515  		.procname       = "sched_pelt_multiplier",
c07bf26056e954 Jing-Ting Wu 2023-01-05  516  		.data           = &sysctl_sched_pelt_multiplier,
c07bf26056e954 Jing-Ting Wu 2023-01-05  517  		.maxlen         = sizeof(unsigned int),
c07bf26056e954 Jing-Ting Wu 2023-01-05  518  		.mode           = 0644,
c07bf26056e954 Jing-Ting Wu 2023-01-05  519  		.proc_handler   = sched_pelt_multiplier,
c07bf26056e954 Jing-Ting Wu 2023-01-05  520  	},
c07bf26056e954 Jing-Ting Wu 2023-01-05  521  	{}
c07bf26056e954 Jing-Ting Wu 2023-01-05  522  };
c07bf26056e954 Jing-Ting Wu 2023-01-05  523  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
