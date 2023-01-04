Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC01DA57;
	Wed,  4 Jan 2023 11:59:29 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id g10so11579730wmo.1;
        Wed, 04 Jan 2023 03:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wQ7g43yeFEdHpj10PompOYHIr0cHFQF71QMr+oMaves=;
        b=G1LgyYFT/Lkivs2XYaRTUJ80unLJrliTTqQuLIwNA5tQS3byAdibus/57RD4JPCw1J
         5VBifp0LSHdJGcDSTYZICOles4jG41ih1M5d9+eqgbVy16YvmhOaQ/Lsht4r1Byyq2s7
         sXyINieCS7SqDa694VtWHIwHKHwf3SQcEaJwIZ6gtHiFbO/ZUxMkXRx2OSlcteGSj6x/
         Tz8JvhP/r0hmXRb/e5IvLClmlogoqFKBYNJQ1xVt1bc8d7L42YUKhRqlRx/23YfT2tZw
         NAKQrldmBij1S6eAE4bMEZldmeEqzmFwTGt4g+Cr0jxCJLz83LxEhPPOu/XQChNVVEAr
         iCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQ7g43yeFEdHpj10PompOYHIr0cHFQF71QMr+oMaves=;
        b=75P7L/ahx1kmGMZLB57bfX2zWAuTjUIwgMgB+38kV/+WFAIC8Pc9EmzzNfX6Pmumrk
         PKOe18LveU1NovVg4qlabpjDCj5anCm+15xEPnluc/gENE5pNJ3zgPymcy17IhNHAuV2
         bCjouvQcIK1fZjUo5Fnikg8j7m9Hihg4TbWgK90MSjvfDLkxQ0BftK+hb8mc/bFNBQro
         RKEE01w8kDpFTrdN6swp+JvDVglll0fR15MdF9OLSYnmth7sg0PVdG5OzH8/hghkQRQI
         aajjfEL0zKh/rNxQJbh5z2VDBikVKNtGQRyB9CjSujy307qe+miN4nmSeK00fBHLFerx
         stlQ==
X-Gm-Message-State: AFqh2koUAQjqGwO4iBR1P4XtmHK0qJcaQPzsoF/0E9sszhM2/eetuu5F
	oSTfTlApXWE8eB1KM8XGC3bPxFd57IPoGg==
X-Google-Smtp-Source: AMrXdXv4Q84TnQCE5ksibHnf+NQDrI+GZXTnLALoLGQVU2OEMSIddRzRtvcZyHZQyAxktj4bAOBALw==
X-Received: by 2002:a05:600c:3b1c:b0:3c6:e60f:3f66 with SMTP id m28-20020a05600c3b1c00b003c6e60f3f66mr32999816wms.29.1672833567559;
        Wed, 04 Jan 2023 03:59:27 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bg20-20020a05600c3c9400b003d1e34bcbb2sm1878973wmb.13.2023.01.04.03.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:59:27 -0800 (PST)
Date: Wed, 4 Jan 2023 14:59:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Ira Weiny <ira.weiny@intel.com>, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 2/4] fs/sysv: Change the signature of dir_get_page()
Message-ID: <202301041814.3Lbh2QfK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221231075717.10258-3-fmdefrancesco@gmail.com>
Message-ID: <20230104115924.vIfGP96vDW9Ry1CrSKy6VKfqzEqS3LhPoVOREJB4xwE@z>

Hi Fabio,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-M-De-Francesco/fs-sysv-Use-the-offset_in_page-helper/20221231-155850
base:   git://git.infradead.org/users/hch/configfs.git for-next
patch link:    https://lore.kernel.org/r/20221231075717.10258-3-fmdefrancesco%40gmail.com
patch subject: [PATCH 2/4] fs/sysv: Change the signature of dir_get_page()
config: xtensa-randconfig-m031-20230101
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
fs/sysv/dir.c:190 sysv_add_link() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +190 fs/sysv/dir.c

^1da177e4c3f41 Linus Torvalds        2005-04-16  174  int sysv_add_link(struct dentry *dentry, struct inode *inode)
^1da177e4c3f41 Linus Torvalds        2005-04-16  175  {
2b0143b5c986be David Howells         2015-03-17  176  	struct inode *dir = d_inode(dentry->d_parent);
^1da177e4c3f41 Linus Torvalds        2005-04-16  177  	const char * name = dentry->d_name.name;
^1da177e4c3f41 Linus Torvalds        2005-04-16  178  	int namelen = dentry->d_name.len;
^1da177e4c3f41 Linus Torvalds        2005-04-16  179  	struct page *page = NULL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  180  	struct sysv_dir_entry * de;
^1da177e4c3f41 Linus Torvalds        2005-04-16  181  	unsigned long npages = dir_pages(dir);
^1da177e4c3f41 Linus Torvalds        2005-04-16  182  	unsigned long n;
^1da177e4c3f41 Linus Torvalds        2005-04-16  183  	char *kaddr;
26a6441aadde86 Nicholas Piggin       2007-10-16  184  	loff_t pos;
^1da177e4c3f41 Linus Torvalds        2005-04-16  185  	int err;
^1da177e4c3f41 Linus Torvalds        2005-04-16  186  
^1da177e4c3f41 Linus Torvalds        2005-04-16  187  	/* We take care of directory expansion in the same loop */
^1da177e4c3f41 Linus Torvalds        2005-04-16  188  	for (n = 0; n <= npages; n++) {
4b8a9c0afda16b Fabio M. De Francesco 2022-12-31  189  		kaddr = dir_get_page(dir, n, &page);
^1da177e4c3f41 Linus Torvalds        2005-04-16 @190  		err = PTR_ERR(page);

This "err" assignment is a dead store (pointless/never used).

4b8a9c0afda16b Fabio M. De Francesco 2022-12-31  191  		if (IS_ERR(kaddr))
4b8a9c0afda16b Fabio M. De Francesco 2022-12-31  192  			return PTR_ERR(kaddr);
^1da177e4c3f41 Linus Torvalds        2005-04-16  193  		de = (struct sysv_dir_entry *)kaddr;
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  194  		kaddr += PAGE_SIZE - SYSV_DIRSIZE;
^1da177e4c3f41 Linus Torvalds        2005-04-16  195  		while ((char *)de <= kaddr) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  196  			if (!de->inode)
^1da177e4c3f41 Linus Torvalds        2005-04-16  197  				goto got_it;
^1da177e4c3f41 Linus Torvalds        2005-04-16  198  			err = -EEXIST;
^1da177e4c3f41 Linus Torvalds        2005-04-16  199  			if (namecompare(namelen, SYSV_NAMELEN, name, de->name)) 
^1da177e4c3f41 Linus Torvalds        2005-04-16  200  				goto out_page;
^1da177e4c3f41 Linus Torvalds        2005-04-16  201  			de++;
^1da177e4c3f41 Linus Torvalds        2005-04-16  202  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  203  		dir_put_page(page);
^1da177e4c3f41 Linus Torvalds        2005-04-16  204  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  205  	BUG();
^1da177e4c3f41 Linus Torvalds        2005-04-16  206  	return -EINVAL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  207  
^1da177e4c3f41 Linus Torvalds        2005-04-16  208  got_it:
1023904333f9cb Fabio M. De Francesco 2022-12-31  209  	pos = page_offset(page) + offset_in_page(de);
^1da177e4c3f41 Linus Torvalds        2005-04-16  210  	lock_page(page);
f4e420dc423148 Christoph Hellwig     2010-06-04  211  	err = sysv_prepare_chunk(page, pos, SYSV_DIRSIZE);
^1da177e4c3f41 Linus Torvalds        2005-04-16  212  	if (err)
^1da177e4c3f41 Linus Torvalds        2005-04-16  213  		goto out_unlock;
^1da177e4c3f41 Linus Torvalds        2005-04-16  214  	memcpy (de->name, name, namelen);
^1da177e4c3f41 Linus Torvalds        2005-04-16  215  	memset (de->name + namelen, 0, SYSV_DIRSIZE - namelen - 2);
^1da177e4c3f41 Linus Torvalds        2005-04-16  216  	de->inode = cpu_to_fs16(SYSV_SB(inode->i_sb), inode->i_ino);
26a6441aadde86 Nicholas Piggin       2007-10-16  217  	err = dir_commit_chunk(page, pos, SYSV_DIRSIZE);
02027d42c3f747 Deepa Dinamani        2016-09-14  218  	dir->i_mtime = dir->i_ctime = current_time(dir);
^1da177e4c3f41 Linus Torvalds        2005-04-16  219  	mark_inode_dirty(dir);
^1da177e4c3f41 Linus Torvalds        2005-04-16  220  out_page:
^1da177e4c3f41 Linus Torvalds        2005-04-16  221  	dir_put_page(page);
^1da177e4c3f41 Linus Torvalds        2005-04-16  222  	return err;
^1da177e4c3f41 Linus Torvalds        2005-04-16  223  out_unlock:
^1da177e4c3f41 Linus Torvalds        2005-04-16  224  	unlock_page(page);
^1da177e4c3f41 Linus Torvalds        2005-04-16  225  	goto out_page;
^1da177e4c3f41 Linus Torvalds        2005-04-16  226  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


