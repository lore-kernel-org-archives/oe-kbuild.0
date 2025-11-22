Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB22E2135AD
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 00:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763772086; cv=none; b=AUL8vtehZefE+0Vy8mT9yPlQVZAPNjjcFBHgG82FwLk/JQxr1/dm9PQhqA0pxlgSgQT2uSPv5wJFkHoT+PKyqNz8Bj0AOxINQDXv72N4P2vgPXbdiuLg6vuEtMRcBIyk8tWnCu2R+Vy4FqHH+toF8vmzYVHi3uLcz8rbMMNBhrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763772086; c=relaxed/simple;
	bh=nX0A/xump7ubahyERmZ1J+y6JKA4iTlMzqhSJ+m6YhQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WBV1m7UZVRRZTY/1i3LgB1F2pVoGvhN7BzyH6SqrobpBLhsXG45vGq28uX47rBygFfAyn1GEMLvyzXrtZbBk8+thXAex4gEL1BcipE3wdbqaG6zG2aVdlw7s1YwPLeQhtagQrtvrlHZmwubhSOOK1AF5IC+udUfCFDZJQjj5xA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Afjqp7uQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Afjqp7uQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763772084; x=1795308084;
  h=date:from:to:subject:message-id:mime-version;
  bh=nX0A/xump7ubahyERmZ1J+y6JKA4iTlMzqhSJ+m6YhQ=;
  b=Afjqp7uQstePclAm+HQnyjTso8hX470AMUZ+xuI947Fw87i3D8oBYa4/
   vPqdjmPel3e226e1T4W5+TVbUSt+CHNO7xKoLHWWoe0S8yv3x60VbggiU
   Y8tHMc5AhKwI/rvUlgSnZxqujhMoFp41/+1hJteUrEYs/rkFmSJyGEIBh
   OuxcELs49sO4qwJOJYnGAEk3roVWSyJS2LRR029JoTsd6vKcXAiJ8veOq
   zbDWpWRGhNVEIch9C5TqcgCfIGpUi8FvPbn12wqFq/JTy8tGbzS7KQLGe
   yh9bWxW9Kw0CR3dui2sTD/LA+P4OQDGqShYsynl6vYEqpiIbeSj1HQ5Q6
   A==;
X-CSE-ConnectionGUID: 8yYp7tLLS3Gf1gHDDhh/BQ==
X-CSE-MsgGUID: 8DfZl3qySmWkQClijFnlAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65568575"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="65568575"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 16:41:24 -0800
X-CSE-ConnectionGUID: FSIab6aTTBybPzMKStgEbg==
X-CSE-MsgGUID: S6yt1JD4RjmeYwBHRh9gqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="196962552"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 21 Nov 2025 16:41:23 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMbgm-000000001yZ-2wjE
	for oe-kbuild@lists.linux.dev;
	Sat, 22 Nov 2025 00:41:20 +0000
Date: Sat, 22 Nov 2025 01:41:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Markus-Probst/rust-Add-trait-to-convert-a-device-reference-to-a-bus-device-reference/20251116-012949
 3/4] checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'type'
Message-ID: <202511220102.VcRfhO4B-lkp@intel.com>
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
TO: Markus Probst <markus.probst@posteo.de>

tree:   https://github.com/intel-lab-lkp/linux/commits/Markus-Probst/rust-Add-trait-to-convert-a-device-reference-to-a-bus-device-reference/20251116-012949
head:   52d5d4a8ec758a1daa8c74da33cbdc0259c1135e
commit: 54247fd0b7b1c5addaff2c45ef797917e1fde768 [3/4] rust: leds: split generic and normal led classdev abstractions up
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251122/202511220102.VcRfhO4B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511220102.VcRfhO4B-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'type'
#111: FILE: rust/kernel/led.rs:303:
+        type Type;

WARNING:REPEATED_WORD: Possible repeated word: 'type'
#320: FILE: rust/kernel/led/normal.rs:13:
+    type Type = bindings::led_classdev;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
