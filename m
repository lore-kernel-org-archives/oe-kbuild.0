Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EBA187342
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Oct 2024 18:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728324492; cv=none; b=qSsq3u/skB35ze74aV8gUiPzFWP636MWpTRvF1GKYaHAtZaRB6SY3+sBYF0+p/eHgRCmgpbwQMldNBYt7My1ulaDr5C/L498VbvwhqVICo1HsC92hd/Gy5AbW+1gVSOWrg3Hy4vTw5ba1W3ST3gYSFmP0ngUYvaKFRrtdZo45CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728324492; c=relaxed/simple;
	bh=RQylac6TkWOHXBGQVeB8QKsOGa7QfrwmKPQLd53QSrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pOunmnVWjh9AI2S8hMul7tZ1Cstik5qMGVxfZ20Cdl6BS81lCWMCtQkbvVJnnQtgm4Xv3oP5OlLaqiEQHPlucVQ+z0ZJwscCga1Lt3Kk6b7o+y71MsDQfC0pYBU4HRnQsiSR+z54UF2l3q94CrAm1pkd1UV9cTvx40XOg6PAdY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqenIN5x; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqenIN5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728324490; x=1759860490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RQylac6TkWOHXBGQVeB8QKsOGa7QfrwmKPQLd53QSrY=;
  b=bqenIN5xNC5ZI8g4YP5OpxTw9m4WFhfXubinEoc769Ecb7MRdl7PA9VI
   K7J0mFN0oTThJBugLl1O0VUQm035wx9Ue9A2mTjx8HsL0W2zmPxHzc4Vx
   XI4wFdkX3Jjr9Jcdv4mbzc+l78v8uSaa+kI7HEMoyWrI0tR2QTwKYHTrh
   s5OLfBrL4BmI2c2XkPD4AeIPK9qE5Kmd9+E09X2RD/CQfYZpdEQ0z49K2
   Jiw849GFIbRjk2LP4zt5G0Xlg7ZHX2EEvGFW2sl9onnw9G12kqdyrWtLZ
   g/VZ7szYNJVqs1s6u9nexNQLDYcneTxQ03m9Za6NYts+KXKc6YoVDAwrD
   Q==;
X-CSE-ConnectionGUID: SATFge0jTt+bw/CyDpV4Sw==
X-CSE-MsgGUID: pB1pNP1hRrSKS+QPErrNjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="30370423"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="30370423"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 11:08:10 -0700
X-CSE-ConnectionGUID: P5+clKeyQwaloxt8GGUSPQ==
X-CSE-MsgGUID: hwFPEPG9QvCksidPjX4AJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="80524327"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Oct 2024 11:08:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxs9O-0005NU-0q;
	Mon, 07 Oct 2024 18:08:06 +0000
Date: Tue, 8 Oct 2024 02:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/swap.o: warning: objtool: lru_add+0x70: unreachable instruction
Message-ID: <202410080256.a9t2yfso-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Yu Zhao <yuzhao@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Yu,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
commit: bed71b50b0c2dc38c5e94c84dd660add2d1609e0 mm/swap: remove remaining _fn suffix
date:   5 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241008/202410080256.a9t2yfso-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410080256.a9t2yfso-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410080256.a9t2yfso-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/swap.o: warning: objtool: __page_cache_release+0xac: unreachable instruction
   mm/swap.o: warning: objtool: folio_add_lru+0x6c: unreachable instruction
>> mm/swap.o: warning: objtool: lru_add+0x70: unreachable instruction


objdump-func vmlinux.o lru_add:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
