Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E6D1C84D7
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 00:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765586030; cv=none; b=MtCBsuH2u4I7Ih/BxbSY99TsAxz4/d69TO13dLlsrK6Y73SjL4PTJHMd5TsjqGEQ/WYw7xjsLUrINsPVztpKL1xoxKLGNln5elGUBJ6QtcY04wccoVSEK3ikvQSFRTnal0ZNHxKyuZPXp5AqEB7SjukkdJ9HuVgMXi7Yu54I9Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765586030; c=relaxed/simple;
	bh=Ua8mpHrTZHngHGbs6lCXgyFM52or5yKYUR90cXhRMqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lfHhMUglX5PTG93auDVTRqT9j6jC0/lUXJX+7Xnipz2OMga0rBccFz2Ku5FHE88reBQY8fpLptlakAYYyyFFjyoajc6jnVwPr3sqDPbcytwq9V5i96VpLY6jtccCYIdChiJ5STrCDb/mKdJPjA8Wuazi7hkueM3Wvy3TpJsgNyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FcNQZUCu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FcNQZUCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765586029; x=1797122029;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ua8mpHrTZHngHGbs6lCXgyFM52or5yKYUR90cXhRMqs=;
  b=FcNQZUCu+TiiGGQX6mLCPYfO7UQi3PS6CBkjrQ3ktIJHvogH5ljme28T
   8hz7BRHriEraJyTWa7ReHDWGLl2WewTFd3M/jt6y37HX24/cqAMr17AJr
   N9cVey5Lw662RyHVbifLL1Cxvx9Kyk9kNok7QS/Ic69md+wLFqdbwD6Zo
   SDQItsJGk+vlLdNY+ngo7wY+iXqDy5aBKRClaQ4tDzLkODOQnZEx6tJlq
   gT+XNK/JG4zUYJANvawR2UaSm0tfPfRizDNuKA8oerHAb+1PMP342UGSC
   RlTeLndZvbQsHndweKqgSzAANUKILpxXHuAjRTfmuBjPGLk49AulGyxEP
   g==;
X-CSE-ConnectionGUID: 5iLTlrG/TdK+TT9W5pMQrQ==
X-CSE-MsgGUID: osNMtGcLQw+5kDO60Lhdsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66581155"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="66581155"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 16:33:45 -0800
X-CSE-ConnectionGUID: C9V1BLN+RPqW3oJf0tupTw==
X-CSE-MsgGUID: 69ouZ1RVTkSMA3h9N+jEUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197718307"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2025 16:33:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUDZt-000000006pj-1Shc;
	Sat, 13 Dec 2025 00:33:41 +0000
Date: Sat, 13 Dec 2025 08:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/panthor/panthor_mmu.c:1965 panthor_vm_heaps_sizes()
 warn: iterator 'i' not incremented
Message-ID: <202512130851.haqhMS5x-lkp@intel.com>
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
TO: "Adrián Larumbe" <adrian.larumbe@collabora.com>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: Liviu Dudau <liviu.dudau@arm.com>
CC: Mihail Atanassov <mihail.atanassov@arm.com>
CC: Steven Price <steven.price@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 434e5ca5b5d7ea415670d4fcb399d90d355a1e38 drm/panthor: Expose size of driver internal BO's over fdinfo
date:   10 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 10 months ago
config: um-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130851.haqhMS5x-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130851.haqhMS5x-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/panthor/panthor_mmu.c:1965 panthor_vm_heaps_sizes() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/gpu/drm/panthor/panthor_mmu.c:1612 panthor_vm_pool_destroy() warn: iterator 'i' not incremented

vim +/i +1965 drivers/gpu/drm/panthor/panthor_mmu.c

647810ec247641 Boris Brezillon 2024-02-29  1946  
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1947  /**
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1948   * panthor_vm_heaps_sizes() - Calculate size of all heap chunks across all
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1949   * heaps over all the heap pools in a VM
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1950   * @pfile: File.
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1951   * @stats: Memory stats to be updated.
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1952   *
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1953   * Calculate all heap chunk sizes in all heap pools bound to a VM. If the VM
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1954   * is active, record the size as active as well.
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1955   */
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1956  void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *stats)
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1957  {
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1958  	struct panthor_vm *vm;
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1959  	unsigned long i;
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1960  
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1961  	if (!pfile->vms)
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1962  		return;
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1963  
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1964  	xa_lock(&pfile->vms->xa);
434e5ca5b5d7ea Adrián Larumbe  2025-01-30 @1965  	xa_for_each(&pfile->vms->xa, i, vm) {
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1966  		size_t size = 0;
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1967  
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1968  		mutex_lock(&vm->heaps.lock);
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1969  		if (vm->heaps.pool)
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1970  			size = panthor_heap_pool_size(vm->heaps.pool);
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1971  		mutex_unlock(&vm->heaps.lock);
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1972  
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1973  		stats->resident += size;
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1974  		if (vm->as.id >= 0)
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1975  			stats->active += size;
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1976  	}
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1977  	xa_unlock(&pfile->vms->xa);
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1978  }
434e5ca5b5d7ea Adrián Larumbe  2025-01-30  1979  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
