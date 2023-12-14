Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950511401A
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Dec 2023 07:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8VPbp8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702540702; x=1734076702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1PHBNsCA6A8JlIeD8wrHdPrEu0jp7QRWpaW9u3itpxk=;
  b=R8VPbp8PH2noi8zqNgWC86+R6M+Bbo9NexjQ0sws/0pJTACsdDOx+C/R
   pevaaKqecOY198Ney9OXUeftCfvN2k2JGIsCyQ0+EnA/wf+UIpchcKVV7
   xzlf1Oww9JNJNIX74flhwcTJx9yGLU3KWlFwPToBQ5KZYykAIg4RsMITv
   mX9iff3ShkiYKzh+9YQg65mtMul4AmJO9oBqIVGNSk8QjEyHHPizs/sHJ
   B3fkMVWdlEK05AHNpiMedWW5T0asizGBV+LtHA/q+yix7DIybshl/Z0cp
   9A/f6tEtV5YW4UoOIip9kSHMrdjDcrTR7H7AcM4e27jjOiSv9XnIHgC+d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="393956311"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="393956311"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 23:58:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1105604317"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="1105604317"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Dec 2023 23:58:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDgbn-000Llz-1H;
	Thu, 14 Dec 2023 07:58:16 +0000
Date: Thu, 14 Dec 2023 15:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/display/dc/core/dc_resource.c:826:15-16: WARNING
 opportunity for max()
Message-ID: <202312141534.ooO9UcrS-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Wenjing Liu <wenjing.liu@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5bd7ef53ffe5ca580e93e74eb8c81ed191ddc4bd
commit: 0f3b9542c9774a2c2ef0fc76387bb48c8fc46b36 drm/amd/display: Refactor recout calculation with a more generic formula
date:   5 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-104-20231214 (https://download.01.org/0day-ci/archive/20231214/202312141534.ooO9UcrS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312141534.ooO9UcrS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312141534.ooO9UcrS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/core/dc_resource.c:826:15-16: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/core/dc_resource.c:828:15-16: WARNING opportunity for max()

vim +826 drivers/gpu/drm/amd/display/dc/core/dc_resource.c

b2d0a103e6a0a8 Dmytro Laktyushkin 2017-03-01  817  
0f3b9542c9774a Wenjing Liu        2023-07-06  818  static struct rect intersect_rec(const struct rect *r0, const struct rect *r1)
4562236b3bc0a2 Harry Wentland     2017-09-12  819  {
0f3b9542c9774a Wenjing Liu        2023-07-06  820  	struct rect rec;
0f3b9542c9774a Wenjing Liu        2023-07-06  821  	int r0_x_end = r0->x + r0->width;
0f3b9542c9774a Wenjing Liu        2023-07-06  822  	int r1_x_end = r1->x + r1->width;
0f3b9542c9774a Wenjing Liu        2023-07-06  823  	int r0_y_end = r0->y + r0->height;
0f3b9542c9774a Wenjing Liu        2023-07-06  824  	int r1_y_end = r1->y + r1->height;
5bf24270d1ccd9 Dmytro Laktyushkin 2019-12-13  825  
0f3b9542c9774a Wenjing Liu        2023-07-06 @826  	rec.x = r0->x > r1->x ? r0->x : r1->x;
0f3b9542c9774a Wenjing Liu        2023-07-06  827  	rec.width = r0_x_end > r1_x_end ? r1_x_end - rec.x : r0_x_end - rec.x;
0f3b9542c9774a Wenjing Liu        2023-07-06  828  	rec.y = r0->y > r1->y ? r0->y : r1->y;
0f3b9542c9774a Wenjing Liu        2023-07-06  829  	rec.height = r0_y_end > r1_y_end ? r1_y_end - rec.y : r0_y_end - rec.y;
0f3b9542c9774a Wenjing Liu        2023-07-06  830  
0f3b9542c9774a Wenjing Liu        2023-07-06  831  	/* in case that there is no intersection */
0f3b9542c9774a Wenjing Liu        2023-07-06  832  	if (rec.width < 0 || rec.height < 0)
0f3b9542c9774a Wenjing Liu        2023-07-06  833  		memset(&rec, 0, sizeof(rec));
5bf24270d1ccd9 Dmytro Laktyushkin 2019-12-13  834  
0f3b9542c9774a Wenjing Liu        2023-07-06  835  	return rec;
0f3b9542c9774a Wenjing Liu        2023-07-06  836  }
0f3b9542c9774a Wenjing Liu        2023-07-06  837  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
