Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3F2286D5C
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Nov 2025 06:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762498487; cv=none; b=dKrs6xp2k7EdUrN+8QPV71AsPNEfD4rEpKSDaMwmDCWZVZ/xx8iYbmZbLkPvOpD5UhQumsH36zYAqcnSuKmOuZLSyfBU/xeoB3saithbuKOwKId6ChkibbVRQuNg7c2Y0iQFEVfTm97+kT45QsbWXXkNBR/h8BjWg3IJKbEO5KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762498487; c=relaxed/simple;
	bh=8vkSFv8i09DS6k3XisYD0DqfniiDnODx8311o5ujNZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tp1P1uN3T7VfNeuz9VrQdkRupmDx5u4dRxUu0xsTqbiVrKbPWDFDoliOlrtktEK7237yI7MGwNmEQmmlaY3zjBlK+RBFlpXPl/KHUoV7LGpFXdd7mNft6G1U7pcbfojmveoL+1/hyHKtU2f2cZy4RY/ci25iNZgmMXrEBaxJhO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ji7vkaB0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ji7vkaB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762498486; x=1794034486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8vkSFv8i09DS6k3XisYD0DqfniiDnODx8311o5ujNZE=;
  b=Ji7vkaB0uYTdtMmDnGSQOXgn8F6pWMAw2Y9vsAshXDdJkeHT2TFAQAb2
   6GpcsMunwE1f2DS7IwxjNWxHBp/ZoJTorxKxoM1JiSq1yE+8reMOE/Gx9
   gjz2+/yklDI3+tSiNLSu8HCXzs6sL5w/Q1M4GvufaQiEROGmbsQIufJB6
   BkFNnumvO5PzFFEXWk5pYzNzxCWbk3pjaggTjnSQ4vUsLTnvO2Npyvhfk
   hhHTNLbYjHF2HsEGvZx86tjhKURXAvgOAQD3gn8sx48m+nRfxXO38A/5o
   qxVTYD9bQV9BxF5vJPez2NoVfF/GeDTTIBNesQyMHDxL4ipWM7cM4sT1d
   A==;
X-CSE-ConnectionGUID: wfqN4MyhSBaPQqrrvGrswA==
X-CSE-MsgGUID: IHs1e+pQQhO3gOm3Kic4dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75255858"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="75255858"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 22:54:45 -0800
X-CSE-ConnectionGUID: p7LiwNVDStGhmwE3n5Fl+w==
X-CSE-MsgGUID: V6uPtgobTl2P4bpt3FUrjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="187270537"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 06 Nov 2025 22:54:45 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHGMr-000Uos-21;
	Fri, 07 Nov 2025 06:54:41 +0000
Date: Fri, 7 Nov 2025 14:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/usb/qcom/mixer_usb_offload.c:154 snd_usb_offload_create_ctl()
 error: uninitialized symbol 'ret'.
Message-ID: <202511071440.nFqObUzj-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Wesley Cheng <quic_wcheng@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a0c9b3391999818e2c5b93719699b255be1f682
commit: a67656f011d18c58a1e5c6744ba7d6061b5bfd3b ALSA: usb-audio: qcom: Add USB offload route kcontrol
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: arc-randconfig-r072-20251107 (https://download.01.org/0day-ci/archive/20251107/202511071440.nFqObUzj-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511071440.nFqObUzj-lkp@intel.com/

smatch warnings:
sound/usb/qcom/mixer_usb_offload.c:154 snd_usb_offload_create_ctl() error: uninitialized symbol 'ret'.

vim +/ret +154 sound/usb/qcom/mixer_usb_offload.c

a67656f011d18c Wesley Cheng 2025-04-09  100  
a67656f011d18c Wesley Cheng 2025-04-09  101  /**
a67656f011d18c Wesley Cheng 2025-04-09  102   * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
a67656f011d18c Wesley Cheng 2025-04-09  103   * @chip: USB SND chip device
a67656f011d18c Wesley Cheng 2025-04-09  104   * @bedev: Reference to USB backend DAI device
a67656f011d18c Wesley Cheng 2025-04-09  105   *
a67656f011d18c Wesley Cheng 2025-04-09  106   * Creates a sound control for a USB audio device, so that applications can
a67656f011d18c Wesley Cheng 2025-04-09  107   * query for if there is an available USB audio offload path, and which
a67656f011d18c Wesley Cheng 2025-04-09  108   * card is managing it.
a67656f011d18c Wesley Cheng 2025-04-09  109   */
a67656f011d18c Wesley Cheng 2025-04-09  110  int snd_usb_offload_create_ctl(struct snd_usb_audio *chip, struct device *bedev)
a67656f011d18c Wesley Cheng 2025-04-09  111  {
a67656f011d18c Wesley Cheng 2025-04-09  112  	struct snd_kcontrol_new *chip_kctl;
a67656f011d18c Wesley Cheng 2025-04-09  113  	struct snd_usb_substream *subs;
a67656f011d18c Wesley Cheng 2025-04-09  114  	struct snd_usb_stream *as;
a67656f011d18c Wesley Cheng 2025-04-09  115  	char ctl_name[48];
a67656f011d18c Wesley Cheng 2025-04-09  116  	int ret;
a67656f011d18c Wesley Cheng 2025-04-09  117  
a67656f011d18c Wesley Cheng 2025-04-09  118  	list_for_each_entry(as, &chip->pcm_list, list) {
a67656f011d18c Wesley Cheng 2025-04-09  119  		subs = &as->substream[SNDRV_PCM_STREAM_PLAYBACK];
a67656f011d18c Wesley Cheng 2025-04-09  120  		if (!subs->ep_num || as->pcm_index > 0xff)
a67656f011d18c Wesley Cheng 2025-04-09  121  			continue;
a67656f011d18c Wesley Cheng 2025-04-09  122  
a67656f011d18c Wesley Cheng 2025-04-09  123  		chip_kctl = &snd_usb_offload_mapped_card_ctl;
a67656f011d18c Wesley Cheng 2025-04-09  124  		chip_kctl->count = 1;
a67656f011d18c Wesley Cheng 2025-04-09  125  		/*
a67656f011d18c Wesley Cheng 2025-04-09  126  		 * Store the associated USB SND card number and PCM index for
a67656f011d18c Wesley Cheng 2025-04-09  127  		 * the kctl.
a67656f011d18c Wesley Cheng 2025-04-09  128  		 */
a67656f011d18c Wesley Cheng 2025-04-09  129  		chip_kctl->private_value = as->pcm_index |
a67656f011d18c Wesley Cheng 2025-04-09  130  					  chip->card->number << 16;
a67656f011d18c Wesley Cheng 2025-04-09  131  		sprintf(ctl_name, "USB Offload Playback Card Route PCM#%d",
a67656f011d18c Wesley Cheng 2025-04-09  132  			as->pcm_index);
a67656f011d18c Wesley Cheng 2025-04-09  133  		chip_kctl->name = ctl_name;
a67656f011d18c Wesley Cheng 2025-04-09  134  		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl, bedev));
a67656f011d18c Wesley Cheng 2025-04-09  135  		if (ret < 0)
a67656f011d18c Wesley Cheng 2025-04-09  136  			break;
a67656f011d18c Wesley Cheng 2025-04-09  137  
a67656f011d18c Wesley Cheng 2025-04-09  138  		chip_kctl = &snd_usb_offload_mapped_pcm_ctl;
a67656f011d18c Wesley Cheng 2025-04-09  139  		chip_kctl->count = 1;
a67656f011d18c Wesley Cheng 2025-04-09  140  		/*
a67656f011d18c Wesley Cheng 2025-04-09  141  		 * Store the associated USB SND card number and PCM index for
a67656f011d18c Wesley Cheng 2025-04-09  142  		 * the kctl.
a67656f011d18c Wesley Cheng 2025-04-09  143  		 */
a67656f011d18c Wesley Cheng 2025-04-09  144  		chip_kctl->private_value = as->pcm_index |
a67656f011d18c Wesley Cheng 2025-04-09  145  					  chip->card->number << 16;
a67656f011d18c Wesley Cheng 2025-04-09  146  		sprintf(ctl_name, "USB Offload Playback PCM Route PCM#%d",
a67656f011d18c Wesley Cheng 2025-04-09  147  			as->pcm_index);
a67656f011d18c Wesley Cheng 2025-04-09  148  		chip_kctl->name = ctl_name;
a67656f011d18c Wesley Cheng 2025-04-09  149  		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl, bedev));
a67656f011d18c Wesley Cheng 2025-04-09  150  		if (ret < 0)
a67656f011d18c Wesley Cheng 2025-04-09  151  			break;
a67656f011d18c Wesley Cheng 2025-04-09  152  	}
a67656f011d18c Wesley Cheng 2025-04-09  153  
a67656f011d18c Wesley Cheng 2025-04-09 @154  	return ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
