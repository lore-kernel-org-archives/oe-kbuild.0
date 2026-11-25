Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613578;
	b=X0Y/pW2TTwrhfrY4xSSnQ1f1YQVXhc/TsCFYjPeXRFD/9vXj//vKNC+NHQB8dzymi9Il
	 iRbMijNSdYOO2vFHFLewNBwSXrzq1A55SVT3EmAmDGI57EhUMrd4VKhrYerrtGEPNox7U
	 Y/YHLetiogy/qNFpXqSx6ovbRcWvfwloPGNUpIrRht38azVqq2B/LKGwQ77m+qPcO60VA
	 lnPaNL2PlKjyHZRkDMsHUz4ErN2nIOIt2pG0NngqQ6bjswwkSzYWOUEP/X9WxkenGHJTV
	 I5jXFe1VNb6yLA5ZhWg0DUoh9uiX4Iv2E1EP1wAuc2rMTg3lLrCCkybxFoF77qyIi7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613578;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=GCfm2WkoMywx3bLvUz4xL8KNLxCMpRSaIU447LfYZts=;
	b=m8x8ywcxHkP9ivIVxabSc9FBbxJMOOZYxdHHrmPq/OIuxW4kg8K8zkRPsiNcgme17hIB
	 lKOOmSl4w5+IqKh8ZREUFUJU9gXE//u9ceIpbbiovuGXKxupz1UluDuLX1nqvst/gCQVl
	 hfAUtUpT0Lm/CyrwLjnXhpdEXrAojKJivbt2xrY73Dy7NkzFdVhiBVOa5yxUIF79Elemf
	 CJZoZDyoMJajDdKSwRRSo9WE49AV/hdAgZQm0N/h76fCjkuChsVepfshr/ucMEOCKOosE
	 m6iHNmtLTxmKXUfIIb2Lwg0x31vvS0K/PtJohtKqFmrqP0njB+RhNo1x09KaqpeK1rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jyDCSsSn;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B93606A323
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Nov 2026 13:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10B93606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jyDCSsSn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795613578; x=1827149578;
  h=date:from:to:cc:subject:message-id;
  bh=f87HEYrgMdOakEkPSQeYR5gmPOIKLUSosdCKov/t54E=;
  b=jyDCSsSnUt2bV+c/nlC6d0KRdkRZzhmgo9YO6YDHq4BYMg7RMRuJgQ7Z
   rIyiVUSn8e7tnX3CogiWsvs8XgBnrRHq+vbWyCkFxV2KkEf/Bvt5TzhbZ
   FEsCrawtYBcoh/6h5uQsA2Z33s2YbkQfGQ+X9QXXKtciewv2uP1le3yHR
   EEdZ+iJd6MfFGwP693QiChoj/1fG0/++g0LgVfGRwoeM0lML8LSJMnnYt
   IIAIdJTj0kxUFHFnGqyl6FLf8BsBFC1LkDs57os3xV7HrGSw1pPNP2jhK
   kU8e5R/xXfNr7ZZM1K4W9qFhnbGoSqAVvo/KADbmCtX3AAUfNq/L/gqs7
   w==;
X-CSE-ConnectionGUID: hr9dB7uQT3+L5G0nXEnccw==
X-CSE-MsgGUID: HgxMdtM0RYq9l0FFD/Nx5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4483334"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4483334"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:32:47 -0800
X-CSE-ConnectionGUID: KkgsI0z+SAuvgsFAcPpfYg==
X-CSE-MsgGUID: 6jtoQNkYQQOakWuQkGhiVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11872930"
Received: from igk-lkp-server01.igk.intel.com (HELO 99c479ab0aeb) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 25 Nov 2026 05:32:46 -0800
Received: from kbuild by 99c479ab0aeb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWD76-0000000008Z-15f0;
	Wed, 25 Nov 2026 13:32:44 +0000
Date: Wed, 25 Nov 2026 14:31:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lontium-lt9611uxc.c:undefined reference to
 `drm_connector_hdmi_audio_plugged_notify'
Message-ID: <20261125142659.Rppxl3uA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dmitry Baryshkov <lumag@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4dce97c6c265544342e716e62fd24bbb232590c5
commit: c08c123d4cd6ec3ee482d607e29388d0db2d3f1d drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: nios2-randconfig-r2308-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125142659.Rppxl3uA-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125142659.Rppxl3uA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c08c123d4cd6 ("drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261125142659.Rppxl3uA-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: nios2-linux-ld: DWARF error: could not find abbrev number 18703
   drivers/gpu/drm/bridge/lontium-lt9611uxc.o: in function `lt9611uxc_bridge_hpd_notify':
>> lontium-lt9611uxc.c:(.text+0x65c): undefined reference to `drm_connector_hdmi_audio_plugged_notify'
>> lontium-lt9611uxc.c:(.text+0x65c): relocation truncated to fit: R_NIOS2_CALL26 against `drm_connector_hdmi_audio_plugged_notify'
>> nios2-linux-ld: lontium-lt9611uxc.c:(.text+0x6a0): undefined reference to `drm_connector_hdmi_audio_plugged_notify'
   lontium-lt9611uxc.c:(.text+0x6a0): relocation truncated to fit: R_NIOS2_CALL26 against `drm_connector_hdmi_audio_plugged_notify'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
