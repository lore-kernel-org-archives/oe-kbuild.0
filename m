Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABD93596E4
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Feb 2026 23:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770073303; cv=none; b=ViqCqIvcxAg3NcZORPm1HRWBYwzhHv8mU42GFz5hcfaGwRM9ynhtL1sYiFzqj4IwmHxj8K0MrY191TKpIovkZTUd7TwBhHklOaLsqbgflHBtzX7r/vRyKPiu9AfZUVg5g8GpQNNFIYIhMJLa2nvV7sQkpuLJ9aoYsx5Sco3Frns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770073303; c=relaxed/simple;
	bh=lOKkzKBuR5ZGSr+J/1ZABEgJ4PBD1V/Z+eE2XyxMkVs=;
	h=Date:From:To:Subject:Message-ID; b=OJO0ixfPTf8TnDD+WYoIbqdN6h9DV83aTXVDy8bX2O4QybzeK0RGSV6bMyUHumodcSHZnUfEfdzrv9os1nn1pc3WXJukMFR4iTtPSGF3JJvMKesay0SAM0yO/5IOU06K9urjURe1BOGvek5scjyuG0YLqKimgzmWVjd2s7u5zM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPlaQ6hW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPlaQ6hW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770073301; x=1801609301;
  h=date:from:to:subject:message-id;
  bh=lOKkzKBuR5ZGSr+J/1ZABEgJ4PBD1V/Z+eE2XyxMkVs=;
  b=iPlaQ6hWqzlwLatQ04N8YTV4W451f0FAwPMJIzdp5u1II0d0H6JhWs5e
   i8d66I3oiGKo1ivOuyiMHI57qEkX/iC7VPil2+WQbU1h762l/kqZbVZD5
   P7TVfApjBAkgMymrq3O9AW1R1tenfROgFmoIRvYHtvts/p2j0jXqYUzuW
   55kYNTWpGDcLdjmvm8IrhUfPivG6Uaq0l0dKvtK3UHX9dpniyWfn1CfjH
   s3oefpOTWxIrvSkF4MI5fMlRUzcCPnRmuvP63Xj0KtL39bAhGZA9cZVA2
   Cn1w7R7ylb2lYCbGqNDmbXJszGTpUKwuEgyXB4Hw9kDGooq4OAd06pZBA
   A==;
X-CSE-ConnectionGUID: 9fifpCCTSBuBVELOY/Qa5Q==
X-CSE-MsgGUID: b7VvTpDCR7Sxu6n7SP59Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="88660041"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="88660041"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 15:01:41 -0800
X-CSE-ConnectionGUID: gp1KaG/cRUeyWTBSEiGKMw==
X-CSE-MsgGUID: GTbsG99GRjSE/x0b4MourQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="209788493"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 02 Feb 2026 15:01:40 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vn2vK-000000003Dh-0Y45
	for oe-kbuild@lists.linux.dev;
	Mon, 02 Feb 2026 23:01:38 +0000
Date: Tue, 03 Feb 2026 00:00:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-new 56/122] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'Magnus Lindholm <linmag7@gmail.com>	
	[alpha]', should be: 'Magnus Lindholm <linmag7@gmail.com> (alpha)'
Message-ID: <202602030031.yqVjNov9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Qi Zheng <zhengqi.arch@bytedance.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   2c27d27fa01f3303349931a96658ee3edd095d04
commit: d50a672cffcb2384ae8b3cdbb3dca104475745a1 [56/122] alpha: mm: enable MMU_GATHER_RCU_TABLE_FREE
:::::: branch date: 27 minutes ago
:::::: commit date: 28 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260203/202602030031.yqVjNov9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Magnus Lindholm <linmag7@gmail.com>		[alpha]', should be: 'Magnus Lindholm <linmag7@gmail.com> (alpha)'
#13: 
Acked-by: Magnus Lindholm <linmag7@gmail.com>		[alpha]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
