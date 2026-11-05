Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854529;
	b=h01Pd/2VEDpUPkMt/swUN7v9oJW/E5C1xssa7g05UXSlD1hl0G8q39DwiwetbCTGOixI
	 o4zsk/GEhZwc8BaghQQIgsxu9r0rDe590EgwNlpP0Rrxm4Ds+SJK1+cieQE1gDulGcJOO
	 NqsrXxxQ764qHWl/vo41Rq0u3/UDrHdJby9OCzD2QDjSMiGKGYegA8u16WckpWTkq4LKd
	 GdXQAmyHG6xvqFdO+0KUGNwFpQhlVAALk8r4cE6sO1GouijSXlmBdRGRfjdM088r64U5y
	 0fvqqw2Ish/WrQJbnATyqwlvMA768e46IjyFTFEdhPX8sGbiHwegQwZji7jbARsBZZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854529;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NOU0oMjoGTdM8Cgc/UXFlvOFQvS35NOQbsP3Bl6pyQM=;
	b=GCEP+7V/7zON1KQSfcCFn7gbIYVnfdmMJXtX0cIAfcyPcHc1vmsPQn3eCBBDYzvarqMk
	 bfVrcl50H3uuTjBRKoV+zXG8zSIRIgpiZjzEnS0hl4RdInH+UNrBXCVMHhVaY29vI2ELV
	 6nqfv16FWYLA/XPikFEtw5or0O0FVF7waYPrN1Uehli77KbSm1fGSC2V30/L136ExbfRn
	 nluabvBGF3XfBITj9h4tz72L88Nj28LjRZutGnI3CU/866zxzDNdF6HCBZZjKwh9Rdyw8
	 dh8HFYHrT0RFsNeO0YWHD+mX4CZuOJwWU53q55W7LGNNd3meAt05o3/bJp0SPsUYgDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=REA7LHgi;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF60606A329
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Nov 2026 04:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CF60606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=REA7LHgi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793854527; x=1825390527;
  h=date:from:to:cc:subject:message-id;
  bh=A5QRNs9hArXq0Kd2FkheAMoK+UBMkpuskHanc80drh0=;
  b=REA7LHgi9R3IItxBKfHZj6+cAuUXukEhovBIt8VhOtP5CTHEDgbG7hAR
   ZBcwx7Ja41EqYsGf7hbT8dH+K/jgwSdkRVIONOAjdmmPBRUU1NA7LnrPz
   OhDBvFJHKPbVkJZaaf/nJT2UzHwToFuGCiHLenkLuOpJjsq8+qdw9o6yD
   +M/cFDW9+UwEDM1mdV4SB6+hfKXF5g1GBLqpyUWDdyoBSwcwWgMR+vNsf
   UPXOV9ljV0fEDNWLsMRjMdq6iNKFlwqbCEz3LejKbgmPRHW0H20klnfvW
   gnmGKrc6BP4KsgB5mYHgYPgV6iIpJwduE2jNo2TeKX7PNm8W/qJynsCCj
   w==;
X-CSE-ConnectionGUID: iXoqpu7HSlKzgiBWh6r4VA==
X-CSE-MsgGUID: /vcMOWMBQlWWiGc/rzpxKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2528640"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2528640"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 20:55:27 -0800
X-CSE-ConnectionGUID: rpEipUghSQe02CrkTFqAHw==
X-CSE-MsgGUID: 0G6jBsWpRrO8uMAWjqCnog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6748242"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 04 Nov 2026 20:55:26 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOpVT-000000009WF-2aXx;
	Thu, 05 Nov 2026 04:55:23 +0000
Date: Thu, 05 Nov 2026 05:54:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-ci:arm64-fp-stress-kvm 10/12]
 /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld:
 warning: .note.gnu.build-id section discarded, --build-id ignored
Message-ID: <202611050524.O2VgbeEe-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-fp-stress-kvm
head:   9f9d0f9e71eb366529b17a28adcb46c4e16f4f49
commit: 1cee7af2084c08d9c337d723599cfa020846b798 [10/12] kselftest/arm64: Build KVM guest versions of the fp-stress loads
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261105/202611050524.O2VgbeEe-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050524.O2VgbeEe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611050524.O2VgbeEe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: warning: .note.gnu.build-id section discarded, --build-id ignored

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
