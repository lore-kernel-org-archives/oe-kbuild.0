Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB6813AA2F
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Dec 2025 16:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765212830; cv=none; b=TUcEfcF7L1ihsicjdLAbPwhdeB4y88LeivcpVxCwr6dizUAWA/X61ZGABhR3sNcsdL6cVC1eH+UQ5BB9WqjFXrlzDKJl1fPmHUMZdTTbJBaxdK3J8KKZbV4dKUijNW/mOf0vwObikrcxkk8sIlryEJhpzAaPTaaUMlEe0iznnO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765212830; c=relaxed/simple;
	bh=Bfdeib/nc1cZRyW/4AfYIDjQohSWHdjHshm9x1n504Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l+w80kqBu3472NOXx6Sn/+oxuN2wzlFH/WPVd75rGDKcIBdWyv8d/tGpR95+qkq4+vkWQfWFbkLNCADPF7MhOMFnkP4b3ZU4O9m7j5oX8RGDxRrKnEPN2WoE1GMkqCohFu3QIMjl5LlVeke9MkqNsuTvh0fJnGTuVWUxdNLVEsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BixvgH7+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BixvgH7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765212829; x=1796748829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bfdeib/nc1cZRyW/4AfYIDjQohSWHdjHshm9x1n504Y=;
  b=BixvgH7+hWVjE3cSeWVeZIn2Ih6PKwUsIub0EWGHlUXcvmMIYFzqgQNM
   eB3w1I8WaZadmE12MrzC9c0BhvIyvcGja6CffXjYVuuAkI0M98wG1KmIb
   2hxpi4RmUW9PNaQzjzegCBTodh9+Lj4JyZZ61yxVka+tQONDksLv/9pTT
   xbA81WbAT/7mxpQz9caGP2AnixU1Qauo5aiAeoOnuCthNkXPW6K9wqXom
   VybXHxvs+SdIrAMkGsABpKQaYIvdn3yCiCvLuygmPo0vPGm2LkuRb1elY
   WqX9kyPaNHnWvXnTHltiMeiqB02JS2WD9CS/Ah83ZeheBtzrgzDI3QizL
   Q==;
X-CSE-ConnectionGUID: emHdK8coQFG0jFWkRB8kyA==
X-CSE-MsgGUID: TVUkemn6T4mEuA6kaVh7Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77842717"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="77842717"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 08:53:49 -0800
X-CSE-ConnectionGUID: WcPoEf29QZuq51XOL2zjoA==
X-CSE-MsgGUID: It9M+t4lQJK8itcxxlq4oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="195770117"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Dec 2025 08:53:48 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSeUa-000000000dZ-36qP;
	Mon, 08 Dec 2025 16:53:44 +0000
Date: Tue, 9 Dec 2025 00:53:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ebiggers:wip-nh-lib 10/20] lib/crypto/tests/nh_kunit.c:42:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202512090011.rsPsyrjN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/crypto/tests/nh_kunit.c:42:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-nh-lib
head:   d471b579f29c765ebaeba7a3b653052f029dc550
commit: b98dc0c0c9c02baa8b7790f278dfacd4d3c6634f [10/20] lib/crypto: tests: Add KUnit tests for NH
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: i386-randconfig-r134-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090011.rsPsyrjN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090011.rsPsyrjN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512090011.rsPsyrjN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/crypto/nh.c:81:1: sparse: sparse: bad integer constant expression
>> lib/crypto/nh.c:81:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/crypto/nh.c:82:1: sparse: sparse: bad integer constant expression
>> lib/crypto/nh.c:82:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> lib/crypto/tests/nh_kunit.c:42:1: sparse: sparse: bad integer constant expression
>> lib/crypto/tests/nh_kunit.c:42:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/crypto/tests/nh_kunit.c:43:1: sparse: sparse: bad integer constant expression
>> lib/crypto/tests/nh_kunit.c:43:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +42 lib/crypto/tests/nh_kunit.c

b98dc0c0c9c02b Eric Biggers 2025-12-06  41  
b98dc0c0c9c02b Eric Biggers 2025-12-06 @42  MODULE_DESCRIPTION("KUnit tests for NH");
b98dc0c0c9c02b Eric Biggers 2025-12-06 @43  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
