Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4281C213236
	for <oe-kbuild@lists.linux.dev>; Fri, 23 May 2025 08:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987249; cv=none; b=uwibWOyQiT57/LNnnVsdoy7qrGlv6xeNjC9yZs8o4Vst/774QdGg7je1BQi8ta48Jly+eP73LbSkNfteB+GkNxyAGbi7WYkpwE3M8jkkKBHrttHHYZUjuPNHcqGO/HdvgvqL8GFq+9rVrEznDxwN6rXHMZG09EfgUd+AUUtd1es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987249; c=relaxed/simple;
	bh=AD4gm9jeezCSxZWeO+dUTY3m/yyz9AJbJo3hxz1TMCw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVZ4VPvYCNPQu6Xxce/1T5VinkKad8ImK55A8L5d8Gb+SU8yLmBzCt7VDRYWaE8obmQjK3nz6nGWXsKQpRyWnt5n+ySIM0coU+t4UBXRhAPUIXlwiVgI/ixqaLdkxiYbpD3zRypWolf7hMQKkXvw9stfy9nXKzhSTrp1oemFB+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id ddea6623-37ab-11f0-ad60-005056bd6ce9;
	Fri, 23 May 2025 10:59:35 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 23 May 2025 10:59:34 +0300
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 23/23] media: Move gc0310 sensor drivers to
 drivers/media/i2c/
Message-ID: <aDAq5p6kEYjX6j5i@surfacebook.localdomain>
References: <202505220651.U5WqBCdF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505220651.U5WqBCdF-lkp@intel.com>

Thu, May 22, 2025 at 07:09:01AM +0800, kernel test robot kirjoitti:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> In-Reply-To: <20250517114106.43494-24-hdegoede@redhat.com>
> References: <20250517114106.43494-24-hdegoede@redhat.com>
> TO: Hans de Goede <hdegoede@redhat.com>
> TO: Sakari Ailus <sakari.ailus@linux.intel.com>
> TO: Andy Shevchenko <andy@kernel.org>
> CC: Hans de Goede <hdegoede@redhat.com>
> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
> CC: linux-media@vger.kernel.org
> CC: linux-staging@lists.linux.dev
> 
> Hi Hans,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on sailus-media-tree/master]
> [also build test WARNING on next-20250521]
> [cannot apply to staging/staging-testing staging/staging-next staging/staging-linus linuxtv-media-pending/master linus/master sailus-media-tree/streams v6.15-rc7]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-atomisp-gc0310-Rename-dev-function-variable-to-sensor/20250517-194501
> base:   git://linuxtv.org/sailus/media_tree.git master
> patch link:    https://lore.kernel.org/r/20250517114106.43494-24-hdegoede%40redhat.com
> patch subject: [PATCH 23/23] media: Move gc0310 sensor drivers to drivers/media/i2c/
> :::::: branch date: 4 days ago
> :::::: commit date: 4 days ago
> config: loongarch-randconfig-r073-20250522 (https://download.01.org/0day-ci/archive/20250522/202505220651.U5WqBCdF-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 15.1.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202505220651.U5WqBCdF-lkp@intel.com/
> 
> New smatch warnings:
> drivers/media/i2c/gc0310.c:462 gc0310_enable_streams() warn: pm_runtime_get_sync() also returns 1 on success


With use of _resume_and_get() this will gone as well.


-- 
With Best Regards,
Andy Shevchenko


