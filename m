Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DBE3090E0
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Feb 2026 23:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770421675; cv=none; b=W40Te7iznLF7S5vCrZrbT7tReZoYlYzBBCQsnfU9/g9nl3iSgZ9appUKBVe17CpdAs2RQoPDQn8Keu4T/4GF3mbVqc2bXzvu9SZrF28cbqM5xWgYQvtXDvXRhlWNTUV8zHWO6XXGWBB4Fn6kMO0+DcVSamxY6aQzPhi1zg9JCCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770421675; c=relaxed/simple;
	bh=5u240itoINE07Gi987LbLLOFLxWggsWMVneVLq2U9mA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=hRbKogfN7iVk9bwCCPMEpqBvBz6iErYDQlAUP/aMftajKJpk612tYEqtSw2ZV81RMlrrcaLZ6hV4W3i8qZh3OG2wiMDytY6HUNlWlvXSBwis/IoYk6Yuzsy9OuVzhBLAIAElMqyunvMzjJpGRjl9kqNn033RyWVR8u4bQof8VSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHBAUgLb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHBAUgLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770421674; x=1801957674;
  h=date:from:to:subject:message-id:mime-version;
  bh=5u240itoINE07Gi987LbLLOFLxWggsWMVneVLq2U9mA=;
  b=eHBAUgLbC0mx9N4gjTfc7VFOsXxSk+pJLkRaoZNqu0FnAqsILbjKhLNx
   PNHc5o9Ue1iOCT+FO8LKSJU+xjqHA/flz0jLuwNVMALZFuzbT9zG0i2Sg
   jCKVm2wppRj+PtY8m8zXgwbqPwjAwMdLMQSG3ZSMYZXR/echnA8UtpNeN
   uGqZLi5zpi35xz76sMpd4A9Nhk6KbLBDrjiaWzP1oveKNK3YTNQe0OP72
   U5FSP1oMqumywgD2OG+MphWx/TM8cnEi+e/wyqzdt3+/jDm75NbylNNGe
   pfkXppG1Vq9W/cKN0/ATIBf9CDsI7+u1a+gaBmcdMblgH/x5oeLwZO0nE
   Q==;
X-CSE-ConnectionGUID: TOGRs4l8ToaTMbtZkH/SEQ==
X-CSE-MsgGUID: OSJGuG7yTBCrmcfTBdEtdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71620624"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71620624"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 15:47:53 -0800
X-CSE-ConnectionGUID: V/tnnI/yQQiHdUlaUr3+uw==
X-CSE-MsgGUID: ZdGBzSG+RYKfYD0Cj5mClw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="215553123"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Feb 2026 15:47:53 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voVYF-000000004kn-0fNS
	for oe-kbuild@lists.linux.dev;
	Fri, 06 Feb 2026 23:47:51 +0000
Date: Sat, 07 Feb 2026 00:47:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: 
 =?us-ascii?Q?[linux-review:Dave-Hansen/x86-cpu-Break-Vendor-Family-Model?=
 =?us-ascii?Q?-macros-into-separate-header/20260207-071955?= 5/6]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'changes'
Message-ID: <202602070046.gD3o8eLe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dave Hansen <dave.hansen@linux.intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Dave-Hansen/x86-cpu-Break-Vendor-Family-Model-macros-into-separate-header/20260207-071955
head:   d9ee5a394d1b0e0ddb5acc4b6af566421eb8bed9
commit: 8e6ced234069a6ddb8fb7e51e22a5aa8bf7da767 [5/6] x86/cpu: Add platform ID to CPU matching structure
:::::: branch date: 26 minutes ago
:::::: commit date: 26 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260207/202602070046.gD3o8eLe-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'changes'
#32: 
avoids forcing changes changes to existing 'struct x86_cpu_id' users.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
