Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE76BDDAB
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 02:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764729945; cv=none; b=uQnLjmW13RElAIeGl+nRu6/b4do1oXcd0SzOkJXJhwuw7/XxBngybxzHRHQ3kaE3/aClodcrWMVczLSxnt1Ek9chAp0TZ7NWP9PMu6w3tWtW9wKq+/bpcgL39FJzjZQIBvhdRf8E27/2hlo7a44XNPA+hFDE3pBGyCpqp4f6HHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764729945; c=relaxed/simple;
	bh=eSOA2cl8At24kximf3D+cznK8ohiNixNzeHTvphhdvc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lGpZaOjFiLynXcmAT2tvXeB4294GNKr22eMmaJ8dVeToPGDKAxWLSBc/UOmgRSjcY2XCLdvOIDPHiHn8UiowzE6wf9l4stiYmj5RVyKzo05F9ys6ql52/4GlLNn0vV4krqWNaBb9fGBNJqSEnHadeNC9DwwgFOm8qQ/5wC18CP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1Dvmord; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1Dvmord"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764729944; x=1796265944;
  h=date:from:to:subject:message-id:mime-version;
  bh=eSOA2cl8At24kximf3D+cznK8ohiNixNzeHTvphhdvc=;
  b=a1DvmordR3RqY6U+BF1DkMHbsbDEuwVIaUd0i5CMaivmRJqvKZf8cdmX
   ZAaOmbXNXsen5t5fRMkR5UbMDvPo2h+i+VoMjckUDtLpzXMW3HXpY35xN
   5+maVupbj8t3+Ys0xbU1QoVv4VU3Nzifbm+7xp08v2aqGOpcV36SzmkLB
   /dG/L3wegUc1kKWghgJPsguT13eT3sP8XBkVxrVUWZQ5y4481s7AcoXBa
   hbIokHrwY8r+tXYxAFRDvwEq57TC0yL9sYBD2lR7XcY2zOzoeLX6VEhuZ
   dgy6L/hNG/kD0ZTcslw5MC6xw/ISKfPwM2vWkQn8ufoHLumiNYFbZXttL
   g==;
X-CSE-ConnectionGUID: esf8akcJSv2UHGkaAuyTJw==
X-CSE-MsgGUID: k/BQvqd5TZeDqO4d+J09GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65719255"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="65719255"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:45:43 -0800
X-CSE-ConnectionGUID: eqqGrEX7QYS1Cc48LEGmDw==
X-CSE-MsgGUID: AOTuPfQwRaCsY2EDvPSmEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="225497044"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 02 Dec 2025 18:45:42 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQcs8-0000000032n-1Zg1
	for oe-kbuild@lists.linux.dev;
	Wed, 03 Dec 2025 02:45:40 +0000
Date: Wed, 3 Dec 2025 03:45:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sj:damon/next 58/155] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'is'
Message-ID: <202512030352.YKSRFhJQ-lkp@intel.com>
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
head:   03c935d3c4cacc96f6c2edefde3686669cba2195
commit: 76ba4814ec818fe2d77ae86f4fc14185ce99feef [58/155] mm/damon: add data structures for access check control
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251203/202512030352.YKSRFhJQ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#45: FILE: include/linux/damon.h:827:
+ * @matching:	Whether is is for condition-matching reports.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
