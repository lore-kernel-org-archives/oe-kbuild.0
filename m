Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BEF34252B
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 06:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768027535; cv=none; b=iG+d62/ak89Rl32VVIrqO5ZFG/8/y/5K64BEa8uQxN6DNKARv5GgBKT+zqdSm2rgtMnfJlMNAPfS1pZrfqbKHENfTV21jKaUE/xkERhWQ86EV7kQhNAg7qqc58tUvQ0zrQXAAxV7YtkYcmcCpBg9b5f7BIVD8N+m8XU1u21itbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768027535; c=relaxed/simple;
	bh=HiOPvipPLlSRj8o+5TyX8oljpsNF1POOA6MVJyZd9uE=;
	h=Date:From:To:Subject:Message-ID; b=TaR2eLzIN+8OtbXX4yObBGv89v7RhOe0WyG+gw+GFf/xMs5hKotPinx1Mk9t6AsNoybhBNagAWmAVwZTXK3WBntOEs8+tqkvmIMruV9tNjlzG/VXuV1vK1iyw7hnAy6AE/ksXiuGuwBf5JrvJ6d75eOOPUiY6uFtR7I9XC8RkKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1sE3sJx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1sE3sJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768027534; x=1799563534;
  h=date:from:to:subject:message-id;
  bh=HiOPvipPLlSRj8o+5TyX8oljpsNF1POOA6MVJyZd9uE=;
  b=K1sE3sJx3vgSDUKRLdOFkx8aFNNBrA39bFyEjII3wvuvWO4i4Pr0l6yD
   eWdVX+zKiw69OSvJq6QNhnjYtNG5S8y77hwG0QwZ+jCSPVxhyEvpa6Bao
   eKhAnqpTQM9jY1i/3yElYSoRGHc9TH33hJfzR2VNgBtACcLF3UUlmce7+
   OjM/AOFFA0xi4FsSvsBVumh1GmA2xhIPmRIvdImpfB6hupnQk2KEYZHxR
   ibGzeJaaUencLQMf57VTkczrhczdG60ECTeiedaSTWKBqn5MI/5hoinIG
   bUvV9Qg5tbCuew1dt7Gtvd/U/rptIYffARI8+kVNqDU/JIhrka5wSX2GF
   Q==;
X-CSE-ConnectionGUID: aDTw765yQnGgqMH9iwXqgQ==
X-CSE-MsgGUID: kXwyYklqSV2qTGlQ+ES3uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69326640"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69326640"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 22:45:33 -0800
X-CSE-ConnectionGUID: rQL9BUhjRvegALDe6YHuhw==
X-CSE-MsgGUID: dc3NRPeoRaiUxuDMmgR7hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="208129989"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jan 2026 22:45:33 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veSj4-000000002Hw-2nRC
	for oe-kbuild@lists.linux.dev;
	Sat, 10 Jan 2026 06:45:30 +0000
Date: Sat, 10 Jan 2026 07:44:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 14/130] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202601100726.8x5mkfo5-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   38c0d0c6764d5759f2da1ed710401a00bbf59e9e
commit: 254985040f316435ceb4f75ce4086c5ea72aea7d [14/130] arm64: dts: apple: t6022-j180d: Add audio nodes
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260110/202601100726.8x5mkfo5-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#69: FILE: arch/arm64/boot/dts/apple/t6022-j180d.dts:572:
+			/*
+			* DANGER ZONE: You can blow your speakers!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
