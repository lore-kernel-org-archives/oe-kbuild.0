Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B48207A20
	for <oe-kbuild@lists.linux.dev>; Wed, 28 May 2025 23:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748473625; cv=none; b=iK67eXzp0L6qAH6GO9Dp9iQ0dcyf31bi6bPbdLYeL+LeiDxjvLdGEM3EtU30q9MSiR15PI1nVhpSF/VGuXkTscGpzTb/e3L6fVmCgu8ItJUsfuwZFbvh9wM6q/cscah1HhTju3gSQyymg4gtESyqvZZxHeyZo9FsVKV2NbqlF+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748473625; c=relaxed/simple;
	bh=t+b2L6bNQYOS18sVdExW1Myg+r86qTvjt/Wode/GS/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pPB2KX1DMtBcI+rcwnIvR8AfMInkzUJ8BJEjYrgc6X/pIEyuh3M9/A2665lUz8bCsxd4IsD767k5d2IqRXcZpmvO+NxKEYdHqE0ZVxa7h8f5banlckNc8LhcUZ6D9c/RfMbLY69Job0gjcStlQQZwV1acSDGswionnH6P0y8Rd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHi/B4sA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHi/B4sA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748473623; x=1780009623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t+b2L6bNQYOS18sVdExW1Myg+r86qTvjt/Wode/GS/0=;
  b=KHi/B4sAgyc+JsZ9wwgvNQX/Hx0H6XL1gERzqgR4q3e+2fygAQGAf2Tw
   ednmlcOQIsWcbycVYuDq3vATdnj+Hcy6lsB2jibHC5XO9jGwXY4G8+9mJ
   2VY2+O1M4MBvOdcnClX3hRMgZ/auAmm/Mgc2Van3lBhEQzJm6PtEGAe2y
   I6/oq9kJ8UQ5x3shUs3pv7QocZoEEh8n/y17DuEE1Ixm+6Y0uujIOtr10
   zTbozC741SShW+hQPCQMTaKQ2gLdQZdLH9bl7o5/wlWzN99dQgjtvicCC
   Py2sfRUn8uBAkwqzAiuuMKPCnuCVuv3yMAUZXpSGTZPiDQBt+var84w6z
   A==;
X-CSE-ConnectionGUID: ISqGTr3hSFqHk5nltDp9kQ==
X-CSE-MsgGUID: 3srTq2ndQiGsHSwC3Iie6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="53145288"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="53145288"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 16:07:02 -0700
X-CSE-ConnectionGUID: JQdcLr+8SKmS45zFswE9dw==
X-CSE-MsgGUID: iKgcBei8QdapqfpeyrnwoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="143284853"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 May 2025 16:07:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKPrO-000W8a-0t;
	Wed, 28 May 2025 23:06:58 +0000
Date: Thu, 29 May 2025 07:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rgushchin:bpfoom.1.2 10/17] kernel/sched/bpf_psi.c:130
 bpf_psi_ops_reg() warn: passing zero to 'PTR_ERR'
Message-ID: <202505290712.WBOvBoOQ-lkp@intel.com>
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

tree:   https://github.com/rgushchin/linux.git bpfoom.1.2
head:   e3a569772f1fbe667574cb12da7cf500a0c91475
commit: 343586cf71930a20ccde8c802a02ecdcc5c78a5b [10/17] sched: psi: bpf hook to handle psi events
:::::: branch date: 25 hours ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-161-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290712.WBOvBoOQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505290712.WBOvBoOQ-lkp@intel.com/

smatch warnings:
kernel/sched/bpf_psi.c:130 bpf_psi_ops_reg() warn: passing zero to 'PTR_ERR'
kernel/sched/bpf_psi.c:155 bpf_psi_ops_reg() error: uninitialized symbol 'ret'.

vim +/PTR_ERR +130 kernel/sched/bpf_psi.c

343586cf71930a Roman Gushchin 2025-04-23  117  
343586cf71930a Roman Gushchin 2025-04-23  118  static int bpf_psi_ops_reg(void *kdata, struct bpf_link *link)
343586cf71930a Roman Gushchin 2025-04-23  119  {
343586cf71930a Roman Gushchin 2025-04-23  120  	struct bpf_psi_ops *ops = kdata;
343586cf71930a Roman Gushchin 2025-04-23  121  	struct cgroup *cgroup = NULL;
343586cf71930a Roman Gushchin 2025-04-23  122  	struct psi_group *group;
343586cf71930a Roman Gushchin 2025-04-23  123  	struct bpf_psi *bpf_psi;
343586cf71930a Roman Gushchin 2025-04-23  124  	struct psi_trigger *t;
343586cf71930a Roman Gushchin 2025-04-23  125  	int ret;
343586cf71930a Roman Gushchin 2025-04-23  126  
343586cf71930a Roman Gushchin 2025-04-23  127  	if (ops->cgroup_id) {
343586cf71930a Roman Gushchin 2025-04-23  128  		cgroup = cgroup_get_from_id(ops->cgroup_id);
343586cf71930a Roman Gushchin 2025-04-23  129  		if (IS_ERR_OR_NULL(cgroup))
343586cf71930a Roman Gushchin 2025-04-23 @130  			return PTR_ERR(cgroup);
343586cf71930a Roman Gushchin 2025-04-23  131  
343586cf71930a Roman Gushchin 2025-04-23  132  		group = cgroup_psi(cgroup);
343586cf71930a Roman Gushchin 2025-04-23  133  	} else {
343586cf71930a Roman Gushchin 2025-04-23  134  		group = &psi_system;
343586cf71930a Roman Gushchin 2025-04-23  135  	}
343586cf71930a Roman Gushchin 2025-04-23  136  
343586cf71930a Roman Gushchin 2025-04-23  137  	bpf_psi = bpf_psi_create(ops, ops->cgroup_id);
343586cf71930a Roman Gushchin 2025-04-23  138  	if (!bpf_psi) {
343586cf71930a Roman Gushchin 2025-04-23  139  		ret = -ENOMEM;
343586cf71930a Roman Gushchin 2025-04-23  140  		goto exit;
343586cf71930a Roman Gushchin 2025-04-23  141  	}
343586cf71930a Roman Gushchin 2025-04-23  142  
343586cf71930a Roman Gushchin 2025-04-23  143  	t = psi_trigger_create(group, "some 100000 1000000",
343586cf71930a Roman Gushchin 2025-04-23  144  			       PSI_MEM, true, NULL, bpf_psi);
343586cf71930a Roman Gushchin 2025-04-23  145  	if (IS_ERR_OR_NULL(t)) {
343586cf71930a Roman Gushchin 2025-04-23  146  		bpf_psi_free(bpf_psi);
343586cf71930a Roman Gushchin 2025-04-23  147  		ret = PTR_ERR(t);
343586cf71930a Roman Gushchin 2025-04-23  148  		goto exit;
343586cf71930a Roman Gushchin 2025-04-23  149  	}
343586cf71930a Roman Gushchin 2025-04-23  150  
343586cf71930a Roman Gushchin 2025-04-23  151  	ops->bpf_psi = bpf_psi;
343586cf71930a Roman Gushchin 2025-04-23  152  exit:
343586cf71930a Roman Gushchin 2025-04-23  153  	if (cgroup)
343586cf71930a Roman Gushchin 2025-04-23  154  		cgroup_put(cgroup);
343586cf71930a Roman Gushchin 2025-04-23 @155  	return ret;
343586cf71930a Roman Gushchin 2025-04-23  156  }
343586cf71930a Roman Gushchin 2025-04-23  157  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
