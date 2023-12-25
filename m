Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABB05027A
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Dec 2023 19:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AuJMxPz0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703530848; x=1735066848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qke+acdtqZ80wD18jeO5FODu1KftoTWp0Ynz6eP7jiA=;
  b=AuJMxPz0y5Y4r+l2STn+szg60fowZGNXbf3iKBFB764vmhy7uM5hDq5m
   xfbAPhj9MiH/HVkEmKY7TyBSE6V4FMM+hkV7P9t0kbQCudfPgVx7ywpPO
   8mJFowk4ZO/TBErZW6kKQCpO9Il5sXrMU1Yl1DnUYRnUsVCqsDGOHE6B7
   MMB/naWPXSJ0z54zNmLIjnUvw3nBTbTfhciHocoUqZOJiFkM+H0popJC3
   Mq/DnXGmxAmtXlEQktDcQhtEo3SgqMp0HvJrvO8ZhQfK8nmR2wScNbzUI
   Xylkv5gXrNhaxGp8jvQgCmhiLdh+e/Lur7i1ayHE9RG9EcaEHnVpRW01y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="9826347"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="9826347"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 11:00:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="771001966"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="771001966"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Dec 2023 11:00:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHqBQ-000DcB-1U;
	Mon, 25 Dec 2023 19:00:21 +0000
Date: Tue, 26 Dec 2023 02:54:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARN: resolve_btfids: unresolved symbol bpf_modify_return_test2
Message-ID: <202312260253.Y1k4iZo4-lkp@intel.com>
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
TO: Menglong Dong <imagedong@tencent.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   861deac3b092f37b2c5e6871732f3e11486f7082
commit: 5e9cf77d81f9ba51019157dc55a3b73dc89a7cf4 selftests/bpf: add testcase for TRACING with 6+ arguments
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: mips-randconfig-r001-20230703 (https://download.01.org/0day-ci/archive/20231226/202312260253.Y1k4iZo4-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312260253.Y1k4iZo4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312260253.Y1k4iZo4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARN: resolve_btfids: unresolved symbol unix_sock
   WARN: resolve_btfids: unresolved symbol bpf_cpumask
   WARN: resolve_btfids: unresolved symbol bpf_xdp_metadata_rx_timestamp
   WARN: resolve_btfids: unresolved symbol bpf_xdp_metadata_rx_hash
   WARN: resolve_btfids: unresolved symbol bpf_xdp_ct_lookup
   WARN: resolve_btfids: unresolved symbol bpf_xdp_ct_alloc
   WARN: resolve_btfids: unresolved symbol bpf_task_under_cgroup
   WARN: resolve_btfids: unresolved symbol bpf_task_release
   WARN: resolve_btfids: unresolved symbol bpf_task_from_pid
   WARN: resolve_btfids: unresolved symbol bpf_task_acquire
   WARN: resolve_btfids: unresolved symbol bpf_sock_destroy
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
   WARN: resolve_btfids: unresolved symbol bpf_obj_new_impl
   WARN: resolve_btfids: unresolved symbol bpf_obj_drop_impl
>> WARN: resolve_btfids: unresolved symbol bpf_modify_return_test2
   WARN: resolve_btfids: unresolved symbol bpf_modify_return_test
   WARN: resolve_btfids: unresolved symbol bpf_map_sum_elem_count
   WARN: resolve_btfids: unresolved symbol bpf_list_push_front_impl
   WARN: resolve_btfids: unresolved symbol bpf_list_push_back_impl
   WARN: resolve_btfids: unresolved symbol bpf_list_pop_front
   WARN: resolve_btfids: unresolved symbol bpf_list_pop_back
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_release
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_memb_release
   WARN: resolve_btfids: unresolved symbol bpf_iter_num_next
   WARN: resolve_btfids: unresolved symbol bpf_iter_num_new
   WARN: resolve_btfids: unresolved symbol bpf_iter_num_destroy
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
