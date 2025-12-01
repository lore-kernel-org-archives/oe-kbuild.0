Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDA2334C04
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 16:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764608070; cv=none; b=TNnJl/PvMEkxG6Zs+Smknr+iOgVfq0Fzu6Vd7NY47cUYlkh0hSdfSDiwhFtYvpk7dukPQTngq0ak6LgTIOFiusA2ErVeQftmweC7xYdoU/Buf9miwMbInfWBENmo+jsP/Fi218b5Uvd77T+QAhM4+LUjXgbn51HsC7+/Dwqw0Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764608070; c=relaxed/simple;
	bh=ySLaKS3i8caSGgqlmqWy2Jv7xDI+qqOcb14SCWfphJA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCimsyJcAMUgZO03jzIg6ZZeioJuebduDuMoBzVVRnVKxQUb20W+6li2ALnfidAyd5QH2TJcsVyuoi5jGU6ipe9NDZIuRBDTpuq7So2fEj/S1uHYIlSMLo7kaq8gf42+V2+rh0lhglzDkI9hnCsWHVBArToU8+ZJQJPIiSm6l6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKwpUXqw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKwpUXqw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764608068; x=1796144068;
  h=date:from:to:subject:message-id:mime-version;
  bh=ySLaKS3i8caSGgqlmqWy2Jv7xDI+qqOcb14SCWfphJA=;
  b=cKwpUXqwAdpFqhmZmcVPiOw/zM9/TjKY3VyUoXeETZ/2ujnq2Qut5xzB
   R3EQoWyMt0bXUGfwk6f6I74wcXchqz/Zr2/5czw0XQjpCayGoGirMcd5G
   vMoNoPSihjTUUBtI4uGUvrKVl4lJm6KTMZOh/xygqNIRDX5riJQYPa+Hu
   mcghzvWg0RxHrObZPesM7lZGsYEGcu2CZ6XjQAvzhbQ/JMsgB2XQoFkHB
   36qCQQPEqXypfprPT9Tmv+HoVdImJiXqSlBrK4Il1+2yXU96QeHNZXIFm
   7KOzqT8LIV6y3yJheMpH3Qo/d3VU5LNyJl20Q0mmFh5Udzyj697ecFAgO
   A==;
X-CSE-ConnectionGUID: /RREm9+uTy2ooqPmXlG8gw==
X-CSE-MsgGUID: kaDiS1xhTVyEE9v9OWxMzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="83946631"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="83946631"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 08:54:28 -0800
X-CSE-ConnectionGUID: hlEmt3kJS1+Yc6uP85ctqA==
X-CSE-MsgGUID: isq45xjvS6WxE9MI0THNog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194221425"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 01 Dec 2025 08:54:27 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ7AO-000000002hl-1sgC
	for oe-kbuild@lists.linux.dev;
	Mon, 01 Dec 2025 16:54:24 +0000
Date: Mon, 1 Dec 2025 17:54:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:for-6.19/block 39/113] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202512011741.CaitgCK8-lkp@intel.com>
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
TO: Keith Busch <kbusch@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-6.19/block
head:   d211a2803551c8ffdf0b97d129388f7d9cc129b5
commit: 262a3dd04e729386bececffeb095d31f7a9c43d5 [39/113] null_blk: single kmap per bio segment
:::::: branch date: 3 hours ago
:::::: commit date: 4 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251201/202512011741.CaitgCK8-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#6: 
Rather than kmap the the request bio segment for each sector, do

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
