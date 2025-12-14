Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E0921B9F6
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 20:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765745927; cv=none; b=MjHuz78m3EEH6nSIeV5a+0+FVsmsJeKtcglDjDPFP8SXhNI5CXeq/86SElB3z3g8ljb2rChhefqGN3EG0GZozn8GTU+ebj7oU0izgtSJQBEkW84cIwSJWG3CGs8IFErxBd4pbdnZDqhgZ8lxRH7Bp6201rT83rdpkDIiPrFYkkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765745927; c=relaxed/simple;
	bh=xEw864mQwwHiR1+4GCxURKiFK7vB18B5Rt94wsM2C48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NGw+v/XTLH7plkdsVPpd32DRf2paCEzJcIVth8P0pga0qUUAKFkWnO+QxFQy77FnqxW3fLKAAisJpgoNAiV/EH0IwRJoK7QUMWvaUsRPOcFz04NZAS+251k2LAGN6n9BkIK9x0phmx5QK0fAhWtrvA0Q6DlQXGYOymV0lbiKrE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TV+QCDeQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TV+QCDeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765745926; x=1797281926;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xEw864mQwwHiR1+4GCxURKiFK7vB18B5Rt94wsM2C48=;
  b=TV+QCDeQed761FfF5ShS9R8YL0riwXG1wuyxCcAunlXKyrLgnZfFCcLF
   YZKpcVJXvxNIpolN3+JOmeg/TggUHHnnyUXZ56PBLT9AxmAVsT7HOOymR
   I/V/IIgPXtLUFDLqQ67KK28ypib3fciyvSwHb/U9MIFZL/wWkH4SkrnA1
   kIsNxwOt1vqr+voF35etDceLK11uRcx2RDaMLtcNiOvkR8lB+LY5uhtFa
   f1J7JhsCFdw0TYqafISgD1YF5omZ5RLx1dBlwl6jBDdI5n7O6MwFy9GZU
   FGgt0Jxe94oVJgz4EiXVBYLWledtxmmBLLDYFKegTMX1xotNTVJdnLdX3
   Q==;
X-CSE-ConnectionGUID: PmPkgk0MQ9K4Pc+OcEAw7Q==
X-CSE-MsgGUID: wFafAgryQjOWJPU/ZWn56g==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="77969043"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="77969043"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 12:58:46 -0800
X-CSE-ConnectionGUID: Y/5boJyvQf2VxUeacRECVg==
X-CSE-MsgGUID: /LaSlAidRDeJuvM6+dgJkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="228632632"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Dec 2025 12:58:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUtAv-000000009Nv-3mj4;
	Sun, 14 Dec 2025 20:58:41 +0000
Date: Mon, 15 Dec 2025 04:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v3 08/10] crypto: virtio: Add IV buffer in structure
 virtio_crypto_sym_request
Message-ID: <202512150407.x3ykpctZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251209022258.4183415-9-maobibo@loongson.cn>
References: <20251209022258.4183415-9-maobibo@loongson.cn>
TO: Bibo Mao <maobibo@loongson.cn>
TO: Gonglei <arei.gonglei@huawei.com>
TO: "Michael S . Tsirkin" <mst@redhat.com>
TO: Jason Wang <jasowang@redhat.com>
TO: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
TO: "Eugenio Pérez" <eperezma@redhat.com>
TO: Herbert Xu <herbert@gondor.apana.org.au>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
CC: kvm@vger.kernel.org
CC: linux-crypto@vger.kernel.org
CC: virtualization@lists.linux.dev
CC: linux-kernel@vger.kernel.org

Hi Bibo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 67a454e6b1c604555c04501c77b7fedc5d98a779]

url:    https://github.com/intel-lab-lkp/linux/commits/Bibo-Mao/crypto-virtio-Add-spinlock-protection-with-virtqueue-notification/20251209-143031
base:   67a454e6b1c604555c04501c77b7fedc5d98a779
patch link:    https://lore.kernel.org/r/20251209022258.4183415-9-maobibo%40loongson.cn
patch subject: [PATCH v3 08/10] crypto: virtio: Add IV buffer in structure virtio_crypto_sym_request
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: um-randconfig-r064-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150407.x3ykpctZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512150407.x3ykpctZ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/virtio/virtio_crypto_skcipher_algs.c:35:9-11: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +35 drivers/crypto/virtio/virtio_crypto_skcipher_algs.c

d31e712302c7d5 drivers/crypto/virtio/virtio_crypto_algs.c          Zeng, Xin 2017-06-23  26  
d31e712302c7d5 drivers/crypto/virtio/virtio_crypto_algs.c          Zeng, Xin 2017-06-23  27  struct virtio_crypto_sym_request {
d31e712302c7d5 drivers/crypto/virtio/virtio_crypto_algs.c          Zeng, Xin 2017-06-23  28  	struct virtio_crypto_request base;
1d77e24d235436 drivers/crypto/virtio/virtio_crypto_skcipher_algs.c Bibo Mao  2025-12-09  29  	struct virtio_crypto_op_data_req req_data;
d31e712302c7d5 drivers/crypto/virtio/virtio_crypto_algs.c          Zeng, Xin 2017-06-23  30  
d31e712302c7d5 drivers/crypto/virtio/virtio_crypto_algs.c          Zeng, Xin 2017-06-23  31  	/* Cipher or aead */
d31e712302c7d5 drivers/crypto/virtio/virtio_crypto_algs.c          Zeng, Xin 2017-06-23  32  	uint32_t type;
d31e712302c7d5 drivers/crypto/virtio/virtio_crypto_algs.c          Zeng, Xin 2017-06-23  33  	/* Encryption? */
d31e712302c7d5 drivers/crypto/virtio/virtio_crypto_algs.c          Zeng, Xin 2017-06-23  34  	bool encrypt;
18ebcb370853ad drivers/crypto/virtio/virtio_crypto_skcipher_algs.c Bibo Mao  2025-12-09 @35  	uint8_t iv[0];
d31e712302c7d5 drivers/crypto/virtio/virtio_crypto_algs.c          Zeng, Xin 2017-06-23  36  };
d31e712302c7d5 drivers/crypto/virtio/virtio_crypto_algs.c          Zeng, Xin 2017-06-23  37  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
