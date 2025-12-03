Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C8F331A7F
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 19:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764789457; cv=none; b=HAgyd8Tz5anpyAnDQ/3H/IzaYwm/7ybkPGhaWc4GN7kUht4XWQRH2bkcHlo+K7BLLy4Qa+RB3z6wWGvYEENn/6KOTHXMAPZfsvDfuJTtSBoj+ISj7qCdUQDpvQPilJYoeQmniGrauwuCqU6lwF/7qTE7f9BqYNlnuzJgVexk13M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764789457; c=relaxed/simple;
	bh=JvdgekuvtRTVAbD4EdciTwlYR/GkphnwDejtnRQinK0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UURPbJpKxyVgAShYQPZnzKvCEvlLMiIsk6IUpEktWRgeGkVXnWos9fgPd0d1+LW8gfmSy+lE2oZrqAgDRfqm2Z47TKRNa2aaNc11r7DYGFelQYV0RIl4F9sjAxQtKe9AqzRqd6SlfQgl+oLoZvpZ5WAxWDZhQZn92o0TKUvl+S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISdpgOTT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISdpgOTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764789456; x=1796325456;
  h=date:from:to:subject:message-id:mime-version;
  bh=JvdgekuvtRTVAbD4EdciTwlYR/GkphnwDejtnRQinK0=;
  b=ISdpgOTTkg/vCI0BdMWCq66ZIwABsDeCka83HuhLklYZJuSUn7NHxghs
   X+02YylVgAr4lWfMGK7FBKf+swnv9aTrvg6CEB4Cc0MH4i3JcFlyRmjyO
   x+1ZKz17yEkclZOPvPMBU+sTwWrZQs6tYoGPWQJuHlvJx7bdKkYTm3m9I
   /0WyNgarUBNPNfPcUtcC+ZH6H2xspESEHtMBw4zCHEhyv978PvDGh8MLk
   y6yUiRbqX6FOq1JCzauOUQp6Z9Psljh8qeZxxoFHYj9PJ+SdGQPRfL87n
   K0PkI/KqEvafFnEzWwmuTIpkFu4GCDxGrgRgHhITSiloBV1od3+I4cbfh
   Q==;
X-CSE-ConnectionGUID: V8bN8LEySx2TxI18H28R+Q==
X-CSE-MsgGUID: +H6eFo/7SJO0SF6x5O++yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70652197"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="70652197"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 11:17:35 -0800
X-CSE-ConnectionGUID: vlaR5qDQRnuvGj7QJGvJFw==
X-CSE-MsgGUID: xBFngD4YTaqD/DjfMxSwTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="193847230"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 03 Dec 2025 11:17:34 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQsM0-000000000X1-0q4s
	for oe-kbuild@lists.linux.dev;
	Wed, 03 Dec 2025 19:17:32 +0000
Date: Wed, 3 Dec 2025 20:17:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [brauner-github:vfs-6.20.mkdir 1/1] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202512032036.2d1zOAcV-lkp@intel.com>
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
TO: Jeff Layton <jlayton@kernel.org>

tree:   https://github.com/brauner/linux.git vfs-6.20.mkdir
head:   7d91315b433560489a017af66c27f4b945e434e2
commit: 7d91315b433560489a017af66c27f4b945e434e2 [1/1] vfs: remove the excl argument from the ->create() inode_operation
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251203/202512032036.2d1zOAcV-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#749: FILE: fs/ufs/namei.c:73:
+		struct inode * dir, struct dentry * dentry, umode_t mode)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#749: FILE: fs/ufs/namei.c:73:
+		struct inode * dir, struct dentry * dentry, umode_t mode)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
