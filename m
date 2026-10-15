Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD71854705B
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Oct 2026 03:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035483; cv=none; b=oVp22nplgOmkMKyRFh62uirI9LxhYeRhADFWrNS+A+kKzJOkKzMdOBx78p4vPndX2fs4rNOoAGmgXzmcUFMaiLDvPjDGeeZnBOpZ+BnXeq7U1rtRpQVDq2Fa6j7uUlLlzy1dEingHf9wN2G5Y43qNBI3BKM5Eh3obytv+PZmtYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035483; c=relaxed/simple;
	bh=Fdu+WBTaClHtBZ06M9trkYWo1jdMJl/JNNnr47A4URE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CRORk2fyduXaryDa6tfUgVZ82KM1yCTfaOTXeltMQZ0plvhTjVr1dtnQzE8MlEsDup427o8Yfnr+I8iKdGJQW3bUbs+nKbCJUyhUqOWA+Q90r5tQgLCfLgm2omxa0ClA3Tss0kFiC/CJmVour4LhQsMru2MB+VsgIMZ3JKyrvvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6Q3ZIW4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6Q3ZIW4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792035482; x=1823571482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fdu+WBTaClHtBZ06M9trkYWo1jdMJl/JNNnr47A4URE=;
  b=Y6Q3ZIW4G+p/7hG7oTnpTkGDilXWTp3apfkKfNuDy5xOxQL2/saOnYRb
   jyAEQaoLE1MkVXe7DuLMVYCjgdYinRNWrnH4YSUyvXpGZQZ4L3i4Ky6ED
   6iXC5yWmNaRMkWY6BGmIZsSoGedp6/ARI3zgpgeJ3u2ftCreoY2z5okiP
   OBhaHo3ksFlHCDB9f9+yvAMQQndQ9NOO+wtKsXJbBwPBIZX3PvDKeSn3p
   8yjML33sQqSXkxDk6bGcB+pyTRloSlqwme/n1Xx6JfgG5tjfwrsIL9G+S
   Vn4WtIiua3ZJBkSfV9p3PujVnveB1L3JyuCpa7eU8Hhm9sWwM8AlVUJ2W
   Q==;
X-CSE-ConnectionGUID: 44mtC8P2TPOb5dK5XV++6w==
X-CSE-MsgGUID: i+IUSDGqR52Shr+q6hbyZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="815985"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="815985"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 20:38:01 -0700
X-CSE-ConnectionGUID: WJeE7I3PRRG9FmJ7MKeOsg==
X-CSE-MsgGUID: lfG/wmrnQzCnEYW9BDKNLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1925384"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 14 Oct 2026 20:38:00 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHCI1-00000000BaR-3Rpi;
	Thu, 15 Oct 2026 03:37:57 +0000
Date: Thu, 15 Oct 2026 05:37:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 05/11] usb: misc: Add NVIDIA LSTP USB adapter driver
Message-ID: <202610150513.PVaOYpZ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261012-lstp-usb-adapter-v1-5-aambrozewicz@nvidia.com>
References: <20261012-lstp-usb-adapter-v1-5-aambrozewicz@nvidia.com>
TO: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Donald Shannon <donalds@nvidia.com>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Len Brown <lenb@kernel.org>
CC: Kees Cook <kees@kernel.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Bill Wendling <morbo@google.com>
CC: Justin Stitt <justinstitt@google.com>
CC: Hans de Goede <hansg@kernel.org>
CC: linux-usb@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-acpi@vger.kernel.org
CC: linux-hardening@vger.kernel.org
CC: llvm@lists.linux.dev
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Lixu Zhang <lixu.zhang@intel.com>
CC: Danilo Krummrich <dakr@kernel.org>
CC: driver-core@lists.linux.dev

Hi Adrian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bbf6b99a57b2479bf51c3c8ad0946f4b8c33ed69]

url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Ambrozewicz/dt-bindings-gpio-Add-NVIDIA-LSTP-GPIO/20261012-203559
base:   bbf6b99a57b2479bf51c3c8ad0946f4b8c33ed69
patch link:    https://lore.kernel.org/r/20261012-lstp-usb-adapter-v1-5-aambrozewicz%40nvidia.com
patch subject: [PATCH 05/11] usb: misc: Add NVIDIA LSTP USB adapter driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r2201-20261015 (https://download.01.org/0day-ci/archive/20261015/202610150513.PVaOYpZ8-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610150513.PVaOYpZ8-lkp@intel.com/

smatch warnings:
drivers/usb/misc/lstp.c:2321 lstp_rx_handle_err() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +2321 drivers/usb/misc/lstp.c

befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2295  
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2296  /*
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2297   * Record @ret for lstp_rx_retry_work() and schedule it after @delay_ms, or
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2298   * signal disconnect on a terminal errno.
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2299   */
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2300  static void lstp_rx_handle_err(struct lstp_usb *dev, int ret, unsigned long delay_ms)
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2301  {
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2302  	struct lstp_rx_retry *rxr = &dev->bulk_rx_retry;
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2303  
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2304  	WRITE_ONCE(rxr->last_err, ret);
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2305  
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2306  	/*
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2307  	 * lstp_stop_rx()'s poison (-EPERM), or the device or HCD gone: the
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2308  	 * expected disconnect, already logged by lstp_disconnect().
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2309  	 */
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2310  	if (ret == -ENODEV || ret == -ESHUTDOWN || ret == -EPERM) {
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2311  		lstp_signal_disconnect(dev);
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2312  		return;
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2313  	}
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2314  
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2315  	/* Wire-side errors can fire back-to-back; submit-side ones are rare. */
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2316  	if (ret == -EPROTO || ret == -EOVERFLOW || ret == -EILSEQ)
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2317  		dev_warn_ratelimited(&dev->intf->dev,
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2318  				     "%s: RX URB transient error (%pe), retry in %lums\n", __func__,
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2319  				     ERR_PTR(ret), delay_ms);
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2320  	else
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12 @2321  		dev_warn(&dev->intf->dev, "%s: RX URB transient error (%pe), retry in %lums\n",
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2322  			 __func__, ERR_PTR(ret), delay_ms);
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2323  
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2324  	schedule_delayed_work(&rxr->work, msecs_to_jiffies(delay_ms));
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2325  }
befbcab7be5cfa Adrian Ambrozewicz 2026-10-12  2326  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
