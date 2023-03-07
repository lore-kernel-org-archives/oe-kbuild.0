Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A12386
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Mar 2023 22:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678228587; x=1709764587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eRVAGaGZhbxX/utW8HUvvEtPCKruXKD70iTyg/30uic=;
  b=gJYe35luK7RXdJGq38/7+BO5YEzSbNcuR1+AzjMVahqIohNO97vIRyaJ
   j2CcNkpTgZIh3XPR7u8XLD7scoMLZ1WzZf8RCS0FGdbYwocw1ayLGmW4w
   SmtiuWKwZ++3IEjMvC0zvJaWyLPJsPwmAt7eTe8Na4YgdOIcYfdCWkR7E
   a/wtAwQ67sE465Tc+leztQfE/bxtey4wIXvxDCLsHUIO5tON0O/C68YX9
   yKWZdq2MKfKaotFrCeD8yuqrBUJOVGjrzWeu5y9VHpIDLT8zBIeOGWTlE
   2rD0dbyhVUxyhPiHA7zDy7A33nqCU7zbEyxgWkMMwKPsV1CnFyXWBk9T8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="334706983"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="334706983"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 14:36:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="626707717"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="626707717"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Mar 2023 14:36:25 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZfuy-0001f1-2k;
	Tue, 07 Mar 2023 22:36:24 +0000
Date: Wed, 8 Mar 2023 06:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [andy-gpio-intel:review-andy 18/39] include/linux/gpio/consumer.h:
 linux/err.h is included more than once.
Message-ID: <202303080608.tMdXnv3j-lkp@intel.com>
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
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git review-andy
head:   8b057bd621703dfecadf5b32be01338824067d4b
commit: 380c7ba3923c6e471aff0f951a6cf42e8dec2c79 [18/39] gpiolib: Clean up headers
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303080608.tMdXnv3j-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/gpio/consumer.h: linux/err.h is included more than once.
--
>> include/linux/gpio/driver.h: asm/bug.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
