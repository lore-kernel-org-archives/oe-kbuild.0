Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795325997;
	b=0VQ8xD0d0qW4KxuBKDp18ZkY0nksM1jLXOC9XRbcJxLHqdoMeXDAI1GpsG609Jf08gRI
	 5TgWbGjpFqzkPbLA2hW6DXwlrihJHbLr1AMD3A/VINPbD4DzLMaLIw5mNo/y2RV8BhZmN
	 9+hwT/fwZf7cjueYEqeJchDzasI3uNE/4Sd3emzdtSkxwKpLsZUx21Y/4mzyxIeHB0uZK
	 s4GUifsATiQAGwBfp183iFk6ulhSewA5mesc8bBQGEj+9oY2XJr1jH5yjY04RexqruLGw
	 bKGttaH8DrbtiXNhIn5TyVEVeb53A6Uxz2z4bUq78xMGH1m8BTfvEVY81GsbUcsQVEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795325997;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=uKsfNEQrHcRfVqAsWChwkFazIRyixmfuCnjsCTPZ9iU=;
	b=NMgsaYuq8TZnpEk2zy0EnnhiqqqbLVKVHSk7iGx5gVyeTwrehhsUkrOZoLugC4GU30Pb
	 rRJpmpUC1LISzUqjFH5OgcShoobRZNFOlnVvqol5Eoc0Yy4UYJVVC3ayiQZoZtm0t4tGk
	 MDuZTy1v5D+zwd2j53z9kmRtcEx7/y1BAguEHEewTwP+IbWr5qKNNpGSjcM2zdBEYqcRO
	 OCiEsCXsA3llMQabruimmaz8AaRMIMuZYamk6I7YQZBPdyPgKWziyLrlLSHwXuxsd9jl/
	 XqS2Emld5cCOe8VoLYT+qMFiQFjIKMR9alj9JniF4nyCIHfUqgSDclhV533bIatDzRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V6Yo0ccV;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B904606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 05:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B904606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V6Yo0ccV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795325996; x=1826861996;
  h=date:from:to:cc:subject:message-id;
  bh=VQmWUDE4zrtYoMJSbIXMY3PP+U0ZrrAFmzjKMuk21p4=;
  b=V6Yo0ccV7HjsCArvI0+uq5c8TJAKPMFdgfeZycbYtdsGhO80+bBxdXIr
   jCWrP+gHXmXjvoBVRpSTTuzFzZ4BVsBkuO0/aSjTmyQhQzxfi14HKaMhb
   NUZJt/YknwQZu3LPOS2tO1BzuFv5gPjodqS9dDvXwmqAj2AiublvjCLqP
   BjU4ZT+W2I+DgID4Q2yQujo/rVProiJG7pI5MBHecO5WqBscVK5fctFjM
   WG2rPQQdPBQqEUNPaou+5yp/qGlV1sfH0WcxSmCHx+R90qCs7p7/HrDRj
   GQBH8Yoz0H2hwNX6RsekTIOOGZkdQVAuHljFmJLQm8yRy4M791MtdmzYB
   w==;
X-CSE-ConnectionGUID: V2MyTyZbQ8GhdjHQTPhB4g==
X-CSE-MsgGUID: MnFsph/nSH+HrnRW8qPgcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4002869"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4002869"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 21:39:55 -0800
X-CSE-ConnectionGUID: ZqLpfFz8TgqyHOgNH4a/QA==
X-CSE-MsgGUID: H0ttfQ9WSvyOnhtdsDSaDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="12847881"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 21 Nov 2026 21:39:55 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV0Iq-00000001L5S-1yLL;
	Sun, 22 Nov 2026 05:39:52 +0000
Date: Sun, 22 Nov 2026 13:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lpieralisi:b4/acpi-static-table-irq-probe-defer-v2 3/10]
 drivers/scsi/aic94xx/aic94xx_reg.h:252:37: warning: shift count >= width of
 type
Message-ID: <202611221316.Dx0sqe1u-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git b4/acpi-static-table-irq-probe-defer-v2
head:   a75860f203b994ab67f8a876c7f568ac0f7f84c0
commit: 5df91ea5bcbef51cb967f3a07dd7c69c50681213 [3/10] ACPI: Introduce irq_get() for static fwnodes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-buildonly-randconfig-1005-20261122 (https://download.01.org/0day-ci/archive/20261122/202611221316.Dx0sqe1u-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/202611221316.Dx0sqe1u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611221316.Dx0sqe1u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/aic94xx/aic94xx_hwi.c:15:
   In file included from drivers/scsi/aic94xx/aic94xx.h:16:
   In file included from include/scsi/libsas.h:16:
   In file included from include/linux/libata.h:22:
   include/linux/acpi.h:126:15: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |         irq->flags = ACPI_STATIC_IRQ_FLAGS(trigger, polarity);
         |                      ^
   include/linux/acpi.h:71:3: note: expanded from macro 'ACPI_STATIC_IRQ_FLAGS'
      71 |         (FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))    | \
         |          ^
   In file included from drivers/scsi/aic94xx/aic94xx_hwi.c:16:
>> drivers/scsi/aic94xx/aic94xx_reg.h:252:37: warning: shift count >= width of type [-Wshift-count-overflow]
     252 |         asd_write_reg_dword(asd_ha, reg+4, ASD_BUSADDR_HI(dma_handle));
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/aic94xx/aic94xx_hwi.h:210:61: note: expanded from macro 'ASD_BUSADDR_HI'
     210 |                                     ? ((u32)((__dma_handle) >> 32)) \
         |                                                             ^  ~~
   1 warning and 1 error generated.


vim +252 drivers/scsi/aic94xx/aic94xx_reg.h

2908d778ab3e244 James Bottomley 2006-08-29  247  
2908d778ab3e244 James Bottomley 2006-08-29  248  static inline void asd_write_reg_addr(struct asd_ha_struct *asd_ha, u32 reg,
2908d778ab3e244 James Bottomley 2006-08-29  249  				      dma_addr_t dma_handle)
2908d778ab3e244 James Bottomley 2006-08-29  250  {
2908d778ab3e244 James Bottomley 2006-08-29  251  	asd_write_reg_dword(asd_ha, reg,   ASD_BUSADDR_LO(dma_handle));
2908d778ab3e244 James Bottomley 2006-08-29 @252  	asd_write_reg_dword(asd_ha, reg+4, ASD_BUSADDR_HI(dma_handle));
2908d778ab3e244 James Bottomley 2006-08-29  253  }
2908d778ab3e244 James Bottomley 2006-08-29  254  

:::::: The code at line 252 was first introduced by commit
:::::: 2908d778ab3e244900c310974e1fc1c69066e450 [SCSI] aic94xx: new driver

:::::: TO: James Bottomley <James.Bottomley@SteelEye.com>
:::::: CC: James Bottomley <jejb@mulgrave.il.steeleye.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
