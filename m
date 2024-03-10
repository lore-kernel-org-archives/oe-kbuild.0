Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBE31170B
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Mar 2024 04:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710043916; cv=none; b=lKr5s2o45yewD/Wp4V6oOfsItcmTbdKBUwZOQ9Dw+tiFXg3gSzb3G7rlM8VzWO2QXo18e4QFln/obP5Gg/m+pPcehNEArKn6kwagnImdoZbRCdKP6Z8XN7zSjqrkarlp+lYT9FBrD/oDai8gL1HZCyfZuo42DDac4+5yRB6CvXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710043916; c=relaxed/simple;
	bh=IZWZabpjJceJe3o1o29whj9vuhXRPN3phTBTatpxO9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u5HaQay6jUxp54lUJnuy7S9tHy3uB1yJjFGQZPnWSItWvZmUi57Rmu+0x0lr8AKb3+V0RqgHvlec3z1zpT2ix99SUrfEf3inUyl2jh61zOKC1QgnxP2KhqjayV70KZTjQyFp4fDxDoIevtKYhgcjRolcHv5KgRjuttuv34E+ZEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iszSwn4g; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iszSwn4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710043914; x=1741579914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IZWZabpjJceJe3o1o29whj9vuhXRPN3phTBTatpxO9g=;
  b=iszSwn4g5b6dEKLu+kO+PrOPK0bvUyf5jgKmXLh7lL6NQQW5+uD71tqI
   KYE7r1XVo5kYqJ7Izu/qyD3ZOUL/Wqu5kNWY6uxTgi0HFhLwhazfUsN0Y
   KTQklqnBXAsBQq+ZMLbo0/cmPJTCB7UUkjY0OPIaL7V3j+l6qIz9fvaHj
   1HKxL3We9o9xOMstuy4afBmuGFuVqT7AL1d4R8aGSjlL32pV2WCQnOH0z
   plpbbzXvmjDj6e9MUS0wa541v5C4Brq0ZAuXJPwxbTAZq6+iGA1OUsy0R
   ZpmGfH3rQSmxNOCY9r11fZ2+TU1mNYc/5BYVw82f8DQd4WU0icHpTQ39O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="4596614"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="4596614"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 20:11:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="10843540"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Mar 2024 20:11:53 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjAXN-0007uD-2C;
	Sun, 10 Mar 2024 04:11:49 +0000
Date: Sun, 10 Mar 2024 12:11:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bristot:tracing_makefiles 1/3] /usr/bin/ld: cannot find
 tools/tracing/latency/fixdep-in.o: No such file or directory
Message-ID: <202403101227.BcMWP1f9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Bristot de Oliveira <bristot@kernel.org>

Hi Daniel,

First bad commit (maybe != root cause):

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/bristot/linux tracing_makefiles
head:   4ab413bca202fe480bb9fb8e6e1e6a556d50b0c5
commit: 6f2b86be6286d91ed5fd8e36ec54e07a908cc468 [1/3] tools/tracing: Use tools/build makefiles on latency-collector
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403101227.BcMWP1f9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202403101227.BcMWP1f9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /usr/bin/ld: cannot find tools/tracing/latency/fixdep-in.o: No such file or directory
   collect2: error: ld returned 1 exit status
   make[5]: *** [Makefile:50: tools/tracing/latency/fixdep] Error 1
   make[4]: *** [tools/build/Makefile.include:5: fixdep] Error 2
   make[3]: *** [Makefile:11: latency] Error 2
   make[3]: *** Waiting for unfinished jobs....

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
