Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C90037D111
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Feb 2026 12:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771936425; cv=none; b=hV0cHX8Z88sW0xX0fh5v4JiIc8XVvrzuZyadM+fUcxQYG3QdD9HfSQQYwfHnzXX+uU+W6EEieRPZB4sDtVAPhhcad5kLWdEpZdqjsdP2H/xrAy1ssgIVMntg+cQHUImCFO18JRIvymNdvwoigQatXc1Gk7HrfpjcCWmO/qSsCW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771936425; c=relaxed/simple;
	bh=wSqqzfFXSD/QbKQLxw8R9GAK0d90yTJlkuagew1YxxE=;
	h=Date:From:To:Subject:Message-ID; b=aF4fuHK0i5ivswIn7L/b3WSz9xZ9EyEd3EruoN26jl9a+PFIMnd4a4nJ9DxTJH/IvsRTJiUCiNI/s0wL1GwC8fJfREJUAN30d51XKbtnyC3l5wvyRLumJzYtVOFCHDt6S/OPDlmxbMY18HkRyxgRy/ffFkmPFGzzo0kh+yVuvY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VDeuq4mj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDeuq4mj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771936424; x=1803472424;
  h=date:from:to:subject:message-id;
  bh=wSqqzfFXSD/QbKQLxw8R9GAK0d90yTJlkuagew1YxxE=;
  b=VDeuq4mjzU3lGsBr3E1d+o+mUkQ8xRrq1V/kxQOWis9XtH5WEc9AJZ/R
   QH3BJ0fJqH88Amb+IknIEXVWJglUZJFzpy0mljB7Wqyaf9fYIl72qUGV9
   A6o+tOoYPUbGyLn9swh2tsUYPxa7WdUzDQi69MxeMjBDqVduEfdpiHCCA
   fnb/AZgLFmcgQtXZNT07fPUU9lcONZDT7n6mIFYSPeKm+m4RV9HWIBuJK
   FN+H2cY7sGg7kJBffTlAqdFm2oQr19acWHXKiyBZZyvNsNPHyJvrRuJmR
   gpW/OuRmdMPCWruHmSxZXv0kmPc9VDqDsjaBBvnOMm2wcB8PkPsMWHMs8
   Q==;
X-CSE-ConnectionGUID: u7IBLTVNThiF/G4YPSESrQ==
X-CSE-MsgGUID: gxLDM8EbTr+PYHw6cwxqdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72651487"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72651487"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:33:44 -0800
X-CSE-ConnectionGUID: w17bGpnbS9SFkCoE94K3Wg==
X-CSE-MsgGUID: 35IrFOnHQ5eiilPll4WSOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="220406968"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 24 Feb 2026 04:33:43 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vurbh-000000005Hf-0fzP
	for oe-kbuild@lists.linux.dev;
	Tue, 24 Feb 2026 12:33:41 +0000
Date: Tue, 24 Feb 2026 13:33:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arnd-playground:randconfig-7.1-next 687/733] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202602241351.w6Ylz9P0-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.1-next
head:   76f9bd9e344ecd3faf7bdadedc7027b64a6f2d63
commit: a5b98034da605fb6b142d657920c3bedf8f98d2f [687/733] initial uapi check success with -Wpadded on arm32
:::::: branch date: 3 hours ago
:::::: commit date: 8 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260224/202602241351.w6Ylz9P0-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#3469: FILE: include/uapi/linux/coda.h:122:
+typedef void * caddr_t;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#3673: FILE: include/uapi/linux/comedi.h:646:
+} __uapi_arch_align;;

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5359: FILE: include/uapi/linux/mptcp.h:139:
+	__u16 :16;				 /* sizeof(mptcp_full_info) needs to be padded to
+						 * 64 bits, but the mptcp_info member on m68k is

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#6240: FILE: include/uapi/linux/netfilter_ipv6/ip6_tables.h:265:
+} __uapi_arch_align;;

WARNING:SPACING: space prohibited before semicolon
#6964: FILE: include/uapi/linux/rkisp1-config.h:932:
+} ;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
