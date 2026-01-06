Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EE513D891
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jan 2026 03:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767669467; cv=none; b=EF9Z8xMZwDhCaToaQ8uQ2r3wFpBJfQ+bMa9CCPGgGbCsfYRNJ9h22l3OWsELnHH7ywyWOqwqjhW2Q60hy9mFZyv/HyP+aSmuyndkH3c+YcLznXyryxpjrD2Jmm+NBmcCQvMo87pB69yFNgwYMY04REbvZHeZ3OznpgFrlWxxb4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767669467; c=relaxed/simple;
	bh=SECTJn1TEa/drciAK5buZ9cPdpcDozGX9PQbpWSXvT0=;
	h=Date:From:To:Subject:Message-ID; b=ItnZXuB1y8soJrU0y5ZMRVSpu/xBrtjGL5B8V2hQ2SbczcbUPAKYdgbYL+HvZMcJQ9pTbkEX+RXqoBzXyMOG25PeXBwCY8fi50nMXUJajx7eljL9dyZQCtj4h8Q4IDRAjs4QBaP19FYM86iE6kIkSYI3ObPZvDeCW828GROIh0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5mMoVC0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5mMoVC0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767669465; x=1799205465;
  h=date:from:to:subject:message-id;
  bh=SECTJn1TEa/drciAK5buZ9cPdpcDozGX9PQbpWSXvT0=;
  b=K5mMoVC0GNrLhvGFJfzTvlvElsXwf57Qj+CBO2inoIzHJ4Nn41sUe92Q
   IqMYX4XolPcl6fHu11ggk+PCHoz9HTm6y/6UCsG6xianW0Wig4j/sCGuy
   jypZGtO7QbFed4P919ElZ5oH5flazBjpb84VzLpyVS/tuGlreJM44S4Pc
   oURm0zd1Tvk6L17T1/nIVWUsmbsJNYYYwQIaoPWPHbvjjxQliWOjrRwce
   g2H4Yu0QS0QGd9RG8psm7U9ew7C5G3424wP/xbUUKvi5RyuBYqYaxvLNg
   75/lRrbJ6NQ/vZgU7D7Q+5rqDdWgFCZOXL+yEu0ShqFubnXHXqTEI10Jh
   A==;
X-CSE-ConnectionGUID: t2S+/0SZTueRjUMzw7B8/w==
X-CSE-MsgGUID: lWfH/xkfQ8Gt12alZ4AXAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69078197"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="69078197"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 19:17:44 -0800
X-CSE-ConnectionGUID: ApldFotZTo60Is0DTl3exw==
X-CSE-MsgGUID: 71GyI8K+Tie0613sb8Idmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202602171"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 05 Jan 2026 19:17:44 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcxZk-000000001Ez-2Irz
	for oe-kbuild@lists.linux.dev;
	Tue, 06 Jan 2026 03:17:40 +0000
Date: Tue, 06 Jan 2026 04:16:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v2 5/9] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Gregory Price'
Message-ID: <202601060420.jjMiomg3-lkp@intel.com>
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
TO: Gregory Price <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v2
head:   6b68def975cda87017567ab015c605ab968219f2
commit: dd3d077d9d6e8804e9353df7bbe283d0e14395a8 [5/9] node: create N_SPM
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260106/202601060420.jjMiomg3-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Gregory Price'
#16: 
Signed-off-by: Gregory Price

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
