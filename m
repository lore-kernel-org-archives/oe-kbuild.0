Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890646;
	b=SAPcbSkHR5sQWypiwB+yTvRWNA07B+Zm2HSJL9ThUxNyxJ8pSKlNC10oWnb0HhzU0wzN
	 DeDEZQbFePnr9nRGG6aKZ6AgzIfGBb6GTX7suCJJxOKBEjEfsWSB1PpACwHCs2QsOfDAT
	 V6m2v9QmNV0JKVddATVum2Rzmap3ngMlqId3S2RBpoBaFJQahJwEQbcKVgCF5TSEHo60C
	 ZEVk3bX+4pW//TsD7AKf0hGAnS52nMyM7Ryy2ajEw1vrwb0axU0YjTaumqcuh9/0iKwZD
	 2tydgyXgPpGd6oFdvRlmkiKGJwi7r2bibBtxdUmR1eO+lH0yLXSg9MrvEhKWfTv328Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890646;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=ANUaEFWt4itHHO/bayGxa8sBBSpNgHBNGXM7L/aNz/0=;
	b=iuNME0xOFlSKhA63knzzI/+fxNZiinSgvwktdpE3AXzAdSH8S6AWINTx9ec/qJS8eYFu
	 Rpm9GYU2BOd0OeOSbQHxOZZUjJyy6z28TXjVhygoLCyh3DBYKAhiEbGD592HlLr2uNL9V
	 w+W9a2UD/DsJe5u+Aq/jr6rKhKvbMbOLPDeI5xrQ/5Y5gTbLgfI1e+2t+usonDWgjrmEL
	 zJ82pSP0+bfwbjXj5TzE3R4fLm2e/pUe28jmNSqUF0pncsIhlSV+zPYrGVOjU6SynB2dH
	 bQxgjC5jS46tPA4sGSYIT1Y/nVqiP1K+FvvrMMH6u61Be7h9lZ8CYdqqE5bMVS4a3BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EqWTIW8L;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D89D606A331
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Nov 2026 14:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D89D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EqWTIW8L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793890646; x=1825426646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HXA1h9U38rMB8ZJGqeiAnueoXArFr6RI2KdngSq3idA=;
  b=EqWTIW8LC6QCJ03IulW0hu1sLfdv6BRhw80WoziKpmFYjhlMjdXpuYj6
   wzt0LbffWSHXptBXUZuAxnELP6wB3LDkJSeRPlbUK/ITAoM3wEmQY5nGp
   uk1c33BqjOxRKPjeZj/YBnSkPXLfyGUwoEXkXEHz6fFFW+evaxnO2PwFQ
   qq3FeGuFfqM5NpXIpa8bLUc786DKJKrGc+o2VE1y1p1HHqbPhlR0kuLGx
   i/wRFLDxBbasB4Wp4ZSP1NVXNdrzaBJqiE9YQurK02TIdKq6qd/Ti9pNG
   tw3DgyCqKdhQ9XYdFjWLLI8WtsRfQX1JW+L/T/GV3RC9g4HUkAoAg4tce
   Q==;
X-CSE-ConnectionGUID: iplpEJdJS1eF12/mTqZxAg==
X-CSE-MsgGUID: FrkdwIg7QteyXi1qZBl+SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2551900"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2551900"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:57:24 -0800
X-CSE-ConnectionGUID: E9LVMYCSS0yDKWUYsvGZEg==
X-CSE-MsgGUID: Q6L77bxqQgG4moRXXxnWRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7152481"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2026 06:57:23 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOytx-000000009fp-39oE;
	Thu, 05 Nov 2026 14:57:17 +0000
Date: Thu, 05 Nov 2026 15:56:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [snitzer:kernel-7.3/jflynn-io500-canary 509/1462]
 =?us-ascii?Q?NFSD=5FTCP=5FWRITE=5FZEROCOPY/xeu-SGL-compat-receive-placem?=
 =?us-ascii?Q?ent/0001-xeu-add-rx=5Fip=5Falign-to-4-byte-align-received-IP?=
 =?us-ascii?Q?-head.patch:?= warning: ignored by one of the .gitignore
 files
Message-ID: <202611051548.sNKHEVmg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mike Snitzer <snitzer@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/jflynn-io500-canary
head:   a0f5f04a3920835767e24c944e54a676d5aa32b8
commit: 11942637765495dc70fd54140d8b9fed07e305c9 [509/1462] NFSD_TCP_WRITE_ZEROCOPY: start the xeu SGL-compatible receive placement sub-project
:::::: branch date: 15 hours ago
:::::: commit date: 19 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261105/202611051548.sNKHEVmg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051548.sNKHEVmg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611051548.sNKHEVmg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> NFSD_TCP_WRITE_ZEROCOPY/xeu-SGL-compat-receive-placement/0001-xeu-add-rx_ip_align-to-4-byte-align-received-IP-head.patch: warning: ignored by one of the .gitignore files
   redhat/tools-tracing-rtla-fix-el8-compiler-errors.patch: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
