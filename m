Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130A417A30A
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Apr 2026 04:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776399532; cv=none; b=IBYoRAOQ/wK4ZL8eV12ZO+jnUOfIb0B6TZrh78MUGql7N4svn9nL9XqoLyqg8P9SU7rip09qYzI57mhyVOWOvIS1Zhs2wadhn2DjThZZ+cnJ3q3BCbb/G817U1GaD62UBMrPtP7prfbv+Ei9OibGxQYdfrwmh+jEHwaqW7f/p7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776399532; c=relaxed/simple;
	bh=NKUwsiLGX0oyMdc1mcQmyC/5E/qXYdThUI4MDckdFHw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QY3SxCbJLuvs7aH04swfOvhQTaxRaciGnmcHQHvmvuZLIQzex1nZTm4l4xYe42H501/JGLXHCSE7pz8mjufGSb4sVNa3sdkIlDfm2BO2WU4uW6SWEor89E1y6QwHhflGJ3pSmD/TTOj72i77BRWnfYnoBEZ+y1N6B+gC34xW00Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmtgKZ0n; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmtgKZ0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776399531; x=1807935531;
  h=date:from:to:cc:subject:message-id;
  bh=NKUwsiLGX0oyMdc1mcQmyC/5E/qXYdThUI4MDckdFHw=;
  b=NmtgKZ0nxNSu64FJwQ/pKblPKJLZbJCsbewGi+4XJ1UPvDJb4xE8zpgh
   g7gx0KnSRifsRllQDynYHZm6yK+m28PADIqPZcA47E0HT3+9acGFpGpVU
   Qtv7MEf2mskpMolQyx0UcoGU4ZsuUuVzEpK+nkOD/zYJPxPSri2IKNQFy
   qkMGu/XR+1/KygE6vnGpXsDV9RX9qwQ5qNzd4iga6/qbfGp7837eSUdog
   6ivJVjBBpI1Q1g2Mr6qLP9cXeILJN0xSFHWhotpMsrrisWJWn0RlbpSmg
   sGLoV28d6kzBVfxcrQAHlJq9zoT6l0TsQrS0LiLcUqc6h75FIbIwcVO/t
   A==;
X-CSE-ConnectionGUID: OlHjenKnSqmSKrvP0VyvtQ==
X-CSE-MsgGUID: L9zkFx55RTyKxEgpV7Mmww==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77111327"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="77111327"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 21:18:50 -0700
X-CSE-ConnectionGUID: KiE9/DOUTx2pn4ri7J6RKg==
X-CSE-MsgGUID: 7MkKd8ZsTrS2mNNuPzzXzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="230812637"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Apr 2026 21:18:50 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDafG-000000002JW-31yA;
	Fri, 17 Apr 2026 04:18:46 +0000
Date: Fri, 17 Apr 2026 12:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [agd5f:amd-staging-drm-next 2054/2412]
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:343:21-22: WARNING
 opportunity for min()
Message-ID: <202604171220.tfUQt5ua-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Pierre-Eric Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>
CC: Linux Infrastructure <z1.linuxinfra@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   f0181ced20586d4d03c1e3a4bcbd5c8faa27399b
commit: df7110d9238e4010b6f6e0398d7243f187a49e8b [2054/2412] drm/amdgpu: move devcoredump generation to a worker
:::::: branch date: 3 days ago
:::::: commit date: 4 weeks ago
config: arc-randconfig-r051-20260417 (https://download.01.org/0day-ci/archive/20260417/202604171220.tfUQt5ua-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202604171220.tfUQt5ua-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:343:21-22: WARNING opportunity for min()

vim +343 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c

9022f01b970933 Sunil Khatri               2024-03-21  326  
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  327  static ssize_t
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  328  amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  329  			void *data, size_t datalen)
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  330  {
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  331  	struct amdgpu_coredump_info *coredump = data;
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  332  	ssize_t byte_copied;
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  333  
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  334  	if (!coredump)
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  335  		return -ENODEV;
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  336  
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  337  	if (!coredump->formatted)
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  338  		return -ENODEV;
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  339  
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  340  	if (offset >= coredump->formatted_size)
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  341  		return 0;
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  342  
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21 @343  	byte_copied = count < coredump->formatted_size - offset ? count :
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  344  		coredump->formatted_size - offset;
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  345  	memcpy(buffer, coredump->formatted + offset, byte_copied);
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  346  
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  347  	return byte_copied;
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  348  }
df7110d9238e40 Pierre-Eric Pelloux-Prayer 2025-02-21  349  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
