Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9504C30505F
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Aug 2025 12:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606337; cv=none; b=HvmbofFK/ThSK06EyxurVzJaWSLbwaxgjlYM+nO+CP72eWs1rWR8O53U0UZsK/CDMukcxF5pNZMqeZZkLyx2QwwOIIDY2yV/KH186RvjuUaBYzKoT+jobV8bOHOq93TdQqzMmRrVhuIQc669Bd8neoEP4/+5vlSFqs11TzeyTyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606337; c=relaxed/simple;
	bh=YEaBe0xnEPxkmEmb3Ma840snqfYvxSt0ZzPBhxuzNfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QeQ9gXHl1BoYBjqUr5ZXsBWTjEd6SY08AXQZPX8ECYJ9JJOX3xdxkbtqoNSvrxTfkUl6nZDSnSc85zkL6KaY5BM/aFX0pHSVV6MvTB+/aLn5y3ZPA4UN6ndUNNTLJ0WF6U0n6hwMym/IfELJZKzfHDFVBT5HegmCiJDiz2Uf+qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApzDTv/0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApzDTv/0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755606336; x=1787142336;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YEaBe0xnEPxkmEmb3Ma840snqfYvxSt0ZzPBhxuzNfw=;
  b=ApzDTv/0VwLXDSuZ0XtSUTZZSZtRxBoqnQV9Ka/vNtUHRW8Ks0ZxbNGc
   j+Fm52Ny1g+H0uZxlDMCycIJ0s8DRx7Iho9t11njRsCXKXr9tsi83it5H
   bDWxkhYCZlnRAFGK5L/URfGxsP6Eb9U4NkW13/wUXnjCkL67MXyeaUFDY
   cz+DeMNUxwo3h7iHmsrJvTfgufj0AJ8AQOR6I24aHBddvfJlMlDvyUXfR
   hgNu+tenDf2qO9LHMJbrfTXRZsZy+jGLYKKwChz4tzeXh6apVxaB0F7oJ
   7jSQJx4MrKFrrxbF3uCboq3F5H7GcSXrx07noEXT45PBycmiIqpF+I323
   g==;
X-CSE-ConnectionGUID: P5O+ar63RMSva1j2qCyJYw==
X-CSE-MsgGUID: aejuO9fcQa2X9icrvYGHtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57915692"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57915692"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 05:25:35 -0700
X-CSE-ConnectionGUID: IxA3S8U1Qq6KIapvMEQXTw==
X-CSE-MsgGUID: OSfJc9fUSHm+HM38R3NWSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="168081839"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 Aug 2025 05:25:35 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoLOU-000Gqr-0Z;
	Tue, 19 Aug 2025 12:25:01 +0000
Date: Tue, 19 Aug 2025 20:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/core/netmem_priv.h:25 netmem_is_pp() warn: masked condition
 '(netmem_get_pp_magic(netmem) & ~((((0) + (((((1 << (8 * 8 - 1 - (((-1)) <
 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) << ((1 + __fls((64 +
 (6767463209352822784)) - (6767463209352822784))...
Message-ID: <202508192052.0M4kvBQm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: Yury Norov <yury.norov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be48bcf004f9d0c9207ff21d0edb3b42f253829e
commit: 104ea1c84b91c9f452e497ba51602b903711cdd5 bits: unify the non-asm GENMASK*()
date:   3 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 weeks ago
config: powerpc64-randconfig-r073-20250819 (https://download.01.org/0day-ci/archive/20250819/202508192052.0M4kvBQm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508192052.0M4kvBQm-lkp@intel.com/

New smatch warnings:
net/core/netmem_priv.h:25 netmem_is_pp() warn: masked condition '(netmem_get_pp_magic(netmem) & ~((((0) + (((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) << ((1 + __fls((64 + (6767463209352822784)) - (6767463209352822784)))) & ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) >> ((8 * 8) - 1 - ((((32) < (__ffs((6767463209352822784)) - (1 + __fls((64 + (6767463209352822784)) - (6767463209352822784))))) ?(32):(__ffs((6767463209352822784)) - (1 + __fls((64 + (6767463209352822784)) - (6767463209352822784))))) + ' is always false.

Old smatch warnings:
net/core/skbuff.c:4812 skb_segment() error: we previously assumed 'list_skb' could be null (see line 4747)

vim +25 net/core/netmem_priv.h

8ab79ed50cf10f3 Mina Almasry           2024-09-10  22  
cd3c93167da0e76 Toke Høiland-Jørgensen 2025-04-09  23  static inline bool netmem_is_pp(netmem_ref netmem)
cd3c93167da0e76 Toke Høiland-Jørgensen 2025-04-09  24  {
cd3c93167da0e76 Toke Høiland-Jørgensen 2025-04-09 @25  	return (netmem_get_pp_magic(netmem) & PP_MAGIC_MASK) == PP_SIGNATURE;
cd3c93167da0e76 Toke Høiland-Jørgensen 2025-04-09  26  }
cd3c93167da0e76 Toke Høiland-Jørgensen 2025-04-09  27  

:::::: The code at line 25 was first introduced by commit
:::::: cd3c93167da0e760b5819246eae7a4ea30fd014b page_pool: Move pp_magic check into helper functions

:::::: TO: Toke Høiland-Jørgensen <toke@redhat.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
