Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35A73F5BFD
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 12:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786968574; cv=none; b=T9624PpnoA/XeF6mxrnZGeY/C+Tn7zs11vPQztmN45MgRhgsZhSvaHi/0y/9eariEahEBcT6W6SkhQCQtXb9lKJvQlmg5k8rXQx7pgGKytK+4OqtnXTUAGrDvP24hPAL56vTkgkBb4D9cYomQIgemq6wiz5LA/CxTwrzGUeputM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786968574; c=relaxed/simple;
	bh=guKembmd/z+HiQb65DCqQ2ysYeZMK5f9Owk4BwBfbfM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R5Al/LhuhwRKoVUTRqNqypeLTDkNDehB7uvgwaYK5lNeuHPaOGrvp6sCkeoQAxaVEbQu83WzeXcWdlQJHJS6aLHMjWDDHH4sCquxUGqAACpTPp+amJj6MpHH+0PqyZh3vd8/H6eycHZXmYHa+g8fZP7HfhlMeR03NZfrw/lDM5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dEKZYt/z; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dEKZYt/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786968572; x=1818504572;
  h=date:from:to:cc:subject:message-id;
  bh=guKembmd/z+HiQb65DCqQ2ysYeZMK5f9Owk4BwBfbfM=;
  b=dEKZYt/zcJuTEJeEBE8QrZUeGhcUA+VJxRAXOKIDJiApnFM9oVXalsuM
   D8fnv27w+r8QKambDKDPwjyOU7O7nWAeMXpDeGDg+rZ8th3m5ThFXM2L4
   Z1KkhxCrV0THDXC0yw9g9/uOvuQh3CfASyCp7gLNewruo5Zsce+i5tAyC
   T3FUl14tynIRK5xa7ULjCARWeqVJHhS4wQsEBHqR/CfbJ3x4b0IYtFo73
   hPcqZj68dZS5Jk7a3S6TH8kaDsvu17UPk8i/u2b/2t7CjotbsITZgg1g+
   SBV3MNLk0YBnKlo9XqcIb1XM34ASkm5eJurQVJAQ7rhxQgp7FYL4a7WK+
   Q==;
X-CSE-ConnectionGUID: s65NdQHrTUOtMEjF1Q1VcQ==
X-CSE-MsgGUID: wnQUJxuDSEWc8kWX5SlK7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87359696"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87359696"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 05:09:32 -0700
X-CSE-ConnectionGUID: 7hW8OWIESdOnjk1ffR/8Wg==
X-CSE-MsgGUID: F9c4MMcrT+mH8hYtkkt0Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="303134521"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Aug 2026 05:09:31 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvw9g-00000000dSE-1yBB;
	Mon, 17 Aug 2026 12:09:28 +0000
Date: Mon, 17 Aug 2026 20:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: (.text+0x90): multiple definition of
 `liveupdate_flb_incoming_early'; kernel/kexec_core.o:(.text+0x1290): first
 defined here
Message-ID: <202608172004.KmCQDw8e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Pratyush-Yadav/kho-drop-restriction-on-maximum-page-order/20260815-221525, commit: d0e70617c45e88d720e7461e6ea9f2d136a610c4"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pratyush Yadav <pratyush@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pratyush-Yadav/kho-drop-restriction-on-maximum-page-order/20260815-221525
head:   e99e331639f1c4883ed41f9a5201e7c5aec1bdbf
commit: d0e70617c45e88d720e7461e6ea9f2d136a610c4 liveupdate: flb: allow getting FLB data in early boot
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260817/202608172004.KmCQDw8e-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608172004.KmCQDw8e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608172004.KmCQDw8e-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: mm/mm_init.o: in function `liveupdate_flb_incoming_early':
>> (.text+0x90): multiple definition of `liveupdate_flb_incoming_early'; kernel/kexec_core.o:(.text+0x1290): first defined here

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
