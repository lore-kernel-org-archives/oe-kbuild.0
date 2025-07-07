Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7E2634
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Jul 2025 00:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751846825; cv=none; b=cTp6T6PUdYljLHs15bVOU4rtANUYuxgbPAnyWpFyCbX2QkPx4H+dKBUT2g/gpjmX/Q8/Gir7u/60IHxh6PfOx1DNPKlzmfTHDgjM0apUQMjFaMowdUsCUBJIzJl1gsGlyi3MKgvQ+0Nih9UV9aEChtRmDkuM+YJArFDGTKF2RTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751846825; c=relaxed/simple;
	bh=kbsx+vz/LIgtzHW0ZUb+PuCOUykQE/kt3SH6/bTxk3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hF+9y9og/QE42r9ukwJ6Wcg22lENb/KxepMhSBdHLVXOkC2jrbJlwuBuNn0nRJyiDknDKrVq77PyiI45MUOVHmhnLL8W2FbBrDI0nYfli+qqHNy7OofLAq5GcIKgGA6ZxDbKF1iD+ZSipyy6yztsFsQbRyzUYwrIRCmBCTAhyUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2H5wpcL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2H5wpcL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751846823; x=1783382823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kbsx+vz/LIgtzHW0ZUb+PuCOUykQE/kt3SH6/bTxk3k=;
  b=M2H5wpcLu2cGN+zAz5wRbH9dUKY+9Aku2nP3esvuX1C8E9swqPOud7pk
   HVieKdX7HUdIboSTsTXfzyJe65aDJNAclpEYV6tRZKKybTSyjUO6o01Zq
   gPhKFFD0wt6RYLFIhZk6eMgA9aYYzhxmFv8hubNh3vL8UQjX3g8tm5yX1
   ZsPrkUPk64SGHwCd3vY/Zu7ekB1uZc+jbX+LjbcXio4PICZgXA1KhkxR2
   C17NrSpCkqRNdhb2DE2VX90kGjZTYDo6IRQn1fBM4y1jWqgmvhWF7+G0A
   YtPOK7TQfjpb57Cy8wHWf9UWJGqrkJ5CtEE+nSfEeWoVa5VQp7Zc5rKiS
   g==;
X-CSE-ConnectionGUID: hs2+haXgT4WjO/80sbHYSA==
X-CSE-MsgGUID: mbGeLxd1Rd62lH1MY+U02A==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="54184779"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="54184779"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 17:07:02 -0700
X-CSE-ConnectionGUID: xtUUvSD/SRWs/bJKiWukgw==
X-CSE-MsgGUID: xWmHGmk2QW2SRwBjHi2VWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="160617061"
Received: from lkp-server01.sh.intel.com (HELO def1aeed4587) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jul 2025 17:07:00 -0700
Received: from kbuild by def1aeed4587 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYZNq-000067-1j;
	Mon, 07 Jul 2025 00:06:58 +0000
Date: Mon, 7 Jul 2025 08:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/4] media: mc: entity: Add pipeline_started/stopped ops
Message-ID: <202507070720.I8Zn0hOu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250702-pipelines-v1-3-34525973e773@ideasonboard.com>
References: <20250702-pipelines-v1-3-34525973e773@ideasonboard.com>
TO: Daniel Scally <dan.scally@ideasonboard.com>
TO: linux-media@vger.kernel.org
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Daniel Scally <dan.scally@ideasonboard.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c0b1da281d84d33281fc49289f0c7f8aada450ff]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/media-mc-entity-Move-media-pipeline-entity-iteration-functions/20250702-231706
base:   c0b1da281d84d33281fc49289f0c7f8aada450ff
patch link:    https://lore.kernel.org/r/20250702-pipelines-v1-3-34525973e773%40ideasonboard.com
patch subject: [PATCH 3/4] media: mc: entity: Add pipeline_started/stopped ops
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20250704 (https://download.01.org/0day-ci/archive/20250707/202507070720.I8Zn0hOu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507070720.I8Zn0hOu-lkp@intel.com/

smatch warnings:
drivers/media/mc/mc-entity.c:1073 media_pipeline_started() error: uninitialized symbol 'ret'.

vim +/ret +1073 drivers/media/mc/mc-entity.c

d10ac51e8a047e Laurent Pinchart 2022-12-21  1061  
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1062  int media_pipeline_started(struct media_pipeline *pipe)
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1063  {
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1064  	struct media_entity *entity;
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1065  	int ret;
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1066  
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1067  	media_pipeline_for_each_entity(pipe, entity) {
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1068  		ret = media_entity_call(entity, pipeline_started);
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1069  		if (ret && ret != -ENOIOCTLCMD)
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1070  			break;
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1071  	}
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1072  
7f47ae4f5bd7ac Daniel Scally    2025-07-02 @1073  	ret = ret == -ENOIOCTLCMD ? 0 : ret;
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1074  	if (ret)
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1075  		media_pipeline_stopped(pipe);
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1076  
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1077  	return ret;
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1078  }
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1079  EXPORT_SYMBOL_GPL(media_pipeline_started);
7f47ae4f5bd7ac Daniel Scally    2025-07-02  1080  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
