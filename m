Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA02E61FFE
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331306; cv=none; b=O2dXcHumqwY2rZw7JOFM1auc3t5o63NwVRAM1u5cy6+f7T52oqIvfKRpLZlVuSDtBPxwf8NgOFQmR1c1fijqzGHViRoi4jYDi79TDLNJjhefVlsXw+MWPeo2z6q1qHY6VszFqdP2WjND1Wi9CVA30rNA9hFUt8zxMsc9r6cL/zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331306; c=relaxed/simple;
	bh=soVZ4LuswpDa3fsoyVD/anNIrrUqehKwcIGFhZHlovY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qj/m3k7Z4ap66edDbaUxSPaavU6s91cdsF2ovvsHgV1B1mTup2a6DoWRjEQsv8fTmhiroMZ2HrbyHtqF+5E3tAVYIgvK97FtvPLspjB1rsEOtpibYcb/A1wP1+NSm9skc33A863WvPyRKDPF1eOae3DW3pulWjg7aMjUXGC2IQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L22fBoZx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L22fBoZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331304; x=1797867304;
  h=date:from:to:subject:message-id:mime-version;
  bh=soVZ4LuswpDa3fsoyVD/anNIrrUqehKwcIGFhZHlovY=;
  b=L22fBoZxNkdynej96AgN/wIe1dqmc3R+dSDgS/kqL+w468i9V6ZQMBHI
   /RSwsuCk9iyiRdISAF/4B1c3O2yGJOGFXpKnMih2+0kCHkeQ1Ns2BOKkN
   seRWxdwKNZgU1Pkh4BL25c54T4on3SSxuuwDMRzTcgIFz9iwZcuPLBqNP
   CZirfwTP6xeINHZb8E9XDQpin1JGy9d1BZTDT2PXfKl5+lBkS8+UComTx
   aGVdlNkMneP8Gt9Fvvfhyf3I74bcXxQT7T+L6wCJ72aeXGMJrzvkuBfw/
   Lj/v+B9/hNQB1Aa4QqW6vehIu1+jXmUpI44LNc5jjY0Psa9iYWC7Px1O1
   Q==;
X-CSE-ConnectionGUID: IOYCr+GNRDehXGm2iWG/Fw==
X-CSE-MsgGUID: Q/soTv42S2yRgtDcq4cgsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="93684780"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="93684780"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:35:03 -0800
X-CSE-ConnectionGUID: IyAkZS9+QjqbAJPM7nhtQw==
X-CSE-MsgGUID: 1bHhTUYzRIqH8K8GNzBJ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="203794211"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 21 Dec 2025 07:35:02 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLSW-0000000057s-3QcY
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:35:00 +0000
Date: Sun, 21 Dec 2025 16:34:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 111/246] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'of'
Message-ID: <202512211624.7GoxymVB-lkp@intel.com>
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
commit: 1f084a61aa307eac891bbbf752a7a36dfde32372 [111/246] drm/apple: Use iommu domain for piodma maps
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211624.7GoxymVB-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'of'
#6: 
The current use of of dma_get_sgtable/dma_map_sgtable is deemed unsafe.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
