Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BAD205E04
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jan 2025 03:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737775330; cv=none; b=gaor/XDANd/nkQQ/K8QKijl9dAslfQeuTRf+v1LL3sF2HAu6Fq2aBNJeN+yfLWuNycjq6ICe+AMuRfhbfjW1FSSOB5Eo8rrnzcFrXa64obgC0TBCrpkxQnIkiGRjcHqCrt8e0z4zk5X7mKGpaUHbx5SzvsZlDGGRttRaxZz6VR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737775330; c=relaxed/simple;
	bh=69fxOnwzPp12qmmAj311McwL5ImnyZGuCiFJPldW/GE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nd2HVsfxFsqD+eqT69kEYcd71S1DSw+qkelRWgsYDaIx6L83Y5Wu9M4x/K74kIeYazXsnklT6RU9msYmESKyuIT3DPMzXvvfN+iaxflFIJ/dnyvbeFgEzTb9dkLMGVrZaTCyHOgwMJCi7E/9xioDeQqxqriKj8TN+4L8j7hTglE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhhpANip; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhhpANip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737775328; x=1769311328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=69fxOnwzPp12qmmAj311McwL5ImnyZGuCiFJPldW/GE=;
  b=IhhpANipn1RjH14K531+qBfwCR7J+lRG9qEwEteCCYNO5TLLsnD4x00J
   T2DLghS+Htw+mG+KnGERcvugOpn22Ibm7TecpRw5bh2ObfUs/cWM4wX76
   EWHl7mtByaro3jzCrwq/y6JiZcNMROaV1UA9S38k5SD2LC2DUt6GNmrMe
   mfdiMg2riJGXGqQnfCK8ifY6xsvwJLd2T4Lmd9RQeIMT0DumVDe3SRiq4
   7q5XHbq6VYwVHrlLSZaAKUZLnb3qjhn/rd+s4xZVcZQqzkbLvScUZmpZD
   7/AfAWNO48pVRIK9rsT78dg+cerOJahQM7Jrt+9C8H3e0EpFkXsocVkdy
   w==;
X-CSE-ConnectionGUID: CavM7k+5Rc2VMTgDSWEJSw==
X-CSE-MsgGUID: TbeyRWGeQVu0LTpBrdPGjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="42250999"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="42250999"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 19:22:08 -0800
X-CSE-ConnectionGUID: tUvpaU05SrmWXikIY7YoUQ==
X-CSE-MsgGUID: H9FSNHzpQqaZpzEjTU0hjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112562328"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jan 2025 19:22:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbWkH-000dQX-0G;
	Sat, 25 Jan 2025 03:22:05 +0000
Date: Sat, 25 Jan 2025 11:21:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jsarha:capture-hw-mute-indicator 7/9]
 sound/soc/sof/ipc4-control.c:868 sof_scomp_get_card() warn: variable
 dereferenced before check 'scomp' (see line 866)
Message-ID: <202501251110.vdLQOt9D-lkp@intel.com>
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
TO: Jyri Sarha <jyri.sarha@linux.intel.com>

tree:   https://github.com/jsarha/linux capture-hw-mute-indicator
head:   34df55e2634f610fc34f29047badf07ddf41ba2e
commit: 1569062204a940115428cee1c098cc286c23f43a [7/9] ASoC: sof: global-capture-hw-mute-indicattor; Mixer created
:::::: branch date: 5 hours ago
:::::: commit date: 4 days ago
config: csky-randconfig-r072-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251110.vdLQOt9D-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501251110.vdLQOt9D-lkp@intel.com/

New smatch warnings:
sound/soc/sof/ipc4-control.c:868 sof_scomp_get_card() warn: variable dereferenced before check 'scomp' (see line 866)

Old smatch warnings:
sound/soc/sof/ipc4-control.c:519 sof_ipc4_bytes_ext_put() warn: potential user controlled sizeof overflow 'header.length + 8' '0-u32max + 8'

vim +/scomp +868 sound/soc/sof/ipc4-control.c

23f60efe259d22 Jyri Sarha 2025-01-20  863  
1569062204a940 Jyri Sarha 2025-01-20  864  static struct snd_card *sof_scomp_get_card( struct snd_soc_component *scomp)
23f60efe259d22 Jyri Sarha 2025-01-20  865  {
1569062204a940 Jyri Sarha 2025-01-20 @866  	struct device *dev = scomp->dev;
23f60efe259d22 Jyri Sarha 2025-01-20  867  
1569062204a940 Jyri Sarha 2025-01-20 @868  	if (!scomp) {
1569062204a940 Jyri Sarha 2025-01-20  869  		dev_err(dev, "%s: scomp == NULL", __func__);
23f60efe259d22 Jyri Sarha 2025-01-20  870  		return NULL;
1569062204a940 Jyri Sarha 2025-01-20  871  	}
23f60efe259d22 Jyri Sarha 2025-01-20  872  
1569062204a940 Jyri Sarha 2025-01-20  873  	if (!scomp->card) {
1569062204a940 Jyri Sarha 2025-01-20  874  		dev_err(dev, "%s: No snd_soc_card", __func__);
23f60efe259d22 Jyri Sarha 2025-01-20  875  		return NULL;
1569062204a940 Jyri Sarha 2025-01-20  876  	}
23f60efe259d22 Jyri Sarha 2025-01-20  877  
1569062204a940 Jyri Sarha 2025-01-20  878  	return scomp->card->snd_card;
23f60efe259d22 Jyri Sarha 2025-01-20  879  }
23f60efe259d22 Jyri Sarha 2025-01-20  880  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
