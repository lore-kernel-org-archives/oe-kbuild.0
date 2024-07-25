Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC771D530
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jul 2024 05:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721886354; cv=none; b=S+ig39Cf1gSy124tIXCEEB5Kzk5pLWeaN54BG+3S0GD5ZHFBdZViLGhEjEzWAH6jE//efSoGONOtmLIapn1gajj/sWVC3yb1JiAf8riIGVY3g8tjAb557M/QNfgK2949WLtM9iS8/hKUsjrMUkWrR3hJk2p2xKRq18w9c0HZj4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721886354; c=relaxed/simple;
	bh=rgXriPhetUT3vizB0Nkk6XJG7dSZ96+WRrRzcpwqnd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oiTDvNIwGlIdl+DnMrjWCWzDFWKe2fADrqGiDUCXmevgt3q6PYBn5bUPiU3aBLiGcJu+eLsynKFh8LTu26UTKlHWOnV55ttUF1iTCwspbyUoXecO4JMA7ppwYs5FAw6ksQgbzF8kiigUn7Vo9zIGQpi7aaisdbFpGlLciQYcSXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kj5JsMxt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kj5JsMxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721886352; x=1753422352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rgXriPhetUT3vizB0Nkk6XJG7dSZ96+WRrRzcpwqnd4=;
  b=Kj5JsMxtI2yzfBO5F/nsWJUh+Zmbp6jH22OAx1wVaqFoT5Fe0MApD4b1
   5wLaK6zPli3IxulHrb1aEa9sC7JEQa7+Q1vXtm2TMDrd8HyNzg7C72CCc
   NXyqXfiGceAM43X70tXa9bGa255MzGLsJo9fAIkumzVrhbPBWbqPWx7mQ
   2PqkOei7n8BuEf0ypbczvfh2SYRiLRJeNkPWmIOJMMjrtGSuxoZf4MstP
   yOIR/Y2Qg61XSU8H8hptoFHqVC54mmJxZpqwwvWENDJ31mvqPhAQkw7Ns
   PbjLJ7f0Eo0pD2A+VlIRWKIJMQQPAsuVxRjP2ZTZzCxvP3G5kplYtZAjC
   Q==;
X-CSE-ConnectionGUID: Hg6Q7dlvRvK3i8n6Ago/rw==
X-CSE-MsgGUID: +e+nJwy6SYG2cxXSAMhqHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19295601"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="19295601"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 22:45:51 -0700
X-CSE-ConnectionGUID: oGbGyP7tTF2j5A6FWvux3g==
X-CSE-MsgGUID: X88hvyk2S3ynTYb+WtBeJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="56958543"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jul 2024 22:45:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWrIS-000nng-2N;
	Thu, 25 Jul 2024 05:45:48 +0000
Date: Thu, 25 Jul 2024 13:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-params-cleanup-2024-07-24 22/23]
 sound/soc/codecs/zl38060.c: sound/pcm.h is included more than once.
Message-ID: <202407251322.z21lPOEh-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-params-cleanup-2024-07-24
head:   eb5b1e5f3f2b93ad4fded2027de7e3bfe9129e0a
commit: d3caff0b57b2b132e7e651974a1584da6c2f5ee6 [22/23] hoge
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407251322.z21lPOEh-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> sound/soc/codecs/zl38060.c: sound/pcm.h is included more than once.

vim +25 sound/soc/codecs/zl38060.c

    24	
  > 25	#include <sound/pcm.h>
    26	#include <sound/core.h>
  > 27	#include <sound/pcm.h>
    28	#include <sound/soc.h>
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
