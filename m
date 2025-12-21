Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6202FE071
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331669; cv=none; b=TDaAv/IlRu5X+FpVbGYiKIdnfqeeYlTA21tSQorUWhkBUnzzKeUau0nRl92/ZXaW/i9a8iunLI7mlsOG5cZzZh/ks75csT59ts7fzIe96PXj81GXWRFdvYxd77LKzP8DeImf2EP1WNMKPdtH7D3PlatDNSn8G8d+rcAxO2Nz+us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331669; c=relaxed/simple;
	bh=iC0LKkd3QdytDlIoxoEQpPure6H790nXjPZCrpEwUKQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ev3hhs29lUt1b6AOkWrstPwP+1Fw8jK+ycQC+uHmAddSYdF24odcCQaeL6TmBUR1rh7zqEutx2aLmZjpYH/XoJnlEBrciWrYX9TGGB+5l9zQhFbdxeG0muTPgwlgIjef0gZ8m/PajkLcN3wjFxb6p/vK+411O4E62x1lfrKRn7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLeZYAGi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLeZYAGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331667; x=1797867667;
  h=date:from:to:subject:message-id:mime-version;
  bh=iC0LKkd3QdytDlIoxoEQpPure6H790nXjPZCrpEwUKQ=;
  b=aLeZYAGiFoT/rLnHn0INBJd5iytGTeqG+Ei//2DTrKWGy8R6bR5RuPJu
   86qZW28ZR+0fKTuGHrmj46GXu2wIkuHBg4gHk3or3X19cYW13Q9KlNag2
   m+b80NtEXJPxHgTcNBLQ1IJtaFSfdh7NGf+l1MQ2mgSPH/3BxKMaiCI1M
   ++3x7sDOls0C/JHVrhguPYSGEH6uNn8X5wemFl7Mgug+xGOZLTKQgtjQX
   l3lMN1Q4nTRMRNy844wRxiTWJXpBz+J9A6dMsdpIpnCOMIdJYo1gzKqxQ
   AUdepc/sAOHErZtBL8ngQ/+V9iRdHoloLzMR48QaHxjCqWBCX5h7KcSMP
   Q==;
X-CSE-ConnectionGUID: lEBOS+A5TDSahn+quRZ1pA==
X-CSE-MsgGUID: MKOgIDiUTTKV3nDQA7s+Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78847598"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78847598"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:41:04 -0800
X-CSE-ConnectionGUID: 0ol2HpqyQraC1VXvDZkwpg==
X-CSE-MsgGUID: Zm05v/7ARKqYShC/VxxPpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199618413"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2025 07:41:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLYL-0000000059E-2rAe
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:41:01 +0000
Date: Sun, 21 Dec 2025 16:40:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 243/246] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202512211645.PIw2nEdm-lkp@intel.com>
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
commit: 853201c8e51eed322a6bdf78641e35ed3a1f8058 [243/246] drm: apple: Remove conflicting devices as late as possible
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211645.PIw2nEdm-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#7: 
drm_dev_register(). This reduces the the time at startup without KMS drm

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
