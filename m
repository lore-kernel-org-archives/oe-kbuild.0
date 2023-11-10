Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD61C3C6AB
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Nov 2023 22:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQrcAfTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699654256; x=1731190256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MqkNvgqWB3WcEl6UyBNiqqyOElo8g3u4alCgu9rU7hw=;
  b=RQrcAfTtkwxDTqJ0DA+xsi/LKf/ICa89/8RpE7003DmmUn0w5yrjEUs2
   p3n3I4GPO/8ntj2omt+WOa5zWA4yEqu8mYwgZNeMH9A6Yg3sLCFYGgRTl
   m8zmNm0HdFpjiTTlfKghBTO/5yflcLxZ+AykqRiXSgwfP/4QD0hjMXKK7
   9JF4qZpPU8yA3xZdFvC6N44MA0m7CAPbE1XOCeQEh+Fy5C4JIT4yNW+GX
   +M78ZnAr92sQ+OxotwTTTKzRxS/yn/F7FymjRRfLJdkiwlproMQijp01i
   Zob6RQdVz586L3f3f7uyaLfPrOsm3DXWvXJisc9+ecP/ULaFk+AMmBxo7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="456735048"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="456735048"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 14:10:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="11572516"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Nov 2023 14:10:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ZiG-0009xZ-2J;
	Fri, 10 Nov 2023 22:10:52 +0000
Date: Sat, 11 Nov 2023 06:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v2 1/1] ptp: clockmatrix: support 32-bit address
 space
Message-ID: <202311110542.BjfgVNxz-lkp@intel.com>
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
In-Reply-To: <MW5PR03MB6932A4AAD4F612B45E9F6856A0AFA@MW5PR03MB6932.namprd03.prod.outlook.com>
References: <MW5PR03MB6932A4AAD4F612B45E9F6856A0AFA@MW5PR03MB6932.namprd03.prod.outlook.com>
TO: Min Li <lnimi@hotmail.com>
TO: richardcochran@gmail.com
TO: lee@kernel.org
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org
CC: Min Li <min.li.xe@renesas.com>

Hi Min,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Min-Li/ptp-clockmatrix-support-32-bit-address-space/20231110-044554
base:   net-next/main
patch link:    https://lore.kernel.org/r/MW5PR03MB6932A4AAD4F612B45E9F6856A0AFA%40MW5PR03MB6932.namprd03.prod.outlook.com
patch subject: [PATCH net-next v2 1/1] ptp: clockmatrix: support 32-bit address space
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: i386-randconfig-141-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110542.BjfgVNxz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110542.BjfgVNxz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311110542.BjfgVNxz-lkp@intel.com/

New smatch warnings:
drivers/ptp/ptp_clockmatrix.c:1257 idtcm_load_firmware() warn: '(537972560)' 537972560 can't fit into 65535 'scratch'

Old smatch warnings:
drivers/ptp/ptp_clockmatrix.c:1257 idtcm_load_firmware() warn: '(537972556)' 537972556 can't fit into 65535 'scratch'

vim +1257 drivers/ptp/ptp_clockmatrix.c

3a6ba7dc779935 Vincent Cheng 2019-10-31  1253  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1254  static int idtcm_load_firmware(struct idtcm *idtcm,
3a6ba7dc779935 Vincent Cheng 2019-10-31  1255  			       struct device *dev)
3a6ba7dc779935 Vincent Cheng 2019-10-31  1256  {
794c3dffacc166 Min Li        2021-09-13 @1257  	u16 scratch = IDTCM_FW_REG(idtcm->fw_ver, V520, SCRATCH);
7ea5fda2b1325e Min Li        2020-07-28  1258  	char fname[128] = FW_FILENAME;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1259  	const struct firmware *fw;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1260  	struct idtcm_fwrc *rec;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1261  	u32 regaddr;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1262  	int err;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1263  	s32 len;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1264  	u8 val;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1265  	u8 loaddr;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1266  
7ea5fda2b1325e Min Li        2020-07-28  1267  	if (firmware) /* module parameter */
7ea5fda2b1325e Min Li        2020-07-28  1268  		snprintf(fname, sizeof(fname), "%s", firmware);
3a6ba7dc779935 Vincent Cheng 2019-10-31  1269  
930dfa56315517 Min Li        2021-09-24  1270  	dev_info(idtcm->dev, "requesting firmware '%s'", fname);
3a6ba7dc779935 Vincent Cheng 2019-10-31  1271  
7ea5fda2b1325e Min Li        2020-07-28  1272  	err = request_firmware(&fw, fname, dev);
7ea5fda2b1325e Min Li        2020-07-28  1273  	if (err) {
930dfa56315517 Min Li        2021-09-24  1274  		dev_err(idtcm->dev,
1c49d3e947783b Vincent Cheng 2021-02-17  1275  			"Failed at line %d in %s!", __LINE__, __func__);
3a6ba7dc779935 Vincent Cheng 2019-10-31  1276  		return err;
7ea5fda2b1325e Min Li        2020-07-28  1277  	}
3a6ba7dc779935 Vincent Cheng 2019-10-31  1278  
930dfa56315517 Min Li        2021-09-24  1279  	dev_dbg(idtcm->dev, "firmware size %zu bytes", fw->size);
3a6ba7dc779935 Vincent Cheng 2019-10-31  1280  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1281  	rec = (struct idtcm_fwrc *) fw->data;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1282  
794c3dffacc166 Min Li        2021-09-13  1283  	if (contains_full_configuration(idtcm, fw))
3a6ba7dc779935 Vincent Cheng 2019-10-31  1284  		idtcm_state_machine_reset(idtcm);
3a6ba7dc779935 Vincent Cheng 2019-10-31  1285  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1286  	for (len = fw->size; len > 0; len -= sizeof(*rec)) {
3a6ba7dc779935 Vincent Cheng 2019-10-31  1287  		if (rec->reserved) {
930dfa56315517 Min Li        2021-09-24  1288  			dev_err(idtcm->dev,
1c49d3e947783b Vincent Cheng 2021-02-17  1289  				"bad firmware, reserved field non-zero");
3a6ba7dc779935 Vincent Cheng 2019-10-31  1290  			err = -EINVAL;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1291  		} else {
3a6ba7dc779935 Vincent Cheng 2019-10-31  1292  			regaddr = rec->hiaddr << 8;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1293  			regaddr |= rec->loaddr;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1294  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1295  			val = rec->value;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1296  			loaddr = rec->loaddr;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1297  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1298  			rec++;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1299  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1300  			err = check_and_set_masks(idtcm, regaddr, val);
3a6ba7dc779935 Vincent Cheng 2019-10-31  1301  		}
3a6ba7dc779935 Vincent Cheng 2019-10-31  1302  
7ea5fda2b1325e Min Li        2020-07-28  1303  		if (err != -EINVAL) {
7ea5fda2b1325e Min Li        2020-07-28  1304  			err = 0;
7ea5fda2b1325e Min Li        2020-07-28  1305  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1306  			/* Top (status registers) and bottom are read-only */
9fe9b9792d7236 Min Li        2023-11-09  1307  			if (regaddr < SCSR_ADDR(GPIO_USER_CONTROL) || regaddr >= scratch)
3a6ba7dc779935 Vincent Cheng 2019-10-31  1308  				continue;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1309  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1310  			/* Page size 128, last 4 bytes of page skipped */
77fdb168a3e2a6 Vincent Cheng 2021-02-17  1311  			if ((loaddr > 0x7b && loaddr <= 0x7f) || loaddr > 0xfb)
3a6ba7dc779935 Vincent Cheng 2019-10-31  1312  				continue;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1313  
9fe9b9792d7236 Min Li        2023-11-09  1314  			err = idtcm_write(idtcm, SCSR_BASE, regaddr, &val, sizeof(val));
3a6ba7dc779935 Vincent Cheng 2019-10-31  1315  		}
3a6ba7dc779935 Vincent Cheng 2019-10-31  1316  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1317  		if (err)
3a6ba7dc779935 Vincent Cheng 2019-10-31  1318  			goto out;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1319  	}
3a6ba7dc779935 Vincent Cheng 2019-10-31  1320  
7ea5fda2b1325e Min Li        2020-07-28  1321  	display_pll_and_masks(idtcm);
3a6ba7dc779935 Vincent Cheng 2019-10-31  1322  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1323  out:
3a6ba7dc779935 Vincent Cheng 2019-10-31  1324  	release_firmware(fw);
3a6ba7dc779935 Vincent Cheng 2019-10-31  1325  	return err;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1326  }
3a6ba7dc779935 Vincent Cheng 2019-10-31  1327  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
