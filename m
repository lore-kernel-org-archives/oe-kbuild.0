Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D985C22576E
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Nov 2025 22:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764543444; cv=none; b=BinCQkO0Fbdjz3/Cxcs54P/RvdOC30Hac6WB2G8LK5w7t3CG89xe556OjTTvozym6Q+imcQPCB0eu+ZpcpFZnJ0OdkziJ5qcC5l+dNh25MScN0YBpChHUKbUAcIHckMjNCQA2RJwsrK7H9m6Ay/DECj6SEBl2ASBHro30VzpRcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764543444; c=relaxed/simple;
	bh=enbgwf/gHQvAguHG4GkyAbFjqZRRK0xyfitPFE2uZw4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oTu5xGB9RAdjnIGHdNZUbgW8YvVLbZQr0vMyfDNGa7Nv3eFmX7obKWy2ywEtHxsZM7TUnIUkXs74JBNpGmpY5c9DKCxAgKteeFPVCZqPw3wd0uqjZGPiChdgLFLFgorJGLlsmb9CIwXMqzAmBH/vGi9UnCRQJqmQudk3X5N3Z98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKYVNYOb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKYVNYOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764543443; x=1796079443;
  h=date:from:to:subject:message-id:mime-version;
  bh=enbgwf/gHQvAguHG4GkyAbFjqZRRK0xyfitPFE2uZw4=;
  b=KKYVNYObi7vTjlcA/sQKuRENDToEJqUedqu1Ndw1u9lUPzzTLUgGvqAp
   3w5BlsVx9LrQpS1HYcOmp2TeBfRfRGEvyhojYXc0/9VER5uTjZils+it/
   8fYQegCmqLzxmXA56B92GpZfw16koHl0f6o6kNpKWeO+RH/37E8mmO+jg
   nR0+0SnmiPS8yiLNGbcbzKHzyXXgYii3zAQfXxGVieNTqYkHumguS1qv4
   f8gQeMxkXjsYbhqPc1ONUtSfS7NxKx7Galk/wq4Z0zRSCFLUKUXK58vIV
   dMq0naAW9bu+/Xtij6lQQHjpq6+bTTs1LgP96nK1dyPnWww1XCTMRDaBt
   g==;
X-CSE-ConnectionGUID: RYbTO4toSqSyhgpAeAsuCQ==
X-CSE-MsgGUID: 1PTXh8WRR5KoiEQPnsgvjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="54032615"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="54032615"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 14:57:22 -0800
X-CSE-ConnectionGUID: eNApPHgES9GeDXdsh3BreQ==
X-CSE-MsgGUID: qt9p1YHNRg2YmZA2pOfXpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="199031072"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 30 Nov 2025 14:57:21 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPqM3-000000002bF-1HWK
	for oe-kbuild@lists.linux.dev;
	Sun, 30 Nov 2025 22:57:19 +0000
Date: Sun, 30 Nov 2025 23:57:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sj:damon/next 101/144] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'is'
Message-ID: <202511302354.DqVLZNpn-lkp@intel.com>
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
TO: SeongJae Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   8f9c0f9aadad83bda001012d5f2596c9261de496
commit: 655754d7b2fa367f7f76343942292377393e3ded [101/144] mm/damon: add data structures for access check control
:::::: branch date: 84 minutes ago
:::::: commit date: 23 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251130/202511302354.DqVLZNpn-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#45: FILE: include/linux/damon.h:862:
+ * @matching:	Whether is is for condition-matching reports.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
