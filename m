Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933122D7DC4
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 08:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764576807; cv=none; b=tNol1y0nR5l2IBeTl9D+j41dpqyRnu+EYcEya49gBLEE9KP4iyjz7Q2baozpffykK+Mks2cle0tMt1IKokSwP9xarggNYX/GwJfgmLdW8YO742c9G2H2n6lIKUPumXwlWhxEbWRMAGqhLltpmYVg2lZPw3/4wrC0MxoKSiDxbFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764576807; c=relaxed/simple;
	bh=/AP4UkF9JoUoME/68tsao/iflMjATL71YDjmBHOtzUI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=njyqpCb6PA9qUy4CHC5e9AdQdpf2/sDQ1pI9RJlwN1bR10C9ilYPl9fxIDAq0z5wEewiUI3r/B62caj0Xk1aZTDgWPQRyuqNcQx/3CWGgH2for3tm4OCaxovVF5fNADhvcqKddazzG9q8vzqaZ73xmztuBzMHnZzdhmz+/7AbrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awBxbZt2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awBxbZt2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764576806; x=1796112806;
  h=date:from:to:subject:message-id:mime-version;
  bh=/AP4UkF9JoUoME/68tsao/iflMjATL71YDjmBHOtzUI=;
  b=awBxbZt2GaOoUMVe29VVI0M7JIDJRHLpm5LJlVoqapYDCDbFJ5NP0kmU
   vdCdl2mKGTwM4JBL27m4s0uB0ijZTAnbEYKBMwPkxU9rNp7f/sYNq0Tgh
   vaQV/eNXdwRJXIoPqtwtyLDXlmhK0knUrdpB4SaBwwtCZzVyCYDQftL/J
   OsfODfp0rZh+Z/1ND5Nhtb/rq1A2wYc92++sY0W1mt8lx1iQH42MJ6Swi
   3VC6uyPnbDCrqKmKC62cZowquzCNRVkIkarM5J7xfScJ6QgOzNp/QNmgC
   JAtD/PPohSmGb9MVHecbQJ3mZcS7t/UhikrRr0oZ7PW2vA5cRpWtrsZ6o
   w==;
X-CSE-ConnectionGUID: iZLYYPhYTQadPNXJCTEKiQ==
X-CSE-MsgGUID: GcZc/czUQ7eU2qu6lybb0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66669758"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="66669758"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 00:13:25 -0800
X-CSE-ConnectionGUID: M5qFT09ESr6+XAaUrhUjNw==
X-CSE-MsgGUID: iJ67g7M1QRe4uxnqdPAOQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="194107697"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 01 Dec 2025 00:13:24 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPz2A-000000002er-0WWP
	for oe-kbuild@lists.linux.dev;
	Mon, 01 Dec 2025 08:13:22 +0000
Date: Mon, 1 Dec 2025 09:12:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tytso-ext4:dev 2/72] checkpatch: ERROR:POINTER_LOCATION: "foo *
 bar" should be "foo *bar"
Message-ID: <202512010911.5SgRHMC6-lkp@intel.com>
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
TO: Ranganath V N <vnranganath.20@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
head:   6fb67ac896900e60f46ee4efba97b372a80370e0
commit: 6640d552185f7c11235c64a832004db9af119b2d [2/72] fs: ext4: fix uninitialized symbols
:::::: branch date: 31 hours ago
:::::: commit date: 4 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251201/202512010911.5SgRHMC6-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#56: FILE: fs/ext4/namei.c:1821:
+	struct ext4_dir_entry_2 * de = NULL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
