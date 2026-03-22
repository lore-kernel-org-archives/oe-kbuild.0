Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0BF347C6
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 16:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774198528; cv=none; b=pz2hwgmxHgL8zQPfQeX1ciOZf2Luc4RKGEZqiWZ2c5o0mahaiWs8rQNk0QpcX7ok4nIJx69yt4Kfuz7n2o1utyhQArrHhsLeTJXxblNddr4+z1pY6EB9Noh8VzS8VD0omZrGNhipQbyL36cuD1BKrLYD0xqnj8Xqxt32lZvWiEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774198528; c=relaxed/simple;
	bh=UJEbEbtAgELfTASCEFKt5Q4Pr/GopgXFxCy3Ke4yKKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pGQ9L8OdloaiXQslznLyu/moPyI1mzbPULctmnviZgjntLToGf4fzL5WU2UWMR8YCAf4VvrVERQDVQIOsj3pEpeTcO5hgJAKFk3ZYO3O4lYN9BNUXIBfACStw2Rlc6sU/+0ODfZo0t8BukbcW+wLPGcxoNZjFF8kAFUhhIQVOXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOCQtfoN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOCQtfoN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774198527; x=1805734527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UJEbEbtAgELfTASCEFKt5Q4Pr/GopgXFxCy3Ke4yKKc=;
  b=SOCQtfoNoVF48CBKs2SXyB6+CF06vh31DJWZqa+nk5ls/lxuWHSAnrjY
   u8WBz7hcbd4UIlMunmGe4B/rqY9wPuRIx+T9PpwZFkyYZ8v80KNtvdaxQ
   biowtVaIRu5UfFx8AiophFgipmoNgPB90RJQT1xtTD4W2oPhrYiGgsIW+
   iVY0/p6wmOjBnMh6UM/8QIcf6OY72Uk/j+NNsfyLjHHYKvVluaUYnyR4R
   KH4RMLaPASkFf4hQXAXNa8Fl+QNMQqU6PF1Ci1TORwgtFX8C0u2Lq62UD
   u0/if/0WsiBVq2qozuVF0Wc9wqHecdnFJHoP/w4VLgSS/4Ck5zG1pZ/ko
   A==;
X-CSE-ConnectionGUID: iLlp/hnHRv2oDAgt6KloIQ==
X-CSE-MsgGUID: RbAGJ2wzRVO1LLRIJyComA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75332887"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="75332887"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 09:55:27 -0700
X-CSE-ConnectionGUID: MZt77gnUQumP99Dk9QPN7g==
X-CSE-MsgGUID: Lrvj1i0SSRCKWmV8uEbB7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="223832789"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Mar 2026 09:55:25 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4M50-000000002Q9-1lwP;
	Sun, 22 Mar 2026 16:55:13 +0000
Date: Mon, 23 Mar 2026 00:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 4/9] bus: mhi: Centralize firmware image table
 selection at probe time
Message-ID: <202603230004.mNrKpWC6-lkp@intel.com>
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
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
References: <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
TO: Kishore Batta <kishore.batta@oss.qualcomm.com>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
TO: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
TO: Oded Gabbay <ogabbay@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: andersson@kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: mhi@lists.linux.dev
CC: Kishore Batta <kishore.batta@oss.qualcomm.com>

Hi Kishore,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a0ae2a256046c0c5d3778d1a194ff2e171f16e5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Kishore-Batta/Add-documentation-for-Sahara-protocol/20260320-144614
base:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
patch link:    https://lore.kernel.org/r/20260319-sahara_protocol_new_v2-v4-4-47ad79308762%40oss.qualcomm.com
patch subject: [PATCH v4 4/9] bus: mhi: Centralize firmware image table selection at probe time
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230004.mNrKpWC6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603230004.mNrKpWC6-lkp@intel.com/

smatch warnings:
drivers/bus/mhi/sahara/sahara.c:270 sahara_select_variant() warn: this array is probably non-NULL. 'id->chan'

vim +270 drivers/bus/mhi/sahara/sahara.c

7fb19ea1ec6aa8 drivers/accel/qaic/sahara.c     Jeff Hugo     2025-10-08  260  
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  261  static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi_dev,
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  262  							  const struct mhi_device_id *id)
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  263  {
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  264  	int i;
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  265  
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  266  	for (i = 0; i < ARRAY_SIZE(sahara_variants); i++) {
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  267  		const struct sahara_variant *v = &sahara_variants[i];
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  268  
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  269  		if (v->match_is_chan) {
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19 @270  			if (id && id->chan && !strcmp(id->chan, v->match))
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  271  				return v;
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  272  		} else {
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  273  			if (mhi_dev->mhi_cntrl && mhi_dev->mhi_cntrl->name &&
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  274  			    !strcmp(mhi_dev->mhi_cntrl->name, v->match))
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  275  				return v;
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  276  		}
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  277  	}
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  278  	return NULL;
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  279  }
9b3f83333985ac drivers/bus/mhi/sahara/sahara.c Kishore Batta 2026-03-19  280  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
