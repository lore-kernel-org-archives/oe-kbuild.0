Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7401F10F2
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 11:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742122835; cv=none; b=nhvG3+m86pnGs/HBwj0fp+L9UjtEek4I3am08DNmtalqWb7G7NZA7i4ZB24gmkzAep+WShB5gT1LtU9jBwXt58jN2CDCu2a7WWDGn5Jt4uBs5lOmQtWFKaMC0eBr4HF3isue0nhlpZyFXmUsGkXIZ0BEyQckuVI80FMAfX2LZoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742122835; c=relaxed/simple;
	bh=HThbD9Kvw4bNdQOYoZbG/Db3A2plP6aFJxleBnu5Jp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cUyYNfuRL5nyug5GWCPx0JNb+zpMLlPOA3e4sbFeOFLKZS4nlUzdcrNdGbaz2O4BN8v2SexCiYGiQ3+OVJ0fxZyOqjGrPphqLwuQZpyY5voSMSH+/I5RA1K5EFKZcXyYjzo9DjgBKUY4hc7U8ZJ/OaW8lk73pn45mWae3+Q9o8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpMYgkv4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpMYgkv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742122833; x=1773658833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HThbD9Kvw4bNdQOYoZbG/Db3A2plP6aFJxleBnu5Jp4=;
  b=SpMYgkv40fhh4GNbqCoc6GwK+IggRqwe7k5n4mF0ortChUk3GvL0vvtP
   70AEvzX2uZ8yMUuAiFvzwc+Wd9KawW9I7jA3zyT9K8Q8QgXYZX09jOW6r
   vQ+YK1ehItAottzDZx9zwnYyqeVnQeCrAOsQ6AKpiT49R50RC1LGAwIh/
   0cnEgWa9Afw3zq05CO3NlTYOj65fJbO0iUXquJHGTfX+IRvdSzwKUaZB4
   7FW2WV4MbDPxasJOpb8sOSL3sWE2iUmAG54lSWFM4L9kIpCi52sU/B8je
   p/1gEaG7MB34GeaIKpOLrd9BxF8JdllLz7eDKOSAs/0sbTJhnnF+3Tc65
   Q==;
X-CSE-ConnectionGUID: NFXgFt4kRGutvBuGkA+wQw==
X-CSE-MsgGUID: M4ZpiGZ9T82F8I9f3tIxGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="43258332"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="43258332"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 03:58:12 -0700
X-CSE-ConnectionGUID: sA8V44j1RISfkKVBSlaPyw==
X-CSE-MsgGUID: 0G+lzjSoT6ywjG/PYTdEAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="121503366"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 16 Mar 2025 03:58:10 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttlh2-000Bxt-0m;
	Sun, 16 Mar 2025 10:58:08 +0000
Date: Sun, 16 Mar 2025 18:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peterz-queue:objtool/core 13/13] drivers/spi/spi-amd.o: error:
 objtool: 1 warning(s) upgraded to errors
Message-ID: <202503161828.RUk9EhWx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   3ea93b53ecb339bb78a5eedbb51714a899640584
commit: 3ea93b53ecb339bb78a5eedbb51714a899640584 [13/13] objtool: Add CONFIG_OBJTOOL_WERROR
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-071-20250316 (https://download.01.org/0day-ci/archive/20250316/202503161828.RUk9EhWx-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503161828.RUk9EhWx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503161828.RUk9EhWx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-amd.o: error: objtool: amd_set_spi_freq() falls through to next function amd_spi_set_opcode()
   drivers/spi/spi-amd.o: error: objtool:   amd_set_spi_freq+0x55: (branch)
   drivers/spi/spi-amd.o: error: objtool:   amd_set_spi_freq+0x68: (branch)
   drivers/spi/spi-amd.o: error: objtool:   amd_set_spi_freq+0x3e: (branch)
   drivers/spi/spi-amd.o: error: objtool:   amd_set_spi_freq+0x0: <=== (sym)
>> drivers/spi/spi-amd.o: error: objtool: 1 warning(s) upgraded to errors
   ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --stackval --static-call --uaccess --Werror --backtrace drivers/spi/spi-amd.o.orig -o drivers/spi/spi-amd.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
