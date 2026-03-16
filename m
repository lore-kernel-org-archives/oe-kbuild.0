Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62E33EFD14
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Mar 2026 19:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773688073; cv=none; b=SEPaIOP1bPH9/gvGhZpChu+2D3BZYjC0eOZOfdsm1tVKmSx/j3qqMr79lMJb6oE/Ck3vNBT8M6nG8hIA64Ieazk5E/v1mbLTUHF42ZewsXZQr4loydM99UtANCgS1TcrnSvX+EmP53o43w8YtokGfFmXQwvA4q8vMv2n2wGzJTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773688073; c=relaxed/simple;
	bh=fjaAtgayrA8Jzez8lMMH6Xol3D8qTIo8aTPIgZYIyMY=;
	h=Date:From:To:Subject:Message-ID; b=E42cKvyZhsqEAZ60FHGWDS45fRv7G5lWbd7fO9sKECchtrH/eflI4DmXkLJNrPkbwNjKaNJJjHnloM7twx6w8dpfTgFhgc9XHgSHgjoLKhkiHvTfDa6Ar7bVv3RFgxH87EMkNo9ikxOlmc6n/GIjCVHK+lGguef7Dj0AGn+OLbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WqKK6Xy/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqKK6Xy/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773688068; x=1805224068;
  h=date:from:to:subject:message-id;
  bh=fjaAtgayrA8Jzez8lMMH6Xol3D8qTIo8aTPIgZYIyMY=;
  b=WqKK6Xy/cIwzThOsKsDbmQaamyjYBIf+oE4lsN1plYu5Zj0pPn/Q8OdV
   Ba4MjXCousnVgLimpq76pSCYVyRROdphpAxLEWcYIVv4PK/EBb2On2lKv
   cr7aE8L8hEZX5RrbhnZ1Vrp/kwTYqn+eSKS31VvBjGwKZf3EeqTOrpHO2
   Vm4ZqV5NRoiXBFKjGRXfiaeGsbdFH8Tce9WV19WutXl1Ajt4+9Olt+G1B
   Yr1eNkDYbiUtI1dEa5J1QhqdmZ08n4JGn3BsC7sITvQ8oC/gfJ/uI5vTe
   aDKUDj1aXbnj+tVZWVpY9KdfW3HnMpbbZQf78KhRiW8qreb4tMt5/63Pd
   Q==;
X-CSE-ConnectionGUID: WClIiehrTjSi1dTrCL5zvA==
X-CSE-MsgGUID: 7JpeG9S1TBSYBiYvGaUl2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74829854"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74829854"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 12:07:48 -0700
X-CSE-ConnectionGUID: Rpws6+rwR9WxEmr71Zh78A==
X-CSE-MsgGUID: dDaf1+55SLKj7hMuVaUnxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226697258"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 16 Mar 2026 12:07:47 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2DI1-000000004Gn-1fPw
	for oe-kbuild@lists.linux.dev;
	Mon, 16 Mar 2026 19:07:45 +0000
Date: Mon, 16 Mar 2026 20:07:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-new 374/397] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'to'
Message-ID: <202603162048.4ZR4hTnQ-lkp@intel.com>
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
TO: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   5d685d9c3e4de680a8771e81a493711547905a2b
commit: a18d1a7d65aa6554b311887663ce928a2f2a97a7 [374/397] mm/vma: add vma_flags_empty(), vma_flags_and(), vma_flags_diff_pair()
:::::: branch date: 30 minutes ago
:::::: commit date: 30 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260316/202603162048.4ZR4hTnQ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#24: 
  and appended to to create a new vma_flags_t value, with additional flags

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#68: 
The series mostly focuses on the the VMA specific code, especially that

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
