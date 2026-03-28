Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2605612B94
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 04:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774673283; cv=none; b=aXo+H5NQLXoDv6cDqors8olcaOB5CEc8jc7YKJsE4OR/ClmwQW8vc3qyEs7u9b4n6EfnajHmvJdXe6KZ/F06IWl/52WnewX0VcXqeMB3mOJYXlPivsCI9RQoJdn68ziQAOQAIN+hi4q8og8bIKEdgsomnxSxzCykiKRUhNI9nv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774673283; c=relaxed/simple;
	bh=aC/JttTG+AxEEG9khckW+6B2H4yMsCsd+dNuQ06rhdk=;
	h=Date:From:To:Subject:Message-ID; b=I/yJqYpUUsd5OKpVHfoYVvom6ec38FOXjYSJrovfjUgYyQaJ585XhwGlfUprJHnbu6ccul3W1QWsF4648qXgaMXzZJFYZzebOSK63ZrVl5ZvIr4pQJ9EAR9/N2o5wwlucEZ8YUqbQJ66xXpV3dsLKZ8hSjQi0D1jRoRJ7J0jdH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7U4s57T; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7U4s57T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774673282; x=1806209282;
  h=date:from:to:subject:message-id;
  bh=aC/JttTG+AxEEG9khckW+6B2H4yMsCsd+dNuQ06rhdk=;
  b=i7U4s57Twi5SMtYQZMhhjt7VPUSbV+KJRbJTpRa3g2vFxOcmf2HqBHXh
   JFRGUrL0w4kfvbxFbML/kKsgnypjw76SSRR9Y7qryMD8fOUpzYZX43I1B
   TMNSe1+/6o+jGm3RjGEHOoxog56lpeTTHcZC4RNGrgLgjAw8rdo87Vqdm
   /htcuOAByT5btH/JGFzQVhA618MHG32Vg2LiDPfwz/Mf2R2mULW2RmOXk
   /DeWVPPdv/hhsJajk+dzHPRA9IacStn4kye2D26xugyeBNbI29CKR+fu4
   4HjiXSoo12um3cUH7OfHj49dyBlzeIgkqID4b3raIBniq/17Xgt2q3zJr
   Q==;
X-CSE-ConnectionGUID: rbazOB2pT3qnV14QfphvzA==
X-CSE-MsgGUID: ooFU7MQpS2G1k/g1sdzOvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75634730"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="75634730"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 21:48:01 -0700
X-CSE-ConnectionGUID: HSD2euljQFayVz0B0GU54A==
X-CSE-MsgGUID: KBU0p/Z6QDSatn9sg0Oa7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="263447000"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 27 Mar 2026 21:48:02 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6LaZ-000000007dt-0MWo
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 04:47:59 +0000
Date: Sat, 28 Mar 2026 05:46:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:arm-xor-intrinsics 32/33] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202603280555.MkcBc91x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm-xor-intrinsics
head:   08cc4ab31d9ebd8f4b04679a283bdfa823f8e315
commit: 39a8fcb8e7062d1395edeac0423433a6752f7c3c [32/33] xor/arm64: Use shared NEON intrinsics implementation from 32-bit ARM
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603280555.MkcBc91x-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#224: FILE: lib/raid/xor/arm64/xor-neon.c:9:
+extern void __xor_eor3_2(unsigned long bytes, unsigned long * __restrict p1,

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#225: FILE: lib/raid/xor/arm64/xor-neon.c:10:
+		const unsigned long * __restrict p2);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
