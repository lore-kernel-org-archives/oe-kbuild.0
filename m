Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7BA2749D3
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Aug 2025 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754404422; cv=none; b=NQSAzyMP9q6n2NBOiXVTnqtYovRZKaq2vB95bL54rzdi+4TgwIPGnOuLV/0fbOO3qn0f2gLWSKH6WPXIIZpvicbhnuR3yut3fGvAYiPZ7rcywLHTsMdo/vCu3pvAZCCl/GwCk3DGdpyN8i6/4cZLaJADKoB1upEwyKWJlNecVK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754404422; c=relaxed/simple;
	bh=QTXIr6x6JFfoPsEUuH6BRX94PkMKXqTV4XOgu1J+2Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PuVHmL4wkMYsNA8ldZbrqc/ruCl2ENhUhEDbytLBYQH14lzvnLV6B9GUjnb15/i6uHY0e0cFo2BpzT5vNRwQghQ0W3na7qPwBOjFao7T0FScWDEceGMd+a08c7vggbYTafsTISGO7YNQ4ayvf2IkEReD9Qw4Q0TPUGmbzaEeqpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UtyqDuR1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UtyqDuR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754404421; x=1785940421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QTXIr6x6JFfoPsEUuH6BRX94PkMKXqTV4XOgu1J+2Ko=;
  b=UtyqDuR14qz2gD7tWj6bM8zFiMh7NBobAdD0IXzY+MsNt65Vo5QJ0RpC
   7grp8kJSZUU9jXwsK22ULm45z40viNr7HdIkBGZgF5g13wt16P1JS1cIu
   F/6D4eVaZu+nPNmM/xZEbmRO3wWFcGXSkfCNmV6RZHuqdaVGsd8Lkrohj
   2wrA9xGXTsQAjeC/I88I4XW0SIom+ZGtfqqPuQLtu7ar9902C+OhI34JM
   7BTzr4MmRyqYYcIQCZfK1qMdxo9aySQd+Heya+LcU5ewofnnPNRwI2wA2
   SLtsC9AYp7osrnsyt8d7vnREhjrTp7nDcsSdAKaWYTLee7r10LZumpoES
   g==;
X-CSE-ConnectionGUID: PfQi357cRqiaGhd4ieU/0w==
X-CSE-MsgGUID: nCR0+peiQCScP5hu3psHew==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68154388"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="68154388"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 07:33:40 -0700
X-CSE-ConnectionGUID: dfZsJJkIRoKQt6ucmPLiCQ==
X-CSE-MsgGUID: zlJhl80aRtS4LOKCgjVEQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="168688791"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 05 Aug 2025 07:33:40 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujIjR-00020t-0E;
	Tue, 05 Aug 2025 14:33:37 +0000
Date: Tue, 5 Aug 2025 16:33:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11988/13293] /usr/bin/ld: warning:
 vmlinux.unstripped has a LOAD segment with RWX permissions
Message-ID: <202508051600.JORbJraJ-lkp@intel.com>
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
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   afec768a6a8fe7fb02a08ffce5f2f556f51d4b52
commit: 6cba15e9daa2a0714c9159a46fd021947745eea0 [11988/13293] kbuild: always create intermediate vmlinux.unstripped
:::::: branch date: 11 hours ago
:::::: commit date: 10 days ago
config: um-randconfig-2005-20250805 (https://download.01.org/0day-ci/archive/20250805/202508051600.JORbJraJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508051600.JORbJraJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508051600.JORbJraJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: warning: .tmp_vmlinux2 has a LOAD segment with RWX permissions
>> /usr/bin/ld: warning: vmlinux.unstripped has a LOAD segment with RWX permissions

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
