Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311722C236B
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Dec 2025 22:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765407038; cv=none; b=Kl3Ei8g4pCgHhsuRSRlLNxL3D/YWRK799TXlVnNHWwP61hcZ9p++x0BtrImyRlXsIxBP7v3AQcXY72m0oRuKr1aFT5kXpfCmGGTys5pGVMJhhWyd6e6WwZ9lvtTm0YSvfQldbaKm4aBLCPnBoXqPMmDOWfv7b7gGoXFY5OQCIHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765407038; c=relaxed/simple;
	bh=dGKu37/yEpvCkC8WTNi0EnjJpWaBGM+5VQBb2KgNCt8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k4m5BCSCJD06yVkfgg5sUFg23Sq0FCUoJyLfT+u9fQPFnumhJd7RA1IaXnGeEpm6fq6NGxza6XrFNITDrR4gqV7OWNndGbTD6X+Wsa85u8rY/ns+QCclWnJb+434pYMZRxE6AJPixAjH6CMaBZqoEv4Ig39aM6mGb0MAXQ4JBpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORp1O24K; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORp1O24K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765407037; x=1796943037;
  h=date:from:to:subject:message-id:mime-version;
  bh=dGKu37/yEpvCkC8WTNi0EnjJpWaBGM+5VQBb2KgNCt8=;
  b=ORp1O24KVOjY149XetE4i8W0jafejSqLzGFG3J9fqPVS16Z3tJtf4NAa
   q0PA6/O6/+25ii1JP+y5KoYXkx3/kUVSZJyRLuEOiXSuldxwsivkatCRM
   TitpwT9QRCYNWiHt4lq02fOnmTsTGb4+2fqp43v2upYNftiN7RX6lyyWC
   RZH03SCfD710WRLrOzpKe1sbbo/rgHE45eXGerBqOhF9vqfvp0J5BbzEO
   45ZcDdBtsG5D1STV3ov+1KFttfgOz5NJLmslLkhmOkM3X0iKcFt68nUgn
   vBXlRWFY9c0+gBZG93FQDQKMf7FZb4gQuNpYsGgKO/4unzlulxto3ZLTi
   Q==;
X-CSE-ConnectionGUID: jVuTvxcpQmKWH43kA96puw==
X-CSE-MsgGUID: EoXdV1BXTJyeoxCSqdoLIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78749832"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78749832"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 14:50:36 -0800
X-CSE-ConnectionGUID: 9Fr02Qr7TsutT0iHrx3GWg==
X-CSE-MsgGUID: WzrnJo8lSVydVe/kYPyvSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="200797887"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 10 Dec 2025 14:50:33 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTT0w-000000000nw-2Uq2
	for oe-kbuild@lists.linux.dev;
	Wed, 10 Dec 2025 22:50:30 +0000
Date: Wed, 10 Dec 2025 23:50:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 5/5] checkpatch: WARNING:BLOCK_COMMENT_STYLE:
 Block comments should align the * on each line
Message-ID: <202512102338.D87rtR9a-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   36c9b1b46c63798cb54fac7ece3c85a1a02e0dc2
commit: 36c9b1b46c63798cb54fac7ece3c85a1a02e0dc2 [5/5] Add RSASSA-PSS support (RFC8017)
:::::: branch date: 78 minutes ago
:::::: commit date: 78 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251210/202512102338.D87rtR9a-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#485: FILE: crypto/asymmetric_keys/rsassa_parser.c:76:
+ * Parse trailerField.  We only accept trailerFieldBC.
+*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
