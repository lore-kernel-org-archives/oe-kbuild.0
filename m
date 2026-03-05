Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1C8311957
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 23:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772754472; cv=none; b=b4Dv4dEFxQ4RkKTnD0knAdlJNY5roupeZorX+i/jTSGA1EP4i6SrHmmbemCLaqCLhbf6ACUHctJx6I5kfseleDPvDjKtuq2zfwYLrqaD1zY7W7uhHuU+fWoP/lQ856fk6alkKa7L3zExln7wR5726Nc5427iLkD8e2IwGPSORBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772754472; c=relaxed/simple;
	bh=nKDnAXWyEm6zuob6S9HLnnwmGz9iBk5pIOqWPgJv2fI=;
	h=Date:From:To:Subject:Message-ID; b=ZjCLKKSJI6SjOyA+gHpvbcsAPPogVSmiDoIkpBsXnf8g/EjL49ZICUmgxSqNf8pNJ00gYkVVxF0+uXKSpfdvVagHu+NtedVWzgb2SbEpxMlN8kI/gw7Y73crfQeBdmhkiBVQ35GQIL+XM4fXrUNMEzdJQHylhBN41M/3XxIbdBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I44LwMfY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I44LwMfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772754470; x=1804290470;
  h=date:from:to:subject:message-id;
  bh=nKDnAXWyEm6zuob6S9HLnnwmGz9iBk5pIOqWPgJv2fI=;
  b=I44LwMfYL95vbdb09S1EAMX33IyCU2v/5fYMHm6JHDZ6POIRNECIZfWS
   7Lt4BjJDhwSW29gI95kdXfbWctg0JbOF93N1HZMdY+2KzBGxl0uXZ+ahe
   Wisvc1y4FJtPYl2WpVwE9sl0ykSy3rYnNAF9Z/DhWmRNSEwiyAvYzVUjs
   9NtPVm9NlmdoAjsTyTgeU1YUkgAMRgwcGUbAIsCmXcdk+vqBepjQxHoll
   UHdIUKi6fpcoe1t7wG3N+jVuonZHVcuPVUqFFWkDs67qFDNAYfKdd+tps
   JyK45EjSGXZkMZ+SOSaWdNdGsyKlJvuxK+/PD6QqD1w4tKrTxFll4Jmd5
   A==;
X-CSE-ConnectionGUID: EmF4g3pVTnmc3ldFCBzRbA==
X-CSE-MsgGUID: TkO7MHE4Sn69uBVrxOrDxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="74046399"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="74046399"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 15:47:50 -0800
X-CSE-ConnectionGUID: n2lNLAQoTWu74vwFejt5Vg==
X-CSE-MsgGUID: 2K1DYiAyTtSewQDnxInlxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="217072428"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 05 Mar 2026 15:47:49 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyIPz-0000000026n-1OI4
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 23:47:47 +0000
Date: Fri, 06 Mar 2026 00:47:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [conor:tsu 3/10] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'represents'
Message-ID: <202603060034.YzvOxy02-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tsu
head:   f1a69ca8e9945732f492b2a9904a721faa55a753
commit: 49b6d71d952f007c605ea4db8084bd9a95eab5ff [3/10] net: macb: rework usrio refclk selection code
:::::: branch date: 63 minutes ago
:::::: commit date: 67 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260306/202603060034.YzvOxy02-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'represents'
#28: 
Change the new capability flag so that it actually represents represents

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
