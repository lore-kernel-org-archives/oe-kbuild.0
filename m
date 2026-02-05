Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83692652A2
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Feb 2026 22:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770330031; cv=none; b=bVZaf6ArE2YXfUCixLmXi0jQlK5bkm5L/0PTssA8wCToF89R3Fv6VcAAJkLQzOtQZXnD9+zq9RZZ/IYAdtdciKeLvImYoaYIpmx2jCOV326XuhPlxc4tU9OQD1RgPi4cSfem/Hy0tsLoM2u6Q4CF8hgkYeTC9I3qJrwzxIb9Twk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770330031; c=relaxed/simple;
	bh=ghU/w3MwxwFlscmiwxOZ0FK7wqoZXBIef7YeCl3oof0=;
	h=Date:From:To:Subject:Message-ID; b=tURMDSYZOCOtYPXW7krROTyrHRNrN+IoaNliR/fzOjCdqHX7BNXJgWrovZIOAjE9/Aa6gi8cnmTSB/SRU8ASs7dN9FTpwjDKMLP/DY1/2FT/ePRLBvY+i5oA8l97AFWebHPHura0cwe/kpnUkLBSWT64MowL58/1sGrRN6+bQCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3NhWth7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3NhWth7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770330031; x=1801866031;
  h=date:from:to:subject:message-id;
  bh=ghU/w3MwxwFlscmiwxOZ0FK7wqoZXBIef7YeCl3oof0=;
  b=G3NhWth7uRNEUdThZpObAKSpdGhZuMP+XCqtlA0LozOvKXe0bZ00ov8I
   NgODWGGdjDqbwLxTD0buOvyKz8J8k0kQZisHXM0Td90GCGo/h9v/9NIap
   2DR08oWdydvOVwySrXIRPKnDxstu0WTqHQ4CQw6O46QfrpGNz3SMgsvs+
   InT1CsqmhlNEZrmO7IkkzSNuW3jmJAnqg000m8Lk7XB2tk9fIPDfebZ3R
   cNQoYZ79tSc6OR9widH4LFbjkMDKghuTBSUmgUHbdSJ5q31syCD23zZNw
   U1eJjN8cN+wvBrSbtFNohdZCHJDfCQ+j+wklj20+ZjZ+Z88blhaLtsHJw
   g==;
X-CSE-ConnectionGUID: 7ZvXKIbMSCOXukAN9blDgA==
X-CSE-MsgGUID: /C0Yed1hQfu3kq1RC4r9YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="70558163"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="70558163"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:20:30 -0800
X-CSE-ConnectionGUID: zMZ7L13NS/ey4ykgdq/c4Q==
X-CSE-MsgGUID: h+/sDd6sS+qXbTLeLzU27g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="248297470"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 05 Feb 2026 14:20:29 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vo7i6-000000004Ez-3uuN
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Feb 2026 22:20:26 +0000
Date: Thu, 05 Feb 2026 23:19:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jic23-iio:fixes-togreg 6/9] checkpatch:
 WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Lukas Schmid
 <lukas.schmid@netcube.li>#', should be: 'Lukas Schmid
 <lukas.schmid@netcube.li>'
Message-ID: <202602052304.ewxfenUD-lkp@intel.com>
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
TO: Lukas Schmid <lukas.schmid@netcube.li>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git fixes-togreg
head:   4a2a522823b313f406bc985b761b237a36621cab
commit: 7ff3bb8a64fab62fb6b6273b9f028ff00b58f830 [6/9] iio: potentiometer: mcp4131: fix double application of wiper shift
:::::: branch date: 2 hours ago
:::::: commit date: 3 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260205/202602052304.ewxfenUD-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Lukas Schmid <lukas.schmid@netcube.li>#', should be: 'Lukas Schmid <lukas.schmid@netcube.li>'
#19: 
Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
