Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCA3EEDE
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Jul 2025 05:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752902258; cv=none; b=ZYkd92HESqDrxNLoXWXOxCee5NGZ5vInJCAKx3z4H4pVRnZskMAeclkNdFk14vjkyTPioeOaVVZXks/W94U6iycmkFbk+NkmTQAsPjfGWNoZP5xttxzFlr2u34q5BwLcXycc7iwWk6AAi/Mpn8/1AnLEcR4eOqJ4aDnz7Y+8fwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752902258; c=relaxed/simple;
	bh=4IQ4tcS8AY2cW0vbwx2uaOcCZ/cCKG7CEt6zoR+zAL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O0CMkLjEhNzZ3ef6nq+z4OJ1Z/dQgqq9H/wW7EZ/QqDoiDEXBgbd82VrKk9DpcGupNWGmSqb5fUUd1EBsz9bJ6Qv992JtsSEfQtq18aCve/Jod78TcHC3+40mHSc5QzeQo3+bXfrYmm6dqz37YE1ANr0mAj0Vt8teFpNe5Nctws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USiyp1hy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USiyp1hy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752902256; x=1784438256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4IQ4tcS8AY2cW0vbwx2uaOcCZ/cCKG7CEt6zoR+zAL0=;
  b=USiyp1hyS5gpsAFvNoPwZy3VT12lS6qR37C3emKU9bL3AGOEgC/aRgws
   UaCHBuaDi00TZXyCMzL3YaysAR9SLIL4O2B0fK5Qm2MSJ9+naSkzyi3gd
   nEe5weNfuCqpRblz3T/twqkGA5rNnXjXkBFVVgpTzfYVZoE3UTyNAdb0D
   d4yZzOpzSxmfix0IZoTmvll5D2Q2xCJKlM5FLfS4xveDkOtHn7w9CJxk+
   VaB5Wuf81BwoM2EFkXGIRfidV5VNFCZIpBBG5GHisKHi9n0rNjIa4tdf6
   q7nXItu4v25l2IdHvrdRFUAL9qJgynQr2Kae055zYfCjBltuRrpPNIOo3
   g==;
X-CSE-ConnectionGUID: G/7VWUNvTGSug50ZViiCQA==
X-CSE-MsgGUID: ppuFUg3mS7S6O4Mq3OmKYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55155994"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="55155994"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 22:17:36 -0700
X-CSE-ConnectionGUID: ahLfBL+nRLyyBzWlgyJrXg==
X-CSE-MsgGUID: eCgbS4zETqe2nzNIWUx12A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="162623509"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Jul 2025 22:17:34 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uczwy-000FG7-0M;
	Sat, 19 Jul 2025 05:17:32 +0000
Date: Sat, 19 Jul 2025 13:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 4/4] ASoC: codecs: Add FourSemi FS2104/5S audio
 amplifier driver
Message-ID: <202507191205.zKv0OzkB-lkp@intel.com>
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
In-Reply-To: <20250718121221.76957-5-nick.li@foursemi.com>
References: <20250718121221.76957-5-nick.li@foursemi.com>
TO: Nick <nick.li@foursemi.com>
TO: lgirdwood@gmail.com
TO: broonie@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: perex@perex.cz
TO: tiwai@suse.com
TO: nick.li@foursemi.com
CC: xiaoming.yang@foursemi.com
CC: danyang.zheng@foursemi.com
CC: like.xy@foxmail.com
CC: linux-sound@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Nick,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ed73a24357531e1747a6e140c329015da6429629]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick/dt-bindings-vendor-prefixes-Add-Shanghai-FourSemi-Semiconductor-Co-Ltd/20250718-201609
base:   ed73a24357531e1747a6e140c329015da6429629
patch link:    https://lore.kernel.org/r/20250718121221.76957-5-nick.li%40foursemi.com
patch subject: [PATCH v3 4/4] ASoC: codecs: Add FourSemi FS2104/5S audio amplifier driver
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: parisc-randconfig-r071-20250719 (https://download.01.org/0day-ci/archive/20250719/202507191205.zKv0OzkB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507191205.zKv0OzkB-lkp@intel.com/

smatch warnings:
sound/soc/codecs/fs210x.c:1092 fs210x_playback_event() error: uninitialized symbol 'ret'.

vim +/ret +1092 sound/soc/codecs/fs210x.c

e1ecc687e0e6de Nick Li 2025-07-18  1056  
e1ecc687e0e6de Nick Li 2025-07-18  1057  static int fs210x_playback_event(struct snd_soc_dapm_widget *w,
e1ecc687e0e6de Nick Li 2025-07-18  1058  				 struct snd_kcontrol *kc, int event)
e1ecc687e0e6de Nick Li 2025-07-18  1059  {
e1ecc687e0e6de Nick Li 2025-07-18  1060  	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
e1ecc687e0e6de Nick Li 2025-07-18  1061  	struct fs210x_priv *fs210x = snd_soc_component_get_drvdata(cmpnt);
e1ecc687e0e6de Nick Li 2025-07-18  1062  	int ret;
e1ecc687e0e6de Nick Li 2025-07-18  1063  
e1ecc687e0e6de Nick Li 2025-07-18  1064  	mutex_lock(&fs210x->lock);
e1ecc687e0e6de Nick Li 2025-07-18  1065  
e1ecc687e0e6de Nick Li 2025-07-18  1066  	if (fs210x->is_suspended) {
e1ecc687e0e6de Nick Li 2025-07-18  1067  		mutex_unlock(&fs210x->lock);
e1ecc687e0e6de Nick Li 2025-07-18  1068  		return 0;
e1ecc687e0e6de Nick Li 2025-07-18  1069  	}
e1ecc687e0e6de Nick Li 2025-07-18  1070  
e1ecc687e0e6de Nick Li 2025-07-18  1071  	switch (event) {
e1ecc687e0e6de Nick Li 2025-07-18  1072  	case SND_SOC_DAPM_PRE_PMU:
e1ecc687e0e6de Nick Li 2025-07-18  1073  		/*
e1ecc687e0e6de Nick Li 2025-07-18  1074  		 * If there is no bclk for us to set the clock output,
e1ecc687e0e6de Nick Li 2025-07-18  1075  		 * we will enable the device(start_work) in dai trigger.
e1ecc687e0e6de Nick Li 2025-07-18  1076  		 */
e1ecc687e0e6de Nick Li 2025-07-18  1077  		if (!fs210x->clk_bclk)
e1ecc687e0e6de Nick Li 2025-07-18  1078  			break;
e1ecc687e0e6de Nick Li 2025-07-18  1079  		fs210x_bclk_set(fs210x, true);
e1ecc687e0e6de Nick Li 2025-07-18  1080  		ret = fs210x_dev_play(fs210x);
e1ecc687e0e6de Nick Li 2025-07-18  1081  		break;
e1ecc687e0e6de Nick Li 2025-07-18  1082  	case SND_SOC_DAPM_POST_PMD:
e1ecc687e0e6de Nick Li 2025-07-18  1083  		ret = fs210x_dev_stop(fs210x);
e1ecc687e0e6de Nick Li 2025-07-18  1084  		fs210x_bclk_set(fs210x, false);
e1ecc687e0e6de Nick Li 2025-07-18  1085  		break;
e1ecc687e0e6de Nick Li 2025-07-18  1086  	default:
e1ecc687e0e6de Nick Li 2025-07-18  1087  		break;
e1ecc687e0e6de Nick Li 2025-07-18  1088  	}
e1ecc687e0e6de Nick Li 2025-07-18  1089  
e1ecc687e0e6de Nick Li 2025-07-18  1090  	mutex_unlock(&fs210x->lock);
e1ecc687e0e6de Nick Li 2025-07-18  1091  
e1ecc687e0e6de Nick Li 2025-07-18 @1092  	return ret;
e1ecc687e0e6de Nick Li 2025-07-18  1093  }
e1ecc687e0e6de Nick Li 2025-07-18  1094  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
