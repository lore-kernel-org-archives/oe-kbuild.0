Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E60396D16
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Feb 2026 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771936065; cv=none; b=rHZk5YnUy6OaJdYpnC/wHoS/YQPiciLC7HlPqv4srGWnj8a/UPoEia3Zicxh185ZmKVxZ8jN4NEbo1Gjx0qSZX927nzO2Oo/fFXqZ6pCbS9kOAS+KCSynOEBW/BTRdlRCgrTiNxDvJ7wdPHQf2HeQMNvJGU265hiMqyCn+W5/MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771936065; c=relaxed/simple;
	bh=bj7Vqado/H41yA5VehRo/tSg1iqp4wUuBocoyr/W2Ak=;
	h=Date:From:To:Subject:Message-ID; b=c3CgKrNFw/dr4R6oKH/BTvr6VU7WMLqSCZM6Vi+xyMC87/bYk+ZnLgmgiD1Zl10p39zyIrLPoa22lwpg+Wnn984SqJfi9fKIdkmf70uv4xeeVcM7D8spmP4DrdSoc6CUWDHzdocB+c1Vi7dnVQkVq5VB6i9BjSFg9oAdGynY8Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCHCeGfW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCHCeGfW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771936064; x=1803472064;
  h=date:from:to:subject:message-id;
  bh=bj7Vqado/H41yA5VehRo/tSg1iqp4wUuBocoyr/W2Ak=;
  b=KCHCeGfWTEfwyAUZJ/gfbOTREqR3F4o1hA00Ly2UCjZXoPwxyfcuWtAG
   jnQxBJTz4TBKM8lU4+i3ZOHfEf1l5rpQgfyx4N5rX6lHk1sBuiKyf7sXY
   vE2vQct9i1bH9soS1wmKH6DJMIC1wDoFbZpnTFNt7Mm2hzxyB9ARcqUPK
   qFE2UYgPv4wCC3Gg/Ncb3C5+aA90nFIjzkeJRRt2iVy2IUTZaFwpKq8Kk
   fgnFWmY90h9rvoB7zZd9ovBmngfLnfJeSV0b9eMBQbMuU+m93/O4J1Cg3
   6QtbPo4J+64OVt+ZR02rvMBnHG78r1kKx2otqmAhmbyZiUC7dogyHCJdi
   A==;
X-CSE-ConnectionGUID: 6qOjE+LhQ3iVi98+5cGh9w==
X-CSE-MsgGUID: xSEBW87BSPStf2J8EsPflg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73127131"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="73127131"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:27:44 -0800
X-CSE-ConnectionGUID: ngh1skXdSnKGCX41mHWC+w==
X-CSE-MsgGUID: x1uhTtiESNOoDAtXmR9jrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="246465387"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 24 Feb 2026 04:27:43 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vurVs-000000005H1-2t7t
	for oe-kbuild@lists.linux.dev;
	Tue, 24 Feb 2026 12:27:40 +0000
Date: Tue, 24 Feb 2026 13:27:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arnd-playground:randconfig-7.1-next 668/733] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'have'
Message-ID: <202602241316.aWYa9v6u-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.1-next
head:   76f9bd9e344ecd3faf7bdadedc7027b64a6f2d63
commit: 79db69a2975ce556a6a89f9b63214c51a7705b98 [668/733] 8250: port settings
:::::: branch date: 2 hours ago
:::::: commit date: 8 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260224/202602241316.aWYa9v6u-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'have'
#1597: FILE: drivers/tty/serial/8250/8250_omap.c:364:
+ * OMAP can use "CLK / (16 or 13) / div" for baud rate. And then we have have

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
