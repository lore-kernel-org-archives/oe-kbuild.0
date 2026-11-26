Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795737135;
	b=IvOjwbFqhyTK6V3lEvqio9ZiK09iaD+gIrAn8/aKHwb9MIQA3LjNoN+0bdv5MAV2v1Nc
	 tCPRxdhepZwpTo4ULSzK7A3UH3q3hYjgUiH9lEPHy1o7RwDapvkVCGM1N5WsmOc8dvZFS
	 aNPi9bVsSFe+O0y/v3eoflfVM8kNqHcIXo6aWMkQTNJJMdBmMjYHDjSWhaPvvCPRanrNi
	 u45pl7Ps0kfohopzQUoJslFUtt0VQrSiBwD01NUHlvmJL2bHjVG85/ZSpZ56jBh5hTvih
	 QzWTTTSNwFDwpfltjCgZrdXhIPFSv7Z0QZCKAEuY0EJtQmm94eT8CanITS/HnsItk4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737135;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AqEyc2CJvCyDZLLlkaP2nHEuoe3mo2uHpA/uEVWkYXU=;
	b=JzNIfSg38KDQnS7UTqW/OODsRCrWT6cktr24irP7hPp6J4MXwFYgez4z3rFRjcSgStd/
	 VsRcHjcWKW9WbPVct0o9lvNObxhIQAISZpjesgs6hH+wedPI/e96lxsKNkUT1a5iAnN1Y
	 WxFgtxtCwHY+33Du7tvP3beM2Ez9xgtzxXZna23b4TBRudhHZR1eZq7+1UKOpi3kQrt2c
	 Xmwl3wlm+W6QB10E4E5qJySjn4Cs91qeg2f+AYvVG8FIjVPktZrrkxFJ9RtvTkEPKFWsC
	 d84d4gXLklm5M+n8fK5Ng3xy/diKmmXiiQKDhEp/tpuleUB7f1+jbky6fDWcWFVcd8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O5oLxUCG;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF31B606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 23:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF31B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O5oLxUCG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795737133; x=1827273133;
  h=date:from:to:cc:subject:message-id;
  bh=yvbjHjUA6pXzGdJHKGKROsNhRr+MOGs2dciPIvBehYc=;
  b=O5oLxUCGuFH1muW8SaNdf6hW2ZulAul2CESNjV3Eh/jnVvoPF234eLq0
   hpeJOsFoNibiJZMaRyOjBNXwiDxeH4UvxudJQzaNoieoQVEJY1ex68b+I
   h9sXlN8xxywMU3StJ5EPEnPXhwxTyAQv9FQ6/0y+Zy8lWS8KQbaQp3Rpp
   J/dUBgZmyc/k/o7U3teJjqitRp8SqsWRHA4fIsty+EnP0KZUYBQFjCL7/
   zUZQQe6lK4vhVHd9TkKXPrZxL8V6O8iYCchtIK/5fp3LQ7Epv9brsZl+9
   bc2bly+eQARtb2fAfuNx2Y02ZH8WRrke71XKvOzPHFXtM0hFyxOalHUNr
   w==;
X-CSE-ConnectionGUID: wHil0drlRFC2ayR03e0nEA==
X-CSE-MsgGUID: QtK14e61TneB3ZfnUQ+K9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4659018"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4659018"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 15:52:12 -0800
X-CSE-ConnectionGUID: pW3qX/sRTr6ynjmKQhBp6w==
X-CSE-MsgGUID: PHn9PftcReWPUgWHchA9zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12055047"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Nov 2026 15:52:08 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWjFu-000000000FF-22YF;
	Thu, 26 Nov 2026 23:51:58 +0000
Date: Fri, 27 Nov 2026 00:51:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:343:21-22:
 WARNING opportunity for min()
Message-ID: <20261127004404.WuAnUrAC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Pierre-Eric Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9437ee8b6cf607e883b36e44bd755968daaebd48
commit: 4bbba79a7f1d0c7296bf8c935d65a9ff633f6917 drm/amdgpu: move devcoredump generation to a worker
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-r2100-20261126 (https://download.01.org/0day-ci/archive/20261127/20261127004404.WuAnUrAC-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4bbba79a7f1d ("drm/amdgpu: move devcoredump generation to a worker")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261127004404.WuAnUrAC-lkp@intel.com/

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
