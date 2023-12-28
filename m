Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61D6188
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Dec 2023 00:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQREpiSq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703722920; x=1735258920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cEkr4eVs/vUsuHXI/ccEikgGyb/0sU+pjSWlK4e7/LM=;
  b=GQREpiSqOslk2xK4qKxEJUmK6LKS1LFfBXuMPPqO6966NFsbTtsFFyuq
   PrLbChsUpyl2yaW6zToWyAQrJnXtiH+3XOvhY8ByavhNmhxxkE58GdqOn
   Q1zM81iRANuZPEvJ/reOplu4W0QP2gSo5FPuLI7jgQL0tlme2hAg1JWFG
   SysjP4fRw8iGymfyLkmkRw1VmCdNU2Is5q66IQmm+LNPM528RzCLjrsNC
   EGXKvBEKy537rjedWHimr+Dqky7fzD5RGxVmUs6ol8pwsz3x8JUUdgQLD
   A7QdXxEN/HRS1eMlQL4+o3dOUrsvqrmiG+YhxNwnVonvN2i1X4UrNcjrk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="393647113"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="393647113"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 16:21:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="26702270"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 Dec 2023 16:21:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIe9n-000FrJ-0E;
	Thu, 28 Dec 2023 00:21:51 +0000
Date: Thu, 28 Dec 2023 08:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3586/10295] WARN: resolve_btfids: unresolved
 symbol bpf_get_fsverity_digest
Message-ID: <202312280834.YdP3rO8O-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Song Liu <song@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 67814c00de3161181cddd06c77aeaf86ac4cc584 [3586/10295] bpf, fsverity: Add kfunc bpf_get_fsverity_digest
:::::: branch date: 6 days ago
:::::: commit date: 4 weeks ago
config: mips-randconfig-r001-20230703 (https://download.01.org/0day-ci/archive/20231228/202312280834.YdP3rO8O-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312280834.YdP3rO8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312280834.YdP3rO8O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARN: resolve_btfids: unresolved symbol unix_sock
   WARN: resolve_btfids: unresolved symbol bpf_cpumask
   WARN: resolve_btfids: unresolved symbol bpf_xdp_metadata_rx_timestamp
   WARN: resolve_btfids: unresolved symbol bpf_xdp_metadata_rx_hash
   WARN: resolve_btfids: unresolved symbol bpf_xdp_ct_lookup
   WARN: resolve_btfids: unresolved symbol bpf_xdp_ct_alloc
   WARN: resolve_btfids: unresolved symbol bpf_throw
   WARN: resolve_btfids: unresolved symbol bpf_task_under_cgroup
   WARN: resolve_btfids: unresolved symbol bpf_task_release
   WARN: resolve_btfids: unresolved symbol bpf_task_get_cgroup1
   WARN: resolve_btfids: unresolved symbol bpf_task_from_pid
   WARN: resolve_btfids: unresolved symbol bpf_task_acquire
   WARN: resolve_btfids: unresolved symbol bpf_sock_destroy
   WARN: resolve_btfids: unresolved symbol bpf_sock_addr_set_sun_path
   WARN: resolve_btfids: unresolved symbol bpf_skb_set_fou_encap
   WARN: resolve_btfids: unresolved symbol bpf_skb_get_fou_encap
   WARN: resolve_btfids: unresolved symbol bpf_skb_ct_lookup
   WARN: resolve_btfids: unresolved symbol bpf_skb_ct_alloc
   WARN: resolve_btfids: unresolved symbol bpf_refcount_acquire_impl
   WARN: resolve_btfids: unresolved symbol bpf_rdonly_cast
   WARN: resolve_btfids: unresolved symbol bpf_rcu_read_unlock
   WARN: resolve_btfids: unresolved symbol bpf_rcu_read_lock
   WARN: resolve_btfids: unresolved symbol bpf_rbtree_remove
   WARN: resolve_btfids: unresolved symbol bpf_rbtree_first
   WARN: resolve_btfids: unresolved symbol bpf_rbtree_add_impl
   WARN: resolve_btfids: unresolved symbol bpf_percpu_obj_new_impl
   WARN: resolve_btfids: unresolved symbol bpf_percpu_obj_drop_impl
   WARN: resolve_btfids: unresolved symbol bpf_obj_new_impl
   WARN: resolve_btfids: unresolved symbol bpf_obj_drop_impl
   WARN: resolve_btfids: unresolved symbol bpf_modify_return_test2
   WARN: resolve_btfids: unresolved symbol bpf_modify_return_test
   WARN: resolve_btfids: unresolved symbol bpf_map_sum_elem_count
   WARN: resolve_btfids: unresolved symbol bpf_list_push_front_impl
   WARN: resolve_btfids: unresolved symbol bpf_list_push_back_impl
   WARN: resolve_btfids: unresolved symbol bpf_list_pop_front
   WARN: resolve_btfids: unresolved symbol bpf_list_pop_back
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_release
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_memb_release
   WARN: resolve_btfids: unresolved symbol bpf_iter_task_vma_next
   WARN: resolve_btfids: unresolved symbol bpf_iter_task_vma_new
   WARN: resolve_btfids: unresolved symbol bpf_iter_task_vma_destroy
   WARN: resolve_btfids: unresolved symbol bpf_iter_task_next
   WARN: resolve_btfids: unresolved symbol bpf_iter_task_new
   WARN: resolve_btfids: unresolved symbol bpf_iter_task_destroy
   WARN: resolve_btfids: unresolved symbol bpf_iter_num_next
   WARN: resolve_btfids: unresolved symbol bpf_iter_num_new
   WARN: resolve_btfids: unresolved symbol bpf_iter_num_destroy
   WARN: resolve_btfids: unresolved symbol bpf_iter_css_task_next
   WARN: resolve_btfids: unresolved symbol bpf_iter_css_task_new
   WARN: resolve_btfids: unresolved symbol bpf_iter_css_task_destroy
   WARN: resolve_btfids: unresolved symbol bpf_iter_css_next
   WARN: resolve_btfids: unresolved symbol bpf_iter_css_new
   WARN: resolve_btfids: unresolved symbol bpf_iter_css_destroy
>> WARN: resolve_btfids: unresolved symbol bpf_get_fsverity_digest
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_slice_rdwr
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_slice
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_size
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_is_rdonly
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_is_null
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_from_xdp
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_clone
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_adjust
   WARN: resolve_btfids: unresolved symbol bpf_ct_set_timeout
   WARN: resolve_btfids: unresolved symbol bpf_ct_set_status
   WARN: resolve_btfids: unresolved symbol bpf_ct_set_nat_info
   WARN: resolve_btfids: unresolved symbol bpf_ct_release
   WARN: resolve_btfids: unresolved symbol bpf_ct_insert_entry
   WARN: resolve_btfids: unresolved symbol bpf_ct_change_timeout
   WARN: resolve_btfids: unresolved symbol bpf_ct_change_status
   WARN: resolve_btfids: unresolved symbol bpf_cgroup_release
   WARN: resolve_btfids: unresolved symbol bpf_cgroup_from_id
   WARN: resolve_btfids: unresolved symbol bpf_cgroup_ancestor
   WARN: resolve_btfids: unresolved symbol bpf_cgroup_acquire
   WARN: resolve_btfids: unresolved symbol bpf_cast_to_kern_ctx

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
