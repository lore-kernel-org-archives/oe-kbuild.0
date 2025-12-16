Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F9B2FDC3D
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 17:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765907664; cv=none; b=rFUXuACZStlArh9J8gDvwLyJ40yFSvHuPZWFd+T6p9uagBiY3HscWg5UXp0yJIGcAz1U7IEdKqgPKPE4sVWOUQvkWft3B2HlNygxbZEvWww0RSEBVU1+5tCzCIcq/68esK6pFFSc/SL8MCXOQB2ZMc6JGMsNwworXL2G1laAfrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765907664; c=relaxed/simple;
	bh=iEgy/O5nZWYjqKt7XeobCKgbQMBeC8GZaRtk9BxanBg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V8o+qNEyUx/pYRWuf5J1cd11Gnsn2enxvspnBcYkXTsX65k7DP2x8odXlqLjNDY4KyJs07AtaLQ7PAkbrZfUSFdz0pSqPDJQ46zbhcLSYA1uE3x7d9e1eJ66swlQ/crfcBKkr1/sTkEFvAfSkEkLRvnkkaSwVoMD/rz4A2SM6cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTo0+9ex; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTo0+9ex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765907663; x=1797443663;
  h=date:from:to:subject:message-id:mime-version;
  bh=iEgy/O5nZWYjqKt7XeobCKgbQMBeC8GZaRtk9BxanBg=;
  b=NTo0+9exNULh2f4p+PrkxJrkO9kv0Dw5JQtFR9Cc/m8QtyQw7JFEc+Tf
   IguTGiRffMzRqE4CzkhJRfrExxA5tFPTmPkgI/BFAV3IdBmeBW/i7TDHF
   midrT83O5H6/31OKjZI8JwPFdYX0+g2SAkr8LfMbubiTky4NKsVIMPq/D
   FBsYlDCPl5WKexIpbnCOZQFJlSzYwpYEi5cfktA0wLaXoRV4DiL6gCh2z
   hbpILsE8nSm1pWZ53+WIndDub09NpENYzunZys/WGczst8hRkBP0CIaSH
   qoPjwemJviMq+tuLY4qydoj8cFD016Nj+VwFwFXYpbZIOswDr47JSGdvw
   A==;
X-CSE-ConnectionGUID: le5KXGcyRuenYAbT7yhx9g==
X-CSE-MsgGUID: lMto3Ov3TmWgcyIrNy4EJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="79201241"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="79201241"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 09:54:22 -0800
X-CSE-ConnectionGUID: qG5bt6clTaeQBaPwZ3pd5g==
X-CSE-MsgGUID: HSFmf8bCRUuFQYz2tJ3Guw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="235475453"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2025 09:54:21 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVZFb-000000003DQ-0DMY
	for oe-kbuild@lists.linux.dev;
	Tue, 16 Dec 2025 17:54:19 +0000
Date: Tue, 16 Dec 2025 18:53:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tnguy-net-queue:40GbE 11/25] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Eelco Chaudron echaudro@redhat.com'
Message-ID: <202512161801.YRjKvk5t-lkp@intel.com>
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
TO: Ilya Maximets <i.maximets@ovn.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git 40GbE
head:   885bebac9909994050bbbeed0829c727e42bd1b7
commit: 5ace7ef87f059d68b5f50837ef3e8a1a4870c36e [11/25] net: openvswitch: fix middle attribute validation in push_nsh() action
:::::: branch date: 5 days ago
:::::: commit date: 6 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251216/202512161801.YRjKvk5t-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Eelco Chaudron echaudro@redhat.com'
#61: 
Acked-by: Eelco Chaudron echaudro@redhat.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
