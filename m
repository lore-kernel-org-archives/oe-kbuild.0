Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6579C2DEA86
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 16:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767631962; cv=none; b=VERxjk4qwcksfPtkKrOAT0gp5Kzs71nLMiLomEBV1O4KsxQRAUK8ngaYPbo5S1dAXgc8E6W1a0pp49pCkwq3ikpGcrtFRrDA1z8MWBYk91Hb+NJDG5DMwhj0JIGGOAlvxrQKz19HAi/z6X0jKoZNs2jBa+/yhuaWUB73U31x0AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767631962; c=relaxed/simple;
	bh=B4BA90IoanGJkfzmK8s7IJKe3h7acGgFAfanrD3XqM4=;
	h=Date:From:To:Subject:Message-ID; b=MJmzUonT1n4r2d1OEs7ulVWDi0ZfLmA/6n2iXZI5l9iCTbGnidJXcGVU6nB9gdqR+tgPuMQbhk+aSbDEskn4K4y08s4d2m8NNPieZIwCQQy/5fVNexQ4+JTr3VHGtlYFEJ9rQPEzRrYRNRLiZyI5lqZN9HeSqDBTMeXdPHWG3js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHO6YW1P; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHO6YW1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767631960; x=1799167960;
  h=date:from:to:subject:message-id;
  bh=B4BA90IoanGJkfzmK8s7IJKe3h7acGgFAfanrD3XqM4=;
  b=GHO6YW1PFcRfE8v6XVlJp1qJfLjtiDSMu51lqBpZ7ve6HltIqpciJmsf
   RP39y5FqHa+ugB5ho55EL3mYzUhSXk2OYoBzpeUavpFt8nC7aUT7csVJa
   uG1G//aEZf29F+y+J/YtI7Q+461m634bw8M3FrWVQB2MWft7wv00NWXTA
   4YHWfJoi7xnbQDo9HVdFgrOuFvjJe4lUwhZIVwHGGs7q5G6pXGrntssbV
   aEmVCidJgtAxSbgYvDzYyRtLYUxVvSxAmwh2q0Aq7srQlP9xqVPWgRcl2
   Q7/z6Y2hIOinJytc+snvdKIZV/+1w6UYP9O6in8AjIh7Z6af7u0ILmIB6
   w==;
X-CSE-ConnectionGUID: Jjme1yy7QpG4xl4qVzKDPg==
X-CSE-MsgGUID: W9PxWn71QsG8PtvNb/VF/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="72843755"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="72843755"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 08:52:40 -0800
X-CSE-ConnectionGUID: O3BXv0tFSyitCaBh13wzmA==
X-CSE-MsgGUID: ZyAB8kUrRKueA8aAPG1dRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="239917365"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 05 Jan 2026 08:52:39 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcnoq-000000001AH-3hhD
	for oe-kbuild@lists.linux.dev;
	Mon, 05 Jan 2026 16:52:36 +0000
Date: Mon, 05 Jan 2026 17:51:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 7/8] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202601051721.KqWfaXUB-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   7b32eec2a40ecddafbcbd35bda3ccd1c54477b05
commit: 233123c032bd07532c0cfb945eb36a59ea05cc63 [7/8] pkcs7, x509: Add RSASSA-PSS support
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260105/202601051721.KqWfaXUB-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#407: FILE: crypto/asymmetric_keys/rsassa_parser.c:76:
+ * Parse trailerField.  We only accept trailerFieldBC.
+*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
