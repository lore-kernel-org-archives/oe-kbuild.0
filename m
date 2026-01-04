Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A632C11EE
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Jan 2026 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767534515; cv=none; b=Hcg9UqnXc9AYQJVuaq9CCT0UBBLl6W5eJIjjH4YGXtQ5UPgdr49AJgIaWQhjjjNIGrYpKWn1vkHFqHg5xkr3P/3OAhknzE2BQPoIx2xP+hQsEnXHfTiOvv/fVkV5T029buBJP7B9YP+KfCV/HDyf7YEVRzjyvAhchRBMcP1dcEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767534515; c=relaxed/simple;
	bh=tvwVIDeYxg8txf3oWePBex5+Ni+DE0Nr9gx4P/vb/NA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YswoITbfirnkQGUGkzzkc0Uvgk3Hg4dE8v9tDtkNJ/oC4LkViBk7zIKSFKz85XMnRCWQsxXzcFB5jjVLIgmWwYdUixkSGX8Ey+WdehT9lYnPdYVXcKJ+UNmzzG7SPv79RMFuBr7h86/8vln8AR5BhCLNSrNa0eWmpEl742ulB1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSDYwXGA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSDYwXGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767534512; x=1799070512;
  h=date:from:to:subject:message-id:mime-version;
  bh=tvwVIDeYxg8txf3oWePBex5+Ni+DE0Nr9gx4P/vb/NA=;
  b=dSDYwXGAVFtbEp7ql/2RH5jrvsBj3nHnreiaVcUvNYdr3z0KQm6m25QB
   1/oAPb6UvV0m8DMOxbPf+PTj+Hnfwub4MzqEXG4w3U2uIyn8V5UOUNp0l
   IwoQvglUB4B/1gGv1LzHWktlcF4kb/fy5P36ma+JM+FQ+lb/wt5md1bvh
   Gg2dko8chB56ZJI6COcAhB0p244S3tPiavJySU4h0iNcdGQDsBz2gv7Sc
   5flCZm0wi6r3V6oqeqww2OSK9J/n2tsZtN77RZNfz3cG+3A3rwrpMR5HF
   Elg8LusfoI+/WLzzBllO18XxhRjlpTvvZ0ZCYpLyZkN0W+abcz4aZyY4X
   Q==;
X-CSE-ConnectionGUID: HhH9hSCWSC6zLBUX6HLuJA==
X-CSE-MsgGUID: EMXJSDNRSZqXV7TNLvOyBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="80299773"
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="80299773"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 05:48:29 -0800
X-CSE-ConnectionGUID: SXuQ6r4aTAOup8T3dahI9A==
X-CSE-MsgGUID: umA+i1eOThGX/C+Vmq5DQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="239642425"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 04 Jan 2026 05:48:28 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcOT3-000000000vB-4ArV
	for oe-kbuild@lists.linux.dev;
	Sun, 04 Jan 2026 13:48:25 +0000
Date: Sun, 4 Jan 2026 14:48:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 1/1] mm/page_alloc: auto-tune min_free_kbytes on atomic
 allocation failure
Message-ID: <202601041439.bXJBAJkO-lkp@intel.com>
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
In-Reply-To: <tencent_9DB6637676D639B4B7AEA09CC6A6F9E49D0A@qq.com>
References: <tencent_9DB6637676D639B4B7AEA09CC6A6F9E49D0A@qq.com>
TO: wujing <realwujing@qq.com>
TO: Andrew Morton <akpm@linux-foundation.org>
TO: Vlastimil Babka <vbabka@suse.cz>

Hi wujing,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/wujing/mm-page_alloc-auto-tune-min_free_kbytes-on-atomic-allocation-failure/20260104-202818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/tencent_9DB6637676D639B4B7AEA09CC6A6F9E49D0A%40qq.com
patch subject: [PATCH 1/1] mm/page_alloc: auto-tune min_free_kbytes on atomic allocation failure
:::::: branch date: 79 minutes ago
:::::: commit date: 79 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260104/202601041439.bXJBAJkO-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'upon'
#12: 
The adjustment doubles min_free_kbytes upon upon failure (exponential backoff),

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
