Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D85D50B
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Feb 2023 22:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675462283; x=1706998283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jzUphug4tAj5lT+t+uDSudW/1DhEYW3mc9XHLA5gQXo=;
  b=jQ2RxkR9N9p/BNZ8zNVhOb0w2IKigt9Pl9VGxSujM620khO8bheDwN4q
   u2LN/4QhWkjXbaJazJpH39vd4ppPAqk0vxmoxfWevmBbXMVdmt+aBCMjX
   P0mWpl329t6lyd235XdlSF+gRG6R8+b5FKu3OaJI6PmKs4NCTREbY/1VR
   W6s9BACClypC7u9mZicEe43kfVY7Z2bWfZQ7vUK4CrLNSPHwkWHeaELzp
   CuBa8RB5gxWhh0o3bRqd7KROKLsP8QLsZLmLKYRP8+Uf95pbr39jZh1Lk
   PSsaMDWt6g2Fq7p6FdVWNR6fVrZYELfhPSosT0ejyEpuge4MO7xcvqOaX
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330158913"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="330158913"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 14:11:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729401039"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="729401039"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Feb 2023 14:11:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pO4H8-0000nH-0u;
	Fri, 03 Feb 2023 22:11:18 +0000
Date: Sat, 4 Feb 2023 06:11:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6933/10357]
 arch/s390/kernel/perf_pai_ext.c:633:5: warning: Redundant initialization for
 'rc'. The initialized value is overwritten before it is read.
 [redundantInitialization]
Message-ID: <202302040623.ifFhlh6Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/s390/kernel/perf_pai_ext.c:633:5: warning: Redundant initialization for 'rc'. The initialized value is overwritten before it is read. [redundantInitialization]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Thomas Richter <tmricht@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4fafd96910add124586b549ad005dcd179de8a18
commit: 1e99c242acb2fc211aa9f57cd1060622e66bbf63 [6933/10357] s390/cpum_cf: merge source files for CPU Measurement counter facility
:::::: branch date: 19 hours ago
:::::: commit date: 9 days ago
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 1e99c242acb2fc211aa9f57cd1060622e66bbf63
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/s390/pci/pci_bus.c:367:5: warning: Redundant initialization for 'rc'. The initialized value is overwritten before it is read. [redundantInitialization]
    rc = zpci_bus_add_device(zbus, zdev);
       ^
   arch/s390/pci/pci_bus.c:337:9: note: rc is initialized
    int rc = -EBADF;
           ^
   arch/s390/pci/pci_bus.c:367:5: note: rc is overwritten
    rc = zpci_bus_add_device(zbus, zdev);
       ^
>> arch/s390/kernel/perf_pai_ext.c:633:5: warning: Redundant initialization for 'rc'. The initialized value is overwritten before it is read. [redundantInitialization]
    rc = attr_event_init();
       ^
   arch/s390/kernel/perf_pai_ext.c:621:9: note: rc is initialized
    int rc = -ENOMEM;
           ^
   arch/s390/kernel/perf_pai_ext.c:633:5: note: rc is overwritten
    rc = attr_event_init();
       ^
>> arch/s390/kernel/perf_cpum_sf.c:852:8: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
     si = cpuhw->qsi;
          ^
   arch/s390/kernel/perf_cpum_sf.c:851:11: note: Address of variable taken here.
     cpuhw = &per_cpu(cpu_hw_sf, event->cpu);
             ^
   arch/s390/kernel/perf_cpum_sf.c:851:19: note: Temporary created here.
     cpuhw = &per_cpu(cpu_hw_sf, event->cpu);
                     ^
   arch/s390/kernel/perf_cpum_sf.c:852:8: note: Using pointer that is a temporary.
     si = cpuhw->qsi;
          ^
   arch/s390/kernel/perf_cpum_sf.c:914:27: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
      err = allocate_buffers(cpuhw, hwc);
                             ^
   arch/s390/kernel/perf_cpum_sf.c:913:12: note: Address of variable taken here.
      cpuhw = &per_cpu(cpu_hw_sf, cpu);
              ^
   arch/s390/kernel/perf_cpum_sf.c:913:20: note: Temporary created here.
      cpuhw = &per_cpu(cpu_hw_sf, cpu);
                      ^
   arch/s390/kernel/perf_cpum_sf.c:914:27: note: Using pointer that is a temporary.
      err = allocate_buffers(cpuhw, hwc);
                             ^
   arch/s390/kernel/perf_cpum_sf.c:1910:8: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
     si = cpuhw->qsi;
          ^
   arch/s390/kernel/perf_cpum_sf.c:1908:29: note: Address of variable taken here.
     struct cpu_hw_sf *cpuhw = &per_cpu(cpu_hw_sf, event->cpu);
                               ^
   arch/s390/kernel/perf_cpum_sf.c:1908:37: note: Temporary created here.
     struct cpu_hw_sf *cpuhw = &per_cpu(cpu_hw_sf, event->cpu);
                                       ^
   arch/s390/kernel/perf_cpum_sf.c:1910:8: note: Using pointer that is a temporary.
     si = cpuhw->qsi;
          ^
>> arch/s390/kernel/perf_cpum_sf.c:143:48: warning: Parameter 's' can be declared as pointer to const [constParameter]
   static inline int is_link_entry(unsigned long *s)
                                                  ^
   arch/s390/kernel/perf_cpum_sf.c:149:59: warning: Parameter 's' can be declared as pointer to const [constParameter]
   static inline unsigned long *get_next_sdbt(unsigned long *s)
                                                             ^
>> arch/s390/kernel/perf_cpum_cf.c:453:27: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
    if (!(hwc->config_base & cpuhw->info.auth_ctl))
                             ^
   arch/s390/kernel/perf_cpum_cf.c:446:10: note: Address of variable taken here.
    cpuhw = &get_cpu_var(cpu_cf_events);
            ^
   arch/s390/kernel/perf_cpum_cf.c:446:22: note: Temporary created here.
    cpuhw = &get_cpu_var(cpu_cf_events);
                        ^
   arch/s390/kernel/perf_cpum_cf.c:453:27: note: Using pointer that is a temporary.
    if (!(hwc->config_base & cpuhw->info.auth_ctl))
                             ^
   arch/s390/kernel/perf_cpum_cf.c:1584:7: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
     if (cpuhw->info.auth_ctl & cpumf_ctr_ctl[i])
         ^
   arch/s390/kernel/perf_cpum_cf.c:1582:10: note: Address of variable taken here.
    cpuhw = &get_cpu_var(cpu_cf_events);
            ^
   arch/s390/kernel/perf_cpum_cf.c:1582:22: note: Temporary created here.
    cpuhw = &get_cpu_var(cpu_cf_events);
                        ^
   arch/s390/kernel/perf_cpum_cf.c:1584:7: note: Using pointer that is a temporary.
     if (cpuhw->info.auth_ctl & cpumf_ctr_ctl[i])
         ^

vim +/rc +633 arch/s390/kernel/perf_pai_ext.c

c432fefe8e6262 Thomas Richter 2022-06-30  617  
c432fefe8e6262 Thomas Richter 2022-06-30  618  static int __init paiext_init(void)
c432fefe8e6262 Thomas Richter 2022-06-30  619  {
c432fefe8e6262 Thomas Richter 2022-06-30  620  	struct qpaci_info_block ib;
c432fefe8e6262 Thomas Richter 2022-06-30  621  	int rc = -ENOMEM;
c432fefe8e6262 Thomas Richter 2022-06-30  622  
c432fefe8e6262 Thomas Richter 2022-06-30  623  	if (!test_facility(197))
c432fefe8e6262 Thomas Richter 2022-06-30  624  		return 0;
c432fefe8e6262 Thomas Richter 2022-06-30  625  
c432fefe8e6262 Thomas Richter 2022-06-30  626  	qpaci(&ib);
c432fefe8e6262 Thomas Richter 2022-06-30  627  	paiext_cnt = ib.num_nnpa;
c432fefe8e6262 Thomas Richter 2022-06-30  628  	if (paiext_cnt >= PAI_NNPA_MAXCTR)
c432fefe8e6262 Thomas Richter 2022-06-30  629  		paiext_cnt = PAI_NNPA_MAXCTR;
c432fefe8e6262 Thomas Richter 2022-06-30  630  	if (!paiext_cnt)
c432fefe8e6262 Thomas Richter 2022-06-30  631  		return 0;
c432fefe8e6262 Thomas Richter 2022-06-30  632  
c432fefe8e6262 Thomas Richter 2022-06-30 @633  	rc = attr_event_init();
c432fefe8e6262 Thomas Richter 2022-06-30  634  	if (rc) {
c432fefe8e6262 Thomas Richter 2022-06-30  635  		pr_err("Creation of PMU " KMSG_COMPONENT " /sysfs failed\n");
c432fefe8e6262 Thomas Richter 2022-06-30  636  		return rc;
c432fefe8e6262 Thomas Richter 2022-06-30  637  	}
c432fefe8e6262 Thomas Richter 2022-06-30  638  
c432fefe8e6262 Thomas Richter 2022-06-30  639  	/* Setup s390dbf facility */
c432fefe8e6262 Thomas Richter 2022-06-30  640  	paiext_dbg = debug_register(KMSG_COMPONENT, 2, 256, 128);
c432fefe8e6262 Thomas Richter 2022-06-30  641  	if (!paiext_dbg) {
c432fefe8e6262 Thomas Richter 2022-06-30  642  		pr_err("Registration of s390dbf " KMSG_COMPONENT " failed\n");
c432fefe8e6262 Thomas Richter 2022-06-30  643  		rc = -ENOMEM;
c432fefe8e6262 Thomas Richter 2022-06-30  644  		goto out_init;
c432fefe8e6262 Thomas Richter 2022-06-30  645  	}
c432fefe8e6262 Thomas Richter 2022-06-30  646  	debug_register_view(paiext_dbg, &debug_sprintf_view);
c432fefe8e6262 Thomas Richter 2022-06-30  647  
c432fefe8e6262 Thomas Richter 2022-06-30  648  	rc = perf_pmu_register(&paiext, KMSG_COMPONENT, -1);
c432fefe8e6262 Thomas Richter 2022-06-30  649  	if (rc) {
c432fefe8e6262 Thomas Richter 2022-06-30  650  		pr_err("Registration of " KMSG_COMPONENT " PMU failed with "
c432fefe8e6262 Thomas Richter 2022-06-30  651  		       "rc=%i\n", rc);
c432fefe8e6262 Thomas Richter 2022-06-30  652  		goto out_pmu;
c432fefe8e6262 Thomas Richter 2022-06-30  653  	}
c432fefe8e6262 Thomas Richter 2022-06-30  654  
c432fefe8e6262 Thomas Richter 2022-06-30  655  	return 0;
c432fefe8e6262 Thomas Richter 2022-06-30  656  
c432fefe8e6262 Thomas Richter 2022-06-30  657  out_pmu:
c432fefe8e6262 Thomas Richter 2022-06-30  658  	debug_unregister_view(paiext_dbg, &debug_sprintf_view);
c432fefe8e6262 Thomas Richter 2022-06-30  659  	debug_unregister(paiext_dbg);
c432fefe8e6262 Thomas Richter 2022-06-30  660  out_init:
c432fefe8e6262 Thomas Richter 2022-06-30  661  	attr_event_free(paiext_events_group.attrs,
c432fefe8e6262 Thomas Richter 2022-06-30  662  			ARRAY_SIZE(paiext_ctrnames) + 1);
c432fefe8e6262 Thomas Richter 2022-06-30  663  	return rc;
c432fefe8e6262 Thomas Richter 2022-06-30  664  }
c432fefe8e6262 Thomas Richter 2022-06-30  665  

:::::: The code at line 633 was first introduced by commit
:::::: c432fefe8e6262bf3d288ab82d006cfafa78a139 s390/pai: Add support for PAI Extension 1 NNPA counters

:::::: TO: Thomas Richter <tmricht@linux.ibm.com>
:::::: CC: Vasily Gorbik <gor@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
