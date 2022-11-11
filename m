Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5D31B541
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Nov 2022 22:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668206844; x=1699742844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pGENGpssZcL9Nom35N+w2ipjygDK/TGleP+uVP8NCw8=;
  b=OILE2R+nwHbYqO9+hh2D3JSO86YSBknaJA9VHv7nWV0mOBdmZeK8K/jK
   MAGCnUkw+C0ldDCFh0DAgcF5NZ/Iy4TOjiVfbbBD4zsIK/ttoBGvHZKgy
   +Lqlrg2T40Cc8Mc7HCv2+LX7sCnXaHo93x4fQ2w0uZjtToX4vRSZzB6L3
   drL2cGzzNTHEWFNnLHXk5UVuITyHx4htkRTbmZRyE0wDxB3OTe9IS8Pig
   y9L29sRuASk2Sa0Th8aV30woOSWl2zgsrpBFt6wlldHQIuwDMypEI8HMO
   BqNWZ3glsPjXX9o8ZN/DgOIZvLtWyU6Z942w53C8+07Nhmkl8kPo3JNL4
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="397967951"
X-IronPort-AV: E=Sophos;i="5.96,157,1665471600"; 
   d="scan'208";a="397967951"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2022 14:47:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="726911353"
X-IronPort-AV: E=Sophos;i="5.96,157,1665471600"; 
   d="scan'208";a="726911353"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Nov 2022 14:47:23 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1otcny-0004L5-1i;
	Fri, 11 Nov 2022 22:47:22 +0000
Date: Sat, 12 Nov 2022 06:46:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:iomap-write-races-6.2 39/39] fs/xfs/xfs_iomap.c:
 xfs_errortag.h is included more than once.
Message-ID: <202211120640.Jd4qEc7C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-write-races-6.2
head:   ae19972d368b6a3d9ea239c6c77411ce0ecfcc00
commit: ae19972d368b6a3d9ea239c6c77411ce0ecfcc00 [39/39] xfs: add debug knob to slow down write for fun
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_iomap.c: xfs_errortag.h is included more than once.
>> /kbuild/src/consumer/fs/xfs/xfs_iomap.c: xfs_error.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
