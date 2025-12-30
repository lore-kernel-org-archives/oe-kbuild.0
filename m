Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B941D2749CF
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Dec 2025 20:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767127040; cv=none; b=hY88WTN1wkMiJTDp3SYTa00aaUeVTFsR4voRrl+T8gCrOXMyFw1sQw6tDasQeOwkCTddijwL36AgjQ7pPJFBcwIdAVCyPA7XVMuLIuUH1t1A1I5F2/XTOKIKr14BeGy5mKQjD/svNyfFaZtBjoHyo0kwPueRpTx0lYank5YPY6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767127040; c=relaxed/simple;
	bh=kqBDyfYx07MnKY+fFItJSMEt4W1VC7sMrcnWuWsEGSU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MHIWJIqYC8vZeIXs0eo5CPgp91WByJ+pIv29Oqrb/nY8XW7H8MzZSFUDL1wbwhXSeh99dKVRXe5PCZhjCwstr8OOFIuNBm3GExzEbkrx1bA12CVr8c4802a1otq0wAHUuTDNQUk9jk9A2HcFW/mHTBbP3cucmSYoXQWesxRgjq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQphlQmw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQphlQmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767127039; x=1798663039;
  h=date:from:to:subject:message-id:mime-version;
  bh=kqBDyfYx07MnKY+fFItJSMEt4W1VC7sMrcnWuWsEGSU=;
  b=mQphlQmwerSTzvFrQlXQ5IOCFwFvmh5BDIeBDbpqytgxLIzrHQB4mphH
   i/sVlVgeTBBRvEwFfLFBQz/ym0guOOBmvIlyd/9xncRixW2tglKMMZHCf
   TCRdHcmoo7dQqX+kGS9nY8fRyrloTV9P/rgyWPlc66TEmlNi2aqrwutsT
   oAs6Cn9H35fwM/euVv/kHLngnd+YeI6Ai2RyQvY3qcARDFxyVS2LJaZq/
   EG7w/BXOVA29JBIoXwFyETbXVohxO4BXX8G6+/s08EnBqRCnF0Mnayaw9
   r0NEix7xbwhYEdkHxFDtQs1HN5/PnnT/27RaA22TxJq8agccFmbCZ0b12
   g==;
X-CSE-ConnectionGUID: SnFYGWgDSgyhjaoJOVFamg==
X-CSE-MsgGUID: J5s0ANboQreri5sDuzl+tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="80089122"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="80089122"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 12:37:18 -0800
X-CSE-ConnectionGUID: G5fm5tblRUqWpMZTTsCeRQ==
X-CSE-MsgGUID: tZVNn4HzRv2VAxVMB9jD9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="205810246"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 30 Dec 2025 12:37:17 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vagSw-0000000081U-3jzz
	for oe-kbuild@lists.linux.dev;
	Tue, 30 Dec 2025 20:37:14 +0000
Date: Tue, 30 Dec 2025 21:36:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCHv6 bpf-next 1/9] ftrace,bpf: Remove FTRACE_OPS_FL_JMP
 ftrace_ops flag
Message-ID: <202512302154.FH3UwBYy-lkp@intel.com>
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
In-Reply-To: <20251230145010.103439-2-jolsa@kernel.org>
References: <20251230145010.103439-2-jolsa@kernel.org>
TO: Jiri Olsa <jolsa@kernel.org>

Hi Jiri,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/ftrace-bpf-Remove-FTRACE_OPS_FL_JMP-ftrace_ops-flag/20251230-230824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251230145010.103439-2-jolsa%40kernel.org
patch subject: [PATCHv6 bpf-next 1/9] ftrace,bpf: Remove FTRACE_OPS_FL_JMP ftrace_ops flag
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251230/202512302154.FH3UwBYy-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'be'
#12: 
so all could be be attached via just call or jmp.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
