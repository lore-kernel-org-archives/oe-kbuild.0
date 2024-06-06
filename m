Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6A413F45F
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Jun 2024 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717666991; cv=none; b=PNiWG5fVXnjoA4k1yNCLmMiFLp7D6mbHRfWHw8e81C6/bQhpjxPQ9uNnEU9igpDRLZ53B/CE6nSaZI9oiPS37walvyZZGAJX8lqj1aPOZi6u/AFycN6n8IGhYx3bhBGjGaaM228p0PbYirQ/RS36QTYPPs4JBGcpzIZFUaC+4R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717666991; c=relaxed/simple;
	bh=x0ldTY+hkHaBGPjIdjeTBZ6gOnrCbFgdEd8kdvu0udc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GxlTm1BrnD5BRN933ZJB4j6CZNyaO+5tNAFLj2ebnbc5HUZLzc5NcfoyN642miGJo6Tdq7gJH7SaoR1oLvmHdJE4DQqerYhRsAwObajzuPr6es5J1vzSK2KS1fAmaiwYiV3UYidtCsShTiPP9HtWg1oRbGDeSMF1FAvTLjJ1Ujw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lna3sVRB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lna3sVRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717666989; x=1749202989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x0ldTY+hkHaBGPjIdjeTBZ6gOnrCbFgdEd8kdvu0udc=;
  b=Lna3sVRBA5fI/W5Gdayfx8fTnMeemuiwdtOF0Z0UFgmIinMFBl9PdPUO
   Jf1H7+q6y01eto8+NXXt1M/GJ1Nox9BxRyL7L1zjtOonQB6AezzTmSwqf
   QEjoFHo049JlonQ03MbE7BnXANbvq7mBDT8vggnoOkb40wXyCXuvWZg/G
   F5fai6MpFUKOyWFqv9biWHvaBgwKsWms04Sm9I50BJLL/8elcQWAzslc5
   NamRIUA4ke9QAW07S+d+0TMUCBg30sQMCIzXNjq2gnCfgXBwVK1vewwrw
   rApuOHYLdPibb1QfRcG7BZHS4eNe+dvJHC2QS4aU84qnUJYXraIFYcy8n
   A==;
X-CSE-ConnectionGUID: oUZoIEgJRYa445lj1IKFeA==
X-CSE-MsgGUID: dcIODLF9SOqNeZS/qImoRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31867315"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="31867315"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 02:43:08 -0700
X-CSE-ConnectionGUID: bRewlZvgRqy3CXLK6G8jnA==
X-CSE-MsgGUID: Y/TIniioSXCauUlzzjgYeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="37774759"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jun 2024 02:42:56 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF9dw-0002ux-1D;
	Thu, 06 Jun 2024 09:42:49 +0000
Date: Thu, 6 Jun 2024 17:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ieee1394-linux1394:topic/self-id-sequence 1/11]
 drivers/firewire/self-id-sequence-helper-test.c:47
 test_self_id_sequence_enumerator_valid() warn: passing zero to 'PTR_ERR'
Message-ID: <202406061715.XXeokBr2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux1394-devel@lists.sourceforge.net
TO: Takashi Sakamoto <o-takashi@sakamocchi.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git topic/self-id-sequence
head:   517c94e7107311b6c3d9f8ee5f9e4dfa0c023871
commit: 77d8385ed9f5122bc22fc7af431c5778776d2d90 [1/11] firewire: core: add enumerator of self ID sequences and its KUnit test
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r081-20240606 (https://download.01.org/0day-ci/archive/20240606/202406061715.XXeokBr2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406061715.XXeokBr2-lkp@intel.com/

smatch warnings:
drivers/firewire/self-id-sequence-helper-test.c:47 test_self_id_sequence_enumerator_valid() warn: passing zero to 'PTR_ERR'
drivers/firewire/self-id-sequence-helper-test.c:63 test_self_id_sequence_enumerator_invalid() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +47 drivers/firewire/self-id-sequence-helper-test.c

77d8385ed9f5122 Takashi Sakamoto 2024-05-30  10  
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  11  static void test_self_id_sequence_enumerator_valid(struct kunit *test)
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  12  {
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  13  	static const u32 valid_sequences[] = {
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  14  		0x00000000,
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  15  		0x00000001, 0x00800000,
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  16  		0x00000001, 0x00800001, 0x00900000,
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  17  		0x00000000,
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  18  	};
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  19  	struct self_id_sequence_enumerator enumerator;
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  20  	const u32 *entry;
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  21  	unsigned int quadlet_count;
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  22  
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  23  	enumerator.cursor = valid_sequences;
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  24  	enumerator.quadlet_count = ARRAY_SIZE(valid_sequences);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  25  
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  26  	entry = self_id_sequence_enumerator_next(&enumerator, &quadlet_count);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  27  	KUNIT_EXPECT_PTR_EQ(test, entry, &valid_sequences[0]);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  28  	KUNIT_EXPECT_EQ(test, quadlet_count, 1);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  29  	KUNIT_EXPECT_EQ(test, enumerator.quadlet_count, 6);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  30  
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  31  	entry = self_id_sequence_enumerator_next(&enumerator, &quadlet_count);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  32  	KUNIT_EXPECT_PTR_EQ(test, entry, &valid_sequences[1]);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  33  	KUNIT_EXPECT_EQ(test, quadlet_count, 2);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  34  	KUNIT_EXPECT_EQ(test, enumerator.quadlet_count, 4);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  35  
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  36  	entry = self_id_sequence_enumerator_next(&enumerator, &quadlet_count);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  37  	KUNIT_EXPECT_PTR_EQ(test, entry, &valid_sequences[3]);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  38  	KUNIT_EXPECT_EQ(test, quadlet_count, 3);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  39  	KUNIT_EXPECT_EQ(test, enumerator.quadlet_count, 1);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  40  
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  41  	entry = self_id_sequence_enumerator_next(&enumerator, &quadlet_count);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  42  	KUNIT_EXPECT_PTR_EQ(test, entry, &valid_sequences[6]);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  43  	KUNIT_EXPECT_EQ(test, quadlet_count, 1);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  44  	KUNIT_EXPECT_EQ(test, enumerator.quadlet_count, 0);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  45  
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  46  	entry = self_id_sequence_enumerator_next(&enumerator, &quadlet_count);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30 @47  	KUNIT_EXPECT_EQ(test, PTR_ERR(entry), -ENODATA);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  48  }
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  49  
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  50  static void test_self_id_sequence_enumerator_invalid(struct kunit *test)
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  51  {
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  52  	static const u32 invalid_sequences[] = {
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  53  		0x00000001,
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  54  	};
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  55  	struct self_id_sequence_enumerator enumerator;
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  56  	const u32 *entry;
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  57  	unsigned int count;
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  58  
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  59  	enumerator.cursor = invalid_sequences;
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  60  	enumerator.quadlet_count = ARRAY_SIZE(invalid_sequences);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  61  
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  62  	entry = self_id_sequence_enumerator_next(&enumerator, &count);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30 @63  	KUNIT_EXPECT_EQ(test, PTR_ERR(entry), -EPROTO);
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  64  }
77d8385ed9f5122 Takashi Sakamoto 2024-05-30  65  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
