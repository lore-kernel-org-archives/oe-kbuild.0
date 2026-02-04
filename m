Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4372F547F
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Feb 2026 21:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770241992; cv=none; b=S8FJPbKH7Z2pEyzK6oip5DeDydAyqCJoUQL8epmdjNSoEQNr9NG7cBJ69InJtD/8xiiVfiNfH2G3Sm5sk7C16k5hsXRRZOLECwG0DeaPaqkkFModI7Ty3y2l8xVr0TPX6CzEZ62y2iBCkmegRofjdmP8b/ov5Zyd89+l4ubtBTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770241992; c=relaxed/simple;
	bh=aHd7nUKJ24sMeBW+VEIzn0YBo3WP/i0ScTBze3jO3gE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mp+Ndex4U87TrfsyohdU5ODrOTjPPDiL9YAfTjPnSPc/fO+2wzMSge3i9NqI42PKQ/EG/FA++Rd39IpNAbgyiCQzEll5kuGiUAkanN03+PsUTRqA9OvqVlmI9TzQXuv0y1YRGfnfmixqFkx9aRB1M/nqo4c6iqGhkTUiVdvkncY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WENqZsW2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WENqZsW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770241991; x=1801777991;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aHd7nUKJ24sMeBW+VEIzn0YBo3WP/i0ScTBze3jO3gE=;
  b=WENqZsW2rg3qF7948o2qPBL6JZwrVF4rsPtMMdZFXpA6KQ+tUjGMTFmV
   Yjdm813iYrjgb0jQJqKKS4nEIheqAMEzlzXmpIrUmJK+bDpW/EDjPpYGF
   pszP3SWJuUnCn4WQlgiF3bjFToadLwKIIIpiEEZMw7pa2Ns+M8th/jcIR
   YohSJb1OtVyx914GJnR5xAosW/fPzknNhP7pNhmvzkwLm2Rd7H27hnCtE
   Y6yY7fDCahKsRlkmHvYI3eYj0uSLQWnQrqvo+eTRy/xURAVcm8GtWY+7a
   xGlFfQLqw4+ihLgOn1leLWRVFQgSB4vFfyzs+DAv2qZCZd8yTdRP8kM4t
   g==;
X-CSE-ConnectionGUID: QeIWLnXWRKW7O/lOuQpAfg==
X-CSE-MsgGUID: lsJwxlrDR5KTjpgTJ0awhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75290552"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="75290552"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 13:53:11 -0800
X-CSE-ConnectionGUID: /0tKx4VHR1apcPvsYQuQ5w==
X-CSE-MsgGUID: Z7EtIOigTlmTqfzIPQeXMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="210382618"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 04 Feb 2026 13:53:09 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnko7-000000003ph-39iU
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Feb 2026 21:53:07 +0000
Date: Wed, 4 Feb 2026 22:52:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v1 3/3] fbdev: au1100fb: Don't store device specific data
 in global variables
Message-ID: <202602042241.Fnl8zvPa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <9cbc57e4d65e131f39d702d061d554c1f4ede47c.1770196161.git.u.kleine-koenig@baylibre.com>
References: <9cbc57e4d65e131f39d702d061d554c1f4ede47c.1770196161.git.u.kleine-koenig@baylibre.com>
TO: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
TO: Helge Deller <deller@gmx.de>

Hi Uwe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0636e6205beed850d985276dc56fd73d785bea5c]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/fbdev-au1100fb-Mark-several-local-functions-as-static/20260204-171704
base:   0636e6205beed850d985276dc56fd73d785bea5c
patch link:    https://lore.kernel.org/r/9cbc57e4d65e131f39d702d061d554c1f4ede47c.1770196161.git.u.kleine-koenig%40baylibre.com
patch subject: [PATCH v1 3/3] fbdev: au1100fb: Don't store device specific data in global variables
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260204/202602042241.Fnl8zvPa-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#93: FILE: drivers/video/fbdev/au1100fb.c:444:
+	fbdev->regs = (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio_start);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
