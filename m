Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A8D14AD30
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jun 2024 19:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717528241; cv=none; b=YsyFCSgi4sbRzhJJUZXxw8sugE9XvvPA2La0O8NoVWaX1IQmN6R8/SFyF+QxVVMprcS8FC7cGoVnU7VtQMXAOPEFqZFOaCW6dNon+nthHMkmbZSAUz7hXpP1t4qMzxAot0F+LHEOGzHh/0JpHJ0V9e7FpjzlWT5IGp2hFkrbvnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717528241; c=relaxed/simple;
	bh=6WRhNvMputCmUE8KuRCNypytBhygsDlUsvmXPlqiqT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MGSo1gBXTvNitxatG0BqisP8ZIVBj6DBHa/IOP0qU+UB4t91cpXHIFcAqTHvje6Dk1I6lKU6I2GuEnkYkTWPeuUch0hjHS8V+RMZWf06puxw8EJh/1vycbQgiHmsiPURvjjmFx3G7NwC4/ma6ClzZkvCWU4e7nMWPwTC2SB5Yao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MoPuRkzw; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MoPuRkzw"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57a2ed9af7dso6609088a12.1
        for <oe-kbuild@lists.linux.dev>; Tue, 04 Jun 2024 12:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717528238; x=1718133038; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uzA8SRe4whRjxMfh3T9fimsp/JqPLwi91HrTpjRxV+U=;
        b=MoPuRkzw17CKCjeCITpTrDlOO2ztjRWTUIGYrdtnhwDRd1Xbpn7ynULd+xxblmx3NB
         3txM/Zl5DEraPoi0nlx+ZNcrRTwNo0+QBCSvZXNs/jS/1YPIeDJFhk7Y1LBOeAmBGwBB
         UUheieGLmyex8ZXUOiDhQL/WYkLs1d9N097yCSuDRJ1E6M7c9g9F+bpt9bG88ABg4Mym
         8cfoK7LP7YyvGtG9DMPQdVbIS+ZfFUNFZ6mXo/0WX44tB57ue2tK4NhWGonPku0bmS+p
         LQ2zaDKl/eFqlmxXi77vkRP8fjAIoRO5io4vED7LVXJPINh3Akt6sFwAIXgWW24YJ/UH
         FUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717528238; x=1718133038;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzA8SRe4whRjxMfh3T9fimsp/JqPLwi91HrTpjRxV+U=;
        b=Sdgu6X/zFN7av0qW24PKUD3ygx84RAaidaCtzDnSigXqjbC9Ru1a+W2gJN4q7w5Xc5
         FZdlUY6j73huUWwy9G3c/FBk4k6DhbCqQyichreJ1JHum4tyunKfApAZ6I8NnP40Rt1b
         dme0G0xArPeIzYExJAnGt7lOhUFM/kEZDvac/Kw2XMYGjn7CERHcopxNjwGn4TBLJCks
         YN17cNYYSHf/eHW63tWwhWEI5e15+P/QrZjyV8OqXELDJvItbZTNirRHjAkRHbahGQ2k
         3Bjgzetw1OflM3VoS/bQqQ3Q4Xi0+7X8ghEmsDREgr0FzDMVEV2mjJ0H5euFZUEQGBh1
         WAew==
X-Gm-Message-State: AOJu0YxTR2OXyktE+COFXKS0Ql2hyfDp6uPx+KBnB5c9Z0j50XQZGJid
	NiPHppxYHUPT0irBAMlF72IuI6n8aQXgwm2pL0ev3od2uF/lBCV+Cb7QjizOVu9yKEyVosDjkwF
	+
X-Google-Smtp-Source: AGHT+IGlsLGfRHK0f6DmqF44S64KIFY4M3R+3mRgGUK5rWCZG7z77L7iKZ+bC3jDwWK1rj3XV48eRQ==
X-Received: by 2002:a50:d4db:0:b0:57a:242e:806b with SMTP id 4fb4d7f45d1cf-57a8b6acd8emr362804a12.18.1717528237801;
        Tue, 04 Jun 2024 12:10:37 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31bb825esm7847800a12.32.2024.06.04.12.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 12:10:37 -0700 (PDT)
Date: Tue, 4 Jun 2024 22:10:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hyeonwoo Cha <chw1119@hanyang.ac.kr>,
	david.sterba@suse.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, aivazian.tigran@gmail.com,
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
	tytso@mit.edu, adilger.kernel@dilger.ca,
	hirofumi@mail.parknet.co.jp, sfr@canb.auug.org.au,
	chw1119@hanyang.ac.kr, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org,
	reiserfs-devel@vger.kernel.org
Subject: Re: [PATCH v2] Fix issue in mark_buffer_dirty_inode
Message-ID: <97ac9280-4c7b-4466-9cb8-2a81882f0b80@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604060636.87652-1-chw1119@hanyang.ac.kr>

Hi Hyeonwoo,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hyeonwoo-Cha/Fix-issue-in-mark_buffer_dirty_inode/20240604-140958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20240604060636.87652-1-chw1119%40hanyang.ac.kr
patch subject: [PATCH v2] Fix issue in mark_buffer_dirty_inode
config: i386-randconfig-141-20240604 (https://download.01.org/0day-ci/archive/20240605/202406050218.U7c0DL3C-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406050218.U7c0DL3C-lkp@intel.com/

smatch warnings:
fs/buffer.c:673 mark_buffer_dirty_fsync() warn: if statement not indented
fs/buffer.c:682 mark_buffer_dirty_fsync() warn: inconsistent indenting

vim +673 fs/buffer.c

73295b4ed00de6 Hyeonwoo Cha            2024-06-04  667  void mark_buffer_dirty_fsync(struct buffer_head *bh, struct address_space *mapping)
^1da177e4c3f41 Linus Torvalds          2005-04-16  668  {
abc8a8a2c7dc7b Matthew Wilcox (Oracle  2022-12-15  669) 	struct address_space *buffer_mapping = bh->b_folio->mapping;
^1da177e4c3f41 Linus Torvalds          2005-04-16  670  
^1da177e4c3f41 Linus Torvalds          2005-04-16  671  	mark_buffer_dirty(bh);
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  672  
73295b4ed00de6 Hyeonwoo Cha            2024-06-04 @673  	if (bh->b_assoc_map)
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  674          return;

The code is okay, but the indenting is messed up.

73295b4ed00de6 Hyeonwoo Cha            2024-06-04  675  
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  676) 	if (!mapping->i_private_data) {
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  677)     	mapping->i_private_data = buffer_mapping;
^1da177e4c3f41 Linus Torvalds          2005-04-16  678      } else {
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  679)         BUG_ON(mapping->i_private_data != buffer_mapping);
^1da177e4c3f41 Linus Torvalds          2005-04-16  680      }
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  681  
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17 @682)     spin_lock(&buffer_mapping->i_private_lock);
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  683      list_move_tail(&bh->b_assoc_buffers, &mapping->i_private_list);
58ff407bee5a55 Jan Kara                2006-10-17  684      bh->b_assoc_map = mapping;
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  685)     spin_unlock(&buffer_mapping->i_private_lock);
^1da177e4c3f41 Linus Torvalds          2005-04-16  686  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

