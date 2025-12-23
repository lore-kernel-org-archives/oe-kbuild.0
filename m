Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E3470830
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 01:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766454213; cv=none; b=g8tdh6Ic1tTAW7gYmmWQivQhnE7O5glvHGZ1DOjZlV9aEO7BesrpOa611r+ItUDvDlOhKZNyrZ/z1/DCCRQoht5qQdlW0rsggDlKAJTtzz48noX/B+u/vKM4nWINmMpSwfkZto8XCqA3RrVqIhvrafHjX+AW4LMrLsAqkjIsdkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766454213; c=relaxed/simple;
	bh=U4ngAC0lVLmm81TyGs9piiERIZEkTRnCQFH9DXVPKi8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mvmRSuA1XWKrbgd3Kn0I8vrf6O/lr3n4I7bU/UWQ7bMgeeRabnpZqk8m/QM71wcmx8QORKN7ePFyJMgjfjimn4/71HYGeGk+YjUTzkDTxZIWkrktQmqZ/vHdMwLrFwjmcaIbBoxeyNE299/iAbJj+5Ohz5VinTPGt4ikMZLdBdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAbkbTON; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAbkbTON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766454211; x=1797990211;
  h=date:from:to:subject:message-id:mime-version;
  bh=U4ngAC0lVLmm81TyGs9piiERIZEkTRnCQFH9DXVPKi8=;
  b=WAbkbTONKHyHP4jvTqXKaIQT6jEifWgXxXGSfxg62mUehh9ec2X82Lh/
   9rdAuXTn8FY81cqOajgiikO9jLGQpz4mVk7+XDNBJrB9EkAFNwfi6w/JH
   JjTOOXb6ItDiJ8dSeZtdJHHk6PJSE6p7cvBg15wu0w/S8bo/OYrw8TfK9
   U4lmSDhmkCosqw2peeAYxXgAy/mnL06z3ExP8LxFNByJ1jP/Y2QnWJWrq
   CZecnQRoycwbaDfFiayrreRFxlTHPpKPcgVVs+vf1iQtkQVFJynXkidtp
   mOWSy/e7O8E3bmI2k0d8zrHxe+SIIzkicJCuOrondErTDnIYTf7aiSbq+
   g==;
X-CSE-ConnectionGUID: 0PsOaXG0TYyD1PP1nBXH4w==
X-CSE-MsgGUID: LRwsEzYGQ1+vQpIDCDrJuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="93779223"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="93779223"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 17:43:29 -0800
X-CSE-ConnectionGUID: OJyvRtMgStm3Al4BiCmNhg==
X-CSE-MsgGUID: 2ZNi6NV5RBCTPTP69ZMzXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="230672295"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 22 Dec 2025 17:43:29 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXrQs-000000005hH-3jk5
	for oe-kbuild@lists.linux.dev;
	Tue, 23 Dec 2025 01:43:26 +0000
Date: Tue, 23 Dec 2025 02:42:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal-linus-next:linus-next 20/20] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'claude-opus-4-5-20251101'
Message-ID: <202512230240.ndndwVJD-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git linus-next
head:   16a586b4e966771bbc7240083c366ba674702b86
commit: 16a586b4e966771bbc7240083c366ba674702b86 [20/20] fuse: fix iomap_folio_state uptodate mismatch
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251223/202512230240.ndndwVJD-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'claude-opus-4-5-20251101'
#40: 
Assisted-by: claude-opus-4-5-20251101

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
