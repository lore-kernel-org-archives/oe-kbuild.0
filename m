Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886052D5948
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 04:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764219279; cv=none; b=eCIqkSdUPNeYvFF5ouAzRzw5qCuPxV747OGQxEJOKP3QSAEaeZZNW8VCZ5qSkMMp99V6k3Bp5p2xysPhD/QLEGCHaw0i0QXfFiJ+LzP65FurbFDSlqhJvm4aL/XNKcyB5NwHUS9AptY/c+d1XvYVfAvaHHYLO7945qluvN331aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764219279; c=relaxed/simple;
	bh=kQcHjodx7u43gTTWZg5zncTLmT10oFR+HzoJcmR6hMI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cnixyg9LLfCakli0KDQcLjo2KV62hPnRn0G2srmKDjT8/TGW3ld21dF7LOiEQy6wprlQyOaukXH2SQinhX5Z/I4fg8s37HSgidrJKRAcjDMPitvScGaV11YKY4ople4tHa08GBulZI1FPkc7ogTZN0jEbMREwCLepqf0sQORDAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfuyLR3U; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfuyLR3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764219277; x=1795755277;
  h=date:from:to:subject:message-id:mime-version;
  bh=kQcHjodx7u43gTTWZg5zncTLmT10oFR+HzoJcmR6hMI=;
  b=LfuyLR3UVUCT8eIMSvLqb+ar4dQ8jJ94uspXrQKuU8g0L4uGQDKdRVjR
   kc7md+IlvctpZTpZtmjWBFMG4aka79DOxggmgLNMvKFDkqzVJepu91R5J
   Z9AFKdjxBpAeEjrZ+3XhKhp4Xe1EMmNppm5leyiwrg3V9BdvXfz2kTTH8
   H5FTqyme2OfJUs2TLLxaDq7RQcCs6zTAdn4g2Q4tEELNKnnbPl0PtGTZT
   giLsANLx2KG5fowo/45uVRYWclOFbgUYwxKevLJJBWlSjnwEfoNQmrvK7
   kzaEBIE+mSTIS8zxhUdxjHLv1JGEMeSpiqHG9gZP4FjaYpd0F+/E6zd6b
   Q==;
X-CSE-ConnectionGUID: 2csRem/uRoe8uHRl8MuV7g==
X-CSE-MsgGUID: QxBomxvWQJ+I6M+64tT2HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66221481"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66221481"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 20:54:35 -0800
X-CSE-ConnectionGUID: IqXJQhBsQjGMOWlOnBvZbg==
X-CSE-MsgGUID: rIHouZS/TAmib09bg7RPwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="224086435"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2025 20:54:35 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOU1Y-000000001cV-1ryQ
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 04:54:32 +0000
Date: Thu, 27 Nov 2025 05:53:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [nvdimm:libnvdimm-for-next 3/5] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'Dave Jiang <dave.jiang@intel.com>> ---',
 should be: 'Dave Jiang <dave.jiang@intel.com> (---)'
Message-ID: <202511270521.iYR0dESw-lkp@intel.com>
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
TO: Marco Crivellari <marco.crivellari@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git libnvdimm-for-next
head:   30065e73d7c018cf2e1bec68e2d6ffafc17b3c25
commit: 7e898a9a992293eea8df11c8bb6fe120df6f8e6f [3/5] nvdimm: replace use of system_wq with system_percpu_wq
:::::: branch date: 12 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270521.iYR0dESw-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Dave Jiang <dave.jiang@intel.com>> ---', should be: 'Dave Jiang <dave.jiang@intel.com> (---)'
#25: 
Reviewed-by: Dave Jiang <dave.jiang@intel.com>> ---

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
