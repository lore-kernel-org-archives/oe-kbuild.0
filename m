Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC3A2EF677
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 08:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764499; cv=none; b=OuKqPFLpVCOkvIo1Hp/YQKjXbOFgQSJUvr96XaVHVYLZsrz9YWFAx0oB5gqFXpyMm6o1XNaNJJtyP+ggfWSWYunjcF96ew0LlFj+1YnXAkagpwqR1oanaA+AyBpqQL4l3vBXNPWsOZ0idW0LobMEVWDNPWK1l0pMzmdGr19StTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764499; c=relaxed/simple;
	bh=JXocULCsBo7/n98cmVoNOqykInxPZnjLVNBTREPdg0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=k1EEZ+6SM1n6lrgHx9yLOGpJ/WwX8iaAtt+3M63vWJ5pzmy+1O6E9xZjyrrbwory1YpoXWKdQkHEJSLPGeriXs7RCbDLC2VP26gWcG5/UArT6YoHkBHooHtk2kykLG6KmI3dzQx+9PeUXZNbsng+yBas8/mIxHcrcoEyX5iKGBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZTGzCfrv; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZTGzCfrv"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b9a342e8ffso490461f8f.0
        for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 01:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755764494; x=1756369294; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6F9MVHoGttGvZi9mtKapX8wE+xXVK++WzjAWqNNFy5w=;
        b=ZTGzCfrvKt0HeAyT6xDn75pgEIymlJqfCl5gNokcdZ5zqnOWu8RbECK+Ujj1ZT/p9s
         ghOaIAlPOL4Ec2T511HIptARbchaQXWOlJGwMdBXRvsKb2QT2NqIjj18H1fvYCq8a+NP
         a+56l1As21WZhgkVwqQd/7U+54VbxBMAvcVU4vnZ07PMzDavd6MAHimD7udZmHuvCwOz
         uIYvLMUulY+4MUxjdBnycMIfPUa04wCwBW8ogjJuKyWwzgIcwzSqT9YUKtjzb6gNw8It
         Z1181RRqdVtMnJyZpQ23Yl0PVBvpRi6kKwRjcZaQaM62e6GC74XvI8vluCOT8dxTlRWo
         hjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764494; x=1756369294;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6F9MVHoGttGvZi9mtKapX8wE+xXVK++WzjAWqNNFy5w=;
        b=VPOMEAWn4agyEfszQ5V8S7WjOVTGS0nl/q6XNkU2fhDeHpstqPIZB+fHtvvppLOFFw
         Y6oEy7qshfB04ekVfOt05YrDLioVl2IWa8GgDk3Iqv9oJCXvdv5xCVBJP5uFyTcLtfJe
         rGkGYpXHToOWnhC1ZcQfU0DVz0Z+CDezc3uHjSEEuthjL7qPWqekzy2xqzLDAzw7R1ub
         /c5OFr0Z/oJqO/euZ4xWda8QgxwBa4DTexWE0XZ/LBvTNU0CyNvxcHSe0BdGdTMLhFv7
         8oHHgRIO7fY+sAqUY1quggBqSAD/e+arMna5T+MoRocC07BNNR3CSEs7k7FptzVu9T6I
         Iqsg==
X-Gm-Message-State: AOJu0Yx7S7XZUF/ZOeVnomnrBr3G/YUrIzaC/5UnNlO5aFKGZQub2y9v
	2gyVh+w+424WSxzkf9mX4vBt1yVCuGyWGEulmSzwrUssXNM75TRISjR67FnDSFN4NGS9bUTrGQZ
	84WSl
X-Gm-Gg: ASbGnctaFpENm2N5ye9xT4tkX0eHHlKm/k1nFQZPu5UGBySr8frT7IHDNwM+8tmtrce
	ESWfFcg3d10sPDlmzPfTeF+47PKPrv1EfLK+6IBq7Mrh1R3YQI53pLuG8qFQ8BH0cB8B/ZBkuN8
	NKsarNXUkJbwmls8dwhQOx1iag9GVYHhubmkSuQnb4LbV0oN8qfyGkZa6jbuxLIkSgkw/xOOwEI
	BJn+5DhwzKMg5PrExP6/46YOx4+tTRLqT2dcugZyjTzR6EM5s0W6LdcB7Lg3s1p1f/O0ECgVFdM
	ub6nlV5sYjIBZUVzBf4q4BHVRyyW5akPqYWLpEHM/NS8J+iIM+PpX6fHsCMPu08mvF2B9YC6xep
	cV9+R6kg8te+JlrxbhXiVzyU1qBY=
X-Google-Smtp-Source: AGHT+IEEH9J16IEfY7X5Ab8U3awn2/tTG/DyRWYmbtluKFWJrwnSi/zTjuUtoKU2yasvK1jGjM/f0A==
X-Received: by 2002:a05:6000:2911:b0:3b7:9d87:9808 with SMTP id ffacd0b85a97d-3c4b0445cbcmr1346807f8f.15.1755764494525;
        Thu, 21 Aug 2025 01:21:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c07487986fsm11782149f8f.1.2025.08.21.01.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:21:34 -0700 (PDT)
Date: Thu, 21 Aug 2025 11:21:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sun YangKai <sunk67188@gmail.com>,
	linux-btrfs@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Sun YangKai <sunk67188@gmail.com>
Subject: Re: [PATCH] btrfs: more trivial BTRFS_PATH_AUTO_FREE conversions
Message-ID: <202508211534.QmDKCbTm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819033819.19826-1-sunk67188@gmail.com>
Message-ID: <20250821082130.Q64gnlCUMyBY70uQJKaCnu1UDQxzmX1cztsPvTQgsIA@z>

Hi Sun,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sun-YangKai/btrfs-more-trivial-BTRFS_PATH_AUTO_FREE-conversions/20250819-114252
base:   v6.17-rc2
patch link:    https://lore.kernel.org/r/20250819033819.19826-1-sunk67188%40gmail.com
patch subject: [PATCH] btrfs: more trivial BTRFS_PATH_AUTO_FREE conversions
config: parisc-randconfig-r071-20250821 (https://download.01.org/0day-ci/archive/20250821/202508211534.QmDKCbTm-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508211534.QmDKCbTm-lkp@intel.com/

smatch warnings:
fs/btrfs/send.c:931 get_inode_info() warn: missing error code? 'ret'

vim +/ret +931 fs/btrfs/send.c

7e93f6dc11d9128 BingJing Chang  2022-08-12  908  static int get_inode_info(struct btrfs_root *root, u64 ino,
7e93f6dc11d9128 BingJing Chang  2022-08-12  909  			  struct btrfs_inode_info *info)
31db9f7c23fbf7e Alexander Block 2012-07-25  910  {
31db9f7c23fbf7e Alexander Block 2012-07-25  911  	int ret;
c8ce1e5fe626333 Sun YangKai     2025-08-19  912  	BTRFS_PATH_AUTO_FREE(path);
31db9f7c23fbf7e Alexander Block 2012-07-25  913  	struct btrfs_inode_item *ii;
31db9f7c23fbf7e Alexander Block 2012-07-25  914  	struct btrfs_key key;
31db9f7c23fbf7e Alexander Block 2012-07-25  915  
7e93f6dc11d9128 BingJing Chang  2022-08-12  916  	path = alloc_path_for_send();
7e93f6dc11d9128 BingJing Chang  2022-08-12  917  	if (!path)
7e93f6dc11d9128 BingJing Chang  2022-08-12  918  		return -ENOMEM;
7e93f6dc11d9128 BingJing Chang  2022-08-12  919  
31db9f7c23fbf7e Alexander Block 2012-07-25  920  	key.objectid = ino;
31db9f7c23fbf7e Alexander Block 2012-07-25  921  	key.type = BTRFS_INODE_ITEM_KEY;
31db9f7c23fbf7e Alexander Block 2012-07-25  922  	key.offset = 0;
31db9f7c23fbf7e Alexander Block 2012-07-25  923  	ret = btrfs_search_slot(NULL, root, &key, path, 0, 0);
31db9f7c23fbf7e Alexander Block 2012-07-25  924  	if (ret) {
3f8a18cc53bd1be Josef Bacik     2014-03-28  925  		if (ret > 0)
31db9f7c23fbf7e Alexander Block 2012-07-25  926  			ret = -ENOENT;
c8ce1e5fe626333 Sun YangKai     2025-08-19  927  		return ret;
31db9f7c23fbf7e Alexander Block 2012-07-25  928  	}
31db9f7c23fbf7e Alexander Block 2012-07-25  929  
7e93f6dc11d9128 BingJing Chang  2022-08-12  930  	if (!info)
c8ce1e5fe626333 Sun YangKai     2025-08-19 @931  		return ret;

ret is zero, but it should be an error code.

7e93f6dc11d9128 BingJing Chang  2022-08-12  932  
31db9f7c23fbf7e Alexander Block 2012-07-25  933  	ii = btrfs_item_ptr(path->nodes[0], path->slots[0],
31db9f7c23fbf7e Alexander Block 2012-07-25  934  			struct btrfs_inode_item);
7e93f6dc11d9128 BingJing Chang  2022-08-12  935  	info->size = btrfs_inode_size(path->nodes[0], ii);
7e93f6dc11d9128 BingJing Chang  2022-08-12  936  	info->gen = btrfs_inode_generation(path->nodes[0], ii);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

