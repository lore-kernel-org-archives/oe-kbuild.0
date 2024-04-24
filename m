Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7722013CFAD
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Apr 2024 06:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713938762; cv=none; b=ZDjs9E7dKnbQW7bnXthGk9VmptY7lYbI89doMrmq80mYkcvDoiRw49u2hBbsRW0vmP6jeTZ+l4LiLQcMV7HYV82Hal8QlJuN9vfcayrg6iKC3wXMsIyXGVBwjm9dWaTd+q0LfHiGEWxWF2sfy66QXt87KuUVSpGBZ7Fs04e2kM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713938762; c=relaxed/simple;
	bh=iKfRx5pN8C5pe6eKIPybFUn1gn9nBfA8NyX2ccyVx7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YHty4wtRS9jD5feAjKf3DeQeM+DsyYKUgY3b7S6gkbIiIqMwvR9dL7k3jwOT1DTVzsFAExxErN1ysvuwNEx3NOMu95eVuua/Ogdfk7CqUKNDTq2IKzXs/S4ngCcw92Hw3um9Vm3F/nsX/jWZq0S89dav9Wxhy+dUIbxbhruiIdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kH8zr3cc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kH8zr3cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713938760; x=1745474760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iKfRx5pN8C5pe6eKIPybFUn1gn9nBfA8NyX2ccyVx7U=;
  b=kH8zr3cc9G6pxrvJWIDJFfbztpfpCFtXJOqP25NVeuE92IiX6/1YoAg/
   XJe/NZg6PZkFeJ5rssK2Gfa3hKJAQqjUOls2eBwHMTEeyPMY5tMtls9p8
   YnQPYMIPBjUWMncpUqOCaknlwh2vR3YcLv166q/RgFMdKO7CluixnP0Ev
   66MB0wlNMamBqpBPxuYPUUoazW3YHp8PXOQC6gqVoKGk4OqJSd1aEE6SX
   euHZrjpTm1lJJYCn3Z/nPeXxemqHmP6FZRgV8uyPBbNM4xyrEE7kcOT3i
   6r4BCfQgza8cAotJmds7xt2cPOTZ5QKLxSTGxQBdxgA8wzr2J8Y/0ZCPz
   g==;
X-CSE-ConnectionGUID: pWMAbROPSgGUqX7lanYGPQ==
X-CSE-MsgGUID: AsrMqlxmTheDTKiS9mbYeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20248765"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="20248765"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 23:06:00 -0700
X-CSE-ConnectionGUID: HAgahIC6Q5y6WXO6RvFfvw==
X-CSE-MsgGUID: xm/JhWJpT1ma1f3ybNPwqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="55805769"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Apr 2024 23:05:59 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzVlU-0000vE-2L;
	Wed, 24 Apr 2024 06:05:56 +0000
Date: Wed, 24 Apr 2024 14:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [agd5f:amd-staging-drm-next 2014/2033]
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c:
 dcn401/dcn401_clk_mgr.h is included more than once.
Message-ID: <202404241420.gx1LAd2A-lkp@intel.com>
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
TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
CC: Linux Infrastructure <z1.linuxinfra@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   5550c5defbdf958f2df459be74f87afa9eb0bdde
commit: 96c23c8cb3fb82f50d75df0dca6ace9788bb7eb7 [2014/2033] drm/amd/display: Add new DCN401 sources
:::::: branch date: 19 hours ago
:::::: commit date: 4 days ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404241420.gx1LAd2A-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c: dcn401/dcn401_clk_mgr.h is included more than once.

vim +12 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c

     4	
     5	#include "dccg.h"
     6	#include "clk_mgr_internal.h"
     7	#include "dcn401/dcn401_clk_mgr_smu_msg.h"
     8	#include "dcn20/dcn20_clk_mgr.h"
     9	#include "dce100/dce_clk_mgr.h"
    10	#include "dcn31/dcn31_clk_mgr.h"
    11	#include "dcn32/dcn32_clk_mgr.h"
  > 12	#include "dcn401/dcn401_clk_mgr.h"
    13	#include "reg_helper.h"
    14	#include "core_types.h"
    15	#include "dm_helpers.h"
    16	#include "link.h"
    17	#include "atomfirmware.h"
    18	
    19	#include "dcn401_smu14_driver_if.h"
    20	
    21	#include "dcn/dcn_4_1_0_offset.h"
    22	#include "dcn/dcn_4_1_0_sh_mask.h"
    23	
  > 24	#include "dcn401/dcn401_clk_mgr.h"
    25	#include "dml/dcn401/dcn401_fpu.h"
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
