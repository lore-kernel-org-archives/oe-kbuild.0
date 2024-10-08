Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93FB137C2A
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Oct 2024 20:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728420745; cv=none; b=KAl0AesWYWtUH56FHbRNireE1DR1P8hyG7r5tuseiRukYor08nK2Ez6Ir0GRbFT09TQdCuf/5PYQq0DDyo4Uk0lFZXnZtb/Um3DmEIze3ZBbuJTqduZLqPD4Y46ZBDddDkXkJ26YvAxx7yOEnwYI439IgFFdqA8DfBKlXjqjcME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728420745; c=relaxed/simple;
	bh=0qpecfszvXVW+yB7EFUEbucx3t5k8HdLIGh4OGxCaFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f6piS5Yzmd1MO8tYFQQuqsXiqdV8dBgo7QY8GmaCe4lUnaHfpfZC1RZaVv49dVuxAiEP84awRhcvQMS8KxjEv/MHRyKo3Hyu8Pm/XJvuz8FRY71AvmpIrq8qmxn1848YyDvB2BuDm9VvK4KKma1K249ZfUFFZARKWlDFyOBSSVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbYeXn6K; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbYeXn6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728420744; x=1759956744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0qpecfszvXVW+yB7EFUEbucx3t5k8HdLIGh4OGxCaFc=;
  b=dbYeXn6KQ9XW6kikZmQ/yrXqjZz0nFqEXTXFci3r9/mLBEArXxNGsqJO
   myjlfErMJxbWA9TRCt7AhA01o1CkZgWQC/kSC7kMlBTRZqj55201wdXqM
   cUIxL1e9wp+47C1TipNsuXkIUGL4QunmcxMuza/pw8tzt1M8Gzg/tr3uC
   3bbN30nXrDojATvMO/TjrV46u8NvYSCsAppD2KXW32X4dk3luq5kOEoch
   aALKirhoZRZJ29vV0XkXtnz5LdaYvHCUjXfxHL+w5x0vhZPY9VgYTdTnC
   EXP56bXSDxqNizm9Vlg4kskGVWoPZO/PvPvMjBVyYrS+wb4xCx/M1RRNO
   A==;
X-CSE-ConnectionGUID: ATwTXeJtSqGf3Y6XT+wcog==
X-CSE-MsgGUID: aGnlU6uESrqSAkltPu3rtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31445809"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="31445809"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 13:52:12 -0700
X-CSE-ConnectionGUID: CDzI7z9ZQiuyLdzCV2NxpQ==
X-CSE-MsgGUID: 7q3lvV/1S7mv214Qxw2pBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="76242861"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Oct 2024 13:52:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syHBf-0008Mu-0w;
	Tue, 08 Oct 2024 20:52:07 +0000
Date: Wed, 9 Oct 2024 04:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/migrate.o: warning: objtool: try_to_map_unused_to_zeropage+0x6c:
 unreachable instruction
Message-ID: <202410090405.it0WJsdB-lkp@intel.com>
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
TO: Yu Zhao <yuzhao@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Usama Arif <usamaarif642@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5b7c893ed5ed0fc1cbe28c0e3296a6fb45698486
commit: b1f202060afeb7fcb98473929d26fd3d2093b067 mm: remap unused subpages to shared zeropage when splitting isolated thp
date:   4 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 weeks ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241009/202410090405.it0WJsdB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090405.it0WJsdB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410090405.it0WJsdB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/migrate.o: warning: objtool: page_ref_unfreeze+0x84: unreachable instruction
>> mm/migrate.o: warning: objtool: try_to_map_unused_to_zeropage+0x6c: unreachable instruction
   mm/migrate.o: warning: objtool: move_to_new_folio+0x64: unreachable instruction


objdump-func vmlinux.o try_to_map_unused_to_zeropage:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
