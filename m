Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F152367B9F
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Oct 2026 09:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402262; cv=none; b=OemTGFj0GERtrFH5j1Qwldc2YyFMixMzFspTaP6aE+dWoN3EJ9jf1T8iO8nFrm1amJeAzvmvaI8hGqLnMOaLSarjrsRXtuhEjifWcFsZM9hTtXBzDAQaFzzkJSa3s7BMxchnAzDkvFLo36jljfj4D+X6DWnuXmFtcUxleGHJkjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402262; c=relaxed/simple;
	bh=GdTBC9tikw4Yc9Vvokr6CTs6ER9LGkz5T4Xm0jmfqQQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F83GzCkpqnCmupPhbGLh8hfCvnAP9YcAqBiJkfUQEeoL7oxoxK7ou/tej/N/numv5Bkjl6O+I2g8vimxBIa4YIN9ORPIVHPry7QQz/isEeMzLrete0BVObnegzbrq3l8M10amzYi61w4Tp+mlPF59j7X5JnsZEjsPDTqsQe8ssE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QTxRMBV0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QTxRMBV0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792402262; x=1823938262;
  h=date:from:to:cc:subject:message-id;
  bh=GdTBC9tikw4Yc9Vvokr6CTs6ER9LGkz5T4Xm0jmfqQQ=;
  b=QTxRMBV036jLrKeUYMFXfze+DOaHqiOKq25z4dWmegcBt1xuEBD1/b8r
   fFQLInbLa4YhgN53bPe4qCZ2UYP15m6cfzP+myeMGOYKZYTH5F+cvbMuq
   1ga54yeeejcaMT85xOOLjYANu1Khta5wZyBIAOuIgrHt+VcTz2N4c2kl6
   fE/zFZm0zc6vsaPbezMbwc5hKVjt9Hm1T+s5l/YIn68GDU90NqrPFPJ07
   lN4umm/Og2a1fsNe6kR+i5OniVhXrchHqsQFxc8R7a3YkUfD0CPjxZNyY
   AtI3MaserQbknZ8yBgDirfVXzwAiZul4xQjEBAyvDj74ZvaC3DKx8OxIQ
   g==;
X-CSE-ConnectionGUID: aLTriIBMS+uml2bWlijqaA==
X-CSE-MsgGUID: q6Bw3cvWS6av1Bg3F/Y39w==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1074891"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1074891"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 02:31:01 -0700
X-CSE-ConnectionGUID: wz2x3tkoRwSF9QrxtYjByA==
X-CSE-MsgGUID: RBCdRXTQSQS7pJt5UMswmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2964996"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 19 Oct 2026 02:31:00 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIjhq-000000005ZL-0SbV;
	Mon, 19 Oct 2026 09:30:58 +0000
Date: Mon, 19 Oct 2026 11:30:30 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bcain:hexagon 33/82]
 Documentation/devicetree/bindings/remoteproc/qcom,glink-shmem-edge.yaml:
 properties:qcom,ipc-bits: '$ref' should not be valid under {'const': '$ref'}
Message-ID: <202610191142.nVSYEsFO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Brian Cain <brian.cain@oss.qualcomm.com>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git hexagon
head:   35ab1dadb94646b74469738c1741f68e8c6aac3d
commit: 01fc8786a581482e48835b8dc1778f2979928c6e [33/82] rpmsg: qcom: add a GLINK transport over shared memory
:::::: branch date: 26 hours ago
:::::: commit date: 3 weeks ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20261019/202610191142.nVSYEsFO-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191142.nVSYEsFO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610191142.nVSYEsFO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/remoteproc/qcom,glink-shmem-edge.yaml: properties:qcom,ipc-bits: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
