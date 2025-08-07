Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E051E0083
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 06:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754548193; cv=none; b=mrCo1DacfKy8dIoyAjmke4jzl0QM8Tzo30GDBiTWm2WC+Fyl+gJoBP5hSmAlC0OerXu37ahUN0XcHsykZkxqHeqefkWJzqWfuSyKBQgcsVKh0oYGNhWh2PSGmogbTs4pnIBANfuIyP43gA9tt0fDlnVRHvPvyN/5FbsOYNaja34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754548193; c=relaxed/simple;
	bh=wAmuc3ywxezzNsWH9uHWEYph5TX1+kK8FRwOW4uynus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QvjTqKeY37MRgITbB2O/TTDvtRVRmNefSzFpFuDPAcB2vyFfrB9Qby9fr1F15tW1423n4k/uBCsM/NURP2XKo1JlhtBjJXPIg3KowmTH/pC1fLlh9Xxk65Msv56Fp+vR2pX/fGN9S1XemXPG1I+JIw7Ny85vE5bBZ6bvw/64mlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIc7UW3z; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIc7UW3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754548193; x=1786084193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wAmuc3ywxezzNsWH9uHWEYph5TX1+kK8FRwOW4uynus=;
  b=jIc7UW3zF4b+Y+zudmDrXRq1vh2RTHK5Ls62F82cwpoJarnpbla9kKja
   Yd+3xul4QaYjqL2KmIMdyxAYOqVvjrF0PcjXNOzVpK+DsH6B5CgGQ5Z/G
   N6clHZcZp1U8yodjdkDqn1CXfBPeQQ3Fhn0S4mJWmJEgym4i7VC0oj9qo
   A+34G4WbcOjY0ynEXlrEu7euTCgWm097xjYiSOO173PrwyQ8YYUyIL+b/
   BJYANTlxzAX7kKvL6d4KZrw+pdW+aE0m1+41wa70Z2YPQ/snAYmBate5D
   hvlFJXegVBe/m6L1WIyGyyM1gfqLA8JJvOd95OZQy4PkxBWazU+cbbEjU
   A==;
X-CSE-ConnectionGUID: U27S3MUkRi+GF/hrazvVEg==
X-CSE-MsgGUID: /IYJVPr2QtuQW2zBtVIcuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="82319859"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="82319859"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 23:29:51 -0700
X-CSE-ConnectionGUID: Dw8k3FVnTiyefdBik/kYQA==
X-CSE-MsgGUID: qjdjhsnCQYON0jt6WeANhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165391499"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 06 Aug 2025 23:29:49 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uju8J-0002Sk-19;
	Thu, 07 Aug 2025 06:29:47 +0000
Date: Thu, 7 Aug 2025 14:28:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 102/801]
 Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml:
 opp-supported-hw: multiple incompatible types: uint32-array
Message-ID: <202508071409.odymIByb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 5b86f40fde536c0269755f16a825f127adc07104 [102/801] dt-bindings: cpufreq: Convert operating-points-v2 to DT schema
:::::: branch date: 13 hours ago
:::::: commit date: 15 hours ago
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071409.odymIByb-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071409.odymIByb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508071409.odymIByb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
>> Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix
   Warning: Duplicate compatible "operating-points-v2" found in schemas matching "$id":
   	http://devicetree.org/schemas/cpufreq/operating-points-v2.yaml#
   	http://devicetree.org/schemas/opp/opp-v2.yaml#
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-nb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-nb.yaml#
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-sb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-sb.yaml#
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
   Warning: Duplicate compatible "fsl,vf610-mscm-ir" found in schemas matching "$id":

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
