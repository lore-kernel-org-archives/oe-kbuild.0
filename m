Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA98413B5A0
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Sep 2024 22:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726784251; cv=none; b=AyNvV6OE2UtxrmPlg99VHUHsAs5FgUJR8IanjFiY6XeR2hB73V2iYtKwpfXg6VZztzShPZMjye2SNoOGurDLYd/CVMxfu08BtYnJMvD4CRb9soUDa0bn5AipOoWCVpa0EW4wh+BI1Z2DBlMXLsZ59/jSzdVw+TE4tP5J/2s3eeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726784251; c=relaxed/simple;
	bh=7hk2VGH/ju4j+G1CA48InYgkLG//PeMjcEMqdPZXvHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JBvXiTpI9vMopdHl5XUaSKuJQNx7vOsld4xK8H3SGhw7bVg3X+Jb+xcCCmrcZtBMlCq6EtSXoSm0Nz6r2QV9elpdSs8oDoEB1Y4dJZit1Xy4EDekOG1gTjMjLqzgypQekL/7RKJ17q05x/3YOHtAjNpSKprTdFFiMG0KOh1vDrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=li9KkrRq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="li9KkrRq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726784248; x=1758320248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7hk2VGH/ju4j+G1CA48InYgkLG//PeMjcEMqdPZXvHg=;
  b=li9KkrRq+slZw1EMRFDCeR5esO4zmOHk6haTArscXb8fTat0mdhRY9L3
   ni8vNda/bQyVhCpNvaHhGbPkLqxyjmN89Epe5Qh1g/aLgDRWwVmGXhzMP
   oP3eZlwhlgLIw82oKc67kqV1nHdeKASkB+Ov4NS5RimHE7drBOpVyuOhK
   LVmobilyVKOE7E7U7y2QVoeF3n7HK+ZfgDIromOBiyeJ681Ne2ZcirIvH
   c5TurkTeOB1TV91d6azV8HYXuSC7T3b2TvtZ8vixp8f1JcaxMO+6KtQbF
   d5Iqe3BbM3a8yfo8g5GiONsEkipzA0Xiflj1jMx0AFXdb4enDkQnEqCS7
   A==;
X-CSE-ConnectionGUID: 7e0NBuf0Qmupz8Mgc9m1rQ==
X-CSE-MsgGUID: a+kmEdqKQdaY345zYSAohQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25649437"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="25649437"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 15:17:27 -0700
X-CSE-ConnectionGUID: Vwxxr3lRSGmP/c27M17sQA==
X-CSE-MsgGUID: wqkUT4uCSNGhgRBMPDq59w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="70106616"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Sep 2024 15:17:26 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srPSl-000DkQ-1x;
	Thu, 19 Sep 2024 22:17:23 +0000
Date: Fri, 20 Sep 2024 06:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/media/dvb-frontends/mb86a16.c:1349 mb86a16_set_fe() warn:
 Function too hairy.  No more merges.
Message-ID: <202409200618.7uGtf045-lkp@intel.com>
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
TO: Chris Down <chris@chrisdown.name>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2004cef11ea072838f99bd95cefa5c8e45df0847
commit: 337015573718b161891a3473d25f59273f2e626b printk: Userspace format indexing support
date:   3 years, 2 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 years, 2 months ago
config: x86_64-randconfig-161-20240918 (https://download.01.org/0day-ci/archive/20240920/202409200618.7uGtf045-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409200618.7uGtf045-lkp@intel.com/

New smatch warnings:
drivers/media/dvb-frontends/mb86a16.c:1349 mb86a16_set_fe() warn: Function too hairy.  No more merges.

Old smatch warnings:
drivers/media/dvb-frontends/mb86a16.c:1514 mb86a16_send_diseqc_msg() warn: missing unwind goto?

vim +1349 drivers/media/dvb-frontends/mb86a16.c

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02   995  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02   996  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02   997  static int mb86a16_set_fe(struct mb86a16_state *state)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02   998  {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02   999  	u8 agcval, cnmval;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1000  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1001  	int i, j;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1002  	int fOSC = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1003  	int fOSC_start = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1004  	int wait_t;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1005  	int fcp;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1006  	int swp_ofs;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1007  	int V[60];
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1008  	u8 SIG1MIN;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1009  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1010  	unsigned char CREN, AFCEN, AFCEXEN;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1011  	unsigned char SIG1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1012  	unsigned char TIMINT1, TIMINT2, TIMEXT;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1013  	unsigned char S0T, S1T;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1014  	unsigned char S2T;
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1015  /*	unsigned char S2T, S3T; */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1016  	unsigned char S4T, S5T;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1017  	unsigned char AFCEX_L, AFCEX_H;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1018  	unsigned char R;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1019  	unsigned char VIRM;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1020  	unsigned char ETH, VIA;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1021  	unsigned char junk;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1022  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1023  	int loop;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1024  	int ftemp;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1025  	int v, vmax, vmin;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1026  	int vmax_his, vmin_his;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1027  	int swp_freq, prev_swp_freq[20];
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1028  	int prev_freq_num;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1029  	int signal_dupl;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1030  	int afcex_freq;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1031  	int signal;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1032  	int afcerr;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1033  	int temp_freq, delta_freq;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1034  	int dagcm[4];
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1035  	int smrt_d;
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1036  /*	int freq_err; */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1037  	int n;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1038  	int ret = -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1039  	int sync;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1040  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1041  	dprintk(verbose, MB86A16_INFO, 1, "freq=%d Mhz, symbrt=%d Ksps", state->frequency, state->srate);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1042  
b05c90de08b582 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1043  	fcp = 3000;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1044  	swp_ofs = state->srate / 4;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1045  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1046  	for (i = 0; i < 60; i++)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1047  		V[i] = -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1048  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1049  	for (i = 0; i < 20; i++)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1050  		prev_swp_freq[i] = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1051  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1052  	SIG1MIN = 25;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1053  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1054  	for (n = 0; ((n < 3) && (ret == -1)); n++) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1055  		SEQ_set(state, 0);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1056  		iq_vt_set(state, 0);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1057  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1058  		CREN = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1059  		AFCEN = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1060  		AFCEXEN = 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1061  		TIMINT1 = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1062  		TIMINT2 = 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1063  		TIMEXT = 2;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1064  		S1T = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1065  		S0T = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1066  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1067  		if (initial_set(state) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1068  			dprintk(verbose, MB86A16_ERROR, 1, "initial set failed");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1069  			return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1070  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1071  		if (DAGC_data_set(state, 3, 2) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1072  			dprintk(verbose, MB86A16_ERROR, 1, "DAGC data set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1073  			return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1074  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1075  		if (EN_set(state, CREN, AFCEN) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1076  			dprintk(verbose, MB86A16_ERROR, 1, "EN set error");
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1077  			return -1; /* (0, 0) */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1078  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1079  		if (AFCEXEN_set(state, AFCEXEN, state->srate) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1080  			dprintk(verbose, MB86A16_ERROR, 1, "AFCEXEN set error");
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1081  			return -1; /* (1, smrt) = (1, symbolrate) */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1082  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1083  		if (CNTM_set(state, TIMINT1, TIMINT2, TIMEXT) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1084  			dprintk(verbose, MB86A16_ERROR, 1, "CNTM set error");
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1085  			return -1; /* (0, 1, 2) */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1086  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1087  		if (S01T_set(state, S1T, S0T) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1088  			dprintk(verbose, MB86A16_ERROR, 1, "S01T set error");
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1089  			return -1; /* (0, 0) */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1090  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1091  		smrt_info_get(state, state->srate);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1092  		if (smrt_set(state, state->srate) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1093  			dprintk(verbose, MB86A16_ERROR, 1, "smrt info get error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1094  			return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1095  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1096  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1097  		R = vco_dev_get(state, state->srate);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1098  		if (R == 1)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1099  			fOSC_start = state->frequency;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1100  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1101  		else if (R == 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1102  			if (state->frequency % 2 == 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1103  				fOSC_start = state->frequency;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1104  			} else {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1105  				fOSC_start = state->frequency + 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1106  				if (fOSC_start > 2150)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1107  					fOSC_start = state->frequency - 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1108  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1109  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1110  		loop = 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1111  		ftemp = fOSC_start * 1000;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1112  		vmax = 0 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1113  		while (loop == 1) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1114  			ftemp = ftemp + swp_ofs;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1115  			vmax++;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1116  
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1117  			/* Upper bound */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1118  			if (ftemp > 2150000) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1119  				loop = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1120  				vmax--;
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1121  			} else {
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1122  				if ((ftemp == 2150000) ||
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1123  				    (ftemp - state->frequency * 1000 >= fcp + state->srate / 4))
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1124  					loop = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1125  			}
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1126  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1127  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1128  		loop = 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1129  		ftemp = fOSC_start * 1000;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1130  		vmin = 0 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1131  		while (loop == 1) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1132  			ftemp = ftemp - swp_ofs;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1133  			vmin--;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1134  
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1135  			/* Lower bound */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1136  			if (ftemp < 950000) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1137  				loop = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1138  				vmin++;
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1139  			} else {
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1140  				if ((ftemp == 950000) ||
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1141  				    (state->frequency * 1000 - ftemp >= fcp + state->srate / 4))
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1142  					loop = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1143  			}
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1144  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1145  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1146  		wait_t = (8000 + state->srate / 2) / state->srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1147  		if (wait_t == 0)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1148  			wait_t = 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1149  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1150  		i = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1151  		j = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1152  		prev_freq_num = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1153  		loop = 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1154  		signal = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1155  		vmax_his = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1156  		vmin_his = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1157  		v = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1158  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1159  		while (loop == 1) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1160  			swp_info_get(state, fOSC_start, state->srate,
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1161  				     v, R, swp_ofs, &fOSC,
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1162  				     &afcex_freq, &AFCEX_L, &AFCEX_H);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1163  
a890cce595c860 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1164  			udelay(100);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1165  			if (rf_val_set(state, fOSC, state->srate, R) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1166  				dprintk(verbose, MB86A16_ERROR, 1, "rf val set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1167  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1168  			}
a890cce595c860 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1169  			udelay(100);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1170  			if (afcex_data_set(state, AFCEX_L, AFCEX_H) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1171  				dprintk(verbose, MB86A16_ERROR, 1, "afcex data set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1172  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1173  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1174  			if (srst(state) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1175  				dprintk(verbose, MB86A16_ERROR, 1, "srst error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1176  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1177  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1178  			msleep_interruptible(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1179  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1180  			if (mb86a16_read(state, 0x37, &SIG1) != 2) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1181  				dprintk(verbose, MB86A16_ERROR, 1, "I2C transfer error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1182  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1183  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1184  			V[30 + v] = SIG1 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1185  			swp_freq = swp_freq_calcuation(state, i, v, V, vmax, vmin,
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1186  						      SIG1MIN, fOSC, afcex_freq,
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1187  						      swp_ofs, &SIG1);	/* changed */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1188  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1189  			signal_dupl = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1190  			for (j = 0; j < prev_freq_num; j++) {
7aa92c4229feff drivers/media/dvb-frontends/mb86a16.c Dan Gopstein         2017-12-25  1191  				if ((abs(prev_swp_freq[j] - swp_freq)) < (swp_ofs * 3 / 2)) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1192  					signal_dupl = 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1193  					dprintk(verbose, MB86A16_INFO, 1, "Probably Duplicate Signal, j = %d", j);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1194  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1195  			}
7aa92c4229feff drivers/media/dvb-frontends/mb86a16.c Dan Gopstein         2017-12-25  1196  			if ((signal_dupl == 0) && (swp_freq > 0) && (abs(swp_freq - state->frequency * 1000) < fcp + state->srate / 6)) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1197  				dprintk(verbose, MB86A16_DEBUG, 1, "------ Signal detect ------ [swp_freq=[%07d, srate=%05d]]", swp_freq, state->srate);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1198  				prev_swp_freq[prev_freq_num] = swp_freq;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1199  				prev_freq_num++;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1200  				swp_info_get2(state, state->srate, R, swp_freq,
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1201  					      &afcex_freq, &fOSC,
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1202  					      &AFCEX_L, &AFCEX_H);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1203  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1204  				if (rf_val_set(state, fOSC, state->srate, R) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1205  					dprintk(verbose, MB86A16_ERROR, 1, "rf val set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1206  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1207  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1208  				if (afcex_data_set(state, AFCEX_L, AFCEX_H) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1209  					dprintk(verbose, MB86A16_ERROR, 1, "afcex data set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1210  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1211  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1212  				signal = signal_det(state, state->srate, &SIG1);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1213  				if (signal == 1) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1214  					dprintk(verbose, MB86A16_ERROR, 1, "***** Signal Found *****");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1215  					loop = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1216  				} else {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1217  					dprintk(verbose, MB86A16_ERROR, 1, "!!!!! No signal !!!!!, try again...");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1218  					smrt_info_get(state, state->srate);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1219  					if (smrt_set(state, state->srate) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1220  						dprintk(verbose, MB86A16_ERROR, 1, "smrt set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1221  						return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1222  					}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1223  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1224  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1225  			if (v > vmax)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1226  				vmax_his = 1 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1227  			if (v < vmin)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1228  				vmin_his = 1 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1229  			i++;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1230  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1231  			if ((i % 2 == 1) && (vmax_his == 1))
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1232  				i++;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1233  			if ((i % 2 == 0) && (vmin_his == 1))
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1234  				i++;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1235  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1236  			if (i % 2 == 1)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1237  				v = (i + 1) / 2;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1238  			else
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1239  				v = -i / 2;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1240  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1241  			if ((vmax_his == 1) && (vmin_his == 1))
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1242  				loop = 0 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1243  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1244  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1245  		if (signal == 1) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1246  			dprintk(verbose, MB86A16_INFO, 1, " Start Freq Error Check");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1247  			S1T = 7 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1248  			S0T = 1 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1249  			CREN = 0 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1250  			AFCEN = 1 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1251  			AFCEXEN = 0 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1252  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1253  			if (S01T_set(state, S1T, S0T) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1254  				dprintk(verbose, MB86A16_ERROR, 1, "S01T set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1255  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1256  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1257  			smrt_info_get(state, state->srate);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1258  			if (smrt_set(state, state->srate) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1259  				dprintk(verbose, MB86A16_ERROR, 1, "smrt set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1260  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1261  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1262  			if (EN_set(state, CREN, AFCEN) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1263  				dprintk(verbose, MB86A16_ERROR, 1, "EN set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1264  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1265  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1266  			if (AFCEXEN_set(state, AFCEXEN, state->srate) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1267  				dprintk(verbose, MB86A16_ERROR, 1, "AFCEXEN set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1268  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1269  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1270  			afcex_info_get(state, afcex_freq, &AFCEX_L, &AFCEX_H);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1271  			if (afcofs_data_set(state, AFCEX_L, AFCEX_H) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1272  				dprintk(verbose, MB86A16_ERROR, 1, "AFCOFS data set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1273  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1274  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1275  			if (srst(state) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1276  				dprintk(verbose, MB86A16_ERROR, 1, "srst error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1277  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1278  			}
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1279  			/* delay 4~200 */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1280  			wait_t = 200000 / state->master_clk + 200000 / state->srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1281  			msleep(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1282  			afcerr = afcerr_chk(state);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1283  			if (afcerr == -1)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1284  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1285  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1286  			swp_freq = fOSC * 1000 + afcerr ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1287  			AFCEXEN = 1 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1288  			if (state->srate >= 1500)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1289  				smrt_d = state->srate / 3;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1290  			else
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1291  				smrt_d = state->srate / 2;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1292  			smrt_info_get(state, smrt_d);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1293  			if (smrt_set(state, smrt_d) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1294  				dprintk(verbose, MB86A16_ERROR, 1, "smrt set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1295  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1296  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1297  			if (AFCEXEN_set(state, AFCEXEN, smrt_d) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1298  				dprintk(verbose, MB86A16_ERROR, 1, "AFCEXEN set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1299  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1300  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1301  			R = vco_dev_get(state, smrt_d);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1302  			if (DAGC_data_set(state, 2, 0) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1303  				dprintk(verbose, MB86A16_ERROR, 1, "DAGC data set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1304  				return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1305  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1306  			for (i = 0; i < 3; i++) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1307  				temp_freq = swp_freq + (i - 1) * state->srate / 8;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1308  				swp_info_get2(state, smrt_d, R, temp_freq, &afcex_freq, &fOSC, &AFCEX_L, &AFCEX_H);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1309  				if (rf_val_set(state, fOSC, smrt_d, R) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1310  					dprintk(verbose, MB86A16_ERROR, 1, "rf val set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1311  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1312  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1313  				if (afcex_data_set(state, AFCEX_L, AFCEX_H) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1314  					dprintk(verbose, MB86A16_ERROR, 1, "afcex data set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1315  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1316  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1317  				wait_t = 200000 / state->master_clk + 40000 / smrt_d;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1318  				msleep(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1319  				dagcm[i] = dagcm_val_get(state);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1320  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1321  			if ((dagcm[0] > dagcm[1]) &&
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1322  			    (dagcm[0] > dagcm[2]) &&
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1323  			    (dagcm[0] - dagcm[1] > 2 * (dagcm[2] - dagcm[1]))) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1324  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1325  				temp_freq = swp_freq - 2 * state->srate / 8;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1326  				swp_info_get2(state, smrt_d, R, temp_freq, &afcex_freq, &fOSC, &AFCEX_L, &AFCEX_H);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1327  				if (rf_val_set(state, fOSC, smrt_d, R) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1328  					dprintk(verbose, MB86A16_ERROR, 1, "rf val set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1329  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1330  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1331  				if (afcex_data_set(state, AFCEX_L, AFCEX_H) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1332  					dprintk(verbose, MB86A16_ERROR, 1, "afcex data set");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1333  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1334  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1335  				wait_t = 200000 / state->master_clk + 40000 / smrt_d;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1336  				msleep(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1337  				dagcm[3] = dagcm_val_get(state);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1338  				if (dagcm[3] > dagcm[1])
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1339  					delta_freq = (dagcm[2] - dagcm[0] + dagcm[1] - dagcm[3]) * state->srate / 300;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1340  				else
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1341  					delta_freq = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1342  			} else if ((dagcm[2] > dagcm[1]) &&
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1343  				   (dagcm[2] > dagcm[0]) &&
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1344  				   (dagcm[2] - dagcm[1] > 2 * (dagcm[0] - dagcm[1]))) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1345  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1346  				temp_freq = swp_freq + 2 * state->srate / 8;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1347  				swp_info_get2(state, smrt_d, R, temp_freq, &afcex_freq, &fOSC, &AFCEX_L, &AFCEX_H);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1348  				if (rf_val_set(state, fOSC, smrt_d, R) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02 @1349  					dprintk(verbose, MB86A16_ERROR, 1, "rf val set");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1350  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1351  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1352  				if (afcex_data_set(state, AFCEX_L, AFCEX_H) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1353  					dprintk(verbose, MB86A16_ERROR, 1, "afcex data set");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1354  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1355  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1356  				wait_t = 200000 / state->master_clk + 40000 / smrt_d;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1357  				msleep(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1358  				dagcm[3] = dagcm_val_get(state);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1359  				if (dagcm[3] > dagcm[1])
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1360  					delta_freq = (dagcm[2] - dagcm[0] + dagcm[3] - dagcm[1]) * state->srate / 300;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1361  				else
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1362  					delta_freq = 0 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1363  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1364  			} else {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1365  				delta_freq = 0 ;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1366  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1367  			dprintk(verbose, MB86A16_INFO, 1, "SWEEP Frequency = %d", swp_freq);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1368  			swp_freq += delta_freq;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1369  			dprintk(verbose, MB86A16_INFO, 1, "Adjusting .., DELTA Freq = %d, SWEEP Freq=%d", delta_freq, swp_freq);
7aa92c4229feff drivers/media/dvb-frontends/mb86a16.c Dan Gopstein         2017-12-25  1370  			if (abs(state->frequency * 1000 - swp_freq) > 3800) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1371  				dprintk(verbose, MB86A16_INFO, 1, "NO  --  SIGNAL !");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1372  			} else {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1373  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1374  				S1T = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1375  				S0T = 3;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1376  				CREN = 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1377  				AFCEN = 0;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1378  				AFCEXEN = 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1379  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1380  				if (S01T_set(state, S1T, S0T) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1381  					dprintk(verbose, MB86A16_ERROR, 1, "S01T set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1382  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1383  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1384  				if (DAGC_data_set(state, 0, 0) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1385  					dprintk(verbose, MB86A16_ERROR, 1, "DAGC data set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1386  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1387  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1388  				R = vco_dev_get(state, state->srate);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1389  				smrt_info_get(state, state->srate);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1390  				if (smrt_set(state, state->srate) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1391  					dprintk(verbose, MB86A16_ERROR, 1, "smrt set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1392  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1393  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1394  				if (EN_set(state, CREN, AFCEN) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1395  					dprintk(verbose, MB86A16_ERROR, 1, "EN set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1396  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1397  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1398  				if (AFCEXEN_set(state, AFCEXEN, state->srate) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1399  					dprintk(verbose, MB86A16_ERROR, 1, "AFCEXEN set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1400  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1401  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1402  				swp_info_get2(state, state->srate, R, swp_freq, &afcex_freq, &fOSC, &AFCEX_L, &AFCEX_H);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1403  				if (rf_val_set(state, fOSC, state->srate, R) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1404  					dprintk(verbose, MB86A16_ERROR, 1, "rf val set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1405  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1406  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1407  				if (afcex_data_set(state, AFCEX_L, AFCEX_H) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1408  					dprintk(verbose, MB86A16_ERROR, 1, "afcex data set error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1409  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1410  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1411  				if (srst(state) < 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1412  					dprintk(verbose, MB86A16_ERROR, 1, "srst error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1413  					return -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1414  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1415  				wait_t = 7 + (10000 + state->srate / 2) / state->srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1416  				if (wait_t == 0)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1417  					wait_t = 1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1418  				msleep_interruptible(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1419  				if (mb86a16_read(state, 0x37, &SIG1) != 2) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1420  					dprintk(verbose, MB86A16_ERROR, 1, "I2C transfer error");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1421  					return -EREMOTEIO;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1422  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1423  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1424  				if (SIG1 > 110) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1425  					S2T = 4; S4T = 1; S5T = 6; ETH = 4; VIA = 6;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1426  					wait_t = 7 + (917504 + state->srate / 2) / state->srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1427  				} else if (SIG1 > 105) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1428  					S2T = 4; S4T = 2; S5T = 8; ETH = 7; VIA = 2;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1429  					wait_t = 7 + (1048576 + state->srate / 2) / state->srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1430  				} else if (SIG1 > 85) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1431  					S2T = 5; S4T = 2; S5T = 8; ETH = 7; VIA = 2;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1432  					wait_t = 7 + (1310720 + state->srate / 2) / state->srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1433  				} else if (SIG1 > 65) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1434  					S2T = 6; S4T = 2; S5T = 8; ETH = 7; VIA = 2;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1435  					wait_t = 7 + (1572864 + state->srate / 2) / state->srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1436  				} else {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1437  					S2T = 7; S4T = 2; S5T = 8; ETH = 7; VIA = 2;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1438  					wait_t = 7 + (2097152 + state->srate / 2) / state->srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1439  				}
e15c7ccd31faa0 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1440  				wait_t *= 2; /* FOS */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1441  				S2T_set(state, S2T);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1442  				S45T_set(state, S4T, S5T);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1443  				Vi_set(state, ETH, VIA);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1444  				srst(state);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1445  				msleep_interruptible(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1446  				sync = sync_chk(state, &VIRM);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1447  				dprintk(verbose, MB86A16_INFO, 1, "-------- Viterbi=[%d] SYNC=[%d] ---------", VIRM, sync);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1448  				if (VIRM) {
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1449  					if (VIRM == 4) {
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1450  						/* 5/6 */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1451  						if (SIG1 > 110)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1452  							wait_t = (786432 + state->srate / 2) / state->srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1453  						else
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1454  							wait_t = (1572864 + state->srate / 2) / state->srate;
ef4349ebab1d68 drivers/media/dvb-frontends/mb86a16.c Daniel W. S. Almeida 2020-08-07  1455  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1456  						msleep_interruptible(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1457  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1458  						if (sync_chk(state, &junk) == 0) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1459  							iq_vt_set(state, 1);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1460  							FEC_srst(state);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1461  						}
77557abef0de3f drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-03  1462  					}
f5ae4f6f482191 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1463  					/* 1/2, 2/3, 3/4, 7/8 */
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1464  					if (SIG1 > 110)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1465  						wait_t = (786432 + state->srate / 2) / state->srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1466  					else
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1467  						wait_t = (1572864 + state->srate / 2) / state->srate;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1468  					msleep_interruptible(wait_t);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1469  					SEQ_set(state, 1);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1470  				} else {
776c3ebe9678f8 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1471  					dprintk(verbose, MB86A16_INFO, 1, "NO  -- SYNC");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1472  					SEQ_set(state, 1);
5dd83a35bea908 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1473  					ret = -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1474  				}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1475  			}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1476  		} else {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1477  			dprintk(verbose, MB86A16_INFO, 1, "NO  -- SIGNAL");
5dd83a35bea908 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1478  			ret = -1;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1479  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1480  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1481  		sync = sync_chk(state, &junk);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1482  		if (sync) {
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1483  			dprintk(verbose, MB86A16_INFO, 1, "******* SYNC *******");
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1484  			freqerr_chk(state, state->frequency, state->srate, 1);
5dd83a35bea908 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-15  1485  			ret = 0;
071e3060a5f482 drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1486  			break;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1487  		}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1488  	}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1489  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1490  	mb86a16_read(state, 0x15, &agcval);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1491  	mb86a16_read(state, 0x26, &cnmval);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1492  	dprintk(verbose, MB86A16_INFO, 1, "AGC = %02x CNM = %02x", agcval, cnmval);
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1493  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1494  	return ret;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1495  }
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham         2009-12-02  1496  

:::::: The code at line 1349 was first introduced by commit
:::::: 41e840b13e111ba18b138d055ddd250bd5ad5e39 V4L/DVB (13699): [Mantis, MB86A16] Initial checkin: Mantis, MB86A16

:::::: TO: Manu Abraham <abraham.manu@gmail.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
