Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3A32E3EB
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 11:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722771846; cv=none; b=PEbpvOEQ5yE2CMKAvfQyNxe5UJMCg9yRHZF8LOzhbknt7GQs0dYRdYhqorAEkj5Uz+YCRJPyO6ujgqUvNDIOh6Wxc9SxjvLhUlxUeKj2ruGNGrNAaBFrTlZFu8gDvnApobc2UDaBMOqqxlyidHnFI0Aa5dIBUR012/unL/BeS0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722771846; c=relaxed/simple;
	bh=LQu+rg5THiacHgY9i/SDOCCzBfckaQFFIRTQHL3R+IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oYZRWXggf0V7+OQ7yW+E3bSWxgbZSmpQM9QjCST028ILb6Of/bbn+aGVlyp+7kgaKrXfv53El4zEX/4TvkdBX0t4FR2LIMpNFth2V36GOpQ8CuqN/QnAWYoKi4ZghFOU5WdzNKaqKIzuCKBJTks3fPrzQQIL9dRamBs176EW3kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilrgVm2R; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilrgVm2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722771843; x=1754307843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LQu+rg5THiacHgY9i/SDOCCzBfckaQFFIRTQHL3R+IQ=;
  b=ilrgVm2RoxhWolbbI4xaqCQ7zul41vvQtysF0I5rb2hoMqDC3o9vcUa4
   VC5C6fELmViE8+KRJbtGytO4yUpw5OaGKEcNuSSO2ElU8L6L2dfBkn5ub
   6oC+/WRmCqteVerjSiOxn1QQm6stlin3VoLpODCP9D4pc+Kj+rSYq9U9a
   RzEnO/oCNyxcy/Pj5DXwDwq7u8Wdusmix2GO0aIaEkjWWDEJpQZkuMUgH
   7IinN9N6ZdqyGjFSoWs929tyCQ4/k0rezJqfOKSstUYayDu5T4wrCQz8v
   rlckWOFYWGeJ9wx38+WoJAqlHS+ZKkzl1eKqejSr1Zsax15dbAJ9w6KkR
   g==;
X-CSE-ConnectionGUID: AIdclDJWR7iFDMEnZdXa0Q==
X-CSE-MsgGUID: 0MPKGrh7Qyiclct5zU4IEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="38239943"
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="38239943"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 04:44:02 -0700
X-CSE-ConnectionGUID: fGqAPgmrQo+LfeSrFaBXtQ==
X-CSE-MsgGUID: 8bZj2TD3Qe6kzjV/f9Td3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="60029735"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Aug 2024 04:44:02 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saZeZ-0001QQ-2d;
	Sun, 04 Aug 2024 11:43:59 +0000
Date: Sun, 4 Aug 2024 19:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [zen:6.9/zen-sauce 8/32] fs/ext4/extents.o: warning: objtool:
 ext4_ext_map_blocks+0x2cc: unreachable instruction
Message-ID: <202408041954.br7XDHSe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: steven@liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 6.9/zen-sauce
head:   21122ebc1a7da277bbf25545da58b29f0d785c60
commit: 140c96151316910a96a9d7783da5bd5b9b3d9d3d [8/32] ZEN: Disable stack conservation for GCC
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20240804/202408041954.br7XDHSe-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408041954.br7XDHSe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408041954.br7XDHSe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ext4/extents.o: warning: objtool: ext4_extent_block_csum+0x68: unreachable instruction
   fs/ext4/extents.o: warning: objtool: ext4_ext_insert_extent+0x314: unreachable instruction
   fs/ext4/extents.o: warning: objtool: ext4_split_extent_at+0xac: unreachable instruction
   fs/ext4/extents.o: warning: objtool: ext4_ext_convert_to_initialized+0xf0: unreachable instruction
>> fs/ext4/extents.o: warning: objtool: ext4_ext_map_blocks+0x2cc: unreachable instruction
   fs/ext4/extents.o: warning: objtool: ext4_swap_extents+0x7c: unreachable instruction


objdump-func vmlinux.o ext4_ext_map_blocks:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
