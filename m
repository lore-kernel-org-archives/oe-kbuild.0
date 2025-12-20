Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C812DC78C
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 01:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766195857; cv=none; b=n8pFiPG6WjNWBFRaJgFhweaRl+CvBhyqmcuKiDnotJVnJ/ROqO98Xvm/kCO6bM29aiO4RsKTx7r3NNXzefe3asILJ9PUISMvcLHHJrghOimri/4Ll/v3q1LXV8Zb9LtEbul9u0ErDF3EAu2eZzo8PyIZ0W7n2xIpdPrV0Zrz1Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766195857; c=relaxed/simple;
	bh=FqH0txYdR03UuWfC7p/gZagvAUP/ARYxys0JYQZOpYU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S+MdafTGj5qnTKzCIjcIay3HA5pnqAarQM00UasWgeEx7kcXcM2JGHnHDS6/z9CFfAbhvoq5BR/HTNbnd84YJ2IUFrud9ApdeplV49VNVRfReDrLXDqTqGbKdvcw3/MnW3hECbgT6CyZ6S/E61yqKeAhN2xWQIF1WdvUfCacvWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJ9U0jUG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJ9U0jUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766195856; x=1797731856;
  h=date:from:to:subject:message-id:mime-version;
  bh=FqH0txYdR03UuWfC7p/gZagvAUP/ARYxys0JYQZOpYU=;
  b=BJ9U0jUGi8cMTCN39Y7/NuGPdYpiYw8BjP8sX7svjoJL4VAZDhCunZD7
   CPVBl3RZ9YzAPSTusoV5InlBVBbXtoQww6AHHCdhgzQTJth1PlzGhzQzQ
   I0iJHrzl3DRk3zdARaB/inInrbqVujODA/ObLovyYndtuDwZ8bKd8qj7A
   GTAR0+bvQ9l2dl2SCqUvrBSR+UoiXlydG6UlBvQbYOY00a4AHlZQf2155
   OVpFQdIywJNAYkzd19kdFE9tUlZ9tkqmWdtQxFDgLGJcagNyCvGvegBZ5
   KKaWJZ2/1/O81q5H3jfHAvuykfvNYpApICL/Qb1fpcr7QXCf79+yz1dbq
   Q==;
X-CSE-ConnectionGUID: qPOfCsvsRW68Efq4NWHYsA==
X-CSE-MsgGUID: JwUbh5A2SVy9l8w9EOReFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="67151773"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="67151773"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 17:57:33 -0800
X-CSE-ConnectionGUID: +CrsiQXiQIeKip9pItvLgQ==
X-CSE-MsgGUID: JOVh2PRATDuT2gL9M42x3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="203154978"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 19 Dec 2025 17:57:33 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWmDq-000000004Se-07sI
	for oe-kbuild@lists.linux.dev;
	Sat, 20 Dec 2025 01:57:30 +0000
Date: Sat, 20 Dec 2025 02:57:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/gicv5-full 79/82] checkpatch:
 ERROR:SPACING: space required before the open parenthesis '('
Message-ID: <202512200203.lMp5diDt-lkp@intel.com>
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
TO: Sascha Bischoff <sascha.bischoff@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: 68c9d49d6ae8b462ac80a902806969a43ac20de0 [79/82] KVM: arm64: gic-v5: Plumb in has/set/get for sysregs & IRS
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512200203.lMp5diDt-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#35: FILE: arch/arm64/kvm/vgic/vgic-irs-v5.c:515:
+	switch(offset) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
