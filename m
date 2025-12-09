Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C4C2C1597
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 14:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765288928; cv=none; b=vBAIsso4TEwHpcKPF1eOYU3k9EeB+d8gB86DW2JVraeEiy6s8KLdRUqVLel5VOUmIwfEw7rVGFLJBpIW5Cttme2JMNMJibKBEnVwSGw7r5yxO7y3Ait/OKeA6utLntsGxyEgRymS2nwgX2u0KPUx4dDlC2h/+DF5gXSupT0SpeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765288928; c=relaxed/simple;
	bh=Sb/Bl+12mhnYZ5yOvghnqA0WuO0PQ2ww3uJpbmx9kdk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LAff5OOu/277efqnYoWS1sRlNFyGvc6l2wLOr44ubN+tJvOX5b+5SqVVeDxn6v3dH5jkN1us1gZv4NMgoqvrX4eXgvyYaGLd3bmYY8PWX4x3wbZ+TUpYsxmlOr6C6su8PKlDgik/UiUcYEmsPh8kWBlQLyATk+yX1DvfAEwJ10Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mec8HDPh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mec8HDPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765288927; x=1796824927;
  h=date:from:to:subject:message-id:mime-version;
  bh=Sb/Bl+12mhnYZ5yOvghnqA0WuO0PQ2ww3uJpbmx9kdk=;
  b=mec8HDPh7kkw2WcEyNMiQ6PCTx72dwx1eM9ydPRj1TSxLKth7xz2Lzn/
   A/YLjLwCzoepxS2XcBfYELMRj/5YRHKYec24jR3UgMkpamb/SbAjdiWRG
   p69bWSgF6P52D3WPeTgSLmUwYStpT5/EbSGC6kG6WDUk8qD2KCxsvQ+vT
   EJTng9mUSTFF0vwgiL8nZ92PhFRD5f4cLjK2hxigjcmDQo88WC5KG0lAk
   wALmIsa/LnEo24+v4rSQZcKqLMmY0klNTc02ZGCcGe34atS5bfcuSWCRw
   29SOc8Wm/0ETdDizZLGd1EXOZTd92vIooVzVIXNiQnPNncEnLeWtLwAZo
   Q==;
X-CSE-ConnectionGUID: HW2aeFdsSySZgu9UTVrSXw==
X-CSE-MsgGUID: 2MBnAeDJRNSQXwxrEauA+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67138109"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="67138109"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 06:02:06 -0800
X-CSE-ConnectionGUID: xsdXiCEFTSybBClc4mMCUQ==
X-CSE-MsgGUID: 2fH55ZxsRT6Or9aqxMayvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="196282777"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 09 Dec 2025 06:02:05 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSyHz-000000000EX-13QL
	for oe-kbuild@lists.linux.dev;
	Tue, 09 Dec 2025 14:02:03 +0000
Date: Tue, 9 Dec 2025 15:01:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [andi-shyti:i2c/i2c-host-fixes 125/719] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'configfs'
Message-ID: <202512091555.YQMnEsUr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Breno Leitao <leitao@debian.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host-fixes
head:   bf73845cc1394cefe52dd2c91478b606e1892e76
commit: b66acab3a7def82556ec52d4b6c37b001580dade [125/719] selftest: netcons: add test for netconsole over bonded interfaces
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091555.YQMnEsUr-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'configfs'
#382: FILE: tools/testing/selftests/drivers/net/bonding/netcons_over_bonding.sh:300:
+		"mount -t configfs configfs /sys/kernel/config && echo 1 > $NETCONS_PATH/enabled"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
