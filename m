Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196BF334695
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 16:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763570660; cv=none; b=LXS432Ts6ru/dWw25JRn3rfKJ/B6te8jrHLf8BA9wxao5pNfLUxCtkNKyFM1AdpjA3ACSsLo+S4MULQmb2Ps+tHnIrlasGnhDLP357+x49OjozrrxRr2OhR2/s3a9iMaQ7XXGsaBdCl+Qo7fXuJNcBtUamjx7UnWRtreWUrcJdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763570660; c=relaxed/simple;
	bh=4XrZeaPLKtN7vClMmc9x0R+7HpVgIT11srGHgIlvU7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hVcm3zjU28N26Xsaynt/2WBiahtxpvmkUaej9BOSmzZhrrzanQaEMFv96clSqBUZMUT75231dUBDjrsgUi7Bl+AKHveCSyutkVy+5W48FWPQFoCD4M6EM1Odtzl7f7k246E6KWjWLcYCdGNGNNBp80xnb2oJRvi3LZ7YeCOqYnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GepXW/dU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GepXW/dU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763570658; x=1795106658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4XrZeaPLKtN7vClMmc9x0R+7HpVgIT11srGHgIlvU7M=;
  b=GepXW/dUqGymAn2IqM6/12B19OINisGACERF3Tkx4xaMwwufaWzch8yD
   6aDPpZK7sQ04mlQzKIygBX/vCJiQO5mHaSBWC4qWebhXfX9qtD3wunmF0
   8gXzRPr0kMccuu58MMADSQAaYHhYLnUkZsXUJXap6P1ZibnzxQhwc7acv
   lO4cwvgdQ8I+vV6A82bX7JfKRF174DKY7BdfOAhT4/DFv8+pgHNxmWsAa
   gH7T58iz38WUoL2MQ7abfgZdpEzbRAVv6rNIkjsl6XsWkFncbMsoc2E/f
   kNA/YJhAZz5pYzqvbLuykGLUu4eR4AOra7RMPHUd01BNVHphxL1ncLz9Z
   g==;
X-CSE-ConnectionGUID: E6qSSrotQ1aDI6RIwbUT8Q==
X-CSE-MsgGUID: NbFHFL7SQaK+r0N3jpoizg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77085713"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="77085713"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 08:44:12 -0800
X-CSE-ConnectionGUID: Vcf+G8ygRAGRUW6tANiHGw==
X-CSE-MsgGUID: SL4vMFPCSDmKegsjPY24jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="228435277"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Nov 2025 08:44:11 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLlHt-00035x-0W;
	Wed, 19 Nov 2025 16:44:09 +0000
Date: Thu, 20 Nov 2025 00:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/md/dm-integrity.o: warning: objtool: sg_assign_page+0x20:
 unreachable instruction
Message-ID: <202511200025.BiqrEok0-lkp@intel.com>
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
TO: Mikulas Patocka <mpatocka@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8b690556d8fe074b4f9835075050fba3fb180e93
commit: 5076d4599ce1702ab3615c7600504ba68df02168 dm-integrity: enable asynchronous hash interface
date:   8 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 8 weeks ago
config: loongarch-randconfig-r071-20251118 (https://download.01.org/0day-ci/archive/20251120/202511200025.BiqrEok0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200025.BiqrEok0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511200025.BiqrEok0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-integrity.o: warning: objtool: sg_assign_page+0x20: unreachable instruction
   drivers/md/dm-integrity.o: warning: objtool: do_journal_write+0x44c: unreachable instruction
   drivers/md/dm-integrity.o: warning: objtool: dm_integrity_map_continue+0x45c: unreachable instruction
   drivers/md/dm-integrity.o: warning: objtool: dm_integrity_dtr+0x34: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
