Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FC836826E
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630972; cv=none; b=gHAQdhxHCyABkziaT62idjvkhm7mJCo24dtxcIspZVNTmEA2Y4dEUDw9QX7MeGzK5EkLW8CN600u5pg3MW1t7bIZQTjYrrzXECk72/bk3+DWllIW8Qm/5Ralim7phFApVi70wV1tnR0rhopy0vJKhxd6dB9XPjhAvTyCWthQoCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630972; c=relaxed/simple;
	bh=BZsVQrfPezrISfjIh2NXO98pklwjWo+2XaBajJRpBp4=;
	h=Date:From:To:Subject:Message-ID; b=aNKyvx1EcLmpObHPMK/vH6bXnqB8mV1Yo6AeKQR/upBjngCqrpX4ZHE9FZ5CtDgQjB3Ik/9d27Ba1uG5kLkPv29ft4kqkU6XUTHSVeeW7nEvriitE/YeUfLecl3NmgABRE6Ga6Mbhy0T1vzdbKwG6YyYooChMaF2QjQBmdUR8OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2/CeM8k; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2/CeM8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772630971; x=1804166971;
  h=date:from:to:subject:message-id;
  bh=BZsVQrfPezrISfjIh2NXO98pklwjWo+2XaBajJRpBp4=;
  b=e2/CeM8k/G0EGCnxECRfDQIov7t37I5Z3O0sh4/0EJNGQ0+aId7G4BhB
   nZOA3vmoKyq/Vqw9qD5qtq12hZQVBgFullrDcKE3UbBTfRrPUSiWnPC63
   wWjqjmctplIxop6NJ+amqjUZiTqwrMWv4rTtbSQdG7+zo55X5DAcfMoqo
   NrSKx0f6cmIkIT2c0+Y+WX0XCLEUPMrFirATaVUr4073GXDoEFDe//qql
   E1Be7+V4svGCHNvkKvoRKP5gtH+zuH7VYvB8+0b/81X87X92Ynf0DkJJy
   EfDqBeuyONGPr6foV0/LuFpSVT6hedfw9dGCVz80mNxpt60Rtdzt8R8TR
   w==;
X-CSE-ConnectionGUID: 0I4PmzSySLaFq2Ylw5CUaw==
X-CSE-MsgGUID: VqOhRrZES26j8OClbpY6Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72714812"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72714812"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:29:29 -0800
X-CSE-ConnectionGUID: t2JcJlGyQgW9sEZrSTWI2g==
X-CSE-MsgGUID: F/ICI0bvQCGGLR3f0Xyk/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="241354902"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 05:29:29 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmI3-000000001ha-0mdj
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 13:29:27 +0000
Date: Wed, 04 Mar 2026 14:28:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal:dedup-lsb128 1/11] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Claude:claude-opus-4-6'
Message-ID: <202603041417.aZfb9IEd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git dedup-lsb128
head:   925cdd8d45fb4adec025cfe8e42abfa0dafa9a46
commit: 340fcb4bf8938a649242cde84aa7bafe17dd5325 [1/11] kallsyms: embed source file:line info in kernel stack traces
:::::: branch date: 12 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603041417.aZfb9IEd-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4-6'
#66: 
Assisted-by: Claude:claude-opus-4-6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
