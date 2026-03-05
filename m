Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79E41531C8
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680543; cv=none; b=kQU3kVqakw88UZcPmgU8mVu0hXo7yd7ubqpru5knzQXIiBm4MyH8C0cwu7TAtN0ou4PYOFzi/ikKB7xh0Z2vUWFAgV/OLQTWFyjaQ6YjPAeCj4ZtB9hZ1qCdnJUE/8fqf98IObCft7w/ojH1KvK0fL/SHm654ARO4bj9+8/fNZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680543; c=relaxed/simple;
	bh=noPjzWg389hls8Gi2qAT87gRHlQLSBgfBJPApPfqw+A=;
	h=Date:From:To:Subject:Message-ID; b=KYJO4TyzhjjLMrkRX50uqLTGp/9IVv23GvamYoJl7+UNSYSMMSfY0mOeibNK1/nxf72DGGosTg2m6vTU9TywxhbM2PhDCra7epH0IscJYX05x+Sd3ODup7YgJVFvkGsbUPx/I/h2+wWXIemgdy/TyZNHt5OeK3xmcme8gTQS83k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HduLhNaG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HduLhNaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680542; x=1804216542;
  h=date:from:to:subject:message-id;
  bh=noPjzWg389hls8Gi2qAT87gRHlQLSBgfBJPApPfqw+A=;
  b=HduLhNaG4aF2KCyHBfjuyiEG8jkvMS313qqN2vTfPlpEAXCrQ06zKF2S
   rOArGbACEc4/i3MvXt/LFgPjrpiTmxgYz/j8ozgXaXD6Zq3IH9htMvjw2
   o//Q0q9sJm6TuwVT8kPmGjlpnMsmEUfl8BWyawmOBZq22jml6ES49NlJ9
   SBordCFXnhKjTFw2Ypeztbd8YOobxkwt6DR21nTgivCm5Ae9qbo3d2xbl
   JnyPbxFaZLHHlIAedmfc0Wyd3Sfc8pIR6j5FcyZ2wAGFNCqweK2J7VonS
   /XddjuH/VpBGWYc/xyVDM1yJIS0pm0qucyZOSvswdWdQumhxOpZyAfvFy
   g==;
X-CSE-ConnectionGUID: n6moyTvwTQCSE/+pAxB/mQ==
X-CSE-MsgGUID: 2u0PBRE+TzmMAFt3tMrHCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96371778"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="96371778"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:15:40 -0800
X-CSE-ConnectionGUID: d3RZyoDTRI6CKqJfAnfWFg==
X-CSE-MsgGUID: ZN+U3MLQRO2m9VN7I44BaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="222692955"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 04 Mar 2026 19:15:40 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzBZ-000000001uo-1Myj
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:15:37 +0000
Date: Thu, 05 Mar 2026 04:15:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 446/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050430.moYSothP-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: 238e80bddfa18857ab3e2b2d29c31828e88e5187 [446/467] platform/x86: convert remaining fops to read/write iterators
:::::: branch date: 67 minutes ago
:::::: commit date: 67 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050430.moYSothP-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#26: FILE: drivers/platform/x86/amd/pmc/mp1_stb.c:114:
+static ssize_t amd_stb_debugfs_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#53: FILE: drivers/platform/x86/amd/pmc/mp1_stb.c:218:
+static ssize_t amd_stb_debugfs_read_v2(struct kiocb *iocb, struct iov_iter *to){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
