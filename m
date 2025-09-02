Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152E72EC0BE
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Sep 2025 10:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756809606; cv=none; b=izH6uOZnSaX6rxZSScU21q4yn/rAXlRXe/YTTLIF/VqCnDrwmJKStbJYO8wkwz9a/PmJN1UxQG4DyuR0JSFHv2x56Co95klAId1BN6Z/5zOj7T4mzMnnEJ+BBxWaqbde/EPJnTUeWpNpVJPRseeEeuQFBpBFw4FhyiV9tbjuwY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756809606; c=relaxed/simple;
	bh=vJ0Qg1sh74+4AWjFCuCAPfpwtyA5OzPrBsJ8zRJPVzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WDNmsGTyjyrGs1txDMOaaX7BvDDkIx26qqa/gm1j9sp67/bXl5cNev3FUryaX35YSA7ecnGPJqi5Ns7iuIq0aJ5MtIQTP0YbGjX6DOuxDQErBGlBBi3RfhVVzButSp5OUBt/9DM6RshFx/d10W2GZrUCZcpQCbw6GyO48Qh+fW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9xHLCyX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9xHLCyX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756809604; x=1788345604;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vJ0Qg1sh74+4AWjFCuCAPfpwtyA5OzPrBsJ8zRJPVzs=;
  b=Y9xHLCyXxI5qxv3wNihL4NXutb23WHbN4V/dwlz1afnUIUa9z8Bm2BYo
   rnK5uHbEgif1A7hK1OvORCOSEEwa6NBnr5o6wGtjr36fiFzBvdyGP612P
   Ca6vpJeKCb/NEhQbsNW78UPffVkzPv5cLCeUudLlsePi1L7ASF7r7atwI
   tFi+79uPXpcNQnmQ9kTxb0bigREW79sbsILAY46KfrbkRYYPMTywkO0WM
   lY1ID7gCagcW/50ogHkejEzlpe8dI0/VJZfwvM0+IzBI4KppriFhPm8Oq
   zeUCIdTx9OrB7beY/iLp/17xDRuhehW+OnU2OjyI7Pg9HEsvuDF6NixbY
   g==;
X-CSE-ConnectionGUID: a5bwggsfR6GUz8ZpnoUpww==
X-CSE-MsgGUID: mkkfaL8sQCS78HaVWNnuIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="84494925"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="84494925"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 03:40:03 -0700
X-CSE-ConnectionGUID: TD7MftF9R0WmTS1uwZwm7w==
X-CSE-MsgGUID: FP4rHqFDQ0qLXg/2Tk3DYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171124239"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Sep 2025 03:40:02 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utOQK-0001qZ-19;
	Tue, 02 Sep 2025 10:39:43 +0000
Date: Tue, 2 Sep 2025 18:38:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/5] auxdisplay: linedisp: support attribute attachment
 to auxdisplay devices
Message-ID: <202509021722.wnbbAMB8-lkp@intel.com>
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
In-Reply-To: <20250901020033.60196-5-jefflessard3@gmail.com>
References: <20250901020033.60196-5-jefflessard3@gmail.com>
TO: "Jean-François Lessard" <jefflessard3@gmail.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Geert Uytterhoeven <geert@linux-m68k.org>
CC: linux-kernel@vger.kernel.org

Hi Jean-François,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.17-rc4 next-20250902]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jean-Fran-ois-Lessard/auxdisplay-linedisp-encapsulate-container_of-usage-within-to_linedisp/20250901-100347
base:   linus/master
patch link:    https://lore.kernel.org/r/20250901020033.60196-5-jefflessard3%40gmail.com
patch subject: [PATCH 4/5] auxdisplay: linedisp: support attribute attachment to auxdisplay devices
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-161-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021722.wnbbAMB8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509021722.wnbbAMB8-lkp@intel.com/

smatch warnings:
drivers/auxdisplay/line-display.c:81 delete_attachment() warn: iterator used outside loop: 'attachment'
drivers/auxdisplay/line-display.c:102 to_linedisp() warn: iterator used outside loop: 'attachment'

vim +/attachment +81 drivers/auxdisplay/line-display.c

5b645f9dfbbe40 Jean-François Lessard 2025-08-31   64  
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   65  static struct linedisp *delete_attachment(struct device *dev, bool owns_device)
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   66  {
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   67  	struct linedisp_attachment *attachment;
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   68  	struct linedisp *linedisp;
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   69  
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   70  	guard(spinlock)(&linedisp_attachments_lock);
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   71  
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   72  	list_for_each_entry(attachment, &linedisp_attachments, list) {
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   73  		if (attachment->device == dev &&
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   74  		    attachment->owns_device == owns_device)
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   75  			break;
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   76  	}
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   77  
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   78  	if (list_entry_is_head(attachment, &linedisp_attachments, list))
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   79  		return NULL;
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   80  
5b645f9dfbbe40 Jean-François Lessard 2025-08-31  @81  	linedisp = attachment->linedisp;
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   82  	list_del(&attachment->list);
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   83  	kfree(attachment);
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   84  
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   85  	return linedisp;
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   86  }
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   87  
edd8dbd6f21b41 Jean-François Lessard 2025-08-31   88  static struct linedisp *to_linedisp(struct device *dev)
edd8dbd6f21b41 Jean-François Lessard 2025-08-31   89  {
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   90  	struct linedisp_attachment *attachment;
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   91  
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   92  	guard(spinlock)(&linedisp_attachments_lock);
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   93  
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   94  	list_for_each_entry(attachment, &linedisp_attachments, list) {
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   95  		if (attachment->device == dev)
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   96  			break;
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   97  	}
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   98  
5b645f9dfbbe40 Jean-François Lessard 2025-08-31   99  	if (list_entry_is_head(attachment, &linedisp_attachments, list))
5b645f9dfbbe40 Jean-François Lessard 2025-08-31  100  		return NULL;
5b645f9dfbbe40 Jean-François Lessard 2025-08-31  101  
5b645f9dfbbe40 Jean-François Lessard 2025-08-31 @102  	return attachment->linedisp;
edd8dbd6f21b41 Jean-François Lessard 2025-08-31  103  }
edd8dbd6f21b41 Jean-François Lessard 2025-08-31  104  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
