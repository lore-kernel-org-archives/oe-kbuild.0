Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C1439DB22
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 05:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769147870; cv=none; b=ioD833pDB3NWB7FgJG9ofojv5LWYIvQW0ndJHVhAc1MPNLx0j45zixBOLLtofdVO5+fIVWoNFfyyLLoeLqdmNgicotR8Hil+BYkiDPAJvHnMpCOGZ2OqdWeXpXEDHA4VRV7TXRpIO2X1OEiXbOTg6+aFNobtFfptFX4WVu3ebmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769147870; c=relaxed/simple;
	bh=YPw9yVFnKylGI51u5Jq5m3rw+EeIvfYeE4rmrAQoovg=;
	h=Date:From:To:Subject:Message-ID; b=XxLEoztoVpca0HHYRFHcPGy/WnnvolwjuBNK1o3htAv1whpf8L6ganx2FxPcg/jEQ1uQ0urHIG5ef77GGAXfdWK96Vh8x15o82o2HMJqEhwprFU+9uaZZJ3GWBnazFaS1a6F1alOi0100e9kDl7Una8r1p5uBSahSRgZezuAJJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjcdTERp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjcdTERp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769147866; x=1800683866;
  h=date:from:to:subject:message-id;
  bh=YPw9yVFnKylGI51u5Jq5m3rw+EeIvfYeE4rmrAQoovg=;
  b=DjcdTERpwfefJAzxUORZjyWGyPalHCtJVcGDVQ3QeLjrE5YltOjWfppm
   O5dNbJk6/8Rzp6zY9at0LvrTPKMn7hDreWXiNplmbZDV+StUAp3ATVReO
   35TqLKUxVAx19zYNj/n1jBB5V/uHqt3+BpwVHjc8wqJ4JJtSU97gTmuVw
   BV0DDiTx6Y5qcxvHEEImlVZ19UB3zebM+U24uQfWiZs7sQKntNPJtG2h+
   dbZmTe45sHC7FReHzJ7UXp8BmfLzhY9wwxTeSFcQ7agfTs8xh4Wwm655r
   ULTEJJylVJGr2Gw3Xis/cDIlFJaAebFoDMUQhc9S8cd+UFQVXqdXlvtac
   A==;
X-CSE-ConnectionGUID: fgxW/vmQQ8uQ74QUt8YAMQ==
X-CSE-MsgGUID: PNaBmr0LQleckh+UK3ommw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81770187"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="81770187"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 21:57:42 -0800
X-CSE-ConnectionGUID: Ge/oottJSvqyJ9jWWvKXSg==
X-CSE-MsgGUID: pnkjMm76SRacMHTuocFA4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="207283215"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jan 2026 21:57:42 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjAAt-000000000fV-44TN
	for oe-kbuild@lists.linux.dev;
	Fri, 23 Jan 2026 05:57:39 +0000
Date: Fri, 23 Jan 2026 06:57:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:scrub-syzbot-fixes 27/33] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202601230606.efzvJXT0-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git scrub-syzbot-fixes
head:   07944f1687ce869fd98b8681eab2544ee9c71c6d
commit: 5ec8b8cf2b544f43de7a9906672cb5e8edf94cfa [27/33] xfs: speed up parent pointer operations when possible
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260123/202601230606.efzvJXT0-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#57: 
changes are logged with the inode and do not require the the xattr

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
