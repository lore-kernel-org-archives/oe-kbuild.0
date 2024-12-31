Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAB1139D19
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Dec 2024 06:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735626844; cv=none; b=idSTMzAz/VM/ZyNzqO9X0BJqOkwLZwHXbGLZExTCoLmAYAyQ4bku0seoopR/STd3IyLGB9SVw/UDmxc9btYsIv6K3etViH2Dms229que67kw/9mTY0VP4Td+mYZHnfo4u6g+5gorXUf4Uv+toE/K5Ijp5gIkqS6c4ppjmBP+cwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735626844; c=relaxed/simple;
	bh=TNdNBf1698awNKnBbxszg/RkBtgyPQI6cc9vbGZdw1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mcrChagUwcUfOaWC4ior6HYlLCjNPa6jm9NqvPxJo/jS3JpnHN6QB82/SIdnoH2b3eVA/kTKqgWHDkM4kRXGLxKtwOurwFBDgbFRw3kd37dG7y6jaeB+CI7k7bKCSuTOuJ2WpyT7LUEzf/4LVfDi0caK/FSegv7pDzlhilyFmhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+vYinNp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+vYinNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735626843; x=1767162843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TNdNBf1698awNKnBbxszg/RkBtgyPQI6cc9vbGZdw1Q=;
  b=C+vYinNp8jKGCwtFN+bbbn5buL/CYbLt1KX+mfe4z3aywMT8ISjcvi2q
   Qb7LRfw49lcSV1e4gJq3Exbk23pjqVNkV4xNBzZEq7F0wPpVgp1c5DpOy
   JQv7hL7mysMbEAfCM1y7PUebq7eI7FbTMgiqX0Sq4tmOynnNlaAvZC4WA
   qLCzjXaB3SVF1DBwLh6s1fqlwryjTBvn735rIg2nsMSppVNOMHkvHU26D
   a659MHTIkwUYPC1ZhIo0Cc3+gSbEjXKg55Dt+erpvUX+tu6fXoP0Eqb8u
   Ey3KY1nQG1YVHsIJJPfkMJ0HDqeeO1zwsmek451MnpjsdaVQjZOCN3Ae7
   w==;
X-CSE-ConnectionGUID: GOUTVWrdScmSqSzq4Mi8gg==
X-CSE-MsgGUID: OMLMB5SqQ+m+tWmqpI67Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="53454130"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="53454130"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 22:34:02 -0800
X-CSE-ConnectionGUID: 34whdK97Tv6hWrO39bgzyw==
X-CSE-MsgGUID: 7el1D/SFSNiaPX8HKnhI4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="138320419"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Dec 2024 22:34:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSVpH-0006rf-0E;
	Tue, 31 Dec 2024 06:33:59 +0000
Date: Tue, 31 Dec 2024 14:33:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 4/6] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
Message-ID: <202412311450.C3nyojg0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241231-gpu-acd-v3-4-3ba73660e9ca@quicinc.com>
References: <20241231-gpu-acd-v3-4-3ba73660e9ca@quicinc.com>
TO: Akhil P Oommen <quic_akhilpo@quicinc.com>
TO: Rob Clark <robdclark@gmail.com>
TO: Sean Paul <sean@poorly.run>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Abhinav Kumar <quic_abhinavk@quicinc.com>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
TO: Marijn Suijten <marijn.suijten@somainline.org>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Viresh Kumar <vireshk@kernel.org>
TO: Nishanth Menon <nm@ti.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Akhil P Oommen <quic_akhilpo@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: freedreno@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dbfac60febfa806abb2d384cb6441e77335d2799]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-P-Oommen/drm-msm-adreno-Add-support-for-ACD/20241231-051408
base:   dbfac60febfa806abb2d384cb6441e77335d2799
patch link:    https://lore.kernel.org/r/20241231-gpu-acd-v3-4-3ba73660e9ca%40quicinc.com
patch subject: [PATCH v3 4/6] dt-bindings: opp: Add v2-qcom-adreno vendor bindings
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arc-randconfig-051-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311450.C3nyojg0-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311450.C3nyojg0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412311450.C3nyojg0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
