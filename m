Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1733136D
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jan 2025 18:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737310675; cv=none; b=ceVDvrXs1/H4wzBRs2fYVdk2o1HMoZ/4o/i3aQe52yymsFuli4villLob/6UV/azirw1KOJ5X+njN8Th/+sXgVJv/si54hbEo7byPpg3TL7/SFjGB3XX6msTJBRpbHRjD+DDovjdJTQlpfcuPtT4VSDlYK1s/Nv0bYhOr0FsoFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737310675; c=relaxed/simple;
	bh=dirtMGl8Vz+uyxXi+H0p+pTnRQ6GIW9RwBuTCkqJo1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=irbLJiANXuJgwYYNjQqWH6S8TPveuxkW4720xEXLeX+uzCumh2OCZVa2/SkALbMnEDet7k5m/7Ci+LqWyDH10s3l/RQUfNQ6KrY8yjnh5N5x+YxflSmn/JxEI2FO8uuhaPtaiOqA7ubMM9U7+0mMjNiohudUnXBo+W96jg23aIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ee79GqNB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ee79GqNB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737310673; x=1768846673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dirtMGl8Vz+uyxXi+H0p+pTnRQ6GIW9RwBuTCkqJo1c=;
  b=ee79GqNBR5Lo4kIONPLO2vXj/y28EgPz0B1VuZ5A+5rWD4SB3CNnc20A
   7lIb8p4QyApdvZA9kkYPKOpZ2AiIfHxhzzp3hZWRZMDEF/yL9t2NpBxWh
   X9rYiCSz3yJv9TOKQ2vmL9WGLkECMMxNnEAzovZLyWa9sp6n2v1BkQZjD
   blD0WJbo+jcAseWCmk+yt7qBc+1VLRZs4Z4ginOyOJAfpIecjA+WhgNPV
   96lMrxqeLEuHzBczYWSA5Nsm6WTcuO7xJmWUhNItIhgzv5edjaUsFw/PY
   o0sqNs8ffUtnNPE05ws1kcp26fhOz800b3y0F+02wDtBLv/4K0WDGWUgD
   Q==;
X-CSE-ConnectionGUID: nh60vptnRXaO7ktmVUEb3Q==
X-CSE-MsgGUID: ZSBPIuSYSPOAlDDMB2gXKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37557908"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37557908"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 10:17:52 -0800
X-CSE-ConnectionGUID: HMg4H9sAR/C46tt2fmDsTQ==
X-CSE-MsgGUID: OcVsSuJATkislPfmeLQGbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111378346"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jan 2025 10:17:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZZrp-000VhF-0y;
	Sun, 19 Jan 2025 18:17:49 +0000
Date: Mon, 20 Jan 2025 02:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [iwlwifi-chromeos:chromeos-6.12__release/core94-22 1/1]
 drivers/net/wireless/iwl7000/iwlwifi/mld/mac80211.c: iface.h is included
 more than once.
Message-ID: <202501200256.ruTQBqme-lkp@intel.com>
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
TO: Golan Ben Ami <golan.ben.ami@intel.com>
TO: Michael Golant <michael.golant@intel.com>
TO: Johannes Berg <johannes.berg@intel.com>
TO: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-6.12__release/core94-22
head:   602e50d4b13bf636b54b213ed73465b95173dfd3
commit: 602e50d4b13bf636b54b213ed73465b95173dfd3 [1/1] CHROMIUM: iwl7000: mld: record the last signal average per station
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501200256.ruTQBqme-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/wireless/iwl7000/iwlwifi/mld/mac80211.c: iface.h is included more than once.
--
>> drivers/net/wireless/iwl7000/iwlwifi/mld/stats.c: mlo.h is included more than once.

vim +12 drivers/net/wireless/iwl7000/iwlwifi/mld/mac80211.c

     8	
     9	#include "mld.h"
    10	#include "mac80211.h"
    11	#include "phy.h"
  > 12	#include "iface.h"
    13	#include "power.h"
    14	#include "sta.h"
    15	#include "agg.h"
    16	#include "scan.h"
    17	#include "d3.h"
    18	#include "tlc.h"
    19	#include "key.h"
    20	#include "ap.h"
    21	#include "tx.h"
    22	#include "roc.h"
  > 23	#include "iface.h"
    24	#include "mlo.h"
    25	#include "stats.h"
    26	#include "low_latency.h"
    27	#include "fw/api/scan.h"
    28	#include "fw/api/context.h"
    29	#include "fw/api/filter.h"
    30	#include "fw/api/sta.h"
    31	#include "fw/api/tdls.h"
    32	#ifdef CPTCFG_IWLWIFI_SUPPORT_DEBUG_OVERRIDES
    33	#include "fw/api/dhc.h"
    34	#endif
    35	#ifdef CONFIG_PM_SLEEP
    36	#include "fw/api/d3.h"
    37	#endif /* CONFIG_PM_SLEEP */
    38	#ifdef CPTCFG_IWL_VENDOR_CMDS
    39	#include "vendor-cmd.h"
    40	#endif
    41	#include "iwl-trans.h"
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
