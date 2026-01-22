Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5BB3A1A2B
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078880; cv=none; b=jgxU/1D9Trn+JHYtFw7Rrqc+lJU8vXvEXUy+9r/F1zG2D+xJH75GPX18rjTD7Mf0qPxASX1oYAUYPKJ1s+Pkii2lXfavF29hznsF1dPyAeRFg3vQPRSz+KdAiCtVCdaI0uPUloiZGdk7MEr9UH2SfZz9J1tqZ2X77txACRIM+Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078880; c=relaxed/simple;
	bh=71is3HMayw4mtBVvjJvGQVPDB47UAMAaQhLs+YxGjAI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N5ZXLQLTWSmO4SYWFNqn8f3UV94CYWL/j4QErkoqZuoPFsmS0WpRLnDxmAA8MzKRGQvxmzTYv9jbfrBmqZP/yfZ2fkURFxO9kuhlJrQvuK5VFMOwov0kuVhn2RgilCxcz96nzPmApeTlQNR051Ih7FG7NsPfOO8RvYmTpkBVZgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hLVVngxF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLVVngxF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769078878; x=1800614878;
  h=date:from:to:cc:subject:message-id;
  bh=71is3HMayw4mtBVvjJvGQVPDB47UAMAaQhLs+YxGjAI=;
  b=hLVVngxFtN/0LqUObfm96BeiW2Zmk2w8OwyVc/kjd2tdGlfz0prq9Xxo
   Sa4v7f1XDzBQR+JHjVGJGUZjhZ/AurycmOfqk+yw3nIQTdBDAOgJjvlie
   DPOmPR+V7h8bUhkjRHmBZYiw3RZnBEBwV3Vimmh7OsYBdtC58UlTrY1Em
   zqToyvAf8fbvSzfnFRVUwAZPsfi1kEdcMcfYXKSvD7Nu22G1s26C/mt8E
   IapHRGGldjaAQJYINAQYgdPIESEa6pFZlcRWrDeqi2RbuWW2bk8N4hN/E
   QWwUBGq00VoENHY50N/ygDIx4eN+GUnE0WEWffYHmteGwx+2bvmhsmWfW
   Q==;
X-CSE-ConnectionGUID: f5EswPOFQQKf3KO7G9agJQ==
X-CSE-MsgGUID: 2VN5bZ4BSuKylFbK6o9wng==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="57882071"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="57882071"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 02:47:57 -0800
X-CSE-ConnectionGUID: tnsb4MC5TAO5iHgGkWbDCw==
X-CSE-MsgGUID: NGKujfaoRimIwzLrVSE4AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="237966554"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jan 2026 02:47:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1visEE-00000000SkM-1Cf3;
	Thu, 22 Jan 2026 10:47:54 +0000
Date: Thu, 22 Jan 2026 18:47:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-sound:for-6.20 19/20]
 sound/soc/codecs/cs35l56-test.c:362:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601221827.mgLU9CGA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: sound/soc/codecs/cs35l56-test.c:362:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Richard Fitzgerald <rf@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6.20
head:   be9d8d966447aeb8f0f8047503195bdd128ecd31
commit: d0ab89951197f0fc509a0cd732d830880e79c2d4 [19/20] ASoC: cs35l56: Add KUnit testing of cs35l56_set_fw_suffix()
:::::: branch date: 18 hours ago
:::::: commit date: 21 hours ago
config: sparc-randconfig-r131-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221827.mgLU9CGA-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221827.mgLU9CGA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601221827.mgLU9CGA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/cs35l56-test.c:362:1: sparse: sparse: bad integer constant expression
   sound/soc/codecs/cs35l56-test.c:362:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
   sound/soc/codecs/cs35l56-test.c:363:1: sparse: sparse: bad integer constant expression
   sound/soc/codecs/cs35l56-test.c:363:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   sound/soc/codecs/cs35l56-test.c:364:1: sparse: sparse: bad integer constant expression
   sound/soc/codecs/cs35l56-test.c:364:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   sound/soc/codecs/cs35l56-test.c:365:1: sparse: sparse: bad integer constant expression
   sound/soc/codecs/cs35l56-test.c:365:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +362 sound/soc/codecs/cs35l56-test.c

d0ab89951197f0 Richard Fitzgerald 2026-01-21  361  
d0ab89951197f0 Richard Fitzgerald 2026-01-21 @362  MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
