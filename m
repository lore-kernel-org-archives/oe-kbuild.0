Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015CF12E1E9
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 23:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766446110; cv=none; b=Q6J8MF+BVhiWmE3SHrz2VcWNwVbvHX2REZs5YrX8SZyvM6cp7dgyFgcDpJHiKvlzzCsg8nwdHyeREqn4nsgS0EdYNN/CYLav5fElhZnaRBstMeukvLKyDkkLPM74xPlWQZ6jOhxZ+Hqa+2s2HvMvasX0cw2RZA4xC9Yt1CL4qCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766446110; c=relaxed/simple;
	bh=bsKUYZPomf8QhHduHBB2oyrfc9VNXBAEmXZgBP18rxg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qa2gWSynkfGCE2sPnj0Iu5aOo4abLqWly/WN2uyt4voF4HMoDdu+AWNNpYFhPpOkUOd1k1topjw2ibnJ7MselIIwKlysIH8pIz7dlZSiCsJ73WJs9wisk6f/I1PxUrewYmqH/bHfWe1BMk9mqcZTMU0OnNPnslarC/zTs75O75U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lELFvr8K; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lELFvr8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766446109; x=1797982109;
  h=date:from:to:subject:message-id:mime-version;
  bh=bsKUYZPomf8QhHduHBB2oyrfc9VNXBAEmXZgBP18rxg=;
  b=lELFvr8KGCfObFIMRtmdzp6GHLojNAADHLGpCHNMwJcge7Y8dQgKs5vH
   x9EAEAPmVu7Bcnb+sPBEENgLmhprhPq8uVr+FbMSxVhdARgc1TJzulhdk
   IoMDLvHBSSrF5dK3nxGVYfRGkEj4GQgatiBCuBmyARttF8QTzPlBMlgpq
   kbqlh6kNnGo9Pb+IlfJORv6EzT3EWR+voh57g/OqFsHbMHGWxGTh6ArEH
   a9NkkqVDVcXfxIWZ/UdSOsF4Ue5Oy59X6PWnAFtiwMirWq1geqt7brXye
   r2QGIEUwUG5dQtCEzqw1cq9ya6mM8iETMmqQxCD9XNLm41q5Qch9Da4qy
   g==;
X-CSE-ConnectionGUID: wanlzU9BTvmrGGz7t8FNJw==
X-CSE-MsgGUID: Puq3bnS3RyWyUlged9GeWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="55872412"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="55872412"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 15:28:28 -0800
X-CSE-ConnectionGUID: 5Vu47e+bSrO0FZJGvCm2jQ==
X-CSE-MsgGUID: mYdX57UlS2yvT+A4yljICg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199668046"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2025 15:28:27 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXpKD-000000005es-0q94
	for oe-kbuild@lists.linux.dev;
	Mon, 22 Dec 2025 23:28:25 +0000
Date: Tue, 23 Dec 2025 00:28:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 25/29] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202512230057.4eAkNMzA-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   221e7699aa4436774b2c017aef9893710821218b
commit: 3c521b23e9879374d37af70c369f6b01a9d638af [25/29] bcachefs: Plumb zstd error codes to bch_err
:::::: branch date: 68 minutes ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251223/202512230057.4eAkNMzA-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#26: FILE: fs/bcachefs/errcode.c:92:
+	switch (err) {
[...]
+		default:		return BCH_ERR_ZSTD_error_unknown;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
