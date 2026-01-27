Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3979343D76
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 10:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510796; cv=none; b=Mo4VGgB5qHfQXOaNrIhRsaf9EC5WIgKtQzgVpHMZAO7r7OyqXgtrqrgIFvKoYoBPOyP9uDelns55Jg9KN1DmXbysWmMfgc8DHHbLNI8AN04dZCAdOLA1S7MiNouKkzca0yNvveu0x5B1EUotZI6rdj99rR1gqwbjFeI+nwggwOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510796; c=relaxed/simple;
	bh=LE8dCw4MNj6LNdFT4jOeejiOVEHYmT/pna01EOoGYhk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PJtg1OHEs8gRO09n7KrjhjenMB5oJQGbv88OMMu1mqhTTM9bssmZcQM9mtKduWMw6TWPHQm2Yg5n8fwvvU15rAe9uZEJ9px6uXMW+Q7tlaSPoDYlbr3O0FTf+HTXIkFK9xG4B5AafHhTneqgDEwTr1PdQHKtZxmUv/qMQpLw4aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyRX3MCg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyRX3MCg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769510795; x=1801046795;
  h=date:from:to:subject:message-id:mime-version;
  bh=LE8dCw4MNj6LNdFT4jOeejiOVEHYmT/pna01EOoGYhk=;
  b=cyRX3MCgUWmKI4jRoHRM5d5JK9sg5pZ3hj4neCbAY+E+VPqPPzpfSghY
   yD8JW3d2FAVZSib3y5uh5Z7aETbUxypIZ/EkyTvId2JSb1Vq2h/5X3OVo
   ll3RdVLK86IVfWbHqCg5iI69iPjXBM1WFzbwojtm9Gc1IckPTwQ0av9CG
   RveWDsF2/EP8oDcp3fR9HAKcduy7TgE++2GA7auejqYpFZ2JInkqbviva
   pffGEYOO7/F8cNGKpb5N2Ej4hWOCT6zn5+o4isXWNm0kveA6MmpmVJSIA
   I2XZUbT7NBVRfzJZzZTxzd6HWJ8kAHcd9y7zJPxe5Upv352wtVJjaW1Ch
   Q==;
X-CSE-ConnectionGUID: aA83h2MUTvmD2dV7jf2Ejw==
X-CSE-MsgGUID: 2I9MHXBUQtGZ6KVPJaoWPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70744608"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70744608"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:46:34 -0800
X-CSE-ConnectionGUID: AvXX93zOQ/K/GV1GtjuOhQ==
X-CSE-MsgGUID: NVrM921rTvSOHhszWW6hHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="239212368"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jan 2026 02:46:33 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkgad-000000001p3-38Bt
	for oe-kbuild@lists.linux.dev;
	Tue, 27 Jan 2026 10:46:31 +0000
Date: Tue, 27 Jan 2026 11:46:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v5 3/7] mshv: Improve mshv_vp_stats_map/unmap(), add them
 to mshv_root.h
Message-ID: <202601271157.PHxNNmW4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260126205603.404655-4-nunodasneves@linux.microsoft.com>
References: <20260126205603.404655-4-nunodasneves@linux.microsoft.com>
TO: Nuno Das Neves <nunodasneves@linux.microsoft.com>
TO: linux-hyperv@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: mhklinux@outlook.com
TO: skinsburskii@linux.microsoft.com

Hi Nuno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-Das-Neves/mshv-Ignore-second-stats-page-map-result-failure/20260127-050500
base:   linus/master
patch link:    https://lore.kernel.org/r/20260126205603.404655-4-nunodasneves%40linux.microsoft.com
patch subject: [PATCH v5 3/7] mshv: Improve mshv_vp_stats_map/unmap(), add them to mshv_root.h
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260127/202601271157.PHxNNmW4-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'and'
#8: 
on root partition. However, they will soon be used on L1VH, and and also

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
