Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C97800
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 04:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765255634; cv=none; b=WSfgL50tl8R5Rv/Z/lMTSy5M+YM7oHie5J9tmOR9J/QmVE/Kcgj24gZp2894DN85rnTc1SFV9oXe2rNFqzLbgILkau266cB/z3MyRkMZzWR85evFMJr0JffiB4NSJ/kHgcubyXqBGln7fihaADXLg/m+FYNp5ct8IHdMvVz/7Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765255634; c=relaxed/simple;
	bh=PxZTIemlD97XUyu2kMczd+eMTF59+ovgx7tKjuF3DFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R47rUudMCwFx6COhrL19q3y/+VD3AfgP87x5nyxkx3uNyRn6z8zgarEnMDJsrk3aj7/B2kgjIpNyI+EmJhNTTNI9Bw91L6NKmTkBfNBTXN0jVVFYDiCj2yQmL9H92vbuiaRz3j0u65YtLd/z090TrAJtFOzqjjObEX2ugWCir7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQnegat5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQnegat5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765255632; x=1796791632;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PxZTIemlD97XUyu2kMczd+eMTF59+ovgx7tKjuF3DFQ=;
  b=RQnegat5u54FE06utb02nkhmjBIKoJKzzr7/PcfNHY96tR9jP49BAM7p
   sflTLyPR63g1Vra4rY6fC+hBVHghevlwbNvpPstQnv/X5qlSYM48asBxn
   VzPW5RbzfSQgvOQBc4JW3MM6phZH181Ky+SpsMPJqx9Jv1KRBmgFPiyQI
   EQYcem2hCA9/ieLIaQeXIIsZS8fNCghW49nTemLio9LOl3MpV/ULu8ZS4
   GkLk5t/qc3Y+/CQ77c2QBX+BfiPPIzTav+lROcHb/mJf0O7vUq/n3b4to
   q0IPBg/vyIY6UzMhrheIh6IlzT/LXutwByj2BRKRHhycRUAfnBTYMWvRH
   Q==;
X-CSE-ConnectionGUID: 3SAzfgOMTx2upjdZ0WLrfg==
X-CSE-MsgGUID: auDKFjAIQBubRW4RM01e5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="71062153"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="71062153"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 20:47:12 -0800
X-CSE-ConnectionGUID: iGZdkxWiRTeVv5uLKpG0Wg==
X-CSE-MsgGUID: dPmno9uUSiOD2xEh7bR0nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="200305351"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Dec 2025 20:47:11 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSpcy-000000001KH-2ZSm;
	Tue, 09 Dec 2025 04:47:08 +0000
Date: Tue, 9 Dec 2025 12:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <202512091255.47NOTUOd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hwmon/ltc4283.c:1717:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
References: <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
TO: "Nuno Sá via B4 Relay" <devnull+nuno.sa.analog.com@kernel.org>
TO: linux-hwmon@vger.kernel.org
TO: linux-gpio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-doc@vger.kernel.org
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Jean Delvare <jdelvare@suse.com>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>

Hi Nuno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bc04acf4aeca588496124a6cf54bfce3db327039]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-S-via-B4-Relay/dt-bindings-hwmon-Document-the-LTC4283-Swap-Controller/20251205-003741
base:   bc04acf4aeca588496124a6cf54bfce3db327039
patch link:    https://lore.kernel.org/r/20251204-ltc4283-support-v4-2-db0197fd7984%40analog.com
patch subject: [PATCH v4 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap Controller
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: microblaze-randconfig-r131-20251209 (https://download.01.org/0day-ci/archive/20251209/202512091255.47NOTUOd-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512091255.47NOTUOd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512091255.47NOTUOd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/ltc4283.c:1717:1: sparse: sparse: bad integer constant expression
>> drivers/hwmon/ltc4283.c:1717:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/hwmon/ltc4283.c:1718:1: sparse: sparse: bad integer constant expression
>> drivers/hwmon/ltc4283.c:1718:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hwmon/ltc4283.c:1719:1: sparse: sparse: bad integer constant expression
>> drivers/hwmon/ltc4283.c:1719:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/hwmon/ltc4283.c:1719:1: sparse: sparse: bad integer constant expression
>> drivers/hwmon/ltc4283.c:1719:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1717 drivers/hwmon/ltc4283.c

affd85259bff87 Nuno Sá 2025-12-04  1716  
affd85259bff87 Nuno Sá 2025-12-04 @1717  MODULE_AUTHOR("Nuno Sá <nuno.sa@analog.com>");
affd85259bff87 Nuno Sá 2025-12-04 @1718  MODULE_DESCRIPTION("LTC4283 How Swap Controller driver");
affd85259bff87 Nuno Sá 2025-12-04 @1719  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
