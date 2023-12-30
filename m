Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C114110EB
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Dec 2023 01:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hg0t8bEB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703901118; x=1735437118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Nj1giIcDiL8kU8PicfN4vxQPQqiC8t84zQ7FkGfERQ=;
  b=Hg0t8bEB7MCHx8ZfsTZKDSt9zZqDZlcLS9F7MLP2HMc7Rzkwi1PGT8pH
   /cvkTMab/QDaDvwlorKHQhx1TEYBz1Y8wo0VLpPcsatB9x1UyK0KI5OJI
   RxrGSahlrmjdlGC7iUwnedKqKIKJTu6O48BbgFehPYsGair6dc/dXbkqI
   6LnPUZyvLCW9dE2nFPIjZz4IGIDnLgunVcG2VPq0NUCYpPqcUKlR8jMXR
   0ZxzYyCHovpWzS8Slr9E6UCKjQcT5XQiNXbOcsf86L/MMpKqwWfCvKKPn
   Q9779Fj3RBrxCVwMkuwzpCpygEGpxY6Uwd3QMDNZmQf7vi+qkdO0qc3mK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="381661054"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="381661054"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 17:51:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="849353328"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="849353328"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Dec 2023 17:51:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJOW2-000HyP-23;
	Sat, 30 Dec 2023 01:51:54 +0000
Date: Sat, 30 Dec 2023 09:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARN: resolve_btfids: unresolved symbol bpf_cpumask_xor
Message-ID: <202312300908.r1iNm6AC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "resolve_btfids: unresolved symbol"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Vernet <void@manifault.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f016f7547aeedefed9450499d002ba983b8fce15
commit: 516f4d3397c9e90f4da04f59986c856016269aa1 bpf: Enable cpumasks to be queried and used as kptrs
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: mips-buildonly-randconfig-r003-20220823 (https://download.01.org/0day-ci/archive/20231230/202312300908.r1iNm6AC-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312300908.r1iNm6AC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312300908.r1iNm6AC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARN: resolve_btfids: unresolved symbol bpf_task_release
   WARN: resolve_btfids: unresolved symbol bpf_task_kptr_get
   WARN: resolve_btfids: unresolved symbol bpf_task_from_pid
   WARN: resolve_btfids: unresolved symbol bpf_task_acquire_not_zero
   WARN: resolve_btfids: unresolved symbol bpf_task_acquire
   WARN: resolve_btfids: unresolved symbol bpf_rdonly_cast
   WARN: resolve_btfids: unresolved symbol bpf_rcu_read_unlock
   WARN: resolve_btfids: unresolved symbol bpf_rcu_read_lock
   WARN: resolve_btfids: unresolved symbol bpf_obj_new_impl
   WARN: resolve_btfids: unresolved symbol bpf_obj_drop_impl
   WARN: resolve_btfids: unresolved symbol bpf_list_push_front
   WARN: resolve_btfids: unresolved symbol bpf_list_push_back
   WARN: resolve_btfids: unresolved symbol bpf_list_pop_front
   WARN: resolve_btfids: unresolved symbol bpf_list_pop_back
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_xor
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_test_cpu
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_test_and_set_cpu
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_test_and_clear_cpu
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_subset
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_setall
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_set_cpu
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_release
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_or
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_kptr_get
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_intersects
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_full
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_first_zero
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_first
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_equal
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_empty
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_create
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_copy
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_clear_cpu
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_clear
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_any_and
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_any
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_and
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_acquire
   WARN: resolve_btfids: unresolved symbol bpf_cast_to_kern_ctx

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
