Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBABB652
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766698337; cv=none; b=DozrvDpbXaqh9ScANz3X2khhjqc0CpY9rcUgs6sXihGT2pKWg6ZLYnouQdMyyXDZrMSAV1tWL5ijlAXk+n8OUI7F+UjkuxCnUnz1uUwdnVuuhYxuWZ6hjw3z+HJEgtzaMeStzHmGOu0hRlEja0qGohMgPAUoxo13i7GGvCgfbwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766698337; c=relaxed/simple;
	bh=7qhYpN44OELsVu+eSg8DLN6NEdVIjubrmG7wMJunRU0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ik/4I47HMwsGXQktUomwpv5qJ3BzLoP7awf6z1YDp0z2MWpavJCdHLxI84h1k4hhASzAmJzok+UFjyPzXBm9Euft3RnUhBrGJWRdyWM8MIISMTFnwS0SOYrQmNoq2KKvgNJbAXRBj+M/C1mndr79PQlrsV0j7fLp6EBt7LC8zE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHJKZabG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHJKZabG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766698336; x=1798234336;
  h=date:from:to:subject:message-id:mime-version;
  bh=7qhYpN44OELsVu+eSg8DLN6NEdVIjubrmG7wMJunRU0=;
  b=iHJKZabG4QFjWWTvlfO19I4sXlJesNZcC0yNF2WVnqflMUahteiQmyrY
   U64tMmGxi6MJEhT/cbrbRxRYm0YgIUaPWOadUi40KPCe0ZKEM1VdBbqqR
   s3mtqsR+6jBPgz/eL7y4NNF0N1wLk3COuTJMkf5DEVbvXP1GD2NNPD8hv
   T+naHD+ruwGO+lWUVXmwksYKJlchzSpk3PDBY6Y0oTn1i6l+bHXupQOwo
   D9b0eJpZUoh1qNZv+1n0XNsRN7GH/o7sPt9f3BRV/ORQE1VdR43TvBePK
   fOfIeKlawOs9csNXmd05eIMEkKYeilImmEmE1iF2YYEzCLT8A30MZwbq0
   w==;
X-CSE-ConnectionGUID: +NTrdddITjKMg2ZBXnzfZg==
X-CSE-MsgGUID: z2ZezQUyQ4+pwWn/aDbCtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79205107"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="79205107"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 13:32:15 -0800
X-CSE-ConnectionGUID: +bkR5xqISEqofGJk4jfVtw==
X-CSE-MsgGUID: eRzFoKqqTq+oj7cKuGKvtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="201193618"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 25 Dec 2025 13:32:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYswO-000000006fa-2VtM
	for oe-kbuild@lists.linux.dev;
	Thu, 25 Dec 2025 21:32:12 +0000
Date: Thu, 25 Dec 2025 22:32:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 52/53] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202512252236.Ektb308j-lkp@intel.com>
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
head:   4ffc6ddbf0e8efa83a455c4ccf5b256c396a4436
commit: 4e48e523c9a64eafbe35ef865dc5ab5533c620b1 [52/53] bcachefs: bch2_extent_ptr_durability() can return transaction restarts
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251225/202512252236.Ektb308j-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#123: FILE: fs/bcachefs/data/update.c:367:
+	if (unlikely(u->opts.ptrs_io_error) ){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
