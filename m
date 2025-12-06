Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722B74A02
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Dec 2025 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765032366; cv=none; b=cMNtdhiYDjPAo5Dq8uJB73wBlY0SkUQL8w4uChW+mQy8HhvadUZGnCf4omyzwKR631mdJrvzrAeP1O+4KDYV+Lm3C1Cvby48C0AYOgT/i78ZV890zvlj9zmN4tTmt6I8OHyc+aLQNNj8pl4ZYjMSk7/8Bpj3Uc18+9HNAHJbe2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765032366; c=relaxed/simple;
	bh=ZIfU7EqWORm36D10Ea/8G9IZ+BAeNlECoemZY+BxxL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u53OG/FR2JG8ovpWyOif7O5yjPyDDt9L9KlDGSzlxEsn3XOImKhJDV7TX+sGCBa2fDlICfWGhQcvnfymGqaz/AsvVsNc/aAQ27PhXb2QFWrk4dWddEhN/wbIEnX0/I73R8pFowa4qDeKVNOdRwLSTQiWHOXtygjdhIMu7nqkolg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBhXZlzJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBhXZlzJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765032361; x=1796568361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZIfU7EqWORm36D10Ea/8G9IZ+BAeNlECoemZY+BxxL4=;
  b=bBhXZlzJ6+LzVo5fvgEBCJhKZV3OTtucN97QJbgP174MCVSlYGd4xxYs
   XMOt6Oc73Km1SMnywPq42+OBLQpdypesowl4leWS7tuVCeVe0DdHVyFHX
   WT5jSC0sG83w0DELrmfYLqbPof+Y3R09QIDnHmEz5IeFaX+CKhghtkjp+
   pla3hfTDOSrg59qFUYs/kBgeAA+HZLUOTUl9Nm0PYnfrYJ7njbppb4iDZ
   GWMfQa5nnTVGuXFZgAUNKnWFDVLJqYKucrbXugSrT6NlEU9gZQ+oRag/J
   QqT4mkVu3HUZpPr7zTWPD/87O8Uwflrji0a4f9A9xAUcvaF6xJwmh13Ep
   g==;
X-CSE-ConnectionGUID: 3LJmk6QXTBiz0eihS3nUig==
X-CSE-MsgGUID: eL8YfZQJQdyyz86qhCaqEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="78397463"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="78397463"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 06:46:01 -0800
X-CSE-ConnectionGUID: xnwNmuo0RQKbzHOnR5r8lQ==
X-CSE-MsgGUID: 6WuMbjukTZ6LgIFO89AJaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="226553692"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Dec 2025 06:46:00 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRtXp-00000000IFx-2aF3;
	Sat, 06 Dec 2025 14:45:57 +0000
Date: Sat, 6 Dec 2025 22:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC 4/6] iio: light: vcnl4000: Use cleanup.h for IIO locks
Message-ID: <202512062242.bnBU8Sfs-lkp@intel.com>
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
In-Reply-To: <20251203-lock-impr-v1-4-b4a1fd639423@gmail.com>
References: <20251203-lock-impr-v1-4-b4a1fd639423@gmail.com>
TO: Kurt Borja <kuurtb@gmail.com>

Hi Kurt,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on f9e05791642810a0cf6237d39fafd6fec5e0b4bb]

url:    https://github.com/intel-lab-lkp/linux/commits/Kurt-Borja/iio-core-Match-iio_device_claim_-return-semantics/20251204-033346
base:   f9e05791642810a0cf6237d39fafd6fec5e0b4bb
patch link:    https://lore.kernel.org/r/20251203-lock-impr-v1-4-b4a1fd639423%40gmail.com
patch subject: [PATCH RFC 4/6] iio: light: vcnl4000: Use cleanup.h for IIO locks
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20251206 (https://download.01.org/0day-ci/archive/20251206/202512062242.bnBU8Sfs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512062242.bnBU8Sfs-lkp@intel.com/

smatch warnings:
include/linux/iio/iio.h:711 class_iio_device_claim_direct_constructor() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +711 include/linux/iio/iio.h

847ec80bbaa76a drivers/staging/iio/iio.h Jonathan Cameron 2009-08-18  707  
a24a579f7db124 include/linux/iio/iio.h   Kurt Borja       2025-12-03  708  DEFINE_GUARD(iio_device_claim, struct iio_dev *, iio_device_claim(_T),
a24a579f7db124 include/linux/iio/iio.h   Kurt Borja       2025-12-03  709  	     iio_device_release(_T));
a24a579f7db124 include/linux/iio/iio.h   Kurt Borja       2025-12-03  710  DEFINE_GUARD_COND(iio_device_claim, _buffer, iio_device_claim_buffer(_T));
a24a579f7db124 include/linux/iio/iio.h   Kurt Borja       2025-12-03 @711  DEFINE_GUARD_COND(iio_device_claim, _direct, iio_device_claim_direct(_T));
a24a579f7db124 include/linux/iio/iio.h   Kurt Borja       2025-12-03  712  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
