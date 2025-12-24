Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789B629A2
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 01:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766539488; cv=none; b=BB9nzwaToyxdNa4pQcu82+ZzQ9JQDJITjA3I0Yf0htgsIjY/fKN1EzA68KYv18rPxi+ckeC3BEmDbNFp4zSP/PHY0Rn2uc2REQ4ubgBTtwCxgpVhn48QfPFaMUjda/kK2apTCKLm1zeL5lh/c+c0amdd8/W/7WXLVhlNGzIPwws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766539488; c=relaxed/simple;
	bh=fbvYpH+4vC6T13IRT/zUClfdQgRsP72dP/SnKXDlssk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bjs/Iwbdvz5bWVXlkGF41OOXY1X6UdlaBlYdd27hBKD45CoNUPGP5zRtPedB6Bt8D2Mygnn4UbYO4JhbsougTVFZdpVDy8YpXKz9tDeVwDeM8/yMV16WEHd5aEA9eWey2CucExvXsngCUc2QyaNwtXEiawIbLRox8noq5yt9hco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8UyuaiI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8UyuaiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766539487; x=1798075487;
  h=date:from:to:subject:message-id:mime-version;
  bh=fbvYpH+4vC6T13IRT/zUClfdQgRsP72dP/SnKXDlssk=;
  b=k8UyuaiI6IEJAD0kdeCauzmgxVH5Yva0RFLtqY9SwwC9Tieii7KcmXo1
   nIwiRxKp9JQlwizMD9G7ZMFe9OUPgj41FlQrKKeRgLIr3oyHk2fHfg1Iu
   DFph1hgwgUbcU9HDLtT8ThlzTPtaURGzj1jKObw/egvOcUze3yZC/52GJ
   AhI4xeFkrt+r8RUjYQTdUupaPuE7TEKd3Xy8hOBghf4lh3Oc7w8OXRGJs
   f1pnkbZ2AFDT7GgM/XFZTjl0vSd7nz7RMMXq87pCcRfskK1wtUMj/KZY/
   VWOZ+/wVOfkKDRk23m9UJSQGnWrrsjhMfG1tnCBC/M2mkSflys+St5zGH
   Q==;
X-CSE-ConnectionGUID: Na7suHc3SpWyLlA0WEFohQ==
X-CSE-MsgGUID: iY2aaGt3TZSCrGM30Cah1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79107317"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="79107317"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 17:24:47 -0800
X-CSE-ConnectionGUID: LrssLYNMRiSWDXYLiITuTw==
X-CSE-MsgGUID: sbbgmkrKQTie0/wvYaHz2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="199048212"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 23 Dec 2025 17:24:46 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYDcJ-00000000638-4ACN
	for oe-kbuild@lists.linux.dev;
	Wed, 24 Dec 2025 01:24:43 +0000
Date: Wed, 24 Dec 2025 02:23:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal-linus-next:linus-next 6/6] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'claude-opus-4-5-20251101'
Message-ID: <202512240236.SV4cc1kG-lkp@intel.com>
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
head:   7f3cd21632e48ba39bb686da6da46de644005e29
commit: 7f3cd21632e48ba39bb686da6da46de644005e29 [6/6] iomap: fix race between iomap_set_range_uptodate and folio_end_read
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251224/202512240236.SV4cc1kG-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'claude-opus-4-5-20251101'
#49: 
Assisted-by: claude-opus-4-5-20251101

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
