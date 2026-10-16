Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812964E06E4
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Oct 2026 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169188; cv=none; b=GV1Z5ukL2IVxAtrqEGhSgExNbamWGhxSQKW+q/JSVakKFmByjz7S8EzgK29rrXO+/OdIs5bFs2uUmV8A+nR5Wvm98plrtilMiPPAmpQA4cx71nau9ClO0OBlMQJGTXNxnRBUi/AggxDIy9vNqEBCWZKKwl9YvB23WyCEpwYXYJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169188; c=relaxed/simple;
	bh=sHFPTzeRXAin4Fc3L5/oxz36rMAyn/Hx31h5UqTR2xg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uW7sfE9BQp+EWsTspAESshfzP+AtY7XBp6jLIwq8vHsGrbb3oiP20pND3Odo/BonCixWbLGCTKeTX9868KoZxC3DW2JH+DoFMRT0r79f9r3/5QaJfoplCWL07ucXcNcQbdIlvoJbaND/ICdaN+sqL8VCuX82zeU+/RWVhu/kN3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qk3ihP5l; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qk3ihP5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792169185; x=1823705185;
  h=date:from:to:cc:subject:message-id;
  bh=sHFPTzeRXAin4Fc3L5/oxz36rMAyn/Hx31h5UqTR2xg=;
  b=Qk3ihP5lTENqm6l49eRNYUIwHpkgpI+ej/BHMcHWhYsNXkdGwj3V7jts
   3TseNP4Wp0YocsYL28UhH2uvj5ni07nhDmqgxKuRzXhk55nuD4sjvYAuk
   sE5aHM0asBpsDw07slQIZwMG47EsAZdydadSp4UxwPbKDV6Qy9d0hkcfS
   NV9j966C1ph6SNqZv2eXz5NaFwTZmLwgnBBMJqUXEp7w5kEt2tElZUPDl
   ALRPDJ/hutEWb1r06ekBahCQXDMonRoaUp0d8UV54pjGkWTWlxOkfdJkr
   P9r1TvtjfloGQC9bRjtra5Q3nd5tdT5TqQyndZSXgB05fZyMdDAZ62vpq
   Q==;
X-CSE-ConnectionGUID: VJ9limX/SN6hFm+1+jt3Wg==
X-CSE-MsgGUID: G1NNZJgtSiKgtXD0ENiwqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="838057"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="838057"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 09:46:25 -0700
X-CSE-ConnectionGUID: OahUbAeiT7G7tNKm3ixuqQ==
X-CSE-MsgGUID: uUYfPes1RGqtwVSwuGN26Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2342363"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 16 Oct 2026 09:46:24 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHl4X-00000000CIv-30QT;
	Fri, 16 Oct 2026 16:46:21 +0000
Date: Fri, 16 Oct 2026 18:46:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jpirko-mlxsw:wip_attestation_all_1 12/62]
 drivers/ctlv/event.c:311 ctlv_event_create() warn: inconsistent returns
 '&ctlvdev->events_lock'.
Message-ID: <202610161836.9JTtUuQK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_1
head:   e63637d55bc3ae7cbef988e3525c79b9381dba1b
commit: d3096b100aec44ae455a969b17d2a39b2b43729c [12/62] ctlv: Add device and operation dispatch
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: alpha-randconfig-r2200-20261016 (https://download.01.org/0day-ci/archive/20261016/202610161836.9JTtUuQK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610161836.9JTtUuQK-lkp@intel.com/

smatch warnings:
drivers/ctlv/event.c:311 ctlv_event_create() warn: inconsistent returns '&ctlvdev->events_lock'.

vim +311 drivers/ctlv/event.c

33f069b1a7ad100 Jiri Pirko 2026-10-14  250  
33f069b1a7ad100 Jiri Pirko 2026-10-14  251  struct ctlv_op_ctx *ctlv_event_create(struct ctlv_device *ctlvdev, u64 op_id,
33f069b1a7ad100 Jiri Pirko 2026-10-14  252  				      struct ctlv_cursor **reply, gfp_t gfp)
33f069b1a7ad100 Jiri Pirko 2026-10-14  253  {
33f069b1a7ad100 Jiri Pirko 2026-10-14  254  	const struct ctlv_op_entry *op;
33f069b1a7ad100 Jiri Pirko 2026-10-14  255  	struct ctlv_op_ctx *ctx;
33f069b1a7ad100 Jiri Pirko 2026-10-14  256  	void *out;
33f069b1a7ad100 Jiri Pirko 2026-10-14  257  	u32 room;
33f069b1a7ad100 Jiri Pirko 2026-10-14  258  	int ret;
33f069b1a7ad100 Jiri Pirko 2026-10-14  259  
33f069b1a7ad100 Jiri Pirko 2026-10-14  260  	ctx = kzalloc_obj(*ctx, gfp);
33f069b1a7ad100 Jiri Pirko 2026-10-14  261  	if (!ctx)
33f069b1a7ad100 Jiri Pirko 2026-10-14  262  		return ERR_PTR(-ENOMEM);
33f069b1a7ad100 Jiri Pirko 2026-10-14  263  	scoped_guard(spinlock, &ctlvdev->events_lock) {
33f069b1a7ad100 Jiri Pirko 2026-10-14  264  		const struct ctlv_family *family;
33f069b1a7ad100 Jiri Pirko 2026-10-14  265  
33f069b1a7ad100 Jiri Pirko 2026-10-14  266  		if (!ctlvdev->events_live) {
33f069b1a7ad100 Jiri Pirko 2026-10-14  267  			ret = -ENODEV;
33f069b1a7ad100 Jiri Pirko 2026-10-14  268  			goto err_free_ctx;
33f069b1a7ad100 Jiri Pirko 2026-10-14  269  		}
33f069b1a7ad100 Jiri Pirko 2026-10-14  270  		if (WARN_ON_ONCE(ctlvdev->active_event_contexts == U32_MAX)) {
33f069b1a7ad100 Jiri Pirko 2026-10-14  271  			ret = -EOVERFLOW;
33f069b1a7ad100 Jiri Pirko 2026-10-14  272  			goto err_free_ctx;
33f069b1a7ad100 Jiri Pirko 2026-10-14  273  		}
33f069b1a7ad100 Jiri Pirko 2026-10-14  274  		/* Admission pins the op until emit or abort. */
33f069b1a7ad100 Jiri Pirko 2026-10-14  275  		family = READ_ONCE(ctlvdev->family);
33f069b1a7ad100 Jiri Pirko 2026-10-14  276  		if (!family) {
33f069b1a7ad100 Jiri Pirko 2026-10-14  277  			ret = -ENODEV;
33f069b1a7ad100 Jiri Pirko 2026-10-14  278  			goto err_free_ctx;
33f069b1a7ad100 Jiri Pirko 2026-10-14  279  		}
33f069b1a7ad100 Jiri Pirko 2026-10-14  280  		get_device(&ctlvdev->dev);
33f069b1a7ad100 Jiri Pirko 2026-10-14  281  		ctlvdev->active_event_contexts++;
33f069b1a7ad100 Jiri Pirko 2026-10-14  282  		ctx->ctlvdev = ctlvdev;
33f069b1a7ad100 Jiri Pirko 2026-10-14  283  		ctx->family = family;
33f069b1a7ad100 Jiri Pirko 2026-10-14  284  	}
33f069b1a7ad100 Jiri Pirko 2026-10-14  285  
33f069b1a7ad100 Jiri Pirko 2026-10-14  286  	op = ctlv_op_find(ctlvdev, op_id);
33f069b1a7ad100 Jiri Pirko 2026-10-14  287  	if (WARN_ON_ONCE(!op) || WARN_ON_ONCE(op->schema->type != CTLV_OP_TYPE_EVENT)) {
33f069b1a7ad100 Jiri Pirko 2026-10-14  288  		ret = -EINVAL;
33f069b1a7ad100 Jiri Pirko 2026-10-14  289  		goto err_put_ctx;
33f069b1a7ad100 Jiri Pirko 2026-10-14  290  	}
33f069b1a7ad100 Jiri Pirko 2026-10-14  291  	room = ctlv_event_len(op) - sizeof(struct ctlv_event_hdr);
33f069b1a7ad100 Jiri Pirko 2026-10-14  292  	out = kmalloc(room, gfp);
33f069b1a7ad100 Jiri Pirko 2026-10-14  293  	if (!out) {
33f069b1a7ad100 Jiri Pirko 2026-10-14  294  		ret = -ENOMEM;
33f069b1a7ad100 Jiri Pirko 2026-10-14  295  		goto err_put_ctx;
33f069b1a7ad100 Jiri Pirko 2026-10-14  296  	}
33f069b1a7ad100 Jiri Pirko 2026-10-14  297  
33f069b1a7ad100 Jiri Pirko 2026-10-14  298  	ctx->gfp = gfp;
33f069b1a7ad100 Jiri Pirko 2026-10-14  299  	ctx->op = op;
33f069b1a7ad100 Jiri Pirko 2026-10-14  300  	ctlv_message_output_init(&ctx->output, ctx, out, room, &op->schema->reply);
33f069b1a7ad100 Jiri Pirko 2026-10-14  301  	ctlv_message_root(&ctx->output_root, &ctx->output);
33f069b1a7ad100 Jiri Pirko 2026-10-14  302  	ctx->deepest = &ctx->output_root;
33f069b1a7ad100 Jiri Pirko 2026-10-14  303  	*reply = &ctx->output_root;
33f069b1a7ad100 Jiri Pirko 2026-10-14  304  	return ctx;
33f069b1a7ad100 Jiri Pirko 2026-10-14  305  
33f069b1a7ad100 Jiri Pirko 2026-10-14  306  err_put_ctx:
33f069b1a7ad100 Jiri Pirko 2026-10-14  307  	ctlv_event_free(ctx);
33f069b1a7ad100 Jiri Pirko 2026-10-14  308  	return ERR_PTR(ret);
33f069b1a7ad100 Jiri Pirko 2026-10-14  309  err_free_ctx:
33f069b1a7ad100 Jiri Pirko 2026-10-14  310  	kfree(ctx);
33f069b1a7ad100 Jiri Pirko 2026-10-14 @311  	return ERR_PTR(ret);
33f069b1a7ad100 Jiri Pirko 2026-10-14  312  }
33f069b1a7ad100 Jiri Pirko 2026-10-14  313  EXPORT_SYMBOL_NS_GPL(ctlv_event_create, "CTLV");
33f069b1a7ad100 Jiri Pirko 2026-10-14  314  

:::::: The code at line 311 was first introduced by commit
:::::: 33f069b1a7ad100e4fee37a5376751b9228c0bcb ctlv: Prepare event queue support

:::::: TO: Jiri Pirko <jiri@nvidia.com>
:::::: CC: Jiri Pirko <jiri@nvidia.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
