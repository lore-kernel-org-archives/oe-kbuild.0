Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2981E49F
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 09:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259406; cv=none; b=MrTEnLtKtrARe0CxgqOJf9hRsiWdRDWIUiwMozCKPs8xDcq6WowMQMObBSqto3E+fXzfJCVs15FFZmvaF24eS3tLDdLREeeUAPjRbxiWwkQBbnmxJaF+b0Zx+1fqfcfQjP/2kevTebmb3omrksVq91+2e9FF0cjj8vuIbeUpgpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259406; c=relaxed/simple;
	bh=Xn6ENJjSjpLP5mfT4yENPzKJYK+U6khGyPM6OG3p6YY=;
	h=Date:From:To:Subject:Message-ID; b=JVQkbBUhHuRUdXs8nzhn1RIprAmc9ODGchlmqt2qRrHg+HA/iuVJhPpewiNsgGBoti9SlkYD+ZWMbEBHxfC8zOt9v9gJ71Q5kQm3Kmqrq7pK4PImd5zAb7KyciOMe475TYpKjp0CE02kaL+GNXECmJbWzyrIo2OWRvyO6SBeGC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dejo4dqc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dejo4dqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774259405; x=1805795405;
  h=date:from:to:subject:message-id;
  bh=Xn6ENJjSjpLP5mfT4yENPzKJYK+U6khGyPM6OG3p6YY=;
  b=Dejo4dqcRerO1Gtk1I1mkP99yc4tx6R74cN+9bOGg6tXxDFZeHxTPYOC
   reTV3By2SIHITknNWq9yiLpbCJdx4ixTlN1TqU9iv6rBvPeYmUDHWhhgb
   ZxCuBBSGHAMygg5fYh4LWbobGxi1XDkL/dnaGy6C/G6SSISdWMNjHyZdQ
   BYU1nj7LkM7uHWtlv2lfw16XDbWakv+ZVD0elEMBfSlOeFMWj7eGZGiyA
   2GcklKF47Vk5UszuXAei7V6/uLq0XS04MFnWuyRX2dwBwGd47VfsGHfVz
   PQjoS6zTJYs2l4gtpdlGyEXEEOI0n3expqGwzfkDUy0xoeCCZqZQdYVkT
   w==;
X-CSE-ConnectionGUID: csAG22IjQ42yMreyOGZsPA==
X-CSE-MsgGUID: 6RuAhCs/R3SapbDkfrA40A==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="77862517"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="77862517"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:50:05 -0700
X-CSE-ConnectionGUID: FclSJv7DSpuclQQk8dEE1g==
X-CSE-MsgGUID: /JE561pcSsq1UanjjrG4kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="219625587"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 23 Mar 2026 02:50:04 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4bv7-000000006bJ-3gOc
	for oe-kbuild@lists.linux.dev;
	Mon, 23 Mar 2026 09:50:01 +0000
Date: Mon, 23 Mar 2026 10:49:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v7.0-rc1
 7/13] checkpatch: ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603231009.ucY6hL9P-lkp@intel.com>
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
TO: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v7.0-rc1
head:   52ca06ec821a15f6eb90a9455f8b7602b67112f6
commit: f17e339825fbb61c773b80d2a6540a221ee41903 [7/13] fork: Dynamic Kernel Stacks
:::::: branch date: 41 minutes ago
:::::: commit date: 41 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260323/202603231009.ucY6hL9P-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#293: FILE: kernel/fork.c:362:
+static struct page * noinstr dynamic_stack_get_page(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
