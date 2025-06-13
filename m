Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23C219CC3E
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 02:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749780268; cv=none; b=kF3VnfNaMb0Ps8N6XTBtdpeiUhBIA6hTDY5rGDVR4EekPOws0IB0yCCqbIDUO0XwY42dq/HKww2g608Jtn2AANmVu2ZHCt/IaoNLXBaz00lFVV0iKNzbnN6SdPlgc5fUe6ZRep9URgbuD5kfqprFG12+Z9PdBHxLu/ie6QcRec0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749780268; c=relaxed/simple;
	bh=6cWgC5KfPvcaCLIntNTVnuC4piLm0tIy77woMfQDtmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kqOVl9+s+r+vIDsPcIH/LfNrgFM9jIb25L6zOKKuUS88JUKtqiajxWVU0VpM4CG0F1855hLoTW5UbCSKOmbuLhHEWUaRpSY97CGiBzD0BjGdndaY1ukB1LSTMQa/fDecmKvkCQWQtDpVSB7Jq8+xQvrbUY0hcPj2UenMPgPbwJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UfL+yXio; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UfL+yXio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749780267; x=1781316267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6cWgC5KfPvcaCLIntNTVnuC4piLm0tIy77woMfQDtmI=;
  b=UfL+yXiowml4A6VIYwpJTzrSyczAGqWYmxQo0MhscytJKolDNxEXJu8d
   oMn03PZMhy23HdDm+cRQqpzdm9qX9vcS/J7G2wP1RRa8QsAWrZ8Q1dKFJ
   K9FxvTXFtYx5BxOrh1YYo3aQDuep2GM/248s+OYAsKzknusZvFLUeBphG
   fUtNDf7Y2oYqAQ4t6bO2G0t4VPOlIxtvtV0hxp3NClzq02Tn8VegItWGy
   P4bZPQSv0UGkV0JTHf/iKiYmZ0onUh6q88R5aeT+RMPwiBu2/1rVnKIEb
   LVHXDE0/qYHDR9opqtDB5di3uMA6Rw8+RB7fSYfiuU9qTIkJR0c5X0JsC
   g==;
X-CSE-ConnectionGUID: wjigXZ9xQR+9A5yOEkhkMQ==
X-CSE-MsgGUID: SGelCEvqQfyj42Hq2HAnPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="74514796"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="74514796"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 19:04:26 -0700
X-CSE-ConnectionGUID: LrSsWtR7QiOzwshONVVbSA==
X-CSE-MsgGUID: XD464MRgR9a9J+BzKnxPjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="152675572"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Jun 2025 19:04:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPtmJ-000C94-0f;
	Fri, 13 Jun 2025 02:04:23 +0000
Date: Fri, 13 Jun 2025 10:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mtd/nand/qpic_common.o: warning: objtool: sg_set_buf+0x54:
 unreachable instruction
Message-ID: <202506130912.TdjUJ0Og-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Md Sadre Alam <quic_mdalam@quicinc.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27605c8c0f69e319df156b471974e4e223035378
commit: fdf3ee5c6e5278dab4f60b998b47ed2d510bf80f mtd: nand: Add qpic_common API file
date:   6 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-002-20250613 (https://download.01.org/0day-ci/archive/20250613/202506130912.TdjUJ0Og-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130912.TdjUJ0Og-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506130912.TdjUJ0Og-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:389,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/loongarch/include/asm/processor.h:9,
                    from arch/loongarch/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:6,
                    from ./arch/loongarch/include/generated/asm/current.h:1,
                    from include/linux/mutex.h:14,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/mtd/nand/qpic_common.c:6:
   In function 'fortify_memset_chk',
       inlined from 'qcom_clear_bam_transaction' at drivers/mtd/nand/qpic_common.c:88:2:
   include/linux/fortify-string.h:480:25: warning: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
     480 |                         __write_overflow_field(p_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mtd/nand/qpic_common.o: warning: objtool: sg_set_buf+0x54: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
