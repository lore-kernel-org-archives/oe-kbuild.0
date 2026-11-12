Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794514144;
	b=nxBUc8S6Sw9Z5ReOndZCyfb8auLqKRNM60lTrVOssgnEn4Bo6M2k/bj4MV3KHUyBcNR4
	 cnRB+A1SbRe7k+n9q/W4GkVaWuTTCOf+j0isjmToZH8afJynYcw+BLgprvChajw0hiCuK
	 QQYrqHQ0oidYCvtw3AZNhQhCNOHY1y8DaJsGBkaWuKJIRF9Bn9ZgdHx3wgNsenlIBJnEa
	 hS9ECPwtV4qNBTZ4WYGHKzmFqt3NNO502zQQBQdVFZgt6qufHtD920TNjfRqn71MP98OB
	 Z1DUv6SMnuxby6Zdpgg0Ib+gb4CP7sGTtR0adLRVsDKHYYOCVjmkPnjbHPA/stPb2ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794514144;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NTVE1a7yM3KWeVoZ9jyL0+saYDZItyYjkgY7Ie0LB/Y=;
	b=vPplymef23BSWHyK3O5pMLZkuZJdMQJltLlML/aS5r3nrD0a5EYg46jmJUcFOmcaidWW
	 ajCopPOfl16Se3tcCraZ3PfE7wgzQW1/f0KneCDbfBd6qo5Q0JgXVn3tyS62GVxG0o5wg
	 pz/PnrFPg10jOlCLXPGtuAVp64nf4wV24W2kgcvkqOsuQz5HAWNc3PnDlViKaTR4L+gDn
	 A8zCGX/2Qc8YGAti6vadHfiyB7dGXZfmg4QcWoeltkFg5TbK0J0q6rN3D/4SMvkPsDO0+
	 yK6P8yjVYrUnnPNAXSHmfqbuOjIqIGCxWxfDv+EB/vwpDXQH4Z1IZm24Mu23xHr/IyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="M/9LinPa";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D06606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 20:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9D06606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M/9LinPa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794514144; x=1826050144;
  h=date:from:to:cc:subject:message-id;
  bh=9I7Ee/wmKYezNvczvX3XAl5x6vN9bCPknazcLpM4xLc=;
  b=M/9LinPaYVdYIQVnehjcDL3ZNjlvD/68+s1mlR8DcP6+s6IlNqKNfrCq
   Pm450wp9W1Y9Ji31sYuBB6YFZzlf+w9q4+0+gwoGWI+r8zZhgBtnXoi41
   r5t1ojSrK80DyVUenEOofUxREpiFL+NFH/p7hDmeezF+5Cf6FmzD3LneA
   Q9d7RMcHlmMI2HZ/KYHYLLZ1ZSqMsmO1++YgDhKpx5L15GVPn/j/ZY0a2
   H0Max+C1o9hu5kz1FQ3EqoBywSe3Rl7dZCCMniD7RCRSZ+mfpB+sForHK
   pLpD3HSTA4qpKl+B1y8t7vMRArHAOVGxl7VP/fYzpTGnAaEvGER/2kHdR
   Q==;
X-CSE-ConnectionGUID: HyjXk0vzREeHBYa0LcAgRw==
X-CSE-MsgGUID: v/OCyTqjS0CYW91gBJcT/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3353671"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3353671"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:09:03 -0800
X-CSE-ConnectionGUID: SoNsSzEqRuyBb2T+DLLhUg==
X-CSE-MsgGUID: YW9F2S+dS0WC1MEKhPGmFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="10477792"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 12 Nov 2026 12:09:02 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRb6R-000000000wt-3C6J;
	Thu, 12 Nov 2026 20:08:59 +0000
Date: Thu, 12 Nov 2026 21:08:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 448/448]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c:1071 amdgpu_is_kicker_fw() warn: if
 statement not indented
Message-ID: <202611122110.Nh7W56Zp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ec4ee04f96442af315eacc59a21b3381640069ae
commit: e0b33ebf77d967e563a0db05f608fa2313232fe8 [448/448] drm/amdgpu: Add kicker device detection
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 4 months ago
config: i386-randconfig-2200-20261110 (https://download.01.org/0day-ci/archive/20261112/202611122110.Nh7W56Zp-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611122110.Nh7W56Zp-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c:1071 amdgpu_is_kicker_fw() warn: if statement not indented

vim +1071 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c

1d5eee7dd66488 Likun Gao 2021-12-10  1065  
e0b33ebf77d967 Frank Min 2025-06-04  1066  bool amdgpu_is_kicker_fw(struct amdgpu_device *adev)
e0b33ebf77d967 Frank Min 2025-06-04  1067  {
e0b33ebf77d967 Frank Min 2025-06-04  1068  	int i;
e0b33ebf77d967 Frank Min 2025-06-04  1069  
e0b33ebf77d967 Frank Min 2025-06-04  1070  	for (i = 0; i < ARRAY_SIZE(kicker_device_list); i++) {
e0b33ebf77d967 Frank Min 2025-06-04 @1071  		if (adev->pdev->device == kicker_device_list[i].device &&
e0b33ebf77d967 Frank Min 2025-06-04  1072  			adev->pdev->revision == kicker_device_list[i].revision)
e0b33ebf77d967 Frank Min 2025-06-04  1073  		return true;
e0b33ebf77d967 Frank Min 2025-06-04  1074  	}
e0b33ebf77d967 Frank Min 2025-06-04  1075  
e0b33ebf77d967 Frank Min 2025-06-04  1076  	return false;
e0b33ebf77d967 Frank Min 2025-06-04  1077  }
e0b33ebf77d967 Frank Min 2025-06-04  1078  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
