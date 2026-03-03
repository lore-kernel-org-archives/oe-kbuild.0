Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B804F7966
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 16:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772555782; cv=none; b=UIAvIDpsI36+Akl0LVduuWO5ZV4nFjewt14PcjSX6b0UGd8sVmOd2YXpwolCLkwcNoGpP5n6HHfyh9wiAud25L8ayKAATykOQlnw/ab1Byn7mnjOg2ibTQpC2pu9VeG9Ps4TMzbgZgENwlGje8EitIDjY7gnbudrDWBROMRr1HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772555782; c=relaxed/simple;
	bh=mSCpURc0YOK1ms7a9jN9rZMnPegbeOkN46AnyuRr8fo=;
	h=Date:From:To:Subject:Message-ID; b=EXuCFpTxifMKhIcD0uwSfbgs+6oqNYnJz8gSg/+AbvQ56ndQLjPmYvPwy/ZfT0jAp3VOS2DB8XNIaPFh6U7iM61nLphLt63Qz2iO2u0uq4VArCzE1Iv0HALhUNm0Qr9NIeD7EMFx54Y6/w58l9AWslOwG4W+qy3IP0bzlAtoFRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+nhk+fY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+nhk+fY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772555781; x=1804091781;
  h=date:from:to:subject:message-id;
  bh=mSCpURc0YOK1ms7a9jN9rZMnPegbeOkN46AnyuRr8fo=;
  b=c+nhk+fY0Uk+iFou2hIS3XbOJM5a8+HiMmxWg2lopRU+dT1ERyJY0kfI
   IkoCdTV6zSm9qJof06RJ1K4t14YbXmK1wTe0DfTfFoNr+vq4htb/JFlpW
   8ibue/UVgkf2Xei12x27jFdln/gkghamTjiXi1a6Xy9yq4NN0+FQfVQD5
   /OBC8Qjpw1LMJz8D/CXzNfm0ZEASaR6gQv7Z2AsXh/VyzC5ESN6uqx9R3
   +EMRK7d0bzXs/b9o/oqDG863+wxXeQTUoqfaKM+Mz+5WmlJy7jUv1FQym
   3agqhWF/WHXxlnxU15eTwtX9cDpsu7dB8HKh3+f5wmdczU0dEKtS4gv/w
   w==;
X-CSE-ConnectionGUID: Pcfnht5DQxCbro3K2D6lvA==
X-CSE-MsgGUID: ZFAbrXY0TAiME6QajGbLlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="96210141"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="96210141"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 08:36:20 -0800
X-CSE-ConnectionGUID: iqZ4vghMQgSptDWOBhB+Mw==
X-CSE-MsgGUID: Bp5Og2LYQB220Cw4uoFpmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="222535970"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 03 Mar 2026 08:36:19 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxSjJ-000000001V7-0I90
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 16:36:17 +0000
Date: Tue, 03 Mar 2026 17:36:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:irq/core 13/14] checkpatch: ERROR:SPACING: space
 required before the open parenthesis '('
Message-ID: <202603031710.Zd8deTuq-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   33fdf3e4fead20d38be1457c46d97b35a5dc6f05
commit: 5b122c3b4a593ad4a4bbb01789c13cde3df9660c [13/14] genirq/proc: Provide architecture specific binary statistics
:::::: branch date: 32 minutes ago
:::::: commit date: 32 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603031710.Zd8deTuq-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#79: FILE: kernel/irq/proc.c:977:
+	for(; !s->count && s->irqnr < ARCH_IRQ_STATS_NUM_IRQS; s->irqnr++)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
