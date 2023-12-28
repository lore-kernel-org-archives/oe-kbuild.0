Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB96C1096A
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Dec 2023 23:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDRqHViA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703805896; x=1735341896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JnVpYtxvj4hvVvBPjiZusvSQfeIBseynvlJfy3OQ4Cs=;
  b=iDRqHViAUvg+gEAnQZ9gpeABvH5s7jydVsHtAXuHigIF7gvmqXOgfuwI
   uEtAb3laQYABpqrIzFk639Ty92yrhQzocOMo3RE3BkjEBy/qUCkT2MsWH
   8TcEo60fkW5duXqakyLve94ARmUoYkTcuXC4pxjIZjzhCRzM0wb5X9bDG
   zBGYOhLnP54abuMnTCazJTENFZx4iCe5J0LJZnwYwanqfgj3qWGdfYx63
   +Be0/7gytzqIuExnf8MDg1GQeAxrKG1qBxzZYBspFOM9gmpGUDFUzdMT+
   GWAB3VCvqKZfwPG7LTVozaEHigJWDdRTBzBahrDXtbyYNOy4eQnygNoj9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="3678016"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="3678016"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 15:23:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="897339751"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="897339751"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2023 15:23:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIzii-000Gub-1B;
	Thu, 28 Dec 2023 23:23:21 +0000
Date: Fri, 29 Dec 2023 07:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8075/10295] WARN: resolve_btfids: unresolved
 symbol bpf_kfunc_call_test_release_dtor
Message-ID: <202312290717.uis6bLYx-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: e4c00339891c074c76f626ac82981963cbba5332 [8075/10295] bpf: Fix dtor CFI
:::::: branch date: 7 days ago
:::::: commit date: 13 days ago
config: mips-randconfig-r001-20230703 (https://download.01.org/0day-ci/archive/20231229/202312290717.uis6bLYx-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312290717.uis6bLYx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312290717.uis6bLYx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARN: resolve_btfids: unresolved symbol unix_sock
   WARN: resolve_btfids: unresolved symbol bpf_cpumask
   WARN: resolve_btfids: unresolved symbol bpf_xdp_xfrm_state_release
   WARN: resolve_btfids: unresolved symbol bpf_xdp_metadata_rx_vlan_tag
   WARN: resolve_btfids: unresolved symbol bpf_xdp_metadata_rx_timestamp
   WARN: resolve_btfids: unresolved symbol bpf_xdp_metadata_rx_hash
   WARN: resolve_btfids: unresolved symbol bpf_xdp_get_xfrm_state
   WARN: resolve_btfids: unresolved symbol bpf_xdp_ct_lookup
   WARN: resolve_btfids: unresolved symbol bpf_xdp_ct_alloc
   WARN: resolve_btfids: unresolved symbol bpf_throw
   WARN: resolve_btfids: unresolved symbol bpf_task_under_cgroup
   WARN: resolve_btfids: unresolved symbol bpf_task_release_dtor
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
>> WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_release_dtor
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_release
>> WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_memb_release_dtor
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
   WARN: resolve_btfids: unresolved symbol bpf_cgroup_release_dtor
   WARN: resolve_btfids: unresolved symbol bpf_cgroup_release
   WARN: resolve_btfids: unresolved symbol bpf_cgroup_from_id
   WARN: resolve_btfids: unresolved symbol bpf_cgroup_ancestor
   WARN: resolve_btfids: unresolved symbol bpf_cgroup_acquire
   WARN: resolve_btfids: unresolved symbol bpf_cast_to_kern_ctx

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
