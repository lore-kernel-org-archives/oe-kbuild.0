Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9084F1EDA0E
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 23:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756597190; cv=none; b=E0Ngw4eFut92jP2rwvwXKlIlf/PCzqCGomZVZ5FWvyGNuoqbAmMj4iF/kuRSNXwtNy3SYsP5xMEw6pMLSiVo3ZvDzNgEU56x5B4pkCl9iuj4Vsz7I7Z92Lo4IKdvxtlhZhkef3NS5b055MJ4lQvhTogGlkp45aMRQvDzmt3ZZXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756597190; c=relaxed/simple;
	bh=r3L3L3rK8TZbUGgvvL9LEtR3HY5aYfCAQYghokNX60M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sbUOMyOKWm+lzG5P5kfiV6NL0H9GhOo+JNFJEByzR/TklOwPEvukUmtTPuQ8KSwmenVGCcZhObaSPh/jItE7bAF/Bm/EU7dm9+qJfAgezcaurTTE4u/qQyFmacdt+l9BOZCxFG+22nH78NXpLAWpg6kmS7esp+09kVqDWEvz8Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mb3xWMJV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mb3xWMJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756597188; x=1788133188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r3L3L3rK8TZbUGgvvL9LEtR3HY5aYfCAQYghokNX60M=;
  b=Mb3xWMJVR0oD7lFGtktcKfP4LyZzmQGruvgBugpybU6QY3pffMED0ptM
   FvKgpobW7YdYz23QYt27fhsw4BC1Ac9z/w8HpSH6wbrfAVwm42GnpVWXT
   QdtbbrSOnuYxsTqaqz3CZGCzTWI970DKNK/aSfHPdhhyn47ukudCXyWUl
   ChlICzuKw+Ppz/H2rizFwqVLjAv3HfEqbLIVltSgj+iRXJi677mxSpthi
   hpKJbDRPfJn3ReRWNkWLLCbYXZq9Wm6Yp1pN+/bDXepEyFchmoJz3NIWT
   U7w6mX5wvrdVH6D3VmjnhBXCt41YYZF5Zig9MmizCfNysitrE2sUbErt/
   w==;
X-CSE-ConnectionGUID: jjeUJoQkRueucpCRdu/N3Q==
X-CSE-MsgGUID: EQV/WTxuTZadRjC2OrRakQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62676751"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62676751"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 16:39:48 -0700
X-CSE-ConnectionGUID: hPnGd+bUT5mqcaVdkzOOxw==
X-CSE-MsgGUID: M/3N5nn8S0yEiDVcWmsxRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170186564"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Aug 2025 16:39:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usVA1-000VlT-0l;
	Sat, 30 Aug 2025 23:39:16 +0000
Date: Sun, 31 Aug 2025 07:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 15/15] iio: adc: ad4030: Add support for ADAQ4216 and
 ADAQ4224
Message-ID: <202508310754.Y4V0Iq26-lkp@intel.com>
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
In-Reply-To: <006ac88a667ce0d2c751946b562af83d0f27a44f.1756511030.git.marcelo.schmitt@analog.com>
References: <006ac88a667ce0d2c751946b562af83d0f27a44f.1756511030.git.marcelo.schmitt@analog.com>
TO: Marcelo Schmitt <marcelo.schmitt@analog.com>
TO: linux-iio@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-doc@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-spi@vger.kernel.org
CC: jic23@kernel.org
CC: Michael.Hennerich@analog.com
CC: nuno.sa@analog.com
CC: eblanc@baylibre.com
CC: dlechner@baylibre.com
CC: andy@kernel.org
CC: corbet@lwn.net
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: broonie@kernel.org
CC: Jonathan.Cameron@huawei.com
CC: andriy.shevchenko@linux.intel.com
CC: ahaslam@baylibre.com
CC: marcelo.schmitt1@gmail.com

Hi Marcelo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 91812d3843409c235f336f32f1c37ddc790f1e03]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcelo-Schmitt/iio-adc-ad4030-Fix-_scale-for-when-oversampling-is-enabled/20250830-084901
base:   91812d3843409c235f336f32f1c37ddc790f1e03
patch link:    https://lore.kernel.org/r/006ac88a667ce0d2c751946b562af83d0f27a44f.1756511030.git.marcelo.schmitt%40analog.com
patch subject: [PATCH 15/15] iio: adc: ad4030: Add support for ADAQ4216 and ADAQ4224
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: x86_64-randconfig-161-20250831 (https://download.01.org/0day-ci/archive/20250831/202508310754.Y4V0Iq26-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508310754.Y4V0Iq26-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad4030.c:515 ad4030_set_pga() error: 'scan_type' dereferencing possible ERR_PTR()

vim +/scan_type +515 drivers/iio/adc/ad4030.c

8017880dd8ca3e Marcelo Schmitt 2025-08-29  501  
8017880dd8ca3e Marcelo Schmitt 2025-08-29  502  static int ad4030_set_pga(struct iio_dev *indio_dev,
8017880dd8ca3e Marcelo Schmitt 2025-08-29  503  			  struct iio_chan_spec const *chan, int gain_int,
8017880dd8ca3e Marcelo Schmitt 2025-08-29  504  			  int gain_fract)
8017880dd8ca3e Marcelo Schmitt 2025-08-29  505  {
8017880dd8ca3e Marcelo Schmitt 2025-08-29  506  	struct ad4030_state *st = iio_priv(indio_dev);
8017880dd8ca3e Marcelo Schmitt 2025-08-29  507  	const struct iio_scan_type *scan_type;
8017880dd8ca3e Marcelo Schmitt 2025-08-29  508  	unsigned int mag_bits;
8017880dd8ca3e Marcelo Schmitt 2025-08-29  509  	u64 gain_nano, tmp;
8017880dd8ca3e Marcelo Schmitt 2025-08-29  510  
8017880dd8ca3e Marcelo Schmitt 2025-08-29  511  	if (!st->pga_gpios)
8017880dd8ca3e Marcelo Schmitt 2025-08-29  512  		return -EINVAL;
8017880dd8ca3e Marcelo Schmitt 2025-08-29  513  
8017880dd8ca3e Marcelo Schmitt 2025-08-29  514  	scan_type = iio_get_current_scan_type(indio_dev, chan);
8017880dd8ca3e Marcelo Schmitt 2025-08-29 @515  	if (scan_type->sign == 's')
8017880dd8ca3e Marcelo Schmitt 2025-08-29  516  		mag_bits = st->chip->precision_bits - 1;
8017880dd8ca3e Marcelo Schmitt 2025-08-29  517  	else
8017880dd8ca3e Marcelo Schmitt 2025-08-29  518  		mag_bits = st->chip->precision_bits;
8017880dd8ca3e Marcelo Schmitt 2025-08-29  519  
8017880dd8ca3e Marcelo Schmitt 2025-08-29  520  	gain_nano = gain_int * NANO + gain_fract;
8017880dd8ca3e Marcelo Schmitt 2025-08-29  521  
8017880dd8ca3e Marcelo Schmitt 2025-08-29  522  	if (!in_range(gain_nano, 0, ADAQ4616_GAIN_MAX_NANO))
8017880dd8ca3e Marcelo Schmitt 2025-08-29  523  		return -EINVAL;
8017880dd8ca3e Marcelo Schmitt 2025-08-29  524  
8017880dd8ca3e Marcelo Schmitt 2025-08-29  525  	tmp = DIV_ROUND_CLOSEST_ULL(gain_nano << mag_bits, NANO);
8017880dd8ca3e Marcelo Schmitt 2025-08-29  526  	gain_nano = DIV_ROUND_CLOSEST_ULL(st->vref_uv, tmp);
8017880dd8ca3e Marcelo Schmitt 2025-08-29  527  	st->pga_index = find_closest(gain_nano, ad4030_hw_gains,
8017880dd8ca3e Marcelo Schmitt 2025-08-29  528  				     ARRAY_SIZE(ad4030_hw_gains));
8017880dd8ca3e Marcelo Schmitt 2025-08-29  529  
8017880dd8ca3e Marcelo Schmitt 2025-08-29  530  	return ad4030_set_pga_gain(st);
8017880dd8ca3e Marcelo Schmitt 2025-08-29  531  }
8017880dd8ca3e Marcelo Schmitt 2025-08-29  532  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
