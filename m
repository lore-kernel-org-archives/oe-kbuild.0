Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6023EBF31
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Feb 2026 11:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770204484; cv=none; b=EWBWIz8RpPrqQQwbW1Y1+cwg85GwE57qAmJNN51Y9DymiwumxQKXo0SdZ1tY7HyGG4Pc+6hjv0DwPrXjMJnQTnX7nZU0/uUq/0Gko51jArmy7lrgPuJRKAP+nEsB9My9qGCh3qpJ18eAtet8wEwMDbWBNiQaksvC6JE/AsAba3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770204484; c=relaxed/simple;
	bh=1iHw8mkrxyoCRG7cgtrCkgaq+WgV169IpCmhKT2RrkY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k3Jz8hfT7TogZdatuyLOwhzwOQZ8EQlMI1wkwRZqId/Gznr/JujmJ9L9OZNcaI1DKLuWKTvGbnpTeolWc/mEg08098R/l6te3NJ1/usZanYKY4y+C4CrMawcykEym/RSfRtJLvj9MSvddj92b2EKpHsEZJcXswDpnHVEMYXMLJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1oZj7yj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1oZj7yj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770204484; x=1801740484;
  h=date:from:to:subject:message-id:mime-version;
  bh=1iHw8mkrxyoCRG7cgtrCkgaq+WgV169IpCmhKT2RrkY=;
  b=Y1oZj7yjjMolAov7lV2eUI1QxVYbmDqfmSQTaG35Etuz6HfSm6UFJVvq
   auAUON4I1Uit4Kpp5EznoGkRV0xcJgEsn2uoXm9ZDb/ptTZ8tF+9QejyJ
   IuU2Ux9eW3GhU5aYHCOLFihJ0Ef999+PZwdhMPi5+OZNEmphpWnQ1f8jZ
   lH7RY3fdfyLE6eWTurVd5zHHh16MN1a/B3cm/64MWjqmwm937sAoCPu/I
   YldsOaSX0Zg57a/OmGw0vA50R5rFjIx5m3R2tXdzZlV0sAIvj5qhT21OI
   WaHmS+B/CepTIdvy8HvmwQAiB5plDz99NXFhegB+GyshE3QNl8PI6snkO
   Q==;
X-CSE-ConnectionGUID: UfAXCuSEQa+x7iWRixAluw==
X-CSE-MsgGUID: /z6741p+TV20PiKIOIqZ4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71292927"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71292927"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:28:04 -0800
X-CSE-ConnectionGUID: Z+vl7QmYSDmb4Kl9NfHxyw==
X-CSE-MsgGUID: Ay5dKEhyQWCE5yBU10BSTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="247728292"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 04 Feb 2026 03:28:03 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnb3B-000000003gn-0SyH
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Feb 2026 11:28:01 +0000
Date: Wed, 4 Feb 2026 12:27:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v2 1/3] btrfs: be less agressive with metadata overcommit
 when we can do full flushing
Message-ID: <202602041225.4piRdI34-lkp@intel.com>
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
In-Reply-To: <c515344cea712e174e3cd8c0e6994adcc9f2ce35.1770161798.git.fdmanana@suse.com>
References: <c515344cea712e174e3cd8c0e6994adcc9f2ce35.1770161798.git.fdmanana@suse.com>
TO: fdmanana@kernel.org
TO: linux-btrfs@vger.kernel.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/fdmanana-kernel-org/btrfs-be-less-agressive-with-metadata-overcommit-when-we-can-do-full-flushing/20260204-074123
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/c515344cea712e174e3cd8c0e6994adcc9f2ce35.1770161798.git.fdmanana%40suse.com
patch subject: [PATCH v2 1/3] btrfs: be less agressive with metadata overcommit when we can do full flushing
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260204/202602041225.4piRdI34-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'by'
#240: 
and got deleted by by the cleaner kthread - when the abort happened, we

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
