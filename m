Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2446A2F5328
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 20:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271450; cv=none; b=EmfPkk4uPezXa9lCFK4ZaNpTVYnJn+nRVNx3581LCLoYc45bk8eUdeHhO5FcbL281ccFQbWLELs6IMQdSXbjhkHSPgVSciI15Jnrqg4msRORmSXBv6P1fwdhe/A/KwZPyFLlpYrYWpmkMQJ8REyoHGw3yvypLr+NIKlOMo9WxN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271450; c=relaxed/simple;
	bh=+yHTNxTlp4pcrK+14vwTck2cgUaOPJMOoySguFAOne8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CxRr4qysyDCdjnfWT5SNpsSZQJXhM1/AMMK70v88c7On0/vXF5H5jCp44AeEeg3yTx9x5EkZ38adw3pdGxdNKNl5tMABLOUqDMlJs18OG9wlKvTVdx9bgEUXQJVYMFoMrTS60MKSxjBgov4vds66ZcZwNvw9/QKMKY79aBFzjDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hy2G+Lkv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hy2G+Lkv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778271448; x=1809807448;
  h=date:from:to:cc:subject:message-id;
  bh=+yHTNxTlp4pcrK+14vwTck2cgUaOPJMOoySguFAOne8=;
  b=Hy2G+Lkv0AlywF0k9clpFo5RpOKoCAj0FDKjaaSZyvoU47uV1bmorcgp
   CkqwN2UqJjFZ7ZEnhF/gl1fw1vpnM+1cjRK0FPOitEmCY5vbaAczg6jpo
   4ICrscwShOx3RjIRgpagNsn7vO49ba+R6uqnxAIU01B+1VVYHRgbvHoVo
   FgoMefr05Ovl6h5lph9hFPyFqADHjmN8aDVctMDvwHiDcTOTQjr9liTeP
   aR4Z3vYVuOaEeFAqeOegJTpgX8XnIlf7l5jWdBlIA3Ha8fgaL/oJetFFQ
   sMVwOYEG7q+oaMNkYZp6OHYh6Q0iVym0SSemFXJqdD7Yhv67ck9tqVqQz
   w==;
X-CSE-ConnectionGUID: nKsHXwjOSFKc7f3UHZVBKQ==
X-CSE-MsgGUID: SSvS+lkWS6CApWt1Ogiulg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="78973758"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="78973758"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 13:17:27 -0700
X-CSE-ConnectionGUID: hwTUPZNNRNyTY57ZLaVXHg==
X-CSE-MsgGUID: XObfha/2SrCRkypQyrwL/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="241819154"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 May 2026 13:17:26 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLRdU-000000000PT-2oNT;
	Fri, 08 May 2026 20:17:24 +0000
Date: Sat, 09 May 2026 04:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmckrcu:dev.2026.05.01a 16/34] lockdep.c:(.text+0x7aa2):
 dangerous relocation: call8: call target out of range: dump_stack
Message-ID: <202605090419.7FW8XMyA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/paulmckrcu/linux dev.2026.05.01a
head:   399616f02d88db2a2220ba60de0c5f9bdd3388dc
commit: 84124cf7333a5b5f117e49d7f58039367eaf3b8a [16/34] hazptr: Implement Hazard Pointers
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: xtensa-randconfig-002-20260508 (https://download.01.org/0day-ci/archive/20260509/202605090419.7FW8XMyA-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090419.7FW8XMyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605090419.7FW8XMyA-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/locking/lockdep.o: in function `__lock_acquire':
>> lockdep.c:(.text+0x7aa2): dangerous relocation: call8: call target out of range: dump_stack

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
