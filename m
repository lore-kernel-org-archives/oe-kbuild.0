Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B460E2472A6
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Oct 2025 15:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761148648; cv=none; b=L2svAJdrolPYwz98s1kk0gIDE/2s8n+MXZRBT7HaM/6DZPHVH+gQQmMxUwEMi1hh+KXA4qNPLfYDyMo4l44j6rwomuLqwBzTkKCg9nwtfGUmikW3KL5cFLtyvbPjXasdHtbghLfuHltF9jHqmTQYu0jjM8c6PkmzI0iqKh7TcBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761148648; c=relaxed/simple;
	bh=UsyXbY7aMRgcFb5C36Sp3Ukgxpm9Vt9EosgtUz5kB1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kLJkTwlsHjqsda3xqBdSQhCNPII7lpEAua7rriHSTghbx8kM97Ku1Ohj6g6cEbD1QeIR4Klq/D+bvDkJHBp91MieFQa+HhdPUAoG1JufWlFdy9J63mM3mY64ZU/GrM59RbBwOh7jiEa2FZF+7fEwEvk89o0EBUVd71rCJlrrDZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/K/5EGw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/K/5EGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761148647; x=1792684647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UsyXbY7aMRgcFb5C36Sp3Ukgxpm9Vt9EosgtUz5kB1w=;
  b=B/K/5EGw/tzBbmCtlD++bR2vjtzPA8z9nUC32LIacjHNBOdjrTSE/kbb
   4fKyiXpB9yAAJQoX+sqDy6PGM12MViOp2k5Qtkq4wFPKcfwAnHuQGwrUV
   K5MM1yWBasS/fX0y/tiCYM/0GEU5tozZFtGoAiDu2haMu1DZFsitJA1dH
   cUWX8b02jwIhLxVLWlYaXnCDFnsI84vKNUUUSaqGfnRx5cO6J015UB27v
   7SEfgnHqGU0u8wah9AS5FVK5Aq4lEoZG1CRYttoIl8QmieA5AveUamXl9
   0K1VaEnQlHhBITROm3Tj/QdUxtrqTFLX4qklORqTPeauPwMyHz3gz85Ly
   w==;
X-CSE-ConnectionGUID: Hpq+PhmwSaqP4MYWEXPnSA==
X-CSE-MsgGUID: 6qUtpw/+Tt+Vo8yV7R9weg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73906904"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="73906904"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 08:57:25 -0700
X-CSE-ConnectionGUID: 5JtcHH2BR+CjDy9HAWP8TQ==
X-CSE-MsgGUID: 4HBSSkOnRPytufF2PZZM3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="183497827"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2025 08:57:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBbDF-000CTh-28;
	Wed, 22 Oct 2025 15:57:21 +0000
Date: Wed, 22 Oct 2025 23:57:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1181/3483]
 drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:511
 ras_core_get_utc_second_timestamp() error: we previously assumed 'ras_core'
 could be null (see line 507)
Message-ID: <202510222308.6LSfjKDk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: YiPeng Chai <YiPeng.Chai@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Tao Zhou <tao.zhou1@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aaa9c3550b60d6259d6ea8b1175ade8d1242444e
commit: ace232eff50e8c898103c56b3b5303e776616274 [1181/3483] drm/amdgpu: Add ras module files into amdgpu
:::::: branch date: 13 hours ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-161-20251022 (https://download.01.org/0day-ci/archive/20251022/202510222308.6LSfjKDk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510222308.6LSfjKDk-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:511 ras_core_get_utc_second_timestamp() error: we previously assumed 'ras_core' could be null (see line 507)
drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:530 ras_core_ras_interrupt_detected() error: we previously assumed 'ras_core' could be null (see line 526)
drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_umc.c:210 ras_umc_log_pending_bad_bank() warn: variable dereferenced before check 'ecc_node' (see line 208)

vim +/ras_core +511 drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c

13c91b5b4378b5d YiPeng Chai 2025-03-17  504  
13c91b5b4378b5d YiPeng Chai 2025-03-17  505  uint64_t ras_core_get_utc_second_timestamp(struct ras_core_context *ras_core)
13c91b5b4378b5d YiPeng Chai 2025-03-17  506  {
13c91b5b4378b5d YiPeng Chai 2025-03-17 @507  	if (ras_core && ras_core->sys_fn &&
13c91b5b4378b5d YiPeng Chai 2025-03-17  508  		ras_core->sys_fn->get_utc_second_timestamp)
13c91b5b4378b5d YiPeng Chai 2025-03-17  509  		return ras_core->sys_fn->get_utc_second_timestamp(ras_core);
13c91b5b4378b5d YiPeng Chai 2025-03-17  510  
13c91b5b4378b5d YiPeng Chai 2025-03-17 @511  	RAS_DEV_ERR(ras_core->dev, "Failed to get system timestamp!\n");
13c91b5b4378b5d YiPeng Chai 2025-03-17  512  	return 0;
13c91b5b4378b5d YiPeng Chai 2025-03-17  513  }
13c91b5b4378b5d YiPeng Chai 2025-03-17  514  
13c91b5b4378b5d YiPeng Chai 2025-03-17  515  int ras_core_translate_soc_pa_and_bank(struct ras_core_context *ras_core,
13c91b5b4378b5d YiPeng Chai 2025-03-17  516  	uint64_t *soc_pa, struct umc_bank_addr *bank_addr, bool bank_to_pa)
13c91b5b4378b5d YiPeng Chai 2025-03-17  517  {
13c91b5b4378b5d YiPeng Chai 2025-03-17  518  	if (!ras_core || !soc_pa || !bank_addr)
13c91b5b4378b5d YiPeng Chai 2025-03-17  519  		return -EINVAL;
13c91b5b4378b5d YiPeng Chai 2025-03-17  520  
13c91b5b4378b5d YiPeng Chai 2025-03-17  521  	return ras_umc_translate_soc_pa_and_bank(ras_core, soc_pa, bank_addr, bank_to_pa);
13c91b5b4378b5d YiPeng Chai 2025-03-17  522  }
13c91b5b4378b5d YiPeng Chai 2025-03-17  523  
13c91b5b4378b5d YiPeng Chai 2025-03-17  524  bool ras_core_ras_interrupt_detected(struct ras_core_context *ras_core)
13c91b5b4378b5d YiPeng Chai 2025-03-17  525  {
13c91b5b4378b5d YiPeng Chai 2025-03-17 @526  	if (ras_core && ras_core->sys_fn &&
13c91b5b4378b5d YiPeng Chai 2025-03-17  527  		ras_core->sys_fn->detect_ras_interrupt)
13c91b5b4378b5d YiPeng Chai 2025-03-17  528  		return ras_core->sys_fn->detect_ras_interrupt(ras_core);
13c91b5b4378b5d YiPeng Chai 2025-03-17  529  
13c91b5b4378b5d YiPeng Chai 2025-03-17 @530  	RAS_DEV_ERR(ras_core->dev, "Failed to detect ras interrupt!\n");
13c91b5b4378b5d YiPeng Chai 2025-03-17  531  	return false;
13c91b5b4378b5d YiPeng Chai 2025-03-17  532  }
13c91b5b4378b5d YiPeng Chai 2025-03-17  533  

:::::: The code at line 511 was first introduced by commit
:::::: 13c91b5b4378b5d08dc9ae9121b1645a0beec0bb drm/amd/ras: Add rascore unified interface function

:::::: TO: YiPeng Chai <YiPeng.Chai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
