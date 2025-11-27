Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D1C1E9B0B
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 00:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764204035; cv=none; b=YwL3d5F/t9ceueL/dBsEfoNnOCFy16dYO2dWUXetvsjP1Qr/IJHYFeRCuIYsIxrWLxO+B4lruQhIdZUNtfRX9XJvaoT/otRzAttYbyLt+2EzgAxIFQDXt7PUgfFsDqgpPh5TMXuUoNgX0XVi5SWS3ldX5gBpnTd365h0Lz+OIno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764204035; c=relaxed/simple;
	bh=EC8YAIe9oT/OEssqRYB7o6FjgzZBFfNsSGmnjyXLwqA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lvwr6mRqoI9BaRqyuh4A7uBxgYa1oFd20aeicc+Ih2vuV+AI/eLT8M3fodDr4p37uC0LJxgV2iZ7lSX/hNoGmVonOD/yxEHlIBxIahvK4OmH3OMDGBkIJHTum1NNQTWiYDCFIGCW+HJ3EvuzZ/swASwk1DUqzzCCd6VelgT8YGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NicMobFo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NicMobFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764204034; x=1795740034;
  h=date:from:to:subject:message-id:mime-version;
  bh=EC8YAIe9oT/OEssqRYB7o6FjgzZBFfNsSGmnjyXLwqA=;
  b=NicMobFoZaTAvmLltXdBIYhL5lnF0objjN1fBLVD5fFQk028EluQQvCG
   jYCqYsLt0c/e9Q5XuNWlAkzIGPj/mQLy4xoZIvAl5ChIWov8NN+JIUMLD
   S96hYVKImV4ufLTDCWIyruusABEUoKfgzxx6xaRBmCczZ+1/5N4BH7IaB
   Xyo0SDSdyPMx2XF45c22gIAjzeRALCZlPFZn9ZriJebpjHUFpgLljU3xR
   +E3bOaEZ/EdS1f/zFo/SW07i3EKSVpF3fWYyiZ942XLOFhECcTnSJNE+F
   5RyCxKAzMMudrEMgOjYckzQmAIMNr4qoL9trydTX8hpqu9tWxuyrwyuqH
   A==;
X-CSE-ConnectionGUID: x3fL5B7YRa+SxuCLwen4sQ==
X-CSE-MsgGUID: lrpO3/2yTZKFRwooPuST1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65253173"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="65253173"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 16:40:32 -0800
X-CSE-ConnectionGUID: uxWiUsuVSuOCjcL9BHY/Yw==
X-CSE-MsgGUID: GeqBelp8RS++cGykJgVrnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193187224"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Nov 2025 16:40:32 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOQ3h-000000001Z7-3hTN
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 00:40:29 +0000
Date: Thu, 27 Nov 2025 01:39:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tytso-ext4:dev 2/61] checkpatch: ERROR:POINTER_LOCATION: "foo *
 bar" should be "foo *bar"
Message-ID: <202511270132.PkW8w6MB-lkp@intel.com>
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
head:   690243606a4fc1ad6b877e0157cce05767ce5be6
commit: 6640d552185f7c11235c64a832004db9af119b2d [2/61] fs: ext4: fix uninitialized symbols
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270132.PkW8w6MB-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#56: FILE: fs/ext4/namei.c:1821:
+	struct ext4_dir_entry_2 * de = NULL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
