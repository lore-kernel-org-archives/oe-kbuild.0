Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706A23595B
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Oct 2025 20:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760215536; cv=none; b=kSZNvpzIn9qTbpQs+NOp71qMs3voiLotSSRoQ4gKk4ecaRYK/PZR7dqv3vNJY2UDOZxIciWMyqgWKx0Q/FZLExJbKbZloXKoRUBaewCQU+RejmbyWXXQ1VM1pCa4eU0gvg2ePs5WuTM602mfRTjXFY+PBVBdzKswWPj6NN/HtJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760215536; c=relaxed/simple;
	bh=r0/GAmF81bSjI81YJB+/XVr/weNJDvwaniud0SKtPrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=il6+gFHrjSxw7IHoaXBPeNDaAzQEvNNm4mEaBGe2o/nPm0gVP2F3wok5LTl7SAE2mSUMy2Cdyn5KB8D7ZknaAi2XGHytDwt++TvwMPCDbwUFpGC6yVZea/eZ04pC63/ieTnbsqXCzAIGtE72QvUu5LT6QaaX/bIjPGY1ukBdPHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTqzinZ2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTqzinZ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760215534; x=1791751534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r0/GAmF81bSjI81YJB+/XVr/weNJDvwaniud0SKtPrU=;
  b=kTqzinZ2JicXbHR4mI/f8AjCpVpfV7fj97ueW/TwWydGsxWZUHRbORNO
   oZ96Q5O/gXd8FnPGuTHh2gu2/Gk6ddn80chSYxbLjokZGWkhDaIGUDwEd
   YawyBNMn7eTk+acugQCc4ZJ12gcMZJ9zcBKzr99aBAdCNb40CkNgeRi4r
   bVpN//smCw3drS1f9je8hIAhXdaSI3LuPP5T14RfTyPq2mOccdzvDSGs0
   jePsDtKhyyYlII1Jf9YProp9wivXkRDXRF/D8U0r4BgVFzkdKZ2Y8vE9s
   qwwE+UoWnMMQFeMtkikEe1eDbi+pjBKPsooIbHcPgUxj6TG8L0NoI67bN
   w==;
X-CSE-ConnectionGUID: vZaCnHehTqGxZmyL6EYWKw==
X-CSE-MsgGUID: ZL+QPz4rQHi8LO342dgT4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="73011063"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="73011063"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 13:45:34 -0700
X-CSE-ConnectionGUID: rX2u7aVPQFW1FDOn8elhbw==
X-CSE-MsgGUID: a3sDIuVITU6StjFalRBtxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="181668644"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Oct 2025 13:45:32 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7gT4-0003z7-1j;
	Sat, 11 Oct 2025 20:45:30 +0000
Date: Sun, 12 Oct 2025 04:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rgushchin:bpfoom.2.2 6/19] mm/bpf_oom.c:105 bpf_oom_ops_reg() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202510120452.Pr9ApW9T-lkp@intel.com>
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

tree:   https://github.com/rgushchin/linux.git bpfoom.2.2
head:   5a340f010fe5e9a9807ff0f23ff40b57b184948a
commit: 2be3bd65f4b13d8ba378182e5e15a7195890d573 [6/19] mm: introduce bpf struct ops for OOM handling
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-161-20251012 (https://download.01.org/0day-ci/archive/20251012/202510120452.Pr9ApW9T-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510120452.Pr9ApW9T-lkp@intel.com/

smatch warnings:
mm/bpf_oom.c:105 bpf_oom_ops_reg() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +105 mm/bpf_oom.c

2be3bd65f4b13d8 Roman Gushchin 2025-08-11   92  
2be3bd65f4b13d8 Roman Gushchin 2025-08-11   93  static int bpf_oom_ops_reg(void *kdata, struct bpf_link *link)
2be3bd65f4b13d8 Roman Gushchin 2025-08-11   94  {
2be3bd65f4b13d8 Roman Gushchin 2025-08-11   95  	struct bpf_struct_ops_link *ops_link = container_of(link, struct bpf_struct_ops_link, link);
2be3bd65f4b13d8 Roman Gushchin 2025-08-11   96  	struct bpf_oom_ops **bpf_oom_ops_ptr = NULL;
2be3bd65f4b13d8 Roman Gushchin 2025-08-11   97  	struct bpf_oom_ops *bpf_oom_ops = kdata;
2be3bd65f4b13d8 Roman Gushchin 2025-08-11   98  	struct mem_cgroup *memcg = NULL;
2be3bd65f4b13d8 Roman Gushchin 2025-08-11   99  	int err = 0;
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  100  
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  101  	if (ops_link->cgroup_id) {
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  102  		/* Attach to a memory cgroup? */
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  103  		memcg = mem_cgroup_get_from_ino(ops_link->cgroup_id);
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  104  		if (IS_ERR_OR_NULL(memcg))
2be3bd65f4b13d8 Roman Gushchin 2025-08-11 @105  			return PTR_ERR(memcg);
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  106  		bpf_oom_ops_ptr = &memcg->bpf_oom;
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  107  	} else {
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  108  		/* System-wide OOM handler */
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  109  		bpf_oom_ops_ptr = &system_bpf_oom;
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  110  	}
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  111  
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  112  	/* Another struct ops attached? */
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  113  	if (READ_ONCE(*bpf_oom_ops_ptr)) {
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  114  		err = -EBUSY;
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  115  		goto exit;
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  116  	}
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  117  
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  118  	/* Expose bpf_oom_ops structure */
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  119  	WRITE_ONCE(*bpf_oom_ops_ptr, bpf_oom_ops);
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  120  exit:
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  121  	mem_cgroup_put(memcg);
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  122  	return err;
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  123  }
2be3bd65f4b13d8 Roman Gushchin 2025-08-11  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
