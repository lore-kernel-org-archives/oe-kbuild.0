Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AEC23D290
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Feb 2026 05:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770267859; cv=none; b=j42AVXVng9w4t/NQebD/sLNe1R63h9fLnA2TPokeNOFBWXgqBPAbdt735YtFJi0uMoxXlORBz/jouJHXlsbNYMyTiPhieHncZard8kfox1RNC0HNMqokLbScoIoos/3VvX5L1tORNcMSkBPxGwmK1W1M+2DTsSMNx+i80mlTzFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770267859; c=relaxed/simple;
	bh=V8GAn+iJzzp3C9RJn7tj9qZDgu/d6qVtPvxsYFjQJdw=;
	h=Date:From:To:Subject:Message-ID; b=Br0pcbYfA2ZngDzbLw0KNQOI5V1HsihGtmQ7kzq6jeowdcdOHdtSDg6U+S1a3GNIii9Ny5nfM4wh3shssDlFE0pjRmGgQcmv885wrwNZnTApPhJ3eGat+bqwDdFp2A+qrnqBeHIE0LEfhl08bn/vKujsH0WynM+Cc1IqGCvb/b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=feApWZuq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="feApWZuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770267859; x=1801803859;
  h=date:from:to:subject:message-id;
  bh=V8GAn+iJzzp3C9RJn7tj9qZDgu/d6qVtPvxsYFjQJdw=;
  b=feApWZuqNyN1EygzVlsxI5OofUVVo0EpKEypOKz8gak77srLULvmMHro
   lywo3LXraxnDQKp6W2hMP5K4zEf1fvw27ByoVNj35SWm1CKsP23AZSnhZ
   /zaA2gpUoUJ/GzBdpvbYKRtP2HDJc7n4QsbKrkjqNFp0Q2Z6ex3GpZhEY
   k9vYAZn2uKiL7xMpTFtsWH4x8kOJ9U7jd2eMZr+Yw8FBztIu+lfZXPRMS
   CZzNAgxhMb3i0+wmvigpkbR6sSiPfZVw78DTGy9LmPBb6tATUYLP91gSr
   ZMPscc+/Jm2uC9lvMef16y/bEo12UCzffW8XSKFZS7mM56QaMpW94Boj4
   w==;
X-CSE-ConnectionGUID: Up0W2zHhT46PU02eLGVTJw==
X-CSE-MsgGUID: vOspS2/VROGB7wmwdJr0nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71358045"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="71358045"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 21:04:18 -0800
X-CSE-ConnectionGUID: KtRUQUFYQmW7IDp9FLopeA==
X-CSE-MsgGUID: SdI7HMICTQGMdVO34wSd1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="209888212"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 04 Feb 2026 21:04:17 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnrXL-00000000409-1ff3
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Feb 2026 05:04:15 +0000
Date: Thu, 05 Feb 2026 06:03:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [xilinx-xlnx:master 200/590] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202602050655.a6Eh5fGP-lkp@intel.com>
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
TO: Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: c7e765af180c4f47bd297f18c15032cf12bc7b70 [200/590] AsoC: xlnx: add platform driver to support SDI audio
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20260205/202602050655.a6Eh5fGP-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#73: FILE: sound/soc/xilinx/Kconfig:5:
+	tristate "Audio support for the the Xilinx SDI"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
