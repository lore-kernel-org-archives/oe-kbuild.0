Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26D75669
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Mar 2023 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678898353; x=1710434353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nY2kJXc2fC+biBxiI+wb6NR7o+qF/vB4x/6N/zAkXO8=;
  b=lbmJFIAHxLiTbxJasuhnyyIoZB65Du7rM2RYOSWZF0fDq5pT/9/b6KO+
   nAXEFOEQMGnHEVkVHOR4YS3am/zDoEVywHSc3C9dkO9sp7eUOhTtCSXyV
   1fSRK2VDW6W//+a4uZTeA0F2Af7aLCvOwo5ML1MoWAklgdN3dp+aCpnIr
   gxL1+IUvIVBJ3B0d+jdfRfAM5SS9m8j7RNXes9DRnc/TdXN8IuL30hfB4
   Azt/pY8jGpDc+7LYD+5Ri5dyHQZPXNS79rkxUIRawOLY23k48qoApfZz5
   FwlOqVO5Htumu3vWSU8C7dUM1F2o3iv4Aq9+4AgK+1RinS3JpRSsfyAY5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="424027364"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="424027364"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 09:39:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="743772021"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="743772021"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Mar 2023 09:38:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcU9S-0007tR-2z;
	Wed, 15 Mar 2023 16:38:58 +0000
Date: Thu, 16 Mar 2023 00:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 10/11] thermal/core: Alloc-copy-free the thermal zone
 parameters structure
Message-ID: <202303160005.1BnLbm4F-lkp@intel.com>
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
In-Reply-To: <20230307133735.90772-11-daniel.lezcano@linaro.org>
References: <20230307133735.90772-11-daniel.lezcano@linaro.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: daniel.lezcano@linaro.org
TO: rafael@kernel.org
CC: rui.zhang@intel.com
CC: amitk@kernel.org
CC: linux-pm@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on linus/master v6.3-rc2 next-20230315]
[cannot apply to rafael-pm/thermal]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/thermal-drivers-intel_pch_thermal-Use-thermal-driver-device-to-write-a-trace/20230307-223759
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230307133735.90772-11-daniel.lezcano%40linaro.org
patch subject: [PATCH v1 10/11] thermal/core: Alloc-copy-free the thermal zone parameters structure
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230316/202303160005.1BnLbm4F-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303160005.1BnLbm4F-lkp@intel.com/

smatch warnings:
drivers/thermal/thermal_core.c:1388 thermal_zone_device_register_with_trips() error: uninitialized symbol 'result'.

vim +/result +1388 drivers/thermal/thermal_core.c

7c3d5c20dc169e drivers/thermal/thermal_core.c Daniel Lezcano      2022-10-03  1183  
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1184  /**
fae11de507f0e4 drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1185   * thermal_zone_device_register_with_trips() - register a new thermal zone device
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1186   * @type:	the thermal zone device type
fae11de507f0e4 drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1187   * @trips:	a pointer to an array of thermal trips
e5bfcd30f88fdb drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1188   * @num_trips:	the number of trip points the thermal zone support
c56f5c0342dfee drivers/thermal/thermal_sys.c  Durgadoss R         2012-07-25  1189   * @mask:	a bit string indicating the writeablility of trip points
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1190   * @devdata:	private device data
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1191   * @ops:	standard thermal zone device callbacks
50125a9b27dd09 drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1192   * @tzp:	thermal zone platform parameters
b1569e99c795bf drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1193   * @passive_delay: number of milliseconds to wait between polls when
b1569e99c795bf drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1194   *		   performing passive cooling
b1569e99c795bf drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1195   * @polling_delay: number of milliseconds to wait between polls when checking
b1569e99c795bf drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1196   *		   whether trip points have been crossed (0 for interrupt
b1569e99c795bf drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1197   *		   driven systems)
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1198   *
a00e55f9c8c06e drivers/thermal/thermal_core.c Eduardo Valentin    2013-04-23  1199   * This interface function adds a new thermal zone device (sensor) to
a00e55f9c8c06e drivers/thermal/thermal_core.c Eduardo Valentin    2013-04-23  1200   * /sys/class/thermal folder as thermal_zone[0-*]. It tries to bind all the
a00e55f9c8c06e drivers/thermal/thermal_core.c Eduardo Valentin    2013-04-23  1201   * thermal cooling devices registered at the same time.
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1202   * thermal_zone_device_unregister() must be called when the device is no
1b7ddb840c3908 drivers/thermal/thermal_sys.c  Zhang Rui           2012-06-27  1203   * longer needed. The passive cooling depends on the .get_trend() return value.
a00e55f9c8c06e drivers/thermal/thermal_core.c Eduardo Valentin    2013-04-23  1204   *
a00e55f9c8c06e drivers/thermal/thermal_core.c Eduardo Valentin    2013-04-23  1205   * Return: a pointer to the created struct thermal_zone_device or an
a00e55f9c8c06e drivers/thermal/thermal_core.c Eduardo Valentin    2013-04-23  1206   * in case of error, an ERR_PTR. Caller must check return value with
a00e55f9c8c06e drivers/thermal/thermal_core.c Eduardo Valentin    2013-04-23  1207   * IS_ERR*() helpers.
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1208   */
eb7be329bd93b7 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1209  struct thermal_zone_device *
fae11de507f0e4 drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1210  thermal_zone_device_register_with_trips(const char *type, struct thermal_trip *trips, int num_trips, int mask,
eb7be329bd93b7 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1211  					void *devdata, struct thermal_zone_device_ops *ops,
eb7be329bd93b7 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1212  					struct thermal_zone_params *tzp, int passive_delay,
eb7be329bd93b7 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1213  					int polling_delay)
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1214  {
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1215  	struct thermal_zone_device *tz;
adc8749b150c51 drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1216  	int id;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1217  	int result;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1218  	int count;
e33df1d2f3a014 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1219  	struct thermal_governor *governor;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1220  
67eed44b8a8ae7 drivers/thermal/thermal_core.c Amit Kucheria       2019-07-12  1221  	if (!type || strlen(type) == 0) {
3f95ac324535ea drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1222  		pr_err("No thermal zone type defined\n");
54fa38cc2eda43 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1223  		return ERR_PTR(-EINVAL);
67eed44b8a8ae7 drivers/thermal/thermal_core.c Amit Kucheria       2019-07-12  1224  	}
54fa38cc2eda43 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1225  
c71d8035f1b77d drivers/thermal/thermal_core.c Lad Prabhakar       2022-09-09  1226  	if (strlen(type) >= THERMAL_NAME_LENGTH) {
3f95ac324535ea drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1227  		pr_err("Thermal zone name (%s) too long, should be under %d chars\n",
67eed44b8a8ae7 drivers/thermal/thermal_core.c Amit Kucheria       2019-07-12  1228  		       type, THERMAL_NAME_LENGTH);
3e6fda5c115982 drivers/thermal/thermal.c      Thomas Sujith       2008-02-15  1229  		return ERR_PTR(-EINVAL);
67eed44b8a8ae7 drivers/thermal/thermal_core.c Amit Kucheria       2019-07-12  1230  	}
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1231  
82b1ec794d7014 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1232  	/*
82b1ec794d7014 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1233  	 * Max trip count can't exceed 31 as the "mask >> num_trips" condition.
82b1ec794d7014 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1234  	 * For example, shifting by 32 will result in compiler warning:
82b1ec794d7014 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1235  	 * warning: right shift count >= width of type [-Wshift-count- overflow]
82b1ec794d7014 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1236  	 *
82b1ec794d7014 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1237  	 * Also "mask >> num_trips" will always be true with 32 bit shift.
82b1ec794d7014 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1238  	 * E.g. mask = 0x80000000 for trip id 31 to be RW. Then
82b1ec794d7014 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1239  	 * mask >> 32 = 0x80000000
82b1ec794d7014 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1240  	 * This will result in failure for the below condition.
82b1ec794d7014 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1241  	 *
82b1ec794d7014 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1242  	 * Check will be true when the bit 31 of the mask is set.
82b1ec794d7014 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1243  	 * 32 bit shift will cause overflow of 4 byte integer.
82b1ec794d7014 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1244  	 */
82b1ec794d7014 drivers/thermal/thermal_core.c Sumeet Pawnikar     2022-09-27  1245  	if (num_trips > (BITS_PER_TYPE(int) - 1) || num_trips < 0 || mask >> num_trips) {
3f95ac324535ea drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1246  		pr_err("Incorrect number of thermal trips\n");
3e6fda5c115982 drivers/thermal/thermal.c      Thomas Sujith       2008-02-15  1247  		return ERR_PTR(-EINVAL);
67eed44b8a8ae7 drivers/thermal/thermal_core.c Amit Kucheria       2019-07-12  1248  	}
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1249  
67eed44b8a8ae7 drivers/thermal/thermal_core.c Amit Kucheria       2019-07-12  1250  	if (!ops) {
3f95ac324535ea drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1251  		pr_err("Thermal zone device ops not defined\n");
3e6fda5c115982 drivers/thermal/thermal.c      Thomas Sujith       2008-02-15  1252  		return ERR_PTR(-EINVAL);
67eed44b8a8ae7 drivers/thermal/thermal_core.c Amit Kucheria       2019-07-12  1253  	}
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1254  
7c3d5c20dc169e drivers/thermal/thermal_core.c Daniel Lezcano      2022-10-03  1255  	if (num_trips > 0 && (!ops->get_trip_type || !ops->get_trip_temp) && !trips)
6b2aa51d698492 drivers/thermal/thermal_sys.c  Eduardo Valentin    2013-01-02  1256  		return ERR_PTR(-EINVAL);
6b2aa51d698492 drivers/thermal/thermal_sys.c  Eduardo Valentin    2013-01-02  1257  
9e0a9be24bdd61 drivers/thermal/thermal_core.c Rafael J. Wysocki   2023-01-23  1258  	if (!thermal_class)
9e0a9be24bdd61 drivers/thermal/thermal_core.c Rafael J. Wysocki   2023-01-23  1259  		return ERR_PTR(-ENODEV);
9e0a9be24bdd61 drivers/thermal/thermal_core.c Rafael J. Wysocki   2023-01-23  1260  
95e3ed1513494a drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1261  	tz = kzalloc(sizeof(*tz), GFP_KERNEL);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1262  	if (!tz)
3e6fda5c115982 drivers/thermal/thermal.c      Thomas Sujith       2008-02-15  1263  		return ERR_PTR(-ENOMEM);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1264  
a9813bacf35314 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1265  	if (tzp) {
a9813bacf35314 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1266  		tz->tzp = kmemdup(tzp, sizeof(*tzp), GFP_KERNEL);
a9813bacf35314 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1267  		if (!tz->tzp)
a9813bacf35314 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1268  			goto free_tz;
a9813bacf35314 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1269  	}
a9813bacf35314 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1270  	
2d374139d5b0b5 drivers/thermal/thermal_sys.c  Zhang Rui           2012-06-27  1271  	INIT_LIST_HEAD(&tz->thermal_instances);
b31ef8285b19ec drivers/thermal/thermal_core.c Matthew Wilcox      2016-12-21  1272  	ida_init(&tz->ida);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1273  	mutex_init(&tz->lock);
5a5b7d8d541684 drivers/thermal/thermal_core.c keliu               2022-05-27  1274  	id = ida_alloc(&thermal_tz_ida, GFP_KERNEL);
adc8749b150c51 drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1275  	if (id < 0) {
adc8749b150c51 drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1276  		result = id;
a9813bacf35314 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1277  		goto free_tzp;
adc8749b150c51 drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1278  	}
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1279  
adc8749b150c51 drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1280  	tz->id = id;
1e6c8fb8b8d3e9 drivers/thermal/thermal_core.c Wolfram Sang        2022-08-18  1281  	strscpy(tz->type, type, sizeof(tz->type));
d7203eedf4f68e drivers/thermal/thermal_core.c Daniel Lezcano      2020-12-10  1282  
d7203eedf4f68e drivers/thermal/thermal_core.c Daniel Lezcano      2020-12-10  1283  	if (!ops->critical)
d7203eedf4f68e drivers/thermal/thermal_core.c Daniel Lezcano      2020-12-10  1284  		ops->critical = thermal_zone_device_critical;
d7203eedf4f68e drivers/thermal/thermal_core.c Daniel Lezcano      2020-12-10  1285  
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1286  	tz->ops = ops;
9e0a9be24bdd61 drivers/thermal/thermal_core.c Rafael J. Wysocki   2023-01-23  1287  	tz->device.class = thermal_class;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1288  	tz->devdata = devdata;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1289  	tz->trips = trips;
e5bfcd30f88fdb drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1290  	tz->num_trips = num_trips;
1c600861fa6fd8 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1291  
17d399cd9c8936 drivers/thermal/thermal_core.c Daniel Lezcano      2020-12-16  1292  	thermal_set_delay_jiffies(&tz->passive_delay_jiffies, passive_delay);
17d399cd9c8936 drivers/thermal/thermal_core.c Daniel Lezcano      2020-12-16  1293  	thermal_set_delay_jiffies(&tz->polling_delay_jiffies, polling_delay);
17d399cd9c8936 drivers/thermal/thermal_core.c Daniel Lezcano      2020-12-16  1294  
4d0fe7490d7f4d drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1295  	/* sys I/F */
1c600861fa6fd8 drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1296  	/* Add nodes that are always present via .groups */
4d0fe7490d7f4d drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1297  	result = thermal_zone_create_device_groups(tz, mask);
4d0fe7490d7f4d drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1298  	if (result)
9d9ca1f9f04cf1 drivers/thermal/thermal_core.c Christophe Jaillet  2017-08-08  1299  		goto remove_id;
4d0fe7490d7f4d drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1300  
4511f7166a2deb drivers/thermal/thermal_core.c Chen Yu             2015-10-30  1301  	/* A new thermal zone needs to be updated anyway. */
4511f7166a2deb drivers/thermal/thermal_core.c Chen Yu             2015-10-30  1302  	atomic_set(&tz->need_update, 1);
b1569e99c795bf drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1303  
4748f9687caaee drivers/thermal/thermal_core.c Yang Yingliang      2022-11-15  1304  	result = dev_set_name(&tz->device, "thermal_zone%d", tz->id);
4748f9687caaee drivers/thermal/thermal_core.c Yang Yingliang      2022-11-15  1305  	if (result) {
4748f9687caaee drivers/thermal/thermal_core.c Yang Yingliang      2022-11-15  1306  		thermal_zone_destroy_device_groups(tz);
4748f9687caaee drivers/thermal/thermal_core.c Yang Yingliang      2022-11-15  1307  		goto remove_id;
4748f9687caaee drivers/thermal/thermal_core.c Yang Yingliang      2022-11-15  1308  	}
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1309  	result = device_register(&tz->device);
9d9ca1f9f04cf1 drivers/thermal/thermal_core.c Christophe Jaillet  2017-08-08  1310  	if (result)
adc8749b150c51 drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1311  		goto release_device;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1312  
e5bfcd30f88fdb drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1313  	for (count = 0; count < num_trips; count++) {
7c3d5c20dc169e drivers/thermal/thermal_core.c Daniel Lezcano      2022-10-03  1314  		struct thermal_trip trip;
7c3d5c20dc169e drivers/thermal/thermal_core.c Daniel Lezcano      2022-10-03  1315  
7c3d5c20dc169e drivers/thermal/thermal_core.c Daniel Lezcano      2022-10-03  1316  		result = thermal_zone_get_trip(tz, count, &trip);
7c3d5c20dc169e drivers/thermal/thermal_core.c Daniel Lezcano      2022-10-03  1317  		if (result)
81ad4276b505e9 drivers/thermal/thermal_core.c Zhang Rui           2016-03-18  1318  			set_bit(count, &tz->trips_disabled);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1319  	}
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1320  
a4a15485fbba44 drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1321  	/* Update 'this' zone's governor information */
a4a15485fbba44 drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1322  	mutex_lock(&thermal_governor_lock);
a4a15485fbba44 drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1323  
a4a15485fbba44 drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1324  	if (tz->tzp)
e33df1d2f3a014 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1325  		governor = __find_governor(tz->tzp->governor_name);
a4a15485fbba44 drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1326  	else
e33df1d2f3a014 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1327  		governor = def_governor;
e33df1d2f3a014 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1328  
e33df1d2f3a014 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1329  	result = thermal_set_governor(tz, governor);
e33df1d2f3a014 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1330  	if (result) {
e33df1d2f3a014 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1331  		mutex_unlock(&thermal_governor_lock);
e33df1d2f3a014 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1332  		goto unregister;
e33df1d2f3a014 drivers/thermal/thermal_core.c Javi Merino         2015-02-26  1333  	}
a4a15485fbba44 drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1334  
a4a15485fbba44 drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1335  	mutex_unlock(&thermal_governor_lock);
a4a15485fbba44 drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1336  
ccba4ffd9eff61 drivers/thermal/thermal_core.c Eduardo Valentin    2013-08-15  1337  	if (!tz->tzp || !tz->tzp->no_hwmon) {
e68b16abd91dca drivers/thermal/thermal.c      Zhang Rui           2008-04-21  1338  		result = thermal_add_hwmon_sysfs(tz);
e68b16abd91dca drivers/thermal/thermal.c      Zhang Rui           2008-04-21  1339  		if (result)
e68b16abd91dca drivers/thermal/thermal.c      Zhang Rui           2008-04-21  1340  			goto unregister;
ccba4ffd9eff61 drivers/thermal/thermal_core.c Eduardo Valentin    2013-08-15  1341  	}
e68b16abd91dca drivers/thermal/thermal.c      Zhang Rui           2008-04-21  1342  
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1343  	mutex_lock(&thermal_list_lock);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1344  	list_add_tail(&tz->node, &thermal_tz_list);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1345  	mutex_unlock(&thermal_list_lock);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1346  
70edc3ef596502 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1347  	if (tzp && tzp->linked_dev) {
70edc3ef596502 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1348  		result = sysfs_create_link(&tzp->linked_dev->kobj,
70edc3ef596502 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1349  					   &tz->device.kobj, "thermal_zone");
70edc3ef596502 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1350  		if (result)
70edc3ef596502 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1351  			goto out_list_del;
70edc3ef596502 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1352  
70edc3ef596502 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1353  		result = sysfs_create_link(&tz->device.kobj,
70edc3ef596502 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1354  					   &tzp->linked_dev->kobj, "device");
70edc3ef596502 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1355  		if (result)
70edc3ef596502 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1356  			goto out_del_link;
70edc3ef596502 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1357  	}
70edc3ef596502 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1358  
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1359  	/* Bind cooling devices for this zone */
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1360  	bind_tz(tz);
7e8ee1e9d7561f drivers/thermal/thermal_sys.c  Durgadoss R         2012-09-18  1361  
b659a30d7bdd5d drivers/thermal/thermal_core.c Eduardo Valentin    2016-11-07  1362  	INIT_DELAYED_WORK(&tz->poll_queue, thermal_zone_device_check);
b1569e99c795bf drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1363  
d0df264fbd3c53 drivers/thermal/thermal_core.c Daniel Lezcano      2020-12-22  1364  	thermal_zone_device_init(tz);
4511f7166a2deb drivers/thermal/thermal_core.c Chen Yu             2015-10-30  1365  	/* Update the new thermal zone and mark it as already updated. */
4511f7166a2deb drivers/thermal/thermal_core.c Chen Yu             2015-10-30  1366  	if (atomic_cmpxchg(&tz->need_update, 1, 0))
0e70f466fb910a drivers/thermal/thermal_core.c Srinivas Pandruvada 2016-08-26  1367  		thermal_zone_device_update(tz, THERMAL_EVENT_UNSPECIFIED);
b1569e99c795bf drivers/thermal/thermal_sys.c  Matthew Garrett     2008-12-03  1368  
55cdf0a283b876 drivers/thermal/thermal_core.c Daniel Lezcano      2020-07-06  1369  	thermal_notify_tz_create(tz->id, tz->type);
55cdf0a283b876 drivers/thermal/thermal_core.c Daniel Lezcano      2020-07-06  1370  
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1371  	return tz;
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1372  
70edc3ef596502 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1373  out_del_link:
70edc3ef596502 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1374  	sysfs_remove_link(&tz->device.kobj, "thermal_zone");
70edc3ef596502 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1375  out_list_del:
70edc3ef596502 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1376  	list_del(&tz->node);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1377  unregister:
adc8749b150c51 drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1378  	device_del(&tz->device);
adc8749b150c51 drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1379  release_device:
adc8749b150c51 drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1380  	put_device(&tz->device);
adc8749b150c51 drivers/thermal/thermal_core.c Yue Hu              2019-08-07  1381  	tz = NULL;
9d9ca1f9f04cf1 drivers/thermal/thermal_core.c Christophe Jaillet  2017-08-08  1382  remove_id:
5a5b7d8d541684 drivers/thermal/thermal_core.c keliu               2022-05-27  1383  	ida_free(&thermal_tz_ida, id);
a9813bacf35314 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1384  free_tzp:
a9813bacf35314 drivers/thermal/thermal_core.c Daniel Lezcano      2023-03-07  1385  	kfree(tz->tzp);
9d9ca1f9f04cf1 drivers/thermal/thermal_core.c Christophe Jaillet  2017-08-08  1386  free_tz:
9d9ca1f9f04cf1 drivers/thermal/thermal_core.c Christophe Jaillet  2017-08-08  1387  	kfree(tz);
9d9ca1f9f04cf1 drivers/thermal/thermal_core.c Christophe Jaillet  2017-08-08 @1388  	return ERR_PTR(result);
203d3d4aa48233 drivers/thermal/thermal.c      Zhang Rui           2008-01-17  1389  }
a921be53b46c39 drivers/thermal/thermal_core.c Daniel Lezcano      2022-08-10  1390  EXPORT_SYMBOL_GPL(thermal_zone_device_register_with_trips);
fae11de507f0e4 drivers/thermal/thermal_core.c Daniel Lezcano      2022-07-22  1391  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
