Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B33290DBB
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 16:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766333110; cv=none; b=PoGIB0/yKJYX0jygxobiFnAxHJYjGfGqVQBZzjy/TBR43teFLcZEG+96O3yXAkxdQHyl8tfDMJ8uU+aZYq9tOXZ0GIvnGHXHbh+a263g1Jvt2G87tDimZVZQRt5Okve96nUPSs0MIenRg8kPe5nzkgypfyf6w0rtJ+fGUhbh5wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766333110; c=relaxed/simple;
	bh=w+/pJRSPkWPVhAEDMyjhoOZa6Qqj1L1JOI4KHMPgzKs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mm4Bd48SfPJeXzP8jJP03Jhd0IsZvJppmdEdjppXmv1RYLaK4Xw63Kb15X8nc+Kz1XA8BBfDQBRD+HdluS6O0JPBtQ0Zvs1oX1O8L+sz8Bn6DUiLzHJckcur1WF3dTChsaLyg+0s+fZm+V/HSqCKNhP+zPkx4U3AIw24tJLGrMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0HP8NIE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0HP8NIE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766333108; x=1797869108;
  h=date:from:to:subject:message-id:mime-version;
  bh=w+/pJRSPkWPVhAEDMyjhoOZa6Qqj1L1JOI4KHMPgzKs=;
  b=N0HP8NIEpRtMzsdUwcqHGusqH7GDFt3o1L7HDNbla6DSzxgu9LPuPIsX
   SctSdemGOzdND9UD4UWNFnnIaZUnLQ2gSOpzCVlIwYbWfgZgJvWuWNUz0
   bLaMkv3zAhHi4dkmvc4jsUVW3Ke3qMluYd1G/TYM7AjF0evlu0gWDgBBK
   5orua1vbDi8Ju09P9uy8MgvjlkAn8zg0nSeQcyoQ0Sn7YNHNhbUmDf7pd
   jGB6uFfuMC+VDwEXLVuV627oplC9w3oLlChF3Sdkrjk5cWGAguwl+wV80
   chk7HhiIhWj5lZNh96qU9M4v7H23U0yRelQaMeUPfFW7wUrXewd6PBsDR
   g==;
X-CSE-ConnectionGUID: 1c7fXSjmSl+PFyoep/Z+JA==
X-CSE-MsgGUID: oU6BsC27TDG2iyQyKgBl1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78848462"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78848462"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 08:05:05 -0800
X-CSE-ConnectionGUID: TaWrHryNR1CjJglER42QCQ==
X-CSE-MsgGUID: MILnNF2pSIW4mkicZkNEiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199622208"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2025 08:05:04 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLva-000000005A6-1597
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 16:05:02 +0000
Date: Sun, 21 Dec 2025 17:04:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 8/125] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202512211750.Wn7FMvJo-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   4efff51e5abb86055ae7cd906a51f24d000b87fd
commit: 077730c0196bf784bbb0b7c8828608c2750b45ef [8/125] arm64: dts: apple: t602x: Add Apple Type-C PHY and dwc3
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211750.Wn7FMvJo-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#538: FILE: arch/arm64/boot/dts/apple/t6022-j180d.dts:570:
+			/*
+			* DANGER ZONE: You can blow your speakers!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
