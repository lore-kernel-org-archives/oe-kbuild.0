Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCEB449EC1
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 23:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769038774; cv=none; b=LafG8fhIzQrYhNU8wNNYhYZM6VEQQOj8jn5wNOpzxlGehYYzXWfni/92AtpTGv19tIclRowN/m4dHzJVY0XfFdG8DXhbVJvDWQiBeqSoYLy50VvHoVuYBvHoEvRrXGKqitg7MsvlWWQmwm+t0tbWUMFmhD1lEw39zivQrzEWj6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769038774; c=relaxed/simple;
	bh=/mZFn7KCeGD99qqJafuk+DSUGygCJSNcLpx91X2wGVU=;
	h=Date:From:To:Subject:Message-ID; b=QuucQzU78bcv1qOv3fvJPz4OAwI7mJ/unWrRHjfn6vWAlbpdmIJSeDCYBqcs2/2a3Ul3pHyOozF1fTxjsPAdcf7p8k8ZucCM3iLbn1QRaEZwy5/yod7GJUPDHvBqOf+luewHDfYChJn7jNT310F45R9YbVmn9RXHIX2OXoHnMq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZBTn4nF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZBTn4nF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769038772; x=1800574772;
  h=date:from:to:subject:message-id;
  bh=/mZFn7KCeGD99qqJafuk+DSUGygCJSNcLpx91X2wGVU=;
  b=MZBTn4nFt7tdRnPBRyyMKNQqVwi55CBAVFG1mmEH5JQhEX5KuOZu+mJG
   ROIaWaJCJg9+n5brGm9nsPE4EK/e57dJggubRDan3tuTPRne+o5fZrFMZ
   wN+FXSv8OGfs8n/BBW8mR+U0lU2Ewq/CTWF9MzbiPGobynh+94M17Zssb
   kWrjoDy5omt/w3SlJ8jTHHFe7d325WPu5sb5DTfVVd98FDzPXxjcVqxns
   05QuK9YdMdb0rlub4XjenERZ4LM1tA1ClCo6Q9ZRx/vEO9KOHMGWn3OYi
   K2NQvwfaAwA8rsmkSEJ92cr/xUuxsRmV1ImRZoa12KENjA9LojynlXbo1
   Q==;
X-CSE-ConnectionGUID: DgqpWjrnR7KXZSlScPA6wQ==
X-CSE-MsgGUID: QZ58NDxZTLWVt+AMO7BN4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70176805"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70176805"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 15:39:31 -0800
X-CSE-ConnectionGUID: irh2dPnyTw+SdOVVH4H0ow==
X-CSE-MsgGUID: wRaXBntKQj6sp1aCujHKHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206483139"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 15:39:30 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vihnM-000000000OX-1OjT
	for oe-kbuild@lists.linux.dev;
	Wed, 21 Jan 2026 23:39:28 +0000
Date: Thu, 22 Jan 2026 00:38:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 223/232] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202601220014.Z1tRfgq0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   0900d904d07bd8586855e5c68aaefa15f4350f9b
commit: de374d7b7296203619ba70f976867051cebaf41b [223/232] bcachefs: Break up reconcile.c
:::::: branch date: 32 hours ago
:::::: commit date: 3 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260122/202601220014.Z1tRfgq0-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#4779: FILE: fs/bcachefs/data/reconcile/work.c:207:
+		BUG_ON(!buf->size);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
