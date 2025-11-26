Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20EC27990C
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 22:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764195453; cv=none; b=j91lbO5MsVZuHJoze3F6mer7+AzpwXcIJK5KiW5cTm+TE1h4BcTm9/JXPVI3h8rjzM/InCx04HtRDPikIhlTRy8b0ejqckwoUJoNlAbenEXeIWte1RwTeBoCTu8bSxett5rWGIW1aSk8sX2ropXHmUAta7FdPl3fOtlksZqDLkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764195453; c=relaxed/simple;
	bh=qiiassbnjL3yraGFQDlL26e4z4PRm7tseyEPzf0H/Rc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sC1gculaFz7y+kJdWKwZ48PoVG7I8qtWSatevJ+Jl7J9s0rR0+nzWm5hucn980mT1uZpbqeu35BHdFqgIg5a13XwIIC3oYuH0G3X/ApTkpAmu1KmxjRhmN4XhJYWLJCIkUf4xPZO5rXEgkGag/InK9PacpImgS4KW0Yv6SEJgcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4nc7Z9X; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4nc7Z9X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764195452; x=1795731452;
  h=date:from:to:subject:message-id:mime-version;
  bh=qiiassbnjL3yraGFQDlL26e4z4PRm7tseyEPzf0H/Rc=;
  b=R4nc7Z9XtYTEZOUp/CpcDZVs4g0rg4X50IjFC8ACGibH2S+emeQqMcQz
   yF40/394wPRiZw/zMerUPweoPn2tsD5O4T7EWLYGyfkqzSzttZNs4l3y4
   9ITxoKlCdF1eAdgLzbvkkg6mz/Mx4FCyWxmFlsKxs74Xwp91O8Emil4yh
   c7l7q3BXM/+oZeXpXjfxMbMFeCgnGKtQbAYgbaKS4nUr/iYaQBCEVBpuv
   qZ0nu7qqkm8MqDmlPxO7fA3wgDBpVvv69HRdY9H/kuKCu2uLzoRobERHO
   qezRGCqf/BPlqWaUWPuNvwL7tjgkvP3Z/3XVr10ibJrc6adqRYrDVeuGV
   Q==;
X-CSE-ConnectionGUID: RytsitfrRzSRIBck4/FN5g==
X-CSE-MsgGUID: 3gnl2kkRQ2S+jp3Bxnyu1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70108570"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="70108570"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 14:17:32 -0800
X-CSE-ConnectionGUID: arGWVzEOROSrAVcAaGXvug==
X-CSE-MsgGUID: ZUTD8BWPQFWFXM4SKtc0hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193287097"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 26 Nov 2025 14:17:30 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vONpI-000000001X3-1Uzl
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 22:17:28 +0000
Date: Wed, 26 Nov 2025 23:16:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:for-6.19/block 39/101] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202511262329.sbqVjG65-lkp@intel.com>
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
head:   c6a45ee7607de3a350008630f4369b1b5ac80884
commit: 262a3dd04e729386bececffeb095d31f7a9c43d5 [39/101] null_blk: single kmap per bio segment
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262329.sbqVjG65-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#6: 
Rather than kmap the the request bio segment for each sector, do

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
