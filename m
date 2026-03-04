Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C52C36BCE5
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630975; cv=none; b=UZlMxq6o3mfgzhow9/7bw2ZgkZw3cFApYfZqKHsUxQ7OGdeI/pzUlIHmGeZCwdAAfWYxNJcq3dfnoPeR9Ilf6p9cWiLpAQXE9UYHC/ajuzhjiEOw+U+WYzyuSE3ACzVSWUKNR6QPTx9jITqreyDPkNF4jn/XZULQd2kfhlwp5xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630975; c=relaxed/simple;
	bh=if3gwkhGQOjc5bepedg/Lb0zaIGoo5fZ9FUHeUaSYGc=;
	h=Date:From:To:Subject:Message-ID; b=gnQhZbZYE6zOQ8j/+tjdOQGJ2C1BcGDiw5ROP+dik49A4H/wztfzKwwIE0LY+sqBAneSNweC8Krm2xTTiIwpv51uvMWc+9pWlxB/3Wu0zyiGHb1E8zY9NBoDoYMQW+oRBus9HAV3oelm4+lDmL+LorcgKtInB1Hwcfvrec6pwT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpBsV2zq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpBsV2zq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772630973; x=1804166973;
  h=date:from:to:subject:message-id;
  bh=if3gwkhGQOjc5bepedg/Lb0zaIGoo5fZ9FUHeUaSYGc=;
  b=HpBsV2zqr025yMThju6UUIh8F+q9lGJYUQNuNWZRaHTd3mVHkObYTc3B
   UVi5m9TMKTDYN1Hrn8e7wk0AXwBKolqFZaqDyEKJbUVh1GmYcBj0qIs/h
   1ISV5CSgkS9sXTHGdcR57Uqhtn6m8Gfh27Qr5C+Sn8lf1YDVN8IbbT7/m
   FC4bzFDh9OLjdY+H/cwzl98gXpvYol5XYbgWt/geHeW6VuxMvu+m78mTk
   nmIVkRdXJq3H0Yu8D28y+sKsAhZ+jiJmrWwDWrSt8aVF94y4aQkNF7KHB
   ql5VfItyIBjSihj2c6dajP436+CgkJJ4gHI/Rcu7wKue3EDVvvdZLm75V
   Q==;
X-CSE-ConnectionGUID: tyGI+9jORFmr619M87uiDg==
X-CSE-MsgGUID: 99Ykoyq0Tli9kDp8byX7uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73816011"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73816011"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:29:29 -0800
X-CSE-ConnectionGUID: JoZ/yrNrRgKITxJd8WNuTg==
X-CSE-MsgGUID: f6vHwipSQbaZhy9O5LXhYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="216653447"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2026 05:29:29 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmI3-000000001hm-1Qvr
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 13:29:27 +0000
Date: Wed, 04 Mar 2026 14:28:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal:dedup-lsb128 5/11] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Claude:claude-opus-4-6'
Message-ID: <202603041439.VxYLCSZf-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

Hi Sasha,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git dedup-lsb128
head:   925cdd8d45fb4adec025cfe8e42abfa0dafa9a46
commit: 9f66c261b9c22de488df0cacf08ca6a318cdd711 [5/11] kallsyms: use shared leb128.h for lineinfo encoding/decoding
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603041439.VxYLCSZf-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4-6'
#24: 
Assisted-by: Claude:claude-opus-4-6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
