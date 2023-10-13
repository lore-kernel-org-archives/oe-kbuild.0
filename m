Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1B422F1E
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 22:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyMA8Wr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697236932; x=1728772932;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4Q3UvYbC4OTSH/EzCfwW2KrHCjZnPPoA1o/mpWS+3mI=;
  b=fyMA8Wr4Cw2Ok/tuKdrBhR9cfZc9rMDjgDfovUJTC4jLGT3CQw4dbALe
   LjHLuMTEVZ6qYGpANXc74O0xBBS0xnoIQ0QoBlDCpwCw1ljyO0S6IJaSk
   RUcc29KETcR2yFOg+LlHy3wQfPGBmDM1bxXC6GW4Az9yuV4oObOHscLzY
   O9qFOR0HSnknrPglZUuiFVoO7OIqmnc94lpYE+MxjE6OD4W6nXUgmcXXa
   M/ACwvhME3K46ZqOAriWxcbnVfjNwH2W4cxKdkuQv5Zq3tlpzccdCT52t
   n4w+DAIj+Y6xg9p41icj6RUbH5UgdtzZ1+WGIJSADCB9p8mezKxfR28Pu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="385118853"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="385118853"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 15:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="845646525"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="845646525"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Oct 2023 15:41:57 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrQqw-0005Tf-3B;
	Fri, 13 Oct 2023 22:41:54 +0000
Date: Sat, 14 Oct 2023 06:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:pr/208 1/1]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7455
 brcmf_get_bwcap() warn: ignoring unreachable code.
Message-ID: <202310140627.FEmReRFq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Berlin <dberlin@dberlin.org>

tree:   https://github.com/AsahiLinux/linux pr/208
head:   f82c1849a64ad37b55d74b1cc4681e819c068b93
commit: f82c1849a64ad37b55d74b1cc4681e819c068b93 [1/1] Fix invalid frequency issues and issues with HE supporting/only AP's
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20231013 (https://download.01.org/0day-ci/archive/20231014/202310140627.FEmReRFq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310140627.FEmReRFq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310140627.FEmReRFq-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7455 brcmf_get_bwcap() warn: ignoring unreachable code.

Old smatch warnings:
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3982 brcmf_get_netinfo_array() error: uninitialized symbol 'netinfo'.
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:4006 brcmf_get_netinfo_v3_array() error: uninitialized symbol 'netinfo'.
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:5369 brcmf_cfg80211_start_ap() warn: inconsistent indenting

vim +7455 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

aa70b4fa43dfe5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-07-12  7439  
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7440  static void brcmf_get_bwcap(struct brcmf_if *ifp, u32 bw_cap[], bool has_6g)
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7441  {
16e64676839633 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Rafał Miłecki       2019-02-15  7442  	struct brcmf_pub *drvr = ifp->drvr;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7443  	u32 band, mimo_bwcap;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7444  	int err;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7445  
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7446  	band = WLC_BAND_2G;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7447  	err = brcmf_fil_iovar_int_get(ifp, "bw_cap", &band);
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7448  	if (!err) {
57fbcce37be7c1 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Johannes Berg       2016-04-12  7449  		bw_cap[NL80211_BAND_2GHZ] = band;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7450  		band = WLC_BAND_5G;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7451  		err = brcmf_fil_iovar_int_get(ifp, "bw_cap", &band);
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7452  		if (!err) {
57fbcce37be7c1 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Johannes Berg       2016-04-12  7453  			bw_cap[NL80211_BAND_5GHZ] = band;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7454  			return;
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08 @7455  			if (!has_6g)
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7456  				return;
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7457  			band = WLC_BAND_6G;
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7458  			err = brcmf_fil_iovar_int_get(ifp, "bw_cap", &band);
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7459  			if (!err) {
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7460  				bw_cap[NL80211_BAND_6GHZ] = band;
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7461  				return;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7462  			}
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7463  			return;
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7464  		}
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7465  
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7466  		WARN_ON(1);
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7467  		return;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7468  	}
f82c1849a64ad3 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Daniel Berlin       2023-10-08  7469  
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7470  	brcmf_dbg(INFO, "fallback to mimo_bw_cap info\n");
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7471  	mimo_bwcap = 0;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7472  	err = brcmf_fil_iovar_int_get(ifp, "mimo_bw_cap", &mimo_bwcap);
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7473  	if (err)
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7474  		/* assume 20MHz if firmware does not give a clue */
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7475  		mimo_bwcap = WLC_N_BW_20ALL;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7476  
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7477  	switch (mimo_bwcap) {
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7478  	case WLC_N_BW_40ALL:
57fbcce37be7c1 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Johannes Berg       2016-04-12  7479  		bw_cap[NL80211_BAND_2GHZ] |= WLC_BW_40MHZ_BIT;
0bde10dc553d27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Gustavo A. R. Silva 2020-08-21  7480  		fallthrough;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7481  	case WLC_N_BW_20IN2G_40IN5G:
57fbcce37be7c1 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Johannes Berg       2016-04-12  7482  		bw_cap[NL80211_BAND_5GHZ] |= WLC_BW_40MHZ_BIT;
0bde10dc553d27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Gustavo A. R. Silva 2020-08-21  7483  		fallthrough;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7484  	case WLC_N_BW_20ALL:
57fbcce37be7c1 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Johannes Berg       2016-04-12  7485  		bw_cap[NL80211_BAND_2GHZ] |= WLC_BW_20MHZ_BIT;
57fbcce37be7c1 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Johannes Berg       2016-04-12  7486  		bw_cap[NL80211_BAND_5GHZ] |= WLC_BW_20MHZ_BIT;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7487  		break;
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7488  	default:
16e64676839633 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Rafał Miłecki       2019-02-15  7489  		bphy_err(drvr, "invalid mimo_bw_cap value\n");
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7490  	}
2375d9701bb2f5 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel    2014-01-06  7491  }
d48200ba45dd2e drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman      2013-04-03  7492  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
