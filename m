Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DEE1096F
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Feb 2026 22:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771797738; cv=none; b=Id6fokQs1XHgih4iKccY1IranLXCU0xb/pH4DC+5cOwGG0DrgGk8+ft6W4ZQ9JAKaTXwiJi2mxVe1TJ/E/WdblBLb4NpEXDbH4k/W5ZPrnvjt/9utXnfG3tqOXp+6mah1etCF+dyPeq4zD0SnioMt1uQEk1Ab7TcnKHy8EHbE14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771797738; c=relaxed/simple;
	bh=91xaVHOYqujEIsmtrrhMNKcenG4N+ga6NwRC/RN+dtU=;
	h=Date:From:To:Subject:Message-ID; b=QDTL/Dgwdsw27cnc1PrulKyHdgN7khgcymwB51A1K7mmLaPsIhsuYgVfQSwKcUDcQb6mbwWWXN+mI28U5gMJwi3k5+1+psYSDwkE6+fR9FLShg0s0UhvMEIJQzTG1i+BV1fyTnNyYBvyuhUWH0HBKJ9kktfkONGsPG3IhImW8T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miRGJk/t; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miRGJk/t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771797738; x=1803333738;
  h=date:from:to:subject:message-id;
  bh=91xaVHOYqujEIsmtrrhMNKcenG4N+ga6NwRC/RN+dtU=;
  b=miRGJk/txPXNHRvaP4Q9MjOyM2p+eRH7zkVJI1KcLoeTyYmdlgDNYiki
   ajJwmn7E4N/XIsvJdAGzeMLbP/OUQftSi006h/z4byBpQ4XN8ZxElSUSo
   qzlwobmgtsluMimCVPazBjfuBzHFQrn5vOQU9VXMg1wiIhq/ZZ27ENisN
   BT360KqZ/24IpZgICKLKmXYI+CMs28ORsC+qLPzC7oUQ1ITruPxEW8Zg7
   XOk6hFm1fbLSv+m6t/S1lSAE5IfBAywjakikGYhXPowBS9l/+8jHlSQly
   vtr2DK3Eg0vDJFbkbrqRuhlJxyIVz3OcpwmoDzYATzX+WdejqlHOg7pz8
   Q==;
X-CSE-ConnectionGUID: 3KAvICfhT3G5wemk3YKGYw==
X-CSE-MsgGUID: P6Kx10J5RJCa35ISAU619A==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72503101"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="72503101"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 14:02:17 -0800
X-CSE-ConnectionGUID: rU5F5cabTCqg7c2OWtIvTw==
X-CSE-MsgGUID: QcXR/7E5QiO/HV8q6Fl/kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="214615366"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 22 Feb 2026 14:02:16 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuHWo-000000004iz-0Vyb
	for oe-kbuild@lists.linux.dev;
	Sun, 22 Feb 2026 22:02:14 +0000
Date: Sun, 22 Feb 2026 23:01:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 38/46] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner
 <tglx@kernel.org'
Message-ID: <202602222339.oROLsy4d-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   108074eac008632e059c777dbc8ad2a16c39972f
commit: 9d20d1c5d8012872b3c3b7c6e8685fab108c928a [38/46] hrtimer: Avoid re-evaluation when nothing changed
:::::: branch date: 35 minutes ago
:::::: commit date: 35 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260222/202602222339.oROLsy4d-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner <tglx@kernel.org'
#12: 
Signed-off-by: Thomas Gleixner <tglx@kernel.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
