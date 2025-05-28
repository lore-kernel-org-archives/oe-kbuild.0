Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857A019B3CB
	for <oe-kbuild@lists.linux.dev>; Wed, 28 May 2025 21:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748469298; cv=none; b=itLwK0MItilnIsb4NZBSgz72PVY6oJylE7l/KeHUjxnU0u2zcqaI3GYxEYNVCRn0DgoC58i9vEI1A3fJA0xqmFD45jS279skaoePdrLZFsZB7+uhdHeAz5pXhoDZAGzIy4QeqhpKs8PjUdaprZwd5Cjaqrw59zSBThgMmSJ6gtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748469298; c=relaxed/simple;
	bh=hQWxK7J63hKX9HgizVwhbNZ0wAEGyFh7XtT0vDHszY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sj1qI5dxM8fwoQatzBCVVN8EY8j7uGws+9JSD/0WEp5gCxPzsddVvyvCxvOwz9UQhzVWzUk5/YJ8fRCRl75aEpc5tYRT4k0WbDYjy6JpygF6bYLj4C71dZGgE+j907CKznkKm1aiFH6waRM8JiJxYrbO9ncc5bE0ASBfFfCfO9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mq8pmuSj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mq8pmuSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748469296; x=1780005296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hQWxK7J63hKX9HgizVwhbNZ0wAEGyFh7XtT0vDHszY4=;
  b=mq8pmuSj5mmr64GEG4sA1Jy3tzKkrDrpVzNbAx1eg1f9YJsBuB4YxDGo
   o5rvEj3sBVFgUqDNwQbXkHntqRwKcq3utw3ynLwBF5EJEpNS9mljU2xUf
   /jT+8T/ZKHrm5+y2e5U6bhsZLoeodbDfdaYxkNoPqiy1kwzM7sbbQN6U8
   Xn5rWSAW56HpsAvP1iQa+OOBrTrxpJnXCp5QTH1FZm6D95clAAMKo+GX8
   MWtt3kgE2iUWHrNsMoVRbfX4POXhm8gFsDQWnJNuVehuJlia2bfHUVbTl
   GBuzfvgra3fH5z1dd0rbhbuN9LzXDu7spRC7wjRQK0QiDF050rkK+02qN
   Q==;
X-CSE-ConnectionGUID: sHWX8vQGToyY2rygdaWbcw==
X-CSE-MsgGUID: NAT6uHc5Rxu9dW77eEopiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61569860"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="61569860"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 14:54:56 -0700
X-CSE-ConnectionGUID: TpOoGAjtRNm+oKXkyRAGLw==
X-CSE-MsgGUID: TtKim0kBTAK607I4qA3zMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="148224606"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 May 2025 14:54:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKOjc-000W60-28;
	Wed, 28 May 2025 21:54:52 +0000
Date: Thu, 29 May 2025 05:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rgushchin:bpfoom.1.2 2/17] mm/bpf_oom.c:35 bpf_handle_oom() error:
 uninitialized symbol 'ret'.
Message-ID: <202505290554.VSvO6NLF-lkp@intel.com>
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
commit: 954f163d5cf03cb8f4ea7c9930265fc327c46a91 [2/17] mm: introduce a bpf hook for OOM handling
:::::: branch date: 23 hours ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-161-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290554.VSvO6NLF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505290554.VSvO6NLF-lkp@intel.com/

smatch warnings:
mm/bpf_oom.c:35 bpf_handle_oom() error: uninitialized symbol 'ret'.

vim +/ret +35 mm/bpf_oom.c

954f163d5cf03c Roman Gushchin 2025-04-23  20  
954f163d5cf03c Roman Gushchin 2025-04-23  21  bool bpf_handle_oom(struct oom_control *oc)
954f163d5cf03c Roman Gushchin 2025-04-23  22  {
954f163d5cf03c Roman Gushchin 2025-04-23  23  	struct bpf_oom *b = &system_bpf_oom;
954f163d5cf03c Roman Gushchin 2025-04-23  24  	struct bpf_oom_ops *ops;
954f163d5cf03c Roman Gushchin 2025-04-23  25  	int ret, idx;
954f163d5cf03c Roman Gushchin 2025-04-23  26  
954f163d5cf03c Roman Gushchin 2025-04-23  27  	oc->bpf_memory_freed = false;
954f163d5cf03c Roman Gushchin 2025-04-23  28  
954f163d5cf03c Roman Gushchin 2025-04-23  29  	idx = srcu_read_lock(&b->srcu);
954f163d5cf03c Roman Gushchin 2025-04-23  30  	ops = READ_ONCE(b->ops);
954f163d5cf03c Roman Gushchin 2025-04-23  31  	if (ops && ops->handle_out_of_memory)
954f163d5cf03c Roman Gushchin 2025-04-23  32  		ret = ops->handle_out_of_memory(oc);
954f163d5cf03c Roman Gushchin 2025-04-23  33  	srcu_read_unlock(&b->srcu, idx);
954f163d5cf03c Roman Gushchin 2025-04-23  34  
954f163d5cf03c Roman Gushchin 2025-04-23 @35  	return !!ret && oc->bpf_memory_freed;
954f163d5cf03c Roman Gushchin 2025-04-23  36  }
954f163d5cf03c Roman Gushchin 2025-04-23  37  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
