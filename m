Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C988923EA86
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Oct 2025 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760637549; cv=none; b=fQVkfDeNAS23e6NaBVDDe9nbSiaHRvh6rkp39almz1VPJP2s+vBJPpj/UkOPmLw+qbV8taFkqS35htiNrxaN2amKEj1GsYsCaDYbOwifb6JwB7Zm6xOO8fLB2u66LxrQPnKbhjEvlT5C+Zn6OWPK2Y6qOVAWz+luo1zEzys34Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760637549; c=relaxed/simple;
	bh=vZiHA8Y6AfsK9IF3c2KBtymTA2sTHdPbid5+P3xm/ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QGEiyZvfDHL/98fDwTQK4viImuJgyZGPehbll1mdCmuEUpCSMcbyttf5ce4yPygcDKvkz8HNzFIVOntMg4sdt6SCepZJum6/u1z23loKsf3f/haky28UVoY/DCFn3DxPV/SdjIEKROwSlBk6fsjKhm+lQhll/7Hfn3QWDmMNyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VPfcLCr+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VPfcLCr+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46b303f755aso11308625e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 16 Oct 2025 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760637544; x=1761242344; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5VBbCb5Q+IqNb5arOkvExMS59Z+aWDiwCrWUaHKJ2ko=;
        b=VPfcLCr+t2H1QymuolisLr4ck5+wu85nOn613ol7XoWRsNB+/uMRpRtjaGWsAgtcvn
         AzcN7t4Zesb4ndGLqe+Paw/HEkFh3/gVIMJgzKoy6MplwH9TAQDISTnNlbW+ftpvMyQO
         9AUtvveSXBlo222T2dVotuLJJQ36AI/ogv/n5exMHmreu8Y3qeqOTEzTWTpMF5uuEtuL
         7jG8te/bqyFBt0SklJrd2WQdP6D6XQ63sSElmvjjbtdOaSRhl9X9TO74si9umSPb6Gpm
         9I7SnPJZhUuXSf2x4OZZnx95xdVDwxEEuDsPmLYO/Chfw/qsgTLmXFG2Zth8Onou7Ra6
         4QfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760637544; x=1761242344;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VBbCb5Q+IqNb5arOkvExMS59Z+aWDiwCrWUaHKJ2ko=;
        b=gARNmslHu0YadBT64lod5f1T+oVxFs1jBMBQaF0anah6VNR5my0pxEGO2eKQvsK0qi
         F3v+3GjgxHR0EWIi/ZN/ASscSjpXVhFbecSIpbSKoIBf+WxuLl70lRkJPwvEgcha3+cb
         AmniNFdWR4zGDMc2LbMLb9oxbhPm4+wxvr0Q9SPZ1VlZPsntT212JWzxIVpGr8dAV0xT
         AV2yQToxYq9fUrH8kasnhCSz9px3ZaLUtDzdgLtCz82d+OV2+XegWwW4Zjt4j9iNQNJy
         gbpfoRUtkjOFJFT9MHrOuOxlKg5wyYhOOfX21Pw/1uBFKps0YEhBqT0Z8Y+8MoazYWYH
         TD4Q==
X-Gm-Message-State: AOJu0YyZTDgosFUj85CCWXBtT+Rh4kXT/a/pGrzJHLipKVGXBc5Feu/h
	EBIDJywpoau15Qi+ET1naBlmXRhuyo90B/RgoUePK+xvSXcohRWS13iqDdrH02clHC5/HCZSj88
	SACE0
X-Gm-Gg: ASbGncvoVnHEY3uS67CFmKbiZN6Fzc4SrcUyR6pL1O8CJjFWLHldf5ArgAS+e20Xxmp
	Yza4bjoE/L1ANK6XR/pkE8ZnaPbhf5e945zZnb0L7rjfVKi5hwSEzx7BwfocPZ7ZSkmkUpQkQHy
	fsvKpslQiHD4NVzGic/xWnrUqlGon4zIV0lDQovvzcRQAPJTSJDqtjKURxTcn5rded8QLbhMDDR
	reslXVkh8ENuNN1Ub80eFVO80XyhPWlGGdVursrTKMllfxObuSlLVsk5HfMN+EsvpzR33hBd/NH
	kFvI4zKKfg9XQ271iHxC5Sv6nCZdsWRFO6COG9NRqUAP7srGytqPRYJOCrOTS1VIMsBNSG7HIfW
	KIBGjZYCd8S4LQz/8sef8qoJ24woQ7kH4vFnyMGsHZp9QwUt/MFzjwcHCyXPoRRGtq4pjpUNcaM
	BXUj5FSu+3kzNXUpxspP3LzyCzAls=
X-Google-Smtp-Source: AGHT+IGNC4j+STHgH8JMZXaAiTHwQ+buEodAeaVzalRybmL2VUhCMjzU9+Zk9Y0sAYL9ikB7GrJ2sw==
X-Received: by 2002:a05:600c:4507:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-4711787276dmr7996365e9.4.1760637543660;
        Thu, 16 Oct 2025 10:59:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471144239f4sm40779015e9.2.2025.10.16.10.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 10:59:03 -0700 (PDT)
Date: Thu, 16 Oct 2025 20:58:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	syzbot <syzbot+3e58a7dc1a8c00243999@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	kartikey406@gmail.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: Forwarded: [PATCH] ntfs3: add debug warnings for run_lock
 initialization
Message-ID: <202510170051.yMGKcZjz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68ee38b5.050a0220.ac43.00fd.GAE@google.com>
Message-ID: <20251016175859.fp0jhNK9WI0-puBfvGvaK6GLvGvmgaqPENrK-v0toW8@z>


Hi syzbot,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/syzbot/Forwarded-PATCH-ntfs3-add-debug-warnings-for-run_lock-initialization/20251014-195051
base:   v6.18-rc1
patch link:    https://lore.kernel.org/r/68ee38b5.050a0220.ac43.00fd.GAE%40google.com
patch subject: Forwarded: [PATCH] ntfs3: add debug warnings for run_lock initialization
config: i386-randconfig-141-20251015 (https://download.01.org/0day-ci/archive/20251017/202510170051.yMGKcZjz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510170051.yMGKcZjz-lkp@intel.com/

smatch warnings:
fs/ntfs3/inode.c:590 ntfs_iget5() warn: variable dereferenced before IS_ERR check 'inode' (see line 590)

vim +/inode +590 fs/ntfs3/inode.c

82cae269cfa9530 Konstantin Komarov 2021-08-13  562  struct inode *ntfs_iget5(struct super_block *sb, const struct MFT_REF *ref,
82cae269cfa9530 Konstantin Komarov 2021-08-13  563                           const struct cpu_str *name)
82cae269cfa9530 Konstantin Komarov 2021-08-13  564  {
82cae269cfa9530 Konstantin Komarov 2021-08-13  565      struct inode *inode;
9ca11d2cd5f563e syzbot             2025-10-14  566      unsigned long ino = ino_get(ref);
82cae269cfa9530 Konstantin Komarov 2021-08-13  567      
9ca11d2cd5f563e syzbot             2025-10-14  568      if (ino == 25) {
9ca11d2cd5f563e syzbot             2025-10-14  569          printk(KERN_ERR "DEEPANSHU: ntfs_iget5 START for inode 25\n");
9ca11d2cd5f563e syzbot             2025-10-14  570          //dump_stack();
9ca11d2cd5f563e syzbot             2025-10-14  571      }
9ca11d2cd5f563e syzbot             2025-10-14  572      
9ca11d2cd5f563e syzbot             2025-10-14  573      inode = iget5_locked(sb, ino, ntfs_test_inode, ntfs_set_inode,
82cae269cfa9530 Konstantin Komarov 2021-08-13  574                           (void *)ref);
9ca11d2cd5f563e syzbot             2025-10-14  575      
82cae269cfa9530 Konstantin Komarov 2021-08-13  576      if (unlikely(!inode))
82cae269cfa9530 Konstantin Komarov 2021-08-13  577          return ERR_PTR(-ENOMEM);
82cae269cfa9530 Konstantin Komarov 2021-08-13  578      
9ca11d2cd5f563e syzbot             2025-10-14  579      if (inode->i_ino == 25) {
9ca11d2cd5f563e syzbot             2025-10-14  580          printk(KERN_ERR "DEEPANSHU: After iget5_locked for inode 25, I_NEW=%d, i_state=0x%x\n", 
9ca11d2cd5f563e syzbot             2025-10-14  581                 !!(inode->i_state & I_NEW), inode->i_state);
9ca11d2cd5f563e syzbot             2025-10-14  582          //dump_stack();
9ca11d2cd5f563e syzbot             2025-10-14  583      }
9ca11d2cd5f563e syzbot             2025-10-14  584      
82cae269cfa9530 Konstantin Komarov 2021-08-13  585      /* If this is a freshly allocated inode, need to read it now. */
9ca11d2cd5f563e syzbot             2025-10-14  586      if (inode->i_state & I_NEW) {
9ca11d2cd5f563e syzbot             2025-10-14  587          if (inode->i_ino == 25)
9ca11d2cd5f563e syzbot             2025-10-14  588              printk(KERN_ERR "DEEPANSHU: Calling ntfs_read_mft for inode 25\n");
82cae269cfa9530 Konstantin Komarov 2021-08-13  589          inode = ntfs_read_mft(inode, name, ref);
9ca11d2cd5f563e syzbot             2025-10-14 @590          if (inode->i_ino == 25 && IS_ERR(inode))
                                                                ^^^^^^^^^^^^                 ^^^^^
"inode" dereferenced before an IS_ERR() check...

9ca11d2cd5f563e syzbot             2025-10-14  591              printk(KERN_ERR "DEEPANSHU: ntfs_read_mft FAILED for inode 25\n");
9ca11d2cd5f563e syzbot             2025-10-14  592      } else if (ref->seq != ntfs_i(inode)->mi.mrec->seq) {
9ca11d2cd5f563e syzbot             2025-10-14  593          if (inode->i_ino == 25)
9ca11d2cd5f563e syzbot             2025-10-14  594              printk(KERN_ERR "DEEPANSHU: inode 25 seq mismatch\n");
1fd21919de6de24 Konstantin Komarov 2024-08-22  595          iput(inode);
1fd21919de6de24 Konstantin Komarov 2024-08-22  596          inode = ERR_PTR(-ESTALE);
9ca11d2cd5f563e syzbot             2025-10-14  597      } else if (inode->i_ino == 25) {
9ca11d2cd5f563e syzbot             2025-10-14  598          printk(KERN_ERR "DEEPANSHU: inode 25 found in CACHE, skipping ntfs_read_mft!\n");
9ca11d2cd5f563e syzbot             2025-10-14  599          //dump_stack();
82cae269cfa9530 Konstantin Komarov 2021-08-13  600      }
82cae269cfa9530 Konstantin Komarov 2021-08-13  601  
1fd21919de6de24 Konstantin Komarov 2024-08-22  602      if (IS_ERR(inode))
0e8235d28f3a0e9 Konstantin Komarov 2022-10-10  603          ntfs_set_state(sb->s_fs_info, NTFS_DIRTY_ERROR);
0e8235d28f3a0e9 Konstantin Komarov 2022-10-10  604  
82cae269cfa9530 Konstantin Komarov 2021-08-13  605      return inode;
82cae269cfa9530 Konstantin Komarov 2021-08-13  606  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

