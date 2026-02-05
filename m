Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBA929E10B
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Feb 2026 05:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770267860; cv=none; b=QadyNso39IXzEwnSsxsYiPWW/T0NFvmgHYkzCCHjokNOVzrH7JgIaq5NOjZ96XVo3QGq3VDoH0FzupTt5PSuruNzVeDYo83NYzZqiUr11X12WCxMiEyJWnuS+hCmWheq3uSokFR1ZtxsdD/IbFBJo6fzLpr/w29UmbPNSnPmuDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770267860; c=relaxed/simple;
	bh=Z1HmOBaXzhE0WBqe0MgROwpu+XHvwP4AqxLGtFMQx9c=;
	h=Date:From:To:Subject:Message-ID; b=Mc9BKsnUokekylEMua3KwhXJpQa6fh/MKzQ58GiePqNjcTUlfa6BnBJn7hWTtVGCF+8ZRkZ2zOQFqfDuM60eEUbLQb508D/4aVAL4NtsV5Y03xoF3lB0HPanT+90wAEcor+/HB9DBR4wJ03T8mc9R46enqloYTJXgS6mvYbE9zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lkCAahGl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lkCAahGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770267860; x=1801803860;
  h=date:from:to:subject:message-id;
  bh=Z1HmOBaXzhE0WBqe0MgROwpu+XHvwP4AqxLGtFMQx9c=;
  b=lkCAahGl5o03pnZZ7JaxhgN/w/6swAoI5aay9znAWnZF0UAajf4Ef+/9
   jL1p83PR2ygl50iv/BpyIRICLmvpjrlQomzltC28P5LJjpGrSWHYuFLb7
   nT0P6aQQYCu4sNe/kJx0Tct2NlE4z4ZtfhQ14DKLkC5zuPu2GJf3CsAE+
   yOHxnu0v4lRJWT5fyhe0JEi9Ch8fZs7+ULs8CoajbSzTq9t+mk5Po8RTE
   qNnnnHA+NoeA1rFzOq1zE0QZBvY5PJX/ZXMAXlqxMNB8ig4EmP1iGvl75
   j9jBYZSglAbxqVE32uRy5ZlM8tVY5d9ukEDZLgXLGFgEyTQrAhFeBmsWm
   Q==;
X-CSE-ConnectionGUID: 67Jny44pSIepkU9QBFZX9w==
X-CSE-MsgGUID: Rid72U53SlmWIb7JTR8XAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71358046"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="71358046"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 21:04:18 -0800
X-CSE-ConnectionGUID: 2/lkRmH3Q9m0mNlq4Y0bRw==
X-CSE-MsgGUID: j0t6pDxQTsu2FnTu2JYGiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="209888210"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 04 Feb 2026 21:04:17 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnrXL-0000000040B-1o5j
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Feb 2026 05:04:15 +0000
Date: Thu, 05 Feb 2026 06:03:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [xilinx-xlnx:master 203/590] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202602050604.79phHe4O-lkp@intel.com>
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
TO: Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: c402c95c756304484d2f153b5960079e50791f2e [203/590] ASoC: xlnx: add PL sound card support
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20260205/202602050604.79phHe4O-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#98: FILE: sound/soc/xilinx/Kconfig:36:
+	tristate "Audio support for the the Xilinx PL sound card"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
