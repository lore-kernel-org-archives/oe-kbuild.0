Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C777E1EF0B0
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 07:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754119806; cv=none; b=BPanMafLtepDWQroQaoIt7KGGbTOhehigZLpudXSymRqwBRTgc4KK9Dd1VDHZ7GFn+pRtw8XKyQsWkI8GpYDEGAtISeWk70FKdJov3cq0phumHWevzta8zILpH/sDS4mwA3AwMSCxdLVvp6OuXB97Nm+2jHFiQb8+iW/CPyD7uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754119806; c=relaxed/simple;
	bh=DIDcBZIkPuJkd9g00xqreI+Dc8V8g6RIIzkmuu9nZ7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RhmfnI0Zdazj0Gj5w5Fmn4ctmfEp/bXjcrMI1KWdUEj/pWaC7O2EDT0RfYGuRGmOCMfjfMRPMblni8ZskKJwb53o57JtS95yzhOPH1wQFVPyaN2qM0xhtvxWtdpv45IFkkWWP9Zziu8yGO2eVGJg1vIesF77+seHgm+QvlN4Ffg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZ62GHga; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZ62GHga"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-458bece40fcso166905e9.3
        for <oe-kbuild@lists.linux.dev>; Sat, 02 Aug 2025 00:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754119801; x=1754724601; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sVqkSmfmXqQYH9ngeJMeDZTbZMYNuXLAMBadZ9U6AGc=;
        b=pZ62GHgaD+6zQrbF2towG0sZBWLj0WXsGHDPfQztIGsQKowHHNKv6pnVQyStZSIaB1
         hWl4wXBkci8rraFArTxDybe8j40G/IgMGuLGzUpBDdrviubyYea/wSzv85uLN4/Zt9qP
         GCLOquiy3zmbijqqT7fjM6Ne+zPltcbveVMIjXO7xQ0h+ClchxDEXJe+XSqpNTN4Acv7
         Xyo+mNIhvxlfgZHjeGNOc5Wr6S7oulqkACVRBCkQdTYINSk0ocr05yG2ru6FneUYzV73
         Qvs3jVFrWwfwET1gjAXPk6hBONQn0H3W8wU05ykZ4mFkff+yx4w4Ini/FdkiTcmABVey
         73MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754119801; x=1754724601;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVqkSmfmXqQYH9ngeJMeDZTbZMYNuXLAMBadZ9U6AGc=;
        b=inQMHfAkX3BvJmcBbGP4sfZ6UI4MsKNH4Pz4n5lW8Oi45mg5yn8zOScMzmc6U6Nm7f
         YvNLqOqk0tTjQntUSXMnizrqqNXyjmTbFHcYPKfoxg2JPSBM7v3UkNDwZIgkt7ZHyJ/3
         AMF9aEr+oAsXLkHV0Upegpx+JfuoEyj5q+2lkWweR0CJStKxjEkXdQhXJJKk7Os7p8Ug
         MRqJX6BnAZjZOx79QjeahlifCPinzeOEAl+KfAFKZaM4elxz8hVHZScFCzqM1fpkx4Az
         Dq7c0lq9QmRyfEl4J826Fz7qSGRrf6LhyRUxIPzv1FhfeNqCUndZtJs6XqQumAYnZAN9
         2htQ==
X-Gm-Message-State: AOJu0YyO8gpGJ91WmFvJoXSw9pyLHNRzKAR8tUbuAwb64Wzo68OwNBW4
	ExOVx/CABys71z5kAh11/9gnJhRewxgnE8aoS0ydKKWx8Cy5867Oo/7ZI9sH3K8h1k4rEQa+LSc
	jKpzL
X-Gm-Gg: ASbGncsFC19IrKsj1On1cV35Z9TnuLAVHnFN05Jn/hdDfilN+SSt2+ihnkByQQhluPA
	/CNLu8+bafQXAFS8TkFhN0GBG0EOMYx5ZlqHpFXSBTrNOAjwI/I0TccDUx+iDtgyShRMoC8xp6Q
	BrreCq5C9XrG9Fo4wuyWwzmpE/SvoG5vxhXwvUAVXAFPybhVShRYB0tlIpBu4TQGZxhWfm/9amn
	YLVVxE1ix8ab4hTFaVb53mM0ULsas0z9t2OzOCFK6Lzek2yZ5YLDntiy597ECTGGjRiEn9U4h6p
	tK9SOP2IrIliYmC7Cj6meVMN0b0RH9PkCNrLjrBLjD1RloYr9dEg3MIxbIzRFjfcz6mnU3DydIj
	7RIoJt927te62UPKfy5+AWwBzxao=
X-Google-Smtp-Source: AGHT+IF8KvCsCjeTEyKbXPId3ohQmFPUY38d88zx4FQsCO/4ZoZFs0jr0FAKcWT1QAALg5TjCmnVhA==
X-Received: by 2002:a05:600c:4692:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-458b69dd831mr13148315e9.13.1754119800883;
        Sat, 02 Aug 2025 00:30:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47ca5fsm8119453f8f.63.2025.08.02.00.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 00:30:00 -0700 (PDT)
Date: Sat, 2 Aug 2025 10:29:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12911/13054] fs/bcachefs/snapshot.c:1149
 bch2_snapshot_node_delete() warn: missing error code? 'ret'
Message-ID: <8dc19809-7a3a-427f-be4e-bec7a76b4bfd@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9ddaa95fd283bce7041550ddbbe7e764c477110
commit: 24c5e7ab4066da2073d1c50e82308c8bc0ec4ec3 [12911/13054] bcachefs: Convert bch2_bkey_get_mut() to CLASS(btree_iter)
config: parisc-randconfig-r071-20250801 (https://download.01.org/0day-ci/archive/20250802/202508020434.RgnHwchO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508020434.RgnHwchO-lkp@intel.com/

smatch warnings:
fs/bcachefs/snapshot.c:1149 bch2_snapshot_node_delete() warn: missing error code? 'ret'

vim +/ret +1149 fs/bcachefs/snapshot.c

96dea3d599dbc3 Kent Overstreet 2023-09-12  1110  static int bch2_snapshot_node_delete(struct btree_trans *trans, u32 id)
8e877caaad8185 Kent Overstreet 2023-08-16  1111  {
8e877caaad8185 Kent Overstreet 2023-08-16  1112  	struct bch_fs *c = trans->c;
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1113  	u32 parent_id, child_id;
8e877caaad8185 Kent Overstreet 2023-08-16  1114  	unsigned i;
8e877caaad8185 Kent Overstreet 2023-08-16  1115  
e9756dd29f33ed Kent Overstreet 2025-05-02  1116  	struct bkey_i_snapshot *s =
24c5e7ab4066da Kent Overstreet 2025-07-31  1117  		bch2_bkey_get_mut_typed(trans, BTREE_ID_snapshots, POS(0, id), 0, snapshot);
24c5e7ab4066da Kent Overstreet 2025-07-31  1118  	int ret = PTR_ERR_OR_ZERO(s);
8e877caaad8185 Kent Overstreet 2023-08-16  1119  	bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
8e877caaad8185 Kent Overstreet 2023-08-16  1120  				"missing snapshot %u", id);
8e877caaad8185 Kent Overstreet 2023-08-16  1121  
8e877caaad8185 Kent Overstreet 2023-08-16  1122  	if (ret)
24c5e7ab4066da Kent Overstreet 2025-07-31  1123  		return ret;
8e877caaad8185 Kent Overstreet 2023-08-16  1124  
e9756dd29f33ed Kent Overstreet 2025-05-02  1125  	BUG_ON(BCH_SNAPSHOT_DELETED(&s->v));
e9756dd29f33ed Kent Overstreet 2025-05-02  1126  	BUG_ON(s->v.children[1]);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1127  
e9756dd29f33ed Kent Overstreet 2025-05-02  1128  	parent_id = le32_to_cpu(s->v.parent);
e9756dd29f33ed Kent Overstreet 2025-05-02  1129  	child_id = le32_to_cpu(s->v.children[0]);
8e877caaad8185 Kent Overstreet 2023-08-16  1130  
8e877caaad8185 Kent Overstreet 2023-08-16  1131  	if (parent_id) {
24c5e7ab4066da Kent Overstreet 2025-07-31  1132  		struct bkey_i_snapshot *parent =
24c5e7ab4066da Kent Overstreet 2025-07-31  1133  			bch2_bkey_get_mut_typed(trans, BTREE_ID_snapshots, POS(0, parent_id),
8e877caaad8185 Kent Overstreet 2023-08-16  1134  						0, snapshot);
8e877caaad8185 Kent Overstreet 2023-08-16  1135  		ret = PTR_ERR_OR_ZERO(parent);
8e877caaad8185 Kent Overstreet 2023-08-16  1136  		bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
8e877caaad8185 Kent Overstreet 2023-08-16  1137  					"missing snapshot %u", parent_id);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1138  		if (unlikely(ret))
24c5e7ab4066da Kent Overstreet 2025-07-31  1139  			return ret;
8e877caaad8185 Kent Overstreet 2023-08-16  1140  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1141  		/* find entry in parent->children for node being deleted */
8e877caaad8185 Kent Overstreet 2023-08-16  1142  		for (i = 0; i < 2; i++)
8e877caaad8185 Kent Overstreet 2023-08-16  1143  			if (le32_to_cpu(parent->v.children[i]) == id)
8e877caaad8185 Kent Overstreet 2023-08-16  1144  				break;
8e877caaad8185 Kent Overstreet 2023-08-16  1145  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1146  		if (bch2_fs_inconsistent_on(i == 2, c,
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1147  					"snapshot %u missing child pointer to %u",
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1148  					parent_id, id))
24c5e7ab4066da Kent Overstreet 2025-07-31 @1149  			return ret;

This returns success but it looks like the intention was to return an
error code.

8e877caaad8185 Kent Overstreet 2023-08-16  1150  
0a11adfb7aceb6 Kent Overstreet 2023-11-11  1151  		parent->v.children[i] = cpu_to_le32(child_id);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1152  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1153  		normalize_snapshot_child_pointers(&parent->v);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1154  	}
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1155  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1156  	if (child_id) {
24c5e7ab4066da Kent Overstreet 2025-07-31  1157  		struct bkey_i_snapshot *child =
24c5e7ab4066da Kent Overstreet 2025-07-31  1158  			bch2_bkey_get_mut_typed(trans, BTREE_ID_snapshots, POS(0, child_id),
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1159  						0, snapshot);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1160  		ret = PTR_ERR_OR_ZERO(child);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1161  		bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1162  					"missing snapshot %u", child_id);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1163  		if (unlikely(ret))
24c5e7ab4066da Kent Overstreet 2025-07-31  1164  			return ret;
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1165  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1166  		child->v.parent = cpu_to_le32(parent_id);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

