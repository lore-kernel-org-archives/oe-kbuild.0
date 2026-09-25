Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365683AEB40
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 13:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341964; cv=none; b=tJxdAyg87CbYKIv0GBAVtvEStfKJC9fv2upv+OvwICepzb0+ZQMEJlERA2gl1tVmNU4s2njJhBcIs7KlbXlIueWrfxE8uuUq2t3lrUh+s6Lyzp0cMOJCtvS4yi388DMoWRvp/B/tg/BMlZfXP3KdaifkfWEOPXveXje39Zwo8Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341964; c=relaxed/simple;
	bh=MjdQmcIXkT6iEZcscRRG+IyYIXpUKOjVorO5WQoz3Fs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=krH3TgHObSYPFui+pI5/LirNUZXEV8B4nKRTlU7iVKTDmhD+hPCZAcvua9Z2rErc91T2t3PsDZSw9rrbJYpUDfMznrc1ycnniK+M+9jOL9k1+M926ePBvxy9SRQoREDysWnFVfSWNApiR6rTqo6oCPwYh0Z/ZNp7CKnxIBa7E20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzbODWj8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzbODWj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790341962; x=1821877962;
  h=date:from:to:cc:subject:message-id;
  bh=MjdQmcIXkT6iEZcscRRG+IyYIXpUKOjVorO5WQoz3Fs=;
  b=UzbODWj8ebLy+KAn3d4Z1qvQH9HdMQQELWyHsmTwBg1Y9lh3nQRiv/H9
   9hMQO7SkL8aetN3N7+eNPx8eMswK02TVkJ7qMLwp9pQcpa24ydpYT1F+L
   Orq2Xjl3gf9249alKjsnNPrcucQprqwM1oO++xxSDufv1zuaqB/9JluHs
   7ovcCfxyVVsNznOZkoSEtvF5GxZsJWCkeWp5/nUAQa0GoZ0JbrTxFjfIV
   m6Tl1PbTma3CQ32JAdpGLWIzNd0l4K/g+K5RVnR1BbT/QiXyHWkjsmQ+G
   phzUB3VP55CmZsRDpXYRupBa4q3JyKPzlT24n/+pRPWQ3tFcfAUTqXGBt
   Q==;
X-CSE-ConnectionGUID: RWRban6bTGiY21FKqr5utQ==
X-CSE-MsgGUID: B6aKX1d3SSWtR9O54kWVNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89990109"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="89990109"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 06:12:42 -0700
X-CSE-ConnectionGUID: Sim1Fyt/TQ+0XdBkqLtrmg==
X-CSE-MsgGUID: IQ13icoiRkSfyuvV+T2oSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="270820142"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Sep 2026 06:12:41 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA5jC-000000000lW-2ei7;
	Fri, 25 Sep 2026 13:12:38 +0000
Date: Fri, 25 Sep 2026 15:12:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arnd-playground:randconfig-7.3-next 448/673]
 fs/exfat/file.c:575:1: warning: the frame size of 788 bytes is larger than
 768 bytes
Message-ID: <202609251538.OEaGBwuE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 9c85f63886c9ecf71773bacb7ed5524bc5dfce52 [448/673] Kbuild: rework stack frame warn logic
:::::: branch date: 6 days ago
:::::: commit date: 9 days ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260925/202609251538.OEaGBwuE-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251538.OEaGBwuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609251538.OEaGBwuE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/exfat/file.c: In function 'exfat_ioctl_get_volume_label':
>> fs/exfat/file.c:575:1: warning: the frame size of 788 bytes is larger than 768 bytes [-Wframe-larger-than=]
     575 | }
         | ^
   fs/exfat/file.c: In function 'exfat_ioctl_set_volume_label':
   fs/exfat/file.c:604:1: warning: the frame size of 792 bytes is larger than 768 bytes [-Wframe-larger-than=]
     604 | }
         | ^
--
   drivers/mtd/inftlcore.c: In function 'INFTL_foldchain.isra':
>> drivers/mtd/inftlcore.c:393:1: warning: the frame size of 804 bytes is larger than 768 bytes [-Wframe-larger-than=]
     393 | }
         | ^
--
   drivers/accessibility/speakup/devsynth.c: In function 'speakup_file_writeu':
>> drivers/accessibility/speakup/devsynth.c:95:1: warning: the frame size of 796 bytes is larger than 768 bytes [-Wframe-larger-than=]
      95 | }
         | ^
--
   drivers/iio/light/tsl2772.c: In function 'tsl2772_prox_cal':
>> drivers/iio/light/tsl2772.c:907:1: warning: the frame size of 808 bytes is larger than 768 bytes [-Wframe-larger-than=]
     907 | }
         | ^
--
   drivers/interconnect/qcom/bcm-voter.c: In function 'qcom_icc_bcm_voter_commit':
>> drivers/interconnect/qcom/bcm-voter.c:367:1: warning: the frame size of 836 bytes is larger than 768 bytes [-Wframe-larger-than=]
     367 | }
         | ^
--
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c: In function 'brcmf_feat_firmware_capabilities':
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c:253:1: warning: the frame size of 772 bytes is larger than 768 bytes [-Wframe-larger-than=]
     253 | }
         | ^
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c: In function 'brcmf_feat_fwcap_debugfs_read':
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c:289:1: warning: the frame size of 780 bytes is larger than 768 bytes [-Wframe-larger-than=]
     289 | }
         | ^
--
   drivers/net/wireless/realtek/rtlwifi/rtl8192c/phy_common.c: In function '_rtl92c_phy_sw_chnl_step_by_step':
>> drivers/net/wireless/realtek/rtlwifi/rtl8192c/phy_common.c:887:1: warning: the frame size of 812 bytes is larger than 768 bytes [-Wframe-larger-than=]
     887 | }
         | ^
--
   drivers/net/wireless/realtek/rtw88/rtw8822c.c: In function 'rtw8822c_dac_cal_rf_mode':
>> drivers/net/wireless/realtek/rtw88/rtw8822c.c:376:1: warning: the frame size of 816 bytes is larger than 768 bytes [-Wframe-larger-than=]
     376 | }
         | ^


vim +575 fs/exfat/file.c

f761fcdd289d07 Dongliang Cui  2024-09-18  556  
d01579d590f72d Ethan Ferguson 2025-09-30  557  static int exfat_ioctl_get_volume_label(struct super_block *sb, unsigned long arg)
d01579d590f72d Ethan Ferguson 2025-09-30  558  {
d01579d590f72d Ethan Ferguson 2025-09-30  559  	int ret;
d01579d590f72d Ethan Ferguson 2025-09-30  560  	char label[FSLABEL_MAX] = {0};
d01579d590f72d Ethan Ferguson 2025-09-30  561  	struct exfat_uni_name uniname;
d01579d590f72d Ethan Ferguson 2025-09-30  562  
d01579d590f72d Ethan Ferguson 2025-09-30  563  	ret = exfat_read_volume_label(sb, &uniname);
d01579d590f72d Ethan Ferguson 2025-09-30  564  	if (ret < 0)
d01579d590f72d Ethan Ferguson 2025-09-30  565  		return ret;
d01579d590f72d Ethan Ferguson 2025-09-30  566  
27af3392196ddf Yang Wen       2026-08-10  567  	ret = exfat_utf16_to_nls(sb, &uniname, label, sizeof(label));
d01579d590f72d Ethan Ferguson 2025-09-30  568  	if (ret < 0)
d01579d590f72d Ethan Ferguson 2025-09-30  569  		return ret;
d01579d590f72d Ethan Ferguson 2025-09-30  570  
d01579d590f72d Ethan Ferguson 2025-09-30  571  	if (copy_to_user((char __user *)arg, label, ret + 1))
d01579d590f72d Ethan Ferguson 2025-09-30  572  		return -EFAULT;
d01579d590f72d Ethan Ferguson 2025-09-30  573  
d01579d590f72d Ethan Ferguson 2025-09-30  574  	return 0;
d01579d590f72d Ethan Ferguson 2025-09-30 @575  }
d01579d590f72d Ethan Ferguson 2025-09-30  576  

:::::: The code at line 575 was first introduced by commit
:::::: d01579d590f72d2d91405b708e96f6169f24775a exfat: Add support for FS_IOC_{GET,SET}FSLABEL

:::::: TO: Ethan Ferguson <ethan.ferguson@zetier.com>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
