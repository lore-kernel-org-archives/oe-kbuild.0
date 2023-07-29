Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF628168CD
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Jul 2023 18:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690657152; x=1722193152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6vtcbTyhqlM23ZDRoCdRykFGal0rh/+AGlT88LeUaUE=;
  b=LfV4MhFasUKMtBbxu3jm5YAmvPXIbczJH2VL11fb+lHzhNGlfU3mTakO
   Ge+4RgE/4IXI9zaE4HNLZTu1SMPA9zKmOJ7kPLvNru3Y4dkmJ10vpNJss
   bTD9xNe0OlkQvKx5kCNvtPKW7c52jinGT0xlzx9es1lR0rH+hp8ikdRhu
   lxoeDimrpG6HpG1gMzQgEagfzm1L9oJGsFquWM5oIFjdDD+kOBjoI3JED
   icah8Vwdk5z+ofar3lruj89KJHWYO9or65qzA73J3/pQXPsAtN0mpCdj9
   7pMr8f5+XUSFyf2p58vrWPS7/+aU6r5w71gMKQi1eLbS2Xfs3lv5GZq7/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="349083345"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="349083345"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 11:59:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="901645397"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="901645397"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Jul 2023 11:59:10 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPp9h-0004Fn-0w;
	Sat, 29 Jul 2023 18:59:09 +0000
Date: Sun, 30 Jul 2023 02:58:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jsarha:topic/cros-sof-v4.14-rebase 3532/9999]
 sound/soc/soc-topology.c:1138:60: sparse: sparse: incorrect type in argument
 3 (different base types)
Message-ID: <202307300215.WjcSLtZq-lkp@intel.com>
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
TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
CC: Samaga Prasanna Krishna <samaga.krishna@intel.corp-partner.google.com>
CC: Curtis Malainey <cujomalainey@chromium.org>

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: 9e1491388e755ed2b1dcffbaa54f76b2ad7a67ea [3532/9999] FROMLIST: ASoC: SOF: Add Build support for SOF core and Intel drivers
:::::: branch date: 4 years, 2 months ago
:::::: commit date: 4 years, 9 months ago
config: x86_64-randconfig-x062-20230728 (https://download.01.org/0day-ci/archive/20230730/202307300215.WjcSLtZq-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300215.WjcSLtZq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307300215.WjcSLtZq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/soc-topology.c:2503:45: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:261:28: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:262:39: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted __le32 [usertype] reg @@
   sound/soc/soc-topology.c:262:39: sparse:     expected int
   sound/soc/soc-topology.c:262:39: sparse:     got restricted __le32 [usertype] reg
   sound/soc/soc-topology.c:274:28: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:275:39: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted __le32 [usertype] shift @@
   sound/soc/soc-topology.c:275:39: sparse:     expected int
   sound/soc/soc-topology.c:275:39: sparse:     got restricted __le32 [usertype] shift
   sound/soc/soc-topology.c:604:21: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:623:70: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:625:70: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:640:60: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:642:60: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:644:61: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:657:60: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:659:60: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:661:61: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:720:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] min @@
   sound/soc/soc-topology.c:720:14: sparse:     expected unsigned int
   sound/soc/soc-topology.c:720:14: sparse:     got restricted __le32 [usertype] min
   sound/soc/soc-topology.c:721:22: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:733:17: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:736:17: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:738:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:789:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:799:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] access @@     got restricted __le32 [usertype] access @@
   sound/soc/soc-topology.c:799:27: sparse:     expected unsigned int [addressable] [assigned] access
   sound/soc/soc-topology.c:799:27: sparse:     got restricted __le32 [usertype] access
   sound/soc/soc-topology.c:801:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected int max @@     got restricted __le32 [usertype] max @@
   sound/soc/soc-topology.c:801:26: sparse:     expected int max
   sound/soc/soc-topology.c:801:26: sparse:     got restricted __le32 [usertype] max
   sound/soc/soc-topology.c:869:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:879:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] access @@     got restricted __le32 [usertype] access @@
   sound/soc/soc-topology.c:879:27: sparse:     expected unsigned int [addressable] [assigned] access
   sound/soc/soc-topology.c:879:27: sparse:     got restricted __le32 [usertype] access
   sound/soc/soc-topology.c:891:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected int max @@     got restricted __le32 [usertype] max @@
   sound/soc/soc-topology.c:891:25: sparse:     expected int max
   sound/soc/soc-topology.c:891:25: sparse:     got restricted __le32 [usertype] max
   sound/soc/soc-topology.c:892:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected int min @@     got restricted __le32 [usertype] min @@
   sound/soc/soc-topology.c:892:25: sparse:     expected int min
   sound/soc/soc-topology.c:892:25: sparse:     got restricted __le32 [usertype] min
   sound/soc/soc-topology.c:893:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int invert:1 @@     got restricted __le32 [usertype] invert @@
   sound/soc/soc-topology.c:893:28: sparse:     expected unsigned int invert:1
   sound/soc/soc-topology.c:893:28: sparse:     got restricted __le32 [usertype] invert
   sound/soc/soc-topology.c:894:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected int platform_max @@     got restricted __le32 [usertype] platform_max @@
   sound/soc/soc-topology.c:894:34: sparse:     expected int platform_max
   sound/soc/soc-topology.c:894:34: sparse:     got restricted __le32 [usertype] platform_max
   sound/soc/soc-topology.c:944:44: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:948:27: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:976:15: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:980:46: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1008:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1026:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] access @@     got restricted __le32 [usertype] access @@
   sound/soc/soc-topology.c:1026:27: sparse:     expected unsigned int [addressable] [assigned] access
   sound/soc/soc-topology.c:1026:27: sparse:     got restricted __le32 [usertype] access
   sound/soc/soc-topology.c:1034:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int items @@     got restricted __le32 [usertype] items @@
   sound/soc/soc-topology.c:1034:27: sparse:     expected unsigned int items
   sound/soc/soc-topology.c:1034:27: sparse:     got restricted __le32 [usertype] items
   sound/soc/soc-topology.c:1035:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int mask @@     got restricted __le32 [usertype] mask @@
   sound/soc/soc-topology.c:1035:26: sparse:     expected unsigned int mask
   sound/soc/soc-topology.c:1035:26: sparse:     got restricted __le32 [usertype] mask
   sound/soc/soc-topology.c:1041:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1041:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1041:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1041:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1041:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1114:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1114:45: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1121:28: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1125:32: sparse: sparse: restricted __le32 degrades to integer
>> sound/soc/soc-topology.c:1138:60: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] size @@     got restricted __le32 [usertype] payload_size @@
   sound/soc/soc-topology.c:1138:60: sparse:     expected unsigned long [usertype] size
   sound/soc/soc-topology.c:1138:60: sparse:     got restricted __le32 [usertype] payload_size
   sound/soc/soc-topology.c:1145:59: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] size @@     got restricted __le32 [usertype] payload_size @@
   sound/soc/soc-topology.c:1145:59: sparse:     expected unsigned long [usertype] size
   sound/soc/soc-topology.c:1145:59: sparse:     got restricted __le32 [usertype] payload_size
   sound/soc/soc-topology.c:1148:60: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] size @@     got restricted __le32 [usertype] payload_size @@
   sound/soc/soc-topology.c:1148:60: sparse:     expected unsigned long [usertype] size
   sound/soc/soc-topology.c:1148:60: sparse:     got restricted __le32 [usertype] payload_size
   sound/soc/soc-topology.c:1130:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1130:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1130:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1130:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1130:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1130:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1130:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1130:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1130:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1130:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1130:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1130:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1130:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1176:24: sparse: sparse: incorrect type in initializer (different base types) @@     expected int count @@     got restricted __le32 [usertype] count @@
   sound/soc/soc-topology.c:1176:24: sparse:     expected int count
   sound/soc/soc-topology.c:1176:24: sparse:     got restricted __le32 [usertype] count
   sound/soc/soc-topology.c:1179:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1179:45: sparse: sparse: restricted __le32 degrades to integer
>> sound/soc/soc-topology.c:1185:27: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned long [usertype] bytes @@     got restricted __le32 [usertype] payload_size @@
   sound/soc/soc-topology.c:1185:27: sparse:     expected unsigned long [usertype] bytes
   sound/soc/soc-topology.c:1185:27: sparse:     got restricted __le32 [usertype] payload_size
   sound/soc/soc-topology.c:1246:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1261:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int access @@     got restricted __le32 [usertype] access @@
   sound/soc/soc-topology.c:1261:30: sparse:     expected unsigned int access
   sound/soc/soc-topology.c:1261:30: sparse:     got restricted __le32 [usertype] access
   sound/soc/soc-topology.c:1273:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected int max @@     got restricted __le32 [usertype] max @@
   sound/soc/soc-topology.c:1273:25: sparse:     expected int max
   sound/soc/soc-topology.c:1273:25: sparse:     got restricted __le32 [usertype] max
   sound/soc/soc-topology.c:1274:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected int min @@     got restricted __le32 [usertype] min @@
   sound/soc/soc-topology.c:1274:25: sparse:     expected int min
   sound/soc/soc-topology.c:1274:25: sparse:     got restricted __le32 [usertype] min
   sound/soc/soc-topology.c:1275:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int invert:1 @@     got restricted __le32 [usertype] invert @@
   sound/soc/soc-topology.c:1275:28: sparse:     expected unsigned int invert:1
   sound/soc/soc-topology.c:1275:28: sparse:     got restricted __le32 [usertype] invert
   sound/soc/soc-topology.c:1276:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected int platform_max @@     got restricted __le32 [usertype] platform_max @@
   sound/soc/soc-topology.c:1276:34: sparse:     expected int platform_max
   sound/soc/soc-topology.c:1276:34: sparse:     got restricted __le32 [usertype] platform_max
   sound/soc/soc-topology.c:1345:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int access @@     got restricted __le32 [usertype] access @@
   sound/soc/soc-topology.c:1345:30: sparse:     expected unsigned int access
   sound/soc/soc-topology.c:1345:30: sparse:     got restricted __le32 [usertype] access
   sound/soc/soc-topology.c:1354:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int items @@     got restricted __le32 [usertype] items @@
   sound/soc/soc-topology.c:1354:27: sparse:     expected unsigned int items
   sound/soc/soc-topology.c:1354:27: sparse:     got restricted __le32 [usertype] items
   sound/soc/soc-topology.c:1355:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int mask @@     got restricted __le32 [usertype] mask @@
   sound/soc/soc-topology.c:1355:26: sparse:     expected unsigned int mask
   sound/soc/soc-topology.c:1355:26: sparse:     got restricted __le32 [usertype] mask
   sound/soc/soc-topology.c:1358:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1358:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1358:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1358:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1358:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1401:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1414:35: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1451:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1462:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int access @@     got restricted __le32 [usertype] access @@
   sound/soc/soc-topology.c:1462:30: sparse:     expected unsigned int access
   sound/soc/soc-topology.c:1462:30: sparse:     got restricted __le32 [usertype] access
   sound/soc/soc-topology.c:1464:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected int max @@     got restricted __le32 [usertype] max @@
   sound/soc/soc-topology.c:1464:26: sparse:     expected int max
   sound/soc/soc-topology.c:1464:26: sparse:     got restricted __le32 [usertype] max
   sound/soc/soc-topology.c:1521:38: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected int tplg_type @@     got restricted __le32 [usertype] id @@
   sound/soc/soc-topology.c:1521:38: sparse:     expected int tplg_type
   sound/soc/soc-topology.c:1521:38: sparse:     got restricted __le32 [usertype] id
   sound/soc/soc-topology.c:1534:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [addressable] [assigned] reg @@     got restricted __le32 [usertype] reg @@
   sound/soc/soc-topology.c:1534:22: sparse:     expected int [addressable] [assigned] reg
   sound/soc/soc-topology.c:1534:22: sparse:     got restricted __le32 [usertype] reg
   sound/soc/soc-topology.c:1535:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [addressable] [assigned] shift @@     got restricted __le32 [usertype] shift @@
   sound/soc/soc-topology.c:1535:24: sparse:     expected unsigned char [addressable] [assigned] shift
   sound/soc/soc-topology.c:1535:24: sparse:     got restricted __le32 [usertype] shift
   sound/soc/soc-topology.c:1536:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] mask @@     got restricted __le32 [usertype] mask @@
   sound/soc/soc-topology.c:1536:23: sparse:     expected unsigned int [addressable] [assigned] mask
   sound/soc/soc-topology.c:1536:23: sparse:     got restricted __le32 [usertype] mask
   sound/soc/soc-topology.c:1537:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [addressable] [assigned] subseq @@     got restricted __le32 [usertype] subseq @@
   sound/soc/soc-topology.c:1537:25: sparse:     expected int [addressable] [assigned] subseq
   sound/soc/soc-topology.c:1537:25: sparse:     got restricted __le32 [usertype] subseq
   sound/soc/soc-topology.c:1540:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [addressable] [assigned] ignore_suspend:1 @@     got restricted __le32 [usertype] ignore_suspend @@
   sound/soc/soc-topology.c:1540:33: sparse:     expected unsigned char [addressable] [assigned] ignore_suspend:1
   sound/soc/soc-topology.c:1540:33: sparse:     got restricted __le32 [usertype] ignore_suspend
   sound/soc/soc-topology.c:1541:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] event_flags @@     got restricted __le16 [usertype] event_flags @@
   sound/soc/soc-topology.c:1541:30: sparse:     expected unsigned short [addressable] [assigned] event_flags
   sound/soc/soc-topology.c:1541:30: sparse:     got restricted __le16 [usertype] event_flags
   sound/soc/soc-topology.c:1545:67: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1564:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [addressable] [assigned] num_kcontrols @@     got restricted __le32 [usertype] num_kcontrols @@
   sound/soc/soc-topology.c:1564:40: sparse:     expected int [addressable] [assigned] num_kcontrols
   sound/soc/soc-topology.c:1564:40: sparse:     got restricted __le32 [usertype] num_kcontrols
   sound/soc/soc-topology.c:1579:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [addressable] [assigned] num_kcontrols @@     got restricted __le32 [usertype] num_kcontrols @@
   sound/soc/soc-topology.c:1579:40: sparse:     expected int [addressable] [assigned] num_kcontrols
   sound/soc/soc-topology.c:1579:40: sparse:     got restricted __le32 [usertype] num_kcontrols
   sound/soc/soc-topology.c:1590:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [addressable] [assigned] num_kcontrols @@     got restricted __le32 [usertype] num_kcontrols @@
   sound/soc/soc-topology.c:1590:40: sparse:     expected int [addressable] [assigned] num_kcontrols
   sound/soc/soc-topology.c:1590:40: sparse:     got restricted __le32 [usertype] num_kcontrols
   sound/soc/soc-topology.c:1556:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1556:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1556:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1556:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1556:33: sparse: sparse: too many warnings
   sound/soc/soc-topology.c: In function 'soc_tplg_denum_create':
   sound/soc/soc-topology.c:1045:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
       if (err < 0) {
          ^
   sound/soc/soc-topology.c:1053:3: note: here
      case SND_SOC_TPLG_CTL_ENUM:
      ^~~~
   sound/soc/soc-topology.c: In function 'soc_tplg_dapm_widget_denum_create':
   sound/soc/soc-topology.c:1362:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
       if (err < 0) {
          ^
   sound/soc/soc-topology.c:1368:3: note: here
      case SND_SOC_TPLG_CTL_ENUM:
      ^~~~

vim +1138 sound/soc/soc-topology.c

8a9782346dccd8 Liam Girdwood 2015-05-29   987  
8a9782346dccd8 Liam Girdwood 2015-05-29   988  static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
8a9782346dccd8 Liam Girdwood 2015-05-29   989  	size_t size)
8a9782346dccd8 Liam Girdwood 2015-05-29   990  {
8a9782346dccd8 Liam Girdwood 2015-05-29   991  	struct snd_soc_tplg_enum_control *ec;
8a9782346dccd8 Liam Girdwood 2015-05-29   992  	struct soc_enum *se;
8a9782346dccd8 Liam Girdwood 2015-05-29   993  	struct snd_kcontrol_new kc;
8a9782346dccd8 Liam Girdwood 2015-05-29   994  	int i, ret, err;
8a9782346dccd8 Liam Girdwood 2015-05-29   995  
8a9782346dccd8 Liam Girdwood 2015-05-29   996  	if (soc_tplg_check_elem_count(tplg,
8a9782346dccd8 Liam Girdwood 2015-05-29   997  		sizeof(struct snd_soc_tplg_enum_control),
8a9782346dccd8 Liam Girdwood 2015-05-29   998  		count, size, "enums")) {
8a9782346dccd8 Liam Girdwood 2015-05-29   999  
8a9782346dccd8 Liam Girdwood 2015-05-29  1000  		dev_err(tplg->dev, "ASoC: invalid count %d for enum controls\n",
8a9782346dccd8 Liam Girdwood 2015-05-29  1001  			count);
8a9782346dccd8 Liam Girdwood 2015-05-29  1002  		return -EINVAL;
8a9782346dccd8 Liam Girdwood 2015-05-29  1003  	}
8a9782346dccd8 Liam Girdwood 2015-05-29  1004  
8a9782346dccd8 Liam Girdwood 2015-05-29  1005  	for (i = 0; i < count; i++) {
8a9782346dccd8 Liam Girdwood 2015-05-29  1006  		ec = (struct snd_soc_tplg_enum_control *)tplg->pos;
8a9782346dccd8 Liam Girdwood 2015-05-29  1007  		tplg->pos += (sizeof(struct snd_soc_tplg_enum_control) +
8a9782346dccd8 Liam Girdwood 2015-05-29  1008  			ec->priv.size);
8a9782346dccd8 Liam Girdwood 2015-05-29  1009  
8a9782346dccd8 Liam Girdwood 2015-05-29  1010  		/* validate kcontrol */
8a9782346dccd8 Liam Girdwood 2015-05-29  1011  		if (strnlen(ec->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
8a9782346dccd8 Liam Girdwood 2015-05-29  1012  			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
8a9782346dccd8 Liam Girdwood 2015-05-29  1013  			return -EINVAL;
8a9782346dccd8 Liam Girdwood 2015-05-29  1014  
8a9782346dccd8 Liam Girdwood 2015-05-29  1015  		se = kzalloc((sizeof(*se)), GFP_KERNEL);
8a9782346dccd8 Liam Girdwood 2015-05-29  1016  		if (se == NULL)
8a9782346dccd8 Liam Girdwood 2015-05-29  1017  			return -ENOMEM;
8a9782346dccd8 Liam Girdwood 2015-05-29  1018  
8a9782346dccd8 Liam Girdwood 2015-05-29  1019  		dev_dbg(tplg->dev, "ASoC: adding enum kcontrol %s size %d\n",
8a9782346dccd8 Liam Girdwood 2015-05-29  1020  			ec->hdr.name, ec->items);
8a9782346dccd8 Liam Girdwood 2015-05-29  1021  
8a9782346dccd8 Liam Girdwood 2015-05-29  1022  		memset(&kc, 0, sizeof(kc));
8a9782346dccd8 Liam Girdwood 2015-05-29  1023  		kc.name = ec->hdr.name;
8a9782346dccd8 Liam Girdwood 2015-05-29  1024  		kc.private_value = (long)se;
8a9782346dccd8 Liam Girdwood 2015-05-29  1025  		kc.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
8a9782346dccd8 Liam Girdwood 2015-05-29  1026  		kc.access = ec->hdr.access;
8a9782346dccd8 Liam Girdwood 2015-05-29  1027  
8a9782346dccd8 Liam Girdwood 2015-05-29  1028  		se->reg = tplc_chan_get_reg(tplg, ec->channel, SNDRV_CHMAP_FL);
8a9782346dccd8 Liam Girdwood 2015-05-29  1029  		se->shift_l = tplc_chan_get_shift(tplg, ec->channel,
8a9782346dccd8 Liam Girdwood 2015-05-29  1030  			SNDRV_CHMAP_FL);
8a9782346dccd8 Liam Girdwood 2015-05-29  1031  		se->shift_r = tplc_chan_get_shift(tplg, ec->channel,
8a9782346dccd8 Liam Girdwood 2015-05-29  1032  			SNDRV_CHMAP_FL);
8a9782346dccd8 Liam Girdwood 2015-05-29  1033  
8a9782346dccd8 Liam Girdwood 2015-05-29  1034  		se->items = ec->items;
8a9782346dccd8 Liam Girdwood 2015-05-29  1035  		se->mask = ec->mask;
8a9782346dccd8 Liam Girdwood 2015-05-29  1036  		se->dobj.index = tplg->index;
8a9782346dccd8 Liam Girdwood 2015-05-29  1037  		se->dobj.type = SND_SOC_DOBJ_ENUM;
8a9782346dccd8 Liam Girdwood 2015-05-29  1038  		se->dobj.ops = tplg->ops;
8a9782346dccd8 Liam Girdwood 2015-05-29  1039  		INIT_LIST_HEAD(&se->dobj.list);
8a9782346dccd8 Liam Girdwood 2015-05-29  1040  
8a9782346dccd8 Liam Girdwood 2015-05-29 @1041  		switch (ec->hdr.ops.info) {
8a9782346dccd8 Liam Girdwood 2015-05-29  1042  		case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
8a9782346dccd8 Liam Girdwood 2015-05-29  1043  		case SND_SOC_TPLG_CTL_ENUM_VALUE:
8a9782346dccd8 Liam Girdwood 2015-05-29  1044  			err = soc_tplg_denum_create_values(se, ec);
8a9782346dccd8 Liam Girdwood 2015-05-29  1045  			if (err < 0) {
8a9782346dccd8 Liam Girdwood 2015-05-29  1046  				dev_err(tplg->dev,
8a9782346dccd8 Liam Girdwood 2015-05-29  1047  					"ASoC: could not create values for %s\n",
8a9782346dccd8 Liam Girdwood 2015-05-29  1048  					ec->hdr.name);
8a9782346dccd8 Liam Girdwood 2015-05-29  1049  				kfree(se);
8a9782346dccd8 Liam Girdwood 2015-05-29  1050  				continue;
8a9782346dccd8 Liam Girdwood 2015-05-29  1051  			}
8a9782346dccd8 Liam Girdwood 2015-05-29  1052  			/* fall through and create texts */
8a9782346dccd8 Liam Girdwood 2015-05-29  1053  		case SND_SOC_TPLG_CTL_ENUM:
8a9782346dccd8 Liam Girdwood 2015-05-29  1054  		case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
8a9782346dccd8 Liam Girdwood 2015-05-29  1055  		case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
8a9782346dccd8 Liam Girdwood 2015-05-29  1056  			err = soc_tplg_denum_create_texts(se, ec);
8a9782346dccd8 Liam Girdwood 2015-05-29  1057  			if (err < 0) {
8a9782346dccd8 Liam Girdwood 2015-05-29  1058  				dev_err(tplg->dev,
8a9782346dccd8 Liam Girdwood 2015-05-29  1059  					"ASoC: could not create texts for %s\n",
8a9782346dccd8 Liam Girdwood 2015-05-29  1060  					ec->hdr.name);
8a9782346dccd8 Liam Girdwood 2015-05-29  1061  				kfree(se);
8a9782346dccd8 Liam Girdwood 2015-05-29  1062  				continue;
8a9782346dccd8 Liam Girdwood 2015-05-29  1063  			}
8a9782346dccd8 Liam Girdwood 2015-05-29  1064  			break;
8a9782346dccd8 Liam Girdwood 2015-05-29  1065  		default:
8a9782346dccd8 Liam Girdwood 2015-05-29  1066  			dev_err(tplg->dev,
8a9782346dccd8 Liam Girdwood 2015-05-29  1067  				"ASoC: invalid enum control type %d for %s\n",
8a9782346dccd8 Liam Girdwood 2015-05-29  1068  				ec->hdr.ops.info, ec->hdr.name);
8a9782346dccd8 Liam Girdwood 2015-05-29  1069  			kfree(se);
8a9782346dccd8 Liam Girdwood 2015-05-29  1070  			continue;
8a9782346dccd8 Liam Girdwood 2015-05-29  1071  		}
8a9782346dccd8 Liam Girdwood 2015-05-29  1072  
8a9782346dccd8 Liam Girdwood 2015-05-29  1073  		/* map io handlers */
2b5cdb9156f761 Mengdong Lin  2015-08-18  1074  		err = soc_tplg_kcontrol_bind_io(&ec->hdr, &kc, tplg);
8a9782346dccd8 Liam Girdwood 2015-05-29  1075  		if (err) {
8a9782346dccd8 Liam Girdwood 2015-05-29  1076  			soc_control_err(tplg, &ec->hdr, ec->hdr.name);
8a9782346dccd8 Liam Girdwood 2015-05-29  1077  			kfree(se);
8a9782346dccd8 Liam Girdwood 2015-05-29  1078  			continue;
8a9782346dccd8 Liam Girdwood 2015-05-29  1079  		}
8a9782346dccd8 Liam Girdwood 2015-05-29  1080  
8a9782346dccd8 Liam Girdwood 2015-05-29  1081  		/* pass control to driver for optional further init */
8a9782346dccd8 Liam Girdwood 2015-05-29  1082  		err = soc_tplg_init_kcontrol(tplg, &kc,
8a9782346dccd8 Liam Girdwood 2015-05-29  1083  			(struct snd_soc_tplg_ctl_hdr *) ec);
8a9782346dccd8 Liam Girdwood 2015-05-29  1084  		if (err < 0) {
8a9782346dccd8 Liam Girdwood 2015-05-29  1085  			dev_err(tplg->dev, "ASoC: failed to init %s\n",
8a9782346dccd8 Liam Girdwood 2015-05-29  1086  				ec->hdr.name);
8a9782346dccd8 Liam Girdwood 2015-05-29  1087  			kfree(se);
8a9782346dccd8 Liam Girdwood 2015-05-29  1088  			continue;
8a9782346dccd8 Liam Girdwood 2015-05-29  1089  		}
8a9782346dccd8 Liam Girdwood 2015-05-29  1090  
8a9782346dccd8 Liam Girdwood 2015-05-29  1091  		/* register control here */
8a9782346dccd8 Liam Girdwood 2015-05-29  1092  		ret = soc_tplg_add_kcontrol(tplg,
8a9782346dccd8 Liam Girdwood 2015-05-29  1093  			&kc, &se->dobj.control.kcontrol);
8a9782346dccd8 Liam Girdwood 2015-05-29  1094  		if (ret < 0) {
8a9782346dccd8 Liam Girdwood 2015-05-29  1095  			dev_err(tplg->dev, "ASoC: could not add kcontrol %s\n",
8a9782346dccd8 Liam Girdwood 2015-05-29  1096  				ec->hdr.name);
8a9782346dccd8 Liam Girdwood 2015-05-29  1097  			kfree(se);
8a9782346dccd8 Liam Girdwood 2015-05-29  1098  			continue;
8a9782346dccd8 Liam Girdwood 2015-05-29  1099  		}
8a9782346dccd8 Liam Girdwood 2015-05-29  1100  
8a9782346dccd8 Liam Girdwood 2015-05-29  1101  		list_add(&se->dobj.list, &tplg->comp->dobj_list);
8a9782346dccd8 Liam Girdwood 2015-05-29  1102  	}
8a9782346dccd8 Liam Girdwood 2015-05-29  1103  
8a9782346dccd8 Liam Girdwood 2015-05-29  1104  	return 0;
8a9782346dccd8 Liam Girdwood 2015-05-29  1105  }
8a9782346dccd8 Liam Girdwood 2015-05-29  1106  
8a9782346dccd8 Liam Girdwood 2015-05-29  1107  static int soc_tplg_kcontrol_elems_load(struct soc_tplg *tplg,
8a9782346dccd8 Liam Girdwood 2015-05-29  1108  	struct snd_soc_tplg_hdr *hdr)
8a9782346dccd8 Liam Girdwood 2015-05-29  1109  {
8a9782346dccd8 Liam Girdwood 2015-05-29  1110  	struct snd_soc_tplg_ctl_hdr *control_hdr;
8a9782346dccd8 Liam Girdwood 2015-05-29  1111  	int i;
8a9782346dccd8 Liam Girdwood 2015-05-29  1112  
8a9782346dccd8 Liam Girdwood 2015-05-29  1113  	if (tplg->pass != SOC_TPLG_PASS_MIXER) {
8a9782346dccd8 Liam Girdwood 2015-05-29  1114  		tplg->pos += hdr->size + hdr->payload_size;
8a9782346dccd8 Liam Girdwood 2015-05-29  1115  		return 0;
8a9782346dccd8 Liam Girdwood 2015-05-29  1116  	}
8a9782346dccd8 Liam Girdwood 2015-05-29  1117  
8a9782346dccd8 Liam Girdwood 2015-05-29  1118  	dev_dbg(tplg->dev, "ASoC: adding %d kcontrols at 0x%lx\n", hdr->count,
8a9782346dccd8 Liam Girdwood 2015-05-29  1119  		soc_tplg_get_offset(tplg));
8a9782346dccd8 Liam Girdwood 2015-05-29  1120  
8a9782346dccd8 Liam Girdwood 2015-05-29  1121  	for (i = 0; i < hdr->count; i++) {
8a9782346dccd8 Liam Girdwood 2015-05-29  1122  
8a9782346dccd8 Liam Girdwood 2015-05-29  1123  		control_hdr = (struct snd_soc_tplg_ctl_hdr *)tplg->pos;
8a9782346dccd8 Liam Girdwood 2015-05-29  1124  
06eb49f72fa57f Mengdong Lin  2016-04-27  1125  		if (control_hdr->size != sizeof(*control_hdr)) {
06eb49f72fa57f Mengdong Lin  2016-04-27  1126  			dev_err(tplg->dev, "ASoC: invalid control size\n");
06eb49f72fa57f Mengdong Lin  2016-04-27  1127  			return -EINVAL;
06eb49f72fa57f Mengdong Lin  2016-04-27  1128  		}
06eb49f72fa57f Mengdong Lin  2016-04-27  1129  
8a9782346dccd8 Liam Girdwood 2015-05-29 @1130  		switch (control_hdr->ops.info) {
8a9782346dccd8 Liam Girdwood 2015-05-29  1131  		case SND_SOC_TPLG_CTL_VOLSW:
8a9782346dccd8 Liam Girdwood 2015-05-29  1132  		case SND_SOC_TPLG_CTL_STROBE:
8a9782346dccd8 Liam Girdwood 2015-05-29  1133  		case SND_SOC_TPLG_CTL_VOLSW_SX:
8a9782346dccd8 Liam Girdwood 2015-05-29  1134  		case SND_SOC_TPLG_CTL_VOLSW_XR_SX:
8a9782346dccd8 Liam Girdwood 2015-05-29  1135  		case SND_SOC_TPLG_CTL_RANGE:
8a9782346dccd8 Liam Girdwood 2015-05-29  1136  		case SND_SOC_TPLG_DAPM_CTL_VOLSW:
8a9782346dccd8 Liam Girdwood 2015-05-29  1137  		case SND_SOC_TPLG_DAPM_CTL_PIN:
8a9782346dccd8 Liam Girdwood 2015-05-29 @1138  			soc_tplg_dmixer_create(tplg, 1, hdr->payload_size);
8a9782346dccd8 Liam Girdwood 2015-05-29  1139  			break;
8a9782346dccd8 Liam Girdwood 2015-05-29  1140  		case SND_SOC_TPLG_CTL_ENUM:
8a9782346dccd8 Liam Girdwood 2015-05-29  1141  		case SND_SOC_TPLG_CTL_ENUM_VALUE:
8a9782346dccd8 Liam Girdwood 2015-05-29  1142  		case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
8a9782346dccd8 Liam Girdwood 2015-05-29  1143  		case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
8a9782346dccd8 Liam Girdwood 2015-05-29  1144  		case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
8a9782346dccd8 Liam Girdwood 2015-05-29  1145  			soc_tplg_denum_create(tplg, 1, hdr->payload_size);
8a9782346dccd8 Liam Girdwood 2015-05-29  1146  			break;
8a9782346dccd8 Liam Girdwood 2015-05-29  1147  		case SND_SOC_TPLG_CTL_BYTES:
8a9782346dccd8 Liam Girdwood 2015-05-29  1148  			soc_tplg_dbytes_create(tplg, 1, hdr->payload_size);
8a9782346dccd8 Liam Girdwood 2015-05-29  1149  			break;
8a9782346dccd8 Liam Girdwood 2015-05-29  1150  		default:
8a9782346dccd8 Liam Girdwood 2015-05-29  1151  			soc_bind_err(tplg, control_hdr, i);
8a9782346dccd8 Liam Girdwood 2015-05-29  1152  			return -EINVAL;
8a9782346dccd8 Liam Girdwood 2015-05-29  1153  		}
8a9782346dccd8 Liam Girdwood 2015-05-29  1154  	}
8a9782346dccd8 Liam Girdwood 2015-05-29  1155  
8a9782346dccd8 Liam Girdwood 2015-05-29  1156  	return 0;
8a9782346dccd8 Liam Girdwood 2015-05-29  1157  }
8a9782346dccd8 Liam Girdwood 2015-05-29  1158  
cefcae315215e6 Liam Girdwood 2018-06-14  1159  /* optionally pass new dynamic kcontrol to component driver. */
cefcae315215e6 Liam Girdwood 2018-06-14  1160  static int soc_tplg_add_route(struct soc_tplg *tplg,
cefcae315215e6 Liam Girdwood 2018-06-14  1161  	struct snd_soc_dapm_route *route)
cefcae315215e6 Liam Girdwood 2018-06-14  1162  {
cefcae315215e6 Liam Girdwood 2018-06-14  1163  	if (tplg->comp && tplg->ops && tplg->ops->dapm_route_load)
cefcae315215e6 Liam Girdwood 2018-06-14  1164  		return tplg->ops->dapm_route_load(tplg->comp, tplg->index,
cefcae315215e6 Liam Girdwood 2018-06-14  1165  			route);
cefcae315215e6 Liam Girdwood 2018-06-14  1166  
cefcae315215e6 Liam Girdwood 2018-06-14  1167  	return 0;
cefcae315215e6 Liam Girdwood 2018-06-14  1168  }
cefcae315215e6 Liam Girdwood 2018-06-14  1169  
8a9782346dccd8 Liam Girdwood 2015-05-29  1170  static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
8a9782346dccd8 Liam Girdwood 2015-05-29  1171  	struct snd_soc_tplg_hdr *hdr)
8a9782346dccd8 Liam Girdwood 2015-05-29  1172  {
8a9782346dccd8 Liam Girdwood 2015-05-29  1173  	struct snd_soc_dapm_context *dapm = &tplg->comp->dapm;
8a9782346dccd8 Liam Girdwood 2015-05-29  1174  	struct snd_soc_dapm_route route;
8a9782346dccd8 Liam Girdwood 2015-05-29  1175  	struct snd_soc_tplg_dapm_graph_elem *elem;
8a9782346dccd8 Liam Girdwood 2015-05-29  1176  	int count = hdr->count, i;
8a9782346dccd8 Liam Girdwood 2015-05-29  1177  
8a9782346dccd8 Liam Girdwood 2015-05-29  1178  	if (tplg->pass != SOC_TPLG_PASS_GRAPH) {
8a9782346dccd8 Liam Girdwood 2015-05-29  1179  		tplg->pos += hdr->size + hdr->payload_size;
8a9782346dccd8 Liam Girdwood 2015-05-29  1180  		return 0;
8a9782346dccd8 Liam Girdwood 2015-05-29  1181  	}
8a9782346dccd8 Liam Girdwood 2015-05-29  1182  
8a9782346dccd8 Liam Girdwood 2015-05-29  1183  	if (soc_tplg_check_elem_count(tplg,
8a9782346dccd8 Liam Girdwood 2015-05-29  1184  		sizeof(struct snd_soc_tplg_dapm_graph_elem),
8a9782346dccd8 Liam Girdwood 2015-05-29 @1185  		count, hdr->payload_size, "graph")) {
8a9782346dccd8 Liam Girdwood 2015-05-29  1186  
8a9782346dccd8 Liam Girdwood 2015-05-29  1187  		dev_err(tplg->dev, "ASoC: invalid count %d for DAPM routes\n",
8a9782346dccd8 Liam Girdwood 2015-05-29  1188  			count);
8a9782346dccd8 Liam Girdwood 2015-05-29  1189  		return -EINVAL;
8a9782346dccd8 Liam Girdwood 2015-05-29  1190  	}
8a9782346dccd8 Liam Girdwood 2015-05-29  1191  
b75a65118d287a Liam Girdwood 2017-06-29  1192  	dev_dbg(tplg->dev, "ASoC: adding %d DAPM routes for index %d\n", count,
b75a65118d287a Liam Girdwood 2017-06-29  1193  		hdr->index);
8a9782346dccd8 Liam Girdwood 2015-05-29  1194  
8a9782346dccd8 Liam Girdwood 2015-05-29  1195  	for (i = 0; i < count; i++) {
8a9782346dccd8 Liam Girdwood 2015-05-29  1196  		elem = (struct snd_soc_tplg_dapm_graph_elem *)tplg->pos;
8a9782346dccd8 Liam Girdwood 2015-05-29  1197  		tplg->pos += sizeof(struct snd_soc_tplg_dapm_graph_elem);
8a9782346dccd8 Liam Girdwood 2015-05-29  1198  
8a9782346dccd8 Liam Girdwood 2015-05-29  1199  		/* validate routes */
8a9782346dccd8 Liam Girdwood 2015-05-29  1200  		if (strnlen(elem->source, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
8a9782346dccd8 Liam Girdwood 2015-05-29  1201  			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
8a9782346dccd8 Liam Girdwood 2015-05-29  1202  			return -EINVAL;
8a9782346dccd8 Liam Girdwood 2015-05-29  1203  		if (strnlen(elem->sink, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
8a9782346dccd8 Liam Girdwood 2015-05-29  1204  			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
8a9782346dccd8 Liam Girdwood 2015-05-29  1205  			return -EINVAL;
8a9782346dccd8 Liam Girdwood 2015-05-29  1206  		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
8a9782346dccd8 Liam Girdwood 2015-05-29  1207  			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
8a9782346dccd8 Liam Girdwood 2015-05-29  1208  			return -EINVAL;
8a9782346dccd8 Liam Girdwood 2015-05-29  1209  
8a9782346dccd8 Liam Girdwood 2015-05-29  1210  		route.source = elem->source;
8a9782346dccd8 Liam Girdwood 2015-05-29  1211  		route.sink = elem->sink;
8a9782346dccd8 Liam Girdwood 2015-05-29  1212  		route.connected = NULL; /* set to NULL atm for tplg users */
8a9782346dccd8 Liam Girdwood 2015-05-29  1213  		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0)
8a9782346dccd8 Liam Girdwood 2015-05-29  1214  			route.control = NULL;
8a9782346dccd8 Liam Girdwood 2015-05-29  1215  		else
8a9782346dccd8 Liam Girdwood 2015-05-29  1216  			route.control = elem->control;
8a9782346dccd8 Liam Girdwood 2015-05-29  1217  
cefcae315215e6 Liam Girdwood 2018-06-14  1218  		soc_tplg_add_route(tplg, &route);
cefcae315215e6 Liam Girdwood 2018-06-14  1219  
8a9782346dccd8 Liam Girdwood 2015-05-29  1220  		/* add route, but keep going if some fail */
8a9782346dccd8 Liam Girdwood 2015-05-29  1221  		snd_soc_dapm_add_routes(dapm, &route, 1);
8a9782346dccd8 Liam Girdwood 2015-05-29  1222  	}
8a9782346dccd8 Liam Girdwood 2015-05-29  1223  
8a9782346dccd8 Liam Girdwood 2015-05-29  1224  	return 0;
8a9782346dccd8 Liam Girdwood 2015-05-29  1225  }
8a9782346dccd8 Liam Girdwood 2015-05-29  1226  

:::::: The code at line 1138 was first introduced by commit
:::::: 8a9782346dccd82cf912552735bda619de4efd8c ASoC: topology: Add topology core

:::::: TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
