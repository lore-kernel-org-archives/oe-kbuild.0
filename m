Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDE511CBA
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 03:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764388505; cv=none; b=rl7D3AvQIx5zSf5Z5QCpE70BBBK8V+Yl8X1kX9tzxKW9hy4RhDRTpLI3XhcY5urYlDn8+vpkXOuftQJ6HOWbzIAZIfbfAjIYcX3aZhBRhF36xgNnmFey1WFYyktDroqpMPbrsF3kk63NRPIFyGpERsInUwkfpo+K3RseSVx/lNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764388505; c=relaxed/simple;
	bh=QvuvXQuHxzTAeEpWKPMS6Kb8GQCMotuvQN8K3GPRgDs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CJs02SpYHUZQZMCTNa9ss6LeNhX0XsC+GsjP9VgHfi4oXpO5SmkrHNBAGvpZtExDh7x7ZXUvnPlY7TBsu3c3yKAuyEvxZB8dUx8ZI2vHj3yvWMOsdGf3DzNE8GCAK04d+XAwW5eNsBSGkrlGOxUfHFOFcvUsNJecrsYwj0J1kao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6CQqJKu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6CQqJKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764388504; x=1795924504;
  h=date:from:to:subject:message-id:mime-version;
  bh=QvuvXQuHxzTAeEpWKPMS6Kb8GQCMotuvQN8K3GPRgDs=;
  b=K6CQqJKuZd9f0FHbOLLyONoHtzwHm5NHz6raASyCjEp9VXvaRZnrGvMv
   EeMxCjUlLvLsFD0yiPpqd9/aLklVwtQqNMefiT+7v3lX3PL5HKFzkNcjB
   lYRnnvYd1xWDHyIViBmoea7ysoagRoYBusclu/dmwuyiOqmVRmBUycyIk
   yu16ougVAetV/ncIyWwGvYH8aLNjeE2GiEvTgsxs0LRNHhMtk7/8mTqv4
   lt7bIjQqO2kTFMvftdyFg3B9uiaD3vFXFPgiCoBW20m37rVzT+krIxCnU
   pKpi7h96QSoitdaeZunb4iTFPPsPlbCdM/7vx6rEWtKDUG1Yvd6n73ZCb
   A==;
X-CSE-ConnectionGUID: BZ6+pbf3QcKs6nrYsRVo+g==
X-CSE-MsgGUID: 1iK2x955RR+m6z+lC7SFhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="77037862"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="77037862"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 19:55:03 -0800
X-CSE-ConnectionGUID: sfKxbrYdSiy7ju2Fiu2YZw==
X-CSE-MsgGUID: Wacu1TX6QteFrwUCG9xDow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="193484907"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 28 Nov 2025 19:55:03 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPC32-000000002Cz-3iYP
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 03:55:00 +0000
Date: Sat, 29 Nov 2025 04:54:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-unstable 54/63] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'Alice Ryhl <aliceryhl@google.com>
	[rust]', should be: 'Alice Ryhl <aliceryhl@google.com> (rust)'
Message-ID: <202511290452.QMGiJEHk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   3dbe36b3669050e710824973778b132414982743
commit: b56e14fbc22196e0098d39ee6e14680c0bd6f489 [54/63] tools/testing/vma: eliminate dependency on vma->__vm_flags
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511290452.QMGiJEHk-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Alice Ryhl <aliceryhl@google.com>	[rust]', should be: 'Alice Ryhl <aliceryhl@google.com> (rust)'
#22: 
Acked-by: Alice Ryhl <aliceryhl@google.com>	[rust]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
