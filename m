Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344FB1B0138
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Oct 2024 03:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727755076; cv=none; b=oUmFJLTOhnHDtf7YEfJouXtGWiGWqrmDYXqlN7oTbbojq4YYGW3mAaWihEnS6jKsilCCNSiCewJD2Ewj6CiSBWXfcgIuhXzotQRP9uNH1T0opdYiqVk96ugtEdPCFgjw18w36buI1/hLFwrWnVz2bFR/+CXCH+cNbI1COFU9HOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727755076; c=relaxed/simple;
	bh=9/1eKmT2T9s9Gj9V1j7K4WoeGOx0lcfswtKzVu84Ruk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P3FC7cRRmKTdAd+C9ibjPynvfWTB5w7uf8/ZQ4OG4LNg8ORTSRxDWhG09W1rZ7I6C7EV/VdfHKY+vPg3xtxmJhOA+1n24sB6T69wZPjw6Fdw8U2htETbhdwrJH6xVa0W2hLlMBH60AVCoxkwvBIqUhYq1lznVINAp3b2CM1X2Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OT+8Aa09; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OT+8Aa09"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727755074; x=1759291074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9/1eKmT2T9s9Gj9V1j7K4WoeGOx0lcfswtKzVu84Ruk=;
  b=OT+8Aa09M9TgV0xKF1gqtcDFDyrLlOc/av9JZBxZTNurQWDEz+JTuSYv
   GgevWXZAwyyHIHoVTcd4WQN6rMb5MKIEkqP7sr5g+tr7F36ab+F8+wJCG
   YpmTICr7Ywr9dUO7A1kTYK1z+I5u7ETQeDqLib/3kNeVtyocSluqm3PM8
   EbWAOYWtTrLEiRLyTQLo61QchG+jK2PO/HrE4Mc6rAngq/R/c7lygKeWu
   5whQG5W8XWGawJaMGaA0XFunQF4v73ZuPzPQfBBlc3HNNhi9/G8KCdnUl
   v9QoiDzLMeFfafu0h+cHyypR7KC+KKI/j7JgjiTHYAskTNRe7kAsg7GzR
   Q==;
X-CSE-ConnectionGUID: 4IAxpBBTQV2+svomqB7uSg==
X-CSE-MsgGUID: /ucd9TkNTsCxw5qa2KNbjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="27026892"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="27026892"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 20:57:54 -0700
X-CSE-ConnectionGUID: PESw1ZhZS/2B602DcY5rnQ==
X-CSE-MsgGUID: K5p0N+EYQ/mDfmfT8tA3nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73780169"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Sep 2024 20:57:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svU1G-000QDp-0W;
	Tue, 01 Oct 2024 03:57:50 +0000
Date: Tue, 1 Oct 2024 11:57:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [nsa:b4/dev-adp5589-fw-conversion 12/14]
 drivers/input/keyboard/adp5589-keys.c:1305 adp5589_parse_fw() error:
 uninitialized symbol 'rows'.
Message-ID: <202410011150.TMw05gzF-lkp@intel.com>
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
CC: Nuno Sa <noname.nuno@gmail.com>
TO: Nuno Sa <nuno.sa@analog.com>

Hi Nuno,

First bad commit (maybe != root cause):

tree:   https://github.com/nunojsa/linux b4/dev-adp5589-fw-conversion
head:   d8f775093f32be0f662a6093041d941d372d4830
commit: 24e7ec8595ac25060eb380205b2c57416a01815b [12/14] Input: adp5589-keys: unify adp_constants in info struct
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20240930 (https://download.01.org/0day-ci/archive/20241001/202410011150.TMw05gzF-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410011150.TMw05gzF-lkp@intel.com/

smatch warnings:
drivers/input/keyboard/adp5589-keys.c:1305 adp5589_parse_fw() error: uninitialized symbol 'rows'.

vim +/rows +1305 drivers/input/keyboard/adp5589-keys.c

b6abc9f63f6e47 Nuno Sa            2024-09-18  1254  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1255  static int adp5589_parse_fw(struct adp5589_kpad *kpad)
b6abc9f63f6e47 Nuno Sa            2024-09-18  1256  {
b6abc9f63f6e47 Nuno Sa            2024-09-18  1257  	struct i2c_client *client = kpad->client;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1258  	u32 cols = 0, rows, prop_val;
9d2e173644bb5c Michael Hennerich  2011-05-19  1259  	int error;
9d2e173644bb5c Michael Hennerich  2011-05-19  1260  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1261  	error = device_property_read_u32(&client->dev, "adi,cols-mask",
b6abc9f63f6e47 Nuno Sa            2024-09-18  1262  					 &prop_val);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1263  	if (!error) {
24e7ec8595ac25 Nuno Sa            2024-09-18  1264  		if (prop_val > GENMASK(kpad->info->max_col_num, 0)) {
b6abc9f63f6e47 Nuno Sa            2024-09-18  1265  			dev_err(&client->dev, "Invalid column mask(%x)\n",
b6abc9f63f6e47 Nuno Sa            2024-09-18  1266  				prop_val);
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1267  			return -EINVAL;
9d2e173644bb5c Michael Hennerich  2011-05-19  1268  		}
9d2e173644bb5c Michael Hennerich  2011-05-19  1269  
24e7ec8595ac25 Nuno Sa            2024-09-18  1270  		kpad->keypad_en_mask = prop_val << kpad->info->col_shift;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1271  		/*
b6abc9f63f6e47 Nuno Sa            2024-09-18  1272  		 * Note that given that we get a mask (and the HW allows it), we
b6abc9f63f6e47 Nuno Sa            2024-09-18  1273  		 * can have holes in our keypad (eg: row0, row1 and row7 enabled).
b6abc9f63f6e47 Nuno Sa            2024-09-18  1274  		 * However, for the matrix parsing functions we need to pass the
b6abc9f63f6e47 Nuno Sa            2024-09-18  1275  		 * number of rows/cols as the maximum row/col used plus 1. This
b6abc9f63f6e47 Nuno Sa            2024-09-18  1276  		 * pretty much means we will also have holes in our SW keypad.
b6abc9f63f6e47 Nuno Sa            2024-09-18  1277  		 */
b6abc9f63f6e47 Nuno Sa            2024-09-18  1278  		cols = fls(prop_val);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1279  	}
b6abc9f63f6e47 Nuno Sa            2024-09-18  1280  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1281  	error = device_property_read_u32(&client->dev, "adi,rows-mask",
b6abc9f63f6e47 Nuno Sa            2024-09-18  1282  					 &prop_val);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1283  	if (!error) {
24e7ec8595ac25 Nuno Sa            2024-09-18  1284  		if (prop_val > GENMASK(kpad->info->max_row_num, 0)) {
b6abc9f63f6e47 Nuno Sa            2024-09-18  1285  			dev_err(&client->dev, "Invalid row mask(%x)\n",
b6abc9f63f6e47 Nuno Sa            2024-09-18  1286  				prop_val);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1287  			return -EINVAL;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1288  		}
b6abc9f63f6e47 Nuno Sa            2024-09-18  1289  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1290  		if (prop_val & BIT(5) && !kpad->info->support_row5) {
b6abc9f63f6e47 Nuno Sa            2024-09-18  1291  			dev_err(&client->dev, "Row5 not supported!\n");
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1292  			return -EINVAL;
9d2e173644bb5c Michael Hennerich  2011-05-19  1293  		}
9d2e173644bb5c Michael Hennerich  2011-05-19  1294  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1295  		if (!cols) {
b6abc9f63f6e47 Nuno Sa            2024-09-18  1296  			dev_err(&client->dev, "Cannot have columns with no rows!\n");
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1297  			return -EINVAL;
9d2e173644bb5c Michael Hennerich  2011-05-19  1298  		}
9d2e173644bb5c Michael Hennerich  2011-05-19  1299  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1300  		kpad->keypad_en_mask |= prop_val;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1301  		rows = fls(prop_val);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1302  	}
b6abc9f63f6e47 Nuno Sa            2024-09-18  1303  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1304  	if (kpad->keypad_en_mask) {
b6abc9f63f6e47 Nuno Sa            2024-09-18 @1305  		error = matrix_keypad_build_keymap(NULL, NULL, rows, cols,
b6abc9f63f6e47 Nuno Sa            2024-09-18  1306  						   kpad->keycode, kpad->input);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1307  		if (error)
b6abc9f63f6e47 Nuno Sa            2024-09-18  1308  			return error;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1309  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1310  		kpad->row_shift = get_count_order(cols);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1311  	}
b6abc9f63f6e47 Nuno Sa            2024-09-18  1312  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1313  	if (device_property_present(&client->dev, "autorepeat"))
b6abc9f63f6e47 Nuno Sa            2024-09-18  1314  		__set_bit(EV_REP, kpad->input->evbit);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1315  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1316  	error = device_property_read_u32(&client->dev, "adi,key-poll-ms",
b6abc9f63f6e47 Nuno Sa            2024-09-18  1317  					 &prop_val);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1318  	if (!error) {
b6abc9f63f6e47 Nuno Sa            2024-09-18  1319  		switch (prop_val) {
b6abc9f63f6e47 Nuno Sa            2024-09-18  1320  		case 10:
b6abc9f63f6e47 Nuno Sa            2024-09-18  1321  			fallthrough;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1322  		case 20:
b6abc9f63f6e47 Nuno Sa            2024-09-18  1323  			fallthrough;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1324  		case 30:
b6abc9f63f6e47 Nuno Sa            2024-09-18  1325  			fallthrough;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1326  		case 40:
b6abc9f63f6e47 Nuno Sa            2024-09-18  1327  			kpad->key_poll_time = prop_val / 10 - 1;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1328  			break;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1329  		default:
b6abc9f63f6e47 Nuno Sa            2024-09-18  1330  			dev_err(&client->dev, "Invalid value(%u) for adi,key-poll-ms\n",
b6abc9f63f6e47 Nuno Sa            2024-09-18  1331  				prop_val);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1332  			return -EINVAL;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1333  		}
b6abc9f63f6e47 Nuno Sa            2024-09-18  1334  	}
b6abc9f63f6e47 Nuno Sa            2024-09-18  1335  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1336  	error = adp5589_unlock_parse(kpad);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1337  	if (error)
b6abc9f63f6e47 Nuno Sa            2024-09-18  1338  		return error;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1339  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1340  	error = adp5589_reset_parse(kpad);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1341  	if (error)
b6abc9f63f6e47 Nuno Sa            2024-09-18  1342  		return error;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1343  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1344  	return adp5589_gpio_parse(kpad);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1345  }
b6abc9f63f6e47 Nuno Sa            2024-09-18  1346  

:::::: The code at line 1305 was first introduced by commit
:::::: b6abc9f63f6e47bc7ed2772edeb85381a0f5da67 Input: adp5589-keys: add support for fw properties

:::::: TO: Nuno Sa <nuno.sa@analog.com>
:::::: CC: Nuno Sa <nuno.sa@analog.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
