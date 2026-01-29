Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9504A26ED2A
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 04:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769661415; cv=none; b=js+tmJL6WxGzVgw5sYyUV3q4nsyFSg33hSRGkOL1Fzl94CSiPjLnZGjrKBJrFTS6rlz2SLqBdLgraeVX216nFB+p/Ejns7ijLDs4JtSE2roC8pxYUt5eFN8LUXCpclArZeGPVc6O2CeNTI6r1D+QLTOitRTEWkWiKZozedSfRxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769661415; c=relaxed/simple;
	bh=8gYpN7WcwSDsTR0IpNl0PyWb4Wj++40GVo45EE/APYk=;
	h=Date:From:To:Subject:Message-ID; b=Ub0EDvi4CZAFAiMFThpXbSwCdXK/9gAcKYquv5wRQusQOuXY0/r9YuXDCHWir74pws3910V+uu2B4dBwOw6Q+JKwWnw1qjUGujqiXrZImiACR4Wlt1vLjZlOZWtqVA6RveY5MfyE3pM7Q6Lfcku6t9AU6SnXRARXsgOcf3shIBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nM+JoO53; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nM+JoO53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769661414; x=1801197414;
  h=date:from:to:subject:message-id;
  bh=8gYpN7WcwSDsTR0IpNl0PyWb4Wj++40GVo45EE/APYk=;
  b=nM+JoO53ETCi6m4DMrSmcxtbhE8G2P5wxeKv0SzAPtT8ubNJ3i6ZxhMa
   wWdu9xDKB9o02uD0ihGGJCPwIO/x4m+LZy/Xpasn5nys2iTiamhXQoTJ2
   hMODEeMuBk5aC2Bccvs3wbFgvXjeZrZpHXVvDhr6FQMrYWyVGkzC9IvJN
   HSSPfMFuIZ18yxSc89+9MIumU0Mu7cRQCeY4wkiHTOOqCJD9x4i/W3G7K
   AbvxHhGYp5xTCzGaSW+w3lwGQKQN+ZI+CYbfh748jz3oTtZ2lNbPGVhSK
   tOw3uHnVFuz8K1ThFuVdD4h6UsLQxlem5xKeq9GYflCP4NJVF2WWlctv+
   w==;
X-CSE-ConnectionGUID: jihkAkubR2CSEqB1vqaNvA==
X-CSE-MsgGUID: sXvwV2E5SPWzLpUWYiBCAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70795913"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="70795913"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 20:36:53 -0800
X-CSE-ConnectionGUID: 4r7++NjeQM+NUTjY6B69Dw==
X-CSE-MsgGUID: +pGx4o38SMm6w1+kPaXrvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="207700617"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 28 Jan 2026 20:36:53 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlJly-000000002Bt-1nrb
	for oe-kbuild@lists.linux.dev;
	Thu, 29 Jan 2026 04:36:50 +0000
Date: Thu, 29 Jan 2026 05:35:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 20/39] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'vmlinux'
Message-ID: <202601290539.ZZr6xOoZ-lkp@intel.com>
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
TO: Richard Kuo <rkuo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   64417972b86f5eb0d4a466436b1fb43da5692dd6
commit: 231618552e7c80d9c76c93ccf28a05af55b5ae39 [20/39] hexagon: update build system and Kconfig
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260129/202601290539.ZZr6xOoZ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'vmlinux'
#444: FILE: arch/hexagon/Makefile:75:
+	$(OBJCOPY) -O binary vmlinux vmlinux.bin

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
