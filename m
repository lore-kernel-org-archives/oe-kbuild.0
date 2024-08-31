Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70A018C3B
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Aug 2024 01:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725067007; cv=none; b=qe/sKe8DBWYXBesfoS7DP9SxNpVbmg0UnbDp7QO218M3LeBn8qTRHB5wKdRrnHhA9V5ion1L23tV8ViTBWlSIjf+kG4mqSHJqD6oPrbaJHGwjAVkcotxoYJCIBq30p9zv7eOv1AJs2thUgyyY5xLk/SrsF3+uEaQUeu8FZsXHlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725067007; c=relaxed/simple;
	bh=5sKyRavId5OGNE039U9nzpaQ8xSgfocLDzRa9/6ifZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l8rPKHek+8kELQb3SOWqvoUG0MLQOIRa8uHhAp5gqQfw/MW7KApKXDs5H6CmEC0jR9TL54o/B8Q6eGqi6RLy4V1jd4NguFiVn2sQysJpiuiUrhb6Bl5D3aKSUDYMMJOAhaybVkNeP6Z0pxpbLVa6P0ObaMogYCUNG5L4qy/x1jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haO/yhde; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haO/yhde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725067005; x=1756603005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5sKyRavId5OGNE039U9nzpaQ8xSgfocLDzRa9/6ifZk=;
  b=haO/yhdev5ZfBixmx5Vz0zLUyLWN/iQO4ATWbMB0VhcwlMegI9ipZE12
   4pZzwN63EkQzL2moy7w8PpeaGWAIc31VJk3+6kDrWFnhZJhzHsWjWS00G
   PWT0d2Ae68t7lzMXYB86muKN5AHpSzktNin4j4tbNdu/WEBP2C1xWWkLw
   pLJKdvnFjCSrupMq000P+xkrcq85j4bi0oxueLWrbT4aijNg8MDgZPGzA
   nfb1YKJKix/7gW+gieCpLB0oECY0BdUNr71xy0HcAyamd0Ja+eGNYTaHd
   FawvdxQGLrJ/dA+y15SgfLMz+UZK4c5Uu33AnGLbX8iS1nHF3ad9aHd9S
   w==;
X-CSE-ConnectionGUID: 8H2Du9NQTPK9joa+qitf4w==
X-CSE-MsgGUID: XPVNi7f7R4SrUZ85bJz0xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="35093798"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="35093798"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 18:16:44 -0700
X-CSE-ConnectionGUID: AfadMsDsS+uMRhwTeRJW/A==
X-CSE-MsgGUID: p3kX65StRLuiOxuhxCEX6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="64107867"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Aug 2024 18:16:43 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skCjJ-0002GQ-1I;
	Sat, 31 Aug 2024 01:16:41 +0000
Date: Sat, 31 Aug 2024 09:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7819/8126] make[1]: *** No rule to make target
 'tools/testing/selftests/../../../tools/arch/x86_64/vdso/vgetrandom-chacha.S',
 needed by 'kselftest/vDSO/vdso_test_chacha'.
Message-ID: <202408310955.cCii598q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

Hi Jason,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
commit: 091b6210c648a068bd9584849d82231058253029 [7819/8126] selftests/vDSO: open code basic chacha instead of linking to libsodium
:::::: branch date: 19 hours ago
:::::: commit date: 31 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310955.cCii598q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408310955.cCii598q-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
>> make[1]: *** No rule to make target 'tools/testing/selftests/../../../tools/arch/x86_64/vdso/vgetrandom-chacha.S', needed by 'kselftest/vDSO/vdso_test_chacha'.
   make[1]: Target 'all' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
