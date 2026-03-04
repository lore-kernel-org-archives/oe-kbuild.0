Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC31366DC1
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 13:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630973; cv=none; b=LdyhBTxt53kgMCicA4hrCxhmjp/O9mGwufQBiMeF/WbYfLwl6u6abN/gb9Bf/mmb2jfQdq7LV/gU71cDgje7JbpBPgyeB32znGH09Ti9GeZpf7zE0nfBy6PppansykCjAa38GhZOCE9vCamKa2DDPvFBNnKLBTrK7LUI9B8rlTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630973; c=relaxed/simple;
	bh=IAtjB6uEoWv5XL/XS5QfFZhuWfBCZqAUZoy2WMHendc=;
	h=Date:From:To:Subject:Message-ID; b=YNpC7SuVjUO1i73XA53MfDh5zRvtKLyku8Fuy85cVSmTd2cQT+fausoZmz468f6+5VRFIH7526noE/kwNm/u1dvtsAWMj0Oryw3BK2P3M2XIOd7MLaKmQDHpwvwaPH7RkG9W4QAiNDAp2YJQuYseLGhsTrrjhCLBjT5rK0FZVRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzvzlmdT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzvzlmdT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772630970; x=1804166970;
  h=date:from:to:subject:message-id;
  bh=IAtjB6uEoWv5XL/XS5QfFZhuWfBCZqAUZoy2WMHendc=;
  b=YzvzlmdTn36aKShX0UY0yuh+MWQwm6zcUTZjPILQEr1dGx37llH6Q94q
   qjjktxQk5g1AKJg/X8AfL8FTBGUrB9WK9L0uQYa4ybxeXGohrEdE5EywC
   +zeQadM8pWJQlV9JGGo4y4eth4oSYhIsUQTD7xTHW/LSridwkaQ8LvccL
   7oY+9HD5R7fzgf+1/MTcJd+KzRBN1Wk9BeTI+3Ll+GL2ZjEC6wK33ER2g
   DTLcow9KlrXCbhvBi73GgUizpt8p4dU8vZnf8TImQUqv+8oXjqgLTwjyy
   38cKaFP5/Q9lb2+bFSnlU8f4F3acDuMGpU7vnWm4nNfcSNQ5wUjo6rugL
   w==;
X-CSE-ConnectionGUID: 1nHtizF+TlCnaNzWKfKuPQ==
X-CSE-MsgGUID: spHpAAzGRY6C9nOaH5KcBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73816010"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73816010"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:29:29 -0800
X-CSE-ConnectionGUID: BvOw1zadQPuvO3EXAvyjgw==
X-CSE-MsgGUID: oo4SqJumRV6wQ8e+wAKDmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="216653446"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2026 05:29:29 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmI3-000000001hd-0wl4
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 13:29:27 +0000
Date: Wed, 04 Mar 2026 14:28:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal:dedup-lsb128 2/11] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Claude:claude-opus-4-6'
Message-ID: <202603041444.VEtxmhUx-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git dedup-lsb128
head:   925cdd8d45fb4adec025cfe8e42abfa0dafa9a46
commit: c8244cb2864d10dd366a50cbdc043a7c5efddfa7 [2/11] kallsyms: extend lineinfo to loadable modules
:::::: branch date: 12 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603041444.VEtxmhUx-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4-6'
#32: 
Assisted-by: Claude:claude-opus-4-6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
