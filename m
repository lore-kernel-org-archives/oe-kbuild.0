Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32293208961
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331069; cv=none; b=VQS+hx045WxwZujtHyS82TGZYtArEy3MQwqrqj9Q0mkWtOJMsZ1XyEfkvYy37krMhi3sk16mQMEiQQ6lZiMYZw5sJf2q2M/CR51Ghj/mJZlcazOUxQbPIO5Vqpd0RvdSD5ld4Vub+uYbxDbeY+DC1ODSLco0upRMCponviDn/TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331069; c=relaxed/simple;
	bh=RF4cHKY+DECuDWWAqqXPjozuuwz7tNeS2wrxyD++cHs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nBLxqLcNPmlF9j2bTu+G+x5sQLwmLmeNDLTCHOQva4nZY09a6XxASLRQv17X1e9bSMK8TGRqiP42NAMBI3l0w/8um9PulrYjldrsm6fge2Qdy8+T7ry9QX+/48asjO7OIVl9u/3q14CpqG/XgiUI/tWeUcKqcHRfngInF3L8vhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSHJC3WI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSHJC3WI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331065; x=1797867065;
  h=date:from:to:subject:message-id:mime-version;
  bh=RF4cHKY+DECuDWWAqqXPjozuuwz7tNeS2wrxyD++cHs=;
  b=GSHJC3WIuzx+Yfs4kSHIVk946qFQvEfA3igudCDOB0ckFITama0Wg/HD
   u3WMxx01HSL/5jYCPkkMYpmjHXRb9jQ9OuAx2snbxdOOYjfSgBRbMCSfr
   XG+xqGAdI/dzuEiRRj/CDomkSEmx01+K/pH2w1hBtosDR3Np5uN/UGYlx
   OiDJvSbG+Xm/sSgNEDOz8Yv1pfOQGU28GHvaOqGbYnsC9eZ0xs7TMjaLW
   qjvcDX+RfK8OH8nbkgx2pt9IOBn65+MYtYk+1mk7qBHMPi7lVJQepthnt
   H7B6PDEazk5tBwzRrzzd1GISKJ7VlZ8LuEP/kSY1OvNTN/eGlD4xzSa9M
   Q==;
X-CSE-ConnectionGUID: YJfTKiNrQtStM9QlREG+Qw==
X-CSE-MsgGUID: Rsq0mq0dS+SxCQJHJu9QUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68090548"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68090548"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:31:04 -0800
X-CSE-ConnectionGUID: KECvTT5ZQ068edY+gH/Urg==
X-CSE-MsgGUID: yPUVtOfTSRm7rJlQeSQNJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199071089"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 21 Dec 2025 07:31:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLOe-0000000057E-1xQ5
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:31:00 +0000
Date: Sun, 21 Dec 2025 16:30:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 29/246] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202512211627.F2APoldS-lkp@intel.com>
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
commit: 58eba8d9bd2fb1eb5a0baab893af230331fdde24 [29/246] drm/apple: Split dcpep/iomfb out of dcp.c
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211627.F2APoldS-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#116: FILE: drivers/gpu/drm/apple/dcp-internal.h:77:
+	 * sense keep some of the the members in apple_dcp.                   *

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
