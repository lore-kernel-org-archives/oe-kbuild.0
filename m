Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559983101A5
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 02:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962507; cv=none; b=YR4etuS0Bi0+/mcdOioR2A6iiOJYX4hv663zfEwdQSN8Sw+TJvhNif+VJlA39/Js24D8O4RvhDhvQ86R+vJWyNkOvtImfiyf/LNvucPH3HcUOcsxWMmFm/0PrYW2WHGYMxeeGWbrEG5gqvWeWWetlTuZad08PucSOiBv4Zz3Th0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962507; c=relaxed/simple;
	bh=f0WEp7zDFRDJqxWeybSJ4epBF7oLj5s808TO24Fsha4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wq128jHUv9VTvhGuPVNDHuV0dz0CYA8K5E96LSFfBHRonqa4vj62A62r3ilLDwX4IKQHcxtY2bUUWSc8d8u8HUl0pH1emXhSQlWT+dZL3nPV6Ep/G2WKXvO4tXCMKgDU0PjayQyqL0ajYzYK2C6krEwN6/lUcTIkPPNiFCLOApo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHmX+NHj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHmX+NHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768962503; x=1800498503;
  h=date:from:to:cc:subject:message-id;
  bh=f0WEp7zDFRDJqxWeybSJ4epBF7oLj5s808TO24Fsha4=;
  b=LHmX+NHjJ9FcT51pcVl28ZQAhS5D7fJNEm9M+77j45TVAOXvdyaNXJ1p
   7yZpdm3fiCvWdPRwO2ZQ36jWBYoiNKzgR5XRbZxPlZOSz6JT/q5vkJYyD
   zxkSqmY+plNGoQcZYT/z/sEJ7XMIOKZVWw3CX48Rr4Dc6l0xKjsx4mHCm
   es/mdcRhMf/o6kEPhWngiciNzCwSiorUPtebXoOqgcddipIe5Nhtv7hys
   B4q/oYz6wetCRSZmxafraloK6p+zfKj8fNb3N9fNtxqrlhm7a22PW+5Dz
   ycJUkMK9TO0Vf5ZBHY5eKIV0bO66u3P+s/l4kj7hw+zkN9McW9o0X4uBl
   w==;
X-CSE-ConnectionGUID: qplixcPVRQ60Ys+/hwOGSQ==
X-CSE-MsgGUID: NcTsdY0HSBWImY0XnrxjvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70238660"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70238660"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 18:28:18 -0800
X-CSE-ConnectionGUID: GPXcRXe4TCSKhqhsl4vOFw==
X-CSE-MsgGUID: q6MIPRqHTuGiIX6fCE7ehQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206339923"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Jan 2026 18:28:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viNx8-00000000Pr3-1WBa;
	Wed, 21 Jan 2026 02:28:14 +0000
Date: Wed, 21 Jan 2026 10:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6974/8302]
 drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:60:1: sparse: sparse: bad
 integer constant expression
Message-ID: <202601211049.BNLGTiRl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:60:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   053966c344dbd346e71305f530e91ea77916189f
commit: e281760de51d25a34cd71fbaee73fdd7e69edaab [6974/8302] wifi: iwlwifi: cfg: move the MODULE_FIRMWARE to the per-rf file
:::::: branch date: 10 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-r133-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211049.BNLGTiRl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211049.BNLGTiRl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601211049.BNLGTiRl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:60:1: sparse: sparse: bad integer constant expression
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:60:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:61:1: sparse: sparse: bad integer constant expression
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:61:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:62:1: sparse: sparse: bad integer constant expression
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:62:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:63:1: sparse: sparse: bad integer constant expression
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:63:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:64:1: sparse: sparse: bad integer constant expression
   drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c:64:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"

vim +60 drivers/net/wireless/intel/iwlwifi/cfg/rf-fm.c

e281760de51d25 Miri Korenblit 2025-11-10  59  
e281760de51d25 Miri Korenblit 2025-11-10 @60  IWL_CORE_FW(IWL_BZ_A_FM_B_FW_PRE, IWL_BZ_UCODE_CORE_MAX);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
