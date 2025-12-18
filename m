Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F4623EAAE
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 18:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766083638; cv=none; b=RcKsHYIXpLBZQKvnSfDI8a+fOZ/3iVH2MvWVzNNMpHoULSfJieQ69HTBGeVuEORzrfa4LfNqnMe2JrJ3IRiTIgx2PrO5tC7/YiwUDHKz65KIenHLDxi8Xwdz/Do7anLdcwDAkuFwl3EquXcA90Ce750exj8rjf/sa5UIedHt+DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766083638; c=relaxed/simple;
	bh=/n8HKLQTItGDGAsuFthwQbSmWyb+47OIIVYXHceZ+eE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bFL98B3OGjU+UWipXKZ0YuDiJnuIAAThiqg9nRsQzGllcWNHLW/mpKlnen7IV/vF9FET4GmYnzzEZCkR732XST9uTFYvBzRSoSv/Qv+0FrqHxgBFrEeu6DoyhYOjKEfyXtPfinGsfrw2GCphkekyfOc21wo5kX71clbqxiUAsVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVtE3/zu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVtE3/zu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766083636; x=1797619636;
  h=date:from:to:subject:message-id:mime-version;
  bh=/n8HKLQTItGDGAsuFthwQbSmWyb+47OIIVYXHceZ+eE=;
  b=LVtE3/zuWJxXw2tLmxOh2Oaq0sl71bgOOB8Y5C9iwJfFXt6RtZZ8cNsW
   1/P3i644vama+rsj6LmSvVXLdn3nJDlS+XFyLUF1Stnoe6vyF8psVGVt8
   FAQuPxwQgFifnVDA3UvHmm58iknT7OQ50RmgGHJFAMRxvXUwqKVfkHaDT
   LQ7Uimj+1VD2KjqoVDIin9g1YLL5Vbsy653QZ4zas+CBse/9RU/BgbngU
   tyfIh77xvS7tGTXzaAh8wMzFd+YiAj+rUg/jxb6CIWQ8PEmP5xpzDZK1S
   L2k3GwLT4Lx3bBedIeiUpgUfLz1fsReuVDMcUbLZx71snhGIY2f06+qDv
   Q==;
X-CSE-ConnectionGUID: hRAsuFzfS0WkjBB6AOHT+A==
X-CSE-MsgGUID: jPXW7T5tTx6XigX4sGJo2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68084144"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="68084144"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 10:47:14 -0800
X-CSE-ConnectionGUID: GqdkkSoVTGGdE0wKDF3svg==
X-CSE-MsgGUID: fwVnpLhCSzeHFuDUxw86Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="229711526"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 18 Dec 2025 10:47:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWJ1r-0000000042u-29qE
	for oe-kbuild@lists.linux.dev;
	Thu, 18 Dec 2025 18:47:11 +0000
Date: Thu, 18 Dec 2025 19:47:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 1/1] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202512181936.5jqaJAUQ-lkp@intel.com>
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
head:   10bc67de516ec0622440a5ea34143be1970ee625
commit: 10bc67de516ec0622440a5ea34143be1970ee625 [1/1] bcachefs: check_reconcile_work_btree_key() uses bch2_btree_node_update_key()
:::::: branch date: 52 minutes ago
:::::: commit date: 52 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251218/202512181936.5jqaJAUQ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#37: FILE: fs/bcachefs/data/reconcile.c:2446:
+		return btree_node_update_key_get_node(trans, iter, n);;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#47: FILE: fs/bcachefs/data/reconcile.c:2458:
+		return btree_node_update_key_get_node(trans, iter, n);;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#59: FILE: fs/bcachefs/data/reconcile.c:2489:
+				return btree_node_update_key_get_node(trans, iter, n);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
