Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE13366DB9
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Mar 2026 19:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774123122; cv=none; b=Y4ECdkTWFErhkwPduYEad+BZw7cXo+Wk29pETuRFA2tx56EYtwAd9Omd9OrWH5e4ozsFl0ir0JOrk0Thq3U3G6jRSsW0z2LPOsz7Rl41e1ZBucq17kQ6/D/H5ZTbF25r832pqHT/+VYOPKTYLgG9tIpTZ1SxHd46PIIhhhU3hIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774123122; c=relaxed/simple;
	bh=YPnuFpeyRLQQqKga2gQcUepDHrWu18QUiUT8WkEnw2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OsYGPq7buOFmHzzFEcmMQgbkc4ukmwYRbWTVhd8RLMLmJrs7II4S9M9zvSm3b5DW4vLT/2okhPrTict+K/YGxKyTQMbIN7lrQUgZANmgHZQMFrD0bg5uEaRMfaj2XdHXv69fVWdvEEzhafcDIHWVDWNu4cgCCLBQkC3sVmM2jlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/6vwbYI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/6vwbYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774123120; x=1805659120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YPnuFpeyRLQQqKga2gQcUepDHrWu18QUiUT8WkEnw2E=;
  b=g/6vwbYI6Ml+wSOOxErJ9KwcuFHKqYLwJJXBdtSOMgj/2ldoZgSfxSV1
   95Q26iSYN+HBGoHJ/BdP/AYupKVKz1C8B/PU/2Zo75mOL0gWkQqokocHu
   iT3Y8p7ZJrM7LNdmbJef5PovOXk/Xd4r0kc21Gcjf+cJBavPnN4QFFFAk
   dgKA24sl/5n/h8bYipi70fvIeK0KFDTe6iyFLuk0rNYk6vW+c3C1zdUZt
   UdLQVb1gi2OUhHlKcc8tsHh2mysslkTmLuQChwKm2SAgeWbLJ4xCnZ6f1
   t0mww4k5/NToUEJs11qolBBh4fKiforydHmubpd1yeTVkdDc474SKOWfU
   w==;
X-CSE-ConnectionGUID: K06cqS4YTEWkUwW7qcToEg==
X-CSE-MsgGUID: Twp3E+vCSfuY4ce/VJ3UmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="78778572"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="78778572"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 12:58:39 -0700
X-CSE-ConnectionGUID: 1FmVFmwmSGOitaug9+32Fw==
X-CSE-MsgGUID: B/pDLbFgSk2jdZcLZ1SlSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="228103094"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 21 Mar 2026 12:58:38 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w42Sx-000000006BZ-3ntD;
	Sat, 21 Mar 2026 19:58:35 +0000
Date: Sat, 21 Mar 2026 20:57:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: Add Sensirion SHT3x and GXCAS
 GXHT30
Message-ID: <202603212044.BRPaiz86-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <1773919186-17515-3-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1773919186-17515-3-git-send-email-zaixiang.xu.dev@gmail.com>
TO: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
TO: linux@roeck-us.net
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linux-hwmon@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: zaixiang.xu.dev@gmail.com

Hi Zaixiang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on robh/for-next linus/master v6.16-rc1 next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zaixiang-Xu/dt-bindings-vendor-prefixes-Add-GXCAS-Technology/20260321-215616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/1773919186-17515-3-git-send-email-zaixiang.xu.dev%40gmail.com
patch subject: [PATCH 2/3] dt-bindings: hwmon: Add Sensirion SHT3x and GXCAS GXHT30
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: openrisc-randconfig-2052-20260321 (https://download.01.org/0day-ci/archive/20260321/202603212044.BRPaiz86-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603212044.BRPaiz86-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603212044.BRPaiz86-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml:44:7: [error] no new line character at the end of file (new-line-at-end-of-file)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)

vim +44 Documentation/devicetree/bindings/hwmon/sensirion,sht3x.yaml

bc41693762dc68 Zaixiang Xu 2026-03-19  33  
bc41693762dc68 Zaixiang Xu 2026-03-19  34  examples:
bc41693762dc68 Zaixiang Xu 2026-03-19  35    - |
bc41693762dc68 Zaixiang Xu 2026-03-19  36      i2c {
bc41693762dc68 Zaixiang Xu 2026-03-19  37          #address-cells = <1>;
bc41693762dc68 Zaixiang Xu 2026-03-19  38          #size-cells = <0>;
bc41693762dc68 Zaixiang Xu 2026-03-19  39  
bc41693762dc68 Zaixiang Xu 2026-03-19  40          sensor@44 {
bc41693762dc68 Zaixiang Xu 2026-03-19  41              compatible = "gxcas,gxht30";
bc41693762dc68 Zaixiang Xu 2026-03-19  42              reg = <0x44>;
bc41693762dc68 Zaixiang Xu 2026-03-19  43          };
bc41693762dc68 Zaixiang Xu 2026-03-19 @44      };

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
