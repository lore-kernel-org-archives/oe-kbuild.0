Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA814358392
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 15:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712708; cv=none; b=dhAhXRqad6tdS4zp0gDeSifIzLbBQYxfZ2M+pAVk4jC+tr+a+nWzluzlxxn0SbsowP48t6/pmvHxkfg7p57RPkNvltv/2cppeF6EyVc65XxW1C6cphILTLJflrmc3zjtHyHwTCeupbtZPNl6hniK1rg0xKl3d+i7fV9sHKVN/gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712708; c=relaxed/simple;
	bh=/Mxe7V1s7xY6PqGiQ09wMtcs7TNrR4vnRv9nj18xW7g=;
	h=Date:From:To:Subject:Message-ID; b=JZJ9SUc0tJBZMV4Xpgs4RvnrPDGKkxnRfnQZmQ4hE3BL0+Aw6vHTSxa2ZdkDA1O02VE7Q+b3+apsh/FvRzWVk7OpXxuWgtaEi8ilZXOl0U31jHCf3hmQFUbU/9OyYtCTJmLnTOcJ0K4lecuVqcEae9DrLWkg629h4qEiFf2eQT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1CMEVtD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1CMEVtD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774712706; x=1806248706;
  h=date:from:to:subject:message-id;
  bh=/Mxe7V1s7xY6PqGiQ09wMtcs7TNrR4vnRv9nj18xW7g=;
  b=C1CMEVtDfXmSoXxtoXBdUnBPSwV0J21Pg0NWPWPwHDpKD4LKPeASEowt
   qQ4pA/+duB2Wpor0GSacS+RkV1NssTJQFJyqH6KveVG/KFoIFyTRKcrJe
   nQohBzPHer8fLIAAmmT/WBseHUhdnKYmaz1WsXYNuUtf4BMDoAqU/m4Db
   QrW4iS/MfiXnz+dZDW71Bj+7/Ib+w1ZEnmKDNUT/uky6bpUnuIm+vAM6j
   c7xwQPHD3nRmQPCru91cj9SWa4KktYkN7opuR6Gt9ncDZjv6U+UZuhoBL
   3qlCTspR2SMo7HXlmoObJOKKhCcXFMCA9wVQ7VjT/JjMd+nKxdDfOf98N
   A==;
X-CSE-ConnectionGUID: NV1XB/nNTzGay+2Wm1CKtA==
X-CSE-MsgGUID: LsaCdiF7TwWlRoA4jvvy3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75734579"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="75734579"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 08:45:05 -0700
X-CSE-ConnectionGUID: I/mFVKotTh2MnsEn9FCtRA==
X-CSE-MsgGUID: AFOSQYZ3RWek6WeA2sniCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="224779720"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 28 Mar 2026 08:45:05 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6VqQ-000000007hR-1Cpo
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 15:45:02 +0000
Date: Sat, 28 Mar 2026 16:44:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-stable 52/70] checkpatch:
 WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Luca Ceresoli
 <luca.ceresoli@bootlin.com>	[arm64]', should be: 'Luca Ceresoli
 <luca.ceresoli@bootlin.com> (arm64)'
Message-ID: <202603281653.u18S5Esz-lkp@intel.com>
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
TO: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-stable
head:   929cc1a53a6f5a09e78451ba359e870727751f9e
commit: ecfad171221447f3fe53f3d634765ef15d3e7232 [52/70] decode_stacktrace: decode caller address
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603281653.u18S5Esz-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Luca Ceresoli <luca.ceresoli@bootlin.com>	[arm64]', should be: 'Luca Ceresoli <luca.ceresoli@bootlin.com> (arm64)'
#48: 
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>	[arm64]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
