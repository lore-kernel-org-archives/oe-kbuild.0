Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD143321A5
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 21:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907576; cv=none; b=NZQxacnWxXrrBkvHUGWh5bjWA7SAKiyL/Z+rCbuwDfXoEHeq9xNKwuebx3XGv7+e04ZyzorB8awuMSHeKm8FbowQVV7gHt6A1CAL7wrW73h7gqQn5yTN3LTBs7roYFXszW2InKsex2l9PiOiGtd2KnjInEAfRiElFksI25f/TaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907576; c=relaxed/simple;
	bh=RuDUsO0I+9BTKT+QluvqmmEA5y2W0lemDn4jx9+0R9I=;
	h=Date:From:To:Subject:Message-ID; b=QbVnodngs8nfJ9KSovSjsjjHeJqpkm9VNi1RWGak2b8R4jBChEXO/pjnfTPXENQ0vheOJ+LARHLK2+gtDH2L2e724tdiKcIH/Ys5pqx1xveiY21PDIUpPIvDpG5xVmrk/iTQMu48zOHdlvHyVnkQI3rjMbKEUDt4FbErtpTmjXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJq/u4Dy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJq/u4Dy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767907574; x=1799443574;
  h=date:from:to:subject:message-id;
  bh=RuDUsO0I+9BTKT+QluvqmmEA5y2W0lemDn4jx9+0R9I=;
  b=oJq/u4DyHYqFyHm8KsPMloK0UU8NPJC5QdOW1U2v3hM0G29+yUk2BbBJ
   3d8yrFwIU/BpZWJC+h1VpBWYbxIb0p2r4/BzgLiy+DggYgCk9GTsGyFkf
   YDMyJnh814giBMk+yKXQnZoAw7c7/ThIGuuTV+iyZL+POIoBxGWUU/xNR
   Z5CSzE2f9AFDSV2kdgqLknYwCaZLiLAXOZI4ibGbT1PWI3DI8Jahdpko3
   fx+ql3fbviyYtUjcicyAk2dUq0AymJ7n/9Mb4xWXnXmu6wt2piiQvM4d7
   BaN+nbEB3eznE2AvslNIogjrwHGxxsDNp9hA7RN6QoFVobUquCdrpZdIo
   g==;
X-CSE-ConnectionGUID: rO70et9ZRJOTNYQgZG1xOQ==
X-CSE-MsgGUID: QWG0wyDTTnW8VyZ4v4RfXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69367093"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69367093"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 13:26:13 -0800
X-CSE-ConnectionGUID: wiILXPq+RMWYZ9A/g6y8bA==
X-CSE-MsgGUID: 7D9Hq836RBGEgAeHokqZ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203325756"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 08 Jan 2026 13:26:13 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdxWE-000000001rM-33Tc
	for oe-kbuild@lists.linux.dev;
	Thu, 08 Jan 2026 21:26:10 +0000
Date: Thu, 08 Jan 2026 22:25:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v7 7/8] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202601082233.9MnUsecA-lkp@intel.com>
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
TO: Gregory Price <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v7
head:   354a292e4159ea3350cbb9653e8a16b0e34d04df
commit: 627e2779a7d3839cb83614b61a7b9759f4ace82f [7/8] mm/zswap: compressed ram direct integration
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260108/202601082233.9MnUsecA-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#94: FILE: mm/zswap.c:736:
+		struct page* page = (struct page*)entry->handle;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#218: FILE: mm/zswap.c:1583:
+		struct page *freepage = (struct page*)entry->handle;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
