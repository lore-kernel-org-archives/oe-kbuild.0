Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1262A26C3B0
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 19:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454628; cv=none; b=pwDjICZ6U/QqjAzqIW9h7YOyGCB/r89KvYBafDfBqYde7naRp+AwkZdIlXEtJ0atzb8YF4JbnnB06fZo4xuMbIkSjFA31bFu+WFZPSddGFLgcAaOrK2gCqAjIAxvaMrnvBI/qE3HPaqx23e0fJzqii4q1q+7FqWL1VZ7CV8Z+mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454628; c=relaxed/simple;
	bh=M87CNxyXgvHFMO7qB3FKP+TSMmlUAHtkfxFBgrX4XfE=;
	h=Date:From:To:Subject:Message-ID; b=jt1F1KXhU7bgY5i86G8RJCjEphuKXBhRkM/52rWqheBkw7B7S5iVdWETXl80lIz4LYDkig6VVTLYYgC7LaXPHJMhrwZfAqNURdN6j2jTOhfvs2saCpO7ylNu8V8IO0G+xIf7Li4Ecq/k021UkUxmlJs/i2Pp81LIlt4UAvCDreU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7F+c3Sd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7F+c3Sd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769454627; x=1800990627;
  h=date:from:to:subject:message-id;
  bh=M87CNxyXgvHFMO7qB3FKP+TSMmlUAHtkfxFBgrX4XfE=;
  b=c7F+c3SdL0kxu8Qp1AD1MvgIOiPUZSFhaZjzZfWq0QJOZ8VwHuRM6Kir
   Kpipx75KBYFUXOSWHs4zC1GwNgVKntvb31hjgvLPQCrg2F6RlveenGC98
   44XOv7pCV54PFxY2skg2S4k0sb0HxftmxR4bkFC1qVNqC6Ekfvv+3VTw7
   Bdl52p4AeE9CBFlV9qKXRL8Ds0Lgy4pZmwnQLsNjrtV91ub8D0T1FnnsV
   6DkUhTd8sSNho/Jl9dv6eX0rnEmTtLWL7AQF2oBpeIcpjTkKcDMoLOYl5
   cvLcyYZcAY8w1atLFQUKA3mDn7//S8jh4DAiTxZEmJfXxsvlZGEdkIZb9
   w==;
X-CSE-ConnectionGUID: LKEoJvpBSLS97KxmrNZD5Q==
X-CSE-MsgGUID: vIpCX8ixRKqbOD0dyhdCvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="69838652"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="69838652"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 11:10:24 -0800
X-CSE-ConnectionGUID: keiaaY0NTrORh9EiqQa/5w==
X-CSE-MsgGUID: 6T4zFpE4Qy+fzIkqEZGRxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="206881382"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 Jan 2026 11:10:22 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkRye-000000001Zp-2M0H
	for oe-kbuild@lists.linux.dev;
	Mon, 26 Jan 2026 19:10:20 +0000
Date: Mon, 26 Jan 2026 20:10:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jlelli:upstream/deadline-kselftest-b4 4/7] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude
 claude-sonnet-4-5@20250929'
Message-ID: <202601262052.FFGJs2to-lkp@intel.com>
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
TO: Juri Lelli <juri.lelli@redhat.com>

tree:   https://github.com/jlelli/linux.git upstream/deadline-kselftest-b4
head:   aea63057473e6e0111adc778d8eb9a897137b840
commit: 8fad5ebe113526800ef90f4955e7832b76a0ea0d [4/7] selftests/sched: Add basic SCHED_DEADLINE functionality tests
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260126/202601262052.FFGJs2to-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude claude-sonnet-4-5@20250929'
#34: 
Co-developed-by: Claude claude-sonnet-4-5@20250929

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
