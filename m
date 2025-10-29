Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455A52F260C
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 17:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761758546; cv=none; b=XilfjEd7pdd6MLh3HVkl2hHQHnsisMI4lff80cickkk5SUHQN+r3SdwJU6b2Y6+JkDwPtSyykYhTxyT99bh3XZeu4/QTsvGzHUpDCtTmoGJGHpFfQTK7YcJnbU4L66uOSkijsR7UGMEz49E3WmIebytG/+Zm9MpvAs2lhPt+Ul8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761758546; c=relaxed/simple;
	bh=UheHhC8VCpgKoId2bAtYtm0zyjMgPP+V6YWEbGZM05g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sDjsMUnqH85KQS/b/vWlQocRLreRnkA3NQwtC0YcBPS3Ja4pZMSitZn3WzzUBTQzXcMaVH0MrXWDEbsb89N030pntT5P7Bga6xNzzGjwQnyZRmF3GUMDRaUdY4iUPPjStLoCt4S/+Go7anyTnGjn53dzVoH12Z64xXHbO280J9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VGHFrR62; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VGHFrR62"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761758544; x=1793294544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UheHhC8VCpgKoId2bAtYtm0zyjMgPP+V6YWEbGZM05g=;
  b=VGHFrR624pO+c+4j/x4g3/E+MwmDsZSdaHsOkZsUDph/v1738EUH2ZsF
   Yh5nYSrqsYRjEb7xms+42+87NZnCOVMc26gq6AqWA1u2PrIbZfc/4yn3y
   ls3OkJNUqCgxqWlfOCHsCr7B+hjRZG32kGAK/tCjeceavcCSFEeAoV+da
   ZcRCBuNYU1YpaFAEaCcquMJVYRmTXHzx2p4URCi7KmYExjE5kWVBh4U9H
   1gg4D7rIh1AMFW0r0kgtOP4AaLD2l1nd1AZNc9tjn12XCztZjIum5LMMv
   9O6qs9HuJdm4QzhkKaRnTqxU7UzEF8IJZKrxuKUEkIm97YssBiH6X8Wjq
   g==;
X-CSE-ConnectionGUID: M+MFxr2GTJaID0EGl9cyxQ==
X-CSE-MsgGUID: fA0YitmdQoa3spJHhQ8meA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63984469"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="63984469"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 10:22:23 -0700
X-CSE-ConnectionGUID: 9L86FZHKQi6ShL93hDDoaw==
X-CSE-MsgGUID: nBlW5VXnSFKuGyLgdpkyeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="186179541"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2025 10:22:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE9s8-000KqD-0l;
	Wed, 29 Oct 2025 17:22:11 +0000
Date: Thu, 30 Oct 2025 01:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2226/4391]
 drivers/net/wireless/intel/iwlwifi/mld/rx.c:464 iwl_mld_decode_he_phy_data()
 error: uninitialized symbol 'nsts'.
Message-ID: <202510300101.souVJGhV-lkp@intel.com>
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
TO: Johannes Berg <johannes.berg@intel.com>
CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9ba12abc5282bf992f9a9ae87ad814fd03a0270
commit: 612d9bf252c65ab3ba772e7f31f8501394937ba7 [2226/4391] wifi: iwlwifi: mld: update to new sniffer API
:::::: branch date: 15 hours ago
:::::: commit date: 10 days ago
config: arm64-randconfig-r071-20251028 (https://download.01.org/0day-ci/archive/20251030/202510300101.souVJGhV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510300101.souVJGhV-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mld/rx.c:464 iwl_mld_decode_he_phy_data() error: uninitialized symbol 'nsts'.

vim +/nsts +464 drivers/net/wireless/intel/iwlwifi/mld/rx.c

d1e879ec600f9b Miri Korenblit 2025-02-16  430  
612d9bf252c65a Johannes Berg  2025-10-19  431  static void
612d9bf252c65a Johannes Berg  2025-10-19  432  iwl_mld_decode_he_phy_data(struct iwl_mld_rx_phy_data *phy_data,
612d9bf252c65a Johannes Berg  2025-10-19  433  			   struct ieee80211_radiotap_he *he,
612d9bf252c65a Johannes Berg  2025-10-19  434  			   struct ieee80211_radiotap_he_mu *he_mu,
612d9bf252c65a Johannes Berg  2025-10-19  435  			   struct ieee80211_rx_status *rx_status)
612d9bf252c65a Johannes Berg  2025-10-19  436  {
612d9bf252c65a Johannes Berg  2025-10-19  437  	u32 rate_n_flags = phy_data->rate_n_flags;
612d9bf252c65a Johannes Berg  2025-10-19  438  	u32 he_type = rate_n_flags & RATE_MCS_HE_TYPE_MSK;
612d9bf252c65a Johannes Berg  2025-10-19  439  	u32 nsts;
612d9bf252c65a Johannes Berg  2025-10-19  440  
612d9bf252c65a Johannes Berg  2025-10-19  441  	switch (he_type) {
612d9bf252c65a Johannes Berg  2025-10-19  442  	case RATE_MCS_HE_TYPE_TRIG:
612d9bf252c65a Johannes Berg  2025-10-19  443  		iwl_mld_decode_he_tb_phy_data(phy_data, he, rx_status);
612d9bf252c65a Johannes Berg  2025-10-19  444  		/* that's it, below is only for SU/MU */
612d9bf252c65a Johannes Berg  2025-10-19  445  		return;
612d9bf252c65a Johannes Berg  2025-10-19  446  	case RATE_MCS_HE_TYPE_MU:
612d9bf252c65a Johannes Berg  2025-10-19  447  		iwl_mld_decode_he_mu(phy_data, he, he_mu, rx_status);
612d9bf252c65a Johannes Berg  2025-10-19  448  
612d9bf252c65a Johannes Berg  2025-10-19  449  		nsts = le32_get_bits(phy_data->ntfy->sigs.he.b,
612d9bf252c65a Johannes Berg  2025-10-19  450  				     OFDM_RX_FRAME_HE_SIGB_NSTS) + 1;
d1e879ec600f9b Miri Korenblit 2025-02-16  451  		break;
612d9bf252c65a Johannes Berg  2025-10-19  452  	case RATE_MCS_HE_TYPE_SU:
612d9bf252c65a Johannes Berg  2025-10-19  453  	case RATE_MCS_HE_TYPE_EXT_SU:
d1e879ec600f9b Miri Korenblit 2025-02-16  454  		he->data1 |= cpu_to_le16(IEEE80211_RADIOTAP_HE_DATA1_BEAM_CHANGE_KNOWN);
612d9bf252c65a Johannes Berg  2025-10-19  455  		he->data3 |= RTAP_ENC_HE(phy_data->ntfy->sigs.he.a1,
612d9bf252c65a Johannes Berg  2025-10-19  456  					 OFDM_RX_FRAME_HE_BEAM_CHANGE,
d1e879ec600f9b Miri Korenblit 2025-02-16  457  					 IEEE80211_RADIOTAP_HE_DATA3_BEAM_CHANGE);
612d9bf252c65a Johannes Berg  2025-10-19  458  
612d9bf252c65a Johannes Berg  2025-10-19  459  		nsts = le32_get_bits(phy_data->ntfy->sigs.he.a1,
612d9bf252c65a Johannes Berg  2025-10-19  460  				     OFDM_RX_FRAME_HE_NSTS) + 1;
d1e879ec600f9b Miri Korenblit 2025-02-16  461  		break;
d1e879ec600f9b Miri Korenblit 2025-02-16  462  	}
612d9bf252c65a Johannes Berg  2025-10-19  463  
612d9bf252c65a Johannes Berg  2025-10-19 @464  	rx_status->nss = nsts >> !!(rate_n_flags & RATE_MCS_STBC_MSK);
612d9bf252c65a Johannes Berg  2025-10-19  465  
612d9bf252c65a Johannes Berg  2025-10-19  466  	he->data1 |= cpu_to_le16(IEEE80211_RADIOTAP_HE_DATA1_LDPC_XSYMSEG_KNOWN |
612d9bf252c65a Johannes Berg  2025-10-19  467  				 IEEE80211_RADIOTAP_HE_DATA1_DOPPLER_KNOWN);
612d9bf252c65a Johannes Berg  2025-10-19  468  	he->data2 |= cpu_to_le16(IEEE80211_RADIOTAP_HE_DATA2_PRE_FEC_PAD_KNOWN |
612d9bf252c65a Johannes Berg  2025-10-19  469  				 IEEE80211_RADIOTAP_HE_DATA2_PE_DISAMBIG_KNOWN |
612d9bf252c65a Johannes Berg  2025-10-19  470  				 IEEE80211_RADIOTAP_HE_DATA2_TXOP_KNOWN |
612d9bf252c65a Johannes Berg  2025-10-19  471  				 IEEE80211_RADIOTAP_HE_DATA2_NUM_LTF_SYMS_KNOWN);
612d9bf252c65a Johannes Berg  2025-10-19  472  
612d9bf252c65a Johannes Berg  2025-10-19  473  	he->data3 |= RTAP_ENC_HE(phy_data->ntfy->sigs.he.a2,
612d9bf252c65a Johannes Berg  2025-10-19  474  				 OFDM_RX_FRAME_HE_CODING_EXTRA_SYM,
612d9bf252c65a Johannes Berg  2025-10-19  475  				 IEEE80211_RADIOTAP_HE_DATA3_LDPC_XSYMSEG);
612d9bf252c65a Johannes Berg  2025-10-19  476  	he->data5 |= RTAP_ENC_HE(phy_data->ntfy->sigs.he.a2,
612d9bf252c65a Johannes Berg  2025-10-19  477  				 OFDM_RX_FRAME_HE_PRE_FEC_PAD_FACTOR,
612d9bf252c65a Johannes Berg  2025-10-19  478  				 IEEE80211_RADIOTAP_HE_DATA5_PRE_FEC_PAD);
612d9bf252c65a Johannes Berg  2025-10-19  479  	he->data5 |= RTAP_ENC_HE(phy_data->ntfy->sigs.he.a2,
612d9bf252c65a Johannes Berg  2025-10-19  480  				 OFDM_RX_FRAME_HE_PE_DISAMBIG,
612d9bf252c65a Johannes Berg  2025-10-19  481  				 IEEE80211_RADIOTAP_HE_DATA5_PE_DISAMBIG);
612d9bf252c65a Johannes Berg  2025-10-19  482  	he->data5 |= RTAP_ENC_HE(phy_data->ntfy->sigs.he.a2,
612d9bf252c65a Johannes Berg  2025-10-19  483  				 OFDM_RX_FRAME_HE_MU_NUM_OF_LTF_SYM,
612d9bf252c65a Johannes Berg  2025-10-19  484  				 IEEE80211_RADIOTAP_HE_DATA5_NUM_LTF_SYMS);
612d9bf252c65a Johannes Berg  2025-10-19  485  	he->data6 |= RTAP_ENC_HE(phy_data->ntfy->sigs.he.a2,
612d9bf252c65a Johannes Berg  2025-10-19  486  				 OFDM_RX_FRAME_HE_TXOP_DURATION,
612d9bf252c65a Johannes Berg  2025-10-19  487  				 IEEE80211_RADIOTAP_HE_DATA6_TXOP);
612d9bf252c65a Johannes Berg  2025-10-19  488  	he->data6 |= RTAP_ENC_HE(phy_data->ntfy->sigs.he.a2,
612d9bf252c65a Johannes Berg  2025-10-19  489  				 OFDM_RX_FRAME_HE_DOPPLER,
612d9bf252c65a Johannes Berg  2025-10-19  490  				 IEEE80211_RADIOTAP_HE_DATA6_DOPPLER);
612d9bf252c65a Johannes Berg  2025-10-19  491  
612d9bf252c65a Johannes Berg  2025-10-19  492  	he->data1 |= cpu_to_le16(IEEE80211_RADIOTAP_HE_DATA1_UL_DL_KNOWN |
612d9bf252c65a Johannes Berg  2025-10-19  493  				 IEEE80211_RADIOTAP_HE_DATA1_BSS_COLOR_KNOWN |
612d9bf252c65a Johannes Berg  2025-10-19  494  				 IEEE80211_RADIOTAP_HE_DATA1_SPTL_REUSE_KNOWN);
612d9bf252c65a Johannes Berg  2025-10-19  495  
612d9bf252c65a Johannes Berg  2025-10-19  496  	he->data3 |= RTAP_ENC_HE(phy_data->ntfy->sigs.he.a1,
612d9bf252c65a Johannes Berg  2025-10-19  497  				 OFDM_RX_FRAME_HE_BSS_COLOR,
612d9bf252c65a Johannes Berg  2025-10-19  498  				 IEEE80211_RADIOTAP_HE_DATA3_BSS_COLOR);
612d9bf252c65a Johannes Berg  2025-10-19  499  	he->data3 |= RTAP_ENC_HE(phy_data->ntfy->sigs.he.a1,
612d9bf252c65a Johannes Berg  2025-10-19  500  				 OFDM_RX_FRAME_HE_UL_FLAG,
612d9bf252c65a Johannes Berg  2025-10-19  501  				 IEEE80211_RADIOTAP_HE_DATA3_UL_DL);
612d9bf252c65a Johannes Berg  2025-10-19  502  	he->data4 |= RTAP_ENC_HE(phy_data->ntfy->sigs.he.a1,
612d9bf252c65a Johannes Berg  2025-10-19  503  				 OFDM_RX_FRAME_HE_SPATIAL_REUSE,
612d9bf252c65a Johannes Berg  2025-10-19  504  				 IEEE80211_RADIOTAP_HE_DATA4_SU_MU_SPTL_REUSE);
d1e879ec600f9b Miri Korenblit 2025-02-16  505  }
d1e879ec600f9b Miri Korenblit 2025-02-16  506  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
