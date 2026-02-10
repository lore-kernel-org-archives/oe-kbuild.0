Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FD036C0B5
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 14:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770732983; cv=none; b=UFYZhFB+UBGhhC34flGbxDs4EbTtrU2ujf0IPqpljFJ+ahVrenNZmfK08SrL/rbiQPDYBhiKIOrMM28cVo4R7asUIPiW8CHpsRA7JcsR0dEDGDYI17bn8o2jVfv/hdSEbtTUdmjaCjTEE+B1w5bZDg1+8djISBjkl90/PQYlPho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770732983; c=relaxed/simple;
	bh=fNH2m9HsU+/MY/f8yQClqW+kga34CnLE16OBnaQiraA=;
	h=Date:From:To:Subject:Message-ID; b=eKlsLGtW8FeX2ej0SIfHDeJH95s+PNyQ53R/xTiuD6B56sPfGwjyOJQIAQCnBuOuUz4zw10KoIflily1Xue8IPIUmNjRCKkqu1j0p/JNLceZ7qhAB0ckt6m+SI1H/8A/F/yn/K0QCki6FVWK71vp72N7TCho1DfUsq7lyChW1rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eOLVv2xD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eOLVv2xD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770732977; x=1802268977;
  h=date:from:to:subject:message-id;
  bh=fNH2m9HsU+/MY/f8yQClqW+kga34CnLE16OBnaQiraA=;
  b=eOLVv2xDjhVsFvs6Lf4w7wT4x//0OrEaadmJJVwbp7DGrERA475z7lTV
   Dy7dOaywoFRcLVl2XHPfI7OqS0Razcu8zegILNpAZP5J6jBdVuX9QQOen
   7V7U5XXC4AX9ZCpFqiF0Cva1RNTQVKulT6GOix2Sts1GHEMn4fcWekqOy
   Ufu4076FetHzBWwgL0YnUCint3HNewRmUiGxonAd5xAW+I4lpByjQTmVD
   9jSPRVZUsmTOdJAIIAzgMmz9jltRuTN7F7bmaGZgo/r6xYQYptxRcox1v
   YP5ONbNwg5U2iq7OCj/tZjVMJddnEE2G+bH23foDXb/XKjAMkM0yiMNz2
   g==;
X-CSE-ConnectionGUID: JB/g4cydRjuRYpygR4WJAw==
X-CSE-MsgGUID: DqNOGbm8TFisspT9uaocZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71964390"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71964390"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 06:16:16 -0800
X-CSE-ConnectionGUID: mTrthURsR+2DcA33hqvY0w==
X-CSE-MsgGUID: bj9uhKV8RCaNgz3+XzuGIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211425127"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 10 Feb 2026 06:16:16 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpoXF-000000000qj-3Bx8
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Feb 2026 14:16:13 +0000
Date: Tue, 10 Feb 2026 15:15:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-stable 323/326] checkpatch:
 WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Andreas Larsson
 <andreas@gaisler.com>	[sparc, UP&SMP]', should be: 'Andreas Larsson
 <andreas@gaisler.com> (sparc, UP&SMP)'
Message-ID: <202602101514.F6fIMr0J-lkp@intel.com>
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
TO: Qi Zheng <zhengqi.arch@bytedance.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
head:   fb4ddf2085115ed28dedc427d9491707b476bbfe
commit: 086498aed3f68febb58df7e6141962942abb8944 [323/326] mm: convert __HAVE_ARCH_TLB_REMOVE_TABLE to CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE config
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260210/202602101514.F6fIMr0J-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Andreas Larsson <andreas@gaisler.com>	[sparc, UP&SMP]', should be: 'Andreas Larsson <andreas@gaisler.com> (sparc, UP&SMP)'
#19: 
Tested-by: Andreas Larsson <andreas@gaisler.com>	[sparc, UP&SMP]

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Andreas Larsson <andreas@gaisler.com>		[sparc]', should be: 'Andreas Larsson <andreas@gaisler.com> (sparc)'
#20: 
Acked-by: Andreas Larsson <andreas@gaisler.com>		[sparc]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
