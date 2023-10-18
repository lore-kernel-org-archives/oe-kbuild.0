Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AB438BC5;
	Wed, 18 Oct 2023 15:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erl4yVfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697642477; x=1729178477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PWn/FPhC8R7xrJOXdPpwqqrR76liwMvn2gL8rllb7Gg=;
  b=erl4yVfEcPyK67a34R7NElWYAPhtDF2NLtyWL24j9GqnADlvzvn1akKi
   6flY1+eJmITPIQ3LJf58yoJ3hWqv6r3f4Ua1MNYBizd/YgqFQ/GZuj2hk
   ySi0pVt8X0C8jgW8Gj2EFXDJWlBM/9y6c6ibTnM07sIK68dqNDj2TuFrq
   ifGMg9XDvRwd0hme6WZrZHCqKR0VX5rdcLlmKQvxUvtyWng1S8wnPbXGG
   d5UhJg6WvUenaiZVW04Fda2ptSu6gIO8dZCeQkNxST91bpBTtZIoHqpEx
   39F+tBEQ4zz0wYs5lIuUSSGY+vpzxUIR20kmbcebuEvk2D6g9DXNYhxOZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="385871625"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="385871625"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 08:21:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="822473616"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="822473616"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 08:21:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qt8MB-00000006cam-1JnS;
	Wed, 18 Oct 2023 18:21:11 +0300
Date: Wed, 18 Oct 2023 18:21:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [char-misc:char-misc-testing 21/23] drivers/parport/share.c:486
 parport_register_port() warn: '&tmp->full_list' not removed from list
Message-ID: <ZS/35oVuyZxqueBH@smile.fi.intel.com>
References: <2171426a-1784-41e9-8614-2d3a7a602831@kadam.mountain>
 <ZS/R/H9JujiaJ0x2@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS/R/H9JujiaJ0x2@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 18, 2023 at 03:39:24PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 18, 2023 at 12:57:52PM +0300, Dan Carpenter wrote:

...

> > Old smatch warnings:
> > drivers/parport/share.c:826 parport_register_dev_model() warn: possible memory leak of 'par_dev'
> 
> Means this was already be in the code?

How is it not a false positive?

devmodel is false (so kfree _is_ called) until we get device_register() called.
After that it's done via put_device() in both possible error cases.

What did I miss?

-- 
With Best Regards,
Andy Shevchenko


