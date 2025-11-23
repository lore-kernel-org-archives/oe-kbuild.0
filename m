Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A196FC3
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Nov 2025 05:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763876030; cv=none; b=LwQGeybMI00a/FE3XudGbgyDfveFETh/PEyPRQvF2EjmzbV0UHxsZ+XFhnS+z6ERBvtJan4S/EG8pkTtNfkDVXad5etU+xetOYmLJpWd0Ol0Jtv6wltGIlUkv7RN1XAJZx7ivpTNIF3jTUxKE1eOrr0YIwRAa+muXvVo9ZIjUj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763876030; c=relaxed/simple;
	bh=STBnGZb07+uL3gHRskuw/VffAN0pu8MeKGxp8CgGcLw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JI2UwlLTkC3BGkIJHihWbzN+gbmKkTUcg7yTSY1mDBfRtG/pM9Eirm3qKVkpbviSI71lHYcQeIVoK6vT28ktyJ5gwQNL6Zg+HCj3l9y3CI4XhShsP+4EOm/Z1myMHdz0uUNqHkS73JkZgMesHgzlMV6Eu6sjPB1Oyu+H4mBjIZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9oZQSUu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9oZQSUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763876029; x=1795412029;
  h=date:from:to:subject:message-id:mime-version;
  bh=STBnGZb07+uL3gHRskuw/VffAN0pu8MeKGxp8CgGcLw=;
  b=l9oZQSUu6fTw4gJq1E54HE4mdYV8KOFraYfjpjXxOc+4Md4/TlT5pa1k
   Ravceo7hLnOr/PjkF1qRQzdsrLTyFVbi8/dZMTtUWyoXLqWWhNKy6EiRo
   PXwkUXjWCKS9j4DoubmaxMtXZT3YbOEzEqYo3r5uo/pwJhDt6Cdv4WbQI
   uqd0Uz6q2fH35wqND51EyIEWUzwa8ybMBEKoXs5kM6E2wNa6QNVAe22Dp
   SRdMTThaLlODl9QHRM4W9XElFnioW8TC49GGVvpQo5vU6s2iPWot26dhA
   Pipm7EeSOdLHQXazxP3WTVJZ63/yaBIBgi/OU38qd//odqlSP2Q0cmIIU
   Q==;
X-CSE-ConnectionGUID: aLeihMkmRG6QXJuSDr0Y7g==
X-CSE-MsgGUID: eSoaq7goS822T51mrpKATw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="83302924"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="83302924"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 21:33:48 -0800
X-CSE-ConnectionGUID: wpI17eMFQEaNr3KKAVy3vg==
X-CSE-MsgGUID: waMfWROPTxCorM0Ncdb9dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="192065114"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 22 Nov 2025 21:33:47 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vN2jJ-000000002KZ-08yu
	for oe-kbuild@lists.linux.dev;
	Sun, 23 Nov 2025 05:33:45 +0000
Date: Sun, 23 Nov 2025 06:32:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [morimoto:string-helper-2025-11-17 145/145] checkpatch:
 ERROR:SPACING: space required after that ',' (ctx:VxV)
Message-ID: <202511230648.Wa9bgdyw-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux string-helper-2025-11-17
head:   44ab8a61746400859fc6dd4d140afdf27adf5d13
commit: 44ab8a61746400859fc6dd4d140afdf27adf5d13 [145/145] all
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251123/202511230648.Wa9bgdyw-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1787: FILE: drivers/media/usb/pvrusb2/pvrusb2-debugifc.c:151:
+	ccnt = scnprintf(buf,acnt,"Streaming is %s\n", str_on_off(pvr2_hdw_get_streaming(hdw)));
 	                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1787: FILE: drivers/media/usb/pvrusb2/pvrusb2-debugifc.c:151:
+	ccnt = scnprintf(buf,acnt,"Streaming is %s\n", str_on_off(pvr2_hdw_get_streaming(hdw)));
 	                         ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
