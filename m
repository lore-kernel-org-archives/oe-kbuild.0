Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3650500949
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 15:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767884775; cv=none; b=FP9HLuYLmiZCbTUrtG0cK14rX1kiTFZuMLA0Op4AnXj86EZYRsk51KgDMQQCT7b2UsJ8qHZio0DBKGwEwq8Q2oA3HpwCJu6vRvXi6E2yIlL1c3yqTRRDJRI1LYQR/6IFqStai7m6RmQyM1EoL7Yeh0BUmixM9nApqGQDGFG3e2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767884775; c=relaxed/simple;
	bh=I9knRULZbso7tuaMXwHCw4lNJy+c+uB6FSSRGQOipWc=;
	h=Date:From:To:Subject:Message-ID; b=WyICqDq2mKw/gh3Z2XCvHzl7OP12qiTlZeBtrJJtq26ev/w5S3jreVfDPC3shUcooOJYQ91vZZyVouHFw99cIlZJEg+YiW4JZXioxSAbbUY49MZlL3Ugu0JA3o59ajEbI50vSxdZ2VWKJS8Ufglqvm/UdtvKopJ7FOZlkVFT7I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+Csj/hj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+Csj/hj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767884773; x=1799420773;
  h=date:from:to:subject:message-id;
  bh=I9knRULZbso7tuaMXwHCw4lNJy+c+uB6FSSRGQOipWc=;
  b=c+Csj/hjuYoVOWty2kGMK/eUdGGy9auc8bFXKqWtNPIhIANmoje/agUW
   BpzN7Dw1NHxRLd4zwr+2kqubZ4IsIdyCV8JrPZTMI8wSUeweSEdcYKZHc
   ySKEbJDxhdRgfIpXABPwkHLApV3UH/A9aoZdn6hK2YxuTSVRpPAw/46Np
   Y6ROohHTtcf6WlJA6LSY9bpaCvLGHZwA0FCfXCSOuSNnaJxy9z6iyytA3
   HjoUeX2qBTTxQcNchMFSSQL7Pg5iVPXTUmQIhcjfFJA+A+VLCRNyLIwc+
   3KsgrZW0nDCZAoKCtEHV46bIgKleN0Xusy3QXeMmOMTv8LNU5tuBdtFLM
   w==;
X-CSE-ConnectionGUID: uVlzQLohRY2NG+NUX53khA==
X-CSE-MsgGUID: RSP+SRmHQR6srtZOyYZ/EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69164989"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69164989"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 07:06:11 -0800
X-CSE-ConnectionGUID: jdfZH59TQV6BR2+KJpdriQ==
X-CSE-MsgGUID: OaJRQ1e3Rw2y+79Kwzjnrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="202349640"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 08 Jan 2026 07:06:10 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdraR-000000001nu-3Yi5
	for oe-kbuild@lists.linux.dev;
	Thu, 08 Jan 2026 15:06:07 +0000
Date: Thu, 08 Jan 2026 16:06:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cilium:max/vxlan-bigtcp 20/20] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
Message-ID: <202601081638.UPXqKGJ5-lkp@intel.com>
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

tree:   https://github.com/cilium/linux.git max/vxlan-bigtcp
head:   4c58e0510f281f64b0f80a70459bc2885ed6f692
commit: 4c58e0510f281f64b0f80a70459bc2885ed6f692 [20/20] geneve: Enable BIG TCP packets
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260108/202601081638.UPXqKGJ5-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#21: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#32: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#45: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#56: 
    Socket Socket  Message  Elapsed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
