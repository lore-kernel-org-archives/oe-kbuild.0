Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFEB1A4F3C
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Apr 2026 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656968; cv=none; b=mVxFaI89fwbIlIDLgIo1/AwuWzoxSZv8ME9LT/duXBncQAhmbYhpi0vNJqDZoN4Xzl5KXAA/UArl/DV9t1Zw5uoT8dQCkT9yTGTYA0k/geip+5UIJ+wf+q7BrbrzmiWuH+ahQXB2QSoK/hJdl5P9pume0MPL5JDqZc/lWgY5eVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656968; c=relaxed/simple;
	bh=4gPl/2ol/S8+CYZHwc3AOd4xouAVN0IHMm6pse+UxZM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZP5t/hC0rqO3duRVJThXvpqndaiKl0MrCb1Imh7VnNedym3VZulHyNvGHvv7Mq18Jn+s3s0LmXdbL3L7EbmYhiXT6sgKT7p0gY5fFzB1mdIalvTUZTzFvKAXFssnGzfryojW0DiLz/Bs+ltI5/oaftEP0utzskds/GxErTSrFo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eamyiia6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eamyiia6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775656967; x=1807192967;
  h=date:from:to:subject:message-id:mime-version;
  bh=4gPl/2ol/S8+CYZHwc3AOd4xouAVN0IHMm6pse+UxZM=;
  b=eamyiia6zBJf6ob8V4NiY71GcMJM1/ge8QPXdKGEnZS7vHDlRQBtHd+K
   cXvoKoMWo15iwfPd03fBvH56SFHJZIsM/sULEuecI4IagRaQGlZBLcKYb
   qLwY5aHwYmETnIs3oi4IQGrJSGDebYRvWRpc1iJu/Vj0SyKrUrSYxxiOE
   nJnJ8psO9wjyzyszCUN+y/gxqS4Xj+MnTM2Ihw9uy1UoyDmqsRQS7678r
   eORTHFGWuy9o2CnTyppNe5WKfVjg8qU6QHpx9lfjXlZdUuyleMnjxYj4P
   jqivbRkJ5t5x57MwdIk42nG04P+8qped/DBEnJrhhe1gFz7F0mQXCegN+
   Q==;
X-CSE-ConnectionGUID: UTsxrOWwTn+C9n5OPNKPoQ==
X-CSE-MsgGUID: eeb5ztSfRDy5CHaGjWe1/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="99268593"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="99268593"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 07:02:46 -0700
X-CSE-ConnectionGUID: htC+sYztSh25DNueEsw5ag==
X-CSE-MsgGUID: s/TuCqiKRCeNlBxckAUaRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="228377947"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 08 Apr 2026 07:02:46 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wATUR-00000000ASP-43hF
	for oe-kbuild@lists.linux.dev;
	Wed, 08 Apr 2026 14:02:43 +0000
Date: Wed, 8 Apr 2026 16:01:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v2 2/2] LoongArch: Batch icache maintenance for jump_label
Message-ID: <202604081503.dLDO4IWF-lkp@intel.com>
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
In-Reply-To: <20260405021227.532599-2-youling.tang@linux.dev>
References: <20260405021227.532599-2-youling.tang@linux.dev>
TO: Youling Tang <youling.tang@linux.dev>
TO: Huacai Chen <chenhuacai@kernel.org>

Hi Youling,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Youling-Tang/LoongArch-Batch-icache-maintenance-for-jump_label/20260408-092520
base:   linus/master
patch link:    https://lore.kernel.org/r/20260405021227.532599-2-youling.tang%40linux.dev
patch subject: [PATCH v2 2/2] LoongArch: Batch icache maintenance for jump_label
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260408/202604081503.dLDO4IWF-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#31: FILE: arch/loongarch/include/asm/cacheflush.h:42:
+	asm volatile ("ibar\t0\n"::);;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#36: FILE: arch/loongarch/include/asm/cacheflush.h:47:
+	asm volatile ("ibar\t0\n"::);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
