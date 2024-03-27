Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0324D9E0
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Mar 2024 22:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711576966; cv=none; b=UtegAhpEIi1GsUfv5pXTPKvtTCCwdax4m69J6kEpArVFAJH6XZv++Fj5UEzoJOaQJkv/uXzkhlDv2RS9ZESSXSRT+8RRIW3Fyn4Wc7sewm3vC6PGxitPLThEovgq9Elp8MAR7Pw1gD/31iKTz7W4ZvVyxYnu39QTm92eqH1Z4IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711576966; c=relaxed/simple;
	bh=t+SXTZNgbPM/ajTX6EVDeAQ8oiRWjhJwhDMLkkx48+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Io7jPtKMRLahu0cdY0YmMJCllGX9ohjDtejdVUl3JtKmTB+e4VzH64iUKqZ/kdNlssbuayrCZSlbtxlkHG3R51X+0LsUAJEUlC3OJZtb2w2S2pFbXt7kLVo3dzj/I3t3kaCuWUrxSECXExdbnR0AKQJK1fsp68HOuB0vQQUpmn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cw1dAhFp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cw1dAhFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711576964; x=1743112964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t+SXTZNgbPM/ajTX6EVDeAQ8oiRWjhJwhDMLkkx48+4=;
  b=cw1dAhFpGeXS1S/pD07lh7WgnrPFUdqqeYdOwPGLvbOKuY6T6k9e5T16
   gp4nQ+4Y2tcMke33Vu9izP3ugsJDhk2Sh87TWvIKrvBYthyDiE0egjoWv
   yGIAKEvStX9+MXFK1TMTdToCWKfzWSzzXZ8FWlufaKk6Cv18sMneAZqnG
   G4drBKMvZtpvYAH3lND6vpAoMFdRhqpx51beLH8Fi7uBPaW47MhEVYygh
   Re8NEIEuigPx8rdbqf92brq+P3gfXi/boMXq3jL62oG/bSBdj50t5fs7v
   dmeoxoXhtnt1BpvQncFixBDiRmOVYD+0SfibylG/D7qCpJjYiGlsWchR5
   w==;
X-CSE-ConnectionGUID: yLU9ASo5Rea+98yvI/K0Mw==
X-CSE-MsgGUID: yu2/BC50TiCw9yCli9xP1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17852808"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="17852808"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 15:02:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="20963011"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Mar 2024 15:02:42 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpbM0-0001XW-2O;
	Wed, 27 Mar 2024 22:02:40 +0000
Date: Thu, 28 Mar 2024 06:02:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/x86/kernel/smpboot.c:1040:6-7: ERROR: iterator variable bound
 on line 1039 cannot be NULL
Message-ID: <202403280539.R5tAQ3TJ-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@linutronix.de>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   962490525cffee6270422206c9d5bdb12d472c2b
commit: c90399fbd74a0713d5972a6d931e4a9918621e88 x86/cpu: Ensure that CPU info updates are propagated on UP
date:   4 days ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-102-20240327 (https://download.01.org/0day-ci/archive/20240328/202403280539.R5tAQ3TJ-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403280539.R5tAQ3TJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kernel/smpboot.c:1040:6-7: ERROR: iterator variable bound on line 1039 cannot be NULL

vim +1040 arch/x86/kernel/smpboot.c

8aef135c73436fa Glauber de Oliveira Costa 2008-03-19  1033  
ce2612b6706b4d0 Boris Ostrovsky           2021-11-02  1034  void __init smp_prepare_cpus_common(void)
8aef135c73436fa Glauber de Oliveira Costa 2008-03-19  1035  {
7ad728f98162cb1 Rusty Russell             2009-03-13  1036  	unsigned int i;
7ad728f98162cb1 Rusty Russell             2009-03-13  1037  
c90399fbd74a071 Thomas Gleixner           2024-03-22  1038  	/* Mark all except the boot CPU as hotpluggable */
c90399fbd74a071 Thomas Gleixner           2024-03-22 @1039  	for_each_possible_cpu(i) {
c90399fbd74a071 Thomas Gleixner           2024-03-22 @1040  		if (i)
c90399fbd74a071 Thomas Gleixner           2024-03-22  1041  			per_cpu(cpu_info.cpu_index, i) = nr_cpu_ids;
c90399fbd74a071 Thomas Gleixner           2024-03-22  1042  	}
bd22a2f1982fa3e Tejun Heo                 2011-01-23  1043  
7ad728f98162cb1 Rusty Russell             2009-03-13  1044  	for_each_possible_cpu(i) {
79f5599772ac2f1 Li Zefan                  2009-06-15  1045  		zalloc_cpumask_var(&per_cpu(cpu_sibling_map, i), GFP_KERNEL);
79f5599772ac2f1 Li Zefan                  2009-06-15  1046  		zalloc_cpumask_var(&per_cpu(cpu_core_map, i), GFP_KERNEL);
2e4c54dac7b360c Len Brown                 2019-05-13  1047  		zalloc_cpumask_var(&per_cpu(cpu_die_map, i), GFP_KERNEL);
b3d7336db553d31 Yinghai Lu                2011-01-21  1048  		zalloc_cpumask_var(&per_cpu(cpu_llc_shared_map, i), GFP_KERNEL);
66558b730f2533c Tim Chen                  2021-09-24  1049  		zalloc_cpumask_var(&per_cpu(cpu_l2c_shared_map, i), GFP_KERNEL);
7ad728f98162cb1 Rusty Russell             2009-03-13  1050  	}
8f37961cf22304f Tim Chen                  2016-09-21  1051  
8aef135c73436fa Glauber de Oliveira Costa 2008-03-19  1052  	set_cpu_sibling_map(0);
ce2612b6706b4d0 Boris Ostrovsky           2021-11-02  1053  }
ce2612b6706b4d0 Boris Ostrovsky           2021-11-02  1054  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
