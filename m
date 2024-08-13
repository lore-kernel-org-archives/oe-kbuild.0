Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22481E86A
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Aug 2024 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723562433; cv=none; b=ZwuQzrxD42bXRQJAl/bJq79fbjs4B7ON7R+Dy77Peu0IRfMXEwr7kQQSuxcU/I/0cOKJSnYNUaisOUEdSJ5KPSxCMp5T7GWYrj4zPXPEZjVCR0lrH1mEet3JH/0hLJ3rEgXgTer/UOabVcI5U15bYcLDfcq8nENcIG3zKIZAaUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723562433; c=relaxed/simple;
	bh=DHpQoe5wsOVuuCO+3X5inO2e9Z8k7YLAwqmtx/JI4D8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LPTtcfSCfLAHJca3xWasqA56cI7g/yLKpdmH19EewHcF/8iMqAgYVRRoT4HRtydGLG0fZd2eLhisnGVP/32ub/KyTAHPAuYFJQHXE6QsvPLjuZm77/QdmdfpQcRgzMq/uesk4hX5dzgrYOvm9Mu3sobJqGRon3K1cpfyhGn262U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aptDX+Ce; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aptDX+Ce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723562432; x=1755098432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DHpQoe5wsOVuuCO+3X5inO2e9Z8k7YLAwqmtx/JI4D8=;
  b=aptDX+CerSp+yTwI/143yVCEsdf51BoV2rQyOLsPo2HcfdaiO0UTdiN6
   uY6KgmL/Th0Pup7CqjN8aKiHeVEq1v98rZRmd+hPt/BNO+UdDtk+EIdPe
   FqFj24zrtbK7V15hhe6gU7XSuJUlBRYjFYtU967j7UNu98Vcud4KFnsRQ
   rVdblcu7CtjWbY4u1JjocAWtDS9VBzzNttjLp/BcBtmSpasDRSE89ruzt
   2pyEZSBhdJ+U26gJP4T3DQCLttqbap4FTku5FbwF++lWMPP+59nos5haY
   VpUsFogy6kC8CcXQDIHANC0Qk4Ve8Uob9xRJX3W26y9GCIFmLvwOnl2dF
   w==;
X-CSE-ConnectionGUID: /p00ZpRSSKeJW79RIpjEQQ==
X-CSE-MsgGUID: pgaEjJheTgqkcBZQKxthlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="33137318"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="33137318"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 08:20:31 -0700
X-CSE-ConnectionGUID: KUx13A2nTteZCsbeEsf6Rg==
X-CSE-MsgGUID: D2yCxe79TVydIAwhNVa7Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="59259914"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Aug 2024 08:20:30 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdtJz-0000Xq-1j;
	Tue, 13 Aug 2024 15:20:27 +0000
Date: Tue, 13 Aug 2024 23:20:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/amd/amdgpu/gfx_v12_0.o: warning: objtool:
 gfx_v12_0_ring_emit_fence+0x78: unreachable instruction
Message-ID: <202408132304.PScylvQW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Likun Gao <Likun.Gao@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d74da846046aeec9333e802f5918bd3261fb5509
commit: 52cb80c12e8a647aa9c903903d58916e6c1c4d38 drm/amdgpu: Add gfx v12_0 ip block support (v6)
date:   3 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-r131-20240809 (https://download.01.org/0day-ci/archive/20240813/202408132304.PScylvQW-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240813/202408132304.PScylvQW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408132304.PScylvQW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c: In function 'gfx_v12_0_init_microcode':
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:422:54: warning: '_pfp.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     422 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:422:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     422 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:429:54: warning: '_me.bin' directive output may be truncated writing 7 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     429 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
         |                                                      ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:429:9: note: 'snprintf' output between 15 and 44 bytes into a destination of size 40
     429 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:437:62: warning: '_rlc.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     437 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                                                              ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:437:17: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     437 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_rlc.bin", ucode_prefix);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:449:54: warning: '_mec.bin' directive output may be truncated writing 8 bytes into a region of size between 4 and 33 [-Wformat-truncation=]
     449 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
         |                                                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:449:9: note: 'snprintf' output between 16 and 45 bytes into a destination of size 40
     449 |         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", ucode_prefix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_0.o: warning: objtool: gfx_v12_0_ring_emit_fence+0x78: unreachable instruction
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_0.o: warning: objtool: gfx_v12_0_ring_emit_ib_gfx+0x3c: unreachable instruction


objdump-func vmlinux.o gfx_v12_0_ring_emit_fence:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
