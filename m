Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A276E29CE5
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Sep 2024 04:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726805310; cv=none; b=KRIfQ7D1Ib+55Cz+ZaHXDibItegmMtpcMyd7hfivUczbeECpg7gSDf/FyLsOp9vy5DhceQz387dOBnXmy09Kvol0Z6Nr4eCjTaTDT5ClrUx+gSG1/HgrvALN256eeIDloFHNZd7R+eiQPms6ogERgjW+/pYtDhpeIE2jVzsuX7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726805310; c=relaxed/simple;
	bh=0Mh2oxvFa5AlGsHeabdPzVqThORkuPSkNpGRhc2vwrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ab1dUZFErN1DlGA+nSfZwOckuABrRfKYXkveuWdh2XIaJY/Yp+kPKz8kmLDrNy1gtOr+QwTMm1fHh9pIcswJ5ktaYNIoO+G5W4w4wBU/LfiHjaOqasinR80Z1OGMOmCUAm27nYlHRcMWX9YkZKZ/ZN2iwuGkv4rlcTyiVSWBNeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPk2zJGj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPk2zJGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726805307; x=1758341307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Mh2oxvFa5AlGsHeabdPzVqThORkuPSkNpGRhc2vwrg=;
  b=JPk2zJGjG/8MjF6+MBSQMw1MOG7nMZoiRRsuZNpSXHZpmfTLoDTCRTA0
   hP3NezygYLKmi9Agc0M0MmjIlFylzMhLT4i9BISRU4XO5x1SBoiCDkYpI
   M1CvpXzaC0993tbixQqg4JjopaN3Ry3CZp+caqeFwd9YRLYu/Plp2CiUv
   osOoN2Z0GKOD4d574r03XDjI3hBgJv7/jNWS4F46mQoSPuZyzjrfrLIkb
   y+JuBiyToiVj7Nd1vyz94kkf2Am969culEUhRbVqIuLhUY/N/IQfr/lZl
   Jwg/WkV2PzIsoxkZA5haZ6ewTgbTLFgVvL9sc46/zQTqk8derLvtYJdmJ
   Q==;
X-CSE-ConnectionGUID: ACNBk0N+TheebhkkD4Qopw==
X-CSE-MsgGUID: tbViF01jR2S3doJUc/kXEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="36932731"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="36932731"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 21:08:27 -0700
X-CSE-ConnectionGUID: 39lYlgmhSQiiqfSjItbR8w==
X-CSE-MsgGUID: p1q5RigOQPWGCSJ7fu9qUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="70291597"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Sep 2024 21:08:26 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srUwR-000Dwa-2j;
	Fri, 20 Sep 2024 04:08:23 +0000
Date: Fri, 20 Sep 2024 12:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-lts:4.19/android_s 677/30000]
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1098 put_v4l2_subdev_routing()
 warn: check for integer overflow 'num_routes'
Message-ID: <202409201214.doUEuMvs-lkp@intel.com>
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
TO: Meng Wei <wei.meng@intel.com>
CC: "Pan, Kris" <kris.pan@intel.com>
CC: Chang Ying <ying.chang@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: dcdab0d72b69b6291d08483c0baf62cf92e2a1bc [677/30000] v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations
:::::: branch date: 2 weeks ago
:::::: commit date: 5 years ago
config: x86_64-randconfig-161-20240914 (https://download.01.org/0day-ci/archive/20240920/202409201214.doUEuMvs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409201214.doUEuMvs-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1098 put_v4l2_subdev_routing() warn: check for integer overflow 'num_routes'

vim +/num_routes +1098 drivers/media/v4l2-core/v4l2-compat-ioctl32.c

dcdab0d72b69b6 Meng Wei 2018-10-26  1081  
dcdab0d72b69b6 Meng Wei 2018-10-26  1082  static int put_v4l2_subdev_routing(struct v4l2_subdev_routing __user *kp,
dcdab0d72b69b6 Meng Wei 2018-10-26  1083  				   struct v4l2_subdev_routing32 __user *up)
dcdab0d72b69b6 Meng Wei 2018-10-26  1084  {
dcdab0d72b69b6 Meng Wei 2018-10-26  1085  	struct v4l2_subdev_route __user *uroutes;
dcdab0d72b69b6 Meng Wei 2018-10-26  1086  	compat_caddr_t p;
dcdab0d72b69b6 Meng Wei 2018-10-26  1087  	u32 num_routes;
dcdab0d72b69b6 Meng Wei 2018-10-26  1088  
dcdab0d72b69b6 Meng Wei 2018-10-26  1089  	if (!access_ok(VERIFY_WRITE, up, sizeof(*up)) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1090  	    get_user(p, &up->routes) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1091  	    get_user(num_routes, &kp->num_routes) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1092  	    assign_in_user(&up->num_routes, &kp->num_routes) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1093  	    !access_ok(VERIFY_WRITE, up->reserved, sizeof(*up->reserved)))
dcdab0d72b69b6 Meng Wei 2018-10-26  1094  		return -EFAULT;
dcdab0d72b69b6 Meng Wei 2018-10-26  1095  
dcdab0d72b69b6 Meng Wei 2018-10-26  1096  	uroutes = compat_ptr(p);
dcdab0d72b69b6 Meng Wei 2018-10-26  1097  
dcdab0d72b69b6 Meng Wei 2018-10-26 @1098  	if (!access_ok(VERIFY_WRITE, uroutes,
dcdab0d72b69b6 Meng Wei 2018-10-26  1099  		       num_routes * sizeof(*kp->routes)))
dcdab0d72b69b6 Meng Wei 2018-10-26  1100  		return -EFAULT;
dcdab0d72b69b6 Meng Wei 2018-10-26  1101  
dcdab0d72b69b6 Meng Wei 2018-10-26  1102  	return 0;
dcdab0d72b69b6 Meng Wei 2018-10-26  1103  }
dcdab0d72b69b6 Meng Wei 2018-10-26  1104  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
