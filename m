Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA23B665
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 03:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766461595; cv=none; b=OR0OJP50l9vq0YMJoq9h+LCnLkJShxaSHn7wRxSrLCnPZiPTCRdf8LpxAs5Lpkwg29Fx2Aea/T6R+dqZs4CKZHbF1EbytUFr8vIyRjja2I6tdqkhgEvYGlhP0PTXVrSBnIM9MTuir3jvWP7y0oFrK8LNVJZS3LeM0xh1sNrBzc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766461595; c=relaxed/simple;
	bh=NtQ1ec5XADQjv6vSLeOyQFTT4p8R3fnX8aitC9D8wQI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n8+DWbzFj1wlSLMa/o6kINEVVJmp5NtHend0YEg7yfpfviX8CpkIovb6Vysk7ZPbdB88RQjHr7oQmO4JjtfVbQmTJGDMcFuEITnXKGyDix9mVsFNg18ki4XwmFOGnfGPuvNno9JSGYOzPxyELk8ALK1MOo6BGIyYCsUIHQ2n7QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H78OoHgI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H78OoHgI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766461594; x=1797997594;
  h=date:from:to:subject:message-id:mime-version;
  bh=NtQ1ec5XADQjv6vSLeOyQFTT4p8R3fnX8aitC9D8wQI=;
  b=H78OoHgIcYjw1tv/xhvgpFAlwl54916KxH4HVTSOs8biJQSbtNChJNWp
   +MtUXPNVOnFiwRGKO5x2oCzF9gSqkYxeU+yTn1LgDhQz6Xs/AfCIYKwvg
   r/zClQ/PYIY4cbUwuT0bcUHT2MTr+E3zSVJxTIxZXaZ19PV0CMvYfVNAA
   ZnrtVVUwW6QRz4B1uki2CF6sI4++j7lCAa6RbPsicFP5nja2ykpRTjqVI
   /6EvEiP28YJXVMLVrwM1xJp4cFkdZzQFAyAWNEoUUqYQb/75TZHpggV4+
   tHX7a+e996+7bLZzSBNxhu3bunRSd0Fqu6RsMqt6tspYiKX+EAum4IRsF
   g==;
X-CSE-ConnectionGUID: z1IdSv3fQ3SiwR3yy6pTPg==
X-CSE-MsgGUID: 0D9UEegqRI6jokm6bG48cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="67309718"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="67309718"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 19:46:33 -0800
X-CSE-ConnectionGUID: GutydDdgSx6tpjntfzvc9g==
X-CSE-MsgGUID: /BFuoUsySpmDkrMnnI7liw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="237086883"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2025 19:46:32 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXtLy-000000005lm-0qxw
	for oe-kbuild@lists.linux.dev;
	Tue, 23 Dec 2025 03:46:30 +0000
Date: Tue, 23 Dec 2025 04:46:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Felix-Maurer/selftests-hsr-Add-ping-test-for-PRP/20251223-050252
 5/6] checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'than'
Message-ID: <202512230449.YowcS8W3-lkp@intel.com>
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
TO: Felix Maurer <fmaurer@redhat.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Felix-Maurer/selftests-hsr-Add-ping-test-for-PRP/20251223-050252
head:   96f8174381ece1941fdeb606f942f3f7c320d1b1
commit: 5011c3c3ec988b171250b2ade5f921dd1a021b34 [5/6] hsr: Implement more robust duplicate discard for PRP
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251223/202512230449.YowcS8W3-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'than'
#44: 
   added more than than the entry forget time ago. In this case, the block

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
