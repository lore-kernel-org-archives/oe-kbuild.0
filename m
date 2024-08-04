Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A942AC29
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722791037; cv=none; b=FSBOWsrWw3t7ovKnl3+mlAzNfVOhDHStUpVUEmL6B49zGtBg2kOLT23rkRMbyDmZI+7migrALY2b61+L59u71awsL/BunxUhWF0cr/1qok4E/TUHW20uq8PwRKBY+DAkVqRAa0VqD857w2Q0rBap/639DRmkBwu19XfafKGvmS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722791037; c=relaxed/simple;
	bh=7R4j5dECqpoivmg9LVx8gVG7nqhKYHF7H4QRxbIBOwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VqltO0eoPuebDAihcrgU+/meTYV52QremWNzOfXhS+9bCAkvXTMCtTmccSazLzealUgUBDMo+eXH22xI4+pD6HsunOvYaVcU7YPG7cjYQdhzCcRE4wYVetYUqJPzdAdBhrEjLJogGbLZ282nO5jFZI/k9dlE4225zqvr49vWMTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZu2nuJE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZu2nuJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722791035; x=1754327035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7R4j5dECqpoivmg9LVx8gVG7nqhKYHF7H4QRxbIBOwU=;
  b=UZu2nuJEoBjunCxq+z3XU5T8aYhJsO35mzEiSTMFkgRW6ei6+MWBdX8Y
   JSSRdhAwxCzAGozuIR5M36BaGYXC7nutVWee6AoxB28BosJDp47b6gtVV
   Pd22TnG6Z6JfZFaCBDW/I8/4BCtRiyFp4Bo4KUGU3lYpDAvcFmc1n+uNL
   eqmlb+X28EBcwk47wV89dPxHXwcatK4oNK1ggNCuB05RWeKFs7BMJObfb
   f4FOdE4Od9+nAmF2axqqkd9Y/Y7RPmkwNuk6LO4Z6BQYqbdoOEyorwO+m
   zfn34uapTs2qkw6Yf8eZN2bbx4kK4YpkcnPjiA/+Q6AjI3SSfPPomXA9i
   w==;
X-CSE-ConnectionGUID: dv46ko0DQ6WsOzae5Y/14g==
X-CSE-MsgGUID: Zcht1IzoSj+zEuam8J1WwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="38251858"
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="38251858"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 10:03:54 -0700
X-CSE-ConnectionGUID: XM8TIzvgTCGwfW7+/ayTMg==
X-CSE-MsgGUID: UXzh33s4RpCuZ0mCpRVtWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="56029329"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 04 Aug 2024 10:03:54 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saee7-0001YS-1v;
	Sun, 04 Aug 2024 17:03:51 +0000
Date: Mon, 5 Aug 2024 01:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/md/dm-verity-target.o: warning: objtool:
 verity_ahash_update.isra.0+0x114: unreachable instruction
Message-ID: <202408050038.8YDUxaWu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@kernel.org>
CC: Mikulas Patocka <mpatocka@redhat.com>
CC: Sami Tolvanen <samitolvanen@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   17712b7ea0756799635ba159cc773082230ed028
commit: b76ad8844234bd0d394105d7d784cd05f1bf269a dm-verity: hash blocks with shash import+finup when possible
date:   5 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20240805/202408050038.8YDUxaWu-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408050038.8YDUxaWu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408050038.8YDUxaWu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-verity-target.o: warning: objtool: verity_ahash_update.isra.0+0x114: unreachable instruction


objdump-func vmlinux.o verity_ahash_update.isra.0:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
