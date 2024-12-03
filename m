Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0522F1BF37
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Dec 2024 07:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212322; cv=none; b=HqWWZiWc5zmilj+M1kvmV255k2Q7WhmkLJdjdBmVqKSp4uF9a1Z9QkFw9nplSydyac7KBf2sOKnfa+sL6knVHh4jlxhQtCaKiEsa0EplYHicIQ+9nmAFla+w+Jhj5V2wksNcH+wpTJdl1iU8OdoKWvs4IOet8tCE1oF0wF3V67M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212322; c=relaxed/simple;
	bh=flh/62IPcXulbcZFq1e2QoTcSo1MfAsebcSs69Y28Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JzPuxNbG/aBje3UtYojtBIQFlsUa5LrFEnxRkyZx9hDg45GlfP8oz38EQ4pJgMRER9E/fL8anfpLVvopPgz3hEm48OswVlmpkCYGPTABcoewh4v8NbtikEQPDtk6zXOCv21L5/dRBELNC8yS8WObvBlpkvliE1vjMQbB1jnJ6KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAoDzmBH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAoDzmBH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733212321; x=1764748321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=flh/62IPcXulbcZFq1e2QoTcSo1MfAsebcSs69Y28Ws=;
  b=KAoDzmBHlW4K3EKpmw3P0Z5Ke7JHbytafCmz3Cv8R8EwQDzUVLyFmm7p
   RA3zcSLRhxd/Aw3y+RXM/G6lws8RGLBHLBRJasYqiluud6uwyiZWPvAMT
   hAJjAGxZUYIueiDeoXWa1N2Jt5VeZ5Y3VKtXSuwphCkp9PJSKAK8ppWJb
   HbZhLvV0N74TFC51V2u7ur7l+DheskHA7q1p1d771lgARiE7gpeQyup9T
   PsahD8ys4hMeipn2VEs7wx3vboMez5Hp75kw/036jy9FPLC3YRpqKWu3V
   9mb6RwA5xC2RxQBDWhp+toDgjE65hksdOfg4xS1L4Dz0kpxxaA93r7oGJ
   w==;
X-CSE-ConnectionGUID: i5XR9DrsRP+RZEitc4hdJw==
X-CSE-MsgGUID: K4QpQeafSkqiqiV0SRFtJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44078331"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="44078331"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 23:52:00 -0800
X-CSE-ConnectionGUID: oLbJNzfoQiCMjEMpQnDpNg==
X-CSE-MsgGUID: bYIgl0vKT+q1VlLi2v5ctg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="98362215"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Dec 2024 23:51:59 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tINhM-0000JP-2S;
	Tue, 03 Dec 2024 07:51:56 +0000
Date: Tue, 3 Dec 2024 15:50:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/catpt/pcm.c:366 catpt_dai_apply_usettings() warn:
 iterator used outside loop: 'pos'
Message-ID: <202412031518.JDyWAcfE-lkp@intel.com>
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
TO: Wei Yang <richard.weiyang@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
commit: 2932fb0a927d30690b8cb70c71d511fd9054bb61 list: leverage list_is_head() for list_entry_is_head()
date:   9 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-141-20241112 (https://download.01.org/0day-ci/archive/20241203/202412031518.JDyWAcfE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412031518.JDyWAcfE-lkp@intel.com/

New smatch warnings:
sound/soc/intel/catpt/pcm.c:366 catpt_dai_apply_usettings() warn: iterator used outside loop: 'pos'

Old smatch warnings:
sound/soc/intel/catpt/pcm.c:367 catpt_dai_apply_usettings() warn: iterator used outside loop: 'pos'

vim +/pos +366 sound/soc/intel/catpt/pcm.c

768a3a3b327da8 Cezary Rojewski 2020-11-16  328  
768a3a3b327da8 Cezary Rojewski 2020-11-16  329  static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
768a3a3b327da8 Cezary Rojewski 2020-11-16  330  				     struct catpt_stream_runtime *stream)
768a3a3b327da8 Cezary Rojewski 2020-11-16  331  {
768a3a3b327da8 Cezary Rojewski 2020-11-16  332  	struct snd_soc_component *component = dai->component;
a9830fc388817c Andy Shevchenko 2020-12-14  333  	struct snd_kcontrol *pos;
a62a02986d3990 Cezary Rojewski 2021-12-16  334  	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
768a3a3b327da8 Cezary Rojewski 2020-11-16  335  	const char *name;
768a3a3b327da8 Cezary Rojewski 2020-11-16  336  	int ret;
768a3a3b327da8 Cezary Rojewski 2020-11-16  337  	u32 id = stream->info.stream_hw_id;
768a3a3b327da8 Cezary Rojewski 2020-11-16  338  
768a3a3b327da8 Cezary Rojewski 2020-11-16  339  	/* only selected streams have individual controls */
768a3a3b327da8 Cezary Rojewski 2020-11-16  340  	switch (id) {
768a3a3b327da8 Cezary Rojewski 2020-11-16  341  	case CATPT_PIN_ID_OFFLOAD1:
768a3a3b327da8 Cezary Rojewski 2020-11-16  342  		name = "Media0 Playback Volume";
768a3a3b327da8 Cezary Rojewski 2020-11-16  343  		break;
768a3a3b327da8 Cezary Rojewski 2020-11-16  344  	case CATPT_PIN_ID_OFFLOAD2:
768a3a3b327da8 Cezary Rojewski 2020-11-16  345  		name = "Media1 Playback Volume";
768a3a3b327da8 Cezary Rojewski 2020-11-16  346  		break;
768a3a3b327da8 Cezary Rojewski 2020-11-16  347  	case CATPT_PIN_ID_CAPTURE1:
768a3a3b327da8 Cezary Rojewski 2020-11-16  348  		name = "Mic Capture Volume";
768a3a3b327da8 Cezary Rojewski 2020-11-16  349  		break;
768a3a3b327da8 Cezary Rojewski 2020-11-16  350  	case CATPT_PIN_ID_REFERENCE:
768a3a3b327da8 Cezary Rojewski 2020-11-16  351  		name = "Loopback Mute";
768a3a3b327da8 Cezary Rojewski 2020-11-16  352  		break;
768a3a3b327da8 Cezary Rojewski 2020-11-16  353  	default:
768a3a3b327da8 Cezary Rojewski 2020-11-16  354  		return 0;
e01a03db74a880 Yang Li         2021-02-01  355  	}
768a3a3b327da8 Cezary Rojewski 2020-11-16  356  
768a3a3b327da8 Cezary Rojewski 2020-11-16  357  	list_for_each_entry(pos, &component->card->snd_card->controls, list) {
768a3a3b327da8 Cezary Rojewski 2020-11-16  358  		if (pos->private_data == component &&
a9830fc388817c Andy Shevchenko 2020-12-14  359  		    !strncmp(name, pos->id.name, sizeof(pos->id.name)))
768a3a3b327da8 Cezary Rojewski 2020-11-16  360  			break;
768a3a3b327da8 Cezary Rojewski 2020-11-16  361  	}
a9830fc388817c Andy Shevchenko 2020-12-14  362  	if (list_entry_is_head(pos, &component->card->snd_card->controls, list))
768a3a3b327da8 Cezary Rojewski 2020-11-16  363  		return -ENOENT;
768a3a3b327da8 Cezary Rojewski 2020-11-16  364  
768a3a3b327da8 Cezary Rojewski 2020-11-16  365  	if (stream->template->type != CATPT_STRM_TYPE_LOOPBACK)
a9830fc388817c Andy Shevchenko 2020-12-14 @366  		return catpt_set_dspvol(cdev, id, (long *)pos->private_value);
a9830fc388817c Andy Shevchenko 2020-12-14  367  	ret = catpt_ipc_mute_loopback(cdev, id, *(bool *)pos->private_value);
768a3a3b327da8 Cezary Rojewski 2020-11-16  368  	if (ret)
768a3a3b327da8 Cezary Rojewski 2020-11-16  369  		return CATPT_IPC_ERROR(ret);
768a3a3b327da8 Cezary Rojewski 2020-11-16  370  	return 0;
768a3a3b327da8 Cezary Rojewski 2020-11-16  371  }
768a3a3b327da8 Cezary Rojewski 2020-11-16  372  

:::::: The code at line 366 was first introduced by commit
:::::: a9830fc388817c90282925694474fae005fec990 catpt: Switch to use list_entry_is_head() helper

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
