Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00CC2F9C39
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331547; cv=none; b=CQvgmTOjcS/lWHjyQagfBO8Vh+Rz5Hd9HfTL6v3XYCL+dzd0NuyFqmWomhnEmktvxkrTBLgEs93hBZhk1xWoVn6S0GsQkB6PPBsgaa2NfaYlbZoc5iSdrNA9N5HuPuO7UWA36aDdA4F8wXzzR55jYhgwrq6jLn1SJovsQL76FoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331547; c=relaxed/simple;
	bh=ocEbLzxVbDZfSOz3i4u8oPbUGtv68pTl09UIYres0c8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=avvdnVONvHEFazpwpr4uP6p4X2hDU3NafWvwOu73eUjygFGVLH6pdoToZC19ixcaxpVVNBZFY/fSxxnmj/VfKtC3ScRj2AB1yyULtAFE8b7APWxHaqzTc0e/jFfwvyOzDk+xxh7+iSq0k0FgtpEvHyLppfC5ARWGxHSkVqSY4qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YR6T1/t6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YR6T1/t6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331546; x=1797867546;
  h=date:from:to:subject:message-id:mime-version;
  bh=ocEbLzxVbDZfSOz3i4u8oPbUGtv68pTl09UIYres0c8=;
  b=YR6T1/t6Z3kz79y5TWZwPlYpJqYwtMnNh1XtI0PZb/KRtn0kenSWP9bg
   zaBjaVy4tRejPC9akK9qsv6a1FXWUeXlfSPg1Mj+vkSau36J56w94/gJv
   /qZvk4LOJlCmuCNjh5FniiE5Cc8lWHKvQ8EbUgy8MFSdSKGB0lC1FvzO0
   rNsj8lfXMDPPWhyHUMintxdTxSs0OAU4SfhTxQQUq3Do2riGR424+3ToE
   4PKfEN1adPRjSszL1PGZXkLossua2LLU0+iYTq+Lklpex7UF+jBzdWVme
   F0Ta5AACj8WJ1BFOTnqo0v0wfcVdm5JQiNXVBk/E8FhbFCh+8i3wTb2BF
   A==;
X-CSE-ConnectionGUID: 1/h14xVbTIienTpc0UnhEw==
X-CSE-MsgGUID: NviIF9uBQKakwAOetGu/Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68149577"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68149577"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:39:05 -0800
X-CSE-ConnectionGUID: 2KRzFt5MQQ6MSmbaCb3iNg==
X-CSE-MsgGUID: zacvXftsSl+n2PJUIT8jyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="222807750"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2025 07:39:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLWP-0000000058m-1iI3
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:39:01 +0000
Date: Sun, 21 Dec 2025 16:38:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 186/246] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202512211636.wESqFmp9-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a505a983517df0d2df38e87cb1898c518fdf9740
commit: 69e34ac663bb331fbe8961a0225261f8742c7208 [186/246] drm: apple: audio: Make the DP/HDMI audio driver a full driver
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211636.wESqFmp9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#10: 
to simplify the the interface between the av endpoint and the audio

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
