Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2018610F1
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jul 2024 01:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719797520; cv=none; b=P8G1GVsK01N5s2251kLQ3fzK1Ou7EQkD0znbn8CnQAlcGO9cxt9BkHpY509iWYLvffocLVANp//RnKa8sXyKsru3V51uJO17llaC53XoJp5dKf1SrJm5qnKD9iGNCnau/5m+XnvMy3xp0M6ABSs/9jVOpNpPWuikPDQMy3XXXtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719797520; c=relaxed/simple;
	bh=wbvtlXxLmbUUjTI9KrIZXgVKsVLMUvqKoWQohv32CWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VDfIMA4nWK4L+YUidJVbFcHFM1qAZs7Hxayu/oR+zK8ZVRkUztJFOGu1QKFpTH7KS+cF65GkiP/gvwfTW8QOnwoYRvlkgG0R5seLH4M3neau0B+v6JNrHeuo6betmMVe7yIfpKBqKthO8nH45N8IUytb5F7wINjEoJnpijsPeyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBgBvZhn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBgBvZhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719797518; x=1751333518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wbvtlXxLmbUUjTI9KrIZXgVKsVLMUvqKoWQohv32CWM=;
  b=LBgBvZhnMCLDqUorOE06sBa0PfmOSDUyRZfMMqe8/SGcOCMsYbgDHnrX
   DKvL+0d5Kjc/wc011KP0qPUPAK64WY/C+d6w7UZDolLTpvGGEzTFaIz6R
   vaJrHccTlNQdeNv2UV5W9Wlk9ewpmn3lI155+LCY65RYz7/v636H5GEEE
   azrgoJJ/zh6bMRhPLd4U2B8bj05AyjejJT5KCumYykHOuvXZARx848mtu
   D028dcpd7TK+bGGG4c/bOEPTO4MMedu9WngRI9V65RW9jBc0G4TyznLB/
   Gskm+eEb/ORcqxuuQEOi95EO7X68LrjqIFwLipA5MDKye38e1IWIBy9Sk
   g==;
X-CSE-ConnectionGUID: mntI5MTEQpSlhFxK7I22zA==
X-CSE-MsgGUID: +Hz+ObBnTdOQa/+1ejV23Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="27520698"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="27520698"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2024 18:31:57 -0700
X-CSE-ConnectionGUID: qvMLLUj2RzCc4cru2wTDpQ==
X-CSE-MsgGUID: gb+sL7jNQXO6jzkervmvtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="49668258"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jun 2024 18:31:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sO5ta-000MHc-1B;
	Mon, 01 Jul 2024 01:31:54 +0000
Date: Mon, 1 Jul 2024 09:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 7/8] Input: touchscreen: add Synaptics TCM oncell S3908
Message-ID: <202407010930.wP312wLj-lkp@intel.com>
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
In-Reply-To: <20240630-oneplus8-v2-7-c4a1f8da74f1@postmarketos.org>
References: <20240630-oneplus8-v2-7-c4a1f8da74f1@postmarketos.org>
TO: Caleb Connolly <caleb@postmarketos.org>
TO: Caleb Connolly <caleb@postmarketos.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Jessica Zhang <quic_jesszhan@quicinc.com>
TO: David Airlie <airlied@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: Henrik Rydberg <rydberg@bitmath.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-input@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: Frieder Hannenheim <frieder.hannenheim@proton.me>

Hi Caleb,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f76698bd9a8ca01d3581236082d786e9a6b72bb7]

url:    https://github.com/intel-lab-lkp/linux/commits/Caleb-Connolly/dt-bindings-panel-document-Samsung-AMB655X/20240701-034227
base:   f76698bd9a8ca01d3581236082d786e9a6b72bb7
patch link:    https://lore.kernel.org/r/20240630-oneplus8-v2-7-c4a1f8da74f1%40postmarketos.org
patch subject: [PATCH v2 7/8] Input: touchscreen: add Synaptics TCM oncell S3908
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407010930.wP312wLj-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/input/touchscreen/synaptics_tcm_oncell.c: linux/module.h is included more than once.
>> drivers/input/touchscreen/synaptics_tcm_oncell.c: linux/input/touchscreen.h is included more than once.

vim +14 drivers/input/touchscreen/synaptics_tcm_oncell.c

  > 14	#include <linux/module.h>
    15	#include <linux/property.h>
    16	#include <asm/unaligned.h>
    17	#include <linux/delay.h>
    18	#include <linux/input/mt.h>
    19	#include <linux/input/touchscreen.h>
    20	#include <linux/interrupt.h>
    21	#include <linux/irq.h>
    22	#include <linux/of_gpio.h>
  > 23	#include <linux/module.h>
    24	#include <linux/pm_runtime.h>
    25	#include <linux/regulator/consumer.h>
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
