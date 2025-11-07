Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E68D2777EA
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Nov 2025 21:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762551872; cv=none; b=es64pCjCay3LcRUDHQ5Oi1rnmozguOkhxGDajEco7E1j0LtayLXb1udYW/nO3WqL8nsrnCUKTv1Jm4IqJhz5vnfzfOKaoDcaHAXEbM81UNC8pXkUCOmWchUWED4QNSxhTFmfRXQRxQYiCC9uAfxW+jS/K4ggj7h4ryEx7Ed425w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762551872; c=relaxed/simple;
	bh=JKbMYHmWp5FKBWCgbziZS1KXAgdMpX40SBz33RhXDto=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lrAxFLxXxsRqg8l1vODSVzh3hxNcIRwAq7QD0gq0sLa+HPLmE1y/KKUrfZosKj5rgg/uv5ekh3bR6XGjKSQZRbRgDJLIvkjqHDpxqd034uxC4e7jRTRc2JF4MQulrdZwzzCwLVdiBwV/ZSF6Tn8z7YsMw7zk4wzpaplgDRCRA+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPpGb0V4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPpGb0V4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762551871; x=1794087871;
  h=date:from:to:subject:message-id:mime-version;
  bh=JKbMYHmWp5FKBWCgbziZS1KXAgdMpX40SBz33RhXDto=;
  b=YPpGb0V4BbmMBezzenl5RN7GIuqoQtvAV7Kwn76QX9V+xTXtrz27mrLc
   n9a1vNHh69+t9hJg4QVwaRBYSNpKQitfl2xSXXpTeo5HzN6cQSy27JUP8
   JBUS838qFMNCGiJyZv9QRZiQfLyrFwJNdKduZbNcfFcSZEypThMi3zkGi
   rnMxEp7jI+QwyDMuCIHyBFihIOdirNfm3keSOZRlBahOtXv97Sa5krTAw
   Tsnp5XraHiJmuGzw6a9olrW7zgdJNRqiPcU345rpYq8f9hvD0VXxu7azD
   mlNOqfTcnaK6pvi6huQyxUVGDAZUPdVXWv59ZNzOgsjY13EzGMwrNt1XL
   w==;
X-CSE-ConnectionGUID: WBuE57xOTGGiqvtzzrFJkg==
X-CSE-MsgGUID: zROBcbplSDaEehgWK1N0DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="87337101"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="87337101"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 13:44:30 -0800
X-CSE-ConnectionGUID: 5b1ciENjTuerFbI5khpRuw==
X-CSE-MsgGUID: ABDmLeaOS5KogEqcSo2A5Q==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2025 13:44:29 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vHUFu-000000003VY-40mk
	for oe-kbuild@lists.linux.dev;
	Fri, 07 Nov 2025 21:44:26 +0000
Date: Fri, 7 Nov 2025 22:43:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-nvme:nvme-6.19 3/23] checkpatch: WARNING: space prohibited
 before semicolon
Message-ID: <202511072228.S1nPOm7U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hannes Reinecke <hare@kernel.org>

tree:   git://git.infradead.org/nvme.git nvme-6.19
head:   1c2ad96dbb33c75098b9c1b2a077d9434ecb9f02
commit: 00eecf662c6e30736357ffd007ea2f3964f6eb04 [3/23] nvme-auth: modify nvme_auth_transform_key() to return status
reproduce: (https://download.01.org/0day-ci/archive/20251107/202511072228.S1nPOm7U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511072228.S1nPOm7U-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited before semicolon
#326: FILE: include/linux/nvme-auth.h:33:
+			    u8 **transformed_secret) ;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
