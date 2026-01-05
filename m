Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DA12DECD2
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 18:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767636162; cv=none; b=tJJRJmiOQMCsn4H/+dPR/JGYJKFYaEUc9bgYgBaid/TiPzm+0fnyYxwtHrnWgQqKmOAVDazysYjTfo6ckr/w+APjRE9ViDvxS+SJbrORELhPVPunkcowJmegi+vdsxrc9pYg6FUHifKqzlcSx/z7PkZDtmI99jc+BWCAacQuojs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767636162; c=relaxed/simple;
	bh=Ikk4WAl3OAcj39Sed98066MkdUS5ygZoaWbF/rCnphY=;
	h=Date:From:To:Subject:Message-ID; b=R6Mk3mfOn6P5JeOBaVnE3Bo7jC+eOA/+KaIlNvZUrsHWz4p9henZml7/sL8RekXmIC7JPFfk2oz494l9SXT+ldBvRPcoChS9ENGkDz5fnZOoi3pLaIwWj27NFrQ8YM5tpGS5i0SuTtRGnAd5JFuaXSbfhd54dg8XeQ+eRhd2lzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0jlGw1W; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0jlGw1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767636161; x=1799172161;
  h=date:from:to:subject:message-id;
  bh=Ikk4WAl3OAcj39Sed98066MkdUS5ygZoaWbF/rCnphY=;
  b=b0jlGw1WXzXXw40lI58MIcs9PAH4DNjam+eiBlrP7goHE6fCsChK01z4
   awhLvlOVNB1Mecugmh83qTWzZ7Cn4DKdqnrZJsHFfcoK5fes/GPcsoa8a
   TfoR6qblfhqpa/qhOPiuzk7xC4DaLU8Nk15ePuTJn+iYAo+pvIOHGpCFK
   VzmquiAWg0zJZ9GITmBvw1UaqUULdx5c4P5jeODRsGYlmmRZyxJfzIDaZ
   myu4TfCVJ7LzEwwki9miEovRbsX1m2/SB1Z/AiFoC21TO0nLo1jyuN4Pf
   Ucz9Ox99MwuLZhVE2K0Ty6InGORiOUyYcFIJyTHR6J9F8hJ0wBFEN8eB8
   g==;
X-CSE-ConnectionGUID: DM2JE9v2SkSik68/PW0PDw==
X-CSE-MsgGUID: Z6V5NYAaRjqEC4hgFqheqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="71583843"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="71583843"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 10:02:40 -0800
X-CSE-ConnectionGUID: Mfz3FWfIQh66nDfqX0y2Pw==
X-CSE-MsgGUID: 0cS90oP4QYyf+jt/oLBwJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="203415929"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jan 2026 10:02:39 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcoub-000000001Az-1dSR
	for oe-kbuild@lists.linux.dev;
	Mon, 05 Jan 2026 18:02:37 +0000
Date: Mon, 05 Jan 2026 19:01:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cilium:pr/netkit-iouring8 4/13] checkpatch:
 WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute
 nominal patch author 'Daniel Borkmann <daniel@iogearbox.net>'
Message-ID: <202601051913.Rgdg87d3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://github.com/cilium/linux.git pr/netkit-iouring8
head:   b512543cf8a54e5c9d43cdb2002a09f7737723b0
commit: 544bdbd1e68e41ce095e6878ddac3a96f0b3cbac [4/13] net: Add peer info to queue-get response
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260105/202601051913.Rgdg87d3-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute nominal patch author 'Daniel Borkmann <daniel@iogearbox.net>'
#65: 
Co-developed-by: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
