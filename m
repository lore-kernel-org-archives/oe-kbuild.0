Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543154;
	b=qp260ymFaw0PdVTI9vky5H9id8+yn5HFsjhy9UM7/GiepZbt9gQaQEqbCwQGlA4Slhsz
	 tVwmq8mvWJt/J19682/p28gBFJEGXHTK1DRpvamUU0zKb8AlWNPQUDRo/euHrN50YKvBc
	 LIA/2ghod9uXY2raOMjho+DSYkIitiEljJodNPpLzZsOhgXRJ+cqAoMAXiEqfZTzBlo5L
	 ewFketDwmZkPLKo7CJOpPC98LlN1RK8d9gUhXNdeA4JsmthLnlGVG4Fy3Q4z9roGZSARZ
	 H8CkvJYET8HRg+aZtHclQyuSuKJVg/K23UotfFh5JXErZV8zUsdkarg7CTRHxvsPLUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543154;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=dpNgm1JKfpWJM2SwGbcWq93ciHmUz3/bUDQ2j84oNx8=;
	b=Zy+sRIWTvgKRO1A3oCkxgd+c6Xmx6E6G0Ty7VWxv/WeMuPqce+zk4pjvJ56m0ICmpMwA
	 MO0SK7zSQ3zi5c5Idb7OrVQo88Rcx0W7sP3wo8Gu1gWTt37op2ruNYd9vCk8mXLKKgkCa
	 if1Vrm/ubYSNfJwRaJzV7nmeKN6TW0dudqKWy5Bc5SS71+r4PI3YjNdXZeMMgM366jMZ3
	 QU2fRXDI2QWyZNBCQPs8ImurcdN2h0e3TZz7Chk0QCGLJNn2cowYPrRf+j1hkR4FMhHBQ
	 TpxLPHosKs0H7xEXPyztDWVg2sff1IL5qmBd8OFOclVmQMId4NO15sLaVrLutsGsISw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SLa2Oub1;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE09606A332
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Nov 2026 17:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAE09606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SLa2Oub1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795543154; x=1827079154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pk9O7Y3qAmDzMTCdyTKxo/FuIc0qnL63OJuP6EuuznQ=;
  b=SLa2Oub1Capydh1IwzMg/FYSsGjbi1Wg5mvmRvG3jS7/b5cDmq0eR+3O
   KCVr6uGcpRyESUdqWQM7aUBgYSRgLpSl9dNRvhA4ooFi7SDGwCP8U+DwW
   iq4+r3RYuIVb0WP/CWlLyHPIvxWF43B6qoy/2222GHVUWSnTrq5+kGk+N
   nbfOw1fl+LSv2p4Om2dmzU6B+MFHVLtASK+1GxaG5yPbtdkshwwB+ruZE
   /1dls2b9D2rMFgAc5d8ITKYwHv/Xw0ib1UXwh7LZ4LCx/CAvHmu4JHZgX
   nyJYg5HhpY+akh7S+xmYRUmdbsiYs94rGcL86Adyu8Riu2FaWGpeZ6U4i
   g==;
X-CSE-ConnectionGUID: Hul7B/uUS/aYtcQgqdg6qA==
X-CSE-MsgGUID: +PeSAS23T2a26Aw2ydt1sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4432258"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4432258"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 08:50:37 -0800
X-CSE-ConnectionGUID: tT4Fd45bQW6gljI0WYoyBw==
X-CSE-MsgGUID: i3Qcak3MR1CWNr5dKp+i5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11910609"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Nov 2026 08:41:02 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVtZj-00000001PkU-31aP;
	Tue, 24 Nov 2026 16:40:59 +0000
Date: Wed, 25 Nov 2026 00:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 18/24] ASoC: qcom: audioreach: add live speaker
 temperature (T0) readback
Message-ID: <20261125003219.ctitwqQ8-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "same reports for this branch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261122161437.5994-19-srinivas.kandagatla@oss.qualcomm.com>
References: <20261122161437.5994-19-srinivas.kandagatla@oss.qualcomm.com>
TO: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
TO: Mark Brown <broonie@kernel.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Jaroslav Kysela <perex@perex.cz>
TO: Takashi Iwai <tiwai@suse.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: Srinivas Kandagatla <srini@kernel.org>
CC: Abel Vesa <abelvesa@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: linux-sound@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Srinivas,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20261120]
[cannot apply to broonie-sound/for-next tiwai-sound/for-next tiwai-sound/for-linus robh/for-next v7.4-rc3 v7.4-rc2 v7.4-rc1 linus/master v7.4-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-soc-pcm-add-multi_direction_codecs-link-flag/20261122-161415
base:   next-20261120
patch link:    https://lore.kernel.org/r/20261122161437.5994-19-srinivas.kandagatla%40oss.qualcomm.com
patch subject: [PATCH v2 18/24] ASoC: qcom: audioreach: add live speaker temperature (T0) readback
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261125/20261125003219.ctitwqQ8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125003219.ctitwqQ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261125003219.ctitwqQ8-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: sound/soc/qcom/qdsp6/audioreach.o: in function `audioreach_get_sp_vi_t0':
>> audioreach.c:(.text.audioreach_get_sp_vi_t0+0x170): undefined reference to `__aeabi_ldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
