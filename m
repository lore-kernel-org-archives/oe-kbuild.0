Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9507A22FDFF
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 14:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764945969; cv=none; b=uaHQZldcnYBGUFrBJ76Kt1cp14FMN7cRXNAIGQ6dxA3590GPmOVsf+qEiwjTX8WAXVv7efbQeWRDac/MIWo69+EWjsER75B66wWk+WdVlmZPE9n7LJtNKES9UcDLDhjK5k03g4pvieAKJItUg1AzKIFJ26gUERnsTUpVhYno1nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764945969; c=relaxed/simple;
	bh=ct7INzanMOhz+ERpIhTTAd+qsVXQsqJWJYskFnFXdq4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bW0ftRar/IrnkF6OsZEKIj2Xst0iSgBJ6RpXy2L6zhJacKRoqoRJXFp6FzHSJk4eUiirIS5L3i1PEt0DB1oxvUkcuXbQZWwxBqYU5G+xXIlUstUgkxvZRAa0oMVyTkMKR79HPpusUdVXYV9hB8TPYj75lnn4q2sJHYQ58Jxc0X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJaKcxT+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJaKcxT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764945958; x=1796481958;
  h=date:from:to:subject:message-id:mime-version;
  bh=ct7INzanMOhz+ERpIhTTAd+qsVXQsqJWJYskFnFXdq4=;
  b=IJaKcxT+aixO7rVQDRJFFt8K8KQRbUY7nbhQdTT2IH0dZCHhEy4c1L3S
   bsd4rR9c52brbE8KbFguVpV3Ikek9lyYK1SJGVkjnKeDx9naXL+dH2Coy
   4aiiGNQxFnngkpIkktHYNTv0umZg+PsbOou7IZEh5PvOcfG2MjpJ9OapE
   viRd3IPusDeKK9abOrEUQStbQnxy5ZtRXob3bEV3IyA5rGWX87SRwSIrR
   s7vJCf2jucU3K2JC2/4zY4K28JDcCMet91Pcwluk9mLWkJaz7sETDWIsk
   4Jl7sGakINOfsUM8w/3UIVKw6AyPJbPf9AJwOVHkbz5U9Uk97YFaa895A
   g==;
X-CSE-ConnectionGUID: rqd/IiygQIu+gR5hFfoi9g==
X-CSE-MsgGUID: Yc+Hq2rFReqQmdaDy+CeMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78445830"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="78445830"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 06:45:54 -0800
X-CSE-ConnectionGUID: bFnvRtsKQfegM9bhbqgcag==
X-CSE-MsgGUID: 9xoPwCYZRh+xmpOftPVvkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="194611751"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 05 Dec 2025 06:45:54 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRX4B-000000000xJ-00Br
	for oe-kbuild@lists.linux.dev;
	Fri, 05 Dec 2025 14:45:51 +0000
Date: Fri, 5 Dec 2025 15:45:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linusw-pinctrl:for-next 49/71] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202512051521.JaWxQuHY-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
head:   666065caa31aeb812978740bae21871067bb14b6
commit: ea2bfb853b15f01b6a24e3fb020feb1c0568873b [49/71] dt-bindings: pinctrl: Convert sprd,sc9860-pinctrl to DT schema
:::::: branch date: 19 hours ago
:::::: commit date: 4 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251205/202512051521.JaWxQuHY-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#8: 
valid for the the sleep mode child nodes wasn't well defined. The schema

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
