Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278484BD34B
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 19:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278792; cv=none; b=RObpGGyI7+XFlCe4Ew6DyZfssuBCyNWhHpkBaa4GNSt0eo54SN/aSCXeuuCoa4tsCqJm6v9IolGEfDgQm8IJp4xaiwfYckXfnjLsBu2mQFfztdhyOFkP5oUoCJ66HTVACYoZWJmNirS7jWSXO1/qVaRbj7W+QkzyCtJSsf2sbuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278792; c=relaxed/simple;
	bh=cdOH0TQFx2/yle8Oxw+LbUiqtgMIOe8sbY3XW9lC+1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GRy0dMvcal/93tZhLuv6oUN5v+OVHqiPdzybGcGsyfmJEQaqQCeRCvk0wzUliJMl6CjdJ5QTk+dAmS7+D0AenI1ySgIkDEe9hXAgTwOWUePQMtwOVy4ZP99/s1IL9/4+/zl+aoflmSuhUBZrPL0tDQ+jFeCYpywptxDe0W63kUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4zrpKXL; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4zrpKXL"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd78so105416f8f.1
        for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790278786; x=1790883586; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVpUm2vxAmiJvxOEbkoDqlOy/q982BD2NVBKlRMKmW4=;
        b=Y4zrpKXLdUCfX8+8n0F1UUbi/SbzQadWAp9ENWrGrsHRnBWJha89pvQu1JGrVYbyrw
         y9vfs62gtjDb8BVEWNU3LdRFTHqPkO+HHLs6YgefcfZFuPZV6HfEEchmA60PIqWtO2i5
         s+K4dMxaiADORQb/thg7eityQUJQY38Uv5LgUk3y2FcYeq/DIehaAOjAhz7dDA87J3IU
         RHdzbNavlL0nS5BPmEk3JPELAlW61yciqcX6rvP/7daaa2uz1Xhvkg9g8lbHYow0y1YH
         KCLT5yx1IYQqwscfdeToHMGpm/iiQ2Ig6wIBz6VeA+yU+6IByNEnbEl69BW7GHtFGOv7
         HMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278786; x=1790883586;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVpUm2vxAmiJvxOEbkoDqlOy/q982BD2NVBKlRMKmW4=;
        b=KUBJb417fJ5TjZzXVNOdwMQ4yt4bKi53tI9+vzNdc7SZV+JWeViw4X13bLLhFVQ9rW
         8b22zUN92jt4En9StisPRxwqsMj6j2P/G6Mcg2vaoeAwvzryLplojB6d/WwEyqDnjZCf
         n7LV1kIGh9+p1ltLHSM4Cq2MKPy51iXFHF82Ij03ayfjSc3fq6dpRtwACNE6HE3pC0mJ
         29N/leu16roh8ya4d6lUXZpFD+oOADSkh6DWSP1OfwJNQn9AWuKmaATTMiz+iMIONGJr
         ne+Kvs2BfJ1Zbjg94O/KUP4FpuPwWecss7+n3YGqpNdLJsr/ntGh889d1A+s10Hb2OTb
         ALRg==
X-Gm-Message-State: AFuF++ljes1Y+SetvxQ6q99oAbmllbOPsdwXZDUfFW8UZNEUVS2Hbvhi
	Weg7x72nDqokWDQl8eHpqDXFOPEdQv23FwLAam5+My+WWNPTB7lB6/YZw2URZzZ6i1schVvn
X-Gm-Gg: AYBFou1QPmDunDUNzBbjjVpR8/AI/U8jP3cDMhmIZq8pAUtlNRCzc7wq3bRteVH283b
	fToSHCrCEN/RXlVyqihBcp13nvcY5w7+G0wPQdZNR79X3pOJo8rSlTxeaTTMrbizH69+2z6QV3U
	QFIt0AGwl5ibr0FhdDvoem1e3fIHSJNr0h68EdMeIyvNIjJ121u1Sk5R4+8rUqhFMBWd2FzyAaE
	VlioWEpHRhGxrcvp4xCFRis+XI4bxHoUCn/dV0TpquzQow17u9jCJOXTYZvf6LzTm5ppBAQ5NU3
	+VngtXTFfGbJ5A2wy4k/i3Tvnc+AHUw8Op7V8qBoSm6isWtF138CFk3FEOR6BWurH78ypK53ZAh
	aE0WL0pNAuVJaavB0ua50zKV6jOhs7Bf0eW3ZLo2axj4qMalJEXfPvdoTjrASRrn9zBGCbgG8wH
	I5y0wdyYyfPWuyVVYkpZMYY6Ev5mucYNwhv76Np0WTMyuBjqrEEN0VEvZ6FwIOS9xHRb8=
X-Received: by 2002:a05:600c:468f:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49fe66f4fc6mr58492795e9.25.1790278785696;
        Thu, 24 Sep 2026 12:39:45 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff023f12esm1758795e9.0.2026.09.24.12.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:39:44 -0700 (PDT)
Date: Thu, 24 Sep 2026 22:39:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/xen/gntdev.c:817 gntdev_get_page() warn: mask and shift to
 zero: expr='(addr & ~(~((1 << 12) - 1))) >> 12'
Message-ID: <202609241805.VsLzGPLn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260924193941.QNQ1AaO2gcs4f0FPQukCqXwKavXguuKEYOi2fbHpdF4@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62f4c998b297cf233997a2b4cd6fc2d2df0319c9
commit: d70242427110123b65c095594eb74a703d3af156 ARM: rework ARM11 CPU selection logic
config: arm-randconfig-r2200-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241805.VsLzGPLn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d70242427110 ("ARM: rework ARM11 CPU selection logic")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609241805.VsLzGPLn-lkp@intel.com/

smatch warnings:
drivers/xen/privcmd.c:488 privcmd_ioctl_mmap_batch() warn: potential user controlled sizeof overflow 'm.num * 8' '0-u32max * 8'
drivers/xen/privcmd.c:495 privcmd_ioctl_mmap_batch() warn: potential user controlled sizeof overflow 'm.num * (4)' '0-u32max * 4'

vim +817 drivers/xen/gntdev.c
   470  static long privcmd_ioctl_mmap_batch(
   471          struct file *file, void __user *udata, int version)
   472  {
   473          struct privcmd_data *data = file->private_data;
   474          int ret;
   475          struct privcmd_mmapbatch_v2 m;
   476          struct mm_struct *mm = current->mm;
   477          struct vm_area_struct *vma;
   478          unsigned long nr_pages;
   479          LIST_HEAD(pagelist);
   480          struct mmap_batch_state state;
   481  
   482          switch (version) {
   483          case 1:
   484                  if (copy_from_user(&m, udata, sizeof(struct privcmd_mmapbatch)))
   485                          return -EFAULT;
   486                  /* Returns per-frame error in m.arr. */
   487                  m.err = NULL;
   488                  if (!access_ok(m.arr, m.num * sizeof(*m.arr)))
                                              ^^^^^^^^^^^^^^^^^^^^^^

   489                          return -EFAULT;
   490                  break;
   491          case 2:
   492                  if (copy_from_user(&m, udata, sizeof(struct privcmd_mmapbatch_v2)))
   493                          return -EFAULT;
   494                  /* Returns per-frame error code in m.err. */
   495                  if (!access_ok(m.err, m.num * (sizeof(*m.err))))
                                              ^^^^^^^^^^^^^^^^^^^^^^^
These integer overflow bugs are from 2012, but I guess your patch exposed
the arm32 build to the zero day bot.  The bugs only affect 32bit systems.

   496                          return -EFAULT;
   497                  break;
   498          default:
   499                  return -EINVAL;
   500          }
   501  
   502          /* If restriction is in place, check the domid matches */
   503          if (data->domid != DOMID_INVALID && data->domid != m.dom)
   504                  return -EPERM;
   505  


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

