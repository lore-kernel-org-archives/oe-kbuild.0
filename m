Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7733E478
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 07:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706687681; cv=none; b=WJqBNtYl5/XejCKdFKBBagYC0PVrSMoZZcA3/5h6vHdt3U7jRlTMpkUtn0SdG8LAXslLJolXJ+fX6y3bbk3tGbpp/RG0/qIFSLaBl+VbSfvl1YefRoGOzwFnfxTXTG2nC3oy/pqgg+p15FN4Tz/K3yY26/RqhiOuvpL8aphEBmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706687681; c=relaxed/simple;
	bh=AnD0Zzt77rcDgBvpFIFLK2yoopocSDiP2u6pKJR7STI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ay7+/7XOepMHzMaWKVZOOBpdw6iWqFWjPkNZDzavqaGkatwNOlVcTsMBsdCEkRY4B281Jlt7Zv8/uJgQYKPOANv35YBphgKab3x98LXoHufNzbaCOIgNbmE2lQnY94eC/c3wlbrttKcrCgGchLEBjd52EsKvdRkHPuRdJtZvrGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAFUJlw5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAFUJlw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706687679; x=1738223679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AnD0Zzt77rcDgBvpFIFLK2yoopocSDiP2u6pKJR7STI=;
  b=SAFUJlw51avrPQMgkbiAqg33zoKdJx5OSUHxQdH9l0yOtD1XJqCNgSSU
   co235hBQFUDwxIcChWVNUOEoDvmDqCIVbR/DYUE7z+Q2mYMjHN7I2lf/9
   AemEDwWEI73jvm8ud18wTsp+gEPSz1YxpUjxEQdqP3YU4ut9CMt8RAONn
   6WzLsTLnE7Yl9qSv4vFGuAp+7OGCWYriIfeYbugO3mC2ELyvTrqOd/teK
   rqHIV3myEoyuuKUmGbp+Swceu9GphM9aHyz7X8Gk2lMmti4g2LTwYh3Y7
   Ik6gnfq5yj7G4MIf1wXeP8QOpQnSzaHWofXw3Cc2sFicTGN+NHTMJxvbX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3376869"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3376869"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 23:54:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3998253"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2024 23:54:34 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV5Q9-0001Is-0c;
	Wed, 31 Jan 2024 07:54:17 +0000
Date: Wed, 31 Jan 2024 15:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sudeep-holla:android13-5.10/ffa 9245/9999]
 include/linux/kasan.h:17:10: fatal error: 'asm/kasan.h' file not found
Message-ID: <202401311544.SuKbKPH4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Nick Desaulniers <ndesaulniers@google.com>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: 377062e9833e131b9808a04f71be39161a1f04a6 [9245/9999] UPSTREAM: Makefile: infer --target from ARCH for CC=clang
:::::: branch date: 2 years ago
:::::: commit date: 2 years ago
config: arm-randconfig-003-20240131 (https://download.01.org/0day-ci/archive/20240131/202401311544.SuKbKPH4-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311544.SuKbKPH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401311544.SuKbKPH4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:34:
>> include/linux/kasan.h:17:10: fatal error: 'asm/kasan.h' file not found
   #include <asm/kasan.h>
            ^~~~~~~~~~~~~
   1 error generated.
   make[2]: *** [scripts/Makefile.build:122: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=1363640600
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1300: prepare0] Error 2 shuffle=1363640600
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2 shuffle=1363640600
   make: Target 'prepare' not remade because of errors.


vim +17 include/linux/kasan.h

0b24becc810dc3b Andrey Ryabinin  2015-02-13  15  
f4fb11566b5eb19 Andrey Konovalov 2020-12-22  16  #include <linux/linkage.h>
65fddcfca8ad147 Mike Rapoport    2020-06-08 @17  #include <asm/kasan.h>
0b24becc810dc3b Andrey Ryabinin  2015-02-13  18  

:::::: The code at line 17 was first introduced by commit
:::::: 65fddcfca8ad14778f71a57672fd01e8112d30fa mm: reorder includes after introduction of linux/pgtable.h

:::::: TO: Mike Rapoport <rppt@linux.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
