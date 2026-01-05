Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2767330657
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 11:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767612464; cv=none; b=hraupdSwQlmfRdADf4e0VGwVJNNkXKhKpSICl/chJEz0lf386PhWiGt3KVrN8mq3HVKGtym2UL60BMEBogIn4gxQoiJVBdNwmgazCjBBrk5k3mzTLsOC/aP+YF/RpyAdXaN2mLp5+S+ksmgOzui4mOtvfeEi+DNjjKb+2kHg/Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767612464; c=relaxed/simple;
	bh=u/EpmVl7OgnLsBSp1zD3Lbd08/cXSFjD70bdCLCWWZA=;
	h=Date:From:To:Subject:Message-ID; b=t9tHM1O6H3dwK/VejnCrH0iH5ag81gLHCwMQlF7OqbZ3DcB7gaJt/dy3HC2D4KXhYJ4r18cmPH7B02EJPxP3Hnl7Qmu8sfK5dvd2M0JNj+5gM5px3eZZybHure72jE+7KGNYEPDv+mg2BhpNKN4xFMI0T5b50SG//u5f+cA4pzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TL1YdxUw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TL1YdxUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767612460; x=1799148460;
  h=date:from:to:subject:message-id;
  bh=u/EpmVl7OgnLsBSp1zD3Lbd08/cXSFjD70bdCLCWWZA=;
  b=TL1YdxUwv5TIhQdTzBD2DHahgR5oV/ZcgXcfMKA9HthVmll/WcIR9O4y
   JhALhAmr2SqZRAeW8uFw6Bau1Univ4AH838uT7KSFwFTnztB2X7mkJKqn
   RzuwveIC8inXIaEVJ1vK8EBp40y55/gm53jJ1P2fmclxVvpNm6U3alAd7
   SsaL/oCdMcyA9tnRyZenk0E0T7HkLVnXOskarfW5Ywz1JZooHvAwMRJvL
   CzH9YZ/6sSpOWZWPRrxDZIqPF9xPUPgWGwohV139VFnx1LSa375Pg45wg
   0Ek6Ad3xn4HcSyj5MuVxC74SzkYVQ7nZHyFtSDB+xyP6MV+lhhK8ErNn/
   w==;
X-CSE-ConnectionGUID: n6QMTbkOQoCXjbSrly5jLQ==
X-CSE-MsgGUID: yrZe5/5yS1GDgNXBAqIVLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="91628502"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="91628502"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 03:27:39 -0800
X-CSE-ConnectionGUID: wJhEL6pxTbCtywA5da/XSQ==
X-CSE-MsgGUID: W9SkGBpoQjqVY2FcZTRY5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="233509302"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 05 Jan 2026 03:27:38 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcikJ-0000000018r-3T8V
	for oe-kbuild@lists.linux.dev;
	Mon, 05 Jan 2026 11:27:35 +0000
Date: Mon, 05 Jan 2026 12:27:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cilium:pr/netkit-iouring8 4/13] checkpatch:
 WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute
 nominal patch author 'Daniel Borkmann <daniel@iogearbox.net>'
Message-ID: <202601051200.1smjOrtd-lkp@intel.com>
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
TO: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://github.com/cilium/linux.git pr/netkit-iouring8
head:   f268a0bb3f9278291cb5a26b406ddc8fb4f172eb
commit: 845b8931d032e84ceb70ba02c552a8fb88fcd122 [4/13] net: Add peer info to queue-get response
:::::: branch date: 33 minutes ago
:::::: commit date: 35 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260105/202601051200.1smjOrtd-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute nominal patch author 'Daniel Borkmann <daniel@iogearbox.net>'
#65: 
Co-developed-by: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
