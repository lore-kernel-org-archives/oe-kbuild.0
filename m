Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72318134C9
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Feb 2024 08:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707726883; cv=none; b=RxeS/jCF/oLGv/rdqGE/Iuohcx7iASnWI8yc11YAuRnN/WBLk7/CC66N0bqCiuvAuFhuh/VWOqA0B/2QyC0prAeJOgfGBK+4uk/ZZOl5LBwvsRQh/cYdIExDpRrTx/Da7MBMUEWIFPKmseoKDvfViGVqHlOdegrMbs0n9IMGYKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707726883; c=relaxed/simple;
	bh=FQeCHFw4F3QyY+3qTbYQV5SaJDfAiLz4KsHSgWGDjlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UQjZNqEHm1JE0T2IvrEbjmnd+LM9ElLaBzBlJPKYBVpYIcWBKdlLir+4OW+S3g15dKDe8KjiWfV4p24anOy793A2JzCo07oIkIGixWFqDisEt28zV9GVzQpjmG4z4Gfr7SWvDleRS4W/yTYjyFdMq8ZTqUunnqlCuQ1nNQz6n2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Olfw4p5c; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Olfw4p5c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707726882; x=1739262882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FQeCHFw4F3QyY+3qTbYQV5SaJDfAiLz4KsHSgWGDjlM=;
  b=Olfw4p5cJKhgwm7sUxOXO2xOa89AxupRryLehWIZ3PeTAwCZbKVUfjJ9
   NoeqeGp2JiV+ETMdkD0xFsAflyakS2qjyGa5opi6hWpkBGN8rlTxmDKV2
   hQhytUGf1d5Hc41WKf1W0YpHINa9pQv3l8CIFjP7oHvIisIE/SimlmcM4
   14z7GSPftH9FHsIEwrzrs4u2Vh2BtusqBENAtNDLQpELr3IITj/eyVA70
   3Fxy5OYzS7XIk45+EEMLJwHBosR+f6tkKYaXvT4Jdc5CxhZ58O+f9Xs9F
   cPFLXdeVIjvitFxPBq2lVG7BRKe4RsJ3m46xgLERkKWX7qE/i8HCl65NW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1846215"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="1846215"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 00:34:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="2501831"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Feb 2024 00:34:37 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZRlr-00071S-0A;
	Mon, 12 Feb 2024 08:34:35 +0000
Date: Mon, 12 Feb 2024 16:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-misc:regmap-kunit-random-change 6/6]
 drivers/base/regmap/regmap-kunit.c:1322:24: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202402121635.CG6PEwhN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "empty line found in static check configure file"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git regmap-kunit-random-change
head:   3a0dac62f102669c43510607ddf5f630210bcc6a
commit: 3a0dac62f102669c43510607ddf5f630210bcc6a [6/6] regmap: kunit: Ensure that changed bytes are actually different
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-061-20240212 (https://download.01.org/0day-ci/archive/20240212/202402121635.CG6PEwhN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402121635.CG6PEwhN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402121635.CG6PEwhN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/base/regmap/regmap-kunit.c:1038:43: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1041:43: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1118:25: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1118:25: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1120:25: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1120:25: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1187:33: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1187:33: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1190:33: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1190:33: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1240:28: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1241:28: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1243:28: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1244:28: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1301:33: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1301:33: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1304:33: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1304:33: sparse: sparse: cast to restricted __le16
>> drivers/base/regmap/regmap-kunit.c:1322:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/base/regmap/regmap-kunit.c:1322:24: sparse:     expected unsigned short
   drivers/base/regmap/regmap-kunit.c:1322:24: sparse:     got restricted __be16 [usertype]
>> drivers/base/regmap/regmap-kunit.c:1324:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/base/regmap/regmap-kunit.c:1324:24: sparse:     expected unsigned short
   drivers/base/regmap/regmap-kunit.c:1324:24: sparse:     got restricted __le16 [usertype]

vim +1322 drivers/base/regmap/regmap-kunit.c

d958d97848a660 Ben Wolsieffer 2023-11-02  1264  
155a6bd6375b58 Mark Brown     2023-06-11  1265  static void raw_sync(struct kunit *test)
155a6bd6375b58 Mark Brown     2023-06-11  1266  {
155a6bd6375b58 Mark Brown     2023-06-11  1267  	struct raw_test_types *t = (struct raw_test_types *)test->param_value;
155a6bd6375b58 Mark Brown     2023-06-11  1268  	struct regmap *map;
155a6bd6375b58 Mark Brown     2023-06-11  1269  	struct regmap_config config;
155a6bd6375b58 Mark Brown     2023-06-11  1270  	struct regmap_ram_data *data;
3a0dac62f10266 Mark Brown     2024-02-09  1271  	u16 val[3];
155a6bd6375b58 Mark Brown     2023-06-11  1272  	u16 *hw_buf;
155a6bd6375b58 Mark Brown     2023-06-11  1273  	unsigned int rval;
155a6bd6375b58 Mark Brown     2023-06-11  1274  	int i;
155a6bd6375b58 Mark Brown     2023-06-11  1275  
155a6bd6375b58 Mark Brown     2023-06-11  1276  	config = raw_regmap_config;
155a6bd6375b58 Mark Brown     2023-06-11  1277  
155a6bd6375b58 Mark Brown     2023-06-11  1278  	map = gen_raw_regmap(&config, t, &data);
155a6bd6375b58 Mark Brown     2023-06-11  1279  	KUNIT_ASSERT_FALSE(test, IS_ERR(map));
155a6bd6375b58 Mark Brown     2023-06-11  1280  	if (IS_ERR(map))
155a6bd6375b58 Mark Brown     2023-06-11  1281  		return;
155a6bd6375b58 Mark Brown     2023-06-11  1282  
155a6bd6375b58 Mark Brown     2023-06-11  1283  	hw_buf = (u16 *)data->vals;
155a6bd6375b58 Mark Brown     2023-06-11  1284  
3a0dac62f10266 Mark Brown     2024-02-09  1285  	get_changed_bytes(&hw_buf[2], &val[0], sizeof(val));
155a6bd6375b58 Mark Brown     2023-06-11  1286  
155a6bd6375b58 Mark Brown     2023-06-11  1287  	/* Do a regular write and a raw write in cache only mode */
155a6bd6375b58 Mark Brown     2023-06-11  1288  	regcache_cache_only(map, true);
3a0dac62f10266 Mark Brown     2024-02-09  1289  	KUNIT_EXPECT_EQ(test, 0, regmap_raw_write(map, 2, val,
3a0dac62f10266 Mark Brown     2024-02-09  1290  						  sizeof(u16) * 2));
3a0dac62f10266 Mark Brown     2024-02-09  1291  	KUNIT_EXPECT_EQ(test, 0, regmap_write(map, 4, val[2]));
155a6bd6375b58 Mark Brown     2023-06-11  1292  
155a6bd6375b58 Mark Brown     2023-06-11  1293  	/* We should read back the new values, and defaults for the rest */
155a6bd6375b58 Mark Brown     2023-06-11  1294  	for (i = 0; i < config.max_register + 1; i++) {
155a6bd6375b58 Mark Brown     2023-06-11  1295  		KUNIT_EXPECT_EQ(test, 0, regmap_read(map, i, &rval));
155a6bd6375b58 Mark Brown     2023-06-11  1296  
155a6bd6375b58 Mark Brown     2023-06-11  1297  		switch (i) {
155a6bd6375b58 Mark Brown     2023-06-11  1298  		case 2:
155a6bd6375b58 Mark Brown     2023-06-11  1299  		case 3:
155a6bd6375b58 Mark Brown     2023-06-11  1300  			if (config.val_format_endian == REGMAP_ENDIAN_BIG) {
155a6bd6375b58 Mark Brown     2023-06-11  1301  				KUNIT_EXPECT_EQ(test, rval,
3a0dac62f10266 Mark Brown     2024-02-09  1302  						be16_to_cpu(val[i - 2]));
155a6bd6375b58 Mark Brown     2023-06-11  1303  			} else {
155a6bd6375b58 Mark Brown     2023-06-11  1304  				KUNIT_EXPECT_EQ(test, rval,
3a0dac62f10266 Mark Brown     2024-02-09  1305  						le16_to_cpu(val[i - 2]));
155a6bd6375b58 Mark Brown     2023-06-11  1306  			}
155a6bd6375b58 Mark Brown     2023-06-11  1307  			break;
3a0dac62f10266 Mark Brown     2024-02-09  1308  		case 4:
3a0dac62f10266 Mark Brown     2024-02-09  1309  			KUNIT_EXPECT_EQ(test, rval, val[i - 2]);
3a0dac62f10266 Mark Brown     2024-02-09  1310  			break;
155a6bd6375b58 Mark Brown     2023-06-11  1311  		default:
155a6bd6375b58 Mark Brown     2023-06-11  1312  			KUNIT_EXPECT_EQ(test, config.reg_defaults[i].def, rval);
155a6bd6375b58 Mark Brown     2023-06-11  1313  			break;
155a6bd6375b58 Mark Brown     2023-06-11  1314  		}
155a6bd6375b58 Mark Brown     2023-06-11  1315  	}
155a6bd6375b58 Mark Brown     2023-06-11  1316  
3a0dac62f10266 Mark Brown     2024-02-09  1317  	/*
3a0dac62f10266 Mark Brown     2024-02-09  1318  	 * The value written via _write() was translated by the core,
3a0dac62f10266 Mark Brown     2024-02-09  1319  	 * translate the original copy for comparison purposes.
3a0dac62f10266 Mark Brown     2024-02-09  1320  	 */
3a0dac62f10266 Mark Brown     2024-02-09  1321  	if (config.val_format_endian == REGMAP_ENDIAN_BIG)
3a0dac62f10266 Mark Brown     2024-02-09 @1322  		val[2] = cpu_to_be16(val[2]);
3a0dac62f10266 Mark Brown     2024-02-09  1323  	else
3a0dac62f10266 Mark Brown     2024-02-09 @1324  		val[2] = cpu_to_le16(val[2]);
3a0dac62f10266 Mark Brown     2024-02-09  1325  	
155a6bd6375b58 Mark Brown     2023-06-11  1326  	/* The values should not appear in the "hardware" */
3a0dac62f10266 Mark Brown     2024-02-09  1327  	KUNIT_EXPECT_MEMNEQ(test, &hw_buf[2], &val[0], sizeof(val));
155a6bd6375b58 Mark Brown     2023-06-11  1328  
155a6bd6375b58 Mark Brown     2023-06-11  1329  	for (i = 0; i < config.max_register + 1; i++)
155a6bd6375b58 Mark Brown     2023-06-11  1330  		data->written[i] = false;
155a6bd6375b58 Mark Brown     2023-06-11  1331  
155a6bd6375b58 Mark Brown     2023-06-11  1332  	/* Do the sync */
155a6bd6375b58 Mark Brown     2023-06-11  1333  	regcache_cache_only(map, false);
155a6bd6375b58 Mark Brown     2023-06-11  1334  	regcache_mark_dirty(map);
155a6bd6375b58 Mark Brown     2023-06-11  1335  	KUNIT_EXPECT_EQ(test, 0, regcache_sync(map));
155a6bd6375b58 Mark Brown     2023-06-11  1336  
155a6bd6375b58 Mark Brown     2023-06-11  1337  	/* The values should now appear in the "hardware" */
3a0dac62f10266 Mark Brown     2024-02-09  1338  	KUNIT_EXPECT_MEMEQ(test, &hw_buf[2], &val[0], sizeof(val));
155a6bd6375b58 Mark Brown     2023-06-11  1339  
155a6bd6375b58 Mark Brown     2023-06-11  1340  	regmap_exit(map);
155a6bd6375b58 Mark Brown     2023-06-11  1341  }
155a6bd6375b58 Mark Brown     2023-06-11  1342  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
