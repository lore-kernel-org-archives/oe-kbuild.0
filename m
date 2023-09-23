Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618F9369
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Sep 2023 23:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695510672; x=1727046672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z+VmrGE14Q5Zxrju6FCpK39KibGoUT5Btl+F1ZfJF1w=;
  b=HjWwrLnuWhT2gPxtf8QgysPvQ71yQhmTS4TjFQSHFpvOxb60nQwv1Kyq
   6pNkuyY3F60ljOW24Cpco3yO/RI5yJ4ab0SHFgl86mIHOmlY0KArvtAK4
   H9044zQCvo+gFL7N1RRNS47s/rnthgYi7rz4McdijWZDS4KC1GbhfMn8b
   dIWb4dVlYTqQlIuauPO2mGFZznUocP8+CTYnkYmqMV9ahHU8CIsprRe3T
   hUDs/P6Dy+xo4KtcxRT+Kbemz8LwTtDwP1kUDo2QMuSA+gH+iJGFGHxVF
   Q2nh8hZfhB1icNv20PCMBHqiHgmVXoOQfYdpcJcFvXe8r6gh4eALYRLDE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="360453143"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="360453143"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 16:11:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="1078790384"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="1078790384"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 23 Sep 2023 16:11:10 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkBmG-0002yp-0C;
	Sat, 23 Sep 2023 23:11:08 +0000
Date: Sun, 24 Sep 2023 07:11:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.6-dango 7017/7085] dtbs_check:
 Documentation/devicetree/bindings/block/partition.yaml:26:13: [error] string
 value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202309240708.M7L6eM8C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/block/partition.yaml:26:13: [error] string value is redundantly quoted with any quotes (quoted-strings)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-dango
head:   1c519676c30e4e5a2acf84784a1e524528bf664d
commit: a0250b667b14e1ec983b9758d07d8244583558af [7017/7085] dt-bindings: block: add basic bindings for block devices
:::::: branch date: 28 hours ago
:::::: commit date: 34 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230924/202309240708.M7L6eM8C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309240708.M7L6eM8C-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/block/partition.yaml:26:13: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/block/partition.yaml:31:13: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/block/partition.yaml:37:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
   Documentation/devicetree/bindings/block/partition.yaml:40:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
   Documentation/devicetree/bindings/block/partition.yaml:43:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
   Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:18:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:23:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:29:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
   Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:32:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
   Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml:31:15: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +26 Documentation/devicetree/bindings/block/partition.yaml

a0250b667b14e1 Daniel Golle 2023-08-07   8  
a0250b667b14e1 Daniel Golle 2023-08-07   9  description: |
a0250b667b14e1 Daniel Golle 2023-08-07  10    This binding describes a partition on a block device.
a0250b667b14e1 Daniel Golle 2023-08-07  11    Partitions may be matched by a combination of partition number, name,
a0250b667b14e1 Daniel Golle 2023-08-07  12    and UUID.
a0250b667b14e1 Daniel Golle 2023-08-07  13  
a0250b667b14e1 Daniel Golle 2023-08-07  14  maintainers:
a0250b667b14e1 Daniel Golle 2023-08-07  15    - Daniel Golle <daniel@makrotopia.org>
a0250b667b14e1 Daniel Golle 2023-08-07  16  
a0250b667b14e1 Daniel Golle 2023-08-07  17  properties:
a0250b667b14e1 Daniel Golle 2023-08-07  18    $nodename:
a0250b667b14e1 Daniel Golle 2023-08-07  19      pattern: '^block-partition-.+$'
a0250b667b14e1 Daniel Golle 2023-08-07  20  
a0250b667b14e1 Daniel Golle 2023-08-07  21    partnum:
a0250b667b14e1 Daniel Golle 2023-08-07  22      description:
a0250b667b14e1 Daniel Golle 2023-08-07  23        Matches partition by number if present.
a0250b667b14e1 Daniel Golle 2023-08-07  24  
a0250b667b14e1 Daniel Golle 2023-08-07  25    partname:
a0250b667b14e1 Daniel Golle 2023-08-07 @26      "$ref": "/schemas/types.yaml#/definitions/string"
a0250b667b14e1 Daniel Golle 2023-08-07  27      description:
a0250b667b14e1 Daniel Golle 2023-08-07  28        Matches partition by PARTNAME if present.
a0250b667b14e1 Daniel Golle 2023-08-07  29  
a0250b667b14e1 Daniel Golle 2023-08-07  30    uuid:
a0250b667b14e1 Daniel Golle 2023-08-07  31      "$ref": "/schemas/types.yaml#/definitions/string"
a0250b667b14e1 Daniel Golle 2023-08-07  32      description:
a0250b667b14e1 Daniel Golle 2023-08-07  33        Matches partition by PARTUUID if present.
a0250b667b14e1 Daniel Golle 2023-08-07  34  
a0250b667b14e1 Daniel Golle 2023-08-07  35  anyOf:
a0250b667b14e1 Daniel Golle 2023-08-07  36    - required:
a0250b667b14e1 Daniel Golle 2023-08-07  37      - partnum
a0250b667b14e1 Daniel Golle 2023-08-07  38  
a0250b667b14e1 Daniel Golle 2023-08-07  39    - required:
a0250b667b14e1 Daniel Golle 2023-08-07  40      - partname
a0250b667b14e1 Daniel Golle 2023-08-07  41  
a0250b667b14e1 Daniel Golle 2023-08-07  42    - required:
a0250b667b14e1 Daniel Golle 2023-08-07  43      - uuid
a0250b667b14e1 Daniel Golle 2023-08-07  44  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
