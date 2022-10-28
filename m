Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627D928E8
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Oct 2022 15:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666969904; x=1698505904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=skguV0zNJHRgGX3YL0NzIQ2/wk1B+wzDWiTV749KxXc=;
  b=I2FKioRMt878ZLqOZYpOHXjW/Ig+4wvR+lLoKEdvaOG499R5ophB1myx
   Ls9HL1iqIrOEWxoKrq5rgLJ4x4lWGU9t9zH/MoSU9vTb5gtTagzvFg2vE
   c49KFqNHxooEcfQoaGA3ZNQHmxwem/r3Vp1pmmxbWCDMe/u0DalcAFAy9
   xNJoFV8v9XKNcATMYPJ2IUOjxj/iJic9FSRwDwsBSYt+DJKmoi3jXI7OI
   8i//aJ1TmbskTnY7otiu4V4TMJcuywA4X+z+oTairy53rdbBVxEo2edMA
   3VOGDE1Sud+odBMWqZtdD4kG34mzZJoRqD6QoJto1AQdU1YxA1mIM8k70
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="288906851"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; 
   d="scan'208";a="288906851"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 08:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="664044096"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; 
   d="scan'208";a="664044096"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Oct 2022 08:11:42 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ooR1J-000A0d-27;
	Fri, 28 Oct 2022 15:11:41 +0000
Date: Fri, 28 Oct 2022 23:11:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/s390/kernel/perf_pai_ext.c:638:5: warning: Redundant
 initialization for 'rc'. The initialized value is overwritten before it is
 read. [redundantInitialization]
Message-ID: <202210282322.bhRPkcrw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/s390/kernel/perf_pai_ext.c:638:5: warning: Redundant initialization for 'rc'. The initialized value is overwritten before it is read. [redundantInitialization]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thomas Richter <tmricht@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>
CC: Sumanth Korikkar <sumanthk@linux.ibm.com>
CC: Sven Schnelle <svens@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23758867219c8d84c8363316e6dd2f9fd7ae3049
commit: c432fefe8e6262bf3d288ab82d006cfafa78a139 s390/pai: Add support for PAI Extension 1 NNPA counters
date:   6 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 weeks ago
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c432fefe8e6262bf3d288ab82d006cfafa78a139
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/s390/kernel/perf_pai_ext.c:638:5: warning: Redundant initialization for 'rc'. The initialized value is overwritten before it is read. [redundantInitialization]
    rc = attr_event_init();
       ^
   arch/s390/kernel/perf_pai_ext.c:626:9: note: rc is initialized
    int rc = -ENOMEM;
           ^
   arch/s390/kernel/perf_pai_ext.c:638:5: note: rc is overwritten
    rc = attr_event_init();
       ^

vim +/rc +638 arch/s390/kernel/perf_pai_ext.c

c432fefe8e6262 Thomas Richter 2022-06-30  622  
c432fefe8e6262 Thomas Richter 2022-06-30  623  static int __init paiext_init(void)
c432fefe8e6262 Thomas Richter 2022-06-30  624  {
c432fefe8e6262 Thomas Richter 2022-06-30  625  	struct qpaci_info_block ib;
c432fefe8e6262 Thomas Richter 2022-06-30  626  	int rc = -ENOMEM;
c432fefe8e6262 Thomas Richter 2022-06-30  627  
c432fefe8e6262 Thomas Richter 2022-06-30  628  	if (!test_facility(197))
c432fefe8e6262 Thomas Richter 2022-06-30  629  		return 0;
c432fefe8e6262 Thomas Richter 2022-06-30  630  
c432fefe8e6262 Thomas Richter 2022-06-30  631  	qpaci(&ib);
c432fefe8e6262 Thomas Richter 2022-06-30  632  	paiext_cnt = ib.num_nnpa;
c432fefe8e6262 Thomas Richter 2022-06-30  633  	if (paiext_cnt >= PAI_NNPA_MAXCTR)
c432fefe8e6262 Thomas Richter 2022-06-30  634  		paiext_cnt = PAI_NNPA_MAXCTR;
c432fefe8e6262 Thomas Richter 2022-06-30  635  	if (!paiext_cnt)
c432fefe8e6262 Thomas Richter 2022-06-30  636  		return 0;
c432fefe8e6262 Thomas Richter 2022-06-30  637  
c432fefe8e6262 Thomas Richter 2022-06-30 @638  	rc = attr_event_init();
c432fefe8e6262 Thomas Richter 2022-06-30  639  	if (rc) {
c432fefe8e6262 Thomas Richter 2022-06-30  640  		pr_err("Creation of PMU " KMSG_COMPONENT " /sysfs failed\n");
c432fefe8e6262 Thomas Richter 2022-06-30  641  		return rc;
c432fefe8e6262 Thomas Richter 2022-06-30  642  	}
c432fefe8e6262 Thomas Richter 2022-06-30  643  
c432fefe8e6262 Thomas Richter 2022-06-30  644  	/* Setup s390dbf facility */
c432fefe8e6262 Thomas Richter 2022-06-30  645  	paiext_dbg = debug_register(KMSG_COMPONENT, 2, 256, 128);
c432fefe8e6262 Thomas Richter 2022-06-30  646  	if (!paiext_dbg) {
c432fefe8e6262 Thomas Richter 2022-06-30  647  		pr_err("Registration of s390dbf " KMSG_COMPONENT " failed\n");
c432fefe8e6262 Thomas Richter 2022-06-30  648  		rc = -ENOMEM;
c432fefe8e6262 Thomas Richter 2022-06-30  649  		goto out_init;
c432fefe8e6262 Thomas Richter 2022-06-30  650  	}
c432fefe8e6262 Thomas Richter 2022-06-30  651  	debug_register_view(paiext_dbg, &debug_sprintf_view);
c432fefe8e6262 Thomas Richter 2022-06-30  652  
c432fefe8e6262 Thomas Richter 2022-06-30  653  	rc = perf_pmu_register(&paiext, KMSG_COMPONENT, -1);
c432fefe8e6262 Thomas Richter 2022-06-30  654  	if (rc) {
c432fefe8e6262 Thomas Richter 2022-06-30  655  		pr_err("Registration of " KMSG_COMPONENT " PMU failed with "
c432fefe8e6262 Thomas Richter 2022-06-30  656  		       "rc=%i\n", rc);
c432fefe8e6262 Thomas Richter 2022-06-30  657  		goto out_pmu;
c432fefe8e6262 Thomas Richter 2022-06-30  658  	}
c432fefe8e6262 Thomas Richter 2022-06-30  659  
c432fefe8e6262 Thomas Richter 2022-06-30  660  	return 0;
c432fefe8e6262 Thomas Richter 2022-06-30  661  
c432fefe8e6262 Thomas Richter 2022-06-30  662  out_pmu:
c432fefe8e6262 Thomas Richter 2022-06-30  663  	debug_unregister_view(paiext_dbg, &debug_sprintf_view);
c432fefe8e6262 Thomas Richter 2022-06-30  664  	debug_unregister(paiext_dbg);
c432fefe8e6262 Thomas Richter 2022-06-30  665  out_init:
c432fefe8e6262 Thomas Richter 2022-06-30  666  	attr_event_free(paiext_events_group.attrs,
c432fefe8e6262 Thomas Richter 2022-06-30  667  			ARRAY_SIZE(paiext_ctrnames) + 1);
c432fefe8e6262 Thomas Richter 2022-06-30  668  	return rc;
c432fefe8e6262 Thomas Richter 2022-06-30  669  }
c432fefe8e6262 Thomas Richter 2022-06-30  670  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
