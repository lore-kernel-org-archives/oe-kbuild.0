Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE64F37A85B
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Aug 2026 04:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788148943; cv=none; b=WYImDyKTAiBRtHTZcpfnWInMbzJjDFb58t92kB4Hz1TvOvI0+D2iD+D18K36BEISKzBNuMOaFZV0y8HE8a1d3GNbvFk5nqnWvc+gQaB+H8+mBIX2MV+1nBf4Z44NUVWhbLNG8rGFWQEZMcBi94/FAE9J84h/f/SRiSoabNFbp8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788148943; c=relaxed/simple;
	bh=eaFdWsgGB89TWIhrW8X2dsaVijcFw2anMvj4e4lVjPg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jptgs2YqKj2F6pJkt40wjHjy6C9SF9A04tQ07gxyA0T/cVdO4xd2B4XZabgfj7o2YXE2eS2V8aIA2bFJ5qiNJwESp5RZhIkMjdwVlz4YgkPsJGZzSmc+bidllUjiu8+5FHOyGaYGGDc4Kx8agnWGHEtSc4ymMLbQKFnHEYS/MnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iC/3tNPg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iC/3tNPg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788148940; x=1819684940;
  h=date:from:to:cc:subject:message-id;
  bh=eaFdWsgGB89TWIhrW8X2dsaVijcFw2anMvj4e4lVjPg=;
  b=iC/3tNPgEaw04aEVmjsPTKCMoDr5msWGBCwAJRcHz3BOW3FvfS7FUu9d
   pkLs4jI8qSTB8zPUhiCuPHPy2KAZlzkNm25Omg4+XxzBPadiUWKw0dl0r
   Y4QFUXUE7ogsyJoXOQ2DqK59eHqY8ngppPP3bFJB4QV9C646VZxwF5bCA
   Bdhj6yuoPPRcy5b3I45QAawWoJT9jfdafO+5IRUsj+IoCWm2cSH6aVvP8
   +YCfZwvIXRtD4mpN989gzNy4yMXaLvZZ0E7s8WIsY/pdUcaSmWaUbxBP9
   hgLarDO1qENCJ8aRI6yrMDf+azdBV21rZpJmogIhz5XtkQou2OVNMrAcE
   w==;
X-CSE-ConnectionGUID: IrVQSficTCK27XG3o5tpFw==
X-CSE-MsgGUID: eR4C/IfAQZypuwbVqLQTPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88597863"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88597863"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 21:02:20 -0700
X-CSE-ConnectionGUID: nJRQ1oEdRc6pF7Xj725fBQ==
X-CSE-MsgGUID: cuRrDayaRgi2A59FY2Pcjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="292180742"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2026 21:02:18 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0tDr-000000000OJ-45wn;
	Mon, 31 Aug 2026 04:02:15 +0000
Date: Mon, 31 Aug 2026 06:01:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-ci:arm64-fp-stress-kvm 10/12]
 /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld:
 warning: tools/testing/selftests/arm64/fp/fpsimd-test-kvm.elf has a LOAD
 segment with RWX permissions
Message-ID: <202608310555.yW6avx5M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-fp-stress-kvm
head:   4147d473423a61d2b7200f25178383f695d7e651
commit: c7d72e02619624b22f53cb5d20cdb30334ac14f6 [10/12] kselftest/arm64: Build KVM guest versions of the fp-stress loads
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260831/202608310555.yW6avx5M-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608310555.yW6avx5M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608310555.yW6avx5M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: warning: tools/testing/selftests/arm64/fp/fpsimd-test-kvm.elf has a LOAD segment with RWX permissions
>> /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: warning: .note.gnu.build-id section discarded, --build-id ignored
--
>> /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: warning: tools/testing/selftests/arm64/fp/sve-test-kvm.elf has a LOAD segment with RWX permissions
>> /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: warning: .note.gnu.build-id section discarded, --build-id ignored
--
>> /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: warning: tools/testing/selftests/arm64/fp/ssve-test-kvm.elf has a LOAD segment with RWX permissions
>> /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: warning: .note.gnu.build-id section discarded, --build-id ignored
--
>> /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: warning: tools/testing/selftests/arm64/fp/za-test-kvm.elf has a LOAD segment with RWX permissions
>> /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: warning: .note.gnu.build-id section discarded, --build-id ignored
--
>> /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: warning: tools/testing/selftests/arm64/fp/zt-test-kvm.elf has a LOAD segment with RWX permissions
>> /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: warning: .note.gnu.build-id section discarded, --build-id ignored

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
