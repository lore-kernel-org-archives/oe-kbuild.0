Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABB0381C4
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765446355; cv=none; b=msFzMnW4BZbcM5kmnvpEQyBKDjFxvczjtvgHbvgrksn+XGIUzGMfNh7nHu/rmBfRegBSgZetPzRPT/Fpj1qlpLsxPCvN440N+ihGImlCqDhH3DDxK4YtS+fQkeRU7kYW8g8jSCnCs890M/v7FWxBLTKwqnJONyFXpPG/EyGx2wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765446355; c=relaxed/simple;
	bh=cdysL7L5h+kDO/oY+TeKtIsCGUlXcauyhoQ9VhtdTdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s71GnC1kkbAXUQprmt0Ir0FMm7NcYANd0QGGKn1yYyadHl9wph4wRrAUQTzYDOKXiSfNJ/bru06TiKMPUZNGtA0wSC3p5IlsH01KnSf9pTXx6swySOmWjUzrgjCp0CXfLf8DW9BtMo5U2pRGHiH+AnvtEWt2e2N8hmkBAKy/gsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgqBiXDj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgqBiXDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765446354; x=1796982354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cdysL7L5h+kDO/oY+TeKtIsCGUlXcauyhoQ9VhtdTdU=;
  b=NgqBiXDjYekjOxmJvt1EbONaP1REFWnFmSgOWwPndfZwTo13+ATR71Rc
   ZD0rAMsnFHRUlOz7XzzxaVivlvRoxZapY2Y3XvQohv2q1WHlDnJWnDrh/
   2W13Blx+VSzEoHxL1ktBeZY1VXKcK91jq1Y/Wb2CA44sbYaRbRxBcyTvZ
   0sLuw5qQWW1OiZJBNFdMX6y6Q4kr9xdsvVuY4KXzy1Dcy+9rIQ/D/7R17
   uiIWIo6TQ6XjmR6/SjUmEk5JP2yV8lt9WoWJsPzsnMU/OoD5yV09J1ylk
   Rnh2e0oaRpIkZGfs/CHkbkbHJwJyJSl0kDBDdfrk/q7D3GT/l6Q1Qm7Mf
   A==;
X-CSE-ConnectionGUID: R79ChAIoSLO1DoFFIAQ/yQ==
X-CSE-MsgGUID: +fMIM/ZfRhqoZtmY1X80zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="77740821"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="77740821"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 01:45:54 -0800
X-CSE-ConnectionGUID: ojM3dBq9Tgm/k5EUE41uzQ==
X-CSE-MsgGUID: UH8+PMPuSReumwpg8AFSSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201674470"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Dec 2025 01:45:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTdF7-000000004TV-3sP1;
	Thu, 11 Dec 2025 09:45:49 +0000
Date: Thu, 11 Dec 2025 17:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/bpf/verifier.c:19553 add_used_map() warn: fd re-used after
 fget(): 'fd'
Message-ID: <202512111758.c88i56sQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Anton Protopopov <aspsk@isovalent.com>
CC: Andrii Nakryiko <andrii@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 4d3ae294f900fb7232fb6c890dbd3176b8a5f121 bpf: Add fd_array_cnt attribute for prog_load
date:   12 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-141-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111758.c88i56sQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512111758.c88i56sQ-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:19553 add_used_map() warn: fd re-used after fget(): 'fd'

vim +/fd +19553 kernel/bpf/verifier.c

535ead44ffd084 Andrii Nakryiko  2024-08-06  19541  
4d3ae294f900fb Anton Protopopov 2024-12-13  19542  /* Add map behind fd to used maps list, if it's not already there, and return
4d3ae294f900fb Anton Protopopov 2024-12-13  19543   * its index.
4d3ae294f900fb Anton Protopopov 2024-12-13  19544   * Returns <0 on error, or >= 0 index, on success.
4d3ae294f900fb Anton Protopopov 2024-12-13  19545   */
4d3ae294f900fb Anton Protopopov 2024-12-13  19546  static int add_used_map(struct bpf_verifier_env *env, int fd)
4d3ae294f900fb Anton Protopopov 2024-12-13  19547  {
4d3ae294f900fb Anton Protopopov 2024-12-13  19548  	struct bpf_map *map;
4d3ae294f900fb Anton Protopopov 2024-12-13  19549  	CLASS(fd, f)(fd);
4d3ae294f900fb Anton Protopopov 2024-12-13  19550  
4d3ae294f900fb Anton Protopopov 2024-12-13  19551  	map = __bpf_map_get(f);
4d3ae294f900fb Anton Protopopov 2024-12-13  19552  	if (IS_ERR(map)) {
4d3ae294f900fb Anton Protopopov 2024-12-13 @19553  		verbose(env, "fd %d is not pointing to valid bpf_map\n", fd);
4d3ae294f900fb Anton Protopopov 2024-12-13  19554  		return PTR_ERR(map);
4d3ae294f900fb Anton Protopopov 2024-12-13  19555  	}
4d3ae294f900fb Anton Protopopov 2024-12-13  19556  
4d3ae294f900fb Anton Protopopov 2024-12-13  19557  	return __add_used_map(env, map);
4d3ae294f900fb Anton Protopopov 2024-12-13  19558  }
4d3ae294f900fb Anton Protopopov 2024-12-13  19559  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
