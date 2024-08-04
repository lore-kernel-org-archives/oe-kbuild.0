Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954A23BB32
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 14:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722782436; cv=none; b=uILRkiDgEQeOcOOVFrYGjErN04ij9Xkz0rVk4b4ieBKItZWd+RojzzoyQHeBkqVJr5KMkJoRuYZEC4DFuH7tc31jdUojfzCoTRj/RaxzOvcdzsvmeXRHbWk683yRjceZrpKs+q7OlMRzaO2EQ/3jak4rgUsDQ3cEBfGdSJGE1ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722782436; c=relaxed/simple;
	bh=HC+iqYHJDuHJc24OeCx/z43A8MNOGJp7YjPVqGkoshE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=enxrhy21eIqQekKz09+c6zmZ+XQmPPJ2zYij2EvUhfAsga1QnqsG+SD3lfdApj3bFJPLtZc1kj7iwIl5yCqTva6Dg6706nR2KdnzNqmbcaNtf+lv7pjCyCLijnMF7fioKvlkuCsk1yujO7WbtqFs+q0ofqiJ8xE3IpCEgktrpSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/jA/+nu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/jA/+nu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722782434; x=1754318434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HC+iqYHJDuHJc24OeCx/z43A8MNOGJp7YjPVqGkoshE=;
  b=V/jA/+nuBRYZ49Q+mbNM4Ev0L9ju/KcoK7RDz11mg+yRtFttGIMhQjjz
   lZFkqq2+tEaFi5m+1iOYYHirJei5lmYeAWoxMJ2Hnb9hUCKKPCAQwQluL
   pT7OwoIaVNWTNMHmN4im2WaVS+5y3DTQZ2qvOnPN7dYR/f/soY4ZP/pHA
   I9wB1M/t+UECvEPtRyr9lTMzSf8G/gls06JES5QUyFz+b66IFDkkVLgrM
   PwCDwNz3M/flAPMLcxqhwIzqeoBzVL/zTSX3TTzANQd1SCI0Y1KBhydPi
   soVNJapIKyuH5Ez4dmom9VMquGEn6sZ7m+3Y1mEI7CLMnJv85ykwPr3af
   w==;
X-CSE-ConnectionGUID: uyVD5ObmSA+prssWx1AGqg==
X-CSE-MsgGUID: p3iIMR6KRPe8Ne7kxyVH1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20883168"
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="20883168"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 07:40:33 -0700
X-CSE-ConnectionGUID: hjvECVfJQg6gqSm0VnzxCg==
X-CSE-MsgGUID: TdvflgdoQpSKevtN8tZX/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="93449421"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Aug 2024 07:40:33 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sacPO-0001TV-0x;
	Sun, 04 Aug 2024 14:40:30 +0000
Date: Sun, 4 Aug 2024 22:40:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linyunsheng:page_frag_cache_v12 7/7] mm/page_frag_cache.o: warning:
 objtool: __page_frag_alloc_va_align+0x78: unreachable instruction
Message-ID: <202408042259.bVxvDhdT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yunsheng Lin <linyunsheng@huawei.com>

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v12
head:   6df818aaf9213eb10cbde211ac87c61f0db7f27c
commit: 6df818aaf9213eb10cbde211ac87c61f0db7f27c [7/7] mm: page_frag: reuse existing space for 'size' and 'pfmemalloc'
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20240804/202408042259.bVxvDhdT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408042259.bVxvDhdT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408042259.bVxvDhdT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_frag_cache.o: warning: objtool: __page_frag_alloc_va_align+0x78: unreachable instruction


objdump-func vmlinux.o __page_frag_alloc_va_align:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
