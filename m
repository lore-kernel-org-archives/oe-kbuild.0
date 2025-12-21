Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEDB2D7DF8
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331426; cv=none; b=uLcyr91Fz2GYxL8vz/+85IXUvW1X3PzOh2O3OVpYB2k5lUZFdZmzzx6uJ4JTJw7NtMgyfFPh3SsO02LB/a7Xe0xaHZeiJ86emFGa4hkNthks05Hv5wvN54+5PkQztfiXs4RkArGktwbAmdjQR6kPSDFtP8mLuXKumfalOoycYLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331426; c=relaxed/simple;
	bh=/q0IIV3PfE42KxT3umeSW6QhrUgIASPs57jZ8tm9cx4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KUv+71kt/xneeVn2Y1F4T517y/v3Vv4KSKIrlWlJCOogpZnDjxre99WAyMaMEsOFozaLcYG4XGGGZl5wt3612fyF80HtkB/y4BlfEPhMxOgPfiJLc+rFqy72owt7BBQCPo78Wu+GP8v5vn2cEmomNccTuDNZgveu8H7Zw9l2gss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/jIg27v; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/jIg27v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331424; x=1797867424;
  h=date:from:to:subject:message-id:mime-version;
  bh=/q0IIV3PfE42KxT3umeSW6QhrUgIASPs57jZ8tm9cx4=;
  b=O/jIg27vaLp0mPTQohtfC5kau2f8ZK9TERsVAzSe23Mt/+VEWHBv841G
   /h1ZhDZSGqBj8/lPoVnWSI4+NVw07G5wK32Y2hkXHAQIK7gJsdglMduqK
   qEJaOhGJcQkhFEPX9gP5VeGYa8qqG3yLga5Nd3TebntgmnG9KWxNnA4lg
   PPDmxQC2r4Yl8ClOJ1Je7PMz3UNfrNud6seySFdYw61mglPSQuJaC1RKI
   liOV/tKjsKUlk7q6gD/W1Hu2HjpiYc/PnTM/1bRsk4IBL+qcwpB+4h0Ux
   DtlVYnD/YtvPR3lP0074E/p8fBTI/A45B8JCw5fxoG0c4j+Kg2svl9KDx
   Q==;
X-CSE-ConnectionGUID: jPrFr0pQQVCQXDNY7idGSQ==
X-CSE-MsgGUID: tmk6CEFoSjCpFS+229fJFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68090694"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68090694"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:37:04 -0800
X-CSE-ConnectionGUID: J+Ndm30dTB6yxIbtJYDM8w==
X-CSE-MsgGUID: J7ckpSRgQV6lqu4iTS5mjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199347069"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 21 Dec 2025 07:37:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLUT-0000000058M-0YUv
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:37:01 +0000
Date: Sun, 21 Dec 2025 16:36:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 144/246] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202512211626.dUy90jOC-lkp@intel.com>
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
commit: e939e7a81aec390cf0cbb0804086250b89df1c3c [144/246] drm: apple: afk: Update read pointer before processing message
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211626.dUy90jOC-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#36: FILE: drivers/gpu/drm/apple/afk.c:631:
+	 *       1. the tracer sees replies before the the notifies from dcp

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
