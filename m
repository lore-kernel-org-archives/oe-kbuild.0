Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A23D476681
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Aug 2026 19:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786476328; cv=none; b=Cipx+ZaeZgNVPu0eTTtuntaCO9JNYDOXME4Cv4jFazydvKoDOiWhzRD7JvLRUxhlYdVraCnIA4CI+kokCt7pRFaTat+NO24xrHzuNbZRfHEkn9O2rAChht2UseoJrKt4zuHFMq9RCprG/3dWoh8RH2titJCU7SVd3YA7HIeH/N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786476328; c=relaxed/simple;
	bh=XU43x8adoe8hlotEg9FduWM5gYGc0uUsgNR7/LqLLFQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Oj3u6CL+rMQPELKb0+ykZi6rS7m0XgCUF1XA1PWcjuCXSNeWPrmIqjcLM8X9aKGbbWnuChQ3Zg0o8t11tTfLHarvrrw0X8PazN1hvtZAR2raLE+PvN9Ki4mIos8VeIeyGANLwoSgaxbUN4uvLsgthmKtEKYI3Hf+cMygCTvVAII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgPCqS68; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgPCqS68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786476324; x=1818012324;
  h=date:from:to:cc:subject:message-id;
  bh=XU43x8adoe8hlotEg9FduWM5gYGc0uUsgNR7/LqLLFQ=;
  b=VgPCqS68+VQK4wuW6l3OlFl6+DGYT6aTl2uaNFUA38Xwh3/Whg92KxAe
   FF44SbEw2MRmeu9bToiW2A02qw5r2/VqYY8RCZnHpG9FhNxRGhiMKZHyD
   VCUacR0uBZYPBu7TifN0l9FIGO8sCZm2wNgMQkKKKbtFw8vnoHvymIEQN
   9E9E8DGB6ZHpPgDK7Ou7O0Qa3fWvPUWZ1A8MQ2usZcnJw1o9AoZaLeN+E
   fZlUxHQhBED1kG+qD3OCRWW58gCkgbNm0zldJ+ZUFtMIXDv5IXqCcSEeg
   9MWkMiQ+9oO62IxJLfl9Snqq7jejtO/d6jXxAr72P2OsmdsVxfsYrnh5g
   g==;
X-CSE-ConnectionGUID: tKb1pwbSRDK7YS4b0cjmlQ==
X-CSE-MsgGUID: LXcGhO2kR1+nqay8ZW1zgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="97363608"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="97363608"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 12:25:22 -0700
X-CSE-ConnectionGUID: b2vq5G49RnKMQUEaVwXF1Q==
X-CSE-MsgGUID: XU9qujGvSrCuGe8SDbN76Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Aug 2026 12:25:20 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wts6A-00000000PD4-3wJU;
	Tue, 11 Aug 2026 19:25:18 +0000
Date: Wed, 12 Aug 2026 03:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 13147/14048] ERROR: modpost:
 kernel/locking/locktorture.ko: symbol '__mulsi3' undefined!
Message-ID: <202608120245.HT0oad9D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jani Nikula <jani.nikula@intel.com>
CC: Nicolas Schier <nsc@kernel.org>

Hi Jani,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
commit: bbeb002cdd3772d1c0156ebd2ca828a2d61612ec [13147/14048] modpost: use mod_warn() and mod_error(), clean up logging
:::::: branch date: 25 hours ago
:::::: commit date: 4 days ago
config: nios2-randconfig-001-20260811 (https://download.01.org/0day-ci/archive/20260812/202608120245.HT0oad9D-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608120245.HT0oad9D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608120245.HT0oad9D-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: kernel/locking/locktorture.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: fs/dlm/dlm.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: fs/netfs/netfs.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: fs/fuse/fuse.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: crypto/ecdsa_generic.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: crypto/cts.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: crypto/tcrypt.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: crypto/af_alg.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: crypto/algif_skcipher.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: crypto/ecc.ko: symbol '__mulsi3' undefined!
WARNING: modpost: suppressed 1052 unresolved symbol warnings because there were too many)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
