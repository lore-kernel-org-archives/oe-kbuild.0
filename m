Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919C3364EAD
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613150; cv=none; b=uW4wpJgV/zoMdDAKAGPw8cEbiEG1aIX5XEr4WRsGNPmYcn/CAOaeV+TK/FIkChO80t++Iz/6R6h+5TwfsXdA/UAHBZs885A3zRoAwZc5/xAAACu32h9tqER39yu31n3liPa44QBU+Hct5N1zn8aN++/ofCgg1kJEoG54fWRYHw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613150; c=relaxed/simple;
	bh=P/EukEIUNc+hd85UcuUPNs2jwPdZHmXNl+c7Kz4gI4w=;
	h=Date:From:To:Subject:Message-ID; b=QBcOq+q6D9+eDr+i18kO9GSXXabgAU4UH2tnqXqQGqjm3rRkByjqo6g4wDNwi+cLlMVEp1/xnT5DahZzYt3ouXQTrO28jPrR4lMyZM6NiMfXjZaVKQuKP94nz+wW4ajvUSXrbR2wW5dmOQkR3lC+kyIlBM4dPuCMLms/O0T5YQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cfZCiJAs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfZCiJAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772613149; x=1804149149;
  h=date:from:to:subject:message-id;
  bh=P/EukEIUNc+hd85UcuUPNs2jwPdZHmXNl+c7Kz4gI4w=;
  b=cfZCiJAsLeJ4jh6jhA9joUQXsI6OUvtQKQShPCNbVhoh4cMGBuaSWdVl
   4PXY0xVvT3WXYzSEx1d4N9tzgTO3q0ONW1OGj8NUekN4ZT9xUUO5R9/gg
   IJVAt944sO3lckG+xINl264YDgFENTjHbKbV04KjZb2amNFh0mZ/J8AZR
   TjR3PX2cLyaNMSeKyHCzt8CjumW9wieZJbPgTagusauKdStMwEm3bn1e5
   0iy2RgngxCuB5xZPVPwDpXaM7ZuWcI6VjQD82YU74MeaTJSetPekboRvV
   jO5cyYfwzRxAGeJRPvKQe3Rs64dYnV6H2ryVEveK3ak1IZiKlEZmjPLKI
   Q==;
X-CSE-ConnectionGUID: uxlMu2FCQp+jGvVOUQ/E1w==
X-CSE-MsgGUID: gJbw4XV/TMykKhITfV50Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77536944"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="77536944"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 00:32:28 -0800
X-CSE-ConnectionGUID: ktAG135dQMKHeEc/rhU60g==
X-CSE-MsgGUID: ySY9pQysQBmw4y+5JxbifQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="217510620"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 04 Mar 2026 00:32:27 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxhea-000000001ed-3Xxr
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 08:32:24 +0000
Date: Wed, 04 Mar 2026 09:31:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [kvm-x86:full_nested_temporary 27/58] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'Nested'
Message-ID: <202603040901.5LoIQ5q4-lkp@intel.com>
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
TO: Yosry Ahmed <yosry@kernel.org>

tree:   https://github.com/kvm-x86/linux full_nested_temporary
head:   6e8bb9e6599afc125066ec2cf537d2d039cc8b71
commit: 0743d8ebda2e48ea69b6807e74a0e26a220e6e34 [27/58] KVM: nSVM: Add missing consistency check for nCR3 validity
:::::: branch date: 12 hours ago
:::::: commit date: 14 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603040901.5LoIQ5q4-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Nested'
#22: 
Fixes: 4b16184c1cca ("KVM: SVM: Initialize Nested Nested MMU context on VMRUN")

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
