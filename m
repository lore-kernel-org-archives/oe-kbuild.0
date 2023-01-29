Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A59517CB
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jan 2023 08:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674981418; x=1706517418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sSLCyPVKSHinC239pczCUyQF+J+EtNrpqn6GFMMqKOA=;
  b=ZD7/qo7lccjcJ5gd1PH5GfgXV/Ou9fKMXCTnRuVAxTZMsmMUTxgbX5B1
   jOn952ynH+GNyBUWSaS3CmaT7uNz40oroXEETIEO7S6J+KprP9uNKatdO
   rspm99wlnrGfTQKWqBhWtTWUjDo8c3iEFn9mhW/q0cq8X6yBsLgllNE0X
   MrhNT+w7byeNeVbrwE5R3SjFAmuP+AZqUKWqKWht6Y4jSXYYYZQZVRuzU
   1P2aiEZFdcOXh0f4QwrUcSdeO642ne0aG1GaNOcY29QwQP1zf6vUq3Rn8
   CLO+HykzSzXw8XHopyCO2VqaUxyfw+avNm9ZLYhDHbu9KG2BkO74LTwv4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="354690087"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="354690087"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 00:36:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="837635972"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="837635972"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Jan 2023 00:36:56 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM3BH-0002cc-18;
	Sun, 29 Jan 2023 08:36:55 +0000
Date: Sun, 29 Jan 2023 16:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@lip6.fr>
Subject: [cxl:pending 13/21] drivers/cxl/pci.c:511:8-33: WARNING: Threaded
 IRQ with no primary handler requested without IRQF_ONESHOT (unless it is
 nested IRQ)
Message-ID: <202301291620.DxnDWLoW-lkp@intel.com>
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
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-cxl@vger.kernel.org
TO: Davidlohr Bueso <dave@stgolabs.net>
CC: Dan Williams <dan.j.williams@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Ira Weiny <ira.weiny@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git pending
head:   ace4b76d4ab70335cffb5a1c8450d3b34c16771a
commit: a49aa8141b657a7fd33d86f7bed3ca07567ab37a [13/21] cxl/mem: Wire up event interrupts
:::::: branch date: 4 hours ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-c043-20230129 (https://download.01.org/0day-ci/archive/20230129/202301291620.DxnDWLoW-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/cxl/pci.c:511:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
