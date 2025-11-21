Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBC82882AA
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 11:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763723233; cv=none; b=LdjhJ4+9seYMiaPLEz51iCHvFFzdK1S+cIXPZFnsSpffHqVDtDYTPHHyt0nl7p0ocVwnNAiAVt8gQ38V0HVLXUXASz8b2aW6djcOsjIwvhFKCIyTPEcdW+mWTpYS49/l5ZREZgVmLymfy3vu5SBZzYal4EEHpgPGUa3iJtuSjAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763723233; c=relaxed/simple;
	bh=Zi0n54iXwclbfu+uABpMlkL17qJp3rwBGNUs1hgD1jE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jmfVJRQkdf9mzAKFPnQ0ExqXKyv3/P3StB6HFLOzCKbGXj+EK+lJJxy5eEPbQpbeSflHZ5XECVbL6RPvuX5VDkBwKfFctjclYB5mJfsjU4aHwbfrT4NzswCVYOJyyXDSbbhvoDaTRBGGtBQxU1/iC4UKGfijECjvrcI6Q93nCIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZiO5zk9S; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZiO5zk9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763723232; x=1795259232;
  h=date:from:to:subject:message-id:mime-version;
  bh=Zi0n54iXwclbfu+uABpMlkL17qJp3rwBGNUs1hgD1jE=;
  b=ZiO5zk9Sy45KmW2JZJpDL2QNffdxJUVgTGdmpbO/PXCWmx7s6dlNHY7Y
   le94If6cH2SO2rKLOWxd8tTpUQPT0X6TCPTu8g7hKSMeZ11miYU8g47+Y
   sGWz/1WZvdlhjX8KTl2RrNKFwtkYLv3GuwXGELM5mReFKOVJPTf+r6eRr
   bTli4IdN1T57Owbr7z8Qj2jXnJ4GZKP7evAztml0ZbL6m3fx7HFMzLiN4
   AwNUhkUnFH/ivxOtQjoo7dpzfNUGXL8q6mBebsbifxldpYUkKH2RYlEtu
   lfVFwQOujpEvg8k4kJOed41d7eXxxDIWAv5rvq0u4W1IjDiELH3nqVg2U
   g==;
X-CSE-ConnectionGUID: WzvVkk5gQaGbS7LRtT0qlw==
X-CSE-MsgGUID: TMumd8SjQeqzit3NX808IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="68418232"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="68418232"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 03:07:11 -0800
X-CSE-ConnectionGUID: Sa+KEXM4TbKGuXV190LGVg==
X-CSE-MsgGUID: kWbLMBXtQ1GrKbX7GstcJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191545852"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 21 Nov 2025 03:07:10 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMOyq-000000001ml-2SPD
	for oe-kbuild@lists.linux.dev;
	Fri, 21 Nov 2025 11:07:08 +0000
Date: Fri, 21 Nov 2025 12:06:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [boqun:shazptr-v2 4/8] checkpatch: WARNING:BRACES: braces {} are not
 necessary for any arm of this statement
Message-ID: <202511211218.PSTFif40-lkp@intel.com>
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
TO: Boqun Feng <boqun.feng@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git shazptr-v2
head:   904b8eaf21a993852b97d086d8d7a21916090cb9
commit: 31a43aa06d630ad79d471b02aee3348e369e6ba8 [4/8] shazptr: Avoid synchronize_shaptr() busy waiting
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251121/202511211218.PSTFif40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511211218.PSTFif40-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#103: FILE: kernel/locking/shazptr.c:76:
+			if (snaps[new].ptr == snaps[i].ptr) {
[...]
+			} else
[...]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
