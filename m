Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCCE1DE4CE
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 01:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538313; cv=none; b=ZU8OheLRPHYLEmWBBSSvEWZ/5t3XFvSL5ndAPME2rP/eCjnBzrzYhME4TnrJjT2CFecY3IefHi0a9ogWs/RMb3Z0ZFHZ1Vav4OEtOII1HQqfv/xFfbt7T+kZWOCHc4WEFhCSyaDbmvHCHDRHwh1OYMp/fPH8yitgGIVMc4ZsDAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538313; c=relaxed/simple;
	bh=+mrbhAhV/p61n1BxRk8JWBBEd8E/VNBitaLKEaVwAtE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UiNSyWyULzhII9oQzOprD7664T7lkxzs1mjx04d0/uxQj4vMEMPMBM0Nk/KHPGPYr6QT92WSF6bFHE0eZN/j+a+b+n/Vukkt9jeDPc3wFxgKy+y677zcKUDFguifPeSC1oJemQ7CUGnwEUZN06Ev+hZVKgZTbju0B5/Bdh4HOII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2ilw94y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2ilw94y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766538312; x=1798074312;
  h=date:from:to:cc:subject:message-id;
  bh=+mrbhAhV/p61n1BxRk8JWBBEd8E/VNBitaLKEaVwAtE=;
  b=U2ilw94yKeVv0oZbRc5Q0M3PzclCx4ZYC8mB3e4nrgNfkLQkPKr6UrfM
   ZJEyvQg0ghBa+CO5kMaRROXgTvpff9RZsk7Rw2pmOhkRAikiEe4c750Q9
   7dPzoCGgbAFBBAf6MJgBpnUiFgfW2IQqCJ02kTYO5Zr+a9k+CSjeOd/sP
   D49+gEvX2o5+93UPmfYiWwqGbFVmffmfKkjylhLzeWud7M+MKALF1eE+9
   PbUgRf0iWk/yGH5t5vVFIdqaWUjosBBV2zxbz3tYdXd13xhooJh4sMNY4
   GzjZdy7kZG6wEEy5AP+rmuxCfwjL9T2HJS3J8XnXNF0pW/hJWfko/xhs+
   w==;
X-CSE-ConnectionGUID: d6UcQCQOSFmjr2eWHMY7TQ==
X-CSE-MsgGUID: uwt51Q9tR6m0gf6YXmmW+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79835990"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="79835990"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 17:05:11 -0800
X-CSE-ConnectionGUID: HiShT/3jRlm2RAN2aDw+UQ==
X-CSE-MsgGUID: s3e7xG+pR9CUuPohX1g6GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="199141496"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Dec 2025 17:05:10 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYDJF-000000002Wx-1CSg;
	Wed, 24 Dec 2025 01:05:02 +0000
Date: Wed, 24 Dec 2025 09:04:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/ath/wcn36xx/smd.c:1988
 wcn36xx_smd_send_beacon() warn: potential spectre issue 'msg_body.beacon' [r]
Message-ID: <202512240945.s16QxOuf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <kees@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: d70da12453ac3797e0c54884305ccc894e8c817b hardening: Enable i386 FORTIFY_SOURCE on Clang 16+
date:   10 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-r072-20251224 (https://download.01.org/0day-ci/archive/20251224/202512240945.s16QxOuf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512240945.s16QxOuf-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/wcn36xx/smd.c:1988 wcn36xx_smd_send_beacon() warn: potential spectre issue 'msg_body.beacon' [r]

Old smatch warnings:
drivers/net/wireless/ath/wcn36xx/smd.c:521 wcn36xx_smd_load_nv() error: we previously assumed 'wcn->nv' could be null (see line 512)
drivers/net/wireless/ath/wcn36xx/smd.c:569 wcn36xx_smd_load_nv() warn: 'wcn->nv' from request_firmware() not released on lines: 569.

vim +1988 drivers/net/wireless/ath/wcn36xx/smd.c

8e84c25821698b Eugene Krasnikov 2013-10-08  1948  
8e84c25821698b Eugene Krasnikov 2013-10-08  1949  int wcn36xx_smd_send_beacon(struct wcn36xx *wcn, struct ieee80211_vif *vif,
8e84c25821698b Eugene Krasnikov 2013-10-08  1950  			    struct sk_buff *skb_beacon, u16 tim_off,
8e84c25821698b Eugene Krasnikov 2013-10-08  1951  			    u16 p2p_off)
8e84c25821698b Eugene Krasnikov 2013-10-08  1952  {
8e84c25821698b Eugene Krasnikov 2013-10-08  1953  	struct wcn36xx_hal_send_beacon_req_msg msg_body;
f0eea2772a6baf Daniel Mack      2018-06-29  1954  	int ret, pad, pvm_len;
8e84c25821698b Eugene Krasnikov 2013-10-08  1955  
8e84c25821698b Eugene Krasnikov 2013-10-08  1956  	mutex_lock(&wcn->hal_mutex);
8e84c25821698b Eugene Krasnikov 2013-10-08  1957  	INIT_HAL_MSG(msg_body, WCN36XX_HAL_SEND_BEACON_REQ);
8e84c25821698b Eugene Krasnikov 2013-10-08  1958  
91c3eeba45e13a Pontus Fuchs     2016-04-18  1959  	pvm_len = skb_beacon->data[tim_off + 1] - 3;
91c3eeba45e13a Pontus Fuchs     2016-04-18  1960  	pad = TIM_MIN_PVM_SIZE - pvm_len;
8e84c25821698b Eugene Krasnikov 2013-10-08  1961  
91c3eeba45e13a Pontus Fuchs     2016-04-18  1962  	/* Padding is irrelevant to mesh mode since tim_off is always 0. */
91c3eeba45e13a Pontus Fuchs     2016-04-18  1963  	if (vif->type == NL80211_IFTYPE_MESH_POINT)
91c3eeba45e13a Pontus Fuchs     2016-04-18  1964  		pad = 0;
91c3eeba45e13a Pontus Fuchs     2016-04-18  1965  
91c3eeba45e13a Pontus Fuchs     2016-04-18  1966  	msg_body.beacon_length = skb_beacon->len + pad;
25d217d6e07234 Pontus Fuchs     2016-04-18  1967  	/* TODO need to find out why + 6 is needed */
25d217d6e07234 Pontus Fuchs     2016-04-18  1968  	msg_body.beacon_length6 = msg_body.beacon_length + 6;
8e84c25821698b Eugene Krasnikov 2013-10-08  1969  
25d217d6e07234 Pontus Fuchs     2016-04-18  1970  	if (msg_body.beacon_length > BEACON_TEMPLATE_SIZE) {
d7809bd9eae67b Colin Ian King   2020-01-23  1971  		wcn36xx_err("Beacon is too big: beacon size=%d\n",
8e84c25821698b Eugene Krasnikov 2013-10-08  1972  			      msg_body.beacon_length);
95b48c2cdae764 Dan Carpenter    2013-11-08  1973  		ret = -ENOMEM;
95b48c2cdae764 Dan Carpenter    2013-11-08  1974  		goto out;
8e84c25821698b Eugene Krasnikov 2013-10-08  1975  	}
25d217d6e07234 Pontus Fuchs     2016-04-18  1976  	memcpy(msg_body.beacon, skb_beacon->data, skb_beacon->len);
8e84c25821698b Eugene Krasnikov 2013-10-08  1977  	memcpy(msg_body.bssid, vif->addr, ETH_ALEN);
8e84c25821698b Eugene Krasnikov 2013-10-08  1978  
91c3eeba45e13a Pontus Fuchs     2016-04-18  1979  	if (pad > 0) {
91c3eeba45e13a Pontus Fuchs     2016-04-18  1980  		/*
91c3eeba45e13a Pontus Fuchs     2016-04-18  1981  		 * The wcn36xx FW has a fixed size for the PVM in the TIM. If
91c3eeba45e13a Pontus Fuchs     2016-04-18  1982  		 * given the beacon template from mac80211 with a PVM shorter
91c3eeba45e13a Pontus Fuchs     2016-04-18  1983  		 * than the FW expectes it will overwrite the data after the
91c3eeba45e13a Pontus Fuchs     2016-04-18  1984  		 * TIM.
91c3eeba45e13a Pontus Fuchs     2016-04-18  1985  		 */
91c3eeba45e13a Pontus Fuchs     2016-04-18  1986  		wcn36xx_dbg(WCN36XX_DBG_HAL, "Pad TIM PVM. %d bytes at %d\n",
91c3eeba45e13a Pontus Fuchs     2016-04-18  1987  			    pad, pvm_len);
91c3eeba45e13a Pontus Fuchs     2016-04-18 @1988  		memmove(&msg_body.beacon[tim_off + 5 + pvm_len + pad],
91c3eeba45e13a Pontus Fuchs     2016-04-18  1989  			&msg_body.beacon[tim_off + 5 + pvm_len],
91c3eeba45e13a Pontus Fuchs     2016-04-18  1990  			skb_beacon->len - (tim_off + 5 + pvm_len));
91c3eeba45e13a Pontus Fuchs     2016-04-18  1991  		memset(&msg_body.beacon[tim_off + 5 + pvm_len], 0, pad);
91c3eeba45e13a Pontus Fuchs     2016-04-18  1992  		msg_body.beacon[tim_off + 1] += pad;
91c3eeba45e13a Pontus Fuchs     2016-04-18  1993  	}
91c3eeba45e13a Pontus Fuchs     2016-04-18  1994  
8e84c25821698b Eugene Krasnikov 2013-10-08  1995  	/* TODO need to find out why this is needed? */
fa643ae2ce4e75 Chun-Yeow Yeoh   2013-12-06  1996  	if (vif->type == NL80211_IFTYPE_MESH_POINT)
fa643ae2ce4e75 Chun-Yeow Yeoh   2013-12-06  1997  		/* mesh beacon don't need this, so push further down */
fa643ae2ce4e75 Chun-Yeow Yeoh   2013-12-06  1998  		msg_body.tim_ie_offset = 256;
fa643ae2ce4e75 Chun-Yeow Yeoh   2013-12-06  1999  	else
8e84c25821698b Eugene Krasnikov 2013-10-08  2000  		msg_body.tim_ie_offset = tim_off+4;
8e84c25821698b Eugene Krasnikov 2013-10-08  2001  	msg_body.p2p_ie_offset = p2p_off;
8e84c25821698b Eugene Krasnikov 2013-10-08  2002  	PREPARE_HAL_BUF(wcn->hal_buf, msg_body);
8e84c25821698b Eugene Krasnikov 2013-10-08  2003  
8e84c25821698b Eugene Krasnikov 2013-10-08  2004  	wcn36xx_dbg(WCN36XX_DBG_HAL,
8e84c25821698b Eugene Krasnikov 2013-10-08  2005  		    "hal send beacon beacon_length %d\n",
8e84c25821698b Eugene Krasnikov 2013-10-08  2006  		    msg_body.beacon_length);
8e84c25821698b Eugene Krasnikov 2013-10-08  2007  
8e84c25821698b Eugene Krasnikov 2013-10-08  2008  	ret = wcn36xx_smd_send_and_wait(wcn, msg_body.header.len);
8e84c25821698b Eugene Krasnikov 2013-10-08  2009  	if (ret) {
8e84c25821698b Eugene Krasnikov 2013-10-08  2010  		wcn36xx_err("Sending hal_send_beacon failed\n");
8e84c25821698b Eugene Krasnikov 2013-10-08  2011  		goto out;
8e84c25821698b Eugene Krasnikov 2013-10-08  2012  	}
8e84c25821698b Eugene Krasnikov 2013-10-08  2013  	ret = wcn36xx_smd_rsp_status_check(wcn->hal_buf, wcn->hal_rsp_len);
8e84c25821698b Eugene Krasnikov 2013-10-08  2014  	if (ret) {
8e84c25821698b Eugene Krasnikov 2013-10-08  2015  		wcn36xx_err("hal_send_beacon response failed err=%d\n", ret);
8e84c25821698b Eugene Krasnikov 2013-10-08  2016  		goto out;
8e84c25821698b Eugene Krasnikov 2013-10-08  2017  	}
8e84c25821698b Eugene Krasnikov 2013-10-08  2018  out:
8e84c25821698b Eugene Krasnikov 2013-10-08  2019  	mutex_unlock(&wcn->hal_mutex);
8e84c25821698b Eugene Krasnikov 2013-10-08  2020  	return ret;
8e84c25821698b Eugene Krasnikov 2013-10-08  2021  }
8e84c25821698b Eugene Krasnikov 2013-10-08  2022  

:::::: The code at line 1988 was first introduced by commit
:::::: 91c3eeba45e13ab7edfb50610df8672d52809394 wcn36xx: Pad TIM PVM if needed

:::::: TO: Pontus Fuchs <pontus.fuchs@gmail.com>
:::::: CC: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
