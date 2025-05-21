Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2991DF72C
	for <oe-kbuild@lists.linux.dev>; Wed, 21 May 2025 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839448; cv=none; b=rBWZfbKYXNjnlsDJLSKwLI7HzRvSiYjW+iEvnCsVrfs0UAI/H3Fac1w8A5QkyDIMnNdfaokqSj+qy4cfAisSfxdTkzSmJ5r5MfupGi5okKjNRvrxRRZTChStG9hqbggIKAMRhqrg/LpxK0g3tcAyOBQq0lYtkad1/ZZyXawDmok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839448; c=relaxed/simple;
	bh=mqi/WVIgJUCfDJi0wi0gxBK/A8YvLcQkDBCaYUF4Fzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n5Tz1QnI+nu+h7RmN9n9KFA/4eraOhmrJt2mthg8zWzRrPbUNyaI3pUoUDF8Z8g8CAGcNY9yw79UZQ1Yl64mQcn9tIzjjP0FY3UADNCKIvq9C9dEMa6lPvT1Y9baGArajdv/tL/jt2kNN1K6XwJ4uJ1zWQauG5gDyXnCLm0rXlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PO5PPEEX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PO5PPEEX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747839445; x=1779375445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mqi/WVIgJUCfDJi0wi0gxBK/A8YvLcQkDBCaYUF4Fzc=;
  b=PO5PPEEXlX7dmdf/Vv84dJNfhPJa5q/bYd8agf6KH9TaoQrHkH6iYOg/
   L0FLrv8cp0jorQOlAsmONQPWxkxQSjbuBa//y0bu4/R/hK7mn87Du+qpQ
   5nGNexESPPt7nvSp0xFy5QIuTe2PdFJbbYakz1CGMlNgJnb3H259c4XO1
   IIO71y6ovrzrfgC91vmadIBOb58Pg9DsSXsSzONVt9av+sK4I0UYqU1lX
   Sr1khVV5IazIq1o+6vf1QPssRp1RMebU63WV5fRaCK+xoa7UoNX7JtCod
   VPrhjWoidkzLybEsA6X56/ZFL6at/IqKD5hE/6gtcLm+TNig9oNQU75aN
   g==;
X-CSE-ConnectionGUID: /JUQeNp9Sy+JLzJyvq246g==
X-CSE-MsgGUID: +Yhv0gHLQqeGuAyRSrCRug==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49522384"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49522384"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 07:57:24 -0700
X-CSE-ConnectionGUID: jovpU2WGT3OxonLEdjYt7Q==
X-CSE-MsgGUID: gf9daRQxSjqww/oF5nndsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139957791"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa010.jf.intel.com with ESMTP; 21 May 2025 07:57:23 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHksj-000191-1l;
	Wed, 21 May 2025 14:57:21 +0000
Date: Wed, 21 May 2025 22:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: error: objtool: wcd9335_slimbus_irq(): unexpected end of
 section .text.wcd9335_slimbus_irq
Message-ID: <202505212244.Ta6gQmTX-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
commit: 188d90f817e13b66e03e110eb6f82e8f5f0d654b objtool: Append "()" to function name in "unexpected end of section" warning
date:   7 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-2005-20250516 (https://download.01.org/0day-ci/archive/20250521/202505212244.Ta6gQmTX-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505212244.Ta6gQmTX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505212244.Ta6gQmTX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: wcd9335_slimbus_irq(): unexpected end of section .text.wcd9335_slimbus_irq

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
