Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC71015E97
	for <oe-kbuild@lists.linux.dev>; Sat, 31 May 2025 18:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748715757; cv=none; b=Pt4mREXzvw8vfj3VJyPjm8NFLDkiQS19PHyg/e2MwU6jAjRgehPKip2S2AYY+abI2EGzrGOuCL4dEzbSNur9x3eLPAufeyyus556vMKV3FBlPTvG07F6+24kge2dgSXoP5HkcQjKm20s7c5dC6aioaSsYvV80lVg7VI3d+4VLHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748715757; c=relaxed/simple;
	bh=bLnLI+h3G6iyYhj56YHZAay6vugbc1BtWKk3VpjWyNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uBmPOVniu/DZIUdagUY9Bbn4xYok5uULx6ponIXHEkmGKVHcW+p9J0PyDfCNzI68hmbrtZAJPHQpRQmR+gifaB8shB2HOUWQWMvrXp/uCg2lKDaC4/zAqPrTtc+92RyqYnjcqVwg/9wNiDHP/tbW4Ot5mWQChMiQj/dS98lj+s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AtGl6fY0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AtGl6fY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748715755; x=1780251755;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bLnLI+h3G6iyYhj56YHZAay6vugbc1BtWKk3VpjWyNA=;
  b=AtGl6fY00Iz34bcBpsZHuJoi/kloRadv3wwW5QEwd2Mpbv/LqiJcCN+b
   liBXd5jupBC45Eh/NeJPvQJqfadDpH7TZaZsEhOZ0/58sMGD175klfkb6
   +1X++OwNbePTtMX6eVPpnF0w20Qr/3HcrvatIfKlfzEkVpbMJNN2T5uSB
   tSBdWUQ8T1jX6JH5T3QweqQXUvQZ7BSe5HNGS65mPfyW7Ke1M7Ry9Uafx
   T3MqwZYEjxlri5lZlLR/Xl5wgr0CAphfZXGh58WzmuiTJizO7dyheVzPO
   l7LWR/PqgleFLcIfx5DuJFhn9Oq8tK4mmQ7jOpVlH8+p4ZG0HFQz3QY5F
   g==;
X-CSE-ConnectionGUID: oILChOfmTZCXY3S5PfXjhw==
X-CSE-MsgGUID: 7BQUqjg5RuOGDIpYo+osBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="61042796"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="61042796"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 11:22:35 -0700
X-CSE-ConnectionGUID: B7y4+ZCAQYGpmcFX5Uyv8w==
X-CSE-MsgGUID: nGT332ngSk2Bz5kv5z47Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="144805977"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 May 2025 11:22:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLQqm-000YZh-0m;
	Sat, 31 May 2025 18:22:32 +0000
Date: Sun, 1 Jun 2025 02:21:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/vdso-absolute-reloc 5/5] clang-16: warning:
 optimization flag '-ffat-lto-objects' is not supported
Message-ID: <202506010204.sWMElxae-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-absolute-reloc
head:   4aa8b481d2f00bc4ff36a2a083abb57c7a9a9387
commit: 4aa8b481d2f00bc4ff36a2a083abb57c7a9a9387 [5/5] vdso: Reject absolute relocations during build
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250601/202506010204.sWMElxae-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506010204.sWMElxae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506010204.sWMElxae-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang-16: warning: optimization flag '-ffat-lto-objects' is not supported [-Wignored-optimization-argument]
>> clang-16: warning: optimization flag '-ffat-lto-objects' is not supported [-Wignored-optimization-argument]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
