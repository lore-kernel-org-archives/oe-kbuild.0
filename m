Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE301C2F9
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Sep 2023 21:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695505974; x=1727041974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sfg5N8YxtkmJ0hqHlqhJeRzVJi4Jn309UE0r0c8Jr0I=;
  b=NNpyn3JKKE7pXq5wkvoaQLz5J5lUGNevIDS8PyR8Ex16+K+yVgxJxAq2
   xooi//5MOPSHbs6MiRrx4GZeL/jNPFuxCKQnU96EAQ5Jdsc8SiqJX+UgQ
   /EYatTJbOAheJJS2PzilXzlnXpINnW8/Sd2b8ejM1aamR8SwHukGfDyzG
   hr85uBOxQtDxfZlFNT+q6AZT5tPjSydZPs2ru5PDu9LO+C3EZxmWusO9E
   6I57Wu6FcYyiUZ5W94xI+tGL4tKqwwE2oKe3XdJptC2MEZohxKgY1aSQe
   YepL1LSadCfbgezCvg8/vQHDXMPr0b1/Y1ehQwyWqBN87/Wu/sItmvxWE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="360450931"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="360450931"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 14:52:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="891221379"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="891221379"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2023 14:51:55 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkAYU-0002u5-1a;
	Sat, 23 Sep 2023 21:52:50 +0000
Date: Sun, 24 Sep 2023 05:52:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.6-dango 7009/7085] dtbs_check:
 Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:18:11:
 [error] string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202309240545.Ijy8Ra4z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:18:11: [error] string value is redundantly quoted with any quotes (quoted-strings)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-dango
head:   1c519676c30e4e5a2acf84784a1e524528bf664d
commit: 12d0338fd07dcecb5151e18c5c96777c6addd8be [7009/7085] dt-bindings: mtd: add basic bindings for UBI
:::::: branch date: 27 hours ago
:::::: commit date: 32 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230924/202309240545.Ijy8Ra4z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309240545.Ijy8Ra4z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:18:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:23:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:29:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
   Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:32:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
>> Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml:31:15: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +18 Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml

12d0338fd07dce Daniel Golle 2023-08-07   8  
12d0338fd07dce Daniel Golle 2023-08-07   9  description: |
12d0338fd07dce Daniel Golle 2023-08-07  10    This binding describes a single UBI volume. Volumes can be matches either
12d0338fd07dce Daniel Golle 2023-08-07  11    by their ID or their name, or both.
12d0338fd07dce Daniel Golle 2023-08-07  12  
12d0338fd07dce Daniel Golle 2023-08-07  13  maintainers:
12d0338fd07dce Daniel Golle 2023-08-07  14    - Daniel Golle <daniel@makrotopia.org>
12d0338fd07dce Daniel Golle 2023-08-07  15  
12d0338fd07dce Daniel Golle 2023-08-07  16  properties:
12d0338fd07dce Daniel Golle 2023-08-07  17    volid:
12d0338fd07dce Daniel Golle 2023-08-07 @18      $ref: "/schemas/types.yaml#/definitions/uint32"
12d0338fd07dce Daniel Golle 2023-08-07  19      description:
12d0338fd07dce Daniel Golle 2023-08-07  20        Match UBI volume ID
12d0338fd07dce Daniel Golle 2023-08-07  21  
12d0338fd07dce Daniel Golle 2023-08-07  22    volname:
12d0338fd07dce Daniel Golle 2023-08-07  23      $ref: "/schemas/types.yaml#/definitions/string"
12d0338fd07dce Daniel Golle 2023-08-07  24      description:
12d0338fd07dce Daniel Golle 2023-08-07  25        Match UBI volume ID
12d0338fd07dce Daniel Golle 2023-08-07  26  
12d0338fd07dce Daniel Golle 2023-08-07  27  anyOf:
12d0338fd07dce Daniel Golle 2023-08-07  28    - required:
12d0338fd07dce Daniel Golle 2023-08-07  29      - volid
12d0338fd07dce Daniel Golle 2023-08-07  30  
12d0338fd07dce Daniel Golle 2023-08-07  31    - required:
12d0338fd07dce Daniel Golle 2023-08-07  32      - volname
12d0338fd07dce Daniel Golle 2023-08-07  33  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
