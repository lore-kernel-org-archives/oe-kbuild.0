Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD5415853B
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 06:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766729473; cv=none; b=R8jDXvAwp+koVkRs47qX63DFinpDrZK8/lah2ZrNoahdv6QB8P/8pGiYmMZaII0Wo2haTH7cUGL69n06jS+nG9RlhA6wTdLmmhGo7fQOr9QW2KvpbY9fWTwvEG6QxwAc6LRRET2kaMNEd+N3hEZVJgyVTZJ8W6rMC3h1spxiZpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766729473; c=relaxed/simple;
	bh=pHdybOfpjizM72ViHv9Z5zeMnk8LjTnCNrnqPAGeDvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O0yngd0mRnvbQrYnXNPw4BucH6NH/V61C4oauc7/SNehioTQIm/2vc6XFfrcMeMVEw8PG4pMg/ZPAtioTr7vmx6YYwnO7kRANlUdyicxpw3mDuTYZXAZ0bXXxzT0BLsfeJQI5Ex8y8LmOn4nMpHLjKexTtywFqN6tPYkTKYAsl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1AN966+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1AN966+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766729470; x=1798265470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pHdybOfpjizM72ViHv9Z5zeMnk8LjTnCNrnqPAGeDvE=;
  b=D1AN966+rcS/LVV897m8iCmTAjtZQYTCqmazsUiJtXcvEd29fX+x2Y2R
   K2nLqXX4EY+TNyVdyIhWgSOioj695aNwZwVPPnIqcvcVbBljGO4BUQQRa
   PngbdeQdP84JVVBOGg6m+lhAe5JaiTVm220LRWuYwJyaVf2kZLSvKrCEq
   qw5M7+CrEY2SbSf7y8w+eKvc7yHCoKv6VCBsiOvx9h39XNxTPTDmkCXvX
   /WyQjWSff/tsF0665HXVKSKVnmuFQTWWk9aZ6hRHECN9yfwc5LSYlPJwK
   JIAEDfas8vZWkfC4w47USvo791u72j2Gu9OHonsuVTToFn57cSuphr/v6
   A==;
X-CSE-ConnectionGUID: GRGLc1w+SU2NDxKYMTn3+g==
X-CSE-MsgGUID: XyIFLKXJTCuUwj26P9jQHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79862209"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="79862209"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 22:11:10 -0800
X-CSE-ConnectionGUID: srHRDXbwTZK+jsL7RNA2IA==
X-CSE-MsgGUID: OFLOlYo+S8aJS8Omc0aKSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200246543"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 25 Dec 2025 22:11:09 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ12Y-000000004k5-3tYX;
	Fri, 26 Dec 2025 06:11:06 +0000
Date: Fri, 26 Dec 2025 14:10:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC v5 2/6] gpu: Move DRM buddy allocator one level up
Message-ID: <202512261321.G11WYh0v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/buddy.c:1309:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251219203805.1246586-3-joelagnelf@nvidia.com>
References: <20251219203805.1246586-3-joelagnelf@nvidia.com>
TO: Joel Fernandes <joelagnelf@nvidia.com>

Hi Joel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.19-rc2 next-20251219]
[cannot apply to rust/rust-next drm-nova/nova-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Fernandes/rust-clist-Add-support-to-interface-with-C-linked-lists/20251220-044108
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251219203805.1246586-3-joelagnelf%40nvidia.com
patch subject: [PATCH RFC v5 2/6] gpu: Move DRM buddy allocator one level up
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: nios2-randconfig-r111-20251226 (https://download.01.org/0day-ci/archive/20251226/202512261321.G11WYh0v-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261321.G11WYh0v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512261321.G11WYh0v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/buddy.c:1309:1: sparse: sparse: bad integer constant expression
   drivers/gpu/buddy.c:1309:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/buddy.c:1310:1: sparse: sparse: bad integer constant expression
   drivers/gpu/buddy.c:1310:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpu/buddy.c:1310:1: sparse: sparse: bad integer constant expression
   drivers/gpu/buddy.c:1310:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/gpu/tests/gpu_random.c:47:1: sparse: sparse: bad integer constant expression
   drivers/gpu/tests/gpu_random.c:47:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/tests/gpu_random.c:48:1: sparse: sparse: bad integer constant expression
   drivers/gpu/tests/gpu_random.c:48:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpu/tests/gpu_random.c:48:1: sparse: sparse: bad integer constant expression
   drivers/gpu/tests/gpu_random.c:48:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/gpu/tests/gpu_buddy_test.c:891:1: sparse: sparse: bad integer constant expression
   drivers/gpu/tests/gpu_buddy_test.c:891:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpu/tests/gpu_buddy_test.c:892:1: sparse: sparse: bad integer constant expression
   drivers/gpu/tests/gpu_buddy_test.c:892:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/tests/gpu_buddy_test.c:893:1: sparse: sparse: bad integer constant expression
   drivers/gpu/tests/gpu_buddy_test.c:893:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpu/tests/gpu_buddy_test.c:893:1: sparse: sparse: bad integer constant expression
   drivers/gpu/tests/gpu_buddy_test.c:893:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1309 drivers/gpu/buddy.c

58b89f489001d1 Joel Fernandes 2025-12-19  1308  
58b89f489001d1 Joel Fernandes 2025-12-19 @1309  MODULE_DESCRIPTION("GPU Buddy Allocator");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
