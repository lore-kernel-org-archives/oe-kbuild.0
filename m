Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4490111AA
	for <oe-kbuild@lists.linux.dev>; Tue, 14 May 2024 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715675159; cv=none; b=aEBfGw5zGXvfzms+woPUPPwTzSVkiA8Ssy/4AlV4Mh1IBbAJyz+wmwcj6lromgEhMhIa8H4gbnSio1GVuM5b9Gxj1kYMrBz5UH+GlPtpMFXDad8RDH7dbT+/dwtklXV5y+ppLpSoshdsiuHhDWbBQgzOV9vTPJZeE5uqRlwrbcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715675159; c=relaxed/simple;
	bh=AWveqF1NCrdy26yF6Mp0PQYiUR6V6rYRi3LuruOAVBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rFBheIp7Vu7MPuBwYcc3wlEx1PHg31aIVhYyYWdlTZuh5sMddUqSC0rC2kkA62D01LfQLDEAzZjj/Ah/17qIq7atSRNft5HfNZvLAmZgcgsAmnmC3A9UgbMqGrGpzyXsUxnTyC6vVkerNRWMQiuAObF+W7PDg+EWX6QT0IxWT1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzpSk023; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzpSk023"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715675158; x=1747211158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AWveqF1NCrdy26yF6Mp0PQYiUR6V6rYRi3LuruOAVBw=;
  b=VzpSk023AxmlovLIbYtIhtB3RB8MKkCHEybY6hpiZKFe+Ff0QCv04Q39
   CQP1nUWtYy3xCcp/6EZZpjO8FYYLhca5nQS100mNUU0NrDnVQJJLsO11K
   uW1UI4S4A9khNXfctBb6AhYMC9E2/XJqhmalU8VH2qd6AQjU/L8P22koW
   ZP70CHFnomA0KYu13czFQkE32uiLm4+RDtbk/0N4wUGPUd/N1knKRyPvk
   aY+WCG0kvMgjUlByg2MDUNxz3fIHT2D3sto79zDxopn/Hw0+mE2hExx/z
   4f7qESsirNYyN/VQbZZFaRQaTYpzLwQZ9kf/VaWQLfVrxbjXZEDWU1Zly
   A==;
X-CSE-ConnectionGUID: HREcQ36oROSGvit4jSVgwg==
X-CSE-MsgGUID: pRmHBdaAQ+CReQIjP3xokA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11766132"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11766132"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 01:25:57 -0700
X-CSE-ConnectionGUID: G1mFrvb0Q/q1gMeFAOb4+Q==
X-CSE-MsgGUID: IoY1hTaGSS6I/si0CnFAYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="68082208"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 May 2024 01:25:56 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6nTu-000BHj-09;
	Tue, 14 May 2024 08:25:54 +0000
Date: Tue, 14 May 2024 16:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sean-jc:x86/gnu_source 41/42]
 tools/testing/selftests/kvm/rseq_test.c:223:undefined reference to
 `rseq_register_current_thread'
Message-ID: <202405141601.VXdtmd3C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Edward Liaw <edliaw@google.com>
CC: Sean Christopherson <seanjc@google.com>
CC: Muhammad Usama Anjum <usama.anjum@collabora.com>

Hi Edward,

First bad commit (maybe != root cause):

tree:   https://github.com/sean-jc/linux x86/gnu_source
head:   174e2813ab91474be393ada0051bd7479a777023
commit: cc63298ca9d5d24b37a730484b8a71b359652f46 [41/42] selftests: Drop define _GNU_SOURCE
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405141601.VXdtmd3C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405141601.VXdtmd3C-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   rseq_test.c: In function 'main':
>> rseq_test.c:223:13: warning: implicit declaration of function 'rseq_register_current_thread' [-Wimplicit-function-declaration]
     223 |         r = rseq_register_current_thread();
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> rseq_test.c:261:29: warning: implicit declaration of function 'sys_getcpu'; did you mean 'SYS_getcpu'? [-Wimplicit-function-declaration]
     261 |                         r = sys_getcpu(&cpu, NULL);
         |                             ^~~~~~~~~~
         |                             SYS_getcpu
>> rseq_test.c:264:36: warning: implicit declaration of function 'rseq_current_cpu_raw' [-Wimplicit-function-declaration]
     264 |                         rseq_cpu = rseq_current_cpu_raw();
         |                                    ^~~~~~~~~~~~~~~~~~~~
>> rseq_test.c:294:9: warning: implicit declaration of function 'rseq_unregister_current_thread' [-Wimplicit-function-declaration]
     294 |         rseq_unregister_current_thread();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics
--
   /usr/bin/ld: kselftest/kvm/rseq_test.o: in function `main':
>> tools/testing/selftests/kvm/rseq_test.c:223:(.text.startup+0x14f): undefined reference to `rseq_register_current_thread'
>> /usr/bin/ld: tools/testing/selftests/kvm/rseq_test.c:261:(.text.startup+0x230): undefined reference to `sys_getcpu'
>> /usr/bin/ld: tools/testing/selftests/kvm/rseq_test.c:264:(.text.startup+0x270): undefined reference to `rseq_current_cpu_raw'
>> /usr/bin/ld: tools/testing/selftests/kvm/rseq_test.c:294:(.text.startup+0x310): undefined reference to `rseq_unregister_current_thread'
   collect2: error: ld returned 1 exit status


vim +223 tools/testing/selftests/kvm/rseq_test.c

20ecf595b513b4 Zide Chen           2024-05-02  195  
61e52f1630f547 Sean Christopherson 2021-09-01  196  int main(int argc, char *argv[])
61e52f1630f547 Sean Christopherson 2021-09-01  197  {
20ecf595b513b4 Zide Chen           2024-05-02  198  	bool skip_sanity_check = false;
61e52f1630f547 Sean Christopherson 2021-09-01  199  	int r, i, snapshot;
61e52f1630f547 Sean Christopherson 2021-09-01  200  	struct kvm_vm *vm;
2494a6d80fb58c Sean Christopherson 2022-02-15  201  	struct kvm_vcpu *vcpu;
61e52f1630f547 Sean Christopherson 2021-09-01  202  	u32 cpu, rseq_cpu;
20ecf595b513b4 Zide Chen           2024-05-02  203  	int opt;
20ecf595b513b4 Zide Chen           2024-05-02  204  
20ecf595b513b4 Zide Chen           2024-05-02  205  	while ((opt = getopt(argc, argv, "hu")) != -1) {
20ecf595b513b4 Zide Chen           2024-05-02  206  		switch (opt) {
20ecf595b513b4 Zide Chen           2024-05-02  207  		case 'u':
20ecf595b513b4 Zide Chen           2024-05-02  208  			skip_sanity_check = true;
20ecf595b513b4 Zide Chen           2024-05-02  209  			break;
20ecf595b513b4 Zide Chen           2024-05-02  210  		case 'h':
20ecf595b513b4 Zide Chen           2024-05-02  211  		default:
20ecf595b513b4 Zide Chen           2024-05-02  212  			help(argv[0]);
20ecf595b513b4 Zide Chen           2024-05-02  213  			break;
20ecf595b513b4 Zide Chen           2024-05-02  214  		}
20ecf595b513b4 Zide Chen           2024-05-02  215  	}
61e52f1630f547 Sean Christopherson 2021-09-01  216  
61e52f1630f547 Sean Christopherson 2021-09-01  217  	r = sched_getaffinity(0, sizeof(possible_mask), &possible_mask);
61e52f1630f547 Sean Christopherson 2021-09-01  218  	TEST_ASSERT(!r, "sched_getaffinity failed, errno = %d (%s)", errno,
61e52f1630f547 Sean Christopherson 2021-09-01  219  		    strerror(errno));
61e52f1630f547 Sean Christopherson 2021-09-01  220  
7ed397d107d461 Sean Christopherson 2022-05-27  221  	calc_min_max_cpu();
61e52f1630f547 Sean Christopherson 2021-09-01  222  
66d42ac73fc680 Gavin Shan          2022-08-10 @223  	r = rseq_register_current_thread();
66d42ac73fc680 Gavin Shan          2022-08-10  224  	TEST_ASSERT(!r, "rseq_register_current_thread failed, errno = %d (%s)",
66d42ac73fc680 Gavin Shan          2022-08-10  225  		    errno, strerror(errno));
61e52f1630f547 Sean Christopherson 2021-09-01  226  
61e52f1630f547 Sean Christopherson 2021-09-01  227  	/*
61e52f1630f547 Sean Christopherson 2021-09-01  228  	 * Create and run a dummy VM that immediately exits to userspace via
61e52f1630f547 Sean Christopherson 2021-09-01  229  	 * GUEST_SYNC, while concurrently migrating the process by setting its
61e52f1630f547 Sean Christopherson 2021-09-01  230  	 * CPU affinity.
61e52f1630f547 Sean Christopherson 2021-09-01  231  	 */
2494a6d80fb58c Sean Christopherson 2022-02-15  232  	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
61e52f1630f547 Sean Christopherson 2021-09-01  233  
e923b0537d28e1 Gavin Shan          2022-07-19  234  	pthread_create(&migration_thread, NULL, migration_worker,
561cafebb2cf97 Jinrong Liang       2022-08-02  235  		       (void *)(unsigned long)syscall(SYS_gettid));
61e52f1630f547 Sean Christopherson 2021-09-01  236  
61e52f1630f547 Sean Christopherson 2021-09-01  237  	for (i = 0; !done; i++) {
768e9a61856b75 Sean Christopherson 2022-06-02  238  		vcpu_run(vcpu);
768e9a61856b75 Sean Christopherson 2022-06-02  239  		TEST_ASSERT(get_ucall(vcpu, NULL) == UCALL_SYNC,
61e52f1630f547 Sean Christopherson 2021-09-01  240  			    "Guest failed?");
61e52f1630f547 Sean Christopherson 2021-09-01  241  
61e52f1630f547 Sean Christopherson 2021-09-01  242  		/*
61e52f1630f547 Sean Christopherson 2021-09-01  243  		 * Verify rseq's CPU matches sched's CPU.  Ensure migration
0fcc102923dee9 Gavin Shan          2022-08-10  244  		 * doesn't occur between getcpu() and reading the rseq cpu_id
0fcc102923dee9 Gavin Shan          2022-08-10  245  		 * by rereading both if the sequence count changes, or if the
0fcc102923dee9 Gavin Shan          2022-08-10  246  		 * count is odd (migration in-progress).
61e52f1630f547 Sean Christopherson 2021-09-01  247  		 */
61e52f1630f547 Sean Christopherson 2021-09-01  248  		do {
61e52f1630f547 Sean Christopherson 2021-09-01  249  			/*
61e52f1630f547 Sean Christopherson 2021-09-01  250  			 * Drop bit 0 to force a mismatch if the count is odd,
61e52f1630f547 Sean Christopherson 2021-09-01  251  			 * i.e. if a migration is in-progress.
61e52f1630f547 Sean Christopherson 2021-09-01  252  			 */
61e52f1630f547 Sean Christopherson 2021-09-01  253  			snapshot = atomic_read(&seq_cnt) & ~1;
61e52f1630f547 Sean Christopherson 2021-09-01  254  
61e52f1630f547 Sean Christopherson 2021-09-01  255  			/*
0fcc102923dee9 Gavin Shan          2022-08-10  256  			 * Ensure calling getcpu() and reading rseq.cpu_id complete
0fcc102923dee9 Gavin Shan          2022-08-10  257  			 * in a single "no migration" window, i.e. are not reordered
0fcc102923dee9 Gavin Shan          2022-08-10  258  			 * across the seq_cnt reads.
61e52f1630f547 Sean Christopherson 2021-09-01  259  			 */
61e52f1630f547 Sean Christopherson 2021-09-01  260  			smp_rmb();
68efe8f7a1c516 Mark Brown          2023-01-06 @261  			r = sys_getcpu(&cpu, NULL);
68efe8f7a1c516 Mark Brown          2023-01-06  262  			TEST_ASSERT(!r, "getcpu failed, errno = %d (%s)",
68efe8f7a1c516 Mark Brown          2023-01-06  263  				    errno, strerror(errno));
66d42ac73fc680 Gavin Shan          2022-08-10 @264  			rseq_cpu = rseq_current_cpu_raw();
61e52f1630f547 Sean Christopherson 2021-09-01  265  			smp_rmb();
61e52f1630f547 Sean Christopherson 2021-09-01  266  		} while (snapshot != atomic_read(&seq_cnt));
61e52f1630f547 Sean Christopherson 2021-09-01  267  
61e52f1630f547 Sean Christopherson 2021-09-01  268  		TEST_ASSERT(rseq_cpu == cpu,
250e138d876838 Andrew Jones        2023-12-06  269  			    "rseq CPU = %d, sched CPU = %d", rseq_cpu, cpu);
61e52f1630f547 Sean Christopherson 2021-09-01  270  	}
61e52f1630f547 Sean Christopherson 2021-09-01  271  
61e52f1630f547 Sean Christopherson 2021-09-01  272  	/*
61e52f1630f547 Sean Christopherson 2021-09-01  273  	 * Sanity check that the test was able to enter the guest a reasonable
61e52f1630f547 Sean Christopherson 2021-09-01  274  	 * number of times, e.g. didn't get stalled too often/long waiting for
0fcc102923dee9 Gavin Shan          2022-08-10  275  	 * getcpu() to stabilize.  A 2:1 migration:KVM_RUN ratio is a fairly
0fcc102923dee9 Gavin Shan          2022-08-10  276  	 * conservative ratio on x86-64, which can do _more_ KVM_RUNs than
0fcc102923dee9 Gavin Shan          2022-08-10  277  	 * migrations given the 1us+ delay in the migration task.
20ecf595b513b4 Zide Chen           2024-05-02  278  	 *
20ecf595b513b4 Zide Chen           2024-05-02  279  	 * Another reason why it may have small migration:KVM_RUN ratio is that,
20ecf595b513b4 Zide Chen           2024-05-02  280  	 * on systems with large low power mode wakeup latency, it may happen
20ecf595b513b4 Zide Chen           2024-05-02  281  	 * quite often that the scheduler is not able to wake up the target CPU
20ecf595b513b4 Zide Chen           2024-05-02  282  	 * before the vCPU thread is scheduled to another CPU.
61e52f1630f547 Sean Christopherson 2021-09-01  283  	 */
20ecf595b513b4 Zide Chen           2024-05-02  284  	TEST_ASSERT(skip_sanity_check || i > (NR_TASK_MIGRATIONS / 2),
20ecf595b513b4 Zide Chen           2024-05-02  285  		    "Only performed %d KVM_RUNs, task stalled too much?\n\n"
20ecf595b513b4 Zide Chen           2024-05-02  286  		    "  Try disabling deep sleep states to reduce CPU wakeup latency,\n"
20ecf595b513b4 Zide Chen           2024-05-02  287  		    "  e.g. via cpuidle.off=1 or setting /dev/cpu_dma_latency to '0',\n"
20ecf595b513b4 Zide Chen           2024-05-02  288  		    "  or run with -u to disable this sanity check.", i);
61e52f1630f547 Sean Christopherson 2021-09-01  289  
61e52f1630f547 Sean Christopherson 2021-09-01  290  	pthread_join(migration_thread, NULL);
61e52f1630f547 Sean Christopherson 2021-09-01  291  
61e52f1630f547 Sean Christopherson 2021-09-01  292  	kvm_vm_free(vm);
61e52f1630f547 Sean Christopherson 2021-09-01  293  
66d42ac73fc680 Gavin Shan          2022-08-10 @294  	rseq_unregister_current_thread();

:::::: The code at line 223 was first introduced by commit
:::::: 66d42ac73fc680dbd7a1402f8b44967426522d0f KVM: selftests: Make rseq compatible with glibc-2.35

:::::: TO: Gavin Shan <gshan@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
