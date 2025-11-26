Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C1A125A9
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 21:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764194373; cv=none; b=SkYcnJH1aykcAK9E36bGGPt5MAsKqv96b54P7lKG+u+VmZcW8lmrodQu/1Iuu58wRUyYXnwnFW3WBbXv2tPLvgnRh1c9cV47f3CK2kvDoH+ERmgEd6u4FfEE2rpTLskDvPND3eR7bJbIkftOTQ71EiTwZVBOQEGaalwfFpPbx/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764194373; c=relaxed/simple;
	bh=5kaLBJ+xzU+1pmIEIpT4Kd5EhXEVH34TESqrNtfrAt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=agCHaYr+6OUOwdHzac+7eWOAmKGSrIRoiD9OnL968q7mtAr7V+Yl7qIkd0w5XhiFsbI7s56g9pmbPk50Ibyej0wBD+YZp8/ADk7wNmu1kvcOWbTnVg7cu30YhNhV9kzvmOT8oxqvb634UsOoc6sESwQhjVoThq5bYB2kHpAJaeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0SapL6k; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0SapL6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764194371; x=1795730371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5kaLBJ+xzU+1pmIEIpT4Kd5EhXEVH34TESqrNtfrAt8=;
  b=I0SapL6kowPYT03KMK7ad4Gao4PafMJUkHBoij0+EGYgSQ1E1Osv/6Dz
   PRlVmDaAdoJZyr1gOItOpki+o5LlnI/gyiCEWhZ9/tbIWUvDKeIykoIdL
   dUrX9xu34uJ7dK74nJIwsBf7ep6lCgfb2QQxK+XNi/FCjJU/zfnp7PFWz
   JmdVAaGCPfjRReNcMO1UPvnBPz21RQSnKCvZc7i/N+zcfl+4rdV0WB9d0
   kiDNCH98GAKy0v/VlH+eA+tj8/LQEIeeWZHMwf0F1U+TqVg5gvWEtiNr0
   YuUP9DNwqBB31mLzOT0++CXH/SlhBMF0YaZ80RjauBmeTvN/zpzdJbpIZ
   A==;
X-CSE-ConnectionGUID: EjIXOO7YTZuaP2zfUNo6Hw==
X-CSE-MsgGUID: Ivjwi0e7SyOGQVSW0iclkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="69864090"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="69864090"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:59:31 -0800
X-CSE-ConnectionGUID: yGw5jAmlRY2CJXy2poHjVA==
X-CSE-MsgGUID: hBTBTuJBT6SYoEx+SuSngw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 26 Nov 2025 13:59:30 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vONXs-000000001Wj-0VxX;
	Wed, 26 Nov 2025 21:59:28 +0000
Date: Wed, 26 Nov 2025 22:58:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-5.10 3333/3333] clang: error: -z noexecstack:
 'linker' input unused
Message-ID: <202511262205.x1wFTfUh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Zheng Zengkai <zhengzengkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   18627faf2934ad96de2e45368ec4cf2444343b22
commit: 58290d2bdab543f8f1fa4c0c174cf792ebbcfbfc [3333/3333] selftests/x86: Add a selftest for SGX
:::::: branch date: 12 hours ago
:::::: commit date: 3 years, 9 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251126/202511262205.x1wFTfUh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 226765b60cc54e03386f38874a177c906f5aa6e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511262205.x1wFTfUh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511262205.x1wFTfUh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: -z noexecstack: 'linker' input unused [-Werror,-Wunused-command-line-argument]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
