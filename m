Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E234B35839E
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633115; cv=none; b=lS2+2Pf6wJnkG3zHK7vy4jfWMTLMteCxlD/lMQtqln22PI/KmKTYHSqm6VedXzomQOku9Ody4RcSSJpY2J6rz6FSOfcpkaDVwXu8+f7n2OfWPFWxoVvdH94NiMlMM4JDS3qHWAnoYlKDqMyieNRtj8snX20/IO2+4ft3OE4cH4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633115; c=relaxed/simple;
	bh=aWmOQQ7E0G0e1no/LgumDAKrkcKZPvAyCDGyS9LB1tU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lMICwY7AaS+gpQKwdAwc1ANumrU7cpLmT4X8sz33O2jV2cqZVH4roPFzGruaGUzmYi++nBgpYP3on297UrPFEux9gD2bP8ddvGoPrzo9NHzk3gt0JwuqlTN9VyhC06VVWpRj9SGBGM/+WUvg7qWS6dlpeOAxna3ia91FzDyTnWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFgLKuaZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFgLKuaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786633107; x=1818169107;
  h=date:from:to:cc:subject:message-id;
  bh=aWmOQQ7E0G0e1no/LgumDAKrkcKZPvAyCDGyS9LB1tU=;
  b=bFgLKuaZDmxBq0Jy77lPbsfZ8akJLIyxQ+HYkSsHSk5VhkdQUGw5lRkf
   /jAoJNWc7AbaPH7nbT/gm+aR8GPcVQjyaQ4BgZR3aC0BaG5SvKVZLgod5
   xzdyjstcKH67a2WZHN4/pyvoodt5XzzPpLQlHsl3/yLVaPDowoYq/3nry
   LiJvTMTWeK1Y6pScJ1QpWBRTsWrOmaVe/t1S0WHhX2gdyL6R5n8UEhfFa
   cOHhRF9YlreSky2GeUYPNMtiZj3a50yGbJ0UqQgX9hmHQDqtSKQ6mAn4U
   dBQirCxvxfnN+eCBfdPeDspE1KWHlX2qdpULJRIFiEWHR20ZHRZaqPqh9
   w==;
X-CSE-ConnectionGUID: AuWQ5gYQQPmkHHb8Bt8UZQ==
X-CSE-MsgGUID: 9WV0XcyCSte807IKMwY1jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="91084257"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="91084257"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 07:58:24 -0700
X-CSE-ConnectionGUID: 7IH1WRpiQuuM0rxUemg3KQ==
X-CSE-MsgGUID: FBEyweH7RyWvM3y0eHflqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="264544610"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Aug 2026 07:58:24 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuWsr-00000000VSj-3SZ8;
	Thu, 13 Aug 2026 14:58:17 +0000
Date: Thu, 13 Aug 2026 22:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/health/max86150.c:304:29: error: initialization
 of 'int (*)(struct iio_dev *, struct iio_trigger *)' from incompatible
 pointer type 'int (*)(struct iio_trigger *, struct iio_dev *)'
Message-ID: <202608132209.17bCFDJl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Md-Shofiqul-Islam/dt-bindings-iio-health-add-maxim-max86150/20260812-204159, commit: 7d9142d14851b3e733c74294fe4ed3b8c0fe2714"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Md Shofiqul Islam <shofiqtest@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Md-Shofiqul-Islam/dt-bindings-iio-health-add-maxim-max86150/20260812-204159
head:   00cabb4834486f0cc65da13ea376d37ce0b55283
commit: 7d9142d14851b3e733c74294fe4ed3b8c0fe2714 iio: health: add MAX86150 ECG and PPG biosensor driver
date:   26 hours ago
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608132209.17bCFDJl-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608132209.17bCFDJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608132209.17bCFDJl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/health/max86150.c:304:29: error: initialization of 'int (*)(struct iio_dev *, struct iio_trigger *)' from incompatible pointer type 'int (*)(struct iio_trigger *, struct iio_dev *)' [-Wincompatible-pointer-types]
     304 |         .validate_trigger = iio_trigger_validate_own_device,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/health/max86150.c:304:29: note: (near initialization for 'max86150_iio_info.validate_trigger')
   In file included from drivers/iio/health/max86150.c:23:
   include/linux/iio/trigger.h:175:5: note: 'iio_trigger_validate_own_device' declared here
     175 | int iio_trigger_validate_own_device(struct iio_trigger *trig,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +304 drivers/iio/health/max86150.c

7d9142d14851b3e Md Shofiqul Islam 2026-06-23  301  
7d9142d14851b3e Md Shofiqul Islam 2026-06-23  302  static const struct iio_info max86150_iio_info = {
7d9142d14851b3e Md Shofiqul Islam 2026-06-23  303  	.read_raw         = max86150_read_raw,
7d9142d14851b3e Md Shofiqul Islam 2026-06-23 @304  	.validate_trigger = iio_trigger_validate_own_device,
7d9142d14851b3e Md Shofiqul Islam 2026-06-23  305  };
7d9142d14851b3e Md Shofiqul Islam 2026-06-23  306  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
