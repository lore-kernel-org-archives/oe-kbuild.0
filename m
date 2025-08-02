Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3B5226CF1
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 15:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754148465; cv=none; b=i4mQQxydKum78/9tsLiy60It8HGKCM6KRiNGOB9RhmquzFMnfGKtEa1bSyUcURH6bVoYjXmLlrBxEjXrssLsI/St4cVP+5xaha2mODMzx2eXUKUICIgtjgzghYKqFedGVs7vTnreOReSRPus9oyTS65OJ8GgKgLhOdtOPR/2cKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754148465; c=relaxed/simple;
	bh=pA2uKjmAfFSu+VbdoAbslmMdCzqpgv6eNxI4RPhepEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b22XMIEweWoXFzrqOjttmByZHIqWMcyD+H4q6jOKggEvfNcIKgTWkfLLu/E+dUTOhf08Y8hwNA5h4uT999LaC6i5+yP63XtbAR0MKyQruAaRzuyc49QcDmQtX533HmOM/qPRU2I53lx0a7J8xJDZSvOM5jy8LWq65fPjg8khgG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wcslXQ2C; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wcslXQ2C"
Date: Sat, 2 Aug 2025 11:27:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754148459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rmfsvbx3ndzcrANXMwHnvQDkdq3keMQ8cj4mwC8ysH8=;
	b=wcslXQ2CVeuBikC3WHb4wNdRJeneeGMWWlkmWAZj+Vk4r6s6FGMclZJpApC5wha7KyBuG3
	Fiaq4aXV/zEPUl5RkM7mxsbCGyUmL3nts8zlaJxbROuJeh1+4Xekk4K3urSU683j44Thd/
	Z1EhG8iuevxa4Fwmp4abMtbOIBWKnQA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 12911/13054] fs/bcachefs/snapshot.c:1149
 bch2_snapshot_node_delete() warn: missing error code? 'ret'
Message-ID: <k5unu6s25j6slb76hor6yodthyxuy5ho723l4osxtgzxy4cfxr@bcnj7liq2kt6>
References: <8dc19809-7a3a-427f-be4e-bec7a76b4bfd@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dc19809-7a3a-427f-be4e-bec7a76b4bfd@suswa.mountain>
X-Migadu-Flow: FLOW_OUT

On Sat, Aug 02, 2025 at 10:29:57AM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   b9ddaa95fd283bce7041550ddbbe7e764c477110
> commit: 24c5e7ab4066da2073d1c50e82308c8bc0ec4ec3 [12911/13054] bcachefs: Convert bch2_bkey_get_mut() to CLASS(btree_iter)
> config: parisc-randconfig-r071-20250801 (https://download.01.org/0day-ci/archive/20250802/202508020434.RgnHwchO-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 15.1.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202508020434.RgnHwchO-lkp@intel.com/
> 
> smatch warnings:
> fs/bcachefs/snapshot.c:1149 bch2_snapshot_node_delete() warn: missing error code? 'ret'
> 
> vim +/ret +1149 fs/bcachefs/snapshot.c
> 
> 96dea3d599dbc3 Kent Overstreet 2023-09-12  1110  static int bch2_snapshot_node_delete(struct btree_trans *trans, u32 id)
> 8e877caaad8185 Kent Overstreet 2023-08-16  1111  {
> 8e877caaad8185 Kent Overstreet 2023-08-16  1112  	struct bch_fs *c = trans->c;
> f55d6e07bc6c9b Kent Overstreet 2023-08-17  1113  	u32 parent_id, child_id;
> 8e877caaad8185 Kent Overstreet 2023-08-16  1114  	unsigned i;
> 8e877caaad8185 Kent Overstreet 2023-08-16  1115  
> e9756dd29f33ed Kent Overstreet 2025-05-02  1116  	struct bkey_i_snapshot *s =
> 24c5e7ab4066da Kent Overstreet 2025-07-31  1117  		bch2_bkey_get_mut_typed(trans, BTREE_ID_snapshots, POS(0, id), 0, snapshot);
> 24c5e7ab4066da Kent Overstreet 2025-07-31  1118  	int ret = PTR_ERR_OR_ZERO(s);
> 8e877caaad8185 Kent Overstreet 2023-08-16  1119  	bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
> 8e877caaad8185 Kent Overstreet 2023-08-16  1120  				"missing snapshot %u", id);
> 8e877caaad8185 Kent Overstreet 2023-08-16  1121  
> 8e877caaad8185 Kent Overstreet 2023-08-16  1122  	if (ret)
> 24c5e7ab4066da Kent Overstreet 2025-07-31  1123  		return ret;
> 8e877caaad8185 Kent Overstreet 2023-08-16  1124  
> e9756dd29f33ed Kent Overstreet 2025-05-02  1125  	BUG_ON(BCH_SNAPSHOT_DELETED(&s->v));
> e9756dd29f33ed Kent Overstreet 2025-05-02  1126  	BUG_ON(s->v.children[1]);
> f55d6e07bc6c9b Kent Overstreet 2023-08-17  1127  
> e9756dd29f33ed Kent Overstreet 2025-05-02  1128  	parent_id = le32_to_cpu(s->v.parent);
> e9756dd29f33ed Kent Overstreet 2025-05-02  1129  	child_id = le32_to_cpu(s->v.children[0]);
> 8e877caaad8185 Kent Overstreet 2023-08-16  1130  
> 8e877caaad8185 Kent Overstreet 2023-08-16  1131  	if (parent_id) {
> 24c5e7ab4066da Kent Overstreet 2025-07-31  1132  		struct bkey_i_snapshot *parent =
> 24c5e7ab4066da Kent Overstreet 2025-07-31  1133  			bch2_bkey_get_mut_typed(trans, BTREE_ID_snapshots, POS(0, parent_id),
> 8e877caaad8185 Kent Overstreet 2023-08-16  1134  						0, snapshot);
> 8e877caaad8185 Kent Overstreet 2023-08-16  1135  		ret = PTR_ERR_OR_ZERO(parent);
> 8e877caaad8185 Kent Overstreet 2023-08-16  1136  		bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
> 8e877caaad8185 Kent Overstreet 2023-08-16  1137  					"missing snapshot %u", parent_id);
> f55d6e07bc6c9b Kent Overstreet 2023-08-17  1138  		if (unlikely(ret))
> 24c5e7ab4066da Kent Overstreet 2025-07-31  1139  			return ret;
> 8e877caaad8185 Kent Overstreet 2023-08-16  1140  
> f55d6e07bc6c9b Kent Overstreet 2023-08-17  1141  		/* find entry in parent->children for node being deleted */
> 8e877caaad8185 Kent Overstreet 2023-08-16  1142  		for (i = 0; i < 2; i++)
> 8e877caaad8185 Kent Overstreet 2023-08-16  1143  			if (le32_to_cpu(parent->v.children[i]) == id)
> 8e877caaad8185 Kent Overstreet 2023-08-16  1144  				break;
> 8e877caaad8185 Kent Overstreet 2023-08-16  1145  
> f55d6e07bc6c9b Kent Overstreet 2023-08-17  1146  		if (bch2_fs_inconsistent_on(i == 2, c,
> f55d6e07bc6c9b Kent Overstreet 2023-08-17  1147  					"snapshot %u missing child pointer to %u",
> f55d6e07bc6c9b Kent Overstreet 2023-08-17  1148  					parent_id, id))
> 24c5e7ab4066da Kent Overstreet 2025-07-31 @1149  			return ret;
> 
> This returns success but it looks like the intention was to return an
> error code.

nice catch, that's an old bug exposed by getting rid of gotos for error
hnadling

It's really technically a bug; calling bch2_fs_inconsistent() does an
emergency shutdown, so returning an error doesn't matter that much. But
it's worth fixing, gives us cleaner error messages if anything else
prints out the error.
