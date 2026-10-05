Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC5021767D
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 12:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204442; cv=none; b=UqASK89CaCHXYbmvcbZc5YxrbBk1DVJJXs+2OuAsBz+W90mxGktcSpABiRzFDJGJTmZsR0b9k8QaEMFrPogdxhnnK6zOZlP1GP7Xwx8QFaXBrowW5HnegxFLNApRwOzJhe+GQANr0LRuR3l+Is5x1Ho+wuzK65AtzhX558C8R0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204442; c=relaxed/simple;
	bh=LsQb6UgD+RGj18HUXE/md4fjQNjtQflIlJ4Hr7CbDnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OZjFpioz/1WytufaWygxkJR4aZZXvuBn+J78RvoRQtaWqpGWjC2kbr4/Aiugntv18NZ0+4CxDPUJClsLM26SFw2xTMzaMi531ohFtTcnBB7IPuprrd79VyqrzEPXus01FYLrueZWeUusdy/nFO3RvFq+VDxIB+0tj3d2SLrkLlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5L1gtkV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5L1gtkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791204441; x=1822740441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LsQb6UgD+RGj18HUXE/md4fjQNjtQflIlJ4Hr7CbDnY=;
  b=j5L1gtkVqxtKrQz684IqRFUSYbT7q6/jo58bQbhTJF+SEjnT5xTuqG4o
   FlH1PEXktA8EkIvZB16Na+tlmH6yMilf1mGiG3VQ5GSgRJkMK69COhduX
   F5mv0ZTY2wAGffcrzP5vi2FUOxYhLgit3hNZ25wC4dZiKZGZxhagYBppx
   LtWASrWcULVI3IndDN2QomZuS88JqFf/tdNjwr7BWhaHzn+v1K+Yjin3Q
   Gto9QXDjkQk3IKxCD2RFevRr9R6eMpN2wwELupCci1o8jAc+QYW1dNuqh
   JJtjKB2gyCwE2cpMk8IY/78SgA2IkHkBZGk2bF3BCtKCldHXaralWf6ap
   g==;
X-CSE-ConnectionGUID: PpG2HrQ4SeavNQkYebdUMQ==
X-CSE-MsgGUID: aZQdq8n4TbqNSptCp4jvKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91003784"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91003784"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 05:47:20 -0700
X-CSE-ConnectionGUID: hnuYn8n/QE+3xp7ZeuT/DA==
X-CSE-MsgGUID: jW08QOMsT6iA55/Nr28d2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="280553239"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Oct 2026 05:47:19 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDi69-0000000007r-2oHC;
	Mon, 05 Oct 2026 12:47:17 +0000
Date: Mon, 5 Oct 2026 14:46:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: arm64: csum: Add fused copy and Internet checksum
Message-ID: <202610051422.TPjuBOMt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <202610051422.TPjuBOMt-lkp@intel.com>
References: <202610051422.TPjuBOMt-lkp@intel.com>

Hi Demian,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Demian-Shulhan/arm64-csum-Add-fused-copy-and-Internet-checksum/20260927-151757
base:   
patch link:    https://lore.kernel.org/r/202610051422.TPjuBOMt-lkp%40intel.com
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-r2200-20261003 (https://download.01.org/0day-ci/archive/20261005/202610051422.TPjuBOMt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610051422.TPjuBOMt-lkp@intel.com/

New smatch warnings:
arch/arm64/lib/csum-copy-neon.c:93 (null)() warn: statement has no effect 'uint8x16_t'

Old smatch warnings:
arch/arm64/lib/csum-copy-neon.c:103 (null)() warn: statement has no effect 'uint8x16_t'

vim +/uint8x16_t +93 arch/arm64/lib/csum-copy-neon.c

15b4870d68269b Demian Shulhan 2026-09-27  81  
15b4870d68269b Demian Shulhan 2026-09-27  82  __wsum __csum_partial_copy_neon(const void *src, void *dst, int len)
15b4870d68269b Demian Shulhan 2026-09-27  83  {
15b4870d68269b Demian Shulhan 2026-09-27  84  	const u8 *s = src;
15b4870d68269b Demian Shulhan 2026-09-27  85  	u8 *d = dst;
15b4870d68269b Demian Shulhan 2026-09-27  86  	uint64x2_t acc0 = { }, acc1 = { };
15b4870d68269b Demian Shulhan 2026-09-27  87  	unsigned int head = -(unsigned long)d & 15;
15b4870d68269b Demian Shulhan 2026-09-27  88  	unsigned int tail = (len - head) & 15;
15b4870d68269b Demian Shulhan 2026-09-27  89  	u32 sum;
15b4870d68269b Demian Shulhan 2026-09-27  90  
15b4870d68269b Demian Shulhan 2026-09-27  91  	if (tail) {
15b4870d68269b Demian Shulhan 2026-09-27  92  		/* Final vector, ending exactly at the buffer end; see above */
15b4870d68269b Demian Shulhan 2026-09-27 @93  		uint8x16_t v = vld1q_u8(s + len - 16);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
