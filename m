Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCB11E4A6
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 14:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735308386; cv=none; b=nsMDV1FgDRgDPHVLy30q/LDq5aU7fMov0ZIurczR3/wGkQ3M5Jdwooib3EtL+iKhe3UWitG1kM1DJ9zuyIXMI0N7idNbwVR8TF0wUBlaAuZSTs5ePR/NNj98cE6yJBbah0oFS4hfY83qZ0N1SxmqWWT0+7rWm5p2TVpnkMnOjOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735308386; c=relaxed/simple;
	bh=v0R6RoVwQ5qk3eaMdqBmveyZ+8GX7pHVQYKhFuFbT84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lfiHMJNLdguZnmxq7HzMBXXs/BA20xTJCRcUpC7LZFopkTdagw3FCxcS+n2GATzUzuPZP/Nh6xRFJFKTmEdVZKxaUTsGJsY7ZWe7uQ7Wnspkamzj1bkPbM5kUO02F5FjjBYqKm42s/ry0OLgm1/0TLFOLv9dxNmxrkGGM5pdd1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGg85Fp0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGg85Fp0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735308384; x=1766844384;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=v0R6RoVwQ5qk3eaMdqBmveyZ+8GX7pHVQYKhFuFbT84=;
  b=NGg85Fp03gfxpBw2dEytN2TWx8mC7YRnKhKL0lf6hv47s14+SEOX06Xo
   BejovN2ClhYsEzKBtlsp/yx/IblvTw1jZyAmdLMY/PrWe1i/e7G/8M72O
   qYh7yrH/631pQ/WP6UKFDS1AQ44mAKYhC7F9MMkdC3WpEfHEff8ki76qF
   PSNnimwF9XJrxKaEc8QlH72jp+ql95KCSAulyC+gA5/1UDqt0ss2G2DJQ
   q+Par4AYXR4jtSD6lFpiZRpIBViBOwa8z3zWwWQYNd0JmxwfaQIUUmccC
   3BE1f7f/FaDhXDjBWmbx61BS33PFyuflviSRPCHr6wHUlIJGzx6q18G+6
   A==;
X-CSE-ConnectionGUID: DAogQl+FR3anO9WrvPiR7A==
X-CSE-MsgGUID: 2mXuWDI+Q16xqn9aNJAjrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35020600"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35020600"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 06:06:20 -0800
X-CSE-ConnectionGUID: ZthqLSF9ReqvheyYXTgSRw==
X-CSE-MsgGUID: FxTD+RsQTK+Siihfa8A6hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="100287379"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Dec 2024 06:06:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRAym-0003De-2o;
	Fri, 27 Dec 2024 14:06:16 +0000
Date: Fri, 27 Dec 2024 22:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android13-5.15 10/10]
 drivers/dma-buf/st-dma-fence-unwrap.c:75:39-45: ERROR: reference preceded by
 free on line 70
Message-ID: <202412272143.B9jfMgsY-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   f0b678d66a6fea50a07caa82f754461f550d500c
commit: 7aa4d35d52466ff170359781977cb644b595d2d1 [10/10] UPSTREAM: dma-buf: cleanup dma_fence_unwrap selftest v2
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-101-20241227 (https://download.01.org/0day-ci/archive/20241227/202412272143.B9jfMgsY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412272143.B9jfMgsY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma-buf/st-dma-fence-unwrap.c:75:39-45: ERROR: reference preceded by free on line 70

vim +75 drivers/dma-buf/st-dma-fence-unwrap.c

169630111a051b Christian König 2022-03-11  45  
169630111a051b Christian König 2022-03-11  46  static struct dma_fence *mock_array(unsigned int num_fences, ...)
169630111a051b Christian König 2022-03-11  47  {
169630111a051b Christian König 2022-03-11  48  	struct dma_fence_array *array;
169630111a051b Christian König 2022-03-11  49  	struct dma_fence **fences;
169630111a051b Christian König 2022-03-11  50  	va_list valist;
169630111a051b Christian König 2022-03-11  51  	int i;
169630111a051b Christian König 2022-03-11  52  
169630111a051b Christian König 2022-03-11  53  	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
169630111a051b Christian König 2022-03-11  54  	if (!fences)
7aa4d35d52466f Christian König 2022-05-04  55  		goto error_put;
169630111a051b Christian König 2022-03-11  56  
169630111a051b Christian König 2022-03-11  57  	va_start(valist, num_fences);
169630111a051b Christian König 2022-03-11  58  	for (i = 0; i < num_fences; ++i)
169630111a051b Christian König 2022-03-11  59  		fences[i] = va_arg(valist, typeof(*fences));
169630111a051b Christian König 2022-03-11  60  	va_end(valist);
169630111a051b Christian König 2022-03-11  61  
169630111a051b Christian König 2022-03-11  62  	array = dma_fence_array_create(num_fences, fences,
169630111a051b Christian König 2022-03-11  63  				       dma_fence_context_alloc(1),
169630111a051b Christian König 2022-03-11  64  				       1, false);
169630111a051b Christian König 2022-03-11  65  	if (!array)
7aa4d35d52466f Christian König 2022-05-04  66  		goto error_free;
169630111a051b Christian König 2022-03-11  67  	return &array->base;
169630111a051b Christian König 2022-03-11  68  
7aa4d35d52466f Christian König 2022-05-04  69  error_free:
169630111a051b Christian König 2022-03-11 @70  	kfree(fences);
7aa4d35d52466f Christian König 2022-05-04  71  
7aa4d35d52466f Christian König 2022-05-04  72  error_put:
7aa4d35d52466f Christian König 2022-05-04  73  	va_start(valist, num_fences);
7aa4d35d52466f Christian König 2022-05-04  74  	for (i = 0; i < num_fences; ++i)
7aa4d35d52466f Christian König 2022-05-04 @75  		dma_fence_put(va_arg(valist, typeof(*fences)));
7aa4d35d52466f Christian König 2022-05-04  76  	va_end(valist);
169630111a051b Christian König 2022-03-11  77  	return NULL;
169630111a051b Christian König 2022-03-11  78  }
169630111a051b Christian König 2022-03-11  79  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
