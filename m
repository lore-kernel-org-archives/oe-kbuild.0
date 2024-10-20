Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DDA746E
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729415434; cv=none; b=ojN1C80jhICpzztcRuWjD/wfhE8umcLxt+67Cf6CxhS01bwYgPVybh5TjmzRvQ5rr++PlpiNO/iDpfo5e7OFvSJwkrAg17iNOVj3uu97tOBWILEthmeEQ4j3wCLaIcbZrm15TUZAxjClTfNNNJYEJpzTEvjP9wLbZ/9DqncRw14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729415434; c=relaxed/simple;
	bh=1A2EQR6CbTreTKnXqKi/mme8mTkws2ibYsWc+jTSmuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V/eYNjkYZ5jNFaSwlD44f5o3SyiqnYP3ZN5ewCenUwSEGbPHA4YobSEW2TO/ac3kYPUcbZdR3UsuyGumuvIYGkQpaVZKtbh75IdoWEhHKu6P7y5KrqBQcre6hse0Hi6dUOrhIGFOsK9gBrqwIR6t5W9zXlsvJyVY0oKzG0foMUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivSicRBU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivSicRBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729415432; x=1760951432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1A2EQR6CbTreTKnXqKi/mme8mTkws2ibYsWc+jTSmuU=;
  b=ivSicRBUh570PkjJCw+lQYsvHX971QStuFWaSB5o6+LJTSmmwvOWQXS/
   q0H8MlvHi/wQ2fd6vQOZML4Aqa0SSHYpVa5JN/OmNggLmfTFZ+Unlm/ry
   f1bE2lFh8CJg+OUOpeC6u2bVZ13Lu3rFPpDLi0FbdOG2245btBjDdA6rK
   hLT7GKn5OhYnRV6169DA7RCcGe419Dfc///pr37DpVmRqvN8QNkKCewvx
   DRCxEpJWa+ZV44xRpdx8MnfXt6+V7QOlyb6Zp4swXgmgU0wxiH3QC5q2b
   TbwYzf63/WfOUBATxt9wbravbO1dkDVN6sVPxNUkSw6DGLoITr7gpWhjL
   A==;
X-CSE-ConnectionGUID: pOKv2k04SASLBgRGK2U4lQ==
X-CSE-MsgGUID: abxrGkBwQmCrpxmOt80rDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="39528377"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="39528377"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 02:10:31 -0700
X-CSE-ConnectionGUID: c+Ri0jw5S3SA6a9IDOMwUA==
X-CSE-MsgGUID: 3q4KcBowRFu20hDgpg4Z8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="79182554"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Oct 2024 02:10:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2RxD-000Q8r-1r;
	Sun, 20 Oct 2024 09:10:27 +0000
Date: Sun, 20 Oct 2024 17:10:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [jarkko-tpmdd:hmac-v7 6/7]
 drivers/char/tpm/tpm2-sessions.c:887:11-12: WARNING opportunity for
 kfree_sensitive/kvfree_sensitive (memset at line 886)
Message-ID: <202410201711.pYuoSUpV-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git hmac-v7
head:   3585909b9bbd58fde4d7a94c6d52b9e9589df0e5
commit: f35091ecdc08da259062f6cacd4bc35cb2d17780 [6/7] tpm: Allocate chip->auth in tpm2_start_auth_session()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-104-20241020 (https://download.01.org/0day-ci/archive/20241020/202410201711.pYuoSUpV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410201711.pYuoSUpV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/char/tpm/tpm2-sessions.c:887:11-12: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 886)
   drivers/char/tpm/tpm2-sessions.c:857:12-13: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 856)

vim +887 drivers/char/tpm/tpm2-sessions.c

1085b8276bb423 James Bottomley 2024-04-29  867  
699e3efd6c645c James Bottomley 2024-04-29  868  /**
699e3efd6c645c James Bottomley 2024-04-29  869   * tpm2_end_auth_session() - kill the allocated auth session
699e3efd6c645c James Bottomley 2024-04-29  870   * @chip: the TPM chip structure
699e3efd6c645c James Bottomley 2024-04-29  871   *
699e3efd6c645c James Bottomley 2024-04-29  872   * ends the session started by tpm2_start_auth_session and frees all
699e3efd6c645c James Bottomley 2024-04-29  873   * the resources.  Under normal conditions,
699e3efd6c645c James Bottomley 2024-04-29  874   * tpm_buf_check_hmac_response() will correctly end the session if
699e3efd6c645c James Bottomley 2024-04-29  875   * required, so this function is only for use in error legs that will
699e3efd6c645c James Bottomley 2024-04-29  876   * bypass the normal invocation of tpm_buf_check_hmac_response().
699e3efd6c645c James Bottomley 2024-04-29  877   */
699e3efd6c645c James Bottomley 2024-04-29  878  void tpm2_end_auth_session(struct tpm_chip *chip)
699e3efd6c645c James Bottomley 2024-04-29  879  {
25ee48a55fd59c Jarkko Sakkinen 2024-07-03  880  	struct tpm2_auth *auth = chip->auth;
25ee48a55fd59c Jarkko Sakkinen 2024-07-03  881  
25ee48a55fd59c Jarkko Sakkinen 2024-07-03  882  	if (!auth)
25ee48a55fd59c Jarkko Sakkinen 2024-07-03  883  		return;
25ee48a55fd59c Jarkko Sakkinen 2024-07-03  884  
25ee48a55fd59c Jarkko Sakkinen 2024-07-03  885  	tpm2_flush_context(chip, auth->handle);
25ee48a55fd59c Jarkko Sakkinen 2024-07-03 @886  	memzero_explicit(auth, sizeof(*auth));
f35091ecdc08da Jarkko Sakkinen 2024-09-18 @887  	kfree(auth);
f35091ecdc08da Jarkko Sakkinen 2024-09-18  888  	chip->auth = NULL;
699e3efd6c645c James Bottomley 2024-04-29  889  }
699e3efd6c645c James Bottomley 2024-04-29  890  EXPORT_SYMBOL(tpm2_end_auth_session);
699e3efd6c645c James Bottomley 2024-04-29  891  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
