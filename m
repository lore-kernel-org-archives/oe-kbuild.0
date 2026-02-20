Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52B319D093
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 22:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771626237; cv=none; b=d1XE3PUWuDpBYmMrNrwUqyKAteNxnf6PYd4XHnUQpI23ZEASMO+AFpFdsTiXhyU7Z14hc1z7GvxgmhX/6Fp7uOTfjyJMHl5wFAv/itJXHEsMxKYwmbTtQHfRZwuU73lMhhczysHNatFhC/xt6KdIKGx9D7svsRbNzmhSIFGyemA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771626237; c=relaxed/simple;
	bh=u5ZmwE5bz1JJ56IcTtBKg8bzvTneJ/QkqR068UfJVjk=;
	h=Date:From:To:Subject:Message-ID; b=G02LyWB5861viPdBTNmHw6lzoaeUdisO1uguYapDuf9nYQ5dsWcG7+L9itgjF/ub5tM+geGGjQIOSaPXbWDhsMwIETtdnNmVu5GddKiuEUFXFiEFy58FEUXWDjYOzVIXGtT1Xf0b8pEuy8lbDY33m1qrY1KFK6TosHPI73LwwVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVh/uWMv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVh/uWMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771626236; x=1803162236;
  h=date:from:to:subject:message-id;
  bh=u5ZmwE5bz1JJ56IcTtBKg8bzvTneJ/QkqR068UfJVjk=;
  b=mVh/uWMvYy5v21VTdk3HPUowRmJDio3sQesYRq+TCjFs3t57HQ1rse4T
   wWBTSnGnSQKgL5Ng3By42XEw1FM/ZgQHUOrt9ITbJko1CGitHZMsp11iu
   JYcXj8z/0AUC9gAaDsEHJ81DxjyQYcW3Mjq0QhD0s0XiTsBjkvAdl04bE
   xv4JH6VlccVrYQ4mlQ0ego4d9xWCFhkRe7ba3IhhN11LsPfGWPUfljUYe
   PQ6sLZ1Q9byJPdB5CCiE1c9nWO1ukldJgu0O/agrd/qEGemz9hoxsjFFi
   /7e4QeXOsVDVBoS0M0oG1NmGZ9ygCpZWpu28mudmbV5umbf51HuGE2gs/
   w==;
X-CSE-ConnectionGUID: E/CU4Py5TJiBh04l3g6ANQ==
X-CSE-MsgGUID: 6zFVIzePQoW8XjUya6/HbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="75333567"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="75333567"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 14:23:55 -0800
X-CSE-ConnectionGUID: 59s537DzQLm2o+1TB7vCxg==
X-CSE-MsgGUID: rrjxjZyBQMSyb4gYSVQjjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="215103916"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 20 Feb 2026 14:23:55 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtYue-000000004Ha-0igZ
	for oe-kbuild@lists.linux.dev;
	Fri, 20 Feb 2026 22:23:52 +0000
Date: Fri, 20 Feb 2026 23:23:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 2/2] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'ar2000jp'
Message-ID: <202602202355.yCynvSuQ-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   1d1cb625d3095ec6f263b8ed351af74d6e2aec72
commit: 1d1cb625d3095ec6f263b8ed351af74d6e2aec72 [2/2] bcachefs: fix write buffer flush spin by including flushing in must_wait
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260220/202602202355.yCynvSuQ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'ar2000jp'
#31: 
Reported-by: ar2000jp

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
