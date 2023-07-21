Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC6CDDC2
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Jul 2023 23:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689981334; x=1721517334;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aBDH6PuVZoUajeI46GDDgI1oPdZsSdIQkmREpTVu1Lw=;
  b=lwSx8gGmC4K3SpWAFQHQFrp6jhNYeEasdFI/UJlNW5l/ZUD9K1q8XeUE
   ygRK8oVaYBTTAm2XSFodJzbAkp1hSevHaDOoFnSzAfux818aktdrfxyZe
   FJnYBD1NVbdjlhuv+pir+3OEvlQs1M9mL7IxQ3+V2rDkc9boRrNe63Anm
   5a9qrHca0Oi5u674nwWZ+M0rIJvOHuq8pM7rENkJVxIVhqwSQdc/DHH62
   a3lXu1XEdmtkmocsJwkQ4Vrcor+fYDTqci1+g3cEUDud5sovUBRg3JgcQ
   0OwzBteZEEEtA7iYhi0wbUHh9pnKkzoaDqBPdcAfy4/DLgc+kvZpNg/pR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346737633"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="346737633"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 16:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="754654507"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="754654507"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Jul 2023 16:15:29 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMzLM-0007kN-1e;
	Fri, 21 Jul 2023 23:15:28 +0000
Date: Sat, 22 Jul 2023 07:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:541
 amdgpu_debugfs_mqd_read() warn: ignoring unreachable code.
Message-ID: <202307220756.LixozHQP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian König" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d192f5382581d972c4ae1b4d72e0b59b34cadeb9
commit: 445d85e3c1dfd8c45b24be6f1527f1e117256d0e drm/amdgpu: add debugfs interface for reading MQDs
date:   3 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
config: s390-randconfig-m031-20230720 (https://download.01.org/0day-ci/archive/20230722/202307220756.LixozHQP-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220756.LixozHQP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307220756.LixozHQP-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:541 amdgpu_debugfs_mqd_read() warn: ignoring unreachable code.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:480 amdgpu_debugfs_ring_read() warn: ignoring unreachable code.
drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:495 amdgpu_debugfs_ring_read() warn: ignoring unreachable code.

vim +541 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c

d38ceaf99ed015 Alex Deucher 2015-04-20  511  
445d85e3c1dfd8 Alex Deucher 2023-03-21  512  static ssize_t amdgpu_debugfs_mqd_read(struct file *f, char __user *buf,
445d85e3c1dfd8 Alex Deucher 2023-03-21  513  				       size_t size, loff_t *pos)
445d85e3c1dfd8 Alex Deucher 2023-03-21  514  {
445d85e3c1dfd8 Alex Deucher 2023-03-21  515  	struct amdgpu_ring *ring = file_inode(f)->i_private;
445d85e3c1dfd8 Alex Deucher 2023-03-21  516  	volatile u32 *mqd;
445d85e3c1dfd8 Alex Deucher 2023-03-21  517  	int r;
445d85e3c1dfd8 Alex Deucher 2023-03-21  518  	uint32_t value, result;
445d85e3c1dfd8 Alex Deucher 2023-03-21  519  
445d85e3c1dfd8 Alex Deucher 2023-03-21  520  	if (*pos & 3 || size & 3)
445d85e3c1dfd8 Alex Deucher 2023-03-21  521  		return -EINVAL;
445d85e3c1dfd8 Alex Deucher 2023-03-21  522  
445d85e3c1dfd8 Alex Deucher 2023-03-21  523  	result = 0;
445d85e3c1dfd8 Alex Deucher 2023-03-21  524  
445d85e3c1dfd8 Alex Deucher 2023-03-21  525  	r = amdgpu_bo_reserve(ring->mqd_obj, false);
445d85e3c1dfd8 Alex Deucher 2023-03-21  526  	if (unlikely(r != 0))
445d85e3c1dfd8 Alex Deucher 2023-03-21  527  		return r;
445d85e3c1dfd8 Alex Deucher 2023-03-21  528  
445d85e3c1dfd8 Alex Deucher 2023-03-21  529  	r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&mqd);
445d85e3c1dfd8 Alex Deucher 2023-03-21  530  	if (r) {
445d85e3c1dfd8 Alex Deucher 2023-03-21  531  		amdgpu_bo_unreserve(ring->mqd_obj);
445d85e3c1dfd8 Alex Deucher 2023-03-21  532  		return r;
445d85e3c1dfd8 Alex Deucher 2023-03-21  533  	}
445d85e3c1dfd8 Alex Deucher 2023-03-21  534  
445d85e3c1dfd8 Alex Deucher 2023-03-21  535  	while (size) {
445d85e3c1dfd8 Alex Deucher 2023-03-21  536  		if (*pos >= ring->mqd_size)
445d85e3c1dfd8 Alex Deucher 2023-03-21  537  			goto done;
445d85e3c1dfd8 Alex Deucher 2023-03-21  538  
445d85e3c1dfd8 Alex Deucher 2023-03-21  539  		value = mqd[*pos/4];
445d85e3c1dfd8 Alex Deucher 2023-03-21  540  		r = put_user(value, (uint32_t *)buf);
445d85e3c1dfd8 Alex Deucher 2023-03-21 @541  		if (r)
445d85e3c1dfd8 Alex Deucher 2023-03-21  542  			goto done;
445d85e3c1dfd8 Alex Deucher 2023-03-21  543  		buf += 4;
445d85e3c1dfd8 Alex Deucher 2023-03-21  544  		result += 4;
445d85e3c1dfd8 Alex Deucher 2023-03-21  545  		size -= 4;
445d85e3c1dfd8 Alex Deucher 2023-03-21  546  		*pos += 4;
445d85e3c1dfd8 Alex Deucher 2023-03-21  547  	}
445d85e3c1dfd8 Alex Deucher 2023-03-21  548  
445d85e3c1dfd8 Alex Deucher 2023-03-21  549  done:
445d85e3c1dfd8 Alex Deucher 2023-03-21  550  	amdgpu_bo_kunmap(ring->mqd_obj);
445d85e3c1dfd8 Alex Deucher 2023-03-21  551  	mqd = NULL;
445d85e3c1dfd8 Alex Deucher 2023-03-21  552  	amdgpu_bo_unreserve(ring->mqd_obj);
445d85e3c1dfd8 Alex Deucher 2023-03-21  553  	if (r)
445d85e3c1dfd8 Alex Deucher 2023-03-21  554  		return r;
445d85e3c1dfd8 Alex Deucher 2023-03-21  555  
445d85e3c1dfd8 Alex Deucher 2023-03-21  556  	return result;
445d85e3c1dfd8 Alex Deucher 2023-03-21  557  }
445d85e3c1dfd8 Alex Deucher 2023-03-21  558  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
