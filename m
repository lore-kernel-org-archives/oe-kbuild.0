Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828752D1926
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758459712; cv=none; b=Y3+FQleVCbmx3R7RiWsrrsoo1Q6z1pop8As3cDsuOv+y7RJ+MgsRdM3xpouMydoEJXUj84LPxi1ohpe3lq3bdBD5/WKI04ptwHNSDDYanq+7rrUGC0h2xQFHPPVxMhe94Sz6CkqVawtMoNkSidAwsqZK33cpt697tTHMQUHpdO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758459712; c=relaxed/simple;
	bh=ohPxyLU338KK2NX9VlOvB16wnSxUuTLLz9KbmzNG/1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B3mqfqm51FfhtfHbcrSBlPBYomsRkB1zVZSaZg3gQ3TgbPAhNAXUqUSj4seSo27Y0z9jtFj19lMbBDdtbaERHuia7gib/yQvNZTFpBRaMyfzIyAGo/PKI6oyOi0QGBHvHg522fS0L6wK0p/bh4W6T6X++fAHpdmqGaQjHWfF31E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjhUQLrh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjhUQLrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758459709; x=1789995709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ohPxyLU338KK2NX9VlOvB16wnSxUuTLLz9KbmzNG/1k=;
  b=VjhUQLrhI1GWFALdZcw75eoTIP6LSPKNqARtOA2lxazrv2nG0Sg9nyYI
   RP0ZphlN8PsWs9cYvOOhVDIl5yfTUuX1+dmT7iGEG+8M9+pqUdtQjC4hO
   MzkVmpKArpkb5hFaIZX6yxlA3G2MqLh+Fu72eMV46B94nWahWi9UItc2G
   R7RNZLCuXELOjvCaNLjytrUc5/rM+whOWTc5MhPkQDGMbiRP+XuDavkCF
   zjC82+ANyscFadRnlQQhYjEil80EBFwpElBbmiicRuHlAUGun3/6VSdud
   xZpH5irvJHLgxXBjYiv+5MNrLcEk2WY01l2YfcraLwNwjaLqi7eJ7wmxM
   A==;
X-CSE-ConnectionGUID: kM1viUkdR1yjyfkHmD1rfw==
X-CSE-MsgGUID: guAQi90wQYuTDLMlXi48Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="86180906"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="86180906"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 06:01:48 -0700
X-CSE-ConnectionGUID: bx6ZydkJQMi5AWRvZtplJg==
X-CSE-MsgGUID: 5fRQpYXvR3SGjC6Oweo/yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="176085700"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 21 Sep 2025 06:01:47 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0JhI-000000003Zl-3UY1;
	Sun, 21 Sep 2025 13:01:44 +0000
Date: Sun, 21 Sep 2025 15:01:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 9/134]
 arch/arm64/boot/dts/apple/t8010-d101.dtb: i2c@20a110000 (apple,t8010-i2c):
 compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c',
 'apple,t8112-i2c', 'apple,t6000-i2c']
Message-ID: <202509211552.ysPvjpJ6-lkp@intel.com>
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
TO: Nick Chan <towinchenmi@gmail.com>
CC: Janne Grunau <j@jannau.net>
CC: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   00c6dc8272d302876034765e34843f6abc62219f
commit: a71cab1ed8a7f6c61e5b7aec3ae1c87a51a2a7b5 [9/134] arm64: dts: apple: t8010: Add I2C nodes
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250921/202509211552.ysPvjpJ6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211552.ysPvjpJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509211552.ysPvjpJ6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8010-d101.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-d101.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8010-d101.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-d101.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8010-d101.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8010-d101.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8010-d101.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8010-d101.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t8010-d10.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8010-d10.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8010-d10.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8010-d10.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8010-d10.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8010-d10.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8010-d10.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8010-d10.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t8010-d111.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8010-d111.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8010-d111.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-d111.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8010-d111.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-d111.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8010-d111.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-d111.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/t8010-d11.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-d11.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8010-d11.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-d11.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8010-d11.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-d11.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8010-d11.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-d11.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t8010-j171.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8010-j171.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8010-j171.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8010-j171.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8010-j171.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8010-j171.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8010-j171.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8010-j171.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t8010-j172.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-j172.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8010-j172.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-j172.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8010-j172.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-j172.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8010-j172.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-j172.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/t8010-j71b.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-j71b.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8010-j71b.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-j71b.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8010-j71b.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8010-j71b.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8010-j71b.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8010-j71b.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/t8010-j72b.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-j72b.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8010-j72b.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8010-j72b.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8010-j72b.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-j72b.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8010-j72b.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-j72b.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/t8010-n112.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-n112.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8010-n112.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-n112.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8010-n112.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-n112.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8010-n112.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8010-n112.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
