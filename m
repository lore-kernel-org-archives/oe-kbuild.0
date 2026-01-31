Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E331F340DB1
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 17:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769879959; cv=none; b=uQ4m/BklIi+uXmuacjDRZo25cJQ9HW5c6+jEH2raKV2W5x409/TH+SKHf+SS1L25xxabVU0WUtY91/3P1u6l7IxlKomas768Ao8fP3eXMKQ2H1NEYdd0g8+t4UUqTU8AYzL1EtN4tIr6zgLiw250TQTSEuR6xCG7BqKjM6naa6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769879959; c=relaxed/simple;
	bh=trMkwYABJC186gILExQ1cgX7rpRy8MfIiKSIp3vG3tI=;
	h=Date:From:To:Subject:Message-ID; b=Uc6L7+T5+Z3qd3qczI74GL0b9slbBKGI4dnQUq6I8id4NwnxfYGuDoWs+Y4ofovBpuAcKbJT6J5qXfKfIuwVz3vHci73bdAvtPxhllmcG85EZYsGsc6me9KNCsICJyYHxWPBlOBuv9Y9ok/97oCIWQFPQ7EUbSbBw5jZ4AXNsB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gg+x1sJN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gg+x1sJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769879958; x=1801415958;
  h=date:from:to:subject:message-id;
  bh=trMkwYABJC186gILExQ1cgX7rpRy8MfIiKSIp3vG3tI=;
  b=Gg+x1sJNIydmQQ08sNK3ISeTl/59iEpWTY3wkXeFWucQHGwZ+6zT1BNf
   zSKvi5zHYNet6iCMUw7fPb7sx9tlSecQNI4jkbN+yAla/YbXk5EkT/aXF
   3E0McUnQAIEkTvmk/mQZAUa5Ov2JRIdcjyxzUfGfvrpg2AZ3rurxPcBHp
   WH6+w0LF6jx/ICRKExk5KSeC7r4Nn5V4Gim+6afVWh/HzP7CQ9Nm5sJhW
   3DwBXrVtcp4r7nYIN/yi1yo24kXMFuS1GxyzkADi61+8iBUeV5lnQM8FW
   MzkrhGmWjsLEV+0bw0N48m3Hkq/d/nzYj/hmnkQ2CHCC9V1qiJ9T48e3M
   Q==;
X-CSE-ConnectionGUID: 35xR1MRKRvm/VTN7inqggA==
X-CSE-MsgGUID: K8h4PyyXRuW2VkwO7GEV6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="88523612"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="88523612"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 09:19:18 -0800
X-CSE-ConnectionGUID: mRBcmrfARYa/uC1LkPFhaw==
X-CSE-MsgGUID: 7/DgjtdtQnmZuBAFdjnAkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="239816027"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 31 Jan 2026 09:19:17 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmEcs-000000002jV-3LUV
	for oe-kbuild@lists.linux.dev;
	Sat, 31 Jan 2026 17:19:14 +0000
Date: Sat, 31 Jan 2026 18:19:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [chenhuacai-loongson:loongarch-next 2/19] checkpatch:
 WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
Message-ID: <202601311836.514LQSD1-lkp@intel.com>
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
TO: George Guo <dongtai.guo@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   c17b811b171259c0aa43dd40871ffa3120a6b9e5
commit: 39177d75605c89fe1256ce96691b64cb0e2e1ef3 [2/19] LoongArch: Add detection for SCQ support
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601311836.514LQSD1-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#145: FILE: arch/loongarch/kernel/proc.c:65:
+	if (cpu_has_scq)	seq_printf(m, " scq");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
