Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74192264BB
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 19:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764184825; cv=none; b=oWvovc6oj3/INeilq2w13WTciVPRQAmKhmnoYqQPER/pN4DOnT/uNyt7Sw5RLfdpsB6ptxamEpww4dmzzalcwEAf8X4CL6CHF9vlF5Km2Du37pnJr7MGgETwAl3efZsoHrqXWEcnIa4dYD04cUrsGMCsk3aPzBo6U+xYEqD+Z/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764184825; c=relaxed/simple;
	bh=29Ri9pMRkwHVKqCtrYiHV9LGKtEEU5egpbogBIM/uAE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YbRFi71sqmPe5UMQv6G6f7prFCeOJ1uudYgDGPgdMmv6R5G4UO8A+Q78tG28ybn5r/sHDd6EXcV3AriaC+kToe7weCXWXYN0O04zXnVBo4pY0p/N0WlL8EqXSTOMHRcJjYTX9z3ZZouUqMqGkI3f/N7HlHgOrqpFF+YoQJEGWww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKFq+NWL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKFq+NWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764184824; x=1795720824;
  h=date:from:to:subject:message-id:mime-version;
  bh=29Ri9pMRkwHVKqCtrYiHV9LGKtEEU5egpbogBIM/uAE=;
  b=ZKFq+NWLKTPkyA6xRexNhfdPHPgXz/19NHPmpJD1DN1ce1N86/p1AzwE
   z596tSmRK4bevMnsEXjTgYHT3iwv3PxmRmcbgfET6OKsRQ5Buwm5+tMOj
   7L4/rsh4jdMOmXa0xw1i22m+nSmnJ7dvvV+8WATYmNkLbg51IQDiyliwr
   sjneGS1SlNcGIE4oug7xzFbNqPZscNWMXr4zv60jEsZXQJVWwVJ5/ddNm
   fLLja1TYao414K8uQFUtxh0UT4X39Bo+5QouRIuRQxW1TSbSG2MKvlw06
   sZIaKhAylR24bZx9tM63B9s69yZjS00DevrwhEj6Eq5oK+2gpi6wjOLSj
   A==;
X-CSE-ConnectionGUID: wrFD6AjrRV6MuBCI5F2TUw==
X-CSE-MsgGUID: cskyfy5+Tr6/1PhPZOqIgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="88876846"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="88876846"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 11:20:23 -0800
X-CSE-ConnectionGUID: axVTrPbbS/Sp16cZfUJDDg==
X-CSE-MsgGUID: 9H441BpYTki9Zv2FG7aGeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193478650"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 26 Nov 2025 11:20:23 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOL3s-000000001KP-0aes
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 19:20:20 +0000
Date: Wed, 26 Nov 2025 20:20:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 237/999] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202511262045.eFuSqSKs-lkp@intel.com>
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

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   e336760f1aaba6ace6f898616fd9234c99fd82fd
commit: a45b2e247f505c26e3e211b1c7d72d444c8540ee [237/999] bcachefs: rebalance: Batch reads from rebalance_work btree
:::::: branch date: 4 hours ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262045.eFuSqSKs-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#39: FILE: fs/bcachefs/rebalance.c:307:
+		BUG_ON(!buf->size);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
