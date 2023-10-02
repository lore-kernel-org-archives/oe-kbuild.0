Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0E41F195
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Oct 2023 19:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696274232; x=1727810232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0/rcm1zLA1bGtvyKjHteDcj981Dh8OeXW0Z0y0oIi4c=;
  b=DdFKx2HWsulvhZqdmdnIQa4fJfrzEbeolUs/+LvH2pcPdtb2HKsQhB80
   SzQqUIRL8WO9HnW95s/TTEQ+YURwk9gOdyevfAqPPJpTAEsOUCya8ffVa
   wruwmLnvQLFIeEWDfnw5/BrpoFEAt3b9EQvSdVg2LKCcqU2g4XGU70tDD
   sii7DRYJsbZ+1VP6M4arNtRlr05L9fo44NKh6JKFfaQ0817lguvI5/HSK
   XQqPgC2ELvEtCc9lFyMeJyl8R1JH/vwxRj9lkUfzbz7UOoSIu6zw9Sjhn
   F8/bQGGaafcWoOMMvIa/l38qV5ychSXJ4WVitDdrd55Bq4QpB0RGdUJ7g
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="446866289"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="446866289"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 11:45:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="700429139"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="700429139"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 02 Oct 2023 11:45:27 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnNv2-0006HG-03;
	Mon, 02 Oct 2023 18:45:24 +0000
Date: Tue, 3 Oct 2023 02:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jic23-iio:testing 140/154]
 drivers/staging/iio/resolver/ad2s1210.c:560 ad2s1210_initial() warn:
 inconsistent returns '&st->lock'.
Message-ID: <202310030222.iokamE9T-lkp@intel.com>
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
TO: David Lechner <dlechner@baylibre.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   a533eeaef80e879b3ad1937eee7a43d1f9961c5d
commit: 0d03d0e6584655a002c4e3aaae657b35f0900921 [140/154] staging: iio: resolver: ad2s1210: rework gpios
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20231002 (https://download.01.org/0day-ci/archive/20231003/202310030222.iokamE9T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231003/202310030222.iokamE9T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310030222.iokamE9T-lkp@intel.com/

smatch warnings:
drivers/staging/iio/resolver/ad2s1210.c:560 ad2s1210_initial() warn: inconsistent returns '&st->lock'.

vim +560 drivers/staging/iio/resolver/ad2s1210.c

817e5c65c511d4 Graf Yang        2010-10-27  533  
4ae1c61ff2ba4f Bill Pemberton   2012-11-19  534  static int ad2s1210_initial(struct ad2s1210_state *st)
817e5c65c511d4 Graf Yang        2010-10-27  535  {
817e5c65c511d4 Graf Yang        2010-10-27  536  	unsigned char data;
817e5c65c511d4 Graf Yang        2010-10-27  537  	int ret;
817e5c65c511d4 Graf Yang        2010-10-27  538  
817e5c65c511d4 Graf Yang        2010-10-27  539  	mutex_lock(&st->lock);
0d03d0e6584655 David Lechner    2023-09-29  540  	ret = ad2s1210_set_resolution_gpios(st, st->resolution);
0d03d0e6584655 David Lechner    2023-09-29  541  	if (ret < 0)
0d03d0e6584655 David Lechner    2023-09-29  542  		return ret;
b19e9ad5e2cb91 Jonathan Cameron 2011-06-27  543  
b3689e14415a87 David Lechner    2023-09-29  544  	/* Use default config register value plus resolution from devicetree. */
b3689e14415a87 David Lechner    2023-09-29  545  	data = FIELD_PREP(AD2S1210_PHASE_LOCK_RANGE_44, 1);
b3689e14415a87 David Lechner    2023-09-29  546  	data |= FIELD_PREP(AD2S1210_ENABLE_HYSTERESIS, 1);
b3689e14415a87 David Lechner    2023-09-29  547  	data |= FIELD_PREP(AD2S1210_SET_ENRES, 0x3);
b3689e14415a87 David Lechner    2023-09-29  548  	data |= FIELD_PREP(AD2S1210_SET_RES, (st->resolution - 10) >> 1);
817e5c65c511d4 Graf Yang        2010-10-27  549  
b3689e14415a87 David Lechner    2023-09-29  550  	ret = regmap_write(st->regmap, AD2S1210_REG_CONTROL, data);
b3689e14415a87 David Lechner    2023-09-29  551  	if (ret < 0)
817e5c65c511d4 Graf Yang        2010-10-27  552  		goto error_ret;
817e5c65c511d4 Graf Yang        2010-10-27  553  
b19e9ad5e2cb91 Jonathan Cameron 2011-06-27  554  	ret = ad2s1210_update_frequency_control_word(st);
b19e9ad5e2cb91 Jonathan Cameron 2011-06-27  555  	if (ret < 0)
b19e9ad5e2cb91 Jonathan Cameron 2011-06-27  556  		goto error_ret;
b19e9ad5e2cb91 Jonathan Cameron 2011-06-27  557  	ret = ad2s1210_soft_reset(st);
817e5c65c511d4 Graf Yang        2010-10-27  558  error_ret:
817e5c65c511d4 Graf Yang        2010-10-27  559  	mutex_unlock(&st->lock);
817e5c65c511d4 Graf Yang        2010-10-27 @560  	return ret;
817e5c65c511d4 Graf Yang        2010-10-27  561  }
817e5c65c511d4 Graf Yang        2010-10-27  562  

:::::: The code at line 560 was first introduced by commit
:::::: 817e5c65c511d4a83686333ae75507deb4b55d5e staging: iio: resolver: new driver for AD2S1210 devices

:::::: TO: Graf Yang <graf.yang@analog.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
