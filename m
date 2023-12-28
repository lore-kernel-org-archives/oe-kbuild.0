Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8AD101C2
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Dec 2023 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9vNwJZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703777639; x=1735313639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PGRCFY7M4ASuxpWsI9aIVMkmRKGRvPNd6we21AEDb8Y=;
  b=l9vNwJZR74K4Jh0IUcRKV3ijnn3t5Kj19vSQEK9ySHWUgpEp/cY4jLKv
   cMX3tL1iloKARV3zWsUwI6VQnQX0uqUxn8GE+3J63TvpVGXjLbCzAlmJl
   oW7C0baGwTxN2v92FKvdVgB6rT9uucYMc8OuP0fTwiKKjVqrH0kYNIA5P
   cCYANOTMSK3Fyc/FMocDn3Jc1UfBhL3m+SryRVCjWca8lmaj/RZL0zW1D
   h1SarU3uNoyZry6PnV8wjqKn/sUY2NcaYxyMyChhTmUV7PS5jyuIgpS1o
   hfUfiVibD1O2gcPjUdFNc2FWozHikBrgCmVkSCzEZJX0pO0sFSDGtXsIb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3858118"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="3858118"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 07:33:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="901995268"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="901995268"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Dec 2023 07:33:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIsNw-000GZN-2u;
	Thu, 28 Dec 2023 15:33:25 +0000
Date: Thu, 28 Dec 2023 23:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7460/10295] WARN: resolve_btfids: unresolved
 symbol bpf_xdp_xfrm_state_release
Message-ID: <202312282349.VXfvYBsZ-lkp@intel.com>
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
TO: Daniel Xu <dxu@dxuuu.xyz>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Antony Antony <antony.antony@secunet.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 8f0ec8c681755f523cf842bfe350ea40609b83a9 [7460/10295] bpf: xfrm: Add bpf_xdp_get_xfrm_state() kfunc
:::::: branch date: 6 days ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-r001-20230703 (https://download.01.org/0day-ci/archive/20231228/202312282349.VXfvYBsZ-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312282349.VXfvYBsZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312282349.VXfvYBsZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARN: resolve_btfids: unresolved symbol unix_sock
   WARN: resolve_btfids: unresolved symbol bpf_cpumask
>> WARN: resolve_btfids: unresolved symbol bpf_xdp_xfrm_state_release
   WARN: resolve_btfids: unresolved symbol bpf_xdp_metadata_rx_vlan_tag
   WARN: resolve_btfids: unresolved symbol bpf_xdp_metadata_rx_timestamp
   WARN: resolve_btfids: unresolved symbol bpf_xdp_metadata_rx_hash
>> WARN: resolve_btfids: unresolved symbol bpf_xdp_get_xfrm_state
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
   WARN: resolve_btfids: unresolved symbol bpf_get_fsverity_digest
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
