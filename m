Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C03524DC
	for <oe-kbuild@lists.linux.dev>; Sun, 19 May 2024 17:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716140221; cv=none; b=UBZ3bfLvICgwprraX85cAuLcsyKOwGlodNk59i9td4hOGHGv1PVWV946NT7a7p6D2nPdFqHJRPwPWf9/ssQbmvhNcgcveIlRa1NiEAcw840tFhnTCeS/Hp5y2o0QNPly3GsT7EyYFbi2GztxRf9qbbfZvetvAztTWJT1gmy+J+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716140221; c=relaxed/simple;
	bh=MHs+lgQANm9O0YeWIo7F8yaM+DwiEAfdKj8cJs+Am+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e5YdwLj3hJpFHTSdg+hrLuYM3VT+UeOsxLLb75W8l/6ks7A0o3AWSoWN8AD9ihyif5qyrd17g1UP+XUgHiSbNA+8hJgEkTBQyPAZzhQiKwwH7RcM2d3k3SgCgVqBFuDcj8uMkU/tIg637pIf1MV+9y8Od8OEGXL3ZTGOsLl4Y60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KvkpMR29; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KvkpMR29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716140219; x=1747676219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MHs+lgQANm9O0YeWIo7F8yaM+DwiEAfdKj8cJs+Am+4=;
  b=KvkpMR29LD4UwMuuoFtuq9LH3ueL4HW34H0QmA4w34Y0mcGJZR99Mb2W
   prly+HcaAj8+Pwh+7AqM+eLnWuRrbHu9K+RqWXT1pxp5S0PBX3GT9HRM7
   RctwYJX1LnHW7LBUBKVkyKqyroiK3PoB+9XvYkDEGXRK4vv2XEpZ35f9U
   a0sCOUD3gR55OiyEoUghM20PSXGbUiXOECKBR2qgOmASoKU6Ae1g0iYUY
   OLwDFppVNdQkk1ptr3jIUz2Aw/bxTWp9RhPGjGuO+G3Ra1SmJ28uO83vU
   O49bdA+9Pfmnmj7lTVGoRSkGWV3k5eO3CmdxECpWnkxXPcr+EE4AIKNP+
   g==;
X-CSE-ConnectionGUID: N5wx610gSfe7rTn6KvUcyw==
X-CSE-MsgGUID: h3T25BguSsqbvVLjMa4/mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12111897"
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="12111897"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 10:36:56 -0700
X-CSE-ConnectionGUID: GQ276y42SFaKl8WDovVwiQ==
X-CSE-MsgGUID: yEye8iSfQcmzwx6tjQniEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="55527728"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 May 2024 10:36:54 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8kSr-00043u-0B;
	Sun, 19 May 2024 17:36:53 +0000
Date: Mon, 20 May 2024 01:36:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:tpm2_key-2 6/7] drivers/char/tpm/tpm2_key.c:50
 tpm2_key_type() warn: statement has no effect 3
Message-ID: <202405200150.YT7s4JQi-lkp@intel.com>
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
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2_key-2
head:   05957f277b1e62795451f5e58560a950d2425ee7
commit: 59fab73fe3f5c4b13ebee9ea98a64fbaf523a5fc [6/7] tpm: tpm2_key: Extend parser to TPM_LoadableKey
:::::: branch date: 34 minutes ago
:::::: commit date: 4 hours ago
config: x86_64-randconfig-161-20240519 (https://download.01.org/0day-ci/archive/20240520/202405200150.YT7s4JQi-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405200150.YT7s4JQi-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm2_key.c:50 tpm2_key_type() warn: statement has no effect 3

vim +50 drivers/char/tpm/tpm2_key.c

8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  34  
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  35  int tpm2_key_type(void *context, size_t hdrlen,
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  36  		  unsigned char tag,
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  37  		  const void *value, size_t vlen)
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  38  {
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  39  	enum OID oid = look_up_OID(value, vlen);
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  40  	struct tpm2_key *key = context;
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  41  
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  42  	switch (oid) {
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  43  	case OID_TPMSealedData:
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  44  		pr_info("TPMSealedData\n");
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  45  		break;
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  46  	case OID_TPMLoadableKey:
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  47  		pr_info("TPMSealedData\n");
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  48  		break;
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  49  	default:
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19 @50  		char buffer[50];
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  51  		sprint_oid(value, vlen, buffer, sizeof(buffer));
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  52  		pr_debug("Unknown OID \"%s\"\n", buffer);
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  53  		return -EINVAL;
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  54  	}
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  55  
59fab73fe3f5c4 Jarkko Sakkinen 2024-05-19  56  	key->oid = oid;
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  57  	return 0;
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  58  }
8c36e89d6c31b4 Jarkko Sakkinen 2024-05-19  59  

:::::: The code at line 50 was first introduced by commit
:::::: 8c36e89d6c31b433e1f3e06541eed1f687eaac81 KEYS: trusted: Migrate tpm2_key_{encode,decode}() to TPM driver

:::::: TO: Jarkko Sakkinen <jarkko@kernel.org>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
