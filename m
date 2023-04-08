Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E74629B0
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Apr 2023 21:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680988935; x=1712524935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+9vVG7MrgrDAMXxMHwjESPVGGvTf70k/gkUw9dht9XU=;
  b=AD6gA71CwhTduEMg62/w71mJw9/zTbfCyaGYD+fHM2ahPnIQjqDWgnXX
   tbm5iP/d9dyw/hWp3T5mKswtsZ0KrDGSAgbeOSgH6S2C0H3PQB051khO0
   6d92q1xO6aB0HHlOkp1rXmotOwWjQ6D3az6oD19+B1m9WFGXXcnA1JPAi
   +cAtVKrpptUmxqiJCulrWqt/tf8AjdtAvGQRQxIfsq3fOIeH92PEz7MKg
   XIvKVIWPvMdJOVSLd2BJI6WHlJliaOskwCI0anhJTa6UBsOznCCLiPPDn
   jL0biajpq1LijDTvtTotRmcjwWI+v4L/3lFwJqd0oIRSgdtrvQ6RBiT0C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="323535650"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="323535650"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 14:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="862088500"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="862088500"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Apr 2023 14:22:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plG0i-000U73-1d;
	Sat, 08 Apr 2023 21:22:12 +0000
Date: Sun, 9 Apr 2023 05:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.1 39/76]
 sound/soc/mediatek/common/mtk-soundcard-driver.c:48:1-33: WARNING: Function
 "for_each_available_child_of_node" should have of_node_put() before return
 around line 51.
Message-ID: <202304090504.2K8L6soj-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   ba182faf669dff6e8eaef91b0df486c9056c3fcd
commit: 0337be4af39a82189af689b7884f475d317ed65b [39/76] UPSTREAM: ASoC: mediatek: common: add soundcard driver common code
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-c033-20230409 (https://download.01.org/0day-ci/archive/20230409/202304090504.2K8L6soj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304090504.2K8L6soj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/mediatek/common/mtk-soundcard-driver.c:48:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before return around line 51.
   sound/soc/mediatek/common/mtk-soundcard-driver.c:48:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before return around line 59.
   sound/soc/mediatek/common/mtk-soundcard-driver.c:48:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before return around line 63.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
