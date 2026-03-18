Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B472DEA7B
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 23:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773876497; cv=none; b=Mriul3/Nb7mffxRY3bZBjLytTGF11bDMY20qCkykXaKk6eu2yj41O7u/6aRAUYQgho2UP+Ni1EsvVpvFAQF/DWIlQL6XE7jU8KVohvQHln5yNaswpOfJFYFEsS64v8vW0VWKhtWhDdcwlbZcIhDNw5/BClWckLZ6BuJahEzPNl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773876497; c=relaxed/simple;
	bh=pquH+cbtbhGOsv+tHP/RF66PBKqOpuIA9P3DrtNOQ6c=;
	h=Date:From:To:Subject:Message-ID; b=e/aEd9OMt6iVlKPzdoDeT0RSwvE9xsnf3xrXELHjh7zOKoGw/hiLdTHz9rm0lNyTJtTtesk9OnwZJxm2WDv5UT7I69XB9aspNjdD+6SvPzXA09KnhvX6+Zyg9mSr66Xg0tDwmOXPTfzf7XXfkXb6FzSjKlw/v0egO/zTVh3YAjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIjUtAi8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIjUtAi8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773876495; x=1805412495;
  h=date:from:to:subject:message-id;
  bh=pquH+cbtbhGOsv+tHP/RF66PBKqOpuIA9P3DrtNOQ6c=;
  b=dIjUtAi8pzvXZpIp1HImwbPn6rDMd+iYqnpWyssFBKvA/BrmI2/Sx1oD
   PBJk69YBv5WXoKpKDGc3jLb4papyQphwpYCCAHzlLBhhumumg0gCRp4ae
   3DklrzQ1E499q1k1hHZ3xAKuzEsVZWyimhKiSdqUvOCFOzR8CHd49q/5k
   BGPFWeXLowR6+Ry2zDeZiPP/HXTSJtxkxQ90Vg/0Ud3FuPCz50NDDIyv7
   NtmxPqNC3aCJaA6J8KFid9Nd86uTdnOmdPajrWvcgAbLj1Afre3jBM8KU
   3TxDQ8aeApmgMT3q7EVuEnOg3QIQt9YgbGqfr0v0QAETF698V6m8+zBA6
   Q==;
X-CSE-ConnectionGUID: cX7wY1eUSwimTr71HH95cA==
X-CSE-MsgGUID: k/fqbxQhTRGTdvVsXXKeFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75129767"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="75129767"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 16:28:15 -0700
X-CSE-ConnectionGUID: bj98DcgHSye+HMTBnYYs5g==
X-CSE-MsgGUID: 9Mwcb/qfS0qtrgPc/1+4rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="224825090"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 18 Mar 2026 16:28:14 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w30JA-000000004kL-204D
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Mar 2026 23:28:12 +0000
Date: Thu, 19 Mar 2026 00:27:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [norov:nt 15/15] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'the'
Message-ID: <202603190005.Gdn43b60-lkp@intel.com>
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
TO: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/norov/linux nt
head:   fa373e34dabe5be689241508a61ab3bd59de2901
commit: fa373e34dabe5be689241508a61ab3bd59de2901 [15/15] powerpc/xive: rework xive_find_target_in_mask()
:::::: branch date: 55 minutes ago
:::::: commit date: 55 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260319/202603190005.Gdn43b60-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#10: 
the the iterator behaves as for_each_cpu(cpu, mask).

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
