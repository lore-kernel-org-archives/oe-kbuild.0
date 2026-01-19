Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A93F2367D3
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 06:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768802838; cv=none; b=HzuPC2d7Oz3sCYW1Dn+mQClrKKHk1sHMjQfSHU19Qt/zh/YmTJ58+cHhsplwA6/R018pal8aM3BYH1bXwZ3Z64lv1T8CwphUpdc/XIYsiedJLWZ2KUgUspXph2IwpU+jGNhrScxjb3ku8sjRkEnFo8zCOUd0EFa+b46eQmWMhVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768802838; c=relaxed/simple;
	bh=uOFCeHk7T1LDDn8mkfzwrWcNHvfLsXPPiJQTljotHno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TXSFnd76W/kQUVMaDd9AkbbzABOyj7BzgrCmYEnqplrjCQ3+VeOPfe9r76xo0ABokJsbommBsCP1DdWc1RH5ZP1oG05PWmxaMUvOPWwIFUFEueESatBtCv6Z0nmoeFuIX3HUGvKHNfopwAcGZYbgng3hLlacprUDUxoaIKJbPDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t35+k93p; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t35+k93p"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4801d21c411so11768155e9.3
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 22:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768802835; x=1769407635; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q7hWfZpB2Sv+G0e3HCAP6yj0gzr5ypHycX6T4VNrmTI=;
        b=t35+k93pavkpyzzY/ZjRql7ghUXDhwRO18gQinzLNtdUXVtFTPrBnNT+OPrO0s4AQR
         z7NYOIr+8jV+6er/bGMdqbCFjsT/sphfXMSDYCtQCpS5orhmvihyr8eDBIt6t4XgOgQH
         0m1zv6NJ4rbCWwK2x9lR5KGbOhxh95+Mz2HsucCZtbjGZhg6wUdtV0llKCveh8qJuytk
         /6MKK7JTWRDWd9TfbvUPY40yk2Os4/duDkXdAqR5mkb06PQnpN9BNn9YLma1MxETea/Z
         l2ZvwYba5hK10qQJeSv7kd1JtUDUlYnTwDQgjefpJ97uGQL3D3TYiOSEi5M4kzXrt/W0
         UFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768802835; x=1769407635;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7hWfZpB2Sv+G0e3HCAP6yj0gzr5ypHycX6T4VNrmTI=;
        b=t1r1wEYZsZEgR1IsMDPsiKovoNg3Tc0biqCc2qpby66do7AV8DTPMcvusrAHa/3y6/
         kprQ9Xt1lGMClm9QJiFXO3JHSTwq+1cmTdZqYvz/A/mxMonB+NK+VuREM8sZK8bZPBrS
         OGlFplOLdoV13fMc2tbiKuRba3X9Vl9cmFN7453xoP/mBzWhMy1pSkPHQPKzSAzRYuVt
         iKexdkYGX5+x3/uv8umTUaWy/9HV8BedFtJIBAb2gaX1sAyY+6e7C98EzBKT76IRCQXb
         duTebsCglu8GyoyrBkXEsOW/YmXTko+AQhhicxupYvYUzs82zoAZxtGfUEvjdUDiui5h
         vFKA==
X-Gm-Message-State: AOJu0Ywo3dL4i4g+rYXqNLCf4mF/jEitizIVnZkDpoYTBTrIUrGqATTO
	T3GvG9Ic/McnuwVVRxAvwbVgttp2H6nbTr/Rtceec09eKF7i96oIktJnFNVxM0IWFl+V9YSI+8G
	HkUfH36I=
X-Gm-Gg: AY/fxX6w2wz9IjvuVJXXlPh0Xp90qClxh+nRBf6PFnYpV+6cmumsdGm2zujL6B3Lhxp
	B2JNipW98AH7z5rCMjyZVlb5quhKU+MmAP5EwwB5qO5fEbDfdFVy4vhVDLoShr22JPn8x/jHkZu
	LWMm51bpShvW9Xi/C31uudOUn3dBd4NMu2Dacmq4f7ICTtbPgw/HUdJl6w4GjsFi1WrVXM2grmS
	gW/naovXj6lhcGcDhWCIhnrT5l5dTY04unhhGKPZMIlmvbsDD0h4YLgFBCrQIOmDr+qKnHh3gr5
	UnD1BdyRE9m7pLsfRbBJGQqWps0WuDmAXdTpYAlWuXjdxHW2GNbPt4t6Dg0gQx4LI26P7vymZBD
	ISsFVcvDODB3EjMmGhcWEfskKL33bPvTk9g75zQnpT9QAJ4Ah/mbd9jZ3XPyf8prydLzV/Za8MA
	9CcDKsWpltRQCBx8gX
X-Received: by 2002:a05:600c:1986:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-4801e30ba86mr120720805e9.14.1768802835233;
        Sun, 18 Jan 2026 22:07:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435699980e5sm20990216f8f.41.2026.01.18.22.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:07:14 -0800 (PST)
Date: Mon, 19 Jan 2026 09:07:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 4/4] fs/afs/dir_edit.c:427
 afs_edit_dir_remove() error: buffer overflow 'meta->meta.alloc_ctrs' 128 <=
 128
Message-ID: <202601161720.SkpQfhoJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260119060712.JRL5JvR6VWEeQP2WFW0xqv9-mAOrWZ-EjWZwcZAjYxQ@z>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a58a97026588e9128868c7778ca1ffacbb53c931
commit: 7e8ea8e80a469742993b1aa006b44ef8911001a0 [4/4] afs: Fix directory format encoding struct
config: i386-randconfig-141-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161720.SkpQfhoJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601161720.SkpQfhoJ-lkp@intel.com/

smatch warnings:
fs/afs/dir_edit.c:427 afs_edit_dir_remove() error: buffer overflow 'meta->meta.alloc_ctrs' 128 <= 128

vim +427 fs/afs/dir_edit.c

63a4681ff39cb6 David Howells 2018-04-06  374  void afs_edit_dir_remove(struct afs_vnode *vnode,
63a4681ff39cb6 David Howells 2018-04-06  375  			 struct qstr *name, enum afs_edit_dir_reason why)
63a4681ff39cb6 David Howells 2018-04-06  376  {
63a4681ff39cb6 David Howells 2018-04-06  377  	union afs_xdr_dir_block *meta, *block;
63a4681ff39cb6 David Howells 2018-04-06  378  	union afs_xdr_dirent *de;
255ed63638da19 David Howells 2021-08-11  379  	struct folio *folio0, *folio;
63a4681ff39cb6 David Howells 2018-04-06  380  	unsigned int need_slots, nr_blocks, b;
63a4681ff39cb6 David Howells 2018-04-06  381  	pgoff_t index;
63a4681ff39cb6 David Howells 2018-04-06  382  	loff_t i_size;
63a4681ff39cb6 David Howells 2018-04-06  383  	int slot;
63a4681ff39cb6 David Howells 2018-04-06  384  
63a4681ff39cb6 David Howells 2018-04-06  385  	_enter(",,{%d,%s},", name->len, name->name);
63a4681ff39cb6 David Howells 2018-04-06  386  
874c8ca1e60b2c David Howells 2022-06-09  387  	i_size = i_size_read(&vnode->netfs.inode);
63a4681ff39cb6 David Howells 2018-04-06  388  	if (i_size < AFS_DIR_BLOCK_SIZE ||
63a4681ff39cb6 David Howells 2018-04-06  389  	    i_size > AFS_DIR_BLOCK_SIZE * AFS_DIR_MAX_BLOCKS ||
63a4681ff39cb6 David Howells 2018-04-06  390  	    (i_size & (AFS_DIR_BLOCK_SIZE - 1))) {
63a4681ff39cb6 David Howells 2018-04-06  391  		clear_bit(AFS_VNODE_DIR_VALID, &vnode->flags);
63a4681ff39cb6 David Howells 2018-04-06  392  		return;
63a4681ff39cb6 David Howells 2018-04-06  393  	}
63a4681ff39cb6 David Howells 2018-04-06  394  	nr_blocks = i_size / AFS_DIR_BLOCK_SIZE;
63a4681ff39cb6 David Howells 2018-04-06  395  
255ed63638da19 David Howells 2021-08-11  396  	folio0 = afs_dir_get_folio(vnode, 0);
255ed63638da19 David Howells 2021-08-11  397  	if (!folio0) {
63a4681ff39cb6 David Howells 2018-04-06  398  		_leave(" [fgp]");
63a4681ff39cb6 David Howells 2018-04-06  399  		return;
63a4681ff39cb6 David Howells 2018-04-06  400  	}
63a4681ff39cb6 David Howells 2018-04-06  401  
63a4681ff39cb6 David Howells 2018-04-06  402  	/* Work out how many slots we're going to discard. */
366911cd762db0 David Howells 2020-12-23  403  	need_slots = afs_dir_calc_slots(name->len);
63a4681ff39cb6 David Howells 2018-04-06  404  
255ed63638da19 David Howells 2021-08-11  405  	meta = kmap_local_folio(folio0, 0);
63a4681ff39cb6 David Howells 2018-04-06  406  
255ed63638da19 David Howells 2021-08-11  407  	/* Find a block that has sufficient slots available.  Each folio
63a4681ff39cb6 David Howells 2018-04-06  408  	 * contains two or more directory blocks.
63a4681ff39cb6 David Howells 2018-04-06  409  	 */
63a4681ff39cb6 David Howells 2018-04-06  410  	for (b = 0; b < nr_blocks; b++) {
63a4681ff39cb6 David Howells 2018-04-06  411  		index = b / AFS_DIR_BLOCKS_PER_PAGE;
255ed63638da19 David Howells 2021-08-11  412  		if (index >= folio_nr_pages(folio0)) {
255ed63638da19 David Howells 2021-08-11  413  			folio = afs_dir_get_folio(vnode, index);
255ed63638da19 David Howells 2021-08-11  414  			if (!folio)
63a4681ff39cb6 David Howells 2018-04-06  415  				goto error;
63a4681ff39cb6 David Howells 2018-04-06  416  		} else {
255ed63638da19 David Howells 2021-08-11  417  			folio = folio0;
63a4681ff39cb6 David Howells 2018-04-06  418  		}
63a4681ff39cb6 David Howells 2018-04-06  419  
255ed63638da19 David Howells 2021-08-11  420  		block = kmap_local_folio(folio, b * AFS_DIR_BLOCK_SIZE - folio_file_pos(folio));
255ed63638da19 David Howells 2021-08-11  421  
63a4681ff39cb6 David Howells 2018-04-06  422  		/* Abandon the edit if we got a callback break. */
63a4681ff39cb6 David Howells 2018-04-06  423  		if (!test_bit(AFS_VNODE_DIR_VALID, &vnode->flags))
63a4681ff39cb6 David Howells 2018-04-06  424  			goto invalidated;
63a4681ff39cb6 David Howells 2018-04-06  425  
63a4681ff39cb6 David Howells 2018-04-06  426  		if (b > AFS_DIR_BLOCKS_WITH_CTR ||

if (b >= AFS_DIR_BLOCKS_WITH_CTR ||

63a4681ff39cb6 David Howells 2018-04-06 @427  		    meta->meta.alloc_ctrs[b] <= AFS_DIR_SLOTS_PER_BLOCK - 1 - need_slots) {
63a4681ff39cb6 David Howells 2018-04-06  428  			slot = afs_dir_scan_block(block, name, b);
63a4681ff39cb6 David Howells 2018-04-06  429  			if (slot >= 0)
63a4681ff39cb6 David Howells 2018-04-06  430  				goto found_dirent;
63a4681ff39cb6 David Howells 2018-04-06  431  		}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

