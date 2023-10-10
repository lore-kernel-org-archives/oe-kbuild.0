Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256E5377
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Oct 2023 00:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1THYwtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696898529; x=1728434529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DSIKuWjLhkD/ddeY+s8MSyVufH2l6PiZ96LlPYMp+6A=;
  b=k1THYwtLZHtz2dy/9TH8dv/Ox2xrnzUlKDpM9ljtiFZxelONh5JUA9RY
   +LrIlKUdBhDCiddmDbEDA/0+aBNFAL3h/MBhGyv+TQzbCa7Bt8+5oOt0F
   x0572hZlVia/cOPXxdpuOzLPfYqD9XUNdqv+Mq+/TjR2OKbYQLSPmBa++
   SeAFtb0KBZHYIzAlyUy9qLzUGoQsjy6iLYqO1diomvTh/C64Ij8T9xEla
   CHysoeYRlIll5Iih37YjNoedHZouIq1BSVwJeMJdsfVUO+adduuQCKZVu
   NFS+RMfTW2tfYsebLThnHrmnmdnpCoorU2PF+eqg6RdxKkKz0Bwzg6eOK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="384139901"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="384139901"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 17:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1000446382"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="1000446382"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 09 Oct 2023 17:42:06 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qq0p2-0000si-11;
	Tue, 10 Oct 2023 00:42:04 +0000
Date: Tue, 10 Oct 2023 08:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rgushchin:kmem_performance.1 6/7] mm/memcontrol.c:3116
 current_obj_cgroup() error: uninitialized symbol 'objcg'.
Message-ID: <202310100852.EAoQHXr8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Roman Gushchin <roman.gushchin@linux.dev>

tree:   https://github.com/rgushchin/linux.git kmem_performance.1
head:   4ce474b7270a507dd448b335168acb30e9fe7d46
commit: b1ae1d054627b816c8cf56c5978e1ea779db2b35 [6/7] mm: kmem: scoped objcg protection
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-161-20231002 (https://download.01.org/0day-ci/archive/20231010/202310100852.EAoQHXr8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231010/202310100852.EAoQHXr8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310100852.EAoQHXr8-lkp@intel.com/

smatch warnings:
mm/memcontrol.c:3116 current_obj_cgroup() error: uninitialized symbol 'objcg'.

vim +/objcg +3116 mm/memcontrol.c

bf4f059954dcb2 Roman Gushchin 2020-08-06  3076  
b1ae1d054627b8 Roman Gushchin 2023-09-22  3077  __always_inline struct obj_cgroup *current_obj_cgroup(void)
b1ae1d054627b8 Roman Gushchin 2023-09-22  3078  {
b1ae1d054627b8 Roman Gushchin 2023-09-22  3079  	struct mem_cgroup *memcg;
b1ae1d054627b8 Roman Gushchin 2023-09-22  3080  	struct obj_cgroup *objcg;
b1ae1d054627b8 Roman Gushchin 2023-09-22  3081  
b1ae1d054627b8 Roman Gushchin 2023-09-22  3082  	if (in_task()) {
b1ae1d054627b8 Roman Gushchin 2023-09-22  3083  		memcg = current->active_memcg;
b1ae1d054627b8 Roman Gushchin 2023-09-22  3084  		if (unlikely(memcg))
b1ae1d054627b8 Roman Gushchin 2023-09-22  3085  			goto from_memcg;
b1ae1d054627b8 Roman Gushchin 2023-09-22  3086  
b1ae1d054627b8 Roman Gushchin 2023-09-22  3087  		objcg = READ_ONCE(current->objcg);
b1ae1d054627b8 Roman Gushchin 2023-09-22  3088  		if (unlikely(current_objcg_needs_update(objcg)))
b1ae1d054627b8 Roman Gushchin 2023-09-22  3089  			objcg = current_objcg_update(objcg);
b1ae1d054627b8 Roman Gushchin 2023-09-22  3090  		/*
b1ae1d054627b8 Roman Gushchin 2023-09-22  3091  		 * Objcg reference is kept by the task, so it's safe
b1ae1d054627b8 Roman Gushchin 2023-09-22  3092  		 * to use the objcg by the current task.
b1ae1d054627b8 Roman Gushchin 2023-09-22  3093  		 */
b1ae1d054627b8 Roman Gushchin 2023-09-22  3094  		return objcg;
b1ae1d054627b8 Roman Gushchin 2023-09-22  3095  	} else {
b1ae1d054627b8 Roman Gushchin 2023-09-22  3096  		memcg = this_cpu_read(int_active_memcg);
b1ae1d054627b8 Roman Gushchin 2023-09-22  3097  		if (unlikely(memcg))
b1ae1d054627b8 Roman Gushchin 2023-09-22  3098  			goto from_memcg;
b1ae1d054627b8 Roman Gushchin 2023-09-22  3099  	}
b1ae1d054627b8 Roman Gushchin 2023-09-22  3100  	return NULL;
b1ae1d054627b8 Roman Gushchin 2023-09-22  3101  
b1ae1d054627b8 Roman Gushchin 2023-09-22  3102  from_memcg:
b1ae1d054627b8 Roman Gushchin 2023-09-22  3103  	for (; !mem_cgroup_is_root(memcg); memcg = parent_mem_cgroup(memcg)) {
b1ae1d054627b8 Roman Gushchin 2023-09-22  3104  		/*
b1ae1d054627b8 Roman Gushchin 2023-09-22  3105  		 * Memcg pointer is protected by scope (see set_active_memcg())
b1ae1d054627b8 Roman Gushchin 2023-09-22  3106  		 * and is pinning the corresponding objcg, so objcg can't go
b1ae1d054627b8 Roman Gushchin 2023-09-22  3107  		 * away and can be used within the scope without any additional
b1ae1d054627b8 Roman Gushchin 2023-09-22  3108  		 * protection.
b1ae1d054627b8 Roman Gushchin 2023-09-22  3109  		 */
b1ae1d054627b8 Roman Gushchin 2023-09-22  3110  		objcg = rcu_dereference_check(memcg->objcg, 1);
b1ae1d054627b8 Roman Gushchin 2023-09-22  3111  		if (likely(objcg))
b1ae1d054627b8 Roman Gushchin 2023-09-22  3112  			break;
b1ae1d054627b8 Roman Gushchin 2023-09-22  3113  		objcg = NULL;
b1ae1d054627b8 Roman Gushchin 2023-09-22  3114  	}
b1ae1d054627b8 Roman Gushchin 2023-09-22  3115  
b1ae1d054627b8 Roman Gushchin 2023-09-22 @3116  	return objcg;
b1ae1d054627b8 Roman Gushchin 2023-09-22  3117  }
b1ae1d054627b8 Roman Gushchin 2023-09-22  3118  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
