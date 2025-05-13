Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31773171CD
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153121; cv=none; b=Xn1+MZQAVbH8gkaz4K3tg9yDnIR8wO/5bB6f3IiH81yEmHJtTk+rnQEGG0GBnrwJorOLQDnDbWj+1T8JF5YHqioS8XvvLFxFdBS6jBuCDBwhoqO/A2DuVDDN9AuWmq3bDtgHF1onLnDZZnSdLdwzHFVKel3SDHSYIVTYa/94Fbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153121; c=relaxed/simple;
	bh=17jFvceRlGkzsMTR6nH2sSiqxg6w32qqVdYSs+dbRTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dEszRAyD9kn9fHdg0IitJUpB7242g9zHIyKfDMkslNp/O5yvLuRHx0bFOvwDJR2UulVH3eqhBFF8fQo1QY3uSWvbrY+5j7AzvonIP95lRTtGdy2E1PO7ONyhRU2Jss0ioS7s4nw9KqnENP46uU36dRpcKNAs7E9iT3DC+Cf7bvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oe09PqV6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oe09PqV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747153116; x=1778689116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=17jFvceRlGkzsMTR6nH2sSiqxg6w32qqVdYSs+dbRTs=;
  b=Oe09PqV6bGQCTblcyqoJtAShW0MhRml+zirlKkN+Ita7bvGUFnsOaZJe
   fo3AKz3kJc2Qi6IYS4sHJExjCtS5gauelQRLXQUllzxSAR5A3ywTaFuyH
   tp6N98wm17JfHpxOhmAUJ9Vq3ltC83U1diA1u26WKaP2ViLkYbcunRmxs
   WPfiMfmo7S0OLn24ZgWOkATykDDVKZUugZRxROxYAqxOhf7+V4WFWtv+E
   zF3HjDQbvmMl7KPAS1S1qjNkIsnTfoapLvG1IZIC+5um4/Z431aqrBRc+
   8cawbE36F8SFR31B5N+oXynWiViqIPcZfMB/S2zuaaysIopzexFLDIfY3
   A==;
X-CSE-ConnectionGUID: Pp+7zuHgSWqk4jT043ZLEQ==
X-CSE-MsgGUID: 5GeuMM96TE6CpLXs/QZRYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49160914"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="49160914"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 09:18:36 -0700
X-CSE-ConnectionGUID: TbcgdoD5RA6cz8G0LnZtKA==
X-CSE-MsgGUID: chpoI6voRkmmzodtUcMk8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="137641986"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 May 2025 09:18:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEsKu-000GCz-13;
	Tue, 13 May 2025 16:18:32 +0000
Date: Wed, 14 May 2025 00:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3454/10774] fs/ubifs/compress.o: warning:
 objtool: sg_set_folio+0x60: unreachable instruction
Message-ID: <202505140036.vPRfKfjR-lkp@intel.com>
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
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa94665adc28f3fdc3de2979ac1e98bae961d6ca
commit: 5f3437e9c89eec7bbf0ee5f582894d41f57528bc [3454/10774] crypto: acomp - Simplify folio handling
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250514/202505140036.vPRfKfjR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140036.vPRfKfjR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505140036.vPRfKfjR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ubifs/compress.o: warning: objtool: sg_set_folio+0x60: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
