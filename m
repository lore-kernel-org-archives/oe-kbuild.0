Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F022DCC1B
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Dec 2025 12:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765110969; cv=none; b=WgAK00g8B2W8QmSFE/n3FN3//U1OP3yABmnd3XOL6q2iQ0Jgo/6CDJqO3a4PvOQdvy1T96Cz5NUdk/gr6D4RGjlfxNv/b4plfMr0fKGPnc+kfShd0t0VxzCBfhbecSrgGH1YkJi8W+IffU5h3PabgKPWy+M4aG687iAFyjymIDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765110969; c=relaxed/simple;
	bh=/1ouWdw3q9B5gFGSlncLd0rEFPTq2xrE4tes9l2NVaw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+wQKHA3DUYG1PA58jHWZpG3IKykDdsKMzSW7odU1NPmCWO1dNKiwqj3vdR05zJWEnuy+biJXGR6wnPMX5QdPl2Fx0PdrJjXSTbosJ2WR3Jzy+KIuxMtJ9zIreCp86xDZehK5vZpmuBlDj/46vgHo6x6E5KP7AqNDyVtT8GbNUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDR4A8pJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDR4A8pJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765110966; x=1796646966;
  h=date:from:to:subject:message-id:mime-version;
  bh=/1ouWdw3q9B5gFGSlncLd0rEFPTq2xrE4tes9l2NVaw=;
  b=SDR4A8pJ/Ip7giqdq4gc9wCATlEIdeost976tXUie3VitwkGsHG3k0Cf
   k7BSApXYFkeQjxnhCbBTYEpFAy1KmSBZlJOp7SQwmJTUShMfKe3gk8Rs/
   bnRRMXLP9vWLw/XiM2WxbBmLrZIcYyZZ/fL//gXMLDqa83GnbRGcRMsII
   5gAeuOKjEe4nBP7TWKLYkz0ZzeTNyBTzLtgv7ki906nMqNEEJgFa14C3i
   6duVh34vF6XpZd5MX3d+wHmJyv5gdmLpQw7tbQa9nxZ18dnONttpjP2HD
   EPGkQrFVVp3rx2IQKVl5owB5CU9IlN9S7OWhJBcRCjE5AKEVI2gJeIy94
   Q==;
X-CSE-ConnectionGUID: 5HGxATpMRmii/MplV+k7qw==
X-CSE-MsgGUID: xjr9W2ohTW2Y0ACarG/6Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67239724"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67239724"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 04:36:06 -0800
X-CSE-ConnectionGUID: 5YLUMwFFRfyKgsjrxc1GxA==
X-CSE-MsgGUID: h9E9u+OVT2ekLO20mlXjNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="195329557"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 07 Dec 2025 04:36:04 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSDze-000000001CL-1YVn
	for oe-kbuild@lists.linux.dev;
	Sun, 07 Dec 2025 12:36:02 +0000
Date: Sun, 7 Dec 2025 13:35:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [devsec-tsm:staging 28/31] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'and'
Message-ID: <202512071325.jQbSgj5f-lkp@intel.com>
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
TO: Dan Williams <dan.j.williams@intel.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm staging
head:   4fe8662d1a9c77a268d5abe671e28a8b6774956f
commit: bc1946353879765aa5cdabcce04e3307899cb093 [28/31] samples/devsec: Add sample TSM bind and guest_request flows
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251207/202512071325.jQbSgj5f-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'and'
#8: 
Arrange for pci_tsm_bind() and and pci_tsm_guest_req() to be invoked via

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
