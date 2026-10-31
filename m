Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793455463;
	b=TRu6mwSxYcZvWVxGF9PsXCMmvOsNejmmoTArygoCT6fG3WvW+4JnM4unDB3TuKCIkbtg
	 ybA+niNeNyECmx0DAPUuZ6lztfooJqu7G4hjEbzGPzO0Ttq96aLnH7mjHNE0ivGPSIUoT
	 ACWZBhmvJtGbpzXVFJNepkpRXd8MvRac7GJQ5385/DCWAlGTVS5bJ4dBJ3oKg71RzatfI
	 7cgjmd8iDBlDCjL2DJDdU3L5eE8y3maS1h2jSSHT087peGLQc+zGArk7mnN9BxKobKnd2
	 JbV9qriZ6PawHHjDq7yCJLoGTmCweNIr0x092AbRO8Bs2+iLsdJ1TPxHUHXVmLiZjnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793455463;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=icWOJuUOiBzEtfBLbmc9DGEY85tWEL64FpGIivQTSgE=;
	b=nEjZ/q4u8zOqTX3IeqihkdkLGh2A/3JKjABiyCInEyQsof/pEvDr9txvNv2Z6mC0ojU+
	 UGLdzfJRkKyhfUP8g0wLriLM2ocTZaBJIfEYHJ+JsdL8U01Ndpb9cRDXKXHizcMWLr7b1
	 FRH9MmBbrck0eUn4rz2LX+F+z8xxsRbtfSy/T7Jq2kqM9WELKilGb4DD7bSgyHoeLgtDg
	 migLuVQwI3F/TQ51ktX6tLd7SYQDviLl+WTkhfPeWhrU/09C/YKZjSHT87XW/2V4nS/X1
	 M7o91qQ6d91ctx48oUS+5hUX7yIEFFooIyGMvEHuVyRpWEabQOf4WIcbEsO9TUFRIew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aD27jrWW;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E0F606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 14:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63E0F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aD27jrWW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793455462; x=1824991462;
  h=date:from:to:cc:subject:message-id;
  bh=SGLqrALlzfWUtwKqqbPIXpl3o2KrmcfAb194PhNdfEA=;
  b=aD27jrWW3XgdRiuAIPL5x+4X+G2T/bQAYqimPqvOnDf43NSCynC9Qht/
   D+QdPVfMVlzrzuzfjc7a8hwRMFbtq+EmjMlqcw4/8wcRHysVjkpPLcy2w
   81N1Xle9lMPlb1HkO5TLKYeOYCBHDv3WFujjTjrygR/GbTmjjJnF64opj
   gos3OEgPckN3mkQLvEcn2oj9nf9P9FYdFsOrOMqi3C8eP+WEGFNmRZQ6n
   +NgacPH5BHrFAEpID5kVDaEUuMRrrt6szQ8udUzIyD8QmBvMjrGk8+V/P
   iUGP4BUh37p+8dsyTZn6lCRFi5N6ZVTZSHoySPGQ048r2njsNpg91IJC3
   Q==;
X-CSE-ConnectionGUID: O8biWfdvSFazPF23H+K3MA==
X-CSE-MsgGUID: 41Ui+irYQB6wFZQqyEn97g==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2094298"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2094298"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 07:04:21 -0700
X-CSE-ConnectionGUID: dIRbOoJsQqC2avz3orNfJQ==
X-CSE-MsgGUID: SRk/xqEsTsinOaPDwWSUhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5812284"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 31 Oct 2026 07:04:19 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN9gu-0000000061z-3Omh;
	Sat, 31 Oct 2026 14:04:16 +0000
Date: Sat, 31 Oct 2026 15:04:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-p3s 2/2]
 fs/bcachefs/ec.c:1233 ec_stripe_key_update() error: we previously assumed
 'old' could be null (see line 1213)
Message-ID: <202610311542.w909U0EA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-p3s
head:   cf32e70ca1c409f3b7da2e8d3640dbbb3104be5d
commit: cb6055e66faa0d4c15587ef67be18bc199aef085 [2/2] bcachefs: Handle race between stripe reuse, invalidate_stripe_to_dev
:::::: branch date: 16 hours ago
:::::: commit date: 2 years, 1 month ago
config: i386-randconfig-r2200-20261030 (https://download.01.org/0day-ci/archive/20261031/202610311542.w909U0EA-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cb6055e66faa ("bcachefs: Handle race between stripe reuse, invalidate_stripe_to_dev")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610311542.w909U0EA-lkp@intel.com/

New smatch warnings:
fs/bcachefs/ec.c:1233 ec_stripe_key_update() error: we previously assumed 'old' could be null (see line 1213)

Old smatch warnings:
fs/bcachefs/ec.c:430 bch2_trigger_stripe() error: we previously assumed 'new_s' could be null (see line 408)
fs/bcachefs/ec.c:2171 bch2_ec_stripe_head_get() error: we previously assumed 'h->s' could be null (see line 2163)

vim +/old +1233 fs/bcachefs/ec.c

dfe9bfb32e380d Kent Overstreet 2018-11-24  1207  
4b1e669995a6c1 Kent Overstreet 2023-02-18  1208  static int ec_stripe_key_update(struct btree_trans *trans,
cb6055e66faa0d Kent Overstreet 2024-10-13  1209  				struct bkey_i_stripe *old,
cb6055e66faa0d Kent Overstreet 2024-10-13  1210  				struct bkey_i_stripe *new)
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1211  {
4b1e669995a6c1 Kent Overstreet 2023-02-18  1212  	struct bch_fs *c = trans->c;
cb6055e66faa0d Kent Overstreet 2024-10-13 @1213  	bool create = !old;
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1214  
cb6055e66faa0d Kent Overstreet 2024-10-13  1215  	struct btree_iter iter;
cb6055e66faa0d Kent Overstreet 2024-10-13  1216  	struct bkey_s_c k = bch2_bkey_get_iter(trans, &iter, BTREE_ID_stripes,
5dd8c60e1e0448 Kent Overstreet 2024-04-07  1217  					       new->k.p, BTREE_ITER_intent);
cb6055e66faa0d Kent Overstreet 2024-10-13  1218  	int ret = bkey_err(k);
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1219  	if (ret)
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1220  		goto err;
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1221  
cb6055e66faa0d Kent Overstreet 2024-10-13  1222  	if (bch2_fs_inconsistent_on(k.k->type != (create ? KEY_TYPE_deleted : KEY_TYPE_stripe),
cb6055e66faa0d Kent Overstreet 2024-10-13  1223  				    c, "error %s stripe: got existing key type %s",
4b1e669995a6c1 Kent Overstreet 2023-02-18  1224  				    create ? "creating" : "updating",
cb6055e66faa0d Kent Overstreet 2024-10-13  1225  				    bch2_bkey_types[k.k->type])) {
4b1e669995a6c1 Kent Overstreet 2023-02-18  1226  		ret = -EINVAL;
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1227  		goto err;
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1228  	}
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1229  
4b1e669995a6c1 Kent Overstreet 2023-02-18  1230  	if (k.k->type == KEY_TYPE_stripe) {
cb6055e66faa0d Kent Overstreet 2024-10-13  1231  		const struct bch_stripe *v = bkey_s_c_to_stripe(k).v;
cb6055e66faa0d Kent Overstreet 2024-10-13  1232  
cb6055e66faa0d Kent Overstreet 2024-10-13 @1233  		BUG_ON(old->v.nr_blocks != new->v.nr_blocks);
cb6055e66faa0d Kent Overstreet 2024-10-13  1234  		BUG_ON(old->v.nr_blocks != v->nr_blocks);
cb6055e66faa0d Kent Overstreet 2024-10-13  1235  
cb6055e66faa0d Kent Overstreet 2024-10-13  1236  		for (unsigned i = 0; i < new->v.nr_blocks; i++) {
cb6055e66faa0d Kent Overstreet 2024-10-13  1237  			unsigned sectors = stripe_blockcount_get(v, i);
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1238  
cb6055e66faa0d Kent Overstreet 2024-10-13  1239  			if (!bch2_extent_ptr_eq(old->v.ptrs[i], new->v.ptrs[i]) && sectors) {
cb6055e66faa0d Kent Overstreet 2024-10-13  1240  				struct printbuf buf = PRINTBUF;
cb6055e66faa0d Kent Overstreet 2024-10-13  1241  
cb6055e66faa0d Kent Overstreet 2024-10-13  1242  				prt_printf(&buf, "stripe changed nonempty block %u", i);
cb6055e66faa0d Kent Overstreet 2024-10-13  1243  				prt_str(&buf, "\nold: ");
cb6055e66faa0d Kent Overstreet 2024-10-13  1244  				bch2_bkey_val_to_text(&buf, c, k);
cb6055e66faa0d Kent Overstreet 2024-10-13  1245  				prt_str(&buf, "\nnew: ");
cb6055e66faa0d Kent Overstreet 2024-10-13  1246  				bch2_bkey_val_to_text(&buf, c, bkey_i_to_s_c(&new->k_i));
cb6055e66faa0d Kent Overstreet 2024-10-13  1247  				bch2_fs_inconsistent(c, "%s", buf.buf);
cb6055e66faa0d Kent Overstreet 2024-10-13  1248  				printbuf_exit(&buf);
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1249  				ret = -EINVAL;
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1250  				goto err;
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1251  			}
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1252  
cb6055e66faa0d Kent Overstreet 2024-10-13  1253  			/*
cb6055e66faa0d Kent Overstreet 2024-10-13  1254  			 * If the stripe ptr changed underneath us, it must have
cb6055e66faa0d Kent Overstreet 2024-10-13  1255  			 * been dev_remove_stripes() -> * invalidate_stripe_to_dev()
cb6055e66faa0d Kent Overstreet 2024-10-13  1256  			 */
cb6055e66faa0d Kent Overstreet 2024-10-13  1257  			if (!bch2_extent_ptr_eq(old->v.ptrs[i], v->ptrs[i])) {
cb6055e66faa0d Kent Overstreet 2024-10-13  1258  				BUG_ON(v->ptrs[i].dev != BCH_SB_MEMBER_INVALID);
9d32097f3b6617 Kent Overstreet 2023-03-03  1259  
cb6055e66faa0d Kent Overstreet 2024-10-13  1260  				if (bch2_extent_ptr_eq(old->v.ptrs[i], new->v.ptrs[i]))
cb6055e66faa0d Kent Overstreet 2024-10-13  1261  					new->v.ptrs[i].dev = BCH_SB_MEMBER_INVALID;
cb6055e66faa0d Kent Overstreet 2024-10-13  1262  			}
9d32097f3b6617 Kent Overstreet 2023-03-03  1263  
cb6055e66faa0d Kent Overstreet 2024-10-13  1264  			stripe_blockcount_set(&new->v, i, sectors);
9d32097f3b6617 Kent Overstreet 2023-03-03  1265  		}
4b1e669995a6c1 Kent Overstreet 2023-02-18  1266  	}
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1267  
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  1268  	ret = bch2_trans_update(trans, &iter, &new->k_i, 0);
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1269  err:
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  1270  	bch2_trans_iter_exit(trans, &iter);
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1271  	return ret;
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1272  }
c6e658ee9f7f7d Kent Overstreet 2021-01-17  1273  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
