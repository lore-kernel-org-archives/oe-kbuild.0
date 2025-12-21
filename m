Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6B82FD7A0
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766333647; cv=none; b=krU5owkf92HCoL56U/qNVtI9bLLkyAarxs7kBQz1E0Me8arQ19Kwlp4HruIWXKg6oxsrekdJGqwYcCGehFaiWXFEZEo/0edWyUAiTtwR4Yt3LobpMg13H7bqIu3f+5I5Je8QNjZ6SQAFlVQWHDw2b1KjUz/Ozh6fv2Wpw+XkmM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766333647; c=relaxed/simple;
	bh=YdHj6gQhFZb0shNVC2JBc9h8jKgzAzP5KrEFQzY14lY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GhHsv5gYcdwnZRilaNVgfG/LXN8rV4JQfhJiPz1vgFJfVNqilRHHCZSA/5WXcQMaEArnZUpQdl9cznqUfjiz8DqOXd4bvItKo+sEUOp07a7WOgPydidDkIOVi+WHzXg9ilpYdEw/Ab3uL2aAx/w+gmgW0kcopOte/EKzzgmOjMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FT7L9WkV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FT7L9WkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766333645; x=1797869645;
  h=date:from:to:subject:message-id:mime-version;
  bh=YdHj6gQhFZb0shNVC2JBc9h8jKgzAzP5KrEFQzY14lY=;
  b=FT7L9WkVp7CUK4xiMc9X9DL5nAuDbGyywwl5MCKxWqPQBGIAWNK/4AAe
   z2IjWeiYGYvr/wnU0fMSwKbQegX61Nvv6Q1FDPrjSKtTzJCbd/ga3nEiW
   /Uyg5Y6paw1q3wKcoKBpQx4DM3JYCl8k1j1OfuGNJo1tse/UyiAJWZ7hP
   PQ1FP3ryNTANBidzpN43z5DUguJekuCBKjCPK9ypuf4w+TOXIgKMqVLMQ
   AEO6WFiD4mNsXDU8qrWzREHvYXM0cjw5j7vfnLsM6I3j3uO+DKl48ty+U
   EFRFvgDKeGu2LiNUXXu2WKcyGxZ9WUrpTBDX4jaaZMhDNlUwhoQj+vQvr
   w==;
X-CSE-ConnectionGUID: GO+aSOIgSYmZeIfIxWJY7g==
X-CSE-MsgGUID: obWvLN3vRPq+iF+cMFScEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="79331647"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="79331647"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 08:14:05 -0800
X-CSE-ConnectionGUID: n7l0pxbFSEy7Lo5X6uNpLw==
X-CSE-MsgGUID: 3CHpjJqSRd+3OP/1oPJvtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="230349545"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 21 Dec 2025 08:14:04 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXM4I-000000005AE-1Srb
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 16:14:02 +0000
Date: Sun, 21 Dec 2025 17:13:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 80/125] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202512211730.MrmEPxkM-lkp@intel.com>
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

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   4efff51e5abb86055ae7cd906a51f24d000b87fd
commit: 8bb749c11f874b96480133a64fcfbeb70e3245c0 [80/125] arm64: dts: apple: t602x: Add lpdptx-phy node
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211730.MrmEPxkM-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#8: 
the the HDMI port through an integrated MCDP29XX DP to HDMI converter.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
