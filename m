Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB49A210A
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Dec 2022 09:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671875620; x=1703411620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lLxD5nFu5PzVTL95NypjrZ4pWlsD59chckUs1zDQI/E=;
  b=i3MrRRMTVYg2FPLFVAWSWf1jeJyfvd1tP0IlP6hQXKPSe/LxlaAGhWl8
   J6WQ4ba2DLpO192RaPnaIL6jG0UYHxfpTV7f718o8Td6GkDbpCjpWEM3R
   Qz+Epk3SE7ntg+KQPV9eDXuXEjKIvyqhdxgjIQHDQj3+qGXdMr35AsAgu
   JG+da+qU2IORY7wvhmyFUfHZxohWhr6amN9IfRcnSjOQvKlNpgyacf0k2
   EtUzMmDf4UgzcB31TlM6Qy/2kELsiSoF74Nz0mH0dPi+m/vjm2NQvYn8B
   YO9OA+QwKzhp+XHNV5oBwY/G2nNybMWDmyIpQ23CucE3b6YJOb9Wl1pV3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10570"; a="384811601"
X-IronPort-AV: E=Sophos;i="5.96,271,1665471600"; 
   d="scan'208";a="384811601"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2022 01:53:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10570"; a="684734120"
X-IronPort-AV: E=Sophos;i="5.96,271,1665471600"; 
   d="scan'208";a="684734120"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Dec 2022 01:53:38 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p91Dm-000DJ9-0M;
	Sat, 24 Dec 2022 09:53:38 +0000
Date: Sat, 24 Dec 2022 17:52:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:5.15/linux 22/38] drivers/media/i2c/ar0234.c:
 linux/version.h is included more than once.
Message-ID: <202212241724.raTNeU7j-lkp@intel.com>
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
TO: zouxiaoh <xiaohong.zou@intel.com>
CC: renjiaox <jiaojiaox.ren@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   85a3bdbbdc8610afb39ce136b53d410e7666ed9f
commit: cfb5743695d51c3d275a3646d140336c6e515358 [22/38] media: intel-ipu6: implement new vc solution
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/i2c/ar0234.c: linux/version.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
