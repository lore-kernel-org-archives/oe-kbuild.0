Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6522DECCC
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 17:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178404; cv=none; b=WRAdOQeANBdinvTLYD5IZuFJ2GP+VBXcdUMUrU2/G2owOZHiXJM/+0aJ6XeXQ2TgATq7cwjBEmh9ImssKGyuGCpfBK0BEzlQVUplAYPthAttrRgsokbWkbj5moH49nTXuXmJ82UeJLuhN805i6n1twVvvDhRB+jQWHzTBm7xBnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178404; c=relaxed/simple;
	bh=uUfAHebEaWH9DBVEay0oXiihrIxs+TYhxfS3HNca6oQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s2uhbcio99/9xA+svW2g420svRMVTpnPnTRnO7+6oU4MaOEsDHDYGqcAHTyKgvFBwKwhb5jpZdxQ+R2e4i43pyDOyfLtzTKNz971xdpxTn9btoR+LyZ27hZKI9w7UHFZDzwdPEeLs25V9+h+mVSon0a51E/gsO5QyOFikanJ9Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KlzzvBZY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KlzzvBZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764178403; x=1795714403;
  h=date:from:to:subject:message-id:mime-version;
  bh=uUfAHebEaWH9DBVEay0oXiihrIxs+TYhxfS3HNca6oQ=;
  b=KlzzvBZYNxQt0AeNI2chn5qwAogIZ0yYCDWA6wFdDLt5ZD7NyfxDbxbd
   PTPb/K8aUtuwuYotA3YRFQbu7Y3Wyx+Pv01reNjr7jmabTEkrZQV6Mtcu
   RtRziudbyFeE8waeR9FeWtv1I7NySrq4Otd2FsgQXHMGNEXqSijSOuqzt
   oWdjaPpINjOM7iYRvYyr7yAy8ZNGAw3OZZRuq/GMutPU9fpC7PetiEMTb
   ZtwA9xOc+NsTwenjG/YtQ/W+kmjb14bPu+KP74QwJT+kRoCPchZnA7nA3
   l9qv7Bf7340LuTcNSEsmqrzIDaqFc0h/5eOqTdoh1oYYM/K6oFLVOSG+G
   w==;
X-CSE-ConnectionGUID: koOxCEX1RlSlEpAKNukT/A==
X-CSE-MsgGUID: 3m/4Gd8uSDGxaZHhMqkR2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83831072"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="83831072"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 09:33:21 -0800
X-CSE-ConnectionGUID: /v9tiLFCSxWXaMUT2J9VgQ==
X-CSE-MsgGUID: pBCwAgayQoe+Hbd8bVP3PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="223705309"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 Nov 2025 09:33:21 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOJOI-000000001Hb-0hVH
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 17:33:18 +0000
Date: Wed, 26 Nov 2025 18:32:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [pdx86-platform-drivers-x86:for-next 38/54] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: ''
Message-ID: <202511261827.zngvadrx-lkp@intel.com>
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
TO: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Hi Shyam,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git for-next
head:   5c14bff570dc5a756d90f7a5bc665cbbe604db8b
commit: bc3c0a3231b78589896f283d971a003761b100e5 [38/54] platform/x86/amd/pmf: Rename IPU metrics fields to NPU for consistency
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511261827.zngvadrx-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: ''
#18: 
Reviewed-by:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
