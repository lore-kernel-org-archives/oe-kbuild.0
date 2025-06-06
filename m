Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0889220D4E2
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jun 2025 12:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749214429; cv=none; b=j45OGr6TKOoXYh6+6tf4OiN7DhMKwF6vIe5DLJZ/gaMlpgZ8+pMY86ReQNtS0olyO5p4vshKtDacNuzDKWLNIXgzbbJU+N+/NXK0K3GPVIE5WLBRs67zzzbiHad7eFKbOOOu1Ar87oN/waKFtxqt278xYiiPAdv5ZtrqoFedvkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749214429; c=relaxed/simple;
	bh=ZuYPFw47kgxfPJdJ3Fev+4ul695t8YdKF93HudzZykA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eJKKaAwQfkFpsRcX2/bGbjdNxxaRlCXFfF57qqxmb1mqTGnC4/oBK+AH21LPYYumZZNI7y82hkrdPqgchRECC54F4kDGNsIGG/q5W9dQGjW2ET4fg+QzCzdafOKg/AJUDAbuDycOaD2oHfPKvhjexOG52s85aP/jqrKRKLj/6cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EsMQs9KK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EsMQs9KK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749214428; x=1780750428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZuYPFw47kgxfPJdJ3Fev+4ul695t8YdKF93HudzZykA=;
  b=EsMQs9KK4fpJ7mhiKZfwtXSPgmj+fO+C6HMRtldpLf13RC38+emwG06Q
   NSY7WUY/5ZqPJbD95AN6Zp6BFZC7ymYyrgKWyEhiI14zQHRBITQP0Rf8B
   eEH4+bGTy23zL62e5BjRHRqI/TSHQ3tBMoprjXu3cbPXW1Aw242hMscYJ
   ejU1C7EyoCb2pFQ8Ma7YBYaM3KZT66IfMJ6reFa7btQYFZJjGvqrx+Oei
   09uQEANSxU60zWWdY/MGZogtdUrN7l3Z0oCs3TKqLzSNZIiY2Z7W/a2qB
   /aBT1d4F0Fms7fP5C3QNH2zmllhgkLH0x68HildcCddF2U18Xd8FBh2tT
   g==;
X-CSE-ConnectionGUID: Kj9IYTXxQyqOQz4QsYfLxw==
X-CSE-MsgGUID: fAbJmbzqRZOGwxOKu95yQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51508586"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="51508586"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 05:53:47 -0700
X-CSE-ConnectionGUID: PpAz22quRkSCAvChSLMorQ==
X-CSE-MsgGUID: r6J5PKhnSMmdW/m/23U8kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="146171427"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Jun 2025 05:53:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNWZr-0004zG-3D;
	Fri, 06 Jun 2025 12:53:43 +0000
Date: Fri, 6 Jun 2025 20:53:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [zen:6.15/zen-sauce 6/30] fs/bcachefs/fsck.o: warning: objtool:
 check_key_has_inode+0x300: unreachable instruction
Message-ID: <202506062053.R9Be25rb-lkp@intel.com>
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
TO: steven@liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 6.15/zen-sauce
head:   625fb48c0c4fab13b9c2f231c3fe6368a1b78242
commit: 490a2fd553b92e5ad5f151994a9bbf953cc000f7 [6/30] ZEN: Disable stack conservation for GCC
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: loongarch-randconfig-001-20250606 (https://download.01.org/0day-ci/archive/20250606/202506062053.R9Be25rb-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506062053.R9Be25rb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506062053.R9Be25rb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/fsck.o: warning: objtool: check_key_has_inode+0x300: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
