Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7F0287254
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 14:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316299; cv=none; b=SA902RzOtfo8pVA9OZdoZcl3qsHokqfz/fqduNQbqjpUHi4le8vHzdp8AFczbL3GzNnaUYp3PNVH6SWkgbC/WYnzlz2GxD8aUnYDZNCFhhtMb2JwtsynlowIJV5jy3Il3FF/F0aiTHwXcjcI2YA50b+AqsvBULNBONXjRMAOh5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316299; c=relaxed/simple;
	bh=jT2wTplsAFrlaOJ3K7wJBRNogTfAYPS5lYq/qnEUC5Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tSd+iVvAOiQpigBYYfgCzBkNX3abBlRGsCsTXLGRZH1eDVtRV8S/twOWbC6FrWD/LuzxQ0L+tf+6Bey6NxwNtjDXqeTnCAdKO0APMAYZ7Eva4CqOnwKi4XchCk07bToCddjwM1FuYdPNDkogKG6ml8S/+4GAGELCtfRgPP37e4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJKTbGMU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJKTbGMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768316299; x=1799852299;
  h=date:from:to:cc:subject:message-id;
  bh=jT2wTplsAFrlaOJ3K7wJBRNogTfAYPS5lYq/qnEUC5Q=;
  b=BJKTbGMUwed0P/o9jyxku9WftNFAbpK2k+WZFDePMPCYhp3iqKS0QyeF
   oW28HsTW4BbjU5U5v0Be9IvMPne5uP2ngwlWTpSLerRiqpKuGebYo6O2b
   Q0TyDNGg3lQiuorPSSXKejxXY7bmKIzrF2T/uNEZ9Uu/hY2txpP3FfO6q
   RTeQTZpwTqCat1xj7wfwSKdpvYxRFjsqsyn/tY4cOHmxJO2MZiOt2DzjW
   dZTx53QInqo1hPcOq1oFhH50o7RFkasx2BfWTqeN87Vu6I62bBlwtxEB+
   ZCB1QSeLlmKxRuAFn/P69zlWOEf8Oj13ZGS2b4ligM7HxMe28/hIBO/Fg
   Q==;
X-CSE-ConnectionGUID: QTp+CP/cS1WjeCMG1iWw4g==
X-CSE-MsgGUID: EyxZIvcCQ8WA0GzNi8epmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69334068"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69334068"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:58:18 -0800
X-CSE-ConnectionGUID: 9EQVTWalQsm5tnKzIcMztA==
X-CSE-MsgGUID: 0RHSSP72RO2weUQzapLIiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235658203"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jan 2026 06:58:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vffqY-00000000Exi-4AXH;
	Tue, 13 Jan 2026 14:58:14 +0000
Date: Tue, 13 Jan 2026 22:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/mpage.o: warning: objtool: mpage_write_folio+0x200:
 unreachable instruction
Message-ID: <202601132203.4B2aJ7uo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: bb01e8cc10f0c5b1151a5f047289fcfa5519e351 fs: use writeback_iter directly in mpage_writepages
date:   8 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 months ago
config: loongarch-randconfig-r053-20260108 (https://download.01.org/0day-ci/archive/20260113/202601132203.4B2aJ7uo-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132203.4B2aJ7uo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601132203.4B2aJ7uo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/mpage.o: warning: objtool: mpage_write_folio+0x200: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
