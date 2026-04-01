Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFDE35F171
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Apr 2026 16:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062327; cv=none; b=DY5NPsmAymNhHq7r55h11UWuXV0Kooe8LhV/s1Yy85ZYLLlEJ6W1W40jV/MIzE7t1+SZ9hdD9B8gN9FWpU/I367oAuBJBI3kz0RGWUOYprvGXh/w6xFCU0iZ4V1recnozo1Y0wCAUXVudVrzyoXq1avdzc1Emu6TuJUO6ogom8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062327; c=relaxed/simple;
	bh=QB8TTVUHD0jrRhcj/NZzvLq4bO8yNmSau6lVZlOFLvA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mX0KCmhIP+r74nvzr3e2NIFZnV7IiE1O00kFur4RmTxlizniDWeQcRKejRYGOc40EKwhJj3sKC4Jcm4lAfqSUt8DMlAa2Wh0cshWKvmpy4CkNgytPtb/GwpfZzWO8zr4Hp5v304vWgbEPoIF2aOU2IyX2FZ2KlzS1wE93FgUgYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMoS4K8C; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMoS4K8C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775062327; x=1806598327;
  h=date:from:to:subject:message-id:mime-version;
  bh=QB8TTVUHD0jrRhcj/NZzvLq4bO8yNmSau6lVZlOFLvA=;
  b=CMoS4K8CwEI0ad5+g5/awtxBMd95Dyc0KoIY46B3HgJ/6vJBSuA7dKJ+
   QzNSftQf02m06jHAKAx5EDB05n/hvu0hZSDYQ6W0QdJPA1yN/dO+y7O8N
   An2CA/oNLoDO6gpSF+03yuQKbZOI9tEow18+vUoMHdc4VMvXnr0GbIWKc
   supkWZHKsyyCDGZuAIQcBHdz/QEBzFW+CJFZYGCjRILnUGE8ntLNoM7K7
   YMyTFN1f38rmymfRAvLcxyZqSiJel0bAKR+y5RwE2xfeNJt4B0FpMCR9k
   nMRUtbTYaOP4CNxkDqN1duWXbN4ImZO1PubhYsWYPYHXLZ1LoiTVVaMqw
   w==;
X-CSE-ConnectionGUID: wIQ0QXJpQNG44P86as9eSg==
X-CSE-MsgGUID: iAnFYvrSQNibe0+t86hvOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75825388"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="75825388"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 09:52:07 -0700
X-CSE-ConnectionGUID: 9BJzsFK6RtK+5HbLY/HBWw==
X-CSE-MsgGUID: C5atGYg9T0y3vDWh08+kEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="223429587"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 01 Apr 2026 09:52:05 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7ynT-000000008lN-1kQX
	for oe-kbuild@lists.linux.dev;
	Wed, 01 Apr 2026 16:52:03 +0000
Date: Wed, 1 Apr 2026 18:51:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH] mac80211: stop hardware before clearing driver state on
 reconfig failure
Message-ID: <202604011809.Cn20eaf5-lkp@intel.com>
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
In-Reply-To: <GVYP280MB151883A5BB2910EE6439DE2F9453A@GVYP280MB1518.SWEP280.PROD.OUTLOOK.COM>
References: <GVYP280MB151883A5BB2910EE6439DE2F9453A@GVYP280MB1518.SWEP280.PROD.OUTLOOK.COM>
TO: Masi Osmani <mas-i@hotmail.de>
TO: Johannes Berg <johannes@sipsolutions.net>

Hi Masi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masi-Osmani/mac80211-stop-hardware-before-clearing-driver-state-on-reconfig-failure/20260401-123427
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/GVYP280MB151883A5BB2910EE6439DE2F9453A%40GVYP280MB1518.SWEP280.PROD.OUTLOOK.COM
patch subject: [PATCH] mac80211: stop hardware before clearing driver state on reconfig failure
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260401/202604011809.Cn20eaf5-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Masi Osmani <mas-i@hotmail.de>  [AR9170 USB, Linux 6.18]', should be: 'Masi Osmani <mas-i@hotmail.de> (AR9170 USB, Linux 6.18)'
#16: 
Tested-by: Masi Osmani <mas-i@hotmail.de>  [AR9170 USB, Linux 6.18]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
