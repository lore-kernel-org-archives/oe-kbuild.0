Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC49366DC1
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630974; cv=none; b=EL7Ti0UNPko8IqBqSTnguMwiubPzQwEeShvd3gEbscHQHHeHy3Tj3HtKYxZ2h+Oxb3VG7qBazPP2N8HQSdWqeQaP9efDWdPqbqbbdJ/j4eY5YH6nCwY0l4CjONDILqoSJHgyrBusVrzCf7QIsliOfZGthkxUXk8oirGJ1+spQTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630974; c=relaxed/simple;
	bh=1ESBBXI6gNn8TiT5+x7pnEsrl+UHX6wq34SECokyLQ8=;
	h=Date:From:To:Subject:Message-ID; b=kSbg2XtNqTE2hEcnRubxaVJVqURWaDpC/SpyjZ8C8TNghBKadWZcOlRiMk7yF2UUao7J6SehnCeHhDkl5P2pdevzAa8qqSE5W0yhLBgTJSlUl+hOyDTTmac0ioxNPareXXHg1NymMkCcoHh2CVI4MUmvBrzLFuxE5jSpssnxsKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/9xtl6Z; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/9xtl6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772630974; x=1804166974;
  h=date:from:to:subject:message-id;
  bh=1ESBBXI6gNn8TiT5+x7pnEsrl+UHX6wq34SECokyLQ8=;
  b=E/9xtl6ZO978NEU8NKXysZbX6FV8E4pYqt9RVGQ5mqEEbyPXj3Plj77s
   fOGyOdNbMUTPYz00ti+0Kn5uw7il+ScHLML/dJqQUsaCu0Rzf9xh/za5D
   iYEZrTAwM3iYQB5dv4pofWux8l9DzeexTTqwprAWmUQJmTT+s3OxTaVpE
   4XBk1PfrlVi/SzqFCfjQpP7hi0EUEQa0tPPKKhYp7ffv0Kq3HIBxx/C06
   XvOZqx1764LhE9XCYgrQuS0oFMLOV47DBJJNuPISWVErxuBl8Z1Mho46X
   KEgh5Ej7KY77tRjHVnFOD8cSNZF1qxqgCxtRHWSu4t317FzcUSOUkyxRQ
   g==;
X-CSE-ConnectionGUID: cnLpRCuxTVa5bOjlF33i3A==
X-CSE-MsgGUID: 7SVKjbDHTEi3xq73qkSR5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73816012"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73816012"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:29:30 -0800
X-CSE-ConnectionGUID: dyGKctp1SBaFt2O9FqkBJA==
X-CSE-MsgGUID: SEHtVqorSNCw+2BwQvi+zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="216653448"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2026 05:29:29 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmI3-000000001hj-1GuJ
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 13:29:27 +0000
Date: Wed, 04 Mar 2026 14:28:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal:dedup-lsb128 4/11] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Claude:claude-opus-4-6'
Message-ID: <202603041425.nGzUKvJg-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git dedup-lsb128
head:   925cdd8d45fb4adec025cfe8e42abfa0dafa9a46
commit: 89a448ce19f91acaa9ce8d075adc279bb22a0838 [4/11] leb128: add shared LEB128 variable-length integer encoding header
:::::: branch date: 12 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603041425.nGzUKvJg-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4-6'
#31: 
Assisted-by: Claude:claude-opus-4-6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
