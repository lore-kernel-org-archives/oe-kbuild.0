Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D64287257
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Apr 2026 17:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776619736; cv=none; b=lo47zm0MLQErP+TqKjouu36rGxxJUSfIkhUF7ey/SWO3ALnXGXdgPn2sO8khoG+rWtwNvrEC+msJneXzRVQR6JuGGxAEcZP3V/v7xCGeKI8E6Aq9KGxCRJ+XGTHFQ/Hmjwsr2ZrpjkA3QtOvy+y5nP+Z4s1FRxAdNwjEpLEZHfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776619736; c=relaxed/simple;
	bh=rQevHqrARcW+L++ao3zjQ36/AtFlHOfiNtIUdC20vxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=us1tt4D4ruYv7eHvbUZ0OrsDr1LYzxd0EsZQ7fohEZwkJkR+f0bCqL+S70EdYIau9aCKHPofooLMXJZO4tOn2/lVfDA5rZcCgYx4dB6eVoYl8NoMuCkqxhd2n7OKUjb9O/6EBb9YC3V67ewoqm7+ubTUSymYOo2sF8Ic18/EELU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEYdj0/v; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEYdj0/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776619733; x=1808155733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rQevHqrARcW+L++ao3zjQ36/AtFlHOfiNtIUdC20vxI=;
  b=IEYdj0/v4Qm6v0+ElKiMKcpQyKSAG5vrn+fG/eyRQh2cQifCeyXEhY8Z
   EWEwicUCUV1/BSmGfp4XUqUakWuWm+bp1J7RlBeqRcUbyFtluhXb4Llg4
   FumKbiVcAkR+/UJEbzeZp3gtA/GyGH/32dHpaWUn1nI1uwuGCAhT9pBsS
   bahlwSQRnG8ljuwM6gl2Bnc34+zNb4fedx+I4iLUmYNGkAvD6ncye199D
   WhAYsL4vUWISizgcdNxbVgsEf72ZKHvNhHMpfq1Xzi6Ay0knVQ89Y1WCW
   LemPlZjGoT7CeZ3ryQwkRxjmu+S9mqhG6F6zkTqFGcMQd4FDmvphHRzG6
   Q==;
X-CSE-ConnectionGUID: blGPP3XFQtm0oVNBhUClUA==
X-CSE-MsgGUID: cGthmLMvRCe/uUi6NI9spw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76576547"
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; 
   d="scan'208";a="76576547"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 10:28:49 -0700
X-CSE-ConnectionGUID: xUsLUUQKScqiDNa+dC8X9g==
X-CSE-MsgGUID: hhqQINCITDSyrg/FWO1O/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; 
   d="scan'208";a="269551089"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 19 Apr 2026 10:28:50 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEVwt-0000000022f-3Gan;
	Sun, 19 Apr 2026 17:28:47 +0000
Date: Sun, 19 Apr 2026 19:28:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] scripts/kernel-doc: Detect mismatched inline member
 documentation tags
Message-ID: <202604191910.GczJmXNT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260415215032.3398330-1-shuicheng.lin@intel.com>
References: <20260415215032.3398330-1-shuicheng.lin@intel.com>
TO: Shuicheng Lin <shuicheng.lin@intel.com>
TO: linux-kernel@vger.kernel.org
TO: intel-xe@lists.freedesktop.org
CC: Shuicheng Lin <shuicheng.lin@intel.com>

Hi Shuicheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v7.0 next-20260417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuicheng-Lin/scripts-kernel-doc-Detect-mismatched-inline-member-documentation-tags/20260419-144228
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20260415215032.3398330-1-shuicheng.lin%40intel.com
patch subject: [PATCH] scripts/kernel-doc: Detect mismatched inline member documentation tags
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260419/202604191910.GczJmXNT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260419/202604191910.GczJmXNT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604191910.GczJmXNT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
>> Warning: block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
--
>> Warning: block/blk-mq-dma.c:379 Excess function parameter 'state' description in 'blk_rq_integrity_dma_map_iter_next'
>> Warning: block/blk-mq-dma.c:379 Excess function parameter 'state' description in 'blk_rq_integrity_dma_map_iter_next'
--
>> Warning: fs/inode.c:1306 Excess function parameter 'isnew' description in 'inode_insert5'
>> Warning: fs/inode.c:1306 Excess function parameter 'isnew' description in 'inode_insert5'
--
>> Warning: mm/swap_state.c:179 Excess function parameter 'gfp' description in 'swap_cache_add_folio'
>> Warning: mm/swap_state.c:179 Excess function parameter 'gfp' description in 'swap_cache_add_folio'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
