Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B054199248
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Jun 2024 23:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718666576; cv=none; b=sHxAWvT9bqP9UbhEvr7+77a66ccO+enfPcjaq6SW2lmDhGfmlTHfdNptRo6Am5kzftk5Y8gGiVOhYIGN2/YcUjE65BVZYA2STW3PwAhGuyASwSPTtj5JbKAdsi9b7WQr/JW5Gm5RqQPApehWgp8da6LA8QSheajNu0o8NJUvs1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718666576; c=relaxed/simple;
	bh=VJf/b+Xj0YyUN7ZqQ09YmFCTuVDb72FjQTYtulyY/z4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z7B/EegCuBHwrXZ/Tnz7H4SIfP+RlUEUG758asyLB0LqgxsozAb1+mNWiUDc5NhpVZRNEn3gslGlB7Gth46sNgHB7slii2L5EuHFuewNZ8XENOk9hIjJA7NcmCi5ZsTxD3lfaXkXWhWC3dQkMvAjo/rmWZUXLd6lHGF0Dggvo3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjP0EciR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjP0EciR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718666575; x=1750202575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VJf/b+Xj0YyUN7ZqQ09YmFCTuVDb72FjQTYtulyY/z4=;
  b=gjP0EciRvcJLxvlbVHJzYdXfXDWuyTie2RIdLMXsO0qWpHqkTjiVWSH/
   j9+z8XXfACvEuHZ5ghE0PoRfthvP1YL1ZB8xm+k6LxQg8FQoxEGAJnUf3
   YugerYO0joFimH3ZCmw0ZzVwIL+KkmcdUjjQaIm4+J3e5K0T7zsb1As85
   VBS/PT0i7C3ULZqcJXxFEgz491EmUd+lRVtCACVtFuO/EgEufQBbLq+ie
   gOvWiEzpsxB3Fk4cerDUMeN1840Xo7rvNLeH7ML1YK4wDF1LrddtfI4uw
   GEo2EjPHQRHMKnXOScxf3+swXR+RgmDGn2m8u+wCmqm9Hisx+LLWPvtW1
   A==;
X-CSE-ConnectionGUID: ZFm8sIjdSpSOj53W8rlsuA==
X-CSE-MsgGUID: Iehe+iEZQ7Kds82TXSi7SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26096806"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="26096806"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 16:22:54 -0700
X-CSE-ConnectionGUID: bikHhpn3SUinB9xzUYNPig==
X-CSE-MsgGUID: hrHcuXB4Tj+BrY6cjzU5Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="46296656"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Jun 2024 16:22:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJLgY-0004zz-2K;
	Mon, 17 Jun 2024 23:22:50 +0000
Date: Tue, 18 Jun 2024 07:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-linux-6.6.y-wip 150/150]
 drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c: img_errors.h
 is included more than once.
Message-ID: <202406180732.3nDlFb73-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Brandon Brnich <b-brnich@ti.com>
CC: Udit Kumar <u-kumar1@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   28ca41014f923e6e0e314492899b7cda49439c39
commit: 882d9360984568792cc0fd52aee488411771f76d [150/150] media: imagination: Clean Up Imagination Directory
:::::: branch date: 15 hours ago
:::::: commit date: 19 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406180732.3nDlFb73-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c: img_errors.h is included more than once.

vim +24 drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c

    20	
    21	#include "fw_headers/coreflags.h"
    22	#include "fw_headers/topazscfwif.h"
    23	#include "header_gen.h"
  > 24	#include "img_errors.h"
    25	#include "img_mem_man.h"
    26	#include "lst.h"
    27	#include "reg_headers/topaz_coreext_regs.h"
    28	#include "reg_headers/topazhp_core_regs.h"
    29	#include "reg_headers/topaz_vlc_regs.h"
    30	#include "reg_headers/topaz_db_regs.h"
    31	#include "topaz_color_formats.h"
    32	#include "topaz_device.h"
    33	#include "topaz_api.h"
    34	#include "topaz_api_utils.h"
    35	#include "topazmmu.h"
    36	#include "vxe_public_regdefs.h"
  > 37	#include "img_errors.h"
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
