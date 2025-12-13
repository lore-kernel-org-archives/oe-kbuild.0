Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD253019B3
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 11:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765624055; cv=none; b=Fg5HBDvBYn759PrtXuzrVnTHXAMnNqVJVGNQsEigTLP4km69A888P77f0yyBi7wcGbGaa8BN3tUoLu+T9j68GUMNnje7TE+AkWfrPbX2XSBl5ZjdagQArT0dVfQkFMLCz3Ll3eBJ0HSUNS1XZMpCkxyW4l0AjsCKtHLYpoDvb/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765624055; c=relaxed/simple;
	bh=RF2RXoEgLTunGjDk6cXTPrra3tEscN+DKE/vDSQ7YfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=btJybzJLfkV0kdXp4miZl5UgkTpD6LyKj4PZUgR2MvbrOtcJri6Pfd+8IDUa+0yj+ZagfFoe8Flk47SL3dvBBLrnmmgnoihdXgZLHTD3hpeKfeX6QaPXs+hahLVQIK5gJbfGKwjzjF1P4yapVoVNj34THmqoMXDC96bL+5byaA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEGSXtjI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEGSXtjI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765624054; x=1797160054;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RF2RXoEgLTunGjDk6cXTPrra3tEscN+DKE/vDSQ7YfQ=;
  b=gEGSXtjIAfRBSdqpzdyQ2WUhYkrGq7o4Inrepk4+F2HXRKHqIOKkfcSn
   D13rpVl04PPti4Gkwy3yioiq7TgNqM29vYqyrdTorUwO989j5dhBqaLYY
   be+oIWkSBiWJKxYw1oUFsEB+LNq4NJQ+hA/o6YdURSKZ9v99sygbqtWNu
   lXI5s+G4aX0S/kYM9xJzJAf7PicIhXaN1h4EzhC8md+ko7tr1VNddFosO
   zwX0aJ4dolL9JNsB78S78NLFLWMA8++9Ki0ckl0OBorCa25HrpBbFf/Ms
   /yAijDIbZ5SH6owN3OO17MBcH2PXGVcJ+9X/bolAAbc5/XaOEHds5B417
   w==;
X-CSE-ConnectionGUID: Ix9tuPsqSw2SsY31Vqyvmw==
X-CSE-MsgGUID: yGpSRR9UQxGboauLZdznig==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67548590"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67548590"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 03:07:33 -0800
X-CSE-ConnectionGUID: ktXpRHXvSNW7eh6dgbOaYA==
X-CSE-MsgGUID: hDWzTqjsS96u3PdvVMj0uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197056723"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 03:07:32 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUNTF-000000007Wp-302o;
	Sat, 13 Dec 2025 11:07:29 +0000
Date: Sat, 13 Dec 2025 19:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/adc/ad7606.c:1265 ad7606_probe_channels() warn:
 potentially one past the end of array 'channels[i]'
Message-ID: <202512131959.mdJNb4PD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Lechner <dlechner@baylibre.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: "Nuno Sá" <nuno.sa@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 3b5b55ca940733b7b533fe3137a307ceacb4fb90 iio: adc: ad7606: dynamically allocate channel info
date:   8 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 months ago
config: microblaze-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131959.mdJNb4PD-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131959.mdJNb4PD-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7606.c:1265 ad7606_probe_channels() warn: potentially one past the end of array 'channels[i]'
drivers/iio/adc/ad7606.c:1265 ad7606_probe_channels() warn: potentially one past the end of array 'channels[i]'

vim +1265 drivers/iio/adc/ad7606.c

e571c1902116a3 Alexandru Ardelean 2024-09-19  1190  
3b5b55ca940733 David Lechner      2025-03-18  1191  static int ad7606_probe_channels(struct iio_dev *indio_dev)
e571c1902116a3 Alexandru Ardelean 2024-09-19  1192  {
e571c1902116a3 Alexandru Ardelean 2024-09-19  1193  	struct ad7606_state *st = iio_priv(indio_dev);
3b5b55ca940733 David Lechner      2025-03-18  1194  	struct device *dev = indio_dev->dev.parent;
3b5b55ca940733 David Lechner      2025-03-18  1195  	struct iio_chan_spec *channels;
3b5b55ca940733 David Lechner      2025-03-18  1196  	bool slow_bus;
3b5b55ca940733 David Lechner      2025-03-18  1197  	int ret, i;
3b5b55ca940733 David Lechner      2025-03-18  1198  
3b5b55ca940733 David Lechner      2025-03-18  1199  	slow_bus = !st->bops->iio_backend_config;
3b5b55ca940733 David Lechner      2025-03-18  1200  	indio_dev->num_channels = st->chip_info->num_adc_channels;
3b5b55ca940733 David Lechner      2025-03-18  1201  
3b5b55ca940733 David Lechner      2025-03-18  1202  	/* Slow buses also get 1 more channel for soft timestamp */
3b5b55ca940733 David Lechner      2025-03-18  1203  	if (slow_bus)
3b5b55ca940733 David Lechner      2025-03-18  1204  		indio_dev->num_channels++;
3b5b55ca940733 David Lechner      2025-03-18  1205  
3b5b55ca940733 David Lechner      2025-03-18  1206  	channels = devm_kcalloc(dev, indio_dev->num_channels, sizeof(*channels),
3b5b55ca940733 David Lechner      2025-03-18  1207  				GFP_KERNEL);
3b5b55ca940733 David Lechner      2025-03-18  1208  	if (!channels)
f3838e934dfff2 Alexandru Ardelean 2024-09-19  1209  		return -ENOMEM;
f3838e934dfff2 Alexandru Ardelean 2024-09-19  1210  
3b5b55ca940733 David Lechner      2025-03-18  1211  	for (i = 0; i < st->chip_info->num_adc_channels; i++) {
3b5b55ca940733 David Lechner      2025-03-18  1212  		struct iio_chan_spec *chan = &channels[i];
3b5b55ca940733 David Lechner      2025-03-18  1213  
3b5b55ca940733 David Lechner      2025-03-18  1214  		chan->type = IIO_VOLTAGE;
3b5b55ca940733 David Lechner      2025-03-18  1215  		chan->indexed = 1;
3b5b55ca940733 David Lechner      2025-03-18  1216  		chan->channel = i;
3b5b55ca940733 David Lechner      2025-03-18  1217  		chan->scan_index = i;
3b5b55ca940733 David Lechner      2025-03-18  1218  		chan->scan_type.sign = 's';
3b5b55ca940733 David Lechner      2025-03-18  1219  		chan->scan_type.realbits = st->chip_info->bits;
3b5b55ca940733 David Lechner      2025-03-18  1220  		chan->scan_type.storagebits = st->chip_info->bits > 16 ? 32 : 16;
3b5b55ca940733 David Lechner      2025-03-18  1221  		chan->scan_type.endianness = IIO_CPU;
f3838e934dfff2 Alexandru Ardelean 2024-09-19  1222  
3b5b55ca940733 David Lechner      2025-03-18  1223  		if (indio_dev->modes & INDIO_DIRECT_MODE)
3b5b55ca940733 David Lechner      2025-03-18  1224  			chan->info_mask_separate |= BIT(IIO_CHAN_INFO_RAW);
3b5b55ca940733 David Lechner      2025-03-18  1225  
3b5b55ca940733 David Lechner      2025-03-18  1226  		if (st->sw_mode_en) {
3b5b55ca940733 David Lechner      2025-03-18  1227  			chan->info_mask_separate |= BIT(IIO_CHAN_INFO_SCALE);
3b5b55ca940733 David Lechner      2025-03-18  1228  			chan->info_mask_separate_available |=
3b5b55ca940733 David Lechner      2025-03-18  1229  				BIT(IIO_CHAN_INFO_SCALE);
3b5b55ca940733 David Lechner      2025-03-18  1230  
3b5b55ca940733 David Lechner      2025-03-18  1231  			/*
3b5b55ca940733 David Lechner      2025-03-18  1232  			 * All chips with software mode support oversampling,
3b5b55ca940733 David Lechner      2025-03-18  1233  			 * so we skip the oversampling_available check. And the
3b5b55ca940733 David Lechner      2025-03-18  1234  			 * shared_by_type instead of shared_by_all on slow
3b5b55ca940733 David Lechner      2025-03-18  1235  			 * buses is for backward compatibility.
3b5b55ca940733 David Lechner      2025-03-18  1236  			 */
3b5b55ca940733 David Lechner      2025-03-18  1237  			if (slow_bus)
3b5b55ca940733 David Lechner      2025-03-18  1238  				chan->info_mask_shared_by_type |=
3b5b55ca940733 David Lechner      2025-03-18  1239  					BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO);
3b5b55ca940733 David Lechner      2025-03-18  1240  			else
3b5b55ca940733 David Lechner      2025-03-18  1241  				chan->info_mask_shared_by_all |=
3b5b55ca940733 David Lechner      2025-03-18  1242  					BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO);
3b5b55ca940733 David Lechner      2025-03-18  1243  
3b5b55ca940733 David Lechner      2025-03-18  1244  			chan->info_mask_shared_by_all_available |=
3b5b55ca940733 David Lechner      2025-03-18  1245  				BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO);
3b5b55ca940733 David Lechner      2025-03-18  1246  		} else {
3b5b55ca940733 David Lechner      2025-03-18  1247  			chan->info_mask_shared_by_type |=
3b5b55ca940733 David Lechner      2025-03-18  1248  				BIT(IIO_CHAN_INFO_SCALE);
3b5b55ca940733 David Lechner      2025-03-18  1249  
3b5b55ca940733 David Lechner      2025-03-18  1250  			if (st->chip_info->oversampling_avail)
3b5b55ca940733 David Lechner      2025-03-18  1251  				chan->info_mask_shared_by_all |=
3b5b55ca940733 David Lechner      2025-03-18  1252  					BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO);
3b5b55ca940733 David Lechner      2025-03-18  1253  		}
3b5b55ca940733 David Lechner      2025-03-18  1254  
3b5b55ca940733 David Lechner      2025-03-18  1255  		if (!slow_bus)
3b5b55ca940733 David Lechner      2025-03-18  1256  			chan->info_mask_shared_by_all |=
3b5b55ca940733 David Lechner      2025-03-18  1257  				BIT(IIO_CHAN_INFO_SAMP_FREQ);
3b5b55ca940733 David Lechner      2025-03-18  1258  
3b5b55ca940733 David Lechner      2025-03-18  1259  		ret = st->chip_info->scale_setup_cb(indio_dev, chan);
e571c1902116a3 Alexandru Ardelean 2024-09-19  1260  		if (ret)
e571c1902116a3 Alexandru Ardelean 2024-09-19  1261  			return ret;
e571c1902116a3 Alexandru Ardelean 2024-09-19  1262  	}
e571c1902116a3 Alexandru Ardelean 2024-09-19  1263  
3b5b55ca940733 David Lechner      2025-03-18  1264  	if (slow_bus)
3b5b55ca940733 David Lechner      2025-03-18 @1265  		channels[i] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(i);
3b5b55ca940733 David Lechner      2025-03-18  1266  
3b5b55ca940733 David Lechner      2025-03-18  1267  	indio_dev->channels = channels;
3b5b55ca940733 David Lechner      2025-03-18  1268  
e571c1902116a3 Alexandru Ardelean 2024-09-19  1269  	return 0;
e571c1902116a3 Alexandru Ardelean 2024-09-19  1270  }
e571c1902116a3 Alexandru Ardelean 2024-09-19  1271  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
