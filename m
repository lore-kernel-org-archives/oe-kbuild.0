Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71EF14262C
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Aug 2024 22:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723071028; cv=none; b=YTEcksjwWfE42WKVyaYcgHJd5zs2+Azsr56isLIO6j2AsJ8dy4tpXlabASmc963dkXfdTqYk6Me2qljrszNb3god+xb//w02KiBfa8d0zDUblm729ppgSExu835nQWIonuq4vDitLObFNFVFTHkAmqArG3wiflG+iD8eD+eReYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723071028; c=relaxed/simple;
	bh=snGSaexeEYehvKPiiGQA+4yx6jdaFlsVB3uLveTbeGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mywEkZr8ACaymNWBnMNwkAfXJcffcF4qie0vCnBd8n/q3QuyUFBz3ZaxQNCfHuKzCAQQEKZa8R2YAweEI0DpbwPkCi72I6vyNquMmmPM3KOvjR4TPw11ZQb8jHLB+/Pr4insV7E+AgIKV5ut7lvD91W+g3JCI6ncH5PiLwdAH54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwern7g3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwern7g3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723071027; x=1754607027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=snGSaexeEYehvKPiiGQA+4yx6jdaFlsVB3uLveTbeGM=;
  b=hwern7g3Nnm7mhERuj/5rV/UvcS3Aoi1rxKt8IKqsYKJaqJYCIlqSVab
   1QQzGNtFYuMC63iNl5GmU6PAwrF+wO/pAX8MpONie5tXv2HW95DyVOvGH
   amIWKZtntD/drwoNIwFEeoKSpOW0OTghbKuaH7k7jKAuzITgSd1qArjOf
   lRbjCt2HIIB09CVLCC75h5v4JnAZsaITMljB87AhqutmoRzDbX4lyu55C
   h8PBJHydvOQaRL6I/gVUgotuOn1HIBWLeRcHHCPGWsZnAPt5sFGvgoPlz
   /Vq/YDLULJnR5s/qboCdClE/lw4jZGVoVoqfttSzPRjBfvaDvLAT+l3UE
   g==;
X-CSE-ConnectionGUID: s3qB0iShTnuS8+qm50Fisg==
X-CSE-MsgGUID: ajSIp0c4S+6IOVzMvCyM6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20833768"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="20833768"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 15:50:25 -0700
X-CSE-ConnectionGUID: MSJoZsXKSk2/kfaysSlrUQ==
X-CSE-MsgGUID: IC0euH7kRFiQgFrztPrmjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="94574769"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Aug 2024 15:50:24 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbpU5-0005lk-3C;
	Wed, 07 Aug 2024 22:50:21 +0000
Date: Thu, 8 Aug 2024 06:49:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:wip/debug/soundwire-wsa884x-interrupts 29885/30000]
 drivers/media/platform/qcom/iris/platform/common/src/msm_vidc_platform.c:
 msm_vidc_debug.h is included more than once.
Message-ID: <202408080641.cAl7MiYA-lkp@intel.com>
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
TO: Dikshita Agarwal <quic_dikshita@quicinc.com>
CC: Abel Vesa <abel.vesa@linaro.org>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>

tree:   https://github.com/krzk/linux wip/debug/soundwire-wsa884x-interrupts
head:   77aa965762ad9c8711d005628b5c471007e0df82
commit: a0588374098c498ccdcf05756c30a461fdc13442 [29885/30000] iris: platform: add platform files
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408080641.cAl7MiYA-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/platform/qcom/iris/platform/common/src/msm_vidc_platform.c: msm_vidc_debug.h is included more than once.

vim +14 drivers/media/platform/qcom/iris/platform/common/src/msm_vidc_platform.c

     9	
    10	#include "hfi_packet.h"
    11	#include "hfi_property.h"
    12	#include "msm_vidc_control.h"
    13	#include "msm_vidc_core.h"
  > 14	#include "msm_vidc_debug.h"
  > 15	#include "msm_vidc_debug.h"
    16	#include "msm_vidc_driver.h"
    17	#include "msm_vidc_internal.h"
    18	#include "msm_vidc_iris3.h"
    19	#include "msm_vidc_sm8550.h"
    20	#include "msm_vidc_memory.h"
    21	#include "msm_vidc_platform.h"
    22	#include "msm_vidc_v4l2.h"
    23	#include "msm_vidc_vb2.h"
    24	#include "venus_hfi.h"
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
