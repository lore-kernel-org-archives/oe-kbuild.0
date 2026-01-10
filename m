Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C713219F13F
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 06:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768026755; cv=none; b=poJwaBHkaGgAE5Q3wD0YipGqG2E3USWA7ENnHHiPhEe+5F2tNvpk4iWykKuKhBj5VQdW80C59UD6YaNt4ZetohX19gn7VyPx7pm6ok16eDzlo0viYFOZqqiIcxI0YxPUVxudDg6kZw6ZVejh/CKmTuht/MS1PLaYsj+RRyfmCnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768026755; c=relaxed/simple;
	bh=6X5r+nOmi91zC7I3ob4tFlyELimEfAKX2QXlmN7jnmU=;
	h=Date:From:To:Subject:Message-ID; b=f/f5qCz3blFodn72hIgeECXFip9kcZBtQfz2jidOInlrd5xCvKHjj5+VJmrllLq8Z1CUXLs4+ZYR2rKIojWMGU1JAfJz9JmU3py31VZJQ1KuY+WLXfgrkd6xDCGy0ySb7B8pq3eQflRcvtbC/7NCo+xRk0q59H6GIWGZzE93XM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bc1Oct7k; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bc1Oct7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768026753; x=1799562753;
  h=date:from:to:subject:message-id;
  bh=6X5r+nOmi91zC7I3ob4tFlyELimEfAKX2QXlmN7jnmU=;
  b=bc1Oct7klgwY081KG4qi+Q4gGbJ7EDHjAdX30QYVkarcIO09ezcYYiO3
   z0J6OnIGeHDIN933WrOoAggx9mPjLZtaOsmr9+Jh1E816rGNtxm5q7x/w
   WrCt8HBFqLoD57100tEKh41YRgRwqSeDvUYY3g8MZdKEXbXSStrlvWHTb
   5/fyCnRhnYoNbKx5AFeRue86wHSWJ5WcdGbnunxAfnSh36swQtxl6evhf
   IRpLxuBkAkKVwzHZa6NKOlxBeQq/YPSoIMsG+QvLFYSE43POcVkO+y2VE
   as/mU8qXBbxjvChqfK7SuGM2PftgxAmTQkMaegFeFIl2aXtOIWYyUqNil
   A==;
X-CSE-ConnectionGUID: xmALDa4ISiW4ihxztVkIwA==
X-CSE-MsgGUID: jap0vlYNQPaOsKpIDMl8ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69445674"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69445674"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 22:32:33 -0800
X-CSE-ConnectionGUID: xEfh8oDOQve4gPyUuywqlw==
X-CSE-MsgGUID: uIGGYujcSpeeGcPBRpOodA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="204066681"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jan 2026 22:32:32 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veSWU-000000002HK-1N9w
	for oe-kbuild@lists.linux.dev;
	Sat, 10 Jan 2026 06:32:30 +0000
Date: Sat, 10 Jan 2026 07:31:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 1/20] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'and'
Message-ID: <202601100714.tIrfpwde-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   4398719b8c5fadb107fd2d4e44637d36a5d5ecc9
commit: 16c8fe78bb6eca8367b29c584ca0aae2fb66dd30 [1/20] HID: add device IDs for Apple SPI HID devices
:::::: branch date: 11 hours ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20260110/202601100714.tIrfpwde-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'and'
#7: 
SPI-based HID devices and and Apple keyboard and trackpad devices.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
