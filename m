Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4685834CFC1
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 15:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768146605; cv=none; b=NV5k/ql8j5oAaPZjlxTc7OKudUT3d66ZFmITNtEud/IPz3suklGlMq7zexHcGU9CgFLJs2vh43EPybQVzsXJT7CuJJvgIRGBftT4t7R5dbsa9lGjW6pD0TD+euyih4opWlWRvWV3CG1ttWwadiitTce3YFQya2VIrNs2tytpTEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768146605; c=relaxed/simple;
	bh=NAfJPD7lcXPk+C381b6Q22Anur1Tf/uU06eMPXwD1fA=;
	h=Date:From:To:Subject:Message-ID; b=YBntEW3evDnkM0Y0x5TRK/ol/7velWCZ4ks9gnu+y2Te1JNlqVuJNK5+qBRplL1q2zJJjdqQYrjpCWmAkx8RLg7QhjP1ajfpHAP48vcHbOFPah57La1o35jMDSmycRBhSF7Q1K1pqsaH0Ca3pgY6rAR6qyE+vOdvQ4HBT95Ood0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IoVGPMLV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IoVGPMLV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768146602; x=1799682602;
  h=date:from:to:subject:message-id;
  bh=NAfJPD7lcXPk+C381b6Q22Anur1Tf/uU06eMPXwD1fA=;
  b=IoVGPMLVsed9z+RRKtL7doguPmb3fjyfcWRx3kV/xIGe2934nGKMJ6c9
   aTTphe1OKAjOlJ6QXHgmgDVKsZ4CC7ZzVGGnZkBC6LKWXYX5L9povGnzE
   COCVokqVS0NIAKSP1LCTIWKDjFQ96tQOx4nvpFZNIhlwdmoml3ctrzCxd
   UlbMLoqXj8G3RIxpVtVdl892kIwmX+uNkJ2nHVxjEMboAF/cK8cSqnAjd
   UVfrbYIk5ql9T9kD8iMq84g/GFH+7E8YGWK3CZANezeh9eZbL75DIu35x
   CSXu2rzyiHF+m4SZvZ4ceQDmsTZVYHvgUrchAe1oxM+7rP7OfGMIKCggq
   w==;
X-CSE-ConnectionGUID: KfZx7/A+QHWei7F1QWaZ0w==
X-CSE-MsgGUID: n+HOEjU8TLuyrhqAuIR17w==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="87028143"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="87028143"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 07:50:01 -0800
X-CSE-ConnectionGUID: ha4U1r8IS3GC9naLgOt9Mw==
X-CSE-MsgGUID: lyLQvo/rTm276iKVZ2QdnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203961464"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 11 Jan 2026 07:50:00 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vexhV-00000000013-3Xu3
	for oe-kbuild@lists.linux.dev;
	Sun, 11 Jan 2026 15:49:57 +0000
Date: Sun, 11 Jan 2026 16:48:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 130/130] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202601100731.mpCvjZTT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Message-ID: <20260111154819.TbUUiqA7ufwsc-7wMbG01s_jZpaOF04araAHBF_PQGg@z>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   38c0d0c6764d5759f2da1ed710401a00bbf59e9e
commit: 38c0d0c6764d5759f2da1ed710401a00bbf59e9e [130/130] arm64: dts: apple: j[34]1[46]: Mark ps_atc3_common as always-on
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260110/202601100731.mpCvjZTT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#8: 
atc/dcp for the the HDMI output on 14 and 16-inch Macbook Pros.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
