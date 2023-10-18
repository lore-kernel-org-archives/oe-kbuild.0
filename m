Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F301034CDD;
	Wed, 18 Oct 2023 12:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ib1oaBeS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697632797; x=1729168797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MC9qJesMENTmI7Hw+zxV4F0dP41xWkqv4pEP9D9qc24=;
  b=Ib1oaBeS04B2slHguzTev39KIQjEWkrwEFIBSWUNdBoeF40BRrLfRNiQ
   k0P2Rl3Bjqe/1AeqsE9ku09D/j6GWEpYaoJvAR9ncUeeScTK1+3Yy1dS1
   +LTCw/904CtoKvehqjzVdUnLAp+QnNebMv7JV2MI8yFFBjF7xpnLnWAOZ
   jKy7ohv0GiZDl38xtfpw9jnblodoe4YOV8QwTabbCXuiKIAFALRKtxgS4
   4QYyEhtW2SuOdpRX+tTuN3cwFLbSJ3JBG7hMy2uV47uBEqZbsU7brfw0q
   ddKOZbvs+kBlagHSOhAZhkUO0+Ho1n5VdrW+ki+gete5EtY+Xn9qCm9pq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="452472755"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="452472755"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 05:39:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="873014850"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="873014850"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 05:39:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qt5pc-00000006aXX-3SQ0;
	Wed, 18 Oct 2023 15:39:24 +0300
Date: Wed, 18 Oct 2023 15:39:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [char-misc:char-misc-testing 21/23] drivers/parport/share.c:486
 parport_register_port() warn: '&tmp->full_list' not removed from list
Message-ID: <ZS/R/H9JujiaJ0x2@smile.fi.intel.com>
References: <2171426a-1784-41e9-8614-2d3a7a602831@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2171426a-1784-41e9-8614-2d3a7a602831@kadam.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 18, 2023 at 12:57:52PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
> head:   5ab2ef71d3e0a4b8e5839b1850ccdd236695e2e0
> commit: 6c9334e9230e552c795eebd34e6b208c6df693fe [21/23] parport: Use kasprintf() instead of fixed buffer formatting
> config: i386-randconfig-141-20231017 (https://download.01.org/0day-ci/archive/20231018/202310180809.hepZB9k6-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231018/202310180809.hepZB9k6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202310180809.hepZB9k6-lkp@intel.com/
> 
> New smatch warnings:
> drivers/parport/share.c:486 parport_register_port() warn: '&tmp->full_list' not removed from list


Indeed. The kasprintf() was squeezed into a wrong gap in the code.
Thanks, I'll send a fix soon.

> Old smatch warnings:
> drivers/parport/share.c:826 parport_register_dev_model() warn: possible memory leak of 'par_dev'

Means this was already be in the code?

-- 
With Best Regards,
Andy Shevchenko


