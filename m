Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4D4165F01
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 20:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734811302; cv=none; b=fBNB5ChsBgNKOnQ3aH/2Q8O86EH1gERUBq6fnMPKC2GRKujWH+rKGc4MK7tTosMct8OFyMojH9wytnmtNG1ZTFUlHKmdKb3vfVkqAbCr+SBpm2UEFLUJ3TuRYpBeag2/Sbw7+22kcw7o/5W5a/ybEP1NsIy54orIjl54UlbmWCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734811302; c=relaxed/simple;
	bh=5ETl1mwaGWh1LJQOJH5mMmpWfORVGHH8KAaDLuvJwZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dke7PzD6mS9k7BMsIIpHd3rPNGaLh3kzjQ+fBWR5CWxdumQ83h0Hr2t1j7+edQ6cluPm4k/juyWk9lMGV7q/vuKNRhsEOqJTjc1tjaaqnt9tZo5stsxOF5sK2Wj1BiBJOVmc+79mqqRxYXG/n0kseq9QSSWDgW3yXZvcbuMl8N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGcTC5cz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGcTC5cz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734811301; x=1766347301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ETl1mwaGWh1LJQOJH5mMmpWfORVGHH8KAaDLuvJwZo=;
  b=dGcTC5czDI0PEHjeRksGcDdLVTpODpaPlz0OINh8rOolHs+1i32Qet+p
   L9QO1TPyKTbjWQ7+ZTYDfPt5XqjIsjHSAKLhQ7QkTkpu3DctcwAqsfm3W
   rFV9UWVIPGUHxdsjtM64z7mwAoLj99lFq06HdJj6adnuxw3/NRpb2cdcQ
   uKyKL389/FcwDHSqhZCFktglV1NnL27iA8jt/Ivf9gnlBO86ehZLFHnpQ
   UCs9xAfzgSUaMqiaDOcSqLzFl2Zer33LU3oE9AZhvrqyT7Mde+y9MAYag
   M91SmuJ3eC9mF28dB8LqBqlsbpnNfgmByynR7t7eij9w7sJA4sK9YyCqe
   A==;
X-CSE-ConnectionGUID: ozwHl6oSQlCGQ2v/Hp67RQ==
X-CSE-MsgGUID: DreZvW00QMaklv0x0WmyBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="39270376"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="39270376"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 12:01:40 -0800
X-CSE-ConnectionGUID: J8GtVi/ES9OtQ/QuLIuuLg==
X-CSE-MsgGUID: 3HsQLDlXSGmaQwT0qD9Q5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102932083"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2024 12:01:39 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP5fN-0002Rr-0z;
	Sat, 21 Dec 2024 20:01:37 +0000
Date: Sun, 22 Dec 2024 04:01:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [atishp04:perf_test_weilin_rebased 8/24]
 Documentation/devicetree/bindings/riscv/extensions.yaml: ignoring, error
 parsing file
Message-ID: <202412220430.K4tFjOTt-lkp@intel.com>
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
CC: Atish Patra <Atish.Patra@wdc.com>
TO: Atish Patra <atishp@rivosinc.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/atishp04/linux perf_test_weilin_rebased
head:   8c07a2e042b3578314c0f64e65491e4db27a5c4d
commit: 949dd8eff8f81b234727b80a38c0912b7d11277f [8/24] dt-bindings: riscv: add Sxcsrind ISA extension description
:::::: branch date: 23 hours ago
:::::: commit date: 24 hours ago
config: csky-randconfig-052-20241222 (https://download.01.org/0day-ci/archive/20241222/202412220430.K4tFjOTt-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220430.K4tFjOTt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412220430.K4tFjOTt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/riscv/extensions.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
