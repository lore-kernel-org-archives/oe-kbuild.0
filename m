Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5A4274FD1
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Jun 2026 22:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782341400; cv=none; b=oH/C9akYe544Fgd4yiH/a6p9IoDZLtoolm+2zmtBBCn4YCJqBKob00h7Ax84n895Qe/rPiipipWv46wSryK8w5kJlbIarxKGIqcEBm3wXb/BEMMu2ZP+LFFBVczJS7NTEC8KVNogWnO06rWbqsdjs9HX2J0DP1XLIgA62gAdUew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782341400; c=relaxed/simple;
	bh=D49obg6oV/QLo3wmCHf69df1Tl95S6iAJNcvtu1JM9M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CDiYucF1KS6LhpPjWPGeBZqHKPQGhQPkeVv7K6g4xGvVjaZ7qHNneMDsE2AIFFVyoSk7Gq2nsLQBYZaaB+t8v3nhw9SWTKuoLZfu+Vi0X6aUyk61KClBH6sVcxIHjSYk/CLO7mAox2QJoI7f88RvOLuBgc2X9ZBXszRm9LSb05s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDB+isIP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDB+isIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782341398; x=1813877398;
  h=date:from:to:cc:subject:message-id;
  bh=D49obg6oV/QLo3wmCHf69df1Tl95S6iAJNcvtu1JM9M=;
  b=cDB+isIPQErCu93OG0/kNv4g2u0j3cCbOu+hYE5G5blB/41Tg+NZNPRa
   W30FWQc/K/olkErHJtA0dle0tHStH33c7itqfR52IY6e/u5oqjQpNlKgg
   QOtEL+emhtWLWO+4jIktPm8chhbNSiIvrcR/Ct3/7jfRzrahNFqfCBCln
   F3G1jpwoBvHy6SSzklitcRM/d/edacybzrS9ora0NnM0d/pFlP+2zAZfA
   6qLPkdbP7y/4Ju1Wwe6xwNEnGAb7Ch2z26yqnfaNrg/QTWOU6wvUaDl2t
   chv7/T7MBM6I4uA7YvYzzM0/Uba4UBiHNX1o7Hk5yD+8sA0sxMJznGO6a
   g==;
X-CSE-ConnectionGUID: RVliPHRaQa6zftotXskKVg==
X-CSE-MsgGUID: v+Nw5Zw6Q9iQAy3bEYr2bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83118779"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="83118779"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 15:49:58 -0700
X-CSE-ConnectionGUID: EVnVdoG/TvuOeT0/dkjmTA==
X-CSE-MsgGUID: WGZZLhoxT1GqdLDDjEEZoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="274270407"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jun 2026 15:49:57 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcWPn-000000003ib-3cSX;
	Wed, 24 Jun 2026 22:49:52 +0000
Date: Thu, 25 Jun 2026 06:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arnd-playground:abi-test 6/34]
 ./usr/include/linux/uhid.h:197:2: error: padding struct size to alignment
 boundary
Message-ID: <202606250658.5BXbDOV2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git abi-test
head:   741e95c4b46803e113402223592189848b0ac9c8
commit: 3dfdb63c0bf9cefe7e3d914f595429779695f95f [6/34] kbuild: uapi: check for -Wpadded errors
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-002-20260625 (https://download.01.org/0day-ci/archive/20260625/202606250658.5BXbDOV2-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250658.5BXbDOV2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606250658.5BXbDOV2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/uhid.h:23,
                    from <command-line>:31:
   usr/include/linux/input.h:413:8: error: padding struct to align 'custom_len' [-Werror=padded]
     __u32 custom_len;
           ^~~~~~~~~~
   usr/include/linux/input.h:443:8: error: padding struct to align 'intensity' [-Werror=padded]
     __u16 intensity;
           ^~~~~~~~~
   usr/include/linux/input.h:485:4: error: padding struct to align 'u' [-Werror=padded]
     } u;
       ^
   In file included from <command-line>:31:
>> ./usr/include/linux/uhid.h:197:2: error: padding struct size to alignment boundary [-Werror=padded]
     } u;
     ^
   cc1: all warnings being treated as errors

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
