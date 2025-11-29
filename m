Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BACA78F3E
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 03:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764387726; cv=none; b=fAZuU+QFHz09N5xlPXOipfCcUWy+wz9rt+T5CI18db77SRlm5txtSZOhHdINo8u1qJyQxLIDxxzXdlUa6eRQYO7d2+ZqnSllQQwXVHIm8fr2BLOaCI0loKsDweEe8XH+f+ZfeVkxnVP+CFWCr5wvkCWfcBEpuRZojliRWlqF6K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764387726; c=relaxed/simple;
	bh=akLNhAzkHUJQ0zP/z1x+A0Km5+n6vaP8dcabwta9IPE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kieu3KEZSCckxGQJGNu8hoZrN2mP/WFPihKxK5sUQ3PztGLyhJVw8HXajVBwlMYgWP5eFk0le6IpyasY3FQYf1kFC7+wBZAS6JhCYyyukM6BvU/XpozXv3EQT1L2cxkRAEGAvehf03RCT6bOkh1xvTIfWa+Q7ZZKLaAhZT8Ug+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPeLPY4q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPeLPY4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764387724; x=1795923724;
  h=date:from:to:subject:message-id:mime-version;
  bh=akLNhAzkHUJQ0zP/z1x+A0Km5+n6vaP8dcabwta9IPE=;
  b=NPeLPY4qYDrl9IgeCTeFyQaW/m+FuIzz1qw8jc18KC8v1fJ91xBOa96M
   3FfOLfSdaYA1lmgL73KRZtc5RwOLLjjbEWqpC2oZZ1kMU4DzfeyyqWCRM
   E4lgoNr4uaJK2wn+XD3yHcEl+qo3pJXoBmChmjOwTeMop25FjJmbKpgz0
   HiIfV6vQYNopFLY0097BAJ34VEXz6ZoEk/MtlZAneTSegXLRlJ4VEXjyo
   igZLQbwJY8Zs3T9erZjlW7anWsGDOLimh0O1U9nEF8pCep55l1ZxNBwf/
   n4sV78JYVApUiBA+5qz36dSl8AD5H+3FkNvwrP93rs/zuQhcJo64khVhu
   w==;
X-CSE-ConnectionGUID: +0zmoImJRBO7oDsfYpPq9w==
X-CSE-MsgGUID: d05SF5LAT62VCXAITxXDEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="91878933"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="91878933"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 19:42:03 -0800
X-CSE-ConnectionGUID: NVBp8/mqSuSxpX/rqyitvA==
X-CSE-MsgGUID: j6ZJTAIRTpCyNcdg3hgwDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="193588724"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 28 Nov 2025 19:42:03 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPBqS-000000002Cr-3HPV
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 03:42:00 +0000
Date: Sat, 29 Nov 2025 04:41:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [awilliam-vfio:next 28/56] checkpatch: ERROR:SPACING: space required
 before the open brace '{'
Message-ID: <202511290453.vIluyXhM-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/awilliam/linux-vfio.git next
head:   d721f52e31553a848e0e9947ca15a49c5674aef3
commit: 56c069307dfd0a5e39b685e0aeee6c40d1d7ddfc [28/56] vfio: Remove the get_region_info op
:::::: branch date: 10 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511290453.vIluyXhM-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#80: FILE: drivers/vfio/vfio_main.c:1297:
+	if (copy_to_user(arg, &info, minsz)){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
