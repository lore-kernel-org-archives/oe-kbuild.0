Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259D5175A63
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 14:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152144; cv=none; b=eEQGhtepP6iY1e9LQ5D911mcuU6bBfRXMUDqgy6sOhijTVy9NRgZ2J7bjGpAyNnlAsRH3hA9heJa7uFV8ULmr5C+f7aqUqLcnvgbLyF6AYaej0NUliA/3gjp5imgtLLDKROUrDLD8fM5SWT9VoTbzZ8eje9Psv6+xMsuCA0YLgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152144; c=relaxed/simple;
	bh=bi+CJSPt36cIFd/AFmueW+zzQJZeSTjMtDA3hFrFjUA=;
	h=Date:From:To:Subject:Message-ID; b=BGLSqLOPTfHwuHrD+0JPnwEdM+WKyZpfaIhWb1FatMwkXWvPY3iwhUZ6fElQWe4Duo4BiHJC/HErudKDzie5DZ6nHiBoP1mt2M8twg6OnJXvdKia/ilvbJQaLyboTnbf5DgWXwNd0XoynxttsC1WcbAzVEvzvQHDi8Ddz1pxtkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RvC5ig5Y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RvC5ig5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773152142; x=1804688142;
  h=date:from:to:subject:message-id;
  bh=bi+CJSPt36cIFd/AFmueW+zzQJZeSTjMtDA3hFrFjUA=;
  b=RvC5ig5YIPoNQenKgFoTIuxD17au3I4mpvwXm+7OopkfH9m/OlE3YsZG
   U0U6DRMBHcs+9GDv4unNjDim/lO3t4AxHwPgwo4a+I/WYl8W0sICbL5kO
   3IBA5j8mcw96AlEvnovvGRuBPkocGokRWTniu5YyRIEP+PKrL554lGzc+
   svZzKBh1IC9FKdsgb1wctaJkGqPey9X7GCeOFHe6kdNkN9cdmBe9w3lSK
   8LjjIt7Y/mmxY60g2I9RG/yW9eQh3cp/tRjtDe4il1zMzu4i231ftZD9H
   mpKfmH9b695ph29u/TNV/6yUGsaVRarHWTcTh4AgZsF2mpPeSTEGw8/b+
   A==;
X-CSE-ConnectionGUID: Hyj5A7cYQ/izGC1eDXShUw==
X-CSE-MsgGUID: zCdigJrxQ1q6Ahq99t1tSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84833211"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="84833211"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 07:15:41 -0700
X-CSE-ConnectionGUID: ArCLffjHTLOLaSposR9/sg==
X-CSE-MsgGUID: 2ZpRRGrRTQ2PXrYTiQarVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="216902581"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 10 Mar 2026 07:15:41 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzxs2-0000000035F-2tDx
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Mar 2026 14:15:38 +0000
Date: Tue, 10 Mar 2026 15:15:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [wsa:renesas/x5h/mfis-single-driver 6/10] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'for'
Message-ID: <202603101549.9Pu0g9x1-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/x5h/mfis-single-driver
head:   5808de360e247069d259883747dc7f0b9c802bf4
commit: 9adc22b51c89b3a3ced906f16b8005299a032816 [6/10] dt-bindings: soc: renesas: add MFIS binding documentation
:::::: branch date: 54 minutes ago
:::::: commit date: 54 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260310/202603101549.9Pu0g9x1-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'for'
#192: FILE: include/dt-bindings/mailbox/renesas,r8a78000-mfis.h:3:
+ * Constants for for the mailbox part of the Renesas MFIS IP core.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
