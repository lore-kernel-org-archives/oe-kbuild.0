Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8437B28002B
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 12:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766406144; cv=none; b=dbS/MUJqici9RhSEpYW841Xc5nz/QmEVN7POCbnj+Av1Z+iyDdm56heUXij3iT873OH+VPP2XlVX8jBCUMqJRRYwRxqxXItQR45eV9dUvbYwOYvqB4jJfmjWIznpnx54yI8OptcXIpwRHosB6vZPlUTiUzUsuAIzTEuKm+t4/94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766406144; c=relaxed/simple;
	bh=TUiNyAW33d4/PxcdTh4rGczeASjRPg7MFi5BTMW3UN0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b+XNUNifCmolU1y1Mrc/draf6rE+RyW7kdUmvxmTLi74QYVOWyt9ewnPfwxaK16CviMUU/oOkKQZnRdTpUojvk/9wHoxdRuyl2pjMK97u7PvFZfk7Hhwlep6w+SrXD7ikUlDhKKxi/4jgqubQtRJUgbekL/r7813hs9sF6F03o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2ik3lRB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2ik3lRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766406143; x=1797942143;
  h=date:from:to:subject:message-id:mime-version;
  bh=TUiNyAW33d4/PxcdTh4rGczeASjRPg7MFi5BTMW3UN0=;
  b=X2ik3lRBCFTUSEcWLOx2uj3hhPcBdg3K7+pVRcalZA7yP0q/ffyQ/PaZ
   9LGF9wE9E0RigCTbo4TeVLSLPw68QXxQIctwMa9rI7TIiVlBbGes0baZB
   xus8CUvZ0ZLgIVFl0zgKRQKUiDrWOIrDrf8NbQnK+EF1ime8EkZVBws1s
   zsRVIoOsLqnOs2aiTRxEpeH5YR3EAzb36UJZBo+qsibSHaAgPQrCDoQZC
   nwpuIuBjzCwVZohwn9+QHCAUxI1qzQoi8RICgfydBHQ9YJaLw0psuaBTM
   tNB9Wbbm8W4RMlgyqsAY3qSVxOblTmoUslSuCHMEctI7Bdg+3ZK7eelt/
   w==;
X-CSE-ConnectionGUID: jkZT6wd7Ra+Ufy97tsdbnQ==
X-CSE-MsgGUID: 20z4fSJ3TjeEQlupN4Xvtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68141376"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68141376"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 04:22:19 -0800
X-CSE-ConnectionGUID: RRDgUBYvRTyGcZGj8ovi5Q==
X-CSE-MsgGUID: INCIP7ybQ1WzR/ZYOsY1ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="200404857"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 Dec 2025 04:22:18 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXevX-000000005S4-2xbZ
	for oe-kbuild@lists.linux.dev;
	Mon, 22 Dec 2025 12:22:15 +0000
Date: Mon, 22 Dec 2025 13:21:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal-linus-next:linus-next 20/20] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'claude-opus-4-5-20251101'
Message-ID: <202512221309.IVYmLaXU-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git linus-next
head:   f0fb4e6e782faa08d5a5768dafe2db689b167f07
commit: f0fb4e6e782faa08d5a5768dafe2db689b167f07 [20/20] fuse: fix iomap_folio_state uptodate mismatch
:::::: branch date: 80 minutes ago
:::::: commit date: 80 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221309.IVYmLaXU-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'claude-opus-4-5-20251101'
#40: 
Assisted-by: claude-opus-4-5-20251101

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
