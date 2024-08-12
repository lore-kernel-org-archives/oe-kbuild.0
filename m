Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5683E13D53E
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Aug 2024 04:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723437289; cv=none; b=Vqdl2kTwPenYtqoCWmZ2MSMO9y6U53oIQV4TgmvibmnAKINUzTuADENWdJC1MuEdKrV+/BckZSqnflrTi+p18R8vTIw0CaUeY/ZUIPxSZRbBu6IcERe+ssXzYxE6qtek25GTF9QwKA3pGiECUYLE+UWxX6VH4Dkkd6TYz2M3Dss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723437289; c=relaxed/simple;
	bh=OnWy/7ZVJK827uBtQQnROGbqLZl3fmJu8K/rqyoYSgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PmqP/amPvQud7nCqdpKgpTga4htbFGNsiXUx48BxUcZMKnjas5VZ0Or96tvcVsVEhlIhh6+mRmXuc/I6y0NX7DmaHrTtBO6uwvp3h9XbJ2m7MXKJkJSD1Brom7eH3mWv9WO/AM9dJzIV1XLBQVntr426z2oTQL2Plhu1zENJOwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8Jnj6yS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8Jnj6yS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723437288; x=1754973288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OnWy/7ZVJK827uBtQQnROGbqLZl3fmJu8K/rqyoYSgg=;
  b=e8Jnj6yS4KslauMCEiOR+bcVlyaCkVHFdk/cLOJRviDY5wHljm2TYKmX
   We5r9s/jK2YjA44UMJsQXxKUN2LsGTTLZitqhyS+6nSPLBeVzgMMEDXSK
   Oxs01eMfX6iTP2p67hW1eamwN3Yq6M5UVEU6N2kyvTiL0+RbIneZmcXWr
   HCGkRxFRvaAP2c7OYXm4dQdaozTI5g5nATT1ea5m+oRG7rlk15VqFeJ3Y
   rK9p9/GAkYFpAAo9OpkYEcDHCVJnkTIlqFvpvVPEzl7wcjosnhLdpQePT
   3OEk2Hh7QokFGGX0ihMF7I7rnqDaVhTgHv23GxD8mobNuRTYOwOu73uc8
   Q==;
X-CSE-ConnectionGUID: AWhXVF7xT06DP7eu6SxmMg==
X-CSE-MsgGUID: 4trpTZ4aQmqHSusIBBlSZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21339429"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21339429"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 21:34:47 -0700
X-CSE-ConnectionGUID: /dFp29OnQD++2bydMqKOuA==
X-CSE-MsgGUID: MyA8HvuQRkyzwTvqBLp38A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="62981346"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 11 Aug 2024 21:34:47 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdMlY-000BOX-2I;
	Mon, 12 Aug 2024 04:34:44 +0000
Date: Mon, 12 Aug 2024 12:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3752/3984] fs/bcachefs/fs.o: warning: objtool:
 bch2_evict_inode+0xc4: unreachable instruction
Message-ID: <202408121242.9OUPT5h2-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   61c01d2e181adfba02fe09764f9fca1de2be0dbe
commit: 57c857de2aca0d53e90de29326aba60f02914aaf [3752/3984] bcachefs: switch to rhashtable for vfs inodes hash
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-r064-20240810 (https://download.01.org/0day-ci/archive/20240812/202408121242.9OUPT5h2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408121242.9OUPT5h2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408121242.9OUPT5h2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/fs.o: warning: objtool: bch2_evict_inode+0xc4: unreachable instruction
   fs/bcachefs/fs.o: warning: objtool: bch2_rename2+0x494: unreachable instruction


objdump-func vmlinux.o bch2_evict_inode:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
