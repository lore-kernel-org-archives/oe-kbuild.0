Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310F61FB8
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Dec 2023 04:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hogjpagz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703825800; x=1735361800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7tzlJrPKAWsSZ5jcPfBFxpCR2JOYfaGsdzFFfJtZHCY=;
  b=hogjpagzuHOTjjLIH+YNr943NqlmM1Y66pd9pisElLxd6KJhj8EBic3j
   lxUlDb+l8NUBkG6RjpQUatOVCSveUlWSSETqbRbF97+nq5i3LGcgZv6Yi
   5eUkHPrVhkMTQ77qKUyHAAR8ihsao1TqQrWkXGqoTHWJ4blBDJd6HQnhm
   K6bbpWwT4bjAEjddVwbJGrA4TK/i7d8hAl5ENtcyDCwxptgZ3HPp1I92X
   wzs+uOLGkQYzKrj4Op4vy7ydd+sSIVTZ7AajLTkBV7O2uUR8PKdK03J6E
   dxSogLzZFb5+Lup+RHStOdXfBpnCKmFv9UX55D3rlWtVcBHDfST8AJRiO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="482803249"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; 
   d="scan'208";a="482803249"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 20:56:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="844607747"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; 
   d="scan'208";a="844607747"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Dec 2023 20:56:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJ4vD-000H5t-34;
	Fri, 29 Dec 2023 04:56:35 +0000
Date: Fri, 29 Dec 2023 12:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARN: resolve_btfids: unresolved symbol bpf_cpumask_any_distribute
Message-ID: <202312291258.1vVTjxwQ-lkp@intel.com>
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
head:   8735c7c84d1bc5c3e481c02b6b6163bdefe4132f
commit: f983be917332ea5e03f689e12c6668be48cb4cfe bpf: Replace bpf_cpumask_any* with bpf_cpumask_any_distribute*
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: mips-buildonly-randconfig-r003-20220823 (https://download.01.org/0day-ci/archive/20231229/202312291258.1vVTjxwQ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312291258.1vVTjxwQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312291258.1vVTjxwQ-lkp@intel.com/

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
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_first_and
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_first
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_equal
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_empty
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_create
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_copy
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_clear_cpu
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_clear
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_any_distribute
>> WARN: resolve_btfids: unresolved symbol bpf_cpumask_any_and_distribute
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_and
   WARN: resolve_btfids: unresolved symbol bpf_cpumask_acquire
   WARN: resolve_btfids: unresolved symbol bpf_cast_to_kern_ctx

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
