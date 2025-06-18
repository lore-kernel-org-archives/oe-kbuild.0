Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F5B3770B
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 04:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750221118; cv=none; b=VeEH20f3EkfSsYX5aEt+V3UuYfHfvpFvY0kgWobB7aTM9X9zycDAutXnGJbypK1edfADAQYCc5Sc0D4pzsxvfdP1wGC7s48xQl/N7LiM9EElWXwWpe/LpfX4u9MLI9/NP6abBTUEaVWH8ascaN7F+AToRsVHJNGngaModXxIY+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750221118; c=relaxed/simple;
	bh=tS1rB7AqHCUZyOWQfjOh/k/iIsGEfzwWKw/xQpHrT/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DeZv2trjS0KmZIYXDXOlNy1UIipBlwLZujxdWL4XgYwvDCOOQy8dx/9zy2KQCXVs0p/Bf/B+E1+8IjRzUDKwdAsij333WwUJSnibkdNWY4cTFifChvOqnXSCIyILjlWdSb/5IF/pFwbfw+52MWkdShg/4Z6rWpn2tttGKx5n6dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H91B8HOV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H91B8HOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750221117; x=1781757117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tS1rB7AqHCUZyOWQfjOh/k/iIsGEfzwWKw/xQpHrT/c=;
  b=H91B8HOVngFyFawHl5dBFQRR7SGPLWeTPIUI2kg5fPNwDLParzamdxXL
   fq2Uo5s4vC12fyxD5fPu8YxEhMAfrThf/QN9UWIAsqI42ciLKH+XxjJuP
   H/56OfCDrqTpBUJOn8glBcLBUqmzFQDmFiYVOBUgdVN0+iZgAHoXBajS2
   whU0MW5gedyBdtjnuYlX0/kiMgRG7a+VE5JJpN1ugl+bz/W5BMafJ+Lmp
   m6WSeCWjOvYHsAO3EzvlSZNUGapPSMvJOmgQ/MSbsmTgpV/umA21iIOON
   zpLGIZAgcCNg7BOZS07PXtSd/MKAvCf+dPiXXzJAjQxWlQbEQTg5UBTGT
   A==;
X-CSE-ConnectionGUID: 9a4wCQvXQv2nv+LsUMLLlg==
X-CSE-MsgGUID: t+eM0I9GRZ+pF6TecE1k4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="51530298"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="51530298"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 21:31:56 -0700
X-CSE-ConnectionGUID: r1C1m4gBQ4Ck4XaE29hE7A==
X-CSE-MsgGUID: +0pyCZDRShOTOKhJ2TrBeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="180181918"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jun 2025 21:31:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRkSn-000JOY-1l;
	Wed, 18 Jun 2025 04:31:53 +0000
Date: Wed, 18 Jun 2025 12:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/6] btrfs: add comments to make super block creation
 more clear
Message-ID: <202506181157.8z9YKaIf-lkp@intel.com>
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
In-Reply-To: <c86ee5c7e8588b9755c66f6827dc5087de2fd910.1750137547.git.wqu@suse.com>
References: <c86ee5c7e8588b9755c66f6827dc5087de2fd910.1750137547.git.wqu@suse.com>
TO: Qu Wenruo <wqu@suse.com>
TO: linux-btrfs@vger.kernel.org

Hi Qu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on next-20250617]
[cannot apply to linus/master v6.16-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs-get-rid-of-the-re-entry-of-btrfs_get_tree/20250617-132156
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/c86ee5c7e8588b9755c66f6827dc5087de2fd910.1750137547.git.wqu%40suse.com
patch subject: [PATCH v3 2/6] btrfs: add comments to make super block creation more clear
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: loongarch-randconfig-r072-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181157.8z9YKaIf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181157.8z9YKaIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506181157.8z9YKaIf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/super.o: warning: objtool: btrfs_get_tree_super+0x23c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
