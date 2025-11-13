Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A1E320A1D
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069121; cv=none; b=bAi+BMCEKc1HlHa2gKCEFJDevHiHC+PJcLgJ1WiGK/9ZsK/4OWhx+FsFZzj/0ny5g9OcPsGinYlYTCxqpBqnlgaILNUVd76Tj6dMYs6aTASh0B/vOOad0P9Iv9KKLAmrlUV1UnGLr70ObKdqiHbEHjL8osl45cXU4oKlAG80QKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069121; c=relaxed/simple;
	bh=IBAoD7sapLMdFrEluquJsoJ8DYIFSi64ubDqtPuwRxc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SC0Vb8q2WxRCukkovUj3ZI4swPISj2LNhY/OMUHD8GdbNUaSTtYSAXZ5dYXDzPcN5+aGnp8AzI1VVAJEp9O52lNnShd7s5XhPO5FWcHR1gnrNGcSc4QYPuv81MEGidqKXmXqZFiN709SZvtfOLAlVqp+6MdQJnPdOSdRiVf/Bbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUDZgOYy; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUDZgOYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069120; x=1794605120;
  h=date:from:to:subject:message-id:mime-version;
  bh=IBAoD7sapLMdFrEluquJsoJ8DYIFSi64ubDqtPuwRxc=;
  b=bUDZgOYyRdBNdWLMcInpngdCYO5jDa0kwUju77l4Y0mt9CtFCfWDdRqa
   fM3XlXgPs6yq911jYPYrJXaw3PWEytkFgMCx0ndFFdwEAxBO/Xf2RLxxF
   J9Hl18Dwhol7mWkLxcjXwBGwuZsiaR8bJEBbVf1g+jvSwkzJxFzoZ567b
   Lw53ESxwUoq0ayxfxP46kyK09Rxgd0TcypilahNDr5yayp2jKY5Bt0dn8
   uZNR+d3/OlMwonaWX5QEyGGBZeola7lNlqQ1SkMepispgvT+BVfduxZoF
   0swJfFA/mxdhKDu5YD6B2BPaCkaAq8+MJajnDDasXL2TB6wQ+SNTlr3jx
   A==;
X-CSE-ConnectionGUID: NVhTJt8YQNKLI4r8zTVvQw==
X-CSE-MsgGUID: yBi7g/OlQkGEKyZ+7C0djg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75842407"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="75842407"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:25:17 -0800
X-CSE-ConnectionGUID: 3IRpESOyT4qwdAQZWgsWcg==
X-CSE-MsgGUID: CTP/OVBNSWyN/OoROZy4Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="213008641"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2025 13:25:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeob-0000000018F-1lfY
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:25:13 +0000
Date: Thu, 13 Nov 2025 22:25:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:for-6.19/block 39/64] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202511131837.vrIscbKf-lkp@intel.com>
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
TO: Keith Busch <kbusch@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-6.19/block
head:   c3f42a6de708db6891879547b29cd0d84ad83c92
commit: 262a3dd04e729386bececffeb095d31f7a9c43d5 [39/64] null_blk: single kmap per bio segment
:::::: branch date: 55 minutes ago
:::::: commit date: 7 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131837.vrIscbKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131837.vrIscbKf-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#6: 
Rather than kmap the the request bio segment for each sector, do

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
