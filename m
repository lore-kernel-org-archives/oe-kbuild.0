Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979581BA895
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727429104; cv=none; b=j0tEu3b2ftj2czbz1E2YHnAmR9jWTwWrfVrIk1BZi5e1lKN49Xsv7BtZcOt8F0CtEhiSVk0g9Hmz2DCL6pVMuIwOUcD9HmpJ8e0LJK0Cem4YRqSZPiHr3qDREm1/W4PB2ugoakgmSLYhDn50zUMHSBvo7Jt7DptAfqFa9WsqgpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727429104; c=relaxed/simple;
	bh=dBe/5sFLv5pu2l/fUZhnRSXbq84qKKXoWP5rg08ADIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kiJEALpTSz8trDqAUrI4YXnNJOMp7cX99iXSuE800g425Q1cs2ee9kQmpaQ2TKkfRLsJa4b8ZN2KNJxChKe+qnnqSGRReQ8Xv35Vyi69kfk/upp9Q9CeSm05+BOMU2XwSIZCL3aCWmQxj7oU0Szoy26+s+AJwkx640Xz3Wa49mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sP4KeQRr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sP4KeQRr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so16480365e9.2
        for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 02:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727429101; x=1728033901; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gg/fCvEtjGMKyTUBwKwl2C1r/BIP57qe3RxYmsfcBMw=;
        b=sP4KeQRrC2x5GHqQaDzxCaAGiARkeb+wgnPGc8xqsmN88naDyf5HH99T8jOj89FGc/
         ZTxFDad6pxLCHkAyT2ih0yKy1AGrS5PSP9yoBvnUXzadId4zqF22ISZhILBI8/9l/4j3
         eKJoOuDV1+rcbej4eSmuOCCnR8GibpJOBB+4UE6aGpvc6d8mr8LpQRn4YYRdqxN4UOOq
         azlqHHdL0V+jMOlGwZ0XLS7gQMkwmy7ttbqdX2GwBFBUnSqkGW2+GxYN3yV66RCTcZZy
         i5a3WW8jDsrTQ58AApb5M2DA/zr+eY3cQ3b5BPrUlne2u8wZBSpZbgM6C1mGDWhJVCmM
         y0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727429101; x=1728033901;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gg/fCvEtjGMKyTUBwKwl2C1r/BIP57qe3RxYmsfcBMw=;
        b=q/ZaqM1yfw4tmuL+9n7QXpol0fmyOkNVaGyqqM0XNrC9f2w9uKL35unHlpii9d5H4h
         bVR1qpd99WVdVAHhzluxsVZOe1c01StsvDevzSGU+6VWH3oSCx14gFMzbXCwp2/7QJNR
         6YaHFJmp+Of8DuPi75JDHwl/kG6J6qGb3I/WyLrowU/Hr9+YOKXq2Uyw2hPKaVgG7PbA
         lDaQFVsXQkUSpRsVi5j1ovkZvUEAb3k8q3M9Ib2h2gPTqgaCNYdF0nYFYcJR3j8+2Lzk
         EOh7vmHwjBt6X9eUd0+l8mNF3zS6hhWqYAIYDIOT2+ReSD6tQU9Kdw0ZxHQ6Hcl109Wx
         J1yw==
X-Gm-Message-State: AOJu0YyrK3ig5qD/VUb9GX9+5TWRLXnJsgvt1FNJfyvW/wx/VYm15s54
	gbBPW7KeQ2+/bZrNIi0x7luIQgOiX9tQB0iu8M/4mbN/8K7+moLxsTnnSxpPvIF3YyK8sF4nXmG
	t
X-Google-Smtp-Source: AGHT+IGJGsDWBUIUUjpPJKuHdcWY/5NNL2BVQ3Psb/D6SJK+xngNh+pibZIFL36Y/WBypBbDAQeaZQ==
X-Received: by 2002:a05:600c:3b93:b0:426:689b:65b7 with SMTP id 5b1f17b1804b1-42f58485cc1mr15949525e9.25.1727429100571;
        Fri, 27 Sep 2024 02:25:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57dd2ec5sm20772275e9.5.2024.09.27.02.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:25:00 -0700 (PDT)
Date: Fri, 27 Sep 2024 12:24:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Yifan Qiao <qiaoyifan4@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29927/30000] fs/btrfs/extent-tree.c:190
 btrfs_lookup_extent_info() error: we previously assumed 'trans' could be
 null (see line 138)
Message-ID: <71f6e94c-f40c-4faa-b4ac-62a22476efe2@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1ee3530999a48ca477d37ca2f55027c91b57086a
commit: 55bd6b7bf31f3798b8461dd75c17e9aa9ee8441f [29927/30000] btrfs: don't BUG_ON() when 0 reference count at btrfs_lookup_extent_info()
config: x86_64-randconfig-161-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271612.ikY68CAg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409271612.ikY68CAg-lkp@intel.com/

New smatch warnings:
fs/btrfs/extent-tree.c:190 btrfs_lookup_extent_info() error: we previously assumed 'trans' could be null (see line 138)

vim +/trans +190 fs/btrfs/extent-tree.c

a22285a6a32390 Yan, Zheng                2010-05-16  113  int btrfs_lookup_extent_info(struct btrfs_trans_handle *trans,
2ff7e61e0d30ff Jeff Mahoney              2016-06-22  114  			     struct btrfs_fs_info *fs_info, u64 bytenr,
3173a18f70554f Josef Bacik               2013-03-07  115  			     u64 offset, int metadata, u64 *refs, u64 *flags)
a22285a6a32390 Yan, Zheng                2010-05-16  116  {
a22285a6a32390 Yan, Zheng                2010-05-16  117  	struct btrfs_delayed_ref_head *head;
a22285a6a32390 Yan, Zheng                2010-05-16  118  	struct btrfs_delayed_ref_root *delayed_refs;
a22285a6a32390 Yan, Zheng                2010-05-16  119  	struct btrfs_path *path;
a22285a6a32390 Yan, Zheng                2010-05-16  120  	struct btrfs_key key;
a22285a6a32390 Yan, Zheng                2010-05-16  121  	u64 num_refs;
a22285a6a32390 Yan, Zheng                2010-05-16  122  	u64 extent_flags;
a22285a6a32390 Yan, Zheng                2010-05-16  123  	int ret;
a22285a6a32390 Yan, Zheng                2010-05-16  124  
3173a18f70554f Josef Bacik               2013-03-07  125  	/*
3173a18f70554f Josef Bacik               2013-03-07  126  	 * If we don't have skinny metadata, don't bother doing anything
3173a18f70554f Josef Bacik               2013-03-07  127  	 * different
3173a18f70554f Josef Bacik               2013-03-07  128  	 */
0b246afa62b0cf Jeff Mahoney              2016-06-22  129  	if (metadata && !btrfs_fs_incompat(fs_info, SKINNY_METADATA)) {
0b246afa62b0cf Jeff Mahoney              2016-06-22  130  		offset = fs_info->nodesize;
3173a18f70554f Josef Bacik               2013-03-07  131  		metadata = 0;
3173a18f70554f Josef Bacik               2013-03-07  132  	}
3173a18f70554f Josef Bacik               2013-03-07  133  
a22285a6a32390 Yan, Zheng                2010-05-16  134  	path = btrfs_alloc_path();
a22285a6a32390 Yan, Zheng                2010-05-16  135  	if (!path)
a22285a6a32390 Yan, Zheng                2010-05-16  136  		return -ENOMEM;
a22285a6a32390 Yan, Zheng                2010-05-16  137  
a22285a6a32390 Yan, Zheng                2010-05-16 @138  	if (!trans) {

This assumes trans can be NULL

a22285a6a32390 Yan, Zheng                2010-05-16  139  		path->skip_locking = 1;
a22285a6a32390 Yan, Zheng                2010-05-16  140  		path->search_commit_root = 1;
a22285a6a32390 Yan, Zheng                2010-05-16  141  	}
639eefc8afd1b8 Filipe David Borba Manana 2013-12-08  142  
639eefc8afd1b8 Filipe David Borba Manana 2013-12-08  143  search_again:
639eefc8afd1b8 Filipe David Borba Manana 2013-12-08  144  	key.objectid = bytenr;
639eefc8afd1b8 Filipe David Borba Manana 2013-12-08  145  	key.offset = offset;
639eefc8afd1b8 Filipe David Borba Manana 2013-12-08  146  	if (metadata)
639eefc8afd1b8 Filipe David Borba Manana 2013-12-08  147  		key.type = BTRFS_METADATA_ITEM_KEY;
639eefc8afd1b8 Filipe David Borba Manana 2013-12-08  148  	else
639eefc8afd1b8 Filipe David Borba Manana 2013-12-08  149  		key.type = BTRFS_EXTENT_ITEM_KEY;
639eefc8afd1b8 Filipe David Borba Manana 2013-12-08  150  
0b246afa62b0cf Jeff Mahoney              2016-06-22  151  	ret = btrfs_search_slot(trans, fs_info->extent_root, &key, path, 0, 0);
                                                                                        ^^^^^
This has some unchecked dereferences as well but Smatch doens't count them
because it's possible that we avoid them.  The code upstream is very different
but in upstream code trans can't be NULL.

a22285a6a32390 Yan, Zheng                2010-05-16  152  	if (ret < 0)
a22285a6a32390 Yan, Zheng                2010-05-16  153  		goto out_free;
a22285a6a32390 Yan, Zheng                2010-05-16  154  
e541f5d93df09d Filipe Manana             2024-09-24  155  	if (ret > 0 && key.type == BTRFS_METADATA_ITEM_KEY) {
74be9510876a66 Filipe David Borba Manana 2013-07-05  156  		if (path->slots[0]) {
74be9510876a66 Filipe David Borba Manana 2013-07-05  157  			path->slots[0]--;
74be9510876a66 Filipe David Borba Manana 2013-07-05  158  			btrfs_item_key_to_cpu(path->nodes[0], &key,
74be9510876a66 Filipe David Borba Manana 2013-07-05  159  					      path->slots[0]);
74be9510876a66 Filipe David Borba Manana 2013-07-05  160  			if (key.objectid == bytenr &&
74be9510876a66 Filipe David Borba Manana 2013-07-05  161  			    key.type == BTRFS_EXTENT_ITEM_KEY &&
0b246afa62b0cf Jeff Mahoney              2016-06-22  162  			    key.offset == fs_info->nodesize)
74be9510876a66 Filipe David Borba Manana 2013-07-05  163  				ret = 0;
74be9510876a66 Filipe David Borba Manana 2013-07-05  164  		}
74be9510876a66 Filipe David Borba Manana 2013-07-05  165  	}
3173a18f70554f Josef Bacik               2013-03-07  166  
a22285a6a32390 Yan, Zheng                2010-05-16  167  	if (ret == 0) {
fe95a51b4b389d Filipe Manana             2024-09-24  168  		struct extent_buffer *leaf = path->nodes[0];
fe95a51b4b389d Filipe Manana             2024-09-24  169  		struct btrfs_extent_item *ei;
fe95a51b4b389d Filipe Manana             2024-09-24  170  		const u32 item_size = btrfs_item_size_nr(leaf, path->slots[0]);
fe95a51b4b389d Filipe Manana             2024-09-24  171  
fe95a51b4b389d Filipe Manana             2024-09-24  172  		if (unlikely(item_size < sizeof(*ei))) {
ba3c2b196bf59b Nikolay Borisov           2018-06-26  173  			ret = -EINVAL;
ba3c2b196bf59b Nikolay Borisov           2018-06-26  174  			btrfs_print_v0_err(fs_info);
ba3c2b196bf59b Nikolay Borisov           2018-06-26  175  			if (trans)
                                                                                    ^^^^^
checks for NULL

ba3c2b196bf59b Nikolay Borisov           2018-06-26  176  				btrfs_abort_transaction(trans, ret);
ba3c2b196bf59b Nikolay Borisov           2018-06-26  177  			else
ba3c2b196bf59b Nikolay Borisov           2018-06-26  178  				btrfs_handle_fs_error(fs_info, ret, NULL);
ba3c2b196bf59b Nikolay Borisov           2018-06-26  179  
ba3c2b196bf59b Nikolay Borisov           2018-06-26  180  			goto out_free;
a22285a6a32390 Yan, Zheng                2010-05-16  181  		}
ba3c2b196bf59b Nikolay Borisov           2018-06-26  182  
fe95a51b4b389d Filipe Manana             2024-09-24  183  		ei = btrfs_item_ptr(leaf, path->slots[0], struct btrfs_extent_item);
fe95a51b4b389d Filipe Manana             2024-09-24  184  		num_refs = btrfs_extent_refs(leaf, ei);
55bd6b7bf31f37 Filipe Manana             2024-09-24  185  		if (unlikely(num_refs == 0)) {
55bd6b7bf31f37 Filipe Manana             2024-09-24  186  			ret = -EUCLEAN;
55bd6b7bf31f37 Filipe Manana             2024-09-24  187  			btrfs_err(fs_info,
55bd6b7bf31f37 Filipe Manana             2024-09-24  188  		"unexpected zero reference count for extent item (%llu %u %llu)",
55bd6b7bf31f37 Filipe Manana             2024-09-24  189  				  key.objectid, key.type, key.offset);
55bd6b7bf31f37 Filipe Manana             2024-09-24 @190  			btrfs_abort_transaction(trans, ret);

Unchecked dereference here

55bd6b7bf31f37 Filipe Manana             2024-09-24  191  			goto out_free;
55bd6b7bf31f37 Filipe Manana             2024-09-24  192  		}
fe95a51b4b389d Filipe Manana             2024-09-24  193  		extent_flags = btrfs_extent_flags(leaf, ei);
a22285a6a32390 Yan, Zheng                2010-05-16  194  	} else {
a22285a6a32390 Yan, Zheng                2010-05-16  195  		num_refs = 0;
a22285a6a32390 Yan, Zheng                2010-05-16  196  		extent_flags = 0;
a22285a6a32390 Yan, Zheng                2010-05-16  197  		ret = 0;
a22285a6a32390 Yan, Zheng                2010-05-16  198  	}
a22285a6a32390 Yan, Zheng                2010-05-16  199  
a22285a6a32390 Yan, Zheng                2010-05-16  200  	if (!trans)
a22285a6a32390 Yan, Zheng                2010-05-16  201  		goto out;
a22285a6a32390 Yan, Zheng                2010-05-16  202  
a22285a6a32390 Yan, Zheng                2010-05-16  203  	delayed_refs = &trans->transaction->delayed_refs;
a22285a6a32390 Yan, Zheng                2010-05-16  204  	spin_lock(&delayed_refs->lock);
f72ad18e996338 Liu Bo                    2017-01-30  205  	head = btrfs_find_delayed_ref_head(delayed_refs, bytenr);
a22285a6a32390 Yan, Zheng                2010-05-16  206  	if (head) {
a22285a6a32390 Yan, Zheng                2010-05-16  207  		if (!mutex_trylock(&head->mutex)) {
d278850eff3053 Josef Bacik               2017-09-29  208  			refcount_inc(&head->refs);
a22285a6a32390 Yan, Zheng                2010-05-16  209  			spin_unlock(&delayed_refs->lock);
a22285a6a32390 Yan, Zheng                2010-05-16  210  
b3b4aa74b58bde David Sterba              2011-04-21  211  			btrfs_release_path(path);
a22285a6a32390 Yan, Zheng                2010-05-16  212  
8cc33e5c19bf01 David Sterba              2011-05-02  213  			/*
8cc33e5c19bf01 David Sterba              2011-05-02  214  			 * Mutex was contended, block until it's released and try
8cc33e5c19bf01 David Sterba              2011-05-02  215  			 * again
8cc33e5c19bf01 David Sterba              2011-05-02  216  			 */
a22285a6a32390 Yan, Zheng                2010-05-16  217  			mutex_lock(&head->mutex);
a22285a6a32390 Yan, Zheng                2010-05-16  218  			mutex_unlock(&head->mutex);
d278850eff3053 Josef Bacik               2017-09-29  219  			btrfs_put_delayed_ref_head(head);
639eefc8afd1b8 Filipe David Borba Manana 2013-12-08  220  			goto search_again;
a22285a6a32390 Yan, Zheng                2010-05-16  221  		}
d7df2c796d7eed Josef Bacik               2014-01-23  222  		spin_lock(&head->lock);
55bd6b7bf31f37 Filipe Manana             2024-09-24  223  		if (head->extent_op && head->extent_op->update_flags) {
a22285a6a32390 Yan, Zheng                2010-05-16  224  			extent_flags |= head->extent_op->flags_to_set;
55bd6b7bf31f37 Filipe Manana             2024-09-24  225  		} else if (unlikely(num_refs == 0)) {
55bd6b7bf31f37 Filipe Manana             2024-09-24  226  			spin_unlock(&head->lock);
55bd6b7bf31f37 Filipe Manana             2024-09-24  227  			mutex_unlock(&head->mutex);
55bd6b7bf31f37 Filipe Manana             2024-09-24  228  			spin_unlock(&delayed_refs->lock);
55bd6b7bf31f37 Filipe Manana             2024-09-24  229  			ret = -EUCLEAN;
55bd6b7bf31f37 Filipe Manana             2024-09-24  230  			btrfs_err(fs_info,
55bd6b7bf31f37 Filipe Manana             2024-09-24  231  			  "unexpected zero reference count for extent %llu (%s)",
55bd6b7bf31f37 Filipe Manana             2024-09-24  232  				  bytenr, metadata ? "metadata" : "data");
55bd6b7bf31f37 Filipe Manana             2024-09-24  233  			btrfs_abort_transaction(trans, ret);
55bd6b7bf31f37 Filipe Manana             2024-09-24  234  			goto out_free;
55bd6b7bf31f37 Filipe Manana             2024-09-24  235  		}
a22285a6a32390 Yan, Zheng                2010-05-16  236  
d278850eff3053 Josef Bacik               2017-09-29  237  		num_refs += head->ref_mod;
d7df2c796d7eed Josef Bacik               2014-01-23  238  		spin_unlock(&head->lock);
a22285a6a32390 Yan, Zheng                2010-05-16  239  		mutex_unlock(&head->mutex);
a22285a6a32390 Yan, Zheng                2010-05-16  240  	}
a22285a6a32390 Yan, Zheng                2010-05-16  241  	spin_unlock(&delayed_refs->lock);
a22285a6a32390 Yan, Zheng                2010-05-16  242  out:
a22285a6a32390 Yan, Zheng                2010-05-16  243  	WARN_ON(num_refs == 0);
a22285a6a32390 Yan, Zheng                2010-05-16  244  	if (refs)
a22285a6a32390 Yan, Zheng                2010-05-16  245  		*refs = num_refs;
a22285a6a32390 Yan, Zheng                2010-05-16  246  	if (flags)
a22285a6a32390 Yan, Zheng                2010-05-16  247  		*flags = extent_flags;
a22285a6a32390 Yan, Zheng                2010-05-16  248  out_free:
a22285a6a32390 Yan, Zheng                2010-05-16  249  	btrfs_free_path(path);
a22285a6a32390 Yan, Zheng                2010-05-16  250  	return ret;
a22285a6a32390 Yan, Zheng                2010-05-16  251  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

