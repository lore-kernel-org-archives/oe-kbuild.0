Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4A16135
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Nov 2023 03:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqomuip7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700709134; x=1732245134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wys0Oz4EhDbeFEpQMn6Pj5jaGug/0EaIdbvaVGomy34=;
  b=bqomuip7475bThFb1uB7v9LIL+hlS09UNV9dYDG3MM8L57o2IKA5gX2M
   QlMtkcdixsmHOa8shWi9WVR9BXdf1Uqbb8NOogdJVkLk+N6QV9lljSiu7
   gJHLj1g3wEUiMJ7mMmFJwcwK2zsGc1wRJT5w/Um63TWT82LHkJQWGHk7h
   YXdWORfYDcglNNwbOE0s5McV+6z8up0VCWMAKA6JXPdYrvv6f1AU6UBLf
   m2mXRfSDZjMEVzd1glnxlsW6wVC0QNBgJBHHpq0VaCK954DjGPIoJUSjU
   9wgGEqs8MhEGzo0JL2YkMQQs593D9ZSshp816CVU4bKIAEWb3EthbxtUn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="458685572"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="458685572"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 19:12:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="716933928"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="716933928"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Nov 2023 19:12:12 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r608P-0001A0-2s;
	Thu, 23 Nov 2023 03:12:09 +0000
Date: Thu, 23 Nov 2023 11:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 6/7] iio: adc: Add support for AD7091R-8
Message-ID: <202311230719.KwwC9NyC-lkp@intel.com>
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
In-Reply-To: <514295a9b760b44a710425803a41decddd3e8df8.1700595310.git.marcelo.schmitt1@gmail.com>
References: <514295a9b760b44a710425803a41decddd3e8df8.1700595310.git.marcelo.schmitt1@gmail.com>
TO: "marcelo.schmitt@analog.com" <marcelo.schmitt@analog.com>
TO: beniamin.bia@analog.com
TO: paul.cercueil@analog.com
TO: Michael.Hennerich@analog.com
TO: lars@metafoo.de
TO: jic23@kernel.org
TO: marcelo.schmitt1@gmail.com
CC: Marcelo Schmitt <marcelo.schmitt@analog.com>
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.7-rc2 next-20231122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/marcelo-schmitt-analog-com/MAINTAINERS-Add-MAINTAINERS-entry-for-AD7091R/20231122-093706
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/514295a9b760b44a710425803a41decddd3e8df8.1700595310.git.marcelo.schmitt1%40gmail.com
patch subject: [PATCH 6/7] iio: adc: Add support for AD7091R-8
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-161-20231122 (https://download.01.org/0day-ci/archive/20231123/202311230719.KwwC9NyC-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231123/202311230719.KwwC9NyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311230719.KwwC9NyC-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7091r-base.c:53 ad7091r_set_mode() warn: ignoring unreachable code.

vim +53 drivers/iio/adc/ad7091r-base.c

ca69300173b642 Paul Cercueil   2019-11-15  28  
ca69300173b642 Paul Cercueil   2019-11-15  29  #define AD7091R_REG_CONF_MODE_MASK  \
ca69300173b642 Paul Cercueil   2019-11-15  30  	(AD7091R_REG_CONF_AUTO | AD7091R_REG_CONF_CMD)
ca69300173b642 Paul Cercueil   2019-11-15  31  
ca69300173b642 Paul Cercueil   2019-11-15  32  static int ad7091r_set_mode(struct ad7091r_state *st, enum ad7091r_mode mode)
ca69300173b642 Paul Cercueil   2019-11-15  33  {
ca69300173b642 Paul Cercueil   2019-11-15  34  	int ret, conf;
ca69300173b642 Paul Cercueil   2019-11-15  35  
ca69300173b642 Paul Cercueil   2019-11-15  36  	switch (mode) {
ca69300173b642 Paul Cercueil   2019-11-15  37  	case AD7091R_MODE_SAMPLE:
ca69300173b642 Paul Cercueil   2019-11-15  38  		conf = 0;
ca69300173b642 Paul Cercueil   2019-11-15  39  		break;
ca69300173b642 Paul Cercueil   2019-11-15  40  	case AD7091R_MODE_COMMAND:
ca69300173b642 Paul Cercueil   2019-11-15  41  		conf = AD7091R_REG_CONF_CMD;
ca69300173b642 Paul Cercueil   2019-11-15  42  		break;
ca69300173b642 Paul Cercueil   2019-11-15  43  	case AD7091R_MODE_AUTOCYCLE:
ca69300173b642 Paul Cercueil   2019-11-15  44  		conf = AD7091R_REG_CONF_AUTO;
ca69300173b642 Paul Cercueil   2019-11-15  45  		break;
ca69300173b642 Paul Cercueil   2019-11-15  46  	default:
ca69300173b642 Paul Cercueil   2019-11-15  47  		return -EINVAL;
ca69300173b642 Paul Cercueil   2019-11-15  48  	}
ca69300173b642 Paul Cercueil   2019-11-15  49  
fccb9cf346d38a Marcelo Schmitt 2023-11-21  50  	/* AD7091R-2/4/8 don't set normal, command, autocycle modes in conf reg */
fccb9cf346d38a Marcelo Schmitt 2023-11-21  51  	if (st->chip_info->type == AD7091R5) {
fccb9cf346d38a Marcelo Schmitt 2023-11-21  52  		return 0;
ca69300173b642 Paul Cercueil   2019-11-15 @53  		ret = regmap_update_bits(st->map, AD7091R_REG_CONF,
ca69300173b642 Paul Cercueil   2019-11-15  54  					 AD7091R_REG_CONF_MODE_MASK, conf);
ca69300173b642 Paul Cercueil   2019-11-15  55  		if (ret)
ca69300173b642 Paul Cercueil   2019-11-15  56  			return ret;
fccb9cf346d38a Marcelo Schmitt 2023-11-21  57  	}
ca69300173b642 Paul Cercueil   2019-11-15  58  
ca69300173b642 Paul Cercueil   2019-11-15  59  	st->mode = mode;
ca69300173b642 Paul Cercueil   2019-11-15  60  
ca69300173b642 Paul Cercueil   2019-11-15  61  	return 0;
ca69300173b642 Paul Cercueil   2019-11-15  62  }
ca69300173b642 Paul Cercueil   2019-11-15  63  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
