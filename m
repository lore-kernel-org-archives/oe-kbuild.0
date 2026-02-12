Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D702F069E
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Feb 2026 19:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770926261; cv=none; b=SF0jS/eIJmltfTDJRWglUvEnn6FvOJY24tJlR/nV+FWDGAmA+5n1cDyKZdKvpu/i4QZXSuF2C6ApWXhicgpv2veQNbPBGZr/VmFw+Cb/ksy2qwB6j1HCB0A3+8KdDVbR+/EIUBLmEb+hJmOfKEelqDmfnISR21xsvJNkqyxd6wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770926261; c=relaxed/simple;
	bh=gCQ3xBxqi5y2IoRqqgloHnAwRKKGdfye4oO73azt9qc=;
	h=Date:From:To:Subject:Message-ID; b=daK5/oiwL5Ajnj2lZw7ne5X/k30K7xzXA1K3UvcnZQuBIiash2Xyez0xnoG8StVLyiZWPQP1mM9UiatbJwJvm2DTXhdNYFY8tPJ9tVPBNO9xB0bc0wj6/d6eaOwM8JsJHfA+Gp37E/oKmuvHGL5KEOFrgeQCfDck0/oEA7FU1UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AtT569Id; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AtT569Id"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770926260; x=1802462260;
  h=date:from:to:subject:message-id;
  bh=gCQ3xBxqi5y2IoRqqgloHnAwRKKGdfye4oO73azt9qc=;
  b=AtT569Id9ouT5vhscF4ObIojnFaqm7ORKZMOuyv6dwlkU/4M0B1X/Pye
   iwSorJyL7jEZAuJqfwtVJkpVnjM2/HIuKl0fL87x8JzHiSNaqNtY0uJD4
   vXGCwQv9TyKVY0GFe/FwL+Oo2/xEPSZW1LEtvTFxtBFjU+STWy3/R9VLi
   vW92xKX/TEC78790sOU3h1nz0BJMN8SnX/lcBNlB/71WQ+VchVyhfbdqa
   VuZ5Q6Tv1Qq8xnytUod5wIzVXTKX4MmCJMGgsX188dCvlt0qizoyPlgbK
   ISwDjDGTQdjWAPjofldzJdIFyL3lobUzOz0DUxhOTvNgMMGEh7kmmmhBy
   Q==;
X-CSE-ConnectionGUID: 5ZqHlrhAReqLPTHk4uPWvA==
X-CSE-MsgGUID: HfIir7BBTlOOXNghIdJorw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="59680347"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="59680347"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 11:57:39 -0800
X-CSE-ConnectionGUID: UWa1CH5nRFWSE2viwehIvw==
X-CSE-MsgGUID: 5WXtQsBgR9GIjTwL4wCFIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="211794462"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 12 Feb 2026 11:57:38 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqcoi-000000001N9-1Uue
	for oe-kbuild@lists.linux.dev;
	Thu, 12 Feb 2026 19:57:36 +0000
Date: Thu, 12 Feb 2026 20:56:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [wsa:renesas/hwspinlock/refactor-alloc-buildtest 8/19]
 checkpatch: ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202602122033.9h15DZ3m-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest
head:   a43eaf586d906850111619cb60f049044e898e5a
commit: 56805220f514bf7f7a9d0bd8a584ed671692f360 [8/19] mfis adaptions
:::::: branch date: 36 minutes ago
:::::: commit date: 36 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260212/202602122033.9h15DZ3m-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#60: FILE: drivers/hwspinlock/rcar-mfis.c:94:
+static void * rcar_hwspinlock_init_priv(int local_id, void *init_data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
