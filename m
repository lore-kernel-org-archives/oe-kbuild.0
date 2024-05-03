Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F47D1514D5
	for <oe-kbuild@lists.linux.dev>; Fri,  3 May 2024 11:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714734096; cv=none; b=tuh3SjZ6w3j3lyFq8obRe722azrP9kFKw949idVjLfVdBPFI4VB7f3DbgQy/UB4FI4yjFsQNR6QYds01KKCnOj8BQDKH/bBY57D4sw/bB27LB6VhfSIxH6B5Q8LBYowmSCn1WmHkdwkB5p7bzI0Y5ZR0KG1ojRtv9WTi9L6YYx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714734096; c=relaxed/simple;
	bh=Sk6VlfySvsJZbOQ/SAGgNtKu06zsBLRDT7ZJJmB+wI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F1Zw5UAB3hgLxPWGaYavdy/3SPeqEmkpT1rsXvLTipRDyCHA8ByEbuZCsfcgjFADrOIM7V2T4XkYP2k9MuMwEkf31cxTEGLKnegeBF0FXd5RuN1XaiNutBO7OrI82pfWjJDkqJm2BKEXXdk7Qp1k0Br5a+XWl7B+5y0EwZtauWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rd/2ud4Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rd/2ud4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714734094; x=1746270094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sk6VlfySvsJZbOQ/SAGgNtKu06zsBLRDT7ZJJmB+wI4=;
  b=Rd/2ud4Q1Yan2E1Ehs9Y+Q+yfhP3SiNQTxRL3XX6WU0ttxJIoll//fCC
   HqsXrlnGnKUPzuzsp6S02FHpd5IEO08tfjJMGPLJWLRuNaOf98OZqkJXA
   0b97/g/Mty6VOFue8IXURBIQX8h1DfsFEYyE0K+cAiVqM23cxj00j0lvg
   Fjb4xUXMaM5j6yqcvOMNhbsR+6/jwOUxQclKm6gErFwgMaFlMjkZoo2eX
   saFf0s5ru1yIDgblNUg5JQA3TKeuF4ykQIlzrVndJ5y5rPp0jwP0hOI+p
   Vjp4zHgMB20VcQO59+ED2JFIqW50kqoRxp/plqY86I00172xkcupwsncw
   g==;
X-CSE-ConnectionGUID: Iv8Kkp5hSGS+KP1ezT0O9A==
X-CSE-MsgGUID: 2mYiib0TQ2WVOeeU5GfYvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10468907"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10468907"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 04:01:31 -0700
X-CSE-ConnectionGUID: tV3pbPR5SNyb9xosMy046w==
X-CSE-MsgGUID: c+WrMcLbSCW5do9XLZ82Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="50607344"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 May 2024 04:01:29 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2qfO-000Bck-0t;
	Fri, 03 May 2024 11:01:26 +0000
Date: Fri, 3 May 2024 19:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shenki:aspeed-6.9-rebase 932/1143] dtbs_check:
 Documentation/devicetree/bindings/i3c/i3c.yaml: ignoring, error parsing file
Message-ID: <202405031829.A2FmEJ8m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/i3c/i3c.yaml: ignoring, error parsing file"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Joel Stanley <joel@jms.id.au>

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 8f301c50a89b33cf21188f09d8fb460bdf54d5cf [932/1143] dt-bindings: i3c: Add mctp-controller property
:::::: branch date: 24 hours ago
:::::: commit date: 25 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.4
reproduce: (https://download.01.org/0day-ci/archive/20240503/202405031829.A2FmEJ8m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405031829.A2FmEJ8m-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/i3c/i3c.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
