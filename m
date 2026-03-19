Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645EB3D333B
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773926431; cv=none; b=G9uVhucMd2Z1NHgV0RDEBXJUse3Zb/kg7bNRT6r6hktSwx6CYyWaYBuDM9Hw4s5TRto5NBGefdT3eX2jyHX80rEa0gRinjlNOv9r4Rf0FPO9tEE2a6dEXgk5uu/OnoTQQoLKMDQgaVfcMTVcL2pm3zKcmKNxHU1rWBXi8vbekOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773926431; c=relaxed/simple;
	bh=/NLhu8ctfm+VY3FuY7CwT904bbvP9yNgiYiUhm83ZY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gKVRfps4YLivxkI6eLHyI2L2PUEdIXc2VtRhQEso7cZMbc/y64AvphbWahndCITgKoN8RuarKQ7FS4jGrVBAADtlZkslsNUhqHYfE8LiLbQMg2G/46v8MizvAas2gErJNS4WaYlEMJpf1sLgNZU6FX4s7BDKK5vc3da12QYvU8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j16Xuxts; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j16Xuxts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773926429; x=1805462429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/NLhu8ctfm+VY3FuY7CwT904bbvP9yNgiYiUhm83ZY8=;
  b=j16XuxtsFO5BFvbdxNUhOIk1XbE2Erm19+MFjWFYqpzT+bBYQp7XO2Sz
   CPtqI+7UIYqMEM/zbSSU7FSCa59infpwy3GGUwmONiKZl828FRRzngZFG
   mW/MAu0JcQ1DPab2dBC3MxeWUUjljXuxZUxEI1kGJOcc08K3QVmxv8R7/
   dpFptxjcYCqne/ActKm0ZfCyFOUqhhltDsDyhjzJApw1YHGcyIfwY5k4k
   ZJKe64fO77wWbCg51peEjTajeH6n6KppuiLW6jP8jZ36c8urDTgADADw5
   IN321Pw7xQjDTEaxR8nzgWSS/tLTN2aj0RkVgEObY9OKYK0XR5rsJyASn
   g==;
X-CSE-ConnectionGUID: /ht0xKy+Sge07pu6TfrwQw==
X-CSE-MsgGUID: qBpcP8gMQXmw0DrRi36CFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74909071"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74909071"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 06:20:28 -0700
X-CSE-ConnectionGUID: 9K12YB71RcGfqfl09zbAtg==
X-CSE-MsgGUID: 8BbVOSOjRzejVTNR827raQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="222062124"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 Mar 2026 06:20:27 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3DHd-0000000011V-36D8;
	Thu, 19 Mar 2026 13:19:58 +0000
Date: Thu, 19 Mar 2026 21:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] spi: hisi-kunpeng: prevent infinite while() loop in
 hisi_spi_flush_fifo
Message-ID: <202603192159.S0PIjhlg-lkp@intel.com>
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
In-Reply-To: <d50f1f46b2ee2bba05de9e2d4199353b545194e3.1773820898.git.xiaopei01@kylinos.cn>
References: <d50f1f46b2ee2bba05de9e2d4199353b545194e3.1773820898.git.xiaopei01@kylinos.cn>
TO: Pei Xiao <xiaopei01@kylinos.cn>
TO: shenyang39@huawei.com
TO: broonie@kernel.org
TO: linux-spi@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Pei Xiao <xiaopei01@kylinos.cn>

Hi Pei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on linus/master v7.0-rc4 next-20260318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pei-Xiao/spi-hisi-kunpeng-prevent-infinite-while-loop-in-hisi_spi_flush_fifo/20260318-211321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/d50f1f46b2ee2bba05de9e2d4199353b545194e3.1773820898.git.xiaopei01%40kylinos.cn
patch subject: [PATCH] spi: hisi-kunpeng: prevent infinite while() loop in hisi_spi_flush_fifo
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: s390-randconfig-r072-20260319 (https://download.01.org/0day-ci/archive/20260319/202603192159.S0PIjhlg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603192159.S0PIjhlg-lkp@intel.com/

smatch warnings:
drivers/spi/spi-hisi-kunpeng.c:206 hisi_spi_flush_fifo() warn: should this be 'inner_limit == -1'

vim +206 drivers/spi/spi-hisi-kunpeng.c

c770d8631e1810 Jay Fang 2021-03-27  193  
c770d8631e1810 Jay Fang 2021-03-27  194  static void hisi_spi_flush_fifo(struct hisi_spi *hs)
c770d8631e1810 Jay Fang 2021-03-27  195  {
c770d8631e1810 Jay Fang 2021-03-27  196  	unsigned long limit = loops_per_jiffy << 1;
c770d8631e1810 Jay Fang 2021-03-27  197  
c770d8631e1810 Jay Fang 2021-03-27  198  	do {
e8821f559fed86 Pei Xiao 2026-03-18  199  		unsigned long inner_limit = loops_per_jiffy;
e8821f559fed86 Pei Xiao 2026-03-18  200  
e8821f559fed86 Pei Xiao 2026-03-18  201  		while (hisi_spi_rx_not_empty(hs) && inner_limit--) {
c770d8631e1810 Jay Fang 2021-03-27  202  			readl(hs->regs + HISI_SPI_DOUT);
e8821f559fed86 Pei Xiao 2026-03-18  203  			cpu_relax();
e8821f559fed86 Pei Xiao 2026-03-18  204  		}
e8821f559fed86 Pei Xiao 2026-03-18  205  
e8821f559fed86 Pei Xiao 2026-03-18 @206  		if (!inner_limit) {
e8821f559fed86 Pei Xiao 2026-03-18  207  			dev_warn_ratelimited(hs->dev, "RX FIFO flush timeout\n");
e8821f559fed86 Pei Xiao 2026-03-18  208  			break;
e8821f559fed86 Pei Xiao 2026-03-18  209  		}
e8821f559fed86 Pei Xiao 2026-03-18  210  
c770d8631e1810 Jay Fang 2021-03-27  211  	} while (hisi_spi_busy(hs) && limit--);
e8821f559fed86 Pei Xiao 2026-03-18  212  
e8821f559fed86 Pei Xiao 2026-03-18  213  	if (!limit)
e8821f559fed86 Pei Xiao 2026-03-18  214  		dev_warn_ratelimited(hs->dev, "SPI busy timeout\n");
c770d8631e1810 Jay Fang 2021-03-27  215  }
c770d8631e1810 Jay Fang 2021-03-27  216  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
