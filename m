Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26AA3F4CB
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Oct 2023 22:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmtw0n07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697148492; x=1728684492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KtSSgScbOLin2XuoUSYVEn4XabH/Ua2F3zSu+GaKge8=;
  b=nmtw0n075REoR5+GEJTkzRz5hzCx1KthXbcV/9BWSJtupqV/qiWoy2Sf
   5LV4ti3bmWMzn7GhwsSTODSVH5sanqdLyWns+a1SUuBBlUppkVJ/Iio+o
   xMiMgKVZK4h8aa1H5eupllB2EUVKmKSPHZIWXZdn93XmKd+Lu3fjeLvLx
   0V2Dj3qwh5GVqKAPLbO40OIc0vdywDkCzItGJDEy7NdYjH5b6RhbR6397
   gJtE0zQhu70YpQQCM+L5/+2KE+zr3I1SvC0FsVOftKX1XEwNcjiuZ1OML
   8mEc3i3So6LtgYnp/5BhTsHcVfObkv7uFn+FjqfCnmVsP9zKo8QAy70Dy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="6607656"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="6607656"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 15:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="783879385"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="783879385"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Oct 2023 15:07:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr3qQ-0003wD-33;
	Thu, 12 Oct 2023 22:07:50 +0000
Date: Fri, 13 Oct 2023 06:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/5] perf kvm: Introduce guest interfaces for sampling
 callchains
Message-ID: <202310130614.KeOsd089-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/perf_event.h:1531:41: sparse: sparse: no identifier for function argument"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <SY4P282MB10842B9353422CD2C86DCB929DCFA@SY4P282MB1084.AUSP282.PROD.OUTLOOK.COM>
References: <SY4P282MB10842B9353422CD2C86DCB929DCFA@SY4P282MB1084.AUSP282.PROD.OUTLOOK.COM>
TO: Tianyi Liu <i.pear@outlook.com>
TO: seanjc@google.com
TO: pbonzini@redhat.com
TO: peterz@infradead.org
TO: mingo@redhat.com
TO: acme@kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: kvmarm@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: linux-perf-users@vger.kernel.org
CC: kvm@vger.kernel.org
CC: x86@kernel.org
CC: mark.rutland@arm.com
CC: alexander.shishkin@linux.intel.com
CC: jolsa@kernel.org
CC: namhyung@kernel.org
CC: irogers@google.com
CC: adrian.hunter@intel.com
CC: Tianyi Liu <i.pear@outlook.com>

Hi Tianyi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyi-Liu/KVM-Add-arch-specific-interfaces-for-sampling-guest-callchains/20231008-230042
base:   8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
patch link:    https://lore.kernel.org/r/SY4P282MB10842B9353422CD2C86DCB929DCFA%40SY4P282MB1084.AUSP282.PROD.OUTLOOK.COM
patch subject: [PATCH v2 2/5] perf kvm: Introduce guest interfaces for sampling callchains
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-062-20231012 (https://download.01.org/0day-ci/archive/20231013/202310130614.KeOsd089-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130614.KeOsd089-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310130614.KeOsd089-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/netfs/main.c: note: in included file (through include/linux/trace_events.h, include/trace/trace_events.h, include/trace/define_trace.h, ...):
>> include/linux/perf_event.h:1531:41: sparse: sparse: no identifier for function argument
   include/linux/perf_event.h:1531:48: sparse: sparse: no identifier for function argument
   include/linux/perf_event.h:1531:55: sparse: sparse: no identifier for function argument

vim +1531 include/linux/perf_event.h

87b940a0675e25 Sean Christopherson 2021-11-11  1504  
1c3430516b0732 Sean Christopherson 2021-11-11  1505  static inline unsigned int perf_guest_state(void)
1c3430516b0732 Sean Christopherson 2021-11-11  1506  {
87b940a0675e25 Sean Christopherson 2021-11-11  1507  	return static_call(__perf_guest_state)();
1c3430516b0732 Sean Christopherson 2021-11-11  1508  }
1c3430516b0732 Sean Christopherson 2021-11-11  1509  static inline unsigned long perf_guest_get_ip(void)
1c3430516b0732 Sean Christopherson 2021-11-11  1510  {
87b940a0675e25 Sean Christopherson 2021-11-11  1511  	return static_call(__perf_guest_get_ip)();
1c3430516b0732 Sean Christopherson 2021-11-11  1512  }
7b615fa3e48fd3 Tianyi Liu          2023-10-08  1513  static inline unsigned long perf_guest_get_frame_pointer(void)
7b615fa3e48fd3 Tianyi Liu          2023-10-08  1514  {
7b615fa3e48fd3 Tianyi Liu          2023-10-08  1515  	return static_call(__perf_guest_get_frame_pointer)();
7b615fa3e48fd3 Tianyi Liu          2023-10-08  1516  }
7b615fa3e48fd3 Tianyi Liu          2023-10-08  1517  static inline bool perf_guest_read_virt(void *addr, void *dest, unsigned int length)
7b615fa3e48fd3 Tianyi Liu          2023-10-08  1518  {
7b615fa3e48fd3 Tianyi Liu          2023-10-08  1519  	return static_call(__perf_guest_read_virt)(addr, dest, length);
7b615fa3e48fd3 Tianyi Liu          2023-10-08  1520  }
1c3430516b0732 Sean Christopherson 2021-11-11  1521  static inline unsigned int perf_guest_handle_intel_pt_intr(void)
1c3430516b0732 Sean Christopherson 2021-11-11  1522  {
87b940a0675e25 Sean Christopherson 2021-11-11  1523  	return static_call(__perf_guest_handle_intel_pt_intr)();
1c3430516b0732 Sean Christopherson 2021-11-11  1524  }
2934e3d09350c1 Sean Christopherson 2021-11-11  1525  extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
2934e3d09350c1 Sean Christopherson 2021-11-11  1526  extern void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
2aef6f306b39bb Sean Christopherson 2021-11-11  1527  #else
2aef6f306b39bb Sean Christopherson 2021-11-11  1528  static inline unsigned int perf_guest_state(void)		 { return 0; }
2aef6f306b39bb Sean Christopherson 2021-11-11  1529  static inline unsigned long perf_guest_get_ip(void)		 { return 0; }
7b615fa3e48fd3 Tianyi Liu          2023-10-08  1530  static inline unsigned long perf_guest_get_frame_pointer(void)	{ return 0; }
7b615fa3e48fd3 Tianyi Liu          2023-10-08 @1531  static inline bool perf_guest_read_virt(void*, void*, unsigned int)	{ return 0; }
2aef6f306b39bb Sean Christopherson 2021-11-11  1532  static inline unsigned int perf_guest_handle_intel_pt_intr(void) { return 0; }
2aef6f306b39bb Sean Christopherson 2021-11-11  1533  #endif /* CONFIG_GUEST_PERF_EVENTS */
39447b386c846b Zhang, Yanmin       2010-04-19  1534  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
