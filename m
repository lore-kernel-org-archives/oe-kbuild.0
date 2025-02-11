Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B66F1EEA38
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Feb 2025 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273643; cv=none; b=Td8zSgBW9mAatUCQ0mNLxZRY/8N3s/eGqsUQ7GdviC23c3js2nIMKmjbFyeAOhSV85dsrczb+F4aHcsUOf0NQenizg3ncey/8/+KAJLAJQc4ctDmbL6NUEKMvaOpi7EX5p4MEKHo3coia45VR9kGF/H0jniDxFLhrtBpPbEiat4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273643; c=relaxed/simple;
	bh=7xfTnbnnxK3R6UcWjoieFehcg/HGXtgvUxLNk2jk8jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aSHlkqdVX9+1Mb+07Qrvofv2ddMc1rGdUkUAyuN+0iP/JZWd2+O37jmeWBglqNl4ob9kJ3KS+MCS7JKVp59Xig+voLiWnFK4coO+7Gt3/DFMuP7SD43l9kKHVVUgrIcFCbPaFxb9M8tbNBf7N8zCgK9eZiM4Neb1CivHI06jGL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPo+U/RA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPo+U/RA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739273641; x=1770809641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7xfTnbnnxK3R6UcWjoieFehcg/HGXtgvUxLNk2jk8jQ=;
  b=bPo+U/RAfFTRnr8ZNMeyNZKTlXtYLBi7x39n7R4vsq4DZRGwYwgHdEnz
   7OfKqWtUBXqwoWvxdwSeFtkg/uNKqS8Y2AaeNzzElEJe65bNYW/VIR8+l
   8I2/9FZ5Moq+BN6euTW4wHlha5Vhe+NtWj/XHdZ/z7unZgg0EdJt7VmPJ
   76GlyqivGJsXV7PRH8DbkBYfrQZG6eKMlGij8URPmRBYb9djIoQ5pyBcF
   wBe9caJ6mc2MO556Sw67Yu2uw/0S3gbyIwB8BG60gjSB48li2ltXaD58q
   I9h7GzqC3NitUbjWHahCfrUuknbsMITE6GQFiC4Nv4BcTP1C9ueD8Ljoq
   Q==;
X-CSE-ConnectionGUID: gbWC6ukjQFGuEmbuIeEhnQ==
X-CSE-MsgGUID: 2UKyajLTRu6j94g8VRerbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39804184"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="39804184"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 03:34:01 -0800
X-CSE-ConnectionGUID: 0cPmhLf+TaGUoO6/OupH5w==
X-CSE-MsgGUID: nLHXhWpxTAigfu0pPjHb9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117679491"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Feb 2025 03:34:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thoWb-00146N-0o;
	Tue, 11 Feb 2025 11:33:57 +0000
Date: Tue, 11 Feb 2025 19:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-5.10 2737/2737]
 drivers/scsi/linkdata/ps3stor/ps3_recovery.c: ps3_ioc_state.h is included
 more than once.
Message-ID: <202502111949.SlRodAD8-lkp@intel.com>
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
TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   7152a244f5f9fb024d93d293168ce0b62309680a
commit: 13f748eddc9dfdec8a18922ed601e1906dcb183a [2737/2737] [PATCH] SCSI: Linkdata: Supports Linkdata HBA/RAID Controllers
:::::: branch date: 9 hours ago
:::::: commit date: 3 days ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502111949.SlRodAD8-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/scsi/linkdata/ps3stor/ps3_recovery.c: ps3_ioc_state.h is included more than once.
>> drivers/scsi/linkdata/ps3stor/ps3_recovery.c: ps3_recovery.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_device_update.c: linux/mutex.h is included more than once.
>> drivers/scsi/linkdata/ps3stor/ps3_device_update.c: ps3_device_update.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/linux/ps3_dump.c: linux/uaccess.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_device_manager.c: scsi/scsi_tcq.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c: ps3_driver_log.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_ioctl.c: linux/mutex.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_debug.c: ps3_htp_def.h is included more than once.
>> drivers/scsi/linkdata/ps3stor/ps3_debug.c: ps3_instance_manager.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.c: ps3_cmd_complete.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c: linux/mutex.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c: linux/kernel.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c: ps3_module_para.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_instance_manager.h: ps3_irq.h is included more than once.
>> drivers/scsi/linkdata/ps3stor/ps3_instance_manager.h: ps3_cmd_channel.h is included more than once.
>> drivers/scsi/linkdata/ps3stor/ps3_instance_manager.h: ps3_inner_data.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/linux/ps3_base.c: ps3_scsi_cmd_err.h is included more than once.
>> drivers/scsi/linkdata/ps3stor/linux/ps3_base.c: ps3_driver_log.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_ioc_adp.c: ps3_scsih.h is included more than once.

vim +10 drivers/scsi/linkdata/ps3stor/ps3_recovery.c

     6	
     7	#include <scsi/scsi.h>
     8	#endif
     9	#include "ps3_recovery.h"
  > 10	#include "ps3_ioc_state.h"
    11	#include "ps3_event.h"
    12	#include "ps3_mgr_channel.h"
    13	#include "ps3_cmd_complete.h"
    14	#include "ps3_device_update.h"
    15	#include "ps3_ioc_manager.h"
    16	#include "ps3_mgr_cmd.h"
    17	#include "ps3_scsi_cmd_err.h"
    18	#include "ps3_scsih.h"
    19	#include "ps3_cmd_statistics.h"
    20	#include "ps3_r1x_write_lock.h"
  > 21	#include "ps3_ioc_state.h"
    22	#include "ps3_module_para.h"
    23	#include "ps3_ioctl.h"
    24	#include "ps3_dump.h"
    25	#include "ps3_cli_debug.h"
    26	#include "ps3_kernel_version.h"
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
