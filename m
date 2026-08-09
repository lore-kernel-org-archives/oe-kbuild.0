Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEF71E0E14
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Aug 2026 12:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786279972; cv=none; b=iN91SMAb3SlGnnyLCC6ivIZDTbZ2DSGLP4GOr6ZHtE0v9yQbH8ETal60CzOmrb9cT4vdue8iGQhwljJRlFEzzSO80rVAu7iPlz8QxFhDJxurlfhEBaMOIo66OdQeSlVCEpzyVZ9IA/+UPJOiWvJt3IU5QFz4aFpwbmR36q7UBZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786279972; c=relaxed/simple;
	bh=nbApguehXjn+/7aJ7HKzj4Gt1jal63KdKRDXc+9XrpM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jYBFHgx1yg3fuDggEmimaFcC88il3NMKMBj99xAxo6eGefiMqZ5Kms35NW4xYaJPktQCyANuS3YIr+QzpyIGJL7EphbuQvWLO0oqJ5HNvMhMToOOzlIfnIB/vEdIEFf0PWPcHycwHRZF8Cit1BA7OB43myPmKZLJAiTbB/VOvSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AU5oemup; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AU5oemup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786279970; x=1817815970;
  h=date:from:to:cc:subject:message-id;
  bh=nbApguehXjn+/7aJ7HKzj4Gt1jal63KdKRDXc+9XrpM=;
  b=AU5oemupZsvsKn6s2TFbeDKv3DXhzt4Jla8M9C2Zwdry6R83o6784sWx
   B197hf/gWMijl6WcPtYTmdRTDyynJzPamCSWlUKTPXscjGKfFZ75OCZib
   WRdjV2KTT1bM2Ya4Mr7akasqFpKxu1f5qnYg5zV+nzPLWeOGEaplX9WAG
   7DECFaVPET8HFmjAIsgid8Rawo7iQ3Fk6Vo495ZO5HFAf7HVzAvWUAJw4
   J7zzxM6IAce0DCIOfR7FL50TV802SskdVc0+r5SKvWUd14CcxT+RYDjbX
   mEj+AwyXJEICkPvzHN2h83WmdnnOMhVBm/QqdXoNOgF7dFuFhwZYUkmAb
   g==;
X-CSE-ConnectionGUID: GaXopZJYSMu1q5gxXTXrfA==
X-CSE-MsgGUID: MPrLZL0uS/OMpZEvjvRSXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="86890090"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="86890090"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 05:52:50 -0700
X-CSE-ConnectionGUID: rghn5TmJRv+66PP/5EDSDQ==
X-CSE-MsgGUID: kp6Yr3/5TjGubBx6Axu77g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="256581643"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Aug 2026 05:52:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wt31B-00000000LtE-25xt;
	Sun, 09 Aug 2026 12:52:45 +0000
Date: Sun, 09 Aug 2026 20:52:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:343:21-22:
 WARNING opportunity for min()
Message-ID: <202608091913.zfY0WKSU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Pierre-Eric Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06cf61899d6498b33e4b7c87d99d5bd471ccc375
commit: 4bbba79a7f1d0c7296bf8c935d65a9ff633f6917 drm/amdgpu: move devcoredump generation to a worker
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-r051-20260809 (https://download.01.org/0day-ci/archive/20260809/202608091913.zfY0WKSU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4bbba79a7f1d ("drm/amdgpu: move devcoredump generation to a worker")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608091913.zfY0WKSU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:343:21-22: WARNING opportunity for min()

vim +343 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c

9022f01b9709331 Sunil Khatri               2024-03-21  326  
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  327  static ssize_t
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  328  amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  329  			void *data, size_t datalen)
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  330  {
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  331  	struct amdgpu_coredump_info *coredump = data;
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  332  	ssize_t byte_copied;
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  333  
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  334  	if (!coredump)
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  335  		return -ENODEV;
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  336  
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  337  	if (!coredump->formatted)
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  338  		return -ENODEV;
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  339  
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  340  	if (offset >= coredump->formatted_size)
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  341  		return 0;
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  342  
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21 @343  	byte_copied = count < coredump->formatted_size - offset ? count :
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  344  		coredump->formatted_size - offset;
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  345  	memcpy(buffer, coredump->formatted + offset, byte_copied);
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  346  
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  347  	return byte_copied;
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  348  }
4bbba79a7f1d0c7 Pierre-Eric Pelloux-Prayer 2025-02-21  349  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
