Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889ED79C6
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Dec 2023 11:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mL9pY7KX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703764661; x=1735300661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1GDU3y8iDdV/XhqWp1gnditf7XhBTM44MtiyrKC1SfQ=;
  b=mL9pY7KX0gTyarnaKCD++13PhQrRxctHziMJi+8aUapUo9kbqJ18ppKx
   UDCIjlqJkzWU2Qs7FtQggw+skU3hiDd8oLnAl16hjueRSa5O92X3J+uJX
   8PjOHWHs+Eve++wKEe/xfAzDj6RrKTShxK76tI16aqbqnLiO/4s1DywyG
   WrSRb+QgNIkl5HdbV2jP/ABge6rdsxwTlOmpsMvzJlTxDI2mfSGd7pLpp
   wURWLxaiJUqMIXMpULQjs/X/b6ojLFRgVr2DI7uf19BX4HW0dQFXhc6D/
   2phO4S59T3oyuOX2XGldFmnptGDBU+LHs/QuTtp9G1l1zRyjPb15thNme
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="386974482"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="386974482"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 03:57:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="922085547"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; 
   d="scan'208";a="922085547"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 28 Dec 2023 03:57:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIp14-000GS5-0w;
	Thu, 28 Dec 2023 11:57:36 +0000
Date: Thu, 28 Dec 2023 19:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARN: resolve_btfids: unresolved symbol bpf_cpumask_first_and
Message-ID: <202312281940.FrzAWyKW-lkp@intel.com>
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
head:   f5837722ffecbbedf1b1dbab072a063565f0dad1
commit: 5ba3a7a851e3ebffc4cb8f052a4581c4d8af3ae3 bpf: Add bpf_cpumask_first_and() kfunc
date:   7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 months ago
config: mips-buildonly-randconfig-r003-20220823 (https://download.01.org/0day-ci/archive/20231228/202312281940.FrzAWyKW-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312281940.FrzAWyKW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312281940.FrzAWyKW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARN: resolve_btfids: unresolved symbol prog_test_ref_kfunc
   WARN: resolve_btfids: unresolved symbol cgroup
   WARN: resolve_btfids: unresolved symbol bpf_task_release
   WARN: resolve_btfids: unresolved symbol bpf_task_from_pid
   WARN: resolve_btfids: unresolved symbol bpf_task_acquire
   WARN: resolve_btfids: unresolved symbol bpf_refcount_acquire_impl
   WARN: resolve_btfids: unresolved symbol bpf_rdonly_cast
   WARN: resolve_btfids: unresolved symbol bpf_rcu_read_unlock
   WARN: resolve_btfids: unresolved symbol bpf_rcu_read_lock
   WARN: resolve_btfids: unresolved symbol bpf_rbtree_remove
   WARN: resolve_btfids: unresolved symbol bpf_rbtree_first
   WARN: resolve_btfids: unresolved symbol bpf_rbtree_add_impl
   WARN: resolve_btfids: unresolved symbol bpf_obj_new_impl
   WARN: resolve_btfids: unresolved symbol bpf_obj_drop_impl
   WARN: resolve_btfids: unresolved symbol bpf_list_push_front_impl
   WARN: resolve_btfids: unresolved symbol bpf_list_push_back_impl
   WARN: resolve_btfids: unresolved symbol bpf_list_pop_front
   WARN: resolve_btfids: unresolved symbol bpf_list_pop_back
   WARN: resolve_btfids: unresolved symbol bpf_iter_num_next
   WARN: resolve_btfids: unresolved symbol bpf_iter_num_new
   WARN: resolve_btfids: unresolved symbol bpf_iter_num_destroy
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_slice_rdwr
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_slice
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_size
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_is_rdonly
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_is_null
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_from_xdp
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_from_skb
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_clone
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_adjust
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_xor
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_test_cpu
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_test_and_set_cpu
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_test_and_clear_cpu
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_subset
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_setall
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_set_cpu
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_release
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_or
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_intersects
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_full
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_first_zero
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_first_and
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_first
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_equal
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_empty
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_create
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_copy
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_clear_cpu
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_clear
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_any_and
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_any
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_and
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_acquire
   WARN: resolve_btfids: unresolved symbol bpf_cast_to_kern_ctx

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
