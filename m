Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1321F4611
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 19:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769887580; cv=none; b=gaHKbdpM7aokDLxzufPnypEpWD4cWSlaHdrj9+X7UB8pd766KUEmI6A7dz3hNqTXQDsGGjcRTb0GT4MikVCRiu1b9KP8Y0LrkEWIJ7W5+4l4eXOWuqgufN4jNL6mPhS5dRySnNQi4DAfGVTx9q09CJWXS0gw8r3P/VoO5vMXODs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769887580; c=relaxed/simple;
	bh=+fr73tEds3jHZpRjXkjew2GOpdeyydqvkfV+vjueFMw=;
	h=Date:From:To:Subject:Message-ID; b=joz6Xa4WC4Ti0TtcF8L99zyfA/z3b3VhIMTYL3SXPNZamqnepVtzZWNBm3/o3YquWBsYiK9RePxhBrevptMhRPFczabi+El1pavLIRXKWsiTHS2wGe8m4/EvrJMxUziq1dcnkI/RBCU/e1i8ATiLzMunw4vrzIxeLdZMBvGHoCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5qQ69Kp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5qQ69Kp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769887579; x=1801423579;
  h=date:from:to:subject:message-id;
  bh=+fr73tEds3jHZpRjXkjew2GOpdeyydqvkfV+vjueFMw=;
  b=V5qQ69KpGHyEC7pmqZPtYW/2Q5H9Rq0PmcCvuHglqZLJjc5ZCaFP9bo5
   q9ZSfjGrQNajPHEyLHBjhhqfn4VLNdB0ae3HB3kbMX8cO8JaZCpPVuq8y
   /zlmt0IMN51e6O6IpYOj7p5ZPCoJmHiSSSoTy0Qdjpv6mYCukSqMEcI8R
   /FMO8s3c6ruej8pHDl6nx7Xt2XMncITg/XWChH0RtGieRHy5o7GglB8kK
   qDsyt3TaUgfMoCyuDrn+hdidW8MOYuSI7MPMVmpP8+qTgQRQdkjDsajmw
   /rr0yb+jbRaNFB7HHWqNt+BwIf3B3xnlMi/I1bwcpokqYHfp3U7zCrw7i
   w==;
X-CSE-ConnectionGUID: tQplj4t1THOtFDQvTsTEwA==
X-CSE-MsgGUID: VpJTJ23CTBKtspp1BiN4WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="74730413"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="74730413"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 11:26:18 -0800
X-CSE-ConnectionGUID: dQEUiHb/SL+HezazClf0rw==
X-CSE-MsgGUID: IlZtaGsCRMK/5yWppOpQcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="208925014"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 31 Jan 2026 11:26:18 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmGbn-000000002k1-0mbF
	for oe-kbuild@lists.linux.dev;
	Sat, 31 Jan 2026 19:26:15 +0000
Date: Sat, 31 Jan 2026 20:26:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 10/21] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'that'
Message-ID: <202601312045.XnDLFVT0-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   fe8b22fe544dd4bad84a13048be0c5698bdc242d
commit: 1e01b08a1c15a4489daf2aac7e8dd8eb34193ddc [10/21] x86/kvm: Use RIP-relative addressing
:::::: branch date: 5 hours ago
:::::: commit date: 10 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601312045.XnDLFVT0-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'that'
#11: 
Note that that this function is called across CPUs, e.g. from

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
