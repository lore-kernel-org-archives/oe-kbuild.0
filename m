Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51E31EFF9B
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 14:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765550584; cv=none; b=YymBB0xhakqbUApBYnfMwxSNnpMXoX7iVj4BilZK5yTcsOaILmMxvYhkqtyy+cq8gEBZwn4Iidtd/B2QakSABwNrp85Yb6tgVKbiJUPv/8gRpiXp+hfOHwvA8NXTASiq7q59itrXzFF4YahmqNEeULlmASNssmTdWEjvW+J/nLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765550584; c=relaxed/simple;
	bh=32Cn0lg+WHjxhdQxzkfoNVNZ/mTgOMb1Bcqm8yMyMXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bLiSxoPbEGwtVv02oKgWjYwmoz9W3ace5XC8+WsjQHY+wEFPSuQ0mioAKUgX8Ezk0amWwoXkxoEJDLRr0j+lj7IG15joM0/9TTG7gH7i6JgHR2jtQMOWyZfaDxc6/weWa2P5G7FmFQdDopLCNlV2Zff3zqUsuo910UrKGx47Elw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ho0BwRDA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ho0BwRDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765550583; x=1797086583;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=32Cn0lg+WHjxhdQxzkfoNVNZ/mTgOMb1Bcqm8yMyMXc=;
  b=Ho0BwRDANNnheTnlWv5vZ4RWYjtiWtnK1tBEeYM8dVGGTwyF2MouWlAk
   LDanRcLbG6gZ2Ebtos0+I80n/gUyJQgUpDX46kH0r+EAEkNefGMDYbyGC
   EofbqLJUzya8kpooQW3WEscFhsDL8oKskKFpu1sy//Ho5n6OVM8hKooUy
   2rxA+DwiOZAQYH5dpksiBtFzO3UGJI7FPdsW4dNr9eJhQQtkYrRPTD20Q
   ZP8cPQc0qkImnZRUV4iXlRzLnbjgQ5PprN30JnCd6wuL7uca9UHzCx9+Y
   v+My+BQ2HAmaAQj9qKQJtShsFXDdO4AOu3q2j1krVVyhkg97kHrNAbE8y
   Q==;
X-CSE-ConnectionGUID: NuF5k6cZRxu2+xrU9oTt+Q==
X-CSE-MsgGUID: XzZBq4h/RmCVYyosJz5Oug==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66724262"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="66724262"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 06:43:02 -0800
X-CSE-ConnectionGUID: GpEZUywiThOk/8udbfLHQA==
X-CSE-MsgGUID: eXuACXVcR8qdBGgmRv11aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="201284800"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Dec 2025 06:43:01 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU4ME-000000006Al-2UsC;
	Fri, 12 Dec 2025 14:42:58 +0000
Date: Fri, 12 Dec 2025 22:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:535:4-10: preceding lock on
 line 514
Message-ID: <202512122257.zUJHT8iT-lkp@intel.com>
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
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 8652920d2c00243e8a8ca91560a30488d95d9a1b drm/amdgpu: add mutex lock for cper ring
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-104-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122257.zUJHT8iT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512122257.zUJHT8iT-lkp@intel.com/

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
