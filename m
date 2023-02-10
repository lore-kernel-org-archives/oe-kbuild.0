Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF54B3233
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Feb 2023 15:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676042922; x=1707578922;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=I61dRZTMX3A9z8nvkjNOB81iqr4JbjRFzNywCaIWq5A=;
  b=YT1xlGxlchurRFhCI+iXU8XoE6/WrkDWKn0JLwbVhuY5Z/dvdeEiznwQ
   8bg6WfAqJi0FOsYbQPTdPeYH+/fcWPAYYLbNHSMisfTVu86DyPQ1/48eY
   xAht0kB1SPElvLodGkMpApZWpKsthbbAyve2jmoVJWTePebgG5vZZOEC7
   hcSe04uzX8BgitLF54Cq46XMgi21tva/O3QNWlZ5e97TS0yIw3yAbNYs2
   mlseivrzqv6ht7SoG/hHtg5B/g9TVJDusKwUVr5Z702rW3r+I+VnGbuHJ
   Nk5qrjEAdXPn9+Ljxa9/FRye1+Wx57iztLUNmApYEno43f/ys7QkLneEp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="332581848"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="332581848"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 07:28:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="670032238"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="670032238"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Feb 2023 07:28:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQVKI-0005rl-0M;
	Fri, 10 Feb 2023 15:28:38 +0000
Date: Fri, 10 Feb 2023 23:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/boards/max98927.c:162 avs_create_dapm_routes()
 warn: potentially one past the end of array 'dr[idx]'
Message-ID: <202302102357.6l3pMrJU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Cezary Rojewski <cezary.rojewski@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   38c1e0c65865426676123cc9a127526fa02bcac6
commit: 1c993300ab1cec9a0a6a3c417614a1d9f35b175b ASoC: Intel: avs: Add max98927 machine board
date:   4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-m021-20221226 (https://download.01.org/0day-ci/archive/20230210/202302102357.6l3pMrJU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302102357.6l3pMrJU-lkp@intel.com/

New smatch warnings:
sound/soc/intel/avs/boards/max98927.c:162 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'

Old smatch warnings:
sound/soc/intel/avs/boards/max98927.c:163 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'
sound/soc/intel/avs/boards/max98927.c:164 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'
sound/soc/intel/avs/boards/max98927.c:164 avs_create_dapm_routes() warn: potentially one past the end of array 'dr[idx]'

vim +162 sound/soc/intel/avs/boards/max98927.c

1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  140  
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  141  static int avs_create_dapm_routes(struct device *dev, int ssp_port,
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  142  				  struct snd_soc_dapm_route **routes, int *num_routes)
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  143  {
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  144  	struct snd_soc_dapm_route *dr;
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  145  	const int num_base = ARRAY_SIZE(card_base_routes);
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  146  	const int num_dr = num_base + 2;
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  147  	int idx;
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  148  
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  149  	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  150  	if (!dr)
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  151  		return -ENOMEM;
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  152  
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  153  	memcpy(dr, card_base_routes, num_base * sizeof(*dr));
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  154  
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  155  	idx = num_base;
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  156  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "Left HiFi Playback");
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  157  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  158  	if (!dr[idx].sink || !dr[idx].source)
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  159  		return -ENOMEM;
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  160  
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  161  	idx++;
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30 @162  	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "Right HiFi Playback");
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  163  	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  164  	if (!dr[idx].sink || !dr[idx].source)
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  165  		return -ENOMEM;
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  166  
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  167  	*routes = dr;
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  168  	*num_routes = num_dr;
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  169  
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  170  	return 0;
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  171  }
1c993300ab1cec9 Amadeusz Sławiński 2022-09-30  172  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
