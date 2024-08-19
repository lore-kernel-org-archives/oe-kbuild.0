Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB1E15A87C
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Aug 2024 23:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724110272; cv=none; b=DgYf81xqgdVGR/owu8GfE5TyLPZhYg/1fDAcBF0UnSbF1wFfLkcmfiVBn1SeeVu7es1erjpcB9AGDDcN1RWtDxtwOpl87QUMwFjl+ojxLx0CTQfK0GDk5k9IXuor61TLw1qmEsWn4UZwJ1/A45kcXZAMiCxIC7EQBGeFBfgH2P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724110272; c=relaxed/simple;
	bh=x5IWnCMR5mFr62fafd3cIc3u7UByeF8ukgOw2+RfwwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kg4jJtetyG06UcdhWOBjF87YKcnMZP9Y7AYCaOumZSCafySa+3DI1F5muNKOWTZaN9evq7WNvzE9kuN/ZT4HjaEchIuph/Yp3/LoNE8nxstGs2qtd/j6/0Ms9VOLnNSz3Pit6vZvfYPOYh/t8Qy5GpZpZcFOpd/43Vn44cbUbnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jq5q6MPL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jq5q6MPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724110271; x=1755646271;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=x5IWnCMR5mFr62fafd3cIc3u7UByeF8ukgOw2+RfwwA=;
  b=jq5q6MPLc89qDgl270S0uYdnR3fIUz0bg/ZHnGe29ZgWNa5h5CHmvY7e
   W2dktdTCOdkyZUaArZlSDcNJopx4ZOBI2Jgq5fVFQrER8ArYbUiIQdC4X
   aEjovcpEvtsy/yK3DppvbUlaHJb8NlYq5/oHGSCRpSuTrWfyogmBQjQel
   2yuooomZ0os8q0wvD6zuNbvXxl52YXGMd584wr9McpLyY6ArR8OTFN0I6
   VNs8H+IpZqSDfMC8e78921TJhG2N5V51TfEnDPl9nK0fScjd2/eJDZZOj
   iSu5dMtAfVFB5lBRg5CGleIV1E19BxrL1FbtBFWaPE0pdXB3DJ/+CKuRZ
   A==;
X-CSE-ConnectionGUID: q9vxMN2RSN61e2wxqRGNUA==
X-CSE-MsgGUID: 7iO9MlK4TWGxzlvBnHj6gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22560196"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="22560196"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 16:31:08 -0700
X-CSE-ConnectionGUID: GEv1V2TGQS2V0KNq+eCY0w==
X-CSE-MsgGUID: BPhNtY22SIyvZu+gkFtkxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="91292706"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Aug 2024 16:31:07 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgBq5-0009Wt-0K;
	Mon, 19 Aug 2024 23:31:05 +0000
Date: Tue, 20 Aug 2024 07:30:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 5/7] iio: adc: ad7606: rework available attributes for SW
 channels
Message-ID: <202408200721.5cLwiXfZ-lkp@intel.com>
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
In-Reply-To: <20240819064721.91494-6-aardelean@baylibre.com>
References: <20240819064721.91494-6-aardelean@baylibre.com>
TO: Alexandru Ardelean <aardelean@baylibre.com>
TO: linux-iio@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: jic23@kernel.org
CC: krzk+dt@kernel.org
CC: robh@kernel.org
CC: lars@metafoo.de
CC: michael.hennerich@analog.com
CC: gstols@baylibre.com
CC: Alexandru Ardelean <aardelean@baylibre.com>

Hi Alexandru,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on next-20240819]
[cannot apply to linus/master v6.11-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandru-Ardelean/iio-adc-ad7606-add-bits-parameter-to-channels-macros/20240819-145028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240819064721.91494-6-aardelean%40baylibre.com
patch subject: [PATCH 5/7] iio: adc: ad7606: rework available attributes for SW channels
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-161-20240820 (https://download.01.org/0day-ci/archive/20240820/202408200721.5cLwiXfZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408200721.5cLwiXfZ-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7606.c:624 ad7606_sw_mode_setup() error: uninitialized symbol 'scale_avail_show'.

vim +/scale_avail_show +624 drivers/iio/adc/ad7606.c

6fe8135fccd66a drivers/staging/iio/adc/ad7606_core.c Jonathan Cameron   2011-05-18  583  
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  584  static int ad7606_sw_mode_setup(struct iio_dev *indio_dev)
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  585  {
36b63bb57295f7 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  586  	unsigned int num_channels = indio_dev->num_channels - 1;
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  587  	struct ad7606_state *st = iio_priv(indio_dev);
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  588  	unsigned int *scale_avail_show, num_scales_avail_show;
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  589  	int ret, ch;
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  590  
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  591  	if (!st->bops->sw_mode_config)
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  592  		return 0;
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  593  
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  594  	st->sw_mode_en = device_property_present(st->dev, "adi,sw-mode");
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  595  	if (!st->sw_mode_en)
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  596  		return 0;
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  597  
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  598  	indio_dev->info = &ad7606_info_sw_mode;
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  599  
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  600  	/* Scale of 0.076293 is only available in sw mode */
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  601  	/* After reset, in software mode, ±10 V is set by default */
36b63bb57295f7 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  602  	for (ch = 0; ch < num_channels; ch++) {
36b63bb57295f7 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  603  		struct ad7606_chan_scale *cs = &st->chan_scales[ch];
36b63bb57295f7 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  604  
36b63bb57295f7 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  605  		cs->scale_avail = ad7616_sw_scale_avail;
36b63bb57295f7 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  606  		cs->num_scales = ARRAY_SIZE(ad7616_sw_scale_avail);
36b63bb57295f7 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  607  		cs->range = 2;
36b63bb57295f7 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  608  	}
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  609  
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  610  	ret = st->bops->sw_mode_config(indio_dev);
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  611  	if (ret)
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  612  		return ret;
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  613  
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  614  	num_scales_avail_show = 1;
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  615  
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  616  	for (ch = 0; ch < num_channels; ch++) {
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  617  		struct ad7606_chan_scale *cs;
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  618  		int i;
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  619  
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  620  		/* AD7606C supports different scales per channel */
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  621  		cs = &st->chan_scales[ch];
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  622  
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  623  		if (num_scales_avail_show == 1 && ch > 0) {
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19 @624  			cs->scale_avail_show = scale_avail_show;
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  625  			continue;
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  626  		}
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  627  
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  628  		scale_avail_show = devm_kcalloc(st->dev, cs->num_scales * 2,
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  629  						sizeof(*scale_avail_show),
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  630  						GFP_KERNEL);
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  631  		if (!scale_avail_show)
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  632  			return -ENOMEM;
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  633  
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  634  		/* Generate a scale_avail list for showing to userspace */
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  635  		for (i = 0; i < cs->num_scales; i++) {
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  636  			scale_avail_show[i * 2] = 0;
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  637  			scale_avail_show[i * 2 + 1] = cs->scale_avail[i];
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  638  		}
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  639  
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  640  		cs->scale_avail_show = scale_avail_show;
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  641  	}
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  642  
09d11fa081ef17 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  643  	return 0;
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  644  }
b5d2c422286d62 drivers/iio/adc/ad7606.c              Alexandru Ardelean 2024-08-19  645  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
