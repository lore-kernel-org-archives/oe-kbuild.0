Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EB320E0
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Jan 2024 07:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705735415; cv=none; b=GZ2FbkmVYGBH/557mHU42SavmDe1xuYbLE6nTG/kNn4x1T533nGO/iRakY+w1OOnJ6q5I6OrsNNBx4nSBtE13rx/6gbvTCafymNzi2PqcfEADWUy6IL6uZKqN0gAqFCV7BxLz1rnFijgLxtYoxHp2Xq3y20QVxOPVYrYs2TVtdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705735415; c=relaxed/simple;
	bh=88fbci9zb9WE2LaPo6cHNctvD6QP0BSM80sE8V2acxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J1lEp0W3aeVL5MjPzarjhHANKpRzVxpMzoMxBwic3070+hy4L6cav0XnRJdUhc7uu3xzhPz+4GIpwsRSlrrQBLlkCOnEjcgtG04WtwvKlRblYhJsHJNKGEZ6iEU0G3NehVXfl+ye3faxWszon3CQ9nthqH7xnEdk9qru2VT1jfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJuaVPPX; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJuaVPPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705735413; x=1737271413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=88fbci9zb9WE2LaPo6cHNctvD6QP0BSM80sE8V2acxo=;
  b=GJuaVPPXVsqJPuemh/4MirQYYvobuNiPO5Zarnn0BOMR4Olh/Hv+/2ho
   bbMs32XXuARbmg+m0gfJMoN+p+HDsFI/NkFwnMMVDufgdLcZY5kB8QcD6
   2sfQOyZ9ef2x6ROn++KmGzGQuJxp5kLageCMoruKGH5uWGMCN6W7mC09y
   1ckYFnyfqckHthRfleQ7VIQ8G7th4ZBnuI3k8n7R/fFAJLUVzGtas6fEA
   MRvTSxyiyUFTNCzBDHhATPZFDCwB7LvlmpXX6nDgb3dzLf9FWZxCpf5C8
   kxhZhEeq0fUAmxhSwzZrfVPBSIb2WcaZ4hGHspMzaUDWHdNJ4tvVn+Pjb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="404689031"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="404689031"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 23:23:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="904358436"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="904358436"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2024 23:23:30 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR5hQ-0004qw-0V;
	Sat, 20 Jan 2024 07:23:28 +0000
Date: Sat, 20 Jan 2024 15:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARN: resolve_btfids: unresolved symbol bpf_get_fsverity_digest
Message-ID: <202401201520.2ItbiLqi-lkp@intel.com>
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
TO: Song Liu <song@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

Hi Song,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d64bf433c53cab2f48a3fff7a1f2a696bc5229a
commit: 67814c00de3161181cddd06c77aeaf86ac4cc584 bpf, fsverity: Add kfunc bpf_get_fsverity_digest
date:   7 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 weeks ago
config: powerpc-randconfig-r023-20230119 (https://download.01.org/0day-ci/archive/20240120/202401201520.2ItbiLqi-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201520.2ItbiLqi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401201520.2ItbiLqi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARN: resolve_btfids: unresolved symbol bpf_cpumask
   WARN: resolve_btfids: unresolved symbol bpf_xdp_metadata_rx_timestamp
   WARN: resolve_btfids: unresolved symbol bpf_xdp_metadata_rx_hash
   WARN: resolve_btfids: unresolved symbol bpf_task_release
   WARN: resolve_btfids: unresolved symbol bpf_task_from_pid
   WARN: resolve_btfids: unresolved symbol bpf_task_acquire
   WARN: resolve_btfids: unresolved symbol bpf_sock_destroy
   WARN: resolve_btfids: unresolved symbol bpf_sock_addr_set_sun_path
   WARN: resolve_btfids: unresolved symbol bpf_refcount_acquire_impl
   WARN: resolve_btfids: unresolved symbol bpf_rdonly_cast
   WARN: resolve_btfids: unresolved symbol bpf_rcu_read_unlock
   WARN: resolve_btfids: unresolved symbol bpf_rcu_read_lock
   WARN: resolve_btfids: unresolved symbol bpf_rbtree_remove
   WARN: resolve_btfids: unresolved symbol bpf_rbtree_first
   WARN: resolve_btfids: unresolved symbol bpf_rbtree_add_impl
   WARN: resolve_btfids: unresolved symbol bpf_percpu_obj_new_impl
   WARN: resolve_btfids: unresolved symbol bpf_percpu_obj_drop_impl
   WARN: resolve_btfids: unresolved symbol bpf_obj_drop_impl
   WARN: resolve_btfids: unresolved symbol bpf_map_sum_elem_count
   WARN: resolve_btfids: unresolved symbol bpf_list_push_front_impl
   WARN: resolve_btfids: unresolved symbol bpf_list_push_back_impl
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_test_release
   WARN: resolve_btfids: unresolved symbol bpf_kfunc_call_memb_release
   WARN: resolve_btfids: unresolved symbol bpf_iter_task_vma_next
   WARN: resolve_btfids: unresolved symbol bpf_iter_task_next
   WARN: resolve_btfids: unresolved symbol bpf_iter_task_new
   WARN: resolve_btfids: unresolved symbol bpf_iter_task_destroy
   WARN: resolve_btfids: unresolved symbol bpf_iter_num_next
   WARN: resolve_btfids: unresolved symbol bpf_iter_num_new
   WARN: resolve_btfids: unresolved symbol bpf_iter_num_destroy
>> WARN: resolve_btfids: unresolved symbol bpf_get_fsverity_digest
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_slice_rdwr
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_size
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_is_rdonly
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_is_null
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_from_xdp
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_clone
   WARN: resolve_btfids: unresolved symbol bpf_dynptr_adjust
   WARN: resolve_btfids: unresolved symbol bpf_cast_to_kern_ctx

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
