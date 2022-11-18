Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0251FA473
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Nov 2022 19:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668798187; x=1700334187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=urPEVavfsvU8qQyHqRV9Tczb2ugd/So40bvQw3YrI/U=;
  b=Ds27/tQVxaGJayZhcl5Wz4fReRZu9sUIO2D1jF5TlavmIyaaN0knivwH
   Bgh8F4Ha3L576aDwZQMZFnV8dFpb//hHZA3nYsoSNakrr+Napne5HPyuK
   rKUeLuMEOyf+UjcOgYeSzaUJJAhe6O6SgjS4XqNmIg4pZ/AIbXfDeyEy/
   HUdkS9UH7VSmPjNumJYL4YlVVpzAFzCWlgchEzdYMCExhcREtSopFJhRB
   LzL6jqp47hKz558VaItJaUlOTAiE2TQEy7MjLuRDUOjieWMGw8x78sBGC
   XBBwSvSX41ZFQJQsSVqZfcHBML8Yii1y4WKMLtmpq1mNcyqP8tKmayTuY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="311912789"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; 
   d="scan'208";a="311912789"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2022 11:03:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="885405637"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; 
   d="scan'208";a="885405637"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Nov 2022 11:03:05 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ow6dk-0001hl-2r;
	Fri, 18 Nov 2022 19:03:04 +0000
Date: Sat, 19 Nov 2022 03:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sean-jc:x86/kvm_host_to_kvm_arch 33/34] arch/x86/kvm/x86.c:
 kvm-x86-ops.h is included more than once.
Message-ID: <202211190254.O8U9pouL-lkp@intel.com>
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
TO: Sean Christopherson <seanjc@google.com>

tree:   https://github.com/sean-jc/linux x86/kvm_host_to_kvm_arch
head:   4f36639311dc74f211a69c6bad2064e9959e3eef
commit: c301ba3076cd89772d8f2e5aee285b1c0ee3e93b [33/34] KVM: x86: Move x86 specific KVM host headers to arch/x86/kvm
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/x86.c: kvm-x86-ops.h is included more than once.
--
>> arch/x86/kvm/pmu.c: kvm-x86-pmu-ops.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
