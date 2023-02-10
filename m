Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAA363DA
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Feb 2023 18:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676053365; x=1707589365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J70Q82dYavVTCRZwsdPvHguIMcea4/YFZL3Cv7kFh9A=;
  b=F/5hl8NkXUquAwa2B73PlDPX9+wBvFtLJmq4YDAfhbSAUmsi+K1slxRC
   3akgoB1QkAWP7RtAgyyW9kHueXsmMjN+j0TDyr5xDJ8b8dWF36zG0dFxi
   Go5uhxz5soXovSikVgTJMhMQv7IVwEBCZeyoxbRX5fSaY1yWC7Br+07G6
   jZqMn081v2+JgxofyBtuyioWrCeSDXo4+LlkR/c1RCZzoCQJT5tgxSNLG
   gyo0SG0jbgI/7uUehslPXFJHgTFSPfA81mBe5fXvasJ3No47pwIlGAw5l
   XwUAMIOq2TzV1VcseOi+1YKl6kJvmCgkHH2X8GQaBO8MRPW6R0PfL7qLf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="395101768"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="395101768"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 10:22:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="756870950"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="756870950"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2023 10:22:43 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQY2k-0005yN-33;
	Fri, 10 Feb 2023 18:22:42 +0000
Date: Sat, 11 Feb 2023 02:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/avs/pcm.c:1406 avs_component_hda_open() warn:
 ignoring unreachable code.
Message-ID: <202302110254.u5qPtpSr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Cezary Rojewski <cezary.rojewski@intel.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   38c1e0c65865426676123cc9a127526fa02bcac6
commit: f38d4c72cb2d68e73d3e54feb68febd6b7c4bfd2 ASoC: Intel: avs: Initialize private data for subsequent HDA FEs
date:   3 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-m021-20221226 (https://download.01.org/0day-ci/archive/20230211/202302110254.u5qPtpSr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302110254.u5qPtpSr-lkp@intel.com/

smatch warnings:
sound/soc/intel/avs/pcm.c:1406 avs_component_hda_open() warn: ignoring unreachable code.

vim +1406 sound/soc/intel/avs/pcm.c

d070002a20fc07 Cezary Rojewski 2022-05-16  1387  
d070002a20fc07 Cezary Rojewski 2022-05-16  1388  static int avs_component_hda_open(struct snd_soc_component *component,
d070002a20fc07 Cezary Rojewski 2022-05-16  1389  				  struct snd_pcm_substream *substream)
d070002a20fc07 Cezary Rojewski 2022-05-16  1390  {
d070002a20fc07 Cezary Rojewski 2022-05-16  1391  	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
d070002a20fc07 Cezary Rojewski 2022-05-16  1392  	struct hdac_ext_stream *link_stream;
d070002a20fc07 Cezary Rojewski 2022-05-16  1393  	struct hda_codec *codec;
d070002a20fc07 Cezary Rojewski 2022-05-16  1394  
eb0699c4cd6e32 Cezary Rojewski 2022-10-27  1395  	if (!rtd->dai_link->no_pcm) {
eb0699c4cd6e32 Cezary Rojewski 2022-10-27  1396  		struct snd_pcm_hardware hwparams = avs_pcm_hardware;
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1397  		struct snd_soc_pcm_runtime *be;
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1398  		struct snd_soc_dpcm *dpcm;
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1399  		int dir = substream->stream;
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1400  
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1401  		/*
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1402  		 * Support the DPCM reparenting while still fulfilling expectations of HDAudio
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1403  		 * common code - a valid stream pointer at substream->runtime->private_data -
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1404  		 * by having all FEs point to the same private data.
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1405  		 */
f38d4c72cb2d68 Cezary Rojewski 2022-11-18 @1406  		for_each_dpcm_be(rtd, dir, dpcm) {
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1407  			struct snd_pcm_substream *be_substream;
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1408  
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1409  			be = dpcm->be;
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1410  			if (be->dpcm[dir].users == 1)
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1411  				break;
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1412  
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1413  			be_substream = snd_soc_dpcm_get_substream(be, dir);
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1414  			substream->runtime->private_data = be_substream->runtime->private_data;
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1415  			break;
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1416  		}
eb0699c4cd6e32 Cezary Rojewski 2022-10-27  1417  
eb0699c4cd6e32 Cezary Rojewski 2022-10-27  1418  		/* RESUME unsupported for de-coupled HD-Audio capture. */
f38d4c72cb2d68 Cezary Rojewski 2022-11-18  1419  		if (dir == SNDRV_PCM_STREAM_CAPTURE)
eb0699c4cd6e32 Cezary Rojewski 2022-10-27  1420  			hwparams.info &= ~SNDRV_PCM_INFO_RESUME;
eb0699c4cd6e32 Cezary Rojewski 2022-10-27  1421  
eb0699c4cd6e32 Cezary Rojewski 2022-10-27  1422  		return snd_soc_set_runtime_hwparams(substream, &hwparams);
eb0699c4cd6e32 Cezary Rojewski 2022-10-27  1423  	}
d070002a20fc07 Cezary Rojewski 2022-05-16  1424  
d070002a20fc07 Cezary Rojewski 2022-05-16  1425  	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
d070002a20fc07 Cezary Rojewski 2022-05-16  1426  	link_stream = snd_hdac_ext_stream_assign(&codec->bus->core, substream,
d070002a20fc07 Cezary Rojewski 2022-05-16  1427  					     HDAC_EXT_STREAM_TYPE_LINK);
d070002a20fc07 Cezary Rojewski 2022-05-16  1428  	if (!link_stream)
d070002a20fc07 Cezary Rojewski 2022-05-16  1429  		return -EBUSY;
d070002a20fc07 Cezary Rojewski 2022-05-16  1430  
d070002a20fc07 Cezary Rojewski 2022-05-16  1431  	substream->runtime->private_data = link_stream;
d070002a20fc07 Cezary Rojewski 2022-05-16  1432  	return 0;
d070002a20fc07 Cezary Rojewski 2022-05-16  1433  }
d070002a20fc07 Cezary Rojewski 2022-05-16  1434  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
