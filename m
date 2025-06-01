Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D791E2DCBEE
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Jun 2025 17:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748797755; cv=none; b=Xn/Vj1F3sgKDBb7tI5+gysXHkLDbz8j/JLRL3qyzFUt6qFlZb7aljUGehJwQyNOz9LU+HPgu32msd4/MspkXjdzGpDRt2mO2L+ZaMzU4+Jn0vORt3NaljnWVtVTuRSsG1Od+6doH2kjWo0bglqsb2DmGfVa0xv5Czcwavvo2A+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748797755; c=relaxed/simple;
	bh=b/FMPbehhoM8W42ZfD0to6xaICctW5iUJhbZ1JFpl8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y5HW/WX/qjIblQTQFCvjZDsCj6FNEgHHf+ilegwM+kixM9CM/0hHhaXK2de9u78n+d+KpH148lJx6lM2MJ38pTpzL8eurRMmboct9avkHVyVVhXI/FwE5wQ1viN+eMZZFhO+cTm126XAQaLYZkexvafZFFKlzWB8nZKyt9fUTLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bt5rSsft; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bt5rSsft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748797753; x=1780333753;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=b/FMPbehhoM8W42ZfD0to6xaICctW5iUJhbZ1JFpl8k=;
  b=Bt5rSsftNneS8pgjnJtIhRUaoz/CHGLvPpWNQ9Auqte2XKShvgr7w/Ar
   UqtRqOrU+PPcKgKfSxC9GjpA3GgX+cFryEg4rLb+2UL6fhwERxBonNZIG
   aDJyyR6CuA/oVzX9MW1dbaklHP+2QVIJHh3l1OAa+2UMbgk4G3s0tb9W0
   qWAl5aNEVcuVPFgCgTSUZdNT/G8LrhqopFXtXg0q4de88SmRSpmPUfJp2
   Xfds+D8x4KkWD7IJrN0lSMl++wtUwzdyrbfK+wF+PXi/V82W13gRpa5lh
   0LYBozMNENna50Osb3f3kXqPUn4eDJPiV0ybSfYv3cM2K6VtDu/DOcqQ2
   Q==;
X-CSE-ConnectionGUID: sS69Qcf/SbmXlzIOeapHGA==
X-CSE-MsgGUID: pgIIh65MSPGwiL0NYor7Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="49942124"
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="49942124"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 10:09:12 -0700
X-CSE-ConnectionGUID: zxzxLr7YQm6wwM7Wa/PzYQ==
X-CSE-MsgGUID: iNgFqEhYTBKuAj+mSD1xsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="144390913"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Jun 2025 10:09:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLmBI-000Z12-1v;
	Sun, 01 Jun 2025 17:09:08 +0000
Date: Mon, 2 Jun 2025 01:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:535:4-10: preceding lock on
 line 514
Message-ID: <202506020100.63BHmOV3-lkp@intel.com>
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
TO: Tao Zhou <tao.zhou1@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bb1556ec94647060c6b52bf434b9fd824724a6f4
commit: 8652920d2c00243e8a8ca91560a30488d95d9a1b drm/amdgpu: add mutex lock for cper ring
date:   3 months ago
:::::: branch date: 65 minutes ago
:::::: commit date: 3 months ago
config: i386-randconfig-051-20250601 (https://download.01.org/0day-ci/archive/20250602/202506020100.63BHmOV3-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506020100.63BHmOV3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:535:4-10: preceding lock on line 514
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:540:4-10: preceding lock on line 514
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:576:1-7: preceding lock on line 514

vim +535 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c

d38ceaf99ed015 Alex Deucher    2015-04-20  490  
4f4824b55650fa Tom St Denis    2016-04-27  491  /* Layout of file is 12 bytes consisting of
4f4824b55650fa Tom St Denis    2016-04-27  492   * - rptr
4f4824b55650fa Tom St Denis    2016-04-27  493   * - wptr
4f4824b55650fa Tom St Denis    2016-04-27  494   * - driver's copy of wptr
4f4824b55650fa Tom St Denis    2016-04-27  495   *
4f4824b55650fa Tom St Denis    2016-04-27  496   * followed by n-words of ring data
4f4824b55650fa Tom St Denis    2016-04-27  497   */
4f4824b55650fa Tom St Denis    2016-04-27  498  static ssize_t amdgpu_debugfs_ring_read(struct file *f, char __user *buf,
4f4824b55650fa Tom St Denis    2016-04-27  499  					size_t size, loff_t *pos)
d38ceaf99ed015 Alex Deucher    2015-04-20  500  {
450630975da9e7 Al Viro         2016-12-04  501  	struct amdgpu_ring *ring = file_inode(f)->i_private;
4f4824b55650fa Tom St Denis    2016-04-27  502  	uint32_t value, result, early[3];
5a1428242952f2 Tao Zhou        2025-01-22  503  	uint64_t p;
ebbc2ada5c636a Tim Huang       2024-04-25  504  	loff_t i;
ebbc2ada5c636a Tim Huang       2024-04-25  505  	int r;
d38ceaf99ed015 Alex Deucher    2015-04-20  506  
c71dbd93eb0039 Tom St Denis    2016-05-02  507  	if (*pos & 3 || size & 3)
4f4824b55650fa Tom St Denis    2016-04-27  508  		return -EINVAL;
d38ceaf99ed015 Alex Deucher    2015-04-20  509  
4f4824b55650fa Tom St Denis    2016-04-27  510  	result = 0;
c7e6be2303d0b6 Christian König 2016-01-21  511  
4f4824b55650fa Tom St Denis    2016-04-27  512  	if (*pos < 12) {
8652920d2c0024 Tao Zhou        2025-02-10  513  		if (ring->funcs->type == AMDGPU_RING_TYPE_CPER)
8652920d2c0024 Tao Zhou        2025-02-10 @514  			mutex_lock(&ring->adev->cper.ring_lock);
8652920d2c0024 Tao Zhou        2025-02-10  515  
9c5c71bbed4132 Tom St Denis    2018-03-01  516  		early[0] = amdgpu_ring_get_rptr(ring) & ring->buf_mask;
ec63982e90a879 Tom St Denis    2017-03-29  517  		early[1] = amdgpu_ring_get_wptr(ring) & ring->buf_mask;
ec63982e90a879 Tom St Denis    2017-03-29  518  		early[2] = ring->wptr & ring->buf_mask;
4f4824b55650fa Tom St Denis    2016-04-27  519  		for (i = *pos / 4; i < 3 && size; i++) {
4f4824b55650fa Tom St Denis    2016-04-27  520  			r = put_user(early[i], (uint32_t *)buf);
8652920d2c0024 Tao Zhou        2025-02-10  521  			if (r) {
8652920d2c0024 Tao Zhou        2025-02-10  522  				result = r;
8652920d2c0024 Tao Zhou        2025-02-10  523  				goto out;
8652920d2c0024 Tao Zhou        2025-02-10  524  			}
4f4824b55650fa Tom St Denis    2016-04-27  525  			buf += 4;
4f4824b55650fa Tom St Denis    2016-04-27  526  			result += 4;
4f4824b55650fa Tom St Denis    2016-04-27  527  			size -= 4;
4f4824b55650fa Tom St Denis    2016-04-27  528  			*pos += 4;
4f4824b55650fa Tom St Denis    2016-04-27  529  		}
4f4824b55650fa Tom St Denis    2016-04-27  530  	}
d38ceaf99ed015 Alex Deucher    2015-04-20  531  
5a1428242952f2 Tao Zhou        2025-01-22  532  	if (ring->funcs->type != AMDGPU_RING_TYPE_CPER) {
4f4824b55650fa Tom St Denis    2016-04-27  533  		while (size) {
4f4824b55650fa Tom St Denis    2016-04-27  534  			if (*pos >= (ring->ring_size + 12))
4f4824b55650fa Tom St Denis    2016-04-27 @535  				return result;
d38ceaf99ed015 Alex Deucher    2015-04-20  536  
4f4824b55650fa Tom St Denis    2016-04-27  537  			value = ring->ring[(*pos - 12)/4];
4f4824b55650fa Tom St Denis    2016-04-27  538  			r = put_user(value, (uint32_t *)buf);
4f4824b55650fa Tom St Denis    2016-04-27  539  			if (r)
4f4824b55650fa Tom St Denis    2016-04-27  540  				return r;
4f4824b55650fa Tom St Denis    2016-04-27  541  			buf += 4;
4f4824b55650fa Tom St Denis    2016-04-27  542  			result += 4;
4f4824b55650fa Tom St Denis    2016-04-27  543  			size -= 4;
4f4824b55650fa Tom St Denis    2016-04-27  544  			*pos += 4;
d38ceaf99ed015 Alex Deucher    2015-04-20  545  		}
5a1428242952f2 Tao Zhou        2025-01-22  546  	} else {
5a1428242952f2 Tao Zhou        2025-01-22  547  		p = early[0];
5a1428242952f2 Tao Zhou        2025-01-22  548  		if (early[0] <= early[1])
5a1428242952f2 Tao Zhou        2025-01-22  549  			size = (early[1] - early[0]);
5a1428242952f2 Tao Zhou        2025-01-22  550  		else
5a1428242952f2 Tao Zhou        2025-01-22  551  			size = ring->ring_size - (early[0] - early[1]);
5a1428242952f2 Tao Zhou        2025-01-22  552  
5a1428242952f2 Tao Zhou        2025-01-22  553  		while (size) {
5a1428242952f2 Tao Zhou        2025-01-22  554  			if (p == early[1])
8652920d2c0024 Tao Zhou        2025-02-10  555  				goto out;
5a1428242952f2 Tao Zhou        2025-01-22  556  
5a1428242952f2 Tao Zhou        2025-01-22  557  			value = ring->ring[p];
5a1428242952f2 Tao Zhou        2025-01-22  558  			r = put_user(value, (uint32_t *)buf);
8652920d2c0024 Tao Zhou        2025-02-10  559  			if (r) {
8652920d2c0024 Tao Zhou        2025-02-10  560  				result = r;
8652920d2c0024 Tao Zhou        2025-02-10  561  				goto out;
8652920d2c0024 Tao Zhou        2025-02-10  562  			}
5a1428242952f2 Tao Zhou        2025-01-22  563  
5a1428242952f2 Tao Zhou        2025-01-22  564  			buf += 4;
5a1428242952f2 Tao Zhou        2025-01-22  565  			result += 4;
5a1428242952f2 Tao Zhou        2025-01-22  566  			size--;
5a1428242952f2 Tao Zhou        2025-01-22  567  			p++;
5a1428242952f2 Tao Zhou        2025-01-22  568  			p &= ring->ptr_mask;
5a1428242952f2 Tao Zhou        2025-01-22  569  		}
5a1428242952f2 Tao Zhou        2025-01-22  570  	}
4f4824b55650fa Tom St Denis    2016-04-27  571  
8652920d2c0024 Tao Zhou        2025-02-10  572  out:
8652920d2c0024 Tao Zhou        2025-02-10  573  	if (ring->funcs->type == AMDGPU_RING_TYPE_CPER)
8652920d2c0024 Tao Zhou        2025-02-10  574  		mutex_unlock(&ring->adev->cper.ring_lock);
8652920d2c0024 Tao Zhou        2025-02-10  575  
4f4824b55650fa Tom St Denis    2016-04-27  576  	return result;
d38ceaf99ed015 Alex Deucher    2015-04-20  577  }
d38ceaf99ed015 Alex Deucher    2015-04-20  578  

:::::: The code at line 535 was first introduced by commit
:::::: 4f4824b55650fa7014eedf18cb1f9f243cb2b45e drm/amd/amdgpu: Convert ring debugfs entries to binary

:::::: TO: Tom St Denis <tom.stdenis@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
