Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68BA2F99BD
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331487; cv=none; b=A9IaMpOj/xDfpFnJQ64amavfn3Y7b8F8FDyhFHthxDtuupeX56yFu6wy9C1NTwGfdCAI99xfK07bJcmyrI6LwWrUAB3sn2TVubHuSwlaR7Qpk5CbmC671y1OnKOvE3/jqK2CFnSOeLKN7nOOQUI0N6VdqtWbMcVxvGqD4h0GUqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331487; c=relaxed/simple;
	bh=kmkMvCyLkO9TD5sZNfiO96BxQa0QhDaCCrjmwVIPo48=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EpWFjodnN4rDiAftU7xMZTDe678HPdmISLH05S3+k26HDacWM1aabtNFH+BLFFsI/nINInRgm9UtEE76VueYVBH+9VyEGcV1N53wRT05OuerkTENImKhthOUd2dU/9yPw+8Oj5OXrpibvluRwSI34dCP9hxxQsm2o1VAYyvjnnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEfTh9uC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEfTh9uC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331485; x=1797867485;
  h=date:from:to:subject:message-id:mime-version;
  bh=kmkMvCyLkO9TD5sZNfiO96BxQa0QhDaCCrjmwVIPo48=;
  b=TEfTh9uCHBJzWUsJ+1k7BToVTqioGNAbJ1BgXeSJ1OIB1aT7j7NVqDIx
   7r8tDb3Mf1KgzFxRy1kTPh3jTIKgjwWuxaK1K0GXfAysDZ6iysFR+7hbN
   lVRRTjqPvFbqb2nLbBCHrn63cf0utdDuC/eQ2eypeR12OHY3wvlIFE4BE
   lGiw3Sp9kaHUFQm0xQ2ZtCuuzSmReRJHLJXvNJVJUqdyReyiadaIGDUdy
   m5f6vCOmWgrBXkH/z4PeLEnWwR605KEIbUYioO7Sspvmsyc5F2rIh09iY
   Q8C7arI2sWlESd+ONW+RS5NuRA0EW2nk/DI+96ably3hRfXqCGiHDaful
   Q==;
X-CSE-ConnectionGUID: 6AV1+KRNRQiQbdaAXY4zOA==
X-CSE-MsgGUID: q5ZAuwedTc+9h+OzV76Y+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78847502"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78847502"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:38:03 -0800
X-CSE-ConnectionGUID: ChFs0lwzSh+EcUdcQcUP8A==
X-CSE-MsgGUID: 7MqMCy9xRHifVmkuf0GX2Q==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2025 07:38:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLVR-0000000058U-0u6B
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:38:01 +0000
Date: Sun, 21 Dec 2025 16:37:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 168/246] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202512211614.QPVSCmdY-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a505a983517df0d2df38e87cb1898c518fdf9740
commit: 50f3454a529330011e41971293c783a9899ad891 [168/246] drm: apple: epic: systemep: Parse "mNits" log events
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211614.QPVSCmdY-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#46: FILE: drivers/gpu/drm/apple/parser.c:1005:
+			const char * value = parse_string(it.handle);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
