Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F47D2FB
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Mar 2023 23:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679612510; x=1711148510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vfFRMUeWZNiVIiPezPp0UvWDxrLGGTkeeioZyf7i6u4=;
  b=nuNQS6Hc1cY6Pd1wTOpZq3OXubwoyTRbVV9PHG/ZhmodoJReG9L2Lqir
   dwyY/Sh64sW4fm7uWGnpm1UL+eMkZBNOOmstH7xJlwS38fEqQNwfC8bNW
   ZeeHtu0PePBmNDfpaIhKBB3dvKd/slD/nlkWHWMzwS8Ge0ND0k1px8EwV
   n9EAA2c2YfXU9nTXXE7WLWP7DzJ2gGV/6lKqfDQceF1XhN2jy8OXAUhVG
   LxNXpzSAvVSYnLPeBqu4XFzvoT3v0ms4DoAhsnNjYiJZ8njjXbSj3Z38c
   r3lU0oR0bDS00EdDKgCMbTTr32jmNtFSWhCNACSue3zX7rI7cEWVAPlac
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="339675080"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="339675080"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 16:01:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="806451144"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="806451144"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Mar 2023 16:01:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfTwJ-000Emd-1Y;
	Thu, 23 Mar 2023 23:01:47 +0000
Date: Fri, 24 Mar 2023 07:01:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jsarha:topic/cros-sof-v4.14-rebase 3532/9999]
 sound/soc/soc-topology.c:262:39: sparse: sparse: incorrect type in return
 expression (different base types)
Message-ID: <202303240603.doWVcOJH-lkp@intel.com>
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

Hi Liam,

First bad commit (maybe != root cause):

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: 9e1491388e755ed2b1dcffbaa54f76b2ad7a67ea [3532/9999] FROMLIST: ASoC: SOF: Add Build support for SOF core and Intel drivers
:::::: branch date: 3 years, 10 months ago
:::::: commit date: 4 years, 5 months ago
config: m68k-randconfig-s043-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240603.doWVcOJH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/9e1491388e755ed2b1dcffbaa54f76b2ad7a67ea
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout 9e1491388e755ed2b1dcffbaa54f76b2ad7a67ea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash drivers/devfreq/event/ fs/ net/bluetooth/ sound/core/ sound/pci/hda/ sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303240603.doWVcOJH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/soc-topology.c:2503:45: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:261:28: sparse: sparse: restricted __le32 degrades to integer
>> sound/soc/soc-topology.c:262:39: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted __le32 [usertype] reg @@
   sound/soc/soc-topology.c:262:39: sparse:     expected int
   sound/soc/soc-topology.c:262:39: sparse:     got restricted __le32 [usertype] reg
   sound/soc/soc-topology.c:274:28: sparse: sparse: restricted __le32 degrades to integer
>> sound/soc/soc-topology.c:275:39: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted __le32 [usertype] shift @@
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
>> sound/soc/soc-topology.c:720:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] min @@
   sound/soc/soc-topology.c:720:14: sparse:     expected unsigned int
   sound/soc/soc-topology.c:720:14: sparse:     got restricted __le32 [usertype] min
   sound/soc/soc-topology.c:721:22: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:733:17: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:736:17: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:738:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:789:33: sparse: sparse: restricted __le32 degrades to integer
>> sound/soc/soc-topology.c:799:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] access @@     got restricted __le32 [usertype] access @@
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
>> sound/soc/soc-topology.c:1138:60: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] payload_size @@
   sound/soc/soc-topology.c:1138:60: sparse:     expected unsigned int [usertype] size
   sound/soc/soc-topology.c:1138:60: sparse:     got restricted __le32 [usertype] payload_size
   sound/soc/soc-topology.c:1145:59: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] payload_size @@
   sound/soc/soc-topology.c:1145:59: sparse:     expected unsigned int [usertype] size
   sound/soc/soc-topology.c:1145:59: sparse:     got restricted __le32 [usertype] payload_size
   sound/soc/soc-topology.c:1148:60: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] payload_size @@
   sound/soc/soc-topology.c:1148:60: sparse:     expected unsigned int [usertype] size
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
>> sound/soc/soc-topology.c:1176:24: sparse: sparse: incorrect type in initializer (different base types) @@     expected int count @@     got restricted __le32 [usertype] count @@
   sound/soc/soc-topology.c:1176:24: sparse:     expected int count
   sound/soc/soc-topology.c:1176:24: sparse:     got restricted __le32 [usertype] count
   sound/soc/soc-topology.c:1179:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1179:45: sparse: sparse: restricted __le32 degrades to integer
>> sound/soc/soc-topology.c:1185:27: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned int [usertype] bytes @@     got restricted __le32 [usertype] payload_size @@
   sound/soc/soc-topology.c:1185:27: sparse:     expected unsigned int [usertype] bytes
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
>> sound/soc/soc-topology.c:1521:38: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected int tplg_type @@     got restricted __le32 [usertype] id @@
   sound/soc/soc-topology.c:1521:38: sparse:     expected int tplg_type
   sound/soc/soc-topology.c:1521:38: sparse:     got restricted __le32 [usertype] id
>> sound/soc/soc-topology.c:1534:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [addressable] [assigned] reg @@     got restricted __le32 [usertype] reg @@
   sound/soc/soc-topology.c:1534:22: sparse:     expected int [addressable] [assigned] reg
   sound/soc/soc-topology.c:1534:22: sparse:     got restricted __le32 [usertype] reg
>> sound/soc/soc-topology.c:1535:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [addressable] [assigned] shift @@     got restricted __le32 [usertype] shift @@
   sound/soc/soc-topology.c:1535:24: sparse:     expected unsigned char [addressable] [assigned] shift
   sound/soc/soc-topology.c:1535:24: sparse:     got restricted __le32 [usertype] shift
>> sound/soc/soc-topology.c:1536:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] mask @@     got restricted __le32 [usertype] mask @@
   sound/soc/soc-topology.c:1536:23: sparse:     expected unsigned int [addressable] [assigned] mask
   sound/soc/soc-topology.c:1536:23: sparse:     got restricted __le32 [usertype] mask
>> sound/soc/soc-topology.c:1537:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [addressable] [assigned] subseq @@     got restricted __le32 [usertype] subseq @@
   sound/soc/soc-topology.c:1537:25: sparse:     expected int [addressable] [assigned] subseq
   sound/soc/soc-topology.c:1537:25: sparse:     got restricted __le32 [usertype] subseq
>> sound/soc/soc-topology.c:1540:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [addressable] [assigned] ignore_suspend:1 @@     got restricted __le32 [usertype] ignore_suspend @@
   sound/soc/soc-topology.c:1540:33: sparse:     expected unsigned char [addressable] [assigned] ignore_suspend:1
   sound/soc/soc-topology.c:1540:33: sparse:     got restricted __le32 [usertype] ignore_suspend
>> sound/soc/soc-topology.c:1541:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] event_flags @@     got restricted __le16 [usertype] event_flags @@
   sound/soc/soc-topology.c:1541:30: sparse:     expected unsigned short [addressable] [assigned] event_flags
   sound/soc/soc-topology.c:1541:30: sparse:     got restricted __le16 [usertype] event_flags
   sound/soc/soc-topology.c:1545:67: sparse: sparse: restricted __le32 degrades to integer
>> sound/soc/soc-topology.c:1564:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [addressable] [assigned] num_kcontrols @@     got restricted __le32 [usertype] num_kcontrols @@
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

vim +262 sound/soc/soc-topology.c

8a9782346dccd8 Liam Girdwood 2015-05-29  254  
8a9782346dccd8 Liam Girdwood 2015-05-29  255  static int tplc_chan_get_reg(struct soc_tplg *tplg,
8a9782346dccd8 Liam Girdwood 2015-05-29  256  	struct snd_soc_tplg_channel *chan, int map)
8a9782346dccd8 Liam Girdwood 2015-05-29  257  {
8a9782346dccd8 Liam Girdwood 2015-05-29  258  	int i;
8a9782346dccd8 Liam Girdwood 2015-05-29  259  
8a9782346dccd8 Liam Girdwood 2015-05-29  260  	for (i = 0; i < SND_SOC_TPLG_MAX_CHAN; i++) {
8a9782346dccd8 Liam Girdwood 2015-05-29  261  		if (chan[i].id == map)
8a9782346dccd8 Liam Girdwood 2015-05-29 @262  			return chan[i].reg;
8a9782346dccd8 Liam Girdwood 2015-05-29  263  	}
8a9782346dccd8 Liam Girdwood 2015-05-29  264  
8a9782346dccd8 Liam Girdwood 2015-05-29  265  	return -EINVAL;
8a9782346dccd8 Liam Girdwood 2015-05-29  266  }
8a9782346dccd8 Liam Girdwood 2015-05-29  267  
8a9782346dccd8 Liam Girdwood 2015-05-29  268  static int tplc_chan_get_shift(struct soc_tplg *tplg,
8a9782346dccd8 Liam Girdwood 2015-05-29  269  	struct snd_soc_tplg_channel *chan, int map)
8a9782346dccd8 Liam Girdwood 2015-05-29  270  {
8a9782346dccd8 Liam Girdwood 2015-05-29  271  	int i;
8a9782346dccd8 Liam Girdwood 2015-05-29  272  
8a9782346dccd8 Liam Girdwood 2015-05-29  273  	for (i = 0; i < SND_SOC_TPLG_MAX_CHAN; i++) {
8a9782346dccd8 Liam Girdwood 2015-05-29  274  		if (chan[i].id == map)
8a9782346dccd8 Liam Girdwood 2015-05-29 @275  			return chan[i].shift;
8a9782346dccd8 Liam Girdwood 2015-05-29  276  	}
8a9782346dccd8 Liam Girdwood 2015-05-29  277  
8a9782346dccd8 Liam Girdwood 2015-05-29  278  	return -EINVAL;
8a9782346dccd8 Liam Girdwood 2015-05-29  279  }
8a9782346dccd8 Liam Girdwood 2015-05-29  280  

:::::: The code at line 262 was first introduced by commit
:::::: 8a9782346dccd82cf912552735bda619de4efd8c ASoC: topology: Add topology core

:::::: TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
