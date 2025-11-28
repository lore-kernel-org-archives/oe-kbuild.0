Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99719238C33
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 18:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764352861; cv=none; b=f33UXsMaptbr7DXKA69naqIJ/nICqEPyvAY88RIUd8m3ORw8hDBs9zDVyJ0GQte3GX1hPYsNzeqUuZKFXfcpQUtztb9ca2R/o6RuejSOBBKLvub9bVdZw6N8mCIbzv2mexRBD3CIB2iKyCR0htwex96VQ0t2eNUwxWI9zdpfToU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764352861; c=relaxed/simple;
	bh=bNkRIVws5Q0t4Vkepu0q69dTQd5H3LlTkGHNDlCw7FA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PjHE/SJYN2lzmAF8aZfKB6SlTYmo7T3O2LAT9u+vSDteE9FQ/mQn0NV0gSpQrz51BbHvkfGZJCFaNnV3RpBlC6US1joAcbCJxED56EDFhCAL9NVlzidt7RO1tXXBVaWpAFPG+/gx8/1PniQt+rSFulxtj09MGxL4kE/nHdReGVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpdnIo8f; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpdnIo8f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764352860; x=1795888860;
  h=date:from:to:subject:message-id:mime-version;
  bh=bNkRIVws5Q0t4Vkepu0q69dTQd5H3LlTkGHNDlCw7FA=;
  b=dpdnIo8foZ4M1bgAS6WnWXEcUrU/vjWagfcJy4kcnSUgzFGZ537ugoza
   H8Ihfmj6c6tRPpQPtSVrnWpBqQj5JopCAIczyDAkd3kX5uk17v2SlKO6A
   Mkd4JVYM1zy9XfzXB8EjOM6CkDlMNd/dLrqwstHBiiLH+x9EWENvYeIiC
   XU9eBqkKx2D8EbIJn0+ZlWh2WJ09FGybNRVzqYhIY7EOc0D2k/LpA6Dsn
   7n10u1tsgDHx9h9fJYOrF9kp2FrdCqWIvciyhc+8/1JV0olltgoisXh0w
   ByZPRbMdnwZX4XL+K+15AxtaoqedCVYG4TLr9T1WUGHK3iy7WKHRQfH+b
   A==;
X-CSE-ConnectionGUID: zctdbZmPRhCEXGMeyPyu0w==
X-CSE-MsgGUID: jCrdxLkhQ1WGK3nZhRsiSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66423264"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="66423264"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 10:00:59 -0800
X-CSE-ConnectionGUID: ELYKW5DJStCG+s9ISmb17A==
X-CSE-MsgGUID: JeZfPB4ZQNm103uvisnzzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="192631970"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 28 Nov 2025 10:00:58 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP2m8-0000000026b-09D2
	for oe-kbuild@lists.linux.dev;
	Fri, 28 Nov 2025 18:00:56 +0000
Date: Fri, 28 Nov 2025 19:00:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:for-6.19/block 39/110] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202511281901.QZFxlOuf-lkp@intel.com>
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
TO: Keith Busch <kbusch@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-6.19/block
head:   418de94e7593081c29066555bf9059f1f7dd9d79
commit: 262a3dd04e729386bececffeb095d31f7a9c43d5 [39/110] null_blk: single kmap per bio segment
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251128/202511281901.QZFxlOuf-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#6: 
Rather than kmap the the request bio segment for each sector, do

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
