Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4751E888
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Apr 2024 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711975809; cv=none; b=Lt4/NEgcngccMs0CxoAVRRtk1jtATmLD3RuPpKTFKEz03C9sB68HblGPNxsJosQktOsYgy5HOuRT5hLcOK1w5p/Crz3XC05/43ua8CZh6BAZKgxZy+TE1Nv9cv/WFgVUc8S24J0JYe2CkFkPbef5fE/ZFc95ggfyQ4THKRss1RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711975809; c=relaxed/simple;
	bh=8vRx4uhhz/auTSFBTv5dZoYJqNKslLSKFRxBUd5nmkc=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=pj0eDzFTYZXmxX91FDht7Okm2I6verKGGcp8Ud3H6mUq1OB7kJsl7qM7AzV1JmyDwBoCV5TFFaRDGRADxkTjy4bhmeCDhCKRWTZx673fqtijdMXSr0dTZxBh/A3Y3klom7mGMJTYPEXLvjNscezbeKZja7rSz0lySjYFHJGosYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=MjbNnoc3; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="MjbNnoc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ya6XvcvBQxWb0T/GFLxYjENgak195KLQfVn7jeo0lnI=;
  b=MjbNnoc3ql4vD4Vv0iPGV3RzP45uYatvrWvc+x1pjTnMoAJh/J58WU4p
   SAA0ErJD5A8UMgYulabGpQbIcCslx0kNeEq1JNPrEr/eTXTcyLlw7qSM4
   WDB5cTmGU4yJRecycrib+T6QfQTG3CU2Iicebi7qWJBLjw+wKNvUzpr92
   M=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.07,172,1708383600"; 
   d="scan'208";a="159339678"
Received: from 71-51-181-183.chvl.centurylink.net (HELO hadrien) ([71.51.181.183])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 14:49:56 +0200
Date: Mon, 1 Apr 2024 08:49:55 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
cc: oe-kbuild@lists.linux.dev
Subject: Re: [RFC PATCH 5/8] drm/ttm: Add a virtual base class for graphics
 memory backup (fwd)
Message-ID: <2b64b9e6-f28e-29ee-1ea4-5df16a6c356@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1628280104-1711975797=:3182"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1628280104-1711975797=:3182
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

Reference after free at the end of the function.

---------- Forwarded message ----------
Date: Mon, 1 Apr 2024 20:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [RFC PATCH 5/8] drm/ttm: Add a virtual base class for graphics
    memory backup

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240329145707.3087-6-thomas.hellstrom@linux.intel.com>
References: <20240329145707.3087-6-thomas.hellstrom@linux.intel.com>
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>

Hi Thomas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-misc/drm-misc-next drm-xe/drm-xe-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.9-rc2 next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240329-230014
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20240329145707.3087-6-thomas.hellstrom%40linux.intel.com
patch subject: [RFC PATCH 5/8] drm/ttm: Add a virtual base class for graphics memory backup
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-103-20240401 (https://download.01.org/0day-ci/archive/20240401/202404012026.OqsAS9KJ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404012026.OqsAS9KJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/ttm/ttm_backup_shmem.c:130:18-25: ERROR: reference preceded by free on line 129

vim +130 drivers/gpu/drm/ttm/ttm_backup_shmem.c

73db80e5206ba1 Thomas Hellström 2024-03-29  109
73db80e5206ba1 Thomas Hellström 2024-03-29  110  /**
73db80e5206ba1 Thomas Hellström 2024-03-29  111   * ttm_backup_shmem_create() - Create a shmem-based struct backup.
73db80e5206ba1 Thomas Hellström 2024-03-29  112   * @size: The maximum size (in bytes) to back up.
73db80e5206ba1 Thomas Hellström 2024-03-29  113   *
73db80e5206ba1 Thomas Hellström 2024-03-29  114   * Create a backup utilizing shmem objects.
73db80e5206ba1 Thomas Hellström 2024-03-29  115   *
73db80e5206ba1 Thomas Hellström 2024-03-29  116   * Return: A pointer to a struct ttm_backup on success,
73db80e5206ba1 Thomas Hellström 2024-03-29  117   * an error pointer on error.
73db80e5206ba1 Thomas Hellström 2024-03-29  118   */
73db80e5206ba1 Thomas Hellström 2024-03-29  119  struct ttm_backup *ttm_backup_shmem_create(loff_t size)
73db80e5206ba1 Thomas Hellström 2024-03-29  120  {
73db80e5206ba1 Thomas Hellström 2024-03-29  121  	struct ttm_backup_shmem *sbackup =
73db80e5206ba1 Thomas Hellström 2024-03-29  122  		kzalloc(sizeof(*sbackup), GFP_KERNEL | __GFP_ACCOUNT);
73db80e5206ba1 Thomas Hellström 2024-03-29  123
73db80e5206ba1 Thomas Hellström 2024-03-29  124  	if (!sbackup)
73db80e5206ba1 Thomas Hellström 2024-03-29  125  		return ERR_PTR(-ENOMEM);
73db80e5206ba1 Thomas Hellström 2024-03-29  126
73db80e5206ba1 Thomas Hellström 2024-03-29  127  	sbackup->filp = shmem_file_setup("ttm shmem backup", size, 0);
73db80e5206ba1 Thomas Hellström 2024-03-29  128  	if (IS_ERR(sbackup->filp)) {
73db80e5206ba1 Thomas Hellström 2024-03-29 @129  		kfree(sbackup);
73db80e5206ba1 Thomas Hellström 2024-03-29 @130  		return ERR_CAST(sbackup->filp);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
--8323329-1628280104-1711975797=:3182--
