Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAADF2F12DB
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 04:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771387523; cv=none; b=VNeBStSGb87Z0DrksVwCZ90LQmGj54akCdlSEg68PkilQmEa/yXfhEtjTSRQLqNKQVeCudz1bpRnU47X3CE+p5fjmnq09ZhcIu6f796ag1jB6RFadt/c2gc1xZczMWkDyPiSeiBuLAGnWdpVmAhvoohktAYl3BZMy7wK+SsGBlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771387523; c=relaxed/simple;
	bh=sjZmDtl6VlmjwNEewgVCDILU+qPUSTP8YL7FhHTe5H0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r2wJqs4/+4gDI4R8ksKtrlxaR0dyvDvQaMIfgoekEuDLQVa8aW+3zNqeVR+2RBm9Q7qnQRMA0mT6LN8HHv9XIElAF1BuO3s9ZoH7VyQEUcnogMahe48QvdvHPzCrZeX55NVFK99uluRxvCO8w7ZtnfO97H/au6O+Or+V7sgIoRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iva90nWh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iva90nWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771387522; x=1802923522;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sjZmDtl6VlmjwNEewgVCDILU+qPUSTP8YL7FhHTe5H0=;
  b=iva90nWhS6lXD0ms8r6aeu+98c7hw/4IuVqpQI6eWP8rI5FIbBK8tsy0
   xWKYsjxEaMQbMwSPo0lWYi62OTNPZFGRIJKbVdnERtyCkA3Xue5Xf1np3
   dzAIysSrONBzYXnc6tqLmv8PrNipTGIU6vwpf0mrXLGeTp9NufOVW0lCv
   8fSXtdVZ7W3n4MlWR29uXo4te3ayvstyu/4KtXdx6NasyqSnXS4k0RV7j
   YU93MvF58SOehUfwbOMZwGnGQztLJeROvErxNZXmwmLaQdQqg1lsMHHxX
   kiVVOGPnIn4Dhj3t//qCMUwdbV+xcIxDu9/1jsqdWxJjn85G62WKdv/9y
   g==;
X-CSE-ConnectionGUID: B0Mo4n9oQyWX5I/ULYtSHA==
X-CSE-MsgGUID: j/at1VFLQWqeWdbjj205/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83910129"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="83910129"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 20:05:20 -0800
X-CSE-ConnectionGUID: Bt1xbQ0lTj6h7MZ8e1GSsg==
X-CSE-MsgGUID: KvdkZX2+TRqpdSExdOmx6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="213325861"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 17 Feb 2026 20:05:19 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsYoM-000000003Vv-0l0A
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Feb 2026 04:05:14 +0000
Date: Wed, 18 Feb 2026 05:05:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 3/3] HID: asus: avoid memory leak in asus_report_fixup()
Message-ID: <202602180553.X9UHt7tL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260217160125.1097578-4-gnoack@google.com>
References: <20260217160125.1097578-4-gnoack@google.com>
TO: "Günther Noack" <gnoack@google.com>
TO: Jiri Kosina <jikos@kernel.org>

Hi Günther,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/G-nther-Noack/HID-apple-avoid-memory-leak-in-apple_report_fixup/20260218-000629
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20260217160125.1097578-4-gnoack%40google.com
patch subject: [PATCH 3/3] HID: asus: avoid memory leak in asus_report_fixup()
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260218/202602180553.X9UHt7tL-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Gemini-CLI:Google Gemini 3'
#17: 
Assisted-by: Gemini-CLI:Google Gemini 3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
