Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B387F
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Apr 2023 11:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682162985; x=1713698985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ho1KoKOQtR+RU/5WBNw4TnuT26eJFJynRH4T2gi85BM=;
  b=R4dJ1zahqm0bpvYfZeqyPsjeweTr5gOuMof4VFPuKGt6bEiA+CdShLD/
   tHP7StiImM1Wf3DWsfsG11o2DfmyOIgfmi+evtR4L43ay87msPKhFiPHF
   xVCM0CNGROrV2NtCrJ9OSIqTN+byNUdhtVWb4cxr08RtRSF0fVyyLW5Mx
   N4sJJgP7DMLzvMk5YQBFH6I79ZOJxMOd0oJZhkBiqNKHb9Bn8lGD5tlqn
   HInYbBKxrRo0YUYuqMWXz8G96swU3eruZrz22Qskc1m5FKB8wwUufrScl
   L6cgMTTj2HJiKO52r+FYZe4mL08deVUxodUkQrLINL/IaRlmJlxGn63Y7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="432425824"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="432425824"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 04:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="669980904"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="669980904"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Apr 2023 04:29:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqBR0-000hGy-2A;
	Sat, 22 Apr 2023 11:29:42 +0000
Date: Sat, 22 Apr 2023 19:29:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.1 7355/8168]
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c: chid.h is included more
 than once.
Message-ID: <202304221942.sCJx2Sxv-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   04e59759943e2cafd39e628f46bef090f2e0c228
commit: 21f40a9a49c1caa0305c22b83e3609e92b9a5979 [7355/8168] UPSTREAM: drm/nouveau/fifo: add chan start()/stop()
:::::: branch date: 29 hours ago
:::::: commit date: 2 weeks ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304221942.sCJx2Sxv-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c: chid.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
