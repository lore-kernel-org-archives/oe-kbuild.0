Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEAD182D0
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Feb 2026 00:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770163922; cv=none; b=im/D4cLq/Gi34KkV0EUKrfPBN9wFuAFgI9vvOqCZFrikosBZJ3y3HMuLZbXiTMduuPlWXUJDSJFQUiN00cB5hmd61jnB+JndKgrQwc7g1RV/pOjoxsqINoXFJVmNb2B3kmC7Hv5SLc6GebviWS7CwOD6MSzzXl/ypiCfQgOba5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770163922; c=relaxed/simple;
	bh=vBFRdmf0X0IqFEx1n7vt2OxOaBSd/6Bi5Fj/qF4b2qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ox+ndI/zUrlX14WegtDrsG5sx15MO5K3TYzIbRiBU5CgThQarqs+uCVPeSDmEcZ4H8Me67pSNKqSmO9org7pNxEnlIXe+SxHm2UPyqF9vlaTY2g6AIS6KLm1SISBXcLIJTuXopRnBxQZUuoQmu9xeJSEoRvl+JrffB1ioggjYsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvWqFvk3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvWqFvk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770163921; x=1801699921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vBFRdmf0X0IqFEx1n7vt2OxOaBSd/6Bi5Fj/qF4b2qQ=;
  b=mvWqFvk3+HIWV7TT/2clSaLcYO0+HkkW1DwaEh59X7hT5NCN7S72RIwK
   GGGCChxrRtpNMwcfa5n7Voz2bZsyJTs6ncmAJ5BFSoLoQ83UTZkLl0qgU
   CECd1P9rSd3IMV15r8kV3j28Kk4tsvW1zxRgNpKUYXTCvzllGY0YnmoJW
   004BcXKmslhEgz28G/UX1vwAN5hd2pzTKwXDx9zJ/lHJ5+Vaz8fGWK9SZ
   dXdIvdsZrm9Hu5gSAcIh5uNLmgiOcx8O7g1iTk8gzwvvcs/rpR1/o0peG
   1c5vSxAG/rlp8v+wvaZM97lrVZCp9mNYjJLusgkq51iQBy9V9ts7Ymnyx
   Q==;
X-CSE-ConnectionGUID: BQezj34FTc+Xy7DAIGPf3g==
X-CSE-MsgGUID: jxgQ3f0yQwCeQrBk/xC+9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="58924453"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="58924453"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 16:12:00 -0800
X-CSE-ConnectionGUID: KPNXxyjnTZeJ588yq8UF6g==
X-CSE-MsgGUID: 3XE/K08JSoKYGWyx1ZHOJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="209801795"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2026 16:11:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnQUu-00000000hJb-1DR5;
	Wed, 04 Feb 2026 00:11:56 +0000
Date: Wed, 4 Feb 2026 08:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 12/13] media: stm32: dcmipp: rename bytecap into capture
Message-ID: <202602040854.nuEmyQn0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c:1151:29: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260202-stm32-dcmipp-pixel-pipes-support-v1-12-8d8d51f5e014@foss.st.com>
References: <20260202-stm32-dcmipp-pixel-pipes-support-v1-12-8d8d51f5e014@foss.st.com>
TO: Alain Volmat <alain.volmat@foss.st.com>
TO: Hugues Fruchet <hugues.fruchet@foss.st.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Alain Volmat <alain.volmat@foss.st.com>

Hi Alain,

kernel test robot noticed the following build warnings:

[auto build test WARNING on eb4ee870747c3a77a9c3c84d84efb64bd481013a]

url:    https://github.com/intel-lab-lkp/linux/commits/Alain-Volmat/media-stm32-dcmipp-share-struct-dcmipp_device-among-subdevs/20260202-220852
base:   eb4ee870747c3a77a9c3c84d84efb64bd481013a
patch link:    https://lore.kernel.org/r/20260202-stm32-dcmipp-pixel-pipes-support-v1-12-8d8d51f5e014%40foss.st.com
patch subject: [PATCH 12/13] media: stm32: dcmipp: rename bytecap into capture
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: riscv-randconfig-r122-20260204 (https://download.01.org/0day-ci/archive/20260204/202602040854.nuEmyQn0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040854.nuEmyQn0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602040854.nuEmyQn0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c:1151:29: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c:1150:47: sparse: signed value source

vim +1151 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c

c834544398ca5f drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c Alain Volmat   2026-02-02  1133  
87343ba02c1ab6 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c Alain Volmat   2026-02-02  1134  struct dcmipp_ent_device *dcmipp_capture_ent_init(const char *entity_name,
cddf3a6d3e014f drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c Alain Volmat   2026-02-02  1135  						  struct dcmipp_device *dcmipp)
28e0f37722965f drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c Hugues Fruchet 2023-11-27  1136  {
87343ba02c1ab6 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c Alain Volmat   2026-02-02  1137  	struct dcmipp_capture_device *vcap;
cddf3a6d3e014f drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c Alain Volmat   2026-02-02  1138  	struct device *dev = dcmipp->dev;
28e0f37722965f drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c Hugues Fruchet 2023-11-27  1139  	struct video_device *vdev;
28e0f37722965f drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c Hugues Fruchet 2023-11-27  1140  	struct vb2_queue *q;
28e0f37722965f drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c Hugues Fruchet 2023-11-27  1141  	const unsigned long pad_flag = MEDIA_PAD_FL_SINK;
28e0f37722965f drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c Hugues Fruchet 2023-11-27  1142  	int ret = 0;
28e0f37722965f drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c Hugues Fruchet 2023-11-27  1143  
87343ba02c1ab6 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c Alain Volmat   2026-02-02  1144  	/* Allocate the dcmipp_capture_device struct */
28e0f37722965f drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c Hugues Fruchet 2023-11-27  1145  	vcap = kzalloc(sizeof(*vcap), GFP_KERNEL);
28e0f37722965f drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c Hugues Fruchet 2023-11-27  1146  	if (!vcap)
28e0f37722965f drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c Hugues Fruchet 2023-11-27  1147  		return ERR_PTR(-ENOMEM);
28e0f37722965f drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c Hugues Fruchet 2023-11-27  1148  
c834544398ca5f drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c Alain Volmat   2026-02-02  1149  	/* Retrieve the pipe_id */
c834544398ca5f drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c Alain Volmat   2026-02-02  1150  	vcap->pipe_id = dcmipp_name_to_pipe_id(entity_name);
c834544398ca5f drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c Alain Volmat   2026-02-02 @1151  	if (vcap->pipe_id < 0) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
