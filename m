Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33DE16426
	for <oe-kbuild@lists.linux.dev>; Mon, 22 May 2023 17:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684777134; x=1716313134;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5dfqcyQNmUroc64hYtUuxsTgeLzqrZl2GA0POjK6i30=;
  b=fqFtVhFx3RWVkXoETRY5HbHwOV1Zqi6nMkHvJy57CVwaWSXdDe6n/58S
   5H/BZi52n0ZUw9bUuqxiBBNXbwMdS/nht5nuI9n9Gq9rQyGI7u1Eqdv95
   1yftzHQUFEbnoFYZMlDU0i9g9MsBPquo3hYEoQMUU8Bn0Q74/kfFHxhrA
   C/WY1DSyXdAZDNLNvqPfJJOF9F4kOHI91VnmqcUQsPgeaTKNjWk/xCYOx
   DVhvEogEBOt9KVbZO8NS87sRd5Cr3v4e4Wq2hRvbxdb+8meIyF07YC3UG
   1h6ybEjEKnzcid6KFhxlq4TYS6xvRF2A1pthRTcFmo9d1DpUqpblrRaYy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="332604267"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="332604267"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 10:38:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="877836397"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="877836397"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 May 2023 10:38:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q19Uh-000D24-0S;
	Mon, 22 May 2023 17:38:51 +0000
Date: Tue, 23 May 2023 01:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 540/3918]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:541 amdgpu_debugfs_mqd_read() warn:
 ignoring unreachable code.
Message-ID: <202305230149.9cPLihRI-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian König" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9f258af06b6268be8e960f63c3f66e88bdbbbdb0
commit: 445d85e3c1dfd8c45b24be6f1527f1e117256d0e [540/3918] drm/amdgpu: add debugfs interface for reading MQDs
:::::: branch date: 14 hours ago
:::::: commit date: 4 weeks ago
config: s390-randconfig-m031-20230522 (https://download.01.org/0day-ci/archive/20230523/202305230149.9cPLihRI-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305230149.9cPLihRI-lkp@intel.com/

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
