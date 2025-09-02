Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D9F284885
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Sep 2025 05:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756792534; cv=none; b=gPTUBCuztcUfABoNN+v8YX/Jfja5dweZZ18OXS6bPOkTxhIj8PKvi5GKJyRa9LZbjr9slSft/p4aOpMYXZh3Pf7cHPiC1kX61xBDOsWdo6eOkPEpG8gpwXXU0o54f/4cf5FR9bMWFUcCz9pVBim1jJGmCHzFATc7hzQ53Rfo0fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756792534; c=relaxed/simple;
	bh=2wzZm7cCB2Hj4HATInhomzrVH5eyqaypKoH8HEJ4zN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lc+ioOF8NTKG0mZ4IpkVGgZ9xxdfx5QZkCxQ3OG/fJNMVsWEH7mziXSRigWEy02tkn2Trh37KFP8klxc7BbWMhNBn/Dj+eEWMS8ldy6qbG2hWsrO+Eq+B+ldSDg1k3wEopS2DUAn6N+nimaihB961a8PERanhjxc7XWIwOqxQaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KqQw0pAB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KqQw0pAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756792533; x=1788328533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2wzZm7cCB2Hj4HATInhomzrVH5eyqaypKoH8HEJ4zN0=;
  b=KqQw0pABfC1FjqlN3mRz11NlRxFD+NVxYk6I/V48wPxhNF3L5yilR979
   A8vln37jt5LQIee8fOPJoz9HZNcyykVKvgC0fBosrT0adQMmglITP2Qoj
   lvzPpbG3FkMtlZo0GNAfp0ENMt9ZwbQgXTs8qa2t868USOxgKaIlg1LtF
   usVZVdY3Pgq3bWgtjTVLvRXZSqkCOe6geQdJ8ULmqlDaUAjZWdr1DeGRu
   lyOn5IlcU8U52CrpDX6swe6DEcKW5dPsi3oY/LMveNkEU8hq56xu/Wisu
   A91Th4h+7quHJLLW9BW5NruKL3gt/kzzg7uJ622dgthL6RLVxdeE4eMxo
   A==;
X-CSE-ConnectionGUID: j0Zf4rFTRQmeDw1qUykiXg==
X-CSE-MsgGUID: +6uKPSnWRM63BiCqtzAcTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="61687762"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="61687762"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 22:55:32 -0700
X-CSE-ConnectionGUID: u6MeAXQRTfqr7QVdUdF+hw==
X-CSE-MsgGUID: SJdGlk8QT2y/uiUe7oyYJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="202125668"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 01 Sep 2025 22:55:31 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utJzN-0003Ff-0k;
	Tue, 02 Sep 2025 05:55:29 +0000
Date: Tue, 2 Sep 2025 07:55:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [anolis-intel-cloud:devel-5.10 1/1]
 arch/x86/realmode/rm/../../boot/bioscall.S:35: Warning: found `movsd';
 assuming `movsl' was meant
Message-ID: <202509020756.w0LBsJz1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: aubrey.li@linux.intel.com

Hi John,

First bad commit (maybe != root cause):

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   119e72f374248c57f950f0658c1e1099b40e2ffa
commit: fdc9c3cff9e213e49429bc07db4b7a503713eddd [1/1] x86/build: Propagate $(CLANG_FLAGS) to $(REALMODE_FLAGS)
:::::: branch date: 2 days ago
:::::: commit date: 4 years, 4 months ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250902/202509020756.w0LBsJz1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020756.w0LBsJz1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509020756.w0LBsJz1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/realmode/rm/../../boot/bioscall.S: Assembler messages:
>> arch/x86/realmode/rm/../../boot/bioscall.S:35: Warning: found `movsd'; assuming `movsl' was meant
   arch/x86/realmode/rm/../../boot/bioscall.S:70: Warning: found `movsd'; assuming `movsl' was meant


vim +35 arch/x86/realmode/rm/../../boot/bioscall.S

7a734e7dd93b9a H. Peter Anvin 2009-04-01 @35  	rep; movsd

:::::: The code at line 35 was first introduced by commit
:::::: 7a734e7dd93b9aea08ed51036a9a0e2c9dfd8dac x86, setup: "glove box" BIOS calls -- infrastructure

:::::: TO: H. Peter Anvin <hpa@linux.intel.com>
:::::: CC: H. Peter Anvin <hpa@zytor.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
